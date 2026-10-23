Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792738466;
	b=ViY0hhyrqJb+7hqCWJHGAdQdV46sHGbVcLbZCSqIL/WxltwGpAzuS/EhQNxgrJbC+Fnb
	 4JTyj0SXBGlkZOHrS8vM8WhQEk4rRe5/qBdftX6pGE6smPFSSAwiSeLn5NXJty2CbFz9L
	 0dCd+pTQXU+QT7R9UaCmquLY58FZ9llf36MP0V1o46WJytNMlbyCCcFiV0DA/UqRPEeFM
	 99bE5iIQqf3gQS8HNqCiCyADkaDtCx41ANFQsli+eiNUFZOVgO/cF2CZTbW/xgBjh5MEY
	 UjXGF1/NlOBV9d7sFrS8y/0TaJL+vOpIdaX60NQKCVkglsbyL3bjt7YXYMejLMyBs+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738466;
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
	b=EiJpXTvmvle3xPCF4QfZCe0FUeakb2/lWYOS7DJxJE5b+3zm8x13pLelBHemCQNG9EXa
	 qc+CpprfoLHf0n7P5HcNoYrI8kLEXwnO+daTpQ6iKUKM6thLn+r622Ue+mG25INknXCNx
	 hz4cAs/5myMrk5/pKJ6QRvHOAApdWwxs2RKsZqaMIoOPV/olZPEDQOtEbdPVC/rp/gk+Q
	 5foctg5aKckCmGYAa2Sj6YhkOR6PeClloCn65EkjGIagde3AuKq/S8hOFnxMDPSZ9RuxO
	 Y7IvAUkARi+Xyug5hu9+eBu/g+D5tlmFaLYSEdnnzB0LZwIYcAvPjI0xpS54xMXISAw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=c4APwBmO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.54
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011054.outbound.protection.outlook.com [52.101.62.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5714606A330;
	Fri, 23 Oct 2026 06:54:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5714606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=c4APwBmO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=afabtyb2zVlP4Fl4tZrzg+7L91O+K8jV6spi7AoDm4iDfKPxm6QgWhR238BNMLBwXwEQlmmDboHRS8ffS1nk4QDlcFoPMRM4h4cC+0rvJf2gNGSdlRecyH0jC4wFR+pt9MeNcn1r3R8+rFeViDjaen9F1/Z90Ckn6Rrm4oEyYZfXEbfZyBg9KMoHw3IHoAE53ptJtmxyuzXc96NzgtDS1x1HvaUpX4uvHGduT1SaVxkFziGBCkHNe7nV8FB3gLHaMVZ/34ZKmsHVMLzfgRw8oJwRxpfEXmWfE1FNL1pDFKre8t55h7ykY9Za8CwWsVDjz5mcPX99kYJY47ioNf1RsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+Ge2gz/ZBN0D3k0WD7n+CAHlDgWiAT9XThasimNDG0=;
 b=ph2r+BZ8zXDu7XIszcyz0nN3i37qpXICb5FM5yH7rTSmSUOtZ66sl/qjkNkwt04RQTqXYhWHgXasObYj7g/Xh1CJ6ggHTmi1c4Eqqjr2Wwa4pXCZRDi0oAGT707pKCSKV51SSbbz+rCKO9UBVJVs85Pahaw8l9z8aYutyfDXno+6pbrY40L9rxMfST/f5/ZNIqG82do3sRrGl77MJpzsSJbIC1657nWVxLl6sYs0b7DJrgHsAr8dODecpfHopFNTxOkAdzw24lMWKIz+lO/K1u5GsaVwYFkC6/4wLMMLQjLoENkyH9+jD4OUmKAplTTnJkHkKvgr0NJaivUpsqIF+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B+Ge2gz/ZBN0D3k0WD7n+CAHlDgWiAT9XThasimNDG0=;
 b=c4APwBmO/YUvj1GxVK1rhCOaDMQw/tD+fDplzgYR0A4hxQp3/LAvhZMscMC4+Vm3TjLPYIPQcCkjkTvg1jzh8b+KaqNm5RSWmu4t9d/ddRor33jKrF2nes7ZdHHqx13VVUzho+SWYMxd5veT0pPySma5MsRChhmdtTpTuOhWUgg=
Received: from MW4PR03CA0307.namprd03.prod.outlook.com (2603:10b6:303:dd::12)
 by DS8PR12MB899436.namprd12.prod.outlook.com (2603:10b6:8:446::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.19; Fri, 23 Oct
 2026 06:54:22 +0000
Received: from CO1PEPF00012E65.namprd05.prod.outlook.com
 (2603:10b6:303:dd:cafe::63) by MW4PR03CA0307.outlook.office365.com
 (2603:10b6:303:dd::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.20 via Frontend Transport; Fri,
 23 Oct 2026 06:54:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF00012E65.mail.protection.outlook.com (10.167.249.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Fri, 23 Oct 2026 06:54:22 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 23 Oct
 2026 01:54:21 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Fri, 23 Oct 2026 01:54:17 -0500
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
Subject: [PATCH v3 12/13] ASoC: amd: acp: add SoundWire machine table for ACP7.B platform
Date: Fri, 23 Oct 2026 12:20:48 +0530
Message-ID: <20261023065216.3473883-13-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E65:EE_|DS8PR12MB899436:EE_
X-MS-Office365-Filtering-Correlation-Id: b080ba56-ff65-4a71-6ab2-08df30d2782f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|7416014|1800799024|6133799003|18002099003|22082099003|56012099006|11063799006|261009223027099003|261022075727099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	RFy490n+vNhCBXZwvv97hiUbCCnoGdBGvyFiLTNGdN0Ml6dlS90UpMNsdlGlM4QNsBx9HVfw/a7fz5g01acgPF684T8iNtDZKl7mJrOfgJCewM/MiO6QAKnXbf02NUsecGR3tMl/JClA6YdTRjywOj/z79NGg2I515wTEuzIHyjJ9IVpBYTAski2MaHkZLjrTH85WL1KLGSveLWgyExZ6gGvp2ZUGqntmVPWjKV6TyIfnh8Fv4wi2EaZWmNbq7wjD5Y2xxkwfZTEFvI3YG+xV1xX0Pd9AoNuUEtpSBfPi31XKBfLso6ZP3AJVv36KH8n/zrCqu7DQHtTmm/KAgKIbIJyXsTnGojts5OT+W+9rI1eFokVI8YKpZ4Mdm1BfL9VGUe/MsMdqVlp1hZCSvRhCJUnVReN2+DglZCDvfCmJm1Lrvp3gREErI/M2bfyWQ1kGSCvJfREXiMhvnKBYP8puj8p01Sjw5JjDPX0hzUDuAwHmJyB+V4A09Mn0Ki7dwVmzUD6Rg2qmwmn60GWIICW6H3EAsQqU1RtysW7BcOX0bw51iXnRXhodF25zE4pEOKvf4hvTeQqtpqhuYe+qEgT0Rr2U1QYpYRB2BbFriYvD8c/4Jj4KXSAf+uUlm6fjYB5NVGUbQExuIoY6aQVPwHKolAubQwkElGbpJMWiRmQSz/LKMXbjNEOytYWDy9m/l8CmPyfhPQA9Pl9lyypk/epyQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(7416014)(1800799024)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006)(261009223027099003)(261022075727099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	guR3YLacb0a49BIIretAsF9OL9SqB+WDBe4IYJOyxz+EnU73/ivCpOsWgKsytHuUKP/bwt7qFxEmCJ4o12SIRH+koC92q2aHHMyw240TGbspcm/lntaE+eEd0GuV008v6Aqya69nDIio4Y+yE7so+xRxaEUpfNhienbH1ZSs6mpQvkyJamCWbtiYYyVg6wGeqOXumtUWiK6H25BPzT97CctJLrZioONKqnTOmcdMFSQiCLFPgokR3HTCTOb0oNA03fbJYhbnQvIw8tJOaIFzLkMJT0UZLqw+cQyAiFycBcqNQByLTlEhGJpu1QUG7U4IadYd1Q3R5tQB/cnj4h+h3+8xtznhy2ANkY6+MRTTzQsanAJ4xIspFgJDuVb7DpJRg4YOqFEOcSf/wCkHwSwl3mGkoryjXtuGvFoNsgsx6f8tTrVD7R/dj/Anr0IQDIC3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 06:54:22.6169
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b080ba56-ff65-4a71-6ab2-08df30d2782f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E65.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS8PR12MB899436

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

