Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.6
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794089454;
	b=GkpvHaEL+HYrYGhqMVmsoiRz4OClvky4wGTRhqZmigbLNWEzXOwchSgI/ZvdBu4yVsWm
	 5uKA9AbzvYzBljrOIffWXgfH67dbSOIT1VNjqg2H4pkgIGDfIGQqNQNCvziOT8DbG5Vau
	 RfJrRcSXrmRgVatIJ0sai89ajht1sUMCRqYy9OSRyOnsqjYc1VLvER0zPYzMHge8v3KPt
	 HJ0EEsI3H9PGzoOfDTQ60wQ1Mcj7+mxxh6Qq/YiQ4rCqfTNiWbPqgadCSvn5KyppnskAw
	 jy2BTQlPCxlQa4CbiLGTwldStsMRby/wDQ3X8fbBnUueXGUHC2eK5Lt+2r1IFSup1Cg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794089454;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=HqcwBWNNZ1kxIdLAVoWCmfmFoh26twuwq/Cg5b61OMQ=;
	b=wb3SMOd42HaSqSs0JiCPOuQfj8ibCSTcc/I6EM9WbTvQffiSYSQd6GNG5mUAx9wDyEVy
	 z9JbAI2+yeLjrsbUwpn0vYYXbeRKUxrYQ/7XrLzqUsSBrbWDX8yjGBSihxRblmkNivqwC
	 1v6dyvY2L/uZWwxb0rDe1Nwz04TVrEKbnuNU6nkXLs4v7zb/TDhQk9QxQ7zaesKLSI51Q
	 xcTns42bR/bAEGoNUinMyhKPuvNnQgJAaw13hZ/HZoKz788R+qeElVhEvdkh0qNJEOwmq
	 CkKOLvFKJL1JBVXgfZamShqPqMOIZAJxfuKaNkqOoLgQ1P9IOeCROycAjqUenH0WqoQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=O3vsiRIv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.6
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010006.outbound.protection.outlook.com [52.101.193.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3D5606A335;
	Sat,  7 Nov 2026 22:10:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C3D5606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=O3vsiRIv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kH2xIpncGdtVAgfyM9IkaJ8awgX5x3ihyZJZuoHRGlI9vxp0+lDcHQM7+TizZrHmESG8SBmuweLMxJv6j7XNBqgvMTCVA776D09ucZpcLeEraqRIV8ujWwFvFg2JqYRYI9A3k9tdfjVbnVBKgCqlGWbFDtLVW7kxtWz1UQuRuZdkycKuaE3pbXk7Q/EYkyYOjXS/BqE4Mg3H99+mJ+TfbvTIbEFOxy5YRNz09XBkq0kP9kwA0fNVYnq8mLCUKsLM0NH1OPHDQVZhpAiDTtaLraqix1AKQL+X4t8QZ3Nn1tLpM4XQMdyV0IKkXozhh0i+Xm2id13h0Va3V/lNM4zc0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HqcwBWNNZ1kxIdLAVoWCmfmFoh26twuwq/Cg5b61OMQ=;
 b=g+VHN7TBidZ0W709xTYRuycdkvoxtG0FTa8edeYJBBFavW2WuhIKnWSPV2UZF9Lls9R9YmWeL/yMzLSuTcjQ8poV9XX1XWl1QRNuUd38uqSJ6PZqbX177TPyOf6rpkHyRfUg+A7e0HFUCFApk6SR58aMHsRdVMqlcpeNkz1c9CMiLDLgVZ4bmM0AQ9Ob3/2VCmmYECYl7xkhlVw1jlEQS3zl2LoK2zZJtH9xdqAFde/8mfoF27qdNu7BUB0b7Z1QUCGq/1U8Z0iZDykq15CcPx5fp94GVSwyyWMwgkT+T9TNJmN8ZoEj7UeJptsOSjGXRja0sTkn6sirjEs80OjuJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HqcwBWNNZ1kxIdLAVoWCmfmFoh26twuwq/Cg5b61OMQ=;
 b=O3vsiRIvT7kVnAbiSSwZEkH7W1Pe6BVprS8dryBb1pQO0NJnxzJbr//UHVPdGOC3l6ngUFrmExL84FThvWFI0EdfERHjWcY2KvyfjnzNhX+skBqrE490K6Fo1iPb05khtU5TRsXdMMn8WJojRC5DGboTU8OK431MEEX9oW5kLEY=
Received: from CH0PR03CA0386.namprd03.prod.outlook.com (2603:10b6:610:119::29)
 by BL4PR12MB9484.namprd12.prod.outlook.com (2603:10b6:208:58e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 22:10:50 +0000
Received: from CH2PEPF000166C8.namprd04.prod.outlook.com
 (2603:10b6:610:119:cafe::8c) by CH0PR03CA0386.outlook.office365.com
 (2603:10b6:610:119::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 22:10:50 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF000166C8.mail.protection.outlook.com (10.167.244.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 22:10:50 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 16:10:49 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sat, 7 Nov 2026 16:10:45 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Syed.SabaKareem@amd.com>, <Mario.Limonciello@amd.com>, <Poojitha.N@amd.com>,
	<sravisar@amd.com>, <Richard.Gong@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 06/11] soundwire: amd: add ACP7B/7E/7F clock-stop support
Date: Sun, 8 Nov 2026 03:38:01 +0530
Message-ID: <20261107220913.4058072-7-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107220913.4058072-1-Vijendar.Mukunda@amd.com>
References: <20261107220913.4058072-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF000166C8:EE_|BL4PR12MB9484:EE_
X-MS-Office365-Filtering-Correlation-Id: abd401c2-258b-4615-25f4-08df3d1bfb8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|261009223027099003|11063799006|56012099006|261021121427099003|261021123027099003|261022105027099003|261026140227099003|261028144727099003|261102123227099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	0hmJXeGRXjyM39PrdL8sYe/4Zf4EXnbqKa1Z+xpBw+xJCzZDXUiKdkW9K4Ca5gg84SgBTnt9gzYu+obV11DSuVbxO/7s4+1D2OFruwlVvjY2BePVp4rYvGM33jZPCiQxm3YNJPmIPCJhX9LVQj8VKCVa0rNy/zEIMHDzHk2Sw5chAgAGtNewfhVAmSzWCa4b//y7e/NSvfGrnaHGxacCHDj2e4TEPiXPpg5llavl4E+EIIPxf8pwRmt51/C9A3Pr5afERhONKkJJnRH3ITSOraYQ6RNjndL3S811AN3OnL4+B3opJyG/Dot84qR2UZhGadwnLQuNCkDKuaewrxnW7SzwUVWMmJnWs3mF8cGdq1LacgQ+FyBOyze9dW/Ju/ddR569iy8pjQXzChCIk+of63LpPxiE+Wf/5N4zEf+OK6kfg+hPJqyIuhwtPEFldTM2PApHAiDpp1jjAo2X4mnf9Yh+0iJnr9xRXP5CHfGaVyEWruj4sN5orIn7EueDP8F5X+stBp/pgCd3XA7O9JQGRuZT8E2hgViw1WWdLrUk3aK6lnXGiaAHgfWM5zZGGYMsO5wG/SfMbwNvhhk5AdnAT4eqa5Y0UxDvcO1Xj4LYcKVfgaLvAeBnRYJOjUriyBd2oVGAxMWoPydny0oeyTDu0Q1E16lI+ZMaagXA59yxocqamM4WfTRvxz3/cUuUHHuMJuEgREwLWacBD3cWlSc9qg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(261009223027099003)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261022105027099003)(261026140227099003)(261028144727099003)(261102123227099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	A8yt1lrYa2J3crY26pIBH62srYDN7W8puAJURYJVIKBKZVSPYlKWSE+1S/KbYanviTI6KEAy8C02uy4jIL62edoTPmgCkLa5sGem7A+O49uwpnntPukXDmNcSIdS9pnE5Z6RKrtPho7NASQyP3GVeD7AD2I4gbeSD2B/+9Pq/RBRMEThzPvOcWoty6eZdvaZqWJ/MFJtr0693PhLff1+PYaJ1tLvYndoCRKvmFAavsz/TpIRrVqV1yTO/HpB7TgLO/Mulw0fGpElQgxDqCe9BGCXe6iA56kkkvLAckzT5QnN2qUeswMNbRucSOO1PnX8KgMkvBsAOd0D/4sN0uQ0EmMbuN5pi0yMzSar8rrNdxpo2hKFmDPs2iA7ZrJY2wDPSIIf+Zd+KVtjTZJD7R9iT76+NRHYPsgoy40uv68cLxi5r16AeqHG+5/nl+/j8IIF
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 22:10:50.3079
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abd401c2-258b-4615-25f4-08df3d1bfb8d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF000166C8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9484

Extend amd_sdw_clock_stop() to handle ACP7B/7E/7F revisions.

Set clk_resume_ctrl to ACP7X_SW_CLK_RESUME_CTRL for the ACP7x
clock-stop sequence. For wake enable, ACP7B/7E/7F use a single
shared ACP7X_SW_WAKE_EN register with one bit per manager instance,
unlike older revisions which have dedicated per-instance registers.
Perform a read-modify-write under acp_sdw_lock to safely set the
instance bit without racing against other manager instances.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager_common.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/amd_manager_common.c b/drivers/soundwire/amd_manager_common.c
index 1f0575c6942b..158845f67224 100644
--- a/drivers/soundwire/amd_manager_common.c
+++ b/drivers/soundwire/amd_manager_common.c
@@ -553,7 +553,7 @@ int amd_sdw_manager_start(struct amd_sdw_manager *amd_manager)
  */
 int amd_sdw_clock_stop(struct amd_sdw_manager *amd_manager)
 {
-	u32 clk_resume_ctrl, val;
+	u32 clk_resume_ctrl, val, wake_en;
 	int ret;
 
 	ret = sdw_bus_prep_clk_stop(&amd_manager->bus);
@@ -574,6 +574,11 @@ int amd_sdw_clock_stop(struct amd_sdw_manager *amd_manager)
 	case ACP72_PCI_REV_ID:
 		clk_resume_ctrl = ACP_SW_CLK_RESUME_CTRL;
 		break;
+	case ACP7B_PCI_REV_ID:
+	case ACP7E_PCI_REV_ID:
+	case ACP7F_PCI_REV_ID:
+		clk_resume_ctrl = ACP7X_SW_CLK_RESUME_CTRL;
+		break;
 	default:
 		dev_err(amd_manager->dev, "unexpected acp_rev 0x%x\n", amd_manager->acp_rev);
 		return -EINVAL;
@@ -596,6 +601,15 @@ int amd_sdw_clock_stop(struct amd_sdw_manager *amd_manager)
 		case ACP72_PCI_REV_ID:
 			writel(0x01, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
 			break;
+		case ACP7B_PCI_REV_ID:
+		case ACP7E_PCI_REV_ID:
+		case ACP7F_PCI_REV_ID:
+			mutex_lock(amd_manager->acp_sdw_lock);
+			wake_en = readl(amd_manager->acp_mmio + ACP7X_SW_WAKE_EN);
+			wake_en |= BIT(amd_manager->instance);
+			writel(wake_en, amd_manager->acp_mmio + ACP7X_SW_WAKE_EN);
+			mutex_unlock(amd_manager->acp_sdw_lock);
+			break;
 		default:
 			dev_err(amd_manager->dev, "unexpected acp_rev 0x%x\n",
 				amd_manager->acp_rev);
-- 
2.53.0

