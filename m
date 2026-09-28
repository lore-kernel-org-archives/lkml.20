Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A947C49BD8F;
	Mon, 28 Sep 2026 10:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790592989; cv=fail; b=kWn6ojIGjHNOdjNZxpZ3+bDxBWN5rSi/mQn9zNy/F5PX9g3L66IC2MqIXyyQlLp6jji3obJXPReB9bYsmjkD0Q2WcbtCSxX0zfjb0BwblLD0nVe99cAMWXXMBpQAP1mB9WBtUC8JNLAg2Hh6vTkAu4I8P1+KelGdF2qzbFCO23Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790592989; c=relaxed/simple;
	bh=M3ra2gbw5ZPq9kXtbeWiYpy+aszmDv5QBRYpUtmlmCE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FZUtieWG6PGr0zdEBS1qQBQOkZPlPzkg0odbSCKJGWU/cNTR0usX50rnYyvcoQQYSrWSZGSQLqHIEkXMYCBLu6m+JQlbyj8W4CvKfxwxe6w4UtPhV9cCPNg7zHMiWnf4QEZ9TdN3Y2uQe0f4PuXjzdMQ9SmerAabzIJJtnN1cm8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ZbekUy6i; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=EZsBC6sl; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ZbekUy6i";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="EZsBC6sl"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S828vd476848;
	Mon, 28 Sep 2026 05:56:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=CmUS/vCagmMScYfv
	/UWJ+VAbhBn6O/4SLVdSSpsnzXA=; b=ZbekUy6iVe4UXaQMr1Niyg7pdAc9mlpK
	8I46nOSwNWi2aEGpyp/RdQISHXCw8Yym1ToVMd3qdNVBiVEGREAvUc/P5q4grjGF
	7yXM6JKBgOLoM8E1zD7NgwAlQhEDW9XjCLQHr49Cyo0PDipgM5B5ke0duObpyRk9
	geI6IQ61vAwVmCutaTssoGuUJ+hSHOeza3HNBrcVw9rmcZOsNAIvbRRa758y3tkd
	ep22uYQY3Qa9DEbQfAZuA6u4x2UfHgb8QzDzmNKKUFU+PpmUAUKKDlp/n2q/9SEC
	cZINtSLhF1974EZ5HRYe3m2ha+WuqhRr1zuBoYDHRipC0J8sPidAkg==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021137.outbound.protection.outlook.com [40.107.208.137])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gxbf0hw9c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 05:56:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qTmb82Lt+tz8GjWS3H3OKobUXGZFsF/YxXn2u7OxxzDD7f95WhpWs2l+yFI4vws+P034xxzC4CwNdGqK1X9ve3NFVqwe4wnn+/bNXXxNVD5O5HYTXW3AElePzof0wVtw2Yw8Xp9rcjMPH4UwxxMUJ4Sq9s9vAgsD58nxj13Y3zVpRnL/K3sAN87FKZSMz9h+uNoLbDaPXLPHqlGEhFsbDYzBa0RXhRsLRR00fw5GnYtVLoJIJRLbcJKb9iFA847TgvZmbtZ/yiO/dv6FN59mozRSd6jOxjb4SKgt3ZiInygCrlrC3A6wYG+JyvrWVDLtdoms7ReGlExF66K3cujlrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CmUS/vCagmMScYfv/UWJ+VAbhBn6O/4SLVdSSpsnzXA=;
 b=oQ/d/9TbDNyOrMUCzEFr0uL3uf2ueWhpgrNUjKUQdoqIBJGaCYJJaK2XfMNX6ktgAq1RgUsv2oJ6YEvmHJxfDlfsNRkmSXN8WQWHq34OQ0galKqjBIu8pZ4pBaFUzGZf8nQi5etFGg7JOcOHsULGDIWJc3kmYDE7EI00KBPH2z17E4SOrb9um81uqIjHV8Tqclrt6ADIyDylL2gW7bNqGwkMo/M57XZ5wRB0CWV0rQpzlBZIKkVzG3WbSYwagQIQXtshA5wpwLdqFV55TWI1Oj7ZZ/KfhyqrLbrty1OLKJn68uUqMkqCultm7XEtRcizAwvELKuljLzJrsvf9RFoLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CmUS/vCagmMScYfv/UWJ+VAbhBn6O/4SLVdSSpsnzXA=;
 b=EZsBC6slk+FGa8I9GQajbzPk0+uVfFCYbcFMd0TCnxr6u2tmF+XcmxAJQqya8Haaqr2uvfHnc1Rxh+5A39bSNJxkKpqI/zJ66i8ToeE899K5grRR0exzAqbiFYZthfD02Cvaqi8ecQb8OeTqcC95nAZLxZL1Cwq1ng3PPa9SIbs=
Received: from CH5PR03CA0006.namprd03.prod.outlook.com (2603:10b6:610:1f1::7)
 by IA3PR19MB8592.namprd19.prod.outlook.com (2603:10b6:208:524::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 10:56:15 +0000
Received: from CH1PEPF0000AD7B.namprd04.prod.outlook.com
 (2603:10b6:610:1f1:cafe::ad) by CH5PR03CA0006.outlook.office365.com
 (2603:10b6:610:1f1::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 10:56:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000AD7B.mail.protection.outlook.com (10.167.244.58) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Mon, 28 Sep 2026 10:56:14 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 00506406540;
	Mon, 28 Sep 2026 10:56:14 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id E2F8482254B;
	Mon, 28 Sep 2026 10:56:13 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
        yung-chuan.liao@linux.intel.com, kai.vehmanen@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: Intel: Add quirk to block match table for Lenovo Yoga Slim 7
Date: Mon, 28 Sep 2026 11:56:10 +0100
Message-ID: <20260928105610.242687-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7B:EE_|IA3PR19MB8592:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 97509c02-27ef-4f90-b6cf-08df1d4f1de7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|376014|36860700016|23010399003|30052699003|10067099003|18096099006|11063799006|56012099006|20046099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	ygbZiMU0b0FdfatuS4gvmPbl/rGanXriEdTou8hoP+vGxRQO5FdU83QD0fZBSg/HcuCg/n7x+dESRw0TMPT2uuMZi33PCheUeJV492IMhOI0aN7lYJq+nQUYyJ5jJPg5gH2Dfo2TrsQTKQ3+DmLJisdIVMSjNF5M0VjzfSuT4JmVD/8lEiLMeixbOeKyNph3INIkAAyXlXj/+Z7eYefbb+KVeqFs+M0SJt1R0ztI4ffuSXWysGII5klPtOaqK+S4pJ9NhfohqtINU/9xWol1aJNbSSDQlUsGj5GaK32MREAYQ5B8Mzy6mGteCEb+bbWI315ep9B94pwCYFTroVDxiIIosLhebJYNGCyYq/TU5iatnoB41JneB6/eJbNR9fEADeUKhfTUBfo0qRTNKcyV5wqhGBaZMZ8M6jqK166mNep+Sicndvgg3zzP7aCK46bFlEhGCYdnkg2GQ89XhDX+v+63M5qMiLJKhgxql5hPSzB+dBztalvFCm2n2cRgf2xlcy1n1hR6UVWLV7o+e6BCQ18gpLGgxweZgIDdNVbRQ0pXybXWgpgGSsGZtoG/V0zy54H4gbcN06JAZOfx5eDVdQhLkd8FsyyoPcP5XXi7P7nn1CEzXkNKXIECr/7xOiIGYB8vyexjVid8xRQAAb2sFfDfIcWc1wrIUQUsNL7YOvoyPlCPSgt/nLWJ4YqY2YRL9K9MxeSzvX6y7KKPUSayFg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(36860700016)(23010399003)(30052699003)(10067099003)(18096099006)(11063799006)(56012099006)(20046099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YNQQtUMP0aljaEnKZ5LLr601iABtAOi0t3B8TyCBrCvsD+KFVU7iDTyZVSPCxsubxCSJI2idTdcHRzmbOInqmoSZBa2yw2jG/Wl+q6/wpgRRYu9bXAnz3JcelzEDTzN138CpewbJfM9Vvd6SquD0m2aZvIytUzDrHK/4MUnJ6JkX4BOcVXSgozI5xm7hjbFckNrFi9l7UYgzRPq41SeLyUmUYHBICVL8LKlydSny6Mtv/xBMcdZw4FF4WHUENzNPIhg7CDPESnvCKtmwM/tqYnidFTdAhjMySfrS6F7kW3hyU/86UJLgJfZ3gKAq9sYuKwFVo4QvteVC69yqGyQ/UOvCGyy6UzkPyUvRmrj5RPtlRe9cJwchEfdNlAff4o2zsjo/+3rgkKoD8jLCZyKVMJ8hRMhivY6gT9ai9KrRVTC9+0y2RNxAJQ6OW64uT7Kb
X-Exchange-RoutingPolicyChecked:
	pwCBf65Vbv3a7yfgI59VXMXxF47N6gI2SKsd5lKPaln7J6jQ5CPVDaSISC8NE2PES9Gy79S7NOKex21/2wR/ptJDGSCWHL0LNgp/bVXKgUoZ35xD6ADzyJioCgbg+OFLxnYsjwM25xwV3v4sjfX+zs+/oHcoV8CF9Fxg0iDOEwRzMc4FHn5zUDQNmVu2sHY7fnnG3Snp7EuBzPr32/BJ6LtkTOT6mSQxoUjtHYhdLUUck4sp7juzPz5PvNk9UQ8Fqw/04J45NPljMj2cv/gv01W98VaIoT9Mo5Jf8cY/0D9KDDUR9l0yaYUNWGbY39rasW4aPIRNbTBvGjDYRgzw+w==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 10:56:14.8889
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97509c02-27ef-4f90-b6cf-08df1d4f1de7
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000AD7B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR19MB8592
X-Authority-Analysis: v=2.4 cv=GvLXaU1C c=1 sm=1 tr=0 ts=6aba47d3 cx=c_pps
 a=hxVrj3tyWKw8/06b28h1JA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=OZjMf9TxNLP_mbAc3MwA:9
X-Proofpoint-GUID: ZunsuU1SAqYMTslr9fwBUpFu3B4KXeqS
X-Proofpoint-ORIG-GUID: ZunsuU1SAqYMTslr9fwBUpFu3B4KXeqS
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0MyBTYWx0ZWRfX9Q9n+n+u2ShW
 Hl4aDJXr3KIxKAKS21uCWY7us4yZwumIQ+COvNf3/GXfGccIXY/MtESJ5+9U6/OQjf4vAsbJ5to
 sBSZob6IofOIKo9+ieUO4BPCAVBIyWE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0MyBTYWx0ZWRfXxO3nfrYVFOt2
 qCof77uPN5pyBh/3p//HTar7cT8grfh3lCqirNSNBuztVOgGpIG2xjofEMothKID5QFzSB/w6xj
 NWC54vE8Cn5QW5MS1AEQpS+ZdykTocpMsRmMynGvKyGqXpQ5Aq/Z2tQVvJQwl3+02uo2RV2RBsk
 zGVUy1sbZzZQiMoFjeE/N3pxC8N84T84VLJ9/nK8bFXHRTulnzF8ARxjCCfkeAtjf8WI780CC4o
 gAmXs8n+dlQ4++3LEbILfdrLFJRULuvzfb8d9/x84P6RAHt2wJqOWkM39AmT3O0g/c7/h+X/MZK
 gVspzjAnj/rzumTSwxT5cPOFxIjcA+0BLs/bUAwzxq8wwp/kIGuc9J6h6d77cwZmzfmZ8Gr3skG
 ADHFHq+9GtB3gxGF38fam6rHWg4GTD0dZGkBF6YsSYZpuXERmlC3eU57Vc3NLK/PGPk7Ns92xTS
 fkIKDFGziQRTJL7NN8w==
X-Proofpoint-Spam-Reason: safe

A variant of the Lenovo Yoga Slim 7 exists on Lunar Lake that
doesn't have a physical jack socket. Cirrus codecs still use match
tables on LNL but the match table makes no distinction between a system
with or without a jack. This leads to the system failing probe as the
jack in the topology file is not matched by a DAI link as the machine
driver is constructed.

Add a new quirk to block using match tables for specific devices, and
rely on function topologies which can handle this difference seamlessly.
This is slightly preferred over moving everything to function topologies
due to the lower chance of causing regressions on other systems.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 .../soc/intel/common/soc-acpi-intel-lnl-match.c  |  1 +
 .../intel/common/soc-acpi-intel-sdca-quirks.c    | 16 ++++++++++++++++
 .../intel/common/soc-acpi-intel-sdca-quirks.h    |  1 +
 3 files changed, 18 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
index f9c47cc1e0c78..cbf79eb2ec00b 100644
--- a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
@@ -802,6 +802,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_lnl_sdw_machines[] = {
 		.links = lnl_cs42l43_l0,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-lnl-cs42l43-l0.tplg",
+		.machine_check = snd_soc_acpi_intel_force_function_topology,
 		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
 	{
diff --git a/sound/soc/intel/common/soc-acpi-intel-sdca-quirks.c b/sound/soc/intel/common/soc-acpi-intel-sdca-quirks.c
index 9fdeb6ad96ac2..e62ef81214ffe 100644
--- a/sound/soc/intel/common/soc-acpi-intel-sdca-quirks.c
+++ b/sound/soc/intel/common/soc-acpi-intel-sdca-quirks.c
@@ -53,6 +53,22 @@ bool snd_soc_acpi_intel_no_function_topology(void *arg)
 }
 EXPORT_SYMBOL_NS(snd_soc_acpi_intel_no_function_topology, "SND_SOC_ACPI_INTEL_SDCA_QUIRKS");
 
+static const struct dmi_system_id force_function_topology_quirk_table[] = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83R0"),
+		},
+	},
+	{}
+};
+
+bool snd_soc_acpi_intel_force_function_topology(void *arg)
+{
+	return !dmi_check_system(force_function_topology_quirk_table);
+}
+EXPORT_SYMBOL_NS(snd_soc_acpi_intel_force_function_topology, "SND_SOC_ACPI_INTEL_SDCA_QUIRKS");
+
 bool snd_soc_acpi_intel_rt712_vb_no_function_topology(void *arg)
 {
 	return snd_soc_acpi_intel_sdca_is_device_rt712_vb(arg) &&
diff --git a/sound/soc/intel/common/soc-acpi-intel-sdca-quirks.h b/sound/soc/intel/common/soc-acpi-intel-sdca-quirks.h
index 60b665ab5924a..10179004c86a3 100644
--- a/sound/soc/intel/common/soc-acpi-intel-sdca-quirks.h
+++ b/sound/soc/intel/common/soc-acpi-intel-sdca-quirks.h
@@ -11,6 +11,7 @@
 
 bool snd_soc_acpi_intel_sdca_is_device_rt712_vb(void *arg);
 bool snd_soc_acpi_intel_no_function_topology(void *arg);
+bool snd_soc_acpi_intel_force_function_topology(void *arg);
 bool snd_soc_acpi_intel_rt712_vb_no_function_topology(void *arg);
 
 #endif
-- 
2.47.3

