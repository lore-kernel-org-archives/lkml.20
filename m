Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C15F369D54
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 18:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788461641; cv=fail; b=gjU/VljCyflUrQI9jZR3g9FFDn4GXp6CbpOAEXrBcBttDgvkxSKSC+pOdjm4TPIWSZ2LUBmqvxPWgZfcsaoUXu+J1hAYvxIGIszHGFNayaEdq4gtgLmvJ3aYJRKgV3PJ2XTruWsMADVxCtfAS9rFEDQlj/hifvdlnAknIEbte5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788461641; c=relaxed/simple;
	bh=S1sYrBCGtSjfb7TpQHjfBQb+8XAROPjJso9Ll6Ms7eU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YbgC/ATLwqU8ZEKX1w4x2ChymZSL3OPP61kUn4uxDUgv2xZR3GSvFCZKX4CiBBzVD8UoJEe1kL+74Rjhq63Fs65diGGSa7iV4SadMUzLFFFDqIqmkUyHhDx8azhztM1lzyGw4Adi41T4Ag5n9dcd2RtKL1jYnDRcF9NslnMuVTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=I5qgAaEZ; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=PtrfeupE; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="I5qgAaEZ";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="PtrfeupE"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 683G0l4I4088578;
	Thu, 3 Sep 2026 13:53:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=9k7WqG4xV8KG3HfCX2L6LBb3Bm14apZUV7goarHsM
	7s=; b=I5qgAaEZVAUG+8ypQAv+fmguMPTky7yDSQjfUOPdXMOASb3shctvku0eA
	d18AQuJCbJ7JaZD+Q58EZV75jKqrhIy2sHg2wdWEdBt6/66nkYRdElGH5Bq1AqPa
	bP9q+QuFbyftehtI5TcqzwtDaTyoy4Wt36qi8lEmHf9oY8BnjRTeiXoBWmjPJXrV
	7iv06zqUpzLTif4EYsWJXCcCWMw83VisXL07I3Ka+2AMp0b6gCbHn0szlmNb8gh7
	EOFUbdICciCpmvbsefHdgRNPMC0noE9uxMYzoYcjXDTvR/GnoRy2T4CKmUa8XCCS
	o3fnqoW5fzQL0k+bdfsmJComPdNeg==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012013.outbound.protection.outlook.com [52.101.48.13])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gf0jv5jr0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 03 Sep 2026 13:53:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KBBMmUheHrYNc4gP1zCSfALtKe9re9Bx9ataXKBtnoqa5nsWFd2LfUw77wDlfbhNEY/ERW6980Xj44Ds9H+k81vwW3xIShnI/udXgm2JzpEJD4p3TiGcrH4MeoHExat7gtOw4xJs6VR8TrUl9BhONlfW2QNLY5WeCeugVLeSAyKBhQlSARmPEoK9Z/gvO2POQTNQD8Sl4xN95s0Ml3Bnu9es7GKmVJ6BGL6v+d8NmAOzTaiSbtnl9/1MPF7u/Qqw+Eh/UHiF5YerYhnu4swbvOdH/b4uDFHvgNvowuOPrDS4cGPxRzounSXsFQbJhsKSSK1Qr1EmbAKTxOZQOskq6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9k7WqG4xV8KG3HfCX2L6LBb3Bm14apZUV7goarHsM7s=;
 b=Kp5cWncTAsVyx+x8GLU7QorclXjql/0v3Ux/AdBnV46Z+hI0LtKF/n2jlg71CZiiKEjO2C8osPVjhtE9ng7KY3VzKk62B5oZ82mNN2nsevqtGKlWHe6gw5qhzcV7U3gsVhSqqPBiFCnUb7qxrNan6WYdQ0iLAmr4p8DMgAruCgiC3hXkvDvhMIuhWt/dqRku8tYBsplbfEM/u7YR8PodWk/TakMjZkaYd4fCmHta/lANzWPjhKUZYmPxXQgj5l7pNOxO0A4yGeUKtU37IONppmAT9vFs/mvv0jBScW4Cc6kYbZUaspYaO9+bY2UOU6suRqKAIigq0E7mMEw81f+zKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9k7WqG4xV8KG3HfCX2L6LBb3Bm14apZUV7goarHsM7s=;
 b=PtrfeupEttEvKZdB+AXX5IhbzmX0mBenMwaQ4JtNEIsqdzFvNdjO1Rfyo6ENbGvEF0R+AVnf4izirgjDNg5J82nwFgZMaB3bgy/gIPCzZMTJDjM9z8pjsksvE5bjudbc7u9XAcoudrfyPzRB/Az1pwPjWHPBSyg/RoyD2ihC+0Y=
Received: from SJ0PR03CA0089.namprd03.prod.outlook.com (2603:10b6:a03:331::34)
 by MW4PR10MB5776.namprd10.prod.outlook.com (2603:10b6:303:180::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 18:53:42 +0000
Received: from SJ5PEPF000001CA.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::24) by SJ0PR03CA0089.outlook.office365.com
 (2603:10b6:a03:331::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Thu, 3
 Sep 2026 18:53:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001CA.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 18:53:41 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 3 Sep
 2026 13:52:21 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 3 Sep
 2026 13:52:21 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 3 Sep 2026 13:52:20 -0500
Received: from ula0226330.dhcp.ti.com ([10.249.36.221])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 683IqKIT3088847;
	Thu, 3 Sep 2026 13:52:20 -0500
From: Andrew Davis <afd@ti.com>
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        <linux-kernel@vger.kernel.org>
CC: Andrew Davis <afd@ti.com>
Subject: [PATCH 2/2] irqchip/pruss-intc: Use scoped lock guard and devm_mutex_init
Date: Thu, 3 Sep 2026 13:52:20 -0500
Message-ID: <20260903185220.2014861-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20260903185220.2014861-1-afd@ti.com>
References: <20260903185220.2014861-1-afd@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CA:EE_|MW4PR10MB5776:EE_
X-MS-Office365-Filtering-Correlation-Id: bbb2f229-644d-457f-6eea-08df09ecac19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|36860700016|82310400026|10067099003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	H6epmFP3lhNOZb55flBTetl/wTZfo0Tt9iIBrLnRTtNWVxpYwAh9So+/ovBl9c/qvybkjsRqOJS6HKU55YkpKmXwP9rPWHGaq7FVbJ7p5KDbPA46XuPbTC4x1+uEV6jjFIhrjf50/2kQeKXR4t80SAThwcq+fGh2dfBUj5FFRuHfxQWEBj66Ae4kT/ljmV9LuVp/1V75Woi8xLoJTKBeXOQToScHvARFBITzR81w5zmBgkfQM3/i3PEuoWCI2BAw6pHWxHD7FOJId2dIteFq78PWyke5dtLvFHmJav5zYgQ1TNsT43FLA9VpOIhkt7QbFwdJBoEngC/41dMK1xa3KvwnC8B2WkQli6O15xMp1X7WbXJsWbdIWk0r3EHwX7qdCgA5+3SZkcpEmIyHWCz5ncjfJMwI4ZqfZ5LntzGCQJGX2P8zXgBuuN+ZLlVfYdiESh3o7zAVP+qXLGzIdLREWJaATjEnAOWQ+tim8n/HIqMcLwDHGBeXYJG0XH8sd0+N1o6UypCNW88EBXqyMIJkATLL+5/1Xw0CNmWs3pBEO1cAtCEYoQ7VRILO7VPRApJltpzwRw3dRdOaIAeYx+alEsCs//9OjYfybZ0Kbh+pyXlmOJHIvt98Y4fRFB8Ks9MVNUSnxyA00fbqAmFkaVG1vRI6aEyWZ+iDRwoSNzAzeuZgD2SZ1bxqPN9rICdmV+x4
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(10067099003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1zPnPdflqZZ/Il2uESz24G3P9vs5V6NSBtIOZKHJBAWzRKL90HbgLrNVApqAXJep4pmFOnS52GPRX57Hh8xBlOXunoOfY+zT2Izs19G9o6kIb6GdijLIIM5lZ2Mv/rbOqAtXF6zEeahyt+7w7+tvKwAT/DL9BtwqVefr9nqajUtqT9ncJ1vmZ+nA6F4jQwluiTKyhZMw56xqIvljgaUqSIIlp42B2knsbuoy8G+hlyeb1EXZQ6lpA88v/WqmR6mpWYAwcqnZaikD25D/gsSrXPb3z1gETwkyDXt1nLtVw/JdXm7QaKDv0XX+ahzPOXYi2iFi6/0oTXmuqaswFAmWlfcjfCkUym3RpdjM87xTAj4qmok5gEh86pxU5V7JUaeupIU2IZ+cG0tep/9a3eKELxORAiziCF29uOy9E6uxiwPkZksMb5hgHCszn592HmMl
X-Exchange-RoutingPolicyChecked:
	Ms2HyM+d7JQSMHycC/s99l5E2+gFTP00oFfayPCuG3Vd+Ie9ZSEbvDgL/a3KX2RgCKmY3HOdWWbxREKgM8cA5flrfUG4y3ZC+5s78YbUi5YHXtXImN/CC7r29tLOFfPJnDA1sG8i0pFD1+0Jjv2EtdndKbLCdq9Q+nCqMhUO4ihVSEUaMimQa2WNli08zPiDOGcl5WJ44uHi1wDrfiZVCSW1IK0EFFUIQ6A39+RpjNCQg8QSE1wPjBXTp3zx3ykwWRRZo1zQWscxVO86wyeEZ2Yf8f3fRBt7scj+8qIlRsymplkaH/kIx01MB7lG54Yf9536eA1jlaS4GBJvn0thlw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 18:53:41.2956
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbb2f229-644d-457f-6eea-08df09ecac19
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5776
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NCBTYWx0ZWRfXzWgdljtMnoHe
 fA+/NVfCaNOzt6g/RrJhyoDLuqv0Vq8CvEJytCgpiHX+LXevNFmtdKgQpvyLmC+r/DcIc5CNl62
 lTY3fYq46JJg06akyLapGumQ+yC8L5s=
X-Authority-Analysis: v=2.4 cv=J6eaKgnS c=1 sm=1 tr=0 ts=6a99c23c cx=c_pps
 a=xOYz1KraVtwoi73AohHYLg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=HAA0V62mNS6ehThGO0IA:9
X-Proofpoint-GUID: yOnZjqiOWHAuGhtiToUJ0D8N4WYSIp2W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NCBTYWx0ZWRfXzRPOEXXyqu5Q
 kuqXmGgmMRft8pkwdgRbiIE/A8EEqYS9O2A+6TL6Xu6IfupUdrU9VNVc/v9skdWgwn6kYbVrjdw
 dG2G7YhU0TzeelMZLXOOASHUswwe8qZMtHTE2kA1Lj+78s8Bh+1b+TCgYv26lkcAYG4W2UWjD9A
 L2IiBPf3atIUG44AbjZRDFqQtl1kJxcMOz3i27uScSbDO+hm8lGH9aCX0/4qZvFGTrLoQgRpl4i
 lWa/vz3WpLy8at36/xlx6BHbtbt69fxApo15PLyciKR2weQlUcx8QBRpNqfLSVfVKp/0WoATBdd
 15sEmtvDL5S7fVpwZG3Jx7S/CLgBi0jKpCz10iIEEORphC/thhyhHuQwynEsIAt6aEmZ3aDB4hv
 me3nzjV9Fv0algfpUygpUoCn6CmaMcT7VuEgQyFXsF7T4AXNujXuTLRGRQD8PSoKMuiNp0qijB7
 BrwYzHRqWnM50mQs0eg==
X-Proofpoint-ORIG-GUID: yOnZjqiOWHAuGhtiToUJ0D8N4WYSIp2W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030164

Scoped locking simplifies the return path in a spot, and removes
a couple lines in another couple spots. The devm mutex init will
call mutex_destroy() for us on remove, which only really matters
when CONFIG_DEBUG_MUTEXES is set, but it is nice to do anyway.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/irqchip/irq-pruss-intc.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/irqchip/irq-pruss-intc.c b/drivers/irqchip/irq-pruss-intc.c
index cc3a7c21c2904..5a3e9e5bccbea 100644
--- a/drivers/irqchip/irq-pruss-intc.c
+++ b/drivers/irqchip/irq-pruss-intc.c
@@ -181,7 +181,7 @@ static void pruss_intc_map(struct pruss_intc *intc, unsigned long hwirq)
 	u8 ch, host, reg_idx;
 	u32 val;
 
-	mutex_lock(&intc->lock);
+	guard(mutex)(&intc->lock);
 
 	intc->event_channel[hwirq].ref_count++;
 
@@ -206,8 +206,6 @@ static void pruss_intc_map(struct pruss_intc *intc, unsigned long hwirq)
 
 	dev_dbg(dev, "mapped system_event = %lu channel = %d host = %d",
 		hwirq, ch, host);
-
-	mutex_unlock(&intc->lock);
 }
 
 /**
@@ -224,7 +222,7 @@ static void pruss_intc_unmap(struct pruss_intc *intc, unsigned long hwirq)
 	u8 ch, host, reg_idx;
 	u32 val;
 
-	mutex_lock(&intc->lock);
+	guard(mutex)(&intc->lock);
 
 	ch = intc->event_channel[hwirq].value;
 	host = intc->channel_host[ch].value;
@@ -251,8 +249,6 @@ static void pruss_intc_unmap(struct pruss_intc *intc, unsigned long hwirq)
 
 	dev_dbg(intc->dev, "unmapped system_event = %lu channel = %d host = %d\n",
 		hwirq, ch, host);
-
-	mutex_unlock(&intc->lock);
 }
 
 static void pruss_intc_init(struct pruss_intc *intc)
@@ -376,17 +372,15 @@ static int pruss_intc_validate_mapping(struct pruss_intc *intc, int event,
 				       int channel, int host)
 {
 	struct device *dev = intc->dev;
-	int ret = 0;
 
-	mutex_lock(&intc->lock);
+	guard(mutex)(&intc->lock);
 
 	/* check if sysevent already assigned */
 	if (intc->event_channel[event].ref_count > 0 &&
 	    intc->event_channel[event].value != channel) {
 		dev_err(dev, "event %d (req. ch %d) already assigned to channel %d\n",
 			event, channel, intc->event_channel[event].value);
-		ret = -EBUSY;
-		goto unlock;
+		return -EBUSY;
 	}
 
 	/* check if channel already assigned */
@@ -394,16 +388,13 @@ static int pruss_intc_validate_mapping(struct pruss_intc *intc, int event,
 	    intc->channel_host[channel].value != host) {
 		dev_err(dev, "channel %d (req. host %d) already assigned to host %d\n",
 			channel, host, intc->channel_host[channel].value);
-		ret = -EBUSY;
-		goto unlock;
+		return -EBUSY;
 	}
 
 	intc->event_channel[event].value = channel;
 	intc->channel_host[channel].value = host;
 
-unlock:
-	mutex_unlock(&intc->lock);
-	return ret;
+	return 0;
 }
 
 static int
@@ -550,7 +541,9 @@ static int pruss_intc_probe(struct platform_device *pdev)
 
 	pruss_intc_init(intc);
 
-	mutex_init(&intc->lock);
+	ret = devm_mutex_init(dev, &intc->lock);
+	if (ret)
+		return ret;
 
 	intc->domain = irq_domain_create_linear(dev_fwnode(dev), max_system_events,
 						&pruss_intc_irq_domain_ops, intc);
-- 
2.39.2

