Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041D1313E2C;
	Fri, 25 Sep 2026 13:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790343085; cv=fail; b=HquG0LP7LRodT212iNPqsZzd8Vp8cnke4XE7rj+NOYAFxR4KVlM3w6+v2hBEZwzZeDWhidvkvsFNojH14++UY2UThVlpvIfkpWjm/trIaemDSbgb8LM6fZ4GWriGBIdk+Bja/qxPPYMzE6wbBSB+WdPcsr6sfrLedejWSE8WcTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790343085; c=relaxed/simple;
	bh=ZAp5mLac/OZufsbLaF79fGrqm2ePQzxDwo2vZroT/l0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JTCpslYeaTcq4Uh1MZDdpln2hHxFpV298jiU/z9jCLl63iaRwMspojlzkoZAhHLgo+WM1JIIbeW10PgHNmGOo9qVnt7SV5L+ztrxfOYXFsskjHU4YNVigzbLgxb97EWP/OLvmmU3gBSqd1HkGfAdeRgPTjY6zCFSLvDKrpI6tM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=HiRoDR6U; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=pEtGyoDl; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="HiRoDR6U";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="pEtGyoDl"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68P91rCO1888882;
	Fri, 25 Sep 2026 08:31:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=rChB+4A4lF7MIk/yOKZEjbSOEhqxCDHwEFHpp4E7H
	g0=; b=HiRoDR6Uc5rYZKLZBTE8WgtciN6XzNNW3pIyQ80dOiP1dXmaFR7djLW4H
	31ltETMKk03lFMsuTzVxqL1x8zfo7WEAww/n7nyK8UUXXots58RHOD2mT8nqDf+6
	/6RFkZMvv2A2ebfRhFqvkzlJ806cJeyw676deyNgWsUd2qsVd1wOzKX8ySIlBVaq
	gL62fkpTYSwASeqn/M1jMCFmkQCbryzEopbmHM0Fih6ydsk/3KQqFxlkp0gCdUdu
	oS/8FrG1abi2Vy5SyvhTnPE2knqzS0yVFhPBtw1RPN23tEql0d8bq8Ms7NtE/Hbr
	n84Z7Mn/80Z/ghLn6GmdFlDN798dg==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010052.outbound.protection.outlook.com [52.101.61.52])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gwnyfs93d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 25 Sep 2026 08:31:10 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fPUjfP1L6CHxeuw3EZSrnhmzTo4h6S3OtCc47ONnXp+kPJKySsCfr9G2rAhyOPx/nyBlwbpo6eQ7bDaQSRQbJxiGjVb6vuGKeLFZTLr7cu2uy4j5YiUKgv3W52tI/3JqFFJqXpp0usQJ+wNQWRu/AOkTBRyNOw7cKRChCjbxnItYy/sszLr/XASWi86Oq4C9cjmrh9DSZkmvMh3bYvfvg6ChdoGO8+pbBFjc1xr0Qfxf3PAN/1Ss9MpnHEreKAgqFyIrE52ByI7v0FhHGCO+VvDJ5BaBTxFGqMmM086FQfQSfet9B/ZehssqZpgERYDg5hKxxKuuZ6wiZ4x1M3rxdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rChB+4A4lF7MIk/yOKZEjbSOEhqxCDHwEFHpp4E7Hg0=;
 b=wyPsg2osWBs5cRiBBgncHI/kqMsrjz+huZpVS4hdhn87vTFmBKwaF4g9P+Gb/e8WcsayzvWuw0h+r1BNZspOu3X15sQMaRzqHYdcXqysNGA2dy/EFXtAEe+kFRefBUOlUt0u6hUICC3X9syTXWhsb8cv4Q49/zobsyqoA6NYG1GyQ5sOileilY/YZyj6uICnNGxdirog2sUtmkQ8f2tl5hKAIHFXu8t27A/X3JbnYc2UCpWRShL5CjFurjOjmPpFAh+dPKZOcKVUESIwXkKiPIItCEs9aNC7Ve6ooEU41S7tViCF51xHcDFocYj+8bI9tlq66nHP5/mYoTxNeNZQzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rChB+4A4lF7MIk/yOKZEjbSOEhqxCDHwEFHpp4E7Hg0=;
 b=pEtGyoDlrKhdzKwoaLPeqY4ScDk41OcBk8DoXZZcGdW8FX1ZppxJJX3SaHbLPuFXKU4WH7TiSbAdt8L3Kp2VZhN9wbxweUmfs/ES5WtGN5FjhbgqYDwoFG++/79+fkIdxu6U3PPCK4Y3j9XmcKBH68vxRdMZ7pM0FG1TFnmrKZU=
Received: from SJ0P220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::9)
 by MN0PR10MB5957.namprd10.prod.outlook.com (2603:10b6:208:3cf::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 13:31:07 +0000
Received: from BY1PEPF0002696A.namprd05.prod.outlook.com
 (2603:10b6:a03:41b:cafe::7e) by SJ0P220CA0004.outlook.office365.com
 (2603:10b6:a03:41b::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Fri,
 25 Sep 2026 13:31:06 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BY1PEPF0002696A.mail.protection.outlook.com (10.167.244.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 25 Sep 2026 13:31:06 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 25 Sep
 2026 08:30:30 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 25 Sep
 2026 08:30:30 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 25 Sep 2026 08:30:30 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [10.24.52.125])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68PDU1n92840014;
	Fri, 25 Sep 2026 08:30:24 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <tomi.valkeinen@ideasonboard.com>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <vigneshr@ti.com>, <kristo@kernel.org>, <sakari.ailus@linux.intel.com>,
        <mripard@kernel.org>, <jai.luthra@linux.dev>,
        <jai.luthra@ideasonboard.com>, <devarsht@ti.com>,
        <y-abhilashchandra@ti.com>, <mirela.rabulea@nxp.com>,
        <laurent.pinchart@ideasonboard.com>
Subject: [RFC PATCH 4/8] media: cadence: csi2rx: Add RAW10 RGBIr formats
Date: Fri, 25 Sep 2026 18:59:57 +0530
Message-ID: <20260925133001.2780868-5-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260925133001.2780868-1-r-donadkar@ti.com>
References: <20260925133001.2780868-1-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0002696A:EE_|MN0PR10MB5957:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a65d22f-0409-44ad-84b5-08df1b094108
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|7416014|23010399003|10067099003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	+OfD15pyyK/wG0OEF/BgA7uhAnWKae7DPDp3tmvd/CAx32++8Bc949fKmtfk3R/6Gt2l0pjTPCIhZ0klzSHL9U9QHfN/bs1CvM3+d9Q4E/KaOtMLHf9e6pt0TVj0GTJb6sOrt0iaF+DQ47MTMvKePaOdXQjNE5djBSQZIMS92Ib4Bg238cOJoTwtN23x543VW2R64UQKjbjddTjz4AuhoVgaPy/EWXwWpfEuDREo9fqvzHHQPBqof+y5Xs6dwYWpXS8PP/MYsBjIRfaAJ/W0DdnOCialp8sHStf2DyHdwyoGfFtyhv0rRNzMeBz+Hz7Dq25V1Bdo/NP0lXcG7sNZor+z8ANbWQuKenC1o2GWlyorwzM+7aGBmc+2SPGexIcBRfTmud/lfBYH7JltYdLAZeIjsbOeVV7PG9AAgaSFF51Mr0TtpiJvVsAzJ0MVaA1T5q2muSa+hqEBgxDRRaaFPpm7/xjCcK7FPtm94E2Fk6kIqLnrw3GOdkMurEuxGjWUy6yoDpir81bwJdQ6myFdzkK5OXdCwRgabpQP4QTybHOd8MrQyKxajEw1P+xc3/w9WXOMYsE+qVzlgWm5zPJYl9J9R/agFGEB1e7tUiWV/wUWxi0L/kNsXWWPDBi2DCpqEAbBnpfrSvOFW3Eak7e4jpYbDuE6a1NtNev0g7OTTAf6U5RqjgXOGvCINmV+px1mHD+5CjIBx5ifrQoZEPGlGg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(7416014)(23010399003)(10067099003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yfEDLfgyZl8Hrm16JMClhEhToCu2UHlyL0YC6WWxkFzv4zCzOqjQkqkzro5xGcTJDN8338E/+swN8KXAvd32wuvp4MSLkbdIkfz7FkxYH69yfJZ8XS5sG3lorolDpjQzCi2etHAsv4AjDLeL8s5TZ0Xhssyu1kCey6ZhKh9HkXCu+eF97c7YlqZxGAUKcauH9qAYorAzjfIMNqUp7QvNM6QqydmpQPXHMZP4NbKTzUQw8viCAWKoxWME3QxkdJfF/x+X1xjlA9fBuNQw9mN2dnA9HMpta39fDVpQ6zJc8yD4gPAbmwq8Lyr48NfCMofiUbQ4aWc2UpOdSSMGdOhTeHU90bbKRsZhWIIYkKWSNEB8iOvKDU0Y/0d+T6gLCXgzi90+AAaGR3bjtwKjeL9cVHkhZMgS6C1Vz9IbwQ5XOQb581gPp+kwdH6FDvnIFQCb
X-Exchange-RoutingPolicyChecked:
	eQ1AxQ4Q0ff5dTBTj70vDc9oQhuHcdMUl4zQpA00Zgr1c6HDeYeIF4psbRY4bRJDnqgmYHwIXNYrtnmbJvD3fXYY2tpRF4v9leKod9Ot5O3o0RcUPankF0xKZ6mqnZlXc1/CPmCrXzzvDfQYmR5KsGAmQXP8G0fOqEaXlo0HR3EYK2lC/qQwFeyho2Zf0fSrabyaqDWp9EFsC3YHTUhZh309U4waeb+sJAJVXMRAA8U0ywkrwK7SA2ZrylqHhBvOcJCeEKxh1ooFtBlJU3j77XCH2ClErqk4SjFy0nVxBgFwxegdGwU9h+2AgnHy6aSRvBxI4hl/N9+vEP7kTm7CWA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 13:31:06.8339
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a65d22f-0409-44ad-84b5-08df1b094108
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0002696A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR10MB5957
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA1MyBTYWx0ZWRfX5JWalPGp06kd
 MXdQd2BJ4VlFvog8UMOBTuUz66aepdpH3jLIsiZ8IcUocGt+UDvi8J2FEk/wZ5p6qnQEZa1kiFa
 2YDyX7iQLsJ10xDlAt7oSU23AKzXjpQpIf44MVgYTUFKYwnZdMiBwwIL4kn6eJj815cGpuHeWHB
 UWDUP+jiCH8HsvZJIP3g1hYz16CiLqBXojfXb8x0xKzcglAR6K7cg6x8dHmGK3ec/DpTNn15YoU
 K2CY9jXZI5xyEYV2rcy6buTIDXldPPdddLCoVqZke5PuPKtxqeyBICRrumxDBntugZaJlSjiHXl
 dboQUuBk0MDSvweF0ksi8CBaVtQIDJP64Hg6BI3qBxnp8f7FVGa55ldWMCREK7k7eDRGpQfsP29
 p+oERlr7ubR2rm8xCSsNvPJ9rLHHjFsu/2csKiqXuKd3ZakSaYUy5yoqAwR5ECeV4+3kT6/AvAr
 mDQZSGPhpPrCDoyLOrw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA1MyBTYWx0ZWRfX3vBKpoD8x6as
 Pi6NPz7Mw3s/E907xWtzGlLisxWnrpj2q83hB8+5lQ18972XEggfCK6d4sjcVw2GCGoDNDnli4+
 Qq8BKQrHtg6XdCWwuwqlR1yysFNc1qE=
X-Authority-Analysis: v=2.4 cv=aeL0Dhot c=1 sm=1 tr=0 ts=6ab6779e cx=c_pps
 a=pHHu7wMuQGD1ykZ6zahrcA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=jvuGLiekenpIxShgAaMA:9
X-Proofpoint-GUID: 2PO56nIX4ykYcg8I0Dtpm-jys8bLeDe7
X-Proofpoint-ORIG-GUID: 2PO56nIX4ykYcg8I0Dtpm-jys8bLeDe7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250053

From: Jai Luthra <j-luthra@ti.com>

Add 10-bit RGBIr formats to the table to allow capturing them.

Signed-off-by: Jai Luthra <j-luthra@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 drivers/media/platform/cadence/cdns-csi2rx.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index de7cce76397a..8ed730452d3c 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -173,6 +173,14 @@ static const struct csi2rx_fmt formats[] = {
 	{ .code	= MEDIA_BUS_FMT_RGB565_1X16,  .bpp = 16, .max_pixels = 1, },
 	{ .code	= MEDIA_BUS_FMT_RGB888_1X24,  .bpp = 24, .max_pixels = 1, },
 	{ .code	= MEDIA_BUS_FMT_BGR888_1X24,  .bpp = 24, .max_pixels = 1, },
+	{ .code	= MEDIA_BUS_FMT_SRGGI10_1X10, .bpp = 10, .max_pixels = 2 },
+	{ .code	= MEDIA_BUS_FMT_SGRIG10_1X10, .bpp = 10, .max_pixels = 2 },
+	{ .code	= MEDIA_BUS_FMT_SBGGI10_1X10, .bpp = 10, .max_pixels = 2 },
+	{ .code	= MEDIA_BUS_FMT_SGBIG10_1X10, .bpp = 10, .max_pixels = 2 },
+	{ .code	= MEDIA_BUS_FMT_SGIRG10_1X10, .bpp = 10, .max_pixels = 2 },
+	{ .code	= MEDIA_BUS_FMT_SIGGR10_1X10, .bpp = 10, .max_pixels = 2 },
+	{ .code	= MEDIA_BUS_FMT_SGIBG10_1X10, .bpp = 10, .max_pixels = 2 },
+	{ .code	= MEDIA_BUS_FMT_SIGGB10_1X10, .bpp = 10, .max_pixels = 2 },
 };
 
 static void csi2rx_configure_error_irq_mask(void __iomem *base,
-- 
2.34.1

