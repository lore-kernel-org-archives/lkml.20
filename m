Received: from WA2P291CU004.outbound.protection.outlook.com (mail-polandcentralazolkn19012053.outbound.protection.outlook.com [52.103.53.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B7C3BE172;
	Thu,  8 Oct 2026 11:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.53.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791457685; cv=fail; b=YOfWwAQTkd2rxEdeHkvDnNDheOv6K0wHQ/Ayx5gNjgq/8HLxEczhiUPxX8ONq9osFideIHssHKKI4rf7oXEOOGe/G3eu4jPHGDPCMVHEkKUqf6E8phYkQhGrDn+lppqDsAw6kXjPXYJzJf6ELyFre+OIV+Pvl5TreQSrKY1sO2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791457685; c=relaxed/simple;
	bh=eqa/daO5Q8WxPI3uFTJIbtB7dD4XmN+4kDPfw9oGMfE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=V2vEpN4F2lLTOM49DF+uUbsVNTTDWV1liO2oxpsyPyMqJw6snQ/c2NpxOa4FzB+eBiIr9a1TUj011X9iweJiAL90WvYolUPTWctuy4qEmibBbLMxV6+Hs9W8VNh+sr+BeyDvavyQSsTfCklaPf1eqXq3bPG3ZOoGjRhhOHvhfcI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=hvcounBa; arc=fail smtp.client-ip=52.103.53.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="hvcounBa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l1HFqu3SF38L3paWjPVGo9d6UMtfLiAjV1p72O5R9MBthCjBBrVxJ9d/Q7CARqlZ7Ibaqdpz8auH2KxRlvw11ayNnflHSNpkJBSmFVp8ZY/PD2zivdvuR2bNcbAUG1qtf4skO95NxMxUhwFrHGA0yop3x2Mbh04iOYWhsarCsP7Us5/JoN36AUq3DyfMHlo6behQNU+e0sTAYh6pzENMMRv/bM0X7Ry1JHHUjkZoOgcBPLRIEWhaFzkS1CKTiyAmUClHHuFszFMoabmBf2j+XmNq1hr9mnDFbXTrC/c5QeJn+UoXe/owwwr5AwYdB2IsetZX6FE4b+U5YU1U7osqCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eqa/daO5Q8WxPI3uFTJIbtB7dD4XmN+4kDPfw9oGMfE=;
 b=SJUqVQgcpPnVCcUnhDuDbysySZst5KTR0U4iiawNJuf0TQqmJ64oS2tCwiEsFqErfuPcBwryBN5yQKbQWqjXrX+r/tGNDlHtyJelXNoa+YXFn5/XDTSzmosE1rWkhAx8NCiTmtCpGXev5N6y8hx22nPvdf6yr2WAloC8RPfUHJf+DbBPfeLShz+31cphQa1VeLmu96KKQa4uwBcpCxOqCr80Th0WI0e+Fl9tkvj3/b1KXMkGM03EkFRb93hUBxcp+VnYzpqPx2G7BUHxwwqX43ljAy7dIfMZxZ4puvdX8TgQ5r0sXe/5S9LfWa1ITS2V4O852OEKeZjtrgvIJz9tbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eqa/daO5Q8WxPI3uFTJIbtB7dD4XmN+4kDPfw9oGMfE=;
 b=hvcounBaRCD7xABAggeeTZPWtQt/wYKhdVWfqUxZRz55gGn0SQRo8ebfJbyT4ZPL5Fq3qyTcz6Fju0JBSIafhKc328cQtoFI4BY4xHj70rfdXJveYnOcDwwdrccORHPvwceb0p/mXcXX+P8FvkcINbGuJxnZeYmPkmVQBSidtk7nVE0OaXDzeWydL7G19WEjEPXoO4UJeB460FUXlyM1LgFG9osphMvBguiqKZiBJ9ycstqBpT/d+kcf+RcwTniBPKL4SpX0XcEuhQU2dGTgH7dYZPXux42QkZOkGuiknelFJ4XpvOoQiR7r7JJr8gD+s2tYcQyWJnXw2WTZ5nxQyA==
Received: from WA2P291MB0187.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:26::11)
 by WA2P291MB0310.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:23::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 11:07:59 +0000
Received: from WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
 ([fe80::996b:1617:ce96:404]) by WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
 ([fe80::996b:1617:ce96:404%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 11:07:58 +0000
From: =?utf-8?B?SGFiaWwgRXJlbiBUw7xya2Vy?= <habilerenturker@hotmail.com>
To: "blum@kernel.org" <blum@kernel.org>
CC: "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "bp@alien8.de"
	<bp@alien8.de>, "corbet@lwn.net" <corbet@lwn.net>,
	"dapeng1.mi@linux.intel.com" <dapeng1.mi@linux.intel.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"ebiggers@kernel.org" <ebiggers@kernel.org>, "elver@google.com"
	<elver@google.com>, "enelsonmoore@gmail.com" <enelsonmoore@gmail.com>,
	"hpa@zytor.com" <hpa@zytor.com>, "jlayton@kernel.org" <jlayton@kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"luto@kernel.org" <luto@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
	"rdunlap@infradead.org" <rdunlap@infradead.org>, "rppt@kernel.org"
	<rppt@kernel.org>, "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
	"tglx@kernel.org" <tglx@kernel.org>, "x86@kernel.org" <x86@kernel.org>,
	=?utf-8?B?SGFiaWwgRXJlbiBUw7xya2Vy?= <habilerenturker@hotmail.com>
Subject: Re: [PATCH RESEND 0/3] x86/vdso: Improve vdso=/vdso32= boot parameter
 validation
Thread-Topic: [PATCH RESEND 0/3] x86/vdso: Improve vdso=/vdso32= boot
 parameter validation
Thread-Index: AQHdVxVG6pNss4+Y8k2nazEEVBDMtQ==
Date: Thu, 8 Oct 2026 11:07:58 +0000
Message-ID: <20261008110754.3468-1-habilerenturker@hotmail.com>
References: <20260831101657.2947-5-blum@kernel.org>
In-Reply-To: <20260831101657.2947-5-blum@kernel.org>
Accept-Language: tr-TR, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: WA2P291MB0187:EE_|WA2P291MB0310:EE_
x-ms-office365-filtering-correlation-id: eef5eb97-fc7c-4696-1dfc-08df252c6983
x-microsoft-antispam:
 BCL:0;ARA:14566002|19110799012|31061999003|15080799012|8060799015|8062599012|38102599003|24021099003|4140399003|25010399006|3412199025|440099028|102099032|40105399003|2607281247196008|52005399003|1710799026;
x-microsoft-antispam-message-info:
 =?utf-8?B?OGxDcWFCQVVFejJ5cXJIL1dod25NMkMwZGRWV2MrTWg1VTBMd3pWbVlab28w?=
 =?utf-8?B?QytYNU1xdk0yWXExemtITXg5RHkvMXRUVTRmYTBPMmpYZ29ZMlBtQUJUaWNo?=
 =?utf-8?B?ekRBKzg2dUkycFJzTElGT0o3TTlNcTZlc1RVUW03VzkvWGNRNU45VEtQYUhK?=
 =?utf-8?B?WERFNnVoSHFDOWdldElydXNYUGVTMXpTaDVUb25EUk1RWmZuSWF6Sm5lRFY4?=
 =?utf-8?B?SkRQblZ2SGlmN1dROG1ISW5LTjhOWlNjclhJaFdhY1NUOStJemFLWGxWbDB6?=
 =?utf-8?B?QlJnZGJEVGsyUXViSHBFUk5UalhqaDZ5cldVWmI2SWd2L0srb3E3TkNLcHhJ?=
 =?utf-8?B?M3p5eGxTV2wyVmQ0bWFmWEVSdFF1TzB0YmljbjhKbStoeWJ5VTZrOWJsMlVM?=
 =?utf-8?B?ekpXdzR5K0VrdFhUTUNiUldlclRpNFcxMGZ3clZES1ZodDVsTUF2Q0tWQnFy?=
 =?utf-8?B?MFliUUFrSXpVZjRaT3RqQkhmMFlYYlI0OVdMK2JNRWNOcHN0ZUd5d0NBVzFl?=
 =?utf-8?B?WXNqOFpPT0JVcXA1N2NqN3R1cm9ZT2FZT3BINWpDNW5MR3BMRXdtS05WWGJ4?=
 =?utf-8?B?b0JOdVhEK3J6RkxEdXNkSkJjTHVzVC9zejY5YmVML2dvamlzNjlNK1U5YTY0?=
 =?utf-8?B?L2p6SGVvT01kTXR5eUNHRnpaRHdlaU1WSzlSMFFxNk14aTkxRmZoUDArODlI?=
 =?utf-8?B?UE9WYmo3bVNlQWtWWGFLNUwzejFyK0JsTCttM1NUS3k4akhOMzZyWU1ZS2lN?=
 =?utf-8?B?TGthZ2F3M3hjZnBJZ0I1eE5VdVBxcWNmWjlET01CU24zNHlQdDAzcnpBLzJy?=
 =?utf-8?B?TGZRMVJPajh0ckhiM3pKY0R6MU5DeUkrSk5lQk9KWlJ2ZHppSGI0ZnRMV2Va?=
 =?utf-8?B?ZTFBYndKbjg2Z1ZuUDlKVXNDOE0vRjRGcmJVQXZJTW50aHFXMlFGeWZjL1VQ?=
 =?utf-8?B?VDBpL3BDWnNuQ1U5b1ltM1FtT1FtcW1hcVl1S2kvdTc1VG1mOEZzVUNENE9q?=
 =?utf-8?B?U0RjOE5WWkNnY09OREUzSkhmK3Y1NkcxTEhaQitkc3B3NTJZSFRLcytUWGpl?=
 =?utf-8?B?YjNZclo0c0xtR2hvWElVajQyU2dpL0xaNlNFaGFEckxsakJ0bzRlVlVCL29j?=
 =?utf-8?B?S0VkSi9VYjBqbHdqT2N2YnlqNkNLVVhWYzVKYU9kWkczVDBFVUN4TlZnOXZL?=
 =?utf-8?B?djRtQXlZWWxIbzhpNDZwNGYxVG9MU055Z3JubDZOM05qUjBJcERvbGQ5NUtF?=
 =?utf-8?B?VmZkQ0tvL3ZaVVhjN2pMb1M5dFpFTGg3VzYxZzh0cVhLMDNiVk15anB1djRC?=
 =?utf-8?Q?Mx2ufasVBIvlTWFUWi2iZSVudIEp+9sisW?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VTlVUnZ2bURuN0pLTHRHcEN3cmZmM3RnQ2lZdzZYR3MvS1hNRzRJK3haYjlT?=
 =?utf-8?B?ZjJBNm1vOUlqWXFMV09zQ09wT3EwNmg1UkdJUmxpRHhhaHdNdm56bnZlRGsr?=
 =?utf-8?B?bU9MN2dsbEx3dktWR0h2ZEdCNmY4aTEvT3dDeHdPcmYvR2U4dmNzWVVQVzQ2?=
 =?utf-8?B?TjZwSk15OU9hME12Yll0aDRzTktTdEovSXY2SWwvVlphTGs3WXVYY0VzaWxI?=
 =?utf-8?B?TEttRktsUGpFNXVmM2hua2xpN2FiU2dEbERCWm1wWDZIM0VscVNGMXMvMWd3?=
 =?utf-8?B?UEU2L0FwKzkyaklPdEtKbkZkRFdXbmRLN3dsdDFWNHEvZ00wSXZZQUVKWHY5?=
 =?utf-8?B?ZDFXbHlWM2dLNXNwRVhHcGdIUjdwR1E3Y29Ma0ZQZzBFVDBrSjFXckh3RGJj?=
 =?utf-8?B?MjJySFFnYlgxV0tlYjdTem5YTFJVaytUM2VyamNjN0xqRmh6UVlYWGpBMG52?=
 =?utf-8?B?TEkraDNka29EVWxQVUo2RnFtR2FBUnZSanVLeWRVT1RrSG9TZHBkRnpYbndF?=
 =?utf-8?B?Q29lZFNiVzliOWlGcTNLMk85RDN5ejVpbWtxUUlMNERCSXlYcS8rU2RCbW83?=
 =?utf-8?B?Sk1rb3J6WE96Qmc0M0lpb3IrOUI0NXhTWGw5bG5qR2FUYW1pT3FEWVJ4cFBx?=
 =?utf-8?B?bXNVTGhZVFNVV1g2bUNvNjNlbG50RjhXSUNsY3JTdnY0aCtzalBHTkxTbEFj?=
 =?utf-8?B?dS85QlJLeDA2SStmOE0wdDdob3cxd3NyTFpEMEh1TzVZS21aSlNScDl1ZUx2?=
 =?utf-8?B?QU9IS21BM1ppV28xdWw5Z21rR0JRcHI4ZWtTak51L2c4cDBEUUdiUDdXNWFM?=
 =?utf-8?B?QnVqZjVqWmRuN3dvcmE2VVFac0c4UUJQN01kZ2ozT0ZSdmp4dzF5MWxxaVRp?=
 =?utf-8?B?d3dWMDF0bXpzSUYyS0l5WkRRZWFMNk1yWmFiSCtjUm0zLzlDalI2NGNYdlVW?=
 =?utf-8?B?TytSNFUzMG9EYVN5L1dpT3VHUUV3MWduckpOWm9CLzdDbkFJVWh3bmUxUEda?=
 =?utf-8?B?WVI1M1dXSWM3NHFzSDJZUitEdlNFaEwxNEM5b1VWbk1lT2RKa3U5QldRdWZ5?=
 =?utf-8?B?aUFNaGlWOXExZDFhMFhiWWZvWUlHd2doWk1KelFoeHk3bnRRQUcrOUZsdUVM?=
 =?utf-8?B?bys4YjZWVWJVaUVrdHowOXV5N0JDbllUUkVpWnoySUd5QlBpejVDTmQzd2ti?=
 =?utf-8?B?cnMyYTFkS2xUYi9Nc3pkMVJsbS9TenJ4UnNRbGxSSVliQVhkMS96WW91bEEv?=
 =?utf-8?B?MGp6R084aXM5WTN0T1gvYjU1Zlk5OWdxbjd6ZVVLMTZPTDh3c1F3UFFRWU1y?=
 =?utf-8?B?UE43Z2VMTDVCYUlZNytjL09iTmYvaUljeHVUbTdUOWdGUnlaeUJzWTh4aUxt?=
 =?utf-8?B?VkhFVVhNS3FNZlNkbzc2N2hSQVIrejRhNjBEQytkdHg5VkFIc2l2TU1rNXo4?=
 =?utf-8?B?NzVySStDRUZZRnZkeVBSUkdhNjZFc01PZDJSc05MT0VjdHpDV01mc3ZPeVFZ?=
 =?utf-8?B?ODdJMWJzSG51dVdvb1hmeFduZW1DSmdOcGwwdThyT2Z0TWdEbEkrbTFZZHhV?=
 =?utf-8?B?YloxbTFHRHl6UWY3N0g4SmRORWd1WGJDVVlmZUJDa0UrVTNzcDA2b0lKS1hV?=
 =?utf-8?B?bGRZdWJtL281ZFBnU1BiMnFiR2NnRGxmcmVDSUZYK0I5YkFMb2hNSTJ0ckJL?=
 =?utf-8?B?dHNqR2I3MjFmSnpMcnRNbXYya2RGbVNjL2g0M3h6TWF1VVNSd3JnZ3V2Rmd5?=
 =?utf-8?B?YUhydDA3L0hUdXI3eVZJcE1MSzhlWnZvblJXZ2dqVXVGMnhnaUoyKzB6a3pq?=
 =?utf-8?B?d09mbERmUVE5WS9mU3VzYzl1Um5QeWdTNEhGU1RqZkJHekNzTVRXUzZuNG1k?=
 =?utf-8?Q?2cicXVu48ihFs?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <375EC704454A9949A7D039356C9281DB@POLP291.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: eef5eb97-fc7c-4696-1dfc-08df252c6983
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2026 11:07:58.8420
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA2P291MB0310

T24gTW9uIEF1ZyAzMSAyMDI2IGF0IDEyOjE2OjU4UE0gKzAyMDAgVGhvcnN0ZW4gQmx1bSB3cm90
ZToKPiBSZXBsYWNlIHRoZSBkZXByZWNhdGVkIHNpbXBsZV9zdHJ0b3VsKCkgWzFdIHdpdGgga3N0
cnRvdWludCgpIHdoZW4KPiBwYXJzaW5nIHRoZSB2RFNPIGJvb3QgcGFyYW1ldGVycy4gVGhpcyBw
cm92aWRlcyBzdHJpY3QgaW5wdXQgdmFsaWRhdGlvbiwKPiByZWplY3RzIHBhcnRpYWwgaW5wdXQs
IGFuZCB3YXJucyB3aGVuIGRpc2FibGluZyB2RFNPIGZvciBpbnZhbGlkIHZhbHVlcy4KCj4gQWRq
dXN0IGJvdGggd2FybmluZ3MgZm9yIGNvbnNpc3RlbmN5IGFuZCB1cGRhdGUgdGhlIGRvY3VtZW50
YXRpb24uCgpJIHRvb2sgdGltZSB0byByZXZpZXcgYW5kIHRlc3QgeW91ciBzZXJpZXMgb24gdG9w
IG9mIHY3LjMtcmM1LiAKQm90aCB0aGUgY29kZSBhbmQgdGhlIHJ1bnRpbWUgYmVoYXZpb3VyIGxv
b2sgY29ycmVjdCB0byBtZToKCkNvZGUgcmV2aWV3OgogIC0ga3N0cnRvdWludCgpIHByZXNlcnZl
cyB0aGUgb3JpZ2luYWwgc2VtYW50aWNzIG9mIHNpbXBsZV9zdHJ0b3VsKCkKICAgIHdoaWxlIGFk
ZGluZyBwcm9wZXIgb3ZlcmZsb3cgY2hlY2tpbmcuCiAgLSBFcnJvciBwYXRocyBhcmUgY29uc2lz
dGVudCB3aXRoIHRoZSBleGlzdGluZyB2ZHNvX3NldHVwKCkgbG9naWMuCiAgLSBUaGUgZG9jdW1l
bnRhdGlvbiByZW1vdmFsIGZvciB2ZHNvMzI9MiBpcyBhY2N1cmF0ZS4KClJ1bnRpbWUgdGVzdGlu
ZzoKICAtIHg4Nl82NCBRRU1VL3EzNSBndWVzdCwgVENHIGFjY2VsZXJhdGlvbiwgcWVtdTY0IENQ
VSBtb2RlbAogIC0gS0FTQU4gcHJvZmlsZSAoS0FTQU4gKyBLRkVOQ0UgKyBERUJVR19PQkpFQ1RT
KQogIC0gbWVtb3J5IHN1aXRlIGF0IDI1Nk0vNTEyTS8xRywgMyBpdGVyYXRpb25zIHBlciBjYXNl
CiAgLSBBbGwgY2FzZXMgcGFzcywgbm8gS0FTQU4vS0NTQU4vbG9ja2RlcCBmaW5kaW5ncywgQ1JJ
VF9FUlJPUlM9MAoKUmV2aWV3ZWQtYnk6IEhhYmlsIEVyZW4gVMO8cmtlciA8aGFiaWxlcmVudHVy
a2VyQGhvdG1haWwuY29tPgpUZXN0ZWQtYnk6IEhhYmlsIEVyZW4gVMO8cmtlciA8aGFiaWxlcmVu
dHVya2VyQGhvdG1haWwuY29tPgoKUmVnYXJkcywKVMO8cmtlcgo=
