Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11020128.outbound.protection.outlook.com [52.101.201.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8F8214A9B;
	Sat, 26 Sep 2026 12:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790425820; cv=fail; b=tp4LDhMZKJZL3KODxgcv9jMeQzzle2Qo/KWnxjsumQtlMIDvrB/BKkglfzC1Sy//QOEyWKcOeQ8he+7s23v6VEUbvwKbVslSHafq1hBeV9qFnFMHdHPZsf4wnzNoiFX/wRyjHUJdPKnYOASQhDpVyUDuYDAolZ8Y18Swdgr43hk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790425820; c=relaxed/simple;
	bh=xOl8IGphyiZ7k23LgKKB1m8dPP7v/TQLAld1mVSxkBU=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=oAXP4ooaZorteP69vy4beC6uVVTiK7US5eO/DnpbVp93/3/Wv54oACj7sfbYfszNBExVqjBdjuXD6Lk9vgMkiPZmeviSE/+1ICz1/Q0RuNr0tGuH9RlT/xv3xpjbTFOGspANdEM6S6uv3F/KHDSp6Uu9B+fPSyqZ6KrDA9X+H5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inmusicbrands.com; spf=pass smtp.mailfrom=inmusicbrands.com; dkim=pass (1024-bit key) header.d=inmusicbrands.com header.i=@inmusicbrands.com header.b=N50bi+ht; arc=fail smtp.client-ip=52.101.201.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inmusicbrands.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inmusicbrands.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inmusicbrands.com header.i=@inmusicbrands.com header.b="N50bi+ht"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MHGXs7FX2VpedzM5icJXwvu3j8eVlo7rGmQnT9sGzP5urPJZTuTu1Qpb0etZYfn26Z1xyFsRHsFqV6BVOLGpLe1tYicIRYPcl9KNLAP4cAO192qxtCIg7K4UiOSk4UJ3LSB0ZfJnKBXR9mVfqhEd/gbi5O0A0a4oJVbJ1GSlYwHUDFX3sCgPeJj3KsPTgSCW7/oaxUVDdR7MVv3InBgyJlOL/h9PMMyi997xl7AYwONGpRatcOvDnsj6UBaSKJElE/ffc3rRXih/i6zGXJm1RjzIU5aUo+yONyhkUed4NGcB49/Ctczw9dWff+eo7sGL/tO9oy3zBtlmlzu0tu67RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=abD+KsnFWSmUh8F1wZceMC0ht6cpp3prLqIlmdZ+jr8=;
 b=ldCzHHY1BCjhlEbrRuUO4nrcZY5zPnAY/b+q2D0Rz2TWj+/SN8GU7LERSMiL0ZMCt0PkaZUL+tzwRboVW5lBjl/md8bklPWGbe3WVWnKnEZHLXEYAKz6YqLo403/T2xMguwZbrwYLcz3Q7qtviUMssjrwff9wOdwWNsqXat8761tO64XhyYKk7BD6Jdi2TM7Tsg3SAviAd9+HC6kAIj0/4LZdbxkT3kMCRydGslJTkQJ3ZXg+Jg4px/St/u5qRT1i7LRgZ5iX6Ok9nn+8vCG2M8T48HB8FUi/QjRmCSGytLtx1gTV8UhG7XaV2FY3HudJFbhltk+tm8+7Ame2xIo9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inmusicbrands.com; dmarc=pass action=none
 header.from=inmusicbrands.com; dkim=pass header.d=inmusicbrands.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inmusicbrands.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=abD+KsnFWSmUh8F1wZceMC0ht6cpp3prLqIlmdZ+jr8=;
 b=N50bi+htjzT+NbYGu5qZYS8+bF9NYUDmzq5vaHJGHCGaISRUWpM2mhdOHb7wCxmRFq435HtKrAQ658JjF1Peb+xjxrtZ0MWaQCUEyItiiT5tFCBjzLGFmgIBhg88soKfcm4LFjPIbaihUg+DM67J9aA/BFmVsmYjl/hJ0uz9aX8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=inmusicbrands.com;
Received: from BY1PR08MB10263.namprd08.prod.outlook.com
 (2603:10b6:a03:5ad::14) by SA6PR08MB10427.namprd08.prod.outlook.com
 (2603:10b6:806:43a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Sat, 26 Sep
 2026 12:30:16 +0000
Received: from BY1PR08MB10263.namprd08.prod.outlook.com
 ([fe80::399d:caec:5af7:cd51]) by BY1PR08MB10263.namprd08.prod.outlook.com
 ([fe80::399d:caec:5af7:cd51%6]) with mapi id 15.21.0451.014; Sat, 26 Sep 2026
 12:30:16 +0000
From: John Keeping <jkeeping@inmusicbrands.com>
To: linux-media@vger.kernel.org
Cc: John Keeping <jkeeping@inmusicbrands.com>,
	Jacob Chen <jacob-chen@iotwrt.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: rockchip: rga: fix rotation on rev0 hardware
Date: Sat, 26 Sep 2026 13:30:04 +0100
Message-ID: <20260926123004.3874721-1-jkeeping@inmusicbrands.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0662.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::18) To BY1PR08MB10263.namprd08.prod.outlook.com
 (2603:10b6:a03:5ad::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR08MB10263:EE_|SA6PR08MB10427:EE_
X-MS-Office365-Filtering-Correlation-Id: e8b85b2c-ef97-4c36-6fe8-08df1bc9eb88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|23010399003|38350700014|5023799004|10067099003|56012099006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	/YbZgtKUiO5Crx8OgzwCsEdmrLhQP+c3XgsIsu70OHplX1zaPHoqTIW6mooUCMh+pifVYYI58WME2az1cK6aX342ly/NlrsOJT9uHtx0atqbH0PPjZkvALr4K4RoPegAEsY7673WFXwvLmVm6FxlRD4xZfjtWkNKhM2dQLYlLaPNUszR0d2fDbgU3cPlvCehBOz3QD8gdJhCaKssnDskqsBX25G7JaNZ22s/KR5gqLel9bg7UlwyVWIalVz0pztRWm3R3mLzWZSFvpP0h4nvBpuxK8yH3YkI2/CufCIEPrOQmIEkWskBUUl04hqVUgxWi8g6JF7vDkLIKquHuHVRJUZXINjhJJzD0lQ5dd079KJi0VGkbp4+5dTDo2icV5IFgHbbold8fYlUqSsiVVUrWUBC25aRb+57QNOIhH6EYONGn4xi+JgT/Zw95c75MahY6Y7cqPiO8qpT+9SarLQfD908EIYBDRnqp43petbKAdBK5axU0GD28HazPfJ4FaerH/Isa8OH5u5PoDL+bv2fxh6t8J0i/Ms3viMw/EFtFGmiS/QsfzVinRCRe9HDE2/9IMuBmYNkoGKcY5NnPrUlSBEH0XHDiHpOEJR5n+0Hxu+Qz2wcZSQTarEdlWQrLHjS4Czbi2HWu/H9dEHwhtxnGimu+H+uU0ekoZeWkWpFJ6bd8wninXXupBSZDN3u+B4I02F8ekg3FTQ2k99ek4dl2qQsnG76qWK6Q8CEs6t9wXI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR08MB10263.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(23010399003)(38350700014)(5023799004)(10067099003)(56012099006)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YgkWg6cDtv/C4nnweSqYgVpnQvbNyBtKdE4trDqFIRLN42ttTv+zghO5qQiU?=
 =?us-ascii?Q?kL0DnamkWcPMXQgEcYCixYQsjOU5r4Mr7pbWkCYLawS+0hcuoE4xdDhirsT9?=
 =?us-ascii?Q?QFU/o/AqE8pYhVKGn7CISCni7Fj/FAWM6OlUED3Sl2vhKE6UdHUVDVZR0gqp?=
 =?us-ascii?Q?j5gGa0E0ftaiVU6rwCLKwEKgHDbsB0n8AFIlKkaJFcSSMzPdSaerS7UEnYsS?=
 =?us-ascii?Q?zxllZ/j2KIHxYEfkblGry+cqe6PHKc1myducgRiOu+3TUdSKky31qbxmPI6m?=
 =?us-ascii?Q?JzhBnHO3XaTd6r2CBuBLOI6qghcercYjiIv9wfGI6seR9uaCH3u+KrBXwx6d?=
 =?us-ascii?Q?+yEzdhYT99py5GHYYJE1HcRRYSfr2WhViqI7lZIyz0u0EvjCdMRz9GnI/uj1?=
 =?us-ascii?Q?t6uQzdZm2stxWjHdpbul0jwB62UAPFgHF4QUylM4J+JpLOKNR3Fp++8J/XbP?=
 =?us-ascii?Q?kIJjXgKbMKEFwXFrrlDXzc1rmA3FJmDpsyzWYVw+kyCNHRV8qgd5cEprqT2B?=
 =?us-ascii?Q?m5OewB0Sihxxm10Dxm3j/ccmBQfJgnqqmqm39XKXpeTbtiQTKiS7S7myr6+x?=
 =?us-ascii?Q?D+okzDwdeqoK3JK0A/2qEbZd1blnU6zzKaDy7ujuABxElUHBlJ7YV26WPUGr?=
 =?us-ascii?Q?z4uhU9NKV9mIj6km44uMOoctv6gI60BrTWLrF1qug+3XhFvxSXg6N0vU22JC?=
 =?us-ascii?Q?FusouUTJX1J330+Y2TaMyY4OPHSJuK+3C6E/bcJRZStooppLYAv9U9tFVH31?=
 =?us-ascii?Q?YOCM3+lMIvqLc7jrwUxznd0yV5+UTfuwj0Hw/ZzVM2J1vZ44JYdtMFqdVzQz?=
 =?us-ascii?Q?LUbafd03kpNt4hcBvqLZGULtGJZoPtgIGHa4vp2qw3hg0gm1PSHkF+m31/rX?=
 =?us-ascii?Q?saQ1kPvsY8dmqos9Hjfjfpuv+GEz2aBiWMtI88JCKom1Ph2dCq6/nUgwTwGK?=
 =?us-ascii?Q?9d2NPybdncogZJ9p7BZJN4JU4dsdgTufSKpUq05zBqxbdPHyS0LzpkKb3YE3?=
 =?us-ascii?Q?4xRoxjhvtUNchsvJtzgaEJmYFHoUUm1mTzLlzzu8WF34q3X/5AEzqC7FPVF/?=
 =?us-ascii?Q?mSzCZ5dcqTTiDXKYde/D99qoyo6dUdLj7/WsxlmYBlig7/6jmzYQ6sM4yPQq?=
 =?us-ascii?Q?6qOlXsn5SwFuyoMMQctlKxUnPhXtqdjhhI0YCSRdXQI1SvmAiGrBXWctRhL4?=
 =?us-ascii?Q?GRbSe5jKVaPbQTIDmtT82gI65b3GSmT07idOW0SyZxOx7AA7PbGjDRCoAq0l?=
 =?us-ascii?Q?Ah1o3SgAGjCp6wGMpT5UjkLJx1f7JCenK6y1BL2mjY2YLRm7hkNv8xHSFiw2?=
 =?us-ascii?Q?2+geGmbScMbr+44bYwfRMu2wrtPDDOkhEhUK6OL//9MeAFTG/A/uKv3k45lv?=
 =?us-ascii?Q?UWXfFCsPToKleusnQKF4SSiUMW2LmUAtWCOlcT8wYbw/mPQ2/LVKkXLD7FZa?=
 =?us-ascii?Q?DmyYZdkgzgvJP68SEXG43KdMPHhIjg/kRXGjXJH/LUcQU8svRLfOa8RvUCyK?=
 =?us-ascii?Q?GZLUhaltTuUyd+nFO1nq9os8NZkPVMlWacJ8rtB8yCTvFWMjp+35/1mm1pOO?=
 =?us-ascii?Q?VUqtV0alc5vdPUcxrZwImlAa64NZX0Azyf46p7CXIjKp0O11YMwjcUuaEarX?=
 =?us-ascii?Q?x7PU++omNrZ433k9jUbCLClykNzz8up7IaN2fMFkEwn++0km2lXZ8izC/AjU?=
 =?us-ascii?Q?IrgP3kLDdiUZ3otHZOmoUCJ4IVY4cgB6vo8l7LgzdBz8KacgfwvTv3hKhwVO?=
 =?us-ascii?Q?VhTX5tU9Kux0ljX23fA0bi2uQXFlxeg=3D?=
X-OriginatorOrg: inmusicbrands.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8b85b2c-ef97-4c36-6fe8-08df1bc9eb88
X-MS-Exchange-CrossTenant-AuthSource: BY1PR08MB10263.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2026 12:30:16.4908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 24507e43-fb7c-4b60-ab03-f78fafaf0a65
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8jZFxo9VoWY3d2R6ZpXtvGZL/04Kg39O/93iGXxFwGOY1HxGkyoGBf+4xNmlqFtR4uaxMr5xCVcaHCmY/weFJ5U+45mSG+VWVydQTVTdgeQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR08MB10427

On RK3288 where the RGA reports version zero [1], rotating a buffer
gives corrupt output where one edge will be truncated.  This is a result
of some adjustment done specifically for hardware revision zero.  But it
seems this is not necessary and there is no evidence for why this
adjustment should be applied on these hardware revisions.

Comparing the TRMs between RK3288 with revision zero and RK3588 with
revision 3.2 there is evidence of new features supported by later
hardware, but nothing indicating any difference in behaviour for
rotation which is supported by all hardware revisions.

The logic here looks wrong anyway, since it's bizarre that minor
revision zero would need the adjustment for _all_ major revisions.  This
was added with the initial version of the driver in commit f7e7b48e6d796
("[media] rockchip/rga: v4l2 m2m support") so there is no detail in the
Git history to indicate why this special-case might be needed.

[1] Comparing with the vendor code, it seems this is actually 1.3 with
    the hardware reporting zero more by coincidence than design since the
    version register is not defined for RK3288.

Signed-off-by: John Keeping <jkeeping@inmusicbrands.com>
---
v2:
- Remove "rga" variable which is unused after this change

 drivers/media/platform/rockchip/rga/rga-hw.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
index be1bc8ddbd03b..2e7ec8b7c20f7 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga-hw.c
@@ -158,7 +158,6 @@ static void rga_cmd_set_dst_addr(struct rga_ctx *ctx, dma_addr_t dma_addr)
 
 static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
 {
-	struct rockchip_rga *rga = ctx->rga;
 	u32 *dest = ctx->cmdbuf_virt;
 	unsigned int scale_dst_w, scale_dst_h;
 	unsigned int src_h, src_w, dst_h, dst_w;
@@ -251,13 +250,6 @@ static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
 	 */
 	if (src_info.data.rot_mode == RGA_SRC_ROT_MODE_90_DEGREE ||
 	    src_info.data.rot_mode == RGA_SRC_ROT_MODE_270_DEGREE) {
-		if (rga->version.major == 0 || rga->version.minor == 0) {
-			if (dst_w == src_h)
-				src_h -= 8;
-			if (abs(src_w - dst_h) < 16)
-				src_w -= 16;
-		}
-
 		scale_dst_h = dst_w;
 		scale_dst_w = dst_h;
 	} else {
-- 
2.55.0

