Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.225.113
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793357324;
	b=xVTpwr6M+t7yeMlLTTv/0YIZIaKwuCWssY9f4M5fAwMWdu3K/FC+PKU80gjfaEiX6BBh
	 qjybqu7nhJAOK4Tt4FKO/gvWI71HbiPe/ykqg/VDScuJb4IOtqyVypJw7DNStbtoPQKuW
	 MtCsxq8wwcxgMp3UDMkpM0u9v1+9WVV0RyGa6UtBjZDe5PdhoFirPfLXMzgfBKVt/pe/T
	 z82BG81QxqtBpHGLgrneuGvDm2V1JBjnLm5RIkYTYrPF2gkwPLSrTip2WyUqsMvP4HEol
	 lPTiRO9VNkw5/qorpQElfmWLgjaEjf48Fwv2DOc3UdYFJmY2g87qBpmUhS+5lNgDOtQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357324;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:Content-Type:Content-Transfer-Encoding:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Vo/BVSGwRs0CdYXoDug0IT+lfUZIH8k2HXrR3dECsSk=;
	b=skWyjdgVsSJXaDLb10zvvesNG4V1Lvk3mJ+kKxLIgI//E7Kek3QOhSc6YSGG02UQ5iWA
	 hS4Oz+T46htF6HOuwrhxhVbeLC4o7jHHk6+k3a22QZRmDoXfY2FSoKGA5qJ7dbH+YLA3c
	 UhjF3j0PxbdfipNvSAcJlPlj8zoROLcO6eC1GbmulPLle0aoB1SwZrrbmE3t+565MmRfZ
	 ve08KLfw16eq9/ME0Gy/ikXBfCVExc5CSaxPSDeCmEtXKjWD5LQQpFzpeI7AWasZyjJV1
	 4NXWJAV/WfE410UF7sMfLctzYrEBvJEykZ+dJM43tsmCYFuZLH/R7TvBTc25ziwUBTw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	dkim=pass header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b="JF/Z/qWM";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.225.113
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020113.outbound.protection.outlook.com [52.101.225.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05790606A31A;
	Fri, 30 Oct 2026 10:48:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05790606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=JF/Z/qWM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s1XIbLDitZruy6PFc00rpOMx55sYU5HtgieSwK6lxeTWObNS7Eb00EoljfraNpEeOjf3R42y3ioGTZunv0ByxxmgPMcR953sVVI0mo3enZ4FfhqanZAYIiH+XYqFvw2RpmFn6hUJAFQynq8DW1lhK2cRpfoKR3+YkNpMre6ZBM0pldM6dnDDQG+KLVmgUL1RSVswOy0vIIa1e51jXFAFohuyiytJeKH1YH8tuyI1I7cWEGpb/gPJyAglxUfjMe3nn+xv3lZ0qFgZYG2c/hrIJo5mz9xUfYj+ygRCs1DB332Tn50PD1Tdi9Sn4MUzTyFpFHKdwtcBfH3BcqGz457yTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vo/BVSGwRs0CdYXoDug0IT+lfUZIH8k2HXrR3dECsSk=;
 b=BlvUWcFAa7nrkLCqG1wOvdxooxsLcCc+y8LdqE0tVH+gEZwBj6RnjlM5Zvcp6kAE9cqIz2trT1Mcb9zohW4XlGfvC8HqmNV2qht00aR/LX2O/7RtfGUkBjrLzTisi8djjO4A7MYrbw3p3m+3BoDcYTMzfGDjbehiKVVmB1qKj/52EFk15hwxI3gkfFLxaGhW10i0kHhtHRRKTW6abYqdUo0ZnXVLKqq8xM18p9SY2Zfp+rbp/Do5kZ2NCTgw44p9SL4TUfUNPQqMIGrdB2cL9wmqwpNu/s1EkSCZPzAPXqWq3tINaxIvqBgaPACunZAzd6rTK+tZdGuEPEQlnbXwYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vo/BVSGwRs0CdYXoDug0IT+lfUZIH8k2HXrR3dECsSk=;
 b=JF/Z/qWMPtgVR6+1FmlwvlM9gZiQ/Ch0xlDgTdX2uL1OkgQcDI8F3KNzD4A7mCwmYRo/1/XrxbJbdL9Io768zwyeXy1+ueGp4TrLtdNN6HMR3v5iy2aoIhzpYQrFun9LrcYXsYWEjPCMU6nVuZLBk+kwOY1Ie1FUCvngC3NnJSiTXaaJHQovLhEFCon7eJ7U5A/fEZvw6TQUjcXMduzj/gQwS707n5PViD6jM6jR/bk4o5bDJiEEFUYivBmKhXMxs4G9If5Hb8IxqlmKboli+OoWVJ0JYQXszUAjxODviW+57rAspXpI6no2bzwtYVVljQNj520kx1rXQUeIeX0aOg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN0P287MB0391.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:da::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 10:48:39 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 10:48:38 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: jai.luthra@ideasonboard.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 00/15] media: i2c: os05b10: Refactor driver and Add new features
Date: Fri, 30 Oct 2026 16:17:49 +0530
Message-Id: <20261030104806.1223991-1-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN0PR01CA0006.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::11) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN0P287MB0391:EE_
X-MS-Office365-Filtering-Correlation-Id: e7d3556f-0eb1-4b4e-b4e3-08df36735b24
X-LD-Processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|23010399003|52116014|376014|6133799003|10067099003|18002099003|13003099007|38350700014|56012099006|261028144727099003|261026140227099003|261021123027099003|261021121427099003|261022075727099003|261022105027099003|261026121527099003|261009221227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
 qdJkaOQOtxtd91DZSc1gj6Rucq4Mbh5NL1cwpFf/Y9aqn0vqrXZceee8mf/+aO/8sr9fIPhSkLvriV66esWe8LZybDBGG7F55H8lWedTApZSqOAiVodZ9Ik/Paoz55bayFeM/uVyKuJ9snQMaEZ90jMocrUObYWXk+idWxLzOTHtocliwLLLiWbDDHG9pUCp42UB+hyN8w1T4I7ccEEx7lXyQ06PpgE3g8rdio4n0Bz1/Z9N41oAUMinViK/ukU41WVSNxYsVXxbcCZBJS6XuN/T9QENSxnyIhCYBc7pRJju5Ff/2dmkUgac8ncT/Qi6FXo0+iWkEiu11j1XH4ivnr+OE72QMDa4W7uunELqT8UFjCU7nFH2eITri1DUbKCY4cCzYnIMzGS1SSGFbm4SZJLeFXcCWoZbrM+lhJEq514b1SX7zMlDqgZGvDdgH9rcDqy/bYJqs7jFfB5Jcyy4n3vct5yyWkHo/Ms/vrBYg7UiWGDSBRDcXU+pDrEJZzF+5zJCFZTMDWmaBhYYhCkSCBqhADEeqYYYJQX28M1NCMlJx35LELoo2K0JeYC7HiCtboGPb5IRNhmW8nVFDIMBQlvFk2L5pp6uLHXGLj7Y1c+w3LmQyhiKZscB0zSPO88BCnezTjfl0uW+foDSQkR9MChomLsgNStCXRbGbpBOVxg=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(52116014)(376014)(6133799003)(10067099003)(18002099003)(13003099007)(38350700014)(56012099006)(261028144727099003)(261026140227099003)(261021123027099003)(261021121427099003)(261022075727099003)(261022105027099003)(261026121527099003)(261009221227099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Q0FTNDQ4MUFjSTFEME0zenBFYmZkdU5xdkVHTFlYaCtsUHlCamFWNnIzbzlP?=
 =?utf-8?B?Y21NeGltR1BPd29OeHdacEZoNUY4NW5VRlhJbFpxMElrSGpsZkJKbmdxSWc2?=
 =?utf-8?B?N1l3SkVEcXVCMnF5TkhHSW01U1d2R1lvUVY2VS93TlRNbUVsYTBmQ0NYdGRC?=
 =?utf-8?B?RWNSbU1aSVg3SXhVaDFaN1lOMVVvRjdaeXFVbnNLZVdjSFJhNFhIUFpqaEUz?=
 =?utf-8?B?TWhxQm5qTlFlSGJKQnN1SDFQeWhxQUlZQUFsL2wrQVdtTnhkTDhXWCtyUHpy?=
 =?utf-8?B?TCthb21odGpqS0RvODQ1bFBxM3NDc2tla21xNWxITGg4M0VFS2RPZ1FNRGZV?=
 =?utf-8?B?VXErNnZBa1Z0c0FSVUlFTjVQT3hFWENCT1ZIcXJ2M2NJM3dvNXgwVGNuOGVz?=
 =?utf-8?B?dGxWNDVlVzdzNlZxVDlKUEF6VVFid3NMRXc0ZmxJUjJ0K2VXU2hLbmhmNUlR?=
 =?utf-8?B?U3pzengvb3IyalY3MFpLN091SGFjQS9RTUg2MDF0VlZMMDkza3QrR1pKM3p5?=
 =?utf-8?B?QzVUK0JVUU90alhRcExSWVN1TEhFcHZhZjNaaEFyMFplTXhaWHhYYUtPVTNh?=
 =?utf-8?B?RTlhU3cyZjJ4UWE1WXNYTXA4UGVrMGlhZVFxUWRKUzRWZmptZmI2VDNwK1VY?=
 =?utf-8?B?aE5SaDUrWVlaZ0xRN09BUnZlZENVak16b2JFL0swMC9xR1ROTmhvcHdKVG5S?=
 =?utf-8?B?NitGSzcrNGlTWXBPTVJFeEVmOFhWL2NDVTdVY21SU0FWS3hVbnNUWS8weUhQ?=
 =?utf-8?B?dDMvY3pScENMK3V4cnd2TkVZMVpBcnBreWYwN0Mzb0dXTS93c1VRSWMxQkM1?=
 =?utf-8?B?QURrMzVrVGhFVys5MFVUbmZaZEM3VlFVczI0bUFtZXRSTkVTZ1dId0ZERjI0?=
 =?utf-8?B?Z0x5WHcwUnNkYnFJeW5GZXg5SFRqZjNQMjJVdGJQcExEWVE0Q3czdU14cyt0?=
 =?utf-8?B?VzN6Slo1WTI5Q0ExOWdtR0hBcHBCd1BSNE1XeEdObWIwV3h5d3hrZFFqTnBx?=
 =?utf-8?B?S3hDZVNtak9UdlRMc3pPemRQQ2FlazlQU1VYdTVJajliVDFacU5yVjBONk1s?=
 =?utf-8?B?SDAyRkEyZ3pIc0xSU0dYVXlSUkg0eGVRckE5S3Zodm01WUVaV1ZyNUNDVW5Y?=
 =?utf-8?B?VVkwdlY4dC8zNVFLTXNGUGZYMnBQNjdEM3JGTHRERXRDOENQb1JiMjVEMU1Q?=
 =?utf-8?B?aDJjNkx2NElnNmxwbFNiR2ZKeWR0amhUN2FLK0RwKzBmeVIwMlYyU0FvU1FC?=
 =?utf-8?B?NHR2eHJodURBalEyWnlWeGZJVXFhVzN0MG5Jdnc0R3Q0cThHNG1JbDdJWFc5?=
 =?utf-8?B?bmRzOWhsMHNaMG1LcnREVmFmRGZ6Zk5SVnBpMWdDUENuYmcrMFlYNWFzcGNu?=
 =?utf-8?B?OTZiRE5wNm1wOWxOMi9yUnMwWXlwbXNWN1NWVDVTUE5pa0kwRzY4U0VMcWcy?=
 =?utf-8?B?UmFXeDlXMHlIa2lIc3Qrb3R2dmFBcVhOUVBvMUF4eWNYMlhHSGlMcFZ2UVBi?=
 =?utf-8?B?YzU1dUtPRXpPa2k1cE5Mdjhqako3d0lLZVVxdUtaNlBRemt0L2RmcFhBN0E1?=
 =?utf-8?B?OHNUaUpZN1UxQjliSHdlTTROWnNBV1NIM3R2SmJINHplWnBqY3lEZXZKR3Bj?=
 =?utf-8?B?THYrTlZaYTdNMm84NVovV0k0OUZtUDhpNDBmcldqUHRHU3JwT1dSQUV4ckVo?=
 =?utf-8?B?N2t6ZStDYUR1akNFdEVFdXdzVDZCdTdvcE1OZEJsZVJUV3lPSFZ4cXJoV3Fx?=
 =?utf-8?B?OHVxckRrVXQzR2ttR1ptZlpDZE1ZQXN2TkpidWlhN29oakozdnp0aS9qYVBm?=
 =?utf-8?B?cytnK20wdWc2MzdMRFBOdCtiM1FVeWRDd1paSmZCSExZa0FvTTBJUjdSQ0xn?=
 =?utf-8?B?alB1K1l2WVBwMFE0bmwvMm9NbHhvMk5ONWN4eERaMk8zTTRwK2hBQmt2b1oz?=
 =?utf-8?B?a05CUHhzb2dOcE5PN1N4eEh1SjFnOEs4c0N3M3M1L1A2VDB6NG9uM080L2pG?=
 =?utf-8?B?QXpmclJaMDZEVStJeXM2MnpwdE1WWVN4NStzbHZSSUIybXpCa21lcGo4K3F0?=
 =?utf-8?B?YXpNeUxtYnZ5bzAvS1pLMVovRG02V1ZEOS9vYm5ISlh5bnZYaTZkM0RIU2k1?=
 =?utf-8?B?dmVmcStlSjZpamNuQ1dsazhxRkJFK2lNaEdicE5lbVF6ekhiOENoQWIvS3U4?=
 =?utf-8?B?T1JINjRLVTZ2dk9INUFWTUNNSGR1bkdPNC84aU9FVlF1TmJFY3ZsWks4Y050?=
 =?utf-8?B?SFM2UDNzT0RQQU01VHZGT1lvYWNVTEJLT3J4bjdUZW1zb0xzRm82L3VxMTk1?=
 =?utf-8?B?cVlLcWZPdnNnV1htWDUvQ08rRnlZL0RUeE51ZmpPdUpNUlppU0NmdXFjamV0?=
 =?utf-8?Q?JCDpeXNK4JJuUMaA=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: e7d3556f-0eb1-4b4e-b4e3-08df36735b24
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 10:48:38.9236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WgRszXESZHd8T2PfhHRqJ6g7DqaKVolLQe/N1AL/rNvye1j0lsSOEKiELA+rtpkWtGHp5MSnFQGbEuLHDTQGoTjqoulU9xvnfBj4FR43KQM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0391

This series improves the OS05B10 sensor driver with cleanup,
refactoring, additional controls, and support for new modes.

Patches 1–4 are small, self-contained fixes and cleanups. Unused
group-hold programming is removed, the vmax variable used by the
VBLANK control is renamed to vts, the active format is updated before
adjusting framing controls, and runtime PM autosuspend is enabled.

Patches 5–7 refactor the driver. Register definitions are introduced,
the initialization tables are reorganized by splitting common and
mode-specific registers, and unused control fields are removed with
simplified error handling in control init.

Patches 8–10 add additional V4L2 controls including digital gain,
horizontal/vertical flip, and test pattern support.

Patches 11–12 extend the driver with 12-bit RAW support and add new
operating modes including 1080p and 2x2 binned 720p.

Patch 13 keeps the exposure range and default in sync with the active
mode on VBLANK and mode changes.

Patch 14 adds support for 2-lane MIPI CSI-2 operation.

Patch 15 fixes the horizontal blanking calculation and reports the
sensor's real internal pixel rate.

All patches were tested on the Debix Model A board running
Linux kernel v7.2.0-rc4.

Changelog:

v4 -> v5

- A few patches were mistakenly sent from an older version.

v3 -> v4

- Reorder the series: simple fixes first, then refactoring, then features.
- Drop v3 patch 1/17 (Use pm_runtime_get_if_active() when applying controls).
- Drop v3 patch 9/17: pixel rate does not depend on bpp.
- Patch 4/15: Call pm_runtime_dont_use_autosuspend() on probe error and remove.
- Patch 5/15: Add OS05B10_REG_PLL_CTRL(n); use named values in the init table.
- Patch 9/15: Chain cci_*() errors; update active format on flip change.
- Patch 11/15: os05b10_get_format_code() takes the mbus code instead of bpp.
- Patch 15/15: HTS counts 4 pixels; fixed 420 MPix/s pixel rate; add Fixes: tag.
- Collect Reviewed-by tags.

Link to v3: https://lore.kernel.org/linux-media/20260718200912.16001-1-tarang.raval@siliconsignals.io/

v2 -> v3

- Patch 1/17: Drop Fixes:/Cc: stable tags; use "if (!pm_runtime_get_if_active(...))"
- Patch 3/17: Drop unused HDR define; use GAIN_DEFAULT macro;
  DIGITAL_GAIN_STEP 16 -> 1 (tested, not in datasheet)
- Patch 4/17: Drop unrelated cosmetic reordering
- Patch 6/17: Use OS05B10_MIRROR/OS05B10_FLIP macros instead of GENMASK
- Patch 7/17: Clarify 0x5080 removal in commit msg; fix test_pattern_menu[]
  casing
- Patch 8/17: Merge codes_12/codes_10 into one table; handle NULL mode list
- Add new Patch 16/17 & 17/17: Enable runtime PM autosuspend; remove unused
  control fields/simplify

Link to v2: https://lore.kernel.org/linux-media/20260325114404.95188-1-tarang.raval@siliconsignals.io/T/#t

v1 -> v2
- Added a separate patch to fix the use of pm_runtime_get_if_active().
- Modified patch 11 Remove unneccery exposure range update now just modifiyng one time only instead of twice.
- Add One patch for fix negative hblank calculation

Link to v1: https://lore.kernel.org/linux-media/20260306123304.76722-1-tarang.raval@siliconsignals.io/T/#t

Tarang Raval (15):
  media: i2c: os05b10: drop unused group-hold programming
  media: i2c: os05b10: Rename vmax variable in VBLANK control
  media: i2c: os05b10: Update active format before adjusting framing
    controls
  media: i2c: os05b10: Enable runtime PM autosuspend
  media: i2c: os05b10: add register definitions and use them in init
    table
  media: i2c: os05b10: split common and mode-specific init registers
  media: i2c: os05b10: remove unused control fields, simplify error
    handling
  media: i2c: os05b10: add V4L2 digital gain control
  media: i2c: os05b10: Add H/V flip support
  media: i2c: os05b10: Add test pattern options
  media: i2c: os05b10: add 12-bit RAW mode support
  media: i2c: os05b10: Add 1080p and 2x2 binning 720p modes
  media: i2c: os05b10: keep exposure default in sync with the active
    mode on VBLANK changes
  media: i2c: os05b10: add 2-lane support
  media: i2c: os05b10: fix horizontal blanking calculation

 drivers/media/i2c/os05b10.c | 725 +++++++++++++++++++++++++++---------
 1 file changed, 556 insertions(+), 169 deletions(-)

-- 
2.34.1

