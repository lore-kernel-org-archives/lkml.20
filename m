Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.23
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794068134;
	b=ELHRWa9/mOU1k93QxQ8KZZhRHasW0HMH6/4uKfN9QC4NJh1PddqOgIIn1fbTrMI2SEMc
	 FGj1hsdENUzhUHaH1haaTmf9TXGppIUsC0fqTTD77biQg4CoAJiKWSwvMGwJiprIptByf
	 ys6QZW1OmHwEJzzBnJwfISunnxqEjus1tlgBqjX+YcGfeclw885dPbwrsqDcsNyj4Ey1p
	 5nIC5N2K0EtdwGP7BBQtNoGFKA9JMO7Aym7yV45kpzuVWZbUELnQ43DMVXfjbi3DKiIfz
	 PQ7KvZzGO/veOtHOrLmbLkce9ltebgPUePMFC0QwQmeGqE1+XYaErQ5SK6xO6vfDt+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794068134;
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
	bh=tWRVwGdd8lTZx7Bsb44acMhFuW3Oz5k0TQNSg2SGsq4=;
	b=TqjrWJLVPDQz6J/2sBaPwH8UQ4WFBOQSaJpEkLkOvLKOxtDwQktOe9AklEqRGTg8Wwdc
	 fK9RFufiAmOERkgxscnAi0hxFxQM8K4JpeD9qPHnlEFJ3YQwRjEuxc26HZfSsGRmh7Oej
	 TL+3MNHGW69JS4Q6CzmvhdHSIHn0wZ+m62Y4/Eb1aTTUpQWEUT09sarOTrbtrd1+aJ37X
	 Lg3SpDijOnh/gGdG+sHuYIJEmB3f/YxoQxFFuvZzpxtyM1vfQwr2/y3wjPePnqsH9ToG3
	 tvIHoIKOan4jT0+8nJzGeWkH/ETSs5TIs66hp32tlhk/SWzOCz1Pym7VyzOJhz9uX2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="ieFNkQ+/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.23
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012023.outbound.protection.outlook.com [40.93.195.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBED606AC3F;
	Sat,  7 Nov 2026 16:15:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FBED606AC3F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ieFNkQ+/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V4fHb9To9TWQMFLYkTLu/q5enS2jFPTKOOIEEhoQ6VPVVLh90cnGRlJXuDtnmpvb2tU+P5pnyVGOBeGV6uvKuRIGj9bIBEnaN4PrXgHbsgqklOvk9d/gjazmhVddAYAntIAanMCb1xjb5fJLRMHjwjJJl/342N2BHuMjL2oU3y2fZ5kJtKMX5U1OGrNFqeVR1K8ba3aCxzSt0nvIa+epDmamUbauWvC/zWRUoQf8pQSyac5uxX9nNGK4clWSujsWeWhq4a3dFuuaZ0AzUR/k+6VIOWT9QvBfGKTKDS1vGt86THBFjCknJ9dnorNSJYNF4ECeKdxn1Zw3jNpmVu9ZbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tWRVwGdd8lTZx7Bsb44acMhFuW3Oz5k0TQNSg2SGsq4=;
 b=NLJX0Z83UWVicWXuRBg/fBk2H39nTU+O0RY480P8y7+n3onn7MMvQysQy3hpIBCLwFyOgXSlhhh08/wrB2bZvteioo5/LqPWoC/oknjvbXRP9ZYemEankmZ/fQQAIC09X9Ekuf30tAaIXj9DfeXvjGHFCm3ow2WLL1UevaNOVsoKv1m0zmG/75II885TiXckDzDHKuoheT6Phgu5dNTP50WuY5i/2a04wQiIolZvARcgVOqpDHBmDWIXFGyMhQOu/EzfaV1eHrI41YtixfWnOfy7CfNymbX0nhiWnjw30oq4wofTsZfRtPEn6xGpdgolaznZUqsxrW7fidGR1TA/Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tWRVwGdd8lTZx7Bsb44acMhFuW3Oz5k0TQNSg2SGsq4=;
 b=ieFNkQ+/iIoVL/x5dZxn93dTXx5dMpRpzwxpSWd3/L2t83d1kB6VwDN+brS8sqPivf4HdKOUAb95R8X8mwKrsU8LEEZEnfNSYKniZvlAVbgp5Hh50apyPMNlejJ+xRUznJTSaRoMJvfxOKnEV297Qlob5yEX2OYEeF3bCkXwh+U=
Received: from SJ0PR03CA0149.namprd03.prod.outlook.com (2603:10b6:a03:33c::34)
 by SJ0PR12MB6734.namprd12.prod.outlook.com (2603:10b6:a03:478::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 16:15:30 +0000
Received: from MWH0EPF000C6184.namprd02.prod.outlook.com
 (2603:10b6:a03:33c:cafe::a6) by SJ0PR03CA0149.outlook.office365.com
 (2603:10b6:a03:33c::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.11 via Frontend Transport; Sat, 7
 Nov 2026 16:15:30 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000C6184.mail.protection.outlook.com (10.167.249.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 16:15:30 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 10:15:18 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 10:15:18 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sat, 7 Nov 2026 10:15:14 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v3 07/11] soundwire: amd: dispatch irq/work handlers to per-revision functions
Date: Sat, 7 Nov 2026 21:42:24 +0530
Message-ID: <20261107161345.3411491-8-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107161345.3411491-1-Vijendar.Mukunda@amd.com>
References: <20261107161345.3411491-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6184:EE_|SJ0PR12MB6734:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e9286c5-0a72-40e7-7f92-08df3cea5818
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|82310400026|36860700016|261026140227099003|11063799006|261009223027099003|56012099006|261022105027099003|261021121427099003|261021123027099003|261102123227099003|261028144727099003|18002099003|22082099003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	G8i7mKc0vjOyTE3DB7yMVt9WQbYZ0OKXwA3hGSgV5tjxf22aP2kBzqzKNyROipucYvmoihUiUbfupfzKTGrjthhN+a8hUy+1h+9HUrSrwagSSMjOoLVbn8ZfwiiEP+p/LHfdSlAShs661R6LQ2iwC9/qjFMl1QVfeR3x+Z86alq78F6jrNiGZI1ARZEc+JXxwEhllNuipyvQH42GcXepku5NW/VbFuwGrb/mX9T22t7gfPtTXAcB7R88ixpiuzRX7jyRt46PAAlq+qwW+WP8QT/hxs9rMaJNDahEqVQDuwYdQ5sDdWRnMXT0GI1coYLaRzRk9uVxhY3mo8SBnptoiWORhcA3W9na9JbKNR2H93YNFQMPG76xgjjY3jNLs5sH7zHk/v3yl7NrDN2GrhHSHkmy3nzzSIJf3nJgRDfuApOe3USrKUzu2C6TbSWQFy6wSSm6P8OaiiSskouKW4b+it5u5VEgr3aBTpb0t+07vk9s1g1XlHq5O1nK8czD+zmq+AjQsl5eg/6nqCIwoMHOofTMa4H93V1OpruC6vZcpUB+3W1EDRDoyThqOA78yx9e2YsPp3ZnhMj53ZSfoYEDmDSzhDyX8MilaNCr11/xUWOPCJ3FHLPlYBd6z+hnYuR50Mk3xCijqSuRUaZIS+u704/LcFO7h3OgL4NMH2qUiPqfN7UV4ftvnWLlmFsDm1vsTGUDMCXTI8n9oMV4mz8D/Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(261026140227099003)(11063799006)(261009223027099003)(56012099006)(261022105027099003)(261021121427099003)(261021123027099003)(261102123227099003)(261028144727099003)(18002099003)(22082099003)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zv7N+c9WTnmdVntnxwJOjjMwft70NfK3yiUsxCW3pNLjnIf4iuTCOjVH36oPNXM4qwp1hE8ShQk6jIPsfChYFt+H+B8fCt0flBGhkZxBWSsm6vHHDZcb8pBry9h0GAG4i3mxxDGgLfTKfP/BL3fQOYW4Z4m7dTfbmOYzwfyX26ywU27YKXlkouAQqa/rX7IXww5Dd80CX1KHAwgIh6yw5PL/RnDfTaXzqALyvL4ja/DLopcVZ4x9zK6pOq5SjNz+M9oVLIk6f4nkdixkMmpcIpFor+tA9TaZdHCj6BOeue7c1sStzjosYhllBqfCcfq68pRy2bRVuN/O5H7gkEtr2vVo9UE/6h7BAehl2+PFyKwxt436I45fzgofQRAjnjMP9p/FF/72na3iSTFxyw7Q81A2OUWBcTtkbLWz4LBo49hAGjRosCVQoTrWPSTy6hsL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 16:15:30.6827
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e9286c5-0a72-40e7-7f92-08df3cea5818
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6184.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6734

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
index 52801059b87a..83d5f0e79cf1 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1067,10 +1067,8 @@ static int amd_sdw_register_dais(struct amd_sdw_manager *amd_manager)
 					       dais, num_dais);
 }
 
-static void amd_sdw_update_slave_status_work(struct work_struct *work)
+static void amd_acp63_sdw_update_slave_status_work(struct amd_sdw_manager *amd_manager)
 {
-	struct amd_sdw_manager *amd_manager =
-		container_of(work, struct amd_sdw_manager, amd_sdw_work);
 	int retry_count = 0;
 
 	if (amd_manager->status[0] == SDW_SLAVE_ATTACHED) {
@@ -1103,6 +1101,24 @@ static void amd_sdw_update_slave_status_work(struct work_struct *work)
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
@@ -1134,10 +1150,8 @@ static void amd_acp63_sdw_process_wake_event(struct amd_sdw_manager *amd_manager
 	writel(0x00, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
 }
 
-static void amd_sdw_irq_thread(struct work_struct *work)
+static void amd_acp63_sdw_irq_thread(struct amd_sdw_manager *amd_manager)
 {
-	struct amd_sdw_manager *amd_manager =
-			container_of(work, struct amd_sdw_manager, amd_sdw_irq_thread);
 	u32 status_change_8to11;
 	u32 status_change_0to7;
 
@@ -1166,6 +1180,24 @@ static void amd_sdw_irq_thread(struct work_struct *work)
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

