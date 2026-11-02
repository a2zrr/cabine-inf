using System;
using System.IO;
using System.Threading.Tasks;
using System.Xml;
using System.Xml.Schema;

public static class XMLUtils
{
    private static int errorCount;

    public static async Task ValidateXmlFile(string schemaNamespace, string xsdFilePath, string xmlFilePath)
    {
        var settings = new XmlReaderSettings();
        settings.Schemas.Add(schemaNamespace, xsdFilePath);
        settings.Schemas.Add(schemaNamespace, Path.Combine(Path.GetDirectoryName(xsdFilePath)!, "patient.xsd"));
        settings.ValidationType = ValidationType.Schema;
        errorCount = 0;
        settings.ValidationEventHandler += ValidationCallBack;

        using var readItems = XmlReader.Create(xmlFilePath, settings);
        while (readItems.Read()) { }

        Console.WriteLine(errorCount == 0 ? "shema valide" : "shema invalide");
    }

    private static void ValidationCallBack(object? sender, ValidationEventArgs e)
    {
        if (e.Severity.Equals(XmlSeverityType.Warning))
        {
            Console.Write("WARNING : ");
            Console.WriteLine(e.Message);
        }
        else if (e.Severity.Equals(XmlSeverityType.Error))
        {
            errorCount++;
            Console.Write("ERROR : ");
            Console.WriteLine(e.Message);
        }
    }
}