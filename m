Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.38
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794089478;
	b=RYljGxwI1CFnnV4gqH1WlCtF3RWzTPGqm6vW1891k5rLIbrsPXPucQLnPjOm9saor9XJ
	 6QefHp00PICriio13cKL3Z/IkVQX1VdWvq9F4RESNZnpPR1dUl0qgL/88DSEQ0x7LzYvI
	 uHkrLqll6KGkBrzU7mDlRbqUv11JO5CrzaExj93aQGT7XMaQw5wlliP4pSfHgnCRzZqdA
	 JADnUF7SvOqrL1xrSGgNY4yni8WB0QzpPXJUwHHHCP45CEjaVw1+EPyajOBOCXAWU1oHu
	 fTH+J8tw+4UGLMbiJ6KwTv/NPx0apcx17+vona6m/5PSOpeGWsCLf2h9Wfx7ivX18EA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794089478;
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
	bh=jEKNnwTusgjDSP1EuA1JU8zKXPf/1u7qy1goJo7KHlQ=;
	b=H6bIsADAQLJni2J1ZCQxgBiz8gR0tpA0WOqYCsVMmu/2kuZpI9QMDw+pULcJZa/9dvVw
	 UcVj1C1HNxJFg+Od8OMaqho3D5MlEsGdzUm142gRAKxSqfRdF5IhrWH5uefsimdPaLl5m
	 UvhSvu3QGuD56cL5Zuqq0CK25PZ0il8i9PTe3ApEwCuGoV/ryXYdNv5ARkX4RA9iAHr4h
	 sGM3EUhsI1av/URZszuS4JNGaPE5iCcQOlEnRW9EiCpLuXo88PWKRrkvA3lZ/3WE7Ou5j
	 3L6cqS5AFSB/RW25K+nxHY9Z3hqgYyDiGOGxHklQcRO94JRij9XQoY+oMcrPeI0wNiA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=lV7YIpzR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.38
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012038.outbound.protection.outlook.com [52.101.48.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252BC606A32E;
	Sat,  7 Nov 2026 22:11:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 252BC606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=lV7YIpzR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jgVa00XnUd3mkvc/QYmNdg/72Sjdft2kB7mO5gC+PCUnMhORIzGZq+JgK0OfsyXrjm7NKRlmJkPve1zHlwkMRq8FiVyJA1tlVGGMNkZ0uFbl1HZvBblqme60/QiuJSNBSAtd9nh5c+/I5o5DykCb/L0UIyK7OUVTUoUY4ki7na+7dcz0kEFE4sLK51u8toqPYk/xJochjGXAKX1bhamX/NE2zX9d4FXW7fcznmR7xT4Q06xvMgePb/YOydcmQIrpeCEa6IHOPyCDPpCLsXLtEmLtp+/XlUAgXLC/BSyxoAUmoOEUnW00JKknhs4Mkg/n89BsPwRzdvZZ+1imzxxOmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jEKNnwTusgjDSP1EuA1JU8zKXPf/1u7qy1goJo7KHlQ=;
 b=duf7f4vHGsJqiaAanD0MVuQMSWJe9Kx3fo1Jv17DxU0jLc7ExBsqaLWr0vzC/JbwgSd0SkOq/BXbMSgp8amNjHNvh5dFWCfujc9hFRfZsAnwGqydBVC9iWClELkn5U1S37GfnipEBSR6SuZ67XmO0A2cgy91diELi58md6Ntdd+RtQDpv3uUWo5JPr8RRWep9E2qA3e/TBqA6snJfXgdU8y73kmBEAzrgTs8rcWtft9ANq9hPWiqJuxLZ85m8X6s5dinRXEypidSwqU6xhc9jSEx/879WoLQ76KIrFACph+qQzPSoRQzH1kBHOgG9sem7SomUWcdKzt1Q0IYasSpFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jEKNnwTusgjDSP1EuA1JU8zKXPf/1u7qy1goJo7KHlQ=;
 b=lV7YIpzRoEJQCmnzm0ntSuw79kV8bhTwoL1hbVnjSYYpyVAb5xVfZXZsdJx5VyXWDeeSoH1udp10d6Le1neDIzZxfQlHmyiFxWUoS8UTQqK/7/pNJQK9d4O3I/Df6k2NrFFQVUTe+q7ZyIO/Hqb/pG1Ag1EmMNBqRHB2bFaJ0jo=
Received: from BN9PR03CA0972.namprd03.prod.outlook.com (2603:10b6:408:109::17)
 by CH3PR12MB038898.namprd12.prod.outlook.com (2603:10b6:610:361::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 22:11:08 +0000
Received: from BN3PEPF00022BD0.namprd03.prod.outlook.com
 (2603:10b6:408:109:cafe::3b) by BN9PR03CA0972.outlook.office365.com
 (2603:10b6:408:109::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Sat, 7
 Nov 2026 22:11:08 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BD0.mail.protection.outlook.com (10.167.248.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 22:11:08 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 16:11:07 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 16:11:07 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sat, 7 Nov 2026 16:11:03 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Syed.SabaKareem@amd.com>, <Mario.Limonciello@amd.com>, <Poojitha.N@amd.com>,
	<sravisar@amd.com>, <Richard.Gong@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 10/11] soundwire: amd: add ACP7x generic bandwidth allocation support
Date: Sun, 8 Nov 2026 03:38:05 +0530
Message-ID: <20261107220913.4058072-11-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BD0:EE_|CH3PR12MB038898:EE_
X-MS-Office365-Filtering-Correlation-Id: cca4e61e-bb52-4d16-88f0-08df3d1c0646
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|82310400026|36860700016|11063799006|56012099006|261022105027099003|261022075727099003|261009223027099003|261021121427099003|261102130727099003|261026121527099003|261028144727099003|261026140227099003|261102123227099003|3023799007|22082099003|18002099003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	PEgEvrKWaeLaBCAg9jlnvKioU5UHHqRLvkaoZqfaybrxgPASTyFqyY+eOMnjY6MLu6IYqMA3Te+aXGUZ+U2eRSzu93b4+fzh3GKqWOeqso3xcsGKfjgsu9sO19gHHMQIBLdK85ForfYI+1jJrm81u85z9mNYQqLGWrlD7jgYWMrqJU0SQWJ45PVjaGChu1mSTkxaJx+i6nHXJVOtvf8stQ/rKqrTJHaiT4jND4pVaO+d4qX2S2cp+LBCkieQKMsJHtar/bnDflo9dYU1AC0XOEH4TOcejJmkzVdsa/6bhWrt+SFWjAgcIExpJtowWHrlgzfHHZjfSXLi9LvUcO/VPe2ZfkK6BSePlZd5BnsLpfYU3KUVSCWKcIr8bHYgWduOLh5jjCh4uu0BTuZ2/t3QM/12aKesTmKjGcOGHdgiH82CMOjYKBve3Ug6F1blR1R3+aqryE4HEDO9ANU7aAj1K29AUm2EXce6NR8ny8FhE/jSz8HSJUGReFg8vsl/0L32uiWUQgf3JjLNFYVtAPbxSQKkB0mPB+3x5+w5yVOCG6zzJwoYGYbJLvwzvIYs8ubEB/kepqgj/Pn4/DTUrU41scnwlDObHtZ0qRfjerpGFBSKfttFMgyP+btoogzTY/u5q2vQNl0hMwFf/K+S5zDg8ZPg1Cot4lWXad1h8wDFiiF2l0CaIv6nM89VD6f6BznBTMT9tJ7K5EUdARzJpM1vIQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(11063799006)(56012099006)(261022105027099003)(261022075727099003)(261009223027099003)(261021121427099003)(261102130727099003)(261026121527099003)(261028144727099003)(261026140227099003)(261102123227099003)(3023799007)(22082099003)(18002099003)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	j+SJn3r9H6x+eFWlLmax5YcDxJ/J6GMeCVqiCLieeSshvdNUecOBwJyHHpb4UBQBLlXz5/W5mVcr8DuTq76uYqDYO1yW2/eEp7Pru/U2Cqh1VHzjmjNge0ioLs5TYtcZw4bTBUQWkeQ/XrOU5i+du7bbtMIYkJXKL/z+c99nj3VDQHdpRp0VPebQDXG/aLaKbNUciVlLzROohKBUP6j1JTDa5xY70Vdbgssr2o48TX2WxIWXi61J6877bEpGUtF0fuuVv2houvUz2CdsurWudPglxKaTmcskzmt5BLOVWvLMpQXWMLL8ls+4zDtBWOj4om08QWQTR131OvO4I+LhqFmtSUw6iEzZ0Ci3ae0VWKBvjtPAbg2+MS1mXKoMlvsxmx2VflAauErh07SLkduV5VbF9kT/AgCoM14Z3sv8kCEhTmbtP1uH9GJLkYqZmPTx
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 22:11:08.3170
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cca4e61e-bb52-4d16-88f0-08df3d1c0646
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB038898

Add amd_acp7x_sdw_compute_bus_params() and
amd_acp7x_sdw_compute_params() for ACP7B/7E/7F managers.

The bus parameter computation performs dynamic frame-shape selection
across candidate clock frequencies, using sdw_check_column_allocation()
as a pre-check before accepting a clock rate to avoid configurations
that cannot satisfy all active stream bandwidth constraints.
ACP7x managers register amd_acp7x_sdw_compute_params as their
bus.compute_params callback.

Add and export sdw_check_column_allocation() in
generic_bandwidth_allocation.c, and declare it in bus.h, so this
ACP7x-specific code can call it across the module boundary.

Signed-off-by: Poojitha N <Poojitha.N@amd.com>
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_acp7x_manager.c         | 191 ++++++++++++++++++
 drivers/soundwire/amd_manager.h               |   1 +
 drivers/soundwire/amd_manager_common.c        |   1 +
 drivers/soundwire/bus.h                       |   4 +
 .../soundwire/generic_bandwidth_allocation.c  |  95 +++++++++
 5 files changed, 292 insertions(+)

diff --git a/drivers/soundwire/amd_acp7x_manager.c b/drivers/soundwire/amd_acp7x_manager.c
index 721d4e97371b..9605577a8d35 100644
--- a/drivers/soundwire/amd_acp7x_manager.c
+++ b/drivers/soundwire/amd_acp7x_manager.c
@@ -921,6 +921,197 @@ static int amd_acp7x_sdw_post_bank_switch(struct sdw_bus *bus)
 	return 0;
 }
 
+/*
+ * Reuses grouping, lane-selection, and transport helpers exported by
+ * the generic bandwidth allocator (see bus.h) for ACP7x bus params.
+ */
+
+/**
+ * amd_acp7x_sdw_compute_bus_params() - Compute bus parameters for AMD ACP7x
+ *
+ * @bus: SDW Bus instance
+ */
+static int amd_acp7x_sdw_compute_bus_params(struct sdw_bus *bus,
+					    struct sdw_stream_runtime *stream)
+{
+	struct sdw_master_prop *mstr_prop = &bus->prop;
+	struct sdw_slave_prop *slave_prop;
+	struct sdw_port_runtime *m_p_rt;
+	struct sdw_port_runtime *s_p_rt;
+	struct sdw_master_runtime *m_rt;
+	struct sdw_slave_runtime *s_rt;
+	unsigned int curr_dr_freq = 0;
+	unsigned int old_default_row, old_default_col;
+	unsigned int default_row = 0, default_col = 0;
+	int i, l, clk_values, ret;
+	bool is_gear = false;
+	int m_lane = 0;
+	u32 *clk_buf;
+
+	if (mstr_prop->num_clk_gears) {
+		clk_values = mstr_prop->num_clk_gears;
+		clk_buf = mstr_prop->clk_gears;
+		is_gear = true;
+	} else if (mstr_prop->num_clk_freq) {
+		clk_values = mstr_prop->num_clk_freq;
+		clk_buf = mstr_prop->clk_freq;
+	} else {
+		clk_values = 1;
+		clk_buf = NULL;
+	}
+	if (!is_clock_scaling_supported(bus))
+		clk_values = 1;
+
+	if (!mstr_prop->default_frame_rate ||
+	    (!mstr_prop->dynamic_frame &&
+	     (!mstr_prop->default_row || !mstr_prop->default_col)))
+		return -EINVAL;
+	old_default_row = mstr_prop->default_row;
+	old_default_col = mstr_prop->default_col;
+
+	for (i = 0; i < clk_values; i++) {
+		if (!clk_buf) {
+			curr_dr_freq = bus->params.max_dr_freq;
+		} else {
+			curr_dr_freq = is_gear ?
+				(bus->params.max_dr_freq / clk_buf[i]) :
+				clk_buf[i] * SDW_DOUBLE_RATE_FACTOR;
+		}
+
+		if (mstr_prop->dynamic_frame) {
+			switch (curr_dr_freq) {
+			case 24000000:
+				default_row = 50;
+				default_col = 10;
+				break;
+			case 12000000:
+				default_row = 125;
+				default_col = 2;
+				break;
+			case 24576000:
+				default_row = 64;
+				default_col = 8;
+				break;
+			case 12288000:
+				default_row = 64;
+				default_col = 4;
+				break;
+			case 6144000:
+				default_row = 64;
+				default_col = 2;
+				break;
+			default:
+				dev_dbg(bus->dev, "unsupported clock frequency %u, skipping\n",
+					curr_dr_freq);
+				continue;
+			}
+		} else {
+			/* Static frame row and column are provided as a pair by ACPI. */
+			default_row = mstr_prop->default_row;
+			default_col = mstr_prop->default_col;
+		}
+		/*
+		 * The row and column pair is complete here: dynamic values are
+		 * selected by frequency above, while static values come from ACPI.
+		 */
+
+		dev_dbg(bus->dev, "Trying clock frequency %d bandwidth:%d default_col:%d\n",
+			curr_dr_freq, bus->params.bandwidth, default_col);
+
+		if (curr_dr_freq * (default_col - 1) >=
+		    bus->params.bandwidth * default_col) {
+			ret = sdw_check_column_allocation(bus, stream, curr_dr_freq,
+							  default_col);
+			if (ret < 0)
+				return ret;
+			if (ret)
+				break;
+			dev_dbg(bus->dev, "freq %d: column allocation failed\n",
+				curr_dr_freq);
+		}
+		/* Try multi-lane when single-lane at this frequency is insufficient. */
+
+		list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
+			/*
+			 * Get the first s_rt that will be used to find the available lane that
+			 * can be used. No need to check all Peripherals because we can't use
+			 * multi-lane if we can't find any available lane for the first Peripheral.
+			 */
+			if (list_empty(&m_rt->slave_rt_list))
+				continue;
+
+			s_rt = list_first_entry(&m_rt->slave_rt_list,
+						struct sdw_slave_runtime, m_rt_node);
+			m_lane = get_manager_lane(bus, m_rt, s_rt, curr_dr_freq);
+			if (m_lane > 0)
+				goto out;
+		}
+	}
+	if (i == clk_values) {
+		dev_err(bus->dev, "%s: could not find clock value for bandwidth %d\n",
+			__func__, bus->params.bandwidth);
+		return -EINVAL;
+	}
+out:
+	if (m_lane > 0) {
+		list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
+			slave_prop = &s_rt->slave->prop;
+			for (l = 1; l < SDW_MAX_LANES; l++) {
+				if (slave_prop->lane_maps[l] == m_lane) {
+					list_for_each_entry(s_p_rt, &s_rt->port_list, port_node) {
+						s_p_rt->lane = l;
+					}
+					break;
+				}
+			}
+		}
+		list_for_each_entry(m_p_rt, &m_rt->port_list, port_node)
+			m_p_rt->lane = m_lane;
+	}
+
+	mstr_prop->default_row = default_row;
+	mstr_prop->default_col = default_col;
+	ret = sdw_select_row_col(bus, curr_dr_freq);
+	if (ret < 0) {
+		dev_err(bus->dev, "%s: could not find frame configuration for bus dr_freq %d\n",
+			__func__, curr_dr_freq);
+		mstr_prop->default_row = old_default_row;
+		mstr_prop->default_col = old_default_col;
+		return -EINVAL;
+	}
+	bus->params.curr_dr_freq = curr_dr_freq;
+	return 0;
+}
+
+/**
+ * amd_acp7x_sdw_compute_params() - Compute bus, transport and port parameters
+ * for AMD ACP7x
+ *
+ * @bus: SDW Bus instance
+ * @stream: Soundwire stream
+ */
+int amd_acp7x_sdw_compute_params(struct sdw_bus *bus, struct sdw_stream_runtime *stream)
+{
+	int ret;
+
+	ret = amd_acp7x_sdw_compute_bus_params(bus, stream);
+	if (ret < 0)
+		return ret;
+
+	if (stream->type == SDW_STREAM_BPT) {
+		sdw_compute_dp0_port_params(bus);
+		return 0;
+	}
+
+	ret = sdw_compute_port_params(bus, stream);
+	if (ret < 0) {
+		dev_err(bus->dev, "Compute transport params failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 const struct sdw_master_port_ops amd_acp7x_sdw_port_ops = {
 	.dpn_set_port_params = amd_acp7x_sdw_port_params,
 	.dpn_set_port_transport_params = amd_acp7x_sdw_transport_params,
diff --git a/drivers/soundwire/amd_manager.h b/drivers/soundwire/amd_manager.h
index f0d3c5684744..c3a7db663772 100644
--- a/drivers/soundwire/amd_manager.h
+++ b/drivers/soundwire/amd_manager.h
@@ -510,6 +510,7 @@ void amd_acp7x_sdw_update_slave_status_work(struct amd_sdw_manager *amd_manager)
 int amd_sdw_hw_init_ops_acp7x(struct amd_sdw_manager *amd_manager);
 extern const struct sdw_master_ops amd_acp7x_sdw_ops;
 extern const struct sdw_master_port_ops amd_acp7x_sdw_port_ops;
+int amd_acp7x_sdw_compute_params(struct sdw_bus *bus, struct sdw_stream_runtime *stream);
 
 #define AMD_SDW_HW_OPS(amd_manager, cb)	((amd_manager)->hw_ops->cb)
 
diff --git a/drivers/soundwire/amd_manager_common.c b/drivers/soundwire/amd_manager_common.c
index 03c92b6991f2..0920775a8fe1 100644
--- a/drivers/soundwire/amd_manager_common.c
+++ b/drivers/soundwire/amd_manager_common.c
@@ -862,6 +862,7 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
 		/* mmio already set in the port-count switch above */
 		amd_manager->bus.ops = &amd_acp7x_sdw_ops;
 		amd_manager->bus.port_ops = &amd_acp7x_sdw_port_ops;
+		amd_manager->bus.compute_params = &amd_acp7x_sdw_compute_params;
 		break;
 	default:
 		dev_err(dev, "unsupported ACP revision: 0x%x\n", amd_manager->acp_rev);
diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
index 0c5c343b2c1c..bcc7aa7e3a0e 100644
--- a/drivers/soundwire/bus.h
+++ b/drivers/soundwire/bus.h
@@ -245,6 +245,10 @@ void sdw_compute_dp0_port_params(struct sdw_bus *bus);
 int sdw_compute_port_params(struct sdw_bus *bus, struct sdw_stream_runtime *stream);
 int sdw_select_row_col(struct sdw_bus *bus, int clk_freq);
 bool is_clock_scaling_supported(struct sdw_bus *bus);
+int sdw_check_column_allocation(struct sdw_bus *bus,
+				struct sdw_stream_runtime *stream,
+				unsigned int curr_dr_freq,
+				int sel_col);
 int get_manager_lane(struct sdw_bus *bus, struct sdw_master_runtime *m_rt,
 		     struct sdw_slave_runtime *s_rt, unsigned int curr_dr_freq);
 
diff --git a/drivers/soundwire/generic_bandwidth_allocation.c b/drivers/soundwire/generic_bandwidth_allocation.c
index cf2d2275b6aa..44e4c0f78d9c 100644
--- a/drivers/soundwire/generic_bandwidth_allocation.c
+++ b/drivers/soundwire/generic_bandwidth_allocation.c
@@ -473,6 +473,101 @@ bool is_clock_scaling_supported(struct sdw_bus *bus)
 }
 EXPORT_SYMBOL(is_clock_scaling_supported);
 
+/**
+ * sdw_check_column_allocation - Pre-check if column allocation will succeed
+ * @bus: SDW Bus instance
+ * @stream: SoundWire stream being prepared
+ * @curr_dr_freq: Current double-rate frequency to check
+ * @sel_col: Number of columns
+ *
+ * Return: 1 if allocation succeeds, 0 if it does not fit, or a negative error.
+ */
+int sdw_check_column_allocation(struct sdw_bus *bus,
+				struct sdw_stream_runtime *stream,
+				unsigned int curr_dr_freq,
+				int sel_col)
+{
+	struct sdw_master_runtime *m_rt;
+	struct sdw_port_runtime *p_rt;
+	struct sdw_group group = {};
+	unsigned int rate, bps, ch;
+	int *payload_bw = NULL;
+	int *full_bw = NULL;
+	int i, l, ret;
+	int result = 1;
+
+	ret = sdw_get_group_count(bus, &group);
+	if (ret < 0)
+		return ret;
+	if (!group.count)
+		goto out;
+
+	payload_bw = kcalloc(group.count, sizeof(int), GFP_KERNEL);
+	full_bw = kcalloc(group.count, sizeof(int), GFP_KERNEL);
+	if (!payload_bw || !full_bw) {
+		result = -ENOMEM;
+		goto out;
+	}
+
+	for (i = 0; i < group.count; i++)
+		full_bw[i] = curr_dr_freq / group.rates[i];
+
+	list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
+		if (m_rt->stream == stream) {
+			if (stream->state != SDW_STREAM_CONFIGURED)
+				continue;
+		} else {
+			if (m_rt->stream->state != SDW_STREAM_ENABLED &&
+			    m_rt->stream->state != SDW_STREAM_PREPARED &&
+			    m_rt->stream->state != SDW_STREAM_DISABLED)
+				continue;
+		}
+
+		list_for_each_entry(p_rt, &m_rt->port_list, port_node) {
+			rate = m_rt->stream->params.rate;
+			bps = m_rt->stream->params.bps;
+			ch = hweight32(p_rt->ch_mask);
+
+			for (i = 0; i < group.count; i++) {
+				if (rate == group.rates[i] && p_rt->lane == group.lanes[i])
+					payload_bw[i] += bps * ch;
+			}
+		}
+	}
+
+	for (l = 0; l < SDW_MAX_LANES; l++) {
+		int available_columns = l ? sel_col : sel_col - 1;
+		int column_needed = 0;
+
+		for (i = 0; i < group.count; i++) {
+			int hwidth;
+
+			if (group.lanes[i] != l || !payload_bw[i])
+				continue;
+
+			/* Include the column consumed by the skipped block offset. */
+			hwidth = sdw_compute_hwidth(sel_col, payload_bw[i],
+						    full_bw[i]);
+			column_needed += hwidth;
+		}
+
+		if (column_needed > available_columns) {
+			dev_dbg(bus->dev, "Lane %d column check failed: required=%d available=%d\n",
+				l, column_needed, available_columns);
+			result = 0;
+			break;
+		}
+	}
+
+out:
+	kfree(payload_bw);
+	kfree(full_bw);
+	kfree(group.rates);
+	kfree(group.lanes);
+	return result;
+}
+EXPORT_SYMBOL(sdw_check_column_allocation);
+
 /**
  * is_lane_connected_to_all_peripherals: Check if the given manager lane connects to all peripherals
  * So that all peripherals can use the manager lane.
-- 
2.53.0

