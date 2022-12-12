public with sharing class fileDownPreviewController {
    static long kilo = 1024;
    static long mega = kilo * kilo;
    static long giga = mega * kilo;
    static long tera = giga * kilo;

    @AuraEnabled(cacheable=true)
    public static Map<String,List<String>> getRelatedFilesByRecId(Id ridg){
        Map<String,List<String>> result=new Map<String,List<String>>();
        List<String> info=new List<String>();
        result.put('0695j000009mnyfAAA',info );
        return result;
    }
    public static String getConvertedFromBytes(Integer size_in_bytes){
        String s = '';
        double kb = (double)size_in_bytes / kilo;
        double mb = kb / kilo;
        double gb = mb / kilo;
        double tb = gb / kilo;
        if(size_in_bytes < kilo) {
            s = size_in_bytes + ' Bytes';
        } else if(size_in_bytes >= kilo && size_in_bytes < mega) {
            s =  Decimal.valueOf(kb).setScale(2) + ' KB';
        } else if(size_in_bytes >= mega && size_in_bytes < giga) {
            s = Decimal.valueOf(mb).setScale(2) + ' MB';
        } else if(size_in_bytes >= giga && size_in_bytes < tera) {
            s = Decimal.valueOf(gb).setScale(2) + ' GB';
        } else if(size_in_bytes >= tera) {
            s = Decimal.valueOf(tb).setScale(2) + ' TB';
        }
        return s;
    }
}