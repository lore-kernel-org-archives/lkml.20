Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793353781;
	b=TTCmBLeG5fRHtoIgA0+aXnhQ4D6U9zan7YF8PUJUgamG+GBhn09dcU+99v2BVPDiRVz/
	 rvnmkaWL0oPRsjviKf484pcqC0MaNtPHZPrFA/xpWV2W4MXb1KdIDTd0CQ1jepenV9pAV
	 zOggFmVaijOuQQtAth4stKN5XtjENOflY6pRe0eyjcwf0yeIPAAJbxnQb1LUqpieXiyJf
	 mFmWYklwCYlfVM+NhcErwvTQX+LDy/sVARNwcovuDd50nGKmDaAYE77WxzS4bcd6MD8gr
	 LR+mCyQHicecLLZ+mKJegJHSJKp81NIis5xkqT4BM3VUsEuOTc8h6MPmyHyzPF2drDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353781;
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
	bh=/xMaSXnUDXY4s0nohYeuloUAxCUPPKx6E0UCYrE4GnM=;
	b=t0oXcPUJLVHOVLNqPbFVT4OWk0p7yjEk60sYjqNpGry4CWEp+b+ofDfWkWwojk2F8bVp
	 XC3Gw5hT/gY2LaTHY7BHOvyOPuRf7Srtay+qem0GsuLZIFuEfPSb5An4W2EasaA865Sxe
	 fxMxYD/ylTCVJnxifXGKgGZqfHjTJrnfaKe1BAA0RCqy/C35IBGWkMqA0P1nP+1AkSLGB
	 wr7y1wa4zrHX7KjNQCyKzGCDotT9FSfCudKuG9U4haIRJbV5j7bxZg+JX1gWFZmDUanU0
	 VVNdi1roKvGbCMn4Rvm0tLfpue3WQA0gMrqihY/1iLbA5wQpZhobjlgcbNDHjX4mPrg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=jQBSnDFz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.47
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013047.outbound.protection.outlook.com [40.93.201.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDEF606A31C;
	Fri, 30 Oct 2026 09:49:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABDEF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=jQBSnDFz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gz3shPxH9kueF6xfsNOXijA4CJ2OQ04eShT2Xs/p2uMX6+ceibEghGRv5zjL8ppJttOCA08q13OIjDa1IJ1D5R7WY/w2FMKzfdInFBf6lZSFgTV6XivR4z5JqtbSpFGOiLHBuWnEGc3qnuVtDdwbSr05TOOYDxeAcp1M6BVLcJ2M9CFVZNi9TQ7mPyeRQlICbNots/XQpH6I0VN3FfTSnyeoyqFQ6zaFtrhq6hWqd44wQxfeUXvjTB0EfJFrG9cUeVjujfQHLpgz7bqZyNqRlStLYNCQCGFQN4KGLzWCoo0MtAjreDk2Zqyn1iI6XKgL3WYj6/kR0fdRMemGEpuUOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/xMaSXnUDXY4s0nohYeuloUAxCUPPKx6E0UCYrE4GnM=;
 b=FNoWwCLqFRfD0hTxlhBVKrJ+Aazht4Pmkw5ipMLKa4gQO82Dt4OkFu6Gv/Z6aoL3MsYtPh2rlVO8rjj1J92z5OHXeflQ5sv3lRDDt0JLckMoP0CifUJABBJ60Os+/I6X6bAiRbfl/t1Gm9+jqQxhT1/E7NILIR6mesvIam6SVzHxKEB3Q0UUMQIUdH56n62f70cwadTgquuJH2v08mYDS7zvhccQ+JvXmcmCZFO+usBlWtb5vtdGxNlmDxZVLz7qbev1IfJc0EzwUKmyRS02lxvJzrOJdiay75TA+B5McRBSA8MkPbzm66WOoRsO6JBCwXNsPCDg7CCT1+y5Mvb/gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/xMaSXnUDXY4s0nohYeuloUAxCUPPKx6E0UCYrE4GnM=;
 b=jQBSnDFz160+xLMyEOw4RX+4c5k6ZI4NyQBUABOnbMxbOdfeQ8okmsFroO2KrM43W+NKddTnObnAPZqrVblq3v/q8rMzeoMqXGJpFIOHm2JMHKlxdyUPbCst3pzA1ydoinIhXwfFv6ltNTULRROuexIudmAK01cj1yJz8XN9F2s=
Received: from CH0PR04CA0048.namprd04.prod.outlook.com (2603:10b6:610:77::23)
 by CH3PR12MB8512.namprd12.prod.outlook.com (2603:10b6:610:158::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 09:49:34 +0000
Received: from BN7PEPF000000A7.namprd05.prod.outlook.com
 (2603:10b6:610:77:cafe::ae) by CH0PR04CA0048.outlook.office365.com
 (2603:10b6:610:77::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.9 via Frontend Transport; Fri, 30
 Oct 2026 09:49:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN7PEPF000000A7.mail.protection.outlook.com (10.167.245.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Fri, 30 Oct 2026 09:49:34 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 30 Oct
 2026 04:49:34 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Fri, 30 Oct 2026 04:49:29 -0500
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
Subject: [PATCH v4 15/16] ASoC: amd: acp: add SoundWire machine table for ACP7.B platform
Date: Fri, 30 Oct 2026 15:15:30 +0530
Message-ID: <20261030094714.1123396-16-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A7:EE_|CH3PR12MB8512:EE_
X-MS-Office365-Filtering-Correlation-Id: b87b921d-b377-4e58-d1e1-08df366b1ab5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|82310400026|36860700016|11063799006|56012099006|261009223027099003|261026121527099003|261021121427099003|261022075727099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	gL+KrWYiabxaUfAT/+I7WL3LIXlCYfVk/rbaC2FI3yLKpBWGJtMNWGwk7//pjsfGvaeJelyAs+kWEtS9OWoXLOWr1mZ+8sONIxR88PedOw0VTnvSAZA462h5td2lVPFLA70ych3d4xFNrHMSeL768l+7P6o0MAMkc0erDoYXqC4AZJqMTl0Ly1UxGWyYGljUmz7cT2yb1mBjyzQp3mTY20XZpqXFp9pM4gzo9NsG3aActos49A+hsROqdra/AsaSsZuTRGAzEE0B5AgrhhZzZAQCQrTfon65LZv/cuZ2oOaCoIBNS4wrfC2MA8XNppPJbUM/UoPaBX+e1EH6jyPt5TbINgCAMlQj1FKKmzPchyYFHkirNvxIXJUV/faKJ4R3Qf3N8OR9VZq7V4MXkSocRLFPHnFujQ0EKbXJfAj9A6n7D5Zq+2FtEjRCxGFQQB+mwiW8EKyVTxgB2TTH5j4MrZp2TZqaLQYYcYjIrieW4uhhHbH0AEgoy392R2zT4Ebw1QMuv1e0PLk83jwB4u7FgCEQ1gNBWCnMNE9h9epeoXsB681HksR6KpWWrNNtG4JFlAyH5EdZtNaxWtspTC9wllcl+y6cNzxn/nSkeRoID6a3dr2dbB3Y/T3h+5+aC/m+HW+JVotxR34wgqC/SVN3gj7lwqD/nKihEuZIM8nJF/1keyAHMHxsgOL8ZFFgyuqn8CePyIxDD91FQRVhAITc1A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(82310400026)(36860700016)(11063799006)(56012099006)(261009223027099003)(261026121527099003)(261021121427099003)(261022075727099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	X3adzbsj5+1KyDf0NqQxzHUYWM1Pw/ETnarRxNZH9T9OWRAwLaiRObJLTAizFxqJGa0pT1GFXDzKqh1dPqcq5ve5nIk/VgoylElJ70cd6pzkMpTd1VyJGfeT/KF/UjdzVhLHENXE5Dw0HqxwVqTP13zAqas2mMsZU+s9Pc+hhSLtQVbTHRCkVNhUXepaVjEDrkC3ueI+gnva5oqh7e+lzPlMmCRHSv/oD7MHaTICa0nDIxibVyBfYiW3lJZq4AcMWfNPJk+9cNvmQ72bW3WWanhdfGdJhn7I/GUPWTQh8FsRR3g7yErF47VZxHCeYAHhOK7HQ+Ruyv1Ph6asa7CzAxBSH7igkZw5YD5dyumLtISnr6ry6SGlNhuhAQ7cJcJGFSf/aq265F0CkCuUwAX6QYlU09XI3LbczUwEhFZxob+w8/bSSOhZHhowYXG3JYX1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 09:49:34.7003
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b87b921d-b377-4e58-d1e1-08df366b1ab5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000A7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8512

Add snd_soc_acpi_amd_acp7b_sof_sdw_machines with one entry for the
RT721 (L0: jack + DMIC) + RT1320 (L3: speaker) SoundWire configuration
on ACP7.B. Export the table for use by the SOF descriptor.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/amd-acp7x-acpi-match.c | 12 ++++++++++++
 sound/soc/amd/mach-config.h              |  1 +
 2 files changed, 13 insertions(+)

diff --git a/sound/soc/amd/acp/amd-acp7x-acpi-match.c b/sound/soc/amd/acp/amd-acp7x-acpi-match.c
index 2f5e060ec79b..830c59966a35 100644
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
index 321af4682fd3..09ea9f525955 100644
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
2.53.0

