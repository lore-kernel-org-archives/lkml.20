Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11020130.outbound.protection.outlook.com [52.101.61.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2131C4F68DA;
	Tue, 29 Sep 2026 09:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790674920; cv=fail; b=Xx9Z4n3gjyUp6wSERzhR9iKcbaJxJuRRczEIJPmG2HXkcbjkkk/lOdndpUJQ1cWzaKyZKWg+PAXdll0mXBLKsi0JsVuidCGxOKNvuOjX1fpB1D2Nc1Xoq7Tf15+b5pWhpoQg/ERq3XSGZOGwFR7+4VJIoo7rVGiFM/+7DoZh7R4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790674920; c=relaxed/simple;
	bh=/Egu4UYxRQbGfphyFjmAaJf4LB7lhVQi4m3eOYundTM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Nm9jjUIayGk6ioVDzpB5Bh2XXVvJCciZ4G4Mlj/opcLfuSoleufT6UUliVnzRFg4sz4S2MNOq/FL4kxX/frSe+Uxzylb1wxwkPMDh+GjDkY3LASKkCb/Fw5gPVW7lO33Pr5okiLDuyl2pCwaYZDqPO2MktiSSxYz6R4F3ODol1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inmusicbrands.com; spf=pass smtp.mailfrom=inmusicbrands.com; dkim=pass (1024-bit key) header.d=inmusicbrands.com header.i=@inmusicbrands.com header.b=snw+ZCfk; arc=fail smtp.client-ip=52.101.61.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inmusicbrands.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inmusicbrands.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inmusicbrands.com header.i=@inmusicbrands.com header.b="snw+ZCfk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wc5FoOAq1fL6zS+UOy5JrCA/GGXs8OM01ZuLXDE7u+82w89lpXLlQ5qJ8gv+lrgwb0Map5joWZIMy6feA5iZsYQuwrj2OpnHdma5gA5IkkXIse1Pvi2NJfoPqrBlWPZzUQQ5dxwRII/LBzowC/EM0l+HRydpfQ1xbfwWR9rZBK4h3qCdxqZjt70zd4Mc0HrlN/NsdLjirHrkLbTtG0tzFMJ+EE9xv5VLfcfShZvHEPvRQAryRkit+QVItegji/hroHSZff+avPu5TYtpmj5TIsyMMWWpbGtEAACfE8K4pdNIXf3L4FUZau+yV4agxA7Qya+AX1x3ATJ/hJGOe3llsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lDTU7iO0ZBA4zx/KGe3uDYPq4bgJ/FjxVivfKNmjxPk=;
 b=IWhieonbGPlKXt9Z1a8Ir0FBIyb3BwexVJb8rWXULT9mfWjIYwcdP4Y4RKsH4VM8IWpIIsSwE/GZxPTLDGqLWqNXT3ITkQIqc3EBN9KDMWTaVQO02B/QKgCK0IaIYjxfSVtUny0774xMEkVGJ55NHu8j18sbCVTjoONTeqOdFlyFf2mLcP9eUZ7HhZYCmG4OGxN6iBusWUL9d0xFW7w+tVn+d48sgc01WUZxZdQDkrljXqp1d3XMpNIGzzKwU31Kbx/izOhcTbcKIviRWQZHIofL+FfO3Yc/zCqEXLO9Y9cjY1csSi4vJXRrs0uwsd22QsBg3QlQSVMtQDqJO1vgug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inmusicbrands.com; dmarc=pass action=none
 header.from=inmusicbrands.com; dkim=pass header.d=inmusicbrands.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inmusicbrands.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lDTU7iO0ZBA4zx/KGe3uDYPq4bgJ/FjxVivfKNmjxPk=;
 b=snw+ZCfkVeaf4egXdL6I61auki/TDP38f+oEw0kC3Z0loZ1bYm12X5Vhww1oeZlt2eFXA8Bh6G9QoSQFqDUqxQdRMDeASwOjrCUc+B5ccV+53j3pIZ8LL8033OfzJxx5oo8AiqV8+R1QrFgY5R3cUKKAJF8Kds3hDNPvgcF6pjs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=inmusicbrands.com;
Received: from BY1PR08MB10263.namprd08.prod.outlook.com
 (2603:10b6:a03:5ad::14) by IA3PPF84B6E6F47.namprd08.prod.outlook.com
 (2603:10b6:20f:fc02::291) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Tue, 29 Sep
 2026 09:41:56 +0000
Received: from BY1PR08MB10263.namprd08.prod.outlook.com
 ([fe80::399d:caec:5af7:cd51]) by BY1PR08MB10263.namprd08.prod.outlook.com
 ([fe80::399d:caec:5af7:cd51%6]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 09:41:56 +0000
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
Subject: [PATCH v3] media: rockchip: rga: fix rotation on rev0 hardware
Date: Tue, 29 Sep 2026 10:41:42 +0100
Message-ID: <20260929094142.928758-1-jkeeping@inmusicbrands.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0010.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::21) To BY1PR08MB10263.namprd08.prod.outlook.com
 (2603:10b6:a03:5ad::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR08MB10263:EE_|IA3PPF84B6E6F47:EE_
X-MS-Office365-Filtering-Correlation-Id: 566849f0-37cd-439f-5972-08df1e0de66b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|23010399003|376014|1800799024|366016|18002099003|38350700014|5023799004|3023799007|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	j53Ph9Yz+ykOXIJUmW4YYd/c02+c98lSeJjHqGccWxyy9ddKVd0YoOI3kyuxVNWzCdrpoGVXekuSOddRfeOwgBvd6hWBNkaRS3l/iEPmKNW2LhdDggJkdbNhNHb0H6/QpopdfexEYCC2uZMqdsygu4a1gH/iTduWAvx2JuZ99fdFa2e4rqrO2mZUq4TFbfec5hdhFyacs4TX7+7CY+gNgyZHQms/CQf4nFNCoMGcc2LLD6FBi1Cl4nneq+eu55EjoWNY/9xW1+ofubcLVDhyhdJvu0O0Ayzghz8E8EGDiEtaLbZ1ylC+HxhTWrdgBLPiiynFZ5TQDnR7A48VLbaMjrL51RG8tEwfF1aVHRxmSc08wi64fRwCfpq2SyHtyJBvZxKZGjLN7NHyy5OpBh/FQAAvjQWoNf2/Z0k9ppO828YKjsQkXiW3nAWmSE4BH/C9vfRyY9ppapqN44G2rZtF8bwEBoQJ1uiH8qahe+76YOQiJimdUu92lQkC3OyBzgSMe/B5DC8qJwJ7d0uO0BemW3ETKVvrdacCKVTszLLUuPFalPJTNqfdVvsUIN/wxsq9zaNnG3aISo/Nau+YcPUlAnACaNrWb1TkT+7hE74v73zKFTOpN7CzsjamkrDEoJrPGSwyGxpALHQ42IHVQSTKNaSsQk+/Rt+I6ojQq/p2KfqDb2E2E5jw/yjJ5BOYUgrwwXY8dqurhMYFYpZ21kGcI3S1Z+E/RH2ja1h5t6Wzj7Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR08MB10263.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(23010399003)(376014)(1800799024)(366016)(18002099003)(38350700014)(5023799004)(3023799007)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sZfhBBfquAQXpTbq/1U2VVfjfqJ7Gkg/uBqkBJpCohqA+eEm53w8h9o8lwOQ?=
 =?us-ascii?Q?o8VxiOE5vxrIG5Ly6h64YWeSc/2koUnt/ZnXO4Pr1XzfbKHykpPNpKRSbyUR?=
 =?us-ascii?Q?X0PniUj17tbTHhcbC8B6IZ9cKzgfoPhuzJJa2FtGQhkVu8Vu53g5aKavYyCj?=
 =?us-ascii?Q?lsFAEAU7NwcuRn9oGuQU0l6urNKSYCBZxH5a6R/RjEIjX2jmW2r4hAh16F7A?=
 =?us-ascii?Q?SYUQQKDtFPVf6qtHdAcjHf60dAe0yP2cEQDpm9YwPDYCFkIcDCGiPPmO+SQW?=
 =?us-ascii?Q?pD2WYTmivH3VGchfUW5US40i/hTOaY5U+AArCTE2OrQiguI8ofAPv2Dfn1oe?=
 =?us-ascii?Q?ewJU2d2LXL4Cf5eW3NtEkDWUDlEBTUaf8c0AT0u6ANu/84o99rhpPH8qkViK?=
 =?us-ascii?Q?7PEL2TehSnUNGV38bHziPwS17x1ciKspIDQpuQit7WZvZu6vfpWXexyNAyRB?=
 =?us-ascii?Q?esNnc1SxQG1BbTphetlV5wq4uFZ4V1YDkLV4WyrCu/HP/lGVXtl4pwzu/tNR?=
 =?us-ascii?Q?c7ZgaHUeAEZ0ZZ1YTiR2mZ42aMcsWE0qmHxvQLY6G3EeefboOWzrEpgt+TcE?=
 =?us-ascii?Q?jz7VSPCoD30ADgHtR1BH8RWGnnhpNhMlsHS35IHlr8bV6u6YMIiHj8xjexK5?=
 =?us-ascii?Q?MpyXv2uIjTe15KlF++k4JeDgkGqw7e1Emg8zl+tNv3spCHNe8D1OPIkakdn9?=
 =?us-ascii?Q?aUguWtlxgVHRnxAEP26cVYfG4Hc6HipJ6dekT0e+cUktqFqVC86vPuZ0SJUE?=
 =?us-ascii?Q?7OQc9cGoIJtQIKOLsLB46Fbp7G+2n7xXWANOV6ypDw9cChEi67xu7F01/Jy+?=
 =?us-ascii?Q?4pgY60rzM1cWrAYPEtxd1twoRKGDWk9yfIS3DI8NTiYc1rJSUf8Crm5QLPs3?=
 =?us-ascii?Q?q1JxxFlflCeBEoJ3FxVF9+DGrZKMeBMUkICiMbwCNmFzRVhFmSZ4wlfj9oX+?=
 =?us-ascii?Q?Yavt4UvVlaMXr3At9KR+5uzdg4+Y3niOqBjH+OnEoK9UiXqVZpDiNTDqo7og?=
 =?us-ascii?Q?Dh1xJhSmvZQEis3ztY6YcNtlwH/Kygajb8T4kZV1/rVqZ5iX/g/WmtK/vFjh?=
 =?us-ascii?Q?4kg60akwku5oxJ/dEmvyGH7V94ZhCLWNODFXqz+cjxZRftVBReikJRT9BT9O?=
 =?us-ascii?Q?jnW9d5YXtslq86r34oPiidp5wAotubzZ5Jym6rHOi6aP6zVRLf0fdAWnOyYW?=
 =?us-ascii?Q?AnLRbUtvtNMayX0KlXZ4UZSHcLTheV+jL9lMoGkmUi81GyzzFjNukApms9vl?=
 =?us-ascii?Q?tbOmUi05VK74SZ7HueBCkwhgwvCv/FWCKQK4AysI+TrsXSOQ/O92fxYnHUh4?=
 =?us-ascii?Q?PY3tT2Ut02AL7ZGw8srtgNcWJcadFn5WFDgimuwBOqw6KTUB5pCwG8amAM7Z?=
 =?us-ascii?Q?W8NFcN28UXB43qLZtOPwZVDcO+Aulfmir3V8wy7HTWoZ4XDLXVcE0szOQ/6q?=
 =?us-ascii?Q?IhSPqTZ0oHN8cK1PVmTIeROmnnZAAMpb9Zk3k8Y0c4qrA5CZ70FE7swJkIR2?=
 =?us-ascii?Q?kUHXR7dGQUNdWF2sukyUiJeUkLSZgW6+ENVTEFY700kFMOADysiK4elucRmA?=
 =?us-ascii?Q?JRfytjqVJFeKGW5Q77JLRKkfevulailRoQeYvb6TLF/jZJNY6kslIwqfA/Am?=
 =?us-ascii?Q?xuXPbQA9kNVqdl0LhPlmlT5l55ExymXwkCroI0mlFzlYSZS2cG6Up3eLEiZm?=
 =?us-ascii?Q?jfYJjhySBCO/ebIErp1l/FYiGujkDBIuJ1cMRNSTL0tC+Z9tVoq66J4bLSIU?=
 =?us-ascii?Q?CLuEbptBxomUT9MhH+tOi2oGaHRJ/Gk=3D?=
X-OriginatorOrg: inmusicbrands.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 566849f0-37cd-439f-5972-08df1e0de66b
X-MS-Exchange-CrossTenant-AuthSource: BY1PR08MB10263.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 09:41:56.0383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 24507e43-fb7c-4b60-ab03-f78fafaf0a65
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fGIDVU/eJRt2IANtwLXJOh3q+iGFiA7+6g8QH3rT7RAUP+NobULikAjydgHu/apXrGc6kYda80XmIvqvKCDC/+Ak/VNGJOvOqdFT9HzFpMc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PPF84B6E6F47

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
base-commit: 2579cbe68005f46fc7f8f95364f6b101b07b9d1c

v3:
- Rebase on media-committers/fixes and add base-commit to hopefully make
  CI happy (patch content is completely unchanged)
v2:
- Remove variable that is unused after this change
---
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

