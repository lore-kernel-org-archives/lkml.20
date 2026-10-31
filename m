Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.10.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793470440;
	b=06etjANPkEB5wp4Ljf/uBnfbbg/ZcSOacuzzXbgzf/4CCpYnXPbvpvLuSthprGrbSGmY
	 A4mTbdWJFmm9yFA2tj7mWMK50pMzyOwdAj5TokjJbDw6GwVic8zXdULfT08/Qou4SR80t
	 7rgzesTJwNVwzcToOEtq+fkTj2Dpne+ILUIJ+C3wV1rdjvXrvC9VLZvV/NgCzGvkDMoaE
	 RiUBA/dWSoxLGwfvYZsgCf/GPl0ojPTYDgA2xoL4tZ+bKTmuzBx2WW6o3U0T/meVXfdAC
	 Dsb6SuhDrmPTHSDHZZrdHYel0fnfDvWctGhJJSgv4FmF0OkV/j29zQ/BDYFHCWAuc4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793470440;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:
	 X-MS-Exchange-CrossTenant-rms-persistedconsumerorg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=5rxv9zSnzCr8eivsn7t8vwLULU+ULUH0fS+Ff2fgu6k=;
	b=s+t86KSgQAmfrBN90EjQ8LElpaEBu4pUNkUuk5qlHnKx455U7pnXOlgCZQXMXPH2dyUx
	 oRpLqiRerNIUqy4L0REkUt+g5+LgzcIC+6N3zo93Rq+yu5BVttOkbOmUsInez4oKZ3PYq
	 RROyXj4MxzaU66zJzXvUactU5BxhWpg7PBt9dsk87fm+eshcjvM22QqE/BtD7ftf28g+N
	 huTYcFaiJbq0i4bxXSDfLv2ttZhCPcDp3a3xKPLxU8hU5gVzqlQvP40wYgVy/dLGu30DS
	 epaL+N//lONcYUI/2H+ZpOfsMNMCdttJt+hY2Q7WKmHkpRPxrm54hlAWhs/WcREx8dw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=Ljcu8aYS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.10.54
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azolkn19012054.outbound.protection.outlook.com [52.103.10.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023DA606A31A;
	Sat, 31 Oct 2026 18:13:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 023DA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=Ljcu8aYS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wwd13/3CgNIkC7EzWbQJ/zei5qmT9HNeAgS11L4syBsnX9zIqyZJTPYOcLIHpxYxroCfQxcg8DgJVdDZBhG/AIQPFs5musP1cGcsken2uPGBY2xUE3VNeErPdyW23RXLdKYftTHA1oB637gfuXuq+s3xFsduqiISAxXi7VMrAqt/uqwHBFWOkLeAxl84AMz9m7Fx7St4jdHBVffijcO1KbfaN5abzu1fxofZLsQPNBJPdzLjDAiJ+g8WW42atf5g+j+dVAnRCMr8Eh6mYICRwoVA2VB8gwwiSyJQQpWxIWRow8vGt2+RyYlE2uuLKnkzya9Mf0Fz6YygnYBppOOVyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=5rxv9zSnzCr8eivsn7t8vwLULU+ULUH0fS+Ff2fgu6k=;
 b=vs0Tbc4q8kbSnu/mcnRr0uEUBx1lE7tc2CjHeJJm52JR2z8z9IMaFWP6h5kX5pnlaJ+9vgJ7smMqPi9J/xVdhaKidHPIOKBFA20gZ8cTde6cdXatpUSC3ZgEyQxqKfBxqvO2MXvwS43mtzDd50NTPY+xa6x9MZ44bF6K1P6dUYIsjEI+Nwt71/feGaeHLicaKxwozGPW+LPv/OoP3/VJi5tSxV8RNxflLsRVk+p0scDdmJYdiQ/Ge0vh9A4vbw3f7BGY6glkPFO9BPIWEoOjBx2JPkGHnkbTNoBIIL2+w0QgqNEFxn/XPWSrxONyyLsz7MFPHTtGjRX+Plix7fQFWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5rxv9zSnzCr8eivsn7t8vwLULU+ULUH0fS+Ff2fgu6k=;
 b=Ljcu8aYSNhvrnQ6yxrxTsZkp4t3TBDxeWLq4esVMdpIt6/5gsdzuEIrUW3kRN8cHvFJk/WB8LtxjIN7YZm06b+5kEkFB8rzUpx9YyF1SUtMao4oeEkGy5uKrLfWEr7VSqXGfwoQ/7s2UBetfCgY4Vg7HtNR65jhSFDfmPU6rkNnjXKSDRiPJ8fW0JWO7rBdAV9lB5fHdk8U+VlVMd/pyJXcbwjpYqGTNCF1OMGDgh3966kzHCawFHeTIskRvcCiKGGIv8ppn+B+xZqgsY69fdBljIk0qPWC/xVcm3jY1nBY5a1Til84ls6yKWMguGBQVMWfbOvGZdI+udi9PBwheCA==
Received: from SA3PR05MB10385.namprd05.prod.outlook.com
 (2603:10b6:806:39d::17) by MN6PR05MB10826.namprd05.prod.outlook.com
 (2603:10b6:208:4f8::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.11; Sat, 31 Oct
 2026 18:13:58 +0000
Received: from SA3PR05MB10385.namprd05.prod.outlook.com
 ([fe80::e22f:a0f5:fcb0:9b0d]) by SA3PR05MB10385.namprd05.prod.outlook.com
 ([fe80::e22f:a0f5:fcb0:9b0d%6]) with mapi id 15.21.0569.010; Sat, 31 Oct 2026
 18:13:57 +0000
From: Yingjie Wang <x-professor@outlook.com>
To: Neill Kapron <nkapron@google.com>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bingquan Chen
	<patzilla007@gmail.com>, Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
	Felipe Balbi <balbi@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/2] usb: gadget: configfs: fix extended property length
 handling
Thread-Topic: [PATCH v2 0/2] usb: gadget: configfs: fix extended property
 length handling
Thread-Index: AQHdaWOYMcW894CmEEaWu5Vr3WEvzw==
Date: Sat, 31 Oct 2026 18:13:57 +0000
Message-ID: <cover.1793470427.git.x-professor@outlook.com>
References: <179338899796.2590875.15337207674245295434.b4-review@b4>
In-Reply-To: <179338899796.2590875.15337207674245295434.b4-review@b4>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR05MB10385:EE_|MN6PR05MB10826:EE_
x-ms-office365-filtering-correlation-id: ce8baeb4-6a13-443f-a0c4-08df377abaf4
x-microsoft-antispam:
 BCL:0;ARA:14566002|31061999003|24071999003|24121999003|15080799012|24021099003|41001999006|39105399006|38102599003|20031999006|12121999013|8062599012|19110799012|22091999003|8060799015|4140399003|25010399006|3412199025|440099028|102099032|26121999007|40105399003;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?CDUVmPCCt58DBOaSzUsc+6sknI+5nN/ZDlRZ4nZ7Jq2d7Ndtjob+wImveP?=
 =?iso-8859-1?Q?Tfr/G58sxr/SWKeRPqU8ANvXVcDzUxr8hob67FLEtDQ1f4faqI6HelAsC2?=
 =?iso-8859-1?Q?gUGCdQkTXu79m34sOZ8/eFzHJWJqstcOnzLNdNXng+A7k4L0tQQYlVU/wQ?=
 =?iso-8859-1?Q?hFVMMqKaEvRn4SKvoTsbt1djv7pMK7iiSBL2Jcn3bu+vwM3rtuMOPFDmz2?=
 =?iso-8859-1?Q?1J2duFZGEYJp6H6To9NtxkzhbedLYP6sOhZPvS9x5w2jQag8V++WRVYISC?=
 =?iso-8859-1?Q?wSj9SfIo8BcPD4P1wI4dGdPMucUkD9K+NgManBvnFQZiWPTdQaFkib+0mg?=
 =?iso-8859-1?Q?3Ziv8lkcjgc6KTPVb3keKy02HgKfmswKjgpn23r68y4xZmM2CD25pvCZx+?=
 =?iso-8859-1?Q?KQK0AMxD5mFlY6ulHzL5X/aecjRt6/PusGSw/BC1pAzAP2iltfeLIumyLI?=
 =?iso-8859-1?Q?8AMOS/RrpW8DPol+/JV/zPmflnNbAzgQPaNaGTpB3+kWCqQDmErmOyhx/X?=
 =?iso-8859-1?Q?W4oclydtvM/2lbhjNdWMcdFThy8s/Ks/nSkcv/m/roUYmsQBVPXamiwUQb?=
 =?iso-8859-1?Q?GfD4ct8r4+p8kovAQrD/iHzFFfCQJYdYNJgZ0T2vJwGYsYi8eFnIBjv61z?=
 =?iso-8859-1?Q?BVbvWAKd+JvMd7yvVHhm3xZ7PEmptuUkbc6Pa2cXsdNJVeycOUb5Lbe1ND?=
 =?iso-8859-1?Q?o5F6fWx1yYOjIywD8iRAP3210567JFMNfwGKj9qFqlBsmu/1Ooeamy2VQc?=
 =?iso-8859-1?Q?NUnAGKKWIVoRgbcC9TLHjp7eQDNWjH1QllCdc/8t+m+GFXoq2w6Sfip2xw?=
 =?iso-8859-1?Q?E7DF17BvuRNAiwGelv/fv2b67p7ummg9McXkeEoBLbgfc8tToN4nggXi4P?=
 =?iso-8859-1?Q?W7gUtafLtgWNzjMW2x3GMdEtXLAJgsY389CsUF/O7r5BPmeOUq6o80Y3eI?=
 =?iso-8859-1?Q?Y87MI+DwmpBaOuDUpg/a8XcH+n+jwhYChj1FPk/3eqEdPqCtE42pzdKUWP?=
 =?iso-8859-1?Q?dPURqpz5+eldZiuXAECTZrD28IQNDJSmIWH+4d0gGqJYnUMezFwHut3Kt+?=
 =?iso-8859-1?Q?zPKh84ldqW3SJOXgN5W2JeghxY0N6aIY296gRJOOUwgNJvYsCnaby9eQbJ?=
 =?iso-8859-1?Q?yfYSALlqCiZaqb62u3/SWg/mTEMbUbhOvZ0GtEsbHhbGxkVkZID7pqTbFN?=
 =?iso-8859-1?Q?UqiLLAa1tAXKn57k11WKWcb3asjRHMSKg3PC0awKWa5t2i9LkwsdOdhm?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?z5QQDM8UxXlTvF0+1iPVvStDGxaaQHKgr0FxWsObYDlQkX9I7uRLe5/tPF?=
 =?iso-8859-1?Q?EUcWjVllwC5n0qGhsgH0vak7qOFVXzWWD8zO8Wx6kceM0YFglRR4C6+Ehi?=
 =?iso-8859-1?Q?HlEiCYSe8Qfyf4ND6oGQLWfifQGOHr4ExkrbwjM0off3Qey82hrHYuJwGA?=
 =?iso-8859-1?Q?jwBBB/eh5zmLUHBe7GLURizVNV29dlr7AmlfHWEJ1D7vhVt6Xu+re0e+Rb?=
 =?iso-8859-1?Q?ciYIqDdO/FPqN8wvZd9Nb7f0uZPxVXC6ePQLbmmAZmVXp0/4onq+u7D0f+?=
 =?iso-8859-1?Q?crHjiA2MNf9pKchaN6wx3c60BQOMIhG5j+u6AMKoI7CvBapijcmDm+PHgi?=
 =?iso-8859-1?Q?cjkrLityrvkHaSQamJ5FQ8m5GTr5FqTSFEBFlQrwTrUM4HvTQf86ggMubL?=
 =?iso-8859-1?Q?rItoYpsNwbnsXVyIzAka3HLBhAySIiR3OtX7x3HlGviROeWk/JrZ4bQeZM?=
 =?iso-8859-1?Q?hD+8dWUc/nPNYSScvGGDVDeVvymPntqujNFiXPGKygvW8k1cYRAas42eIz?=
 =?iso-8859-1?Q?Wjxr/Ea0YXhiY3Nqw9+4zU4hw32GpexRseK2G1ucgUM4RYwZs6ZKFZ3iNT?=
 =?iso-8859-1?Q?q50gInjwuGPUHnSJSk4gYC3z9orv5okPvpoTNR2H7FFqt8WUolYeumTZVa?=
 =?iso-8859-1?Q?d+8ogndCT4VBcinmwCVX6QGdiOwwZwepSkP17DGKzQziHxrLM3PumUuNmA?=
 =?iso-8859-1?Q?DIvoO7qo1w3pfibUKOpCkzZg5PX1jdYkXtlAH3MppEu7TxfMySMxPqys5R?=
 =?iso-8859-1?Q?1r1GV5LrmgcJn8HtIu6aT3DJwaHVh5J/HbMUGAhpMRGysXMjaOL+H2qzS0?=
 =?iso-8859-1?Q?orDy0mKvOpKTAFXIMsRyDwRzkK9sdORQNpJlQCgAemW5bCm0pvXeWBVZV6?=
 =?iso-8859-1?Q?rxrhSL4xjg1QK0zjHbCyD/jHs1EOtJAG3i+NdJB8RqsnLNleJ2q5SaaPFW?=
 =?iso-8859-1?Q?2ueRAzWEW+NOj3pUkgbFNBBqMrsT5Z7wk5cXoOCx9U9r2hrEXziPpDayRv?=
 =?iso-8859-1?Q?/sHAwRsV8IvKfpZQymnpWCavW5/+2sWmbrPhpOaIHIJQIaTJIQpHpJyp/7?=
 =?iso-8859-1?Q?Esc7FRCUITyWlGHXCfhc3N6s2NwXSX9F8wYTESy/dTtZuI47Q5i4CYBsDk?=
 =?iso-8859-1?Q?Q1RLmQBil/l+9/l/d8iiSvcJo49NYGaPRD/zTgC53JPYqJu8oGe8LZenXM?=
 =?iso-8859-1?Q?nTNxsEsTkN0fmIVzWQCVrRk8ycKNX/SG05eYA6Iyx0FxjEZra8uDnpmQAW?=
 =?iso-8859-1?Q?aGDmu9zxk1eE/D2MneVTxiLS2WILyPg7fYsXksNdi28Z+nmvJ9EPbEXt7O?=
 =?iso-8859-1?Q?KEo7LqPvrpw0JG5wdD89ipMc8RjQahglbZIeHWwxzg66ZvKX5ons5MLnqC?=
 =?iso-8859-1?Q?OLp1fkzSd9RGZAqqVSE+iBpezIZ6wFNiSj4+5pfvrRUXwj0NihrhuIwj1X?=
 =?iso-8859-1?Q?vLp5joB/lxT3ljZn?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR05MB10385.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: ce8baeb4-6a13-443f-a0c4-08df377abaf4
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2026 18:13:57.2014
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR05MB10826

The configfs implementation of Microsoft OS Extended Properties keeps the=
=0A=
raw property payload in memory while data_len records the descriptor wire=
=0A=
length.  The Unicode wire length includes a two-byte terminator, but the=0A=
stored allocation did not.  Configfs readback and descriptor conversion=0A=
could consequently read one byte past the allocation.=0A=
=0A=
Type changes also updated data_len with shifts that omitted the Unicode=0A=
terminator and left the aggregate descriptor length unchanged.  This could=
=0A=
truncate a property value, report a stale dwLength, or make configfs=0A=
readback use a length larger than the allocation.=0A=
=0A=
Patch 1 allocates the source terminator, guards empty writes and introduces=
=0A=
the raw-to-wire length helper.  Patch 2 keeps the raw data length separatel=
y,=0A=
derives Unicode wire lengths from the actual UTF-16 conversion, uses both=
=0A=
lengths for type changes and readback, and updates the aggregate descriptor=
=0A=
length.  Configfs now returns the raw payload, while the host-visible Unico=
de=0A=
descriptor retains its UTF-16 terminator.=0A=
=0A=
Changes since v1:=0A=
- use separate raw and wire lengths instead of inferring UTF-8 bytes from=
=0A=
  a UTF-16 wire length;=0A=
- derive Unicode wire lengths from UTF-16 code units, including the=0A=
  terminator, so non-ASCII values are not padded with extra zero units;=0A=
- return only the raw payload through configfs readback;=0A=
- keep data_len and the aggregate descriptor length consistent across type=
=0A=
  changes;=0A=
- calculate the type-dependent length and publish the new data under=0A=
  opts_mutex;=0A=
- guard empty data writes before checking the trailing byte;=0A=
- preserve the FunctionFS Unicode conversion input length while adapting th=
e=0A=
  shared serializer;=0A=
- reject malformed UTF-8 without replacing the existing property data or=0A=
  changing its descriptor lengths;=0A=
- include the related type-change fix as patch 2/2.=0A=
=0A=
Tested on x86-64 with KASAN using an RNDIS configfs gadget on dummy_hcd.=0A=
The base kernel reported out-of-bounds reads in configfs readback and host=
=0A=
descriptor generation.  Patch 1 removed the direct Unicode-data reports;=0A=
the full series also removed the type-change report, with no KASAN, BUG or=
=0A=
WARNING.  Binary-to-Unicode, Unicode-to-binary, data-before-type, property=
=0A=
removal and type 7 configfs readback were exercised.  ASCII, U+00E9 and=0A=
U+1F600 values produced exact UTF-16 data lengths and terminators, includin=
g=0A=
through a binary-to-Unicode transition.  Every host descriptor length=0A=
matched the returned response, and configfs returned the raw bytes.  An=0A=
invalid UTF-8 write failed without changing the old data, type or host=0A=
descriptor.  A separate FunctionFS run returned the complete "abc\0" Unicod=
e=0A=
property and preserved a four-byte Binary property containing an embedded=
=0A=
NUL.  Both commits also built with W=3D1 for x86-64 and i386.=0A=
=0A=
Yingjie Wang (2):=0A=
  usb: gadget: configfs: NUL-terminate extended property data=0A=
  usb: gadget: configfs: keep extended property lengths consistent=0A=
=0A=
 drivers/usb/gadget/composite.c     |   1 +=0A=
 drivers/usb/gadget/configfs.c      | 100 +++++++++++++++++++----------=0A=
 drivers/usb/gadget/function/f_fs.c |   1 +=0A=
 drivers/usb/gadget/u_os_desc.h     |   8 +--=0A=
 include/linux/usb/composite.h      |   4 +-=0A=
 5 files changed, 76 insertions(+), 38 deletions(-)=0A=
=0A=
=0A=
base-commit: e971f4f365bad51d01bc90db55b56fdb3124f963=0A=
-- =0A=
2.43.0=0A=
=0A=
