Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011052.outbound.protection.outlook.com [40.93.194.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7A74BB289;
	Thu, 10 Sep 2026 16:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789057121; cv=fail; b=mMlBVOIB5LLt0tfRlLayI7ig+GCqyQWVxQoNbnINfqFVvkOcx16f6EdGlIMyAcjWcA5OSTYfxL2LAE3RIgXN2P2UGcgc8tG5ME6le2TFbED9eBq4K0Dh1RgOl0zxJceMwbObYy0AivWNOlcpMUhNa/Hatf5nHH2Su3Lr+ute8Ec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789057121; c=relaxed/simple;
	bh=oXGa7F+q/T0wGtgsOuIscshiD+QnNdWsljF3HXs69e8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V1mV6FytNuNTnhsSBt51dhUm/g+fgXxhr2vXcojpK0f6lNNi4lOs9UWIQ5PmStlf0EfqtxxUCsPTCcBvIkmyUFX9uD087u8lkxrdZjr6NXNXoEDDuE2SSfsQEvGTEQDqCNWLDgL05Il3uLvSoTesfQ9EavnRzLZDl1DtblRxZPs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tqf+xOnB; arc=fail smtp.client-ip=40.93.194.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tqf+xOnB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b0eSeDrHmaG4sxgzXrW57DEE84gvvUWukKAobK78tfHqBxQhoOJvVxirhMoJpugk8ifa+GhLXX6oFHoUyeX1aAzFakRZfSNGTlpQK3k/yLs6c5uw+kZupEsL3NazyzzkPnb+IlhB5/j78TZQ7tGyR3wOrlQivT8dYADPbuVVB9e0Nu92PrFTG8pYdkQjbjSvrNi/E48dBc1brLqOXIxzxRRTPxX1w1l0cz2d1bNSwsS7a6xTiGBrPNk8DGNsE9ldFu59I1Y89AxK8Yrnln/br8r0KgoyE9gvtGA8W2au83onXqEItU+lghIywOojo7L22qys/h1lSs0nSr9F5zYpoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YV27tm8r7e315xBXbVL96z8xmEFSZtt8F2BwHxwZlT0=;
 b=y1+/vwQTWoPVV6eHfQnZdzr8zdx7O7EkjFCCeVqHZZplm1g7MqlXyRCzddEsL04Rsn8/2EfHt34ofdJ6QFIj8LeQB2KPLSnD7oElCpcPH0RGS0DTqrqdPRZsjTkag2hBhCSNJxVJkkwDxq7Y3/OKa10iaaOlg0f+al2T2ImpPpsgqEDKwUqM4QWm9IyM3pi6wqYtGSnSJiJg58MqbfAY8Yo3dQPlg6/sjldup3TEEWiLRdf/FONF3upws3GMg2Xt03w5+UolRt9qw2XKM34V7xlTS5QMV7ae2SVW7W29CFwlPo+DEMKkd4LUUuLloCmHe2/CnsLHHVcrP8YlipN6nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YV27tm8r7e315xBXbVL96z8xmEFSZtt8F2BwHxwZlT0=;
 b=tqf+xOnBbWC93idlxhEWqOqXTh6MP0qWQA72FTkHvimb7vLSS/53vCsnzGHr5LFvaeNJYXAjqU2MTUj6WpXcQbMmm/XpnsnsERA+jd/kZgqXgeiJwBKjBSJKsdn64VjNBrTg8OmA8jUsCPPSR1HTJjeC0U5HKr8zDYLSpO8K9RM=
Received: from BY5PR03CA0010.namprd03.prod.outlook.com (2603:10b6:a03:1e0::20)
 by PH7PR12MB7114.namprd12.prod.outlook.com (2603:10b6:510:1ed::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 16:18:36 +0000
Received: from SJ1PEPF00002311.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::79) by BY5PR03CA0010.outlook.office365.com
 (2603:10b6:a03:1e0::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Thu,
 10 Sep 2026 16:18:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002311.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 16:18:36 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 11:18:34 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46
 via Frontend Transport; Thu, 10 Sep 2026 11:18:30 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <yung-chuan.liao@linux.intel.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>,
	<ckeepax@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 1/4] ASoC: amd: acp: bounds-check SoundWire link ID in machine drivers
Date: Thu, 10 Sep 2026 21:46:46 +0530
Message-ID: <20260910161728.1452808-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260910161728.1452808-1-Vijendar.Mukunda@amd.com>
References: <20260910161728.1452808-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002311:EE_|PH7PR12MB7114:EE_
X-MS-Office365-Filtering-Correlation-Id: 39b3b798-2c75-44ba-f1da-08df0f572aa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|23010399003|1800799024|10067099003|22082099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	LFjo75MfmDQ42edpZbFGiHncXUrlqkfCXShbNkpRkgRvflxh/QpmlhVg+FmRB9PMmid2wwtlQ+axcEmpcy//lekPcAbbuTekYjcYZ9zDsCsRaecfyTdmzBUcxX04MP2NnftcKXPgnCprcwUVF3o63p8sVsGjA+dt9vCL29YoTTDfZMOHF2JtfG2qErOwidJGqIx/NTFiFZVe3IIzr66W5Ortkn7ZfM9IJoYsQ1Q/LOnznycNNnEsAqDoWVx1IsGUOHs5hk7DyRZsTNrSJ4FNwvzfPzaXX7cNq6kLfey2w0RF4Fkx47heOmu1WNdJTsNGtW85G7t+qXdy8itjsuP1UFbx92RWuW9UGuOViCGRBDAH5HVXsYkuv6u2TiQmPBxVee5NKqydA931EeJWsx5nKI6mX6PGKdhWrD8ZTXWEeJvw9UryodOeudOPshNoSTPy2aLHmoyrHWhOC/qMPG1eXCjda0ROS3hkGP9UFrr7+TSr8wBe7wjMEyBSnWu27Dzx1fBmq0X+5ObYQrrD++197P2EY1j4u3MbodV+2aqoBHZqf5KNKOG5tAvxeMB9yipvlBnQnNbEF/JIBcnglghDyAXG2A/A0xzonYQCfiXE6BBh7yEUV5yU75adguO2bGGcS2YDOMb94xqfm5fkEh/QNdVk8jxMceMEUpMcCOEPCEKKN4/eviYh3vJ6OvOPzb1ujLBBkCypVfoOHQCKRNMZ/A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(23010399003)(1800799024)(10067099003)(22082099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	491w2W0w7rN14GLLvLJZELBo3IdflDwkumLv27ZcOvKBL2m/Du+VTalanosiIX4e0inGaiqXLb+GbOvDywK7etOILKh6dwy1WF272egMCRjAElSpoBB0yQz73KsLwSOapYtIFBuVrCSzRcg+TVgDakgUUT16IQEuPIut3mFCYHvkFsz9pvzUC85QnHjPBOUwqR74dM8uS/zK2PzDHWzWO1MFWwc7SoBf9woC3+ujqcUHZqSeOUPhZvwJNj6+duKikaRJb+VFPcvGFAbknTKLQjHG3VuJ2HyQWdEGo000grVJ3hjHnapcUh6c7Qe6T/OXGL1buM7T7m6K10hYQKB2fxO7w90mpypxvt+M/3ctVnfy53ki5j2hXrOYwGTH+2wpq9IO7/yc5HAB25eIKmL+jyV99Kvh2K5PkHsbGvskaoVRzKLAXRlE1HxFqKCX8jhu
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 16:18:36.0256
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39b3b798-2c75-44ba-f1da-08df0f572aa5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002311.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7114

Add a bounds check in create_sdw_dailink() to validate that the
SoundWire link ID derived from link_mask does not exceed the maximum
supported by the platform. If the link ID is out of range or link_mask
is zero, log an error and return -EINVAL to prevent accessing invalid
CPU pin ID tables.

Applied to both acp-sdw-sof-mach.c and acp-sdw-legacy-mach.c.

Fixes: 6d8348ddc56e ("ASoC: amd: acp: refactor SoundWire machine driver code")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-sdw-legacy-mach.c | 10 ++++++++++
 sound/soc/amd/acp/acp-sdw-sof-mach.c    |  9 +++++++++
 2 files changed, 19 insertions(+)

diff --git a/sound/soc/amd/acp/acp-sdw-legacy-mach.c b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
index 6eac42bac855..2ea226a195c3 100644
--- a/sound/soc/amd/acp/acp-sdw-legacy-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
@@ -205,6 +205,16 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 			return -EINVAL;
 		}
 
+		if (!soc_end->link_mask) {
+			dev_err(dev, "invalid zero link_mask\n");
+			return -EINVAL;
+		}
+		if ((ffs(soc_end->link_mask) - 1) >= amd_ctx->max_sdw_links) {
+			dev_err(dev, "link_id %d exceeds max_sdw_links %d\n",
+				ffs(soc_end->link_mask) - 1, amd_ctx->max_sdw_links);
+			return -EINVAL;
+		}
+
 		switch (amd_ctx->acp_rev) {
 		case ACP63_PCI_REV:
 			ret = get_acp63_cpu_pin_id(ffs(soc_end->link_mask - 1),
diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
index a9cd1f335167..6c74e67b134f 100644
--- a/sound/soc/amd/acp/acp-sdw-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c
@@ -121,6 +121,15 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 			return -EINVAL;
 		}
 
+		if (!sof_end->link_mask) {
+			dev_err(dev, "invalid zero link_mask\n");
+			return -EINVAL;
+		}
+		if ((ffs(sof_end->link_mask) - 1) >= amd_ctx->max_sdw_links) {
+			dev_err(dev, "link_id %d exceeds max_sdw_links %d\n",
+				ffs(sof_end->link_mask) - 1, amd_ctx->max_sdw_links);
+			return -EINVAL;
+		}
 		switch (amd_ctx->acp_rev) {
 		case ACP63_PCI_REV:
 			ret = get_acp63_cpu_pin_id(ffs(sof_end->link_mask - 1),
-- 
2.48.1

