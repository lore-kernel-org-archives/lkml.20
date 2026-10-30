Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.57.137
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793356487;
	b=FIH8nkVBnIZYaHlP0NonM6bVHxh4+Ap1oPod4XmKVtCQwNGO48RcOjkRS1tN0fiivpog
	 QC0dL2XJKg+mXapeK8tCrzhbF8R1pgtjEJjbZpuOaz+jRRstu5OuFKknH02WnzRUFRfRx
	 MMI3o13Ezdmyvte939SPwuOiuAoRTe+ItVDP+uwMMF67ZM2cdh/MV2rItahxHdPm5ikc9
	 zTBnZccAjiTFrdpWCFt1Gaxx9j1/7g4z0ohKPhnQRamCGJsRZKdvoVRQSE8CW7aIk+BD6
	 WWFkL4bFPSjmSi2eUHlypOCEm2JReSuYIMEb2BrKvOjGJc+439zNmCQGZvZtMx4ytYg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356487;
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
	bh=49KRd8UxR1pQMrPCAVOAW1/OVAyicUCL3MeSGgaWqWw=;
	b=g7x992os3t06nmVA0c+Py25/YHfYwyADhAu38L38QysqBW1acu1fAIZbPuShw1RsL1Y7
	 bHibMqji8+4wPG5rr3qa4rG60T6VH6MG9T3f3dHJ+59pbcjfE61tgPTs0hKP4bHXuhiZj
	 ProBRnHttp6iaTYZ7Z5x4KiAWlCtMHrnXTBpA7hsQzkB6WeDEIB1QvQDEayWHTZgSFr76
	 5jAEgD5KjDLIJDSatzPl7zaRcktwwU1E5gh96gQR7LtGSr6/5uZbpP8nUoesorU49TCkd
	 g3tJwTK9pYIBdJwGPR9ARbOwAE4JpIGkCFfQQFhRmMEymy44S+oN10QBwC9f1WUsROQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	dkim=pass header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=eiT09kME;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.57.137
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021137.outbound.protection.outlook.com [40.107.57.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866C360A261B;
	Fri, 30 Oct 2026 10:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 866C360A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siliconsignals.io header.i=@siliconsignals.io header.a=rsa-sha256 header.s=selector1 header.b=eiT09kME
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K5SJWXsT7mSGO3u1HUb+L9ccJbMOcFDWB4WaxLnFs6p/Y5n1NUDDt1uHdzY9jN6toF+9Pz7I+Jc+d5EVQK7aMKWoC3egiX1kPaOG6AeVlwDRDOxE06cXVPq3T2L2fW8p3R9senwKRpfc3+KIA0I2JnSDkDOyZfzUhVXeqsgQHyBiAbrGtdM5ScdIGoxeGTsUvXUIIeL99bD3YKdZ6iTEHsqPt7rs7GQxu39RbgszRAdj10PVNNEljie6ISImk0WrQRuQW3rsN8B+IDjZaCNcGWtsODoODQU57xWh9/7K6xHkXF7n6LipD75h71GAnD3zyvZBnTY51O7rt3cOXeEVBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49KRd8UxR1pQMrPCAVOAW1/OVAyicUCL3MeSGgaWqWw=;
 b=Ls9PVN/jhe5zqKzqpIIonWH9x0a7s0RaUIMgJQ/sEgfhzN9zUnNFrS7PhIH8tbG3tzpJ1cUGMu3FyrX2UUBOYpddHubUpEnd43fjYBtlCSL/TaRyBau0VaVV/nmHrQXnVrbH3BWPy9EeXEbaWgyixXIdNxp/Jg+L2VLb8iJVAM5kACUIvAgpVqgu7nh38p3VcRfJ8qLBHUPyPxXC3hVAQImkTKyFoSeWdOMZV1ush3t1ZGeu2i3tMyxqsR1r8lcCpKPSC3ZUP0i+BZpvrgXp2x1kOfZEzxmaE3TFPWdZj8q0d7jVmvmtrP2debQwX/3eLLvIoqDWgBO6bxDo1/qCWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49KRd8UxR1pQMrPCAVOAW1/OVAyicUCL3MeSGgaWqWw=;
 b=eiT09kME9YcUDig8++KW2GvG9VyMHPna/PV2kMFvS56WVDoizDyHwBolv2DUmZE2vDbjDXsCZcAFHookfCXn+WiBTaakX/6ZRY/s9/BT3owgXZ6fiz/Tpb7rzje3fKBAQqPt+SdW5iGG2k5FW0J/3IJ/ALV3GlDNRUn5U+dg+QFPBBcx56I+7Qm/iWRr4w7POxiLnyQ4uvvK2VL++LgISZnNGzgY5Y7ArcejfN+YT2Bbi09bwhu06lgdW0n34erpHmkMoyNve/FvcU+UU5cotkrYB3WH9KKtb8hbpnvSTbe455i0HnnCUkhVfMvYT/2S3ELQJpri6j5eb+JDdgMfQQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN4P287MB5073.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:306::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 10:34:41 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 10:34:41 +0000
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
Subject: [PATCH v4 15/15] media: i2c: os05b10: fix horizontal blanking calculation
Date: Fri, 30 Oct 2026 16:03:47 +0530
Message-Id: <20261030103348.1222201-16-tarang.raval@siliconsignals.io>
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
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN4P287MB5073:EE_
X-MS-Office365-Filtering-Correlation-Id: 44c7f814-2d4b-468d-8db9-08df367167b3
X-LD-Processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|23010399003|376014|3023799007|6133799003|10067099003|18002099003|22082099003|38350700014|56012099006|261026121527099003|261026140227099003|261022115727099003|261022105027099003|261028144727099003|261021121427099003|261021123027099003|261022075727099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
 ihLmv9/mb/PrzzBN08upPvBHWIhPTYB3weegDJLcggRet0OdP4Lj091oLQqZLEhB5ojF2m8K/Jhlsc/mu3DD7VNr6ykfst+ldjaDBuNYc2Blp6SsHRsVzDGEOSLhrsX5qkMTC+HDiKrc/gvUTc6P9GlHaaWGp/qH0Z9AFbTSpgXmbt6gMlnPbTweFrM8XyOLCDHQpYA1mebnG6w0z4W09eIWhn9slcmIwhXDrV/jahNq926O2GjcR4k7TTSbYP3NTSgDaPXefcU+wjIqRLqmo/cKyECHtPVIyQ0I+OejaU+eDcjHvyLew5n+aLr/mJV2l/zCEkfSTTE6pBJfnWx+bz3q1OV9PiOZwmwTDpr37Vl/lJumuF4qCau7NF8sJ/XDqJ0kkuWPhRD+R9lA1hf3aDgGmba9e3p3I+xqS7VtRXEzpXuf/uJtp+oiwGz4EzHLenRTdmP/ZyE5A50MJf7k5BZhWArHmRMu1wu5FbAFktcGe6jIcfKFk/pIZzDbqg0UL7oPQiUbEshWIcY2BfIdk+gqXDlfFwzBA/Zx1KC6/kzo439M7MiBRl3OL+xX3d2MIVW8WUBrYJxMLs3Q5MPM0ggYhMEyKsJj/JLcHvKBIWmq3MM4/qVo8RWXBVsmyzI3oZaa6MdWgbVClHFB07ZMpMlKvOXRVlDjvRS715Nwu7Xss4SOvegHNuNX7EIGz6njIg7uuFTnw+frjlTDmnonkhMtkLC1F1CmlaF081CNOLE=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(23010399003)(376014)(3023799007)(6133799003)(10067099003)(18002099003)(22082099003)(38350700014)(56012099006)(261026121527099003)(261026140227099003)(261022115727099003)(261022105027099003)(261028144727099003)(261021121427099003)(261021123027099003)(261022075727099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?n7yYNZ55Pc1EX60i0pSDS7qtnQAyWLirsGfEeK/7YSxE4rTfYNdwvL+/AXYe?=
 =?us-ascii?Q?x5XnTKrVmWbLIk3Ri9aOI3lnVqVtqJ1ixfgAaaxUxM7LgUd26ZTcD2sblXT3?=
 =?us-ascii?Q?m5u2KVQ9VxEL1QX2lves8UAAKMdAEn89buC6cFKhXoSQWUepfwAuyC8P6icq?=
 =?us-ascii?Q?wnPwa+EMqN5nIagk+fphkMd9wFLWERd10PzJHUK+n1KMl+wsYSl93ciqcC1f?=
 =?us-ascii?Q?WYdC4IF9hpbP4Nx1wBAhiO31W62dV1609PGrm196QfnwL7rbWa5cZvSUynsW?=
 =?us-ascii?Q?8m1dVBT3KOkabBDzmGZBIRy9dND/kHUJgLA08pNQfbcBcspAhOPH+AhFGDy/?=
 =?us-ascii?Q?IrNXOgP5dKjrCTlbw+cI3pjpK5m3AtzRSKukNeCS3UY5sK9fx6vxJs1HMl/u?=
 =?us-ascii?Q?mnr0xq49ybLqxZpUZgf6FJ64tdWSpwy4VuC5OWSuVX5FVqM6Y0/MkPv/MEW8?=
 =?us-ascii?Q?oVU1R5nheKz2sEvBv3k27eJupAKvD/ctbryA5EBbVpVf1JEBUVL0LvrlgVi6?=
 =?us-ascii?Q?oKlbBjdNe8akZ50142lXG+giKMXFe0yFeicBHxYBDGOYu45vKXIknLgJnCIJ?=
 =?us-ascii?Q?M6/7SM++mj9EHuLezXNCs9lW/jceDWbeg7QF8KH/15eQf2VTXRqCebWYy+tC?=
 =?us-ascii?Q?BNxI6rWNaYHtuGABj9z16m5cadaGCNbXdrEoT5H2V5RSRYSFYHX+lvaavFbR?=
 =?us-ascii?Q?kQpHkCaJffZ+5wpqOT/o1yX7UsAZkKzo92GvVTh0rlKCp5h4gv9s9gpxCSvq?=
 =?us-ascii?Q?0HR60uaWqYLLv54svsfK+UHbIzWQlo2TGFvA0WE4G8vUGEYBhOty7r1CsyBY?=
 =?us-ascii?Q?ZIfj4hYDAAj3BZ1VmFwoT99a3Y26S3x6Jx5u5f73AKkweFJ7ZaLdLzYVsQyx?=
 =?us-ascii?Q?UYGMV5xbMuPeYaVT32v2MlsSaUzCXk1zhqgI7w/l+Rc5JMWdk84hMOjC+2Ld?=
 =?us-ascii?Q?Pqp0nNopgUhax28BahFv2hVHJcR7CMg5VH7ZlLi8FnjEBmhIqe4eoUnRFCJ0?=
 =?us-ascii?Q?5an6E8RWfB7kZeVOCdvCMYSwvUAZie5jXoMpmLuPTWW7MClwCDHDBU1aklJc?=
 =?us-ascii?Q?kxTZUSKudxoKAbZRNdFMJ9p4Ca8KvivjrUQHWU3L28SyhRageQWv0MewI5y3?=
 =?us-ascii?Q?bZhMeCOh0QK6awDuboA1ABcMJrtTWAp5TaKUnJCJl61429ZsHHocLW96BPui?=
 =?us-ascii?Q?tEb6rVZqHCK4e13/+EG1POGWOplfx96GBlhQMRa5mwNi5+8SyzrRccKriuw8?=
 =?us-ascii?Q?WDg/X38WjA9kpa4I//6OSmMeYYbkq47koJS09L5V+9ttffcL7X53Xdl4oLb/?=
 =?us-ascii?Q?kc6G6oZz+qeD7XS606oHcyMaCHtoiDFtMEyeqJJG42tL3uOsnvUySx953x+3?=
 =?us-ascii?Q?mt3lBGJBkjPU0tXay1TQooou40okCNtYDM3BPPMU7PGTj+10NmE2dJtITRPZ?=
 =?us-ascii?Q?zdtUFHXW1kzI9KKTivDQkHfESoEajHR0ot1USy9Uhki5kOdg8rMV9h6tgu9A?=
 =?us-ascii?Q?iwONW39i4uD3BGnyJAPu1MbMY0DQFLSSjCmv/7ArAu73HEDLgALSQ8k1rchp?=
 =?us-ascii?Q?NaOMmHfLzirnS2JiBLe1KAFKGnWJqdUVT4IA9V0sNmA0KolvONmjNt57JKXw?=
 =?us-ascii?Q?zRNwOGM2jsYh5HDI0CUkgWdLy3DyWMbvnCfCKtPdTRjUefnn4F490meZwx7K?=
 =?us-ascii?Q?TY12BZEOOrvrWmHL1koqXVbDIVWDsMm22r+hO+RsT4sGHDBJHydbQWpnWexx?=
 =?us-ascii?Q?tRwjKpWn4JAI+GWd8vMRvaPW9lV0xUo=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 44c7f814-2d4b-468d-8db9-08df367167b3
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 10:34:41.0000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yMkOofzXHwXV6RmvzMqxCnFnzTR909T054Gs02HNMJfenho8zUnYLANjRn1Uh7xzIyXXQE5U940wuLjsezP8Rplw8xXPpKflGjDAYI3W2Xw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN4P287MB5073

The HTS register is not counted in output pixels, so "hts - width" is
meaningless: for every mode hts < width (e.g. 1744 vs 2592 for
2592x1944) and the u32 subtraction wraps. v4l2-compliance flags the
resulting HBLANK range:

    fail: v4l2-test-controls.cpp(413): returned control value out of range

The timing generator counts lines in internal clock cycles that cover
several pixels. At 30 fps in the 2592x1944 mode (HTS 1744, VTS 2006) the
line timing is

    HTS * VTS * fps = 1744 * 2006 * 30.01 ~= 105 MHz

which is half of the 210 MHz system clock. Use 4 pixels per cycle, which
gives an internal pixel rate of 105 MHz * 4 = 420 MPix/s.

Compute HBLANK as HTS * 4 - width, with a step of 4 pixels, and report
the fixed 420 MPix/s as PIXEL_RATE so that
fps = PIXEL_RATE / ((width + HBLANK) * (height + VBLANK)) holds. This
rate does not depend on the bit depth or the number of MIPI lanes, so
stop deriving it from the link frequency.

Fixes: 3aa9296a23ec4 ("media: i2c: add os05b10 image sensor driver")
Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 38 +++++++++++++++++--------------------
 1 file changed, 17 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 9284b21a92c7..4e87a9bd0f4d 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -113,6 +113,15 @@
 #define OS05B10_LINK_FREQ_600MHZ	(600 * HZ_PER_MHZ)
 #define OS05B10_LINK_FREQ_750MHZ	(750 * HZ_PER_MHZ)
 
+/*
+ * HTS is not counted in output pixels: the timing generator runs at half of
+ * the 210 MHz system clock and handles 4 pixels per cycle, giving an
+ * internal pixel rate of 105 MHz * 4 = 420 MPix/s. This is independent of
+ * the bit depth and of the number of MIPI lanes.
+ */
+#define OS05B10_PIXEL_RATE		(420 * HZ_PER_MHZ)
+#define OS05B10_PIX_PER_CLK		4
+
 static const struct v4l2_rect os05b10_native_area = {
 	.top = 0,
 	.left = 0,
@@ -872,9 +881,9 @@ static int os05b10_set_framing_limits(struct os05b10 *os05b10,
 	u32 hblank, vblank, vblank_max, max_exp;
 	int ret;
 
-	hblank = mode->hts - mode->width;
-	ret = __v4l2_ctrl_modify_range(os05b10->hblank, hblank, hblank, 1,
-				       hblank);
+	hblank = mode->hts * OS05B10_PIX_PER_CLK - mode->width;
+	ret = __v4l2_ctrl_modify_range(os05b10->hblank, hblank, hblank,
+				       OS05B10_PIX_PER_CLK, hblank);
 	if (ret)
 		return ret;
 
@@ -1260,23 +1269,10 @@ static int os05b10_parse_endpoint(struct os05b10 *os05b10)
 	return ret;
 }
 
-static u64 os05b10_pixel_rate(struct os05b10 *os05b10,
-			      const struct os05b10_mode *mode)
-{
-	u64 link_freq = os05b10->link_frequencies[os05b10->link_freq_index];
-	u64 pixel_rate = div_u64(link_freq * 2 * os05b10->data_lanes, mode->bpp);
-
-	dev_dbg(os05b10->dev,
-		"link_freq=%llu bpp=%u lanes=%u pixel_rate=%llu\n",
-		link_freq, mode->bpp, os05b10->data_lanes, pixel_rate);
-
-	return pixel_rate;
-}
-
 static int os05b10_init_controls(struct os05b10 *os05b10)
 {
 	const struct os05b10_mode *mode = &supported_modes_10bit[0];
-	u64 hblank_def, vblank_def, exp_max, pixel_rate;
+	u64 hblank_def, vblank_def, exp_max;
 	struct v4l2_fwnode_device_properties props;
 	struct v4l2_ctrl_handler *ctrl_hdlr;
 	struct v4l2_ctrl *link_freq;
@@ -1289,9 +1285,9 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 	ctrl_hdlr = &os05b10->handler;
 	v4l2_ctrl_handler_init(ctrl_hdlr, 12);
 
-	pixel_rate = os05b10_pixel_rate(os05b10, mode);
 	v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops, V4L2_CID_PIXEL_RATE,
-			  pixel_rate, pixel_rate, 1, pixel_rate);
+			  OS05B10_PIXEL_RATE, OS05B10_PIXEL_RATE, 1,
+			  OS05B10_PIXEL_RATE);
 
 	link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &os05b10_ctrl_ops,
 					   V4L2_CID_LINK_FREQ,
@@ -1299,10 +1295,10 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 					   os05b10->link_freq_index,
 					   os05b10->link_frequencies);
 
-	hblank_def = mode->hts - mode->width;
+	hblank_def = mode->hts * OS05B10_PIX_PER_CLK - mode->width;
 	os05b10->hblank = v4l2_ctrl_new_std(ctrl_hdlr, NULL, V4L2_CID_HBLANK,
 					    hblank_def, hblank_def,
-					    1, hblank_def);
+					    OS05B10_PIX_PER_CLK, hblank_def);
 
 	vblank_def = mode->vts - mode->height;
 	os05b10->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
-- 
2.34.1

