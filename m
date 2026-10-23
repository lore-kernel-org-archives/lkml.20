Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792738434;
	b=AYYQc6WWL6aMlzzRC6jMr5UaGI41uuyeUv8X/4PL4VWUGFBHAT3dL1xNNXq1wbvKPpuT
	 5Epkt+mTkbJNlBqn22TFM2sGXlYa5BpJqyzoGFfKOFyGbLUQa34q4iL0M54yAhc7WSXnz
	 1DBO6W0TL8Gjg2NOopmPhmrXkbjiV0vnQajfPcBza/oFsKsyyyV0wrcZHUkl5xrKpgdLc
	 gO/x51s8g1BSAG8oMaeJ7GwRpqiTRNiH5g79Lp/Ura1qu1t0aBPHwfRhgjEvZDWyKDptP
	 pD0HONtHNe+ndYXzp4RTBpHGbfpnYiXJ8bK6IFy9jkOtGJ2V1/RMrfQwHf39qscZXpg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738434;
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
	bh=Bdz3/PsVp/sZYlCHEve58sNJ//5/XvhyHo89/29CoQo=;
	b=IccGSu8kMbiAhO+/P4FVJpu1A77t7zKVnrRczAHF21g6UAprrLm6V5HflaEFd+WavlUG
	 +APTyszJmYAN6r6bosgaYwA5pEDs8S2N/pOP8tA/pSwy+BNKbzOo8BM2CDWplOLiSUl7M
	 15ekLiUji/d/wWtSR6H8COfeEN+oVtXzDFATHDMHhK2UhOsjqx3gy0xICDCbENc5BixTH
	 MENBsPMxRQOW4vvWrBiT4LNBYGqKzIcQgF0ciDVtdzT6ESAkX1PZM38tZU/at8tWGY+HX
	 etkPGo4kI3DJl2+ju/I7X56rRypvf+E+YtxxOyuUmzOOH4v/NYv0yI2aLjObFTCVtlA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=LaqvOFVz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.8
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011008.outbound.protection.outlook.com [52.101.57.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E430B606A325;
	Fri, 23 Oct 2026 06:53:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E430B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=LaqvOFVz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u3Q/iRgp0RHJqtuiZVdG5vHxfP4VLw92CuUjMxOENrgQzV5MhGXAKNgfzaNoBs8zW5okfC/bGVutH5osPZV4Hw+kptARQ/SLDkvSLPGkHkQzRW0M4qwg5jJt0lbKXrb+OnEb1bHlEVtuNyCHT7Gx7Kdi3TGGjR8AzoV5tzQocuQklI0vJD8Z/bD+nYPSg+Vw2B6sTyo+lla6JtnMcwqX3gKsMI7EhbtuMlX3JO2mzOpIAzk/UAtAaUYjRi/MpXnUOBNnbUx+if4KfyZ7/+R88SSyhHvaTh6R1+8xo6AUDt6gKJus7O5/Y8+T1XdxjfItEirXwWgQBOAkU1lyDizT+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bdz3/PsVp/sZYlCHEve58sNJ//5/XvhyHo89/29CoQo=;
 b=Aw1i4whTZb5L+RP2CcTttptdEi4+h2umr3IUVcrLhQ62cDSaY9DePaWhD1F1rxpk0IBTlM7tCYpsDoEicVHd+HHtxHcLRTHzLnM5tmHwkBtT0fZw2b8RmIz9Qb8SY26Zoy7/ium3tiuk5FvmxEdZuZeybWZY/3Jh2shfuKh1E8NuHXUGk9vgmICwxeC/n/WMTteYRLWmHvK7G2aIcfcJXkJVFrDSmq59O2dJUm2xlOYzW6oSKFyv0ZN69AGqYsWtQn+Nf/ERNGxADM+zc0WGkP9nZSs04hPBwg2eJDUsGaOMDU89q1+t6bnmiUNVuskzB11/XLBBn6z64FFCIdy72Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bdz3/PsVp/sZYlCHEve58sNJ//5/XvhyHo89/29CoQo=;
 b=LaqvOFVzSlaphy8zqVbsuyI0M7uUq6J/h2lTIL8CPRjRANDOPAvvAX9bznIJAh82l5gxkE5JjxXt7bZsxvSaEkNIxvhOkMUhmAgZCsqqXrLQDC1fDYuxVKA2zRGwvoRaL3xGapxKSGEYK0xToPy3mbjSmkprbFFUkruPp5YVfMg=
Received: from BY1P220CA0047.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59e::9)
 by DM6PR12MB4188.namprd12.prod.outlook.com (2603:10b6:5:215::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.19; Fri, 23 Oct
 2026 06:53:50 +0000
Received: from CO1PEPF00012E5F.namprd05.prod.outlook.com
 (2603:10b6:a03:59e:cafe::a) by BY1P220CA0047.outlook.office365.com
 (2603:10b6:a03:59e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.19 via Frontend Transport; Fri,
 23 Oct 2026 06:53:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF00012E5F.mail.protection.outlook.com (10.167.249.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Fri, 23 Oct 2026 06:53:49 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 23 Oct
 2026 01:53:47 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Fri, 23 Oct 2026 01:53:43 -0500
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
Subject: [PATCH v3 05/13] ASoC: amd: acp: enable DMIC DAI link based on PDM controller selection
Date: Fri, 23 Oct 2026 12:20:41 +0530
Message-ID: <20261023065216.3473883-6-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20261023065216.3473883-1-Vijendar.Mukunda@amd.com>
References: <20261023065216.3473883-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E5F:EE_|DM6PR12MB4188:EE_
X-MS-Office365-Filtering-Correlation-Id: dbdd5d61-f61e-4e26-84b4-08df30d26449
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|82310400026|36860700016|11063799006|56012099006|261009223027099003|261021123027099003|261021121427099003|261022105027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	vOBk8dt4Ph6qWb8Aw6xIjKTJUJKs+QHGuOe/Ph6DnuSrpRdDhMFFWBD1pQpbrPwEWYMDaWWbgUOn1w8QrQkYv6A60Kc8Vniuq4Y4OJItE/7rBW8nP774GPmJZVrDWejr1Xvz3cvdFUcARrccI94gcz28594Ws9QCyV6mfhwH2OIPz/5Ikp5EghfWMlRcySAxQqCxIOM4dxNOUJ8xG09UN6GvzDGOBWkfThSlWX2AhxLQBmJolpozB/kptgM2g2/ywleu0KkQmFChTXaW4lU37SOrog1g0aSSvXWCpibNV+u/RmOlMxXUOsbhYsHTVgyipDoPXXu3atYmz/8agqaD39lw8h6Hi17V4UZfN7z30wuI2YiVwPqcULTDZw6Npp/M0hJooURCzHbC81ZJOD6TxsUkZyB6a9E0E55DCmL9v6BTECUTGgGLCuEi5cluQdykqZDwKR5qWHjmfZtapVMgwR+lJIaWZzdNv5scLSY8QkJeLqLYTkv1PMjtrH6Ybm4rBkaR+5hC4zAGUvcwXNUOj5VDb+f5Uz1lhDHgy8F56hFdeeqyc2/0scbbcNLufCx0luNUlrCp0ZsUdyAoW+eixiUA760VK9hQxkwhsYRmD0uqK0HM80hTWxNeBXuqWsXzHtLvDhRVSMhW0HsNNFJXmnlMVqDUIiQTGJ5b4A9wagfMfWgBXInYgUgtaNmnVWkYjIY5ov1FSiSte96w+0B/qw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(82310400026)(36860700016)(11063799006)(56012099006)(261009223027099003)(261021123027099003)(261021121427099003)(261022105027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Rsv8xxlTHJBH/QwdMUgHwMMypOGXudAIOlnVdFr5IBG0QQDX4sG9FTNVCKHFf8vW/oks54lTOuDLIuycRls6hGPZ/p2l/HMKI1lIasuY1j7butx4Pfkva+8oEji0NfNrElh/s7a+ok3r6AjDOICkrLnY/LzjZNM+gIIjBRm99HVIKudsA7SPp27zRnvFfTimFwvlFq4QjqFOKG7PWQS3r65lNhQrUVponaeJ9yk3gvPhqIrWRKPdwl726lsPBeXR3C9x+pmtb6Qu8ftVME+HWvYXuNxMDBUayj4UZczFO3+M1vDwjobjGCE+E/OTD9DS1ziWmHNGPcbjKS0sEbpTs+bhnwF1Dhtx3VTM0G5ZwI0cokrD3+sH7McLnI4+jcJsMg6/QfppqyPl947odWa4Quo14qtTcN3pS37Yy608GCRSE9uk5DHwslNqEmB+kKWD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 06:53:49.2353
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbdd5d61-f61e-4e26-84b4-08df30d26449
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E5F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4188

Extend the DMIC DAI link enable condition in sof_card_dai_links_create()
to also check amd_ctx->pdm_sel. On ACP7.B/7.F platforms the PDM
controller is selected via ACPI rather than a DMI quirk, so
ASOC_SDW_ACP_DMIC may not be set. Enabling the DMIC link when
amd_ctx->pdm_sel is non-zero ensures the link is created whenever
a valid PDM controller has been identified from ACPI _DSD.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-sdw-sof-mach.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
index 40df873ec024e..6848b966c6eb4 100644
--- a/sound/soc/amd/acp/acp-sdw-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c
@@ -308,6 +308,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	struct snd_soc_acpi_mach *mach = dev_get_platdata(card->dev);
 	int sdw_be_num = 0, dmic_num = 0;
 	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct amd_mc_ctx *amd_ctx = (struct amd_mc_ctx *)ctx->private;
 	struct snd_soc_acpi_mach_params *mach_params = &mach->mach_params;
 	struct snd_soc_aux_dev *sof_aux;
 	struct snd_soc_codec_conf *codec_conf;
@@ -350,7 +351,8 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	sdw_be_num = ret;
 
 	/* enable dmic */
-	if (sof_sdw_quirk & ASOC_SDW_ACP_DMIC || mach_params->dmic_num)
+	if (sof_sdw_quirk & ASOC_SDW_ACP_DMIC || mach_params->dmic_num ||
+	    amd_ctx->pdm_sel)
 		dmic_num = 1;
 
 	dev_dbg(dev, "sdw %d, dmic %d", sdw_be_num, dmic_num);
-- 
2.48.1

