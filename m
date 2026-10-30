Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.63
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793353784;
	b=nXMLF0lsa916USzRC6jfGj2TE0q5V/JL95sDolbbd90kV2VTg8Cms33qpglMWuoOVQD8
	 PDP90wRpBsvGymSI4WeHN+4qplyPNvyvMGSatpzj2kZfRO1IuWyaqUuSPelDU1UlPraOC
	 yfiayccQc0uEmlQRg1iKupwYO7i0iK7YHOz/uxSRbAVucjBY8g9e+h2AD4KWPEdqHgUOY
	 K0IIDqWuDzrsPA+x46JNGPoTbqtlFEDMLO7JgqM+39I6AszKulDz1n6C5nIYR7KYfZwUB
	 84yac53Qo0nB0IzkiHaQ2L7g4/n6v4H/tUSOrGAhef6oO//ZWCmS6y8TphPD9pYLWvA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353784;
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
	bh=9gbeNy91khrcxCdIT1ySrbZorFQQnKqUpJAG1QvM7mA=;
	b=Eq9ynXDFujVyLYuVgTm4leUaFgr4NZiS4mPHDk6cEfCNd2oYN6kKJ+cGoApgxTDXN0p/
	 GCvbBvZtDSirh2xvk9q3glKL1ePYi/23VQ/MgZCYb+Gtgxl8KPsshzJhtttDDmjzzen6F
	 xzW7pKMcpkTqsLmhRclD0zjvQqeb52NWw1cd/P+UBD2MSd5kjG8vmzBR9zJ1HD2QJ3Per
	 iMrB5sFRmnl6xwE+bK8/SqiKbi+yHp+DytjKg9vsSkvi9kXKs21edEHLDJits0e4bsyix
	 fiPC1e4LqcYrj4tzTU9Y+MQdlDt2DUM8gUW7clOCF0sp7ktWVO+awEMabkb0ql9nK1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=whkWBnlE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.63
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013063.outbound.protection.outlook.com [40.93.201.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C63606A339;
	Fri, 30 Oct 2026 09:49:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78C63606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=whkWBnlE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BMnXeBh1f7HGoA+vIT4k8SR1Lau9PW1pDzzN++Y7kR1FUacXTmnIFudShQABC5mN21FzkHM04sY4GFTS6QWr3w7+n9TKcKf2VQ+h/UmZKwC3EEC7imZahaxNkIzmqA3VwzHnZJN80/LlhEEbKdXMK3Mzn+eF4RRb9hMv1ta2bI4l6J2LlS9y0XAxcMhTcbr7IkGDL19em7cANljGv67ANpNT7w424WceO0C7vDuMeFsRItcUV6PsdxuoRhDZEvml4wx+PaYgB8Xqt0Cx73G8j9cD+XVbcyMtCz6w0J7Evv9SWTBX47Wpb+M9ZNFUTdrGlgKX5VFilxYBuxeoPjR2Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9gbeNy91khrcxCdIT1ySrbZorFQQnKqUpJAG1QvM7mA=;
 b=NGpsOqnYDLLv6iAmYXPUTq04F69jsVbDXYSiQPznpJeb+fDvQ9XC58QvOSLqxTejcu48HElLm0RISiqwLPcSthIYnJDNOIRWUHjdVs/7mM3DjiZQ5l09d2p4j5kBiF+7I3tX1vKqaTxMzfLA0dMvTmtjkau89J1g/kAWML90I/Kd7Ni7pnBzwBTSLC6nnsfcpw9r+GEcHqp+V36xFL/ORaPqYeZL9ISvzm7h1EwOAxpuPAriftJbmdOfo7T/UOwDyY9USHA3g7NrQ8Bk6/jLw9xCREneIRUwNUoL0Q1Vpdg75MvOkoUkbn8GHwT+KdQRn5wbkzfDsnzBvT0orRoXMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9gbeNy91khrcxCdIT1ySrbZorFQQnKqUpJAG1QvM7mA=;
 b=whkWBnlELHC84Cr5WRwP6xqXSpgRAl4hdXTGL2sG/E+G9oYE/f5unClSnMU4zky3htnqI++WLzqVG/e0ktH9T7VZuKYOI6I/SNyfjLTGyK3vXXfvnx6q/uzq7Rxeww+ygU0A2B0zOgQUXxG4UGqZzDFPQ3e1LOFF2LYadyN8Ddk=
Received: from BN9PR03CA0572.namprd03.prod.outlook.com (2603:10b6:408:10d::7)
 by DM4PR12MB7693.namprd12.prod.outlook.com (2603:10b6:8:103::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 09:49:40 +0000
Received: from BN7PEPF000000AB.namprd05.prod.outlook.com
 (2603:10b6:408:10d:cafe::65) by BN9PR03CA0572.outlook.office365.com
 (2603:10b6:408:10d::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.9 via Frontend Transport; Fri, 30
 Oct 2026 09:49:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN7PEPF000000AB.mail.protection.outlook.com (10.167.245.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Fri, 30 Oct 2026 09:49:39 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 30 Oct
 2026 04:49:39 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Fri, 30 Oct 2026 04:49:34 -0500
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
Subject: [PATCH v4 16/16] ASoC: SOF: amd: register SoundWire alt_machines for ACP7.B
Date: Fri, 30 Oct 2026 15:15:31 +0530
Message-ID: <20261030094714.1123396-17-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030094714.1123396-1-Vijendar.Mukunda@amd.com>
References: <20261030094714.1123396-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN7PEPF000000AB:EE_|DM4PR12MB7693:EE_
X-MS-Office365-Filtering-Correlation-Id: 36233797-a815-43c3-ca8c-08df366b1d98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|7416014|1800799024|22082099003|18002099003|56012099006|11063799006|10067099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	TapK7rf/QuYHu+8jMjyfRfDdN2ZTHIBahJIppJxcyC5s67dbCrclWux0KaM2Ubt3rCJbxXKnQzZweJ9OquZkojpQ0+Nrw7sfYjt+zkZXs3hAPdEb2eNPzynb1z43ws60utILRQxEcaVmq8Ep0Sa5U5s5Ke3i8ETIVD1iskBpMdmuYIBRiDwcxGjHBsRhj9pZWBb5PWFM2d90VQbFtM4Cobr01b7mdI5WZhOxVxkQncWo988IuN/BGDeQAwB1gyAVLZnBuXfxEEFHv/C2+tANxfYWQoC5+msBfWFfnDzZw0CS6+oDwj9uvotZvPfsDxhdSYb1idDCkwq9qd10vapxGujvRBCJ6XL88vfWDUeZ3GYeSiAmiFXrm716zV6Nk+0aU5sOqSV12kg4osVnUMcrp+JuCTIX36IUOaBfjbI16RxVzgJYTGT0DY9/LF4vovtwT5DX43FApm9ro1c9BLhaDGTOYZarBZEAXMVmezXgrjSjFxGhZ3qxyfeKngz9+5VodlU/AZC0gL44COgOEC+ADzkmCBpF5cmahf9Z0dAyP5fB2h0Wdeh1ujFpYI/o6w6IXogWOIRwmEB3fba7mE4kRVW+ELReXpcD5h+7e6ReRmNb/hZ6zQIiFu06F3lNK8wO7xwMHMVoz0TbITeNPFlHUunQVspFHMMaT1gnYMEEg36ls64l3G0raEzRx/9q2oT3KIDAmbmw7MPcQAKT3ifS4Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(7416014)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Sn14nEhqj7XoXeXGZKejFoj0w8l1szjBk9+pE3ZzM4fGOEeVFa8Rfho7oRaCSgTt910d4iuB1lvGe3hvfxymPw3SHBW5nboEolQcGbEny3U4JXMwuxTHUxtkAD8gA5JItK4YPbUyvZsxK6AcAp/RY0nS7ZgQcSNSJ/I5j1Nqza/PpmC3ZPiiM3RfZmRAxe601yPZ5TbLfUIxN7Z/QC7fXUQ5bsVC8GL6Q8DuCqPiuB5oebbHFJgpX6uUlHgh8EAeWx5tUu0q4+DBIfmhd9LR/Tl5x2tUMgbWvI2R9WNJ2UTS3JBiwJVa4g79ULb97wnRqPJLFeB7n9J2hDLmDcOJ2kyEXzQ/FdUeIBIfcObYZ3nLez71jcu6BsItBrGGrfpiSIj1nVj2t+dnB0b59AKeg6ctIlT+I8/+EWU20x5D08YkJ01+GJZhEbqOSAXmNRe0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 09:49:39.5530
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36233797-a815-43c3-ca8c-08df366b1d98
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000AB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7693

Register snd_soc_acpi_amd_acp7b_sof_sdw_machines as alt_machines in
the ACP7.B SOF device descriptor so that the SOF core selects the
SoundWire machine driver when ADR devices are detected on ACP7.B
platforms.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/sof/amd/pci-acp7x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/amd/pci-acp7x.c b/sound/soc/sof/amd/pci-acp7x.c
index 2999dc6d72a6..6aa16d1a12b9 100644
--- a/sound/soc/sof/amd/pci-acp7x.c
+++ b/sound/soc/sof/amd/pci-acp7x.c
@@ -47,6 +47,7 @@ static const struct sof_amd_acp_desc acp7b_chip_info = {
 
 static const struct sof_dev_desc acp7b_desc = {
 	.machines		= snd_soc_acpi_amd_acp7b_sof_machines,
+	.alt_machines		= snd_soc_acpi_amd_acp7b_sof_sdw_machines,
 	.resindex_lpe_base	= 0,
 	.resindex_pcicfg_base	= -1,
 	.resindex_imr_base	= -1,
-- 
2.53.0

