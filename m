Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792738423;
	b=E3Qag2G8c5luLxzqHF5cY+Pd+VIVEqhiZ0ZTMkU0y9hi1ukw+2iAfPKI5x3ADM92gchY
	 Z5RE7zArcQw7nliSw8H6iBfEEBkAWwPtiQm+Mm0gAkSFQN+7fZn/pc1XCYdxfyMIMZ4Rt
	 4u6GsLBnuYSGGgLH84vm378ZnBliSFKtZRlLOZ/Ye02hAAI2Wd78bYwf2mqu+ols1pkPt
	 ZUshrqxPTJR5bfXC8PSoIPibGYkDx/5aptBt4OBsfcXP627hmWp3u0gcbWyYBln6jJkYU
	 x5vSB8HpxSzx8hDFZcYWEy8ePA9mrQbR/DuwfgJ0QuhwunjBxDB4Agyy8llcruzYyRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738423;
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
	bh=oZMFXm1Um9WTsb8zueqR43RKc3ZkPKGXqmAa0x9KNCI=;
	b=GmSikACm/MBeZtn/b9aT3S/oeCwBqplIcHBK8HGLcP0FsHTkAHP9c/WuBip6UgJNRmpb
	 JWNZ9hGJS9+AXrHmQwJ2BeHYP3T8QOmv21ijddBB7EOIETC/l4z3t2/8vDXvVWnsBMJhL
	 AtVfZtk3VY5XoEzVXeq+8gsYm1pd+eaHPYuzTfvbMI8d2iIxgus/STuRkPBHNoPdtTbYn
	 pOtUU/5Q9QY8FtvEIs9ibkBonehwvpzHrGPP/aq7h6aWBxRKsO4yuzqPC59iJrSUjRgaI
	 UcVTVqdMz6DEVP2+BxHFivTKjolWv1CZsbPqb4o5eZJHzC8c+axNlhnQHX9it/bMtCQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=KXuw3EBf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.7
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012007.outbound.protection.outlook.com [40.107.200.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F055D606A334;
	Fri, 23 Oct 2026 06:53:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F055D606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=KXuw3EBf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vssE2/AfIbjQ8A5tjg4OXB8J65o4A0ba5R3RSpv62Ys3jqozXnlCvYbghFeTYQDslv8Gq4KY6IfgnYoIo+ZBtqCpR/d60zJZs74EZloLaTXPMX3TdwwtJBArozqlryv/ynT3zelvNBYBohrrjw94Dp4I09oJvx4p4LlZW2HuMmDgwJ8CW65lvoSAUW6Fl315NeQq+c+y6PVMeHRkIY9ByWZ4BMLi3IPMCmlSNVCAvx82iMYZyIG52dcbCabvneH2ZyxGyVpU/sYBYJ59C8dr2cY/XIL20REfDOkQ3gJIJo/qfPeZgiRduLTIXAxd4gxV480qdk3ii/MdmoFCKLH+kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oZMFXm1Um9WTsb8zueqR43RKc3ZkPKGXqmAa0x9KNCI=;
 b=d37sLMISFRA8Y7jGl/JdBbiwR9j7GSrGj+/UL0jWvCAWEysrvhTnRiFlM/+g0DtRXykO9ph8p2qUJ7SiERvRNoCmqAwL7tjIHhwxwm/lC/i76wcofrGAro/BBNhzDtmKP2YunA1aBt0bXL8/u4uQ+XlhatAzScVKpvmGSIxDEpbbAVC31ag6EnE0CMODZ0cLWX+Cv3kj9FIkmk8THwRH/VFxBX+HKh49plHjLPq0Ywsjef+C/oQES/bosWTm/87POxDchea23yJXBvA4kOFQvq2QGFQ86GE2Ssal6ZEf8tQVqNKkWvAlH6Qc/2zx5H7ZzfFHe/zBgaTHK/+XlCNzhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oZMFXm1Um9WTsb8zueqR43RKc3ZkPKGXqmAa0x9KNCI=;
 b=KXuw3EBfwxUCGko2Bmr1shyw0SNRmvQYHvMEpCXZz9tRA8RtcnaJT2iAQJ8bhUCgLa4GNjYb1dnuXHOuoWV91Dv6oPPdofYy3sQ393XG5z8oOYSAXTtAObjIuJXXlH5Wdn3Cge9+hOn+UOG5mCW9wgTBtnmnRo4mFHMiHiP7bbM=
Received: from ROAP284CA0252.BRAP284.PROD.OUTLOOK.COM (2603:10d6:10:f3::12) by
 PH8PR12MB999273.namprd12.prod.outlook.com (2603:10b6:510:425::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 06:53:37 +0000
Received: from MN7PEPF0000014C.namprd04.prod.outlook.com
 (2603:10d6:10:f3:cafe::31) by ROAP284CA0252.outlook.office365.com
 (2603:10d6:10:f3::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.19 via Frontend Transport; Fri,
 23 Oct 2026 06:53:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN7PEPF0000014C.mail.protection.outlook.com (10.167.254.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Fri, 23 Oct 2026 06:53:36 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 23 Oct
 2026 01:53:33 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 23 Oct
 2026 01:53:33 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Fri, 23 Oct 2026 01:53:29 -0500
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
Subject: [PATCH v3 02/13] ASoC: amd: acp: add ACP7.B/7.F SoundWire DAI link support
Date: Fri, 23 Oct 2026 12:20:38 +0530
Message-ID: <20261023065216.3473883-3-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN7PEPF0000014C:EE_|PH8PR12MB999273:EE_
X-MS-Office365-Filtering-Correlation-Id: 72598d99-b3d0-4d08-ae5a-08df30d25cde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|23010399003|7416014|261022105027099003|261022075727099003|260925021911599003|260925021311599003|260925022911599003|56012099006|261009223027099003|11063799006|10067099003|22082099003|18002099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	UyQ7iJ9nWoxkSF16ZMq5Pame/yYHw69zZjIGt4pF+bTaBvtH0W7yv5nHHkECwRc/IFw9za7YOcKUs76rIWPjNnN6Je2Tv/0L9/fudN+tIyCccOM3ibelFF5R6cpGq5czxkOJungzzcTguVt3B4Xz1WWaAII+Z4jMOpNHY74aixRvG7IkOXq3bsAio6/gDVQ/XUnfrXmNrCZ+ParfM9fWOhsL76YjIoCCUy3nJI0Kkbd3Ij4376Rd0pLxaF20JWT/cshur2QbDhodNI6MqiImWU5ioWTGRvba35k7D9AEp1y4Ciki0OyBw5Z+YO+fju+VA1dbxJMlTsjCvEWM4mTb5AmGo9mkBoMkkaKkzBTXa0Q8yfypvbdz9rwNEUMvHB8H01v3HYpTg3jBP77PbhYpeEhK/K7oy74IZuStbU22eWlS/d2heWmJRrcCFX07+Fl1V9dUc8+9ipc5onngHdfFJn0P6vOVUW4S9tMnZxefj01NpDgktOalm6/niwziGcr7p5psh1wZnfB3rN8hPdu4tmOBjqzN3HiZB7t9/HBuvmXnkOzB3R5TA+3VuLpegALTpze47vpOs/3Gd4ollAtNe+OCiQaZFWS84Wu+D8ewl3lz4ssstgYu20hRImj13ZxFDEOKPLBs1BokWkMKj85WxRngU4T8D/xhqW6CoGXDSGeHB+ITa3d3q0JZrLpDTCPqOMuVQk8TcSWor+3I9/GokQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(23010399003)(7416014)(261022105027099003)(261022075727099003)(260925021911599003)(260925021311599003)(260925022911599003)(56012099006)(261009223027099003)(11063799006)(10067099003)(22082099003)(18002099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QK2tn10dzKi6BeQFLaxw2MI482W9eL2s3SwDaL0YryRlx2aNqcMhodqmyRPnUERAANYeRbHPkQal68CMXXh/beLvnKX+QZERUzyObuuRn3m6D8ECEQ9PAAiagGIIjnpCmhnV4atUi+t6y5Fkd2lt3iFg/A2kO6zdVTZZo1TWPz5Cdi4hz2lGB0klakJRmoNEIPP3p2pEgB6eqX+6J1gvHMKnZFXsvGRHe90vA7Ub9AStqSGkxHvhhCV8v213t7rYbVsgf370TuePKiqKzXfBTAVP4dmFgTlDIcJ5u9FDnexrgZl2JtsruPk36yV9IuEKfWUqcLaqjy9QmfWM6lUuTux+txPioeaHIcc5wPUX+ZMVw2qjVw4gZ4fiLxW0eNUN8wjPaUJkVfwQjBwtJxMBmegIgYonBH3Uifgp7RZMqUPagf4kXdWyw/rtBiCHUrKd
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 06:53:36.8823
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72598d99-b3d0-4d08-ae5a-08df30d25cde
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN7PEPF0000014C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB999273

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

