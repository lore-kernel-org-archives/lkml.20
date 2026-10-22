Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792649515;
	b=fAM8qzVsDLjGCg/n5mFv0/+hBWtCMwDZGc23yiZnfCnIm4jtxrU+/nj6dQYwuwEo0wr5
	 /+C793PPpfv12mIYUNiWN+W50MFlLrvDY+anhydXIzdqJBGdG2xhfOIgqVqL4oknYu/CT
	 Xc2DMXxayQ19SewZDQcDyDSiph50aLfOmGc8aK3TIMt4i4fMKhzwyUoHJK+4dWihtbq6w
	 Z/zalsyojjiwowJL5a7POa31FSkL7x/zqR2tcB8TLalnEPAAkPcF/0Xe7rheU9B/Mdvaz
	 F8naK0dmlJAb0Lk6O5EDe8ZNtgsmxggNASq91ZXCIbCMxVjxDi/nr7TVdM9tgdxiMOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792649515;
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
	bh=B+Ge2gz/ZBN0D3k0WD7n+CAHlDgWiAT9XThasimNDG0=;
	b=cl25OgQTMW4IRLUiXHu3JJcXzqOFDqUiSU1I7Lw30J7Nqq9K9GU/VrW1AIWt2+bXwaov
	 D6YdwhXFnwJqklOuECG2FafzvXvv/1lZjhime6TAyUsFfDgtOKrQBpSb33kbm1aX9tEys
	 dVIvyR9dFtBDZ3ZM3/P3ZmgxOE79gRP+Mora0XBJQRvOAILBbREPek1Toh1BI4KshTy7b
	 rYcsQuoPQ8NL4CGtUlhglL5BHiS2xB4sKDSH3CA2EAbLqs3lAHuWNdtA65+/Qszf7Yc/D
	 xygjFCNdhHABhmrOnj6i+HPGIZHyBNYA5KWaBV6kGQn78S7/DMs3QQzyAmQvsXP2pKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=2SOirwOs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.14
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010014.outbound.protection.outlook.com [52.101.193.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6EB606A31F;
	Thu, 22 Oct 2026 06:11:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF6EB606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=2SOirwOs
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wSsxsNjC3yusRjdaLDpEodeBWRvOIywOaksk70ORh6C5AdshOgtZCn0WTXAy3UzvFSOPWVnHZgRgpJuHGWGEuL8TF7sLW1oddmi0K0o0XytoWjhGEGhzeSVGqw2Puiv7T90PQUVFv+ol8jIF23eogbQs7vjXRcGVospLIuoSnVQd3T9OvS/SHdes5zVX5+u8i1ETPmT6q/IHoV83O32xRO58VRG/R2EDmmq8i94Ue7yOWNGVLx9EYl+HVFb9z0vkgz4+/cS8vOHCPxlI0EVfZg3k9fOF2R3FC1flTiADEq4U0r5LJPdElM7bCTvY/nDY/oEoNHfTlS6hL8OJH3seWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+Ge2gz/ZBN0D3k0WD7n+CAHlDgWiAT9XThasimNDG0=;
 b=sT/uuIo5YZWNFKDW8wvm2BPlAioCVNhqh3l3OvDc4Fby4hYkALdFj9CiLf+PGYswcPyzJc+0sU9YSwy7TiKsomaa5lW/UJaRwAEqFmxBSQMxqH0dEu+Yom//6MABmX1jXibfHgFHo5saipOddRmocEJeEolh7X/HO5MAr5mdIaQJwiCZPEgnShl0haZSp8VlfDPE0D26XXZGP2uJdNUZLchIaoA7l/6UCuPWkWV523a13wo4wdAGI+qIM16IVIpYPNPGoR1JGHrPzZ/G6Q/Bgviqh3HzC4BTn5u+4DTGkUddIp/qJ+yitdHlDVApMeH6yaDHMSz9UcIyHRZmHTA5yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B+Ge2gz/ZBN0D3k0WD7n+CAHlDgWiAT9XThasimNDG0=;
 b=2SOirwOsP5r0wGLupLNp4doOKhOXu6XAJYR3fRddrCIcXABE6oSBr408LJ7Hu84P8jT2WHB/0+8lt6sTL0bJstcTc+qY7IWjOCR5IxzbGO++XHZiuBe+Rzcr0X/2NvU4kY5x2c3CQmsZfjhC4C1B1V26y0sQlNpHArtXQCtlzNs=
Received: from BN9P221CA0025.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::22)
 by DM4PR12MB8475.namprd12.prod.outlook.com (2603:10b6:8:190::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Thu, 22 Oct
 2026 06:09:46 +0000
Received: from MN7PEPF0000014C.namprd04.prod.outlook.com
 (2603:10b6:408:10a:cafe::60) by BN9P221CA0025.outlook.office365.com
 (2603:10b6:408:10a::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.16 via Frontend Transport; Thu,
 22 Oct 2026 06:09:46 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN7PEPF0000014C.mail.protection.outlook.com (10.167.254.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Thu, 22 Oct 2026 06:09:46 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 22 Oct
 2026 01:09:43 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Thu, 22 Oct 2026 01:09:39 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <pierre-louis.bossart@linux.dev>,
	<yung-chuan.liao@linux.intel.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Syed.SabaKareem@amd.com>, <Mario.Limonciello@amd.com>,
	<Richard.Gong@amd.com>, <Vijendar.Mukunda@amd.com>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<sound-open-firmware@alsa-project.org>
Subject: [PATCH V2 12/13] ASoC: amd: acp: add SoundWire machine table for ACP7.B platform
Date: Thu, 22 Oct 2026 11:32:22 +0530
Message-ID: <20261022060724.1814741-13-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20261022060724.1814741-1-Vijendar.Mukunda@amd.com>
References: <20261022060724.1814741-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN7PEPF0000014C:EE_|DM4PR12MB8475:EE_
X-MS-Office365-Filtering-Correlation-Id: cdcb7864-57fc-49e1-b42d-08df300312c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|7416014|1800799024|376014|261009223027099003|10067099003|6133799003|22082099003|18002099003|56012099006|11063799006|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	HOYEW744uIskhgyFurYqXpgMiIC82VTu7XjNOsaeYxf39Kcg/TimHPFXzA8gJkS245KTbmPbAFsEH3+jLP5TaKrTkTYr4lM33qW1jEEi20MpSnyKxDpkqmLwIdSrgzGhFy64tik8Bzpphh+NNDYijIOe2Z+qKqan+rEERLAW9gAGmMasFVZyG8J9C3XZ9Nre8kSHW2UhvrEYKc5za+PcWCHhK6+/izMLXRJT7C1PHEqV8HTorBG5QjIAbOZUGkXTAyRB3Cx+wZImZ6J8FrLaCQco/4ARcHiWtRCX18wFaWPJD68KH2eIJlz/lzsJRNBLZp5oBN6T6e/Yjp2JY7Gio/fNN08UvQVT3BDLpDHM8UZeDCHx5H6vhQe7baXqPHJss4YXaS/gFMjHDClehakbDH2xyKvCr/HQEVWADHODKBBHiOADHqBLSkWbcxnwPCW84brhbsxz0iIi4SBscNJMsHhg9pg4b1+w/yYWAz1KgI/4ZYeaaFnpAHGAeOK1mmw2mGY387U7cS6AIomYpy8UtqCDh7FDz3HRXbps8xyXw+KyMYiD4ycS9GDNKZub+Y8nzeEgIEaGEohuGB0kHiXcspn7CPo13jKsA5V/eiFd8mAaMz/iIYW1MHgJPbNEFHT3A5EA5G5oEq/CQwBuzk5h1iF4nUE7CXhwtIoiFX55e5IPRT2EHQQR9HS31SeIppw6ZZYLDLBIaee+SgLICNs/Bw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(7416014)(1800799024)(376014)(261009223027099003)(10067099003)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ixMEJZKYCaP/VQZzUiVbmX6DDv4yU6OG0M7Egjsw566opCImuTfhZ1CR86QUMqvLHjJ130ZfLRUKakmQFkq6FCPhCI9YM0N2Lbzs4+MU91Og+agSNX8JxyMuVrsxKtVIk/MnmfBV+RhnXy4DSbBECDxUMsksueuQgwIKlePrvEAF58AxYDPYx54McE7uXylnhAQrJgutYdw+B1nJcLvFdH3HWJb6U7YHGOPqL19WyESPEXqrSopmShtBzk6EtbVbbcOyRBLJOdKti5KOwrU+6Tr8T3qshC7U9j1476ui+gpArdFUfOzdGa6E/Hg40rvqZ8YYvppji65fn7IjgZAxg+aG67Dc3dZjkA3Y9+eyOg93AJPs4+NLqUusWLXCHOFjm2oertwVWSarM9GBxUGO9z1I4m5weH+Xce2wycRz2ug28zlpZ7ZrUPwZqEjyKClg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 06:09:46.7115
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cdcb7864-57fc-49e1-b42d-08df300312c0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN7PEPF0000014C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8475

Add snd_soc_acpi_amd_acp7b_sof_sdw_machines with one entry for the
RT721 (L0: jack + DMIC) + RT1320 (L3: speaker) SoundWire configuration
on ACP7.B. Export the table for use by the SOF descriptor.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/amd-acp7x-acpi-match.c | 12 ++++++++++++
 sound/soc/amd/mach-config.h              |  1 +
 2 files changed, 13 insertions(+)

diff --git a/sound/soc/amd/acp/amd-acp7x-acpi-match.c b/sound/soc/amd/acp/amd-acp7x-acpi-match.c
index 2f5e060ec79b4..830c59966a356 100644
--- a/sound/soc/amd/acp/amd-acp7x-acpi-match.c
+++ b/sound/soc/amd/acp/amd-acp7x-acpi-match.c
@@ -148,6 +148,18 @@ static const struct snd_soc_acpi_link_adr acp7x_rt721_l0_rt1320_l3[] = {
 	{}
 };
 
+struct snd_soc_acpi_mach snd_soc_acpi_amd_acp7b_sof_sdw_machines[] = {
+	{
+		.link_mask = BIT(0) | BIT(3),
+		.links = acp7x_rt721_l0_rt1320_l3,
+		.drv_name = "amd_sof_sdw",
+		.sof_tplg_filename = "sof-acp7b-rt721-l0-rt1320-l3.tplg",
+		.fw_filename = "sof-acp7b.ri",
+	},
+	{},
+};
+EXPORT_SYMBOL(snd_soc_acpi_amd_acp7b_sof_sdw_machines);
+
 struct snd_soc_acpi_mach snd_soc_acpi_amd_acp7f_sof_sdw_machines[] = {
 	{
 		.link_mask = BIT(0) | BIT(3),
diff --git a/sound/soc/amd/mach-config.h b/sound/soc/amd/mach-config.h
index 321af4682fd30..09ea9f5259557 100644
--- a/sound/soc/amd/mach-config.h
+++ b/sound/soc/amd/mach-config.h
@@ -29,6 +29,7 @@ extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sof_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sdw_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sof_sdw_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp7b_sof_machines[];
+extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp7b_sof_sdw_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp7f_sof_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_amd_acp7f_sof_sdw_machines[];
 
-- 
2.48.1

