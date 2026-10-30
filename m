Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793353896;
	b=o6/UKZvZS0ebGVXcoRO4AUUeAU6I8N7NDqfHRXx3nPLm9TX3HdwO4cdoUFAHWgS4933R
	 ogxguGv0/aC9XBNDaIkoZZ08wQSsXyHs6kIHs5vY2Cp35OjmojqA3QwSAVmjeeO85fw7e
	 5NjtBsXp05N1iUYMzJlY3vIOtxB9t8ERAJR42xuAvp7YJ6q7V5AHM8YKMEgJ8fNTBQFmZ
	 NpbnZI62DUMPX2t0l4iqbBSEL2eMY77HJvAyXiqcMxSwVGM95rmToVvfDUjXO4WjwlBJv
	 fAYF4RkCVjLr3YcDza/rJdxTyHM80joJwQXQ/9DTyidln/SYFKJUMTLF9hLYiFWv4VA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353896;
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
	bh=58mQ0iJ+tJuV3ZKHntc6gSCkzEuuQntNWu6bVCOx9YI=;
	b=y1aTzEUuOLpT8GflssiWZSpkNn1dC3Fo/IdRACF0VTbbxtFB1s1qhHDRUirODEQ3LxMC
	 NhdqpcCbe3oRbtYGpdJj4kyE7CPjkGrKBLAPUaCM9WAz+PVb1HFZjyZQv584nfjhKL1+x
	 YMZzPCT4Blqiwdm3RIEgTKopQOTcyEscSJr/lSLz+ZpfbQ2CKlmJQDN8ktLrYDq8WWgfE
	 KAUhczKihemMm2LfYRVVo5ADkkOmhwag2zJl68lDIcELC0WIYCg5Fngjtx9YAC0ZsXAiS
	 JFdf2214ccUSxKX8Q0gHkgq8zV12frfqPz2tav7E3th4cVgcj/QNLcq8oTcKuQ+z/mA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=F5i0gY1+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.9
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012009.outbound.protection.outlook.com [52.101.48.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71D2606A339;
	Fri, 30 Oct 2026 09:51:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B71D2606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=F5i0gY1+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=atUmWGzrm+yKfO86z8fiWB1HQ900CGt+CPIrXi7EG5T2vtiTY5Rho/k1ZpAaJY3ie1zklNlx/zc6fj8DE6Puz3WmngAqWenlrZxHKTBG6AWvfUrh0Zw8TRu6bwCDE4b5zW/6QTzgqj/TGIj6gRL2+o21J7quZ1PlACOtiAhNeZZcnlOCkBvWSWczr5zQ/RwGWUMwtaG1j31JJcntH0GreXoqBAzDFogR4yYYUMlYWupGNqmwnBuCWIb+5ZtHxHw9MgXewEehw23K0Oxhwb7+c0/l/lFiwlujFj/PTxANvq1a1YE5mRMc5+xxKx0a//KOTP79OxqRKaFsjuVoMIOqYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=58mQ0iJ+tJuV3ZKHntc6gSCkzEuuQntNWu6bVCOx9YI=;
 b=hcOD11iVydeeWlZqwCQfL4TEWXQ3doJFWcb5ms7pBBogfxiItivjfHFKwbMXQgGtyPIsR9YBReISobJ9XgwIUr5LMOgc0Eul/0S+eYPdWDhBSR6a0uM8L0EAKjBBFVM/igzjiN/LjJX8YtAFjCZC3xs1APXAG2SX5Ll6J/nTyIdCaSrgGrYb6UIeGHnJYS8WMV96phGmb+8fdYxOuxqqFq1YgIAfEJfHi6T5sf6SmmZJP3+tdUqRJIncOz6ByjJK5j/iRGaom3rgBFTWMLtU3iuNwaMuR6t6tvXNs/FBEgMAFaaz1yDc4j0jlbIVQExcxsW8S2Z+mOt1zaULXr2QyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=58mQ0iJ+tJuV3ZKHntc6gSCkzEuuQntNWu6bVCOx9YI=;
 b=F5i0gY1+aGEWwMe+G1ewjY7+7Vo7KJ7a+XZIuGRjlpvzeVVICtXEkrJSrY0d7cMcStTUoPOwl7mDHK9ix3ulu6UHsNTnGb2gW3XM/TTL5ykAjA8OXkiKK4f9dF8UnK5lUTm8hBGW5c/P8/J82xcuWUkUPyS47eSHOuTRV9MzFSo=
Received: from CH0PR04CA0039.namprd04.prod.outlook.com (2603:10b6:610:77::14)
 by DM6PR12MB4042.namprd12.prod.outlook.com (2603:10b6:5:215::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 09:49:30 +0000
Received: from BN7PEPF000000A7.namprd05.prod.outlook.com
 (2603:10b6:610:77:cafe::ab) by CH0PR04CA0039.outlook.office365.com
 (2603:10b6:610:77::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.9 via Frontend Transport; Fri, 30
 Oct 2026 09:49:30 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN7PEPF000000A7.mail.protection.outlook.com (10.167.245.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Fri, 30 Oct 2026 09:49:30 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 30 Oct
 2026 04:49:29 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 30 Oct
 2026 04:49:29 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Fri, 30 Oct 2026 04:49:25 -0500
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
Subject: [PATCH v4 14/16] ASoC: SOF: amd: add alt_machines for ACP7.F SOF SoundWire
Date: Fri, 30 Oct 2026 15:15:29 +0530
Message-ID: <20261030094714.1123396-15-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A7:EE_|DM6PR12MB4042:EE_
X-MS-Office365-Filtering-Correlation-Id: 91eb4b5c-6e81-4ad3-bd40-08df366b17ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|7416014|1800799024|22082099003|18002099003|56012099006|11063799006|10067099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	SbjU29QtIcHsFT8HI7YrFezqQ4QqvS0Fpaxn4X8CYK2B4iCYblA/AGr7nHyqrLALF12+kxQ1w/z2TRujI01qozfBG1bCSTE7udXAfXJoZvljA0rNbgcxtRIHfnS2NGSo9/56huJdCMvmL/nQ+876diytHkLNUPGXYmtZeTu+S0yJzXXR3UllMLkKsi5H9vMdlBlE/6/F0agQ+85BmV3Xpp9GJCXpvsaneIoqMA9HFassLEQwmGY48dHyhKswHrjqCAuIOY1B2U/oLvtwmJz+k1iStB+XWEuC8l/8qclXdFvuAOHCLXgQYDw6g75TsO8OvfQYBCPt8hWE6wpQpRyAOhUXXs0eb14v5amgBDPBpOgSNo7J5Wh29+1RmjBLhQEnKlmmESNKMCX0l6y6PbH4PU6Nqi+tbv8PP9WNDObqCZofSUc9fg/FV3XVMGMwBKjt77PC7kI+TwZRoEB/Br9J/T4Iar9kzVJJCadD7mxhokiyK3vR30dLKGolJN0mUV20853DTDIOaGxcrXiCPs3R2oOMck4tt2UYHvbqFfyTg8obzX9QmhsNzSsNiKlhRXv3ITDSgu7effLy8qVR/iGKPGOYnWVV9u39uQxKa/Sp8asgQIdkZoS4h+MMGo3nWMRoo639bOQpqucN9k3rmYm2ixjadAviVYiF0hxMQss1uAs7eLDXD9+NKuO8gryCnt9b1iPmqOENv7g1fTCN2ubkNA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(7416014)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TigZLhua38Xt3XdcT+Lg1rMu9Gg76/iqyDN3SFgHRKOEjadnR7pq67oUrtdxch0KjLbCgimNFiyfXdu1bQ5lJOoeoSfiYc90u7pU1pM3Q2TupMHxX77+gO7wzQuktUdSfrYkBW/TlxBe6ovTqZxH9KWrzbHwaDfFjzjDrexGwkyIxIGb2kk/XCbf+aRFra1XRXD2fk56BD53oPYrJogMmgC/L7lPm6kNeHp3bCS+v2PdRw2Mv0BHA09ZrmtinhhqVMvqlXC/H7QKSKIQ0djwbOZzAXg3lKHui5RVYFD9QCOyiNFSOfhArIHHEghvyExbG8fr3d1Xc1wZWnpMMRWkXNDvmZN8J/czjsrVwMnVmdLO6PQdvp7u1UrVFdTi21F0FtjhjYbbBhYh8J92Ouvc3zpWMUBOSw75zKfn/5zzrRq9niSgtHVgJ6hPgbSTTItl
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 09:49:30.0257
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91eb4b5c-6e81-4ad3-bd40-08df366b17ec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000A7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4042

Register snd_soc_acpi_amd_acp7f_sof_sdw_machines as alt_machines in
the ACP7.F SOF device descriptor so that the SOF core selects the
SoundWire machine driver when ADR devices are detected on ACP7.F
platforms.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/sof/amd/pci-acp7x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/amd/pci-acp7x.c b/sound/soc/sof/amd/pci-acp7x.c
index 5a21ab8ebb4b..2999dc6d72a6 100644
--- a/sound/soc/sof/amd/pci-acp7x.c
+++ b/sound/soc/sof/amd/pci-acp7x.c
@@ -89,6 +89,7 @@ static const struct sof_amd_acp_desc acp7f_chip_info = {
 
 static const struct sof_dev_desc acp7f_desc = {
 	.machines		= snd_soc_acpi_amd_acp7f_sof_machines,
+	.alt_machines		= snd_soc_acpi_amd_acp7f_sof_sdw_machines,
 	.resindex_lpe_base	= 0,
 	.resindex_pcicfg_base	= -1,
 	.resindex_imr_base	= -1,
-- 
2.53.0

