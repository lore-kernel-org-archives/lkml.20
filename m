Received: from WA1P291CU003.outbound.protection.outlook.com (mail-polandcentralazolkn19011032.outbound.protection.outlook.com [52.103.53.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1059388E5B
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 19:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.53.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791315260; cv=fail; b=OEdJFhCYxiVN1MULpvE5yXE2HViVAqm6sbkSCQ1hj0souRPZn8ulZTG1Y3z5RGI/QoWIm9EUISVMNKro+67LMqvYKq7/4RidQeT9CRGhUN2oJV7DcpwlkxaO5NGYiBW5z7Vr6XPwDM9umdei50iX6o8wKdWHZlsv1oc0MhPtTIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791315260; c=relaxed/simple;
	bh=M1/73dqG3hxmEVzk2eryl4evBQhXVTnJflBcjYhIXrY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=l9EjHw8IkW1IXUU+naNjvojIJr4aVOsmKlLE71h3nwNW6T2avFxZeK06edhaaD8n0rkCQRKhG3mzadee0FD86SaJ/eM6MjEBVTpPj9TTlX8l0vMylTrHvESvW9LUbhtJQ/zWG5oL4tfzmRDf3sAKku4UsQiAV0ZypsX4py7P9dU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=sK0P+Gob; arc=fail smtp.client-ip=52.103.53.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="sK0P+Gob"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y2v9Cr574BEIRcDkZMUFNEPaSWo29Ery4ufaLFJvMIYmiFQ5BRUrNt5WHpAShxi3ozHJ2Gpyq1s+pO5TkE03rF2gSSKcTXdztZOrYKMvVsPf2XB9uJBl0Y1T1KbclHdFR/Ky7VdT/TareqPsQ1cTDgHHCgY67GX4zIppolNQ/K6xfalWepthC4AkigWbm7HqMzTg9bqgpJvhesqB11+n6zo2nD0Ij1y84DdHHgtWKQGRvMFfErT+4lGKgV9HhQW+cZjcczKh0jRFEFiH6nT4dVC0n3hk0qfnVLqTDUYi3tqm3XPSfDuWQisPafMc/93uEPWK3AY+9BDO+yj7yiyzBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M1/73dqG3hxmEVzk2eryl4evBQhXVTnJflBcjYhIXrY=;
 b=BO4FwczToqkLBEgMdzKK6zMwgNTupWEltUFk54dPon3ta8HOLCc8NBg6sisW7jJ8BHhjmSkZ7nKldSHXjSFNeCvDze8aY3ABS2ZCPYjK1Aq9YVh3JzoyAUDGZMQK3YTzfbwxOniIHQMwJqFCmjviwfWOIV9HaZ7a7Rzuo8z5lVkm6NeW/WqHjI30iAkmrUJ69jFOj+YOtCCItNP7hJfVi5WspPA/Sn624c5tj3M38oq8etJwaFt6BEIpnh/ohSswHtdSFKZthlWS2S+l6HjmDVtnLB8fsluGRqF1oZiA8ceQMyz4d0jusjcw/7VWOswzA1Ssu1e+eWLZCl4P7jnEPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M1/73dqG3hxmEVzk2eryl4evBQhXVTnJflBcjYhIXrY=;
 b=sK0P+GobRmPNoIqhgevjoaUOiIS9J3xeNojuWB1MfYqZcORmFgNw/X3hWt/5khEZmzcyl87Qa4r9gKTJTzvqqrEQHAh88sH+RcdMJBCY4/mAbCmkc2ItWArg6g5M0gV5VQmALRT3viHQwHdX1t6N2ALU/DKPwoVHl5RTrnpd9j6mqKIhhDbtGWYvIVWdjgKtutevf8ilisH6enwcsgYl1QpnonNfd667iYAf1adFNzWXIuJOPX3zCl0r3bCeigXzLuoc6IJMeysgbRU6QqeNlEd78qopX9JQg0axnTdtaUzkmafMTkmWurC+cxCHCjbAN4AxEMaOR/qrSuGSQyMgQA==
Received: from WA2P291MB0187.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:26::11)
 by WA0P291MB0123.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Tue, 6 Oct
 2026 19:34:14 +0000
Received: from WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
 ([fe80::996b:1617:ce96:404]) by WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
 ([fe80::996b:1617:ce96:404%6]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 19:34:14 +0000
From: =?utf-8?B?SGFiaWwgRXJlbiBUw7xya2Vy?= <habilerenturker@hotmail.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?SGFiaWwgRXJlbiBUw7xya2Vy?= <habilerenturker@hotmail.com>, kernel
 test robot <lkp@intel.com>
Subject: [PATCH v3 2/2] x86/apic: Replace deprecated simple_strtol() with
 sscanf() in x86_fwspec_is_hpet()
Thread-Topic: [PATCH v3 2/2] x86/apic: Replace deprecated simple_strtol() with
 sscanf() in x86_fwspec_is_hpet()
Thread-Index: AQHdVcmrn78JP8/ttUii2yXHsbiy3A==
Date: Tue, 6 Oct 2026 19:34:14 +0000
Message-ID: <20261006193402.526407-3-habilerenturker@hotmail.com>
References: <20261006193402.526407-1-habilerenturker@hotmail.com>
In-Reply-To: <20261006193402.526407-1-habilerenturker@hotmail.com>
Accept-Language: tr-TR, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: WA2P291MB0187:EE_|WA0P291MB0123:EE_
x-ms-office365-filtering-correlation-id: 4c13f294-4031-4700-45ad-08df23e0ce25
x-microsoft-antispam:
 BCL:0;ARA:14566002|25010399006|38102599003|24021099003|31061999003|19110799012|12121999013|8060799015|8062599012|41001999006|55001999006|15080799012|51005399006|40105399003|1602099012|10035399007|2607281247196008|102099032|3412199025|440099028|4302099013|1710799026;
x-microsoft-antispam-message-info:
 =?utf-8?B?QnNldkk4MTliY0VwVmlKdkZHWTBFOGJiSHBsNnV1aHFMdGVpWnk5SERjNVV3?=
 =?utf-8?B?MXIxWldlendYUUZuUURncjRRTmdGQXgwejlFM1J3RFZ0SVJ3U2xwZ0JER3FQ?=
 =?utf-8?B?U0ZYS0dQUTdTYkZiQ3BNQkZUcXdDRlJQTEtQVWxTUkhRbi9nNFRocmVWaDdL?=
 =?utf-8?B?UTk2alpwUDBVazhsd1ZJUFIrTmVQakd0NjNOb25GSHBwWDhCUnRCcnhsejFP?=
 =?utf-8?B?WVNmNmxrTEcvU1lERTlFMGRSdHFIVGdWZUhVMDRmSERtTjM2REFUNENzdDRO?=
 =?utf-8?B?cDFUNHd0dFhnQ1lFS084eFoyQnBtZkN5ZjIwSTlMR21lQVRGVmNNNnM4SFRW?=
 =?utf-8?B?L3l6N0xSYUI1a2JoVkdNMFJCR2t3YlhvbHFIU3N0NDgwUE5pUkJwNmFpamEr?=
 =?utf-8?B?VFVlaDhtYk1nSlRQek1jM3M5cTlFL3pZU1cyejl1bmdUdXczZnBqc0FIUXUz?=
 =?utf-8?B?OGJ2R25UeUlBWllHSGNNeUtqTHEvK1VXRlpjTSt0UlpCZjdTbGYxYTUyMjlI?=
 =?utf-8?B?Ym9NbzVIWFl1VmdkbFo0RTZJS3laYnFWWWVXRHBFV2xSTm9QcmpuVmxGaFBi?=
 =?utf-8?B?T3VkdmxvYS9YVGYxMWlJQjVaR1BiT1AzNnNSbGRkN1UvV1pPUmhsUkd6T3M1?=
 =?utf-8?B?V0E2Y3BqRnVTZlNtRjdMUEV5RU1mK1F5NktzZW45dEdwb2N4VjNtcWgrVlhO?=
 =?utf-8?B?STBDL1VqUG9memJYemxBYWw2UDRFbDBFR1QzRkF6TWFwZmxuVkNON0w3MmNl?=
 =?utf-8?B?bmY4RWEvcmtaZDFERXdqKzdOMjV6RVd5aVJzSVdCMjkxNk1WQkdidFdOamFD?=
 =?utf-8?B?L2FiU0dpeWQ1K0xyLy9zNElWdm5UemgzYVY5NHFBNXdPQXRtY2VRL09JRmM2?=
 =?utf-8?B?bkJ1Q1FVMXRBeGNlS2xveDRRQTJmMW1uK0lJMWl2MHgxbjFYLzNHMVFDclFt?=
 =?utf-8?B?bXFpR3lMR1p0ZGFaNDk1NC9xcHFqN3dmYXl3YXVURUg5blZyMFE2STY4OWt1?=
 =?utf-8?B?KytWRG5QTGNFbDFIVnRoUkd3clloc0xRc1QxdDBwV241WEpsakorRGhDRDhE?=
 =?utf-8?B?MUtxRWlscDFzdUgxQTR2a0ZsQzY1TFRDdGoxUDd0VWhheEhRUEFwVlpHdFNp?=
 =?utf-8?B?RzRiekFEVTJLN3AwOXZNRjBpTDQ3NzhEUDJnaEU3bnY2bVZHR2pMbThrRlFI?=
 =?utf-8?B?MEN2L1ZwMnRja1ZLbGExNFpPbjloMHJrVjlXV3dBd0RvMjdxVlV6eUJsWVo1?=
 =?utf-8?B?bThNYlNqK2hjSXFzbXpndDZMbk4rN2VRL3gxS1ovUEoxdHVJQnRrZEVZbEZq?=
 =?utf-8?B?ZmFnNmQ2OFAxQURCeGRWSHhSWUxNU3grT09EWTVJQlRiWFV6bnFBLzc3MVA4?=
 =?utf-8?B?SllmVXAwcENwUUVrOU8wc0NqYU00VUtyTEhxaDRkaWNuaGZyTXlabTlld2tQ?=
 =?utf-8?B?VXZTUGFldjlhS29pTEN2dmx2MkNDdnE5T1czbm5sZ29nTTRoYjRvUUFaWTJ0?=
 =?utf-8?Q?NuPR+nNCrhf0c5eId76C+EoQYg5?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dzdIamNuQ3BGK0U0Y2NxaWN6emp6Vmc3N1RmMDdMR2VMbnFYWUdoT1NCQUtW?=
 =?utf-8?B?cW1wVElSQ25TR3pCTU9kVFFQTG0vZWpGTGEzaTFHNUNHMktseGd0T1V0M2Mr?=
 =?utf-8?B?TTVtVVExdWVKZWhFcTFLNXA3S3NJSmJBd05RMzUwWmFUYWhyMitjUzQ0RXVH?=
 =?utf-8?B?N1VxZU1RQzIrd21PNDdndUxWNUE3amdqUi83ZjNtbXA0czdFTFJRZklWbE5V?=
 =?utf-8?B?aDNmVDBySTlxdlo2emlBUXZNNzNIdlU5WG1PSVgrdG9pWEFFak5SM1F4K2lZ?=
 =?utf-8?B?V3ppN2tyVTNlWlZKRjlKdHBvanE2NC9RbXFZUldjSTRZaVE2SHYyMFpsOXJ6?=
 =?utf-8?B?Z3lOZ2ZCazJPYXFmUEt3eENhM2o1YnhiMkZpSC9hUUtNQ05sSUZ5VlQxeDdi?=
 =?utf-8?B?MWh6NTZLVTQwUUlSOUpwUHJ1VllBeVJGdy9GdTh5UGF6dS8vMm5leDhpL1dr?=
 =?utf-8?B?dHdxaDlFcHB2cjZmUVB3NHJsb1ZxNE9SdHFHdERtL3MxcVBSSEZ6OHpqV1Yw?=
 =?utf-8?B?VkI2eDZDY2tCczFaS2tMVWY2ZE5Ca1lMRHgzcktwdUJFYU0xdWpzMGhKbXM2?=
 =?utf-8?B?NnFOSk1vS3hGeVBrRXJzS2pNWWpmTDBueUlBM2M2SUdabDl0aWNPa1ZaeVpL?=
 =?utf-8?B?Qy9YblpCUmFQMkN2TE04WHBTTzJhQ3h4UExwN1hPa0xtYkY0MFA5b3JHU2ZY?=
 =?utf-8?B?RFlLdnBzWDVpemFQQndHTEFvbGQxdXJJdFFYLzh2R1laaDVYMXFZUEVhRWZR?=
 =?utf-8?B?UnZmam5nM2tmMHIxaTdtZXRnVTJVbzdXejNhVmJXeEluSzdiQmpOYmxLclFt?=
 =?utf-8?B?bEVTME16dG9wSEZwcTB0ZGxqSzFSRmRqR3l3NVI3Qng3d2pDVkh2bTRQaTRQ?=
 =?utf-8?B?VXl2TVBFbUpiUkdUc1A2TjZ0VEhpdm1kRU9FODBzcVkvSytWaitHTUM1eGl4?=
 =?utf-8?B?ZmFVbXZzWmpqb3lLS1dmODhUeE5naW90QkFOeFd2b3lqY01VdTJtaG9RNWVO?=
 =?utf-8?B?THd1U3hxQXM1N0FENk4yeDY0VHNCQ0FPd1lQbEQxc2JOM1FZemc0V1VxcG5z?=
 =?utf-8?B?QlkraW9Udm1MUW8zZDhaRkduMmJyRDFmblp1S29lZTdPdnNYT2hrWnM0Zjlm?=
 =?utf-8?B?WjJiQTNyNjhDaDFwc3dGSmQycmVFTHBtTGx6Y05sWUhBNjRsQU5ra2R3VlEz?=
 =?utf-8?B?VkhrTVA5TmtoUkd2MW1XblZnc0hPMnlGY0dCTEQ3U1c5QzdNc1FUWFVhZUZX?=
 =?utf-8?B?UlFUSVViWmNCVVUvajduY01TT1dsTllwVDljbmVCTmY3VnR2bG5vejIrTTcv?=
 =?utf-8?B?Nyt2Z0JQVzduU21iNkJHRWpkTExmWlJGbnRsb3dPYndtWjJiaFRITmhpMUpt?=
 =?utf-8?B?LzRlTlRFUmo3WnpFaGdKSVFIZmFuWE9XTWhSTEp1V3R3SUZ0NHRTakhCQnMw?=
 =?utf-8?B?MkhJK0xtT01pT3U4c3ZiV1hhcytDa0toSmUveFBmRUYvclNKNGo3Q3hHazdV?=
 =?utf-8?B?dFVHRmE3UzY5RTFhbGRtZlJEMjBQUTk3MHR2MVJGbEJBYUVGVWh6WVlKTzBB?=
 =?utf-8?B?T2xweDJISjRFR1hITWd3MVNodXV3TXhpejFPV016R2Z5dkxIejlXSDNiMTE3?=
 =?utf-8?B?MzFRa1d4NUpRRXhKYndJUTlWTG4yK3hHSURyN2p3S0YwdkZyTkFGV3VzU3lU?=
 =?utf-8?B?VXFNYmRqNkI2UjVqUkJrSjNpelpWb2g2RVlHUDB1RUptZG9ZM2RoMlZsVjFM?=
 =?utf-8?B?V2ZFMnJ2WEVvMkhVVWNwdWg3eXU4d3VXMFRsOW5mUldQRUllOVNQYXRVaGtX?=
 =?utf-8?B?d1dFZ2xoSGxibnJVR3dDNHJGSlVSbUc0RzYwM3R5cFRpUGw4T2Znb0V5MW9l?=
 =?utf-8?Q?3QM7+6sWKX7eO?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E2C7BC01AA56964492EC2170AA7A2561@POLP291.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c13f294-4031-4700-45ad-08df23e0ce25
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2026 19:34:14.7014
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA0P291MB0123

VGhlIHNpbXBsZV9zdHJ0b2woKSBmdW5jdGlvbiBpcyBkZXByZWNhdGVkIGJlY2F1c2UgaXQgZXhw
bGljaXRseSBpZ25vcmVzCm92ZXJmbG93cy4gUmVwbGFjZSBpdCB3aXRoIHRoZSBzc2NhbmYgZm9y
IHByb3BlciBjaGVjawppbiB4ODZfZndzcGVjX2lzX2hwZXQoKS4gQWxzbyBhZGQgZWFybHkgcmV0
dXJucy4KCkl0IHdhcyBkZXRlY3RlZCB3aGlsZSBydW5uaW5nIGEgc3RhdGljIGFuYWx5c2lzIG9u
IHRoZSB1c2Ugb2YKc2ltcGxlX3N0cnRvbCgpIGluIHRoZSBrZXJuZWwuCgpSZXBvcnRlZC1ieTog
a2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+CkNsb3NlczogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvb2Uta2J1aWxkLWFsbC8yMDI2MTAwNjExNTkuN0U5V2tEN0ktbGtwQGludGVsLmNv
bS8KQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9vZS1rYnVpbGQtYWxsLzIwMjYxMDA2
MTM1Ni44VkhWTzFDWS1sa3BAaW50ZWwuY29tLwpTaWduZWQtb2ZmLWJ5OiBIYWJpbCBFcmVuIFTD
vHJrZXIgPGhhYmlsZXJlbnR1cmtlckBob3RtYWlsLmNvbT4KLS0tCiBhcmNoL3g4Ni9rZXJuZWwv
YXBpYy92ZWN0b3IuYyB8IDE3ICsrKysrKysrKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTIg
aW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rZXJu
ZWwvYXBpYy92ZWN0b3IuYyBiL2FyY2gveDg2L2tlcm5lbC9hcGljL3ZlY3Rvci5jCmluZGV4IDFh
MzBiNDdjNS4uOTlmNzRlNDQ3IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rZXJuZWwvYXBpYy92ZWN0
b3IuYworKysgYi9hcmNoL3g4Ni9rZXJuZWwvYXBpYy92ZWN0b3IuYwpAQCAtNjg1LDE0ICs2ODUs
MjEgQEAgaW50IHg4Nl9md3NwZWNfaXNfaW9hcGljKHN0cnVjdCBpcnFfZndzcGVjICpmd3NwZWMp
CiAKIGludCB4ODZfZndzcGVjX2lzX2hwZXQoc3RydWN0IGlycV9md3NwZWMgKmZ3c3BlYykKIHsK
Kwljb25zdCBjaGFyICpmd25hbWU7CisJdW5zaWduZWQgaW50IHZhbDsKKwogCWlmIChmd3NwZWMt
PnBhcmFtX2NvdW50ICE9IDEpCiAJCXJldHVybiAwOwogCi0JaWYgKGlzX2Z3bm9kZV9pcnFjaGlw
KGZ3c3BlYy0+Zndub2RlKSkgewotCQljb25zdCBjaGFyICpmd25hbWUgPSBmd25vZGVfZ2V0X25h
bWUoZndzcGVjLT5md25vZGUpOwotCQlyZXR1cm4gZnduYW1lICYmICFzdHJuY21wKGZ3bmFtZSwg
IkhQRVQtTVNJLSIsIDkpICYmCi0JCQlzaW1wbGVfc3RydG9sKGZ3bmFtZSs5LCBOVUxMLCAxMCkg
PT0gZndzcGVjLT5wYXJhbVswXTsKLQl9CisJaWYgKCFpc19md25vZGVfaXJxY2hpcChmd3NwZWMt
PmZ3bm9kZSkpCisJCXJldHVybiAwOworCisJZnduYW1lID0gZndub2RlX2dldF9uYW1lKGZ3c3Bl
Yy0+Zndub2RlKTsKKworCWlmIChmd25hbWUgJiYgc3NjYW5mKGZ3bmFtZSwgIkhQRVQtTVNJLSV1
IiwgJnZhbCkgPT0gMSAmJgorCSAgICB2YWwgPT0gZndzcGVjLT5wYXJhbVswXSkKKwkJcmV0dXJu
IDE7CisKIAlyZXR1cm4gMDsKIH0KIAotLSAKMi40Ny4zCgo=
