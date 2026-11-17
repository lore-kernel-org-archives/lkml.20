Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794900096;
	b=c/RauiF1OW9S/SuDRqvO/gxJ8oCd6JSM5VBaWIzvQEsnzsGMmWUOnrpcI9OeBxiTnfLO
	 vwTn2ZEGBKIgRUsbHd7Rnw5sNAhXZdZp8Lhsgvqu+3x7UuJerjwPSIzaciWczmHnPj5G0
	 AhzgzKJNzPKOn0kaaHSmrFqNGRJEXD1/zo3+7T7X9QCKN2UJhFoxj2p9mVBbZNXMEa36T
	 OU5QUIbcGcIu6Q8REBQY8dBJWyJgDzmpPdFapyzXDYnJSLIedc+3RbNGRXlTeN+y7yhxL
	 sNmvx42tHEC7ihFKp/Wao7IGXRlK3PkpDWkew1PMyWTHTmHqn4iEDcm9jLfAFfI/LHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900096;
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
	bh=IzK4iHjeBXTBStYhqM2N9pB0DgF4HoIKYMN0O+LASxQ=;
	b=VHFJEEjEQs8CcdNVYvx25BSBN6cOwehf+5pPjwem4nRB60N39ACsQodTALDLwPA4pRB6
	 iq+rqpvbjTrxyiwKnE5ME4EWxEgqWaoatl7WsSQ6qLlmEpQsUCWHtkCnJSf1LzPE1ARbG
	 kjWRxAp7xDKFPpSLDu7qk7IMdTfni2FsPkQ52bHLoeiWfe6fTVEhCr61GbJRux3+jnZLJ
	 eW8JF/bBRXuTDkT/GFHyELdJycXFDbxI9kX1zuzRvBdlUaI62hdGaQm9qLjSJtEkFh1xe
	 8fIkz2UREfqyQMUgWh+9cmnwIR4Clfzcbde4bppz+kL75v1dj+kwft/XlZmWiWzX4Gg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=CtlTGlDo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.45
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013045.outbound.protection.outlook.com [40.107.201.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13189606A33E;
	Tue, 17 Nov 2026 07:21:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13189606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=CtlTGlDo
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GaAIbpCfPwpEQUKxjeKukoXN4UcVVMxi4ZC+7ANJrMwV24lVTGfK80Knm2LV6uB91+hmP8hVQ391/fQWxVqa5b/YMiX5skvhhh9StDhuaKy/9X07Q91Z8KPErRMUckdninvhXFTbk4gZqnEhhBaMW/yUuqhrsfJOFkhKTYCY9nw4EY3mo2yJk5Syr10us7UEz0GPFE1lZChqDtvng60WBItOJvFov9BRWd9LJYGJIEthGL6GAogdwB8euGsyWGDMCgbWsOdz3nEX582IPo5hPBkwELqjaP+sUBTpd2QjVQNAAF7M0PAwde6ATq3TLCNQWonfonIrA0Q0CTIELo+XYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IzK4iHjeBXTBStYhqM2N9pB0DgF4HoIKYMN0O+LASxQ=;
 b=Nm0EdmlwKfRAoTIZnub++D3rvnL9Z4HMb15dykyrdGCN3qVyvVG8pPc3t4mfzplXlP9JuBNyqpfJ5qT1Gts9j9z5kFFQjzrZ/WiT6FWqdwrn1q5eLtZp1Pr85Nc7RdPHgyFlK2CFTdsuar70HgkFNX6fSyQeNFNh6HvkMV8a8miQipNIeKQlk7GZOiCO2jfitmxDILcjU2oS6wsp5ehvSLQFnn9ILW8XifsOsi5TD1zRQ+/4dKqzNvRB7YsavzGOBLn9YtfhK3oqnpjlVA7w3dlU2PbxsLQXbT799/4qxZFFcItBqew+i80g+CWC/AQWXJI59bp9SQbXLfhYmWIRhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IzK4iHjeBXTBStYhqM2N9pB0DgF4HoIKYMN0O+LASxQ=;
 b=CtlTGlDomtxa6ZIXeqwk7R/IDNnZrFYEkLiGOVoTNZFTBy6VBFWZS/qa4xFYeA9Y0uu4MgYg4ztZtwnuFwiUTAI/ApJQkMDEkWMVNdfJW+7MllsFohBpUB/VqHqVtDYLklMr7aMoxHiH+qfPEUWw/soA/H2skrOAIW7KkoR+Jmo=
Received: from MN2PR06CA0025.namprd06.prod.outlook.com (2603:10b6:208:23d::30)
 by IA0PPFD4454CAA9.namprd12.prod.outlook.com (2603:10b6:20f:fc04::be5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 07:21:32 +0000
Received: from IA0PEPF00000042.namprd04.prod.outlook.com
 (2603:10b6:208:23d:cafe::80) by MN2PR06CA0025.outlook.office365.com
 (2603:10b6:208:23d::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Tue,
 17 Nov 2026 07:21:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 IA0PEPF00000042.mail.protection.outlook.com (10.167.249.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 07:21:32 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:21:32 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:21:31 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 17 Nov 2026 01:21:28 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v4 11/11] soundwire: amd: guard clock-stop register access by acp_rev
Date: Tue, 17 Nov 2026 12:48:20 +0530
Message-ID: <20261117071927.830373-12-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: IA0PEPF00000042:EE_|IA0PPFD4454CAA9:EE_
X-MS-Office365-Filtering-Correlation-Id: 64e1de18-0a2a-425e-466c-08df447b6803
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|10067099003|11063799006|56012099006|261026140227099003|261021121427099003|261026121527099003|261021123027099003|261022105027099003|261102123227099003|261028144727099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ESode1oLH7DFiH1ErAnESspVZWbMZPro/Q5Slb3LBPJNmxwRbHUxkI2aiV6HqRtlFe5qxIldkN0+Yky2nmLYjbZHfQo+oTCSW2KZtjH2smydvcx9IouPE7Av761xDgjh0thnZObVJ4bYRewClC/i5TREyp8nKj5wtZ8Ke0mQLBSn6E0Cot1z6uShc7LJbhNRTSvA+rzXA3r50LfIz4nTHbpzCjzHjvZxEDDyiEnVQSl9cc+zEAajNdx9FtZxE6crIU+LstM3ONsbsBw2TEdxg3xCyUudS75lZCVxZdCTnPbi6elqtMohtXzxCIYO2xC/n01xg4iayIs3tA7iWygLRoZX1YnDtR94UefTuB+JhGHXAMD5eg46JzIQEDrk6gBKFKFpAsSEE6Mtvkdk+0z+8A0596xHp/FZPCdrVTWXQRzxG3LzFl8HGJPCnuuzBgHeSgMtOq107ikg6ZmPGhVZLYfaZslh7r5PXnwaygKfiqPWLI770iHIz0O0dHOQcxkG/9t4HjNqLFf37tn2K3KuDPAf1IGrowSJWQQBCLN37SWl4a6AALslUu+zMstzrNKeNer8Fic3vaEfuycjUGm7fGC7/ZeqiQuZ8Y0gB1kAzdqYk9JkoWJp/fVUnBSgtHfWv9Q+O4YYWhZgSIraeuMq/TB54t9iMTNcrJv6dGA8DD8Zrw3byxm2xmsQbUYInPGT4jZng2rdh5bUGN86hqZwyA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(10067099003)(11063799006)(56012099006)(261026140227099003)(261021121427099003)(261026121527099003)(261021123027099003)(261022105027099003)(261102123227099003)(261028144727099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2gB3dWkjhwnMKj1Fif/idNIJ6v6QL7zTHwzNAaichQaUPG8I7xOLKPGxj1qBNI8cvE47ALVh48Vb42FXpZUITlxcnxL1xDH5dPZDKTH8rDArU3oDbVRaxd9nJ6eOAwh4WHwbXbsEC1n/gdX0N6cqjuEfuTtpwdvcVH8ywfyqR5Yld6aH3jXSbVXtY2mYOMCx5fvOoQ0MyozHoKDqCcoUS3mOAF+nguBdX6W+L8XhNzc748BVr0C7xlCxSn7B5dQpr3F35829q7JGdfphCsseQitLUlQmN46/wSuvHoEA6401K6DJlnJ9SOl68SBNb4oAMYuAT0iKii91Y6hKfUWlJcbwy37+sGJxU9ggYaNztOqivBzskJoZJEFfYhfUt7E7jFHs20WKZ+KlEvSzr7YyeftT7zmui8wbZYSpp0WTZmlWQzbLZn6KhkK3NbUyGwNT
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 07:21:32.6160
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64e1de18-0a2a-425e-466c-08df447b6803
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	IA0PEPF00000042.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFD4454CAA9

Wrap the readl_poll_timeout call in amd_sdw_clock_stop() in an explicit
switch/case block on acp_rev covering ACP63, ACP70, ACP71, and ACP72,
selecting the register offset via clk_resume_ctrl.
An unrecognised revision returns -EINVAL before clk_stopped is set.

The wake-enable writel follows unconditionally under wake_en_mask since
the revision check above already guarantees a known acp_rev at that point,
avoiding a second switch that would leave clk_stopped = true on an
unexpected default branch.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager_common.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/amd_manager_common.c b/drivers/soundwire/amd_manager_common.c
index 987283d06cb9..7712469d6ce7 100644
--- a/drivers/soundwire/amd_manager_common.c
+++ b/drivers/soundwire/amd_manager_common.c
@@ -520,7 +520,7 @@ int amd_sdw_manager_start(struct amd_sdw_manager *amd_manager)
  */
 int amd_sdw_clock_stop(struct amd_sdw_manager *amd_manager)
 {
-	u32 val;
+	u32 clk_resume_ctrl, val;
 	int ret;
 
 	ret = sdw_bus_prep_clk_stop(&amd_manager->bus);
@@ -534,8 +534,21 @@ int amd_sdw_clock_stop(struct amd_sdw_manager *amd_manager)
 		return 0;
 	}
 
-	ret = readl_poll_timeout(amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL, val,
-				 (val & AMD_SDW_CLK_STOP_DONE), ACP_DELAY_US, AMD_SDW_TIMEOUT);
+	switch (amd_manager->acp_rev) {
+	case ACP63_PCI_REV_ID:
+	case ACP70_PCI_REV_ID:
+	case ACP71_PCI_REV_ID:
+	case ACP72_PCI_REV_ID:
+		clk_resume_ctrl = ACP_SW_CLK_RESUME_CTRL;
+		break;
+	default:
+		dev_err(amd_manager->dev, "unexpected acp_rev 0x%x\n", amd_manager->acp_rev);
+		return -EINVAL;
+	}
+
+	ret = readl_poll_timeout(amd_manager->mmio + clk_resume_ctrl, val,
+				 (val & AMD_SDW_CLK_STOP_DONE),
+				 ACP_DELAY_US, AMD_SDW_TIMEOUT);
 	if (ret) {
 		dev_err(amd_manager->dev, "SDW%x clock stop failed\n", amd_manager->instance);
 		return 0;
-- 
2.53.0

