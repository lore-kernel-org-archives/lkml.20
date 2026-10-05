Received: from WA2P291CU004.outbound.protection.outlook.com (mail-polandcentralazolkn19012049.outbound.protection.outlook.com [52.103.53.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744F04C043C
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 16:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.53.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791217945; cv=fail; b=CclH/uNZSoDeTNu5Q472EPRJtGmxH1luryktw47tQVBouhAV5f7ZRwgcfDesE+tyqxUUFmAvkiqkpWXU+kNM/1DKQo3ulrWsX2g/yS89vmVUUlzzE0jr8Cq3Ka/JN2+yXt6IKENp+ks57VcHEdJAU8+WQWAhLMyWS9Lvbwk1mvk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791217945; c=relaxed/simple;
	bh=/goVjJ6857BU6yal9yWG58411G2jLy8ojGguV6YEYOk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pM2B8QhMj/MUFA9BzVw+/S2Zt5+EWKGuXbHSfRltei/SUNgYR4sXoIR9C52oHVpJ7+pVsfIujFbaJcIQiyD3LKQyaICCq3X5EGoNKlQ5Z2qF0hnxZ1GR5nhtL6SbuySWBbJwk/pN1WKnK5WWRLMknuKMrgqsmssVuqmpKwK2s/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=WWbWkBpK; arc=fail smtp.client-ip=52.103.53.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="WWbWkBpK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GlCOA4jyHImgseG8shw+N6YKOuFXDj6/21MZskInI7EogigXT9q5UEbmuhZCZeR+2PC07Bevx2J55b8Y6MmmUad6on2ZOnLtphLYMiDaWQTU+FdaMhemt5hKXq3EJ+IAQTSZcwT1HnoPdfoZ7fa1J3k9MDG3F/cnetwfKc2EBRpGP+kLIyAI+qUow18VIcabICZHfriVAkTbdM9YkmTbTSmAQzpGvKDpkZ9NmFR3CXOQeoVHamlp0glhLqMzwNViRBO2fiGm82KQWwIQ7AmlLh3oFyu8rW5TtkQbG0x0cebwpHnKDOYwkykhif1jRomHDzj8G0ZTm/xV9P+2Uh+Zrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/goVjJ6857BU6yal9yWG58411G2jLy8ojGguV6YEYOk=;
 b=pQMYlf8bOo73q8MIczVJdOc07UjNJCPt5wwxqEtrsr0y5qhAUuiqfNDLCzhqgJB1PHNVL5j2wZAhuckhl+BdF6ZJvmsx7qRbim1Ao0WLutB0d08p6wXpVkUyhRKow/hImxyu+qPhp3KdL7h0/CnNMqwqFzbrehBWhberh+xzI21K/F/Qh/f+UH56EMsJV38oeeke3/bua4QmyNKm2nzpJn4fQUOEONC6iOyRtTh+dWQOJfH/oQxzWpKxopZYatg6m0T02Hg5ZREWF5aCj8IyN+vPwqcsdMXrNNXfCKBlZ4NSJ/6OngksKij0pBuFFk0jiAb8dAGO4WqFHBppMC9FeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/goVjJ6857BU6yal9yWG58411G2jLy8ojGguV6YEYOk=;
 b=WWbWkBpKR/cmD/704C/45/PdYQK7F0RKEst7TtoMVeEm9OxffW0agyUmgh55MCee4XiHKdbiSiqhz/GLXMYg1zMty02SPubvHOAn9g8geSA13J3bCVv21qZe9hpPaicurdsg7daSyehDNf1FsYcFvKNDPXVZRl4sas0F/yqyvjTQHdYkiNE81JFWH8epOwXjCH/p0IqYLXQymFeZYEa8TDZSqtD7is30oBAOix4GDVYtVhSsa9uC+exmcyvN4YzxczmjVmjzEs258a7v4Zl3k4beo1uPyRxHLM5cY4EYe4CjuqU3avSYw1naCOzAi3b/HFDp5dIwXGQE2VqDX3jo1Q==
Received: from WA2P291MB0187.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:26::11)
 by WA0P291MB101427.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:43::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 16:32:21 +0000
Received: from WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
 ([fe80::996b:1617:ce96:404]) by WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
 ([fe80::996b:1617:ce96:404%6]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 16:32:21 +0000
From: =?utf-8?B?SGFiaWwgRXJlbiBUw7xya2Vy?= <habilerenturker@hotmail.com>
To: "tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com"
	<mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org"
	<x86@kernel.org>
CC: "hpa@zytor.com" <hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?utf-8?B?SGFiaWwgRXJlbiBUw7xya2Vy?=
	<habilerenturker@hotmail.com>
Subject: [PATCH v2 2/2] x86/apic: Replace deprecated simple_strtol() with
 sscanf() in x86_fwspec_is_hpet()
Thread-Topic: [PATCH v2 2/2] x86/apic: Replace deprecated simple_strtol() with
 sscanf() in x86_fwspec_is_hpet()
Thread-Index: AQHdVOcYk6CwtgQTYkyOfPEntft28Q==
Date: Mon, 5 Oct 2026 16:32:21 +0000
Message-ID: <20261005163213.6515-3-habilerenturker@hotmail.com>
References: <20261005163213.6515-1-habilerenturker@hotmail.com>
In-Reply-To: <20261005163213.6515-1-habilerenturker@hotmail.com>
Accept-Language: tr-TR, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: WA2P291MB0187:EE_|WA0P291MB101427:EE_
x-ms-office365-filtering-correlation-id: 5c23e138-7dc7-40f8-ba9c-08df22fe3b27
x-microsoft-antispam:
 BCL:0;ARA:14566002|55001999006|8060799015|19110799012|8062599012|31061999003|12121999013|41001999006|24021099003|38102599003|15080799012|25010399006|51005399006|40105399003|2607281247196008|102099032|3412199025|440099028|1710799026;
x-microsoft-antispam-message-info:
 =?utf-8?B?QkExb0FaSzl6aDJNUHEzV21FalNPYjVwcWErNFkvQ1hPWHp1bllrL0dlMkdT?=
 =?utf-8?B?V0FQL0V6ZStWYzB3bFE0Z0VybjUrS2FSK3RaTnh4YWlHUjdqQytwMXpGNVAv?=
 =?utf-8?B?ZWpzNE43RGVWUDhtM243SW9zdG5WYm1Za2xsUVVSV0gvdlhZWDB0TDUrOG1r?=
 =?utf-8?B?bHJWUFFZeHozdlhvWGY1NXQ4YWhrQzYyYS8yWWZFeTNwb2lJMXZkMUM4SU5J?=
 =?utf-8?B?RWNBTVNFTDloUVhUelVJMmVqNDJWUWNmeWxYVzZBNTlsWEQ0RVpBZERQWFRh?=
 =?utf-8?B?ME4yOHdtcTRwc0tMc08vbEdQOXVGYXNpSm1MK3VTZWRPak4rdld6V2JxdFgw?=
 =?utf-8?B?QkhRN3o3eVptK0lkK255eHNqSGpMYm5SQVI2ZVZLSWZ0YXpjM2QxNzMzNE45?=
 =?utf-8?B?cG5xQVRmb2l6SEVtaW5teDFXTm9DYiszRVVnTGJFRTRvRlhyV3RWaFBINkNT?=
 =?utf-8?B?SE1xMFMxWVBuRnNPLy83K2hKNlFnb3ZPV25aSmUvR09aQ0RLRHBJL09MaFlJ?=
 =?utf-8?B?bzRzdnBHOU1ORU9qaVBhNTBoS0UvRFV3NUpCQUpYWkIvYWkvc2Z6U05Gd1Rt?=
 =?utf-8?B?eWpHWEpNKzVHMDRQUHJrbUxpYm5Fd0MzQU9WQzlQaVhQRTBJam95alloS0xC?=
 =?utf-8?B?RFJSNnlvOHRuT0syRW05UEdkbjhMSzdDeDVpTVlyaEhZRjEya2RDQ0FteTNR?=
 =?utf-8?B?NEhWNVhxLy9wc2d5YytaQi91ckFJNlI2eFQrRkdHVGdSTnNEVzBNdmRLTXF1?=
 =?utf-8?B?ZG5FcS9oc011ZGdtWlVNdnd5a0RnandnWS9TT2Rqckg3Z1BrbU1tUHdaNHoy?=
 =?utf-8?B?VXZzNXJSZHVkMWVKcTI3WHNnK2wrRmxlZWk4RFNMTDRVd09mVERLQXd0dXlI?=
 =?utf-8?B?RjAvSHFNU3dndFBnUHJqMGlPVEtXUlo2VytjSG1weTF2Qm0wU3F0Y0xIWVl6?=
 =?utf-8?B?b3laTk11Ylh4OUVnOUk1VklMNTB2RmlQSnZMbUZTb2VsbVp5c1ExQjB0WGdG?=
 =?utf-8?B?Zit6T2NKSUx4V3RlR2N0bUJ6OFhIYitWQXN0WGdRVjlscmdsald1TWlQQmVJ?=
 =?utf-8?B?KzZ4RWhZbElJTXhvdU96OEtQTi9HYzc3eG9SQ1JVNi9ndi9oQm1PWStPYW5x?=
 =?utf-8?B?MUgyQjBheGdTWnh0aEM1czBnQmpsb3BHUnBTNVFWTFRTMnFMbDEvcE5vT0xN?=
 =?utf-8?B?VTRVUXI2bnY1US9WZ0NieHdjVFZ5VFZMeW1uRWt2NUNMakZtSTdXUVV1KzY2?=
 =?utf-8?B?V2pRNXZTOHc3ekFMRGV2WEk2NVFsVitnK3IwYkIxMUhaK1UvM3c3K3FVd1RP?=
 =?utf-8?B?WWFyWCtQa3Z1OVhnTkR4REZBZzdYR2gveUZBdkk4WXRUWVIwMS8vNVVhRWx1?=
 =?utf-8?B?bG4wSWd4cnEwMGhJaUVFMUl1by9ud3l6bFF0aElIMFFha1AzU0xYZkdLL1g0?=
 =?utf-8?B?ci91WFl6d0RUazhwM1Fwa3pSQk5wNEZiaXRodW9ra0dZZXZHRDJISi9XY09h?=
 =?utf-8?Q?QVDG5w=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WitvUW9jU1E2dTJNNUxJUklZdGJmTDhNRFhYbkYrOWNCL3EySmdZeXk4S3dU?=
 =?utf-8?B?S25ralQvN21jalhrczJibmlkby8rcXNHb3g4NWhONzhEaHk4Y2c2VGthellC?=
 =?utf-8?B?cVFmQnpJSDBSWEUvYkhWU0sxQXA2Tyt6TWRvbUE4ZU9TOWp5dU1KTlpWaTgw?=
 =?utf-8?B?NkJORWhrWTU3Zk5UM0ZWdDZ2bE9Mamk4d2Izanh4WnpscWVBL0VqbzdCVVVi?=
 =?utf-8?B?MlhzS3Q4d1pGdzFCQ3J6ZHVzYzkxc2J2STl0YkJpK3F4d1ROdE8zdElNbk8x?=
 =?utf-8?B?dm9ZUmlYQytkdFFzenRjVFJ2RDJSL2RSMmZQQTdlbm9YR1Y2aEhIZkdFa2l1?=
 =?utf-8?B?T3E2QXNMaWVDbE9ZU0g3cWlsVGFnNGVHZk5tVDRvQnVJVSs2b09OTFZiQkly?=
 =?utf-8?B?UEoxbzhtZEJnQjIrSm1NS2FvamxoSUJHZUUrQm9ubGd5UkluUU1KNmNVUlN3?=
 =?utf-8?B?dGU1TGJyeStJQkcyNWFmRFU2K01ONEg3OVVSa3dmQ0NiTmdWRk51ZWg2eXc5?=
 =?utf-8?B?S0QvVTJKdzh6eU1EdUU0UlFrQlhESG1hU0NyVzNIZDFjTGlXVFM4ZzRodlpS?=
 =?utf-8?B?c1FScWYxSUl3V2VqV2Y1bTk5aUJnL21ZWCthOW9Xc3hEMWQzbUIrTElFdDVi?=
 =?utf-8?B?eTVXa2tvNm9ZU0RGNnMyTDhPWktrd3FFTHBJcWRacE1BS0NEWjU2aFczS28y?=
 =?utf-8?B?QVBuOERxaTRUNUYzV1RzOHByTXplamxQdFVUNWRvaGhZQXp4UVp3Q2dDbHFx?=
 =?utf-8?B?VEtacmQrUmRlcmU3ajVSYzRXNnNsWEZzcW5zbnlRdXBpaXN5a3Rmd3NvUlY4?=
 =?utf-8?B?d0FtODcybWxFYkl6U08rZzZzK3RVMXo2V1RuZ2VLY0I0VW1FYi9Fbm9MaEJ0?=
 =?utf-8?B?bHdwdDMxVkV2NEptdkt4N0JZdVBabHJ4NXI5MHhMbjhNZHdNU09uUmJldk5W?=
 =?utf-8?B?UGw2NW9UbWEwMTAybWREODRjOG5HZjh3TDc4THFiZXU5ck9RNWVwUFErOWg3?=
 =?utf-8?B?ZW5HRmY4WHk0REVjNjhkVnNwSDh4ZUUzOUowSlBtRDIxK3BPTFA2R0c0Q1A4?=
 =?utf-8?B?RnhrWDViOGplZEwzTHI2bmcyNkdVVFdyd1N1dXNvTDA5a05YQktuTFliSFhU?=
 =?utf-8?B?UGQ2enluSGp0My9XNHk5UGFwbDJ1RXBpdFBFdXo5ZkZqYnN0dzhUNzFDTWlx?=
 =?utf-8?B?S01ERi9DeWlzRmZlbzNWZXQ5ZS9sMmVUc2xFSzJrVFFYSU51YVNpMlhmQmlC?=
 =?utf-8?B?VTc4MEh1VzhwRUtTa0dqbWswY2J6MzB4UzVLZU5XV2pDRTVJV3pFS1lkUW5I?=
 =?utf-8?B?dVlyQVJXeTNxcFBZRldJRmdLRWFQNERna2lNZUFiZy9rZkZSTjRNNGhHdTBp?=
 =?utf-8?B?T3J6TjBzeWY4cmErZDVlUi9JZDV4TnB0b2p0V01Kbk9QRTg4Sno1RTliOTRB?=
 =?utf-8?B?NDU3K0djZk5MclRPS1hZUlNRYmdtdXphdHN5cktuYkVMaHVUZUY5TEw0c0Ev?=
 =?utf-8?B?V0cxU2VONnZxdDVzRXlpVEo5cFlZdnR3dEdPZnFEdmJ4WGwrb0RRdkx3S1ZE?=
 =?utf-8?B?a1hpYTVDSy9IMkxaelhTL21CZDA2TGtCcWc5NzhpT0hybUZMYXBweUV4b3Q1?=
 =?utf-8?B?RmNYekVnM3UrMFJYNWRjb3plYzhOd2tZbm1WbWhoaTllUmhVR3NKL256bmd4?=
 =?utf-8?B?TkJxckpnU0dTTE82cEdUNTVxQkNMOXBrakVMVVJnN2hFMHVxa2NEemhoYWZt?=
 =?utf-8?B?anVobzZ3MVZqd3Bla202OS9ROWRDdzc2TlAwRWFFTFVLYjJyRC9DU08vNEpk?=
 =?utf-8?B?dWtvSUg5cGlSV3dSc0d2ajJXQUl1c0lRV2xCL1J0THl6aTdneHRQWm94bVQ0?=
 =?utf-8?Q?Yakuv86I4qyIn?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <309FE884AB2A3840A23A9797B7A79E97@POLP291.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c23e138-7dc7-40f8-ba9c-08df22fe3b27
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2026 16:32:21.9261
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA0P291MB101427

VGhlIHNpbXBsZV9zdHJ0b2woKSBmdW5jdGlvbiBpcyBkZXByZWNhdGVkIGJlY2F1c2UgaXQgZXhw
bGljaXRseSBpZ25vcmVzCm92ZXJmbG93cy4gUmVwbGFjZSBpdCB3aXRoIHRoZSBzc2NhbmYgZm9y
IHByb3BlciBjaGVjawppbiB4ODZfZndzcGVjX2lzX2hwZXQoKS4gQWxzbyBhZGQgZWFybHkgcmV0
dXJucy4KCkl0IHdhcyBkZXRlY3RlZCB3aGlsZSBydW5uaW5nIGEgc3RhdGljIGFuYWx5c2lzIG9u
IHRoZSB1c2Ugb2YKc2ltcGxlX3N0cnRvbCgpIGluIHRoZSBrZXJuZWwuCgpTaWduZWQtb2ZmLWJ5
OiBIYWJpbCBFcmVuIFTDvHJrZXIgPGhhYmlsZXJlbnR1cmtlckBob3RtYWlsLmNvbT4KLS0tCiBh
cmNoL3g4Ni9rZXJuZWwvYXBpYy92ZWN0b3IuYyB8IDE3ICsrKysrKysrKysrKy0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9hcmNoL3g4Ni9rZXJuZWwvYXBpYy92ZWN0b3IuYyBiL2FyY2gveDg2L2tlcm5lbC9hcGljL3Zl
Y3Rvci5jCmluZGV4IDFhMzBiNDdjNS4uYWNjZDc3OTdkIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9r
ZXJuZWwvYXBpYy92ZWN0b3IuYworKysgYi9hcmNoL3g4Ni9rZXJuZWwvYXBpYy92ZWN0b3IuYwpA
QCAtNjg1LDE0ICs2ODUsMjEgQEAgaW50IHg4Nl9md3NwZWNfaXNfaW9hcGljKHN0cnVjdCBpcnFf
ZndzcGVjICpmd3NwZWMpCiAKIGludCB4ODZfZndzcGVjX2lzX2hwZXQoc3RydWN0IGlycV9md3Nw
ZWMgKmZ3c3BlYykKIHsKKwljb25zdCBjaGFyICpmd25hbWU7CisJdW5zaWduZWQgaW50IHZhbDsK
KwogCWlmIChmd3NwZWMtPnBhcmFtX2NvdW50ICE9IDEpCiAJCXJldHVybiAwOwogCi0JaWYgKGlz
X2Z3bm9kZV9pcnFjaGlwKGZ3c3BlYy0+Zndub2RlKSkgewotCQljb25zdCBjaGFyICpmd25hbWUg
PSBmd25vZGVfZ2V0X25hbWUoZndzcGVjLT5md25vZGUpOwotCQlyZXR1cm4gZnduYW1lICYmICFz
dHJuY21wKGZ3bmFtZSwgIkhQRVQtTVNJLSIsIDkpICYmCi0JCQlzaW1wbGVfc3RydG9sKGZ3bmFt
ZSs5LCBOVUxMLCAxMCkgPT0gZndzcGVjLT5wYXJhbVswXTsKLQl9CisJaWYgKCFpc19md25vZGVf
aXJxY2hpcChmd3NwZWMtPmZ3bm9kZSkpCisJCXJldHVybiAwOworCisJZnduYW1lID0gZndub2Rl
X2dldF9uYW1lKGZ3c3BlYy0+Zndub2RlKTsKKworCWlmIChmd25hbWUgJiYgc3NjYW5mKGZ3bmFt
ZSwgIkhQRVQtTVNJLSV1IiwgJnZhbCkgPT0gMSAmJgorCSAgICB2YWwgPT0gZndzcGVjLT5wYXJh
bSkKKwkJcmV0dXJuIDE7CisKIAlyZXR1cm4gMDsKIH0KIAotLSAKMi40Ny4zCgo=
