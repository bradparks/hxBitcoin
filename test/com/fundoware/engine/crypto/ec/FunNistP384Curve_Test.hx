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

class FunNistP384Curve_Test extends FunCurveTestCase
{
	public function testX_NistP384(x : Int) : Int
	{
		// Test vectors from http://point-at-infinity.org/ecc/nisttv
		// Retrieved 17 Nov 2014
		var testVectors =
"1,0xAA87CA22BE8B05378EB1C71EF320AD746E1D3B628BA79B9859F741E082542A385502F25DBF55296C3A545E3872760AB7,0x3617DE4A96262C6F5D9E98BF9292DC29F8F41DBD289A147CE9DA3113B5F0B8C00A60B1CE1D7E819D7A431D7C90EA0E5F|
2,0x08D999057BA3D2D969260045C55B97F089025959A6F434D651D207D19FB96E9E4FE0E86EBE0E64F85B96A9C75295DF61,0x8E80F1FA5B1B3CEDB7BFE8DFFD6DBA74B275D875BC6CC43E904E505F256AB4255FFD43E94D39E22D61501E700A940E80|
3,0x077A41D4606FFA1464793C7E5FDC7D98CB9D3910202DCD06BEA4F240D3566DA6B408BBAE5026580D02D7E5C70500C831,0xC995F7CA0B0C42837D0BBE9602A9FC998520B41C85115AA5F7684C0EDC111EACC24ABD6BE4B5D298B65F28600A2F1DF1|
4,0x138251CD52AC9298C1C8AAD977321DEB97E709BD0B4CA0ACA55DC8AD51DCFC9D1589A1597E3A5120E1EFD631C63E1835,0xCACAE29869A62E1631E8A28181AB56616DC45D918ABC09F3AB0E63CF792AA4DCED7387BE37BBA569549F1C02B270ED67|
5,0x11DE24A2C251C777573CAC5EA025E467F208E51DBFF98FC54F6661CBE56583B037882F4A1CA297E60ABCDBC3836D84BC,0x8FA696C77440F92D0F5837E90A00E7C5284B447754D5DEE88C986533B6901AEB3177686D0AE8FB33184414ABE6C1713A|
6,0x627BE1ACD064D2B2226FE0D26F2D15D3C33EBCBB7F0F5DA51CBD41F26257383021317D7202FF30E50937F0854E35C5DF,0x09766A4CB3F8B1C21BE6DDA6C14F1575B2C95352644F774C99864F613715441604C45B8D84E165311733A408D3F0F934|
7,0x283C1D7365CE4788F29F8EBF234EDFFEAD6FE997FBEA5FFA2D58CC9DFA7B1C508B05526F55B9EBB2040F05B48FB6D0E1,0x9475C99061E41B88BA52EFDB8C1690471A61D867ED799729D9C92CD01DBD225630D84EDE32A78F9E64664CDAC512EF8C|
8,0x1692778EA596E0BE75114297A6FA383445BF227FBE58190A900C3C73256F11FB5A3258D6F403D5ECE6E9B269D822C87D,0xDCD2365700D4106A835388BA3DB8FD0E22554ADC6D521CD4BD1C30C2EC0EEC196BADE1E9CDD1708D6F6ABFA4022B0AD2|
9,0x8F0A39A4049BCB3EF1BF29B8B025B78F2216F7291E6FD3BAC6CB1EE285FB6E21C388528BFEE2B9535C55E4461079118B,0x62C77E1438B601D6452C4A5322C3A9799A9B3D7CA3C400C6B7678854AED9B3029E743EFEDFD51B68262DA4F9AC664AF8|
10,0xA669C5563BD67EEC678D29D6EF4FDE864F372D90B79B9E88931D5C29291238CCED8E85AB507BF91AA9CB2D13186658FB,0xA988B72AE7C1279F22D9083DB5F0ECDDF70119550C183C31C502DF78C3B705A8296D8195248288D997784F6AB73A21DD|
11,0x099056E27DA7B998DA1EEEC2904816C57FE935ED5837C37456C9FD14892D3F8C4749B66E3AFB81D626356F3B55B4DDD8,0x2E4C0C234E30AB96688505544AC5E0396FC4EED8DFC363FD43FF93F41B52A3255466D51263AAFF357D5DBA8138C5E0BB|
12,0x952A7A349BD49289AB3AC421DCF683D08C2ED5E41F6D0E21648AF2691A481406DA4A5E22DA817CB466DA2EA77D2A7022,0xA0320FAF84B5BC0563052DEAE6F66F2E09FB8036CE18A0EBB9028B096196B50D031AA64589743E229EF6BACCE21BD16E|
13,0xA567BA97B67AEA5BAFDAF5002FFCC6AB9632BFF9F01F873F6267BCD1F0F11C139EE5F441ABD99F1BAAF1CA1E3B5CBCE7,0xDE1B38B3989F3318644E4147AF164ECC5185595046932EC086329BE057857D66776BCB8272218A7D6423A12736F429CC|
14,0xE8C8F94D44FBC2396BBEAC481B89D2B0877B1DFFD23E7DC95DE541EB651CCA2C41ABA24DBC02DE6637209ACCF0F59EA0,0x891AE44356FC8AE0932BCBF6DE52C8A933B86191E7728D79C8319413A09D0F48FC468BA05509DE22D7EE5C9E1B67B888|
15,0xB3D13FC8B32B01058CC15C11D813525522A94156FFF01C205B21F9F7DA7C4E9CA849557A10B6383B4B88701A9606860B,0x152919E7DF9162A61B049B2536164B1BEEBAC4A11D749AF484D1114373DFBFD9838D24F8B284AF50985D588D33F7BD62|
16,0xD5D89C3B5282369C5FBD88E2B231511A6B80DFF0E5152CF6A464FA9428A8583BAC8EBC773D157811A462B892401DAFCF,0xD815229DE12906D241816D5E9A9448F1D41D4FC40E2A3BDB9CABA57E440A7ABAD1210CB8F49BF2236822B755EBAB3673|
17,0x4099952208B4889600A5EBBCB13E1A32692BEFB0733B41E6DCC614E42E5805F817012A991AF1F486CAF3A9ADD9FFCC03,0x5ECF94777833059839474594AF603598163AD3F8008AD0CD9B797D277F2388B304DA4D2FAA9680ECFA650EF5E23B09A0|
18,0xDFB1FE3A40F7AC9B64C41D39360A7423828B97CB088A4903315E402A7089FA0F8B6C2355169CC9C99DFB44692A9B93DD,0x453ACA1243B5EC6B423A68A25587E1613A634C1C42D2EE7E6C57F449A1C91DC89168B7036EC0A7F37A366185233EC522|
19,0x8D481DAB912BC8AB16858A211D750B77E07DBECCA86CD9B012390B430467AABF59C8651060801C0E9599E68713F5D41B,0xA1592FF0121460857BE99F2A60669050B2291B68A1039AA0594B32FD7ADC0E8C11FFBA5608004E646995B07E75E52245|
20,0x605508EC02C534BCEEE9484C86086D2139849E2B11C1A9CA1E2808DEC2EAF161AC8A105D70D4F85C50599BE5800A623F,0x5158EE87962AC6B81F00A103B8543A07381B7639A3A65F1353AEF11B733106DDE92E99B78DE367B48E238C38DAD8EEDD|
112233445566778899,0xA499EFE48839BC3ABCD1C5CEDBDD51904F9514DB44F4686DB918983B0C9DC3AEE05A88B72433E9515F91A329F5F4FA60,0x3B7CA28EF31F809C2F1BA24AAED847D0F8B406A4B8968542DE139DB5828CA410E615D1182E25B91B1131E230B727D36A|
112233445566778899112233445566778899,0x90A0B1CAC601676B083F21E07BC7090A3390FE1B9C7F61D842D27FA315FB38D83667A11A71438773E483F2A114836B24,0x3197D3C6123F0D6CD65D5F0DE106FEF36656CB16DC7CD1A6817EB1D51510135A8F492F72665CFD1053F75ED03A7D04C9|
10158184112867540819754776755819761756724522948540419979637868435924061464745859402573149498125806098880003248619520,0xF2A066BD332DC59BBC3D01DA1B124C687D8BB44611186422DE94C1DA4ECF150E664D353CCDB5CB2652685F8EB4D2CD49,0xD6ED0BF75FDD8E53D87765FA746835B673881D6D1907163A2C43990D75B454294F942EC571AD5AAE1806CAF2BB8E9A4A|
9850501551105991028245052605056992139810094908912799254115847683881357749738726091734403950439157209401153690566655,0x5C7F9845D1C4AA44747F9137B6F9C39B36B26B8A62E8AF97290434D5F3B214F5A0131550ADB19058DC4C8780C4165C4A,0x712F7FCCC86F647E70DB8798228CB16344AF3D00B139B6F8502939C2A965AF0EB4E39E2E16AB8F597B8D5630A50C9D85|
9850502723405747097317271194763310482462751455185699630571661657946308788426092983270628740691202018691293898608608,0xDD5838F7EC3B8ACF1BECFD746F8B668C577107E93548ED93ED0D254C112E76B10F053109EF8428BFCD50D38C4C030C57,0x33244F479CDAC34F160D9E4CE2D19D2FF0E3305B5BF0EEF29E91E9DE6E28F678C61B773AA7E3C03740E1A49D1AA2493C|
1146189371817832990947611400450889406070215735255370280811736587845016396640969656447803207438173695115264,0xCB8ED893530BFBA04B4CA655923AAAD109A62BC8411D5925316C32D33602459C33057A1FBCB5F70AEB295D90F9165FBC,0x426AEE3E91B08420F9B357B66D5AFCBCF3956590BF5564DBF9086042EB880493D19DA39AAA6436C6B5FC66CE5596B43F|
9619341438217097641865390297189708858938017986426152622639500179774624579127744608993294698873437325090751520764,0x67F714012B6B070182122DDD435CC1C2262A1AB88939BC6A2906CB2B4137C5E82B4582160F6403CAB887ACDF5786A268,0x90E31CF398CE2F8C5897C7380BF541075D1B4D3CB70547262B7095731252F181AC0597C66AF8311C7780DB39DEC0BD32|
1231307996623833742387400352380172566077927415136813282735641918395585376659282194317590461518639141730493780722175,0x55A79DF7B53A99D31462C7E1A5ED5623970715BB1021098CB973A7520CBD6365E613E4B2467486FB37E86E01CEE09B8F,0xB95AEB71693189911661B709A886A1867F056A0EFE401EE11C06030E46F7A87731DA4575863178012208707DD666727C|
587118838854683800942906722504810343086699021451906946003274128973058942197377013128840514404789143516741631,0x9539A968CF819A0E52E10EEA3BACA1B6480D7E4DF69BC07002C568569047110EE4FE72FCA423FDD5179D6E0E19C44844,0xA7728F37A0AE0DF2716061900D83A4DA149144129F89A214A8260464BAB609BB322E4E67DE5E4C4C6CB8D25983EC19B0|
153914077530671739663795070876894766451466019374644150541452557147890542143280855693795882295846834387672681660416,0x933FC13276672AB360D909161CD02D830B1628935DF0D800C6ED602C59D575A86A8A97E3A2D697E3ED06BE741C0097D6,0xF35296BD7A6B4C6C025ED6D84338CCCC7522A45C5D4FBDB1442556CAEFB598128FA188793ADA510EB5F44E90A4E4BEF1|
75148784606135150476268171850082176256856776750560539466196504390587921789283134009866871754361028131485122560,0x0CE31E1C4A937071E6EBACA026A93D783848BCC0C1585DAF639518125FCD1F1629D63041ABFB11FFC8F03FA8B6FCF6BF,0xA69EA55BE4BEAB2D5224050FEBFFBDFCFD614624C3B4F228909EB80012F003756D1C377E52F04FA539237F24DD080E2E|
19691383761310193665095292424754807745686799029814707849273381514021788371252213000473497648851202400395528761229312,0x6842CFE3589AC268818291F31D44177A9168DCBC19F321ED66D81ECF59E31B54CCA0DDFD4C4136780171748D69A91C54,0xE3A5ECD5AC725F13DBC631F358C6E817EDCF3A613B83832741A9DB591A0BAE767FC714F70C2E7EA891E4312047DECCC0|
39402006196394479212279040100143613805079739270465446667946905279627659399113263569398956308152294913554433653942623,0x605508EC02C534BCEEE9484C86086D2139849E2B11C1A9CA1E2808DEC2EAF161AC8A105D70D4F85C50599BE5800A623F,0xAEA7117869D53947E0FF5EFC47ABC5F8C7E489C65C59A0ECAC510EE48CCEF92116D16647721C984B71DC73C825271122|
39402006196394479212279040100143613805079739270465446667946905279627659399113263569398956308152294913554433653942624,0x8D481DAB912BC8AB16858A211D750B77E07DBECCA86CD9B012390B430467AABF59C8651060801C0E9599E68713F5D41B,0x5EA6D00FEDEB9F7A841660D59F996FAF4DD6E4975EFC655FA6B4CD028523F172EE0045A8F7FFB19B966A4F828A1ADDBA|
39402006196394479212279040100143613805079739270465446667946905279627659399113263569398956308152294913554433653942625,0xDFB1FE3A40F7AC9B64C41D39360A7423828B97CB088A4903315E402A7089FA0F8B6C2355169CC9C99DFB44692A9B93DD,0xBAC535EDBC4A1394BDC5975DAA781E9EC59CB3E3BD2D118193A80BB65E36E2366E9748FB913F580C85C99E7BDCC13ADD|
39402006196394479212279040100143613805079739270465446667946905279627659399113263569398956308152294913554433653942626,0x4099952208B4889600A5EBBCB13E1A32692BEFB0733B41E6DCC614E42E5805F817012A991AF1F486CAF3A9ADD9FFCC03,0xA1306B8887CCFA67C6B8BA6B509FCA67E9C52C07FF752F32648682D880DC774BFB25B2CF55697F13059AF10B1DC4F65F|
39402006196394479212279040100143613805079739270465446667946905279627659399113263569398956308152294913554433653942627,0xD5D89C3B5282369C5FBD88E2B231511A6B80DFF0E5152CF6A464FA9428A8583BAC8EBC773D157811A462B892401DAFCF,0x27EADD621ED6F92DBE7E92A1656BB70E2BE2B03BF1D5C42463545A81BBF585442EDEF3460B640DDC97DD48AB1454C98C|
39402006196394479212279040100143613805079739270465446667946905279627659399113263569398956308152294913554433653942628,0xB3D13FC8B32B01058CC15C11D813525522A94156FFF01C205B21F9F7DA7C4E9CA849557A10B6383B4B88701A9606860B,0xEAD6E618206E9D59E4FB64DAC9E9B4E411453B5EE28B650B7B2EEEBC8C2040257C72DB064D7B50AF67A2A773CC08429D|
39402006196394479212279040100143613805079739270465446667946905279627659399113263569398956308152294913554433653942629,0xE8C8F94D44FBC2396BBEAC481B89D2B0877B1DFFD23E7DC95DE541EB651CCA2C41ABA24DBC02DE6637209ACCF0F59EA0,0x76E51BBCA903751F6CD4340921AD3756CC479E6E188D728637CE6BEC5F62F0B603B9745EAAF621DD2811A362E4984777|
39402006196394479212279040100143613805079739270465446667946905279627659399113263569398956308152294913554433653942630,0xA567BA97B67AEA5BAFDAF5002FFCC6AB9632BFF9F01F873F6267BCD1F0F11C139EE5F441ABD99F1BAAF1CA1E3B5CBCE7,0x21E4C74C6760CCE79BB1BEB850E9B133AE7AA6AFB96CD13F79CD641FA87A82988894347C8DDE75829BDC5ED9C90BD633|
39402006196394479212279040100143613805079739270465446667946905279627659399113263569398956308152294913554433653942631,0x952A7A349BD49289AB3AC421DCF683D08C2ED5E41F6D0E21648AF2691A481406DA4A5E22DA817CB466DA2EA77D2A7022,0x5FCDF0507B4A43FA9CFAD215190990D1F6047FC931E75F1446FD74F69E694AF1FCE559B9768BC1DD610945341DE42E91|
39402006196394479212279040100143613805079739270465446667946905279627659399113263569398956308152294913554433653942632,0x099056E27DA7B998DA1EEEC2904816C57FE935ED5837C37456C9FD14892D3F8C4749B66E3AFB81D626356F3B55B4DDD8,0xD1B3F3DCB1CF5469977AFAABB53A1FC6903B1127203C9C02BC006C0BE4AD5CD9AB992AEC9C5500CA82A2457FC73A1F44|
39402006196394479212279040100143613805079739270465446667946905279627659399113263569398956308152294913554433653942633,0xA669C5563BD67EEC678D29D6EF4FDE864F372D90B79B9E88931D5C29291238CCED8E85AB507BF91AA9CB2D13186658FB,0x567748D5183ED860DD26F7C24A0F132208FEE6AAF3E7C3CE3AFD20873C48FA56D6927E69DB7D77266887B09648C5DE22|
39402006196394479212279040100143613805079739270465446667946905279627659399113263569398956308152294913554433653942634,0x8F0A39A4049BCB3EF1BF29B8B025B78F2216F7291E6FD3BAC6CB1EE285FB6E21C388528BFEE2B9535C55E4461079118B,0x9D3881EBC749FE29BAD3B5ACDD3C56866564C2835C3BFF39489877AB51264CFC618BC100202AE497D9D25B075399B507|
39402006196394479212279040100143613805079739270465446667946905279627659399113263569398956308152294913554433653942635,0x1692778EA596E0BE75114297A6FA383445BF227FBE58190A900C3C73256F11FB5A3258D6F403D5ECE6E9B269D822C87D,0x232DC9A8FF2BEF957CAC7745C24702F1DDAAB52392ADE32B42E3CF3D13F113E594521E15322E8F729095405CFDD4F52D|
39402006196394479212279040100143613805079739270465446667946905279627659399113263569398956308152294913554433653942636,0x283C1D7365CE4788F29F8EBF234EDFFEAD6FE997FBEA5FFA2D58CC9DFA7B1C508B05526F55B9EBB2040F05B48FB6D0E1,0x6B8A366F9E1BE47745AD102473E96FB8E59E2798128668D62636D32FE242DDA8CF27B120CD5870619B99B3263AED1073|
39402006196394479212279040100143613805079739270465446667946905279627659399113263569398956308152294913554433653942637,0x627BE1ACD064D2B2226FE0D26F2D15D3C33EBCBB7F0F5DA51CBD41F26257383021317D7202FF30E50937F0854E35C5DF,0xF68995B34C074E3DE41922593EB0EA8A4D36ACAD9BB088B36679B09EC8EABBE8FB3BA4717B1E9ACEE8CC5BF82C0F06CB|
39402006196394479212279040100143613805079739270465446667946905279627659399113263569398956308152294913554433653942638,0x11DE24A2C251C777573CAC5EA025E467F208E51DBFF98FC54F6661CBE56583B037882F4A1CA297E60ABCDBC3836D84BC,0x705969388BBF06D2F0A7C816F5FF183AD7B4BB88AB2A211773679ACC496FE513CE889791F51704CCE7BBEB55193E8EC5|
39402006196394479212279040100143613805079739270465446667946905279627659399113263569398956308152294913554433653942639,0x138251CD52AC9298C1C8AAD977321DEB97E709BD0B4CA0ACA55DC8AD51DCFC9D1589A1597E3A5120E1EFD631C63E1835,0x35351D679659D1E9CE175D7E7E54A99E923BA26E7543F60C54F19C3086D55B22128C7840C8445A96AB60E3FE4D8F1298|
39402006196394479212279040100143613805079739270465446667946905279627659399113263569398956308152294913554433653942640,0x077A41D4606FFA1464793C7E5FDC7D98CB9D3910202DCD06BEA4F240D3566DA6B408BBAE5026580D02D7E5C70500C831,0x366A0835F4F3BD7C82F44169FD5603667ADF4BE37AEEA55A0897B3F123EEE1523DB542931B4A2D6749A0D7A0F5D0E20E|
39402006196394479212279040100143613805079739270465446667946905279627659399113263569398956308152294913554433653942641,0x08D999057BA3D2D969260045C55B97F089025959A6F434D651D207D19FB96E9E4FE0E86EBE0E64F85B96A9C75295DF61,0x717F0E05A4E4C312484017200292458B4D8A278A43933BC16FB1AFA0DA954BD9A002BC15B2C61DD29EAFE190F56BF17F|
39402006196394479212279040100143613805079739270465446667946905279627659399113263569398956308152294913554433653942642,0xAA87CA22BE8B05378EB1C71EF320AD746E1D3B628BA79B9859F741E082542A385502F25DBF55296C3A545E3872760AB7,0xC9E821B569D9D390A26167406D6D23D6070BE242D765EB831625CEEC4A0F473EF59F4E30E2817E6285BCE2846F15F1A0";
		return ecTestX(testVectors, x);
	}

	public override function setup() : Void
	{
		m_curve = new com.fundoware.engine.crypto.ec.nist.FunNistP384Curve();
	}
}
