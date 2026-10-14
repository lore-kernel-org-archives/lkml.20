Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010044.outbound.protection.outlook.com [52.101.56.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8084E36FE;
	Wed, 14 Oct 2026 10:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791973177; cv=fail; b=MofCA8t90JCiXzb91CvAd79+Sf+fsMbbgnCIhbukWShVa1dmaPpoCTdjSsst9wKJYZjqE36IrbKygZv4FqpXsrEmUsDWcBZwJzUsuJ16Gavr6YM+jDG33sul6H0/wA1CGCDU/XVflIzAlmVs/U9RDglnU0zVcqIS+Myn7izAn+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791973177; c=relaxed/simple;
	bh=Ors6GMHU943PsliLNDh73zg7DdXelEcTza9eNC7CsFI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fNNzo2L8cpEViNvzhGD8CxFDkdk3UaMOcFPePdPjCH2ZstEjqW7P0TO7EUEQWvngxiwKZkMsST5sE+pbfD/cdIZlfvJGKFpVGFzcS/2G/G76n8vM1Y9UPDhMQB4dtQQr/n4NO1rUPxjWUM1U2cYenulgb/XYWgAeEg9hNtzLUvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=VWl50PJs; arc=fail smtp.client-ip=52.101.56.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="VWl50PJs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QhDdou84DgOwtLzZzaRqk9FFm9Rwg8v0mvw9ypYKCaO+hWdSKX6qV7ddidxfguUM+49PXjVgz6wlaQnLDH0xoACkS7DFw2+fI4utZtWkxnWgMnaySSfFMWPb3I+SjIAr6MORl6D/wcmamgxGjTcGdXfWjKsRxLqe6+wzbfnsc1MLMHuHSK77iJeLpQAq7qAsGl6q5qrj8/2gB6G2cRcJSHnVm+NJWSj3xpGYLXUNG+tTPgUaAk36U5OvPaB7Mq/zXH329mFBNUltltr6S91wkQ6/qsZ/J5WuvXA5LB9l8rJUGeTOlcn555R14AfazumFlWq+qbxj9tbxbY4VGoGAAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oZMFXm1Um9WTsb8zueqR43RKc3ZkPKGXqmAa0x9KNCI=;
 b=PdAcSVEhy+ESirHvv/aUbmhDlyghQONFzpcDwsZiHefptstGMydem6CaoErrv5ehqBFCYkEITwCGPI8HKUEQOfGqkJZC/EEWMS6fUTl2usio5GyiBjqdV8Zyq7TZujopGmw5iXHdCENvWgmAJNVZD70Kc29BZWrk4Zi/h9yhXEeInM1OnC0O/Eszt03PVlF0aW30XhYgCE19S2sI+xV54u/CKBJsVBu3cAF77gT5Llnu1Yxy6saR3JTtxPcU4Dz5nkq9S2P+NPt1pJ7w8+WDxVmlz2ss6oQCx4tW5RL+OMo/jKDiqIjeNdRx2uXMabt97LGb14zeLLrfrz9QhvD+7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oZMFXm1Um9WTsb8zueqR43RKc3ZkPKGXqmAa0x9KNCI=;
 b=VWl50PJsS1RRN5OuPwDPx/cMKgtYPRgUI6TLC9qi00bFKf7qaQTZEf9y0wsMTsKONkIy2U+sJa1OfrPgC0eEhsaWbPFk+eDrHKsLOhE+pYK122QlTuivEGxEmfUK13oIHk4j1MV+Gb5EDrKLlx8ELTNfTdeYfpQzxNEY16PkZd4=
Received: from DS3P221CA0004.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:45e::11) by
 IA0PR12MB7652.namprd12.prod.outlook.com (2603:10b6:208:434::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.12; Wed, 14 Oct 2026 10:19:28 +0000
Received: from CY4PEPF000392DB.namprd03.prod.outlook.com
 (2603:10b6:8:45e:cafe::47) by DS3P221CA0004.outlook.office365.com
 (2603:10b6:8:45e::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Wed, 14
 Oct 2026 10:19:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF000392DB.mail.protection.outlook.com (10.167.247.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Wed, 14 Oct 2026 10:19:27 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 14 Oct
 2026 05:19:21 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Wed, 14 Oct 2026 05:19:16 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <yung-chuan.liao@linux.intel.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>,
	<Vijendar.Mukunda@amd.com>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<sound-open-firmware@alsa-project.org>
Subject: [PATCH 02/13] ASoC: amd: acp: add ACP7.B/7.F SoundWire DAI link support
Date: Wed, 14 Oct 2026 15:46:21 +0530
Message-ID: <20261014101817.1240200-3-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20261014101817.1240200-1-Vijendar.Mukunda@amd.com>
References: <20261014101817.1240200-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF000392DB:EE_|IA0PR12MB7652:EE_
X-MS-Office365-Filtering-Correlation-Id: a2cdc472-de28-4fad-6b93-08df29dca0c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|56012099006|260925022911599003|260925021911599003|260925021311599003|261009223027099003|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Si27v9mOpKrxcLQylOfYBJyK8O/6/1RfM9Bd5hto5RIvSA7juivxg+c6WZ9G71H1CsAHngme0nOVqABOTT2TogXq+yOkXgM++aYVzNmXGp1gb8zOq1U6P7meyYVxRRO5B1JnAT5r0j3AQbxY4isiPkCl/sHuq0TcU0zZe1WrWgaBGsZK3mW4ir6sM80q2u0GVWGfSrhhjhtbDzrF6N08nPwljhmGiJC5zOF68RfzH2BQQsPKBlgj6Gsds1efKPljXB6HWUzDnUcZGSflOHNdk8hH5ofwKuu9q9YMmX7oJMp2rJ24R+qMiLKIaZIoB4LHAZCC0nYtnDG67jmDQnIHBaIRTfmobG1CdVnRQ/sVSmGn08/pysarWOMYMjMUUjX1imDrFiiIXOGexxnQXAKqY844xC+rErDaM8XqPoZX/ZpV/8UAgcYNC1LEZcVzPDeNnfKNvG2nehXp1Vcf9+WMK6CjkyJ2p5FafYOdF7QokUgXWZnz2lY11Vyb4mvL0ARA+zQH5vHHPk+hqM60OIzx9oTe85SkMiq1CgUx1/6LGXCZc9qOv5HVV8t3RGyinQUOE1KGB+lvD8c6+lZDYXCaYJ1EuleSSviOAJ+NOuZv+oz3TIJgmbfjCnS65ux06jQrejw3OfkZr8vkragiR2AGuOuQwI2szAePFQ/ulOPzofWTX4lpDy1UQiXiyDi38a86juklxZL61ThvMJU9LZvPIg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(56012099006)(260925022911599003)(260925021911599003)(260925021311599003)(261009223027099003)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	C5+vn/xqJFaVvfbD3ckrnTZSfmrgDitY3wRnhfPbgKTSVFjGgiJyW0UGWsf2I27LDvI9kyG9XohlTcgkKO8nT3mRtqVpspjQjqrEYyvGwkOaP1StUiCVNz1Oofft8cpFZy933EfzBwGViU0BB9elnFqFciGPNs4X1hxA4hjZo1TdcdLZnELoCqJOBGd4lSzHZPPBwdjp/bn+h4bz9G0xP2/BbWri5buftogtAAl7uvIGppTBtT1PIFBegBDcV6AowcXHSDEuIym7KDTE1BSvJV/KYgL8wIbe7sX0UMj+DRgi9Yw1LpnRwrXrnx9j7hvePCEgGE/hJZe7i8NZ1SARAWRDPUBG8r1i2+bRItLryyZmT63uXbYhUJhXP5aJeHxapRLF/V7VevXAWxdpo8isgBwtIWS/3RJIACF4TD7Cg4c2tixQqXy5MbOFeAQtEZ+K
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 10:19:27.5910
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2cdc472-de28-4fad-6b93-08df29dca0c6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF000392DB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7652

Add CPU pin ID lookup and SoundWire DAI link support for ACP7.B/7.F
platforms with up to 4 SoundWire managers.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-sdw-mach-common.c | 36 +++++++++++++++++++++++++
 sound/soc/amd/acp/acp-sdw-sof-mach.c    |  7 +++++
 sound/soc/amd/acp/soc_amd_sdw_common.h  | 26 ++++++++++++++++++
 3 files changed, 69 insertions(+)

diff --git a/sound/soc/amd/acp/acp-sdw-mach-common.c b/sound/soc/amd/acp/acp-sdw-mach-common.c
index e5f394dc2f4c0..ae6d026d8e0fa 100644
--- a/sound/soc/amd/acp/acp-sdw-mach-common.c
+++ b/sound/soc/amd/acp/acp-sdw-mach-common.c
@@ -93,6 +93,42 @@ int get_acp70_cpu_pin_id(u32 sdw_link_id, int be_id, int *cpu_pin_id, struct dev
 }
 EXPORT_SYMBOL_NS_GPL(get_acp70_cpu_pin_id, "SND_SOC_AMD_SDW_MACH");
 
+int get_acp7x_cpu_pin_id(u32 sdw_link_id, int be_id, int *cpu_pin_id, struct device *dev)
+{
+	switch (sdw_link_id) {
+	case AMD_SDW0:
+	case AMD_SDW1:
+	case AMD_SDW2:
+	case AMD_SDW3:
+		switch (be_id) {
+		case SOC_SDW_JACK_OUT_DAI_ID:
+			*cpu_pin_id = ACP7X_SW_AUDIO0_TX;
+			break;
+		case SOC_SDW_JACK_IN_DAI_ID:
+			*cpu_pin_id = ACP7X_SW_AUDIO0_RX;
+			break;
+		case SOC_SDW_AMP_OUT_DAI_ID:
+			*cpu_pin_id = ACP7X_SW_AUDIO4_TX;
+			break;
+		case SOC_SDW_AMP_IN_DAI_ID:
+			*cpu_pin_id = ACP7X_SW_AUDIO4_RX;
+			break;
+		case SOC_SDW_DMIC_DAI_ID:
+			*cpu_pin_id = ACP7X_SW_AUDIO5_RX;
+			break;
+		default:
+			dev_err(dev, "Invalid be id:%d\n", be_id);
+			return -EINVAL;
+		}
+		break;
+	default:
+		return -EINVAL;
+	}
+	dev_dbg(dev, "sdw_link_id:%d, be_id:%d, cpu_pin_id:%d\n", sdw_link_id, be_id, *cpu_pin_id);
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(get_acp7x_cpu_pin_id, "SND_SOC_AMD_SDW_MACH");
+
 MODULE_DESCRIPTION("AMD SoundWire Common Machine driver");
 MODULE_AUTHOR("Vijendar Mukunda <Vijendar.Mukunda@amd.com>");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
index ad8a024321dfa..6855141293e34 100644
--- a/sound/soc/amd/acp/acp-sdw-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c
@@ -145,6 +145,13 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 			if (ret)
 				return ret;
 			break;
+		case ACP7B_PCI_REV:
+		case ACP7F_PCI_REV:
+			ret = get_acp7x_cpu_pin_id(ffs(sof_end->link_mask) - 1,
+						   *be_id, &cpu_pin_id, dev);
+			if (ret)
+				return ret;
+			break;
 		default:
 			return -EINVAL;
 		}
diff --git a/sound/soc/amd/acp/soc_amd_sdw_common.h b/sound/soc/amd/acp/soc_amd_sdw_common.h
index 5b9410eff56eb..9e4c86bed3003 100644
--- a/sound/soc/amd/acp/soc_amd_sdw_common.h
+++ b/sound/soc/amd/acp/soc_amd_sdw_common.h
@@ -34,6 +34,8 @@
 
 #define AMD_SDW0	0
 #define AMD_SDW1	1
+#define AMD_SDW2	2
+#define AMD_SDW3	3
 #define ACP63_SW0_AUDIO0_TX	0
 #define ACP63_SW0_AUDIO1_TX	1
 #define ACP63_SW0_AUDIO2_TX	2
@@ -55,6 +57,29 @@
 #define ACP70_SW_AUDIO1_RX	4
 #define ACP70_SW_AUDIO2_RX	5
 
+/* ACP7.B/7.F SoundWire CPU pin IDs */
+#define ACP7X_SW_AUDIO0_TX	0
+#define ACP7X_SW_AUDIO1_TX	1
+#define ACP7X_SW_AUDIO2_TX	2
+#define ACP7X_SW_AUDIO3_TX	3
+#define ACP7X_SW_AUDIO4_TX	4
+#define ACP7X_SW_AUDIO5_TX	5
+#define ACP7X_SW_AUDIO6_TX	6
+#define ACP7X_SW_AUDIO7_TX	7
+#define ACP7X_SW_AUDIO8_TX	8
+#define ACP7X_SW_AUDIO9_TX	9
+#define ACP7X_SW_AUDIO10_TX	10
+
+#define ACP7X_SW_AUDIO0_RX	11
+#define ACP7X_SW_AUDIO1_RX	12
+#define ACP7X_SW_AUDIO2_RX	13
+#define ACP7X_SW_AUDIO3_RX	14
+#define ACP7X_SW_AUDIO4_RX	15
+#define ACP7X_SW_AUDIO5_RX	16
+#define ACP7X_SW_AUDIO6_RX	17
+#define ACP7X_SW_AUDIO7_RX	18
+#define ACP7X_SW_AUDIO8_RX	19
+
 struct amd_mc_ctx {
 	unsigned int acp_rev;
 	unsigned int max_sdw_links;
@@ -62,5 +87,6 @@ struct amd_mc_ctx {
 
 int get_acp63_cpu_pin_id(u32 sdw_link_id, int be_id, int *cpu_pin_id, struct device *dev);
 int get_acp70_cpu_pin_id(u32 sdw_link_id, int be_id, int *cpu_pin_id, struct device *dev);
+int get_acp7x_cpu_pin_id(u32 sdw_link_id, int be_id, int *cpu_pin_id, struct device *dev);
 
 #endif
-- 
2.48.1

