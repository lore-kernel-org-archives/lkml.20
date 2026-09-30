Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1954F5E18
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784487; cv=fail; b=KfIUZAx5owmFk4gwWtWSQIiNOJcwDqjnRBJg9sNyS83CbLaoAaY/12sd+VMragw0WftOsvW1aY8B2j/0sDpycvU8KO/fx5ylXLO2y78/RBGPTTXivQ+Rn6qiaVx7WcaFvozJdIXiIdHRY4/2X8CNUVVjwhV607Ge5TWulRhdtzs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784487; c=relaxed/simple;
	bh=kkHi9Que/1bbws0TYg1nIPq6KGq+pJ0xh69cH4J6pe8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IRt1LP2jHMY610yIg8R5feif3xKIAJyoVZF/mRtYAx2U6NYu4AHmF6t/C+wJ+4bfFRbHC0Xt4rXOVWGzB1kES/ajkG+J7OuZXNxn+e/6QJD+FLnHH8KNnT38lyBsBrrIzigjm/vvmEZPWUM00upksltL+dflvcocy9z8GsyvmnA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=NiThPlIA; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=j4zYilzW; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="NiThPlIA";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="j4zYilzW"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE1b0T3556035;
	Wed, 30 Sep 2026 11:07:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=7u173JZU8s4QrLA7et5WziEiRIe+W9cxM76/cKqii
	YE=; b=NiThPlIANVw2ko1BgeFLrsxh3rGZ2jB6lT1w2aStIhcawBGorUDBCcrHi
	wfsG4WsBg53fa+XsnIQ7lm3uO36Ivdp+YsX2+yRJctTd7D3BjdUWz7+GbdM1nJjm
	BrXvKqjAJM+TwRyVy7jmMpdl02Xipf09fx60Ineg948kuIOlvinMQhCNb18J6jDX
	lKOM/9o8JtC2uPRGA0hxLfHlWAA9Uz987Axsy+xcb++lYveLnrtek3VQ4vDazkRF
	OAx9fZe+mdmXvtdHSK5tmBgc+5EqVyAI17HzPSeoOSnm9nKprrUzc9pzNdyufL8F
	GLSgGMxZ6FbHO4FUs0eJxap+AQLRA==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010056.outbound.protection.outlook.com [52.101.85.56])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h0ydvacqd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 11:07:45 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a7XF0UkxLUJ1sGOZbyz3/p/rfZoTq2IqXsOxceJ21QKjH+5SAgY+Ebsk9by5f0pnXQBRdjTzNzyCXFQDLd0ZPfPX9njwBFQLQdLbVhoCKZxgc23rQ3o2W+Ycd4itwBQttNxlcPJq65hhLGBBa91rcOHS3qBzClJAurmbcfuciWiLTb6TJQBn/hOcC5XkZwOESlebb5dvbTBLQGCg/4UaQuoVljd5B0WdOuSUUxgOLDpSLs5NJLXm9jC1z/1e1/rSyF8lZ8IUG8jmNoxKQl7WeKpSMDwkIAK341av48/HWXEMGVjZ+Sp687bDPYPsM4M3UyHOQ9QDipuHlgn2cUv/1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7u173JZU8s4QrLA7et5WziEiRIe+W9cxM76/cKqiiYE=;
 b=hXE8ROoI30vACX+qB8NP90KTUlhChY5WBRdB0g4UhMTPzapJDP32qnaRnsNY1ZyNmHWh/cfVLMnarFHxkLTYdmzF2RYg1LXZ8GmNM34WlM8FANNPPGCRDz/LCUsvUzhfdaeIrV3PTn3SU9zJF6xsrGjq9wmvU7QQgccwWuAObAvm2aOZeu5D5BNGfkwhGxzOO8WM3DlsTFYFwQ3Kht63cOh70o0OwKacQgv1bvJk5tnkUWhAwh9tJ+rNCet4T1x5tH5uLdkPiGanvuUtlBQDccTWk7AtjhGYChGKNZx7AeMCwPPuVhAyJXPyBnCFBSyPwn6huvjQ1m/Eqmq9hx4pFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7u173JZU8s4QrLA7et5WziEiRIe+W9cxM76/cKqiiYE=;
 b=j4zYilzW+oIA6z/xoavWcaFkrhwMPggVf4TxTxJJsY1WtIKGdf4Msx6RcdpmYdbM1KYczOOtFrbF6Ld4LVVNKbMN85pX0hvQNoc20SERmWBbf0+dJj9tyy/CsCFZwKidMp4IMzBSj8frbiyssn7AbeIf5jhaokM1xYvvwNgrc7w=
Received: from MW3PR06CA0019.namprd06.prod.outlook.com (2603:10b6:303:2a::24)
 by DS0PR10MB6199.namprd10.prod.outlook.com (2603:10b6:8:c1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 16:07:42 +0000
Received: from CO1PEPF000066EC.namprd05.prod.outlook.com
 (2603:10b6:303:2a:cafe::6c) by MW3PR06CA0019.outlook.office365.com
 (2603:10b6:303:2a::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Wed,
 30 Sep 2026 16:07:42 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF000066EC.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 16:07:42 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:07:10 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:07:09 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 11:07:09 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UG68WM3425232;
	Wed, 30 Sep 2026 11:07:07 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH v2 19/22] firmware: ti: ti_sci_clock: Move clock ops into its own file
Date: Wed, 30 Sep 2026 21:36:04 +0530
Message-ID: <20260930160607.2674980-20-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930160607.2674980-1-b-padhi@ti.com>
References: <20260930160607.2674980-1-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EC:EE_|DS0PR10MB6199:EE_
X-MS-Office365-Filtering-Correlation-Id: efeea74e-3285-487b-7e78-08df1f0cf54c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|23010399003|1800799024|10067099003|56012099006|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	B/B6wmF5E55NcLSQBZtb9iTUwRvMgCNzzS3SVBlydcdocsO+d1ySHAMqB5WPLV/89+AxQ1Uj68bqL9G+vwcApWYO85K6AD4Ik/6O47+wC8sruxoCYki7fvaioujDkbVdU+S2M5MLnIjTkNWV9tyqz2eGRdfbKKXxS7+AX0mIldMGvI//HoLMxgRGGnMbFKRmryv0prEG2rCM2h0rNlcmgCnwRvTHw8520Iz+ZcsxDi9enbd42KElvhNP1W+mXnRqUM2p8oE72MqSZWp3XEJtvJYpfc2TrgNZq0a9nU7mfLHwSPtEoyf7bDwX7Y49EHuM08W3hJQt71wxT0iTxWVP3iZAvmmoDtW3lOOOY34hYHseVsocnns9fq0z+Upuq+dEE0/467dAozZEAPDhAtnD/7+4EhgwC6Pi9+VNRrjx6a9+JIwhLp4LCTJtEnTncsyomq/g+Nxrtuol/qhc4a19F2zQ/C3B9BHFWa4ljRn8cmOMOil3XMLiubmmtR5VvqTgDcWenXYfT5ztmb9P8eHlCB2Z8QDYPhVmyUDEA3C4p6T6NyTzd5pU02vCXz7CbxqFrpGyEyBeMNdmYrLt/NmBy9rB598lMS4Xud2K/gmuObBP7o08iaq4Fobz9/tVBOB/0+7et9iVyTn8CypgW0Kgfg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(23010399003)(1800799024)(10067099003)(56012099006)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NOJhhQkkHEygAKlWyy9KBDZ7xOSiiAa4QSjhowywYERrO7FfHDT3e/qI8D/RsVstzvTKhC+m/3FM6/DrYi0RO1HmDFduzttCNxALttSGbX79c7JMIzn+30YJDM6iYxOY8HIz85PXBeTOnv5wpOHDJO2ltLPjOpMDg908oHFkcHN+d60dl7lOHMyDLmVUzm0cnkxAPalVnozrsXJXUk48JY2Gkhcpnooz+k9VGBxpxFteGakhOm15iaREu3ySH3v3e9FPw+ppFyoLpKP7+ZoPDSILmfP5wv6wT9q4mCo4Y4GiEkG9K5mf0Ti83/HR6eCvr84KMomQaKeVFz1Oi/rYh/wSaoc2+g1eT5M5R+Rem3FZ6w8jKV4hRDFsgjlNafjI2KcpGd391Y8uRvA1ddkP4kQ5v8ohOoNwYn70X0Myrj8YBz1wm0V8k+F6fibCyW3j
X-Exchange-RoutingPolicyChecked:
	Nc/klSA9vFSMJO1mC+yn6QugOZwmN4FC3WF5IBUHNZ2bqISvRb+aMBna23J0u3jnyt6lQM4dBSyYXlfcguo0WeE5oBr2Xc+A1oy9jexc0Y/Z+gH5oY00EufDjTwtncT/4gQiOY4JWK0cQ+ybmXekJeJdSmZwg+VDrHNGhlD73izZtKYYVoFXRMHhu1cB2cePa53Zwnq2thvt/zOnRl1X2t/0Iq+7+r6cOZ6MSo8mjh4Pv4ODncBW8PEh7L2uRygXEP2thTaIOBr9/nYcPfXh0hVTtx7cjz+r0PdgiyT4TvEt6uegTY0igfHz5Sw/m6G7jgENKatbyWDOBvrsh2TWQQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 16:07:42.4054
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efeea74e-3285-487b-7e78-08df1f0cf54c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6199
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX/XJWdbarUaTf
 1gWjsZsVXE4cCDLb7QBriS+Ur551cPgk8yRQZx7hHgcUCrYiG8R/c85rbSQ4S1wSDVX+oZvlCPW
 yGjOH0dYRUTUfAwILJ+KM9WH0iYehwk=
X-Proofpoint-GUID: 61HHRQBewRT83HlWSGbcVHf58V07yGHI
X-Authority-Analysis: v=2.4 cv=TegDJhQh c=1 sm=1 tr=0 ts=6abd33d1 cx=c_pps
 a=CnS1ju6qDdjTg6bRefQovg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=myWusNq7Z1Ndx3JLH8AA:9 a=972UCEkPjT46rsUQ:21
X-Proofpoint-ORIG-GUID: 61HHRQBewRT83HlWSGbcVHf58V07yGHI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX3GDoZK3iiAE8
 qmYAejNRJ0VupR7oTOw/5fhX1w3SProHuqd+rw002EpkLUve7eFGWehZveRw/8AxfKsk6x8WKG0
 BMKdYk1Uubd+P+obvbCREouENzaw2VsFzH5rlrcwlldOeyMkLAK2bcuXlMwnpdgrv+vvX/OZlc7
 FHhH66HZrwRmudbkOYXb6DtibORdg2MoG6z6Yd6hf0V/ZBM4ivXBnjiuFyYwdoO8mjXlLasd2K/
 2MmI/VdF9fKBj7x/ujPw3kuABk/7Z/vUM/EepD3MjJpn00Xb6pY41UFp1F8hi85Ek67omn+a1LR
 +LvK/KdItX5sW8+tgRxIr3UKk1dtvzUkSSV1S5FMx9dDInCrbifvasuzMq/AN5PYDduA+MsduU+
 7FkJPWIfC/CW5M+d9n97GKhtTz8H344ER6ckJ+P03U+QO2p5llkKLwz+UMss254hD9bFOWXJLM6
 tcOrY6p6JBtxEiRd9fQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300064

From: Andrew Davis <afd@ti.com>

Extract the clock operations related functions and services from
ti_sci_core.c into its own file. This breaks down the single large
file into smaller logical files for better readability and maintenance.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v2: Changelog:
1. None to this patch.

Link to v1:
https://lore.kernel.org/all/20260929201746.4078803-20-b-padhi@ti.com/

 drivers/firmware/ti/Makefile       |   1 +
 drivers/firmware/ti/ti_sci.h       |   1 +
 drivers/firmware/ti/ti_sci_clock.c | 553 +++++++++++++++++++++++++++++
 drivers/firmware/ti/ti_sci_core.c  | 535 +---------------------------
 4 files changed, 556 insertions(+), 534 deletions(-)
 create mode 100644 drivers/firmware/ti/ti_sci_clock.c

diff --git a/drivers/firmware/ti/Makefile b/drivers/firmware/ti/Makefile
index a3a056eedd9a5..c4233542ad57d 100644
--- a/drivers/firmware/ti/Makefile
+++ b/drivers/firmware/ti/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 ti_sci-y			:= ti_sci_core.o
+ti_sci-y			+= ti_sci_clock.o
 ti_sci-y			+= ti_sci_device.o
 obj-$(CONFIG_TI_SCI_PROTOCOL)	+= ti_sci.o
diff --git a/drivers/firmware/ti/ti_sci.h b/drivers/firmware/ti/ti_sci.h
index 79f56699faf29..cce59cac35ed6 100644
--- a/drivers/firmware/ti/ti_sci.h
+++ b/drivers/firmware/ti/ti_sci.h
@@ -1566,5 +1566,6 @@ int ti_sci_do_xfer(const struct ti_sci_handle *handle,
 		   void *rx_message, size_t rx_message_size);
 
 void ti_sci_setup_device_ops(struct ti_sci_dev_ops *dops);
+void ti_sci_setup_clock_ops(struct ti_sci_clk_ops *cops);
 
 #endif /* __TI_SCI_H */
diff --git a/drivers/firmware/ti/ti_sci_clock.c b/drivers/firmware/ti/ti_sci_clock.c
new file mode 100644
index 0000000000000..f266522fb7d08
--- /dev/null
+++ b/drivers/firmware/ti/ti_sci_clock.c
@@ -0,0 +1,553 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Texas Instruments System Control Interface Protocol Driver
+ *
+ * Copyright (C) 2015-2026 Texas Instruments Incorporated - https://www.ti.com/
+ *	Nishanth Menon
+ */
+
+#include <linux/errno.h>
+#include <linux/soc/ti/ti_sci_protocol.h>
+
+#include "ti_sci.h"
+
+/**
+ * ti_sci_set_clock_state() - Set clock state helper
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ * @flags:	Header flags as needed
+ * @state:	State to request for the clock.
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_set_clock_state(const struct ti_sci_handle *handle,
+				  u32 dev_id, u32 clk_id,
+				  u32 flags, u8 state)
+{
+	struct ti_sci_msg_req_set_clock_state req;
+	struct ti_sci_msg_hdr resp;
+	int ret = 0;
+
+	req.dev_id = dev_id;
+	if (clk_id < 255) {
+		req.clk_id = clk_id;
+	} else {
+		req.clk_id = 255;
+		req.clk_id_32 = clk_id;
+	}
+	req.request_state = state;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_CLOCK_STATE,
+			     flags | TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_get_clock_state() - Get clock state helper
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ * @programmed_state:	State requested for clock to move to
+ * @current_state:	State that the clock is currently in
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_get_clock_state(const struct ti_sci_handle *handle,
+				      u32 dev_id, u32 clk_id,
+				      u8 *programmed_state, u8 *current_state)
+{
+	struct ti_sci_msg_req_get_clock_state req;
+	struct ti_sci_msg_resp_get_clock_state resp;
+	int ret = 0;
+
+	if (!programmed_state && !current_state)
+		return -EINVAL;
+
+	req.dev_id = dev_id;
+	if (clk_id < 255) {
+		req.clk_id = clk_id;
+	} else {
+		req.clk_id = 255;
+		req.clk_id_32 = clk_id;
+	}
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_CLOCK_STATE,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	if (programmed_state)
+		*programmed_state = resp.programmed_state;
+	if (current_state)
+		*current_state = resp.current_state;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_get_clock() - Get control of a clock from TI SCI
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ * @needs_ssc: 'true' if Spread Spectrum clock is desired, else 'false'
+ * @can_change_freq: 'true' if frequency change is desired, else 'false'
+ * @enable_input_term: 'true' if input termination is desired, else 'false'
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_get_clock(const struct ti_sci_handle *handle, u32 dev_id,
+				u32 clk_id, bool needs_ssc,
+				bool can_change_freq, bool enable_input_term)
+{
+	u32 flags = 0;
+
+	flags |= needs_ssc ? MSG_FLAG_CLOCK_ALLOW_SSC : 0;
+	flags |= can_change_freq ? MSG_FLAG_CLOCK_ALLOW_FREQ_CHANGE : 0;
+	flags |= enable_input_term ? MSG_FLAG_CLOCK_INPUT_TERM : 0;
+
+	return ti_sci_set_clock_state(handle, dev_id, clk_id, flags,
+				      MSG_CLOCK_SW_STATE_REQ);
+}
+
+/**
+ * ti_sci_cmd_idle_clock() - Idle a clock which is in our control
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ *
+ * NOTE: This clock must have been requested by get_clock previously.
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_idle_clock(const struct ti_sci_handle *handle,
+				 u32 dev_id, u32 clk_id)
+{
+	return ti_sci_set_clock_state(handle, dev_id, clk_id,
+				      MSG_FLAG_CLOCK_ALLOW_FREQ_CHANGE,
+				      MSG_CLOCK_SW_STATE_UNREQ);
+}
+
+/**
+ * ti_sci_cmd_put_clock() - Release a clock from our control back to TISCI
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ *
+ * NOTE: This clock must have been requested by get_clock previously.
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_put_clock(const struct ti_sci_handle *handle,
+				u32 dev_id, u32 clk_id)
+{
+	return ti_sci_set_clock_state(handle, dev_id, clk_id,
+				      MSG_FLAG_CLOCK_ALLOW_FREQ_CHANGE,
+				      MSG_CLOCK_SW_STATE_AUTO);
+}
+
+/**
+ * ti_sci_cmd_clk_is_auto() - Is the clock being auto managed
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ * @req_state: state indicating if the clock is auto managed
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_clk_is_auto(const struct ti_sci_handle *handle,
+				  u32 dev_id, u32 clk_id, bool *req_state)
+{
+	u8 state = 0;
+	int ret;
+
+	if (!req_state)
+		return -EINVAL;
+
+	ret = ti_sci_cmd_get_clock_state(handle, dev_id, clk_id, &state, NULL);
+	if (ret)
+		return ret;
+
+	*req_state = (state == MSG_CLOCK_SW_STATE_AUTO);
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_clk_is_on() - Is the clock ON
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ * @req_state: state indicating if the clock is managed by us and enabled
+ * @curr_state: state indicating if the clock is ready for operation
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_clk_is_on(const struct ti_sci_handle *handle, u32 dev_id,
+				u32 clk_id, bool *req_state, bool *curr_state)
+{
+	u8 c_state = 0, r_state = 0;
+	int ret;
+
+	if (!req_state && !curr_state)
+		return -EINVAL;
+
+	ret = ti_sci_cmd_get_clock_state(handle, dev_id, clk_id,
+					 &r_state, &c_state);
+	if (ret)
+		return ret;
+
+	if (req_state)
+		*req_state = (r_state == MSG_CLOCK_SW_STATE_REQ);
+	if (curr_state)
+		*curr_state = (c_state == MSG_CLOCK_HW_STATE_READY);
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_clk_is_off() - Is the clock OFF
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ * @req_state: state indicating if the clock is managed by us and disabled
+ * @curr_state: state indicating if the clock is NOT ready for operation
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_clk_is_off(const struct ti_sci_handle *handle, u32 dev_id,
+				 u32 clk_id, bool *req_state, bool *curr_state)
+{
+	u8 c_state = 0, r_state = 0;
+	int ret;
+
+	if (!req_state && !curr_state)
+		return -EINVAL;
+
+	ret = ti_sci_cmd_get_clock_state(handle, dev_id, clk_id,
+					 &r_state, &c_state);
+	if (ret)
+		return ret;
+
+	if (req_state)
+		*req_state = (r_state == MSG_CLOCK_SW_STATE_UNREQ);
+	if (curr_state)
+		*curr_state = (c_state == MSG_CLOCK_HW_STATE_NOT_READY);
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_clk_set_parent() - Set the clock source of a specific device clock
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ * @parent_id:	Parent clock identifier to set
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_clk_set_parent(const struct ti_sci_handle *handle,
+				     u32 dev_id, u32 clk_id, u32 parent_id)
+{
+	struct ti_sci_msg_req_set_clock_parent req;
+	struct ti_sci_msg_hdr resp;
+	int ret = 0;
+
+	req.dev_id = dev_id;
+	if (clk_id < 255) {
+		req.clk_id = clk_id;
+	} else {
+		req.clk_id = 255;
+		req.clk_id_32 = clk_id;
+	}
+	if (parent_id < 255) {
+		req.parent_id = parent_id;
+	} else {
+		req.parent_id = 255;
+		req.parent_id_32 = parent_id;
+	}
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_CLOCK_PARENT,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_clk_get_parent() - Get current parent clock source
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ * @parent_id:	Current clock parent
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_clk_get_parent(const struct ti_sci_handle *handle,
+				     u32 dev_id, u32 clk_id, u32 *parent_id)
+{
+	struct ti_sci_msg_req_get_clock_parent req;
+	struct ti_sci_msg_resp_get_clock_parent resp;
+	int ret = 0;
+
+	if (!parent_id)
+		return -EINVAL;
+
+	req.dev_id = dev_id;
+	if (clk_id < 255) {
+		req.clk_id = clk_id;
+	} else {
+		req.clk_id = 255;
+		req.clk_id_32 = clk_id;
+	}
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_CLOCK_PARENT,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	if (resp.parent_id < 255)
+		*parent_id = resp.parent_id;
+	else
+		*parent_id = resp.parent_id_32;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_clk_get_num_parents() - Get num parents of the current clk source
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ * @num_parents: Returns he number of parents to the current clock.
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_clk_get_num_parents(const struct ti_sci_handle *handle,
+					  u32 dev_id, u32 clk_id,
+					  u32 *num_parents)
+{
+	struct ti_sci_msg_req_get_clock_num_parents req;
+	struct ti_sci_msg_resp_get_clock_num_parents resp;
+	int ret = 0;
+
+	if (!num_parents)
+		return -EINVAL;
+
+	req.dev_id = dev_id;
+	if (clk_id < 255) {
+		req.clk_id = clk_id;
+	} else {
+		req.clk_id = 255;
+		req.clk_id_32 = clk_id;
+	}
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_NUM_CLOCK_PARENTS,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	if (resp.num_parents < 255)
+		*num_parents = resp.num_parents;
+	else
+		*num_parents = resp.num_parents_32;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_clk_get_match_freq() - Find a good match for frequency
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ * @min_freq:	The minimum allowable frequency in Hz. This is the minimum
+ *		allowable programmed frequency and does not account for clock
+ *		tolerances and jitter.
+ * @target_freq: The target clock frequency in Hz. A frequency will be
+ *		processed as close to this target frequency as possible.
+ * @max_freq:	The maximum allowable frequency in Hz. This is the maximum
+ *		allowable programmed frequency and does not account for clock
+ *		tolerances and jitter.
+ * @match_freq:	Frequency match in Hz response.
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_clk_get_match_freq(const struct ti_sci_handle *handle,
+					 u32 dev_id, u32 clk_id, u64 min_freq,
+					 u64 target_freq, u64 max_freq,
+					 u64 *match_freq)
+{
+	struct ti_sci_msg_req_query_clock_freq req;
+	struct ti_sci_msg_resp_query_clock_freq resp;
+	int ret = 0;
+
+	if (!match_freq)
+		return -EINVAL;
+
+	req.dev_id = dev_id;
+	if (clk_id < 255) {
+		req.clk_id = clk_id;
+	} else {
+		req.clk_id = 255;
+		req.clk_id_32 = clk_id;
+	}
+	req.min_freq_hz = min_freq;
+	req.target_freq_hz = target_freq;
+	req.max_freq_hz = max_freq;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_QUERY_CLOCK_FREQ,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	*match_freq = resp.freq_hz;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_clk_set_freq() - Set a frequency for clock
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ * @min_freq:	The minimum allowable frequency in Hz. This is the minimum
+ *		allowable programmed frequency and does not account for clock
+ *		tolerances and jitter.
+ * @target_freq: The target clock frequency in Hz. A frequency will be
+ *		processed as close to this target frequency as possible.
+ * @max_freq:	The maximum allowable frequency in Hz. This is the maximum
+ *		allowable programmed frequency and does not account for clock
+ *		tolerances and jitter.
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_clk_set_freq(const struct ti_sci_handle *handle,
+				   u32 dev_id, u32 clk_id, u64 min_freq,
+				   u64 target_freq, u64 max_freq)
+{
+	struct ti_sci_msg_req_set_clock_freq req;
+	struct ti_sci_msg_hdr resp;
+	int ret = 0;
+
+	req.dev_id = dev_id;
+	if (clk_id < 255) {
+		req.clk_id = clk_id;
+	} else {
+		req.clk_id = 255;
+		req.clk_id_32 = clk_id;
+	}
+	req.min_freq_hz = min_freq;
+	req.target_freq_hz = target_freq;
+	req.max_freq_hz = max_freq;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_CLOCK_FREQ,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_clk_get_freq() - Get current frequency
+ * @handle:	pointer to TI SCI handle
+ * @dev_id:	Device identifier this request is for
+ * @clk_id:	Clock identifier for the device for this request.
+ *		Each device has it's own set of clock inputs. This indexes
+ *		which clock input to modify.
+ * @freq:	Currently frequency in Hz
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_clk_get_freq(const struct ti_sci_handle *handle,
+				   u32 dev_id, u32 clk_id, u64 *freq)
+{
+	struct ti_sci_msg_req_get_clock_freq req;
+	struct ti_sci_msg_resp_get_clock_freq resp;
+	int ret = 0;
+
+	if (!freq)
+		return -EINVAL;
+
+	req.dev_id = dev_id;
+	if (clk_id < 255) {
+		req.clk_id = clk_id;
+	} else {
+		req.clk_id = 255;
+		req.clk_id_32 = clk_id;
+	}
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_CLOCK_FREQ,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	*freq = resp.freq_hz;
+
+	return 0;
+}
+
+/*
+ * ti_sci_setup_clock_ops() - Setup the clock operations structures
+ * @cops:	pointer to TISCI clock operations structure
+ */
+void ti_sci_setup_clock_ops(struct ti_sci_clk_ops *cops)
+{
+	cops->get_clock = ti_sci_cmd_get_clock;
+	cops->idle_clock = ti_sci_cmd_idle_clock;
+	cops->put_clock = ti_sci_cmd_put_clock;
+	cops->is_auto = ti_sci_cmd_clk_is_auto;
+	cops->is_on = ti_sci_cmd_clk_is_on;
+	cops->is_off = ti_sci_cmd_clk_is_off;
+
+	cops->set_parent = ti_sci_cmd_clk_set_parent;
+	cops->get_parent = ti_sci_cmd_clk_get_parent;
+	cops->get_num_parents = ti_sci_cmd_clk_get_num_parents;
+
+	cops->get_best_match_freq = ti_sci_cmd_clk_get_match_freq;
+	cops->set_freq = ti_sci_cmd_clk_set_freq;
+	cops->get_freq = ti_sci_cmd_clk_get_freq;
+}
diff --git a/drivers/firmware/ti/ti_sci_core.c b/drivers/firmware/ti/ti_sci_core.c
index e98bf3c5f9dc1..848c040f598e0 100644
--- a/drivers/firmware/ti/ti_sci_core.c
+++ b/drivers/firmware/ti/ti_sci_core.c
@@ -565,525 +565,6 @@ static int ti_sci_cmd_get_revision(struct ti_sci_info *info)
 	return 0;
 }
 
-/**
- * ti_sci_set_clock_state() - Set clock state helper
- * @handle:	pointer to TI SCI handle
- * @dev_id:	Device identifier this request is for
- * @clk_id:	Clock identifier for the device for this request.
- *		Each device has it's own set of clock inputs. This indexes
- *		which clock input to modify.
- * @flags:	Header flags as needed
- * @state:	State to request for the clock.
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_set_clock_state(const struct ti_sci_handle *handle,
-				  u32 dev_id, u32 clk_id,
-				  u32 flags, u8 state)
-{
-	struct ti_sci_msg_req_set_clock_state req;
-	struct ti_sci_msg_hdr resp;
-	int ret = 0;
-
-	req.dev_id = dev_id;
-	if (clk_id < 255) {
-		req.clk_id = clk_id;
-	} else {
-		req.clk_id = 255;
-		req.clk_id_32 = clk_id;
-	}
-	req.request_state = state;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_CLOCK_STATE,
-			     flags | TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_get_clock_state() - Get clock state helper
- * @handle:	pointer to TI SCI handle
- * @dev_id:	Device identifier this request is for
- * @clk_id:	Clock identifier for the device for this request.
- *		Each device has it's own set of clock inputs. This indexes
- *		which clock input to modify.
- * @programmed_state:	State requested for clock to move to
- * @current_state:	State that the clock is currently in
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_get_clock_state(const struct ti_sci_handle *handle,
-				      u32 dev_id, u32 clk_id,
-				      u8 *programmed_state, u8 *current_state)
-{
-	struct ti_sci_msg_req_get_clock_state req;
-	struct ti_sci_msg_resp_get_clock_state resp;
-	int ret = 0;
-
-	if (!programmed_state && !current_state)
-		return -EINVAL;
-
-	req.dev_id = dev_id;
-	if (clk_id < 255) {
-		req.clk_id = clk_id;
-	} else {
-		req.clk_id = 255;
-		req.clk_id_32 = clk_id;
-	}
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_CLOCK_STATE,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	if (programmed_state)
-		*programmed_state = resp.programmed_state;
-	if (current_state)
-		*current_state = resp.current_state;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_get_clock() - Get control of a clock from TI SCI
- * @handle:	pointer to TI SCI handle
- * @dev_id:	Device identifier this request is for
- * @clk_id:	Clock identifier for the device for this request.
- *		Each device has it's own set of clock inputs. This indexes
- *		which clock input to modify.
- * @needs_ssc: 'true' if Spread Spectrum clock is desired, else 'false'
- * @can_change_freq: 'true' if frequency change is desired, else 'false'
- * @enable_input_term: 'true' if input termination is desired, else 'false'
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_get_clock(const struct ti_sci_handle *handle, u32 dev_id,
-				u32 clk_id, bool needs_ssc,
-				bool can_change_freq, bool enable_input_term)
-{
-	u32 flags = 0;
-
-	flags |= needs_ssc ? MSG_FLAG_CLOCK_ALLOW_SSC : 0;
-	flags |= can_change_freq ? MSG_FLAG_CLOCK_ALLOW_FREQ_CHANGE : 0;
-	flags |= enable_input_term ? MSG_FLAG_CLOCK_INPUT_TERM : 0;
-
-	return ti_sci_set_clock_state(handle, dev_id, clk_id, flags,
-				      MSG_CLOCK_SW_STATE_REQ);
-}
-
-/**
- * ti_sci_cmd_idle_clock() - Idle a clock which is in our control
- * @handle:	pointer to TI SCI handle
- * @dev_id:	Device identifier this request is for
- * @clk_id:	Clock identifier for the device for this request.
- *		Each device has it's own set of clock inputs. This indexes
- *		which clock input to modify.
- *
- * NOTE: This clock must have been requested by get_clock previously.
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_idle_clock(const struct ti_sci_handle *handle,
-				 u32 dev_id, u32 clk_id)
-{
-	return ti_sci_set_clock_state(handle, dev_id, clk_id,
-				      MSG_FLAG_CLOCK_ALLOW_FREQ_CHANGE,
-				      MSG_CLOCK_SW_STATE_UNREQ);
-}
-
-/**
- * ti_sci_cmd_put_clock() - Release a clock from our control back to TISCI
- * @handle:	pointer to TI SCI handle
- * @dev_id:	Device identifier this request is for
- * @clk_id:	Clock identifier for the device for this request.
- *		Each device has it's own set of clock inputs. This indexes
- *		which clock input to modify.
- *
- * NOTE: This clock must have been requested by get_clock previously.
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_put_clock(const struct ti_sci_handle *handle,
-				u32 dev_id, u32 clk_id)
-{
-	return ti_sci_set_clock_state(handle, dev_id, clk_id,
-				      MSG_FLAG_CLOCK_ALLOW_FREQ_CHANGE,
-				      MSG_CLOCK_SW_STATE_AUTO);
-}
-
-/**
- * ti_sci_cmd_clk_is_auto() - Is the clock being auto managed
- * @handle:	pointer to TI SCI handle
- * @dev_id:	Device identifier this request is for
- * @clk_id:	Clock identifier for the device for this request.
- *		Each device has it's own set of clock inputs. This indexes
- *		which clock input to modify.
- * @req_state: state indicating if the clock is auto managed
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_clk_is_auto(const struct ti_sci_handle *handle,
-				  u32 dev_id, u32 clk_id, bool *req_state)
-{
-	u8 state = 0;
-	int ret;
-
-	if (!req_state)
-		return -EINVAL;
-
-	ret = ti_sci_cmd_get_clock_state(handle, dev_id, clk_id, &state, NULL);
-	if (ret)
-		return ret;
-
-	*req_state = (state == MSG_CLOCK_SW_STATE_AUTO);
-	return 0;
-}
-
-/**
- * ti_sci_cmd_clk_is_on() - Is the clock ON
- * @handle:	pointer to TI SCI handle
- * @dev_id:	Device identifier this request is for
- * @clk_id:	Clock identifier for the device for this request.
- *		Each device has it's own set of clock inputs. This indexes
- *		which clock input to modify.
- * @req_state: state indicating if the clock is managed by us and enabled
- * @curr_state: state indicating if the clock is ready for operation
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_clk_is_on(const struct ti_sci_handle *handle, u32 dev_id,
-				u32 clk_id, bool *req_state, bool *curr_state)
-{
-	u8 c_state = 0, r_state = 0;
-	int ret;
-
-	if (!req_state && !curr_state)
-		return -EINVAL;
-
-	ret = ti_sci_cmd_get_clock_state(handle, dev_id, clk_id,
-					 &r_state, &c_state);
-	if (ret)
-		return ret;
-
-	if (req_state)
-		*req_state = (r_state == MSG_CLOCK_SW_STATE_REQ);
-	if (curr_state)
-		*curr_state = (c_state == MSG_CLOCK_HW_STATE_READY);
-	return 0;
-}
-
-/**
- * ti_sci_cmd_clk_is_off() - Is the clock OFF
- * @handle:	pointer to TI SCI handle
- * @dev_id:	Device identifier this request is for
- * @clk_id:	Clock identifier for the device for this request.
- *		Each device has it's own set of clock inputs. This indexes
- *		which clock input to modify.
- * @req_state: state indicating if the clock is managed by us and disabled
- * @curr_state: state indicating if the clock is NOT ready for operation
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_clk_is_off(const struct ti_sci_handle *handle, u32 dev_id,
-				 u32 clk_id, bool *req_state, bool *curr_state)
-{
-	u8 c_state = 0, r_state = 0;
-	int ret;
-
-	if (!req_state && !curr_state)
-		return -EINVAL;
-
-	ret = ti_sci_cmd_get_clock_state(handle, dev_id, clk_id,
-					 &r_state, &c_state);
-	if (ret)
-		return ret;
-
-	if (req_state)
-		*req_state = (r_state == MSG_CLOCK_SW_STATE_UNREQ);
-	if (curr_state)
-		*curr_state = (c_state == MSG_CLOCK_HW_STATE_NOT_READY);
-	return 0;
-}
-
-/**
- * ti_sci_cmd_clk_set_parent() - Set the clock source of a specific device clock
- * @handle:	pointer to TI SCI handle
- * @dev_id:	Device identifier this request is for
- * @clk_id:	Clock identifier for the device for this request.
- *		Each device has it's own set of clock inputs. This indexes
- *		which clock input to modify.
- * @parent_id:	Parent clock identifier to set
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_clk_set_parent(const struct ti_sci_handle *handle,
-				     u32 dev_id, u32 clk_id, u32 parent_id)
-{
-	struct ti_sci_msg_req_set_clock_parent req;
-	struct ti_sci_msg_hdr resp;
-	int ret = 0;
-
-	req.dev_id = dev_id;
-	if (clk_id < 255) {
-		req.clk_id = clk_id;
-	} else {
-		req.clk_id = 255;
-		req.clk_id_32 = clk_id;
-	}
-	if (parent_id < 255) {
-		req.parent_id = parent_id;
-	} else {
-		req.parent_id = 255;
-		req.parent_id_32 = parent_id;
-	}
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_CLOCK_PARENT,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_clk_get_parent() - Get current parent clock source
- * @handle:	pointer to TI SCI handle
- * @dev_id:	Device identifier this request is for
- * @clk_id:	Clock identifier for the device for this request.
- *		Each device has it's own set of clock inputs. This indexes
- *		which clock input to modify.
- * @parent_id:	Current clock parent
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_clk_get_parent(const struct ti_sci_handle *handle,
-				     u32 dev_id, u32 clk_id, u32 *parent_id)
-{
-	struct ti_sci_msg_req_get_clock_parent req;
-	struct ti_sci_msg_resp_get_clock_parent resp;
-	int ret = 0;
-
-	if (!parent_id)
-		return -EINVAL;
-
-	req.dev_id = dev_id;
-	if (clk_id < 255) {
-		req.clk_id = clk_id;
-	} else {
-		req.clk_id = 255;
-		req.clk_id_32 = clk_id;
-	}
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_CLOCK_PARENT,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	if (resp.parent_id < 255)
-		*parent_id = resp.parent_id;
-	else
-		*parent_id = resp.parent_id_32;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_clk_get_num_parents() - Get num parents of the current clk source
- * @handle:	pointer to TI SCI handle
- * @dev_id:	Device identifier this request is for
- * @clk_id:	Clock identifier for the device for this request.
- *		Each device has it's own set of clock inputs. This indexes
- *		which clock input to modify.
- * @num_parents: Returns he number of parents to the current clock.
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_clk_get_num_parents(const struct ti_sci_handle *handle,
-					  u32 dev_id, u32 clk_id,
-					  u32 *num_parents)
-{
-	struct ti_sci_msg_req_get_clock_num_parents req;
-	struct ti_sci_msg_resp_get_clock_num_parents resp;
-	int ret = 0;
-
-	if (!num_parents)
-		return -EINVAL;
-
-	req.dev_id = dev_id;
-	if (clk_id < 255) {
-		req.clk_id = clk_id;
-	} else {
-		req.clk_id = 255;
-		req.clk_id_32 = clk_id;
-	}
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_NUM_CLOCK_PARENTS,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	if (resp.num_parents < 255)
-		*num_parents = resp.num_parents;
-	else
-		*num_parents = resp.num_parents_32;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_clk_get_match_freq() - Find a good match for frequency
- * @handle:	pointer to TI SCI handle
- * @dev_id:	Device identifier this request is for
- * @clk_id:	Clock identifier for the device for this request.
- *		Each device has it's own set of clock inputs. This indexes
- *		which clock input to modify.
- * @min_freq:	The minimum allowable frequency in Hz. This is the minimum
- *		allowable programmed frequency and does not account for clock
- *		tolerances and jitter.
- * @target_freq: The target clock frequency in Hz. A frequency will be
- *		processed as close to this target frequency as possible.
- * @max_freq:	The maximum allowable frequency in Hz. This is the maximum
- *		allowable programmed frequency and does not account for clock
- *		tolerances and jitter.
- * @match_freq:	Frequency match in Hz response.
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_clk_get_match_freq(const struct ti_sci_handle *handle,
-					 u32 dev_id, u32 clk_id, u64 min_freq,
-					 u64 target_freq, u64 max_freq,
-					 u64 *match_freq)
-{
-	struct ti_sci_msg_req_query_clock_freq req;
-	struct ti_sci_msg_resp_query_clock_freq resp;
-	int ret = 0;
-
-	if (!match_freq)
-		return -EINVAL;
-
-	req.dev_id = dev_id;
-	if (clk_id < 255) {
-		req.clk_id = clk_id;
-	} else {
-		req.clk_id = 255;
-		req.clk_id_32 = clk_id;
-	}
-	req.min_freq_hz = min_freq;
-	req.target_freq_hz = target_freq;
-	req.max_freq_hz = max_freq;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_QUERY_CLOCK_FREQ,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	*match_freq = resp.freq_hz;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_clk_set_freq() - Set a frequency for clock
- * @handle:	pointer to TI SCI handle
- * @dev_id:	Device identifier this request is for
- * @clk_id:	Clock identifier for the device for this request.
- *		Each device has it's own set of clock inputs. This indexes
- *		which clock input to modify.
- * @min_freq:	The minimum allowable frequency in Hz. This is the minimum
- *		allowable programmed frequency and does not account for clock
- *		tolerances and jitter.
- * @target_freq: The target clock frequency in Hz. A frequency will be
- *		processed as close to this target frequency as possible.
- * @max_freq:	The maximum allowable frequency in Hz. This is the maximum
- *		allowable programmed frequency and does not account for clock
- *		tolerances and jitter.
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_clk_set_freq(const struct ti_sci_handle *handle,
-				   u32 dev_id, u32 clk_id, u64 min_freq,
-				   u64 target_freq, u64 max_freq)
-{
-	struct ti_sci_msg_req_set_clock_freq req;
-	struct ti_sci_msg_hdr resp;
-	int ret = 0;
-
-	req.dev_id = dev_id;
-	if (clk_id < 255) {
-		req.clk_id = clk_id;
-	} else {
-		req.clk_id = 255;
-		req.clk_id_32 = clk_id;
-	}
-	req.min_freq_hz = min_freq;
-	req.target_freq_hz = target_freq;
-	req.max_freq_hz = max_freq;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_CLOCK_FREQ,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_clk_get_freq() - Get current frequency
- * @handle:	pointer to TI SCI handle
- * @dev_id:	Device identifier this request is for
- * @clk_id:	Clock identifier for the device for this request.
- *		Each device has it's own set of clock inputs. This indexes
- *		which clock input to modify.
- * @freq:	Currently frequency in Hz
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_clk_get_freq(const struct ti_sci_handle *handle,
-				   u32 dev_id, u32 clk_id, u64 *freq)
-{
-	struct ti_sci_msg_req_get_clock_freq req;
-	struct ti_sci_msg_resp_get_clock_freq resp;
-	int ret = 0;
-
-	if (!freq)
-		return -EINVAL;
-
-	req.dev_id = dev_id;
-	if (clk_id < 255) {
-		req.clk_id = clk_id;
-	} else {
-		req.clk_id = 255;
-		req.clk_id_32 = clk_id;
-	}
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_CLOCK_FREQ,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	*freq = resp.freq_hz;
-
-	return 0;
-}
-
 /**
  * ti_sci_cmd_prepare_sleep() - Prepare system for system suspend
  * @handle:		pointer to TI SCI handle
@@ -2223,21 +1704,7 @@ static void ti_sci_setup_ops(struct ti_sci_info *info)
 	struct ti_sci_proc_ops *pops = &ops->proc_ops;
 
 	ti_sci_setup_device_ops(dops);
-
-	cops->get_clock = ti_sci_cmd_get_clock;
-	cops->idle_clock = ti_sci_cmd_idle_clock;
-	cops->put_clock = ti_sci_cmd_put_clock;
-	cops->is_auto = ti_sci_cmd_clk_is_auto;
-	cops->is_on = ti_sci_cmd_clk_is_on;
-	cops->is_off = ti_sci_cmd_clk_is_off;
-
-	cops->set_parent = ti_sci_cmd_clk_set_parent;
-	cops->get_parent = ti_sci_cmd_clk_get_parent;
-	cops->get_num_parents = ti_sci_cmd_clk_get_num_parents;
-
-	cops->get_best_match_freq = ti_sci_cmd_clk_get_match_freq;
-	cops->set_freq = ti_sci_cmd_clk_set_freq;
-	cops->get_freq = ti_sci_cmd_clk_get_freq;
+	ti_sci_setup_clock_ops(cops);
 
 	if (info->fw_caps & MSG_FLAG_CAPS_LPM_DM_MANAGED) {
 		pr_debug("detected DM managed LPM in fw_caps\n");
-- 
2.34.1

