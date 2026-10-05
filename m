Received: from WA1P291CU003.outbound.protection.outlook.com (mail-polandcentralazolkn19011037.outbound.protection.outlook.com [52.103.53.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AFA49E5C9
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 16:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.53.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791218029; cv=fail; b=c6frrifI4yyG+oKJ7rC8uEfCgaA8/ZbTKhpWwbSPE+e1upblYncPt2OYNomYU/V7gcnrmwjfV5CgzFODEvdgtZqXk7uGI6yeEz6Bn1hqRoC1yXkRpPzXZaAQ4tNQhsO6eQCyq+QYjB0XnAMlraMreHfVIR9uZKbD5Zk4U5WSiAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791218029; c=relaxed/simple;
	bh=GfSjyzb1/4TUNBXIy0gHOl8uqJzog84wVukrWOCsY6Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jcBCdhjSm+/qDJ5XD6cbIjczWgL1EolPISMYQvSBEagQomd69jCR9Hi2CkPxiMPOGJCtR68wngT6FCTjYD6gy4fvWuan24hoWpKQTYmkOM+KU+NNAwmB+bohGTdwIDMJP2OcgG3EEJHmDCRcE9ei9hlo9KlhPcoWFDCd6v0NHxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=bvg+m8sg; arc=fail smtp.client-ip=52.103.53.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="bvg+m8sg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xYDjs9sfFO9wTwwrf4yPXE7PCfSkjoUT44vKOCE+A80Lrl3G37SgIQqqItpXlhaAXMbkW94DkRAoxWR1Q1z/8ZnVqcTOncdgMXMcbn9+yqG06LgIet4NHDOG1KXmHelpX/L3y+jqIpqjIUEHXImrkJmY6VkXq9sVUBbeA1x42lF2vQx5D5vkYq3jh8FkkD9gM5rW6prAGFwkTTrcFAIUIwSuxDM2vs5r60isg7FWgm6ZXJqft2ugO5MAqBfJYxCOkqm8ZcaFksaXaweFGhhh34Fh91+pFA4PGE9dQ1EaxZagc6xCHnL4F5lnHk6lmZnlMOPK2GWj6RLe3wAjQWrjqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GfSjyzb1/4TUNBXIy0gHOl8uqJzog84wVukrWOCsY6Y=;
 b=HqMEDlu9izCsAyWDLx1a/OzUOnF2pDY2WzqkBQC9JQgiBdQ3+Zg+w9dKx7dmi9MbuoEGj6Kk3RZf1QFztiPlFVH3fVu2HykORtHMIToZhgUuND2zmhZaoKj8t2xaZ0LZ1sc0AGnhcn6e/mZRgR5drbobbkUXqXkXAwBLpDo/6nHJdamBIMPhLuI7lTlZgbVqNL57VsLiB66wBlQK9wb9sJ7hFtfVczOXLGNw9wHlL/E3LQ9vfTklxNeer+wpA1XiqFK86QwOpCNJRL5MwQF0baM4Og1xxNiUJO7voMaX/QwVXdN0yAB6GJCOnJHdzRriIwTJdhirSb0oZQizrz2r1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GfSjyzb1/4TUNBXIy0gHOl8uqJzog84wVukrWOCsY6Y=;
 b=bvg+m8sgRrzhsKXylWPnGdzqbCL+s07/8X088RgeoVsw8O2WmHE1UNl4ToVKJ8vW0YjuG8ZxLNQc0ZTAQTpKKmHl6COwoGe5Ac1959BvIaWWTL+rReVOTLnSU2PH1HBKF9jNO094fNo1I3M3uUy4Wf/2SicgNgaJLMzXc0Y28933SVsYC9JwMPOy05EKlGW3joTW4w/T8wcyFfQHhY9xm6voNtYtHFcvSWN8BMwLb3hHxeBGTPtk6oDHjiJ3sOzQt3OGGVfaH4XF+L326hDEmMruCqtvFPskHHPmu9EfnVDHWv+Qg03foKEL1oBUBuyo88ZPT2ikZ47I/zGnR4hJCg==
Received: from WA2P291MB0187.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:26::11)
 by WA0P291MB0100.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:e::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.18; Mon, 5 Oct 2026 16:33:42 +0000
Received: from WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
 ([fe80::996b:1617:ce96:404]) by WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
 ([fe80::996b:1617:ce96:404%6]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 16:33:42 +0000
From: =?utf-8?B?SGFiaWwgRXJlbiBUw7xya2Vy?= <habilerenturker@hotmail.com>
To: "luto@kernel.org" <luto@kernel.org>, "tglx@kernel.org" <tglx@kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org"
	<x86@kernel.org>
CC: "hpa@zytor.com" <hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?utf-8?B?SGFiaWwgRXJlbiBUw7xya2Vy?=
	<habilerenturker@hotmail.com>
Subject: [PATCH v2 2/2] x86/vdso: Replace deprecated simple_strtoul() with
 kstrtouint() in vdso_setup
Thread-Topic: [PATCH v2 2/2] x86/vdso: Replace deprecated simple_strtoul()
 with kstrtouint() in vdso_setup
Thread-Index: AQHdVOdIvWb2ZEvYaU6DogFJbL8prA==
Date: Mon, 5 Oct 2026 16:33:42 +0000
Message-ID: <20261005163335.6716-3-habilerenturker@hotmail.com>
References: <20261005163335.6716-1-habilerenturker@hotmail.com>
In-Reply-To: <20261005163335.6716-1-habilerenturker@hotmail.com>
Accept-Language: tr-TR, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: WA2P291MB0187:EE_|WA0P291MB0100:EE_
x-ms-office365-filtering-correlation-id: 98f82bd5-7d9e-4d8e-56e9-08df22fe6b3f
x-microsoft-antispam:
 BCL:0;ARA:14566002|15080799012|24021099003|25010399006|38102599003|55001999006|41001999006|8062599012|8060799015|31061999003|19110799012|51005399006|40105399003|2607281247196008|102099032|440099028|3412199025|1710799026;
x-microsoft-antispam-message-info:
 =?utf-8?B?MFA0WG5mKzJjOHMrUjgza3F1V3RTaXNpeE01czZXbkk4SHZsM3BZcFdEV2pQ?=
 =?utf-8?B?dVFnMDRtZmlsZmMzRXJEeE10RTYwbjFLNHo4VEREdDE0SmdoSUNLNHFkUVJR?=
 =?utf-8?B?YS8wME9vQjRXU3NRMFgxeFRxdUlUTUtWLytwSWJBbmMwWEZvdVR6ZUpYTnZi?=
 =?utf-8?B?SEwxOE11Y3lwT1lIUHR0Q2g0K0RPRUNwVEpQNGRxRTdQUGN0ZkQzY0crRWox?=
 =?utf-8?B?VXIzNzFFaVRFVXN3V0g0RlF2dmd5Y3RnNjZHRmdJUzZ4NzErU3lnSGJDTXBx?=
 =?utf-8?B?RE1tMzBvZjNodXRwSzc0TXltQkJwRWpxVERtUkFPYUJlRVJhUjhWdkY5eE9u?=
 =?utf-8?B?ei8rYkJ1ZXlrT2hCNS82dzNwL2VCcGxBbDFBM2ZtbnMrb250cHJNdmhYUWFM?=
 =?utf-8?B?NWpodEJ1UG0yTDVaU1NQSmYxRm9mTm0xbVVjSHFwQll3RU52OEo4L2JhdkRI?=
 =?utf-8?B?TS93SDdiWjBTUmsvbStZeUlUNWxldHZOQlUwQzBDblFjWElFTGx3Vy96OEM3?=
 =?utf-8?B?cEI4blhxYzV6QVZXS2oyaWZIU0pxbXpueVFOSnhEM3RLVDlxNE5mRGgxZ0l4?=
 =?utf-8?B?RUtGclRGV05jQ052SXF2Ujd0ZXJ4bzREdkhCcjVEZDRFUGJiYUhkUzFSaHpa?=
 =?utf-8?B?TTlLSnVoaXpwVWk0bDdMK3FQbmNid0NBcDdDazhEaHlRcjFUVmppbXU5WWtV?=
 =?utf-8?B?YnlXZU9vQjFXZktrUDB3MFV0ajd2cGZQNitjQ1YxTGo2Q2hyeWRLY1NXNExO?=
 =?utf-8?B?QURNamFsVUlYaVh2R1hObURoZllZdXc5RWY5RkZWSERremlYM1ZwYzdYYXJs?=
 =?utf-8?B?UitUTlFndmRZYlV4M25oblc0YkkrMTFZeFhpVnNEZjA1TkJKbXZNbnVQekNP?=
 =?utf-8?B?VVBIWFpTRjlaVjg4UGlXVlRaaVROZ1pKYmlYeDd0R2xVRlBjdDdzNHlJcXlm?=
 =?utf-8?B?b29sTlNFMTdaakFNWGZRWE5KUE90N3d1dzhhaitlc051U1JVWkVzNmdGQ1E4?=
 =?utf-8?B?bHlFZ1p2T1JVd3JOdzB3UkQ3ODgvS25yNEpMQjBXTlhTdWl6bEhZSVZJa3BF?=
 =?utf-8?B?TkJ4Mk5lcWpOenNkeVB5dC8zVWx5NWNGRVJJL2F0bHhSb0xKYzRvdEd1V1Ex?=
 =?utf-8?B?S1RvckoyMTlDZGxGVVN2UjVKOS84c2J6Z1hZV0pkR2J0MXdOZWozL0l2Y284?=
 =?utf-8?B?VWZDVDhIMlk5d0cwekQ3dnMvWThPOEYrNDlLRXVDcEcxR3NMZnd2RmZLRzRL?=
 =?utf-8?B?WTU5NnpWTGtjUElaM3BGOTRBd1FmVUpSbDE0Y01UZFQ2NG8wMmQyWFhQTW9k?=
 =?utf-8?B?dlZrTVg4Ym9SaWU4UC81WS9XOGtmYTBRUXN5T0QzNURrVldXd1JxMUpGa3FD?=
 =?utf-8?B?Vld3YU1Gc3NWWHhRUkRTdVlJWTc4M2tZcWZDdHJ3VzZ2WUh0WHVRdUpLVFdH?=
 =?utf-8?Q?1idGYRH1?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SXJIcGlhSGxtNkV4UlJXME1Zbk5rQjhQeUU2RVhyQ0tJcDlpbWFqVGZYM3VI?=
 =?utf-8?B?eXZwRk04cVdBY0U2aWpBUnhmM1NtM0FxSkNWWlVhYXJUeWo5V05VTEs5SE9y?=
 =?utf-8?B?TkdscVdHdU43Vk1JdTJyZW9oL2JUSWJ1cWtmQitJTzdGa3dMWFkxYkFPRFRH?=
 =?utf-8?B?Y1R4NEFrMVBvU08yTDlaejF3aUlIQWk3QzBsa09IT20wbGRLWWZ5dTdsdjE0?=
 =?utf-8?B?c0VMMytianIvSlNrRHE3aUFRVmVrTVI1a3JIWXlQL1U5LzRLdXFOdHhVck1x?=
 =?utf-8?B?VG5CNXdtTTY0UlZkc3RsMC9GK0lSZTZmdTVWNTlscVFiWnl0bVA5cGVFeERZ?=
 =?utf-8?B?SmgwOExUbEtITkFsckNZejNhcm1VMGp5MkJyK2hFa1A5SlVkVzY2blVtRTRO?=
 =?utf-8?B?eEw4S3hKZy92WVhXUHBXSGJ1QlAySUdCV1lFaGlaOWdUVml1UHFmSkx6aGs2?=
 =?utf-8?B?ZzVRTUFhdTRGNjBuRzRIYVNNYkFHbi9vdVF0QkM1c2s2MDArNjFlOUxDY3hY?=
 =?utf-8?B?U3hjdzk4dFdYZG8xeFVhVnRHdG41Y1VQbHduY2E5VU01RlZJSjJZYUJWVk1V?=
 =?utf-8?B?Ylo0aEk4UkR1RGZ4RmFzZ0t1eDFFdTdldnk2Qkx4RXZNOThTZ3B6bFJZbkVK?=
 =?utf-8?B?MStpVG1Vclc1YkZJZzJnNlE4K3MrWkhFOWEzZndPV0ZkRUk0TnU1S0xWdkFv?=
 =?utf-8?B?dE1mSGN0eDl3em8zRi9QZXA2elZhRC9LakF5cG94dDg0cWY0RGZNVU5JVFVm?=
 =?utf-8?B?eDNrVUtYMFV1WTNGcHZvU2dtZFpiMS9NcktPa0NQS0VwTnF3N0dKMXl6YVhs?=
 =?utf-8?B?UWNqQ3RMM3ljOHB1b3dTZEtzem1HSEZGSlRuZytpdkZwUS9XbjJWMmlabWF4?=
 =?utf-8?B?SzZKYzd5N1hNUnhKWHkxbTJFWGF4cHF1TVoySTJhMHA1bFpTUHY3R0RSUlI4?=
 =?utf-8?B?TExmd3hONkd1WXhpZDQvbGFmZEtQZWdGcmFFMVVyQlZzRmphRk9JRHFISlVo?=
 =?utf-8?B?NW1Da2xRQVU3dGZ0OUsrR1d2VWNrVHdTdDJjOFNXQmZXcmIwMlMyZTNnd2Nk?=
 =?utf-8?B?eUFBSHFCcVR2VGllYmU0eldIbmNZTWVPMjI0Zk5lcThUc0VVY0szdkpZSWJW?=
 =?utf-8?B?NkNWMUZ1ZWgwRlRPV1RHYVBuOERTQlN3OVExdWJrbm9pQkpBNHhENHNNSTRa?=
 =?utf-8?B?dUpwbXNuNFdoQjZwbFBOSXhZaUErZVNQU2krbGFwcmk2RmhwblJIUmVUU2hn?=
 =?utf-8?B?MGdocGZaclRQalkzSHNCS3NacHJ0OUZ4L1hVSlBhcmlIdmd5ZnJUOFpXL0tD?=
 =?utf-8?B?YWdLWlpCUDFBbVRZLzFmUzR5aGRDaG9zMDJsVzQ0WFgxeEF3cHdCTGpWblBI?=
 =?utf-8?B?eC9JT2J6RlY2bk1aR3RweUM2OXl4OEM2aGtiWmM3UWVQMGhJU0MybGk5bW1o?=
 =?utf-8?B?dWN5SUlTMS9RL1R5V2NPck9VeTdIbkxrWjNhUkt6TFZOTVpjYnlWVDZKblA2?=
 =?utf-8?B?RXFrVzRNblpmNXdBR2xkMlVYcWNWMlJSYzBXR1dwQzdEZ0RBdFRpRkhyK0xY?=
 =?utf-8?B?R2M1eXkwVjYrMkpLOGI2TzRSSVZqMVFQNGtoSnQrcUw3UDUrVGZDQ3pBNm1a?=
 =?utf-8?B?bGgwOENnM1JjUmk5YlpaNmZxcWt3V0pydU4wMHUrTWU5aE5qVWlPRHVwSktQ?=
 =?utf-8?B?b1AvUHJReVkrNUtsV0Vmb3hKYlZESW91VC9zRUZZeG4yT0k1Q085MGVORGlN?=
 =?utf-8?B?N0pIdjNpdG1weEl2V0xaeUUxNklIaWgyYVFvZmRHOGFoamd2NjBPK3EzTlRz?=
 =?utf-8?B?UW9JaUpTWEVKSDFaVVJqYnlFU2hKY1Y4L1RKVndhZjdnblAraWwyd09nTzR1?=
 =?utf-8?Q?xtP8+2KhInJet?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <711D18F7DFB7FC429B08939DDA7097D5@POLP291.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 98f82bd5-7d9e-4d8e-56e9-08df22fe6b3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2026 16:33:42.5750
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA0P291MB0100

VGhlIHNpbXBsZV9zdHJ0b3VsKCkgZnVuY3Rpb24gaXMgZGVwcmVjYXRlZCBiZWNhdXNlIGl0IGV4
cGxpY2l0bHkgaWdub3JlcwpvdmVyZmxvd3MuIFJlcGxhY2UgaXQgd2l0aCB0aGUgcHJvcGVyIHZh
cmlhbnQsIGtzdHJ0b3VpbnQoKSwKaW4gdmRzb19zZXR1cCgpLiBBbHNvIGFkZCBwcl93YXJuKCku
CgpJdCB3YXMgZGV0ZWN0ZWQgd2hpbGUgcnVubmluZyBhIHN0YXRpYyBhbmFseXNpcyBvbiB0aGUg
dXNlIG9mCnNpbXBsZV9zdHJ0b3VsKCkgaW4gdGhlIGtlcm5lbC4KClNpZ25lZC1vZmYtYnk6IEhh
YmlsIEVyZW4gVMO8cmtlciA8aGFiaWxlcmVudHVya2VyQGhvdG1haWwuY29tPgotLS0KIGFyY2gv
eDg2L2VudHJ5L3Zkc28vdm1hLmMgfCAxNSArKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAxNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYv
ZW50cnkvdmRzby92bWEuYyBiL2FyY2gveDg2L2VudHJ5L3Zkc28vdm1hLmMKaW5kZXggMThkZmQ4
MGE4Li42MmQ5NmE1MzcgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2VudHJ5L3Zkc28vdm1hLmMKKysr
IGIvYXJjaC94ODYvZW50cnkvdmRzby92bWEuYwpAQCAtMjk5LDcgKzI5OSwyMCBAQCBib29sIGFy
Y2hfc3lzY2FsbF9pc192ZHNvX3NpZ3JldHVybihzdHJ1Y3QgcHRfcmVncyAqcmVncykKICNpZmRl
ZiBDT05GSUdfWDg2XzY0CiBzdGF0aWMgX19pbml0IGludCB2ZHNvX3NldHVwKGNoYXIgKnMpCiB7
Ci0JdmRzbzY0X2VuYWJsZWQgPSBzaW1wbGVfc3RydG91bChzLCBOVUxMLCAwKTsKKwl1bnNpZ25l
ZCBpbnQgdmFsOworCisJaWYgKHVubGlrZWx5KGtzdHJ0b3VpbnQocywgMCwgJnZhbCkpKSB7CisJ
CXZkc282NF9lbmFibGVkID0gMDsKKwkJcmV0dXJuIDE7CisJfQorCisJaWYgKHZhbCA+IDEpIHsK
KwkJcHJfd2FybigidmRzbzY0IHZhbHVlcyBvdGhlciB0aGFuIDAgYW5kIDEgYXJlIG5vIGxvbmdl
ciBhbGxvd2VkOyB2ZHNvIGRpc2FibGVkXG4iKTsKKwkJdmRzbzY0X2VuYWJsZWQgPSAwOworCQly
ZXR1cm4gMTsKKwl9CisKKwl2ZHNvNjRfZW5hYmxlZCA9IHZhbDsKIAlyZXR1cm4gMTsKIH0KIF9f
c2V0dXAoInZkc289IiwgdmRzb19zZXR1cCk7Ci0tIAoyLjQ3LjMKCg==
