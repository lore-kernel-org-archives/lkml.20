Received: from WA2P291CU004.outbound.protection.outlook.com (mail-polandcentralazolkn19012054.outbound.protection.outlook.com [52.103.53.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBA346A5F3
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 14:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.53.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791125829; cv=fail; b=laCWWfSJbg+fWVtYNtUYjodOTQ4rqncIJKM7o2gzapzfMpiMzBHbAAevft9J4rY0Pe9DPbtoSvKVDlde1pdQstNsWnfNsacmxCIy6dDHN6yJqPojGLvWAigeE/TCmjvZZSAJywFbgGs+LXtaM+EOJdZl4hVHnGkgwvYvW8SP80E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791125829; c=relaxed/simple;
	bh=+9ibwPlcJc4kokBy7czkeA1qCEBaqkkleyhRH6VMT+4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mBo0VY6GC/zPgb2io7DbSSb4fKHcnBeM/ghEviT+Yq0ORWBlfZ3LjnOstNjeSwLml1R6l2ZAeidzpD7v+EvgoX1X7RwQFfRfLeNnLyY3XO9av6vG2pD+cizYs096m+0dWtOHDDW4Rb1r7ytneCG5y0TOyUTeAz9NJhecluknPUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=mOx07Nso; arc=fail smtp.client-ip=52.103.53.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="mOx07Nso"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KN+fQ8uDpNEou5ZBASDw5DiomY2NdjCyMVyWj7Ko6AB5j1dsMlY3m74FTtiqsRrkRUhWLuIYY2i2NeoU4TKtzprsUeAqTj9zT/VHC1wi+sR8Udz3plo3+L5x205vMo/MHwOA2xotg1F+3q6mjUV8XDfocqyIy13uIBIpLRFqWnga1jvifY5p+0U8PEDO3xufWqZ8M8A9ExB0yCCDJCDysXZQe4jPCWewO1yc8NUGX3r2Db9F067840BTyCU7l3n7WJOSvsnzAy12k+qyv54QvRRiFwmLdN6EqKri4pB6uZ61oKcXwGR2D6/5WbWmMDEeGDU277Y+TYwG6PjRJBS1fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+9ibwPlcJc4kokBy7czkeA1qCEBaqkkleyhRH6VMT+4=;
 b=MipYtwpVeFZutP8XvXGL5cKGGKQmdYK54xdBS/B+PM5N335R2BDiTXu0J6AIhlBYfYv2VJ1EKSXNZ/zAlHjAy7pXpNV+XwfDJkWaZsDrgxz8wVkUbV7NEzs/JkaNQaOYdojkSWMFlhRcjMUktXNoF8swiyyw+pjmC4fydhIjXJYTWBNsvx+mp2tgtgpnPHI3dIDBW9Co25wvuXWU5arP1aM42fzUMimFsA8jAJl/wsQxI19PA3fMzpsdFU4iD2Evweno4TCqZaOD4MsxxupaEYR2UExsD884/Hjgl4oplcbbABX+Jvg1NEQuH+FOiyLMraTrc9nBHVZl5Z4hbnKnWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9ibwPlcJc4kokBy7czkeA1qCEBaqkkleyhRH6VMT+4=;
 b=mOx07Nso6s0aPS9Xqj9cD1sZN3+8kv7rzoduv6M5kH57fRX+/RxarKg3P3GkJQ7uh5bMbdwd3JOOXThzLZOpe2nzGXTDmcixpedCDbYCtDcHb0Tbu/qXQrKkloFpJt/8hqf+VVJaJxyL9Gv4wWQz2I+19D/iC1xYv1+DaKK9w+W/n38RSowUkY1a+CV1xOkviOvcGBGF8kGtASOdanFQBx0FVzs1dhbBJjSMt1W1abz/nBJJCv06yn1nxqJUP5AtZbF/RrRws91t9VzANLTopShq4IvEZOXhreGOYNpt0kM7HzOdqxNx2lCN/ky+b/RKWIYBUh+Xxqr1JdT1VHXlWg==
Received: from WA2P291MB0187.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:26::11)
 by WA1P291MB601953.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:4b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sun, 4 Oct
 2026 14:56:58 +0000
Received: from WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
 ([fe80::996b:1617:ce96:404]) by WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
 ([fe80::996b:1617:ce96:404%6]) with mapi id 15.21.0472.016; Sun, 4 Oct 2026
 14:56:58 +0000
From: =?utf-8?B?SGFiaWwgRXJlbiBUw7xya2Vy?= <habilerenturker@hotmail.com>
To: Thomas Gleixner <tglx@kernel.org>
CC: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave
 Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, "H .
 Peter Anvin" <hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?utf-8?B?SGFiaWwgRXJlbiBUw7xya2Vy?=
	<habilerenturker@hotmail.com>
Subject: [PATCH 2/2] x86/apic: Replace deprecated simple_strtol() with
 kstrtouint() in HPET check
Thread-Topic: [PATCH 2/2] x86/apic: Replace deprecated simple_strtol() with
 kstrtouint() in HPET check
Thread-Index: AQHdVBCb3JC9WTUwTEmOs7GknL/7Vg==
Date: Sun, 4 Oct 2026 14:56:58 +0000
Message-ID: <20261004145650.17881-3-habilerenturker@hotmail.com>
References: <20261004145650.17881-1-habilerenturker@hotmail.com>
In-Reply-To: <20261004145650.17881-1-habilerenturker@hotmail.com>
Accept-Language: tr-TR, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: WA2P291MB0187:EE_|WA1P291MB601953:EE_
x-ms-office365-filtering-correlation-id: 5b95e08f-1d8a-42cb-f0af-08df2227bd8b
x-microsoft-antispam:
 BCL:0;ARA:14566002|15080799012|38102599003|24021099003|41001999006|55001999006|51005399006|8060799015|19110799012|31061999003|8062599012|25010399006|40105399003|2607281247196008|102099032|3412199025|440099028|1710799026;
x-microsoft-antispam-message-info:
 =?utf-8?B?aDJGdDRQNVozT2JWRnJUKzR1a2pwYklsZG8zcFFMZUx3NnE2b2pGaUdzZTFC?=
 =?utf-8?B?eTVyL2YwekNodU5CNGVQbWN3Wks4aHdLQmZ0c09URUYxNDFpeDkwM1YrMXNJ?=
 =?utf-8?B?d3BJK2lNMm04NE1VaFVXZUZUSlRmdzljNlRmc051bjkreForaXBGRytBUDNG?=
 =?utf-8?B?a0J3cVZFOXpNZDQybno5T0xEaElwbmFUa0E1aFBRYzQ3eEFCd01CbDhiRXYy?=
 =?utf-8?B?T3g0bUxJWS9Rd3NPWnZhYXZOVForbFo0TURLZ3ZxbE9oZ2lvQk8xZ0tuU1dG?=
 =?utf-8?B?T1VVS0JmZU5LVzB2b3RyN3R1QTFuemVwVzAzTnJhQ0M3QlJ5NWg1T0lXeFlP?=
 =?utf-8?B?eVhHdndFUENMVDFHTlRFQUQyZXUzaEwyZFJVTStwK3hManlQOTlLeTRDTUJh?=
 =?utf-8?B?Tm9XTVRJcXV0MGJ0Y0ZZOUNLTkc3eSsxeDgvZmthSmI2NWwxZjJPd0lPL0tJ?=
 =?utf-8?B?TGp0QUE4U3NkemN0eG83cGx2SDR0d0pucVo5blNhY0NQTkZJay9mNUI0N3NX?=
 =?utf-8?B?aUhFdkptMlZoZnNBSHYyTjFEWjdhNktoK2VRNjJMUzlyTzBISVZoNEk1cVhr?=
 =?utf-8?B?c3BnWUFRQzNzenAySlY5SkdMVlRDSDFYZ0VKb0ZKRk5OTDVkRXQ3V25Zbnov?=
 =?utf-8?B?eUxFMS9pUWc2eTQrckxmTXZVYkE3ZjhpZTY4NkhPeUdmQmhxU2FJZ0p0b3Nl?=
 =?utf-8?B?aHN0Ti8vNEMxRXFNT2tXdnlBWEVaVlNoNzdQcWUwcE9mOWtZQWQwek1IKzN1?=
 =?utf-8?B?L2l0YVVhU2NqNEhJMURVRTQvd1RHREYrSVRSNTUrSm1aNW10WXU4MlBKeHcx?=
 =?utf-8?B?OXAzVVZ6Mm5wRWplMGlsdXpKb2lJb0NIKzQ0ZEJJdkFOcXJpNXVYUFBXZ3ps?=
 =?utf-8?B?bnNmVjdRRmswMlFFNjRYR3BDR25OaURLS2VGUmZSdWVMSE13Q1N4U1Y2ajlN?=
 =?utf-8?B?Yy9MQUpHcUREc3hpeEJXRlljVWVYTTVQTE9YQXZTcXRQcFhBUzhBNXpZcld4?=
 =?utf-8?B?amlIeENaanRHWTdjalIzK2ovakRrU29ndFFrcmRsQ0Raby93RGxPb3pvUUFH?=
 =?utf-8?B?Z0Y0NjBIWUNuTFo3cTFxaS9RbDduS00rcDIyRnpXcDR0WWZsYzlFeUkxNHps?=
 =?utf-8?B?VkRNejVJaURPYTVob1p3Ujg4YjNrdFJmdkdnaTZ1VzFVdXBIOG8zcE4ramxv?=
 =?utf-8?B?UWxwVDUwK2c5RUdwM1RGbDZ5aGF1ME9zS1QwcjNpZVFRQy95akUxbmtPNnM4?=
 =?utf-8?B?Nnk4dDlGbm1YVEl6QjVTREZ5RFRUTkpNRURsMmRlbUhVV3hqNnNyaWJEd3dk?=
 =?utf-8?B?M3FOOUp3OUhaOFRZdDViQnNsVzhoMVFzY2pib1BBRzhEVWtKSUxHdis3T1V4?=
 =?utf-8?B?WERMM2p2Z1VWU3ZpRHFIUnBURGFoKzFDWEdBcmZmOUpLcm1jWkEwbjdaVFBX?=
 =?utf-8?Q?AjyJzNr3?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VXNIVlBramJpazIwOTRwNTY4ZVg1OERIenIrZ01ZMWFZOUs0dVJZOGxpTWhx?=
 =?utf-8?B?ZGFFQUZ4QVMvQW1nSnFOU1Ftek1pRlFXK1dIeUJxVjdTbG8zWS9TN3ppRysw?=
 =?utf-8?B?bTRVeFVFUW5HU29iQkpDRXJqdGFsNjhOR2kybGxRYnlFQUgzclVEdUFzazNH?=
 =?utf-8?B?eU9CM2hiZ05ZckNwTEx4RUdUZWdiblpVRExqTVJKcWNOb0pYSXcvaHFrbDBR?=
 =?utf-8?B?VTFSeGxRcFpnbFduTXhuQUIyWUt4SzdRczE3VDZLdVFFOHBaVFEyaThockd2?=
 =?utf-8?B?dmhRWisxakVJTjViVE1KV09YNmxMMnY0VFVLdTZEN0plUWxnOVE4S05hR3dY?=
 =?utf-8?B?SDRuT2lwalgrOC9rSGlHcjM4NWNrZXhPZDlmY0VxZFIxdFR4TWVpRnQ3ZDZM?=
 =?utf-8?B?NHZ5UzFrZmJPZzZPNFBOSzE0TFVkZGlXOWNPcENuenFQcVJxay9JajZTMEFP?=
 =?utf-8?B?TmwyallzeTNDenkybUN6eHZmZXVReXNwZ0dtVWNKdi9BTnVadjBoQmxGRnNC?=
 =?utf-8?B?d3N3S05qNG1lVW1nYXJIQ3kvczdxU0Q5aUZ3OHNXR2w1VzFpNjIxdHJsVUJv?=
 =?utf-8?B?U1UwbmhSSWlzbkZkSVhDU0pxVzkwNUNqaGFsL3RFK1BhQXR5UmdrM2paSVZ5?=
 =?utf-8?B?em5hamRmcFdaYVRxdmdWWDU3UHpvYXFUcnFoYlo4dCtwVGFPSzAxem4zRTdE?=
 =?utf-8?B?Y1RSZlQ3R2lOQkppWitPTUVicE82SE9Calg1ajNJU1BGd3FNTHZ4dVJvM1E1?=
 =?utf-8?B?dlQ3NUp0bXA0M1JkT2x6Um9VMGVrUnJHQUpZS0hMQzcvVUR2NnVnQlhSdG05?=
 =?utf-8?B?bC9aeWh1aXFJUzV2MWNUL1JwRnFSSGVVR1BMcUYwTXBIUDFLZjUyWmtwSGNB?=
 =?utf-8?B?NTFDbk1wN1NFd3dLSXR2UFR0OU1NczVFL0kwaVJxalEzcit3UEFBSjRselBu?=
 =?utf-8?B?TTFRRk9VYWVKSmtHY0E5djBsUm1idFZRS09INnlwNWdieFo5dHdtOGc5Q0hj?=
 =?utf-8?B?VW10d3hOSjBMOVJ6aXBva2NMSWVDMTFSQktZdkQrS3Jna1lVY0QwblBYa3Jr?=
 =?utf-8?B?NmlRNkZTbXErUDd4M3Bsd3VXZkRwS2pSMXc5OWZablNCdkYvd3llNnhLZm15?=
 =?utf-8?B?S1I4M2pXRzhoaE9JNlpJUW9TV1UxRnJzYUN3R28rV2wyODVXVElFbkUyV0FM?=
 =?utf-8?B?Y0V5RzlKUVRMQ2VTWnNBRmFlY2R0V29lR05BZE1OSUthRjYwTnV3MTNRb01G?=
 =?utf-8?B?T2txbDV2blJPdjJPbnlRS3ExNFMvUmJOZ1g5V29WT3VDWUhWVnltbFBTTEhV?=
 =?utf-8?B?aTVaeUpPbElGcU05VUJKK202ZkFrUER1UzAzZ000VVhYMlBqTjFuMHdjMVNa?=
 =?utf-8?B?dWtHZTJxWWhSL0JQVXRjd1gyWUJJaTBFNkJabkpkUUFvMUJob0NRQzhXRGtG?=
 =?utf-8?B?U0txcFlnZ2wvNDQ3THYxOXp4Ykc3YS8yVllqTm5WU3dvSWtSVytMRXh0Wmgv?=
 =?utf-8?B?VXk2VkZNdm5kMUNWSU8wNkpLNDgxVndjWEIvQ3VNSXIzQ1N4d0VKZmhqVU9w?=
 =?utf-8?B?WTVneUJYclZkYUVYUTg1OHJ6RWs4aitQcjBabmh4RGxDa0EyK2dadDBGbUpz?=
 =?utf-8?B?QjFnRzg0SjEwMGExclVpcnRhcTI5QzRTUUZWVGpGTWJ0eVQrT3dmaHBuK1Uz?=
 =?utf-8?B?NjFPWFZDdnRNQ2xGSTF6ZXAxejVjckJrMzBPMmdXOFA2cVpTc3RpeEFkY2Zp?=
 =?utf-8?B?ZlFZbDJYVkFEanZqTHpkSk1ITHlNYWZiQkJvcW1MdnA1QlRJd2Nla05GS0Nt?=
 =?utf-8?B?WTFqaVNDZDV2Mkc5cTNRdUtRRjhrVnFzMnpEYlpCYzd6Z2thY0VlL3JqYmto?=
 =?utf-8?Q?H5nwpRI8EyTNI?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B5F18DC3C32EC74E83F2938DA65217E9@POLP291.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b95e08f-1d8a-42cb-f0af-08df2227bd8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2026 14:56:58.8553
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA1P291MB601953

VGhlIHNpbXBsZV9zdHJ0b2woKSBmdW5jdGlvbiBpcyBkZXByZWNhdGVkIGJlY2F1c2UgaXQgZXhw
bGljaXRseSBpZ25vcmVzCm92ZXJmbG93cy4gUmVwbGFjZSBpdCB3aXRoIHRoZSBwcm9wZXIgdmFy
aWFudCwga3N0cnRvdWludCgpLAppbiB4ODZfZndzcGVjX2lzX2hwZXQoKS4gQWxzbyBhZGQgZWFy
bHkgcmV0dXJucy4KCkl0IHdhcyBkZXRlY3RlZCB3aGlsZSBydW5uaW5nIGEgc3RhdGljIGFuYWx5
c2lzIG9uIHRoZSB1c2Ugb2YKc2ltcGxlX3N0cnRvbCgpIGluIHRoZSBrZXJuZWwuCgpTaWduZWQt
b2ZmLWJ5OiBIYWJpbCBFcmVuIFTDvHJrZXIgPGhhYmlsZXJlbnR1cmtlckBob3RtYWlsLmNvbT4K
LS0tCiBhcmNoL3g4Ni9rZXJuZWwvYXBpYy92ZWN0b3IuYyB8IDE3ICsrKysrKysrKysrKystLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9hcmNoL3g4Ni9rZXJuZWwvYXBpYy92ZWN0b3IuYyBiL2FyY2gveDg2L2tlcm5lbC9h
cGljL3ZlY3Rvci5jCmluZGV4IDJiNDZmZjdjOS4uYzgzMjI2YmE1IDEwMDY0NAotLS0gYS9hcmNo
L3g4Ni9rZXJuZWwvYXBpYy92ZWN0b3IuYworKysgYi9hcmNoL3g4Ni9rZXJuZWwvYXBpYy92ZWN0
b3IuYwpAQCAtNjg3LDE0ICs2ODcsMjMgQEAgaW50IHg4Nl9md3NwZWNfaXNfaW9hcGljKHN0cnVj
dCBpcnFfZndzcGVjICpmd3NwZWMpCiAKIGludCB4ODZfZndzcGVjX2lzX2hwZXQoc3RydWN0IGly
cV9md3NwZWMgKmZ3c3BlYykKIHsKKwljb25zdCBjaGFyICpmd25hbWU7CisJdW5zaWduZWQgaW50
IHZhbDsKKwogCWlmIChmd3NwZWMtPnBhcmFtX2NvdW50ICE9IDEpCiAJCXJldHVybiAwOwogCi0J
aWYgKGlzX2Z3bm9kZV9pcnFjaGlwKGZ3c3BlYy0+Zndub2RlKSkgewotCQljb25zdCBjaGFyICpm
d25hbWUgPSBmd25vZGVfZ2V0X25hbWUoZndzcGVjLT5md25vZGUpOwotCQlyZXR1cm4gZnduYW1l
ICYmICFzdHJuY21wKGZ3bmFtZSwgIkhQRVQtTVNJLSIsIDkpICYmCi0JCQlzaW1wbGVfc3RydG9s
KGZ3bmFtZSs5LCBOVUxMLCAxMCkgPT0gZndzcGVjLT5wYXJhbVswXTsKKwlpZiAoIWlzX2Z3bm9k
ZV9pcnFjaGlwKGZ3c3BlYy0+Zndub2RlKSkKKwkJcmV0dXJuIDA7CisKKwlmd25hbWUgPSBmd25v
ZGVfZ2V0X25hbWUoZndzcGVjLT5md25vZGUpOworCisJaWYgKGZ3bmFtZSAmJiAhc3RybmNtcChm
d25hbWUsICJIUEVULU1TSS0iLCA5KSAmJgorCSAgICBrc3RydG91aW50KGZ3bmFtZSArIDksIDEw
LCAmdmFsKSA9PSAwICYmCisJICAgIHZhbCA9PSBmd3NwZWMtPnBhcmFtWzBdKSB7CisJCXJldHVy
biAxOwogCX0KKwogCXJldHVybiAwOwogfQogCi0tIAoyLjQ3LjMKCg==
