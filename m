Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012047.outbound.protection.outlook.com [52.101.43.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E437B37AA6D;
	Thu, 10 Sep 2026 13:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789046677; cv=fail; b=baJCCqJBoORJVPSwORBK1ibC3bolK0erOBpoPKVdfDtAPTkOSnlINJMqyOZketZvkFvxi6YJvGP+RZnSqkFcZJV7sx6CWbZj9ey/h95RUpxnnxwQSzEOmHtp5BQkJlRJV3Vu3951cc0/PcpBlGXIO90BNxFIfmdGt/rAjhzSOxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789046677; c=relaxed/simple;
	bh=t9nxrc8CXPp/87L/6SXnEbchmJI4NMEf3lr6/aXfebA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nc2UKzWjs/M9W//URQhz81QXthfhapKJbaVB6sx3lw/IbiPQHGrUEDygs8Ui/NFGYKjVBaU14Gr8vIu78ym4a2li/kWwQSwSQPNa/h6mkErlxL+vRYlYnw0iTbm/m0RWJzRbI2WLGIOfMK0n/yBoLmvI1Fy1nS46gx+Yth+Nx5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=SwdQhLt0; arc=fail smtp.client-ip=52.101.43.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="SwdQhLt0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rlegryd2waCKC95hkIfpyv5KtGJm7BRJBAqWVQfX6e1gwdnXCSWX/W6MblYofEAjyIYQR5TgXu7UEq5ZJh53jYHIfIe6T3VwSKO3BJva/e+0nbMe+zBbAJeQ/IJW6kkt3Ao34WlJr9XwC3IuyH9I/yACJwepqVVCm9x27rIMQI63zVG1DjwKDL2DoI/9SYfkfXQB2Bw4F69goJFtEU+17zhllvMS0tdBdFTXAYQow/mIQ0kzeDPa0VG5GBo6jwtAaZcMHchrH3xCfjPWC7jr4u6sdrGiOXbVFU8DmwuH7t2LCilxMktL8yqh9IpijhLROVR/bTiORuf+NwJvFsDh2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7CfYy4C8dP/mBg7vzEoE/Y742fPvu54oWx8zNceHPpU=;
 b=XYu5CrPJTP6sxZJft6+CY43Znw47vYxUVz30dJGiPhRN/V2uTO+BjTDizoQdn9sWNR8K1wyX7h5mP7uKUGaXFOdi9dgyF9s4ZK8gGxmJqqINImmM2LfR7vL9jBo39IEGFlEv1W55yuXt8JZHfvcEdQkj6/qGIhGg2ck15+EbeNmfBttKnE8vzf3s3T1D3jrjkj0v6iJaoeYvusBhuZfRawZ0P+063y8rQceFyULBqZJFQhETJL3JpJkE4Uym7Uz1c3AhRtSrNkMkS2wzei3kHxduW+j+04A1ea/KHPwrH64EgEBOq1CwfPAR+gu8hJwlpMspPtDtmzN+XB4HaW7QOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7CfYy4C8dP/mBg7vzEoE/Y742fPvu54oWx8zNceHPpU=;
 b=SwdQhLt0AmO0E9wNyF7k//NoqC57Yc6sdV6LSKVjsq+HymbnmH/VQ9j7O7bbXgbWvPHMcLNmBsUOy8f3gCcU198ge7lczt/yuhS3q8pKW7mcQan6kBhwV+gUjZBVhSmOULoTiPqzjJl9kzYAqUk9LZQSy2YcVjBp6QPmUCZL8oo=
Received: from PH8P220CA0020.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:345::12)
 by IA0PR12MB8326.namprd12.prod.outlook.com (2603:10b6:208:40d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 13:24:31 +0000
Received: from BY1PEPF000264B2.namprd02.prod.outlook.com
 (2603:10b6:510:345:cafe::73) by PH8P220CA0020.outlook.office365.com
 (2603:10b6:510:345::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.7 via Frontend Transport; Thu, 10
 Sep 2026 13:24:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BY1PEPF000264B2.mail.protection.outlook.com (10.167.242.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 13:24:30 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 08:24:27 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46
 via Frontend Transport; Thu, 10 Sep 2026 08:24:23 -0500
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
Subject: [PATCH 06/11] ASoC: SOF: amd: enable SoundWire build for ACP7.B/7.F
Date: Thu, 10 Sep 2026 18:50:06 +0530
Message-ID: <20260910132251.1171943-7-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF000264B2:EE_|IA0PR12MB8326:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cbe9571-e8ca-480d-e966-08df0f3ed8cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|23010399003|1800799024|36860700016|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Mh7SLZwo7b1rzk7rsxOLSxwBHyheAKWZOg3p8dFGlp704wmoPSbgYklJc2Z7K1o/qYMKe8Ps1U2JRNcmbL/x1debN9SJYj6Uz1rGu7YQGXV3v7vD6cRHPrWMszjnBQEFDsJUGNikfJYblI7I2tkCOUBqZj3/nux+OToIWCGw2e9c+Xq7Fft8XcTcXnikq3waCLww7JKyVT5tJ5sy+wTpHAAG9i94V7xVHxq7jKwuRaThRL/eMr1mA+viReAA0437Xaa2yRiwngxIfRGH6yWjAQDc1XxBy39X3Xp8gHWztr56Ls/uW3Lwb4DKIe7rvQql5Y2ms8SDCjeT3GmqJVoOQwpzjEROgg0gNJ3C72C7dLmZo8aVJI/UlvhctVj4qfDQnwquhMBZ7KisK/QcrbXoX372sSnD1hJGkdmY5bEwzlAMq0x+tmm+xv0v0Vu2VKUNDaHECzE9W4rIhsiWqoHRaz/puN7EKEBlSXTiHcMiKzUcDStfBYFrQfvmB9y05F/FuOvMrdbRpknfstXkNBP8nQHEAbMvEG9oS4FDG4WLzmFVA01onO4UQTej65uTQbXLLZM8maqVc/ZtuPY/Y6EQOU4ykK2/x0ujDUq0tVqSd8EaDvI4/tyozG4AssmPT2+MCVj6bQYcS6uJog/Mb2GL7xBYLgXBiFleA9eSIo5OnfgSBMcAgJC6D0ttF5DCnpRt/bFrRKKwsXzz0ZR475TeVA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(23010399003)(1800799024)(36860700016)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9fWCnvGvqlRYU2SNV9gVF+UImnHspTiYAB+n6F9fnWUp/er84nNv+FVLhE7XPkTrjrn2WK5C7vqiMEys491Kj+oLucY5dnYPXcWi8RPDQmHJ7JEZxxHf0o/+MTp6CtpG974a8fYKpr2e6uUheRRlRk+mlI1UCoqZk7f7looJU6mbdOuB9sr0H8wsZ7ZJOK0wBqEvwJBTgAWkYrhXquWjs+D8ENii/maUWK9IdsWkT/WrZNQL9/ujR5t7OYdHXVtwLbuZZgx50K/MaNexKPYewOrtDs4jdt9tP+kTR4fvA5/4F+wIz/Ji2IZWN9M4Ve50lmq+1vbVwdSI8fYAO6p7EcuYHVd3gS5yloBW+nWDr6azg0BL23LWASGlWaGGkZuPjqgWTxi9uqw0Ibni1IIUFWKHwXR9h1IaurFH9sAD6+mapX0pbwg6Ia5hGbDP6GGM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 13:24:30.8269
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cbe9571-e8ca-480d-e966-08df0f3ed8cb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF000264B2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8326

Select SND_SOC_SOF_AMD_SOUNDWIRE_LINK_BASELINE in Kconfig for
SND_SOC_SOF_AMD_ACP7X so that the SoundWire stack is built
when ACP7.B/7.F SOF support is enabled.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/sof/amd/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/amd/Kconfig b/sound/soc/sof/amd/Kconfig
index 903e7ec3b3ba..d64f682cfbea 100644
--- a/sound/soc/sof/amd/Kconfig
+++ b/sound/soc/sof/amd/Kconfig
@@ -109,6 +109,7 @@ config SND_SOC_SOF_AMD_ACP7X
 	depends on SND_SOC_SOF_PCI
 	depends on AMD_NODE
 	select SND_SOC_SOF_AMD_COMMON
+	select SND_SOC_SOF_AMD_SOUNDWIRE_LINK_BASELINE
 	help
 	  Select this option for SOF support on AMD ACP7.B and ACP7.F PCI
 	  revision based platforms.
-- 
2.48.1

