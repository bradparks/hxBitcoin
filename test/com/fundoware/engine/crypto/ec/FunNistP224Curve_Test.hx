/*===========================================================================

hxBitcoin - pure HaXe cryptocurrency & cryptography library
http://hxbitcoin.com

Copyright (c) 2014 Charles H. Batson III

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

===========================================================================*/

package com.fundoware.engine.crypto.ec;

class FunNistP224Curve_Test extends FunCurveTestCase
{
	public function testX_NistP224(x : Int) : Int
	{
		// Test vectors from http://point-at-infinity.org/ecc/nisttv
		// Retrieved 17 Nov 2014
		var testVectors =
"1,0xB70E0CBD6BB4BF7F321390B94A03C1D356C21122343280D6115C1D21,0xBD376388B5F723FB4C22DFE6CD4375A05A07476444D5819985007E34|
2,0x706A46DC76DCB76798E60E6D89474788D16DC18032D268FD1A704FA6,0x1C2B76A7BC25E7702A704FA986892849FCA629487ACF3709D2E4E8BB|
3,0xDF1B1D66A551D0D31EFF822558B9D2CC75C2180279FE0D08FD896D04,0xA3F7F03CADD0BE444C0AA56830130DDF77D317344E1AF3591981A925|
4,0xAE99FEEBB5D26945B54892092A8AEE02912930FA41CD114E40447301,0x0482580A0EC5BC47E88BC8C378632CD196CB3FA058A7114EB03054C9|
5,0x31C49AE75BCE7807CDFF22055D94EE9021FEDBB5AB51C57526F011AA,0x27E8BFF1745635EC5BA0C9F1C2EDE15414C6507D29FFE37E790A079B|
6,0x1F2483F82572251FCA975FEA40DB821DF8AD82A3C002EE6C57112408,0x89FAF0CCB750D99B553C574FAD7ECFB0438586EB3952AF5B4B153C7E|
7,0xDB2F6BE630E246A5CF7D99B85194B123D487E2D466B94B24A03C3E28,0x0F3A30085497F2F611EE2517B163EF8C53B715D18BB4E4808D02B963|
8,0x858E6F9CC6C12C31F5DF124AA77767B05C8BC021BD683D2B55571550,0x046DCD3EA5C43898C5C5FC4FDAC7DB39C2F02EBEE4E3541D1E78047A|
9,0x2FDCCCFEE720A77EF6CB3BFBB447F9383117E3DAA4A07E36ED15F78D,0x371732E4F41BF4F7883035E6A79FCEDC0E196EB07B48171697517463|
10,0xAEA9E17A306517EB89152AA7096D2C381EC813C51AA880E7BEE2C0FD,0x39BB30EAB337E0A521B6CBA1ABE4B2B3A3E524C14A3FE3EB116B655F|
11,0xEF53B6294ACA431F0F3C22DC82EB9050324F1D88D377E716448E507C,0x20B510004092E96636CFB7E32EFDED8265C266DFB754FA6D6491A6DA|
12,0x6E31EE1DC137F81B056752E4DEAB1443A481033E9B4C93A3044F4F7A,0x207DDDF0385BFDEAB6E9ACDA8DA06B3BBEF224A93AB1E9E036109D13|
13,0x34E8E17A430E43289793C383FAC9774247B40E9EBD3366981FCFAECA,0x252819F71C7FB7FBCB159BE337D37D3336D7FEB963724FDFB0ECB767|
14,0xA53640C83DC208603DED83E4ECF758F24C357D7CF48088B2CE01E9FA,0xD5814CD724199C4A5B974A43685FBF5B8BAC69459C9469BC8F23CCAF|
15,0xBAA4D8635511A7D288AEBEEDD12CE529FF102C91F97F867E21916BF9,0x979A5F4759F80F4FB4EC2E34F5566D595680A11735E7B61046127989|
16,0x0B6EC4FE1777382404EF679997BA8D1CC5CD8E85349259F590C4C66D,0x3399D464345906B11B00E363EF429221F2EC720D2F665D7DEAD5B482|
17,0xB8357C3A6CEEF288310E17B8BFEFF9200846CA8C1942497C484403BC,0xFF149EFA6606A6BD20EF7D1B06BD92F6904639DCE5174DB6CC554A26|
18,0xC9FF61B040874C0568479216824A15EAB1A838A797D189746226E4CC,0xEA98D60E5FFC9B8FCF999FAB1DF7E7EF7084F20DDB61BB045A6CE002|
19,0xA1E81C04F30CE201C7C9ACE785ED44CC33B455A022F2ACDBC6CAE83C,0xDCF1F6C3DB09C70ACC25391D492FE25B4A180BABD6CEA356C04719CD|
20,0xFCC7F2B45DF1CD5A3C0C0731CA47A8AF75CFB0347E8354EEFE782455,0x0D5D7110274CBA7CDEE90E1A8B0D394C376A5573DB6BE0BF2747F530|
112233445566778899,0x61F077C6F62ED802DAD7C2F38F5C67F2CC453601E61BD076BB46179E,0x2272F9E9F5933E70388EE652513443B5E289DD135DCC0D0299B225E4|
112233445566778899112233445566778899,0x029895F0AF496BFC62B6EF8D8A65C88C613949B03668AAB4F0429E35,0x3EA6E53F9A841F2019EC24BDE1A75677AA9B5902E61081C01064DE93|
6950511619965839450988900688150712778015737983940691968051900319680,0xAB689930BCAE4A4AA5F5CB085E823E8AE30FD365EB1DA4ABA9CF0379,0x3345A121BBD233548AF0D210654EB40BAB788A03666419BE6FBD34E7|
13479972933410060327035789020509431695094902435494295338570602119423,0xBDB6A8817C1F89DA1C2F3DD8E97FEB4494F2ED302A4CE2BC7F5F4025,0x4C7020D57C00411889462D77A5438BB4E97D177700BF7243A07F1680|
13479971751745682581351455311314208093898607229429740618390390702079,0xD58B61AA41C32DD5EBA462647DBA75C5D67C83606C0AF2BD928446A9,0xD24BA6A837BE0460DD107AE77725696D211446C5609B4595976B16BD|
13479972931865328106486971546324465392952975980343228160962702868479,0xDC9FA77978A005510980E929A1485F63716DF695D7A0C18BB518DF03,0xEDE2B016F2DDFFC2A8C015B134928275CE09E5661B7AB14CE0D1D403|
11795773708834916026404142434151065506931607341523388140225443265536,0x499D8B2829CFB879C901F7D85D357045EDAB55028824D0F05BA279BA,0xBF929537B06E4015919639D94F57838FA33FC3D952598DCDBB44D638|
784254593043826236572847595991346435467177662189391577090,0x8246C999137186632C5F9EDDF3B1B0E1764C5E8BD0E0D8A554B9CB77,0xE80ED8660BC1CB17AC7D845BE40A7A022D3306F116AE9F81FEA65947|
13479767645505654746623887797783387853576174193480695826442858012671,0x6670C20AFCCEAEA672C97F75E2E9DD5C8460E54BB38538EBB4BD30EB,0xF280D8008D07A4CAF54271F993527D46FF3FF46FD1190A3F1FAA4F74|
205688069665150753842126177372015544874550518966168735589597183,0x000ECA934247425CFD949B795CB5CE1EFF401550386E28D1A4C5A8EB,0xD4C01040DBA19628931BC8855370317C722CBD9CA6156985F1C2E9CE|
13479966930919337728895168462090683249159702977113823384618282123295,0xEF353BF5C73CD551B96D596FBC9A67F16D61DD9FE56AF19DE1FBA9CD,0x21771B9CDCE3E8430C09B3838BE70B48C21E15BC09EE1F2D7945B91F|
50210731791415612487756441341851895584393717453129007497216,0x4036052A3091EB481046AD3289C95D3AC905CA0023DE2C03ECD451CF,0xD768165A38A2B96F812586A9D59D4136035D9C853A5BF2E1C86A4993|
26959946667150639794667015087019625940457807714424391721682722368041,0xFCC7F2B45DF1CD5A3C0C0731CA47A8AF75CFB0347E8354EEFE782455,0xF2A28EEFD8B345832116F1E574F2C6B2C895AA8C24941F40D8B80AD1|
26959946667150639794667015087019625940457807714424391721682722368042,0xA1E81C04F30CE201C7C9ACE785ED44CC33B455A022F2ACDBC6CAE83C,0x230E093C24F638F533DAC6E2B6D01DA3B5E7F45429315CA93FB8E634|
26959946667150639794667015087019625940457807714424391721682722368043,0xC9FF61B040874C0568479216824A15EAB1A838A797D189746226E4CC,0x156729F1A003647030666054E208180F8F7B0DF2249E44FBA5931FFF|
26959946667150639794667015087019625940457807714424391721682722368044,0xB8357C3A6CEEF288310E17B8BFEFF9200846CA8C1942497C484403BC,0x00EB610599F95942DF1082E4F9426D086FB9C6231AE8B24933AAB5DB|
26959946667150639794667015087019625940457807714424391721682722368045,0x0B6EC4FE1777382404EF679997BA8D1CC5CD8E85349259F590C4C66D,0xCC662B9BCBA6F94EE4FF1C9C10BD6DDD0D138DF2D099A282152A4B7F|
26959946667150639794667015087019625940457807714424391721682722368046,0xBAA4D8635511A7D288AEBEEDD12CE529FF102C91F97F867E21916BF9,0x6865A0B8A607F0B04B13D1CB0AA992A5A97F5EE8CA1849EFB9ED8678|
26959946667150639794667015087019625940457807714424391721682722368047,0xA53640C83DC208603DED83E4ECF758F24C357D7CF48088B2CE01E9FA,0x2A7EB328DBE663B5A468B5BC97A040A3745396BA636B964370DC3352|
26959946667150639794667015087019625940457807714424391721682722368048,0x34E8E17A430E43289793C383FAC9774247B40E9EBD3366981FCFAECA,0xDAD7E608E380480434EA641CC82C82CBC92801469C8DB0204F13489A|
26959946667150639794667015087019625940457807714424391721682722368049,0x6E31EE1DC137F81B056752E4DEAB1443A481033E9B4C93A3044F4F7A,0xDF82220FC7A4021549165325725F94C3410DDB56C54E161FC9EF62EE|
26959946667150639794667015087019625940457807714424391721682722368050,0xEF53B6294ACA431F0F3C22DC82EB9050324F1D88D377E716448E507C,0xDF4AEFFFBF6D1699C930481CD102127C9A3D992048AB05929B6E5927|
26959946667150639794667015087019625940457807714424391721682722368051,0xAEA9E17A306517EB89152AA7096D2C381EC813C51AA880E7BEE2C0FD,0xC644CF154CC81F5ADE49345E541B4D4B5C1ADB3EB5C01C14EE949AA2|
26959946667150639794667015087019625940457807714424391721682722368052,0x2FDCCCFEE720A77EF6CB3BFBB447F9383117E3DAA4A07E36ED15F78D,0xC8E8CD1B0BE40B0877CFCA1958603122F1E6914F84B7E8E968AE8B9E|
26959946667150639794667015087019625940457807714424391721682722368053,0x858E6F9CC6C12C31F5DF124AA77767B05C8BC021BD683D2B55571550,0xFB9232C15A3BC7673A3A03B0253824C53D0FD1411B1CABE2E187FB87|
26959946667150639794667015087019625940457807714424391721682722368054,0xDB2F6BE630E246A5CF7D99B85194B123D487E2D466B94B24A03C3E28,0xF0C5CFF7AB680D09EE11DAE84E9C1072AC48EA2E744B1B7F72FD469E|
26959946667150639794667015087019625940457807714424391721682722368055,0x1F2483F82572251FCA975FEA40DB821DF8AD82A3C002EE6C57112408,0x76050F3348AF2664AAC3A8B05281304EBC7A7914C6AD50A4B4EAC383|
26959946667150639794667015087019625940457807714424391721682722368056,0x31C49AE75BCE7807CDFF22055D94EE9021FEDBB5AB51C57526F011AA,0xD817400E8BA9CA13A45F360E3D121EAAEB39AF82D6001C8186F5F866|
26959946667150639794667015087019625940457807714424391721682722368057,0xAE99FEEBB5D26945B54892092A8AEE02912930FA41CD114E40447301,0xFB7DA7F5F13A43B81774373C879CD32D6934C05FA758EEB14FCFAB38|
26959946667150639794667015087019625940457807714424391721682722368058,0xDF1B1D66A551D0D31EFF822558B9D2CC75C2180279FE0D08FD896D04,0x5C080FC3522F41BBB3F55A97CFECF21F882CE8CBB1E50CA6E67E56DC|
26959946667150639794667015087019625940457807714424391721682722368059,0x706A46DC76DCB76798E60E6D89474788D16DC18032D268FD1A704FA6,0xE3D4895843DA188FD58FB0567976D7B50359D6B78530C8F62D1B1746|
26959946667150639794667015087019625940457807714424391721682722368060,0xB70E0CBD6BB4BF7F321390B94A03C1D356C21122343280D6115C1D21,0x42C89C774A08DC04B3DD201932BC8A5EA5F8B89BBB2A7E667AFF81CD";
		return ecTestX(testVectors, x);
	}

	public override function setup() : Void
	{
		m_curve = new com.fundoware.engine.crypto.ec.nist.FunNistP224Curve();
	}
}