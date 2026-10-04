Received: from WA2P291CU004.outbound.protection.outlook.com (mail-polandcentralazolkn19012054.outbound.protection.outlook.com [52.103.53.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F28F45D92E
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 14:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.53.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791125826; cv=fail; b=q3gyrwOSePtHrz2+TNbbump9+ThxMQCINE7fzC5eDIizIltZRKtLpEJkGK3RE0b0Gk2ps3Bejo2f6F/C7fji7QhqUNbJJMC+BJd5Cg6P+3G+4/qo7UyrpqSTuijXamiSiF1c/L1QoUHZwKKvyFZi7iK5e46APYEt5GGCvAEvlho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791125826; c=relaxed/simple;
	bh=TAbiCAgPQ9Z1SW5U5ldFGPY4P+NGE3xBLIL4ORckkPE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dMKOKeLUYolx1mtaGDXXvU5Rsf81PekuJgeP1ISuoOIK3ZM0PP/r25q5goS4H29RcFxKXkGVaXqwwIJExdVOlHmRCKhX6CMR1iNy44bGqb1KPRTw6fXK7VrmVjDnvHjYczZCkflB1+JTNNtoC9aQUESQUGz09SdxGxBRxBmeFj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=I8tsaM6x; arc=fail smtp.client-ip=52.103.53.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="I8tsaM6x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y0mzwbaK6OiloMpNLPOtwKJlecAiKWuJ0/9nmtWXux81cHKZKQCvhfwO6oEVgBopkT71auFcXWVYgAwiEac/Rg4Pg5VqfkXySP/GD8jJPjQQNoCbZ4jpBtcHuZADIgJ8Z1tjBofu/S83HEenLvwqb+x0PAqGmc15ea8xG8HeGFfkPCQzcky6kxy51G1WjKlCEAlvqCtXKd2OnBniKyRhTFmG2j6Sk+7Gvw4mIbjeJTFMYIl3XNlkuzoMLrMFC8Z9UFgFjGQ/YK3l12AHatf4hIZXVD/K17EGyPX4OmJW2YKRe5i7YTGPjD5EOI9VsyeKZvps15x9LCdwi6t/O3NEGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TAbiCAgPQ9Z1SW5U5ldFGPY4P+NGE3xBLIL4ORckkPE=;
 b=pJAf/gKe3KEGlf1AOUNFuuLmE+gw1J86TJo8E3Ad7EgBNZF4MiCzHk0bkAxrC/ZYu0YJW5N/5REt88RkFLUORB/vXZrz+W8Yqfp1AN38YkcnF4EpmpIUHMoYdlmNSuw4JTRmrP/AE1uKCSRMuJOthGI/xmIuXi1d73P3LSVOafUGwyfA3r3fmhhb1FMsL2fzfKOsNz4PVl82zQIPVY1SINJ/BLVCQdKXg1Z7Gqv29rJ2nI7sXx8fWWc9u2B2iImGX54OrqIuwDXx/Yci1tHJkdpfm5lH1ZKgEpUz6A/dPiOlMNZnUsxIVLudfc1hY1khMRajOkB6Qreuwrzn2K6NCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TAbiCAgPQ9Z1SW5U5ldFGPY4P+NGE3xBLIL4ORckkPE=;
 b=I8tsaM6xPw/+43aI7VDJOptQHEC9nyazHIJmNXWCIEyLwX4O5CdIGNQChO7RTruYVMmpR3QDxdsGP2PUxDLYdeiB0S/zSDP7BRqBIPjHkksfpHYOC2ZMj+UwmokIldzx8vMpjJbiLpaBHlfIWi6lb1KwtTQT+8g3nQoZl+bG6zPJpdTPNIfwzdntGWPX3n0sEhD4amRHnwA/KTHfJDX0Kqb/bdnYwBhdOzSPOGaZJIXxZAfOdxzM1jrU1tDm4/rBUkVJZvLeR7P0RaSbfv4orEa9JCGh4Yuht0lFxb/odBGABm/tUefCRx9BxMFjrv1DBLgsJNWswcBaFEijAOTmfQ==
Received: from WA2P291MB0187.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:26::11)
 by WA1P291MB601953.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:4b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sun, 4 Oct
 2026 14:56:57 +0000
Received: from WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
 ([fe80::996b:1617:ce96:404]) by WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
 ([fe80::996b:1617:ce96:404%6]) with mapi id 15.21.0472.016; Sun, 4 Oct 2026
 14:56:57 +0000
From: =?utf-8?B?SGFiaWwgRXJlbiBUw7xya2Vy?= <habilerenturker@hotmail.com>
To: Thomas Gleixner <tglx@kernel.org>
CC: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave
 Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, "H .
 Peter Anvin" <hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?utf-8?B?SGFiaWwgRXJlbiBUw7xya2Vy?=
	<habilerenturker@hotmail.com>
Subject: [PATCH 1/2] x86/apic: Replace deprecated simple_strtol() with
 kstrtouint()
Thread-Topic: [PATCH 1/2] x86/apic: Replace deprecated simple_strtol() with
 kstrtouint()
Thread-Index: AQHdVBCafCGSF2wzoUG82LY3TwLLcg==
Date: Sun, 4 Oct 2026 14:56:57 +0000
Message-ID: <20261004145650.17881-2-habilerenturker@hotmail.com>
References: <20261004145650.17881-1-habilerenturker@hotmail.com>
In-Reply-To: <20261004145650.17881-1-habilerenturker@hotmail.com>
Accept-Language: tr-TR, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: WA2P291MB0187:EE_|WA1P291MB601953:EE_
x-ms-office365-filtering-correlation-id: d096d0e3-0ed9-48af-5ba1-08df2227bc88
x-microsoft-antispam:
 BCL:0;ARA:14566002|15080799012|38102599003|24021099003|41001999006|55001999006|51005399006|8060799015|19110799012|31061999003|8062599012|25010399006|40105399003|2607281247196008|102099032|3412199025|440099028|1710799026;
x-microsoft-antispam-message-info:
 =?utf-8?B?bGxPaytVaUtxekJVLzZzVVRZM1AzSkZYVGZNdkh5Slg2cG5oTjltcE8xbmRz?=
 =?utf-8?B?SVBpZ1RHTG43R3lwTHpxUkFLTEt0WFk3M3RaWGZ3YUR6UmMxRWZHWmtybVNU?=
 =?utf-8?B?VDR5dDlhOWo3dHQ0ZlA4cnpZZ3cyb3Rxcmp6dVRtQ1o2OVhMSEFJTGFIV0RI?=
 =?utf-8?B?ZU85enhDN29rVTIydnE1YjUwZHA4ZnZKR0IyMU9sRFZCUlV1NjM1WVJqZ2hJ?=
 =?utf-8?B?UVlEbDFSdHAxNkpORWREWHRLTnJmbm92Tyt1aHNveEREamRGNFdTbTIvVEU3?=
 =?utf-8?B?cmtUU1NuUVdYblptWjJOOFB1enVFbUh5VVUvWDhLYVRwK0pkTVJkbzVJc0tN?=
 =?utf-8?B?a0JMU3hWS2loMnBqOTZWN1JJZU0rYW1vcnZ1Y21oUDhvcTZaL2RWTnVzRThs?=
 =?utf-8?B?UjN3K01waHdNU0hYU1l6ZDlUcGhMeUhUbDZ6YVA0WUN4Y0J2RDdMbHdodFZL?=
 =?utf-8?B?MGw4bmE0V3NyaW1zSEt0Yzk4YmNOWlVZVHBpdVViYjN6UlI0TEk2WFFISXY1?=
 =?utf-8?B?Ui8wSHZPVVRVSHI1QkxDNUQrMU9FVlNlUEFwMlo4QlQ0TFdjeHRjYmpSd3Bq?=
 =?utf-8?B?YldyazhXVGhTekkrdkNrb1M4UlhvT1BvVmpnZStzeWllaE0zb1ZBcXBrSWp0?=
 =?utf-8?B?RWRCOWV5dkZDSk5ONERNK1B6SlRibFJuWkVlcDNuYmF4Z2VEaUh3R0dDZEw4?=
 =?utf-8?B?TnA1bzJvN0xTcW14RjZadXNHL2QrZk5hd2VMUkF4bEhBd2NpV1VRb3R6OFor?=
 =?utf-8?B?QjVLaUNLaEpWRklxM1A4TXZrSWJrQ1grbHBCUEVxZ2tJOUxKbHFHM2ZGc1pP?=
 =?utf-8?B?Zzd6ejRIVzlZUW03UzNONmNYZVVEUTdjWmdtRkxWbTVaSXU0OHVVMzRTZzdC?=
 =?utf-8?B?OWJ0QjFXcGpBVXhxMDB0ckRNQmFQcm04dGRiYy9aRk5McDlpQkxEaENZS3F2?=
 =?utf-8?B?NmxLQXhIdkNSdmt4eERKd28rT2RmNHBhSEViekRKVG12VjA0VWJHUklLODdp?=
 =?utf-8?B?QUlGdzlGRXpQSkJ2NHZzUFJYaVRRM2NXaUZMN1NNTDhQUUcxUGFYTUUrZ0xo?=
 =?utf-8?B?WnB6azd0ck1JY05NRGZCRHBsTnhyNk5SUWhqMW1GY3k3ZFZlWTNpaC8zWGpS?=
 =?utf-8?B?eVAzT2J4U2RZNW9pVVEzK1BBWHRwVkFsK3hUdEpUUWtZcGJ6MFhLUks5RUZw?=
 =?utf-8?B?Ymx2WHIyT0JQWXJDT05IdzZCbDlSbFFmcS9HZ29xZ2FvOERjNGQyVGVmcjF4?=
 =?utf-8?B?NEtzRjZ0V0cvREFaTjE2TzhpOGw0UlZxWFU5SUhNN29nWkhTWkJPMXZLQk9X?=
 =?utf-8?B?aHRzUmE3UjNVZEtvUEVjTDg0ZTE1T0xXTlQ2SU12OUpGOGNEWG96UmRpdkNt?=
 =?utf-8?B?Mm1vQ3JSYStlMlZNdlRyQTlMbjRPZGQ5UmpnMFB5WGhwbmVLZWcrOTFmMm84?=
 =?utf-8?Q?aLSov4dW?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Mm52K1o0Qk1PMGVSSEdaMkJvWGZWZjhTTk9qYkl5bXI4ajNXOGZTRnl6ck5u?=
 =?utf-8?B?dk1LaTBsZVA5ellRbzhGSmZqV3FqbDBSQXVVWUJqN1Z6MFlWV2poRnhZSU8y?=
 =?utf-8?B?VkxvcjlqNVdKS25xM2VxYXJqd2JQekNKVU15cFhWNDhIaWIxQ2pDb2N4ejA2?=
 =?utf-8?B?UTJJNzl4TFJtMkxrUnBPMWxCMW9zNEUvSWdCV1VrWURFaE9ZT3l6V3FmR3JU?=
 =?utf-8?B?RVQ4QjZycTNrMlFuMFJYdkNvL2hhYmNFRTdqc1pnUW9rd25TY3FvTThOSENu?=
 =?utf-8?B?R2owQXRtVWZtYU12NUhzdXdsaGZDTnBBazN4NTEwZGRMUVlVNUpQYmJuWFJP?=
 =?utf-8?B?UDRnNDNvZjRXODhFZWhRQTJiZEJhUFJvOUhFQnpyZG40UkdydU55YUZOSTQx?=
 =?utf-8?B?bjdadlF0NDFZOFdITUo5RkY0YjBtZ2w2bERVNVhPcWtBRGpGemRmbXRUUlcy?=
 =?utf-8?B?bDRaaHVod1d0L3hRaVR0WGI2UjFxemY1ajIrTWczbUEyYXBHZldOaklSRUxn?=
 =?utf-8?B?TEdMK3FuZVNudUtiQnV3U0dMekdjcUoyRjJUVC9rMFAzbVFjdlZndUtIK3Nr?=
 =?utf-8?B?NGJ2ZzZiSUNNWFIvN3Q5YUFnelF5dWJxbTZ6WC9nT3Y2UkpCMTQweWZLSTVJ?=
 =?utf-8?B?d2NoL0grMW1LZFVjOXZEeGxJV3loNGxzcFZYYUR4QnlWc0NsYllEZ3BXZkxn?=
 =?utf-8?B?aXNBNGdMM0syQjd6SmZJWWN6SGRRalFmYWZ5WWozK0RramJEMVlVRXZLR0pu?=
 =?utf-8?B?ZFh6UkVJbFVDa2NRSGRIcWtYejlNMW5wQTQrRUhRN1c4NU9nRzUwM284cWs3?=
 =?utf-8?B?ZThOQk90WDRVQ05BQ0R3cG05M2dPVTRobStCTHhzRGlOVVhXWFV0bThPY245?=
 =?utf-8?B?UFgyYWxNYjIrTDN1Qkc0N0NHRHhRM1NFaFVNcGZXZlVQZURPaFYvdHl4NGRs?=
 =?utf-8?B?cmVkbHFPOGVKVjI3RGlDVTRhQkJ5YlAzSWJ6TEpHS0dtZHFYdzFQTi93ZFFH?=
 =?utf-8?B?ZXZpWmxQckdTbVZGTUlQdmRtb2pRb0toK1ZyYkRLclUvZEVFc1BiU25FeE0z?=
 =?utf-8?B?cE9aaU11cy9jVC9RN2lYRzBmN1J5UUxLaDQ3NzgrZGFmVTEySkVhaUd0cDVP?=
 =?utf-8?B?LzRxWkhZUWhZV2pFbnRWcFR0YzRCZzVOblJ4bFd5c1kxOFNBVHB3WDE3MHYw?=
 =?utf-8?B?aFNVVWRWR1VKRjI4Mys4SlJQNmZNWXhBbEx6ajg3WWxoV0hUNEtIUWowZlhh?=
 =?utf-8?B?Rk9lZ2MzZGxUcllROW5IRGVneDFwdGRQUzEvcUdDVFlHSWw2TzVUTnN2VTc0?=
 =?utf-8?B?SUhXVDFBbzFwQy9TWlUzeWJMVHhyU0dyNkttZzQ5TkVGb0tJTmNVN1RjOTBC?=
 =?utf-8?B?amlsdWpjdTRnRytyUFMvR2MwYWdFMThuL2lrZGk1Tit6czVQeFo5V3p5bkt6?=
 =?utf-8?B?L2xxODRET2pEd2tGYWMxN1V6NVB4U25tLzZDNEEwR0IwTWY4VzF5eDVjcmh0?=
 =?utf-8?B?dlUvdUg1a3ZQcmFYc0J2KzhSb0dNL2J3cDN1S2ZTdzg5Yi9sK1FXRVhEOHo5?=
 =?utf-8?B?eExMeWMvQ2F2c3pzcWF2Vm45bzlna1p6NThHSFlpOG9zaFhxNlo3dklzelRI?=
 =?utf-8?B?SWk2Vk5VelBabkcreEZ0Wk9TTFZhMEUxSXBtZ05OQ0xXdi9PT2JiQ2Q5L1Fl?=
 =?utf-8?B?MmFuenc2cUhoTWkrOEI3VGt0UWFXbHV0RjU5NWcyR1NOQVZJeE9UbWl5UTh4?=
 =?utf-8?B?Z1p6bXZTZ1hvRnRxQ3RoZkNnMmdJeHpSNjNXQ281Nnc0S1lNSUhHeUZPRUZw?=
 =?utf-8?B?ZmFFdWUxZ25mSXFtSHV5ZEVZT1JCdmVLNzIrWXJKa08zSlZ4SjNvRTZGSjVv?=
 =?utf-8?Q?FA4zb0MROvH0U?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E6F9CF3FBEFEC043A90D147C16B35C72@POLP291.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d096d0e3-0ed9-48af-5ba1-08df2227bc88
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2026 14:56:57.1839
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA1P291MB601953

VGhlIHNpbXBsZV9zdHJ0b2woKSBmdW5jdGlvbiBpcyBkZXByZWNhdGVkIGJlY2F1c2UgaXQgZXhw
bGljaXRseSBpZ25vcmVzCm92ZXJmbG93cy4gUmVwbGFjZSBpdCB3aXRoIHRoZSBwcm9wZXIgdmFy
aWFudCwga3N0cnRvdWludCgpLAppbiB4ODZfZndzcGVjX2lzX2lvYXBpYy4KCkl0IHdhcyBkZXRl
Y3RlZCB3aGlsZSBydW5uaW5nIGEgc3RhdGljIGFuYWx5c2lzIG9uIHRoZSB1c2Ugb2YKc2ltcGxl
X3N0cnRvbCgpIGluIHRoZSBrZXJuZWwuCgpTaWduZWQtb2ZmLWJ5OiBIYWJpbCBFcmVuIFTDvHJr
ZXIgPGhhYmlsZXJlbnR1cmtlckBob3RtYWlsLmNvbT4KLS0tCiBhcmNoL3g4Ni9rZXJuZWwvYXBp
Yy92ZWN0b3IuYyB8IDE1ICsrKysrKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva2VybmVsL2Fw
aWMvdmVjdG9yLmMgYi9hcmNoL3g4Ni9rZXJuZWwvYXBpYy92ZWN0b3IuYwppbmRleCBiZGRjNTQ0
NjUuLjJiNDZmZjdjOSAxMDA2NDQKLS0tIGEvYXJjaC94ODYva2VybmVsL2FwaWMvdmVjdG9yLmMK
KysrIGIvYXJjaC94ODYva2VybmVsL2FwaWMvdmVjdG9yLmMKQEAgLTY2MywxNCArNjYzLDIzIEBA
IHN0YXRpYyB2b2lkIHg4Nl92ZWN0b3JfZGVidWdfc2hvdyhzdHJ1Y3Qgc2VxX2ZpbGUgKm0sIHN0
cnVjdCBpcnFfZG9tYWluICpkLAogCiBpbnQgeDg2X2Z3c3BlY19pc19pb2FwaWMoc3RydWN0IGly
cV9md3NwZWMgKmZ3c3BlYykKIHsKKwljb25zdCBjaGFyICpmd25hbWU7CisJdW5zaWduZWQgaW50
IHZhbDsKKwogCWlmIChmd3NwZWMtPnBhcmFtX2NvdW50ICE9IDEpCiAJCXJldHVybiAwOwogCiAJ
aWYgKGlzX2Z3bm9kZV9pcnFjaGlwKGZ3c3BlYy0+Zndub2RlKSkgewotCQljb25zdCBjaGFyICpm
d25hbWUgPSBmd25vZGVfZ2V0X25hbWUoZndzcGVjLT5md25vZGUpOwotCQlyZXR1cm4gZnduYW1l
ICYmICFzdHJuY21wKGZ3bmFtZSwgIklPLUFQSUMtIiwgOCkgJiYKLQkJCXNpbXBsZV9zdHJ0b2wo
ZnduYW1lKzgsIE5VTEwsIDEwKSA9PSBmd3NwZWMtPnBhcmFtWzBdOworCQlmd25hbWUgPSBmd25v
ZGVfZ2V0X25hbWUoZndzcGVjLT5md25vZGUpOworCisJCWlmIChmd25hbWUgJiYgIXN0cm5jbXAo
ZnduYW1lLCAiSU8tQVBJQy0iLCA4KSAmJgorCQkgICAga3N0cnRvdWludChmd25hbWUgKyA4LCAx
MCwgJnZhbCkgPT0gMCAmJgorCQkgICAgdmFsID09IGZ3c3BlYy0+cGFyYW1bMF0pIHsKKwkJCXJl
dHVybiAxOworCQl9CisJCXJldHVybiAwOwogCX0KKwogCXJldHVybiB0b19vZl9ub2RlKGZ3c3Bl
Yy0+Zndub2RlKSAmJgogCQlvZl9kZXZpY2VfaXNfY29tcGF0aWJsZSh0b19vZl9ub2RlKGZ3c3Bl
Yy0+Zndub2RlKSwKIAkJCQkJImludGVsLGNlNDEwMC1pb2FwaWMiKTsKLS0gCjIuNDcuMwoK
