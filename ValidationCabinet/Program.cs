string ns  = "http://www.univ-grenoble-alpes.fr/l3miage/medical";
string xsd = @"C:\Users\Dell\Desktop\cabine_test\cabine-inf\src\data\xsd\cabinet.xsd";
string xml = @"C:\Users\Dell\Desktop\cabine_test\cabine-inf\src\data\xml\cabinet.xml";

await XMLUtils.ValidateXmlFile(ns, xsd, xml);

Console.WriteLine("Fin de la validation.");
