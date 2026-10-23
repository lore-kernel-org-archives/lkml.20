Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792738550;
	b=UrYrg0nY8v+WB/7VQ/3sZ0JI3fIqwdNbEER+sunowebUrFn8WKvn/FLNai6gL+D8QA4e
	 7/AFhrXj43Ig/1EQlO9MkaLoAejdmtyDgDM5JlonPbt7MPqLNgYahHUv7aFQE80J2/pUN
	 7QnzP/UgWCifLRuRLhRVsEw/Tj8/KHg4N20bykVPdpRVSGDGaBzyF/2z/5AYwBVeLUs4d
	 YPYBjMRXmAQRBRijyVJyxXeChDcrfd4DpkTj2yH6j7CdzK4a544GeW7vEOsmYPUMRDJR0
	 2YRDv3ltKvtmkoyjYNOjZQ6ylhDBF95bCUHcOAIPmK35MOk7Fk3K2wdlKQE8o4qI8FQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738550;
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
	bh=zRxUZ+CrFYY9HCsaWb8vhM26Fu+Ahe5VdmQ8u9cPNgY=;
	b=gPGDBD8vx1MW69OKcadTAATSexjOzCd4uO/cbQ9xVo243SgD71wZLb82PbxdKq/pvBNQ
	 6XRgdggJRRopj5jzDHXwm+EJTE7upqaJVrllKv9gZaF4++RR/LyYASQVOKJoBqG6CMjUm
	 71+JpJpsu9WZGC032rBS9YeoH/Khfk1N3m++Ebi7hUP7/rl1jEgJshbmyRfWtfxaz77Cv
	 Un0NjI0GDm7unf5jiGjLO31yMrDcH+/gtYTbKdAv/taynPxvERwMNaXCXIJLq4rFnNMsj
	 6Wilg6wQ6dXfXtA/f7kcGvIHjo83Jvqon7Cr4MeNIEICU5sdFJFsqgSc42sPLBcMUgg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=RdD7naEb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.20
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010020.outbound.protection.outlook.com [52.101.56.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7A5606A31E;
	Fri, 23 Oct 2026 06:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C7A5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=RdD7naEb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZaQD5guwbuuEnjELMzewflLbPP7oH2hjI3qwBckAZ0gL1daRSbBOCJnuf4QPhCiQEvGs1yzblQKE4ROjJWpkQeQCkN/iwKgZwP8c0VPkzTH5eLyF6rfU9gjSDd7ae4gCuFmgZaQQTG7VMZIKjyGTC2jVLLxNpYJfERHyZex5ORR3g5q0KlNs/iYwNtD8ffTIobWtSR3r/8Ft3KRxNsiCKCYzKrjuQO8+eEnTUPAf2H5h4VzpRaj/J2rPLbvufu8kQdIbhwPNDM7n6cljRxmfCVvmwWvFDNISY+PNNI5vHEr+byLUYU1SE+LsDC4b0690tt/iF6jqnSUsfraceX+qOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zRxUZ+CrFYY9HCsaWb8vhM26Fu+Ahe5VdmQ8u9cPNgY=;
 b=otRhTR/9agFot5wT125LNDqHU1C37kiXhLTn1Q8FAd3EDBesq71tqAgANS1lxD9AwxAUfkAfyg2sXRdU9/CgrW+q+je/mkvvaYzyOJNN/daSxlIl+71v2pjAq34q8rqvDL0M90H9hkeJyxFXYoPUkcxuuAVNGGnU1HEe7v9ubPFIQTMtp/i8EqGdjCbp+F6DDHfdBjsGLaxEny5qnhiEmpj9HZ4iaG07TT5vUBABzbI/eXCx3f112qAuRTt8QeeNabXkZT5OA432yBkfDvOoTnOw7MbsLbt1P0Vuw6chuJLwov/TxrHIDNn07B+lebcZRgobxt4WMriNkOWA7OmoCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zRxUZ+CrFYY9HCsaWb8vhM26Fu+Ahe5VdmQ8u9cPNgY=;
 b=RdD7naEbdn7hVopNpnKH8Hbdxq7MZeQ2lWFEkwvWF2YM6jlnHFT7JiONexG8O63mr352wzaEwIfUk2/eDCAe+RlvgOZgTXlSsWAEQmEJbNCMsjVM+llynyKj3YqJF37v6V8EyV+trjJDsiBUjo9ifXBZQfce+TdFpKsTsX0TU+0=
Received: from SJ0PR13CA0220.namprd13.prod.outlook.com (2603:10b6:a03:2c1::15)
 by MW6PR12MB8664.namprd12.prod.outlook.com (2603:10b6:303:23c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Fri, 23 Oct
 2026 06:53:44 +0000
Received: from CO1PEPF00012E63.namprd05.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::9) by SJ0PR13CA0220.outlook.office365.com
 (2603:10b6:a03:2c1::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.3 via Frontend Transport; Fri, 23
 Oct 2026 06:53:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF00012E63.mail.protection.outlook.com (10.167.249.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Fri, 23 Oct 2026 06:53:43 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 23 Oct
 2026 01:53:43 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Fri, 23 Oct 2026 01:53:38 -0500
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
Subject: [PATCH v3 04/13] ASoC: amd: acp: log ASOC_SDW_ACP_DMIC1 quirk in SOF SoundWire machine driver
Date: Fri, 23 Oct 2026 12:20:40 +0530
Message-ID: <20261023065216.3473883-5-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E63:EE_|MW6PR12MB8664:EE_
X-MS-Office365-Filtering-Correlation-Id: 26cd8fcd-6cb4-4ea6-85bf-08df30d26121
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|36860700016|23010399003|82310400026|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	YSICwQH0cJiGLYHEMCnBKL9M2K0E4UBkPAnqGJGRL1Pg8gXYDen8ORKYYSC92wjLyrFU6SakVEqqDBoVjnOBH3fF/4JLdcxcsCPpz4n+Cn8TKxT+0X18suke2riEvkf7LXWjft6bZje0VJFRBClMueGUWt2IEwyjauS416wmaji2A+QAXF5wqc+dyvIlHH112psge2Do6jbm+fAaS7J6EAaS5rsIdEIClHoewOYy2eM+0eCp+jL+cqhpCnJ0fycTJrdI2Zp0qRAJhcCCazxuRUIEc5lV/u97H+T+LDrxtUG4rwEXi1vXvpMlMRSXJ5ygll9cRWSWIhnd6U7l9cnsOTH3lScQuR4LvR31k48gQ0v7HQAbRB28vrHUW0cQhq3/gPHUoIUiNe529kOt2Rd3k6YlTzsyHbGWHvdIl9lUSrWsXQxWxyObL+PsRJ/doZEamkMjzfofz84jaMIlmQJNKNWAZjQmuaRvutfhRQEE2Sk4E+iUWz16Xp2N32efklyvhhF7kGp40XPjSkFf2TfXD6bHcslDwEIBPivQK1IIF3wa+eha9qri49+X7qx3LLW9BCwu9NqpBfkBJqxchNvWsOxjMI7U+AWwYR2suP9RQPF0CmfQn28wasaXqZT2MB6vVDWAOP1vMlkIIfb9jBGS5FNIO4iSBbZyBd5hyb1w4qCEAVdwUlTvUSsw9nVvw5lj2IhDQLrqqStuA6bvNCYE+Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(36860700016)(23010399003)(82310400026)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jBLoqhKIsvoHaAnc2XY1KupfTZMxXkMabKDiiW5Lq47leVtysoUydV5Rp2WvCICM2dIiAeJLhfSKGII9KfknpZm5CswNbWihKBFHNdG5NgwR3xNWnXVZaxqiRQGQoPsTibdz/41T1cJ5dacLlv8YInLaEGmXPI489Mu3/Id36mN9Wm3net08awLbkBTzFJHxXad0vzZANSrS0heZaxq7LsvjzWaNAo2SJd2Yas6yrLX2rDy5iMV2OEKtrTAIaTcZwj5DrCYwYlRbi5DG3rUU1yRAr6hW+eIEYDr7TxYFN+jvK97Vlg9zvdqPF3jh4WN5NkwmxKruSMay6UBGfQJvhMqm7v0H+X7taTDXvfJf8lsMQjQsAyfHGVU5eVSUZSC3jeepx0s66ao7ArEYWvHHN5r1crdU3i16aE9iydCqanc9VYaapx6GIgKldnoMXmiq
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 06:53:43.9404
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26cd8fcd-6cb4-4ea6-85bf-08df30d26121
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E63.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8664

Add ASOC_SDW_ACP_DMIC1 to log_quirks() so the active PDM controller
selection is visible in boot-time diagnostics alongside the other
ACP quirk bits.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-sdw-sof-mach.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
index afc5ac679ce37..40df873ec024e 100644
--- a/sound/soc/amd/acp/acp-sdw-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c
@@ -28,6 +28,8 @@ static void log_quirks(struct device *dev)
 			SOC_JACK_JDSRC(sof_sdw_quirk));
 	if (sof_sdw_quirk & ASOC_SDW_ACP_DMIC)
 		dev_dbg(dev, "quirk SOC_SDW_ACP_DMIC enabled\n");
+	if (sof_sdw_quirk & ASOC_SDW_ACP_DMIC1)
+		dev_dbg(dev, "quirk ASOC_SDW_ACP_DMIC1 enabled\n");
 }
 
 static int sof_sdw_quirk_cb(const struct dmi_system_id *id)
-- 
2.48.1

