Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2693B6346
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 18:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788461587; cv=fail; b=ezmy1URdkQR6ffc9bA4+G1rEh1mzXiTzwK3XNypN/GlZYGkLaBc6/NEpSOmRvnz7Ck3EIAU9ZvwHtacSVj/iBYMGSkQIUZ/nIk6kSAZMyXXPKldhmP+JV0a0poFf4MHTiK72s0r2D8RDdrdiXXZMZ8jYPxHId4D5svjZxZyyMxQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788461587; c=relaxed/simple;
	bh=/xVnHpPA1l1WxuF7Fu9fu0nNpF1hsO8UJ/NDnjd3zcI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eAp1oG98S+PEYp3jdVnkkn2ZxY/2rVQ5vAUzmglVfIIzUgYicGh8sOHxeAEsgGtUC/ibKwtBFpZ89dnDQBTnV7u9w2UjFJIDYoq02tbIuiuF2BIMcUv/mol44k55/H1oRGqDfsYpLB5oaVT2+lAKfLy5gI9RjW33crjK1Sc1t5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=jYw16Z1N; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=e/iRAGc/; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="jYw16Z1N";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="e/iRAGc/"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 683G0Y264088028;
	Thu, 3 Sep 2026 13:52:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=jQ29FE3YemtyY
	7/pSxA90gcYju0Nc4G5mYJNPvMpyq4=; b=jYw16Z1NBP2v3ldJTu3tGFY6KaWn8
	kDKUKzyyGTHa1ZfW0xO0ZqzvYsgHBKkr6GB5XDy3NWRUwh0yvgsyNeVFuaGl7T9s
	COvDo0o3xUP/oW58USYFraz0vT56VBxObq47Aj8UcDzjEKNXyanzeNTRmzl2C2SJ
	jdNCbNNE6IDvO0WL80+htPvASvPglXSxuth19TLZ5CJokIi+QqE7iJ5zLvQ4ry6Y
	07m1Raenio+YBYY8K2joQkpnqgjzijFoACo79xwGCB4Eld8kuQbkPenVeOLrSmyB
	eEG3Hv6TKAkPbnKb/4nLjzPFtlqT02jxGuiHPzTRyomfdGupzcSUxw74g==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010071.outbound.protection.outlook.com [52.101.61.71])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gf0jv5jkg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 13:52:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dDfRKjUjft1QFlBX+dLwEuP/MSYCiftkLmryQdNkrsJ8jj+HxZCeM04niwyBKDq4c2awy0DuTDCfxSkdrsSyvz8pUO6RyCFyLz7XkZf8s21ZzpQNDg1Xnwzn1ntFSl389wwh/Wi1DA+fm7n7MOxBy3Ia3Lvo28JLis9RUc6N22MEm+MC3WSMxiLuyBds+tiCrjwUeGMrbBwx483bKKjg6Vv1zUc7WEVFC6kHGO1m3puh73WioMXod/lFgM9ecAxojYIJYpP9B99QsD2mtJFEPRLUDFOWdUcTCCAvN4DfUzZDr65h1r+6phf2EmNDoU60M4R0cqmB42tMEFlvaq8mGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQ29FE3YemtyY7/pSxA90gcYju0Nc4G5mYJNPvMpyq4=;
 b=w49MGvWin07UqVakotuM2Aw0TrVGIeSadMlPxahCBEkSnMJgEHOj2aMZwRoC/Fkv8JRfIRgQ9wJ7h1nEKJWov8ZrAdwIOM/vnxBolBgcpzE8+x9pksLUnddFlmOL8YyLDoz18FQd9RbIJVK+EtTnWe1YwvpdgXjGBGU725dR2ARFXAgVap/L8XluG+NWaNsm1JM9jjpoEEFDGroF1/dGeYlu/Me6YbrgxOsnidhhDpitwE8QWvMBQLgTYI2SNhwzZzR4WJT2yQ14LxK9S+FivifIMKlYTFIGWdkve2Fr5ZAcwC34M0qBbygOr//BrByCtKP2f3mLmpufgiYVJNx0/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jQ29FE3YemtyY7/pSxA90gcYju0Nc4G5mYJNPvMpyq4=;
 b=e/iRAGc//5sJd7mIfVh4LFHmg934xhD3zZFEw8FXUE2hCWkFpVGv9NdXQcmu/eH6PzkrSohfSH7UCDxscQtIXfUNkmGDfuspFBf4YgzyBDqtlhSUIduTFWZ+xXIHZWQZ4V6QHeDjX9Rys/QV2rDgKK3u55kxKewBq5VDhHOZUEY=
Received: from MW4PR04CA0167.namprd04.prod.outlook.com (2603:10b6:303:85::22)
 by PH7PR10MB6179.namprd10.prod.outlook.com (2603:10b6:510:1f1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 18:52:44 +0000
Received: from CO1PEPF000066EC.namprd05.prod.outlook.com
 (2603:10b6:303:85:cafe::2f) by MW4PR04CA0167.outlook.office365.com
 (2603:10b6:303:85::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Thu, 3
 Sep 2026 18:52:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CO1PEPF000066EC.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 18:52:43 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 3 Sep
 2026 13:52:20 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 3 Sep
 2026 13:52:20 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 3 Sep 2026 13:52:20 -0500
Received: from ula0226330.dhcp.ti.com ([10.249.36.221])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 683IqKIS3088847;
	Thu, 3 Sep 2026 13:52:20 -0500
From: Andrew Davis <afd@ti.com>
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        <linux-kernel@vger.kernel.org>
CC: Andrew Davis <afd@ti.com>
Subject: [PATCH 1/2] irqchip/pruss-intc: Use match data directly
Date: Thu, 3 Sep 2026 13:52:19 -0500
Message-ID: <20260903185220.2014861-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EC:EE_|PH7PR10MB6179:EE_
X-MS-Office365-Filtering-Correlation-Id: 529240f4-2b4b-4020-9535-08df09ec89f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|1800799024|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Qo8Z/ix6KAerVtbotengexnNucuhqkeu3xSRSqScnYsAyqneadCO8Vg4pxDyqRl8lWBvXQ3GoP0AybPzjiItmifQI/K5gnyiU0uLGqCu27Gsyz5O//b8v1f1wZ1HY0M4jW92NvWSs3dUcA7kYJKMicavVwWKdVOP73EwZL8KR5FcCaIGfGDHUf4Ng1LvAb0dl7pw4t6PD/SMZktK5nLk73/Pi0BYOzdr68XC3XZosrAQX8tSWdTzf8jYerXWgNu7QQqV4Z6QEGrppC/70ozTybYccNBUAAM8IoP4MuYmWlutalJcuIXBBYfrW1WLSxZj3qp85xUtgvJD0SR5eP/gD9g5uFXRoJrSWY5KJTHAOI7Tg5YwseLqVxjxTO5tWco539eCaaXybBaCuq+2mJCxUpTl/1dybmGVPVjYgAWZS9+OA2S+6b8Or6gu8bjzbRKNfNpVoAGuYsgd05aCv09ZtBzNz4S/mkLmSvenlQvK7MY2C1qTq6bSZyInyMJI/PcLnmdwwrZRylPn30KoYd8l3Fu2t8TQH0s7qvOBvi0tTq0AitCLO1WQ5G8RQxVAZm2AOEWwZ00aVj+D5hOtr6xlHN6TpS5keUWaevLPDaehyUiTHma4e5eiX9tb7WAf2TaBWBrRnVzW6QjG9uwMsVQ9B5g89AQ6rBltBGVlDrREvnVR2Fnb4W1lCaeVWj90Gcdh
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ruwnBInrrOsL8Nm3b9fbCyStG/4QJXmL7D3of4iM3+1VMCS79Lh+udPiCjeIEBmb1LDN+Wk8ydAAMSO4yhXp7mAJHU0n4SQZwz6j0R7w3RWtlWkGFABpvOIBA2YWX0r7SsPwAaP6DKZBnzmlnerq+WTHh7qhFfTR1MRg9tRKleX14G/l4gSr5AjRBF+cuBvh5Bl6InEkDAH8Ys3kYXVCtHX7LG3PRNdcNN2rjh8xe1UxB5rJ1LH2aA5Db6ORyQaB4b9zsDOVuoaA0ZPxUWbYLKkhSCOU5DFHefggVtA0+p55M+HwRWdfNMMWzzVQS+pOhPslu7vRrpfm2JqNN7N/sue6NP2QJzA106/gGQGlTsBC51SBM6aQ5m67dIdlt6pBdlAXkTlZRLX2UmJ5pZ9YLqYX2z0QrfziXmA1NsTfiGGg/t6AhW5iHWLCtVVClMS9
X-Exchange-RoutingPolicyChecked:
	Ir/MJoqHMiYYG3h7VOq85rJKX/b4O69COu8//FhzEJM4E2kV3BOnlp8ksjHndchTAt+7mB6KQl66YSQ/yT2sH+RBPoQjK1wFGN+C7p1gThjr4F74stlVdEH4WWyJ2F8+v33QB9L+xJKdEF8raDTkGdXBNbphzBWkPjjzqcrS+p5vcUk335wrXwgAMXiWuN3FERncPQcHXJF8mpcNc7T8DdQaGC/m78iCZTBORpnJB3iD6sMU5r7uzwGdCzUlORzvr8gX0j0r9N3u820XyIgAxx6kZ49FuKVAzBB9K5NamIoPzu5aFljzg9cmU8XMv5Ljb3bD64TKfL+45A5s49vwWQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 18:52:43.9882
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 529240f4-2b4b-4020-9535-08df09ec89f9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6179
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NCBTYWx0ZWRfX9HaOa74rNx/v
 I7rDSxBVy4BV8CZ34paawdS50FhydYbylO4TlYL2F0D9Bq02C3xs/9yf3mv5U/KWBCMg90oodBo
 /sjlcPl5OOxilqnCI0nTfuui1Nql4yQ=
X-Authority-Analysis: v=2.4 cv=J6eaKgnS c=1 sm=1 tr=0 ts=6a99c202 cx=c_pps
 a=qLcLqgYGKfI026PYVGi9KQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=hebJRKcEA5tllWMXcigA:9
X-Proofpoint-GUID: YLPSYgXEZ4v7QmQrId1VYkIUrgiCFJbC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NCBTYWx0ZWRfX27io7qSbcGFv
 xj5+wVBIGUlp5B59zCzsNLm3H++pR4yFWVZq1jmaqN+9xOPe18hzpFIJKGk7HpbshQjBkXVBplg
 90V8Rvm8hPO3FJtGWu0jPIoBPLgn3hFWKEnqVCL5noNS4+HRn7acChGKionQu6JeLBC3Z3w0sLg
 VD/M4HHF/LKeaMzOkYpOKxkcALLqx5OVX0R0nKEN+rVbSOgaK2E4HmACWuKdFCTootEn8boqEnz
 rxo5j7A5b2mBVE7KyPBqRfuQyGb2gYF1ouZRyX9PUyIzQv1orMShnVbmVEXBvKhiYpdKKzxitHJ
 yXRnXpCkdicFFExqptV7cvra+oKHonoG4F+vWLjgI7cxPWH2vuU2I9kMr/KvnV87sQbI4E3cW//
 7QZmPBGvj5sNQcEO3Sn4R6XuSW7bItZPqxbyHVigCmMqx0tdGY0+ne2LhC9+eKyQ4W0G1qzVvQP
 fChncuHDHeo6YAr9Mww==
X-Proofpoint-ORIG-GUID: YLPSYgXEZ4v7QmQrId1VYkIUrgiCFJbC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1011 adultscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030164

The match data is fetched before the instance data is available, but it is
not used until after. Skip the temporary variable and fetch the match data
after it has a place to be stored.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/irqchip/irq-pruss-intc.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/irqchip/irq-pruss-intc.c b/drivers/irqchip/irq-pruss-intc.c
index 81078d56f38dc..cc3a7c21c2904 100644
--- a/drivers/irqchip/irq-pruss-intc.c
+++ b/drivers/irqchip/irq-pruss-intc.c
@@ -516,24 +516,21 @@ static const char * const irq_names[MAX_NUM_HOST_IRQS] = {
 
 static int pruss_intc_probe(struct platform_device *pdev)
 {
-	const struct pruss_intc_match_data *data;
 	struct device *dev = &pdev->dev;
 	struct pruss_intc *intc;
 	struct pruss_host_irq_data *host_data;
 	int i, irq, ret;
 	u8 max_system_events, irqs_reserved = 0;
 
-	data = of_device_get_match_data(dev);
-	if (!data)
-		return -ENODEV;
-
-	max_system_events = data->num_system_events;
-
 	intc = devm_kzalloc(dev, sizeof(*intc), GFP_KERNEL);
 	if (!intc)
 		return -ENOMEM;
 
-	intc->soc_config = data;
+	intc->soc_config = of_device_get_match_data(dev);
+	if (!intc->soc_config)
+		return -ENODEV;
+	max_system_events = intc->soc_config->num_system_events;
+
 	intc->dev = dev;
 	platform_set_drvdata(pdev, intc);
 
-- 
2.39.2

