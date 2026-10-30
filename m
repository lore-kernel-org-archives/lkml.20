Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793353733;
	b=S3bfthO1e9v0BcrEPgBz3aHvv2txCd+cfoISgtfsJL7Jv117EW6cvbsQ1fmpzabnZXhn
	 qhAINIyrb84zCGm4sKj0GF71c6un9E0qOYIamznVvGAivr4EDAjM6d5Yqi9x2BOISOKUj
	 HByFIXlxSJgn5jw9bWObhkjrR0FhyI8yMrY1m5vusm2bTPBAzqcP/JrEFVPKZXaJTV3sB
	 y/z+VQ2yHOgncTN3Kxux2cziBcsIo1tu4VUpjIY/Z6HHZxayexTH3m3XVb3Bg8Lcj/q25
	 X5St1mtcTv7qEbGAoxCS12WUxwBMFD93BHkLnk8zd7sfaKBwVHVNMo9yVseILVHpRiw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353733;
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
	bh=5oGfN1Z+lIEKk9SA9PSAYfaOAVrb1Rhf2dgYXDWELc4=;
	b=X91Q2bT4QaUPCbHSApbBdD+t7ZJYgwM/7wr+dbMaqeDkl0n4SYDlKeiQovsPwOdTGyiX
	 xosoNqd3cyvsBOC3iYr81cQmLugmd62IxAE/hiMVgWpDQicfyZfPrtrXKnWTxc7nwlUbd
	 AYmra/VdPKE/26CSGvEPL9ubwJ2zGDp78X/9t9HSRs68/zGD6h2HflTGg21nRy/H11To4
	 zVyic15JugPXB8EXHlTgTYN3UJgbCERwsFgGXfhb1ApZnsZqMejxTMcBZNt0cvQDl17QR
	 r/mzybeDhRRH+8dMpWEfvyO/A8xBLI3+TZSQiKMMBwtOU+G8Db2bREeu9f3BhVB0V4Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=waw8CUjt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.19
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010019.outbound.protection.outlook.com [40.93.198.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D00606A336;
	Fri, 30 Oct 2026 09:48:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84D00606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=waw8CUjt
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L6zX535vWxua38y+1DA9LvJ6IqrHNmyL2rQrmPW9ABEkJyIeFiYUOuxoA+PD5U4vH9KG2iMbQRx2OkFlrBizB1MwYzWX2xV1bq7isK0DvK01innPovxnyAG63oE8PXS/G1uYNOdtEP699zavVlNRHcRCjwpjLjbjiVE8Fp0LEjMoC4IWkmZ6eP/GHZOdsFdNoXtwlmoi0zIGVwwkLxC0bVxhaZ7Yg7dLdtKIW1w4ofHRIIPYtunLj5ex37f31T+GLqSqisD8AIgV9RNFoXF2kWgWKb0mVdiK0V9YrOuU2a3RWcXL41Wxsncjxt57IjPW8IffAdDrMW7C3F7xM8xZ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5oGfN1Z+lIEKk9SA9PSAYfaOAVrb1Rhf2dgYXDWELc4=;
 b=c8aZmdVdZIdGoCX5HAaWCPUJPYnKjSuVv2Nf7Qx9sOsDojRJinOwQqhkKiAvfhEgwv2LgdpRIPox1Din63XO2YBzOeleakyVgGPL0em7DlfRQBo9RCvdMUv3XwqoKfnaCjUAc1LixtWyemQ1takZ84S+VkTTBvUWbrA+3cHUPCzhjb4yzj5hfAXVo6Fuh8KbAgZUYljHW/8yY3hAPI3ma/z4SuiPB+KxhgwX8z4EyOHJKHhuF8G7wzwo6ICQFw7KvKyopDN0sxX/zw0pNl/LcTv0qWzFAKSSiOCeWPOC7KVjaASxttfFKpdVUdQVwS7E0rDGAdq/2x11md2pxdsTkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5oGfN1Z+lIEKk9SA9PSAYfaOAVrb1Rhf2dgYXDWELc4=;
 b=waw8CUjtgd+BMhr/wX653g2Nv8WNRn7SGtQwDJvd4lZ7v7wlY1aUX1WQn8eznItMLYm2EbdDi2n+XcS3UiRdiF8MW74rRRF12+sbf0eGIsKyKK2JbG7jAC3dcs2DWbYtBqAzDS8IwHjZBgGL+0+1L/VeCxfhihOHY7fs1R+HWRM=
Received: from PH7P220CA0006.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:326::12)
 by MN0PR12MB6318.namprd12.prod.outlook.com (2603:10b6:208:3c1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Fri, 30 Oct
 2026 09:48:47 +0000
Received: from SJ1PEPF000037BB.namprd05.prod.outlook.com
 (2603:10b6:510:326:cafe::97) by PH7P220CA0006.outlook.office365.com
 (2603:10b6:510:326::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Fri,
 30 Oct 2026 09:48:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037BB.mail.protection.outlook.com (10.167.244.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Fri, 30 Oct 2026 09:48:46 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 30 Oct
 2026 04:48:46 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 30 Oct
 2026 04:48:45 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Fri, 30 Oct 2026 04:48:41 -0500
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
Subject: [PATCH v4 05/16] ASoC: amd: acp: add ACP7.B/7.F SoundWire DAI link support
Date: Fri, 30 Oct 2026 15:15:20 +0530
Message-ID: <20261030094714.1123396-6-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037BB:EE_|MN0PR12MB6318:EE_
X-MS-Office365-Filtering-Correlation-Id: c64f484d-e649-4761-e205-08df366afe4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|7416014|261026121527099003|11063799006|56012099006|261009223027099003|261022075727099003|261022105027099003|10067099003|261021121427099003|261026140227099003|6133799003|18002099003|22082099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	xO1lBntEXa1fJ0GubMIXkIssMJIfiItfktZk/8hlfU0DRovFZsPJq3zQ9qlVIL0Q/R2jZauEB2MbwtCAlivkrJtstjFBS+mMmf+n9/ES+hX2UK2RHXYRqTrXUI9cy/gyzbMy8U0rvUNCLMHi7jmi9JoXmBBvZBOPigA2DCKLUS6jHPyvtW0vbutPJIF2jexTHPkN/7HjMDYt4WPkNPQe3Teh6j0P1AjJ8GCDIlln+7tLOcWuwgNNwOepNLznee9ETr3250j/BuJWGv0Wp3hud/93AXW1Ya5wrBKcvugiqSyhECLHZFlRfL1zPnv8u2fsxuLG+cqkxKVSmjuk84OZJHuVZ64Dxy21r1+VncdXOJTU2NbApH9aITY82tavoy2cPIoBW1IVJPjAPsgbLNm+bUECaA82AhYAsf760CmLYcnbui9bJmSqc+d2K5V9VmZQOI0C5mtYzDxVhE/DAIOrl52dxYTDTEZOmbcYEsqlipJs4AFzaNzI6K1ygX77SidPLH+q36pPf1X7pOECIU26BqofzPnqg6MC8cJA51103LEsiA6Yg5YRvPyONQ9cgzDf4V3Mg6X6MlQ/OpE++mN3ZsQC6A1agCPGGVOe1p5vC5nqD2Y40DQ8GLFKGvHQQmDRAraAQ1pxTWtXXHrEjn3OdUqNgCRWMkOlOkZcrQ0JUSO8NKe46JeHgMTwLwlqAhPTlrxfsXOWGY2VA65BQ5cjsg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(7416014)(261026121527099003)(11063799006)(56012099006)(261009223027099003)(261022075727099003)(261022105027099003)(10067099003)(261021121427099003)(261026140227099003)(6133799003)(18002099003)(22082099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Ag/YCMAXm+CPhTvHp5sqVNHtrD4rQCm4EyuPsBgV4m7zCYiFkYoxQw/PKcEruneIeuu9CPZha+tZiPNAwy+dIhEfVyaQnga4+a3wHHoCYJEnKHjn8ClCRWX7G/LDCyINAGmvIZxx4Lowx28UhgDILFOM5ZRsA4mSs/+TPzaYm330csyNEWS2fbzcbDg9t7VuvzRpUylY/ltJSXZxhL7F+l4FlmbysW1AU9Njhp2C6gLwtZIG0GBfuz6PpT2T107ZIWYAPtv1KNX+8zjDy33L06a+Gk9fbfC82SXtE2xeotmYaiKY1w5BWSVrJvCgIXt8KIIK591GSxsBjhwC8y8YJifavtdVO9uPemsA9QXcj/6dqmW9T3wHSuBeFGyyanr4+zg7M/JPBbk4p1tgYv4reF/bwhGY4WQkeYKq6GcBK5ueImoNyyL4Nkg33KTENRI0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 09:48:46.9534
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c64f484d-e649-4761-e205-08df366afe4d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037BB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6318

Add CPU pin ID lookup and SoundWire DAI link support for ACP7.B/7.F
platforms with up to 4 SoundWire managers.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-sdw-mach-common.c | 48 +++++++++++++++++++++++++
 sound/soc/amd/acp/acp-sdw-sof-mach.c    |  7 ++++
 sound/soc/amd/acp/soc_amd_sdw_common.h  | 38 ++++++++++++++++++++
 3 files changed, 93 insertions(+)

diff --git a/sound/soc/amd/acp/acp-sdw-mach-common.c b/sound/soc/amd/acp/acp-sdw-mach-common.c
index e5f394dc2f4c..40184674dc80 100644
--- a/sound/soc/amd/acp/acp-sdw-mach-common.c
+++ b/sound/soc/amd/acp/acp-sdw-mach-common.c
@@ -93,6 +93,54 @@ int get_acp70_cpu_pin_id(u32 sdw_link_id, int be_id, int *cpu_pin_id, struct dev
 }
 EXPORT_SYMBOL_NS_GPL(get_acp70_cpu_pin_id, "SND_SOC_AMD_SDW_MACH");
 
+/*
+ * On ACP7x, each SoundWire data port has a dedicated DMA channel
+ * hardwired in hardware. This function selects only the ports required
+ * by the currently supported ACP7x machine topologies:
+ *   AUDIO0_TX (0)  - headset/jack playback
+ *   AUDIO4_TX (4)  - amplifier/speaker playback
+ *   AUDIO0_RX (11) - headset/jack capture
+ *   AUDIO4_RX (15) - amplifier/speaker capture (feedback)
+ *   AUDIO5_RX (16) - DMIC capture
+ * The remaining port IDs are defined to reflect the full hardware
+ * data port layout.
+ */
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
index 46c3815a777f..97b2e224492f 100644
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
index c98d70a0d6ce..c979adf4e978 100644
--- a/sound/soc/amd/acp/soc_amd_sdw_common.h
+++ b/sound/soc/amd/acp/soc_amd_sdw_common.h
@@ -33,6 +33,8 @@
 
 #define AMD_SDW0	0
 #define AMD_SDW1	1
+#define AMD_SDW2	2
+#define AMD_SDW3	3
 #define ACP63_SW0_AUDIO0_TX	0
 #define ACP63_SW0_AUDIO1_TX	1
 #define ACP63_SW0_AUDIO2_TX	2
@@ -54,6 +56,41 @@
 #define ACP70_SW_AUDIO1_RX	4
 #define ACP70_SW_AUDIO2_RX	5
 
+/*
+ * ACP7.B/7.F SoundWire CPU pin IDs.
+ *
+ * ACP7x hardware exposes 11 TX and 11 RX data ports per SoundWire
+ * instance, each with a dedicated DMA channel hardwired in hardware.
+ * The CPU pin IDs use a flat linear numbering shared across all four
+ * SoundWire links (SW0-SW3): TX ports are numbered 0-10 and RX ports
+ * are numbered 11-21. All port IDs are defined here to represent the
+ * ACP7x hardware data port layout. The ID numbering differs from
+ * ACP70 due to hardware differences between ACP70 and ACP7x.
+ */
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
+#define ACP7X_SW_AUDIO9_RX	20
+#define ACP7X_SW_AUDIO10_RX	21
+
 struct amd_mc_ctx {
 	unsigned int acp_rev;
 	unsigned int max_sdw_links;
@@ -61,5 +98,6 @@ struct amd_mc_ctx {
 
 int get_acp63_cpu_pin_id(u32 sdw_link_id, int be_id, int *cpu_pin_id, struct device *dev);
 int get_acp70_cpu_pin_id(u32 sdw_link_id, int be_id, int *cpu_pin_id, struct device *dev);
+int get_acp7x_cpu_pin_id(u32 sdw_link_id, int be_id, int *cpu_pin_id, struct device *dev);
 
 #endif
-- 
2.53.0

