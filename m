Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013003.outbound.protection.outlook.com [40.93.196.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85339489882;
	Thu, 10 Sep 2026 13:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789046673; cv=fail; b=e0UKCkgXdb0lHUHATLNJKD71w2/eKdXEvIj1gbBEmxWUH9t/RQ9JVeBbpW4h8XmwWpjFrpn1hmOCPfPIUt4+ynwobMswmIEI60NxYUqiN/4obT6SHGkJhEoqxYfu6CXk3n//uxbHA6KplyxswGTCwnLuQ6PzA0WLiZVrfaZEpEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789046673; c=relaxed/simple;
	bh=SP+OXoTB2Ao+b/JiCtFlzmOGCxFGl4jelKiyjgW4d58=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rZYwvsrZh7e0+NAc3V594aeOQg5LD80ANFpvvZOUe8TarynHD6OhV0BgF6+DUrONJKuL4Ftc4/DP0EMC1I90ZXdwE5NSzVZLh6FxNpRsSDdn2erLgjlCYpZqg9EqzDxG3rdivNXi4pyqrrsT4CJRg/sl/jOB84eNvlMa/YdwmZw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3+DuPzSW; arc=fail smtp.client-ip=40.93.196.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3+DuPzSW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z9Nh37/mN+fv0Li7Uz8dQhzgpLaOTbBa29idmsaqv38D5mp54KL+dR+WT3BHHLzeKGwuAg3MWDWzz9pHeIat3rPSBh/mwtsMDPz3AkrTom3FUMgziJbPgQwZtbksBrmfaPtxRf6XXsb38UWG02+bhRxRPRLH7yGAH0orIFV8Adksm/eSpDuWMl89Nh8lFPxwR0ZUArJ+swS+w0gPeJCa72GQpKnLwCk+pV4RSNoYl9FqYzAVJZCYVnJPlTmNKXqz1wVeoYuL0S6dPBT2FDbA4rlV4t8Ef1RjfFul3pXgyNwome7RMhSmKsBgrzTD+6i+17O/2NxqiWHtL2QPwz0+XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aOQA+KmZcO/V+zZ2h46X1gWgAstcUFOvX/vHBWPKlGU=;
 b=RRdYnHCBOYY5xGm6s4rZKj+e4/fP+0SuuUNAC8LJWH+c01jJYRJBJM3m1TsmBHUSm/9i9/QHspUXr2kIUtexPrS7cqTZTqsR4Wi9R0ma0RVdV6tFJuCvxUfnRKdGPlQXSfYNPU6eKlur+vVGsHtHeV12npDRdE/ZGI8oB7/GDt+46+SnI0J+sJE44XGTTy8Y8RCt0yhCRNa5/LdJ++SZwaNRnfFwXW+T+ScApYV/xlNXg7jO2Cp1u7LTpBm9YbKjV1lHGvwAbJytxIxEUg15hSa9hYHMtqaERfJaTgkL1He3e26RtmNL4BrkmbZbiHAb9J2pKy77/EJjDAf/8J9vPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aOQA+KmZcO/V+zZ2h46X1gWgAstcUFOvX/vHBWPKlGU=;
 b=3+DuPzSWmNx9gW2x4F3TsG/YyAiVbHBFHfnpWbGTzzszQpWbbEFQca4XYacec0X6+Q566qHjA3sG/ZGfOmIP3C0b1RcNCP5UcXQx1bMnZ73smqLmZzUYyeQYRUccgnJPDcQzXj4eD0DlmoSGrRvz1hsIAuY/jOgZPqInrX/aO94=
Received: from PH7P220CA0088.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32c::32)
 by IA0PR12MB7531.namprd12.prod.outlook.com (2603:10b6:208:43f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 13:24:25 +0000
Received: from BY1PEPF000264B4.namprd02.prod.outlook.com
 (2603:10b6:510:32c:cafe::3e) by PH7P220CA0088.outlook.office365.com
 (2603:10b6:510:32c::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.8 via Frontend Transport; Thu, 10
 Sep 2026 13:24:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BY1PEPF000264B4.mail.protection.outlook.com (10.167.242.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 13:24:24 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 08:24:23 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 08:24:23 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46
 via Frontend Transport; Thu, 10 Sep 2026 08:24:18 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>,
	<yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<perex@perex.cz>, <tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Syed.SabaKareem@amd.com>, <Mario.Limonciello@amd.com>,
	<Richard.Gong@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <sound-open-firmware@alsa-project.org>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 05/11] ASoC: SOF: amd: update SoundWire specific acp descriptor fields for ACP7.B/7.F
Date: Thu, 10 Sep 2026 18:50:05 +0530
Message-ID: <20260910132251.1171943-6-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260910132251.1171943-1-Vijendar.Mukunda@amd.com>
References: <20260910132251.1171943-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF000264B4:EE_|IA0PR12MB7531:EE_
X-MS-Office365-Filtering-Correlation-Id: a7697747-3e04-487a-9853-08df0f3ed4c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|1800799024|82310400026|23010399003|3023799007|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	jbj8utpc94uGuSEdm0ckz8qc3tShqNJEMSy2x3uX1/GurxiPw/tf6sJIUAJQpzaJyBn1MYVvWOe/dn5IEli6F6sEqTorVPs2PA23VwUSl/JZPxt+N7WlAX7kRHHiTOzgkI7yPT+1GmkdoaMuZCuivN1z4ekuUpTH4yY0tS0HsYtLwF5csZQOx61krh4kVS1WPp8f4CyHls1d1zItmMu3ixJIzGRY0e0dTaU7Inl6FwJKVDVXVRjzdeSrtNP07UBBVwvIqv54V3Z29GARuICnFbryx8Jh7104/g6e+MG14m3uPqNL++RoNqczjoqTVWhNPhr+UPSBWeBtMvGdYDvgeGjSVrnDACLOahx9z53QN6p6vbJpXkNh1HkT7gvXtQD6dyYMRqkqazKqYfTA9G1JzTu3UckCaYhiQ4Fyg6nhbA1aFmkZa2CRPicHUHohALpeeZq24aHqaUid/XMR1CpoOcqpNsp7F1Cy4Ku8EboM4IF5cyltPAI/DDpDi+B/+jO5OATCJcfdNSwzYOWgXc+0xRB79L4338cTKGpZoSkI2FMQvDXUXuDY/zVc6du1dRivlJXliOEFeIh6TDASAy0zVZW6nJMycITGhk7+CaMJVcXVlh4c+OGbOLwtR91PMUh7AS/yqT9k5kjwe+8wlFBngXc8v36IfjaolTuRcMXjRhdURoZbABZyL8C7ryu1SOrvL184gWxAC1z2ffS9oBLZzw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(1800799024)(82310400026)(23010399003)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jOEwypwqtFsCYd4O8Mc6Q97HtlWP7J8WwVSBf/ZsIZGPgMSeP1rH5StXsWJ0jlDCo+Kt1R2T8Oym71hWgC1Sw4fhD9fFWYSEtoU5h8xATS65q1DhnhsdvhCmnZPKo27ozG8auEAq6/NotQisqklaeGQroMBquHGwkQBI5ama7wLypztXvPvtkAxe6A4GwNSxEskBE9aS0tduXBZV3YNA0FGICfyHcr11QoeJVOwZey3evhBBi2/vGO7d9gM+cOwlxteZtMTkbHVug/q47jUyi3tSExPCCV5UQwm0WL1M4jQhlWcqsfcXzfAqHs/VMFlu2pWq3obMxIav2+wCwQcm80bPmuE7yjjOwsDIIpMuYPQeI4dN8BJfzlqlXPxtDtjdrMcyz0frHvikVanCQeSK3mF8GScvMleG6aCIOvsE3AICWRd3lDolwmOXbhkcTcm5
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 13:24:24.0797
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7697747-3e04-487a-9853-08df0f3ed4c6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF000264B4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7531

Populate the SoundWire descriptor fields in acp7x_chip_info so the SOF
core can locate and enumerate the four SoundWire managers on ACP7.B/7.F
platforms.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/sof/amd/acp.h       | 3 +++
 sound/soc/sof/amd/pci-acp7x.c | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
index 2326b9d2e4c6..47e475de8b4d 100644
--- a/sound/soc/sof/amd/acp.h
+++ b/sound/soc/sof/amd/acp.h
@@ -128,6 +128,9 @@
 /* ACPI _DSD acp-audio-ep-port values for PDM controller selection */
 #define ACP_DEV_PORT_PDM			4
 #define ACP_DEV_PORT_PDM2			5
+#define SDW_ACPI_ADDR_ACP7X			SDW_ACPI_ADDR_ACP63
+#define ACP7X_SDW_MAX_MANAGER_COUNT		4
+
 /* ACPI child device address for the ACP7x PDM/DMIC device */
 #define ACP7X_DMIC_ADDR				2
 /* ACP7X PDM controller selection values for acp_dev_data.pdm_sel; 0 = not set */
diff --git a/sound/soc/sof/amd/pci-acp7x.c b/sound/soc/sof/amd/pci-acp7x.c
index 532e15313795..0594c1f3deb6 100644
--- a/sound/soc/sof/amd/pci-acp7x.c
+++ b/sound/soc/sof/amd/pci-acp7x.c
@@ -40,6 +40,8 @@ static const struct sof_amd_acp_desc acp7x_chip_info = {
 	.fusion_dsp_offset = ACP7X_DSP_FUSION_RUNSTALL,
 	.probe_reg_offset = ACP7X_FUTURE_REG_ACLK_0,
 	.reg_start_addr	= ACP7X_REG_START,
+	.sdw_max_link_count = ACP7X_SDW_MAX_MANAGER_COUNT,
+	.sdw_acpi_dev_addr = SDW_ACPI_ADDR_ACP7X,
 	.reg_end_addr	= ACP7X_REG_END,
 };
 
-- 
2.48.1

