Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794900090;
	b=umruWnEcYjRRwgvWHIgPCOoREhPGaJdVk+skH4EERWCQmxBBJDUQD7Bd5gbHVgM4VewB
	 V4gbrOt83MXxH55T2n3MQSa5bUexAvbsRDFwPhs3J+OdasHEEz4E8fqvvDmgoS4Mh/+Ll
	 SwLZF7+wiSWB8OFKW6P0/OJviQgrT84M9EuoDxux1Q7sn+u5/mu18rgGg5fjNLyT/KI6P
	 kpqKczIfGLeaZmplV2YWAfebBnmVnFwrg+Wjcc+y/+V+egqB4hBqwAq3hkTtzpwLunO2W
	 NVhvNGkHQ08K22fTaPmvyZYw5miwV85jmPLu7LxdgfIZ3rSph473Gmy9YFYPal7I+Iw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900090;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=9kAX4qzQDTwLRXJhCjNG/2wN8p3Bol7IxZqMUQTGuko=;
	b=oHZhYW+yJni+JRyFKhKnt3mNWzj2zE+3K6SDlHi6aa3Tgjh8EB7X4ofOa7U5CptNUIIq
	 m5CkVEE8mnEeNUEqmld6fEVmvMWqR/8t7WiiMHQnTzg706Lw/Nrp+F0Pxm91i2sugSnBi
	 p06xVt6LM6tSurGRbYMUdFV3fEV/b88H/tj6iA6d1WPSW9wyubUUfOqK6933Er917GxdU
	 u4bQxYcBLMQ+GZ1mzoky9c/w8x+IYDzxq9wcKps+v3Jvx7zzt0n86OO+8noFt0OuMmSj2
	 PvpVYrTWrT6kuPss9P6fOmeOacD+RFKW7PxYDOZiPJFPlrwD0e3snzUO1iY/f/H2aEA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=TFFX9nfx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.41
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010041.outbound.protection.outlook.com [52.101.61.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95570606A334;
	Tue, 17 Nov 2026 07:21:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95570606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=TFFX9nfx
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bsrKRrlNejq2/LYQbSkBj9b7gZqaYKQA+B6Xx0C8NmqGPDzJH9xIHW2hVUANvltfqKXvPIniu8f+MR2zhIDBPVdK9wdpwoHoHHE3hCcgEFKnH74SeCQNBg7noKikXJ+mqoqCTXfrS6jgWKwnVQn6LiE3xsUpODtkI9OlEfYMxecU40N+khJ67rCBAbFxZiAM7zDH2lQxphoDjrRh1I3wVqBqDFuLguX/rb2oqQ4pkKbpnJgpqg3u4KaFl6RAZg0YiPx422AOOMgKxQJBl5ejQr5r5HrmBIeOMgoa3L7VdWp6GtAXs2ClQEtBd1ivZw3e0e4+n+2BgSU2Ew03Qpse4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9kAX4qzQDTwLRXJhCjNG/2wN8p3Bol7IxZqMUQTGuko=;
 b=ul3tz0v4ux2UOGQpA4C8+OJKbTGLRjfAKnUEMQPzcyPaCx7WkPz7IwgUKS6J5BbC4Kp2Pyo/+g0DyNDdcSMtqeDS4J5U871He05T8KfiyNPIiFWvCQsY9DgfAo9ylyshEafy8HWW3yerQ42/BOVcdeWRJAbgZi8P8QsfERFeG20ah0jElGW9GhhlJ/z0oNmW64ZoOZS44m8HAjLf8QUdAsRBTtO/F5rOEATApvNh8G+vdIOH+7rxNMkNKdxwm7kNcz3heXl3RD2S2kjbdMDelrQxhZ3klTHe5h28vC8samz7AArR82MH/n1Dm1yvU+qxrLq7zLY1dPXtICP17gFdkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9kAX4qzQDTwLRXJhCjNG/2wN8p3Bol7IxZqMUQTGuko=;
 b=TFFX9nfxt3IiLQjeZQ4pwaQnlde3rLiVXoXt7mk4mcF7IcfRRjD3L+xM9AAzU4jgJPaTtr32CG7oleNMPPgOpnPw6TRcz3EaFdJni1OY1Gf5oDSkFD1fwnXnPA8Nf5YN+Hgn/bP3QQop0B7omc/nTDg3H+hiD2wO0m9+tJolaVY=
Received: from BN0PR04CA0049.namprd04.prod.outlook.com (2603:10b6:408:e8::24)
 by CH3PR12MB8660.namprd12.prod.outlook.com (2603:10b6:610:177::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Tue, 17 Nov
 2026 07:21:19 +0000
Received: from BN2PEPF0000A804.namprd02.prod.outlook.com
 (2603:10b6:408:e8:cafe::a3) by BN0PR04CA0049.outlook.office365.com
 (2603:10b6:408:e8::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 17
 Nov 2026 07:21:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF0000A804.mail.protection.outlook.com (10.167.245.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 07:21:19 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:21:16 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:21:15 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 17 Nov 2026 01:21:12 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v4 07/11] soundwire: amd: dispatch irq/work handlers to per-revision functions
Date: Tue, 17 Nov 2026 12:48:16 +0530
Message-ID: <20261117071927.830373-8-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117071927.830373-1-Vijendar.Mukunda@amd.com>
References: <20261117071927.830373-1-Vijendar.Mukunda@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A804:EE_|CH3PR12MB8660:EE_
X-MS-Office365-Filtering-Correlation-Id: 7877e7eb-85be-4dda-be24-08df447b6063
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|23010399003|261022105027099003|11063799006|56012099006|261021123027099003|261009223027099003|261021121427099003|10067099003|261102123227099003|261026140227099003|261028144727099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	E1iBJ/jNMEVZj3qNAh4i5o7OqwEitqsuaVsOSTD8WQ+QltzfWJ4n4N6qkdiUsp2pwMhZyn8MItiLgzel7L0UMgpOPtQWXh6poevWuW6pu2KBAXx8WqWp+RXNzmJkcAyldFrLuk3NJ/DQ8rW53ry2uKlGUME9dd0dfzkZGuR7NLtYC7+U9nLLXMdS1SVJyf34p0fwCXSEADyDl08qeelNz7LeZb0db2k8B3CeF+OcFR47LypJBp5jjcNWl2eFMQJvVOCpKfyDNE6w0RRJ7fSmu6L0IVKREirhMqyrv/gFzr/sIJgrIx+7FpF1Xj7/L+dsgxVBnH9xNV7lQAETvULbpHyV9OgK5+KEZ6nR+BtGVg+D5jzN+7a8okoBQSQc3SUSKPzIrObH4MxT5qi5UAXvLVBRENVHkTdpnYq3gWsZ+EwKfiMtMUpJHSlrF+i+iJcw03djrSgK6I9YGc381kd2lG6y6U2xy3ZhCvQkuAeUuJ3T9fEVkmZg6egiJj/0MlOCLhpdspYw/iNNFLqRZGY9ELhrBpD1PgFr5Iac5ruQtY/0hLec+4tkFCF7X1QZhtvv67YffCXUnK7ulChziKk3GF1L8Iag6laJeXYgdxEWE/pGdfEM19/ZG+s0UR4Sh7Fbauq75v1HcTWOwHzTGOPV3wrg/pGwiFw3IUaFqsMCx6mXLTKAzNmOsCg4BbOZwIuYq3cJNfCFmmflcespYyCu3A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(23010399003)(261022105027099003)(11063799006)(56012099006)(261021123027099003)(261009223027099003)(261021121427099003)(10067099003)(261102123227099003)(261026140227099003)(261028144727099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wsgc7ueznuax34Q51sZqx0ZdvzORco8oeubtbUzR8kOdRB0AlXdbRkYCzDRvoPlWyTtTaG2RZvii2w1eWCWxHNlGrSIzo49qui6jc8MhR/TWMxDxzICkmPi9LKaXjb3JLytFIUYtalpGWoetP1QoG8DZX/yax0yp0G9z+pDMHfo3t9A8JNvrAzEePnWZ+DWAsMZKSYuGAQ4owwUfmgY0UPBAc31IFz/rHIAgdq4NzObqtTpRRwSCjCS+O+c2FiFTL+vTqf4oeAcp5LqmYXTXe2mKRCeC3KK5GbGddq13HdWCq97Ltii14uOJT2VlOgXz5cpjCTkA+6sJ9ZYkzgM/n1IAcnf55m3cl+vz78VgUDz+GzfKu8/B/jl0dYShwf18JthW79mPtRN8vGrGABfamy0SuZOPsMAZW/bX975cCwmCtAf5vj74UEFIVc/N22nH
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 07:21:19.8277
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7877e7eb-85be-4dda-be24-08df447b6063
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A804.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8660

Split the top-level interrupt and status-update work handlers into a
revision-specific implementation and a generic work_struct entry point.

amd_acp63_sdw_irq_thread() and amd_acp63_sdw_update_slave_status_work()
now hold the ACP6.3-family handler logic and take struct amd_sdw_manager *.

amd_sdw_irq_thread() and amd_sdw_update_slave_status_work() remain the
work_struct handlers registered with INIT_WORK(); each recovers the
manager via container_of() and switches on acp_rev, invoking the
corresponding amd_acp63_*() implementation for ACP6.3, ACP7.0, ACP7.1
and ACP7.2 and emitting dev_err() + return on an unexpected revision.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 44 ++++++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index a00c2ee039fd..64034a1b5cea 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1058,10 +1058,8 @@ static int amd_sdw_register_dais(struct amd_sdw_manager *amd_manager)
 					       dais, num_dais);
 }
 
-static void amd_sdw_update_slave_status_work(struct work_struct *work)
+static void amd_acp63_sdw_update_slave_status_work(struct amd_sdw_manager *amd_manager)
 {
-	struct amd_sdw_manager *amd_manager =
-		container_of(work, struct amd_sdw_manager, amd_sdw_work);
 	int retry_count = 0;
 
 	if (amd_manager->status[0] == SDW_SLAVE_ATTACHED) {
@@ -1094,6 +1092,24 @@ static void amd_sdw_update_slave_status_work(struct work_struct *work)
 	}
 }
 
+static void amd_sdw_update_slave_status_work(struct work_struct *work)
+{
+	struct amd_sdw_manager *amd_manager =
+		container_of(work, struct amd_sdw_manager, amd_sdw_work);
+
+	switch (amd_manager->acp_rev) {
+	case ACP63_PCI_REV_ID:
+	case ACP70_PCI_REV_ID:
+	case ACP71_PCI_REV_ID:
+	case ACP72_PCI_REV_ID:
+		amd_acp63_sdw_update_slave_status_work(amd_manager);
+		break;
+	default:
+		dev_err(amd_manager->dev, "unexpected acp_rev 0x%x\n", amd_manager->acp_rev);
+		return;
+	}
+}
+
 static void amd_sdw_update_slave_status(u32 status_change_0to7, u32 status_change_8to11,
 					struct amd_sdw_manager *amd_manager)
 {
@@ -1125,10 +1141,8 @@ static void amd_acp63_sdw_process_wake_event(struct amd_sdw_manager *amd_manager
 	writel(0x00, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
 }
 
-static void amd_sdw_irq_thread(struct work_struct *work)
+static void amd_acp63_sdw_irq_thread(struct amd_sdw_manager *amd_manager)
 {
-	struct amd_sdw_manager *amd_manager =
-			container_of(work, struct amd_sdw_manager, amd_sdw_irq_thread);
 	u32 status_change_8to11;
 	u32 status_change_0to7;
 
@@ -1160,6 +1174,24 @@ static void amd_sdw_irq_thread(struct work_struct *work)
 	writel(0x00, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_0TO7);
 }
 
+static void amd_sdw_irq_thread(struct work_struct *work)
+{
+	struct amd_sdw_manager *amd_manager =
+			container_of(work, struct amd_sdw_manager, amd_sdw_irq_thread);
+
+	switch (amd_manager->acp_rev) {
+	case ACP63_PCI_REV_ID:
+	case ACP70_PCI_REV_ID:
+	case ACP71_PCI_REV_ID:
+	case ACP72_PCI_REV_ID:
+		amd_acp63_sdw_irq_thread(amd_manager);
+		break;
+	default:
+		dev_err(amd_manager->dev, "unexpected acp_rev 0x%x\n", amd_manager->acp_rev);
+		return;
+	}
+}
+
 int amd_sdw_manager_start(struct amd_sdw_manager *amd_manager)
 {
 	struct sdw_master_prop *prop;
-- 
2.53.0

