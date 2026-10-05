Received: from WA2P291CU004.outbound.protection.outlook.com (mail-polandcentralazolkn19012063.outbound.protection.outlook.com [52.103.53.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1364D0A0A
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 16:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.53.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791218027; cv=fail; b=pCQC61Jba8gROJKGkN7gzpg9v5xZDEYPNIqA6GYz4rniKa7Bo3UQ0pSZb846MAOYJCq4kqQGoTDsBtgJDoSshHE0UacsrVAi+qar/sdCrpRIOKTyLcAzVxka1A0xjhB35eHO8hHaCS07u4+AEMal8fRd/7Z92rjnRucv+0J7Sxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791218027; c=relaxed/simple;
	bh=w71atw+3uXUV/pvZFcTBCgO+rqERXnOcpCtvAtsUkno=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Kspnqhmh0AV55PBJxSrVLxOmyRoPJz3Jb9ir2KZr7dNaTWuVIX66ldnMCZFxGua/csuYS784/QIrFbtbsoy7gsdQrfm2N94Kd1l3iv8WJQBTWWPkWa8/adbYYrRbBbI7g17XDoX87SgHM55b6AAy9B9a2apHNx1p577VH+ovsyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=MbbKHOrR; arc=fail smtp.client-ip=52.103.53.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="MbbKHOrR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hpt8GUEZo/HXsqlcUW5RirLMDLEyx7MgXXgpc1JMGwDt737BfR586MC30kBODZVpfjS7XezRtj0+eacPDwKWhEbJL3l5HGFaKHG2x36q6bFgm8l6GOeuzyMX2NU8jH2HS5v5vzasn79aGPO4sHZOwkDGzp763O6qMAlRhZNMF6cKGqRKYux9+p713vKrBlKc4MlmYNAkLmFyQvj7S0Dxm4lFwlPN703OLJUEdjh3465s2FzHRbsVMFQz840uy2FwsAXzqKCRxX9tHKpTPFwHXk9Tay/d15JhtA02FhAODAPxHPnpUw+4b9vuBRC/WfYUKI51cBeuMq54HyE/yeCzUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w71atw+3uXUV/pvZFcTBCgO+rqERXnOcpCtvAtsUkno=;
 b=PlmLOqAbeX1euck3syF0cnDHEIuqp7qzPeGfQgOJVIQGJNjqWsay8QGA7BUTTPjgD/YPc+/Hls3+khuQcaljH3dvVpszCfEjPUropLAqI/2Act23HBWpUA6esQyOJYA44Bdh0jRlwbF2PkWfWn2GFUUj5gtAyXZu5Lo9KZYbPj00Re4FYhBXSku1ZTAd4OScpVviOV6rj0ioukSpYetmaoSIRgxLisTlZZBhy9wfcVmT9ScDS3JOeEL6ph3qu/cd4rFBYWKUTFAHwqaZv5bp4P5Z3J4cx/x/TysmmONaWgL+m6mRvSAE2WL8h9e2vknSwcLovhX2iI1tV+kcNqsEQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w71atw+3uXUV/pvZFcTBCgO+rqERXnOcpCtvAtsUkno=;
 b=MbbKHOrRuO7NOsPYmNP+l/gl1+3tkLet4YE8UgaH0+l2k6lMNARLkRNig7BK5GG+163iX8/pv/LseS0Jb2neirqonWIdnw7uyqi6cjMfULEeJLEXhgGXWrUku26+JzYO/s5OF8aLB0GxXFHN6GZupvB+xOSaaeV1a5+fBJJ/bwHYHDSLZ9X3Ay69I5Xr726z+n+ccScNlOUX+fVM3K5ygABAV6tIyjV43edihhW5t8ZESwP0hPm9C9xZcM3jIrK9KOQ2kCUElnzYxbKMyExA+/bH8kjdmOggsKqBey1PMOC2LZLiPxKpirkROGqfTQ9cFh2bJv190j0QDzIytTTsag==
Received: from WA2P291MB0187.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:26::11)
 by WA0P291MB101427.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:43::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 16:33:41 +0000
Received: from WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
 ([fe80::996b:1617:ce96:404]) by WA2P291MB0187.POLP291.PROD.OUTLOOK.COM
 ([fe80::996b:1617:ce96:404%6]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 16:33:41 +0000
From: =?utf-8?B?SGFiaWwgRXJlbiBUw7xya2Vy?= <habilerenturker@hotmail.com>
To: "luto@kernel.org" <luto@kernel.org>, "tglx@kernel.org" <tglx@kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org"
	<x86@kernel.org>
CC: "hpa@zytor.com" <hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?utf-8?B?SGFiaWwgRXJlbiBUw7xya2Vy?=
	<habilerenturker@hotmail.com>
Subject: [PATCH v2 1/2] x86/vdso: Replace deprecated simple_strtoul() with
 kstrtouint()
Thread-Topic: [PATCH v2 1/2] x86/vdso: Replace deprecated simple_strtoul()
 with kstrtouint()
Thread-Index: AQHdVOdHJLhVL+/aJEG5ls3PtnUJvg==
Date: Mon, 5 Oct 2026 16:33:41 +0000
Message-ID: <20261005163335.6716-2-habilerenturker@hotmail.com>
References: <20261005163335.6716-1-habilerenturker@hotmail.com>
In-Reply-To: <20261005163335.6716-1-habilerenturker@hotmail.com>
Accept-Language: tr-TR, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: WA2P291MB0187:EE_|WA0P291MB101427:EE_
x-ms-office365-filtering-correlation-id: bae787a3-50ef-45d9-e50e-08df22fe6a57
x-microsoft-antispam:
 BCL:0;ARA:14566002|55001999006|8060799015|19110799012|8062599012|31061999003|41001999006|24021099003|38102599003|15080799012|25010399006|51005399006|40105399003|2607281247196008|102099032|3412199025|440099028|1710799026;
x-microsoft-antispam-message-info:
 =?utf-8?B?aSs3MFNDdm1Da1p4Ykh6MFR4TjZ2SmFzQzcyenU3endjcWF3OXorVmdZdFdy?=
 =?utf-8?B?NnNNZUhkZXBicEdSbGZiVWM1R29UWnlEVW9EMlptNmF0R3B1Sk55OC9oamd1?=
 =?utf-8?B?KzZNc0VKQUdtbFJZNU1HWHlNcXZyR0huWVVRbkViVmY5YlF2SDFMWHdQQzNT?=
 =?utf-8?B?aVRaNlZFWlcwTEd0cVViM3YrSCtJV2p0TjNFdDkzazM0bm05aFZDdERycGlO?=
 =?utf-8?B?aGljTWt4M0x1U0l2QjgvcllUUnl4QVEvL1hDc00rZDg5TjVkdFVPU0graitT?=
 =?utf-8?B?VzRBbnQyV3BzcnpjRXF0bzRoODVDVno4OVZ1UXl5NE5vSXFIcVhKV3ltaTFO?=
 =?utf-8?B?YnBzTHFHSFZEOEwrMVd4MExXeGIrY0N4cXVPQ2g1MmxDTXRPMmlwSlJrRWhw?=
 =?utf-8?B?cUdBTk9wOXNMT2dyOUJ6UWNTendTVTNaeWRLSGN3RG9OamZyR2NWZ1l4Zk9T?=
 =?utf-8?B?K0hrd0lCTVFSN3ZEU3hoR3dNaWt2ckU4bks4TWZFL1dlTk05Q0xkck0zcmdC?=
 =?utf-8?B?MXNHL0FScFJDUzdIVWZwVlVNbzVscVZxcUNuOXlBL21xQm93MXJVVHV6NmJ4?=
 =?utf-8?B?L0R4UWVkVkVscmtma2pISzUwRERpam84VVNzZmVMYWllZDJMQjhyaUV1WHkv?=
 =?utf-8?B?NEJpQlQyNDNtb25QSHkrKzdDaE9qTE11cU9KWEU1UmRsK3o2QjdvVnJ1cjdK?=
 =?utf-8?B?Qkt1UWhpUEV0SUpuVnNLblVxRGI4dkR4dEZWdGs4RHBlRHp3ejVvc2hnUitB?=
 =?utf-8?B?WGJkdlpsRE5GY1JzQjhqVVRQTmxJMkdwS1Erb3VhNlNXVU84bTVzaHBoR2R3?=
 =?utf-8?B?UTBjYWxZdVdPWDZJc0lrUGoyL3Y2emZ5ZCtLbHE2Yk55VlVqNEQ0ak1jd2dE?=
 =?utf-8?B?ZjRHMDdoK3gvK1hYL3U2anVSaVFvYS9DNkVkeno3R2VnQUx0c0dxdzFFRFNu?=
 =?utf-8?B?YXdXZFg3SzI3MHJyWWd5WnRwc2s3UmlSWmtyRW5sTG1RNXR4RGltN2pmYmVZ?=
 =?utf-8?B?Y3JqY0duR2l2alYveGRYVUlBRU01VjVTeURUMWVqR3BuK2phVlNaVHlzSnpY?=
 =?utf-8?B?YnRqREc5YnN1NVUvUkNGaUkrZXRPOWR1MjFid1NJTlBDd1lMeWFWL1ZVbXFZ?=
 =?utf-8?B?ZkpYdGdZTjNCQ1didXMweHhzNkkvZ1ZkbEcyelFDcEdrT3JXajlKa0xHY3JV?=
 =?utf-8?B?VmI4bXlRMHBoRGZVVFVDZDZrZDVOdlVSSy9qS2xmNWJtcGNOQ3VoTHFIRWYx?=
 =?utf-8?B?TFZDdEpCTEhIZVk2RFpVTGduNXhqUGx3VHZJNExPL1dvSEhLZEpsbFRJMkNx?=
 =?utf-8?B?QVVxNDRNbWZnQWh5MnZXQkVlaW5CYk1nOFFqK1FaTFE5U2RSSEo0cVVNclVL?=
 =?utf-8?B?QUNjeHJlbmU1OW9SWHozN2doKzRWNUt2UmdKTlRjZXc4d29QbmZjcGNqcURl?=
 =?utf-8?Q?0sz33FmG?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WW5UdnZhK0tUU1o0dEdzd3lkQ1NaWHNlWGcvbUFGVUxxVXlkR0p0VkRxMzRh?=
 =?utf-8?B?MVh3SVRkVms2RC9LTyt2YmhsdnZxeGd2c29hMXRTaDU2WGZtS09ReTBUejJJ?=
 =?utf-8?B?SGt0UG42M2tGa2tsK2lUZCtTZktKYWdSQTBzK1AybVZJUDN6eC9hTzdnWWE2?=
 =?utf-8?B?WVZlTHE3OG9kL0FuTVhhcVBsYTVYVG81VUllVUFlS0hiYllHNExDNTltS3lt?=
 =?utf-8?B?bTk4V0xuRGsvS21CY3pDc3BlSjc4YjlQRTNwWGduMjBkVG1xcE8yTXdmNHpZ?=
 =?utf-8?B?STJXVm9sWkdzZGU0MEk1SXJ4L25FSndKZlduOFNUcXhobEZDQTlTdnUxY0E3?=
 =?utf-8?B?bmN0T0JLemdqbUVPS0pBQ2hJRU9oVWdRZVFJWk5LUHRHalBnSE9pdWZvZDlZ?=
 =?utf-8?B?bWhIWDZyY2QyS2Zla0srZkFIS1JtWG5nelIzUWpRMUIvTnFKNWlMSklxUERK?=
 =?utf-8?B?MElQTVcvdFYwQzJRd2Z0UGF2Rjl3UzRzNXVRZ2RFZWg2Zy9XTllsY1F2SFVV?=
 =?utf-8?B?SGU1NDlxRDhQaWhvVElLNXhlRGNuTE1PRTgvNVF2L05lMlRwa2UydnhsanMv?=
 =?utf-8?B?bWZaTzFPUTc2a2taRjdGZUFUaWJPQjNDN2VVWVo0eUFLTVV3UUd2Um1rZnVW?=
 =?utf-8?B?SjhtdTZZK3R1N0NEZm45aHE1NmFyd0RMVEY1dnZYUXJmL2h5aUFUTUVBaWlh?=
 =?utf-8?B?NDM0YXpTVjErTjBVRnltbkFYSkJpRWx1Mzh5Q2RiS0I3VldldWd0VWlzd2oy?=
 =?utf-8?B?dWdwdW9DRytxOXI0RzBDNURoRVlJQVRKTmxHUTZHWmhURDJkYTJwQ0Nua2Iv?=
 =?utf-8?B?dit1ajhjZUttakFnNEMxa2I4TndjS3YxMnZ3bVk1bG96L2NIdm9nR2F2T3JF?=
 =?utf-8?B?TTlOVFA1dVFuK0gzTDNpblVKUVBPYVNET1YwSmk4VkJhdGMvVncxOGVMMjhB?=
 =?utf-8?B?M1RkY3g0T3Z0TWtZZlVMbDh5Q24zNEx5ZzM1ZkVvYTZjK0dtd3p4aloxN25S?=
 =?utf-8?B?c0NMUmZoUWNYYVRjOVp3bFdpMi84TStOb3AyVksydHMxSjcwUWxaY1VFeXF1?=
 =?utf-8?B?QXhFakliRThMT2dZOTNVZEJZemx5aHAwckJBaE9xSUNRRlVodUNZTER6RTFG?=
 =?utf-8?B?Tm42RGlMdHA4dFRoNlV5T2xtU1pVTTFBZmFaQ3VtTkdPZFFudHFrM01vWVBN?=
 =?utf-8?B?YzcwT05taXVHRlE1UFNMeUdkQ1JkL2ZGSStaRVRNT0VGNFQ5K3dWdGF0M2tm?=
 =?utf-8?B?N2ZzejZLczZzZndIdERzUXFRWE05cllQWUhOV2hRT2pXaGNVYWRoMUNPQ2k0?=
 =?utf-8?B?QSs3RitDdFBxdHNzZ29hSUUxbk5zVGJYdm1uQ05lY28zQVcyS1JaTUcyaHd3?=
 =?utf-8?B?MGRGNUdSOHQ3OXJob05kM1JFYWwwNkMwSEJOcXRNNjc5ZHlwdUtIcmtmVlBM?=
 =?utf-8?B?WjNHUVhaeStwWlRyaXV0MVFNdGY1cUMwbDhvU0RkbUVKbnFIODhtcUtMb2hi?=
 =?utf-8?B?bFRFNkdJaWFtcDlOWnBoNXpWbHovZUtrZTNaOW41YW0yd3lkRVJxb3dDVGFE?=
 =?utf-8?B?ZmVEQTFDNEJBdzV5Wnp6cm9KdkFNR0k5TmxPSlN1ampHaFFzZHJSdGJPWmxD?=
 =?utf-8?B?WWRlUEZpQnpwbnl1eHZpS09yWndZODQxUzQ3YXhUSXh1bVZjTy83VHgwemlG?=
 =?utf-8?B?c3BKUit4MmNjTmYwcGZFeG94RFlHMXNWRXRTbDdqU1NBV1FCbnJRaFZYNDl1?=
 =?utf-8?B?QlNDYXhXNnl1bU9HRGdUK2htZDAvYXRVeUZEeGg0TkdwNGNYZWdJL01PTDMr?=
 =?utf-8?B?NVN0TVVnU2hKOG90VS9ya3BNUzNaUHQzZGM2MTllUERhMGxEaEp1Z3VVaDZB?=
 =?utf-8?Q?0daaZ3a22dSrb?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B800FFC30C7BDD4790067C2E50EC415A@POLP291.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: bae787a3-50ef-45d9-e50e-08df22fe6a57
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2026 16:33:41.0813
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA0P291MB101427

VGhlIHNpbXBsZV9zdHJ0b3VsKCkgZnVuY3Rpb24gaXMgZGVwcmVjYXRlZCBiZWNhdXNlIGl0IGV4
cGxpY2l0bHkgaWdub3JlcwpvdmVyZmxvd3MuIFJlcGxhY2UgaXQgd2l0aCB0aGUgcHJvcGVyIHZh
cmlhbnQsIGtzdHJ0b3VpbnQoKSwKaW4gdmRzbzMyX3NldHVwKCkuCgpJdCB3YXMgZGV0ZWN0ZWQg
d2hpbGUgcnVubmluZyBhIHN0YXRpYyBhbmFseXNpcyBvbiB0aGUgdXNlIG9mCnNpbXBsZV9zdHJ0
b3VsKCkgaW4gdGhlIGtlcm5lbC4KClNpZ25lZC1vZmYtYnk6IEhhYmlsIEVyZW4gVMO8cmtlciA8
aGFiaWxlcmVudHVya2VyQGhvdG1haWwuY29tPgotLS0KIGFyY2gveDg2L2VudHJ5L3Zkc28vdmRz
bzMyLXNldHVwLmMgfCAxMSArKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9lbnRyeS92ZHNvL3Zk
c28zMi1zZXR1cC5jIGIvYXJjaC94ODYvZW50cnkvdmRzby92ZHNvMzItc2V0dXAuYwppbmRleCA4
ODk0MDEzZWUuLjEyNmMwMzk4ZCAxMDA2NDQKLS0tIGEvYXJjaC94ODYvZW50cnkvdmRzby92ZHNv
MzItc2V0dXAuYworKysgYi9hcmNoL3g4Ni9lbnRyeS92ZHNvL3Zkc28zMi1zZXR1cC5jCkBAIC0z
MCwxMyArMzAsMjAgQEAgdW5zaWduZWQgaW50IF9fcmVhZF9tb3N0bHkgdmRzbzMyX2VuYWJsZWQg
PSBWRFNPX0RFRkFVTFQ7CiAKIHN0YXRpYyBpbnQgX19pbml0IHZkc28zMl9zZXR1cChjaGFyICpz
KQogewotCXZkc28zMl9lbmFibGVkID0gc2ltcGxlX3N0cnRvdWwocywgTlVMTCwgMCk7CisJdW5z
aWduZWQgaW50IHZhbDsKIAotCWlmICh2ZHNvMzJfZW5hYmxlZCA+IDEpIHsKKwlpZiAodW5saWtl
bHkoa3N0cnRvdWludChzLCAwLCAmdmFsKSkpIHsKKwkJdmRzbzMyX2VuYWJsZWQgPSAwOworCQly
ZXR1cm4gMTsKKwl9CisKKwlpZiAodmFsID4gMSkgewogCQlwcl93YXJuKCJ2ZHNvMzIgdmFsdWVz
IG90aGVyIHRoYW4gMCBhbmQgMSBhcmUgbm8gbG9uZ2VyIGFsbG93ZWQ7IHZkc28gZGlzYWJsZWRc
biIpOwogCQl2ZHNvMzJfZW5hYmxlZCA9IDA7CisJCXJldHVybiAxOwogCX0KIAorCXZkc28zMl9l
bmFibGVkID0gdmFsOwogCXJldHVybiAxOwogfQogCi0tIAoyLjQ3LjMKCg==
