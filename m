Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.225.79
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793356482;
	b=mrA89q8vNsBTajef8J4UlO7TB0PnGrkavXiwyRBWvkZL+1Ce4dJcfosp+3gCS7fBmwtL
	 YY3gLFHm0WGl0c2WW2NXwGWhLeHNTzVobO9ppPD5TsQgArUVEYbU5quAAhW+eCfxJQ+j8
	 1P6IaPccE3AvL90uD8/vqj2Wv1ixcpPJ3Kn14Uap0hQ15Ci48YSaVzvvng1z6+PXFy9C1
	 rSzU4tE4B3themXSy1yHyB4N1L41jVSIr4wE//T/VIoWZT9evKlRj3MRGT1j42PAytGEu
	 YS40SEdXDnwgn/bsPs/NrZj3tdXzn9RK9J+vYFEyVRH7SwGOr+XiDg+YO6ERD/91kSg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356482;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
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
	bh=2DBdSPazdvpcCaVAm9K56d///sRSmUfBlNV2NxqRwRI=;
	b=vg06NYSBmrwrfXZwHaLamb51YAgSvaXzHaN7FK76RRpG9CIFJBK/L39j/rvqPxJqF4Jc
	 qY4iIwCWTNrY6O8h+iu3Pff7Qw7qYscc4IAlT+4tCnR7Od9C3HKMOlOxd//dW10Wd+lZR
	 PXxBQ/cMPqyfRCgNtXfUk3fZkHcswVuKUzenLXLq+RSsbOXuEvPX1Zh1g6O4sOtwlkbsn
	 5vru7ed55mOAWzix/yK+Z8uydwVoEZgjWe4RBhWhZFSjRORRQp90P01xDvBDcYFGwJQbJ
	 8HoKIzXQFLZuuqjbXAifJGIHj5AccVCLrFo/Vk3bUawAd9YAn4Yb0jA3Jkss52TUNKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	dkim=pass header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=LBmh+cfl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.225.79
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020079.outbound.protection.outlook.com [52.101.225.79])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC0660A6F75;
	Fri, 30 Oct 2026 10:34:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAC0660A6F75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=LBmh+cfl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aXtE2Q3KEmU666gi8pL/GOj68/S0fBSCkZczB2U28HyXr4exKs9iCQRoguYROCeXDvRUWsL7QhWGwW+W98HQkeQ1F6gnfsYIN/qz6Wj+SbXjWLaeMEns1864BkaRy4XozlrOYQVpdlnY9svq7R/B1BbY32L06GGMn1cAJplI/CF8cHYXilz/1GXikVpQzsHFKa5YMd15CT/6DotWqDfbzpc2rJZLJsDdFKIP698o6cPE6et7xhxv3NDqZplaCpcA3LulNGsxSvDf9n5H6ejDeBkp+IBSzvl+CBQ2Wl4WclwbmLiPceknpXuDTqx2gPlt43203YIkC4uNLWt9QXOwZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2DBdSPazdvpcCaVAm9K56d///sRSmUfBlNV2NxqRwRI=;
 b=Ny3cnf5MHeePmXECpgHb2Bnx2sQWUKJk6tTfkHmmOXBVEF53Wgu7b3j0NOKwJhqXnsL7JqySzk4Hh36m4ZKnetmz+AOocmzrjjRGJ3p6bpnm7r2k+wVwsdc5b+zHZ0iwp1ZU1QupqNCZRQ/pYQ11Mt3JGt1TzAROvZgBBR0up9oUgNTsVDRwybbZWgbt9Qmh6GFF7r1yvZ/WvV7ACk1vRTnAApy2y+toO6yd3BMBALK24Hv+LqzSbmikwm6Gp61FeuK/nwibuGFvTnyQUFO+pymEp/DOqz89QsioRCZP6dERVF0pCWAuUybSq/TeehMTgcHCAhk3GwaHyYmTux7HBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2DBdSPazdvpcCaVAm9K56d///sRSmUfBlNV2NxqRwRI=;
 b=LBmh+cflixmy7sRy0HG/kT2rFORhPKu0F8iRcd1JC06hSHkKQ5bf+CR6DdrRTX6fMHuD/u7kwXMWlVk8q8B3rXq3TJk1toK0Q8O79SpJFuGv3jkE2a3tTvDJ51hki+089sQovr9KkpljkbigHdzDbN+AY4FeDoucl3OiaYvCmEp8Z/f94nfVY6554bSEJYexibDXUP7xJQos249D/In14t9m2yeNIl0raZX6EmC712WcLqSsaPEg4VmIgoQEVXLHzG9cMm8nJi6nyTWw+W2etY/ji83ZbxeHGd9rky8Y519vGPDX21vjrbpSHIqE1NtNiyDGMLAqOyqKiPERjgS10w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MA0P287MB1404.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:fa::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 10:34:33 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 10:34:33 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: jai.luthra@ideasonboard.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 11/15] media: i2c: os05b10: add 12-bit RAW mode support
Date: Fri, 30 Oct 2026 16:03:43 +0530
Message-Id: <20261030103348.1222201-12-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030103348.1222201-1-tarang.raval@siliconsignals.io>
References: <20261030103348.1222201-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0087.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::32) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|MA0P287MB1404:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f8b2f8d-5fce-4b10-74ee-08df367162f4
X-LD-Processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|376014|23010399003|1800799024|366016|38350700014|56012099006|261009223027099003|261026140227099003|261028144727099003|261021123027099003|261021121427099003|261022105027099003|261022075727099003|261022115727099003|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
 foR27xdkE1lcFAc0tYAHMJ9Vtc32IQ7HoR0iiOrFKfKqojJ50rF9hCF4DwBUoBt2lYLbzqrZCfFftvmWF/aoSGEzcsXGX57C7fM6Qsj2sx+W2eGmzGS6bgO09Y+Uku6C5Q1uta3Ol23nSyKehAnbFikF4VCZ3kD/GIuaZzZUN9VoNbmeRHN9o1H7rSZ1+huEd5FpzluM35Nc94nN592bygUqgHX6PgaXaaY+JVhkyGDEXe5EoucRvxMwqfYC27yprZwswbHkY60tZqZ96weAyOgJkYl+u14KAIbTX7L9xg4ibi8emg1zDms9GObVZCK90H11LSDN+fSefPjFSFxi0KY4qNQDkuP5kLpxFJVfle/WSnXepbtK/ZCNsWbEy+ir5sP3W7d3iuOf7pgNghE/ad/umGIO07SzX92znETMM+DJBC4aEaxwu+PrclHe3VvOxzVm3xuwJyqf7tFtHnNlYHRNij4IRwJLN1vKFVWuzdNzI2nPIS0o1Do5x8JHzSE5KtMOZmWoase+D1mN/qGMbUvyR1VWEELgIr9kGhha6rGMadsTnHlIJ0v2vK794KCSAMMabTuw3eo51iU4cEWYYAtbgderr0Djmv1BlJY4RQYnzJLDF8+XH0YjjcruWySNgdz4y8bquOj5viISZSPW+mP0ymi/10fHZeu1ZsHTY0pIcmBb7dylbTEkI4oNqH4hA9tV773irIAdVxLSIPpFBm8GP32VEDufpMXEBNyOlLE=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(1800799024)(366016)(38350700014)(56012099006)(261009223027099003)(261026140227099003)(261028144727099003)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261022115727099003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?F3cYiGPoJN6YofiOmTh1+HnbSOctQYohbOzjQijRV1Gf4biDIr+GHVI+HA2k?=
 =?us-ascii?Q?mGkREcS1N7g6g62tnARhXwRcDpI/Bq1bSCMJu21LxRi5uly2qgp17munys4X?=
 =?us-ascii?Q?8nwPeTVSPK1PoyLFNP1PQxSlxVpLReGbNn0fJ2RGdJZoGCNGY11MOvkv2yek?=
 =?us-ascii?Q?Gyx+n/LYBVTM8QI/D+3qHuXunEPjvOaGmJVSGF4i1tVw2yM8YkiCTA3ewnaA?=
 =?us-ascii?Q?+bWcCO5AfawnJt4oXHKJSNjh1mAB5mi2HJ2hMYaWm2E7KdbBqLT9K2K0gGnm?=
 =?us-ascii?Q?D7RUVWQHwNyOEATbX85Wi8vswwB2q4KXR835w0QLcfTcqmBp2XgQBIiO3tV2?=
 =?us-ascii?Q?lmXJOc9pbG+J36dCOecUFp6RT8CLBkeY7ACLDJtU+kg6UcG/dn3ISrSyEGzh?=
 =?us-ascii?Q?HOLUCDB/dz7tqHfCCN0UMbRBEQoz+mRsfYi6b4UHYiLYHMvPsBhBCBHhkLij?=
 =?us-ascii?Q?PwWPawda+Pof325eTYRB3402XP/PSekkGTwOYgXLS+dx86NGL/T1uMktN6Do?=
 =?us-ascii?Q?XXRtxuJO0pXOYrXqXrcGOpbg81XP+kuOR4qf9zEK+Pfh+55Njw0rzlDQrUpl?=
 =?us-ascii?Q?Ko0GI7/Iolg+VNh5H+mXKyTluJfcvWQ9FOeT0pBi42VW4/+ox/Nrx1P7z+Q+?=
 =?us-ascii?Q?2PhIeWpigba+5ZErfX9psoUfys7fp/I3dG8L3J4+KiuKtJy9xJDj5hmW6PhH?=
 =?us-ascii?Q?a7Cm5a9U/TMvab6LRkKwho61+OvTRs1ATiF79JrXf0mFayrTzMAGhmJ4MWdg?=
 =?us-ascii?Q?joUFFqmvpuw2pLUkDEXm/w3bKFL1ay0LZDZafFYUF+IQTVpusO9r0dJVhenQ?=
 =?us-ascii?Q?TsdAr2gx74Nkk1aCaFWwct0o5ISpPGe8+PjPA9Irl5gI4N24Qkoz+6WGJQKm?=
 =?us-ascii?Q?8T0v/ox47q3qUhmo2SHzR+tJHfDzyqp/bsvAeUdV1AUnXO6Vccqhp8NXYvBH?=
 =?us-ascii?Q?tYmLUTmnXr5wk35zTDZjw5Y0hibNErxsFPJy88olJUgZ56oxeBmJj4R7JmkL?=
 =?us-ascii?Q?aVC3GWKRbmYuCFoqllGjlRIQTIKuiALqdYBj6rzUzq1+SUYXkgxSj9Fc6RC3?=
 =?us-ascii?Q?qdD4Rso9FtwB8gqnqEWa9wbSTRYXu6dFv6+AZmYmQtfOgvJsO3G63YZF5IQm?=
 =?us-ascii?Q?U4xRUnxDGgrmWwprP/nr1FuHeIee/3Q/5SLG5Dqrfo/jTK68u9WtiAVNNZiC?=
 =?us-ascii?Q?wGGy77wY2ZuJhTrb8zU8G5+1S2owQPX288k+lUBsuMXVqepv4VJAvFDCdNrZ?=
 =?us-ascii?Q?JDXU+JMvCNM6cpwyOqqI1htIQ7SAeJwOehl1rHjP4qtDx8aa3PRhXxTB+BB4?=
 =?us-ascii?Q?A5qTee2SLvV+1+JSWFj+Vw+kCrlQGHav+JbDPqnAOarzxmi0hIpbTh5Ssdtt?=
 =?us-ascii?Q?JkYquXujQt+Qoyo2d7Nt/x82Sky5XSwLtjitjTj6WmdhwJqdFTpbOxpe8VvX?=
 =?us-ascii?Q?Vppeu9B2iDnYZMyfAc4q9UR/oJFN59lQlA8A6jYKxhPtn8cg/HAK78m37NN4?=
 =?us-ascii?Q?C72GCh2fkqlCmO/IZYW1bOj0HuqYm2FKkkVu8XOScyKXApvkGzNccTdAy/Mr?=
 =?us-ascii?Q?Ydct3luGmIAE0/m27hQ3BPCXPNBnhIfhxi1PpvzPRqocwplHYyBN5q9TBq3T?=
 =?us-ascii?Q?ZSrJPgs3KR339i2mVz3IdlRx0BKAgua+K7L2GskhNEiVgstiYMfuIXZKsvIm?=
 =?us-ascii?Q?zVKCwHR1n3gl2fSyazxNSpLmOWwuxDiqtfDCAnCwQGxRPl3HrkzsEwTz9nLO?=
 =?us-ascii?Q?8hWIokL2578dE9l8KkFwW2lOD3eapFs=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f8b2f8d-5fce-4b10-74ee-08df367162f4
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 10:34:33.0237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oRFlI31K+GIgHRFO88weHGd2MWTlwk/jPxfqxcH9l2Y+y8BC4BG0ZCShLdir423MmfzEfchI2ossYxS96FT/BBXJLFt/Nv06czY4CTMOx0o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1404

Expose a 12-bit Bayer output option in the OS05B10 V4L2 sub-device driver.

Add a 12-bit mode table alongside the existing 10-bit mode, extend the
enumerated mbus codes to include RAW12, and select the correct mode table
based on the requested mbus format in enum_frame_size and stream enable.

Also move OS05B10_REG_MIPI_SC_CTRL_1 programming out of the common register
list and program it at stream-on depending on the selected mode bpp (10/12).

Change os05b10_get_format_code() to take the target media bus code
instead of a bpp derived from menu index. os05b10_enum_mbus_code() no
longer needs to special-case "index == 1 means 12-bit" -- it just
forwards os05b10_mbus_codes[code->index], and os05b10_set_ctrl() passes
the format's current code so HFLIP/VFLIP toggles keep the existing bit
depth and only change the Bayer order.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 126 +++++++++++++++++++++++++++++++-----
 1 file changed, 110 insertions(+), 16 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 48c905165954..ba6a22ced3db 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -142,7 +142,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ CCI_REG8(0x301e), 0xb4 },
 	{ CCI_REG8(0x301f), 0xd0 },
 	{ CCI_REG8(0x3021), 0x03 },
-	{ OS05B10_REG_MIPI_SC_CTRL_1, OS05B10_10BIT_MODE },
 	{ CCI_REG8(0x3107), 0xa1 },
 	{ CCI_REG8(0x3108), 0x7d },
 	{ CCI_REG8(0x3109), 0xfc },
@@ -494,6 +493,21 @@ struct os05b10_mode {
 	struct os05b10_reg_list reg_list;
 };
 
+static const struct os05b10_mode supported_modes_12bit[] = {
+	{
+		.width = 2592,
+		.height = 1944,
+		.vts = 2007,
+		.hts = 1744,
+		.exp = 1900,
+		.bpp = 12,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_2592_1944_regs),
+			.regs = mode_2592_1944_regs,
+		},
+	},
+};
+
 static const struct os05b10_mode supported_modes_10bit[] = {
 	{
 		.width = 2592,
@@ -515,6 +529,7 @@ static const s64 link_frequencies[] = {
 
 static const u32 os05b10_mbus_codes[] = {
 	MEDIA_BUS_FMT_SBGGR10_1X10,
+	MEDIA_BUS_FMT_SBGGR12_1X12,
 };
 
 static const char * const os05b10_test_pattern_menu[] = {
@@ -546,14 +561,33 @@ static inline struct os05b10 *to_os05b10(struct v4l2_subdev *sd)
 	return container_of_const(sd, struct os05b10, sd);
 };
 
-static u32 os05b10_get_format_code(struct os05b10 *os05b10)
+static u32 os05b10_get_format_code(struct os05b10 *os05b10, u32 code)
 {
-	static const u32 codes[2][2] = {
-		{ MEDIA_BUS_FMT_SBGGR10_1X10, MEDIA_BUS_FMT_SGBRG10_1X10, },
-		{ MEDIA_BUS_FMT_SGRBG10_1X10, MEDIA_BUS_FMT_SRGGB10_1X10, },
+	static const u32 codes[2][2][2] = {
+		{ /* 10 bpp */
+			{ MEDIA_BUS_FMT_SBGGR10_1X10, MEDIA_BUS_FMT_SGBRG10_1X10 },
+			{ MEDIA_BUS_FMT_SGRBG10_1X10, MEDIA_BUS_FMT_SRGGB10_1X10 },
+		},
+		{ /* 12 bpp */
+			{ MEDIA_BUS_FMT_SBGGR12_1X12, MEDIA_BUS_FMT_SGBRG12_1X12 },
+			{ MEDIA_BUS_FMT_SGRBG12_1X12, MEDIA_BUS_FMT_SRGGB12_1X12 },
+		},
 	};
+	unsigned int is_12bit;
+
+	switch (code) {
+	case MEDIA_BUS_FMT_SBGGR12_1X12:
+	case MEDIA_BUS_FMT_SGBRG12_1X12:
+	case MEDIA_BUS_FMT_SGRBG12_1X12:
+	case MEDIA_BUS_FMT_SRGGB12_1X12:
+		is_12bit = 1;
+		break;
+	default:
+		is_12bit = 0;
+		break;
+	}
 
-	return codes[os05b10->vflip->val][os05b10->hflip->val];
+	return codes[is_12bit][os05b10->vflip->val][os05b10->hflip->val];
 }
 
 static int os05b10_update_test_pattern(struct os05b10 *os05b10, u32 pattern)
@@ -565,6 +599,34 @@ static int os05b10_update_test_pattern(struct os05b10 *os05b10, u32 pattern)
 			 os05b10_tp_val[pattern], NULL);
 }
 
+static int get_mode_table(struct os05b10 *os05b10, unsigned int code,
+			  const struct os05b10_mode **mode_list,
+			  unsigned int *num_modes)
+{
+	switch (code) {
+	case MEDIA_BUS_FMT_SBGGR12_1X12:
+	case MEDIA_BUS_FMT_SGBRG12_1X12:
+	case MEDIA_BUS_FMT_SGRBG12_1X12:
+	case MEDIA_BUS_FMT_SRGGB12_1X12:
+		*mode_list = supported_modes_12bit;
+		*num_modes = ARRAY_SIZE(supported_modes_12bit);
+		return 0;
+
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+		*mode_list = supported_modes_10bit;
+		*num_modes = ARRAY_SIZE(supported_modes_10bit);
+		return 0;
+
+	default:
+		dev_err(os05b10->dev,
+			"Unsupported media bus format: %#x\n", code);
+		return -EINVAL;
+	}
+}
+
 static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct os05b10 *os05b10 = container_of_const(ctrl->handler,
@@ -625,7 +687,7 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 		if (ret)
 			break;
 
-		fmt->code = os05b10_get_format_code(os05b10);
+		fmt->code = os05b10_get_format_code(os05b10, fmt->code);
 		break;
 	case V4L2_CID_TEST_PATTERN:
 		ret = os05b10_update_test_pattern(os05b10, ctrl->val);
@@ -649,7 +711,8 @@ static int os05b10_enum_mbus_code(struct v4l2_subdev *sd,
 	if (code->index >= ARRAY_SIZE(os05b10_mbus_codes))
 		return -EINVAL;
 
-	code->code = os05b10_get_format_code(os05b10);
+	code->code = os05b10_get_format_code(os05b10,
+					     os05b10_mbus_codes[code->index]);
 
 	return 0;
 }
@@ -684,11 +747,20 @@ static int os05b10_set_pad_format(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_state *sd_state,
 				  struct v4l2_subdev_format *fmt)
 {
-	const struct os05b10_mode *mode = &supported_modes_10bit[0];
 	struct os05b10 *os05b10 = to_os05b10(sd);
+	const struct os05b10_mode *mode_list;
 	struct v4l2_mbus_framefmt *format;
+	const struct os05b10_mode *mode;
+	unsigned int num_modes;
 	int ret;
 
+	ret = get_mode_table(os05b10, fmt->format.code, &mode_list, &num_modes);
+	if (ret)
+		return ret;
+
+	mode = v4l2_find_nearest_size(mode_list, num_modes, width, height,
+				      fmt->format.width, fmt->format.height);
+
 	fmt->format.width = mode->width;
 	fmt->format.height = mode->height;
 	fmt->format.field = V4L2_FIELD_NONE;
@@ -732,12 +804,21 @@ static int os05b10_enum_frame_size(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_state *sd_state,
 				   struct v4l2_subdev_frame_size_enum *fse)
 {
-	if (fse->index >= ARRAY_SIZE(supported_modes_10bit))
+	struct os05b10 *os05b10 = to_os05b10(sd);
+	const struct os05b10_mode *mode_list;
+	unsigned int num_modes;
+	int ret;
+
+	ret = get_mode_table(os05b10, fse->code, &mode_list, &num_modes);
+	if (ret)
+		return ret;
+
+	if (fse->index >= num_modes)
 		return -EINVAL;
 
-	fse->min_width = supported_modes_10bit[fse->index].width;
+	fse->min_width = mode_list[fse->index].width;
 	fse->max_width = fse->min_width;
-	fse->min_height = supported_modes_10bit[fse->index].height;
+	fse->min_height = mode_list[fse->index].height;
 	fse->max_height = fse->min_height;
 
 	return 0;
@@ -750,13 +831,18 @@ static int os05b10_enable_streams(struct v4l2_subdev *sd,
 	struct os05b10 *os05b10 = to_os05b10(sd);
 	const struct os05b10_reg_list *reg_list;
 	const struct v4l2_mbus_framefmt *fmt;
+	const struct os05b10_mode *mode_list;
 	const struct os05b10_mode *mode;
+	unsigned int num_modes;
 	int ret;
 
 	fmt = v4l2_subdev_state_get_format(state, 0);
-	mode = v4l2_find_nearest_size(supported_modes_10bit,
-				      ARRAY_SIZE(supported_modes_10bit), width,
-				      height, fmt->width, fmt->height);
+	ret = get_mode_table(os05b10, fmt->code, &mode_list, &num_modes);
+	if (ret)
+		return ret;
+
+	mode = v4l2_find_nearest_size(mode_list, num_modes, width, height,
+				      fmt->width, fmt->height);
 
 	ret = pm_runtime_resume_and_get(os05b10->dev);
 	if (ret < 0)
@@ -770,6 +856,14 @@ static int os05b10_enable_streams(struct v4l2_subdev *sd,
 		goto err_rpm_put;
 	}
 
+	ret = cci_write(os05b10->cci, OS05B10_REG_MIPI_SC_CTRL_1,
+			(mode->bpp == 12) ? OS05B10_12BIT_MODE :
+			OS05B10_10BIT_MODE, NULL);
+	if (ret) {
+		dev_err(os05b10->dev, "failed to write pixel bit registers\n");
+		goto err_rpm_put;
+	}
+
 	/* Write sensor mode registers */
 	reg_list = &mode->reg_list;
 	ret = cci_multi_reg_write(os05b10->cci, reg_list->regs,
@@ -832,7 +926,7 @@ static int os05b10_init_state(struct v4l2_subdev *sd,
 	format = v4l2_subdev_state_get_format(state, 0);
 
 	mode = &supported_modes_10bit[0];
-	format->code = os05b10_get_format_code(os05b10);
+	format->code = os05b10_get_format_code(os05b10, os05b10_mbus_codes[0]);
 
 	/* Update image pad formate */
 	format->width = mode->width;
-- 
2.34.1

