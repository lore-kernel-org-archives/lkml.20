Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11023107.outbound.protection.outlook.com [40.93.196.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96443491581;
	Wed, 23 Sep 2026 10:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790160744; cv=fail; b=kvPEAtbh7GdFYgbFKwtEvOjTnRu970BI2aialg1U0YeuTcCVLaMDvphR3Na3Cgv7Sn9AABLiK7shFxjyb9q7/H4tjq/oEFSZ6417gYFp91eaGo4IbfSEZ7lYRTjWKIoN6teVPr3Q4yGilBbKLEcjaRVG6+4vokDy9Up1+3D+Pnk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790160744; c=relaxed/simple;
	bh=3dPzfS2xdR1f3riM2HHd/yB+qckIbkBDgDX6kBGI7yo=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=lcVlWc30y310dqBTo3DEv4lizHKjIixGESDFsaiLFVxvljwWQBK0Kb0YdTXY4G82cX04W97vbEk42V9iCfdbALvMACHveOqvxuFBaUN9j9zjyc5aQyKjcjqeW7m0yxypE2+5ej7N4SQ6ZoWs49dMyTMfyJUYZb80R9Xb/C3FDkc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inmusicbrands.com; spf=pass smtp.mailfrom=inmusicbrands.com; dkim=pass (1024-bit key) header.d=inmusicbrands.com header.i=@inmusicbrands.com header.b=NVhQkYNf; arc=fail smtp.client-ip=40.93.196.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inmusicbrands.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inmusicbrands.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inmusicbrands.com header.i=@inmusicbrands.com header.b="NVhQkYNf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R5eIz7cpLn8j8lJZn23iH2zSHOmTFz3tI3BDbQXHQcT5yr2/sjevX9Aykemtc1XJyv3ztwjAirMBw2wAMV4p8HjudKum4Niy4v1Uxcw512umL6Janev2w9/3gOJmp96KbUaEgFxEsn9HLpLH/C0K6u8MZ02Ljvu5nziEaQzor+zUxIvXlIfuRZKLONGOFTkTGxRy84bx0jsWmvYWQKPmPz6fKsHSLqklYGqUkAmMb7E2hR4KZCT+22tAqpV6fCF5oS4yLcbPgWVR71EA5x6vpHwZbkOE/Zms0uDRHcBUkZUTmC8xy11rxG6raLOtFxKwo8dA0jiAvYGh1as8wRZ1ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=45V0B3OBBYivwpaJQHAgs+9x48rtFnlk7Yohidx4IhI=;
 b=HWU1dZkeiJvB89p5tXgFJYJcVvuSF+/0EIvpbY4ymr8OwLeGsfdsAMuLdyE41TlacBk/aWmCc5VxJpztSTl39H5rQavflw43SRkthAyKk8jAv7Nb123kAz7G6bMdWCZTi7Yf3t0cHKlFoHc4Yj1WmC+e82pKLDJagj5aqehoBkN+6XJfvMSq02NtZhrpqIhDUX8SSRjZjDMLWI8WlOmAeAtHxqSIon0NvGPFDQKBIhFmqdnBCcNSsjjzRH3vtco6fOwT+pKQFdREcvqKG1rwuAtHeIgC6/a5iDUJszDlPd66JNAUQWgyfsPSRfI20Bl9LhfbzbjXHhQuA02EHmuWlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inmusicbrands.com; dmarc=pass action=none
 header.from=inmusicbrands.com; dkim=pass header.d=inmusicbrands.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inmusicbrands.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=45V0B3OBBYivwpaJQHAgs+9x48rtFnlk7Yohidx4IhI=;
 b=NVhQkYNfFx7DgjogmJk73Igyrp7BPDLlDIDwtm27xqiPthfsHR3q33K8FMhsVVa2ps3P814cstjcb6qap1H1D8+vYB3YV91ZTGys5mvcb1yRzFxmbPCZwXw+bssKGKVUbYcheNRe7ittytKifMvkG/ZmjjGjE90jkab1tG4NcY8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=inmusicbrands.com;
Received: from IA3PR08MB10274.namprd08.prod.outlook.com
 (2603:10b6:208:537::11) by LV8PR08MB10759.namprd08.prod.outlook.com
 (2603:10b6:408:297::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Wed, 23 Sep
 2026 10:52:09 +0000
Received: from IA3PR08MB10274.namprd08.prod.outlook.com
 ([fe80::fa40:1ea3:1e72:703b]) by IA3PR08MB10274.namprd08.prod.outlook.com
 ([fe80::fa40:1ea3:1e72:703b%6]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 10:52:09 +0000
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
Subject: [PATCH] media: rockchip: rga: fix rotation on rev0 hardware
Date: Wed, 23 Sep 2026 11:51:31 +0100
Message-ID: <20260923105131.2111476-1-jkeeping@inmusicbrands.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1P194CA0042.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::31) To BY1PR08MB10263.namprd08.prod.outlook.com
 (2603:10b6:a03:5ad::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR08MB10274:EE_|LV8PR08MB10759:EE_
X-MS-Office365-Filtering-Correlation-Id: dd51002f-6f93-4e69-93b5-08df1960afca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|23010399003|366016|1800799024|38350700014|56012099006|5023799004|10067099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	3GU4HynEP5sUoxuaZP3Dlozj1vgl+Js+ocesTsuRTmgJwor3bcOuzaTMY1UUTE8SQIGc5Z9rWr+L9MJNFaNLdfNs/fnNCEMiZkOEFG54UYOHtTiB34DrtvHdNwt0Hu4toZIvQ/k81a7rdpU4PSFDxlSS2tahz2iH6yYvDXZtX7SwpfIzZ2++k/cv1El5cP63JjEHIfHBRLdEw4yfq+b2tIUewhSulefuEhqh3Bde7r5mcYIXRNTxI5JQDLeH1n1x/aIGUzF/3swFRGc3GDTlA2ePZGkeVInvA+PW99eLvEsydqUoPC82AevkoHfjHQR34EUHKeDW6nHZH5ooFGJT7c7tl2+xcZQbX/TgaTIcpEHxRllADZ03bCBxGPm/QC7wb72H6ZtzrhPBPgzl0YqvpkhJuTsmWSf/7dn+3QuQSZyGX9X+gBtwcKJ9L2UwEQfS5N40Nawco2WcpB+h0IqNlOj+numtVAOPqwp6UX2Cf4vvuaLwlaLOBBtHJQseyLPNRM2FnuiwB9kJ1PvInDhSflFO4nryC9GdxQLyqVvykBb+N2xGKfLnAYD2A/mLEKE61lxIPMi1DNur527UbpyHjazZZtgTJgzLjniDaBURagVfy+Kt83DD5IfJqFAr6hIgRGRAiSCyYaDuwzIZpn9e6QizKZKzKq0fN02VJT6uHqN2uj73MQS9TgGhB/FUYNqQkede58lQBSKzittH1U4ubfojW4V+PpxEvJvwprwdbGA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR08MB10274.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(23010399003)(366016)(1800799024)(38350700014)(56012099006)(5023799004)(10067099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RlGhShXYh+RoubUZccMaZ8WV8YFZgPKdOOzQWFYnodmbnuVvVYYY+gtdXOIE?=
 =?us-ascii?Q?stVacmoQDw89KKoN0Y+53O2spfloaA4kNmK8q9HQgrc7w0rUFerUrHxTCapt?=
 =?us-ascii?Q?pKEhBDPF7y+F+jyvUSXTMiBiJyUezXcjmX3PtFETUvGsVfLrlnYBZLF7hbpj?=
 =?us-ascii?Q?MkilINgmsc97Aab4UZIHht3R4TlrX9W1BUXPzHetbaGBbm/vEHE8qJsBGD5A?=
 =?us-ascii?Q?j4+B9GRk2lmSmU2wWoWY/fpAnLXXJgZrKi2llk31cCGL9Bj67B8nMlrCMuhq?=
 =?us-ascii?Q?nB7QrKkN8vOV2sqeZgSbtBCZRP0hLqTO0Aove8s0AwSlhilfjCpIdEdj0qEV?=
 =?us-ascii?Q?u1kqj/BKFcEcTgGwIGklYhfVmfO8kb+/0vT3h4r2MQI8bIoyvEwhW+nB7emn?=
 =?us-ascii?Q?pJQPYXQyx6Zd3ksx2T3tg1w2BBeZ/k+2SVrhD9hhLXAf6e5f1BECwDytgz0X?=
 =?us-ascii?Q?RondDExD81CDyJ/lMSVLptt0TU4EZz+/2DRJttH0a+YrY6KY5y1wZQG5I0nV?=
 =?us-ascii?Q?5bwJrxazKzCfE7b6y/VsVqFjUpN37L4BcuaN0Exc/FtIg6Nexe8vEyF78VxE?=
 =?us-ascii?Q?7c1QjE6ST9OQ1uH34dtq/RQzMq+PUxAT1B5zi1cI0tWt4no3EpYZbPzDYYSU?=
 =?us-ascii?Q?xpyvPkKhNcetX4kgphwsKebM9sbnr86fo4gjWIxWkar1a5aR5dwc+j03ZnHj?=
 =?us-ascii?Q?zeGywn1u3mlGKOVx67dUD5ZBB+zVK/39Z6L/5a5QLcalfXoKL7SyyWCf73io?=
 =?us-ascii?Q?h1MvgblOG+DEQI2B+B/lSUPsksNBdv45qD+Sm2DIhpkC/te6v4e5A+C7F2sG?=
 =?us-ascii?Q?ptl5Caoyfot+H+njUfklSQXoNAnoeiLaEIeQW617WzT42s+r8a9cjrIcX0pF?=
 =?us-ascii?Q?4rAYIxioSwMzLOZF9rQZ+bIBQYG9njCMHT9cf0f0cIFiWpUmIj0LgMqTl2r+?=
 =?us-ascii?Q?zEfpywI9/rQefEhcQFZzOUHbXwWHROkSN6MSqNIkVm6JOC99JV0EtI+Kr9iX?=
 =?us-ascii?Q?3YW7Vgs9fvIN2fd6KIjpbmFEIgzhDGEvYQGjP8P7Bu3XkBsctlisAFKsCRB3?=
 =?us-ascii?Q?lDq+kwDMeAchevUxseZu1O1VJtcEp6GNkKcB4CEkcna/kmCUoBrpO0E7HsCu?=
 =?us-ascii?Q?78kKGcvMaqeveJudNEMBFAOgcpNMj+tLfw6epA5PCDxdlcnQpsYOdT2wJZ63?=
 =?us-ascii?Q?PQYCMHK4/hX9wFaNKqc37sBAZ89hD4K2arSMgYQHqu+9lBO7oA4WjxR75XCW?=
 =?us-ascii?Q?3GnQCRxzqwFEyMi86NA5jGk29zLhUYs/vPPfBEDg8eIRNtyZY/sbotEFajun?=
 =?us-ascii?Q?KGp5/qO0TkwWRFwvZaE7frA5bb7EmwZLRWPO5SvEwBR08AvZLU3ZS77tNhM0?=
 =?us-ascii?Q?VwGhAPB3I/6zcaXGHGeEqerfEMbEVLEpqHOIB7TixTaXbzErXc99gKx9OYmq?=
 =?us-ascii?Q?jEmii6JpGqw0h/07mpzPKqq9t0pGSLU7x3vAmSvRj0jXjV3scoiPHB2j3Ief?=
 =?us-ascii?Q?/RbqniGhbL5nRiZwgGKCaJtktlseBwu/b/L7l+fVSZ+PQ9neCjGPED5z2jDY?=
 =?us-ascii?Q?K7eN/qXAQ828mho5iVZ4PJqkgaiHV5qWoF51vDDuNY3rHyL3iqTviNlORK4H?=
 =?us-ascii?Q?1HaGM7VPwZRNYGtC1c3lJ7UhycoJvHlWcJZCuk2n17LGDp5ltPQC+YYymVgO?=
 =?us-ascii?Q?BPUzRZDweGJy6WdkoZ0wyKhvDKX37xbjxQCZDgMxWUItmI/CP6B3HRDugL0R?=
 =?us-ascii?Q?ddDd1h8olSGbSH0XlY/GFq8oTXjjSiQ=3D?=
X-OriginatorOrg: inmusicbrands.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd51002f-6f93-4e69-93b5-08df1960afca
X-MS-Exchange-CrossTenant-AuthSource: BY1PR08MB10263.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 10:52:09.4577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 24507e43-fb7c-4b60-ab03-f78fafaf0a65
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: neJDfISbfKqstSE97JNaj2VSlSZIS1sNzSSUQGvsLBWwTBw7hgSH1i4Q6Q5blhTb1SqVpTx4HnMuHa0PBUJOk/WyoKKzT40ADY47ip7chLQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR08MB10759

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
 drivers/media/platform/rockchip/rga/rga-hw.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
index be1bc8ddbd03b..a7920b3dcc576 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga-hw.c
@@ -251,13 +251,6 @@ static void rga_cmd_set_trans_info(struct rga_ctx *ctx)
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

