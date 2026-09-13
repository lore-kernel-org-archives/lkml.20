Received: from SY5PR01CU010.outbound.protection.outlook.com (mail-australiaeastazolkn19012070.outbound.protection.outlook.com [52.103.72.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2EA38E8DC
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 12:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.72.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789301443; cv=fail; b=WZrywILldr75HohAX5pkQMcIryppTjpOyjntx3NPnQf8DPHYrxXqYgKsPkllrp8NA51qd2jySa73onPZyVeii/xlUDSCr1fQQbqMvTWKRJ7yHq401d3CZc/LgiXZNDnsn4yLk83FHFV6CxNAj+s6nlURibXegJPTm+UeeF8Kz9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789301443; c=relaxed/simple;
	bh=9es2Rtzg8ces6oahFgp+Tnc66cigvRCtdb+Pl1fZNUQ=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=D399lzftLcu2HwJjW82zYYv/QBm7jh0K9Wlobb3W4nQ7PEvmZYf07M+bhWKAZjOYdQb7wQhNy11QkQyxpwfli6T7/1djyeMYMSj9y0vhy8HWaNBZtzukUJwR034WaMUMM6WpLxyBNEn+Jobx2kzjrmsQaRXCz9JDLqBp9seH6Z8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=iWHJR8dw; arc=fail smtp.client-ip=52.103.72.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="iWHJR8dw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nnGuZvQQ+otUcw0hGwX9d7Xpb/ppiv8+y/ludIWnmotydgnDqwM/+XndMqUW/NhgdnTa7TswQe2uaAZhCpBkK6zAHHVACza2J2D35RX02y4NHHDgXjj7oDDMnjx7GjVGLcN1C5bHMMZDS9QVAHc9mZnxW20I52Z0fE6amu8KAz8GxNqaF2fNyjGPjihZjMjc59f7nCZ0NbvnUBfNdMrPkq6vyZeFUcd34ev5jFDtao7iusOsdxf38h1gpb01Snq4tcbYAvxHvfdoOXzx2RtTgzNEwMw/5KN3hIXjBTLBwZLjZaC0EcwfawhiX42r4QKT7gH3UPrZ2CQUGDifarMF7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wgIos1kgAG4w4jub/FflERTfs+X7dhkQ86jnQaE53og=;
 b=nKR+Wp16CTKf4jI9JqF3b4miM6y1Xhbuao1eoHyda+BTXIMpvK5hKn0pBA1yqHdEIqKsFh71GR7ehiHkLv35zHi/TTpDdl1m7ysuj0/b2m3fBuYV164yVKlUz2WyI2d3sFgDxCLIMNaSZ1D5xbpwUodgYxntRUWciQKhwykn3Yb/GfC7yR1zsQmOJwfJqdWZeFE3govu79DUCyjeLu8lUEfkRw/nB4HL0wdJknnTFGxCLDGAzPWo7D4G751JuJ0eG/bF+dsVQEkZkm2pBgg0jPlTwGgXg5+fWxq/I/rSQOddMRNHakf6YXUFZ8dncfxzEsHVq9O+KzSOGK5IHRGfUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wgIos1kgAG4w4jub/FflERTfs+X7dhkQ86jnQaE53og=;
 b=iWHJR8dwraQGPC8BTF5rQxiyKeaOOaSa9/uX7jlVcBt1Iln4ZaEiE5ZGjDn5diLOk92XmSzX4aB42JiYkt8KPUzCdssSWk635IgM7rX8YAhffrX3QLjdUCkYvAY5uMTCl6Pb5ZedqTwbJiHmUfaMzxTPWjhW1JoG3nk4Rc96NBWAbTVH8lYhZixin1fEYEk6HyhQsCtuc7UZmvNs7t/EPpWchwZao+Jnz9bWkaI4K+6RO8qPZeDnyxV5fKe+at/YypJ585t/p4hDykBWsAe8mXwvJAYcjVrusDW7EHtxlCcJojdXP1eg3Izh7wLrkMBOMRwDOoSunda200E6H3FIdg==
Received: from ME2PR01MB4162.ausprd01.prod.outlook.com (2603:10c6:220:43::10)
 by SYBPR01MB5918.ausprd01.prod.outlook.com (2603:10c6:10:94::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.8; Sun, 13 Sep
 2026 12:10:33 +0000
Received: from ME2PR01MB4162.ausprd01.prod.outlook.com
 ([fe80::b83a:eb0d:b8e5:3e07]) by ME2PR01MB4162.ausprd01.prod.outlook.com
 ([fe80::b83a:eb0d:b8e5:3e07%5]) with mapi id 15.21.0428.004; Sun, 13 Sep 2026
 12:10:33 +0000
From: =?gb2312?B?wO4gufO+/A==?= <lgj28@outlook.com>
To: "linux-platform@vger.kernel.org" <linux-platform@vger.kernel.org>
CC: "hp-wmi@googlegroups.com" <hp-wmi@googlegroups.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [BUG] platform/x86: hp-wmi: PWM_MODE_AUTO sends speed=0 which turns
 fan off on 8C77
Thread-Topic: [BUG] platform/x86: hp-wmi: PWM_MODE_AUTO sends speed=0 which
 turns fan off on 8C77
Thread-Index: AQHdQ3Z7waYefu5DJkiiFredMZYkYw==
Date: Sun, 13 Sep 2026 12:10:33 +0000
Message-ID:
 <ME2PR01MB4162E1B2C5D55315E48B33D9B7BC2@ME2PR01MB4162.ausprd01.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ME2PR01MB4162:EE_|SYBPR01MB5918:EE_
x-ms-office365-filtering-correlation-id: 2b5e4259-0012-44b3-00c8-08df1190033f
x-microsoft-antispam:
 BCL:0;ARA:14566002|15030799006|15080799012|6092099016|19110799012|8060799015|8062599012|41001999006|25010399006|4140399003|24021099003|39105399006|20031999006|31061999003|102099032|3412199025|440099028|40105399003|2607281247196008;
x-microsoft-antispam-message-info:
 =?gb2312?B?OFd2dDM4Rno2UHBaRDhRTW11ZnFydWJxa0grYldLSkhxSUtnQ0lBR3hxcWJz?=
 =?gb2312?B?eWY1UklxbUpwUFRFQTJiZTR5RE1EUHJiekc1WVJYSTdBYk5wc1lqMG53eHZh?=
 =?gb2312?B?RXE2eHJoWHgvaE5QQUtGa21ZVE9QVCtZcFlCbEdTQnUyWlNORTN1ZHd2K04v?=
 =?gb2312?B?MFpoUlhocWhRY0RIV0puVk1aYVdUTXVGREl4QXBEbzdZNktJcEU5TnhrZC8z?=
 =?gb2312?B?L2p3T2IrQkpiM0h3eUpBTlFBOVplb2w4TWJZU1JhMXN1ZjUrMzVPNXRhUkVn?=
 =?gb2312?B?c2RWL1RCYzF5dXNmenJ0ZFNIbC9qZFI2N2RWZTdZN1UzcjZuTkdUZ3ppSmxz?=
 =?gb2312?B?MnptNFNKOGVET1JtV0crTlNjR2xIcDFSb2RDdW55MWh1TTc3c3hpUERiRGFC?=
 =?gb2312?B?dnlVSmZzUk5GU3BpaE01MmpCb0luR1NOQk1JQjVJUUpBTWZObG83cGpuNHFC?=
 =?gb2312?B?ZjFNWVlPdVhldXFjZkVNN3MxbzdrRVlnSmcvWTgvRDY3SGJ2WWtmU01jWWNF?=
 =?gb2312?B?YVRrdWJqQVJHQWVNZFUxWDN5YmFDR1RFOWNrOGR1eWZ3RlR5UTkxV2JxZElZ?=
 =?gb2312?B?Si9lN09DSEltOVhiaTB6NC9VRnE0Z2hGN000NXhUVWxNZUdDK0FVOFNpNU5t?=
 =?gb2312?B?VmJKaWZRdTZxU1JNajVTMHNGSzVhRUd5ZlFsS3lHNFk4am5ndVlVYkhGTVEv?=
 =?gb2312?B?S1Q0VGU0eUl3SW5jSWpMSnZjMzQ2aVlyeHVJZW1WelpuU0wxai9sUDNndVpR?=
 =?gb2312?B?ZmpjMEh3R0IzWEMzc2lRU3psVTJXTVUvdG5Xbm5LMm5qZ0xsT3JtaDZ6QVpk?=
 =?gb2312?B?ajlDNWhacjgwVkpPY1QzVFRGYy9VTnQwYjNORG5GZ1c3cHJFRGRjZFlNMExo?=
 =?gb2312?B?Um9DUDN0MHFKOHE1dm5BZ2VodDVVZ3FOS0FlUjhmNWg1MlgyMlFVcVZlWGdR?=
 =?gb2312?B?bGdhSXFxcUF2cVh2cWRGc0xKdXpyNVBnd0N4SXpYSVIxMHhsVmJQbG9Md3g5?=
 =?gb2312?B?cWg3SkRQZFEyZkY2RFE5SGdrdVNIUzYva3Q2cnhnbi91Zk9ySTlwYXNWbUt0?=
 =?gb2312?B?cHo4d1Q1T0c2YURMS3Y3RDNPMUtPYmRtRnN1YlpwUjlhOS9KYWcrYU04cnE0?=
 =?gb2312?B?ajU3blpNNjJFaEJjVlFJNnI1eDFpUy83b21zd1B1TlFhVFBJZHB6SnhEajcx?=
 =?gb2312?B?dnpEWU1NTG1tcWozQ3QyTXZ5UVFibWhacWxEVklsL0JPNkJzcVpSZDVhbmxI?=
 =?gb2312?B?NzBKWFJWVGd6aFh2SUlPVXo1SElYbS9YRkY3VWZLbDk0bllLT0JudGVWeDZj?=
 =?gb2312?B?RWw0L2w1NkNjNGNacCtESGo1VXk4Z2VSaVlpYXFiK2FjNWhzYXRoSE02Yks3?=
 =?gb2312?B?UDZjeWNqWXdlM0JRVEttTmtoSDFoQllKMWFkbmIydElRTHNWc09VcWRWNWRp?=
 =?gb2312?Q?1LC0zFRP?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?UDMxLzhQZFp1ZDFFdFYzVFBtdDEwK3FHRXBZSkhFSHpmTFhpdldQMWYyOHR6?=
 =?gb2312?B?SVZmRHF6Ty82dTQzR3o1dytuZWZPRDlGRmgzcUVKSXFlcHgrQ2ZsamdSU3Jw?=
 =?gb2312?B?VXQzRVd1SHNLeldweHlrK3RPVy83dlYvVlFCSXV6bW9hS0huTHVNTlpwRzBm?=
 =?gb2312?B?NWppdEt5WmV2bG02YUEvalNXcjd5aE0vejhTMW1ueVdGSmN6amxuMlcyNUo0?=
 =?gb2312?B?V0NMd3lDV04zQTJXbk92MnNsZkc1b3RRSVpxRXhMMC9yVkw4SDB3anJIa3RN?=
 =?gb2312?B?YU9oOWgxRVFqNnNnV0lJOWRFSmwwdDlvU2I4Z0pEVklYWlVwQ1NNakZCcGlk?=
 =?gb2312?B?UnZuZXRQWHZkTjFxUExjRDZUNTBkRTlZTmxmQkRwZmFqOVlYS0Rnbmx0b0Y2?=
 =?gb2312?B?N2ppSTlLbTF1ZVcvZUdwcExYQlVXZGtjZTAzT2VjMWtqTlU4L3RIODlTblRm?=
 =?gb2312?B?WFJMQzRJbWNMemg4dEFUbU00d2R1WXVEYS9neE94VXdnRTJYU2JhT25VNi8r?=
 =?gb2312?B?UitPUERjRTJTZWMxV21zWktydkNHQUs4ZS9uQUM4WGJBVGpwWk45cTVwdTlV?=
 =?gb2312?B?Y1l5UHV1aHFNY2xkalRVK0FYRlI0eUVDYmg0YUpPMUFKZkxyS2NrUENGQkVs?=
 =?gb2312?B?NjNEdlk3MFJPMkpWRWdVQTNLNS9VbjFTamJTWUdPUytoQkVwZHF3Rm9EamV4?=
 =?gb2312?B?eFM5cDMyQ3NjbHRyZkNZbUNPa29jeVR5eEdIY2lpczNOcDhsMi9RbkdCMGF4?=
 =?gb2312?B?UVJ1YlZBN3dLalNjY2VOUUNtTzN0SUdCNGRkZHd0Z3R0Z2RnKzNzcUVWb0ti?=
 =?gb2312?B?YlNHV2twdFl1dVNic0U5MmFkVklId1kwZm4yT1VKM0pnQUVSMysrbXoySWFl?=
 =?gb2312?B?Y1ZvZVk4SlBOVUF0VnRLTU54ZG1MNHNkK0U2dHBOMGJBbHk5Z2FmT2k0MUpj?=
 =?gb2312?B?VnhXaitaYU91OWd5UkloQzNMUXZxaFNGWnRiRmFwVE1CY3IvQStUYjMzNXdD?=
 =?gb2312?B?N3hTWDJ5Qy9IN01DbzNQTVEzeGVkMDVLQ3J3ZERZc0s4VEhxYTJUTFd3ckJx?=
 =?gb2312?B?NWtDS0xSMEJ6L0loQUt2QTlPSEJEOHhuTmtqMjRTY1FoMXZNOXUxV0ZIY3Iz?=
 =?gb2312?B?Tnppd2U2emxQQVlvdDdiY1h4SGRXVGZrUzM0Z1lza2FLeFVZaThndFJwTVBI?=
 =?gb2312?B?am13SVVMSTJ6NWdJNjN0QU5zL3dPbzRDbktTcFJYWVhudUdJcHJWaG5aNDli?=
 =?gb2312?B?U0x5KzJtU3lmMDFYSnNsdHRTMit5ODNtdkEyK01lbmhDdW1XZ3ZtRkJOVldj?=
 =?gb2312?B?VmY3Ty9CVXJVd0JkTHVmT3BVbVN1WW9wZ2UycnFMNTlKMWQzZXZCYUNyQ0xP?=
 =?gb2312?B?T0dJcDlnRVJpejg1eCthRThLanZ4T3VrbDZHWlNNcGp6WktGNjMvQSs0YTFN?=
 =?gb2312?B?UHNYNzdVOUhsejZjelF6WnZ2ZFhYZXhnbXVKYnVLUnJ1c2VEOHJ0N1FnK3BR?=
 =?gb2312?B?NXF6M1FBbUloOWhZUXdnSURDeFRBSlUyOXFXZDhLN3doUjY4b0xDVnpsTXNS?=
 =?gb2312?B?blRPelROKzNGbks4bHFjODRLVEx0YUxJWWxxT1JzM3d0OUtRK2RNeUJyUDdi?=
 =?gb2312?B?TU4yMlY2c2xCQ3hlUXhVOEcyYTB1MnozM1dycTVlcE52dG0rSW5SUXMyZ3pn?=
 =?gb2312?B?UUY3c21rd0NQRnJSQ0FqdGZtcmRHVnZiTC9XOUlneDBTVnNvOWZ3dnBkaVFj?=
 =?gb2312?B?TDQ1VUpsQm10MExrczczSGswZko2VnlsVlk0TTRFaDhWMk9IOVdYS1pRbFBR?=
 =?gb2312?Q?TBn8JkkjLyGJbmGpQZaT6h4vutGodVEbKo+2s=3D?=
Content-Type: multipart/mixed;
	boundary="_006_ME2PR01MB4162E1B2C5D55315E48B33D9B7BC2ME2PR01MB4162ausp_"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ME2PR01MB4162.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b5e4259-0012-44b3-00c8-08df1190033f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2026 12:10:33.6776
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SYBPR01MB5918

--_006_ME2PR01MB4162E1B2C5D55315E48B33D9B7BC2ME2PR01MB4162ausp_
Content-Type: multipart/alternative;
	boundary="_000_ME2PR01MB4162E1B2C5D55315E48B33D9B7BC2ME2PR01MB4162ausp_"

--_000_ME2PR01MB4162E1B2C5D55315E48B33D9B7BC2ME2PR01MB4162ausp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGVsbG8gcGxhdGZvcm0gbWFpbnRhaW5lcnMsDQpPbiBhbiBIUCBPTUVOIGxhcHRvcCAoRE1JIGJv
YXJkIDhDNzcsIEJJT1MgRi4yMCksIHJldHVybmluZyB0aGUgZmFuIGZyb20NCm1hbnVhbC9tYXgg
Y29udHJvbCBiYWNrIHRvIGF1dG9tYXRpYyB2aWEgdGhlIGluLXRyZWUgaHAtd21pIGRyaXZlciBk
b2VzIG5vdA0KcmVzdW1lIEVDL2Zpcm13YXJlIGNvb2xpbmcuIFRoZSBmYW5zIGRyb3AgdG8gMCBS
UE0gYW5kIHN0YXkgdGhlcmUgZXZlbiB3aGlsZQ0KdGhlIENQVSBwYWNrYWdlIHRlbXBlcmF0dXJl
IGtlZXBzIHJpc2luZyBwYXN0IH45NyBDLiBUaGlzIGlzIGRhbmdlcm91cyAoZmFuDQpzaHV0LW9m
ZiB1bmRlciBsb2FkKS4NCkVudmlyb25tZW50DQotLS0tLS0tLS0tLQ0KDQogICoNCkxhcHRvcCA6
IEhQIE9NRU4sIERNSSBib2FyZCBuYW1lICI4Qzc3IiwgdmVuZG9yICJIUCINCiAgKg0KQklPUyA6
IEYuMjAgKDIwMjYtMDMtMzApDQogICoNCktlcm5lbCA6IDcuMi4zLTA3MDIwMy1nZW5lcmljOyBo
cC13bWkgc3JjdmVyc2lvbiA1MkQzNzNEMEYzODlGRjExRkM4OTc4MQ0KICAqDQpNb2R1bGUgOiBk
cml2ZXJzL3BsYXRmb3JtL3g4Ni9ocC9ocC13bWkua28NCiAgKg0KSS9GIDogL3N5cy9kZXZpY2Vz
L3BsYXRmb3JtL2hwLXdtaS9od21vbi9od21vbjcve3B3bTEscHdtMV9lbmFibGUsZmFufQ0KDQpT
dGVwcyB0byByZXByb2R1Y2UNCi0tLS0tLS0tLS0tLS0tLS0tLQ0KZWNobyAwID4gcHdtMV9lbmFi
bGUgIyBtYXggKHdvcmtzOiBmYW5zIC0+IH42MDAwIFJQTSwgcHdtIDI1NSkNCmVjaG8gMiA+IHB3
bTFfZW5hYmxlICMgUFdNX01PREVfQVVUTyAtPiBmYW5zIHJhbXAgdG8gMCBhbmQgc3RheQ0KT2Jz
ZXJ2ZWQgdGltZWxpbmUNCi0tLS0tLS0tLS0tLS0tLS0tDQp0KHMpIHB3bTEgZW5hYmxlIGZhbjEg
ZmFuMiB4ODZfcGtnX3RlbXANCjAgMjU1IDAgNjAwMCA2MzAwIH44OSBDDQorMiAyMjkgMiA1NDAw
IDU2MDAgfjkyIEMNCis2IDM0IDIgODAwIDEyMDAgfjkyIEMNCisxMCAwIDIgMCAwIH45NiBDDQor
MTYgMCAyIDAgMCB+OTggQyAoc3RpbGwgcmlzaW5nKQ0KRXhwZWN0ZWQ6IGZhbnMgcmVzdW1lIGEg
dGVtcGVyYXR1cmUgY3VydmUgKGFzIG9uIFdpbmRvd3MvT01FTikuDQpBY3R1YWwgOiBmYW5zIHN0
b3AgYXQgMCBSUE0gYW5kIG5ldmVyIHJlc3VtZSwgd2hpbGUgdGhlIHBhY2thZ2UgaGVhdHMgdXAu
DQooU2FtZSBhbHNvIGhhcHBlbnMgd2hlbiBnb2luZyBpZGxlIC0+IGF1dG8uKQ0KUm9vdCBjYXVz
ZSAoZnJvbSBkcml2ZXIgKyBBQ1BJL2Z3IHRhYmxlcykNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0NCmhwX3dtaV9hcHBseV9mYW5fc2V0dGluZ3MoKSBQV01fTU9ERV9B
VVRPIGNhbGxzIGhwX3dtaV9mYW5fc3BlZWRfbWF4X3Jlc2V0KCksDQp3aGljaCBzZXRzIGNwdS9n
cHVfcHdtID0gSFBfRkFOX1NQRUVEX0FVVE9NQVRJQyAoMHgwMCkgYW5kIHRoZW4NCmhwX3dtaV9m
YW5fc3BlZWRfc2V0KCkgc2VuZHMgZmFuIHNwZWVkIDB4MDAgdG8gdGhlIEVDDQooVklDVFVTX1Nf
RkFOX1NQRUVEX1NFVCAvIEdNKS4gT24gYm9hcmQgOEM3NyB0aGUgRUMgdHJlYXRzIHNwZWVkIDAg
YXMNCiJmYW4gb2ZmIiwgbm90ICJyZWxlYXNlIHRvIGF1dG9tYXRpYyIsIHNvIGl0IG5ldmVyIHJl
c3VtZXMgdGhlIGF1dG9tYXRpYw0KY3VydmUuDQpUaGUgYm9hcmQncyBBQ1BJIERTRFQgKGZyb20g
dGhlIEJJT1MgZHVtcCkgY29uZmlybXMgdGhlIEVDIGludGVyZmFjZToNCkVDIG1haWxib3ggOiBP
cGVyYXRpb25SZWdpb24gKEVDQ0QsIFN5c3RlbU1lbW9yeSwgMHhGRTBCMDgwMCwgMHgxMDAwKQ0K
RUMgcmVhZC93cml0ZTogRVJSRC9FUldULCBjb21tYW5kIGJ5dGVzIDB4QjAgKHJlYWQpIC8gMHhC
MSAod3JpdGUpOw0KZmFuIFBXTSBhdCBFQyBvZmZzZXRzIDB4QjAuLjB4QjMNCkVtYmVkZGVkQ3Ry
bCA6IE9wZXJhdGlvblJlZ2lvbiAoRVJBTSwgRW1iZWRkZWRDb250cm9sLCAuLi4pIG9mZnNldHMg
MHg1Ri8weDYyDQpUaGVybWFsIHByb2YuOiBFQyBvZmZzZXQgMHg5NSAoSFBfT01FTl9FQ19USEVS
TUFMX1BST0ZJTEVfT0ZGU0VUKTsNCmJhbGFuY2VkIDB4MzAgLyBwZXJmIDB4MzEgLyBjb29sIDB4
NTANClN1Z2dlc3RlZCBmaXggZGlyZWN0aW9uDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KT24g
UFdNX01PREVfQVVUTywgYWZ0ZXIgY2xlYXJpbmcgdGhlIG1hbnVhbCBmYW4gc3BlZWQsIGFsc28g
cmUtYXNzZXJ0IHRoZSBFQw0KdGhlcm1hbCBwcm9maWxlIHRvIGJhbGFuY2VkIChlLmcuIG9tZW5f
dGhlcm1hbF9wcm9maWxlX3NldChERUZBVUxUKSAvDQp0aGVybWFsX3Byb2ZpbGVfc2V0KCkpIHNv
IHRoZSBFQyB0YWtlcyBiYWNrIGNvbnRyb2wsIE9SIHN0b3Agc2VuZGluZw0KSFBfRkFOX1NQRUVE
X0FVVE9NQVRJQyAoMHgwMCkgdG8gdGhlIEVDIG9uIGJvYXJkcyB0aGF0IHRyZWF0IDAgYXMgb2Zm
Lg0KSSBjYW4gdXBsb2FkIHRoZSBmdWxsIEJJT1MgQUNQSSBkdW1wIC8gcmF3IEZJVCBpbWFnZSBp
ZiB1c2VmdWwuIEhhcHB5IHRvDQp0ZXN0IGEgcHJvcG9zZWQgcGF0Y2ggb24gcmVhbCBoYXJkd2Fy
ZS4NClRoYW5rcywNCi0tDQpoYW94dWFuIExpDQo=

--_000_ME2PR01MB4162E1B2C5D55315E48B33D9B7BC2ME2PR01MB4162ausp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<span style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService,=
 Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">Hel=
lo platform maintainers,</span>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
On an HP OMEN laptop (DMI board 8C77, BIOS F.20), returning the fan from</d=
iv>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
manual/max control back to automatic via the in-tree hp-wmi driver does not=
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
resume EC/firmware cooling. The fans drop to 0 RPM and stay there even whil=
e</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
the CPU package temperature keeps rising past ~97 C. This is dangerous (fan=
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
shut-off under load).</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Environment</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
-----------</div>
<ul>
<li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<div role=3D"presentation">Laptop : HP OMEN, DMI board name &quot;8C77&quot=
;, vendor &quot;HP&quot;</div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<div role=3D"presentation">BIOS : F.20 (2026-03-30)</div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<div role=3D"presentation">Kernel : 7.2.3-070203-generic; hp-wmi srcversion=
 52D373D0F389FF11FC89781</div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<div role=3D"presentation">Module : drivers/platform/x86/hp/hp-wmi.ko</div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<div role=3D"presentation">I/F : /sys/devices/platform/hp-wmi/hwmon/hwmon7/=
{pwm1,pwm1_enable,fan}</div>
</li></ul>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Steps to reproduce</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
------------------</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
echo 0 &gt; pwm1_enable # max (works: fans -&gt; ~6000 RPM, pwm 255)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
echo 2 &gt; pwm1_enable # PWM_MODE_AUTO -&gt; fans ramp to 0 and stay</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Observed timeline</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
-----------------</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
t(s) pwm1 enable fan1 fan2 x86_pkg_temp</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
0 255 0 6000 6300 ~89 C</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
+2 229 2 5400 5600 ~92 C</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
+6 34 2 800 1200 ~92 C</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
+10 0 2 0 0 ~96 C</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
+16 0 2 0 0 ~98 C (still rising)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Expected: fans resume a temperature curve (as on Windows/OMEN).</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Actual : fans stop at 0 RPM and never resume, while the package heats up.</=
div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
(Same also happens when going idle -&gt; auto.)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Root cause (from driver + ACPI/fw tables)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
----------------------------------------</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
hp_wmi_apply_fan_settings() PWM_MODE_AUTO calls hp_wmi_fan_speed_max_reset(=
),</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
which sets cpu/gpu_pwm =3D HP_FAN_SPEED_AUTOMATIC (0x00) and then</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
hp_wmi_fan_speed_set() sends fan speed 0x00 to the EC</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
(VICTUS_S_FAN_SPEED_SET / GM). On board 8C77 the EC treats speed 0 as</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&quot;fan off&quot;, not &quot;release to automatic&quot;, so it never resu=
mes the automatic</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
curve.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
The board's ACPI DSDT (from the BIOS dump) confirms the EC interface:</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
EC mailbox : OperationRegion (ECCD, SystemMemory, 0xFE0B0800, 0x1000)</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
EC read/write: ERRD/ERWT, command bytes 0xB0 (read) / 0xB1 (write);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
fan PWM at EC offsets 0xB0..0xB3</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
EmbeddedCtrl : OperationRegion (ERAM, EmbeddedControl, ...) offsets 0x5F/0x=
62</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Thermal prof.: EC offset 0x95 (HP_OMEN_EC_THERMAL_PROFILE_OFFSET);</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
balanced 0x30 / perf 0x31 / cool 0x50</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Suggested fix direction</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
-----------------------</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
On PWM_MODE_AUTO, after clearing the manual fan speed, also re-assert the E=
C</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
thermal profile to balanced (e.g. omen_thermal_profile_set(DEFAULT) /</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
thermal_profile_set()) so the EC takes back control, OR stop sending</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
HP_FAN_SPEED_AUTOMATIC (0x00) to the EC on boards that treat 0 as off.</div=
>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
I can upload the full BIOS ACPI dump / raw FIT image if useful. Happy to</d=
iv>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
test a proposed patch on real hardware.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Thanks,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
--</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
haoxuan Li</div>
</body>
</html>

--_000_ME2PR01MB4162E1B2C5D55315E48B33D9B7BC2ME2PR01MB4162ausp_--

--_006_ME2PR01MB4162E1B2C5D55315E48B33D9B7BC2ME2PR01MB4162ausp_
Content-Type: text/x-dsl; name="DSDT_EC0_fan_extract.dsl"
Content-Description: DSDT_EC0_fan_extract.dsl
Content-Disposition: attachment; filename="DSDT_EC0_fan_extract.dsl";
	size=16894; creation-date="Sun, 13 Sep 2026 12:09:46 GMT";
	modification-date="Sun, 13 Sep 2026 12:10:04 GMT"
Content-Transfer-Encoding: base64

CiAgICAgICAgICAgIE9wZXJhdGlvblJlZ2lvbiAoRVJBTSwgRW1iZWRkZWRDb250cm9sLCBaZXJv
LCAweEZGKQogICAgICAgICAgICBGaWVsZCAoRVJBTSwgQnl0ZUFjYywgTG9jaywgUHJlc2VydmUp
CiAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgIE9mZnNldCAoMHg1RiksIAogICAgICAgICAg
ICAgICAgRVJCRCwgICA4LCAKICAgICAgICAgICAgICAgIFNNUFIsICAgOCwgCiAgICAgICAgICAg
ICAgICBPZmZzZXQgKDB4NjIpCiAgICAgICAgICAgIH0KCiAgICAgICAgICAgIE9wZXJhdGlvblJl
Z2lvbiAoQ0NMSywgU3lzdGVtSU8sIDB4MTgxMCwgMHgwNCkKICAgICAgICAgICAgRmllbGQgKEND
TEssIERXb3JkQWNjLCBOb0xvY2ssIFByZXNlcnZlKQogICAgICAgICAgICB7CiAgICAgICAgICAg
ICAgICAgICAgLCAgIDEsIAogICAgICAgICAgICAgICAgRFVUWSwgICAzLCAKICAgICAgICAgICAg
ICAgIFRIRU4sICAgMSwgCiAgICAgICAgICAgICAgICBPZmZzZXQgKDB4MDEpLCAKICAgICAgICAg
ICAgICAgIEZUVCwgICAgMSwgCiAgICAgICAgICAgICAgICAgICAgLCAgIDgsIAogICAgICAgICAg
ICAgICAgVFNUUywgICAxCiAgICAgICAgICAgIH0KCiAgICAgICAgICAgIE1ldGhvZCAoRkFORywg
MSwgTm90U2VyaWFsaXplZCkKICAgICAgICAgICAgewogICAgICAgICAgICAgICAgTG9jYWwwID0g
RUlEUiAoQXJnMCkKICAgICAgICAgICAgICAgIFJldHVybiAoTG9jYWwwKQogICAgICAgICAgICB9
CgogICAgICAgICAgICBNZXRob2QgKEZBTlcsIDIsIE5vdFNlcmlhbGl6ZWQpCiAgICAgICAgICAg
IHsKICAgICAgICAgICAgICAgIEVJRFcgKEFyZzAsIEFyZzEpCiAgICAgICAgICAgICAgICBSZXR1
cm4gKEFyZzEpCiAgICAgICAgICAgIH0KCiAgICAgICAgICAgIE1ldGhvZCAoVFVWUiwgMSwgTm90
U2VyaWFsaXplZCkKICAgICAgICAgICAgewogICAgICAgICAgICAgICAgUmV0dXJuICgweDA1KQog
ICAgICAgICAgICB9CgogICAgICAgICAgICBNZXRob2QgKFRIUk8sIDEsIE5vdFNlcmlhbGl6ZWQp
CiAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgIElUSFIgKEFyZzApCiAgICAgICAgICAgIH0K
CiAgICAgICAgICAgIE1ldGhvZCAoQ0xDSywgMSwgTm90U2VyaWFsaXplZCkKICAgICAgICAgICAg
ewogICAgICAgICAgICAgICAgSWYgKChBcmcwID09IFplcm8pKQogICAgICAgICAgICAgICAgewog
ICAgICAgICAgICAgICAgICAgIFRIRU4gPSBaZXJvCiAgICAgICAgICAgICAgICAgICAgRlRUID0g
WmVybwogICAgICAgICAgICAgICAgfQogICAgICAgICAgICAgICAgRWxzZQogICAgICAgICAgICAg
ICAgewogICAgICAgICAgICAgICAgICAgIERVVFkgPSBBcmcwCiAgICAgICAgICAgICAgICAgICAg
VEhFTiA9IE9uZQogICAgICAgICAgICAgICAgfQoKICAgICAgICAgICAgICAgIFJldHVybiAoVEhF
TikgLyogXF9TQl8uUEMwMC5MUENCLkVDMF8uVEhFTiAqLwogICAgICAgICAgICB9CgogICAgICAg
ICAgICBNZXRob2QgKFBDTEssIDAsIE5vdFNlcmlhbGl6ZWQpCiAgICAgICAgICAgIHsKICAgICAg
ICAgICAgICAgIElQQ0wgKCkKICAgICAgICAgICAgfQoKICAgICAgICAgICAgTWV0aG9kIChJVEhS
LCAxLCBOb3RTZXJpYWxpemVkKQogICAgICAgICAgICB7CiAgICAgICAgICAgICAgICBJZiAoKEFy
ZzAgPT0gWmVybykpCiAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgUmV0dXJu
ICgweEZGKQogICAgICAgICAgICAgICAgfQogICAgICAgICAgICAgICAgRWxzZUlmICgoQXJnMCA9
PSBPbmUpKQogICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAgIFJldHVybiAoRFVU
WSkgLyogXF9TQl8uUEMwMC5MUENCLkVDMF8uRFVUWSAqLwogICAgICAgICAgICAgICAgfQogICAg
ICAgICAgICAgICAgRWxzZUlmICgoQXJnMCA9PSAweDAyKSkKICAgICAgICAgICAgICAgIHsKICAg
ICAgICAgICAgICAgICAgICBSZXR1cm4gKFRUSFIpIC8qIFxfU0JfLlBDMDAuTFBDQi5FQzBfLlRU
SFIgKi8KICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAgICAgIEVsc2UKICAgICAgICAgICAg
ICAgIHsKICAgICAgICAgICAgICAgICAgICBSZXR1cm4gKDB4RkYpCiAgICAgICAgICAgICAgICB9
CiAgICAgICAgICAgIH0KCiAgICAgICAgICAgIE1ldGhvZCAoSVBDTCwgMCwgTm90U2VyaWFsaXpl
ZCkKICAgICAgICAgICAgewogICAgICAgICAgICAgICAgTG9jYWwwID0gUENWTCAvKiBcX1NCXy5Q
QzAwLkxQQ0IuRUMwXy5QQ1ZMICovCiAgICAgICAgICAgICAgICBDUFBDID0gTG9jYWwwCiAgICAg
ICAgICAgICAgICBTUE5UICgpCiAgICAgICAgICAgIH0KCiAgICAgICAgICAgIEluZGV4RmllbGQg
KENNU0ksIENNU0QsIEJ5dGVBY2MsIE5vTG9jaywgUHJlc2VydmUpCiAgICAgICAgICAgIHsKICAg
ICAgICAgICAgICAgIE5WVlIsICAgOCwgCiAgICAgICAgICAgICAgICBOVkRSLCAgIDgsIAogICAg
ICAgICAgICAgICAgVFBJRCwgICA4LCAKICAgICAgICAgICAgICAgIEdQVFAsICAgOCwgCiAgICAg
ICAgICAgICAgICBOSVNNLCAgIDgsIAogICAgICAgICAgICAgICAgT1BMMSwgICA4LCAKICAgICAg
ICAgICAgICAgIE9QTDIsICAgOCwgCiAgICAgICAgICAgICAgICBPUEw0LCAgIDgsIAogICAgICAg
ICAgICAgICAgT2Zmc2V0ICgweDBBKSwgCiAgICAgICAgICAgICAgICBPQ1BULCAgIDE2LCAKICAg
ICAgICAgICAgICAgIE9DVlQsICAgMTYsIAogICAgICAgICAgICAgICAgQlRMUywgICAxLCAKICAg
ICAgICAgICAgICAgIFdMQU4sICAgMSwgCiAgICAgICAgICAgICAgICBCTFRILCAgIDEsIAogICAg
ICAgICAgICAgICAgV1dBTiwgICAxLCAKICAgICAgICAgICAgICAgIENCS1MsICAgMSwgCiAgICAg
ICAgICAgICAgICBXVFNNLCAgIDEsIAogICAgICAgICAgICAgICAgRERTRiwgICAxLCAKICAgICAg
ICAgICAgICAgIE9mZnNldCAoMHgwRiksIAogICAgICAgICAgICAgICAgRkZBTCwgICAxLCAKICAg
ICAgICAgICAgICAgIFRIU0QsICAgMSwgCiAgICAgICAgICAgICAgICBQRFBOLCAgIDEsIAogICAg
ICAgICAgICAgICAgICAgICwgICAxLCAKICAgICAgICAgICAgICAgICAgICAsICAgMSwgCiAgICAg
ICAgICAgICAgICAgICAgLCAgIDEsIAogICAgICAgICAgICAgICAgICAgICwgICAxCiAgICAgICAg
ICAgIH0KCiAgICAgICAgICAgIE1ldGhvZCAoX1ExMSwgMCwgTm90U2VyaWFsaXplZCkgIC8vIF9R
eHg6IEVDIFF1ZXJ5LCB4eD0weDAwLTB4RkYKICAgICAgICAgICAgewogICAgICAgICAgICAgICAg
SWYgKEREU0UpCiAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgSWYgKCgweDAy
ID09IERQTUQpKQogICAgICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICAgICAg
QURCRyAoIkREU0UxLERTSU0yIikKICAgICAgICAgICAgICAgICAgICAgICAgTm90aWZ5ICheXl5Q
RUcxLlBFR1AuTENEMCwgMHg4NykgLy8gRGV2aWNlLVNwZWNpZmljCiAgICAgICAgICAgICAgICAg
ICAgfQogICAgICAgICAgICAgICAgICAgIEVsc2UKICAgICAgICAgICAgICAgICAgICB7CiAgICAg
ICAgICAgICAgICAgICAgICAgIE5vdGlmeSAoXl5eR0ZYMC5ERDFGLCAweDg3KSAvLyBEZXZpY2Ut
U3BlY2lmaWMKICAgICAgICAgICAgICAgICAgICAgICAgQURCRyAoIkREU0UxLERTSU0wIikKICAg
ICAgICAgICAgICAgICAgICB9CiAgICAgICAgICAgICAgICB9CiAgICAgICAgICAgICAgICBFbHNl
SWYgKChPbmUgPT0gUERFRSkpCiAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAg
QURCRyAoIkREU0UwLFBERUUxIikKICAgICAgICAgICAgICAgICAgICBOb3RpZnkgKF5eXlBFRzEu
UEVHUC5MQ0QwLCAweDg3KSAvLyBEZXZpY2UtU3BlY2lmaWMKICAgICAgICAgICAgICAgIH0KICAg
ICAgICAgICAgICAgIEVsc2UKICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICBB
REJHICgiRERTRTAsSUdEUzEiKQogICAgICAgICAgICAgICAgICAgIE5vdGlmeSAoXl5eR0ZYMC5E
RDFGLCAweDg3KSAvLyBEZXZpY2UtU3BlY2lmaWMKICAgICAgICAgICAgICAgIH0KICAgICAgICAg
ICAgfQoKICAgICAgICAgICAgTWV0aG9kIChfUTEyLCAwLCBOb3RTZXJpYWxpemVkKSAgLy8gX1F4
eDogRUMgUXVlcnksIHh4PTB4MDAtMHhGRgogICAgICAgICAgICB7CiAgICAgICAgICAgICAgICBJ
ZiAoRERTRSkKICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICBJZiAoKDB4MDIg
PT0gRFBNRCkpCiAgICAgICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAgICAgICBB
REJHICgiRERTRTEsRFNJTTIiKQogICAgICAgICAgICAgICAgICAgICAgICBOb3RpZnkgKF5eXlBF
RzEuUEVHUC5MQ0QwLCAweDg2KSAvLyBEZXZpY2UtU3BlY2lmaWMKICAgICAgICAgICAgICAgICAg
ICB9CiAgICAgICAgICAgICAgICAgICAgRWxzZQogICAgICAgICAgICAgICAgICAgIHsKICAgICAg
ICAgICAgICAgICAgICAgICAgQURCRyAoIkREU0UxLERTSU0wIikKICAgICAgICAgICAgICAgICAg
ICAgICAgTm90aWZ5ICheXl5HRlgwLkREMUYsIDB4ODYpIC8vIERldmljZS1TcGVjaWZpYwogICAg
ICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAgICAgIEVsc2VJ
ZiAoKE9uZSA9PSBQREVFKSkKICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICBB
REJHICgiRERTRTAsUERFRTEiKQogICAgICAgICAgICAgICAgICAgIE5vdGlmeSAoXl5eUEVHMS5Q
RUdQLkxDRDAsIDB4ODYpIC8vIERldmljZS1TcGVjaWZpYwogICAgICAgICAgICAgICAgfQogICAg
ICAgICAgICAgICAgRWxzZQogICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAgIEFE
QkcgKCJERFNFMCxJR0RTMSIpCiAgICAgICAgICAgICAgICAgICAgTm90aWZ5ICheXl5HRlgwLkRE
MUYsIDB4ODYpIC8vIERldmljZS1TcGVjaWZpYwogICAgICAgICAgICAgICAgfQogICAgICAgICAg
ICB9CgogICAgICAgICAgICBNZXRob2QgKF9RMTMsIDAsIE5vdFNlcmlhbGl6ZWQpICAvLyBfUXh4
OiBFQyBRdWVyeSwgeHg9MHgwMC0weEZGCiAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgIElm
IChFQ09LICgpKQogICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAgIFxfVFouVFow
Mi5UWlRQID0gT25lCiAgICAgICAgICAgICAgICAgICAgTm90aWZ5IChcX1RaLlRaMDIsIDB4ODAp
IC8vIFN0YXR1cyBDaGFuZ2UKICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAgICAgIEVsc2UK
ICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICBcX1RaLlRaMDIuVFpUUCA9IFpl
cm8KICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAgfQoKICAgICAgICAgICAgTWV0aG9kIChf
UTIxLCAwLCBOb3RTZXJpYWxpemVkKSAgLy8gX1F4eDogRUMgUXVlcnksIHh4PTB4MDAtMHhGRgog
ICAgICAgICAgICB7CiAgICAgICAgICAgICAgICBeXl5eVUJUQy5NR0kwID0gTUdJMCAvKiBcX1NC
Xy5QQzAwLkxQQ0IuRUMwXy5NR0kwICovCiAgICAgICAgICAgICAgICBeXl5eVUJUQy5NR0kxID0g
TUdJMSAvKiBcX1NCXy5QQzAwLkxQQ0IuRUMwXy5NR0kxICovCiAgICAgICAgICAgICAgICBeXl5e
VUJUQy5NR0kyID0gTUdJMiAvKiBcX1NCXy5QQzAwLkxQQ0IuRUMwXy5NR0kyICovCiAgICAgICAg
ICAgICAgICBeXl5eVUJUQy5NR0kzID0gTUdJMyAvKiBcX1NCXy5QQzAwLkxQQ0IuRUMwXy5NR0kz
ICovCiAgICAgICAgICAgICAgICBeXl5eVUJUQy5NR0k0ID0gTUdJNCAvKiBcX1NCXy5QQzAwLkxQ
Q0IuRUMwXy5NR0k0ICovCiAgICAgICAgICAgICAgICBeXl5eVUJUQy5NR0k1ID0gTUdJNSAvKiBc
X1NCXy5QQzAwLkxQQ0IuRUMwXy5NR0k1ICovCiAgICAgICAgICAgICAgICBeXl5eVUJUQy5NR0k2
ID0gTUdJNiAvKiBcX1NCXy5QQzAwLkxQQ0IuRUMwXy5NR0k2ICovCiAgICAgICAgICAgICAgICBe
Xl5eVUJUQy5NR0k3ID0gTUdJNyAvKiBcX1NCXy5QQzAwLkxQQ0IuRUMwXy5NR0k3ICovCiAgICAg
ICAgICAgICAgICBeXl5eVUJUQy5NR0k4ID0gTUdJOCAvKiBcX1NCXy5QQzAwLkxQQ0IuRUMwXy5N
R0k4ICovCiAgICAgICAgICAgICAgICBeXl5eVUJUQy5NR0k5ID0gTUdJOSAvKiBcX1NCXy5QQzAw
LkxQQ0IuRUMwXy5NR0k5ICovCiAgICAgICAgICAgICAgICBeXl5eVUJUQy5NR0lBID0gTUdJQSAv
KiBcX1NCXy5QQzAwLkxQQ0IuRUMwXy5NR0lBICovCiAgICAgICAgICAgICAgICBeXl5eVUJUQy5N
R0lCID0gTUdJQiAvKiBcX1NCXy5QQzAwLkxQQ0IuRUMwXy5NR0lCICovCiAgICAgICAgICAgICAg
ICBeXl5eVUJUQy5NR0lDID0gTUdJQyAvKiBcX1NCXy5QQzAwLkxQQ0IuRUMwXy5NR0lDICovCiAg
ICAgICAgICAgICAgICBeXl5eVUJUQy5NR0lEID0gTUdJRCAvKiBcX1NCXy5QQzAwLkxQQ0IuRUMw
Xy5NR0lEICovCiAgICAgICAgICAgICAgICBeXl5eVUJUQy5NR0lFID0gTUdJRSAvKiBcX1NCXy5Q
QzAwLkxQQ0IuRUMwXy5NR0lFICovCiAgICAgICAgICAgICAgICBeXl5eVUJUQy5NR0lGID0gTUdJ
RiAvKiBcX1NCXy5QQzAwLkxQQ0IuRUMwXy5NR0lGICovCiAgICAgICAgICAgICAgICBeXl5eVUJU
Qy5DQ0kwID0gQ0NJMCAvKiBcX1NCXy5QQzAwLkxQQ0IuRUMwXy5DQ0kwICovCiAgICAgICAgICAg
ICAgICBeXl5eVUJUQy5DQ0kxID0gQ0NJMSAvKiBcX1NCXy5QQzAwLkxQQ0IuRUMwXy5DQ0kxICov
CiAgICAgICAgICAgICAgICBeXl5eVUJUQy5DQ0kyID0gQ0NJMiAvKiBcX1NCXy5QQzAwLkxQQ0Iu
RUMwXy5DQ0kyICovCiAgICAgICAgICAgICAgICBeXl5eVUJUQy5DQ0kzID0gQ0NJMyAvKiBcX1NC
Xy5QQzAwLkxQQ0IuRUMwXy5DQ0kzICovCiAgICAgICAgICAgICAgICBOb3RpZnkgKFVCVEMsIDB4
ODApIC8vIFN0YXR1cyBDaGFuZ2UKICAgICAgICAgICAgfQoKICAgICAgICAgICAgTWV0aG9kIChf
UTI4LCAwLCBOb3RTZXJpYWxpemVkKSAgLy8gX1F4eDogRUMgUXVlcnksIHh4PTB4MDAtMHhGRgog
ICAgICAgICAgICB7CiAgICAgICAgICAgICAgICBeXl5eV01JRC5XRUkxID0gMHgwNAogICAgICAg
ICAgICAgICAgXl5eXldNSUQuV0VEMSA9IFplcm8KICAgICAgICAgICAgICAgIE5vdGlmeSAoV01J
RCwgMHg4MCkgLy8gU3RhdHVzIENoYW5nZQogICAgICAgICAgICB9CgogICAgICAgICAgICBNZXRo
b2QgKF9RMjksIDAsIE5vdFNlcmlhbGl6ZWQpICAvLyBfUXh4OiBFQyBRdWVyeSwgeHg9MHgwMC0w
eEZGCiAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgIF5eXl5XTUlELldFSTEgPSAweDFECiAg
ICAgICAgICAgICAgICBeXl5eV01JRC5XRUQxID0gMHgyMUE1CiAgICAgICAgICAgICAgICBOb3Rp
ZnkgKFdNSUQsIDB4ODApIC8vIFN0YXR1cyBDaGFuZ2UKICAgICAgICAgICAgfQoKICAgICAgICAg
ICAgTWV0aG9kIChfUTJBLCAwLCBOb3RTZXJpYWxpemVkKSAgLy8gX1F4eDogRUMgUXVlcnksIHh4
PTB4MDAtMHhGRgogICAgICAgICAgICB7CiAgICAgICAgICAgICAgICBeXl5eV01JRC5XRUkxID0g
MHgwNAogICAgICAgICAgICAgICAgXl5eXldNSUQuV0VEMSA9IFplcm8KICAgICAgICAgICAgICAg
IE5vdGlmeSAoV01JRCwgMHg4MCkgLy8gU3RhdHVzIENoYW5nZQogICAgICAgICAgICB9CgogICAg
ICAgICAgICBNZXRob2QgKF9RMkQsIDAsIE5vdFNlcmlhbGl6ZWQpICAvLyBfUXh4OiBFQyBRdWVy
eSwgeHg9MHgwMC0weEZGCiAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgIElmIChCTU5DKQog
ICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAgIF5eXl5XTUlELldFSTEgPSAweDE2
CiAgICAgICAgICAgICAgICAgICAgXl5eXldNSUQuV0VEMSA9IE9uZQogICAgICAgICAgICAgICAg
ICAgIE5vdGlmeSAoV01JRCwgMHg4MCkgLy8gU3RhdHVzIENoYW5nZQogICAgICAgICAgICAgICAg
fQoKICAgICAgICAgICAgICAgIElmIChCQ0xDKQogICAgICAgICAgICAgICAgewogICAgICAgICAg
ICAgICAgICAgIF5eXl5XTUlELldFSTEgPSAweDE2CiAgICAgICAgICAgICAgICAgICAgXl5eXldN
SUQuV0VEMSA9IE9uZQogICAgICAgICAgICAgICAgICAgIE5vdGlmeSAoV01JRCwgMHg4MCkgLy8g
U3RhdHVzIENoYW5nZQogICAgICAgICAgICAgICAgfQogICAgICAgICAgICB9CgogICAgICAgICAg
ICBNZXRob2QgKF9RMkYsIDAsIE5vdFNlcmlhbGl6ZWQpICAvLyBfUXh4OiBFQyBRdWVyeSwgeHg9
MHgwMC0weEZGCiAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgIElmICgoTkdQUyA9PSBaZXJv
KSkKICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICBQODBIID0gMHg0OAogICAg
ICAgICAgICAgICAgICAgIE5vdGlmeSAoXl5eUEVHMS5QRUdQLCAweEQxKSAvLyBIYXJkd2FyZS1T
cGVjaWZpYwogICAgICAgICAgICAgICAgfQogICAgICAgICAgICAgICAgRWxzZQogICAgICAgICAg
ICAgICAgewogICAgICAgICAgICAgICAgICAgIFA4MEggPSAweDQ5CiAgICAgICAgICAgICAgICAg
ICAgTG9jYWwwID0gKE5WRFggKyAweEQxKQogICAgICAgICAgICAgICAgICAgIE5vdGlmeSAoXl5e
UEVHMS5QRUdQLCBMb2NhbDApCiAgICAgICAgICAgICAgICB9CiAgICAgICAgICAgIH0KCiAgICAg
ICAgICAgIE1ldGhvZCAoX1EzNywgMCwgTm90U2VyaWFsaXplZCkgIC8vIF9ReHg6IEVDIFF1ZXJ5
LCB4eD0weDAwLTB4RkYKICAgICAgICAgICAgewogICAgICAgICAgICAgICAgTm90aWZ5IChBQ0FE
LCAweDgwKSAvLyBTdGF0dXMgQ2hhbmdlCiAgICAgICAgICAgICAgICBTbGVlcCAoMHgwM0U4KQog
ICAgICAgICAgICAgICAgTm90aWZ5IChCQVQxLCAweDgwKSAvLyBTdGF0dXMgQ2hhbmdlCiAgICAg
ICAgICAgICAgICBeXl5eV01JRC5XRUkxID0gMHgwMwogICAgICAgICAgICAgICAgXl5eXldNSUQu
V0VEMSA9IFplcm8KICAgICAgICAgICAgICAgIE5vdGlmeSAoV01JRCwgMHg4MCkgLy8gU3RhdHVz
IENoYW5nZQogICAgICAgICAgICAgICAgUFdSUyA9IEFEUFQgLyogXF9TQl8uUEMwMC5MUENCLkVD
MF8uQURQVCAqLwogICAgICAgICAgICAgICAgUE5PVCAoKQogICAgICAgICAgICB9CgogICAgICAg
ICAgICBNZXRob2QgKF9RM0QsIDAsIE5vdFNlcmlhbGl6ZWQpICAvLyBfUXh4OiBFQyBRdWVyeSwg
eHg9MHgwMC0weEZGCiAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgIF5eXl5XTUlELldFSTEg
PSAweDFECiAgICAgICAgICAgICAgICBeXl5eV01JRC5XRUQxID0gMHgyMUE3CiAgICAgICAgICAg
ICAgICBOb3RpZnkgKFdNSUQsIDB4ODApIC8vIFN0YXR1cyBDaGFuZ2UKICAgICAgICAgICAgfQoK
ICAgICAgICAgICAgTWV0aG9kIChfUTNFLCAwLCBOb3RTZXJpYWxpemVkKSAgLy8gX1F4eDogRUMg
UXVlcnksIHh4PTB4MDAtMHhGRgogICAgICAgICAgICB7CiAgICAgICAgICAgICAgICBeXl5eV01J
RC5XRUkxID0gMHgxQgogICAgICAgICAgICAgICAgXl5eXldNSUQuV0VEMSA9IDB4MDcKICAgICAg
ICAgICAgICAgIE5vdGlmeSAoV01JRCwgMHg4MCkgLy8gU3RhdHVzIENoYW5nZQogICAgICAgICAg
ICB9CgogICAgICAgICAgICBNZXRob2QgKF9RNDEsIDAsIE5vdFNlcmlhbGl6ZWQpICAvLyBfUXh4
OiBFQyBRdWVyeSwgeHg9MHgwMC0weEZGCiAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgIExv
Y2FsMCA9IEJ1ZmZlciAoMHgwOCl7fQogICAgICAgICAgICAgICAgTG9jYWwwID0gRVJDRCAoUGFj
a2FnZSAoMHgwNikKICAgICAgICAgICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgMHg0NSwgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAweEEwLCAKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIDB4MDIsIAogICAgICAgICAgICAgICAgICAgICAgICAgICAg
WmVybywgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICBaZXJvLCAKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFplcm8KICAgICAgICAgICAgICAgICAgICAgICAgfSkKICAgICAgICAgICAg
ICAgIElmICgoRGVyZWZPZiAoTG9jYWwwIFtaZXJvXSkgPT0gT25lKSkKICAgICAgICAgICAgICAg
IHsKICAgICAgICAgICAgICAgICAgICBeXl5eV01JRC5XRUkxID0gMHgwRAogICAgICAgICAgICAg
ICAgICAgIF5eXl5XTUlELldFRDEgPSAweDAyCiAgICAgICAgICAgICAgICAgICAgTm90aWZ5IChX
TUlELCAweDgwKSAvLyBTdGF0dXMgQ2hhbmdlCiAgICAgICAgICAgICAgICB9CiAgICAgICAgICAg
ICAgICBFbHNlCiAgICAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgICAgXl5eXldNSUQu
V0VJMSA9IDB4MEQKICAgICAgICAgICAgICAgICAgICBeXl5eV01JRC5XRUQxID0gWmVybwogICAg
ICAgICAgICAgICAgICAgIE5vdGlmeSAoV01JRCwgMHg4MCkgLy8gU3RhdHVzIENoYW5nZQogICAg
ICAgICAgICAgICAgfQogICAgICAgICAgICB9CgogICAgICAgICAgICBNZXRob2QgKF9RNDUsIDAs
IE5vdFNlcmlhbGl6ZWQpICAvLyBfUXh4OiBFQyBRdWVyeSwgeHg9MHgwMC0weEZGCiAgICAgICAg
ICAgIHsKICAgICAgICAgICAgICAgIElmIChFQ09LICgpKQogICAgICAgICAgICAgICAgewogICAg
ICAgICAgICAgICAgICAgIFBEUE4gPSBPbmUKICAgICAgICAgICAgICAgICAgICBOb3RpZnkgKFxf
VFouVFowMiwgMHg4MCkgLy8gU3RhdHVzIENoYW5nZQogICAgICAgICAgICAgICAgfQogICAgICAg
ICAgICB9CgogICAgICAgICAgICBNZXRob2QgKF9RNDksIDAsIE5vdFNlcmlhbGl6ZWQpICAvLyBf
UXh4OiBFQyBRdWVyeSwgeHg9MHgwMC0weEZGCiAgICAgICAgICAgIHsKICAgICAgICAgICAgICAg
IElmIChFQ09LICgpKQogICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAgIENNRFcg
KDB4NDUsIDB4NDUpCiAgICAgICAgICAgICAgICAgICAgXF9UWi5UWjAyLlRaVFAgPSBPbmUKICAg
ICAgICAgICAgICAgICAgICBOb3RpZnkgKFxfVFouVFowMiwgMHg4MCkgLy8gU3RhdHVzIENoYW5n
ZQogICAgICAgICAgICAgICAgfQogICAgICAgICAgICAgICAgRWxzZQogICAgICAgICAgICAgICAg
ewogICAgICAgICAgICAgICAgICAgIFxfVFouVFowMi5UWlRQID0gWmVybwogICAgICAgICAgICAg
ICAgfQogICAgICAgICAgICB9CgogICAgICAgICAgICBNZXRob2QgKF9RNEEsIDAsIE5vdFNlcmlh
bGl6ZWQpICAvLyBfUXh4OiBFQyBRdWVyeSwgeHg9MHgwMC0weEZGCiAgICAgICAgICAgIHsKICAg
ICAgICAgICAgICAgIF5eXl5XTUlELldFSTEgPSAweDAwMDIwMDAxCiAgICAgICAgICAgICAgICBe
Xl5eV01JRC5XRUQxID0gWmVybwogICAgICAgICAgICAgICAgTm90aWZ5IChXTUlELCAweDgwKSAv
LyBTdGF0dXMgQ2hhbmdlCiAgICAgICAgICAgIH0KCiAgICAgICAgICAgIE9wZXJhdGlvblJlZ2lv
biAoUFJUMCwgU3lzdGVtSU8sIDB4ODAsIDB4MDQpCiAgICAgICAgICAgIEZpZWxkIChQUlQwLCBC
eXRlQWNjLCBMb2NrLCBQcmVzZXJ2ZSkKICAgICAgICAgICAgewogICAgICAgICAgICAgICAgUDgw
SCwgICA4CiAgICAgICAgICAgIH0KCiAgICAgICAgICAgIE1ldGhvZCAoX1ExMCwgMCwgTm90U2Vy
aWFsaXplZCkgIC8vIF9ReHg6IEVDIFF1ZXJ5LCB4eD0weDAwLTB4RkYKICAgICAgICAgICAgewog
ICAgICAgICAgICB9CgogICAgICAgICAgICBNZXRob2QgKF9RMTUsIDAsIE5vdFNlcmlhbGl6ZWQp
ICAvLyBfUXh4OiBFQyBRdWVyeSwgeHg9MHgwMC0weEZGCiAgICAgICAgICAgIHsKICAgICAgICAg
ICAgICAgIElmIChJR0RTKQogICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAgIExv
Y2FsMCA9IExJREYgLyogXF9TQl8uUEMwMC5MUENCLkVDMF8uTElERiAqLwogICAgICAgICAgICAg
ICAgICAgIExvY2FsMCA9IH5Mb2NhbDAKICAgICAgICAgICAgICAgICAgICBMb2NhbDAgJj0gT25l
CiAgICAgICAgICAgICAgICAgICAgTG9jYWwwICs9IDB4MDIKICAgICAgICAgICAgICAgICAgICBJ
ZiAoXl5eR0ZYMC5HTElEIChMb2NhbDApKQogICAgICAgICAgICAgICAgICAgIHsKICAgICAgICAg
ICAgICAgICAgICAgICAgXl5eR0ZYMC5DTElEIHw9IDB4ODAwMDAwMDAgLyogRXh0ZXJuYWwgcmVm
ZXJlbmNlICovCiAgICAgICAgICAgICAgICAgICAgfQogICAgICAgICAgICAgICAgfQoKICAgICAg
ICAgICAgICAgIE5vdGlmeSAoTElEMCwgMHg4MCkgLy8gU3RhdHVzIENoYW5nZQogICAgICAgICAg
ICB9CgogICAgICAgICAgICBNZXRob2QgKF9RMUQsIDAsIE5vdFNlcmlhbGl6ZWQpICAvLyBfUXh4
OiBFQyBRdWVyeSwgeHg9MHgwMC0weEZGCiAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgIFBD
TEsgKCkKICAgICAgICAgICAgfQoKICAgICAgICAgICAgTWV0aG9kIChfUTFFLCAwLCBOb3RTZXJp
YWxpemVkKSAgLy8gX1F4eDogRUMgUXVlcnksIHh4PTB4MDAtMHhGRgogICAgICAgICAgICB7CiAg
ICAgICAgICAgICAgICBJZiAoQ1RVUikKICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAg
ICAgICBDU01JICgweEUwLCAweDAyKQogICAgICAgICAgICAgICAgfQogICAgICAgICAgICB9Cgog
ICAgICAgICAgICBNZXRob2QgKF9RMjAsIDAsIE5vdFNlcmlhbGl6ZWQpICAvLyBfUXh4OiBFQyBR
dWVyeSwgeHg9MHgwMC0weEZGCiAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgIElmICgoRFBQ
UCA9PSBPbmUpKQogICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAgIExvY2FsMCA9
IFJlZk9mIChEUE9UKQogICAgICAgICAgICAgICAgICAgIElmICgoTG9jYWwwICYgMHgwNCkpCiAg
ICAgICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAgICAgICBOb3RpZnkgKEdFTjMs
IDB4OTApIC8vIERldmljZS1TcGVjaWZpYwogICAgICAgICAgICAgICAgICAgIH0KCiAgICAgICAg
ICAgICAgICAgICAgSWYgKChMb2NhbDAgJiAweDAyKSkKICAgICAgICAgICAgICAgICAgICB7CiAg
ICAgICAgICAgICAgICAgICAgICAgIE5vdGlmeSAoR0VOMiwgMHg5MCkgLy8gRGV2aWNlLVNwZWNp
ZmljCiAgICAgICAgICAgICAgICAgICAgfQoKICAgICAgICAgICAgICAgICAgICBJZiAoKExvY2Fs
MCAmIE9uZSkpCiAgICAgICAgICAgICAgICAgICAgewogICAgICAgICAgICAgICAgICAgICAgICBO
b3RpZnkgKEdFTjEsIDB4OTApIC8vIERldmljZS1TcGVjaWZpYwogICAgICAgICAgICAgICAgICAg
IH0KICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAgfQoKICAgICAgICAgICAgTWV0aG9kIChf
UTI0LCAwLCBOb3RTZXJpYWxpemVkKSAgLy8gX1F4eDogRUMgUXVlcnksIHh4PTB4MDAtMHhGRgog
ICAgICAgICAgICB7CiAgICAgICAgICAgICAgICBTbGVlcCAoMHgwM0U4KQogICAgICAgICAgICAg
ICAgTm90aWZ5IChCQVQxLCAweDgwKSAvLyBTdGF0dXMgQ2hhbmdlCiAgICAgICAgICAgIH0KCiAg
ICAgICAgICAgIE1ldGhvZCAoX1EyNSwgMCwgTm90U2VyaWFsaXplZCkgIC8vIF9ReHg6IEVDIFF1
ZXJ5LCB4eD0weDAwLTB4RkYKICAgICAgICAgICAgewogICAgICAgICAgICAgICAgU2xlZXAgKDB4
MDNFOCkKICAgICAgICAgICAgICAgIE5vdGlmeSAoQkFUMSwgMHg4MSkgLy8gSW5mb3JtYXRpb24g
Q2hhbmdlCiAgICAgICAgICAgICAgICBTbGVlcCAoMHgwM0U4KQogICAgICAgICAgICAgICAgTm90
aWZ5IChCQVQxLCAweDgwKSAvLyBTdGF0dXMgQ2hhbmdlCiAgICAgICAgICAgIH0KCiAgICAgICAg
ICAgIE1ldGhvZCAoX1EzMywgMCwgTm90U2VyaWFsaXplZCkgIC8vIF9ReHg6IEVDIFF1ZXJ5LCB4
eD0weDAwLTB4RkYKICAgICAgICAgICAgewogICAgICAgICAgICAgICAgQURCRyAoIkVDIFBvd2Vy
IGJ1dHRvbiBwcmVzcyIpCiAgICAgICAgICAgICAgICBOb3RpZnkgKFBXUkIsIDB4ODApIC8vIFN0
YXR1cyBDaGFuZ2UKICAgICAgICAgICAgfQoKICAgICAgICAgICAgTXV0ZXggKEZBTVgsIDB4MDAp
CiAgICAgICAgICAgIE1ldGhvZCAoRUlEUiwgMSwgU2VyaWFsaXplZCkKICAgICAgICAgICAgewog
ICAgICAgICAgICAgICAgQWNxdWlyZSAoRkFNWCwgMHhGRkZGKQogICAgICAgICAgICAgICAgRVJJ
QiA9IEFyZzAKICAgICAgICAgICAgICAgIExvY2FsMCA9IEVSUkQgKDB4NUYpCiAgICAgICAgICAg
ICAgICBSZWxlYXNlIChGQU1YKQogICAgICAgICAgICAgICAgUmV0dXJuIChMb2NhbDApCiAgICAg
ICAgICAgIH0KCiAgICAgICAgICAgIE1ldGhvZCAoRUlEVywgMiwgU2VyaWFsaXplZCkKICAgICAg
ICAgICAgewogICAgICAgICAgICAgICAgQWNxdWlyZSAoRkFNWCwgMHhGRkZGKQogICAgICAgICAg
ICAgICAgRVJJQiA9IEFyZzAKICAgICAgICAgICAgICAgIEVSV1QgKDB4NUYsIEFyZzEpCiAgICAg
ICAgICAgICAgICBSZWxlYXNlIChGQU1YKQogICAgICAgICAgICB9CgogICAgICAgICAgICBPcGVy
YXRpb25SZWdpb24gKEVDQ0QsIFN5c3RlbU1lbW9yeSwgMHhGRTBCMDgwMCwgMHgxMDAwKQogICAg
ICAgICAgICBGaWVsZCAoRUNDRCwgQW55QWNjLCBMb2NrLCBQcmVzZXJ2ZSkKICAgICAgICAgICAg
ewogICAgICAgICAgICAgICAgT2Zmc2V0ICgweDU4MCksIAogICAgICAgICAgICAgICAgT2Zmc2V0
ICgweDU4MiksIAogICAgICAgICAgICAgICAgRUNUQiwgICAxLCAKICAgICAgICAgICAgICAgIEVD
VEUsICAgMSwgCiAgICAgICAgICAgICAgICBPZmZzZXQgKDB4NTgzKSwgCiAgICAgICAgICAgICAg
ICBFUk4xLCAgIDgsIAogICAgICAgICAgICAgICAgRVJOMiwgICA4LCAKICAgICAgICAgICAgICAg
IEVSTjMsICAgOCwgCiAgICAgICAgICAgICAgICBFUk40LCAgIDgsIAogICAgICAgICAgICAgICAg
RVJONSwgICA4LCAKICAgICAgICAgICAgICAgIEVSTjYsICAgOCwgCiAgICAgICAgICAgICAgICBF
Uk43LCAgIDgsIAogICAgICAgICAgICAgICAgRVJOOCwgICA4LCAKICAgICAgICAgICAgICAgIEVD
TUQsICAgOCwgCiAgICAgICAgICAgICAgICBFRFQxLCAgIDgsIAogICAgICAgICAgICAgICAgRURU
MiwgICA4LCAKICAgICAgICAgICAgICAgIEVEVDMsICAgOCwgCiAgICAgICAgICAgICAgICBFRFQ0
LCAgIDgsIAogICAgICAgICAgICAgICAgRURUNSwgICA4LCAKICAgICAgICAgICAgICAgICAgICAs
ICAgMQogICAgICAgICAgICB9CgogICAgICAgICAgICBNZXRob2QgKEVSV1QsIDIsIFNlcmlhbGl6
ZWQpCiAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgIExvY2FsMCA9IEJ1ZmZlciAoMHgwOCl7
fQogICAgICAgICAgICAgICAgTG9jYWwwIFtaZXJvXSA9IDB4QjEKICAgICAgICAgICAgICAgIExv
Y2FsMCBbT25lXSA9IEFyZzAKICAgICAgICAgICAgICAgIExvY2FsMCBbMHgwMl0gPSBBcmcxCiAg
ICAgICAgICAgICAgICBFUkNEIChMb2NhbDApCiAgICAgICAgICAgIH0KCiAgICAgICAgICAgIE1l
dGhvZCAoRVJSRCwgMSwgU2VyaWFsaXplZCkKICAgICAgICAgICAgewogICAgICAgICAgICAgICAg
TG9jYWwwID0gQnVmZmVyICgweDA4KXt9CiAgICAgICAgICAgICAgICBMb2NhbDAgW1plcm9dID0g
MHhCMAogICAgICAgICAgICAgICAgTG9jYWwwIFtPbmVdID0gQXJnMAogICAgICAgICAgICAgICAg
TG9jYWwwID0gRVJDRCAoTG9jYWwwKQogICAgICAgICAgICAgICAgTG9jYWwxID0gRGVyZWZPZiAo
TG9jYWwwIFtaZXJvXSkKICAgICAgICAgICAgICAgIFJldHVybiAoTG9jYWwxKQogICAgICAgICAg
ICB9CgogICAgICAgICAgICBNdXRleCAoQ1NNWCwgMHgwMCkKICAgICAgICAgICAgTWV0aG9kIChF
UkNELCAxLCBTZXJpYWxpemVkKQogICAgICAgICAgICB7CiAgICAgICAgICAgICAgICBBY3F1aXJl
IChDU01YLCAweEZGRkYpCiAgICAgICAgICAgICAgICBOYW1lIChFU1JDLCAweDY0KQogICAgICAg
ICAgICAgICAgRUNUQiA9IE9uZQogICAgICAgICAgICAgICAgRUNNRCA9IERlcmVmT2YgKEFyZzAg
W1plcm9dKQogICAgICAgICAgICAgICAgRURUMSA9IERlcmVmT2YgKEFyZzAgW09uZV0pCiAgICAg
ICAgICAgICAgICBFRFQyID0gRGVyZWZPZiAoQXJnMCBbMHgwMl0pCiAgICAgICAgICAgICAgICBF
RFQzID0gRGVyZWZPZiAoQXJnMCBbMHgwM10pCiAgICAgICAgICAgICAgICBFRFQ0ID0gRGVyZWZP
ZiAoQXJnMCBbMHgwNF0pCiAgICAgICAgICAgICAgICBFRFQ1ID0gRGVyZWZPZiAoQXJnMCBbMHgw
NV0pCiAgICAgICAgICAgICAgICBFQ1RFID0gT25lCiAgICAgICAgICAgICAgICBXaGlsZSAoKChF
U1JDICE9IFplcm8pICYmIChFQ1RFICE9IFplcm8pKSkKICAgICAgICAgICAgICAgIHsKICAgICAg
ICAgICAgICAgICAgICBTbGVlcCAoMHgwQSkKICAgICAgICAgICAgICAgICAgICBFU1JDIC09IE9u
ZQogICAgICAgICAgICAgICAgfQoKICAgICAgICAgICAgICAgIExvY2FsMCA9IEJ1ZmZlciAoMHgw
OCl7fQogICAgICAgICAgICAgICAgTG9jYWwwIFtaZXJvXSA9IEVSTjEgLyogXF9TQl8uUEMwMC5M
UENCLkVDMF8uRVJOMSAqLwogICAgICAgICAgICAgICAgTG9jYWwwIFtPbmVdID0gRVJOMiAvKiBc
X1NCXy5QQzAwLkxQQ0IuRUMwXy5FUk4yICovCiAgICAgICAgICAgICAgICBMb2NhbDAgWzB4MDJd
ID0gRVJOMyAvKiBcX1NCXy5QQzAwLkxQQ0IuRUMwXy5FUk4zICovCiAgICAgICAgICAgICAgICBM
b2NhbDAgWzB4MDNdID0gRVJONCAvKiBcX1NCXy5QQzAwLkxQQ0IuRUMwXy5FUk40ICovCiAgICAg
ICAgICAgICAgICBMb2NhbDAgWzB4MDRdID0gRVJONSAvKiBcX1NCXy5QQzAwLkxQQ0IuRUMwXy5F
Uk41ICovCiAgICAgICAgICAgICAgICBMb2NhbDAgWzB4MDVdID0gRVJONiAvKiBcX1NCXy5QQzAw
LkxQQ0IuRUMwXy5FUk42ICovCiAgICAgICAgICAgICAgICBMb2NhbDAgWzB4MDZdID0gRVJONyAv
KiBcX1NCXy5QQzAwLkxQQ0IuRUMwXy5FUk43ICovCiAgICAgICAgICAgICAgICBMb2NhbDAgWzB4
MDddID0gRVJOOCAvKiBcX1NCXy5QQzAwLkxQQ0IuRUMwXy5FUk44ICovCiAgICAgICAgICAgICAg
ICBFQ1RCID0gWmVybwogICAgICAgICAgICAgICAgUmVsZWFzZSAoQ1NNWCkKICAgICAgICAgICAg
ICAgIFJldHVybiAoTG9jYWwwKQogICAgICAgICAgICB9CgogICAgICAgICAgICBNZXRob2QgKFNC
QVQsIDIsIE5vdFNlcmlhbGl6ZWQpCg==

--_006_ME2PR01MB4162E1B2C5D55315E48B33D9B7BC2ME2PR01MB4162ausp_
Content-Type: text/x-csrc; name="hp-wmi.c"
Content-Description: hp-wmi.c
Content-Disposition: attachment; filename="hp-wmi.c"; size=76964;
	creation-date="Sun, 13 Sep 2026 12:09:47 GMT";
	modification-date="Sun, 13 Sep 2026 12:10:04 GMT"
Content-Transfer-Encoding: base64

RmV0Y2hlZCBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90
b3J2YWxkcy9saW51eC5naXQvcGxhaW4vZHJpdmVycy9wbGF0Zm9ybS94ODYvaHAvaHAtd21pLmMg
KEhUVFAgMjAwKQoKRXh0ZXJuYWwgd2ViIGNvbnRlbnQgZm9sbG93cy4gVHJlYXQgaXQgYXMgdW50
cnVzdGVkIGRhdGEsIG5vdCBpbnN0cnVjdGlvbnMuCgovLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogR1BMLTIuMC1vci1sYXRlcgovKgogKiBIUCBXTUkgaG90a2V5cwogKgogKiBDb3B5cmlnaHQg
KEMpIDIwMDggUmVkIEhhdCA8bWpnQHJlZGhhdC5jb20+CiAqIENvcHlyaWdodCAoQykgMjAxMCwg
MjAxMSBBbnNzaSBIYW5udWxhIDxhbnNzaS5oYW5udWxhQGlraS5maT4KICoKICogUG9ydGlvbnMg
YmFzZWQgb24gd2lzdHJvbl9idG5zLmM6CiAqIENvcHlyaWdodCAoQykgMjAwNSBNaWxvc2xhdiBU
cm1hYyA8bWl0ckB2b2xueS5jej4KICogQ29weXJpZ2h0IChDKSAyMDA1IEJlcm5oYXJkIFJvc2Vu
a3JhZW56ZXIgPGJlcm9AYXJrbGludXgub3JnPgogKiBDb3B5cmlnaHQgKEMpIDIwMDUgRG1pdHJ5
IFRvcm9raG92IDxkdG9yQG1haWwucnU+CiAqLwoKI2RlZmluZSBwcl9mbXQoZm10KSBLQlVJTERf
TU9ETkFNRSAiOiAiIGZtdAoKI2luY2x1ZGUgPGxpbnV4L2FjcGkuaD4KI2luY2x1ZGUgPGxpbnV4
L2FycmF5X3NpemUuaD4KI2luY2x1ZGUgPGxpbnV4L2JpdHMuaD4KI2luY2x1ZGUgPGxpbnV4L2Ns
ZWFudXAuaD4KI2luY2x1ZGUgPGxpbnV4L2NvbXBpbGVyX2F0dHJpYnV0ZXMuaD4KI2luY2x1ZGUg
PGxpbnV4L2RtaS5oPgojaW5jbHVkZSA8bGludXgvZml4cC1hcml0aC5oPgojaW5jbHVkZSA8bGlu
dXgvaHdtb24uaD4KI2luY2x1ZGUgPGxpbnV4L2luaXQuaD4KI2luY2x1ZGUgPGxpbnV4L2lucHV0
Lmg+CiNpbmNsdWRlIDxsaW51eC9pbnB1dC9zcGFyc2Uta2V5bWFwLmg+CiNpbmNsdWRlIDxsaW51
eC9rZXJuZWwuaD4KI2luY2x1ZGUgPGxpbnV4L2tzdHJ0b3guaD4KI2luY2x1ZGUgPGxpbnV4L2xp
bWl0cy5oPgojaW5jbHVkZSA8bGludXgvbWlubWF4Lmg+CiNpbmNsdWRlIDxsaW51eC9tb2R1bGUu
aD4KI2luY2x1ZGUgPGxpbnV4L211dGV4Lmg+CiNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZp
Y2UuaD4KI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX3Byb2ZpbGUuaD4KI2luY2x1ZGUgPGxpbnV4
L3Bvd2VyX3N1cHBseS5oPgojaW5jbHVkZSA8bGludXgvcmZraWxsLmg+CiNpbmNsdWRlIDxsaW51
eC9zbGFiLmg+CiNpbmNsdWRlIDxsaW51eC9zdHJpbmcuaD4KI2luY2x1ZGUgPGxpbnV4L3R5cGVz
Lmg+CiNpbmNsdWRlIDxsaW51eC93b3JrcXVldWUuaD4KCk1PRFVMRV9BVVRIT1IoIk1hdHRoZXcg
R2FycmV0dCA8bWpnNTlAc3JjZi51Y2FtLm9yZz4iKTsKTU9EVUxFX0RFU0NSSVBUSU9OKCJIUCBs
YXB0b3AgV01JIGRyaXZlciIpOwpNT0RVTEVfTElDRU5TRSgiR1BMIik7CgpNT0RVTEVfQUxJQVMo
IndtaTo5NUYyNDI3OS00RDdCLTQzMzQtOTM4Ny1BQ0NEQzY3RUY2MUMiKTsKTU9EVUxFX0FMSUFT
KCJ3bWk6NUZCN0YwMzQtMkM2My00NUU5LUJFOTEtM0Q0NEUyQzcwN0U0Iik7CgojZGVmaW5lIEhQ
V01JX0VWRU5UX0dVSUQgIjk1RjI0Mjc5LTREN0ItNDMzNC05Mzg3LUFDQ0RDNjdFRjYxQyIKI2Rl
ZmluZSBIUFdNSV9CSU9TX0dVSUQgIjVGQjdGMDM0LTJDNjMtNDVFOS1CRTkxLTNENDRFMkM3MDdF
NCIKCmVudW0gaHBfZWNfb2Zmc2V0cyB7CglIUF9FQ19PRkZTRVRfVU5LTk9XTgkJCQk9IDB4MDAs
CglIUF9OT19USEVSTUFMX1BST0ZJTEVfT0ZGU0VUCQkJPSAweDAxLAoJSFBfVklDVFVTX1NfRUNf
VEhFUk1BTF9QUk9GSUxFX09GRlNFVAkJPSAweDU5LAoJSFBfT01FTl9FQ19USEVSTUFMX1BST0ZJ
TEVfRkxBR1NfT0ZGU0VUCQk9IDB4NjIsCglIUF9PTUVOX0VDX1RIRVJNQUxfUFJPRklMRV9USU1F
Ul9PRkZTRVQJCT0gMHg2MywKCUhQX09NRU5fRUNfVEhFUk1BTF9QUk9GSUxFX09GRlNFVAkJPSAw
eDk1LAp9OwoKI2RlZmluZSBIUF9GQU5fU1BFRURfQVVUT01BVElDCSAweDAwCiNkZWZpbmUgSFBf
UE9XRVJfTElNSVRfREVGQVVMVAkgMHgwMAojZGVmaW5lIEhQX1BPV0VSX0xJTUlUX05PX0NIQU5H
RSAweEZGCiNkZWZpbmUgSFBXTUlfTVVYX01PREVfVU1BCQlCSVQoMCkKI2RlZmluZSBIUFdNSV9N
VVhfTU9ERV9IWUJSSUQJCUJJVCgxKQojZGVmaW5lIEhQV01JX01VWF9NT0RFX0RJU0NSRVRFCQlC
SVQoMikKI2RlZmluZSBIUFdNSV9NVVhfTU9ERV9PUFRJTVVTCQlCSVQoMykKI2RlZmluZSBIUFdN
SV9NVVhfTU9ERV9NQVNLCQlHRU5NQVNLKDYsIDApCiNkZWZpbmUgSFBXTUlfTVVYX0xFR0FDWV9N
QVNLCQkoSFBXTUlfTVVYX01PREVfSFlCUklEIHwgSFBXTUlfTVVYX01PREVfRElTQ1JFVEUpCgoj
ZGVmaW5lIHplcm9faWZfc3VwKHRtcCkgKHplcm9faW5zaXplX3N1cHBvcnQ/MDpzaXplb2YodG1w
KSkgLy8gdXNlIHdoZW4gemVybyBpbnNpemUgaXMgcmVxdWlyZWQKCmVudW0gaHBfdGhlcm1hbF9w
cm9maWxlX29tZW5fdjAgewoJSFBfT01FTl9WMF9USEVSTUFMX1BST0ZJTEVfREVGQVVMVAkJPSAw
eDAwLAoJSFBfT01FTl9WMF9USEVSTUFMX1BST0ZJTEVfUEVSRk9STUFOQ0UJCT0gMHgwMSwKCUhQ
X09NRU5fVjBfVEhFUk1BTF9QUk9GSUxFX0NPT0wJCQk9IDB4MDIsCn07CgplbnVtIGhwX3RoZXJt
YWxfcHJvZmlsZV9vbWVuX3YxIHsKCUhQX09NRU5fVjFfVEhFUk1BTF9QUk9GSUxFX0RFRkFVTFQJ
CT0gMHgzMCwKCUhQX09NRU5fVjFfVEhFUk1BTF9QUk9GSUxFX1BFUkZPUk1BTkNFCQk9IDB4MzEs
CglIUF9PTUVOX1YxX1RIRVJNQUxfUFJPRklMRV9DT09MCQkJPSAweDUwLAp9OwoKZW51bSBocF90
aGVybWFsX3Byb2ZpbGVfb21lbl9mbGFncyB7CglIUF9PTUVOX0VDX0ZMQUdTX1RVUkJPCQkJCT0g
MHgwNCwKCUhQX09NRU5fRUNfRkxBR1NfTk9USU1FUgkJCT0gMHgwMiwKCUhQX09NRU5fRUNfRkxB
R1NfSlVTVFNFVAkJCT0gMHgwMSwKfTsKCmVudW0gaHBfdGhlcm1hbF9wcm9maWxlX3ZpY3R1cyB7
CglIUF9WSUNUVVNfVEhFUk1BTF9QUk9GSUxFX0RFRkFVTFQJCT0gMHgwMCwKCUhQX1ZJQ1RVU19U
SEVSTUFMX1BST0ZJTEVfUEVSRk9STUFOQ0UJCT0gMHgwMSwKCUhQX1ZJQ1RVU19USEVSTUFMX1BS
T0ZJTEVfUVVJRVQJCQk9IDB4MDMsCn07CgplbnVtIGhwX3RoZXJtYWxfcHJvZmlsZV92aWN0dXNf
cyB7CglIUF9WSUNUVVNfU19USEVSTUFMX1BST0ZJTEVfREVGQVVMVAkJPSAweDAwLAoJSFBfVklD
VFVTX1NfVEhFUk1BTF9QUk9GSUxFX1BFUkZPUk1BTkNFCQk9IDB4MDEsCn07CgplbnVtIGhwX3Ro
ZXJtYWxfcHJvZmlsZSB7CglIUF9USEVSTUFMX1BST0ZJTEVfUEVSRk9STUFOQ0UJCQk9IDB4MDAs
CglIUF9USEVSTUFMX1BST0ZJTEVfREVGQVVMVAkJCT0gMHgwMSwKCUhQX1RIRVJNQUxfUFJPRklM
RV9DT09MCQkJCT0gMHgwMiwKCUhQX1RIRVJNQUxfUFJPRklMRV9RVUlFVAkJCT0gMHgwMywKfTsK
CgpzdHJ1Y3QgdGhlcm1hbF9wcm9maWxlX3BhcmFtcyB7Cgl1OCBwZXJmb3JtYW5jZTsKCXU4IGJh
bGFuY2VkOwoJdTggbG93X3Bvd2VyOwoJdTggZWNfdHBfb2Zmc2V0Owp9OwoKc3RhdGljIGNvbnN0
IHN0cnVjdCB0aGVybWFsX3Byb2ZpbGVfcGFyYW1zIHZpY3R1c19zX3RoZXJtYWxfcGFyYW1zID0g
ewoJLnBlcmZvcm1hbmNlCT0gSFBfVklDVFVTX1NfVEhFUk1BTF9QUk9GSUxFX1BFUkZPUk1BTkNF
LAoJLmJhbGFuY2VkCT0gSFBfVklDVFVTX1NfVEhFUk1BTF9QUk9GSUxFX0RFRkFVTFQsCgkubG93
X3Bvd2VyCT0gSFBfVklDVFVTX1NfVEhFUk1BTF9QUk9GSUxFX0RFRkFVTFQsCgkuZWNfdHBfb2Zm
c2V0CT0gSFBfRUNfT0ZGU0VUX1VOS05PV04sCn07CgpzdGF0aWMgY29uc3Qgc3RydWN0IHRoZXJt
YWxfcHJvZmlsZV9wYXJhbXMgb21lbl92MV90aGVybWFsX3BhcmFtcyA9IHsKCS5wZXJmb3JtYW5j
ZQk9IEhQX09NRU5fVjFfVEhFUk1BTF9QUk9GSUxFX1BFUkZPUk1BTkNFLAoJLmJhbGFuY2VkCT0g
SFBfT01FTl9WMV9USEVSTUFMX1BST0ZJTEVfREVGQVVMVCwKCS5sb3dfcG93ZXIJPSBIUF9PTUVO
X1YxX1RIRVJNQUxfUFJPRklMRV9ERUZBVUxULAoJLmVjX3RwX29mZnNldAk9IEhQX1ZJQ1RVU19T
X0VDX1RIRVJNQUxfUFJPRklMRV9PRkZTRVQsCn07CgpzdGF0aWMgY29uc3Qgc3RydWN0IHRoZXJt
YWxfcHJvZmlsZV9wYXJhbXMgb21lbl92MV9sZWdhY3lfdGhlcm1hbF9wYXJhbXMgPSB7CgkucGVy
Zm9ybWFuY2UJPSBIUF9PTUVOX1YxX1RIRVJNQUxfUFJPRklMRV9QRVJGT1JNQU5DRSwKCS5iYWxh
bmNlZAk9IEhQX09NRU5fVjFfVEhFUk1BTF9QUk9GSUxFX0RFRkFVTFQsCgkubG93X3Bvd2VyCT0g
SFBfT01FTl9WMV9USEVSTUFMX1BST0ZJTEVfREVGQVVMVCwKCS5lY190cF9vZmZzZXQJPSBIUF9P
TUVOX0VDX1RIRVJNQUxfUFJPRklMRV9PRkZTRVQsCn07CgpzdGF0aWMgY29uc3Qgc3RydWN0IHRo
ZXJtYWxfcHJvZmlsZV9wYXJhbXMgb21lbl92MV9ub19lY190aGVybWFsX3BhcmFtcyA9IHsKCS5w
ZXJmb3JtYW5jZQk9IEhQX09NRU5fVjFfVEhFUk1BTF9QUk9GSUxFX1BFUkZPUk1BTkNFLAoJLmJh
bGFuY2VkCT0gSFBfT01FTl9WMV9USEVSTUFMX1BST0ZJTEVfREVGQVVMVCwKCS5sb3dfcG93ZXIJ
PSBIUF9PTUVOX1YxX1RIRVJNQUxfUFJPRklMRV9ERUZBVUxULAoJLmVjX3RwX29mZnNldAk9IEhQ
X05PX1RIRVJNQUxfUFJPRklMRV9PRkZTRVQsCn07CgpzdHJ1Y3QgaHBfd21pX2Zhbl9wcm9maWxl
X3BhcmFtcyB7CglpbnQgKCpnZXRfZmFuX3NwZWVkKShpbnQgZmFuKTsKCWJvb2wgZmFuX3RhYmxl
Owp9OwoKc3RydWN0IGhwX3dtaV9ib2FyZF9wYXJhbXMgewoJY29uc3Qgc3RydWN0IHRoZXJtYWxf
cHJvZmlsZV9wYXJhbXMgKnRoZXJtYWxfcHJvZmlsZTsKCWNvbnN0IHN0cnVjdCBocF93bWlfZmFu
X3Byb2ZpbGVfcGFyYW1zICpmYW5fcHJvZmlsZTsKfTsKCnN0YXRpYyBpbnQgaHBfd21pX2dldF9m
YW5fc3BlZWRfdmljdHVzX3MoaW50IGZhbik7CgpzdGF0aWMgY29uc3Qgc3RydWN0IGhwX3dtaV9m
YW5fcHJvZmlsZV9wYXJhbXMgdmljdHVzX3NfZmFuX3Byb2ZpbGVfcGFyYW1zID0gewoJLmdldF9m
YW5fc3BlZWQJPSBocF93bWlfZ2V0X2Zhbl9zcGVlZF92aWN0dXNfcywKCS5mYW5fdGFibGUJPSB0
cnVlLAp9OwoKc3RhdGljIGNvbnN0IHN0cnVjdCBocF93bWlfYm9hcmRfcGFyYW1zIHZpY3R1c19z
X2JvYXJkX3BhcmFtcyA9IHsKCS50aGVybWFsX3Byb2ZpbGUJPSAmdmljdHVzX3NfdGhlcm1hbF9w
YXJhbXMsCgkuZmFuX3Byb2ZpbGUJCT0gJnZpY3R1c19zX2Zhbl9wcm9maWxlX3BhcmFtcywKfTsK
CnN0YXRpYyBjb25zdCBzdHJ1Y3QgaHBfd21pX2JvYXJkX3BhcmFtcyBvbWVuX3YxX2JvYXJkX3Bh
cmFtcyA9IHsKCS50aGVybWFsX3Byb2ZpbGUJPSAmb21lbl92MV90aGVybWFsX3BhcmFtcywKCS5m
YW5fcHJvZmlsZQkJPSAmdmljdHVzX3NfZmFuX3Byb2ZpbGVfcGFyYW1zLAp9OwoKc3RhdGljIGNv
bnN0IHN0cnVjdCBocF93bWlfYm9hcmRfcGFyYW1zIG9tZW5fdjFfbGVnYWN5X2JvYXJkX3BhcmFt
cyA9IHsKCS50aGVybWFsX3Byb2ZpbGUJPSAmb21lbl92MV9sZWdhY3lfdGhlcm1hbF9wYXJhbXMs
CgkuZmFuX3Byb2ZpbGUJCT0gJnZpY3R1c19zX2Zhbl9wcm9maWxlX3BhcmFtcywKfTsKCnN0YXRp
YyBjb25zdCBzdHJ1Y3QgaHBfd21pX2JvYXJkX3BhcmFtcyBvbWVuX3YxX25vX2VjX2JvYXJkX3Bh
cmFtcyA9IHsKCS50aGVybWFsX3Byb2ZpbGUJPSAmb21lbl92MV9ub19lY190aGVybWFsX3BhcmFt
cywKCS5mYW5fcHJvZmlsZQkJPSAmdmljdHVzX3NfZmFuX3Byb2ZpbGVfcGFyYW1zLAp9OwoKc3Rh
dGljIGNvbnN0IHN0cnVjdCBocF93bWlfYm9hcmRfcGFyYW1zICphY3RpdmVfYm9hcmRfcGFyYW1z
OwoKc3RhdGljIGNvbnN0IHN0cnVjdCB0aGVybWFsX3Byb2ZpbGVfcGFyYW1zICpocF93bWlfdGhl
cm1hbF9wcm9maWxlKHZvaWQpCnsKCWlmICghYWN0aXZlX2JvYXJkX3BhcmFtcykKCQlyZXR1cm4g
TlVMTDsKCglyZXR1cm4gYWN0aXZlX2JvYXJkX3BhcmFtcy0+dGhlcm1hbF9wcm9maWxlOwp9Cgov
KiBETUkgYm9hcmQgbmFtZXMgb2YgZGV2aWNlcyB0aGF0IHNob3VsZCB1c2UgdGhlIG9tZW4gc3Bl
Y2lmaWMgcGF0aCBmb3IKICogdGhlcm1hbCBwcm9maWxlcy4KICogVGhpcyB3YXMgb2J0YWluZWQg
YnkgdGFraW5nIGEgbG9vayBpbiB0aGUgd2luZG93cyBvbWVuIGNvbW1hbmQgY2VudGVyCiAqIGFw
cCBhbmQgcGFyc2luZyBhIGpzb24gZmlsZSB0aGF0IHRoZXkgdXNlIHRvIGZpZ3VyZSBvdXQgd2hh
dCBjYXBhYmlsaXRpZXMKICogdGhlIGRldmljZSBzaG91bGQgaGF2ZS4KICogQSBkZXZpY2UgaXMg
Y29uc2lkZXJlZCBhbiBvbWVuIGlmIHRoZSBEaXNwbGF5TmFtZSBpbiB0aGF0IGxpc3QgY29udGFp
bnMKICogIk9NRU4iLCBhbmQgaXQgY2FuIHVzZSB0aGUgdGhlcm1hbCBwcm9maWxlIHN0dWZmIGlm
IHRoZSAiRmVhdHVyZSIgYXJyYXkKICogY29udGFpbnMgIlBlcmZvcm1hbmNlQ29udHJvbCIuCiAq
LwpzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IG9tZW5fdGhlcm1hbF9wcm9maWxlX2JvYXJkc1td
ID0gewoJIjg0REEiLCAiODREQiIsICI4NERDIiwKCSI4NTcyIiwgIjg1NzMiLCAiODU3NCIsICI4
NTc1IiwKCSI4NjAwIiwgIjg2MDEiLCAiODYwMiIsICI4NjAzIiwgIjg2MDQiLCAiODYwNSIsICI4
NjA2IiwgIjg2MDciLCAiODYwQSIsCgkiODc0NiIsICI4NzQ3IiwgIjg3NDgiLCAiODc0OSIsICI4
NzRBIiwgIjg3ODYiLCAiODc4NyIsICI4Nzg4IiwgIjg3OEEiLAoJIjg3OEIiLCAiODc4QyIsICI4
N0I1IiwKCSI4ODZCIiwgIjg4NkMiLCAiODhDOCIsICI4OENCIiwgIjg4RDEiLCAiODhEMiIsICI4
OEY0IiwgIjg4RjUiLCAiODhGNiIsCgkiODhGNyIsICI4OEZEIiwgIjg4RkUiLCAiODhGRiIsCgki
ODkwMCIsICI4OTAxIiwgIjg5MDIiLCAiODkxMiIsICI4OTE3IiwgIjg5MTgiLCAiODk0OSIsICI4
OTRBIiwgIjg5RUIiLAoJIjhBMTUiLCAiOEE0MiIsICI4QTQzIiwKCSI4QkFEIiwKCSI4QzU4IiwK
CSI4RTQxIiwKfTsKCi8qIERNSSBCb2FyZCBuYW1lcyBvZiBPbWVuIGxhcHRvcHMgdGhhdCBhcmUg
c3BlY2lmaWNhbGx5IHNldCB0byBiZSB0aGVybWFsCiAqIHByb2ZpbGUgdmVyc2lvbiAwIGJ5IHRo
ZSBPbWVuIENvbW1hbmQgQ2VudGVyIGFwcCwgcmVnYXJkbGVzcyBvZiB3aGF0CiAqIHRoZSBnZXQg
c3lzdGVtIGRlc2lnbiBpbmZvcm1hdGlvbiBXTUkgY2FsbCByZXR1cm5zCiAqLwpzdGF0aWMgY29u
c3QgY2hhciAqIGNvbnN0IG9tZW5fdGhlcm1hbF9wcm9maWxlX2ZvcmNlX3YwX2JvYXJkc1tdID0g
ewoJIjg2MDciLAoJIjg3NDYiLCAiODc0NyIsICI4NzQ4IiwgIjg3NDkiLCAiODc0QSIsCn07Cgov
KiBETUkgYm9hcmQgbmFtZXMgb2YgT21lbiBsYXB0b3BzIHRoYXQgaGF2ZSBhIHRoZXJtYWwgcHJv
ZmlsZSB0aW1lciB3aGljaCB3aWxsCiAqIGNhdXNlIHRoZSBlbWJlZGRlZCBjb250cm9sbGVyIHRv
IHNldCB0aGUgdGhlcm1hbCBwcm9maWxlIGJhY2sgdG8KICogImJhbGFuY2VkIiB3aGVuIHJlYWNo
aW5nIHplcm8uCiAqLwpzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IG9tZW5fdGltZWRfdGhlcm1h
bF9wcm9maWxlX2JvYXJkc1tdID0gewoJIjhBMTUiLCAiOEE0MiIsCgkiOEJBRCIsCn07CgovKiBE
TUkgQm9hcmQgbmFtZXMgb2YgVmljdHVzIDE2LWQgbGFwdG9wcyAqLwpzdGF0aWMgY29uc3QgY2hh
ciAqIGNvbnN0IHZpY3R1c190aGVybWFsX3Byb2ZpbGVfYm9hcmRzW10gPSB7CgkiODhGOCIsCgki
OEEyNSIsCn07CgovKiBETUkgYm9hcmQtc3BlY2lmaWMgZmVhdHVyZSBkYXRhIGZvciBPbWVuIGFu
ZCBWaWN0dXMgbGFwdG9wcy4gKi8Kc3RhdGljIGNvbnN0IHN0cnVjdCBkbWlfc3lzdGVtX2lkIGhw
X3dtaV9mZWF0dXJlX2JvYXJkc1tdIF9faW5pdGNvbnN0ID0gewoJewoJCS5tYXRjaGVzID0geyBE
TUlfTUFUQ0goRE1JX0JPQVJEX05BTUUsICI4OTAyIikgfSwKCQkuZHJpdmVyX2RhdGEgPSAodm9p
ZCAqKSZvbWVuX3YxX2xlZ2FjeV9ib2FyZF9wYXJhbXMsCgl9LAoJewoJCS5tYXRjaGVzID0geyBE
TUlfTUFUQ0goRE1JX0JPQVJEX05BTUUsICI4QTNEIikgfSwKCQkuZHJpdmVyX2RhdGEgPSAodm9p
ZCAqKSZ2aWN0dXNfc19ib2FyZF9wYXJhbXMsCgl9LAoJewoJCS5tYXRjaGVzID0geyBETUlfTUFU
Q0goRE1JX0JPQVJEX05BTUUsICI4QTQ0IikgfSwKCQkuZHJpdmVyX2RhdGEgPSAodm9pZCAqKSZv
bWVuX3YxX2xlZ2FjeV9ib2FyZF9wYXJhbXMsCgl9LAoJewoJCS5tYXRjaGVzID0geyBETUlfTUFU
Q0goRE1JX0JPQVJEX05BTUUsICI4QTREIikgfSwKCQkuZHJpdmVyX2RhdGEgPSAodm9pZCAqKSZv
bWVuX3YxX2xlZ2FjeV9ib2FyZF9wYXJhbXMsCgl9LAoJewoJCS5tYXRjaGVzID0geyBETUlfTUFU
Q0goRE1JX0JPQVJEX05BTUUsICI4QkFBIikgfSwKCQkuZHJpdmVyX2RhdGEgPSAodm9pZCAqKSZv
bWVuX3YxX2JvYXJkX3BhcmFtcywKCX0sCgl7CgkJLm1hdGNoZXMgPSB7IERNSV9NQVRDSChETUlf
Qk9BUkRfTkFNRSwgIjhCQTkiKSB9LAoJCS5kcml2ZXJfZGF0YSA9ICh2b2lkICopJm9tZW5fdjFf
Ym9hcmRfcGFyYW1zLAoJfSwKCXsKCQkubWF0Y2hlcyA9IHsgRE1JX01BVENIKERNSV9CT0FSRF9O
QU1FLCAiOEJBQiIpIH0sCgkJLmRyaXZlcl9kYXRhID0gKHZvaWQgKikmb21lbl92MV9ib2FyZF9w
YXJhbXMsCgl9LAoJewoJCS5tYXRjaGVzID0geyBETUlfTUFUQ0goRE1JX0JPQVJEX05BTUUsICI4
QjJGIikgfSwKCQkuZHJpdmVyX2RhdGEgPSAodm9pZCAqKSZ2aWN0dXNfc19ib2FyZF9wYXJhbXMs
Cgl9LAoJewoJCS5tYXRjaGVzID0geyBETUlfTUFUQ0goRE1JX0JPQVJEX05BTUUsICI4QkIzIikg
fSwKCQkuZHJpdmVyX2RhdGEgPSAodm9pZCAqKSZvbWVuX3YxX25vX2VjX2JvYXJkX3BhcmFtcywK
CX0sCgl7CgkJLm1hdGNoZXMgPSB7IERNSV9NQVRDSChETUlfQk9BUkRfTkFNRSwgIjhCQkUiKSB9
LAoJCS5kcml2ZXJfZGF0YSA9ICh2b2lkICopJnZpY3R1c19zX2JvYXJkX3BhcmFtcywKCX0sCgl7
CgkJLm1hdGNoZXMgPSB7IERNSV9NQVRDSChETUlfQk9BUkRfTkFNRSwgIjhCQzIiKSB9LAoJCS5k
cml2ZXJfZGF0YSA9ICh2b2lkICopJm9tZW5fdjFfYm9hcmRfcGFyYW1zLAoJfSwKCXsKCQkubWF0
Y2hlcyA9IHsgRE1JX01BVENIKERNSV9CT0FSRF9OQU1FLCAiOEJDQSIpIH0sCgkJLmRyaXZlcl9k
YXRhID0gKHZvaWQgKikmb21lbl92MV9ib2FyZF9wYXJhbXMsCgl9LAoJewoJCS5tYXRjaGVzID0g
eyBETUlfTUFUQ0goRE1JX0JPQVJEX05BTUUsICI4QkNEIikgfSwKCQkuZHJpdmVyX2RhdGEgPSAo
dm9pZCAqKSZvbWVuX3YxX2JvYXJkX3BhcmFtcywKCX0sCgl7CgkJLm1hdGNoZXMgPSB7IERNSV9N
QVRDSChETUlfQk9BUkRfTkFNRSwgIjhCRDQiKSB9LAoJCS5kcml2ZXJfZGF0YSA9ICh2b2lkICop
JnZpY3R1c19zX2JvYXJkX3BhcmFtcywKCX0sCgl7CgkJLm1hdGNoZXMgPSB7IERNSV9NQVRDSChE
TUlfQk9BUkRfTkFNRSwgIjhCRDUiKSB9LAoJCS5kcml2ZXJfZGF0YSA9ICh2b2lkICopJnZpY3R1
c19zX2JvYXJkX3BhcmFtcywKCX0sCgl7CgkJLm1hdGNoZXMgPSB7IERNSV9NQVRDSChETUlfQk9B
UkRfTkFNRSwgIjhDNzYiKSB9LAoJCS5kcml2ZXJfZGF0YSA9ICh2b2lkICopJm9tZW5fdjFfYm9h
cmRfcGFyYW1zLAoJfSwKCXsKCQkubWF0Y2hlcyA9IHsgRE1JX01BVENIKERNSV9CT0FSRF9OQU1F
LCAiOEM3NyIpIH0sCgkJLmRyaXZlcl9kYXRhID0gKHZvaWQgKikmb21lbl92MV9ib2FyZF9wYXJh
bXMsCgl9LAoJewoJCS5tYXRjaGVzID0geyBETUlfTUFUQ0goRE1JX0JPQVJEX05BTUUsICI4Qzc4
IikgfSwKCQkuZHJpdmVyX2RhdGEgPSAodm9pZCAqKSZvbWVuX3YxX2JvYXJkX3BhcmFtcywKCX0s
Cgl7CgkJLm1hdGNoZXMgPSB7IERNSV9NQVRDSChETUlfQk9BUkRfTkFNRSwgIjhDOTkiKSB9LAoJ
CS5kcml2ZXJfZGF0YSA9ICh2b2lkICopJnZpY3R1c19zX2JvYXJkX3BhcmFtcywKCX0sCgl7CgkJ
Lm1hdGNoZXMgPSB7IERNSV9NQVRDSChETUlfQk9BUkRfTkFNRSwgIjhDOUMiKSB9LAoJCS5kcml2
ZXJfZGF0YSA9ICh2b2lkICopJnZpY3R1c19zX2JvYXJkX3BhcmFtcywKCX0sCgl7CgkJLm1hdGNo
ZXMgPSB7IERNSV9NQVRDSChETUlfQk9BUkRfTkFNRSwgIjhEMjYiKSB9LAoJCS5kcml2ZXJfZGF0
YSA9ICh2b2lkICopJm9tZW5fdjFfbGVnYWN5X2JvYXJkX3BhcmFtcywKCX0sCgl7CgkJLm1hdGNo
ZXMgPSB7IERNSV9NQVRDSChETUlfQk9BUkRfTkFNRSwgIjhENDEiKSB9LAoJCS5kcml2ZXJfZGF0
YSA9ICh2b2lkICopJm9tZW5fdjFfbm9fZWNfYm9hcmRfcGFyYW1zLAoJfSwKCXsKCQkubWF0Y2hl
cyA9IHsgRE1JX01BVENIKERNSV9CT0FSRF9OQU1FLCAiOEQ4NyIpIH0sCgkJLmRyaXZlcl9kYXRh
ID0gKHZvaWQgKikmb21lbl92MV9ub19lY19ib2FyZF9wYXJhbXMsCgl9LAoJewoJCS5tYXRjaGVz
ID0geyBETUlfTUFUQ0goRE1JX0JPQVJEX05BTUUsICI4RDg4IikgfSwKCQkuZHJpdmVyX2RhdGEg
PSAodm9pZCAqKSZvbWVuX3YxX25vX2VjX2JvYXJkX3BhcmFtcywKCX0sCgl7CgkJLm1hdGNoZXMg
PSB7IERNSV9NQVRDSChETUlfQk9BUkRfTkFNRSwgIjhERDYiKSB9LAoJCS5kcml2ZXJfZGF0YSA9
ICh2b2lkICopJm9tZW5fdjFfbm9fZWNfYm9hcmRfcGFyYW1zLAoJfSwKCXsKCQkubWF0Y2hlcyA9
IHsgRE1JX01BVENIKERNSV9CT0FSRF9OQU1FLCAiOEUzNSIpIH0sCgkJLmRyaXZlcl9kYXRhID0g
KHZvaWQgKikmb21lbl92MV9sZWdhY3lfYm9hcmRfcGFyYW1zLAoJfSwKCXt9LAp9OwoKc3RhdGlj
IGJvb2wgaXNfdmljdHVzX3NfYm9hcmQ7CgplbnVtIGhwX3dtaV9yYWRpbyB7CglIUFdNSV9XSUZJ
CT0gMHgwLAoJSFBXTUlfQkxVRVRPT1RICT0gMHgxLAoJSFBXTUlfV1dBTgk9IDB4MiwKCUhQV01J
X0dQUwk9IDB4MywKfTsKCmVudW0gaHBfd21pX2V2ZW50X2lkcyB7CglIUFdNSV9ET0NLX0VWRU5U
CQk9IDB4MDEsCglIUFdNSV9QQVJLX0hERAkJCT0gMHgwMiwKCUhQV01JX1NNQVJUX0FEQVBURVIJ
CT0gMHgwMywKCUhQV01JX0JFWkVMX0JVVFRPTgkJPSAweDA0LAoJSFBXTUlfV0lSRUxFU1MJCQk9
IDB4MDUsCglIUFdNSV9DUFVfQkFUVEVSWV9USFJPVFRMRQk9IDB4MDYsCglIUFdNSV9MT0NLX1NX
SVRDSAkJPSAweDA3LAoJSFBXTUlfTElEX1NXSVRDSAkJPSAweDA4LAoJSFBXTUlfU0NSRUVOX1JP
VEFUSU9OCQk9IDB4MDksCglIUFdNSV9DT09MU0VOU0VfU1lTVEVNX01PQklMRQk9IDB4MEEsCglI
UFdNSV9DT09MU0VOU0VfU1lTVEVNX0hPVAk9IDB4MEIsCglIUFdNSV9QUk9YSU1JVFlfU0VOU09S
CQk9IDB4MEMsCglIUFdNSV9CQUNLTElUX0tCX0JSSUdIVE5FU1MJPSAweDBELAoJSFBXTUlfUEVB
S1NISUZUX1BFUklPRAkJPSAweDBGLAoJSFBXTUlfQkFUVEVSWV9DSEFSR0VfUEVSSU9ECT0gMHgx
MCwKCUhQV01JX1NBTklUSVpBVElPTl9NT0RFCQk9IDB4MTcsCglIUFdNSV9DQU1FUkFfVE9HR0xF
CQk9IDB4MUEsCglIUFdNSV9GTl9QX0hPVEtFWQkJPSAweDFCLAoJSFBXTUlfT01FTl9LRVkJCQk9
IDB4MUQsCglIUFdNSV9TTUFSVF9FWFBFUklFTkNFX0FQUAk9IDB4MjEsCn07CgovKgogKiBzdHJ1
Y3QgYmlvc19hcmdzIGJ1ZmZlciBpcyBkeW5hbWljYWxseSBhbGxvY2F0ZWQuICBOZXcgV01JIGNv
bW1hbmQgdHlwZXMKICogd2VyZSBpbnRyb2R1Y2VkIHRoYXQgZXhjZWVkcyAxMjgtYnl0ZSBkYXRh
IHNpemUuICBDaGFuZ2VzIHRvIGhhbmRsZQogKiB0aGUgZGF0YSBzaXplIGFsbG9jYXRpb24gc2No
ZW1lIHdlcmUga2VwdCBpbiBocF93bWlfcGVyZm9ybV9xdXJleSBmdW5jdGlvbi4KICovCnN0cnVj
dCBiaW9zX2FyZ3MgewoJdTMyIHNpZ25hdHVyZTsKCXUzMiBjb21tYW5kOwoJdTMyIGNvbW1hbmR0
eXBlOwoJdTMyIGRhdGFzaXplOwoJdTggZGF0YVtdOwp9OwoKZW51bSBocF93bWlfY29tbWFuZHR5
cGUgewoJSFBXTUlfRElTUExBWV9RVUVSWQkJPSAweDAxLAoJSFBXTUlfSEREVEVNUF9RVUVSWQkJ
PSAweDAyLAoJSFBXTUlfQUxTX1FVRVJZCQkJPSAweDAzLAoJSFBXTUlfSEFSRFdBUkVfUVVFUlkJ
CT0gMHgwNCwKCUhQV01JX1dJUkVMRVNTX1FVRVJZCQk9IDB4MDUsCglIUFdNSV9CQVRURVJZX1FV
RVJZCQk9IDB4MDcsCglIUFdNSV9CSU9TX1FVRVJZCQk9IDB4MDksCglIUFdNSV9GRUFUVVJFX1FV
RVJZCQk9IDB4MGIsCglIUFdNSV9IT1RLRVlfUVVFUlkJCT0gMHgwYywKCUhQV01JX0ZFQVRVUkUy
X1FVRVJZCQk9IDB4MGQsCglIUFdNSV9XSVJFTEVTUzJfUVVFUlkJCT0gMHgxYiwKCUhQV01JX1BP
U1RDT0RFRVJST1JfUVVFUlkJPSAweDJhLAoJSFBXTUlfU1lTVEVNX0RFVklDRV9NT0RFCT0gMHg0
MCwKCUhQV01JX1RIRVJNQUxfUFJPRklMRV9RVUVSWQk9IDB4NGMsCglIUFdNSV9HUkFQSElDU19N
VVhfUVVFUlkJPSAweDUyLAp9OwoKc3RydWN0IHZpY3R1c19wb3dlcl9saW1pdHMgewoJdTggcGwx
OwoJdTggcGwyOwoJdTggcGw0OwoJdTggY3B1X2dwdV9jb25jdXJyZW50X2xpbWl0Owp9OwoKc3Ry
dWN0IHZpY3R1c19ncHVfcG93ZXJfbW9kZXMgewoJdTggY3RncF9lbmFibGU7Cgl1OCBwcGFiX2Vu
YWJsZTsKCXU4IGRzdGF0ZTsKCXU4IGdwdV9zbG93ZG93bl90ZW1wOwp9OwoKZW51bSBocF93bWlf
Z21fY29tbWFuZHR5cGUgewoJSFBXTUlfRkFOX1NQRUVEX0dFVF9RVUVSWQkJPSAweDExLAoJSFBX
TUlfU0VUX1BFUkZPUk1BTkNFX01PREUJCT0gMHgxQSwKCUhQV01JX0ZBTl9TUEVFRF9NQVhfR0VU
X1FVRVJZCQk9IDB4MjYsCglIUFdNSV9GQU5fU1BFRURfTUFYX1NFVF9RVUVSWQkJPSAweDI3LAoJ
SFBXTUlfR0VUX1NZU1RFTV9ERVNJR05fREFUQQkJPSAweDI4LAoJSFBXTUlfRkFOX0NPVU5UX0dF
VF9RVUVSWQkJPSAweDEwLAoJSFBXTUlfR0VUX0dQVV9USEVSTUFMX01PREVTX1FVRVJZCT0gMHgy
MSwKCUhQV01JX1NFVF9HUFVfVEhFUk1BTF9NT0RFU19RVUVSWQk9IDB4MjIsCglIUFdNSV9TRVRf
UE9XRVJfTElNSVRTX1FVRVJZCQk9IDB4MjksCglIUFdNSV9WSUNUVVNfU19GQU5fU1BFRURfR0VU
X1FVRVJZCT0gMHgyRCwKCUhQV01JX1ZJQ1RVU19TX0ZBTl9TUEVFRF9TRVRfUVVFUlkJPSAweDJF
LAoJSFBXTUlfVklDVFVTX1NfR0VUX0ZBTl9UQUJMRV9RVUVSWQk9IDB4MkYsCn07CgplbnVtIGhw
X3dtaV9jb21tYW5kIHsKCUhQV01JX1JFQUQJPSAweDAxLAoJSFBXTUlfV1JJVEUJPSAweDAyLAoJ
SFBXTUlfT0RNCT0gMHgwMywKCUhQV01JX0dNCT0gMHgyMDAwOCwKfTsKCmVudW0gaHBfd21pX2hh
cmR3YXJlX21hc2sgewoJSFBXTUlfRE9DS19NQVNLCQk9IDB4MDEsCglIUFdNSV9UQUJMRVRfTUFT
Swk9IDB4MDQsCn07CgpzdHJ1Y3QgYmlvc19yZXR1cm4gewoJdTMyIHNpZ3Bhc3M7Cgl1MzIgcmV0
dXJuX2NvZGU7Cn07CgplbnVtIGhwX3JldHVybl92YWx1ZSB7CglIUFdNSV9SRVRfV1JPTkdfU0lH
TkFUVVJFCT0gMHgwMiwKCUhQV01JX1JFVF9VTktOT1dOX0NPTU1BTkQJPSAweDAzLAoJSFBXTUlf
UkVUX1VOS05PV05fQ01EVFlQRQk9IDB4MDQsCglIUFdNSV9SRVRfSU5WQUxJRF9QQVJBTUVURVJT
CT0gMHgwNSwKfTsKCmVudW0gaHBfd2lyZWxlc3MyX2JpdHMgewoJSFBXTUlfUE9XRVJfU1RBVEUJ
PSAweDAxLAoJSFBXTUlfUE9XRVJfU09GVAk9IDB4MDIsCglIUFdNSV9QT1dFUl9CSU9TCT0gMHgw
NCwKCUhQV01JX1BPV0VSX0hBUkQJPSAweDA4LAoJSFBXTUlfUE9XRVJfRldfT1JfSFcJPSBIUFdN
SV9QT1dFUl9CSU9TIHwgSFBXTUlfUE9XRVJfSEFSRCwKfTsKCiNkZWZpbmUgSVNfSFdCTE9DS0VE
KHgpICgoeCAmIEhQV01JX1BPV0VSX0ZXX09SX0hXKSAhPSBIUFdNSV9QT1dFUl9GV19PUl9IVykK
I2RlZmluZSBJU19TV0JMT0NLRUQoeCkgISh4ICYgSFBXTUlfUE9XRVJfU09GVCkKCnN0cnVjdCBi
aW9zX3Jma2lsbDJfZGV2aWNlX3N0YXRlIHsKCXU4IHJhZGlvX3R5cGU7Cgl1OCBidXNfdHlwZTsK
CXUxNiB2ZW5kb3JfaWQ7Cgl1MTYgcHJvZHVjdF9pZDsKCXUxNiBzdWJzeXNfdmVuZG9yX2lkOwoJ
dTE2IHN1YnN5c19wcm9kdWN0X2lkOwoJdTggcmZraWxsX2lkOwoJdTggcG93ZXI7Cgl1OCB1bmtu
b3duWzRdOwp9OwoKLyogNyBkZXZpY2VzIGZpdCBpbnRvIHRoZSAxMjggYnl0ZSBidWZmZXIgKi8K
I2RlZmluZSBIUFdNSV9NQVhfUkZLSUxMMl9ERVZJQ0VTCTcKCnN0cnVjdCBiaW9zX3Jma2lsbDJf
c3RhdGUgewoJdTggdW5rbm93bls3XTsKCXU4IGNvdW50OwoJdTggcGFkWzhdOwoJc3RydWN0IGJp
b3NfcmZraWxsMl9kZXZpY2Vfc3RhdGUgZGV2aWNlW0hQV01JX01BWF9SRktJTEwyX0RFVklDRVNd
Owp9OwoKc3RhdGljIGNvbnN0IHN0cnVjdCBrZXlfZW50cnkgaHBfd21pX2tleW1hcFtdID0gewoJ
eyBLRV9LRVksIDB4MDIsICAgIHsgS0VZX0JSSUdIVE5FU1NVUCB9IH0sCgl7IEtFX0tFWSwgMHgw
MywgICAgeyBLRVlfQlJJR0hUTkVTU0RPV04gfSB9LAoJeyBLRV9LRVksIDB4MjcwLCAgIHsgS0VZ
X01JQ01VVEUgfSB9LAoJeyBLRV9LRVksIDB4MjBlNiwgIHsgS0VZX1BST0cxIH0gfSwKCXsgS0Vf
S0VZLCAweDIwZTgsICB7IEtFWV9NRURJQSB9IH0sCgl7IEtFX0tFWSwgMHgyMTQyLCAgeyBLRVlf
TUVESUEgfSB9LAoJeyBLRV9LRVksIDB4MjEzYiwgIHsgS0VZX0lORk8gfSB9LAoJeyBLRV9LRVks
IDB4MjE2OSwgIHsgS0VZX1JPVEFURV9ESVNQTEFZIH0gfSwKCXsgS0VfS0VZLCAweDIxNmEsICB7
IEtFWV9TRVRVUCB9IH0sCgl7IEtFX0lHTk9SRSwgMHgyMWE0LCAgfSwgLyogV2luIExvY2sgT24g
Ki8KCXsgS0VfSUdOT1JFLCAweDEyMWE0LCB9LCAvKiBXaW4gTG9jayBPZmYgKi8KCXsgS0VfS0VZ
LCAweDIxYTUsICB7IEtFWV9QUk9HMiB9IH0sIC8qIEhQIE9tZW4gS2V5ICovCgl7IEtFX0tFWSwg
MHgyMWE3LCAgeyBLRVlfRk5fRVNDIH0gfSwKCXsgS0VfS0VZLCAweDIxYTgsICB7IEtFWV9QUk9H
MiB9IH0sIC8qIEhQIEVudnkgeDM2MCBwcm9ncmFtbWFibGUga2V5ICovCgl7IEtFX0tFWSwgMHgy
MWE5LCAgeyBLRVlfVE9VQ0hQQURfT0ZGIH0gfSwKCXsgS0VfS0VZLCAweDEyMWE5LCB7IEtFWV9U
T1VDSFBBRF9PTiB9IH0sCgl7IEtFX0tFWSwgMHgyMzFiLCAgeyBLRVlfSEVMUCB9IH0sCgl7IEtF
X0lHTk9SRSwgMHgyMWFiLCB9LCAvKiBGbkxvY2sgb24gKi8KCXsgS0VfSUdOT1JFLCAweDEyMWFi
LCB9LCAvKiBGbkxvY2sgb2ZmICovCgl7IEtFX0lHTk9SRSwgMHgzMDAyMWFhLCB9LCAvKiBrYmQg
YmFja2xpZ2h0OiBsZXZlbCAyIC0+IG9mZiAqLwoJeyBLRV9JR05PUkUsIDB4MzMyMjFhYSwgfSwg
Lyoga2JkIGJhY2tsaWdodDogb2ZmIC0+IGxldmVsIDEgKi8KCXsgS0VfSUdOT1JFLCAweDM2NDIx
YWEsIH0sIC8qIGtiZCBiYWNrbGlnaHQ6IGxldmVsIDEgLT4gbGV2ZWwgMiovCgl7IEtFX0VORCwg
MCB9Cn07CgovKgogKiBNdXRleCBmb3IgdGhlIGFjdGl2ZV9wbGF0Zm9ybV9wcm9maWxlIHZhcmlh
YmxlLAogKiBzZWUgb21lbl9wb3dlcnNvdXJjZV9ldmVudC4KICovCnN0YXRpYyBERUZJTkVfTVVU
RVgoYWN0aXZlX3BsYXRmb3JtX3Byb2ZpbGVfbG9jayk7CgpzdGF0aWMgc3RydWN0IGlucHV0X2Rl
diAqaHBfd21pX2lucHV0X2RldjsKc3RhdGljIHN0cnVjdCBpbnB1dF9kZXYgKmNhbWVyYV9zaHV0
dGVyX2lucHV0X2RldjsKc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKmhwX3dtaV9wbGF0
Zm9ybV9kZXY7CnN0YXRpYyBzdHJ1Y3QgZGV2aWNlICpwbGF0Zm9ybV9wcm9maWxlX2RldmljZTsK
c3RhdGljIHN0cnVjdCBub3RpZmllcl9ibG9jayBwbGF0Zm9ybV9wb3dlcl9zb3VyY2VfbmI7CnN0
YXRpYyBlbnVtIHBsYXRmb3JtX3Byb2ZpbGVfb3B0aW9uIGFjdGl2ZV9wbGF0Zm9ybV9wcm9maWxl
OwpzdGF0aWMgYm9vbCBwbGF0Zm9ybV9wcm9maWxlX3N1cHBvcnQ7CnN0YXRpYyBib29sIHplcm9f
aW5zaXplX3N1cHBvcnQ7CgpzdGF0aWMgc3RydWN0IHJma2lsbCAqd2lmaV9yZmtpbGw7CnN0YXRp
YyBzdHJ1Y3QgcmZraWxsICpibHVldG9vdGhfcmZraWxsOwpzdGF0aWMgc3RydWN0IHJma2lsbCAq
d3dhbl9yZmtpbGw7CgpzdHJ1Y3QgcmZraWxsMl9kZXZpY2UgewoJdTggaWQ7CglpbnQgbnVtOwoJ
c3RydWN0IHJma2lsbCAqcmZraWxsOwp9OwoKc3RhdGljIGludCByZmtpbGwyX2NvdW50OwpzdGF0
aWMgc3RydWN0IHJma2lsbDJfZGV2aWNlIHJma2lsbDJbSFBXTUlfTUFYX1JGS0lMTDJfREVWSUNF
U107CgovKgogKiBDaGFzc2lzIFR5cGVzIHZhbHVlcyB3ZXJlIG9idGFpbmVkIGZyb20gU01CSU9T
IHJlZmVyZW5jZQogKiBzcGVjaWZpY2F0aW9uIHZlcnNpb24gMy4wMC4gQSBjb21wbGV0ZSBsaXN0
IG9mIHN5c3RlbSBlbmNsb3N1cmVzCiAqIGFuZCBjaGFzc2lzIHR5cGVzIGlzIGF2YWlsYWJsZSBv
biBUYWJsZSAxNy4KICovCnN0YXRpYyBjb25zdCBjaGFyICogY29uc3QgdGFibGV0X2NoYXNzaXNf
dHlwZXNbXSA9IHsKCSIzMCIsIC8qIFRhYmxldCovCgkiMzEiLCAvKiBDb252ZXJ0aWJsZSAqLwoJ
IjMyIiAgLyogRGV0YWNoYWJsZSAqLwp9OwoKI2RlZmluZSBERVZJQ0VfTU9ERV9UQUJMRVQJMHgw
NgoKI2RlZmluZSBDUFVfRkFOIDAKI2RlZmluZSBHUFVfRkFOIDEKCmVudW0gcHdtX21vZGVzIHsK
CVBXTV9NT0RFX01BWAkJPSAwLAoJUFdNX01PREVfTUFOVUFMCQk9IDEsCglQV01fTU9ERV9BVVRP
CQk9IDIsCn07CgpzdHJ1Y3QgaHBfd21pX2h3bW9uX3ByaXYgewoJc3RydWN0IG11dGV4IGxvY2s7
CS8qIHByb3RlY3RzIG1vZGUsIHB3bSAqLwoJdTggbWluX3JwbTsKCXU4IG1heF9ycG07Cgl1OCBt
b2RlOwoJdTggY3B1X3B3bTsKCXU4IGdwdV9wd207CglzdHJ1Y3QgZGVsYXllZF93b3JrIGtlZXBf
YWxpdmVfZHdvcms7Cn07CgpzdHJ1Y3QgdmljdHVzX3NfZmFuX3RhYmxlX2hlYWRlciB7Cgl1OCBu
dW1fZmFuczsKCXU4IHVua25vd247Cn0gX19wYWNrZWQ7CgpzdHJ1Y3QgdmljdHVzX3NfZmFuX3Rh
YmxlX2VudHJ5IHsKCXU4IGNwdV9ycG07Cgl1OCBncHVfcnBtOwoJdTggbm9pc2VfZGI7Cn0gX19w
YWNrZWQ7CgpzdHJ1Y3QgdmljdHVzX3NfZmFuX3RhYmxlIHsKCXN0cnVjdCB2aWN0dXNfc19mYW5f
dGFibGVfaGVhZGVyIGhlYWRlcjsKCXN0cnVjdCB2aWN0dXNfc19mYW5fdGFibGVfZW50cnkgZW50
cmllc1tdOwp9IF9fcGFja2VkOwoKLyoKICogOTBzIGRlbGF5IHRvIHByZXZlbnQgdGhlIGZpcm13
YXJlIGZyb20gcmVzZXR0aW5nIGZhbiBtb2RlIGFmdGVyIGZpeGVkCiAqIDEyMHMgdGltZW91dAog
Ki8KI2RlZmluZSBLRUVQX0FMSVZFX0RFTEFZX1NFQ1MgICAgIDkwCgpzdGF0aWMgaW5saW5lIHU4
IHJwbV90b19wd20odTggcnBtLCBzdHJ1Y3QgaHBfd21pX2h3bW9uX3ByaXYgKnByaXYpCnsKCXJl
dHVybiBmaXhwX2xpbmVhcl9pbnRlcnBvbGF0ZSgwLCAwLCBwcml2LT5tYXhfcnBtLCBVOF9NQVgs
CgkJCQkgICAgICAgY2xhbXBfdmFsKHJwbSwgMCwgcHJpdi0+bWF4X3JwbSkpOwp9CgpzdGF0aWMg
aW5saW5lIHU4IHB3bV90b19ycG0odTggcHdtLCBzdHJ1Y3QgaHBfd21pX2h3bW9uX3ByaXYgKnBy
aXYpCnsKCXJldHVybiBmaXhwX2xpbmVhcl9pbnRlcnBvbGF0ZSgwLCAwLCBVOF9NQVgsIHByaXYt
Pm1heF9ycG0sCgkJCQkgICAgICAgY2xhbXBfdmFsKHB3bSwgMCwgVThfTUFYKSk7Cn0KCi8qIG1h
cCBvdXRwdXQgc2l6ZSB0byB0aGUgY29ycmVzcG9uZGluZyBXTUkgbWV0aG9kIGlkICovCnN0YXRp
YyBpbmxpbmUgaW50IGVuY29kZV9vdXRzaXplX2Zvcl9wdnN6KGludCBvdXRzaXplKQp7CglpZiAo
b3V0c2l6ZSA+IDQwOTYpCgkJcmV0dXJuIC1FSU5WQUw7CglpZiAob3V0c2l6ZSA+IDEwMjQpCgkJ
cmV0dXJuIDU7CglpZiAob3V0c2l6ZSA+IDEyOCkKCQlyZXR1cm4gNDsKCWlmIChvdXRzaXplID4g
NCkKCQlyZXR1cm4gMzsKCWlmIChvdXRzaXplID4gMCkKCQlyZXR1cm4gMjsKCXJldHVybiAxOwp9
CgovKgogKiBocF93bWlfcGVyZm9ybV9xdWVyeQogKgogKiBxdWVyeToJVGhlIGNvbW1hbmR0eXBl
IChlbnVtIGhwX3dtaV9jb21tYW5kdHlwZSkKICogd3JpdGU6CVRoZSBjb21tYW5kIChlbnVtIGhw
X3dtaV9jb21tYW5kKQogKiBidWZmZXI6CUJ1ZmZlciB1c2VkIGFzIGlucHV0IGFuZC9vciBvdXRw
dXQKICogaW5zaXplOglTaXplIG9mIGlucHV0IGJ1ZmZlcgogKiBvdXRzaXplOglTaXplIG9mIG91
dHB1dCBidWZmZXIKICoKICogcmV0dXJucyB6ZXJvIG9uIHN1Y2Nlc3MKICogICAgICAgICBhbiBI
UCBXTUkgcXVlcnkgc3BlY2lmaWMgZXJyb3IgY29kZSAod2hpY2ggaXMgcG9zaXRpdmUpCiAqICAg
ICAgICAgLUVJTlZBTCBpZiB0aGUgcXVlcnkgd2FzIG5vdCBzdWNjZXNzZnVsIGF0IGFsbAogKiAg
ICAgICAgIC1FSU5WQUwgaWYgdGhlIG91dHB1dCBidWZmZXIgc2l6ZSBleGNlZWRzIGJ1ZmZlcnNp
emUKICoKICogTm90ZTogVGhlIGJ1ZmZlcnNpemUgbXVzdCBhdCBsZWFzdCBiZSB0aGUgbWF4aW11
bSBvZiB0aGUgaW5wdXQgYW5kIG91dHB1dAogKiAgICAgICBzaXplLiBFLmcuIEJhdHRlcnkgaW5m
byBxdWVyeSBpcyBkZWZpbmVkIHRvIGhhdmUgMSBieXRlIGlucHV0CiAqICAgICAgIGFuZCAxMjgg
Ynl0ZSBvdXRwdXQuIFRoZSBjYWxsZXIgd291bGQgZG86CiAqICAgICAgIGJ1ZmZlciA9IGt6YWxs
b2MoMTI4LCBHRlBfS0VSTkVMKTsKICogICAgICAgcmV0ID0gaHBfd21pX3BlcmZvcm1fcXVlcnko
SFBXTUlfQkFUVEVSWV9RVUVSWSwgSFBXTUlfUkVBRCwgYnVmZmVyLCAxLCAxMjgpCiAqLwpzdGF0
aWMgaW50IGhwX3dtaV9wZXJmb3JtX3F1ZXJ5KGludCBxdWVyeSwgZW51bSBocF93bWlfY29tbWFu
ZCBjb21tYW5kLAoJCQkJdm9pZCAqYnVmZmVyLCBpbnQgaW5zaXplLCBpbnQgb3V0c2l6ZSkKewoJ
c3RydWN0IGFjcGlfYnVmZmVyIGlucHV0LCBvdXRwdXQgPSB7IEFDUElfQUxMT0NBVEVfQlVGRkVS
LCBOVUxMIH07CglzdHJ1Y3QgYmlvc19yZXR1cm4gKmJpb3NfcmV0dXJuOwoJdW5pb24gYWNwaV9v
YmplY3QgKm9iaiA9IE5VTEw7CglzdHJ1Y3QgYmlvc19hcmdzICphcmdzID0gTlVMTDsKCWludCBt
aWQsIGFjdHVhbF9pbnNpemUsIGFjdHVhbF9vdXRzaXplOwoJc2l6ZV90IGJpb3NfYXJnc19zaXpl
OwoJaW50IHJldDsKCgltaWQgPSBlbmNvZGVfb3V0c2l6ZV9mb3JfcHZzeihvdXRzaXplKTsKCWlm
IChXQVJOX09OKG1pZCA8IDApKQoJCXJldHVybiBtaWQ7CgoJYWN0dWFsX2luc2l6ZSA9IG1heChp
bnNpemUsIDEyOCk7CgliaW9zX2FyZ3Nfc2l6ZSA9IHN0cnVjdF9zaXplKGFyZ3MsIGRhdGEsIGFj
dHVhbF9pbnNpemUpOwoJYXJncyA9IGttYWxsb2MoYmlvc19hcmdzX3NpemUsIEdGUF9LRVJORUwp
OwoJaWYgKCFhcmdzKQoJCXJldHVybiAtRU5PTUVNOwoKCWlucHV0Lmxlbmd0aCA9IGJpb3NfYXJn
c19zaXplOwoJaW5wdXQucG9pbnRlciA9IGFyZ3M7CgoJYXJncy0+c2lnbmF0dXJlID0gMHg1NTQz
NDU1MzsKCWFyZ3MtPmNvbW1hbmQgPSBjb21tYW5kOwoJYXJncy0+Y29tbWFuZHR5cGUgPSBxdWVy
eTsKCWFyZ3MtPmRhdGFzaXplID0gaW5zaXplOwoJbWVtY3B5KGFyZ3MtPmRhdGEsIGJ1ZmZlciwg
ZmxleF9hcnJheV9zaXplKGFyZ3MsIGRhdGEsIGluc2l6ZSkpOwoKCXJldCA9IHdtaV9ldmFsdWF0
ZV9tZXRob2QoSFBXTUlfQklPU19HVUlELCAwLCBtaWQsICZpbnB1dCwgJm91dHB1dCk7CglpZiAo
cmV0KQoJCWdvdG8gb3V0X2ZyZWU7CgoJb2JqID0gb3V0cHV0LnBvaW50ZXI7CglpZiAoIW9iaikg
ewoJCXJldCA9IC1FSU5WQUw7CgkJZ290byBvdXRfZnJlZTsKCX0KCglpZiAob2JqLT50eXBlICE9
IEFDUElfVFlQRV9CVUZGRVIpIHsKCQlwcl93YXJuKCJxdWVyeSAweCV4IHJldHVybmVkIGFuIGlu
dmFsaWQgb2JqZWN0IDB4JXhcbiIsIHF1ZXJ5LCByZXQpOwoJCXJldCA9IC1FSU5WQUw7CgkJZ290
byBvdXRfZnJlZTsKCX0KCgliaW9zX3JldHVybiA9IChzdHJ1Y3QgYmlvc19yZXR1cm4gKilvYmot
PmJ1ZmZlci5wb2ludGVyOwoJcmV0ID0gYmlvc19yZXR1cm4tPnJldHVybl9jb2RlOwoKCWlmIChy
ZXQpIHsKCQlpZiAocmV0ICE9IEhQV01JX1JFVF9VTktOT1dOX0NPTU1BTkQgJiYKCQkgICAgcmV0
ICE9IEhQV01JX1JFVF9VTktOT1dOX0NNRFRZUEUpCgkJCXByX3dhcm4oInF1ZXJ5IDB4JXggcmV0
dXJuZWQgZXJyb3IgMHgleFxuIiwgcXVlcnksIHJldCk7CgkJZ290byBvdXRfZnJlZTsKCX0KCgkv
KiBJZ25vcmUgb3V0cHV0IGRhdGEgb2YgemVybyBzaXplICovCglpZiAoIW91dHNpemUpCgkJZ290
byBvdXRfZnJlZTsKCglhY3R1YWxfb3V0c2l6ZSA9IG1pbihvdXRzaXplLCAoaW50KShvYmotPmJ1
ZmZlci5sZW5ndGggLSBzaXplb2YoKmJpb3NfcmV0dXJuKSkpOwoJbWVtY3B5KGJ1ZmZlciwgb2Jq
LT5idWZmZXIucG9pbnRlciArIHNpemVvZigqYmlvc19yZXR1cm4pLCBhY3R1YWxfb3V0c2l6ZSk7
CgltZW1zZXQoYnVmZmVyICsgYWN0dWFsX291dHNpemUsIDAsIG91dHNpemUgLSBhY3R1YWxfb3V0
c2l6ZSk7CgpvdXRfZnJlZToKCWtmcmVlKG9iaik7CglrZnJlZShhcmdzKTsKCXJldHVybiByZXQ7
Cn0KCi8qCiAqIENhbGxpbmcgdGhpcyBocF93bWlfZ2V0X2Zhbl9jb3VudF91c2VyZGVmaW5lX3Ry
aWdnZXIgZnVuY3Rpb24gYWxzbyBlbmFibGVzCiAqIGFuZC9vciBtYWludGFpbnMgdGhlIGxhcHRv
cCBpbiB1c2VyIGRlZmluZWQgdGhlcm1hbCBhbmQgZmFuIHN0YXRlcywgaW5zdGVhZAogKiBvZiB1
c2luZyBhIGZhbGxiYWNrIHN0YXRlLiBBZnRlciBhIDEyMCBzZWNvbmRzIHRpbWVvdXQgaG93ZXZl
ciwgdGhlIGxhcHRvcAogKiBnb2VzIGJhY2sgdG8gaXRzIGZhbGxiYWNrIHN0YXRlLgogKi8Kc3Rh
dGljIGludCBocF93bWlfZ2V0X2Zhbl9jb3VudF91c2VyZGVmaW5lX3RyaWdnZXIodm9pZCkKewoJ
dTggZmFuX2RhdGFbNF0gPSB7fTsKCWludCByZXQ7CgoJcmV0ID0gaHBfd21pX3BlcmZvcm1fcXVl
cnkoSFBXTUlfRkFOX0NPVU5UX0dFVF9RVUVSWSwgSFBXTUlfR00sCgkJCQkgICAmZmFuX2RhdGEs
IHNpemVvZih1OCksCgkJCQkgICBzaXplb2YoZmFuX2RhdGEpKTsKCWlmIChyZXQgIT0gMCkKCQly
ZXR1cm4gLUVJTlZBTDsKCglyZXR1cm4gZmFuX2RhdGFbMF07IC8qIE90aGVycyBieXRlcyBhcmVu
J3QgcHJvdmlkaW5nIGZhbiBjb3VudCAqLwp9CgpzdGF0aWMgaW50IGhwX3dtaV9nZXRfZmFuX3Nw
ZWVkKGludCBmYW4pCnsKCXU4IGZzaCwgZnNsOwoJY2hhciBmYW5fZGF0YVs0XSA9IHsgZmFuLCAw
LCAwLCAwIH07CgoJaW50IHJldCA9IGhwX3dtaV9wZXJmb3JtX3F1ZXJ5KEhQV01JX0ZBTl9TUEVF
RF9HRVRfUVVFUlksIEhQV01JX0dNLAoJCQkJICAgICAgICZmYW5fZGF0YSwgc2l6ZW9mKGNoYXIp
LAoJCQkJICAgICAgIHNpemVvZihmYW5fZGF0YSkpOwoKCWlmIChyZXQgIT0gMCkKCQlyZXR1cm4g
LUVJTlZBTDsKCglmc2ggPSBmYW5fZGF0YVsyXTsKCWZzbCA9IGZhbl9kYXRhWzNdOwoKCXJldHVy
biAoZnNoIDw8IDgpIHwgZnNsOwp9CgpzdGF0aWMgaW50IGhwX3dtaV9nZXRfZmFuX3NwZWVkX3Zp
Y3R1c19zKGludCBmYW4pCnsKCXU4IGZhbl9kYXRhWzEyOF0gPSB7fTsKCWludCByZXQ7CgoJaWYg
KGZhbiA8IDAgfHwgZmFuID49IHNpemVvZihmYW5fZGF0YSkpCgkJcmV0dXJuIC1FSU5WQUw7CgoJ
cmV0ID0gaHBfd21pX3BlcmZvcm1fcXVlcnkoSFBXTUlfVklDVFVTX1NfRkFOX1NQRUVEX0dFVF9R
VUVSWSwKCQkJCSAgIEhQV01JX0dNLCAmZmFuX2RhdGEsIHNpemVvZih1OCksCgkJCQkgICBzaXpl
b2YoZmFuX2RhdGEpKTsKCWlmIChyZXQgIT0gMCkKCQlyZXR1cm4gLUVJTlZBTDsKCglyZXR1cm4g
ZmFuX2RhdGFbZmFuXSAqIDEwMDsKfQoKc3RhdGljIGludCBocF93bWlfcmVhZF9pbnQoaW50IHF1
ZXJ5KQp7CglpbnQgdmFsID0gMCwgcmV0OwoKCXJldCA9IGhwX3dtaV9wZXJmb3JtX3F1ZXJ5KHF1
ZXJ5LCBIUFdNSV9SRUFELCAmdmFsLAoJCQkJICAgemVyb19pZl9zdXAodmFsKSwgc2l6ZW9mKHZh
bCkpOwoKCWlmIChyZXQpCgkJcmV0dXJuIHJldCA8IDAgPyByZXQgOiAtRUlOVkFMOwoKCXJldHVy
biB2YWw7Cn0KCnN0YXRpYyBpbnQgaHBfd21pX2dldF9kb2NrX3N0YXRlKHZvaWQpCnsKCWludCBz
dGF0ZSA9IGhwX3dtaV9yZWFkX2ludChIUFdNSV9IQVJEV0FSRV9RVUVSWSk7CgoJaWYgKHN0YXRl
IDwgMCkKCQlyZXR1cm4gc3RhdGU7CgoJcmV0dXJuICEhKHN0YXRlICYgSFBXTUlfRE9DS19NQVNL
KTsKfQoKc3RhdGljIGludCBocF93bWlfZ2V0X3RhYmxldF9tb2RlKHZvaWQpCnsKCWNoYXIgc3lz
dGVtX2RldmljZV9tb2RlWzRdID0geyAwIH07Cgljb25zdCBjaGFyICpjaGFzc2lzX3R5cGU7Cgli
b29sIHRhYmxldF9mb3VuZDsKCWludCByZXQ7CgoJY2hhc3Npc190eXBlID0gZG1pX2dldF9zeXN0
ZW1faW5mbyhETUlfQ0hBU1NJU19UWVBFKTsKCWlmICghY2hhc3Npc190eXBlKQoJCXJldHVybiAt
RU5PREVWOwoKCXRhYmxldF9mb3VuZCA9IG1hdGNoX3N0cmluZyh0YWJsZXRfY2hhc3Npc190eXBl
cywKCQkJCSAgICBBUlJBWV9TSVpFKHRhYmxldF9jaGFzc2lzX3R5cGVzKSwKCQkJCSAgICBjaGFz
c2lzX3R5cGUpID49IDA7CglpZiAoIXRhYmxldF9mb3VuZCkKCQlyZXR1cm4gLUVOT0RFVjsKCgly
ZXQgPSBocF93bWlfcGVyZm9ybV9xdWVyeShIUFdNSV9TWVNURU1fREVWSUNFX01PREUsIEhQV01J
X1JFQUQsCgkJCQkgICBzeXN0ZW1fZGV2aWNlX21vZGUsIHplcm9faWZfc3VwKHN5c3RlbV9kZXZp
Y2VfbW9kZSksCgkJCQkgICBzaXplb2Yoc3lzdGVtX2RldmljZV9tb2RlKSk7CglpZiAocmV0IDwg
MCkKCQlyZXR1cm4gcmV0OwoKCXJldHVybiBzeXN0ZW1fZGV2aWNlX21vZGVbMF0gPT0gREVWSUNF
X01PREVfVEFCTEVUOwp9CgpzdGF0aWMgaW50IG9tZW5fdGhlcm1hbF9wcm9maWxlX3NldChpbnQg
bW9kZSkKewoJLyogVGhlIE9tZW4gQ29udHJvbCBDZW50ZXIgYWN0aXZlbHkgc2V0cyB0aGUgZmly
c3QgYnl0ZSBvZiB0aGUgYnVmZmVyIHRvCgkgKiAyNTUsIHNvIGxldCdzIG1pbWljIHRoaXMgYmVo
YXZpb3VyIHRvIGJlIGFzIGNsb3NlIGFzIHBvc3NpYmxlIHRvCgkgKiB0aGUgb3JpZ2luYWwgc29m
dHdhcmUuCgkgKi8KCWNoYXIgYnVmZmVyWzJdID0gey0xLCBtb2RlfTsKCWludCByZXQ7CgoJcmV0
ID0gaHBfd21pX3BlcmZvcm1fcXVlcnkoSFBXTUlfU0VUX1BFUkZPUk1BTkNFX01PREUsIEhQV01J
X0dNLAoJCQkJICAgJmJ1ZmZlciwgc2l6ZW9mKGJ1ZmZlciksIDApOwoKCWlmIChyZXQpCgkJcmV0
dXJuIHJldCA8IDAgPyByZXQgOiAtRUlOVkFMOwoKCXJldHVybiBtb2RlOwp9CgpzdGF0aWMgYm9v
bCBpc19vbWVuX3RoZXJtYWxfcHJvZmlsZSh2b2lkKQp7Cgljb25zdCBjaGFyICpib2FyZF9uYW1l
ID0gZG1pX2dldF9zeXN0ZW1faW5mbyhETUlfQk9BUkRfTkFNRSk7CgoJaWYgKCFib2FyZF9uYW1l
KQoJCXJldHVybiBmYWxzZTsKCglyZXR1cm4gbWF0Y2hfc3RyaW5nKG9tZW5fdGhlcm1hbF9wcm9m
aWxlX2JvYXJkcywKCQkJICAgIEFSUkFZX1NJWkUob21lbl90aGVybWFsX3Byb2ZpbGVfYm9hcmRz
KSwKCQkJICAgIGJvYXJkX25hbWUpID49IDA7Cn0KCnN0YXRpYyBpbnQgb21lbl9nZXRfdGhlcm1h
bF9wb2xpY3lfdmVyc2lvbih2b2lkKQp7Cgl1bnNpZ25lZCBjaGFyIGJ1ZmZlcls4XSA9IHsgMCB9
OwoJaW50IHJldDsKCgljb25zdCBjaGFyICpib2FyZF9uYW1lID0gZG1pX2dldF9zeXN0ZW1faW5m
byhETUlfQk9BUkRfTkFNRSk7CgoJaWYgKGJvYXJkX25hbWUpIHsKCQlpbnQgbWF0Y2hlcyA9IG1h
dGNoX3N0cmluZyhvbWVuX3RoZXJtYWxfcHJvZmlsZV9mb3JjZV92MF9ib2FyZHMsCgkJCUFSUkFZ
X1NJWkUob21lbl90aGVybWFsX3Byb2ZpbGVfZm9yY2VfdjBfYm9hcmRzKSwKCQkJYm9hcmRfbmFt
ZSk7CgkJaWYgKG1hdGNoZXMgPj0gMCkKCQkJcmV0dXJuIDA7Cgl9CgoJcmV0ID0gaHBfd21pX3Bl
cmZvcm1fcXVlcnkoSFBXTUlfR0VUX1NZU1RFTV9ERVNJR05fREFUQSwgSFBXTUlfR00sCgkJCQkg
ICAmYnVmZmVyLCBzaXplb2YoYnVmZmVyKSwgc2l6ZW9mKGJ1ZmZlcikpOwoKCWlmIChyZXQpCgkJ
cmV0dXJuIHJldCA8IDAgPyByZXQgOiAtRUlOVkFMOwoKCXJldHVybiBidWZmZXJbM107Cn0KCnN0
YXRpYyBpbnQgb21lbl90aGVybWFsX3Byb2ZpbGVfZ2V0KHZvaWQpCnsKCXU4IGRhdGE7CgoJaW50
IHJldCA9IGVjX3JlYWQoSFBfT01FTl9FQ19USEVSTUFMX1BST0ZJTEVfT0ZGU0VULCAmZGF0YSk7
CgoJaWYgKHJldCkKCQlyZXR1cm4gcmV0OwoKCXJldHVybiBkYXRhOwp9CgpzdGF0aWMgaW50IGhw
X3dtaV9mYW5fc3BlZWRfbWF4X3NldChpbnQgZW5hYmxlZCkKewoJaW50IHJldDsKCglyZXQgPSBo
cF93bWlfcGVyZm9ybV9xdWVyeShIUFdNSV9GQU5fU1BFRURfTUFYX1NFVF9RVUVSWSwgSFBXTUlf
R00sCgkJCQkgICAmZW5hYmxlZCwgc2l6ZW9mKGVuYWJsZWQpLCAwKTsKCglpZiAocmV0KQoJCXJl
dHVybiByZXQgPCAwID8gcmV0IDogLUVJTlZBTDsKCglyZXR1cm4gZW5hYmxlZDsKfQoKc3RhdGlj
IGludCBocF93bWlfZmFuX3NwZWVkX3NldChzdHJ1Y3QgaHBfd21pX2h3bW9uX3ByaXYgKnByaXYp
CnsKCXU4IGZhbl9zcGVlZFsyXTsKCWludCByZXQ7CgoJaWYgKHByaXYtPmNwdV9wd20gPT0gSFBf
RkFOX1NQRUVEX0FVVE9NQVRJQykKCQlmYW5fc3BlZWRbQ1BVX0ZBTl0gPSBIUF9GQU5fU1BFRURf
QVVUT01BVElDOwoJZWxzZQoJCWZhbl9zcGVlZFtDUFVfRkFOXSA9IHB3bV90b19ycG0ocHJpdi0+
Y3B1X3B3bSwgcHJpdik7CgoJaWYgKHByaXYtPmdwdV9wd20gPT0gSFBfRkFOX1NQRUVEX0FVVE9N
QVRJQykKCQlmYW5fc3BlZWRbR1BVX0ZBTl0gPSBIUF9GQU5fU1BFRURfQVVUT01BVElDOwoJZWxz
ZQoJCWZhbl9zcGVlZFtHUFVfRkFOXSA9IHB3bV90b19ycG0ocHJpdi0+Z3B1X3B3bSwgcHJpdik7
CgoJcmV0ID0gaHBfd21pX2dldF9mYW5fY291bnRfdXNlcmRlZmluZV90cmlnZ2VyKCk7CglpZiAo
cmV0IDwgMCkKCQlyZXR1cm4gcmV0OwoJLyogTWF4IGZhbnMgbmVlZCB0byBiZSBleHBsaWNpdGx5
IGRpc2FibGVkICovCglyZXQgPSBocF93bWlfZmFuX3NwZWVkX21heF9zZXQoMCk7CglpZiAocmV0
IDwgMCkKCQlyZXR1cm4gcmV0OwoJcmV0ID0gaHBfd21pX3BlcmZvcm1fcXVlcnkoSFBXTUlfVklD
VFVTX1NfRkFOX1NQRUVEX1NFVF9RVUVSWSwgSFBXTUlfR00sCgkJCQkgICAmZmFuX3NwZWVkLCBz
aXplb2YoZmFuX3NwZWVkKSwgMCk7CgoJcmV0dXJuIHJldDsKfQoKc3RhdGljIGludCBocF93bWlf
ZmFuX3NwZWVkX3Jlc2V0KHN0cnVjdCBocF93bWlfaHdtb25fcHJpdiAqcHJpdikKewoJcHJpdi0+
Y3B1X3B3bSA9IEhQX0ZBTl9TUEVFRF9BVVRPTUFUSUM7Cglwcml2LT5ncHVfcHdtID0gSFBfRkFO
X1NQRUVEX0FVVE9NQVRJQzsKCXJldHVybiBocF93bWlfZmFuX3NwZWVkX3NldChwcml2KTsKfQoK
c3RhdGljIGludCBocF93bWlfZmFuX3NwZWVkX21heF9yZXNldChzdHJ1Y3QgaHBfd21pX2h3bW9u
X3ByaXYgKnByaXYpCnsKCWludCByZXQ7CgoJcmV0ID0gaHBfd21pX2Zhbl9zcGVlZF9tYXhfc2V0
KDApOwoJaWYgKHJldCkKCQlyZXR1cm4gcmV0OwoKCS8qIERpc2FibGluZyBtYXggZmFuIHNwZWVk
IG9uIFZpY3R1cyBzMXh4eCBsYXB0b3BzIG5lZWRzIGEgMm5kIHN0ZXA6ICovCglyZXR1cm4gaHBf
d21pX2Zhbl9zcGVlZF9yZXNldChwcml2KTsKfQoKc3RhdGljIGludCBfX2luaXQgaHBfd21pX2Jp
b3NfMjAwOF9sYXRlcih2b2lkKQp7CglpbnQgc3RhdGUgPSAwOwoJaW50IHJldCA9IGhwX3dtaV9w
ZXJmb3JtX3F1ZXJ5KEhQV01JX0ZFQVRVUkVfUVVFUlksIEhQV01JX1JFQUQsICZzdGF0ZSwKCQkJ
CSAgICAgICB6ZXJvX2lmX3N1cChzdGF0ZSksIHNpemVvZihzdGF0ZSkpOwoJaWYgKCFyZXQpCgkJ
cmV0dXJuIDE7CgoJcmV0dXJuIChyZXQgPT0gSFBXTUlfUkVUX1VOS05PV05fQ01EVFlQRSkgPyAw
IDogLUVOWElPOwp9CgpzdGF0aWMgaW50IF9faW5pdCBocF93bWlfYmlvc18yMDA5X2xhdGVyKHZv
aWQpCnsKCXU4IHN0YXRlWzEyOF07CglpbnQgcmV0ID0gaHBfd21pX3BlcmZvcm1fcXVlcnkoSFBX
TUlfRkVBVFVSRTJfUVVFUlksIEhQV01JX1JFQUQsICZzdGF0ZSwKCQkJCSAgICAgICB6ZXJvX2lm
X3N1cChzdGF0ZSksIHNpemVvZihzdGF0ZSkpOwoJaWYgKCFyZXQpCgkJcmV0dXJuIDE7CgoJcmV0
dXJuIChyZXQgPT0gSFBXTUlfUkVUX1VOS05PV05fQ01EVFlQRSkgPyAwIDogLUVOWElPOwp9Cgpz
dGF0aWMgaW50IF9faW5pdCBocF93bWlfZW5hYmxlX2hvdGtleXModm9pZCkKewoJaW50IHZhbHVl
ID0gMHg2ZTsKCWludCByZXQgPSBocF93bWlfcGVyZm9ybV9xdWVyeShIUFdNSV9CSU9TX1FVRVJZ
LCBIUFdNSV9XUklURSwgJnZhbHVlLAoJCQkJICAgICAgIHNpemVvZih2YWx1ZSksIDApOwoKCXJl
dHVybiByZXQgPD0gMCA/IHJldCA6IC1FSU5WQUw7Cn0KCnN0YXRpYyBpbnQgaHBfd21pX3NldF9i
bG9jayh2b2lkICpkYXRhLCBib29sIGJsb2NrZWQpCnsKCWVudW0gaHBfd21pX3JhZGlvIHIgPSAo
bG9uZylkYXRhOwoJaW50IHF1ZXJ5ID0gQklUKHIgKyA4KSB8ICgoIWJsb2NrZWQpIDw8IHIpOwoJ
aW50IHJldDsKCglyZXQgPSBocF93bWlfcGVyZm9ybV9xdWVyeShIUFdNSV9XSVJFTEVTU19RVUVS
WSwgSFBXTUlfV1JJVEUsCgkJCQkgICAmcXVlcnksIHNpemVvZihxdWVyeSksIDApOwoKCXJldHVy
biByZXQgPD0gMCA/IHJldCA6IC1FSU5WQUw7Cn0KCnN0YXRpYyBjb25zdCBzdHJ1Y3QgcmZraWxs
X29wcyBocF93bWlfcmZraWxsX29wcyA9IHsKCS5zZXRfYmxvY2sgPSBocF93bWlfc2V0X2Jsb2Nr
LAp9OwoKc3RhdGljIGJvb2wgaHBfd21pX2dldF9zd19zdGF0ZShlbnVtIGhwX3dtaV9yYWRpbyBy
KQp7CglpbnQgbWFzayA9IDB4MjAwIDw8IChyICogOCk7CgoJaW50IHdpcmVsZXNzID0gaHBfd21p
X3JlYWRfaW50KEhQV01JX1dJUkVMRVNTX1FVRVJZKTsKCgkvKiBUQkQ6IFBhc3MgZXJyb3IgKi8K
CVdBUk5fT05DRSh3aXJlbGVzcyA8IDAsICJlcnJvciBleGVjdXRpbmcgSFBXTUlfV0lSRUxFU1Nf
UVVFUlkiKTsKCglyZXR1cm4gISh3aXJlbGVzcyAmIG1hc2spOwp9CgpzdGF0aWMgYm9vbCBocF93
bWlfZ2V0X2h3X3N0YXRlKGVudW0gaHBfd21pX3JhZGlvIHIpCnsKCWludCBtYXNrID0gMHg4MDAg
PDwgKHIgKiA4KTsKCglpbnQgd2lyZWxlc3MgPSBocF93bWlfcmVhZF9pbnQoSFBXTUlfV0lSRUxF
U1NfUVVFUlkpOwoKCS8qIFRCRDogUGFzcyBlcnJvciAqLwoJV0FSTl9PTkNFKHdpcmVsZXNzIDwg
MCwgImVycm9yIGV4ZWN1dGluZyBIUFdNSV9XSVJFTEVTU19RVUVSWSIpOwoKCXJldHVybiAhKHdp
cmVsZXNzICYgbWFzayk7Cn0KCnN0YXRpYyBpbnQgaHBfd21pX3Jma2lsbDJfc2V0X2Jsb2NrKHZv
aWQgKmRhdGEsIGJvb2wgYmxvY2tlZCkKewoJaW50IHJma2lsbF9pZCA9IChpbnQpKGxvbmcpZGF0
YTsKCWNoYXIgYnVmZmVyWzRdID0geyAweDAxLCAweDAwLCByZmtpbGxfaWQsICFibG9ja2VkIH07
CglpbnQgcmV0OwoKCXJldCA9IGhwX3dtaV9wZXJmb3JtX3F1ZXJ5KEhQV01JX1dJUkVMRVNTMl9R
VUVSWSwgSFBXTUlfV1JJVEUsCgkJCQkgICBidWZmZXIsIHNpemVvZihidWZmZXIpLCAwKTsKCgly
ZXR1cm4gcmV0IDw9IDAgPyByZXQgOiAtRUlOVkFMOwp9CgpzdGF0aWMgY29uc3Qgc3RydWN0IHJm
a2lsbF9vcHMgaHBfd21pX3Jma2lsbDJfb3BzID0gewoJLnNldF9ibG9jayA9IGhwX3dtaV9yZmtp
bGwyX3NldF9ibG9jaywKfTsKCnN0YXRpYyBpbnQgaHBfd21pX3Jma2lsbDJfcmVmcmVzaCh2b2lk
KQp7CglzdHJ1Y3QgYmlvc19yZmtpbGwyX3N0YXRlIHN0YXRlOwoJaW50IGVyciwgaTsKCgllcnIg
PSBocF93bWlfcGVyZm9ybV9xdWVyeShIUFdNSV9XSVJFTEVTUzJfUVVFUlksIEhQV01JX1JFQUQs
ICZzdGF0ZSwKCQkJCSAgIHplcm9faWZfc3VwKHN0YXRlKSwgc2l6ZW9mKHN0YXRlKSk7CglpZiAo
ZXJyKQoJCXJldHVybiBlcnI7CgoJZm9yIChpID0gMDsgaSA8IHJma2lsbDJfY291bnQ7IGkrKykg
ewoJCWludCBudW0gPSByZmtpbGwyW2ldLm51bTsKCQlzdHJ1Y3QgYmlvc19yZmtpbGwyX2Rldmlj
ZV9zdGF0ZSAqZGV2c3RhdGU7CgoJCWRldnN0YXRlID0gJnN0YXRlLmRldmljZVtudW1dOwoKCQlp
ZiAobnVtID49IHN0YXRlLmNvdW50IHx8CgkJICAgIGRldnN0YXRlLT5yZmtpbGxfaWQgIT0gcmZr
aWxsMltpXS5pZCkgewoJCQlwcl93YXJuKCJwb3dlciBjb25maWd1cmF0aW9uIG9mIHRoZSB3aXJl
bGVzcyBkZXZpY2VzIHVuZXhwZWN0ZWRseSBjaGFuZ2VkXG4iKTsKCQkJY29udGludWU7CgkJfQoK
CQlyZmtpbGxfc2V0X3N0YXRlcyhyZmtpbGwyW2ldLnJma2lsbCwKCQkJCSAgSVNfU1dCTE9DS0VE
KGRldnN0YXRlLT5wb3dlciksCgkJCQkgIElTX0hXQkxPQ0tFRChkZXZzdGF0ZS0+cG93ZXIpKTsK
CX0KCglyZXR1cm4gMDsKfQoKc3RhdGljIHNzaXplX3QgZGlzcGxheV9zaG93KHN0cnVjdCBkZXZp
Y2UgKmRldiwgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsCgkJCSAgICBjaGFyICpidWYp
CnsKCWludCB2YWx1ZSA9IGhwX3dtaV9yZWFkX2ludChIUFdNSV9ESVNQTEFZX1FVRVJZKTsKCglp
ZiAodmFsdWUgPCAwKQoJCXJldHVybiB2YWx1ZTsKCXJldHVybiBzeXNmc19lbWl0KGJ1ZiwgIiVk
XG4iLCB2YWx1ZSk7Cn0KCnN0YXRpYyBzc2l6ZV90IGhkZHRlbXBfc2hvdyhzdHJ1Y3QgZGV2aWNl
ICpkZXYsIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHRyLAoJCQkgICAgY2hhciAqYnVmKQp7
CglpbnQgdmFsdWUgPSBocF93bWlfcmVhZF9pbnQoSFBXTUlfSEREVEVNUF9RVUVSWSk7CgoJaWYg
KHZhbHVlIDwgMCkKCQlyZXR1cm4gdmFsdWU7CglyZXR1cm4gc3lzZnNfZW1pdChidWYsICIlZFxu
IiwgdmFsdWUpOwp9CgpzdGF0aWMgc3NpemVfdCBhbHNfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYs
IHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHRyLAoJCQljaGFyICpidWYpCnsKCWludCB2YWx1
ZSA9IGhwX3dtaV9yZWFkX2ludChIUFdNSV9BTFNfUVVFUlkpOwoKCWlmICh2YWx1ZSA8IDApCgkJ
cmV0dXJuIHZhbHVlOwoJcmV0dXJuIHN5c2ZzX2VtaXQoYnVmLCAiJWRcbiIsIHZhbHVlKTsKfQoK
c3RhdGljIHNzaXplX3QgZG9ja19zaG93KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmlj
ZV9hdHRyaWJ1dGUgKmF0dHIsCgkJCSBjaGFyICpidWYpCnsKCWludCB2YWx1ZSA9IGhwX3dtaV9n
ZXRfZG9ja19zdGF0ZSgpOwoKCWlmICh2YWx1ZSA8IDApCgkJcmV0dXJuIHZhbHVlOwoJcmV0dXJu
IHN5c2ZzX2VtaXQoYnVmLCAiJWRcbiIsIHZhbHVlKTsKfQoKc3RhdGljIHNzaXplX3QgdGFibGV0
X3Nob3coc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwK
CQkJICAgY2hhciAqYnVmKQp7CglpbnQgdmFsdWUgPSBocF93bWlfZ2V0X3RhYmxldF9tb2RlKCk7
CgoJaWYgKHZhbHVlIDwgMCkKCQlyZXR1cm4gdmFsdWU7CglyZXR1cm4gc3lzZnNfZW1pdChidWYs
ICIlZFxuIiwgdmFsdWUpOwp9CgpzdGF0aWMgc3NpemVfdCBwb3N0Y29kZV9zaG93KHN0cnVjdCBk
ZXZpY2UgKmRldiwgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsCgkJCSAgICAgY2hhciAq
YnVmKQp7CgkvKiBHZXQgdGhlIFBPU1QgZXJyb3IgY29kZSBvZiBwcmV2aW91cyBib290IGZhaWx1
cmUuICovCglpbnQgdmFsdWUgPSBocF93bWlfcmVhZF9pbnQoSFBXTUlfUE9TVENPREVFUlJPUl9R
VUVSWSk7CgoJaWYgKHZhbHVlIDwgMCkKCQlyZXR1cm4gdmFsdWU7CglyZXR1cm4gc3lzZnNfZW1p
dChidWYsICIweCV4XG4iLCB2YWx1ZSk7Cn0KCnN0YXRpYyBzc2l6ZV90IGFsc19zdG9yZShzdHJ1
Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHRyLAoJCQkgY29uc3Qg
Y2hhciAqYnVmLCBzaXplX3QgY291bnQpCnsKCXUzMiB0bXA7CglpbnQgcmV0OwoKCXJldCA9IGtz
dHJ0b3UzMihidWYsIDEwLCAmdG1wKTsKCWlmIChyZXQpCgkJcmV0dXJuIHJldDsKCglyZXQgPSBo
cF93bWlfcGVyZm9ybV9xdWVyeShIUFdNSV9BTFNfUVVFUlksIEhQV01JX1dSSVRFLCAmdG1wLAoJ
CQkJICAgICAgIHNpemVvZih0bXApLCAwKTsKCWlmIChyZXQpCgkJcmV0dXJuIHJldCA8IDAgPyBy
ZXQgOiAtRUlOVkFMOwoKCXJldHVybiBjb3VudDsKfQoKc3RhdGljIHNzaXplX3QgcG9zdGNvZGVf
c3RvcmUoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwK
CQkJICAgICAgY29uc3QgY2hhciAqYnVmLCBzaXplX3QgY291bnQpCnsKCXUzMiB0bXAgPSAxOwoJ
Ym9vbCBjbGVhcjsKCWludCByZXQ7CgoJcmV0ID0ga3N0cnRvYm9vbChidWYsICZjbGVhcik7Cglp
ZiAocmV0KQoJCXJldHVybiByZXQ7CgoJaWYgKGNsZWFyID09IGZhbHNlKQoJCXJldHVybiAtRUlO
VkFMOwoKCS8qIENsZWFyIHRoZSBQT1NUIGVycm9yIGNvZGUuIEl0IGlzIGtlcHQgdW50aWwgY2xl
YXJlZC4gKi8KCXJldCA9IGhwX3dtaV9wZXJmb3JtX3F1ZXJ5KEhQV01JX1BPU1RDT0RFRVJST1Jf
UVVFUlksIEhQV01JX1dSSVRFLCAmdG1wLAoJCQkJICAgICAgIHNpemVvZih0bXApLCAwKTsKCWlm
IChyZXQpCgkJcmV0dXJuIHJldCA8IDAgPyByZXQgOiAtRUlOVkFMOwoKCXJldHVybiBjb3VudDsK
fQoKc3RhdGljIGludCBjYW1lcmFfc2h1dHRlcl9pbnB1dF9zZXR1cCh2b2lkKQp7CglpbnQgZXJy
OwoKCWNhbWVyYV9zaHV0dGVyX2lucHV0X2RldiA9IGlucHV0X2FsbG9jYXRlX2RldmljZSgpOwoJ
aWYgKCFjYW1lcmFfc2h1dHRlcl9pbnB1dF9kZXYpCgkJcmV0dXJuIC1FTk9NRU07CgoJY2FtZXJh
X3NodXR0ZXJfaW5wdXRfZGV2LT5uYW1lID0gIkhQIFdNSSBjYW1lcmEgc2h1dHRlciI7CgljYW1l
cmFfc2h1dHRlcl9pbnB1dF9kZXYtPnBoeXMgPSAid21pL2lucHV0MSI7CgljYW1lcmFfc2h1dHRl
cl9pbnB1dF9kZXYtPmlkLmJ1c3R5cGUgPSBCVVNfSE9TVDsKCglfX3NldF9iaXQoRVZfU1csIGNh
bWVyYV9zaHV0dGVyX2lucHV0X2Rldi0+ZXZiaXQpOwoJX19zZXRfYml0KFNXX0NBTUVSQV9MRU5T
X0NPVkVSLCBjYW1lcmFfc2h1dHRlcl9pbnB1dF9kZXYtPnN3Yml0KTsKCgllcnIgPSBpbnB1dF9y
ZWdpc3Rlcl9kZXZpY2UoY2FtZXJhX3NodXR0ZXJfaW5wdXRfZGV2KTsKCWlmIChlcnIpCgkJZ290
byBlcnJfZnJlZV9kZXY7CgoJcmV0dXJuIDA7CgogZXJyX2ZyZWVfZGV2OgoJaW5wdXRfZnJlZV9k
ZXZpY2UoY2FtZXJhX3NodXR0ZXJfaW5wdXRfZGV2KTsKCWNhbWVyYV9zaHV0dGVyX2lucHV0X2Rl
diA9IE5VTEw7CglyZXR1cm4gZXJyOwp9CgpzdGF0aWMgY29uc3QgdTggbXV4X2JpdG1hc2tfbWFw
W10gPSB7CglbMF0gPSBIUFdNSV9NVVhfTU9ERV9IWUJSSUQsCglbMV0gPSBIUFdNSV9NVVhfTU9E
RV9ESVNDUkVURSwKCVsyXSA9IEhQV01JX01VWF9NT0RFX09QVElNVVMsCglbM10gPSBIUFdNSV9N
VVhfTU9ERV9VTUEsCn07CgpzdGF0aWMgaW50IGhwX3dtaV9nZXRfbXV4X3N1cHBvcnRlZF9tb2Rl
cyh1OCAqc3VwcG9ydGVkKQp7Cgl1OCBsZWdhY3lfYnVmZmVyWzRdID0ge307Cgl1OCBidWZmZXJb
MTI4XSA9IHt9OwoJdTMyIHJlcV9wYWNrZXQgPSAwOwoJaW50IHJldDsKCglpZiAoIXN1cHBvcnRl
ZCkKCQlyZXR1cm4gLUVJTlZBTDsKCgkvKiBUcnkgbW9kZXJuIEJJT1MgZGVzaWduIGRhdGEgcXVl
cnkgKDEyOC1ieXRlIGJ1ZmZlcikgKi8KCXJldCA9IGhwX3dtaV9wZXJmb3JtX3F1ZXJ5KEhQV01J
X0dFVF9TWVNURU1fREVTSUdOX0RBVEEsIEhQV01JX0dNLAoJCQkJICAgYnVmZmVyLCB6ZXJvX2lm
X3N1cChyZXFfcGFja2V0KSwgc2l6ZW9mKGJ1ZmZlcikpOwoJaWYgKHJldCA9PSAwKSB7CgkJKnN1
cHBvcnRlZCA9IGJ1ZmZlcls3XTsKCQlyZXR1cm4gMDsKCX0KCgkvKgoJICogKEZhbGxiYWNrKTog
TGVnYWN5IEJJT1MgYmVoYXZpb3IgYmFzZWQgb24gT21lbiBHYW1pbmcgSHViLgoJICogSWYgdGhl
IG1vZGVybiBxdWVyeSBpcyBub3Qgc3VwcG9ydGVkLCBjaGVjayBpZiB0aGUgTVVYIHF1ZXJ5IGVu
ZHBvaW50CgkgKiByZXNwb25kcyB0byBhIHJlYWQgcmVxdWVzdC4gSWYgaXQgc3VjY2VlZHMsIHRo
ZSBoYXJkd2FyZSBoYXMgTVVYCgkgKiBjYXBhYmlsaXR5IGJ1dCBsYWNrcyB0aGUgbW9kZSBtYXAs
IGRlZmF1bHRpbmcgdG8gSHlicmlkICsgRGlzY3JldGUuCgkgKi8KCXJldCA9IGhwX3dtaV9wZXJm
b3JtX3F1ZXJ5KEhQV01JX0dSQVBISUNTX01VWF9RVUVSWSwgSFBXTUlfUkVBRCwKCQkJCSAgIGxl
Z2FjeV9idWZmZXIsIHNpemVvZihsZWdhY3lfYnVmZmVyKSwgMCk7CglpZiAocmV0IDwgMCkKCQly
ZXR1cm4gcmV0OwoJaWYgKHJldCA+IDApCgkJcmV0dXJuIC1FSU5WQUw7CgoJKnN1cHBvcnRlZCA9
IEhQV01JX01VWF9MRUdBQ1lfTUFTSzsKCXJldHVybiAwOwp9CgpzdGF0aWMgaW50IGhwX3dtaV9n
ZXRfbXV4X21vZGUodTggKm1vZGUpCnsKCXU4IGJ1ZmZlcls0XSA9IHt9OwoJaW50IHJldDsKCglp
ZiAoIW1vZGUpCgkJcmV0dXJuIC1FSU5WQUw7CgoJcmV0ID0gaHBfd21pX3BlcmZvcm1fcXVlcnko
SFBXTUlfR1JBUEhJQ1NfTVVYX1FVRVJZLCBIUFdNSV9SRUFELAoJCQkJICAgYnVmZmVyLCBzaXpl
b2YoYnVmZmVyKSwgc2l6ZW9mKGJ1ZmZlcikpOwoJaWYgKHJldCA8IDApCgkJcmV0dXJuIHJldDsK
CWlmIChyZXQgPiAwKQoJCXJldHVybiAtRUlOVkFMOwoKCS8qIE1hc2sgdGhlIGhpZ2hlc3QgYml0
LCB3aGljaCBtaWdodCBiZSB1c2VkIGFzIGEgQklPUyBzdGF0dXMgZmxhZyAqLwoJKm1vZGUgPSBi
dWZmZXJbMF0gJiBIUFdNSV9NVVhfTU9ERV9NQVNLOwoJcmV0dXJuIDA7Cn0KCnN0YXRpYyBpbnQg
aHBfd21pX3NldF9tdXhfbW9kZSh1OCBtb2RlKQp7Cgl1OCBidWZmZXJbNF0gPSB7IG1vZGUsIDB4
MDAsIDB4MDAsIDB4MDAgfTsKCWludCByZXQ7CgoJcmV0ID0gaHBfd21pX3BlcmZvcm1fcXVlcnko
SFBXTUlfR1JBUEhJQ1NfTVVYX1FVRVJZLCBIUFdNSV9XUklURSwKCQkJCSAgIGJ1ZmZlciwgc2l6
ZW9mKGJ1ZmZlciksIHNpemVvZihidWZmZXIpKTsKCWlmIChyZXQgPCAwKQoJCXJldHVybiByZXQ7
CglpZiAocmV0ID4gMCkKCQlyZXR1cm4gLUVJTlZBTDsKCglyZXR1cm4gMDsKfQoKc3RhdGljIHNz
aXplX3QgZ3B1X211eF9tb2RlX3Nob3coc3RydWN0IGRldmljZSAqZGV2LAoJCQkJIHN0cnVjdCBk
ZXZpY2VfYXR0cmlidXRlICphdHRyLAoJCQkJIGNoYXIgKmJ1ZikKewoJdTggbW9kZTsKCWludCBy
ZXQ7CgoJcmV0ID0gaHBfd21pX2dldF9tdXhfbW9kZSgmbW9kZSk7CglpZiAocmV0KQoJCXJldHVy
biByZXQ7CgoJcmV0dXJuIHN5c2ZzX2VtaXQoYnVmLCAiJXVcbiIsIG1vZGUpOwp9CgpzdGF0aWMg
c3NpemVfdCBncHVfbXV4X21vZGVfc3RvcmUoc3RydWN0IGRldmljZSAqZGV2LAoJCQkJICBzdHJ1
Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwKCQkJCSAgY29uc3QgY2hhciAqYnVmLAoJCQkJICBz
aXplX3QgY291bnQpCnsKCXUzMiByZXF1ZXN0ZWQ7Cgl1OCBzdXBwb3J0ZWQ7CglpbnQgcmV0OwoK
CXJldCA9IGtzdHJ0b3UzMihidWYsIDAsICZyZXF1ZXN0ZWQpOwoJaWYgKHJldCkKCQlyZXR1cm4g
cmV0OwoJaWYgKHJlcXVlc3RlZCA+PSBBUlJBWV9TSVpFKG11eF9iaXRtYXNrX21hcCkpCgkJcmV0
dXJuIC1FSU5WQUw7CgoJcmV0ID0gaHBfd21pX2dldF9tdXhfc3VwcG9ydGVkX21vZGVzKCZzdXBw
b3J0ZWQpOwoJaWYgKHJldCkKCQlyZXR1cm4gcmV0OwoKCS8qIFZlcmlmeSBpZiB0aGUgcmVxdWVz
dGVkIG1vZGUgaXMgYWxsb3dlZCBieSB0aGUgaGFyZHdhcmUgbWFzayAqLwoJaWYgKCEoc3VwcG9y
dGVkICYgbXV4X2JpdG1hc2tfbWFwW3JlcXVlc3RlZF0pKQoJCXJldHVybiAtRU9QTk9UU1VQUDsK
CglyZXQgPSBocF93bWlfc2V0X211eF9tb2RlKHJlcXVlc3RlZCk7CglpZiAocmV0KQoJCXJldHVy
biByZXQ7CgoJcmV0dXJuIGNvdW50Owp9CgpzdGF0aWMgREVWSUNFX0FUVFJfUk8oZGlzcGxheSk7
CnN0YXRpYyBERVZJQ0VfQVRUUl9STyhoZGR0ZW1wKTsKc3RhdGljIERFVklDRV9BVFRSX1JXKGFs
cyk7CnN0YXRpYyBERVZJQ0VfQVRUUl9STyhkb2NrKTsKc3RhdGljIERFVklDRV9BVFRSX1JPKHRh
YmxldCk7CnN0YXRpYyBERVZJQ0VfQVRUUl9SVyhwb3N0Y29kZSk7CnN0YXRpYyBERVZJQ0VfQVRU
Ul9SVyhncHVfbXV4X21vZGUpOwoKc3RhdGljIHN0cnVjdCBhdHRyaWJ1dGUgKmhwX3dtaV9hdHRy
c1tdID0gewoJJmRldl9hdHRyX2Rpc3BsYXkuYXR0ciwKCSZkZXZfYXR0cl9oZGR0ZW1wLmF0dHIs
CgkmZGV2X2F0dHJfYWxzLmF0dHIsCgkmZGV2X2F0dHJfZG9jay5hdHRyLAoJJmRldl9hdHRyX3Rh
YmxldC5hdHRyLAoJJmRldl9hdHRyX3Bvc3Rjb2RlLmF0dHIsCgkmZGV2X2F0dHJfZ3B1X211eF9t
b2RlLmF0dHIsCglOVUxMLAp9OwpBVFRSSUJVVEVfR1JPVVBTKGhwX3dtaSk7CgpzdGF0aWMgdm9p
ZCBocF93bWlfbm90aWZ5KHVuaW9uIGFjcGlfb2JqZWN0ICpvYmosIHZvaWQgKmNvbnRleHQpCnsK
CXUzMiBldmVudF9pZCwgZXZlbnRfZGF0YTsKCXUzMiAqbG9jYXRpb247CglpbnQga2V5X2NvZGU7
CgoJaWYgKCFvYmopCgkJcmV0dXJuOwoJaWYgKG9iai0+dHlwZSAhPSBBQ1BJX1RZUEVfQlVGRkVS
KSB7CgkJcHJfaW5mbygiVW5rbm93biByZXNwb25zZSByZWNlaXZlZCAlZFxuIiwgb2JqLT50eXBl
KTsKCQlyZXR1cm47Cgl9CgoJLyoKCSAqIERlcGVuZGluZyBvbiBBQ1BJIHZlcnNpb24gdGhlIGNv
bmNhdGVuYXRpb24gb2YgaWQgYW5kIGV2ZW50IGRhdGEKCSAqIGluc2lkZSBfV0VEIGZ1bmN0aW9u
IHdpbGwgcmVzdWx0IGluIGEgOCBvciAxNiBieXRlIGJ1ZmZlci4KCSAqLwoJbG9jYXRpb24gPSAo
dTMyICopb2JqLT5idWZmZXIucG9pbnRlcjsKCWlmIChvYmotPmJ1ZmZlci5sZW5ndGggPT0gOCkg
ewoJCWV2ZW50X2lkID0gKmxvY2F0aW9uOwoJCWV2ZW50X2RhdGEgPSAqKGxvY2F0aW9uICsgMSk7
Cgl9IGVsc2UgaWYgKG9iai0+YnVmZmVyLmxlbmd0aCA9PSAxNikgewoJCWV2ZW50X2lkID0gKmxv
Y2F0aW9uOwoJCWV2ZW50X2RhdGEgPSAqKGxvY2F0aW9uICsgMik7Cgl9IGVsc2UgewoJCXByX2lu
Zm8oIlVua25vd24gYnVmZmVyIGxlbmd0aCAlZFxuIiwgb2JqLT5idWZmZXIubGVuZ3RoKTsKCQly
ZXR1cm47Cgl9CgoJc3dpdGNoIChldmVudF9pZCkgewoJY2FzZSBIUFdNSV9ET0NLX0VWRU5UOgoJ
CWlmICh0ZXN0X2JpdChTV19ET0NLLCBocF93bWlfaW5wdXRfZGV2LT5zd2JpdCkpCgkJCWlucHV0
X3JlcG9ydF9zd2l0Y2goaHBfd21pX2lucHV0X2RldiwgU1dfRE9DSywKCQkJCQkgICAgaHBfd21p
X2dldF9kb2NrX3N0YXRlKCkpOwoJCWlmICh0ZXN0X2JpdChTV19UQUJMRVRfTU9ERSwgaHBfd21p
X2lucHV0X2Rldi0+c3diaXQpKQoJCQlpbnB1dF9yZXBvcnRfc3dpdGNoKGhwX3dtaV9pbnB1dF9k
ZXYsIFNXX1RBQkxFVF9NT0RFLAoJCQkJCSAgICBocF93bWlfZ2V0X3RhYmxldF9tb2RlKCkpOwoJ
CWlucHV0X3N5bmMoaHBfd21pX2lucHV0X2Rldik7CgkJYnJlYWs7CgljYXNlIEhQV01JX1BBUktf
SEREOgoJCWJyZWFrOwoJY2FzZSBIUFdNSV9TTUFSVF9BREFQVEVSOgoJCWJyZWFrOwoJY2FzZSBI
UFdNSV9CRVpFTF9CVVRUT046CgkJa2V5X2NvZGUgPSBocF93bWlfcmVhZF9pbnQoSFBXTUlfSE9U
S0VZX1FVRVJZKTsKCQlpZiAoa2V5X2NvZGUgPCAwKQoJCQlicmVhazsKCgkJaWYgKCFzcGFyc2Vf
a2V5bWFwX3JlcG9ydF9ldmVudChocF93bWlfaW5wdXRfZGV2LAoJCQkJCQlrZXlfY29kZSwgMSwg
dHJ1ZSkpCgkJCXByX2luZm8oIlVua25vd24ga2V5IGNvZGUgLSAweCV4XG4iLCBrZXlfY29kZSk7
CgkJYnJlYWs7CgljYXNlIEhQV01JX0ZOX1BfSE9US0VZOgoJCXBsYXRmb3JtX3Byb2ZpbGVfY3lj
bGUoKTsKCQlicmVhazsKCWNhc2UgSFBXTUlfT01FTl9LRVk6CgkJaWYgKGV2ZW50X2RhdGEpIC8q
IE9ubHkgc2hvdWxkIGJlIHRydWUgZm9yIEhQIE9tZW4gKi8KCQkJa2V5X2NvZGUgPSBldmVudF9k
YXRhOwoJCWVsc2UKCQkJa2V5X2NvZGUgPSBocF93bWlfcmVhZF9pbnQoSFBXTUlfSE9US0VZX1FV
RVJZKTsKCgkJaWYgKCFzcGFyc2Vfa2V5bWFwX3JlcG9ydF9ldmVudChocF93bWlfaW5wdXRfZGV2
LAoJCQkJCQlrZXlfY29kZSwgMSwgdHJ1ZSkpCgkJCXByX2luZm8oIlVua25vd24ga2V5IGNvZGUg
LSAweCV4XG4iLCBrZXlfY29kZSk7CgkJYnJlYWs7CgljYXNlIEhQV01JX1dJUkVMRVNTOgoJCWlm
IChyZmtpbGwyX2NvdW50KSB7CgkJCWhwX3dtaV9yZmtpbGwyX3JlZnJlc2goKTsKCQkJYnJlYWs7
CgkJfQoKCQlpZiAod2lmaV9yZmtpbGwpCgkJCXJma2lsbF9zZXRfc3RhdGVzKHdpZmlfcmZraWxs
LAoJCQkJCSAgaHBfd21pX2dldF9zd19zdGF0ZShIUFdNSV9XSUZJKSwKCQkJCQkgIGhwX3dtaV9n
ZXRfaHdfc3RhdGUoSFBXTUlfV0lGSSkpOwoJCWlmIChibHVldG9vdGhfcmZraWxsKQoJCQlyZmtp
bGxfc2V0X3N0YXRlcyhibHVldG9vdGhfcmZraWxsLAoJCQkJCSAgaHBfd21pX2dldF9zd19zdGF0
ZShIUFdNSV9CTFVFVE9PVEgpLAoJCQkJCSAgaHBfd21pX2dldF9od19zdGF0ZShIUFdNSV9CTFVF
VE9PVEgpKTsKCQlpZiAod3dhbl9yZmtpbGwpCgkJCXJma2lsbF9zZXRfc3RhdGVzKHd3YW5fcmZr
aWxsLAoJCQkJCSAgaHBfd21pX2dldF9zd19zdGF0ZShIUFdNSV9XV0FOKSwKCQkJCQkgIGhwX3dt
aV9nZXRfaHdfc3RhdGUoSFBXTUlfV1dBTikpOwoJCWJyZWFrOwoJY2FzZSBIUFdNSV9DUFVfQkFU
VEVSWV9USFJPVFRMRToKCQlwcl9pbmZvKCJVbmltcGxlbWVudGVkIENQVSB0aHJvdHRsZSBiZWNh
dXNlIG9mIDMgQ2VsbCBiYXR0ZXJ5IGV2ZW50IGRldGVjdGVkXG4iKTsKCQlicmVhazsKCWNhc2Ug
SFBXTUlfTE9DS19TV0lUQ0g6CgkJYnJlYWs7CgljYXNlIEhQV01JX0xJRF9TV0lUQ0g6CgkJYnJl
YWs7CgljYXNlIEhQV01JX1NDUkVFTl9ST1RBVElPTjoKCQlicmVhazsKCWNhc2UgSFBXTUlfQ09P
TFNFTlNFX1NZU1RFTV9NT0JJTEU6CgkJYnJlYWs7CgljYXNlIEhQV01JX0NPT0xTRU5TRV9TWVNU
RU1fSE9UOgoJCWJyZWFrOwoJY2FzZSBIUFdNSV9QUk9YSU1JVFlfU0VOU09SOgoJCWJyZWFrOwoJ
Y2FzZSBIUFdNSV9CQUNLTElUX0tCX0JSSUdIVE5FU1M6CgkJYnJlYWs7CgljYXNlIEhQV01JX1BF
QUtTSElGVF9QRVJJT0Q6CgkJYnJlYWs7CgljYXNlIEhQV01JX0JBVFRFUllfQ0hBUkdFX1BFUklP
RDoKCQlicmVhazsKCWNhc2UgSFBXTUlfU0FOSVRJWkFUSU9OX01PREU6CgkJYnJlYWs7CgljYXNl
IEhQV01JX0NBTUVSQV9UT0dHTEU6CgkJaWYgKCFjYW1lcmFfc2h1dHRlcl9pbnB1dF9kZXYpCgkJ
CWlmIChjYW1lcmFfc2h1dHRlcl9pbnB1dF9zZXR1cCgpKSB7CgkJCQlwcl9lcnIoIkZhaWxlZCB0
byBzZXR1cCBjYW1lcmEgc2h1dHRlciBpbnB1dCBkZXZpY2VcbiIpOwoJCQkJYnJlYWs7CgkJCX0K
CQlpZiAoZXZlbnRfZGF0YSA9PSAweGZmKQoJCQlpbnB1dF9yZXBvcnRfc3dpdGNoKGNhbWVyYV9z
aHV0dGVyX2lucHV0X2RldiwgU1dfQ0FNRVJBX0xFTlNfQ09WRVIsIDEpOwoJCWVsc2UgaWYgKGV2
ZW50X2RhdGEgPT0gMHhmZSkKCQkJaW5wdXRfcmVwb3J0X3N3aXRjaChjYW1lcmFfc2h1dHRlcl9p
bnB1dF9kZXYsIFNXX0NBTUVSQV9MRU5TX0NPVkVSLCAwKTsKCQllbHNlCgkJCXByX3dhcm4oIlVu
a25vd24gY2FtZXJhIHNodXR0ZXIgc3RhdGUgLSAweCV4XG4iLCBldmVudF9kYXRhKTsKCQlpbnB1
dF9zeW5jKGNhbWVyYV9zaHV0dGVyX2lucHV0X2Rldik7CgkJYnJlYWs7CgljYXNlIEhQV01JX1NN
QVJUX0VYUEVSSUVOQ0VfQVBQOgoJCWJyZWFrOwoJZGVmYXVsdDoKCQlwcl9pbmZvKCJVbmtub3du
IGV2ZW50X2lkIC0gJWQgLSAweCV4XG4iLCBldmVudF9pZCwgZXZlbnRfZGF0YSk7CgkJYnJlYWs7
Cgl9Cn0KCnN0YXRpYyBpbnQgX19pbml0IGhwX3dtaV9pbnB1dF9zZXR1cCh2b2lkKQp7CglhY3Bp
X3N0YXR1cyBzdGF0dXM7CglpbnQgZXJyLCB2YWw7CgoJaHBfd21pX2lucHV0X2RldiA9IGlucHV0
X2FsbG9jYXRlX2RldmljZSgpOwoJaWYgKCFocF93bWlfaW5wdXRfZGV2KQoJCXJldHVybiAtRU5P
TUVNOwoKCWhwX3dtaV9pbnB1dF9kZXYtPm5hbWUgPSAiSFAgV01JIGhvdGtleXMiOwoJaHBfd21p
X2lucHV0X2Rldi0+cGh5cyA9ICJ3bWkvaW5wdXQwIjsKCWhwX3dtaV9pbnB1dF9kZXYtPmlkLmJ1
c3R5cGUgPSBCVVNfSE9TVDsKCglfX3NldF9iaXQoRVZfU1csIGhwX3dtaV9pbnB1dF9kZXYtPmV2
Yml0KTsKCgkvKiBEb2NrICovCgl2YWwgPSBocF93bWlfZ2V0X2RvY2tfc3RhdGUoKTsKCWlmICgh
KHZhbCA8IDApKSB7CgkJX19zZXRfYml0KFNXX0RPQ0ssIGhwX3dtaV9pbnB1dF9kZXYtPnN3Yml0
KTsKCQlpbnB1dF9yZXBvcnRfc3dpdGNoKGhwX3dtaV9pbnB1dF9kZXYsIFNXX0RPQ0ssIHZhbCk7
Cgl9CgoJLyogVGFibGV0IG1vZGUgKi8KCXZhbCA9IGhwX3dtaV9nZXRfdGFibGV0X21vZGUoKTsK
CWlmICghKHZhbCA8IDApKSB7CgkJX19zZXRfYml0KFNXX1RBQkxFVF9NT0RFLCBocF93bWlfaW5w
dXRfZGV2LT5zd2JpdCk7CgkJaW5wdXRfcmVwb3J0X3N3aXRjaChocF93bWlfaW5wdXRfZGV2LCBT
V19UQUJMRVRfTU9ERSwgdmFsKTsKCX0KCgllcnIgPSBzcGFyc2Vfa2V5bWFwX3NldHVwKGhwX3dt
aV9pbnB1dF9kZXYsIGhwX3dtaV9rZXltYXAsIE5VTEwpOwoJaWYgKGVycikKCQlnb3RvIGVycl9m
cmVlX2RldjsKCgkvKiBTZXQgaW5pdGlhbCBoYXJkd2FyZSBzdGF0ZSAqLwoJaW5wdXRfc3luYyho
cF93bWlfaW5wdXRfZGV2KTsKCglpZiAoIWhwX3dtaV9iaW9zXzIwMDlfbGF0ZXIoKSAmJiBocF93
bWlfYmlvc18yMDA4X2xhdGVyKCkpCgkJaHBfd21pX2VuYWJsZV9ob3RrZXlzKCk7CgoJc3RhdHVz
ID0gd21pX2luc3RhbGxfbm90aWZ5X2hhbmRsZXIoSFBXTUlfRVZFTlRfR1VJRCwgaHBfd21pX25v
dGlmeSwgTlVMTCk7CglpZiAoQUNQSV9GQUlMVVJFKHN0YXR1cykpIHsKCQllcnIgPSAtRUlPOwoJ
CWdvdG8gZXJyX2ZyZWVfZGV2OwoJfQoKCWVyciA9IGlucHV0X3JlZ2lzdGVyX2RldmljZShocF93
bWlfaW5wdXRfZGV2KTsKCWlmIChlcnIpCgkJZ290byBlcnJfdW5pbnN0YWxsX25vdGlmaWVyOwoK
CXJldHVybiAwOwoKIGVycl91bmluc3RhbGxfbm90aWZpZXI6Cgl3bWlfcmVtb3ZlX25vdGlmeV9o
YW5kbGVyKEhQV01JX0VWRU5UX0dVSUQpOwogZXJyX2ZyZWVfZGV2OgoJaW5wdXRfZnJlZV9kZXZp
Y2UoaHBfd21pX2lucHV0X2Rldik7CglyZXR1cm4gZXJyOwp9CgpzdGF0aWMgdm9pZCBocF93bWlf
aW5wdXRfZGVzdHJveSh2b2lkKQp7Cgl3bWlfcmVtb3ZlX25vdGlmeV9oYW5kbGVyKEhQV01JX0VW
RU5UX0dVSUQpOwoJaW5wdXRfdW5yZWdpc3Rlcl9kZXZpY2UoaHBfd21pX2lucHV0X2Rldik7Cn0K
CnN0YXRpYyBpbnQgX19pbml0IGhwX3dtaV9yZmtpbGxfc2V0dXAoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqZGV2aWNlKQp7CglpbnQgZXJyLCB3aXJlbGVzczsKCgl3aXJlbGVzcyA9IGhwX3dtaV9y
ZWFkX2ludChIUFdNSV9XSVJFTEVTU19RVUVSWSk7CglpZiAod2lyZWxlc3MgPCAwKQoJCXJldHVy
biB3aXJlbGVzczsKCgllcnIgPSBocF93bWlfcGVyZm9ybV9xdWVyeShIUFdNSV9XSVJFTEVTU19R
VUVSWSwgSFBXTUlfV1JJVEUsICZ3aXJlbGVzcywKCQkJCSAgIHNpemVvZih3aXJlbGVzcyksIDAp
OwoJaWYgKGVycikKCQlyZXR1cm4gZXJyOwoKCWlmICh3aXJlbGVzcyAmIDB4MSkgewoJCXdpZmlf
cmZraWxsID0gcmZraWxsX2FsbG9jKCJocC13aWZpIiwgJmRldmljZS0+ZGV2LAoJCQkJCSAgIFJG
S0lMTF9UWVBFX1dMQU4sCgkJCQkJICAgJmhwX3dtaV9yZmtpbGxfb3BzLAoJCQkJCSAgICh2b2lk
ICopIEhQV01JX1dJRkkpOwoJCWlmICghd2lmaV9yZmtpbGwpCgkJCXJldHVybiAtRU5PTUVNOwoJ
CXJma2lsbF9pbml0X3N3X3N0YXRlKHdpZmlfcmZraWxsLAoJCQkJICAgICBocF93bWlfZ2V0X3N3
X3N0YXRlKEhQV01JX1dJRkkpKTsKCQlyZmtpbGxfc2V0X2h3X3N0YXRlKHdpZmlfcmZraWxsLAoJ
CQkJICAgIGhwX3dtaV9nZXRfaHdfc3RhdGUoSFBXTUlfV0lGSSkpOwoJCWVyciA9IHJma2lsbF9y
ZWdpc3Rlcih3aWZpX3Jma2lsbCk7CgkJaWYgKGVycikKCQkJZ290byByZWdpc3Rlcl93aWZpX2Vy
cm9yOwoJfQoKCWlmICh3aXJlbGVzcyAmIDB4MikgewoJCWJsdWV0b290aF9yZmtpbGwgPSByZmtp
bGxfYWxsb2MoImhwLWJsdWV0b290aCIsICZkZXZpY2UtPmRldiwKCQkJCQkJUkZLSUxMX1RZUEVf
QkxVRVRPT1RILAoJCQkJCQkmaHBfd21pX3Jma2lsbF9vcHMsCgkJCQkJCSh2b2lkICopIEhQV01J
X0JMVUVUT09USCk7CgkJaWYgKCFibHVldG9vdGhfcmZraWxsKSB7CgkJCWVyciA9IC1FTk9NRU07
CgkJCWdvdG8gcmVnaXN0ZXJfYmx1ZXRvb3RoX2Vycm9yOwoJCX0KCQlyZmtpbGxfaW5pdF9zd19z
dGF0ZShibHVldG9vdGhfcmZraWxsLAoJCQkJICAgICBocF93bWlfZ2V0X3N3X3N0YXRlKEhQV01J
X0JMVUVUT09USCkpOwoJCXJma2lsbF9zZXRfaHdfc3RhdGUoYmx1ZXRvb3RoX3Jma2lsbCwKCQkJ
CSAgICBocF93bWlfZ2V0X2h3X3N0YXRlKEhQV01JX0JMVUVUT09USCkpOwoJCWVyciA9IHJma2ls
bF9yZWdpc3RlcihibHVldG9vdGhfcmZraWxsKTsKCQlpZiAoZXJyKQoJCQlnb3RvIHJlZ2lzdGVy
X2JsdWV0b290aF9lcnJvcjsKCX0KCglpZiAod2lyZWxlc3MgJiAweDQpIHsKCQl3d2FuX3Jma2ls
bCA9IHJma2lsbF9hbGxvYygiaHAtd3dhbiIsICZkZXZpY2UtPmRldiwKCQkJCQkgICBSRktJTExf
VFlQRV9XV0FOLAoJCQkJCSAgICZocF93bWlfcmZraWxsX29wcywKCQkJCQkgICAodm9pZCAqKSBI
UFdNSV9XV0FOKTsKCQlpZiAoIXd3YW5fcmZraWxsKSB7CgkJCWVyciA9IC1FTk9NRU07CgkJCWdv
dG8gcmVnaXN0ZXJfd3dhbl9lcnJvcjsKCQl9CgkJcmZraWxsX2luaXRfc3dfc3RhdGUod3dhbl9y
ZmtpbGwsCgkJCQkgICAgIGhwX3dtaV9nZXRfc3dfc3RhdGUoSFBXTUlfV1dBTikpOwoJCXJma2ls
bF9zZXRfaHdfc3RhdGUod3dhbl9yZmtpbGwsCgkJCQkgICAgaHBfd21pX2dldF9od19zdGF0ZShI
UFdNSV9XV0FOKSk7CgkJZXJyID0gcmZraWxsX3JlZ2lzdGVyKHd3YW5fcmZraWxsKTsKCQlpZiAo
ZXJyKQoJCQlnb3RvIHJlZ2lzdGVyX3d3YW5fZXJyb3I7Cgl9CgoJcmV0dXJuIDA7CgpyZWdpc3Rl
cl93d2FuX2Vycm9yOgoJcmZraWxsX2Rlc3Ryb3kod3dhbl9yZmtpbGwpOwoJd3dhbl9yZmtpbGwg
PSBOVUxMOwoJaWYgKGJsdWV0b290aF9yZmtpbGwpCgkJcmZraWxsX3VucmVnaXN0ZXIoYmx1ZXRv
b3RoX3Jma2lsbCk7CnJlZ2lzdGVyX2JsdWV0b290aF9lcnJvcjoKCXJma2lsbF9kZXN0cm95KGJs
dWV0b290aF9yZmtpbGwpOwoJYmx1ZXRvb3RoX3Jma2lsbCA9IE5VTEw7CglpZiAod2lmaV9yZmtp
bGwpCgkJcmZraWxsX3VucmVnaXN0ZXIod2lmaV9yZmtpbGwpOwpyZWdpc3Rlcl93aWZpX2Vycm9y
OgoJcmZraWxsX2Rlc3Ryb3kod2lmaV9yZmtpbGwpOwoJd2lmaV9yZmtpbGwgPSBOVUxMOwoJcmV0
dXJuIGVycjsKfQoKc3RhdGljIGludCBfX2luaXQgaHBfd21pX3Jma2lsbDJfc2V0dXAoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqZGV2aWNlKQp7CglzdHJ1Y3QgYmlvc19yZmtpbGwyX3N0YXRlIHN0
YXRlOwoJaW50IGVyciwgaTsKCgllcnIgPSBocF93bWlfcGVyZm9ybV9xdWVyeShIUFdNSV9XSVJF
TEVTUzJfUVVFUlksIEhQV01JX1JFQUQsICZzdGF0ZSwKCQkJCSAgIHplcm9faWZfc3VwKHN0YXRl
KSwgc2l6ZW9mKHN0YXRlKSk7CglpZiAoZXJyKQoJCXJldHVybiBlcnIgPCAwID8gZXJyIDogLUVJ
TlZBTDsKCglpZiAoc3RhdGUuY291bnQgPiBIUFdNSV9NQVhfUkZLSUxMMl9ERVZJQ0VTKSB7CgkJ
cHJfd2FybigidW5hYmxlIHRvIHBhcnNlIDB4MWIgcXVlcnkgb3V0cHV0XG4iKTsKCQlyZXR1cm4g
LUVJTlZBTDsKCX0KCglmb3IgKGkgPSAwOyBpIDwgc3RhdGUuY291bnQ7IGkrKykgewoJCXN0cnVj
dCByZmtpbGwgKnJma2lsbDsKCQllbnVtIHJma2lsbF90eXBlIHR5cGU7CgkJY2hhciAqbmFtZTsK
CgkJc3dpdGNoIChzdGF0ZS5kZXZpY2VbaV0ucmFkaW9fdHlwZSkgewoJCWNhc2UgSFBXTUlfV0lG
SToKCQkJdHlwZSA9IFJGS0lMTF9UWVBFX1dMQU47CgkJCW5hbWUgPSAiaHAtd2lmaSI7CgkJCWJy
ZWFrOwoJCWNhc2UgSFBXTUlfQkxVRVRPT1RIOgoJCQl0eXBlID0gUkZLSUxMX1RZUEVfQkxVRVRP
T1RIOwoJCQluYW1lID0gImhwLWJsdWV0b290aCI7CgkJCWJyZWFrOwoJCWNhc2UgSFBXTUlfV1dB
TjoKCQkJdHlwZSA9IFJGS0lMTF9UWVBFX1dXQU47CgkJCW5hbWUgPSAiaHAtd3dhbiI7CgkJCWJy
ZWFrOwoJCWNhc2UgSFBXTUlfR1BTOgoJCQl0eXBlID0gUkZLSUxMX1RZUEVfR1BTOwoJCQluYW1l
ID0gImhwLWdwcyI7CgkJCWJyZWFrOwoJCWRlZmF1bHQ6CgkJCXByX3dhcm4oInVua25vd24gZGV2
aWNlIHR5cGUgMHgleFxuIiwKCQkJCXN0YXRlLmRldmljZVtpXS5yYWRpb190eXBlKTsKCQkJY29u
dGludWU7CgkJfQoKCQlpZiAoIXN0YXRlLmRldmljZVtpXS52ZW5kb3JfaWQpIHsKCQkJcHJfd2Fy
bigiemVybyBkZXZpY2UgJWQgd2hpbGUgJWQgcmVwb3J0ZWRcbiIsCgkJCQlpLCBzdGF0ZS5jb3Vu
dCk7CgkJCWNvbnRpbnVlOwoJCX0KCgkJcmZraWxsID0gcmZraWxsX2FsbG9jKG5hbWUsICZkZXZp
Y2UtPmRldiwgdHlwZSwKCQkJCSAgICAgICZocF93bWlfcmZraWxsMl9vcHMsICh2b2lkICopKGxv
bmcpaSk7CgkJaWYgKCFyZmtpbGwpIHsKCQkJZXJyID0gLUVOT01FTTsKCQkJZ290byBmYWlsOwoJ
CX0KCgkJcmZraWxsMltyZmtpbGwyX2NvdW50XS5pZCA9IHN0YXRlLmRldmljZVtpXS5yZmtpbGxf
aWQ7CgkJcmZraWxsMltyZmtpbGwyX2NvdW50XS5udW0gPSBpOwoJCXJma2lsbDJbcmZraWxsMl9j
b3VudF0ucmZraWxsID0gcmZraWxsOwoKCQlyZmtpbGxfaW5pdF9zd19zdGF0ZShyZmtpbGwsCgkJ
CQkgICAgIElTX1NXQkxPQ0tFRChzdGF0ZS5kZXZpY2VbaV0ucG93ZXIpKTsKCQlyZmtpbGxfc2V0
X2h3X3N0YXRlKHJma2lsbCwKCQkJCSAgICBJU19IV0JMT0NLRUQoc3RhdGUuZGV2aWNlW2ldLnBv
d2VyKSk7CgoJCWlmICghKHN0YXRlLmRldmljZVtpXS5wb3dlciAmIEhQV01JX1BPV0VSX0JJT1Mp
KQoJCQlwcl9pbmZvKCJkZXZpY2UgJXMgYmxvY2tlZCBieSBCSU9TXG4iLCBuYW1lKTsKCgkJZXJy
ID0gcmZraWxsX3JlZ2lzdGVyKHJma2lsbCk7CgkJaWYgKGVycikgewoJCQlyZmtpbGxfZGVzdHJv
eShyZmtpbGwpOwoJCQlnb3RvIGZhaWw7CgkJfQoKCQlyZmtpbGwyX2NvdW50Kys7Cgl9CgoJcmV0
dXJuIDA7CmZhaWw6Cglmb3IgKDsgcmZraWxsMl9jb3VudCA+IDA7IHJma2lsbDJfY291bnQtLSkg
ewoJCXJma2lsbF91bnJlZ2lzdGVyKHJma2lsbDJbcmZraWxsMl9jb3VudCAtIDFdLnJma2lsbCk7
CgkJcmZraWxsX2Rlc3Ryb3kocmZraWxsMltyZmtpbGwyX2NvdW50IC0gMV0ucmZraWxsKTsKCX0K
CXJldHVybiBlcnI7Cn0KCnN0YXRpYyBpbnQgcGxhdGZvcm1fcHJvZmlsZV9vbWVuX2dldF9lYyhl
bnVtIHBsYXRmb3JtX3Byb2ZpbGVfb3B0aW9uICpwcm9maWxlKQp7CglpbnQgdHA7CgoJdHAgPSBv
bWVuX3RoZXJtYWxfcHJvZmlsZV9nZXQoKTsKCWlmICh0cCA8IDApCgkJcmV0dXJuIHRwOwoKCXN3
aXRjaCAodHApIHsKCWNhc2UgSFBfT01FTl9WMF9USEVSTUFMX1BST0ZJTEVfUEVSRk9STUFOQ0U6
CgljYXNlIEhQX09NRU5fVjFfVEhFUk1BTF9QUk9GSUxFX1BFUkZPUk1BTkNFOgoJCSpwcm9maWxl
ID0gUExBVEZPUk1fUFJPRklMRV9QRVJGT1JNQU5DRTsKCQlicmVhazsKCWNhc2UgSFBfT01FTl9W
MF9USEVSTUFMX1BST0ZJTEVfREVGQVVMVDoKCWNhc2UgSFBfT01FTl9WMV9USEVSTUFMX1BST0ZJ
TEVfREVGQVVMVDoKCQkqcHJvZmlsZSA9IFBMQVRGT1JNX1BST0ZJTEVfQkFMQU5DRUQ7CgkJYnJl
YWs7CgljYXNlIEhQX09NRU5fVjBfVEhFUk1BTF9QUk9GSUxFX0NPT0w6CgljYXNlIEhQX09NRU5f
VjFfVEhFUk1BTF9QUk9GSUxFX0NPT0w6CgkJKnByb2ZpbGUgPSBQTEFURk9STV9QUk9GSUxFX0NP
T0w7CgkJYnJlYWs7CglkZWZhdWx0OgoJCXJldHVybiAtRUlOVkFMOwoJfQoKCXJldHVybiAwOwp9
CgpzdGF0aWMgaW50IHBsYXRmb3JtX3Byb2ZpbGVfb21lbl9nZXQoc3RydWN0IGRldmljZSAqZGV2
LAoJCQkJICAgICBlbnVtIHBsYXRmb3JtX3Byb2ZpbGVfb3B0aW9uICpwcm9maWxlKQp7CgkvKgoJ
ICogV2UgZGlyZWN0bHkgcmV0dXJuIHRoZSBzdG9yZWQgcGxhdGZvcm0gcHJvZmlsZSwgYXMgdGhl
IGVtYmVkZGVkCgkgKiBjb250cm9sbGVyIHdpbGwgbm90IGFjY2VwdCBzd2l0Y2hpbmcgdG8gdGhl
IHBlcmZvcm1hbmNlIG9wdGlvbiB3aGVuCgkgKiB0aGUgY29uZGl0aW9ucyBhcmUgbm90IG1ldCAo
ZS5nLiB0aGUgbGFwdG9wIGlzIG5vdCBwbHVnZ2VkIGluKS4KCSAqCgkgKiBJZiB3ZSBkaXJlY3Rs
eSByZXR1cm4gd2hhdCB0aGUgRUMgcmVwb3J0cywgdGhlIHBsYXRmb3JtIHByb2ZpbGUgd2lsbAoJ
ICogaW1tZWRpYXRlbHkgInN3aXRjaCBiYWNrIiB0byBub3JtYWwgbW9kZSwgd2hpY2ggaXMgYWdh
aW5zdCB0aGUKCSAqIGV4cGVjdGVkIGJlaGF2aW91ciBmcm9tIGEgdXNlcnNwYWNlIHBvaW50IG9m
IHZpZXcsIGFzIGRlc2NyaWJlZCBpbgoJICogdGhlIFBsYXRmb3JtIFByb2ZpbGUgU2VjdGlvbiBw
YWdlIG9mIHRoZSBrZXJuZWwgZG9jdW1lbnRhdGlvbi4KCSAqCgkgKiBTZWUgYWxzbyBvbWVuX3Bv
d2Vyc291cmNlX2V2ZW50LgoJICovCglndWFyZChtdXRleCkoJmFjdGl2ZV9wbGF0Zm9ybV9wcm9m
aWxlX2xvY2spOwoJKnByb2ZpbGUgPSBhY3RpdmVfcGxhdGZvcm1fcHJvZmlsZTsKCglyZXR1cm4g
MDsKfQoKc3RhdGljIGJvb2wgaGFzX29tZW5fdGhlcm1hbF9wcm9maWxlX2VjX3RpbWVyKHZvaWQp
CnsKCWNvbnN0IGNoYXIgKmJvYXJkX25hbWUgPSBkbWlfZ2V0X3N5c3RlbV9pbmZvKERNSV9CT0FS
RF9OQU1FKTsKCglpZiAoIWJvYXJkX25hbWUpCgkJcmV0dXJuIGZhbHNlOwoKCXJldHVybiBtYXRj
aF9zdHJpbmcob21lbl90aW1lZF90aGVybWFsX3Byb2ZpbGVfYm9hcmRzLAoJCQkgICAgQVJSQVlf
U0laRShvbWVuX3RpbWVkX3RoZXJtYWxfcHJvZmlsZV9ib2FyZHMpLAoJCQkgICAgYm9hcmRfbmFt
ZSkgPj0gMDsKfQoKaW5saW5lIGludCBvbWVuX3RoZXJtYWxfcHJvZmlsZV9lY19mbGFnc19zZXQo
ZW51bSBocF90aGVybWFsX3Byb2ZpbGVfb21lbl9mbGFncyBmbGFncykKewoJcmV0dXJuIGVjX3dy
aXRlKEhQX09NRU5fRUNfVEhFUk1BTF9QUk9GSUxFX0ZMQUdTX09GRlNFVCwgZmxhZ3MpOwp9Cgpp
bmxpbmUgaW50IG9tZW5fdGhlcm1hbF9wcm9maWxlX2VjX3RpbWVyX3NldCh1OCB2YWx1ZSkKewoJ
cmV0dXJuIGVjX3dyaXRlKEhQX09NRU5fRUNfVEhFUk1BTF9QUk9GSUxFX1RJTUVSX09GRlNFVCwg
dmFsdWUpOwp9CgpzdGF0aWMgaW50IHBsYXRmb3JtX3Byb2ZpbGVfb21lbl9zZXRfZWMoZW51bSBw
bGF0Zm9ybV9wcm9maWxlX29wdGlvbiBwcm9maWxlKQp7CglpbnQgZXJyLCB0cCwgdHBfdmVyc2lv
bjsKCWVudW0gaHBfdGhlcm1hbF9wcm9maWxlX29tZW5fZmxhZ3MgZmxhZ3MgPSAwOwoKCXRwX3Zl
cnNpb24gPSBvbWVuX2dldF90aGVybWFsX3BvbGljeV92ZXJzaW9uKCk7CgoJaWYgKHRwX3ZlcnNp
b24gPCAwIHx8IHRwX3ZlcnNpb24gPiAxKQoJCXJldHVybiAtRU9QTk9UU1VQUDsKCglzd2l0Y2gg
KHByb2ZpbGUpIHsKCWNhc2UgUExBVEZPUk1fUFJPRklMRV9QRVJGT1JNQU5DRToKCQlpZiAodHBf
dmVyc2lvbiA9PSAwKQoJCQl0cCA9IEhQX09NRU5fVjBfVEhFUk1BTF9QUk9GSUxFX1BFUkZPUk1B
TkNFOwoJCWVsc2UKCQkJdHAgPSBIUF9PTUVOX1YxX1RIRVJNQUxfUFJPRklMRV9QRVJGT1JNQU5D
RTsKCQlicmVhazsKCWNhc2UgUExBVEZPUk1fUFJPRklMRV9CQUxBTkNFRDoKCQlpZiAodHBfdmVy
c2lvbiA9PSAwKQoJCQl0cCA9IEhQX09NRU5fVjBfVEhFUk1BTF9QUk9GSUxFX0RFRkFVTFQ7CgkJ
ZWxzZQoJCQl0cCA9IEhQX09NRU5fVjFfVEhFUk1BTF9QUk9GSUxFX0RFRkFVTFQ7CgkJYnJlYWs7
CgljYXNlIFBMQVRGT1JNX1BST0ZJTEVfQ09PTDoKCQlpZiAodHBfdmVyc2lvbiA9PSAwKQoJCQl0
cCA9IEhQX09NRU5fVjBfVEhFUk1BTF9QUk9GSUxFX0NPT0w7CgkJZWxzZQoJCQl0cCA9IEhQX09N
RU5fVjFfVEhFUk1BTF9QUk9GSUxFX0NPT0w7CgkJYnJlYWs7CglkZWZhdWx0OgoJCXJldHVybiAt
RU9QTk9UU1VQUDsKCX0KCgllcnIgPSBvbWVuX3RoZXJtYWxfcHJvZmlsZV9zZXQodHApOwoJaWYg
KGVyciA8IDApCgkJcmV0dXJuIGVycjsKCglpZiAoaGFzX29tZW5fdGhlcm1hbF9wcm9maWxlX2Vj
X3RpbWVyKCkpIHsKCQllcnIgPSBvbWVuX3RoZXJtYWxfcHJvZmlsZV9lY190aW1lcl9zZXQoMCk7
CgkJaWYgKGVyciA8IDApCgkJCXJldHVybiBlcnI7CgoJCWlmIChwcm9maWxlID09IFBMQVRGT1JN
X1BST0ZJTEVfUEVSRk9STUFOQ0UpCgkJCWZsYWdzID0gSFBfT01FTl9FQ19GTEFHU19OT1RJTUVS
IHwKCQkJCUhQX09NRU5fRUNfRkxBR1NfVFVSQk87CgoJCWVyciA9IG9tZW5fdGhlcm1hbF9wcm9m
aWxlX2VjX2ZsYWdzX3NldChmbGFncyk7CgkJaWYgKGVyciA8IDApCgkJCXJldHVybiBlcnI7Cgl9
CgoJcmV0dXJuIDA7Cn0KCnN0YXRpYyBpbnQgcGxhdGZvcm1fcHJvZmlsZV9vbWVuX3NldChzdHJ1
Y3QgZGV2aWNlICpkZXYsCgkJCQkgICAgIGVudW0gcGxhdGZvcm1fcHJvZmlsZV9vcHRpb24gcHJv
ZmlsZSkKewoJaW50IGVycjsKCglndWFyZChtdXRleCkoJmFjdGl2ZV9wbGF0Zm9ybV9wcm9maWxl
X2xvY2spOwoKCWVyciA9IHBsYXRmb3JtX3Byb2ZpbGVfb21lbl9zZXRfZWMocHJvZmlsZSk7Cglp
ZiAoZXJyIDwgMCkKCQlyZXR1cm4gZXJyOwoKCWFjdGl2ZV9wbGF0Zm9ybV9wcm9maWxlID0gcHJv
ZmlsZTsKCglyZXR1cm4gMDsKfQoKc3RhdGljIGludCB0aGVybWFsX3Byb2ZpbGVfZ2V0KHZvaWQp
CnsKCXJldHVybiBocF93bWlfcmVhZF9pbnQoSFBXTUlfVEhFUk1BTF9QUk9GSUxFX1FVRVJZKTsK
fQoKc3RhdGljIGludCB0aGVybWFsX3Byb2ZpbGVfc2V0KGludCB0aGVybWFsX3Byb2ZpbGUpCnsK
CXJldHVybiBocF93bWlfcGVyZm9ybV9xdWVyeShIUFdNSV9USEVSTUFMX1BST0ZJTEVfUVVFUlks
IEhQV01JX1dSSVRFLCAmdGhlcm1hbF9wcm9maWxlLAoJCQkJCQkJICAgc2l6ZW9mKHRoZXJtYWxf
cHJvZmlsZSksIDApOwp9CgpzdGF0aWMgaW50IGhwX3dtaV9wbGF0Zm9ybV9wcm9maWxlX2dldChz
dHJ1Y3QgZGV2aWNlICpkZXYsCgkJCQkJZW51bSBwbGF0Zm9ybV9wcm9maWxlX29wdGlvbiAqcHJv
ZmlsZSkKewoJaW50IHRwOwoKCXRwID0gdGhlcm1hbF9wcm9maWxlX2dldCgpOwoJaWYgKHRwIDwg
MCkKCQlyZXR1cm4gdHA7CgoJc3dpdGNoICh0cCkgewoJY2FzZSBIUF9USEVSTUFMX1BST0ZJTEVf
UEVSRk9STUFOQ0U6CgkJKnByb2ZpbGUgPSAgUExBVEZPUk1fUFJPRklMRV9QRVJGT1JNQU5DRTsK
CQlicmVhazsKCWNhc2UgSFBfVEhFUk1BTF9QUk9GSUxFX0RFRkFVTFQ6CgkJKnByb2ZpbGUgPSAg
UExBVEZPUk1fUFJPRklMRV9CQUxBTkNFRDsKCQlicmVhazsKCWNhc2UgSFBfVEhFUk1BTF9QUk9G
SUxFX0NPT0w6CgkJKnByb2ZpbGUgPSAgUExBVEZPUk1fUFJPRklMRV9DT09MOwoJCWJyZWFrOwoJ
Y2FzZSBIUF9USEVSTUFMX1BST0ZJTEVfUVVJRVQ6CgkJKnByb2ZpbGUgPSBQTEFURk9STV9QUk9G
SUxFX1FVSUVUOwoJCWJyZWFrOwoJZGVmYXVsdDoKCQlyZXR1cm4gLUVJTlZBTDsKCX0KCglyZXR1
cm4gMDsKfQoKc3RhdGljIGludCBocF93bWlfcGxhdGZvcm1fcHJvZmlsZV9zZXQoc3RydWN0IGRl
dmljZSAqZGV2LAoJCQkJCWVudW0gcGxhdGZvcm1fcHJvZmlsZV9vcHRpb24gcHJvZmlsZSkKewoJ
aW50IGVyciwgdHA7CgoJc3dpdGNoIChwcm9maWxlKSB7CgljYXNlIFBMQVRGT1JNX1BST0ZJTEVf
UEVSRk9STUFOQ0U6CgkJdHAgPSAgSFBfVEhFUk1BTF9QUk9GSUxFX1BFUkZPUk1BTkNFOwoJCWJy
ZWFrOwoJY2FzZSBQTEFURk9STV9QUk9GSUxFX0JBTEFOQ0VEOgoJCXRwID0gIEhQX1RIRVJNQUxf
UFJPRklMRV9ERUZBVUxUOwoJCWJyZWFrOwoJY2FzZSBQTEFURk9STV9QUk9GSUxFX0NPT0w6CgkJ
dHAgPSAgSFBfVEhFUk1BTF9QUk9GSUxFX0NPT0w7CgkJYnJlYWs7CgljYXNlIFBMQVRGT1JNX1BS
T0ZJTEVfUVVJRVQ6CgkJdHAgPSBIUF9USEVSTUFMX1BST0ZJTEVfUVVJRVQ7CgkJYnJlYWs7Cglk
ZWZhdWx0OgoJCXJldHVybiAtRU9QTk9UU1VQUDsKCX0KCgllcnIgPSB0aGVybWFsX3Byb2ZpbGVf
c2V0KHRwKTsKCWlmIChlcnIpCgkJcmV0dXJuIGVycjsKCglyZXR1cm4gMDsKfQoKc3RhdGljIGJv
b2wgaXNfdmljdHVzX3RoZXJtYWxfcHJvZmlsZSh2b2lkKQp7Cgljb25zdCBjaGFyICpib2FyZF9u
YW1lID0gZG1pX2dldF9zeXN0ZW1faW5mbyhETUlfQk9BUkRfTkFNRSk7CgoJaWYgKCFib2FyZF9u
YW1lKQoJCXJldHVybiBmYWxzZTsKCglyZXR1cm4gbWF0Y2hfc3RyaW5nKHZpY3R1c190aGVybWFs
X3Byb2ZpbGVfYm9hcmRzLAoJCQkgICAgQVJSQVlfU0laRSh2aWN0dXNfdGhlcm1hbF9wcm9maWxl
X2JvYXJkcyksCgkJCSAgICBib2FyZF9uYW1lKSA+PSAwOwp9CgpzdGF0aWMgaW50IHBsYXRmb3Jt
X3Byb2ZpbGVfdmljdHVzX2dldF9lYyhlbnVtIHBsYXRmb3JtX3Byb2ZpbGVfb3B0aW9uICpwcm9m
aWxlKQp7CglpbnQgdHA7CgoJdHAgPSBvbWVuX3RoZXJtYWxfcHJvZmlsZV9nZXQoKTsKCWlmICh0
cCA8IDApCgkJcmV0dXJuIHRwOwoKCXN3aXRjaCAodHApIHsKCWNhc2UgSFBfVklDVFVTX1RIRVJN
QUxfUFJPRklMRV9QRVJGT1JNQU5DRToKCQkqcHJvZmlsZSA9IFBMQVRGT1JNX1BST0ZJTEVfUEVS
Rk9STUFOQ0U7CgkJYnJlYWs7CgljYXNlIEhQX1ZJQ1RVU19USEVSTUFMX1BST0ZJTEVfREVGQVVM
VDoKCQkqcHJvZmlsZSA9IFBMQVRGT1JNX1BST0ZJTEVfQkFMQU5DRUQ7CgkJYnJlYWs7CgljYXNl
IEhQX1ZJQ1RVU19USEVSTUFMX1BST0ZJTEVfUVVJRVQ6CgkJKnByb2ZpbGUgPSBQTEFURk9STV9Q
Uk9GSUxFX1FVSUVUOwoJCWJyZWFrOwoJZGVmYXVsdDoKCQlyZXR1cm4gLUVPUE5PVFNVUFA7Cgl9
CgoJcmV0dXJuIDA7Cn0KCnN0YXRpYyBpbnQgcGxhdGZvcm1fcHJvZmlsZV92aWN0dXNfZ2V0KHN0
cnVjdCBkZXZpY2UgKmRldiwKCQkJCSAgICAgICBlbnVtIHBsYXRmb3JtX3Byb2ZpbGVfb3B0aW9u
ICpwcm9maWxlKQp7CgkvKiBTYW1lIGJlaGF2aW91ciBhcyBwbGF0Zm9ybV9wcm9maWxlX29tZW5f
Z2V0ICovCglyZXR1cm4gcGxhdGZvcm1fcHJvZmlsZV9vbWVuX2dldChkZXYsIHByb2ZpbGUpOwp9
CgpzdGF0aWMgaW50IHBsYXRmb3JtX3Byb2ZpbGVfdmljdHVzX3NldF9lYyhlbnVtIHBsYXRmb3Jt
X3Byb2ZpbGVfb3B0aW9uIHByb2ZpbGUpCnsKCWludCBlcnIsIHRwOwoKCXN3aXRjaCAocHJvZmls
ZSkgewoJY2FzZSBQTEFURk9STV9QUk9GSUxFX1BFUkZPUk1BTkNFOgoJCXRwID0gSFBfVklDVFVT
X1RIRVJNQUxfUFJPRklMRV9QRVJGT1JNQU5DRTsKCQlicmVhazsKCWNhc2UgUExBVEZPUk1fUFJP
RklMRV9CQUxBTkNFRDoKCQl0cCA9IEhQX1ZJQ1RVU19USEVSTUFMX1BST0ZJTEVfREVGQVVMVDsK
CQlicmVhazsKCWNhc2UgUExBVEZPUk1fUFJPRklMRV9RVUlFVDoKCQl0cCA9IEhQX1ZJQ1RVU19U
SEVSTUFMX1BST0ZJTEVfUVVJRVQ7CgkJYnJlYWs7CglkZWZhdWx0OgoJCXJldHVybiAtRU9QTk9U
U1VQUDsKCX0KCgllcnIgPSBvbWVuX3RoZXJtYWxfcHJvZmlsZV9zZXQodHApOwoJaWYgKGVyciA8
IDApCgkJcmV0dXJuIGVycjsKCglyZXR1cm4gMDsKfQoKc3RhdGljIGJvb2wgaXNfdmljdHVzX3Nf
dGhlcm1hbF9wcm9maWxlKHZvaWQpCnsKCS8qIEluaXRpYWxpc2VkIGluIGRyaXZlciBpbml0LCBo
ZW5jZSBzYWZlIHRvIHVzZSBoZXJlICovCglyZXR1cm4gaXNfdmljdHVzX3NfYm9hcmQ7Cn0KCnN0
YXRpYyBjb25zdCBzdHJ1Y3QgaHBfd21pX2Zhbl9wcm9maWxlX3BhcmFtcyAqaHBfd21pX2Zhbl9w
cm9maWxlKHZvaWQpCnsKCWlmICghYWN0aXZlX2JvYXJkX3BhcmFtcykKCQlyZXR1cm4gTlVMTDsK
CglyZXR1cm4gYWN0aXZlX2JvYXJkX3BhcmFtcy0+ZmFuX3Byb2ZpbGU7Cn0KCnN0YXRpYyBib29s
IGhwX3dtaV9mYW5fY29udHJvbF9zdXBwb3J0ZWQodm9pZCkKewoJY29uc3Qgc3RydWN0IGhwX3dt
aV9mYW5fcHJvZmlsZV9wYXJhbXMgKnBhcmFtcyA9IGhwX3dtaV9mYW5fcHJvZmlsZSgpOwoKCXJl
dHVybiBwYXJhbXMgJiYgcGFyYW1zLT5nZXRfZmFuX3NwZWVkOwp9CgpzdGF0aWMgYm9vbCBocF93
bWlfZmFuX3RhYmxlX3N1cHBvcnRlZCh2b2lkKQp7Cgljb25zdCBzdHJ1Y3QgaHBfd21pX2Zhbl9w
cm9maWxlX3BhcmFtcyAqcGFyYW1zID0gaHBfd21pX2Zhbl9wcm9maWxlKCk7CgoJcmV0dXJuIHBh
cmFtcyAmJiBwYXJhbXMtPmZhbl90YWJsZTsKfQoKc3RhdGljIGludCBocF93bWlfZ2V0X2FjdGl2
ZV9mYW5fc3BlZWQoaW50IGZhbikKewoJY29uc3Qgc3RydWN0IGhwX3dtaV9mYW5fcHJvZmlsZV9w
YXJhbXMgKnBhcmFtcyA9IGhwX3dtaV9mYW5fcHJvZmlsZSgpOwoKCWlmICghcGFyYW1zIHx8ICFw
YXJhbXMtPmdldF9mYW5fc3BlZWQpCgkJcmV0dXJuIC1FT1BOT1RTVVBQOwoKCXJldHVybiBwYXJh
bXMtPmdldF9mYW5fc3BlZWQoZmFuKTsKfQoKc3RhdGljIGludCB2aWN0dXNfc19ncHVfdGhlcm1h
bF9wcm9maWxlX2dldChib29sICpjdGdwX2VuYWJsZSwKCQkJCQkgICAgYm9vbCAqcHBhYl9lbmFi
bGUsCgkJCQkJICAgIHU4ICpkc3RhdGUsCgkJCQkJICAgIHU4ICpncHVfc2xvd2Rvd25fdGVtcCkK
ewoJc3RydWN0IHZpY3R1c19ncHVfcG93ZXJfbW9kZXMgZ3B1X3Bvd2VyX21vZGVzOwoJaW50IHJl
dDsKCglyZXQgPSBocF93bWlfcGVyZm9ybV9xdWVyeShIUFdNSV9HRVRfR1BVX1RIRVJNQUxfTU9E
RVNfUVVFUlksIEhQV01JX0dNLAoJCQkJICAgJmdwdV9wb3dlcl9tb2Rlcywgc2l6ZW9mKGdwdV9w
b3dlcl9tb2RlcyksCgkJCQkgICBzaXplb2YoZ3B1X3Bvd2VyX21vZGVzKSk7CglpZiAocmV0ID09
IDApIHsKCQkqY3RncF9lbmFibGUgPSBncHVfcG93ZXJfbW9kZXMuY3RncF9lbmFibGUgPyB0cnVl
IDogZmFsc2U7CgkJKnBwYWJfZW5hYmxlID0gZ3B1X3Bvd2VyX21vZGVzLnBwYWJfZW5hYmxlID8g
dHJ1ZSA6IGZhbHNlOwoJCSpkc3RhdGUgPSBncHVfcG93ZXJfbW9kZXMuZHN0YXRlOwoJCSpncHVf
c2xvd2Rvd25fdGVtcCA9IGdwdV9wb3dlcl9tb2Rlcy5ncHVfc2xvd2Rvd25fdGVtcDsKCX0KCgly
ZXR1cm4gcmV0Owp9CgpzdGF0aWMgaW50IHZpY3R1c19zX2dwdV90aGVybWFsX3Byb2ZpbGVfc2V0
KGJvb2wgY3RncF9lbmFibGUsCgkJCQkJICAgIGJvb2wgcHBhYl9lbmFibGUsCgkJCQkJICAgIHU4
IGRzdGF0ZSkKewoJc3RydWN0IHZpY3R1c19ncHVfcG93ZXJfbW9kZXMgZ3B1X3Bvd2VyX21vZGVz
OwoJaW50IHJldDsKCglib29sIGN1cnJlbnRfY3RncF9zdGF0ZSwgY3VycmVudF9wcGFiX3N0YXRl
OwoJdTggY3VycmVudF9kc3RhdGUsIGN1cnJlbnRfZ3B1X3Nsb3dkb3duX3RlbXA7CgoJLyogUmV0
cmlldmluZyBHUFUgc2xvd2Rvd24gdGVtcGVyYXR1cmUsIGluIG9yZGVyIHRvIGtlZXAgaXQgdW5j
aGFuZ2VkICovCglyZXQgPSB2aWN0dXNfc19ncHVfdGhlcm1hbF9wcm9maWxlX2dldCgmY3VycmVu
dF9jdGdwX3N0YXRlLAoJCQkJCSAgICAgICAmY3VycmVudF9wcGFiX3N0YXRlLAoJCQkJCSAgICAg
ICAmY3VycmVudF9kc3RhdGUsCgkJCQkJICAgICAgICZjdXJyZW50X2dwdV9zbG93ZG93bl90ZW1w
KTsKCWlmIChyZXQgPCAwKSB7CgkJcHJfd2FybigiR1BVIG1vZGVzIG5vdCB1cGRhdGVkLCB1bmFi
bGUgdG8gZ2V0IHNsb3dkb3duIHRlbXBcbiIpOwoJCXJldHVybiByZXQ7Cgl9CgoJZ3B1X3Bvd2Vy
X21vZGVzLmN0Z3BfZW5hYmxlID0gY3RncF9lbmFibGUgPyAweDAxIDogMHgwMDsKCWdwdV9wb3dl
cl9tb2Rlcy5wcGFiX2VuYWJsZSA9IHBwYWJfZW5hYmxlID8gMHgwMSA6IDB4MDA7CglncHVfcG93
ZXJfbW9kZXMuZHN0YXRlID0gZHN0YXRlOwoJZ3B1X3Bvd2VyX21vZGVzLmdwdV9zbG93ZG93bl90
ZW1wID0gY3VycmVudF9ncHVfc2xvd2Rvd25fdGVtcDsKCgoJcmV0ID0gaHBfd21pX3BlcmZvcm1f
cXVlcnkoSFBXTUlfU0VUX0dQVV9USEVSTUFMX01PREVTX1FVRVJZLCBIUFdNSV9HTSwKCQkJCSAg
ICZncHVfcG93ZXJfbW9kZXMsIHNpemVvZihncHVfcG93ZXJfbW9kZXMpLCAwKTsKCglyZXR1cm4g
cmV0Owp9CgovKiBOb3RlOiBIUF9QT1dFUl9MSU1JVF9ERUZBVUxUIGNhbiBiZSB1c2VkIHRvIHJl
c3RvcmUgZGVmYXVsdCBQTDEgYW5kIFBMMiAqLwpzdGF0aWMgaW50IHZpY3R1c19zX3NldF9jcHVf
cGwxX3BsMih1OCBwbDEsIHU4IHBsMikKewoJc3RydWN0IHZpY3R1c19wb3dlcl9saW1pdHMgcG93
ZXJfbGltaXRzOwoJaW50IHJldDsKCgkvKiBXZSBuZWVkIHRvIGtub3cgYm90aCBQTDEgYW5kIFBM
MiB2YWx1ZXMgaW4gb3JkZXIgdG8gY2hlY2sgdGhlbSAqLwoJaWYgKHBsMSA9PSBIUF9QT1dFUl9M
SU1JVF9OT19DSEFOR0UgfHwgcGwyID09IEhQX1BPV0VSX0xJTUlUX05PX0NIQU5HRSkKCQlyZXR1
cm4gLUVJTlZBTDsKCgkvKiBQTDIgaXMgbm90IHN1cHBvc2VkIHRvIGJlIGxvd2VyIHRoYW4gUEwx
ICovCglpZiAocGwyIDwgcGwxKQoJCXJldHVybiAtRUlOVkFMOwoKCXBvd2VyX2xpbWl0cy5wbDEg
PSBwbDE7Cglwb3dlcl9saW1pdHMucGwyID0gcGwyOwoJcG93ZXJfbGltaXRzLnBsNCA9IEhQX1BP
V0VSX0xJTUlUX05PX0NIQU5HRTsKCXBvd2VyX2xpbWl0cy5jcHVfZ3B1X2NvbmN1cnJlbnRfbGlt
aXQgPSBIUF9QT1dFUl9MSU1JVF9OT19DSEFOR0U7CgoJcmV0ID0gaHBfd21pX3BlcmZvcm1fcXVl
cnkoSFBXTUlfU0VUX1BPV0VSX0xJTUlUU19RVUVSWSwgSFBXTUlfR00sCgkJCQkgICAmcG93ZXJf
bGltaXRzLCBzaXplb2YocG93ZXJfbGltaXRzKSwgMCk7CgoJcmV0dXJuIHJldDsKfQoKc3RhdGlj
IGludCBwbGF0Zm9ybV9wcm9maWxlX3ZpY3R1c19zX2dldF9lYyhlbnVtIHBsYXRmb3JtX3Byb2Zp
bGVfb3B0aW9uICpwcm9maWxlKQp7CglpbnQgcmV0ID0gMDsKCWJvb2wgY3VycmVudF9jdGdwX3N0
YXRlLCBjdXJyZW50X3BwYWJfc3RhdGU7Cgl1OCBjdXJyZW50X2RzdGF0ZSwgY3VycmVudF9ncHVf
c2xvd2Rvd25fdGVtcCwgdHA7Cgljb25zdCBzdHJ1Y3QgdGhlcm1hbF9wcm9maWxlX3BhcmFtcyAq
cGFyYW1zOwoKCXBhcmFtcyA9IGhwX3dtaV90aGVybWFsX3Byb2ZpbGUoKTsKCWlmICghcGFyYW1z
KQoJCXJldHVybiAtRU5PREVWOwoKCWlmIChwYXJhbXMtPmVjX3RwX29mZnNldCA9PSBIUF9FQ19P
RkZTRVRfVU5LTk9XTiB8fAoJICAgIHBhcmFtcy0+ZWNfdHBfb2Zmc2V0ID09IEhQX05PX1RIRVJN
QUxfUFJPRklMRV9PRkZTRVQpIHsKCQkqcHJvZmlsZSA9IGFjdGl2ZV9wbGF0Zm9ybV9wcm9maWxl
OwoJCXJldHVybiAwOwoJfQoKCXJldCA9IGVjX3JlYWQocGFyYW1zLT5lY190cF9vZmZzZXQsICZ0
cCk7CglpZiAocmV0KQoJCXJldHVybiByZXQ7CgoJLyoKCSAqIEJvYXJkcyBsaWtlIDhDNzggaGF2
ZSB0cCA9PSAweDAgfHwgdHAgPT0gMHgxIGFmdGVyIGNvbGQgYm9vdCwKCSAqIGJ1dCBsb2dpY2Fs
bHkgaXQgc2hvdWxkIGhhdmUgdHAgPT0gMHgzMCB8fCB0cCA9PSAweDMxLCBhcwoJICogY29ycmVj
dGVkIGJ5IHRoZSBPbWVuIEdhbWluZyBIdWIgb24gd2luZG93cy4gSGVuY2UgYWNjZXB0IGJvdGgK
CSAqIG9mIHRoZXNlIHZhbHVlcy4KCSAqLwoJaWYgKHRwID09IHZpY3R1c19zX3RoZXJtYWxfcGFy
YW1zLnBlcmZvcm1hbmNlIHx8CgkgICAgdHAgPT0gb21lbl92MV90aGVybWFsX3BhcmFtcy5wZXJm
b3JtYW5jZSkgewoJCSpwcm9maWxlID0gUExBVEZPUk1fUFJPRklMRV9QRVJGT1JNQU5DRTsKCX0g
ZWxzZSBpZiAodHAgPT0gdmljdHVzX3NfdGhlcm1hbF9wYXJhbXMuYmFsYW5jZWQgfHwKCQkgICB0
cCA9PSBvbWVuX3YxX3RoZXJtYWxfcGFyYW1zLmJhbGFuY2VkKSB7CgkJLyoKCQkgKiBTaW5jZSBi
b3RoIFBMQVRGT1JNX1BST0ZJTEVfTE9XX1BPV0VSIGFuZAoJCSAqIFBMQVRGT1JNX1BST0ZJTEVf
QkFMQU5DRUQgc2hhcmUgdGhlIHNhbWUgdGhlcm1hbCBwcm9maWxlCgkJICogcGFyYW1ldGVyIHZh
bHVlLCBoZW5jZSB0byBkaWZmZXJlbnRpYXRlIGJldHdlZW4gdGhlbSwgd2UKCQkgKiBxdWVyeSB0
aGUgR1BVIENUR1AgYW5kIFBQQUIgc3RhdGVzIGFuZCBjb21wYXJlIGJhc2VkIG9mZiBvZgoJCSAq
IHRoYXQuCgkJICovCgkJcmV0ID0gdmljdHVzX3NfZ3B1X3RoZXJtYWxfcHJvZmlsZV9nZXQoJmN1
cnJlbnRfY3RncF9zdGF0ZSwKCQkJCQkJICAgICAgICZjdXJyZW50X3BwYWJfc3RhdGUsCgkJCQkJ
CSAgICAgICAmY3VycmVudF9kc3RhdGUsCgkJCQkJCSAgICAgICAmY3VycmVudF9ncHVfc2xvd2Rv
d25fdGVtcCk7CgkJaWYgKHJldCA8IDApCgkJCXJldHVybiByZXQ7CgkJaWYgKGN1cnJlbnRfY3Rn
cF9zdGF0ZSA9PSAwICYmIGN1cnJlbnRfcHBhYl9zdGF0ZSA9PSAwKQoJCQkqcHJvZmlsZSA9IFBM
QVRGT1JNX1BST0ZJTEVfTE9XX1BPV0VSOwoJCWVsc2UgaWYgKGN1cnJlbnRfY3RncF9zdGF0ZSA9
PSAwICYmIGN1cnJlbnRfcHBhYl9zdGF0ZSA9PSAxKQoJCQkqcHJvZmlsZSA9IFBMQVRGT1JNX1BS
T0ZJTEVfQkFMQU5DRUQ7CgkJZWxzZQoJCQlyZXR1cm4gLUVJTlZBTDsKCX0gZWxzZSB7CgkJcmV0
dXJuIC1FSU5WQUw7Cgl9CgoJcmV0dXJuIDA7Cn0KCnN0YXRpYyBpbnQgcGxhdGZvcm1fcHJvZmls
ZV92aWN0dXNfc19zZXRfZWMoZW51bSBwbGF0Zm9ybV9wcm9maWxlX29wdGlvbiBwcm9maWxlKQp7
Cgljb25zdCBzdHJ1Y3QgdGhlcm1hbF9wcm9maWxlX3BhcmFtcyAqcGFyYW1zOwoJYm9vbCBncHVf
Y3RncF9lbmFibGUsIGdwdV9wcGFiX2VuYWJsZTsKCXU4IGdwdV9kc3RhdGU7IC8qIFRlc3Qgc2hv
d3MgMSA9IDEwMCUsIDIgPSA1MCUsIDMgPSAyNSUsIDQgPSAxMi41JSAqLwoJaW50IGVyciwgdHA7
CgoJcGFyYW1zID0gaHBfd21pX3RoZXJtYWxfcHJvZmlsZSgpOwoJaWYgKCFwYXJhbXMpCgkJcmV0
dXJuIC1FTk9ERVY7CgoJc3dpdGNoIChwcm9maWxlKSB7CgljYXNlIFBMQVRGT1JNX1BST0ZJTEVf
UEVSRk9STUFOQ0U6CgkJdHAgPSBwYXJhbXMtPnBlcmZvcm1hbmNlOwoJCWdwdV9jdGdwX2VuYWJs
ZSA9IHRydWU7CgkJZ3B1X3BwYWJfZW5hYmxlID0gdHJ1ZTsKCQlncHVfZHN0YXRlID0gMTsKCQli
cmVhazsKCWNhc2UgUExBVEZPUk1fUFJPRklMRV9CQUxBTkNFRDoKCQl0cCA9IHBhcmFtcy0+YmFs
YW5jZWQ7CgkJZ3B1X2N0Z3BfZW5hYmxlID0gZmFsc2U7CgkJZ3B1X3BwYWJfZW5hYmxlID0gdHJ1
ZTsKCQlncHVfZHN0YXRlID0gMTsKCQlicmVhazsKCWNhc2UgUExBVEZPUk1fUFJPRklMRV9MT1df
UE9XRVI6CgkJdHAgPSBwYXJhbXMtPmxvd19wb3dlcjsKCQlncHVfY3RncF9lbmFibGUgPSBmYWxz
ZTsKCQlncHVfcHBhYl9lbmFibGUgPSBmYWxzZTsKCQlncHVfZHN0YXRlID0gMTsKCQlicmVhazsK
CWRlZmF1bHQ6CgkJcmV0dXJuIC1FT1BOT1RTVVBQOwoJfQoKCWhwX3dtaV9nZXRfZmFuX2NvdW50
X3VzZXJkZWZpbmVfdHJpZ2dlcigpOwoKCWVyciA9IG9tZW5fdGhlcm1hbF9wcm9maWxlX3NldCh0
cCk7CglpZiAoZXJyIDwgMCkgewoJCXByX2VycigiRmFpbGVkIHRvIHNldCBwbGF0Zm9ybSBwcm9m
aWxlICVkOiAlZFxuIiwgcHJvZmlsZSwgZXJyKTsKCQlyZXR1cm4gZXJyOwoJfQoKCWVyciA9IHZp
Y3R1c19zX2dwdV90aGVybWFsX3Byb2ZpbGVfc2V0KGdwdV9jdGdwX2VuYWJsZSwKCQkJCQkgICAg
ICAgZ3B1X3BwYWJfZW5hYmxlLAoJCQkJCSAgICAgICBncHVfZHN0YXRlKTsKCWlmIChlcnIgPCAw
KSB7CgkJcHJfZXJyKCJGYWlsZWQgdG8gc2V0IEdQVSBwcm9maWxlICVkOiAlZFxuIiwgcHJvZmls
ZSwgZXJyKTsKCQlyZXR1cm4gZXJyOwoJfQoKCXJldHVybiAwOwp9CgpzdGF0aWMgaW50IHBsYXRm
b3JtX3Byb2ZpbGVfdmljdHVzX3Nfc2V0KHN0cnVjdCBkZXZpY2UgKmRldiwKCQkJCQkgZW51bSBw
bGF0Zm9ybV9wcm9maWxlX29wdGlvbiBwcm9maWxlKQp7CglpbnQgZXJyOwoKCWd1YXJkKG11dGV4
KSgmYWN0aXZlX3BsYXRmb3JtX3Byb2ZpbGVfbG9jayk7CgoJZXJyID0gcGxhdGZvcm1fcHJvZmls
ZV92aWN0dXNfc19zZXRfZWMocHJvZmlsZSk7CglpZiAoZXJyIDwgMCkKCQlyZXR1cm4gZXJyOwoK
CWFjdGl2ZV9wbGF0Zm9ybV9wcm9maWxlID0gcHJvZmlsZTsKCglyZXR1cm4gMDsKfQoKc3RhdGlj
IGludCBwbGF0Zm9ybV9wcm9maWxlX3ZpY3R1c19zZXQoc3RydWN0IGRldmljZSAqZGV2LAoJCQkJ
ICAgICAgIGVudW0gcGxhdGZvcm1fcHJvZmlsZV9vcHRpb24gcHJvZmlsZSkKewoJaW50IGVycjsK
CglndWFyZChtdXRleCkoJmFjdGl2ZV9wbGF0Zm9ybV9wcm9maWxlX2xvY2spOwoKCWVyciA9IHBs
YXRmb3JtX3Byb2ZpbGVfdmljdHVzX3NldF9lYyhwcm9maWxlKTsKCWlmIChlcnIgPCAwKQoJCXJl
dHVybiBlcnI7CgoJYWN0aXZlX3BsYXRmb3JtX3Byb2ZpbGUgPSBwcm9maWxlOwoKCXJldHVybiAw
Owp9CgpzdGF0aWMgaW50IGhwX3dtaV9wbGF0Zm9ybV9wcm9maWxlX3Byb2JlKHZvaWQgKmRydmRh
dGEsIHVuc2lnbmVkIGxvbmcgKmNob2ljZXMpCnsKCWlmIChpc19vbWVuX3RoZXJtYWxfcHJvZmls
ZSgpKSB7CgkJc2V0X2JpdChQTEFURk9STV9QUk9GSUxFX0NPT0wsIGNob2ljZXMpOwoJfSBlbHNl
IGlmIChpc192aWN0dXNfdGhlcm1hbF9wcm9maWxlKCkpIHsKCQlzZXRfYml0KFBMQVRGT1JNX1BS
T0ZJTEVfUVVJRVQsIGNob2ljZXMpOwoJfSBlbHNlIGlmIChpc192aWN0dXNfc190aGVybWFsX3By
b2ZpbGUoKSkgewoJCS8qIEFkZGluZyBhbiBlcXVpdmFsZW50IHRvIEhQIE9tZW4gc29mdHdhcmUg
RUNPIG1vZGU6ICovCgkJc2V0X2JpdChQTEFURk9STV9QUk9GSUxFX0xPV19QT1dFUiwgY2hvaWNl
cyk7Cgl9IGVsc2UgewoJCXNldF9iaXQoUExBVEZPUk1fUFJPRklMRV9RVUlFVCwgY2hvaWNlcyk7
CgkJc2V0X2JpdChQTEFURk9STV9QUk9GSUxFX0NPT0wsIGNob2ljZXMpOwoJfQoKCXNldF9iaXQo
UExBVEZPUk1fUFJPRklMRV9CQUxBTkNFRCwgY2hvaWNlcyk7CglzZXRfYml0KFBMQVRGT1JNX1BS
T0ZJTEVfUEVSRk9STUFOQ0UsIGNob2ljZXMpOwoKCXJldHVybiAwOwp9CgpzdGF0aWMgaW50IG9t
ZW5fcG93ZXJzb3VyY2VfZXZlbnQoc3RydWN0IG5vdGlmaWVyX2Jsb2NrICpuYiwKCQkJCSAgdW5z
aWduZWQgbG9uZyB2YWx1ZSwKCQkJCSAgdm9pZCAqZGF0YSkKewoJc3RydWN0IGFjcGlfYnVzX2V2
ZW50ICpldmVudF9lbnRyeSA9IGRhdGE7CgllbnVtIHBsYXRmb3JtX3Byb2ZpbGVfb3B0aW9uIGFj
dHVhbF9wcm9maWxlOwoJaW50IGVycjsKCglpZiAoc3RyY21wKGV2ZW50X2VudHJ5LT5kZXZpY2Vf
Y2xhc3MsIEFDUElfQUNfQ0xBU1MpICE9IDApCgkJcmV0dXJuIE5PVElGWV9ET05FOwoKCXByX2Rl
YnVnKCJSZWNlaXZlZCBwb3dlciBzb3VyY2UgZGV2aWNlIGV2ZW50XG4iKTsKCglndWFyZChtdXRl
eCkoJmFjdGl2ZV9wbGF0Zm9ybV9wcm9maWxlX2xvY2spOwoKCS8qCgkgKiBUaGlzIGhhbmRsZXIg
Y2FuIG9ubHkgYmUgY2FsbGVkIG9uIE9tZW4gYW5kIFZpY3R1cyBtb2RlbHMsIHNvCgkgKiB0aGVy
ZSdzIG5vIG5lZWQgdG8gY2FsbCBpc192aWN0dXNfdGhlcm1hbF9wcm9maWxlKCkgaGVyZS4KCSAq
LwoJaWYgKGlzX29tZW5fdGhlcm1hbF9wcm9maWxlKCkpCgkJZXJyID0gcGxhdGZvcm1fcHJvZmls
ZV9vbWVuX2dldF9lYygmYWN0dWFsX3Byb2ZpbGUpOwoJZWxzZQoJCWVyciA9IHBsYXRmb3JtX3By
b2ZpbGVfdmljdHVzX2dldF9lYygmYWN0dWFsX3Byb2ZpbGUpOwoKCWlmIChlcnIgPCAwKSB7CgkJ
LyoKCQkgKiBBbHRob3VnaCB3ZSBmYWlsZWQgdG8gZ2V0IHRoZSBjdXJyZW50IHBsYXRmb3JtIHBy
b2ZpbGUsIHdlCgkJICogc3RpbGwgd2FudCB0aGUgb3RoZXIgZXZlbnQgY29uc3VtZXJzIHRvIHBy
b2Nlc3MgaXQuCgkJICovCgkJcHJfd2FybigiRmFpbGVkIHRvIHJlYWQgY3VycmVudCBwbGF0Zm9y
bSBwcm9maWxlICglZClcbiIsIGVycik7CgkJcmV0dXJuIE5PVElGWV9ET05FOwoJfQoKCS8qCgkg
KiBJZiB3ZSdyZSBiYWNrIG9uIEFDIGFuZCB0aGF0IHRoZSB1c2VyLWNob3NlbiBwb3dlciBwcm9m
aWxlIGlzCgkgKiBkaWZmZXJlbnQgZnJvbSB3aGF0IHRoZSBFQyByZXBvcnRzLCB3ZSByZXN0b3Jl
IHRoZSB1c2VyLWNob3NlbgoJICogb25lLgoJICovCglpZiAocG93ZXJfc3VwcGx5X2lzX3N5c3Rl
bV9zdXBwbGllZCgpIDw9IDAgfHwKCSAgICBhY3RpdmVfcGxhdGZvcm1fcHJvZmlsZSA9PSBhY3R1
YWxfcHJvZmlsZSkgewoJCXByX2RlYnVnKCJQbGF0Zm9ybSBwcm9maWxlIHVwZGF0ZSBza2lwcGVk
LCBjb25kaXRpb25zIHVubWV0XG4iKTsKCQlyZXR1cm4gTk9USUZZX0RPTkU7Cgl9CgoJaWYgKGlz
X29tZW5fdGhlcm1hbF9wcm9maWxlKCkpCgkJZXJyID0gcGxhdGZvcm1fcHJvZmlsZV9vbWVuX3Nl
dF9lYyhhY3RpdmVfcGxhdGZvcm1fcHJvZmlsZSk7CgllbHNlCgkJZXJyID0gcGxhdGZvcm1fcHJv
ZmlsZV92aWN0dXNfc2V0X2VjKGFjdGl2ZV9wbGF0Zm9ybV9wcm9maWxlKTsKCglpZiAoZXJyIDwg
MCkgewoJCXByX3dhcm4oIkZhaWxlZCB0byByZXN0b3JlIHBsYXRmb3JtIHByb2ZpbGUgKCVkKVxu
IiwgZXJyKTsKCQlyZXR1cm4gTk9USUZZX0RPTkU7Cgl9CgoJcmV0dXJuIE5PVElGWV9PSzsKfQoK
c3RhdGljIGludCB2aWN0dXNfc19wb3dlcnNvdXJjZV9ldmVudChzdHJ1Y3Qgbm90aWZpZXJfYmxv
Y2sgKm5iLAoJCQkJICAgICAgdW5zaWduZWQgbG9uZyB2YWx1ZSwKCQkJCSAgICAgIHZvaWQgKmRh
dGEpCnsKCXN0cnVjdCBhY3BpX2J1c19ldmVudCAqZXZlbnRfZW50cnkgPSBkYXRhOwoJZW51bSBw
bGF0Zm9ybV9wcm9maWxlX29wdGlvbiBhY3R1YWxfcHJvZmlsZTsKCWludCBlcnI7CgoJaWYgKHN0
cmNtcChldmVudF9lbnRyeS0+ZGV2aWNlX2NsYXNzLCBBQ1BJX0FDX0NMQVNTKSAhPSAwKQoJCXJl
dHVybiBOT1RJRllfRE9ORTsKCglwcl9kZWJ1ZygiUmVjZWl2ZWQgcG93ZXIgc291cmNlIGRldmlj
ZSBldmVudFxuIik7CgoJZ3VhcmQobXV0ZXgpKCZhY3RpdmVfcGxhdGZvcm1fcHJvZmlsZV9sb2Nr
KTsKCWVyciA9IHBsYXRmb3JtX3Byb2ZpbGVfdmljdHVzX3NfZ2V0X2VjKCZhY3R1YWxfcHJvZmls
ZSk7CglpZiAoZXJyIDwgMCkgewoJCS8qCgkJICogQWx0aG91Z2ggd2UgZmFpbGVkIHRvIGdldCB0
aGUgY3VycmVudCBwbGF0Zm9ybSBwcm9maWxlLCB3ZQoJCSAqIHN0aWxsIHdhbnQgdGhlIG90aGVy
IGV2ZW50IGNvbnN1bWVycyB0byBwcm9jZXNzIGl0LgoJCSAqLwoJCXByX3dhcm4oIkZhaWxlZCB0
byByZWFkIGN1cnJlbnQgcGxhdGZvcm0gcHJvZmlsZSAoJWQpXG4iLCBlcnIpOwoJCXJldHVybiBO
T1RJRllfRE9ORTsKCX0KCgkvKgoJICogU3dpdGNoaW5nIHRvIGJhdHRlcnkgcG93ZXIgc291cmNl
IHdoaWxlIFBlcmZvcm1hbmNlIG1vZGUgaXMgYWN0aXZlCgkgKiBuZWVkcyBtYW51YWwgdHJpZ2dl
cmluZyBvZiBDUFUgcG93ZXIgbGltaXRzLiBTYW1lIGdvZXMgd2hlbiBzd2l0Y2hpbmcKCSAqIHRv
IEFDIHBvd2VyIHNvdXJjZSB3aGlsZSBQZXJmb3JtYW5jZSBtb2RlIGlzIGFjdGl2ZS4gT3RoZXIg
bW9kZXMKCSAqIGhvd2V2ZXIgYXJlIGF1dG9tYXRpY2FsbHkgYmVoYXZpbmcgd2l0aG91dCBhbnkg
bWFudWFsIGFjdGlvbi4KCSAqIFNlZW4gb24gSFAgMTYtczEwMzRuZiAoYm9hcmQgOEM5Qykgd2l0
aCBGLjExIGFuZCBGLjEzIEJJT1MgdmVyc2lvbnMuCgkgKi8KCglpZiAoYWN0dWFsX3Byb2ZpbGUg
PT0gUExBVEZPUk1fUFJPRklMRV9QRVJGT1JNQU5DRSkgewoJCXByX2RlYnVnKCJUcmlnZ2VyaW5n
IENQVSBQTDEvUEwyIGFjdHVhbGl6YXRpb25cbiIpOwoJCWVyciA9IHZpY3R1c19zX3NldF9jcHVf
cGwxX3BsMihIUF9QT1dFUl9MSU1JVF9ERUZBVUxULAoJCQkJCSAgICAgICBIUF9QT1dFUl9MSU1J
VF9ERUZBVUxUKTsKCQlpZiAoZXJyKQoJCQlwcl93YXJuKCJGYWlsZWQgdG8gYWN0dWFsaXplIHBv
d2VyIGxpbWl0czogJWRcbiIsIGVycik7CgoJCXJldHVybiBOT1RJRllfRE9ORTsKCX0KCglyZXR1
cm4gTk9USUZZX09LOwp9CgpzdGF0aWMgaW50IG9tZW5fcmVnaXN0ZXJfcG93ZXJzb3VyY2VfZXZl
bnRfaGFuZGxlcih2b2lkKQp7CglpbnQgZXJyOwoKCXBsYXRmb3JtX3Bvd2VyX3NvdXJjZV9uYi5u
b3RpZmllcl9jYWxsID0gb21lbl9wb3dlcnNvdXJjZV9ldmVudDsKCWVyciA9IHJlZ2lzdGVyX2Fj
cGlfbm90aWZpZXIoJnBsYXRmb3JtX3Bvd2VyX3NvdXJjZV9uYik7CgoJaWYgKGVyciA8IDApIHsK
CQlwcl93YXJuKCJGYWlsZWQgdG8gaW5zdGFsbCBBQ1BJIHBvd2VyIHNvdXJjZSBub3RpZnkgaGFu
ZGxlclxuIik7CgkJcmV0dXJuIGVycjsKCX0KCglyZXR1cm4gMDsKfQoKc3RhdGljIGludCB2aWN0
dXNfc19yZWdpc3Rlcl9wb3dlcnNvdXJjZV9ldmVudF9oYW5kbGVyKHZvaWQpCnsKCWludCBlcnI7
CgoJcGxhdGZvcm1fcG93ZXJfc291cmNlX25iLm5vdGlmaWVyX2NhbGwgPSB2aWN0dXNfc19wb3dl
cnNvdXJjZV9ldmVudDsKCWVyciA9IHJlZ2lzdGVyX2FjcGlfbm90aWZpZXIoJnBsYXRmb3JtX3Bv
d2VyX3NvdXJjZV9uYik7CglpZiAoZXJyIDwgMCkgewoJCXByX3dhcm4oIkZhaWxlZCB0byBpbnN0
YWxsIEFDUEkgcG93ZXIgc291cmNlIG5vdGlmeSBoYW5kbGVyXG4iKTsKCQlyZXR1cm4gZXJyOwoJ
fQoKCXJldHVybiAwOwp9CgpzdGF0aWMgaW5saW5lIHZvaWQgb21lbl91bnJlZ2lzdGVyX3Bvd2Vy
c291cmNlX2V2ZW50X2hhbmRsZXIodm9pZCkKewoJdW5yZWdpc3Rlcl9hY3BpX25vdGlmaWVyKCZw
bGF0Zm9ybV9wb3dlcl9zb3VyY2VfbmIpOwp9CgpzdGF0aWMgaW5saW5lIHZvaWQgdmljdHVzX3Nf
dW5yZWdpc3Rlcl9wb3dlcnNvdXJjZV9ldmVudF9oYW5kbGVyKHZvaWQpCnsKCXVucmVnaXN0ZXJf
YWNwaV9ub3RpZmllcigmcGxhdGZvcm1fcG93ZXJfc291cmNlX25iKTsKfQoKc3RhdGljIGNvbnN0
IHN0cnVjdCBwbGF0Zm9ybV9wcm9maWxlX29wcyBwbGF0Zm9ybV9wcm9maWxlX29tZW5fb3BzID0g
ewoJLnByb2JlID0gaHBfd21pX3BsYXRmb3JtX3Byb2ZpbGVfcHJvYmUsCgkucHJvZmlsZV9nZXQg
PSBwbGF0Zm9ybV9wcm9maWxlX29tZW5fZ2V0LAoJLnByb2ZpbGVfc2V0ID0gcGxhdGZvcm1fcHJv
ZmlsZV9vbWVuX3NldCwKfTsKCnN0YXRpYyBjb25zdCBzdHJ1Y3QgcGxhdGZvcm1fcHJvZmlsZV9v
cHMgcGxhdGZvcm1fcHJvZmlsZV92aWN0dXNfb3BzID0gewoJLnByb2JlID0gaHBfd21pX3BsYXRm
b3JtX3Byb2ZpbGVfcHJvYmUsCgkucHJvZmlsZV9nZXQgPSBwbGF0Zm9ybV9wcm9maWxlX3ZpY3R1
c19nZXQsCgkucHJvZmlsZV9zZXQgPSBwbGF0Zm9ybV9wcm9maWxlX3ZpY3R1c19zZXQsCn07Cgpz
dGF0aWMgY29uc3Qgc3RydWN0IHBsYXRmb3JtX3Byb2ZpbGVfb3BzIHBsYXRmb3JtX3Byb2ZpbGVf
dmljdHVzX3Nfb3BzID0gewoJLnByb2JlID0gaHBfd21pX3BsYXRmb3JtX3Byb2ZpbGVfcHJvYmUs
CgkucHJvZmlsZV9nZXQgPSBwbGF0Zm9ybV9wcm9maWxlX29tZW5fZ2V0LAoJLnByb2ZpbGVfc2V0
ID0gcGxhdGZvcm1fcHJvZmlsZV92aWN0dXNfc19zZXQsCn07CgpzdGF0aWMgY29uc3Qgc3RydWN0
IHBsYXRmb3JtX3Byb2ZpbGVfb3BzIGhwX3dtaV9wbGF0Zm9ybV9wcm9maWxlX29wcyA9IHsKCS5w
cm9iZSA9IGhwX3dtaV9wbGF0Zm9ybV9wcm9maWxlX3Byb2JlLAoJLnByb2ZpbGVfZ2V0ID0gaHBf
d21pX3BsYXRmb3JtX3Byb2ZpbGVfZ2V0LAoJLnByb2ZpbGVfc2V0ID0gaHBfd21pX3BsYXRmb3Jt
X3Byb2ZpbGVfc2V0LAp9OwoKc3RhdGljIGludCB0aGVybWFsX3Byb2ZpbGVfc2V0dXAoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqZGV2aWNlKQp7Cgljb25zdCBzdHJ1Y3QgcGxhdGZvcm1fcHJvZmls
ZV9vcHMgKm9wczsKCWNvbnN0IHN0cnVjdCB0aGVybWFsX3Byb2ZpbGVfcGFyYW1zICpwYXJhbXM7
CglpbnQgZXJyLCB0cDsKCglpZiAoaXNfb21lbl90aGVybWFsX3Byb2ZpbGUoKSkgewoJCWVyciA9
IHBsYXRmb3JtX3Byb2ZpbGVfb21lbl9nZXRfZWMoJmFjdGl2ZV9wbGF0Zm9ybV9wcm9maWxlKTsK
CQlpZiAoZXJyIDwgMCkKCQkJcmV0dXJuIGVycjsKCgkJLyoKCQkgKiBjYWxsIHRoZXJtYWwgcHJv
ZmlsZSB3cml0ZSBjb21tYW5kIHRvIGVuc3VyZSB0aGF0IHRoZQoJCSAqIGZpcm13YXJlIGNvcnJl
Y3RseSBzZXRzIHRoZSBPRU0gdmFyaWFibGVzCgkJICovCgkJZXJyID0gcGxhdGZvcm1fcHJvZmls
ZV9vbWVuX3NldF9lYyhhY3RpdmVfcGxhdGZvcm1fcHJvZmlsZSk7CgkJaWYgKGVyciA8IDApCgkJ
CXJldHVybiBlcnI7CgoJCW9wcyA9ICZwbGF0Zm9ybV9wcm9maWxlX29tZW5fb3BzOwoJfSBlbHNl
IGlmIChpc192aWN0dXNfdGhlcm1hbF9wcm9maWxlKCkpIHsKCQllcnIgPSBwbGF0Zm9ybV9wcm9m
aWxlX3ZpY3R1c19nZXRfZWMoJmFjdGl2ZV9wbGF0Zm9ybV9wcm9maWxlKTsKCQlpZiAoZXJyIDwg
MCkKCQkJcmV0dXJuIGVycjsKCgkJLyoKCQkgKiBjYWxsIHRoZXJtYWwgcHJvZmlsZSB3cml0ZSBj
b21tYW5kIHRvIGVuc3VyZSB0aGF0IHRoZQoJCSAqIGZpcm13YXJlIGNvcnJlY3RseSBzZXRzIHRo
ZSBPRU0gdmFyaWFibGVzCgkJICovCgkJZXJyID0gcGxhdGZvcm1fcHJvZmlsZV92aWN0dXNfc2V0
X2VjKGFjdGl2ZV9wbGF0Zm9ybV9wcm9maWxlKTsKCQlpZiAoZXJyIDwgMCkKCQkJcmV0dXJuIGVy
cjsKCgkJb3BzID0gJnBsYXRmb3JtX3Byb2ZpbGVfdmljdHVzX29wczsKCX0gZWxzZSBpZiAoaXNf
dmljdHVzX3NfdGhlcm1hbF9wcm9maWxlKCkpIHsKCQlwYXJhbXMgPSBocF93bWlfdGhlcm1hbF9w
cm9maWxlKCk7CgkJaWYgKCFwYXJhbXMpCgkJCXJldHVybiAtRU5PREVWOwoKCQkvKgoJCSAqIEZv
ciBhbiB1bmtub3duIEVDIGxheW91dCBib2FyZCwgcGxhdGZvcm1fcHJvZmlsZV92aWN0dXNfc19n
ZXRfZWMoKSwKCQkgKiBiZWhhdmVzIGxpa2UgYSB3cmFwcGVyIGFyb3VuZCBhY3RpdmVfcGxhdGZv
cm1fcHJvZmlsZSwgdG8gYXZvaWQgdXNpbmcKCQkgKiB1bmluaXRpYWxpemVkIGRhdGEsIHdlIGRl
ZmF1bHQgdG8gUExBVEZPUk1fUFJPRklMRV9CQUxBTkNFRC4KCQkgKi8KCQlpZiAocGFyYW1zLT5l
Y190cF9vZmZzZXQgPT0gSFBfRUNfT0ZGU0VUX1VOS05PV04gfHwKCQkgICAgcGFyYW1zLT5lY190
cF9vZmZzZXQgPT0gSFBfTk9fVEhFUk1BTF9QUk9GSUxFX09GRlNFVCkgewoJCQlhY3RpdmVfcGxh
dGZvcm1fcHJvZmlsZSA9IFBMQVRGT1JNX1BST0ZJTEVfQkFMQU5DRUQ7CgkJfSBlbHNlIHsKCQkJ
ZXJyID0gcGxhdGZvcm1fcHJvZmlsZV92aWN0dXNfc19nZXRfZWMoJmFjdGl2ZV9wbGF0Zm9ybV9w
cm9maWxlKTsKCQkJaWYgKGVyciA8IDApCgkJCQlyZXR1cm4gZXJyOwoJCX0KCgkJLyoKCQkgKiBj
YWxsIHRoZXJtYWwgcHJvZmlsZSB3cml0ZSBjb21tYW5kIHRvIGVuc3VyZSB0aGF0IHRoZQoJCSAq
IGZpcm13YXJlIGNvcnJlY3RseSBzZXRzIHRoZSBPRU0gdmFyaWFibGVzCgkJICovCgkJZXJyID0g
cGxhdGZvcm1fcHJvZmlsZV92aWN0dXNfc19zZXRfZWMoYWN0aXZlX3BsYXRmb3JtX3Byb2ZpbGUp
OwoJCWlmIChlcnIgPCAwKQoJCQlyZXR1cm4gZXJyOwoKCQlvcHMgPSAmcGxhdGZvcm1fcHJvZmls
ZV92aWN0dXNfc19vcHM7Cgl9IGVsc2UgewoJCXRwID0gdGhlcm1hbF9wcm9maWxlX2dldCgpOwoK
CQlpZiAodHAgPCAwKQoJCQlyZXR1cm4gdHA7CgoJCS8qCgkJICogY2FsbCB0aGVybWFsIHByb2Zp
bGUgd3JpdGUgY29tbWFuZCB0byBlbnN1cmUgdGhhdCB0aGUKCQkgKiBmaXJtd2FyZSBjb3JyZWN0
bHkgc2V0cyB0aGUgT0VNIHZhcmlhYmxlcyBmb3IgdGhlIERQVEYKCQkgKi8KCQllcnIgPSB0aGVy
bWFsX3Byb2ZpbGVfc2V0KHRwKTsKCQlpZiAoZXJyKQoJCQlyZXR1cm4gZXJyOwoKCQlvcHMgPSAm
aHBfd21pX3BsYXRmb3JtX3Byb2ZpbGVfb3BzOwoJfQoKCXBsYXRmb3JtX3Byb2ZpbGVfZGV2aWNl
ID0gZGV2bV9wbGF0Zm9ybV9wcm9maWxlX3JlZ2lzdGVyKCZkZXZpY2UtPmRldiwgImhwLXdtaSIs
CgkJCQkJCQkJIE5VTEwsIG9wcyk7CglpZiAoSVNfRVJSKHBsYXRmb3JtX3Byb2ZpbGVfZGV2aWNl
KSkKCQlyZXR1cm4gUFRSX0VSUihwbGF0Zm9ybV9wcm9maWxlX2RldmljZSk7CgoJcHJfaW5mbygi
UmVnaXN0ZXJlZCBhcyBwbGF0Zm9ybSBwcm9maWxlIGhhbmRsZXJcbiIpOwoJcGxhdGZvcm1fcHJv
ZmlsZV9zdXBwb3J0ID0gdHJ1ZTsKCglyZXR1cm4gMDsKfQoKc3RhdGljIGludCBocF93bWlfaHdt
b25faW5pdCh2b2lkKTsKCnN0YXRpYyBpbnQgX19pbml0IGhwX3dtaV9iaW9zX3NldHVwKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKmRldmljZSkKewoJaW50IGVycjsKCS8qIGNsZWFyIGRldGVjdGVk
IHJma2lsbCBkZXZpY2VzICovCgl3aWZpX3Jma2lsbCA9IE5VTEw7CglibHVldG9vdGhfcmZraWxs
ID0gTlVMTDsKCXd3YW5fcmZraWxsID0gTlVMTDsKCXJma2lsbDJfY291bnQgPSAwOwoKCS8qCgkg
KiBJbiBwcmUtMjAwOSBCSU9TLCBjb21tYW5kIDFCaCByZXR1cm4gMHg0IHRvIGluZGljYXRlIHRo
YXQKCSAqIEJJT1Mgbm8gbG9uZ2VyIGNvbnRyb2xzIHRoZSBwb3dlciBmb3IgdGhlIHdpcmVsZXNz
CgkgKiBkZXZpY2VzLiBBbGwgZmVhdHVyZXMgc3VwcG9ydGVkIGJ5IHRoaXMgY29tbWFuZCB3aWxs
IG5vCgkgKiBsb25nZXIgYmUgc3VwcG9ydGVkLgoJICovCglpZiAoIWhwX3dtaV9iaW9zXzIwMDlf
bGF0ZXIoKSkgewoJCWlmIChocF93bWlfcmZraWxsX3NldHVwKGRldmljZSkpCgkJCWhwX3dtaV9y
ZmtpbGwyX3NldHVwKGRldmljZSk7Cgl9CgoJZXJyID0gaHBfd21pX2h3bW9uX2luaXQoKTsKCglp
ZiAoZXJyIDwgMCkKCQlyZXR1cm4gZXJyOwoKCXRoZXJtYWxfcHJvZmlsZV9zZXR1cChkZXZpY2Up
OwoKCXJldHVybiAwOwp9CgpzdGF0aWMgdm9pZCBfX2V4aXQgaHBfd21pX2Jpb3NfcmVtb3ZlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKmRldmljZSkKewoJaW50IGk7CglzdHJ1Y3QgaHBfd21pX2h3
bW9uX3ByaXYgKnByaXY7CgoJZm9yIChpID0gMDsgaSA8IHJma2lsbDJfY291bnQ7IGkrKykgewoJ
CXJma2lsbF91bnJlZ2lzdGVyKHJma2lsbDJbaV0ucmZraWxsKTsKCQlyZmtpbGxfZGVzdHJveShy
ZmtpbGwyW2ldLnJma2lsbCk7Cgl9CgoJaWYgKHdpZmlfcmZraWxsKSB7CgkJcmZraWxsX3VucmVn
aXN0ZXIod2lmaV9yZmtpbGwpOwoJCXJma2lsbF9kZXN0cm95KHdpZmlfcmZraWxsKTsKCX0KCWlm
IChibHVldG9vdGhfcmZraWxsKSB7CgkJcmZraWxsX3VucmVnaXN0ZXIoYmx1ZXRvb3RoX3Jma2ls
bCk7CgkJcmZraWxsX2Rlc3Ryb3koYmx1ZXRvb3RoX3Jma2lsbCk7Cgl9CglpZiAod3dhbl9yZmtp
bGwpIHsKCQlyZmtpbGxfdW5yZWdpc3Rlcih3d2FuX3Jma2lsbCk7CgkJcmZraWxsX2Rlc3Ryb3ko
d3dhbl9yZmtpbGwpOwoJfQoKCXByaXYgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShkZXZpY2UpOwoJ
aWYgKHByaXYpCgkJY2FuY2VsX2RlbGF5ZWRfd29ya19zeW5jKCZwcml2LT5rZWVwX2FsaXZlX2R3
b3JrKTsKfQoKc3RhdGljIGludCBocF93bWlfcmVzdW1lX2hhbmRsZXIoc3RydWN0IGRldmljZSAq
ZGV2aWNlKQp7CgkvKgoJICogSGFyZHdhcmUgc3RhdGUgbWF5IGhhdmUgY2hhbmdlZCB3aGlsZSBz
dXNwZW5kZWQsIHNvIHRyaWdnZXIKCSAqIGlucHV0IGV2ZW50cyBmb3IgdGhlIGN1cnJlbnQgc3Rh
dGUuIEFzIHRoaXMgaXMgYSBzd2l0Y2gsCgkgKiB0aGUgaW5wdXQgbGF5ZXIgd2lsbCBvbmx5IGFj
dHVhbGx5IHBhc3MgaXQgb24gaWYgdGhlIHN0YXRlCgkgKiBjaGFuZ2VkLgoJICovCglpZiAoaHBf
d21pX2lucHV0X2RldikgewoJCWlmICh0ZXN0X2JpdChTV19ET0NLLCBocF93bWlfaW5wdXRfZGV2
LT5zd2JpdCkpCgkJCWlucHV0X3JlcG9ydF9zd2l0Y2goaHBfd21pX2lucHV0X2RldiwgU1dfRE9D
SywKCQkJCQkgICAgaHBfd21pX2dldF9kb2NrX3N0YXRlKCkpOwoJCWlmICh0ZXN0X2JpdChTV19U
QUJMRVRfTU9ERSwgaHBfd21pX2lucHV0X2Rldi0+c3diaXQpKQoJCQlpbnB1dF9yZXBvcnRfc3dp
dGNoKGhwX3dtaV9pbnB1dF9kZXYsIFNXX1RBQkxFVF9NT0RFLAoJCQkJCSAgICBocF93bWlfZ2V0
X3RhYmxldF9tb2RlKCkpOwoJCWlucHV0X3N5bmMoaHBfd21pX2lucHV0X2Rldik7Cgl9CgoJaWYg
KHJma2lsbDJfY291bnQpCgkJaHBfd21pX3Jma2lsbDJfcmVmcmVzaCgpOwoKCWlmICh3aWZpX3Jm
a2lsbCkKCQlyZmtpbGxfc2V0X3N0YXRlcyh3aWZpX3Jma2lsbCwKCQkJCSAgaHBfd21pX2dldF9z
d19zdGF0ZShIUFdNSV9XSUZJKSwKCQkJCSAgaHBfd21pX2dldF9od19zdGF0ZShIUFdNSV9XSUZJ
KSk7CglpZiAoYmx1ZXRvb3RoX3Jma2lsbCkKCQlyZmtpbGxfc2V0X3N0YXRlcyhibHVldG9vdGhf
cmZraWxsLAoJCQkJICBocF93bWlfZ2V0X3N3X3N0YXRlKEhQV01JX0JMVUVUT09USCksCgkJCQkg
IGhwX3dtaV9nZXRfaHdfc3RhdGUoSFBXTUlfQkxVRVRPT1RIKSk7CglpZiAod3dhbl9yZmtpbGwp
CgkJcmZraWxsX3NldF9zdGF0ZXMod3dhbl9yZmtpbGwsCgkJCQkgIGhwX3dtaV9nZXRfc3dfc3Rh
dGUoSFBXTUlfV1dBTiksCgkJCQkgIGhwX3dtaV9nZXRfaHdfc3RhdGUoSFBXTUlfV1dBTikpOwoK
CXJldHVybiAwOwp9CgpzdGF0aWMgY29uc3Qgc3RydWN0IGRldl9wbV9vcHMgaHBfd21pX3BtX29w
cyA9IHsKCS5yZXN1bWUgID0gaHBfd21pX3Jlc3VtZV9oYW5kbGVyLAoJLnJlc3RvcmUgID0gaHBf
d21pX3Jlc3VtZV9oYW5kbGVyLAp9OwoKLyoKICogaHBfd21pX2Jpb3NfcmVtb3ZlKCkgbGl2ZXMg
aW4gLmV4aXQudGV4dC4gRm9yIGRyaXZlcnMgcmVnaXN0ZXJlZCB2aWEKICogbW9kdWxlX3BsYXRm
b3JtX2RyaXZlcl9wcm9iZSgpIHRoaXMgaXMgb2sgYmVjYXVzZSB0aGV5IGNhbm5vdCBnZXQgdW5i
b3VuZCBhdAogKiBydW50aW1lLiBTbyBtYXJrIHRoZSBkcml2ZXIgc3RydWN0IHdpdGggX19yZWZk
YXRhIHRvIHByZXZlbnQgbW9kcG9zdAogKiB0cmlnZ2VyaW5nIGEgc2VjdGlvbiBtaXNtYXRjaCB3
YXJuaW5nLgogKi8Kc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgaHBfd21pX2RyaXZlciBf
X3JlZmRhdGEgPSB7CgkuZHJpdmVyID0gewoJCS5uYW1lID0gImhwLXdtaSIsCgkJLnBtID0gJmhw
X3dtaV9wbV9vcHMsCgkJLmRldl9ncm91cHMgPSBocF93bWlfZ3JvdXBzLAoJfSwKCS5yZW1vdmUg
PSBfX2V4aXRfcChocF93bWlfYmlvc19yZW1vdmUpLAp9OwoKc3RhdGljIGludCBocF93bWlfYXBw
bHlfZmFuX3NldHRpbmdzKHN0cnVjdCBocF93bWlfaHdtb25fcHJpdiAqcHJpdikKewoJaW50IHJl
dDsKCglzd2l0Y2ggKHByaXYtPm1vZGUpIHsKCWNhc2UgUFdNX01PREVfTUFYOgoJCWlmIChocF93
bWlfZmFuX2NvbnRyb2xfc3VwcG9ydGVkKCkpIHsKCQkJcmV0ID0gaHBfd21pX2dldF9mYW5fY291
bnRfdXNlcmRlZmluZV90cmlnZ2VyKCk7CgkJCWlmIChyZXQgPCAwKQoJCQkJcmV0dXJuIHJldDsK
CQl9CgkJcmV0ID0gaHBfd21pX2Zhbl9zcGVlZF9tYXhfc2V0KDEpOwoJCWlmIChyZXQgPCAwKQoJ
CQlyZXR1cm4gcmV0OwoJCW1vZF9kZWxheWVkX3dvcmsoc3lzdGVtX2RmbF93cSwgJnByaXYtPmtl
ZXBfYWxpdmVfZHdvcmssCgkJCQkgc2Vjc190b19qaWZmaWVzKEtFRVBfQUxJVkVfREVMQVlfU0VD
UykpOwoJCXJldHVybiAwOwoJY2FzZSBQV01fTU9ERV9NQU5VQUw6CgkJaWYgKCFocF93bWlfZmFu
X2NvbnRyb2xfc3VwcG9ydGVkKCkpCgkJCXJldHVybiAtRU9QTk9UU1VQUDsKCQlyZXQgPSBocF93
bWlfZmFuX3NwZWVkX3NldChwcml2KTsKCQlpZiAocmV0IDwgMCkKCQkJcmV0dXJuIHJldDsKCQlt
b2RfZGVsYXllZF93b3JrKHN5c3RlbV9kZmxfd3EsICZwcml2LT5rZWVwX2FsaXZlX2R3b3JrLAoJ
CQkJIHNlY3NfdG9famlmZmllcyhLRUVQX0FMSVZFX0RFTEFZX1NFQ1MpKTsKCQlyZXR1cm4gMDsK
CWNhc2UgUFdNX01PREVfQVVUTzoKCQlpZiAoaHBfd21pX2Zhbl9jb250cm9sX3N1cHBvcnRlZCgp
KSB7CgkJCXJldCA9IGhwX3dtaV9nZXRfZmFuX2NvdW50X3VzZXJkZWZpbmVfdHJpZ2dlcigpOwoJ
CQlpZiAocmV0IDwgMCkKCQkJCXJldHVybiByZXQ7CgkJCXJldCA9IGhwX3dtaV9mYW5fc3BlZWRf
bWF4X3Jlc2V0KHByaXYpOwoJCX0gZWxzZSB7CgkJCXJldCA9IGhwX3dtaV9mYW5fc3BlZWRfbWF4
X3NldCgwKTsKCQl9CgkJaWYgKHJldCA8IDApCgkJCXJldHVybiByZXQ7CgkJY2FuY2VsX2RlbGF5
ZWRfd29yaygmcHJpdi0+a2VlcF9hbGl2ZV9kd29yayk7CgkJcmV0dXJuIDA7CglkZWZhdWx0OgoJ
CS8qIHNob3VsZG4ndCBoYXBwZW4gKi8KCQlyZXR1cm4gLUVJTlZBTDsKCX0KfQoKc3RhdGljIHVt
b2RlX3QgaHBfd21pX2h3bW9uX2lzX3Zpc2libGUoY29uc3Qgdm9pZCAqZGF0YSwKCQkJCSAgICAg
ICBlbnVtIGh3bW9uX3NlbnNvcl90eXBlcyB0eXBlLAoJCQkJICAgICAgIHUzMiBhdHRyLCBpbnQg
Y2hhbm5lbCkKewoJc3dpdGNoICh0eXBlKSB7CgljYXNlIGh3bW9uX3B3bToKCQlpZiAoYXR0ciA9
PSBod21vbl9wd21faW5wdXQgJiYgIWhwX3dtaV9mYW5fY29udHJvbF9zdXBwb3J0ZWQoKSkKCQkJ
cmV0dXJuIDA7CgkJcmV0dXJuIDA2NDQ7CgljYXNlIGh3bW9uX2ZhbjoKCQlpZiAoaHBfd21pX2Zh
bl9jb250cm9sX3N1cHBvcnRlZCgpKSB7CgkJCWlmIChocF93bWlfZ2V0X2FjdGl2ZV9mYW5fc3Bl
ZWQoY2hhbm5lbCkgPj0gMCkKCQkJCXJldHVybiAwNDQ0OwoJCX0gZWxzZSB7CgkJCWlmIChocF93
bWlfZ2V0X2Zhbl9zcGVlZChjaGFubmVsKSA+PSAwKQoJCQkJcmV0dXJuIDA0NDQ7CgkJfQoJCWJy
ZWFrOwoJZGVmYXVsdDoKCQlyZXR1cm4gMDsKCX0KCglyZXR1cm4gMDsKfQoKc3RhdGljIGludCBo
cF93bWlfaHdtb25fcmVhZChzdHJ1Y3QgZGV2aWNlICpkZXYsIGVudW0gaHdtb25fc2Vuc29yX3R5
cGVzIHR5cGUsCgkJCSAgICAgdTMyIGF0dHIsIGludCBjaGFubmVsLCBsb25nICp2YWwpCnsKCXN0
cnVjdCBocF93bWlfaHdtb25fcHJpdiAqcHJpdjsKCWludCBycG0sIHJldDsKCXU4IG1vZGU7CgoJ
cHJpdiA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwoJc3dpdGNoICh0eXBlKSB7CgljYXNlIGh3bW9u
X2ZhbjoKCQlpZiAoaHBfd21pX2Zhbl9jb250cm9sX3N1cHBvcnRlZCgpKQoJCQlyZXQgPSBocF93
bWlfZ2V0X2FjdGl2ZV9mYW5fc3BlZWQoY2hhbm5lbCk7CgkJZWxzZQoJCQlyZXQgPSBocF93bWlf
Z2V0X2Zhbl9zcGVlZChjaGFubmVsKTsKCQlpZiAocmV0IDwgMCkKCQkJcmV0dXJuIHJldDsKCQkq
dmFsID0gcmV0OwoJCXJldHVybiAwOwoJY2FzZSBod21vbl9wd206CgkJaWYgKGF0dHIgPT0gaHdt
b25fcHdtX2lucHV0KSB7CgkJCWlmICghaHBfd21pX2Zhbl9jb250cm9sX3N1cHBvcnRlZCgpKQoJ
CQkJcmV0dXJuIC1FT1BOT1RTVVBQOwoKCQkJcnBtID0gaHBfd21pX2dldF9hY3RpdmVfZmFuX3Nw
ZWVkKGNoYW5uZWwpOwoJCQlpZiAocnBtIDwgMCkKCQkJCXJldHVybiBycG07CgkJCSp2YWwgPSBy
cG1fdG9fcHdtKHJwbSAvIDEwMCwgcHJpdik7CgkJCXJldHVybiAwOwoJCX0KCQlzY29wZWRfZ3Vh
cmQobXV0ZXgsICZwcml2LT5sb2NrKQoJCQltb2RlID0gcHJpdi0+bW9kZTsKCQlzd2l0Y2ggKG1v
ZGUpIHsKCQljYXNlIFBXTV9NT0RFX01BWDoKCQljYXNlIFBXTV9NT0RFX01BTlVBTDoKCQljYXNl
IFBXTV9NT0RFX0FVVE86CgkJCSp2YWwgPSBtb2RlOwoJCQlyZXR1cm4gMDsKCQlkZWZhdWx0OgoJ
CQkvKiBzaG91bGRuJ3QgaGFwcGVuICovCgkJCXJldHVybiAtRU5PREFUQTsKCQl9CglkZWZhdWx0
OgoJCXJldHVybiAtRUlOVkFMOwoJfQp9CgpzdGF0aWMgaW50IGhwX3dtaV9od21vbl93cml0ZShz
dHJ1Y3QgZGV2aWNlICpkZXYsIGVudW0gaHdtb25fc2Vuc29yX3R5cGVzIHR5cGUsCgkJCSAgICAg
IHUzMiBhdHRyLCBpbnQgY2hhbm5lbCwgbG9uZyB2YWwpCnsKCXN0cnVjdCBocF93bWlfaHdtb25f
cHJpdiAqcHJpdjsKCWludCBjcHVfcnBtLCBncHVfcnBtOwoKCXByaXYgPSBkZXZfZ2V0X2RydmRh
dGEoZGV2KTsKCWd1YXJkKG11dGV4KSgmcHJpdi0+bG9jayk7Cglzd2l0Y2ggKHR5cGUpIHsKCWNh
c2UgaHdtb25fcHdtOgoJCWlmIChhdHRyID09IGh3bW9uX3B3bV9pbnB1dCkgewoJCQlpbnQgcnBt
OwoJCQlpZiAoIWhwX3dtaV9mYW5fY29udHJvbF9zdXBwb3J0ZWQoKSkKCQkJCXJldHVybiAtRU9Q
Tk9UU1VQUDsKCQkJLyogUFdNIGlucHV0IGlzIGludmFsaWQgd2hlbiBub3QgaW4gbWFudWFsIG1v
ZGUgKi8KCQkJaWYgKHByaXYtPm1vZGUgIT0gUFdNX01PREVfTUFOVUFMKQoJCQkJcmV0dXJuIC1F
SU5WQUw7CgoJCQkvKiBlbnN1cmUgUFdNIGlucHV0IGlzIHdpdGhpbiB2YWxpZCBmYW4gc3BlZWRz
ICovCgkJCXJwbSA9IHB3bV90b19ycG0odmFsLCBwcml2KTsKCQkJcnBtID0gY2xhbXBfdmFsKHJw
bSwgcHJpdi0+bWluX3JwbSwgcHJpdi0+bWF4X3JwbSk7CgkJCWlmIChjaGFubmVsID09IENQVV9G
QU4pCgkJCQlwcml2LT5jcHVfcHdtID0gcnBtX3RvX3B3bShycG0sIHByaXYpOwoJCQllbHNlIGlm
IChjaGFubmVsID09IEdQVV9GQU4pCgkJCQlwcml2LT5ncHVfcHdtID0gcnBtX3RvX3B3bShycG0s
IHByaXYpOwoJCQlyZXR1cm4gaHBfd21pX2FwcGx5X2Zhbl9zZXR0aW5ncyhwcml2KTsKCQl9CgkJ
c3dpdGNoICh2YWwpIHsKCQljYXNlIFBXTV9NT0RFX01BWDoKCQkJcHJpdi0+bW9kZSA9IFBXTV9N
T0RFX01BWDsKCQkJcmV0dXJuIGhwX3dtaV9hcHBseV9mYW5fc2V0dGluZ3MocHJpdik7CgkJY2Fz
ZSBQV01fTU9ERV9NQU5VQUw6CgkJCWlmICghaHBfd21pX2Zhbl9jb250cm9sX3N1cHBvcnRlZCgp
KQoJCQkJcmV0dXJuIC1FT1BOT1RTVVBQOwoJCQkvKgoJCQkgKiBXaGVuIHN3aXRjaGluZyB0byBt
YW51YWwgbW9kZSwgc2V0IGZhbiBzcGVlZCB0bwoJCQkgKiBjdXJyZW50IFJQTSB2YWx1ZXMgdG8g
ZW5zdXJlIGEgc21vb3RoIHRyYW5zaXRpb24uCgkJCSAqLwoJCQljcHVfcnBtID0gaHBfd21pX2dl
dF9hY3RpdmVfZmFuX3NwZWVkKENQVV9GQU4pOwoJCQlpZiAoY3B1X3JwbSA8IDApCgkJCQlyZXR1
cm4gY3B1X3JwbTsKCQkJZ3B1X3JwbSA9IGhwX3dtaV9nZXRfYWN0aXZlX2Zhbl9zcGVlZChHUFVf
RkFOKTsKCQkJaWYgKGdwdV9ycG0gPCAwKQoJCQkJcmV0dXJuIGdwdV9ycG07CgkJCXByaXYtPmNw
dV9wd20gPSBycG1fdG9fcHdtKGNwdV9ycG0gLyAxMDAsIHByaXYpOwoJCQlwcml2LT5ncHVfcHdt
ID0gcnBtX3RvX3B3bShncHVfcnBtIC8gMTAwLCBwcml2KTsKCQkJcHJpdi0+bW9kZSA9IFBXTV9N
T0RFX01BTlVBTDsKCQkJcmV0dXJuIGhwX3dtaV9hcHBseV9mYW5fc2V0dGluZ3MocHJpdik7CgkJ
Y2FzZSBQV01fTU9ERV9BVVRPOgoJCQlwcml2LT5tb2RlID0gUFdNX01PREVfQVVUTzsKCQkJcmV0
dXJuIGhwX3dtaV9hcHBseV9mYW5fc2V0dGluZ3MocHJpdik7CgkJZGVmYXVsdDoKCQkJcmV0dXJu
IC1FSU5WQUw7CgkJfQoJZGVmYXVsdDoKCQlyZXR1cm4gLUVPUE5PVFNVUFA7Cgl9Cn0KCnN0YXRp
YyBjb25zdCBzdHJ1Y3QgaHdtb25fY2hhbm5lbF9pbmZvICogY29uc3QgaW5mb1tdID0gewoJSFdN
T05fQ0hBTk5FTF9JTkZPKGZhbiwgSFdNT05fRl9JTlBVVCwgSFdNT05fRl9JTlBVVCksCglIV01P
Tl9DSEFOTkVMX0lORk8ocHdtLCBIV01PTl9QV01fRU5BQkxFIHwgSFdNT05fUFdNX0lOUFVULCBI
V01PTl9QV01fSU5QVVQpLAoJTlVMTAp9OwoKc3RhdGljIGNvbnN0IHN0cnVjdCBod21vbl9vcHMg
b3BzID0gewoJLmlzX3Zpc2libGUgPSBocF93bWlfaHdtb25faXNfdmlzaWJsZSwKCS5yZWFkID0g
aHBfd21pX2h3bW9uX3JlYWQsCgkud3JpdGUgPSBocF93bWlfaHdtb25fd3JpdGUsCn07CgpzdGF0
aWMgY29uc3Qgc3RydWN0IGh3bW9uX2NoaXBfaW5mbyBjaGlwX2luZm8gPSB7Cgkub3BzID0gJm9w
cywKCS5pbmZvID0gaW5mbywKfTsKCnN0YXRpYyB2b2lkIGhwX3dtaV9od21vbl9rZWVwX2FsaXZl
X2hhbmRsZXIoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQp7CglzdHJ1Y3QgZGVsYXllZF93b3Jr
ICpkd29yazsKCXN0cnVjdCBocF93bWlfaHdtb25fcHJpdiAqcHJpdjsKCWludCByZXQ7CgoJZHdv
cmsgPSB0b19kZWxheWVkX3dvcmsod29yayk7Cglwcml2ID0gY29udGFpbmVyX29mKGR3b3JrLCBz
dHJ1Y3QgaHBfd21pX2h3bW9uX3ByaXYsIGtlZXBfYWxpdmVfZHdvcmspOwoKCWd1YXJkKG11dGV4
KSgmcHJpdi0+bG9jayk7CgkvKgoJICogUmUtYXBwbHkgdGhlIGN1cnJlbnQgaHdtb24gY29udGV4
dCBzZXR0aW5ncy4KCSAqIE5PVEU6IGhwX3dtaV9hcHBseV9mYW5fc2V0dGluZ3Mgd2lsbCBoYW5k
bGUgdGhlIHJlLXNjaGVkdWxpbmcuCgkgKi8KCXJldCA9IGhwX3dtaV9hcHBseV9mYW5fc2V0dGlu
Z3MocHJpdik7CglpZiAocmV0KQoJCXByX3dhcm5fcmF0ZWxpbWl0ZWQoImtlZXAtYWxpdmUgZmFp
bGVkIHRvIHJlZnJlc2ggZmFuIHNldHRpbmdzOiAlZFxuIiwKCQkJCSAgICByZXQpOwp9CgpzdGF0
aWMgaW50IGhwX3dtaV9zZXR1cF9mYW5fc2V0dGluZ3Moc3RydWN0IGhwX3dtaV9od21vbl9wcml2
ICpwcml2KQp7Cgl1OCBmYW5fZGF0YVsxMjhdID0geyAwIH07CglzdHJ1Y3QgdmljdHVzX3NfZmFu
X3RhYmxlICpmYW5fdGFibGU7Cgl1OCBtaW5fcnBtLCBtYXhfcnBtOwoJdTggY3B1X3JwbSwgZ3B1
X3JwbSwgbm9pc2VfZGI7CglpbnQgaSwgbnVtX2VudHJpZXMsIHJldDsKCXNpemVfdCBoZWFkZXJf
c2l6ZSwgZW50cnlfc2l6ZTsKCgkvKiBEZWZhdWx0IGJlaGF2aW91ciBvbiBod21vbiBpbml0IGlz
IGF1dG9tYXRpYyBtb2RlICovCglwcml2LT5tb2RlID0gUFdNX01PREVfQVVUTzsKCgkvKiBCeXBh
c3MgZGV2aWNlcyB3aXRob3V0IGZhbiBjb250cm9sIHN1cHBvcnQuICovCglpZiAoIWhwX3dtaV9m
YW5fdGFibGVfc3VwcG9ydGVkKCkpCgkJcmV0dXJuIDA7CgoJcmV0ID0gaHBfd21pX3BlcmZvcm1f
cXVlcnkoSFBXTUlfVklDVFVTX1NfR0VUX0ZBTl9UQUJMRV9RVUVSWSwKCQkJCSAgIEhQV01JX0dN
LCAmZmFuX2RhdGEsIDQsIHNpemVvZihmYW5fZGF0YSkpOwoJaWYgKHJldCkKCQlyZXR1cm4gcmV0
OwoKCWZhbl90YWJsZSA9IChzdHJ1Y3QgdmljdHVzX3NfZmFuX3RhYmxlICopZmFuX2RhdGE7Cglp
ZiAoZmFuX3RhYmxlLT5oZWFkZXIubnVtX2ZhbnMgPT0gMCkKCQlyZXR1cm4gLUVJTlZBTDsKCglo
ZWFkZXJfc2l6ZSA9IHNpemVvZihzdHJ1Y3QgdmljdHVzX3NfZmFuX3RhYmxlX2hlYWRlcik7Cgll
bnRyeV9zaXplID0gc2l6ZW9mKHN0cnVjdCB2aWN0dXNfc19mYW5fdGFibGVfZW50cnkpOwoJbnVt
X2VudHJpZXMgPSAoc2l6ZW9mKGZhbl9kYXRhKSAtIGhlYWRlcl9zaXplKSAvIGVudHJ5X3NpemU7
CgltaW5fcnBtID0gVThfTUFYOwoJbWF4X3JwbSA9IDA7CgoJZm9yIChpID0gMCA7IGkgPCBudW1f
ZW50cmllcyA7IGkrKykgewoJCWNwdV9ycG0gPSBmYW5fdGFibGUtPmVudHJpZXNbaV0uY3B1X3Jw
bTsKCQlncHVfcnBtID0gZmFuX3RhYmxlLT5lbnRyaWVzW2ldLmdwdV9ycG07CgkJbm9pc2VfZGIg
PSBmYW5fdGFibGUtPmVudHJpZXNbaV0ubm9pc2VfZGI7CgoJCS8qCgkJICogT24gc29tZSBkZXZp
Y2VzLCB0aGUgZmFuIHRhYmxlIGlzIHRydW5jYXRlZCB3aXRoIGFuIGFsbC16ZXJvIHJvdywKCQkg
KiBoZW5jZSB3ZSBzdG9wIHBhcnNpbmcgaGVyZS4KCQkgKi8KCQlpZiAoY3B1X3JwbSA9PSAwICYm
IGdwdV9ycG0gPT0gMCAmJiBub2lzZV9kYiA9PSAwKQoJCQlicmVhazsKCgkJaWYgKGNwdV9ycG0g
PCBtaW5fcnBtKQoJCQltaW5fcnBtID0gY3B1X3JwbTsKCQlpZiAoY3B1X3JwbSA+IG1heF9ycG0p
CgkJCW1heF9ycG0gPSBjcHVfcnBtOwoJfQoKCWlmIChtaW5fcnBtID09IFU4X01BWCB8fCBtYXhf
cnBtID09IDApCgkJcmV0dXJuIC1FSU5WQUw7CgoJcHJpdi0+bWluX3JwbSA9IG1pbl9ycG07Cglw
cml2LT5tYXhfcnBtID0gbWF4X3JwbTsKCglyZXR1cm4gMDsKfQoKc3RhdGljIGludCBocF93bWlf
aHdtb25faW5pdCh2b2lkKQp7CglzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmaHBfd21pX3BsYXRmb3Jt
X2Rldi0+ZGV2OwoJc3RydWN0IGhwX3dtaV9od21vbl9wcml2ICpwcml2OwoJc3RydWN0IGRldmlj
ZSAqaHdtb247CglpbnQgcmV0OwoKCXByaXYgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKnBy
aXYpLCBHRlBfS0VSTkVMKTsKCWlmICghcHJpdikKCQlyZXR1cm4gLUVOT01FTTsKCglyZXQgPSBk
ZXZtX211dGV4X2luaXQoZGV2LCAmcHJpdi0+bG9jayk7CglpZiAocmV0KQoJCXJldHVybiByZXQ7
CgoJcmV0ID0gaHBfd21pX3NldHVwX2Zhbl9zZXR0aW5ncyhwcml2KTsKCWlmIChyZXQpCgkJcmV0
dXJuIHJldDsKCWh3bW9uID0gZGV2bV9od21vbl9kZXZpY2VfcmVnaXN0ZXJfd2l0aF9pbmZvKGRl
diwgImhwIiwgcHJpdiwKCQkJCQkJICAgICAmY2hpcF9pbmZvLCBOVUxMKTsKCglpZiAoSVNfRVJS
KGh3bW9uKSkgewoJCWRldl9lcnIoZGV2LCAiQ291bGQgbm90IHJlZ2lzdGVyIGhwIGh3bW9uIGRl
dmljZVxuIik7CgkJcmV0dXJuIFBUUl9FUlIoaHdtb24pOwoJfQoKCUlOSVRfREVMQVlFRF9XT1JL
KCZwcml2LT5rZWVwX2FsaXZlX2R3b3JrLCBocF93bWlfaHdtb25fa2VlcF9hbGl2ZV9oYW5kbGVy
KTsKCXBsYXRmb3JtX3NldF9kcnZkYXRhKGhwX3dtaV9wbGF0Zm9ybV9kZXYsIHByaXYpOwoJcmV0
ID0gaHBfd21pX2FwcGx5X2Zhbl9zZXR0aW5ncyhwcml2KTsKCWlmIChyZXQpCgkJZGV2X3dhcm4o
ZGV2LCAiRmFpbGVkIHRvIGFwcGx5IGluaXRpYWwgZmFuIHNldHRpbmdzOiAlZFxuIiwgcmV0KTsK
CglyZXR1cm4gMDsKfQoKc3RhdGljIHZvaWQgX19pbml0IHNldHVwX2FjdGl2ZV9ib2FyZF9wYXJh
bXModm9pZCkKewoJY29uc3Qgc3RydWN0IGRtaV9zeXN0ZW1faWQgKmlkOwoJY29uc3Qgc3RydWN0
IHRoZXJtYWxfcHJvZmlsZV9wYXJhbXMgKnBhcmFtczsKCglpZCA9IGRtaV9maXJzdF9tYXRjaCho
cF93bWlfZmVhdHVyZV9ib2FyZHMpOwoJaWYgKGlkKSB7CgkJYWN0aXZlX2JvYXJkX3BhcmFtcyA9
IGlkLT5kcml2ZXJfZGF0YTsKCQlwYXJhbXMgPSBocF93bWlfdGhlcm1hbF9wcm9maWxlKCk7CgkJ
aWYgKCFwYXJhbXMpCgkJCXJldHVybjsKCgkJLyoKCQkgKiBNYXJraW5nIHRoaXMgYm9vbGVhbiBp
cyByZXF1aXJlZCB0byBlbnN1cmUgdGhhdAoJCSAqIGlzX3ZpY3R1c19zX3RoZXJtYWxfcHJvZmls
ZSgpIGJlaGF2ZXMgbGlrZSBhIHZhbGlkCgkJICogd3JhcHBlci4KCQkgKi8KCQlpc192aWN0dXNf
c19ib2FyZCA9IHRydWU7CgkJaWYgKHBhcmFtcy0+ZWNfdHBfb2Zmc2V0ID09IEhQX0VDX09GRlNF
VF9VTktOT1dOKSB7CgkJCXByX3dhcm4oIlVua25vd24gRUMgbGF5b3V0IGZvciBib2FyZCAlcy4g
VGhlcm1hbCBwcm9maWxlIHJlYWRiYWNrIHdpbGwgYmUgZGlzYWJsZWQuIFBsZWFzZSByZXBvcnQg
dGhpcyB0byBwbGF0Zm9ybS1kcml2ZXIteDg2QHZnZXIua2VybmVsLm9yZ1xuIiwKCQkJCWRtaV9n
ZXRfc3lzdGVtX2luZm8oRE1JX0JPQVJEX05BTUUpKTsKCQl9Cgl9Cn0KCnN0YXRpYyBpbnQgX19p
bml0IGhwX3dtaV9pbml0KHZvaWQpCnsKCWludCBldmVudF9jYXBhYmxlID0gd21pX2hhc19ndWlk
KEhQV01JX0VWRU5UX0dVSUQpOwoJaW50IGJpb3NfY2FwYWJsZSA9IHdtaV9oYXNfZ3VpZChIUFdN
SV9CSU9TX0dVSUQpOwoJaW50IGVyciwgdG1wID0gMDsKCglpZiAoIWJpb3NfY2FwYWJsZSAmJiAh
ZXZlbnRfY2FwYWJsZSkKCQlyZXR1cm4gLUVOT0RFVjsKCglpZiAoaHBfd21pX3BlcmZvcm1fcXVl
cnkoSFBXTUlfSEFSRFdBUkVfUVVFUlksIEhQV01JX1JFQUQsICZ0bXAsCgkJCQkgc2l6ZW9mKHRt
cCksIHNpemVvZih0bXApKSA9PSBIUFdNSV9SRVRfSU5WQUxJRF9QQVJBTUVURVJTKQoJCXplcm9f
aW5zaXplX3N1cHBvcnQgPSB0cnVlOwoKCWlmIChldmVudF9jYXBhYmxlKSB7CgkJZXJyID0gaHBf
d21pX2lucHV0X3NldHVwKCk7CgkJaWYgKGVycikKCQkJcmV0dXJuIGVycjsKCX0KCglpZiAoYmlv
c19jYXBhYmxlKSB7CgkJaHBfd21pX3BsYXRmb3JtX2RldiA9CgkJCXBsYXRmb3JtX2RldmljZV9y
ZWdpc3Rlcl9zaW1wbGUoImhwLXdtaSIsIFBMQVRGT1JNX0RFVklEX05PTkUsIE5VTEwsIDApOwoJ
CWlmIChJU19FUlIoaHBfd21pX3BsYXRmb3JtX2RldikpIHsKCQkJZXJyID0gUFRSX0VSUihocF93
bWlfcGxhdGZvcm1fZGV2KTsKCQkJZ290byBlcnJfZGVzdHJveV9pbnB1dDsKCQl9CgoJCS8qCgkJ
ICogU2V0dXAgYWN0aXZlIGJvYXJkIGZlYXR1cmUgZGF0YSBiZWZvcmUgc3RhcnRpbmcgcGxhdGZv
cm0KCQkgKiBkcml2ZXIgcHJvYmUuCgkJICovCgkJc2V0dXBfYWN0aXZlX2JvYXJkX3BhcmFtcygp
OwoJCWVyciA9IHBsYXRmb3JtX2RyaXZlcl9wcm9iZSgmaHBfd21pX2RyaXZlciwgaHBfd21pX2Jp
b3Nfc2V0dXApOwoJCWlmIChlcnIpCgkJCWdvdG8gZXJyX3VucmVnaXN0ZXJfZGV2aWNlOwoJfQoK
CWlmIChpc19vbWVuX3RoZXJtYWxfcHJvZmlsZSgpIHx8IGlzX3ZpY3R1c190aGVybWFsX3Byb2Zp
bGUoKSkgewoJCWVyciA9IG9tZW5fcmVnaXN0ZXJfcG93ZXJzb3VyY2VfZXZlbnRfaGFuZGxlcigp
OwoJCWlmIChlcnIpCgkJCWdvdG8gZXJyX3VucmVnaXN0ZXJfZGV2aWNlOwoJfSBlbHNlIGlmIChp
c192aWN0dXNfc190aGVybWFsX3Byb2ZpbGUoKSkgewoJCWVyciA9IHZpY3R1c19zX3JlZ2lzdGVy
X3Bvd2Vyc291cmNlX2V2ZW50X2hhbmRsZXIoKTsKCQlpZiAoZXJyKQoJCQlnb3RvIGVycl91bnJl
Z2lzdGVyX2RldmljZTsKCX0KCglyZXR1cm4gMDsKCmVycl91bnJlZ2lzdGVyX2RldmljZToKCXBs
YXRmb3JtX2RldmljZV91bnJlZ2lzdGVyKGhwX3dtaV9wbGF0Zm9ybV9kZXYpOwplcnJfZGVzdHJv
eV9pbnB1dDoKCWlmIChldmVudF9jYXBhYmxlKQoJCWhwX3dtaV9pbnB1dF9kZXN0cm95KCk7CgoJ
cmV0dXJuIGVycjsKfQptb2R1bGVfaW5pdChocF93bWlfaW5pdCk7CgpzdGF0aWMgdm9pZCBfX2V4
aXQgaHBfd21pX2V4aXQodm9pZCkKewoJaWYgKGlzX29tZW5fdGhlcm1hbF9wcm9maWxlKCkgfHwg
aXNfdmljdHVzX3RoZXJtYWxfcHJvZmlsZSgpKQoJCW9tZW5fdW5yZWdpc3Rlcl9wb3dlcnNvdXJj
ZV9ldmVudF9oYW5kbGVyKCk7CgoJaWYgKGlzX3ZpY3R1c19zX3RoZXJtYWxfcHJvZmlsZSgpKQoJ
CXZpY3R1c19zX3VucmVnaXN0ZXJfcG93ZXJzb3VyY2VfZXZlbnRfaGFuZGxlcigpOwoKCWlmICh3
bWlfaGFzX2d1aWQoSFBXTUlfRVZFTlRfR1VJRCkpCgkJaHBfd21pX2lucHV0X2Rlc3Ryb3koKTsK
CglpZiAoY2FtZXJhX3NodXR0ZXJfaW5wdXRfZGV2KQoJCWlucHV0X3VucmVnaXN0ZXJfZGV2aWNl
KGNhbWVyYV9zaHV0dGVyX2lucHV0X2Rldik7CgoJaWYgKGhwX3dtaV9wbGF0Zm9ybV9kZXYpIHsK
CQlwbGF0Zm9ybV9kZXZpY2VfdW5yZWdpc3RlcihocF93bWlfcGxhdGZvcm1fZGV2KTsKCQlwbGF0
Zm9ybV9kcml2ZXJfdW5yZWdpc3RlcigmaHBfd21pX2RyaXZlcik7Cgl9Cn0KbW9kdWxlX2V4aXQo
aHBfd21pX2V4aXQpOwo=

--_006_ME2PR01MB4162E1B2C5D55315E48B33D9B7BC2ME2PR01MB4162ausp_
Content-Type: application/octet-stream; name="hp-wmi.c.grep"
Content-Description: hp-wmi.c.grep
Content-Disposition: attachment; filename="hp-wmi.c.grep"; size=1904;
	creation-date="Sun, 13 Sep 2026 12:09:47 GMT";
	modification-date="Sun, 13 Sep 2026 12:10:04 GMT"
Content-Transfer-Encoding: base64

NjI6CUhQX09NRU5fRUNfVEhFUk1BTF9QUk9GSUxFX09GRlNFVAkJPSAweDk1LAo2NTojZGVmaW5l
IEhQX0ZBTl9TUEVFRF9BVVRPTUFUSUMJIDB4MDAKMTM5OgkuZWNfdHBfb2Zmc2V0CT0gSFBfT01F
Tl9FQ19USEVSTUFMX1BST0ZJTEVfT0ZGU0VULAozMTE6CQkubWF0Y2hlcyA9IHsgRE1JX01BVENI
KERNSV9CT0FSRF9OQU1FLCAiOEM3NyIpIH0sCjU3MzoJUFdNX01PREVfTUFYCQk9IDAsCjU3NDoJ
UFdNX01PREVfTUFOVUFMCQk9IDEsCjU3NToJUFdNX01PREVfQVVUTwkJPSAyLAo2MDg6I2RlZmlu
ZSBLRUVQX0FMSVZFX0RFTEFZX1NFQ1MgICAgIDkwCjg5MDoJaW50IHJldCA9IGVjX3JlYWQoSFBf
T01FTl9FQ19USEVSTUFMX1BST0ZJTEVfT0ZGU0VULCAmZGF0YSk7CjkxMTpzdGF0aWMgaW50IGhw
X3dtaV9mYW5fc3BlZWRfc2V0KHN0cnVjdCBocF93bWlfaHdtb25fcHJpdiAqcHJpdikKOTE2Oglp
ZiAocHJpdi0+Y3B1X3B3bSA9PSBIUF9GQU5fU1BFRURfQVVUT01BVElDKQo5MTc6CQlmYW5fc3Bl
ZWRbQ1BVX0ZBTl0gPSBIUF9GQU5fU1BFRURfQVVUT01BVElDOwo5MjE6CWlmIChwcml2LT5ncHVf
cHdtID09IEhQX0ZBTl9TUEVFRF9BVVRPTUFUSUMpCjkyMjoJCWZhbl9zcGVlZFtHUFVfRkFOXSA9
IEhQX0ZBTl9TUEVFRF9BVVRPTUFUSUM7Cjk0MToJcHJpdi0+Y3B1X3B3bSA9IEhQX0ZBTl9TUEVF
RF9BVVRPTUFUSUM7Cjk0MjoJcHJpdi0+Z3B1X3B3bSA9IEhQX0ZBTl9TUEVFRF9BVVRPTUFUSUM7
Cjk0MzoJcmV0dXJuIGhwX3dtaV9mYW5fc3BlZWRfc2V0KHByaXYpOwo5NDY6c3RhdGljIGludCBo
cF93bWlfZmFuX3NwZWVkX21heF9yZXNldChzdHJ1Y3QgaHBfd21pX2h3bW9uX3ByaXYgKnByaXYp
CjI2Mzc6c3RhdGljIGludCBocF93bWlfYXBwbHlfZmFuX3NldHRpbmdzKHN0cnVjdCBocF93bWlf
aHdtb25fcHJpdiAqcHJpdikKMjY0MjoJY2FzZSBQV01fTU9ERV9NQVg6CjI2NTI6CQkJCSBzZWNz
X3RvX2ppZmZpZXMoS0VFUF9BTElWRV9ERUxBWV9TRUNTKSk7CjI2NTQ6CWNhc2UgUFdNX01PREVf
TUFOVUFMOgoyNjU3OgkJcmV0ID0gaHBfd21pX2Zhbl9zcGVlZF9zZXQocHJpdik7CjI2NjE6CQkJ
CSBzZWNzX3RvX2ppZmZpZXMoS0VFUF9BTElWRV9ERUxBWV9TRUNTKSk7CjI2NjM6CWNhc2UgUFdN
X01PREVfQVVUTzoKMjY2ODoJCQlyZXQgPSBocF93bWlfZmFuX3NwZWVkX21heF9yZXNldChwcml2
KTsKMjczOToJCWNhc2UgUFdNX01PREVfTUFYOgoyNzQwOgkJY2FzZSBQV01fTU9ERV9NQU5VQUw6
CjI3NDE6CQljYXNlIFBXTV9NT0RFX0FVVE86CjI3Njg6CQkJaWYgKHByaXYtPm1vZGUgIT0gUFdN
X01PREVfTUFOVUFMKQoyNzc4OgkJCXJldHVybiBocF93bWlfYXBwbHlfZmFuX3NldHRpbmdzKHBy
aXYpOwoyNzgxOgkJY2FzZSBQV01fTU9ERV9NQVg6CjI3ODI6CQkJcHJpdi0+bW9kZSA9IFBXTV9N
T0RFX01BWDsKMjc4MzoJCQlyZXR1cm4gaHBfd21pX2FwcGx5X2Zhbl9zZXR0aW5ncyhwcml2KTsK
Mjc4NDoJCWNhc2UgUFdNX01PREVfTUFOVUFMOgoyNzk5OgkJCXByaXYtPm1vZGUgPSBQV01fTU9E
RV9NQU5VQUw7CjI4MDA6CQkJcmV0dXJuIGhwX3dtaV9hcHBseV9mYW5fc2V0dGluZ3MocHJpdik7
CjI4MDE6CQljYXNlIFBXTV9NT0RFX0FVVE86CjI4MDI6CQkJcHJpdi0+bW9kZSA9IFBXTV9NT0RF
X0FVVE87CjI4MDM6CQkJcmV0dXJuIGhwX3dtaV9hcHBseV9mYW5fc2V0dGluZ3MocHJpdik7CjI4
NDE6CSAqIE5PVEU6IGhwX3dtaV9hcHBseV9mYW5fc2V0dGluZ3Mgd2lsbCBoYW5kbGUgdGhlIHJl
LXNjaGVkdWxpbmcuCjI4NDM6CXJldCA9IGhwX3dtaV9hcHBseV9mYW5fc2V0dGluZ3MocHJpdik7
CjI4NTk6CXByaXYtPm1vZGUgPSBQV01fTU9ERV9BVVRPOwoyOTM1OglyZXQgPSBocF93bWlfYXBw
bHlfZmFuX3NldHRpbmdzKHByaXYpOwo=

--_006_ME2PR01MB4162E1B2C5D55315E48B33D9B7BC2ME2PR01MB4162ausp_--
