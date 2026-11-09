Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794229849;
	b=VAYCS7EmQEXmB97+SBWR3vh3EKRok7A10JY7h30nHqM3H2oX11w7F97Nd5u/XO9eM5P6
	 sTQJutpGhuh/REQXPa0mpoPkoBY+xKlblUM7dDYNLurwNea/4lAPIxqQpOp3wHX3TsHRG
	 2b63gxSv9VroNwM76GLlgd7MNF7DUvrExNXUtjPcPNUo2LWfKCgmq07I2WjQ11ckiwlGG
	 wGgrL91mE2rFIE8PTaLrk+B9/dacL0qkcuXhkhJTPrXt7oqs6dM+9rdToCj9xwR6B75K0
	 6WGIQOi67x4DE5oVWUQmGW7TqyuV/wljUwtYrfR+/68M1mAGfhyPflUS+IOyGHYf39A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794229849;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:From:To:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ld-processed:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jYdUhDTRYH3LJKmQAI8jQfgYCBrCEfNAvRvApAWQbPY=;
	b=ocEJ7vhGWGvvrY/8zPXzdQ2XKDMraB/+mRKWpkSJGTubr40Hfe3BNZg9nK2X4++4tpkL
	 lVVIxNJ/AEHhrVip5+z0YswgoEThDWY0RzFTp0pPGi8dNOPUsIF+cwAe6a6wJsB1MJcmO
	 AOg64wKF5ZVY/wZaydN2y+zSYU74UbldDlLfOss4jCcLxwlhSkMnqmAM1S2Yf2v/+dGDe
	 urrvmtNp85Zoi54eHFwHoD4gC+YJTqcPqkfz/LgGdZJaFC9DmAsmXlZw6aU+tzKvhMBAT
	 IDsUaQoLMnbV/E80ZLHFIrAt+M0rxePk1I4YQQVH+xr89Zd2ffpN1AUNhpnZ/Ufdu5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=SfsQvwon;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=ctHw+Hc2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECA9606D801;
	Mon,  9 Nov 2026 13:10:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BECA9606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=SfsQvwon;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=ctHw+Hc2
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99voht3096286;
	Mon, 9 Nov 2026 07:10:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=jYdUhDTRYH3LJKmQAI8jQfgYCBrCEfNAvRvApAWQb
	PY=; b=SfsQvwonDt4tS70DWNeeE+v51K/simYwOEVM/6lnDMv/ea0EAmEi0j3Fu
	t3VwJBlQU71J2mF+dN0LystJNL1dkicA899x6NTEfnf0S3/aX6tk2mR0pmnKUADP
	5WWDE0aMS1FNia3j1oYQGRZ7jDUKQKIptOGOXrSivUO8xbWdanFk2TFysFvwIrQK
	aLk/bM8V2NJoGntlH3xvthUJ/oGBUf6dQm/lzHN+77KrmJwnx4xyc2wKzMI1ccL6
	wv/VNiZIVc8yBZMNDXALlgMTNmNRVRPcUh7NOPE/EUnyBEV7n5NOOknEtfABMyCF
	C96twvoTr0TQpuMdYx2U2VURlgtwQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012003.outbound.protection.outlook.com [40.107.209.3])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4htm89p4a9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Nov 2026 07:10:34 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XBLIrFPkuUvG3Js1RN3FqzB4xDBfFDKhmX0l3yKzpPYtZa0OBKnJY0uHiPz0uz1gr3adWpw20J+GK0bDdDZWAnVz3isY2EconAWk/YxI+107Sg7zEWTg9eGYI8q7e4wcKFedditWvPNXZO3+8XQwNV9B/AyXOAMEkrBaQeYvcVaKSm0M2K1se80rvNW91lCqOZdci5TH/FoCgUrhdizdE+xExijPUgHGl1SLqYdRtH4jIQoc44UztSPhxiWIeioafkVheQHA9EN5oaA5uJ1Tsrl58STBfisxG0hHuP/hre9J4R1tZFaAlPUkQAU/b+R5wE6VTbdg6ZW7ZtHBvwlFMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jYdUhDTRYH3LJKmQAI8jQfgYCBrCEfNAvRvApAWQbPY=;
 b=K8WoSHgGJzgKbCGdlCbvz9Vj+nzzJ53zWdb1DuPa2L/otSoHdQSUBgA5et89JCKror4IOgwLM6YWasf0Kg6uvyW0g/7v90rtlznq2qxF7YNS5IhJO0oR4eQGMpR+7vVaskjDErwvT3Bb8l39VB6FKQPYFIYEh+hqRLD327wpETR2R9E4KclFtMOLmU0FqBu6g4OTTeUxoUigE4PsJDxmayBNWo1CD8DtU5eVNsXxCyzqW1uFksYWX03GDRMwNx1ubwM0EBgqiIo3FHKQorjKf0CALsAwpuLOyJx0tkAv5YvZGpmmKGVent9VlsBEwUiIy1KYT5aQygOvYNdMCCOsuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ti.com; dmarc=pass action=none header.from=ti.com; dkim=pass
 header.d=ti.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jYdUhDTRYH3LJKmQAI8jQfgYCBrCEfNAvRvApAWQbPY=;
 b=ctHw+Hc2arl0+uGynLzvHbIa7zmvO7MoG/+A2AlMFPJ7/oodFwWAzMcGLDZpgohUb1MRAOPzBG9Ae1Nzym8ZB1zRdxvfM3K70EJcxfNMw4cYUS+23GWKosS1KzHWt0VWQ31DvFe1mK0nI4Pkj43lG4OH6cr4b0AsoM/qH1Uv00w=
Received: from BN8PR10MB3652.namprd10.prod.outlook.com (2603:10b6:408:ba::10)
 by IA1PR10MB6879.namprd10.prod.outlook.com (2603:10b6:208:421::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Mon, 9 Nov
 2026 13:10:32 +0000
Received: from BN8PR10MB3652.namprd10.prod.outlook.com
 ([fe80::86d1:377b:3bec:884a]) by BN8PR10MB3652.namprd10.prod.outlook.com
 ([fe80::86d1:377b:3bec:884a%4]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 13:10:32 +0000
From: "Thakkar, Devarsh" <devarsht@ti.com>
To: "Brnich, Brandon" <b-brnich@ti.com>,
        "mchehab@kernel.org"
	<mchehab@kernel.org>,
        "hverkuil@kernel.org" <hverkuil@kernel.org>,
        "nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
        "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 4/4] media: imagination: e5010: Enable autosuspend for
 runtime PM
Thread-Topic: [PATCH v6 4/4] media: imagination: e5010: Enable autosuspend for
 runtime PM
Thread-Index: AQHdYv1Ea/qZmQWugEObcojqWPPwMLcl0WkA
Date: Mon, 9 Nov 2026 13:10:31 +0000
Message-ID: <06e699a8-26a1-42d4-8807-17d608887602@ti.com>
References: <20261023144618.1652390-1-b-brnich@ti.com>
 <20261023144618.1652390-5-b-brnich@ti.com>
In-Reply-To: <20261023144618.1652390-5-b-brnich@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ti.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR10MB3652:EE_|IA1PR10MB6879:EE_
x-ms-office365-filtering-correlation-id: fbcd9b99-e057-4b9d-841e-08df3e62d5a1
x-ld-processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|6133799003|10067099003|38070700021|4143699003|5023799004|261021121427099003|261026140227099003|261028144727099003|261102123227099003|261022105027099003|261021123027099003|261022075727099003|261021135927099003|56012099006|261026121527099003|261009223327099003|261022115727099003|261009221727099003|261009223027099003|261009221227099003|261009220027099003;
x-microsoft-antispam-message-info:
 ok3gu119aVgD9OKqGre/GBnecCnOQRskIQpZYfxu0kITWHKHjmN5kz6jHcSXlXFWPetnISruBsPC/ELAG0j+EoCzdBJ2CGIZbCzA6WTwHcXawmD/tGW91HX0PtN/OaVaXq5RxJJxuaFJS2BEdDmKFV6/coaEmmJfapqNgPE7ZJ/IjjWmRa3cy9/4fNrCQK8zwQQivWFQ3dBmDCrCPsHiZ2UZsDQO79kEy6cIrk2WEHpWK19IddkyZsYU6OtTJEaiJF7IeqAPHyBZxgYVJ7L4w76pYohtKgzAMXoi8n/o9l6AxQ1oF0yl5Gxw/p0NC9EieczEA28OlGWMMoPmEF+J7A1APfjR7Lp64se9Tk0YqXj8lha0FEWk4yx9ee+wpOzJPykH6Q/GRcrz+DTtDBXnLqei1RMAbUnUT6bmXFN27D578vhUH9ovwMhu4ihE4hegZ8T76YUjrxbIRDsRyfVXuxtOFmnJ91b74xYwdn9/rhBbRK6MilcbcSwu7JtbJx41v2uuuKwP3Ux9+9U1koO8Wkd1vU1+DW42qyJcWIA2SoEnYgbV8iZ3X+qKiNi1G2RwMjleyp/Oq/Yzr9aaAwgxmj53nv4YMrO5CRn+vIa56H5NJNLK3MyYReRuC42fSq16FjK5TkJcuUfvVr7S71Cb8U+FIlGPN7woMi7LsHIqXLK5qISUURpHVeeTJ+6vSs7DLUs5ldgegenftPIEIjji3REZi/Dic0WMaOh+WToNdRw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR10MB3652.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(6133799003)(10067099003)(38070700021)(4143699003)(5023799004)(261021121427099003)(261026140227099003)(261028144727099003)(261102123227099003)(261022105027099003)(261021123027099003)(261022075727099003)(261021135927099003)(56012099006)(261026121527099003)(261009223327099003)(261022115727099003)(261009221727099003)(261009223027099003)(261009221227099003)(261009220027099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b3ZGY2xnMGk3VUNzeDRwdzlBbzIvUjNVR0RvRFU1TkZoSDhlMGNhcVRON1VI?=
 =?utf-8?B?K1R1TDRUWE1vSEw5OFI3MmFMVm4vVC9PNmhERFdIY1JyajQ4K3JJSUdESldt?=
 =?utf-8?B?dmwrWEJYbEFiU0hzWndoOE9EQ0c1N2kyMXBIN3ZCeG5TTzNzb045UlY2L2tM?=
 =?utf-8?B?TVRMSmRGRFdHVmgvWTFIbTRKV2pxZm5uOVg2YmxGc20ra1dwTTFnQjhMRW13?=
 =?utf-8?B?anh6U0FWN21FL3VaczlKSU81NUsrZ1lKNE1xcHpvclFGeTBnbmErZXBKcnln?=
 =?utf-8?B?OHdHMWJ3YzU5d0g1a3BwaEZCb2YrTVU3eE9LZmhZVDZnSUd4cWdkUTZnOHNq?=
 =?utf-8?B?SW1ENnJXS1BzWnJZcTl0RkFEMlRyazJpYWNZSjVDdlhGR2JwZE8zRTN4Y1Jx?=
 =?utf-8?B?Vm15Y0N5UEliaHNPZDlwSU5VWUhydUZkbDZyeWR6OWNSM3M0SlBMWXBzMjFK?=
 =?utf-8?B?RlZ5Q0xKTG1maDZzM0EvUXZxejI5TFlhWkhvbnVvZERZdjlVRy9lbFExOXpu?=
 =?utf-8?B?OHV6V2tOdllTbWFrK2d4MDUyZ2s5YjM2ZFM3VHN3NW9TOEpDMDJKaG55M3hy?=
 =?utf-8?B?RGo3dWxhU1gyTUFHM1V0R08zY2FSOVcvOTJ3YUNuS21NcEFWT2xYQ1YzdHNv?=
 =?utf-8?B?cnI4NW8ybVBXaldNK1lMaTBYWUhKSldiTVhuQmQ0UlBFZ2F2aWdrWHk0Zy9F?=
 =?utf-8?B?cFBQVDdTL1Y3cGt5TzhvbUVUUEJrQ2JyV1pHQVRvTVBuTUNQeDF0Z3g1dnd3?=
 =?utf-8?B?UFBFL1JJTzVVMUYwUGVqQnB2aXl0dU5YWDBPYWRxTndIam1WRmVua2VMaUl0?=
 =?utf-8?B?MGQ4ai9RbXh2L1FkNkw0R1VBRHROeTBVd1IxdVI4N0VLU3hNejJXQlFhYyt1?=
 =?utf-8?B?T0pYRm1sK3RSRDdnM1V0eFFUN2ZXQWNaRENiNDNSSFl4ZVphZkRlNkV1WkJ6?=
 =?utf-8?B?d1VHTytBMHMrMGxoWkVZazdMeTVTYWd5dFQyYzkyYnJnTkgzS0Q1eWRVU2Jv?=
 =?utf-8?B?UlFjTjVtYUxYZngxQlJQSEVVcHJ6d1JGUlMvR3licjlLcDNkeTRzTlkxSDdL?=
 =?utf-8?B?UVhuR3hUUnFOMU1RRmJjRWxUTHZTdU11aU9tUXg3MkRjR1dYK0RpSjJkZk9t?=
 =?utf-8?B?b05XNkRhS0dqWmF2SWNwUlFYbDVBYzl4UTVUUlk0YU5QVmpiUlF5WFNIemNF?=
 =?utf-8?B?WkFQaDNVUmp3eFpSMkFyNFY0WWpPY3owU21JV3dLTWtiZVNNRTdZRjhXZmF5?=
 =?utf-8?B?ZjlsZ09OV0ZRTkowSWlPaHgvcjRwVVVpTVlJSlVBMFpCS1ByOURRMC9zYnZi?=
 =?utf-8?B?M0VaWG9pSXhTVmUvUmIwSXRsSmpiajZBbmN6SW1mK2ltL1FPOGtHdVRmZ3No?=
 =?utf-8?B?bGVqREFEZitVZlZMZldMenMvY3BNQUFTRWtTOUhoUitmT0ZMOGpVSUpzRmhC?=
 =?utf-8?B?bDM5UGp0dkU2cTZ1eFVDTUhZQnZ6blVnVkhFMG1zK1BxUXBjRWpZMHVWeDR5?=
 =?utf-8?B?Zmp5dzd1Szl5TmhFZklaWi84ODN5V0ZLT3krTDgvSUJEeWhNUkJ4NDJqc3F0?=
 =?utf-8?B?eFMrMFFhOTVKNk5CZjZ6YTNqbXpPOFNFWmdjbHc5YktiTitmdHEzcEk5RnpH?=
 =?utf-8?B?NmsrL1JqRjBJaDA4ZHgyZjBHang1c1orNzFFdzdidlhiVVVDVTYyMVpUbUt6?=
 =?utf-8?B?VTdaYVhUUy9pYW1sM3hmSVZSaG94TmlLZXBHL1cxeFFTdE5lWFdhYVltU1RK?=
 =?utf-8?B?SkNyeTN0YUtPZWZlUFpEaUJrcTRaVEtRbFJuN0NCck9NM0o1ZEtXR2xDUFFO?=
 =?utf-8?B?anc0ZHY3MWJNWjhob0w2U2FoZGFDK0hJL0duaElaOVkvUzUwZkFQaW1PL0Q3?=
 =?utf-8?B?R2pWd3hXcVA2WXhiUXZPeXpJR2JsSUtKQ1lCR0RmbE9iK1ZUUWJ2cUpLTlpH?=
 =?utf-8?B?UDBCR3JiM2R1MGNQTzJ6Z1VUaGx3NWp6WHVFN2tweDdRWDVmbE84WVZ3U3M3?=
 =?utf-8?B?enA3Qm0wYUJhNE1ONG5hT0hxZWx4UUVMbUNXOWdtS0o1K01xK2REY0Q5TFl5?=
 =?utf-8?B?ckpOSVE3VjRycGVIQVhFQlpMWi9nanN3Ly9FZE5FNVN6UUFDL3Q2UDBNZmZn?=
 =?utf-8?B?NS9PU3lEdFVaNmh3Mk9jN05aSE5FdVlEUWVRNm8rNFJ4bHZDM2djSWdvbGVr?=
 =?utf-8?B?WWVHMTBTYyt3eElsdURxQjZDSVRvUFJxQlMvWlVQUlJJZnRVVDBpc01hMk5m?=
 =?utf-8?B?TldUc2ZFMGp5MnMvSXY3MFVRRk41ei9uazRnd2l1WGcrenZYeGJ1YkR0enZs?=
 =?utf-8?Q?kQirgGFZiCQBIPR2nq?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <95963ACF5B72C54693EA30D914D988FF@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	JoGEMGHWzHv6a6o7o6S1aJ5qhFgdUGiVSdXdQu1WFXsmcW40ItbftPlE0J3ONEjUdzPsq4uzRWhZjJE8qmSfmK5eBNhKhEOBa1N4fPKL5t3VJ6iMFzrThci1iNEw1ZXYAc1yD66+CwNgDNoLqnRZ4Yhc0Dkayp20YBK0bumnBUSZgckCaO/7Tgol48OVbPtqdm+l1Km1D+0n/A0P6TuhSRqjR261cVRr5051ZoyPkYr4+eT63EP218jDMRviyyAmrAqDLotuczy8u1OIclGkDTBwaAqvs0K8Pik8Koz1XIs8QBQuG127U/29Q/3a2xa3NFHjdAFcHu5wrb3Gu8yf7g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR10MB3652.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbcd9b99-e057-4b9d-841e-08df3e62d5a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2026 13:10:32.1705
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yn0wmgQUuXGr4gPefAI0pr6wyc6/HOIHgECBVlzJvL0viBingWMk8RzWlP2R6KAZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6879
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1MiBTYWx0ZWRfX6tShcPDRu/rX
 1grAecdJd23Ls+suvEyUCnyRA0VmPf9ctX+97G+3YHJhDokFu5GIzivBbly0tobk043AcaIf9bh
 DfQeSFDUOYVRs5Zzn9IGKa+AN5wI1dp66P2fKDMG72g+yVPk6N5RTNRK4psVRQl1+zicVxeSrlX
 fdiNFwxh5uuowg8K+nTwAR8stRM3yIScdsBlONsKnLeR0M19Jac2PMWXdD/L518U9HeH3cUQa5O
 cGpUf/i74pkR+yWPZ3lOLIcAeQtA6Ks30sEByqC6YzhRAJzgycP1aPlPKY2uQ3UZYyU4wiY6zft
 +8qhoLeXNqaGTvpCy3q5II7LKwSXACYNsq6NRY9is213kbCdNzEAPZepnMz0U35Np5LOld6OX9v
 fUVHqVp+7HFnN+nVai9FmdeVDUxB7jAknFITrGlhQjJIkMowtYCuMJof+Tz3Zvre3JQgSjKly+H
 tGXdpHtTb77d8tpVAWQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1MiBTYWx0ZWRfX0JxW75lVWz4Z
 v1IUjIZI6+V+AwaLQpzuMEb445wSqbaX6D2Ysi+3AroopEQFdlxzTk88zocOwlKvZv9vXxMRZKa
 aLv+8Ker79C0axWQ+bA+cjsYXULUMUg=
X-Proofpoint-ORIG-GUID: P2OUykBMnrin46oXPO-UQXNg5CYFHGxb
X-Proofpoint-GUID: P2OUykBMnrin46oXPO-UQXNg5CYFHGxb
X-Authority-Analysis: v=2.4 cv=bpDZl0ai c=1 sm=1 tr=0 ts=6af1c64a cx=c_pps
 a=9H9ADJ10uJ0pYmVeXPB43g==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8
 a=0UTWsqkrw0MoSdBRXrMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090052

SGkgQnJhbmRvbiwNCg0KVGhhbmtzIGZvciB0aGUgcGF0Y2guDQoNCk9uIDEwLzIzLzIwMjYgODox
NiBQTSwgQnJuaWNoLCBCcmFuZG9uIHdyb3RlOg0KPiBGcm9tOiBCcmFuZG9uIEJybmljaCA8Yi1i
cm5pY2hAdGkuY29tPg0KPiANCj4gQ3VycmVudCBpbXBsZW1lbnRhdGlvbiBvbmx5IGhhcyBvbmUg
Y2FsbCB0byB0dXJuIHRoZSBkZXZpY2Ugb24gLQ0KPiBzdGFydF9zdHJlYW1pbmcuIFRoaXMgY2Fu
IHdhc3RlIHBvd2VyIG9mIGRldmljZSBhcyB0aGUgZGV2aWNlIGNhbiBiZSBpbg0KPiBTVFJFQU1f
T04gc3RhdGUsIGJ1dCBubyBidWZmZXJzIGFyZSBhY3R1YWxseSBiZWluZyBzdWJtaXR0ZWQuDQo+
IA0KPiBOZWVkIHRvIHNldCBsYXN0X2NvbnRleHRfcnVuIHRvIE5VTEwgaW4gcmVzdW1lIGhvb2su
IFRoaXMgd2lsbCB0cmlnZ2VyDQo+IFFQIHZhbHVlIHVwZGF0ZXMgZHVyaW5nIG5leHQgY2FsbCB0
byBkZXZpY2VfcnVuLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQnJhbmRvbiBCcm5pY2ggPGItYnJu
aWNoQHRpLmNvbT4NCj4gLS0tDQo+ICAuLi4vcGxhdGZvcm0vaW1hZ2luYXRpb24vZTUwMTAtanBl
Zy1lbmMuYyAgICAgfCA1MCArKysrKysrKystLS0tLS0tLS0tDQo+ICAuLi4vcGxhdGZvcm0vaW1h
Z2luYXRpb24vZTUwMTAtanBlZy1lbmMuaCAgICAgfCAgMSArDQo+ICAyIGZpbGVzIGNoYW5nZWQs
IDI2IGluc2VydGlvbnMoKyksIDI1IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbWVkaWEvcGxhdGZvcm0vaW1hZ2luYXRpb24vZTUwMTAtanBlZy1lbmMuYyBiL2RyaXZl
cnMvbWVkaWEvcGxhdGZvcm0vaW1hZ2luYXRpb24vZTUwMTAtanBlZy1lbmMuYw0KPiBpbmRleCBj
MjVhYjk2Mjc1MThlLi4yMjgxMzcyNDNmNzQ5IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL21lZGlh
L3BsYXRmb3JtL2ltYWdpbmF0aW9uL2U1MDEwLWpwZWctZW5jLmMNCj4gKysrIGIvZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9pbWFnaW5hdGlvbi9lNTAxMC1qcGVnLWVuYy5jDQo+IEBAIC05NzYsNiAr
OTc2LDcgQEAgc3RhdGljIGlycXJldHVybl90IGU1MDEwX2lycShpbnQgaXJxLCB2b2lkICpkYXRh
KQ0KPiAgDQo+ICAJdjRsMl9tMm1fam9iX2ZpbmlzaChlNTAxMC0+bTJtX2RldiwgY3R4LT5maC5t
Mm1fY3R4KTsNCj4gIAlkcHJpbnRrKGU1MDEwLCAzLCAiY3R4OiAweCVwIEZpbmlzaCBqb2JcbiIs
IGN0eCk7DQo+ICsJcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoZTUwMTAtPmRldik7DQo+ICAN
Cj4gIGpvYl91bmxvY2s6DQo+ICAJc3Bpbl91bmxvY2soJmU1MDEwLT5od19sb2NrKTsNCj4gQEAg
LTEwOTksNiArMTEwMCw4IEBAIHN0YXRpYyBpbnQgZTUwMTBfcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikNCj4gIAkJZ290byBmYWlsX2FmdGVyX3Y0bDJfbTJtX2luaXQ7DQo+ICAJ
fQ0KPiAgDQo+ICsJcG1fcnVudGltZV9zZXRfYXV0b3N1c3BlbmRfZGVsYXkoZGV2LCBKUEVHX0FV
VE9TVVNQRU5EX0RFTEFZX01TKTsNCj4gKwlwbV9ydW50aW1lX3VzZV9hdXRvc3VzcGVuZChkZXYp
Ow0KPiAgCXBtX3J1bnRpbWVfZW5hYmxlKGRldik7DQo+ICANCj4gIAlpZiAoIXBtX3J1bnRpbWVf
ZW5hYmxlZChkZXYpKSB7DQo+IEBAIC0xMTA3LDYgKzExMTAsMTEgQEAgc3RhdGljIGludCBlNTAx
MF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgCQkJZGV2X2Vycl9wcm9i
ZShkZXYsIHJldCwgImZhaWxlZCB0byBlbmFibGUgY2xvY2tcbiIpOw0KPiAgCQkJZ290byBmYWls
X2FmdGVyX3Y0bDJfbTJtX2luaXQ7DQo+ICAJCX0NCj4gKwkJcmV0ID0gZTUwMTBfaW5pdF9kZXZp
Y2UoZTUwMTApOw0KPiArCQlpZiAocmV0KSB7DQo+ICsJCQlkZXZfZXJyX3Byb2JlKGRldiwgcmV0
LCAiZmFpbGVkIHRvIGluaXQgZGV2aWNlXG4iKTsNCj4gKwkJCWdvdG8gZmFpbF9hZnRlcl9jbG9j
a19lbmFibGU7DQo+ICsJCX0NCg0KSSBndWVzcyB0aGlzIGlzIG5lZWRlZCBiZWNhdXNlIHRoaXMg
cGF0Y2ggZHJvcHMgZTUwMTBfaW5pdF9kZXZpY2UoKSBmcm9tDQpzdGFydF9zdHJlYW1pbmcoKSwg
d2hpY2ggd2FzIHRoZSBvbmx5IGluaXQgZm9yIHRoZSAhQ09ORklHX1BNIGNhc2UuDQpQbGVhc2Ug
bWVudGlvbiB0aGF0IGluIHRoZSBjb21taXQgbWVzc2FnZSBpZiBjb3JyZWN0Lg0KPiAgCX0NCj4g
IA0KPiAgCXJldCA9IHZpZGVvX3JlZ2lzdGVyX2RldmljZShlNTAxMC0+dmRldiwgVkZMX1RZUEVf
VklERU8sIDApOw0KPiBAQCAtMTEyMSwxMCArMTEyOSwxMiBAQCBzdGF0aWMgaW50IGU1MDEwX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAJcmV0dXJuIDA7DQo+ICANCj4g
IGZhaWxfYWZ0ZXJfY2xvY2tfZW5hYmxlOg0KPiAtCWlmIChwbV9ydW50aW1lX2VuYWJsZWQoZGV2
KSkNCj4gKwlpZiAocG1fcnVudGltZV9lbmFibGVkKGRldikpIHsNCj4gIAkJcG1fcnVudGltZV9k
aXNhYmxlKGRldik7DQo+IC0JZWxzZQ0KPiArCQlwbV9ydW50aW1lX2RvbnRfdXNlX2F1dG9zdXNw
ZW5kKGRldik7DQoNCnBtX3J1bnRpbWVfZG9udF91c2VfYXV0b3N1c3BlbmQoZGV2KSBzaG91bGQg
YmUgY2FsbGVkIGZpcnN0IGJlZm9yZQ0KY2FsbGluZyBwbV9ydW50aW1lX2Rpc2FibGUuDQoNCj4g
Kwl9IGVsc2Ugew0KPiAgCQljbGtfZGlzYWJsZV91bnByZXBhcmUoZTUwMTAtPmNsayk7DQo+ICsJ
fQ0KPiAgZmFpbF9hZnRlcl92NGwyX20ybV9pbml0Og0KPiAgCXY0bDJfbTJtX3JlbGVhc2UoZTUw
MTAtPm0ybV9kZXYpOw0KPiAgZmFpbF9hZnRlcl92NGwyX3JlZ2lzdGVyOg0KPiBAQCAtMTEzOSw2
ICsxMTQ5LDcgQEAgc3RhdGljIHZvaWQgZTUwMTBfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpDQo+ICAJc3RydWN0IGU1MDEwX2RldiAqZTUwMTAgPSBwbGF0Zm9ybV9nZXRfZHJ2
ZGF0YShwZGV2KTsNCj4gIA0KPiAgCXBtX3J1bnRpbWVfZGlzYWJsZShlNTAxMC0+ZGV2KTsNCj4g
KwlwbV9ydW50aW1lX2RvbnRfdXNlX2F1dG9zdXNwZW5kKGU1MDEwLT5kZXYpOw0KDQpTYW1lIGhl
cmUuDQoNCj4gIAlpZiAoIXBtX3J1bnRpbWVfc3RhdHVzX3N1c3BlbmRlZCgmcGRldi0+ZGV2KSkN
Cj4gIAkJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGU1MDEwLT5jbGspOw0KPiAgCXZpZGVvX3VucmVn
aXN0ZXJfZGV2aWNlKGU1MDEwLT52ZGV2KTsNCj4gQEAgLTEzMDQsMzEgKzEzMTUsMTMgQEAgc3Rh
dGljIGludCBlNTAxMF9lbmNvZGVyX2NtZChzdHJ1Y3QgZmlsZSAqZmlsZSwgdm9pZCAqcHJpdiwN
Cj4gIHN0YXRpYyBpbnQgZTUwMTBfc3RhcnRfc3RyZWFtaW5nKHN0cnVjdCB2YjJfcXVldWUgKnEs
IHVuc2lnbmVkIGludCBjb3VudCkNCj4gIHsNCj4gIAlzdHJ1Y3QgZTUwMTBfY29udGV4dCAqY3R4
ID0gdmIyX2dldF9kcnZfcHJpdihxKTsNCj4gLQlpbnQgcmV0Ow0KPiAgDQo+ICAJc3RydWN0IGU1
MDEwX3FfZGF0YSAqcXVldWUgPSBnZXRfcXVldWUoY3R4LCBxLT50eXBlKTsNCj4gIA0KPiAgCXY0
bDJfbTJtX3VwZGF0ZV9zdGFydF9zdHJlYW1pbmdfc3RhdGUoY3R4LT5maC5tMm1fY3R4LCBxKTsN
Cj4gIAlxdWV1ZS0+c2VxdWVuY2UgPSAwOw0KPiAgDQo+IC0JcmV0ID0gcG1fcnVudGltZV9yZXN1
bWVfYW5kX2dldChjdHgtPmU1MDEwLT5kZXYpOw0KPiAtCWlmIChyZXQgPCAwKSB7DQo+IC0JCXY0
bDJfZXJyKCZjdHgtPmU1MDEwLT52NGwyX2RldiwgImZhaWxlZCB0byBwb3dlciB1cCBqcGVnXG4i
KTsNCj4gLQkJZ290byBmYWlsOw0KPiAtCX0NCj4gLQ0KPiAtCXJldCA9IGU1MDEwX2luaXRfZGV2
aWNlKGN0eC0+ZTUwMTApOw0KPiAtCWlmIChyZXQpIHsNCj4gLQkJdjRsMl9lcnIoJmN0eC0+ZTUw
MTAtPnY0bDJfZGV2LCAiZmFpbGVkIHRvIEVuYWJsZSBlNTAxMCBkZXZpY2VcbiIpOw0KPiAtCQln
b3RvIGZhaWw7DQo+IC0JfQ0KPiAtDQo+ICAJcmV0dXJuIDA7DQo+IC0NCj4gLWZhaWw6DQo+IC0J
ZTUwMTBfdmIyX2J1ZmZlcnNfcmV0dXJuKHEsIFZCMl9CVUZfU1RBVEVfUVVFVUVEKTsNCj4gLQ0K
PiAtCXJldHVybiByZXQ7DQo+ICB9DQo+ICANCj4gIHN0YXRpYyB2b2lkIGU1MDEwX3N0b3Bfc3Ry
ZWFtaW5nKHN0cnVjdCB2YjJfcXVldWUgKnEpDQo+IEBAIC0xMzQ0LDggKzEzMzcsNiBAQCBzdGF0
aWMgdm9pZCBlNTAxMF9zdG9wX3N0cmVhbWluZyhzdHJ1Y3QgdmIyX3F1ZXVlICpxKQ0KPiAgCSAg
ICB2NGwyX20ybV9oYXNfc3RvcHBlZChjdHgtPmZoLm0ybV9jdHgpKSB7DQo+ICAJCXY0bDJfZXZl
bnRfcXVldWVfZmgoJmN0eC0+ZmgsICZlNTAxMF9lb3NfZXZlbnQpOw0KPiAgCX0NCj4gLQ0KPiAt
CXBtX3J1bnRpbWVfcHV0X3N5bmMoY3R4LT5lNTAxMC0+ZGV2KTsNCj4gIH0NCj4gIA0KPiAgc3Rh
dGljIHZvaWQgZTUwMTBfZGV2aWNlX3J1bih2b2lkICpwcml2KQ0KPiBAQCAtMTM1OCw3ICsxMzQ5
LDYgQEAgc3RhdGljIHZvaWQgZTUwMTBfZGV2aWNlX3J1bih2b2lkICpwcml2KQ0KPiAgCXVuc2ln
bmVkIGxvbmcgZmxhZ3M7DQo+ICAJaW50IG51bV9wbGFuZXMgPSBjdHgtPm91dF9xdWV1ZS5mbXQt
Pm51bV9wbGFuZXM7DQo+ICANCj4gLQlzcGluX2xvY2tfaXJxc2F2ZSgmZTUwMTAtPmh3X2xvY2ss
IGZsYWdzKTsNCj4gIAlzX3ZiID0gdjRsMl9tMm1fbmV4dF9zcmNfYnVmKGN0eC0+ZmgubTJtX2N0
eCk7DQo+ICAJV0FSTl9PTighc192Yik7DQo+ICAJZF92YiA9IHY0bDJfbTJtX25leHRfZHN0X2J1
ZihjdHgtPmZoLm0ybV9jdHgpOw0KPiBAQCAtMTM2Niw2ICsxMzU2LDE0IEBAIHN0YXRpYyB2b2lk
IGU1MDEwX2RldmljZV9ydW4odm9pZCAqcHJpdikNCj4gIAlpZiAoIXNfdmIgfHwgIWRfdmIpDQo+
ICAJCWdvdG8gbm9fcmVhZHlfYnVmX2VycjsNCj4gIA0KPiArCXJldCA9IHBtX3J1bnRpbWVfcmVz
dW1lX2FuZF9nZXQoZTUwMTAtPmRldik7DQo+ICsJaWYgKHJldCA8IDApIHsNCj4gKwkJZGV2X2Vy
cihlNTAxMC0+ZGV2LCAiRGV2aWNlIGZhaWxlZCB0byB0dXJuIG9uXG4iKTsNCj4gKwkJZ290byBu
b19yZWFkeV9idWZfZXJyOw0KPiArCX0NCj4gKw0KPiArCXNwaW5fbG9ja19pcnFzYXZlKCZlNTAx
MC0+aHdfbG9jaywgZmxhZ3MpOw0KPiArDQo+ICAJc192Yi0+c2VxdWVuY2UgPSBjdHgtPm91dF9x
dWV1ZS5zZXF1ZW5jZSsrOw0KPiAgCWRfdmItPnNlcXVlbmNlID0gY3R4LT5jYXBfcXVldWUuc2Vx
dWVuY2UrKzsNCj4gIA0KPiBAQCAtMTQ4Nyw3ICsxNDg1LDggQEAgc3RhdGljIHZvaWQgZTUwMTBf
ZGV2aWNlX3J1bih2b2lkICpwcml2KQ0KPiAgDQo+ICBkZXZpY2VfYnVzeV9lcnI6DQo+ICAJZTUw
MTBfcmVzZXQoZTUwMTAtPmRldiwgZTUwMTAtPmNvcmVfYmFzZSwgZTUwMTAtPm1tdV9iYXNlKTsN
Cj4gLQ0KDQpBZnRlciB0aGUgcmVzZXQsIHRoZSBlNTAxMCBjb25maWcgcmVnaXN0ZXJzIGluY2x1
ZGluZyBpbnRlcnJ1cHQgZW5hYmxlDQpldGMgYXJlIHJlc2V0IHRvby4gWW91IG5lZWQgdG8gYWxz
byBjYWxsIGU1MDEwX2luaXRfZGV2aWNlIGhlcmUgcG9zdA0KcmVzZXQgYW5kIGFsc28gZTUwMTAt
Pmxhc3RfY29udGV4dF9ydW4gbmVlZCB0byBiZSBzZXQgdG8gTlVMTCB0byByZWxvYWQNCnFwIGZy
b20gc2F2ZWQgY3R4LiBZb3UgY291bGQgbW92ZSBlNTAxMC0+bGFzdF9jb250ZXh0X3J1biA9IE5V
TEwgdG8NCmU1MDEwX2luaXRfZGV2aWNlIGl0c2VsZiBhcyBzdWdnZXN0ZWQgYmVsb3cuDQoNCj4g
KwlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZlNTAxMC0+aHdfbG9jaywgZmxhZ3MpOw0KPiArCXBt
X3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKGU1MDEwLT5kZXYpOw0KPiAgbm9fcmVhZHlfYnVmX2Vy
cjoNCj4gIAlpZiAoc192Yikgew0KPiAgCQl2NGwyX20ybV9zcmNfYnVmX3JlbW92ZV9ieV9idWYo
Y3R4LT5maC5tMm1fY3R4LCBzX3ZiKTsNCj4gQEAgLTE1MDEsNyArMTUwMCw2IEBAIHN0YXRpYyB2
b2lkIGU1MDEwX2RldmljZV9ydW4odm9pZCAqcHJpdikNCj4gIAkJdjRsMl9tMm1fYnVmX2RvbmUo
ZF92YiwgVkIyX0JVRl9TVEFURV9FUlJPUik7DQo+ICAJfQ0KPiAgCXY0bDJfbTJtX2pvYl9maW5p
c2goZTUwMTAtPm0ybV9kZXYsIGN0eC0+ZmgubTJtX2N0eCk7DQo+IC0Jc3Bpbl91bmxvY2tfaXJx
cmVzdG9yZSgmZTUwMTAtPmh3X2xvY2ssIGZsYWdzKTsNCj4gIH0NCj4gIA0KPiAgI2lmZGVmIENP
TkZJR19QTQ0KPiBAQCAtMTUyMyw2ICsxNTIxLDggQEAgc3RhdGljIGludCBlNTAxMF9ydW50aW1l
X3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ICAJCXJldHVybiByZXQ7DQo+ICAJfQ0KPiAg
DQo+ICsJZTUwMTAtPmxhc3RfY29udGV4dF9ydW4gPSBOVUxMOw0KPiArDQoNCkFib3ZlIGlzIGEg
YnVnIGZpeCBub3QgZW50aXJlbHkgcmVsYXRlZCB0byBjdXJyZW50IHNlcmllcywgcGxlYXNlIHNx
dWFzaA0KaXQgd2l0aCBbUEFUQ0ggdjYgMy80XSBtZWRpYTogaW1hZ2luYXRpb246IGU1MDEwOiBN
b3ZlIGU1MDEwX2luaXRfZGV2aWNlDQp0byBSdW50aW1lIFJlc3VtZSBIb29rIGFuZCByZXdvcmQg
dGhlIGNvbW1pdCBtc2cuDQpBcyB3aXRob3V0IHRoaXMgdGhlIGRldmljZSB3b3VsZCBub3QgYmUg
YWJsZSB0byBsb2FkIHFwIGZyb20gc2F2ZWQNCmNvbnRleHQgYW5kIGluc3RlYWQgdXNlIGRlZmF1
bHQgcXAgYWZ0ZXIgcmVzdW1lLiBBcyBhIHJ1bGUgb2YgdGh1bWINCnBsZWFzZSBzZXQgZTUwMTAt
Pmxhc3RfY29udGV4dF9ydW4gPSBOVUxMIHdoZW5ldmVyIGRldmljZSBpcyBpbml0LiBJdA0Kc2Vl
bXMgdG8gbWUgYmV0dGVyIHRvIG1vdmUgZTUwMTAtPmxhc3RfY29udGV4dF9ydW4gPSBOVUxMIGlu
c2lkZQ0KZTUwMTBfaW5pdF9kZXZpY2UgaXRzZWxmLg0KDQoNClJlZ2FyZHMNCkRldmFyc2gNCg0K
PiAgCXJldHVybiAwOw0KPiAgfQ0KPiAgDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL2ltYWdpbmF0aW9uL2U1MDEwLWpwZWctZW5jLmggYi9kcml2ZXJzL21lZGlhL3BsYXRm
b3JtL2ltYWdpbmF0aW9uL2U1MDEwLWpwZWctZW5jLmgNCj4gaW5kZXggZGE1N2JjMWJhYTQ2NC4u
ODA3ODIxZGVkMTI3ZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9pbWFn
aW5hdGlvbi9lNTAxMC1qcGVnLWVuYy5oDQo+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
aW1hZ2luYXRpb24vZTUwMTAtanBlZy1lbmMuaA0KPiBAQCAtMjMsNiArMjMsNyBAQA0KPiAgI2Rl
ZmluZSBERUZBVUxUX0hFSUdIVAkJCTQ4MA0KPiAgI2RlZmluZSBFNTAxMF9NT0RVTEVfTkFNRQkJ
ImU1MDEwIg0KPiAgI2RlZmluZSBKUEVHX01BWF9CWVRFU19QRVJfUElYRUwJMg0KPiArI2RlZmlu
ZSBKUEVHX0FVVE9TVVNQRU5EX0RFTEFZX01TCTEwMA0KPiAgDQo+ICAvKiBKUEVHIG1hcmtlciBk
ZWZpbml0aW9ucyAqLw0KPiAgI2RlZmluZSBTVEFSVF9PRl9JTUFHRQkJCTB4RkZEOA0KDQo=
