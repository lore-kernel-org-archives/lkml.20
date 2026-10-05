Received: from WA2P291CU004.outbound.protection.outlook.com (mail-polandcentralazolkn19012049.outbound.protection.outlook.com [52.103.53.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F662E1EFC
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 16:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.53.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791217941; cv=fail; b=V9yghCdpNHYw2NnUvkfkykcjblYhb/rWL3mOqE2R3rvcziAe5A2A1XaFqn18wWdp1HkQpw9OCIJBqBHIrG0VR6ztVzxoGUIE/FGJq56bMB085zHXVKz4qYytorM2dYnRxh3b5+c9T+cHODlm+L2aRplHM0td+JiUKT8AavtXHak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791217941; c=relaxed/simple;
	bh=3YQ6u4XqszYCBadqlYurwxddbJFFusPZzP9p5YtC5q8=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=AZFM7WqEdsXtJXEGqLfhuIM61jfv4W7ClB0IL3+kQScyQCfud0oW4/Xm1VCdl8g9YveJUN2GWN4cZaCWKGsCLM+ndaLLlvMzxsLUA6OVZiICKqdhJtMEUPHpxrQRa3Qs2pT2hjH0R6758YkcEbQAhZ+zUKvfu4CSwkFkVtTtqGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=GyT3ebv0; arc=fail smtp.client-ip=52.103.53.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="GyT3ebv0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r8BEuj8YYlGP+lOUuh+O21C+pq62lYWgI2LHhBgpw5XAZGro+ZWCLMsEla8xqFksrWrLalRUn8iR/DwpZPRLHMoZ4aLHgd1J3KSULS+qsoW/mkRuXHWGOVr3zLYoJ8YbiilnjWAKHlp8OIik4ZIrP4sJ+5oAv1DvFQuD/Wtbc1lUeqqlrnc6+lHlW/J7D4yFyN5kAFDFdN1PbVn5vBIb+CSYN9/s1Gl7LLLc00Sv11ZLuUuMGeztZklyH9g0tKxxB9yYx9fXmr7btmNRY9Wf0kfUUU/bzcrp5SeHeeHj4gro0Rs5BA7UVjdjeXGTdOLUTcszUR93I4nrFALFgthECg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3YQ6u4XqszYCBadqlYurwxddbJFFusPZzP9p5YtC5q8=;
 b=W8o9DnRjTgWPdlWbFtAOJ8DIjslPrW4vkBd+Nk/IQAxQpbrchBD+z7Lu7DmsNoGDpncbvsNaVHdAyW2eFFY1bIP5QQLbtpPgYdwp7aUSvvUHy5TuY9eYonLtGDzWOHUNOBSIfCp6qLXLM0+uVoRVFcRUE5uAktGOBQnE2pobZnl0JoawE6MA3lcly7sLXaVdUt71Z47JPEHqo8gBibPkIrotKRXUGmTnOyu0qewRpC3bYc4NqX+j8FofSK5xMkwU5J7FBmt59inm1HGzUYtj5DS48Y1upWhYFx48w/U7DlUsnkjPQ2hHVQOhBJjM92laznmUzA6wlTewIf2GvivvLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3YQ6u4XqszYCBadqlYurwxddbJFFusPZzP9p5YtC5q8=;
 b=GyT3ebv0WqPA3HM1/ZjfI94dfeWLfQoThALY+g/HQXW/PrAciBVswLpjVzBHKZPWXakdkQVT+p8m+TD2uAuTvexz1bfMX3y5Vj2/9pKJkOvYJdoDvAnzQVcibY/5mFF1zs6XOCBSMFqfjNBYdsENjMjlvGa7GdisgfhRM5ofmokQN2c5LGyV1EtE2Rg1orNJHqu9OTgr69f7Sb3zWbqqC1ErcwDrvGo62PPkjOWQl0ZgqImCz0drFeX68dwVZe2omMpU9ivWfmz7g0gF7hOVY0jWXWUz6sNOlZyCO8iNG7CsmBw0HmfhrJmOFv9l2ch60Vv0LlXduq5f3VAMoUpbNA==
Received: from WA2P291MB0187.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:26::11)
 by WA0P291MB101427.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:43::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 16:32:17 +0000
Received: from WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
 ([fe80::996b:1617:ce96:404]) by WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
 ([fe80::996b:1617:ce96:404%6]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 16:32:17 +0000
From: =?utf-8?B?SGFiaWwgRXJlbiBUw7xya2Vy?= <habilerenturker@hotmail.com>
To: "tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com"
	<mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org"
	<x86@kernel.org>
CC: "hpa@zytor.com" <hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?utf-8?B?SGFiaWwgRXJlbiBUw7xya2Vy?=
	<habilerenturker@hotmail.com>
Subject: [PATCH v2 0/2] x86/apic: Replace deprecated simple_strtol() with
 sscanf() for robust parsing
Thread-Topic: [PATCH v2 0/2] x86/apic: Replace deprecated simple_strtol() with
 sscanf() for robust parsing
Thread-Index: AQHdVOcVGINfR9Bg/06nzNddFWhPQg==
Date: Mon, 5 Oct 2026 16:32:17 +0000
Message-ID: <20261005163213.6515-1-habilerenturker@hotmail.com>
Accept-Language: tr-TR, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: WA2P291MB0187:EE_|WA0P291MB101427:EE_
x-ms-office365-filtering-correlation-id: 1623a2b9-14dc-490f-69c9-08df22fe3862
x-microsoft-antispam:
 BCL:0;ARA:14566002|55001999006|8060799015|19110799012|8062599012|31061999003|24021099003|38102599003|15080799012|25010399006|51005399006|40105399003|2607281247196008|102099032|3412199025|440099028|1710799026;
x-microsoft-antispam-message-info:
 =?utf-8?B?U0Y3QlZZenVSQzBqRXltakM2dnB1QS9BTmVaRnVjaHJibUFZVSt3MmdaRDVw?=
 =?utf-8?B?TzBWNG96SUk3bml1WWFiV0UraHB0a3ZiQUtkV0pYYUpHSW1FQ1ZnZmNZbk1O?=
 =?utf-8?B?Ym1nVnBsTHhGSldjUzBUZytqQVlCV3lTSzNFeG1ZeVB2YTBDUTN3ek5PZ3Nj?=
 =?utf-8?B?blFNWUhFZnJpaGZmOG1XdGplYzZDNGVxUytyc3pQZmJjODdHMnZGa1doUW0w?=
 =?utf-8?B?SGc2UEt6aVdUQkZhOENTTENzT2tnWElUeDZ1QmwySVMxLzFkd3NlclJ0VnhL?=
 =?utf-8?B?SXhrODRMOGVqaVVMc2xzbGFXTlBvVlpxUi9aa2pTa042QTNzRlprd292U3Rs?=
 =?utf-8?B?VjV1RXB2WlFaVklVWjl3WXFpajRZSnFOMVRBZDBUMndkZDcvTGxNSGl6MEJx?=
 =?utf-8?B?WjBzZGFFT0I4dzRkdUZSUmkySHZuMGd3TzBRVVZoT2dTbTdXNlRRY2F2YVRJ?=
 =?utf-8?B?bDRxa204TGxUVWNSelpTTGRBZm1ibXhXbTBXdUhCcGRlYmFwTUVmR1ZPbmdP?=
 =?utf-8?B?bkZkRVVUMk1tbXJBYnhraTVyYTc1Y29ZRlB3bFNSZk8xZHFaUHQ5S2VWV0hF?=
 =?utf-8?B?aVEySUV6am1xdXRXTXNXbkFzT0toL20vN2VWME9BWG9hdExTdTRuVkxYeENs?=
 =?utf-8?B?NVNqREZ1c25oenN3MmdvVXdBa2UvSVJVSDNBZkxTaG85VVF2OTRoSkxncE83?=
 =?utf-8?B?YmRUSUtQYy9TemZ5RVhwck5sM2poMkt5MDkxajJDZkJDaTEzeXpDR1dCOGtY?=
 =?utf-8?B?cFgxby90TGdPK1h1eHBETEUwN3dyZWY5dDdwcmlmakgyaWhkVksxSTZjM0JT?=
 =?utf-8?B?enNFajFkeXZLdXZkaWVlWHVudDRINHdyZmRiWkN2aUhyS01NaHduaEF2ajZy?=
 =?utf-8?B?aXZHRTlJK2hsTDZRaWFYakdWSE1ZRnR6T3FpdThlSURKVzl0ZmxTSjdGckh6?=
 =?utf-8?B?NGFMS2xzNUVYVkI2TGhRWjQwTUlZbmdrQ1ZCak1vREZwdmZEZG1vc2RCYVp1?=
 =?utf-8?B?ZGFRSWFqNTRoc1Z6eUk3bjB4Vml4OXVyaTl6Q1dkZ2lSc2k5QlNiTjNVUWRa?=
 =?utf-8?B?TklnTXI1cnpSZG00UzA5MFJrWnNUS3NjaXFQc1JRWWRzT1BkT3JrMmREeDhq?=
 =?utf-8?B?QzZHWlE3NVpISCtMcXlBVnBMR2NqRHM2V1hNS0pXd3h2cm5VckhTS1hrb0xG?=
 =?utf-8?B?b25kRnlQSlN5bmlQSEdVdW8ydmExZE5mUXd1VWNCSHdmSXludHpQM2hubHBj?=
 =?utf-8?B?VUhEbk9vQ1FVRG9oNmlIOHk4eVNJOEVTQlFwZ05MMyt5d1hLUVNBVy9hL1RF?=
 =?utf-8?B?TXYraW1TM3NQc3ZYc3RmVUVacGxOOGUrdXlVSURYcXgzOUlJK3BXMng4U05x?=
 =?utf-8?Q?py+JSV6WBcdfQYctJzmCpwxsm75M6R8o=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RU94QTVyYlE2azdISUs0U25uZW41Q2orSVB2WFFmSjkrRDN2Z3pIUkJWeGZO?=
 =?utf-8?B?NllwOWlmREIzbjF0cTYySWZSMWJQdTFiSnQzdWRnWnBHR3g2SDUvR2dQQnBh?=
 =?utf-8?B?U2IrY25qaHpmM2JYcEYzQmRSNWw0TndFdHc3VlBjY1ByMHM0c1lSVGVsQ3VK?=
 =?utf-8?B?Unpuc1RreW9JenI0UFE4YkNNMnFoUDBacnIzS0JOZ3NlRzN1Z1JGRmZhV0Z4?=
 =?utf-8?B?UzlTOGdpelBSVUFNamNpWWpjaFg3dFNkc29PV041VVhuNlIrMjExNnhsL1hW?=
 =?utf-8?B?SENiRDZjbmI5NFY3Nk1qZ2pUT2dXM2ZJeTNCdG9kUHVDNUZIRW8xMGg4L2Zo?=
 =?utf-8?B?djVYbUd2YThmYnVVbXdIeEdET2RDOUJnc01RWjBMRGYzMUVTZXluNjk3dmNO?=
 =?utf-8?B?UTRuZ241MkVFamQ0SWFiOG5WSVRieURFQkFXNGpBcHZZTjBMNng3ZmRndE1n?=
 =?utf-8?B?MVNBdlNRNUhNcEYzSmJydDlacjExSzhoYlJGM0hQYXcxRXM4MG1YSHZZa0tJ?=
 =?utf-8?B?RGNqSXlDYlZwUUVaaFlOZm1aZUwvbnNjU2poK2NBdGVtREp3dmF1Ry9TQjB1?=
 =?utf-8?B?SU5VeDg3QUNCNUdqRnVNQ1Q4SHJRdnhKNmZkUVI2bDBYdG1XWUFoRXNMSEQr?=
 =?utf-8?B?UFE0dTRpSTAvOEMzbWFiQVI3UndOZTJRRG50NkpzalhKaVVMaFJkb3ZFN1Yr?=
 =?utf-8?B?aUxSd3JWVVlJeDBWbURGSzk1R3JXbEJJTW1lOW1ITytTM3B1aWNveE40Wkdo?=
 =?utf-8?B?REVTS3hMV2I3UEp4WXF4TW8vMUFBTlhtbFpvN2l5d0RpTGVzajdlNTNrVVRI?=
 =?utf-8?B?cFdkV1NkdHYvUFZKTHZ3UHdwVC9WT2lJdlIzVXY2RVNHVEpaTUpDalJjMmNS?=
 =?utf-8?B?MWNSTzdySDlQZnBMUHl4NytYaXlNZ1FGUi9BVHdmWUxNWkk3TWY0amZZd0Z2?=
 =?utf-8?B?clB1QXIwTktvb3hqY3p1dCtTYnlGVlAxL255dTVuTGNDcmYwZXZZb2RmQzNm?=
 =?utf-8?B?SmszNmhSMmovWDZ6MTRienV2R0J2NGp6eTVwUzBPVHR6UzhGdk9GbE1oVTlz?=
 =?utf-8?B?MjVDL2ZPNldOUU13T2ZZLzRvTFd3T0Yxd0hjZ0ZMbVljWFRnb0Rvek9kWU4v?=
 =?utf-8?B?VWp0R1ZQSnFDOWlabUxZSU9PeGJuVTVrQWJxdXNZYktERW16R2lhMk1lSSth?=
 =?utf-8?B?VE1FeURFN3VqcktSNFYwTzdxV3RaTjhJb2FQY0p2MzZ3V3U5OENMaHZ3M1hp?=
 =?utf-8?B?T2NuZEdjcDN0ditaVGtIb3FpcDgxVTUxRUZSSCs5OGEzZzcrRHdITWJxQUpz?=
 =?utf-8?B?M2hPa2w0dS82T0VXL3RKZ3ZQTVRJbnRqYmtDNDNPV0pSR05odzVzOVQvQVJS?=
 =?utf-8?B?aVJJUGNDcTZtS0MyUEdhaWZlYkhGZ1lKaTBpT1RyZzI3WTZtWnVrV0FRaDFa?=
 =?utf-8?B?c0x5WVVyeFFZYnozMWlSVDI1QnNTSzdSWFRLMHhxMU1lWDVtalBvTktGK3VS?=
 =?utf-8?B?UlYyYkpHenhkT3ZVYVhHNG5UMGRQL0VkZjFtL1FFLzVxZ0ZQQlhWWGpuNFVP?=
 =?utf-8?B?eG5aYkREaDE3MGtIc3EvU1B6N0E2eVR4aXlHclFTd1NsM1JoQWV2bjFYNkNC?=
 =?utf-8?B?b2RJNWtSa3pkUjZ2eCt3S3RjRVg3Wm9aMHJHMFBJblp5MEJLbE1DclhXZGNi?=
 =?utf-8?B?NG5LN2VJc3ZXQitWSnNtSlRRaUVSekdMUjFWYVVKcDlWNGdXZ2Y2dUx5NmVC?=
 =?utf-8?B?ZCtMV2xvY1V5ZnFTajhVbGI5ZDJUWGVja2RzdFRaODlGNjZtR09Ja3NocG5w?=
 =?utf-8?B?UXpHVjV3Nm5hZUY3cFU5Y29DZDBBeGthK2ZFNnVyOFZ2VHJ3eE1nTFRSZ0FI?=
 =?utf-8?Q?5w//umOPx63H6?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8EA88EEF5EC8B3418C8A4ACA561BA65D@POLP291.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-2112e.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 1623a2b9-14dc-490f-69c9-08df22fe3862
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2026 16:32:17.2467
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA0P291MB101427

VGhpcyBwYXRjaCBzZXJpZXMgcmVwbGFjZXMgdGhlIGRlcHJlY2F0ZWQgc2ltcGxlX3N0cnRvbCgp
IGZ1bmN0aW9uCndpdGggdGhlIHNzY2FuZigpIGluIHRoZSB4ODYgQVBJQyBjb2RlIHRvIGVuc3Vy
ZSByb2J1c3QgcGFyc2luZy4KClRoZSBzaW1wbGVfc3RydG9sKCkgZnVuY3Rpb24gaXMgZGVwcmVj
YXRlZCBhcyBpdCBzaWxlbnRseSBpZ25vcmVzCm92ZXJmbG93cy4gUmVwbGFjaW5nIGl0IHdpdGgg
c3NjYW5mKCkgbWFpbnRhaW5zIHRoZSBvcmlnaW5hbCBmbGV4aWJsZQpwYXJzaW5nIGJlaGF2aW9y
IHdoaWxlIGVsaW1pbmF0aW5nIHRoZSBkZXByZWNhdGVkIGZ1bmN0aW9uIHVzYWdlLgoKQ2hhbmdl
cyBpbiB2MjoKLSBSZXBsYWNlZCB0aGUgaW5pdGlhbCBzdHJpY3Qga3N0cnRvdWludCgpIGltcGxl
bWVudGF0aW9uIHdpdGggc3NjYW5mKCkKICB0byBwcmV2ZW50IHJlZ3Jlc3Npb25zIG9uIHBsYXRm
b3JtcyB3aGVyZSBmd25vZGUgbmFtZXMgY29udGFpbiB0cmFpbGluZwogIGhhcmR3YXJlIGFkZHJl
c3Nlcy4KLSBDbGVhbmVkIHVwIHJlZHVuZGFudCBzdHJuY21wKCkgaW52b2NhdGlvbnMgc2luY2Ug
c3NjYW5mKCkgaGFuZGxlcyBmb3JtYXQKICBtYXRjaGluZy4KCkhhYmlsIEVyZW4gVMO8cmtlciAo
Mik6CiAgeDg2L2FwaWM6IFJlcGxhY2UgZGVwcmVjYXRlZCBzaW1wbGVfc3RydG9sKCkgd2l0aCBz
c2NhbmYoKSBmb3Igcm9idXN0CiAgICBwYXJzaW5nCiAgeDg2L2FwaWM6IFJlcGxhY2UgZGVwcmVj
YXRlZCBzaW1wbGVfc3RydG9sKCkgd2l0aCBzc2NhbmYoKSBpbgogICAgeDg2X2Z3c3BlY19pc19o
cGV0KCkKCiBhcmNoL3g4Ni9rZXJuZWwvYXBpYy92ZWN0b3IuYyB8IDMwICsrKysrKysrKysrKysr
KysrKysrKystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDggZGVs
ZXRpb25zKC0pCgotLSAKMi40Ny4zCgo=
