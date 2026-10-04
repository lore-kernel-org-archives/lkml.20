Received: from WA2P291CU004.outbound.protection.outlook.com (mail-polandcentralazolkn19012054.outbound.protection.outlook.com [52.103.53.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB109415F30
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 14:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.53.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791125822; cv=fail; b=a5VReCCvS7s7xsO46/1xSNTomSymrq3JV3UyEyvOd039OUWBTKTsankCLpUZJ8B6/zoQMcIkF0giF5rAKbeoo1Ep5oYKg0BSnJel85f+2UChucTuwf5vmuKczC9wCWkoBarsDCCDSH0mIbAPvGbZuHNE8dE/WtjlzcqGdgy5s6A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791125822; c=relaxed/simple;
	bh=aR6UrTsfh2fAYuAirgEbhPIA6Gdj3uFl6qvp21XjPBY=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=t9E5ut9doffiLNMmjmpwp+IgRV/deWYA+bSilvXIuytgC7Ef6G1Zb97H7FCD83dg6/l7lRxr/DoERdaDtMnWxd9mBU/a5IN3gpWPjgvz7s0pvfaKG55DHn2GtOepVQvtw3cGPuiRxwVy9T5qlvc3HUZl3nNw0a7mii6ZZhTRZZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=oiDz4KcR; arc=fail smtp.client-ip=52.103.53.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="oiDz4KcR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cbU4ZM5P9ctkDpEOU5zhORyDdC97i6tXgtXSKgPdb8oGmGCWWNXLyWpG7Rrc8zMXbFkL8EfVYRc9pS2CK6wvFz1TzD57YqTKugHM22oGzhtyjoubszs5xrD7qD0+MTPf3r7R4gEp7GFipd4kZYbWy1FKi4bREu4Js0PVp1sZOSoeWD10l09cwI9hWEI3UWvq22kh7Q3D9VUebZlQR9cwh1IWV0+Y0hfyYNv0F699qOVa3eWO1m+U8lKBmqjdI4UKuUCU/AGBcVjXuoNv8nC+SBVTs4h8i6sm9WGb9Rfo5b4wqpp7nQMxjjYEVFxXvCyWdsZbxqoY70V3tH9d0mWJSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aR6UrTsfh2fAYuAirgEbhPIA6Gdj3uFl6qvp21XjPBY=;
 b=h+l9xbvFRcxLnQyIURpq6DaaO0jGbD2Khu4wdk2gIbipCYRYMDEX2eBopXn5+/jN9esWvKmj7OHK0ZoyipZXCpPZQkbI5ZqOWkeNNyxQcvvOm0SJEDEOaKmIIoI4tsERE4fgb5QD5Pxt+YO7nc6TF/NrTHKCEaqvZXOYVQTUllvn3QOc1776qqD8wfgH3VL9KL76s/tLpi4Kvj+dEGXovMaOu/gxfnRqCxUZwfRMcXK977VMIog42XrzPFTCZ1OolF1JqybEG/zUwHQWwinNYNQYeqGUR5hlY9GAQ8yRUMpMW6XMtYVDUslZvrQCaXn3fW/zEOeJLnkJQ5iW5VXNIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aR6UrTsfh2fAYuAirgEbhPIA6Gdj3uFl6qvp21XjPBY=;
 b=oiDz4KcRikOT+wACW91LrbV1CeISQS0yX+pWbRln0lb/IdQ8k2Dw9sNf1q2/of8QTTxVtpVG406VzHbuE7EeMgxmiOqiPTPT0JJnZaVE5oQhcYzhMQrSD//cYh1EvOB6n7MCeZZmBEAe+DYDftEXLu97AHWKgg/MkFDDZacOMY4pIHlnVe4QdfBOWpFTh1L5I36GO0YYy8b8L+Qe2S9oieL6j66sBZl6WmA+oTrTfQeW04C+j21mSBMYaMD/yM3AoxX3XIS/f4K44QdW4nzXhbZZgdoqNaJtLBRYJHy2kAY9ZeMYvjsKBMe5kIL3qcah/yw0xw41ltK97CRvoHhSQA==
Received: from WA2P291MB0187.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:26::11)
 by WA1P291MB601953.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:4b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sun, 4 Oct
 2026 14:56:55 +0000
Received: from WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
 ([fe80::996b:1617:ce96:404]) by WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
 ([fe80::996b:1617:ce96:404%6]) with mapi id 15.21.0472.016; Sun, 4 Oct 2026
 14:56:55 +0000
From: =?utf-8?B?SGFiaWwgRXJlbiBUw7xya2Vy?= <habilerenturker@hotmail.com>
To: Thomas Gleixner <tglx@kernel.org>
CC: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave
 Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, "H .
 Peter Anvin" <hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?utf-8?B?SGFiaWwgRXJlbiBUw7xya2Vy?=
	<habilerenturker@hotmail.com>
Subject: [PATCH 0/2] x86/apic: Replace deprecated simple_strtol() with
 kstrtouint()
Thread-Topic: [PATCH 0/2] x86/apic: Replace deprecated simple_strtol() with
 kstrtouint()
Thread-Index: AQHdVBCZSh0sr2tspku/FrGlgUoEMQ==
Date: Sun, 4 Oct 2026 14:56:55 +0000
Message-ID: <20261004145650.17881-1-habilerenturker@hotmail.com>
Accept-Language: tr-TR, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: WA2P291MB0187:EE_|WA1P291MB601953:EE_
x-ms-office365-filtering-correlation-id: c19955ab-4c95-40f0-e50e-08df2227bba0
x-microsoft-antispam:
 BCL:0;ARA:14566002|12121999013|15080799012|38102599003|24021099003|55001999006|51005399006|8060799015|19110799012|31061999003|8062599012|25010399006|40105399003|2607281247196008|102099032|3412199025|440099028|1710799026;
x-microsoft-antispam-message-info:
 =?utf-8?B?NkFLb0U5cjNaVXFHVHdHRXM4dVEzTC9VMm1EV1pNN0FHcnZpeXE4YU56RXRY?=
 =?utf-8?B?Sk1MamN2TndSTkFNTXNGNGxMYmtoa01paWJ1Z0VwbmJ2dk5BY095cXNUUTNy?=
 =?utf-8?B?L0thNlVISjRRTHpNYXgwZGl6a09JZXRGeGo2NXA0ZGxBMUhrYW91Y1grWllX?=
 =?utf-8?B?eHNSeSs1SWVUaE43TVFyN2pTZEczMUgvZFBqaHlSZW1xRmdnZjhldkxzYTBr?=
 =?utf-8?B?eXJlUEpObWpmQWdEUWQrQVdNRS9GWklkT1YzWWplSUNkM0grck9zRW5naU1N?=
 =?utf-8?B?b3dxczFFNEtTNGVhT0JmMU1JWElpOWM5TkVpR0w0RWxDQXlFbjJVMFArSGVD?=
 =?utf-8?B?WlpCZEtETHVaWjF0MHhOTHQxZERCMDduL2I5cldVb0FNdFVFSmtCbDFFaG9z?=
 =?utf-8?B?NTV4MHZ5OEJadlRBc2VuVlJYWUo5SEFPcmIxR2p4Y0JDWXZTQlViRnhpd3g2?=
 =?utf-8?B?MjlQbzZsVytjS2xmVzF5ZlJoRW9Ga0FxcTlBTHNnbS9iamY4SzNLMW5tVXV4?=
 =?utf-8?B?NDhFMDY4S2l2RjcrOUdiNnIxV1gwMGRyZ1dGQno1NEdSUzBTMVRtbUtMMHRz?=
 =?utf-8?B?cThpRkxmTDZCaVlxck5Kd3NnS0RkczI1V3FBSFNwbjJoSEtnaFVocjgvdUxt?=
 =?utf-8?B?aTZZTDdKSmIwVjRZZGFaeGpweDRIYnpmOHZyZy95VkhieVVvb3l5cHArUHdD?=
 =?utf-8?B?dzdqTlViZWxaL1Z3RnU5MUFla3ZQc0N6OW1OMG5PZk9xNHNMdXRaNjhhSjRP?=
 =?utf-8?B?MmlWZkFXUlEwTTQ4N1RWcTQ3NjdZWkdMK0REcEVKVy9BaEIranRjSXZiRHBa?=
 =?utf-8?B?bVFUNGlwV09QZUdoMWc5TzJUR3lWQUh6eXpTM3J0VXZ3U2liKzFXREhIUmtO?=
 =?utf-8?B?a0hmN0N1bjdxUXJmTDR6T2pLTHJqQjQ0MnZKV0tzREZIZGNzWnZnU1BtQjVh?=
 =?utf-8?B?c2VmRDhzYS9WYk9ZQWwwTkh1Q0RrWTJsRVNWamJLaVg1djhFK1JMYVBMNnhz?=
 =?utf-8?B?N05YR0Q3QXozeUdiTXJldG1ORjErZFg3bEZvYlI4T1JnOTczc2RROHNBRjJ4?=
 =?utf-8?B?cEJHS1lNNG16S0F4M0RCNWloVGRvNFdqaHppVGNTNDUwN0pYcjV0STExT3JK?=
 =?utf-8?B?NmRCVm1xbVZtQzB3a3UyakNJZDhwMnppek5KUWQrd3laMWdaZEIzWXc2aWdz?=
 =?utf-8?B?dkR3aDBXVWdiWStGUi93c0JkYnVFSmNkclB4Yit2KzBkR0RhN2gyOSt5VTRW?=
 =?utf-8?B?eGMzREJPWnFubmRDTHlkekgycU01K1pGOUh4eTRKd0V0Zkd0MjNkaFZDWE4y?=
 =?utf-8?B?YnJaSDRMTXR6NmhpNFQ1dzdqWDk3ME1jL1dZZ2FNRVFwMVl2UHc4M1laZmlk?=
 =?utf-8?B?YjhHeWNBb2kyMmF4STA4SUw3SXdqNklZMm8wVDIwem95L2FxRE9veG5QS2xp?=
 =?utf-8?Q?wU6uIDR3?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eG9HT3FCODV2WU55VVA0UmNUSXdvN1U5cnBqRWUyY3ZDdHgweWJoTWc1V0lL?=
 =?utf-8?B?QUw3RHpZYWVGekI4MGk2SEZDUXlKUGI1ZXZWSll0R3pQWTB3dVVCL0dPZjNY?=
 =?utf-8?B?Z1RZTFV1V0VoeDdldFBRdjBTY2N1MDhMSDRBdUxaZndVUW1SNXlRN25UWFl0?=
 =?utf-8?B?dWYvYWxxQzBSNFNvMnJqanRMMVJZbnJmK3ZFSDU3VUZHNmpuQmtUTCs0cDYw?=
 =?utf-8?B?d0V0dXJxaERBQllTZHBaZDBiV1FPR3drWHdZbEttZTl5OXlzcyt3MnNKWXZS?=
 =?utf-8?B?d2VJZHd3d0tHNFM2Y2RLV0VqZk1XMmtSdDYrekM0VXRGTWwvc2pqQXlOQmp4?=
 =?utf-8?B?bVh1NU5hNFpsZHQvTWVzWjJJSFdrS1cyUVVvNjh3MmZGVEFuTVVuVDNBVEtY?=
 =?utf-8?B?Unk0UldlbHNBaXN2bWhYcGZqYkJuenAwTnJnSDBBaW1YbmthVE85UDhLTjYw?=
 =?utf-8?B?dDZkUkE0ZzlLTXhGdUs2YVBWY2J5VmpmTytlbnJsaXZibzlFWnBlSWxka0E5?=
 =?utf-8?B?SHEvcnVLK3I1M0l2NG9zMHF1L0FNREhPYy85VHdBMjZ5VStXTEhlL1pXRXNz?=
 =?utf-8?B?dHJkeGpNdU5OaG1oSngySWpkVGJHTk9YUko4UHl0VSs1akxYL1JGam4zL0dH?=
 =?utf-8?B?TTRZd1laa1FuM0tHSmFZMlFhVW1LV3JzV2hublB1Wk5DdXJDZ0tqUHAraHR5?=
 =?utf-8?B?aFl5Q0hDTldCL3RHQmdWd2EvL1V6Vm5iUnZES2RxL09ERjN1RHFremNNeVhU?=
 =?utf-8?B?ZjJwdkhjM0t3dC9tMXQ4ZE1yYVhKelNYb1JaTElyNElGT0VRai9yYm9lTllR?=
 =?utf-8?B?anNuS2szVktxaW9PemJaWnJKR1dUK2UxOUFVK25ibWdCdkY4a2FaUzJOeGJ3?=
 =?utf-8?B?QVh5b0tOQzdZdmhQbjBUMnkxMTc0eXhtL0dFSnkwdHJMaXQvSWpOaXpzYThZ?=
 =?utf-8?B?QVVPdmpCZk9JbXJJMUI0ai9iSFM4WWIxUzM5MFNFK284b25oc1RCVk1YTUdn?=
 =?utf-8?B?UUkxUkxRT240Ympjb1IyMnBCTHgxOXpHQWJTQktoYXNOVjdobngvdFhBanJN?=
 =?utf-8?B?UkxtN09ic3BoVTFFMDdld1lFcStNMG55NDFBTThKemZVczRjN0VDbFp3TU9Y?=
 =?utf-8?B?c3JkRjhKeFBXNTdrdkMyQldnUlRZMlAvbElvUzBaRUtGYWpQWVZ5alNNZ2xW?=
 =?utf-8?B?RmFzT3VueEhRcS9lb3ExVThhWERzVlpLOUgvZVBMMFNaY1NRME1lMkh3Lzkr?=
 =?utf-8?B?QjRZb2FRZk5JTFVDTnVsTGlUWVdxUFBzYkxsZkpYU2o3MGlwMFNYa000YXJI?=
 =?utf-8?B?Z283Y0gwQ0dCSkhqT0Q3RXVwemhjRmxYd01Pb2Y5ai93d0s3THZmRzJmeUQr?=
 =?utf-8?B?bk5PTTNONmV6dWVwMDhNcUw4cHZtaEwraXBpc1lyVkZZNThEZytKdXhiUDdo?=
 =?utf-8?B?TUl1aExFdEZrQ25CVmQ5UXZXcmVBVWFCUXA2OVVBd2FURWNHWTlEMHFGd2s3?=
 =?utf-8?B?clcwc3hrMGYzaEx6VDluMEFVdHRXdEFHV1lrQm1ESWRSb0xMREZzZ25yOEU5?=
 =?utf-8?B?ZmtBTXZQOTJDaFR0cFRsVWhrTXhHcHpscGVrZUZ3U2F4YXdUc1FabjI3ZUk3?=
 =?utf-8?B?WExHRWd1emYxNk50aHlEQzBzOWRxYkc5WldGalpiczE2UVEraHFaV3J1YXpV?=
 =?utf-8?B?SlllK0pUVkUxaE1OTm4rWDhNMysydUp6YlJENVpMUWhWay9YeS9aRzNxYUNR?=
 =?utf-8?B?OHpWcUNMYTdGNDduNGJWT28zQktSNDhucGwza1ZHRU5pQ2tiaFA1azBoMVFO?=
 =?utf-8?B?dXg0bXJlNUZJV05iSS9xdkUzalpjc2t5cDBQSXo3SjBIS1crREpPSk1oRmtt?=
 =?utf-8?Q?gkuY0bVhNPJxA?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <999A81BA3379C84B981191E8B8213BB0@POLP291.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c19955ab-4c95-40f0-e50e-08df2227bba0
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2026 14:56:55.6235
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA1P291MB601953

VGhpcyBwYXRjaCBzZXJpZXMgcmVwbGFjZXMgdGhlIGRlcHJlY2F0ZWQgc2ltcGxlX3N0cnRvbCgp
IGZ1bmN0aW9uCndpdGggdGhlIHNhZmVyIGtzdHJ0b3VpbnQoKSB2YXJpYW50IGluIHRoZSB4ODYg
QVBJQyBjb2RlLgoKVGhlIHNpbXBsZV9zdHJ0b2woKSBmdW5jdGlvbiBpcyBkZXByZWNhdGVkIGFz
IGl0IHNpbGVudGx5IGlnbm9yZXMKb3ZlcmZsb3dzLiBSZXBsYWNlIGl0IHdpdGgga3N0cnRvdWlu
dCgpIHdoaWNoIHJldHVybnMgcHJvcGVyCmVycm9yIGNvZGVzLgoKSGFiaWwgRXJlbiBUw7xya2Vy
ICgyKToKICB4ODYvYXBpYzogUmVwbGFjZSBkZXByZWNhdGVkIHNpbXBsZV9zdHJ0b2woKSB3aXRo
IGtzdHJ0b3VpbnQoKQogIHg4Ni9hcGljOiBSZXBsYWNlIGRlcHJlY2F0ZWQgc2ltcGxlX3N0cnRv
bCgpIHdpdGgga3N0cnRvdWludCgpIGluIEhQRVQKICAgIGNoZWNrCgogYXJjaC94ODYva2VybmVs
L2FwaWMvdmVjdG9yLmMgfCAzMiArKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgotLSAKMi40Ny4z
Cgo=
