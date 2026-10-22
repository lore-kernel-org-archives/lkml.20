Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792653327;
	b=jnFFwyBR23bf1ZgOCD26PJvS5ATTq1LEP2UF643bnAoRL3VMZLrRw0CDO6hDVAOUfVsi
	 H2Oez8+gtgkwWQRUnt6ZI+tXAK4NlXCEzZ0AK/AUM/NZXX8+UF90Q5K3QrdFGTxa1WesC
	 DbE1L8c7duDRCIo2tKx/XrBla8GAPqbdACexmUDXkSo5iD68KCMpC8ooShriTKu23BtEg
	 4gl31B6Gvv6Sb/4o89Ox087w9Ko31XP23YduxqZzwoQ3qcntMtoWhnY/hetb/FppQjW73
	 yoiFikwLrsXeM06ZWpMHfj+BcDTDXbViGcjlWeOmBaMCHYGG9kzUZmSZ5v+JvKEBWtg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792653327;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=7Q3N5y6FeOIbRETnf3xz+mjBCnf/3IxLfp/xZa/Pu/w=;
	b=UuivePt2QR6m3YE8U5O7d070TECOLrRWpFSWKp2veSVpSe9bVjdtlWqX049DjWpovis2
	 jAR+OhtXhiRxlkB54dtfCtNcVyQe+MhJJa1xSTggxQ3dkTWuV18m9JfEckinZ/NlMoS1X
	 GkrUqTsQu2vrE7ZUAUv4VlPr0QWIi2Cy9O9eTGy1/gxw92krRkMH9jR2zAbdQOITcN8GG
	 NcXEkfniTwabPFAwcCouB/DcUEF7wI88P6bkL0Cl9Kw7ZWd7mfziq1UMi6RWGJIPT8+CG
	 274PR4keqplRTlxs5F8RLRkXE+fY1J9KjCS4fzACNC4+F4NDsnlLR9m3D+MjngoLReQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vivo.com;
	spf=pass smtp.mailfrom=vivo.com;
	dkim=pass header.d=vivo.com header.i=@vivo.com header.a=rsa-sha256 header.s=selector2 header.b=B+owjcRu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.25
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013025.outbound.protection.outlook.com [52.101.127.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3E5606A319;
	Thu, 22 Oct 2026 07:15:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA3E5606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vivo.com header.i=@vivo.com header.a=rsa-sha256 header.s=selector2 header.b=B+owjcRu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dXjrURLWoKy5GfUDBpk+FbnDkfmy1xF+0zY8/IWYHssiAiOEMf0v2B7yL05j9YxiQiE9qZ4QcE2/YuqF4ucaqRVIC3Ibqexp85aaHaorSEy8Yw56LfFlDF5Xa29qlxXJSOKuw0bi4EttQ0prSJ0kXveGEibDUcPKc5kghaH/7oLMtFpPzuBDIz8aa4/llNOQkuIcX5JoFzfBkcPtDekAaZt0zr+7qOEttJa/B1ro2mAyvX5UUdX+43iiwc0oNnUPdzu2LA/eT370N2FIBtEV8pLp2BQYYqUrkqjUeDATDMZJVTYLM/ubWGggmVQ2G/vKQiF2Xbqv3eb5RlCDI2wsHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Q3N5y6FeOIbRETnf3xz+mjBCnf/3IxLfp/xZa/Pu/w=;
 b=bXULQmqEfly5sfocbIEcoOqEGk3eZB+lZDbDosTaDfkAoMhf4ZPII6eG8NDvMuooFKW0RDoIk5EhTA3wxp0qA0qVmpR7TeWgrygxSvUtakc+0BZ16/zmOhke8oOVlv74s3bNrkRkCOah0Ca4zqy+YpxHIBNxE01zk8fmdgNh8ooWKzVIlmB4ZojJYZ2vQs+lG1NXdt7GmdaOAchkUwAe6h8jv3HMyeOjwqLOmmHKlbLKWJg2vDbl+B3GAblCY0oHKCImOQXQebaS0AG6o0RIQdZ/zuPm/CdTMSED3LpjqN1/5vm/hacnAemp1avZp3hv5h/tKheCi1mnSzokh10/LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Q3N5y6FeOIbRETnf3xz+mjBCnf/3IxLfp/xZa/Pu/w=;
 b=B+owjcRuZOLtRvFnkTrKmR+XH5fIQg/T+2+mOh5YYg4KNOV9fm2B5gY0b/lUqaJixvk/ZwoQBcAiFCzHDWmdoCZm9iMlE/XFVOPluqDOT8E2cRqQm9acfgLqzYQKbghBy4vXIvx8XrAJTXZAS4IXJI5sF2nnZyKGoBWKXtZhqAjtX6tzQnZ97wz0NM7mU6NR5AqrsWNaEo1ZpnYCL8MdqdYqJGahzxQcTobCdQz0FLLmNic/0CQZ060yquXQwzU7xok9BC3YozFgk9YMBpsLz3cCibMeqHF/FxQGewJvswebJLTTwlvREHbXNETwwLp2THzjSgOKanCNcN1qcxsICA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com (2603:1096:400:358::7)
 by TYSPR06MB6435.apcprd06.prod.outlook.com (2603:1096:400:47c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.2; Thu, 22 Oct
 2026 07:15:23 +0000
Received: from TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc]) by TYUPR06MB6217.apcprd06.prod.outlook.com
 ([fe80::8d51:58c7:42f3:ecc%4]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 07:15:23 +0000
From: Lianqin Hu <hulianqin@vivo.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	hulianqin@vivo.com
Subject: [PATCH] ALSA: usb-audio: Add iface reset and delay quirk for RYDZ Technology USB Headphone
Date: Thu, 22 Oct 2026 15:14:56 +0800
Message-Id: <20261022071456.14256-1-hulianqin@vivo.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JH0PR01CA0041.apcprd01.prod.exchangelabs.com
 (2603:1096:990:5c::11) To TYUPR06MB6217.apcprd06.prod.outlook.com
 (2603:1096:400:358::7)
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
X-MS-TrafficTypeDiagnostic: TYUPR06MB6217:EE_|TYSPR06MB6435:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bab5615-297f-4c3e-9e4d-08df300c3cc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|52116014|376014|366016|38350700014|261021123027099003|56012099006|11063799006|261009223027099003|10067099003|18002099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	J1KlJTEOviV58b7GEtf6t8SOK/3/r2P31g56EXED4Pj1RigYypsSkjlQO9tb7/VfjVh/jfch9hnuSCr6Ll+OREVBid/9gj6dNxl/vXPtrrQdmY4uanmCvceDrJ9+3Jd0rfogUAllPNfUZJZ1hMCNVHOz72zFAb+M6Rz1KfCrJ4gzmU+rMFTEjzPUDXwmBVWoIkJr2QzPwUqI3fenKf3fFEIu7za0Qf5c3Q14oyszPG4qcdbJfSIPpp3OO1m2QyGziJkecpeUnerv214R1dikcx1UWBHwGFytoCeYcrmJX63bx2o8SDn7bQeyWgkH2rH7XPJ7iDLXk3w3wirHFJLJljlkGFEt3MAsTA+O8LjgnsZf+A9y0k8Ejp1bZMZwq87OUnQDX70ZlyXH6S3/oM9qKC4tXYDX+GnbnRsdIcRAiuAaRrjTQEx9I07so7l3kLCWF1dRf6mQl7+a0Cv8wgQB4H3gVy5mQxLxFeUrAzDPMP6WwuKsxu4JZHmBc563I/76B0OKF5WPO038JnPRKfCqEceQhS4ZlGttKLb4c+pEv6YwseT5wlxzfCvJ02geaBnMFFakPFBwUa8rLpWY1OIRoMGa9VagfRNNi4UkvLpucHjQg9eG+Ub4YubRU3NhjMXsyhWMVdi3DdJ6sfOTEc8XzNAEz+sN5s6BGp7h+UcParxgN/jARtR1WdoDIR94lc9lnuHZZcvFgc4o2E0vRhpEwoeNrhDD3EpcYlfOpsyGJYc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYUPR06MB6217.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(52116014)(376014)(366016)(38350700014)(261021123027099003)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WEYxs5kfa9SrrmyhPnfvxrq3T83DJSdeL8BemiKWcwvMgRB1IkRrp8nybazu?=
 =?us-ascii?Q?Qv2xUxLefZCaVBpC+Rqq6NiavPlDTeIhzO/sMDADeBbjl/jRPbWp9QSs5nPV?=
 =?us-ascii?Q?DPd2Rx8sp6doQyPlSSP8D3hvbDAWsQT/qPy6TItVRk2rSobenCLOEu0ygRkV?=
 =?us-ascii?Q?RLbdUJEiluFiL2l3e8IHEwkxGtxuO4dXP3qL7lQYejcEXjy89ab5ZwzftXqS?=
 =?us-ascii?Q?5MJSb/7i9+bXnQ9QnMCrziYmX9qsCK2/j80SNrZZPz3LoIKhknJucP0Cx2DS?=
 =?us-ascii?Q?ff+bIoAKpXxCfnMAfkg+RyTSc/VBtPgBV1GA1jFccIkPzIIT7jAxDS4ikUSo?=
 =?us-ascii?Q?NAb3ipcRvCCnUkS0lmR7lqgxy5mH+iZV79MGsBxQeYJE6903fACLzLby27/W?=
 =?us-ascii?Q?1tF+IVN1nR4sSwL20XOOsZ6lHV//TWPry2GnzeKxGiU3OgWzPA8fBY5FzC7L?=
 =?us-ascii?Q?vLCeS+L6A4FfZ/HLnLpglILwsGRgA0xA18VFz4Jynix1S47pBV+/2RD4M/gM?=
 =?us-ascii?Q?nu5NvslFfBjUD/bVvW1wAQUFizsQN/yBrEszw233YqcRRi5QRZFmb952PAxX?=
 =?us-ascii?Q?1I7GSkogQgLrKYhkBoREYzvO923mLNJYxx0tbsVELbyrhZ1TRFwmypTfGrHZ?=
 =?us-ascii?Q?iCr8LGC8aACtNpDOPg442OFj46c7QNAMWGMXg2tFfrj+fnPfPe3LI8RNov/q?=
 =?us-ascii?Q?B4zjoilSmkfBhzr/ODYFBCSwZ6uVd1yHrMj54KVfbMnHDox66dZmHqnOz3Hb?=
 =?us-ascii?Q?derd8DoZguDZGx4EyOFirFwFPDAX8qxcf7ePy3eZ3RswLu7YRxpJ2BPzzZvo?=
 =?us-ascii?Q?3CsITBzZM0vbw9QpXkHhQc1U4EeEHqmJTY7W2ndVpRLhEYF9nDQ+Y6UH1+2w?=
 =?us-ascii?Q?rPhLsmjkgVhNtNHZ5munFeKIMYK1u9bu0CaZPzrWxzd4Kd9zpK3e8+fP3ZWC?=
 =?us-ascii?Q?ivZCrh7WLfONGH++so8rlHizu2HzqVUmpZ84KewZi4bg235HqUCkevjhz/rj?=
 =?us-ascii?Q?2nAZkuODb5SRHZgl2UDnrDGlllFqxYE1ZUdrdhvBKBabaporo541cKQow+6p?=
 =?us-ascii?Q?aVnGX2qSLXvB15yuX1opxJqDKM3JWqzb61+VRs7j1Jb1d2aec2mWlz99jjUQ?=
 =?us-ascii?Q?vNF04Y+JEvWoQgrr8NMFn2QURyq3smx82FJyxkhVioxAENuTl1JCu4iX9gRq?=
 =?us-ascii?Q?YcfmQUxLq4EK0UKFx574i1dKfXWCe9U+gGZ6Yr2Bk6Hp8aask1PsAwBOGBMK?=
 =?us-ascii?Q?N/mD3j46zEDC8WLzgTFaKaMXZU2j8BANVY7It+qZ6XTXKXGe56pRFSO2HH5Q?=
 =?us-ascii?Q?KvJYOMEmffNLrAzg7AXzGrwe113WZE5+LgQVyNik0cmgJB642q6STxkElLgW?=
 =?us-ascii?Q?SdvkS+Sg56qWiFFf+RX1HUW9FVW4iuNobJ09Nzc+dur14f2FoZj4O4eJLF1v?=
 =?us-ascii?Q?qGk6y1LJrRGiwlX98z+ckMMpWxDv+GiQXyzbY5dJ0Ac2EAYUKCtU+3WICL9r?=
 =?us-ascii?Q?Wp7sD4cR1G0Rs7Q9asrfx3vW8Efj8HH4B1qG+Fagcx8rzIzpGda2GUIc65Ep?=
 =?us-ascii?Q?jUhtawbZbRU8Kn9GmatkpfrHepFCaSIC+qNVZXjjm40XxBLP/WUsLKgBr1X3?=
 =?us-ascii?Q?qHEJMpEkrlnT0Smv53nhxWvJ/8vogaUjaR9jxR2do1XSHDbsyaf+MZ2HDej6?=
 =?us-ascii?Q?JIOJ6SFKFQuRCwrw+ryhWDkd2wvvhwt58B3KHKvM8Y7/+dHcIzkcV3XQ3cqE?=
 =?us-ascii?Q?ut3MJEFNOg=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bab5615-297f-4c3e-9e4d-08df300c3cc6
X-MS-Exchange-CrossTenant-AuthSource: TYUPR06MB6217.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 07:15:22.9643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hxJRhrWTKkky/KPb6qxear7GyxBGmdAKPEBlxL0Gff6Hye6/PKWIQGkAwaPA7swTlQUogPiDTQQvcBHU6Zh/dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6435

Setting up the interface when suspended/resuming fails on this card.
Adding a reset and delay quirk will eliminate this problem.

usb 1-1: New USB device found, idVendor=0124, idProduct=0c36
usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
usb 1-1: Product: USB Headphone
usb 1-1: Manufacturer: RYDZ Technology
usb 1-1: SerialNumber: 202601131108

Signed-off-by: Lianqin Hu <hulianqin@vivo.com>
---
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index a54fabce7920..d8e138b97fbd 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2238,6 +2238,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
 	DEVICE_FLG(0x0124, 0x0c21, /* Generic USB Headphone */
 		   QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
+	DEVICE_FLG(0x0124, 0x0c36, /* RYDZ Technology USB Headphone */
+		   QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
 	DEVICE_FLG(0x03f0, 0x654a, /* HP 320 FHD Webcam */
 		   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_MIC_RES_16),
 	DEVICE_FLG(0x041e, 0x3000, /* Creative SB Extigy */
-- 
2.39.0

