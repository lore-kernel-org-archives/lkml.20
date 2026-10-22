Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792649361;
	b=ePyUWcQtstlffDuRCto2SYvb6MzoRYP0GzVt18Nhvhb2IB5wbtFfpOERVLrweqQ878cV
	 fJ6dcHQrGcb+pGoGchVzezZVxT/Gi0Zhq4VHqzo4KNH656vKCLE+Cfqhi8D3dhZ2NT7/f
	 BoZtMTF0+Na9qgTrMQUwxprfHetO5IJmnlnuSEg5j+vthnHpbfjUdcVJRNni7fj5uaaG1
	 sQ10apq89BPdiIc7XvPGvLqSO5gl6ycPMRbNzkOL8uDUenC1ptJxTfl/z7FmM9QJqACW+
	 0VEQ56X1gScsUc/zB/GU6hLhT73fyunlamxHzRtVD7bNvQkBw3b8uJdFvHB5u8Gx46g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792649361;
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
	b=EPiuYg722Pn9WsOgCx5+S866ueaT8a0MscXOS+u7/DAvttwwVyZzkX3JWSz5PQZW2Egc
	 mCu0EHbb7TsU41fFv8d87xcZAAueeAlLo6f8iioIr9dkO61JLsONe5wvpHvSfgT6r0yCi
	 BJlzd1Y48A4hG3eye+SxV4kZTdlHeZqCn1wR3H7W49dVykVpZeLKE3X1SfRgQ7zalCFym
	 imVxjSFar5LmHTYb6YC99AQ/15MuH6ESpe/D6+I3khTf2nQ2pHsornuz8tbayYp0D1L/3
	 4uWmdhdlJp/tG+Owb9j8qvQ9j4C1zXn2548oOHeyWLRPhBXuLuXmUnsJ+g+XnqcEqrA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=T5rLOZ9P;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.51
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013051.outbound.protection.outlook.com [40.107.201.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C80606A319;
	Thu, 22 Oct 2026 06:09:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64C80606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=T5rLOZ9P
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KSiq6uc1NzF6vO5p6OP1lnB/unYtIgxtAHNBk2/7gEEchzYJBak94pk/gOF9i3krOI71yxHtmi6nvd3gvlbHSeh9JYrB05i2iMC8yQmLxVO+S9g3J4Z5hGN7SPFg34XNvoKWQb51Gb+Rb5q7mWls3xxT0nQK1QcMZFQ0tK28yxIgLejb3Y39vBAQIiJnRd+IPX6VSl9kXe8tGR4oouzuy436vmD3Z7vSN+PCSDrRoquAuaPTiISoeHDJyYQWs12rHjnXVh+TM6pU0ohXZ4Uub/cIgnKySj1+SpDEBmf9T3hK/nHF72RByut+jI3v3DG87f6najoImKV2uO2hKqMO8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oZMFXm1Um9WTsb8zueqR43RKc3ZkPKGXqmAa0x9KNCI=;
 b=JrJlplcEO2laoAldIQXpCR3ElhiwveBpkziBYV9aT6tl28kCrdxD9/ThgOx5NNfE+C1jTtJOepig/na5dF7qnvDaNcu/tJV2LVHrvtphRXwU7IQukKidHfOhtW5pLzUFX537wU2/532WoeHZQ+rkG/sB84vG28Bb3JJrnVXxA85YNlA9uqqKQi9DEjBNYTlgGfg6XF75WRZcCfBo/Wnblqu+AyvxXhxqQzsusyrjv9bOS1rKE1d59L7HnSrP+rpHAVUbmNQ4lznTV033AP2xIEWsBalwX4ulremnHJ2j6vPVtOdz6s6hAuOn9DF7BoBcVZmty1lojIJ1gQoqBB5t+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oZMFXm1Um9WTsb8zueqR43RKc3ZkPKGXqmAa0x9KNCI=;
 b=T5rLOZ9PiARepYBjHYkMO9k+h1xhvYXANXmxyu1O0c0DT+RE/ZGfdoe4oYynxE8Z0+y4MSGyxlM6n0rz2rYFtRMkPa8pQgwCyswVgF7nPCnVMSkBQf4Ifr3dkhcEtSALG6Ph0LUb8yFziMieu+jN0bBhcsAAY0tdhgYaoWKhHz4=
Received: from BL1PR13CA0440.namprd13.prod.outlook.com (2603:10b6:208:2c3::25)
 by SA3PR12MB8809.namprd12.prod.outlook.com (2603:10b6:806:31f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.18; Thu, 22 Oct
 2026 06:09:16 +0000
Received: from MN7PEPF0000014E.namprd04.prod.outlook.com
 (2603:10b6:208:2c3:cafe::7b) by BL1PR13CA0440.outlook.office365.com
 (2603:10b6:208:2c3::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Thu, 22
 Oct 2026 06:09:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN7PEPF0000014E.mail.protection.outlook.com (10.167.254.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Thu, 22 Oct 2026 06:09:15 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 22 Oct
 2026 01:09:02 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 22 Oct
 2026 01:08:45 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Thu, 22 Oct 2026 01:08:41 -0500
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
Subject: [PATCH V2 02/13] ASoC: amd: acp: add ACP7.B/7.F SoundWire DAI link support
Date: Thu, 22 Oct 2026 11:32:12 +0530
Message-ID: <20261022060724.1814741-3-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20261022060724.1814741-1-Vijendar.Mukunda@amd.com>
References: <20261022060724.1814741-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN7PEPF0000014E:EE_|SA3PR12MB8809:EE_
X-MS-Office365-Filtering-Correlation-Id: 65b76600-74d0-419c-2ad2-08df30030058
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|1800799024|36860700016|376014|7416014|22082099003|10067099003|18002099003|260925021911599003|260925022911599003|11063799006|261009223027099003|260925021311599003|261021121427099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	1b5fwwnyMDhVb7jDH4LeAmEb2d8asB7HexpjGrgaMVldCRPc5N6BVfqMpo/VrvavnsJ/4Fw2pivYHNdQK/EonHDbaKSZCcFw3gqphHnPm7H/wwp7k+Pd/TKNQo+FrV8fWeT74Q3Y8DueQSsQTwXLjHa+GXoLAwwrgrMHqja7kJKasdaRGEWfS1KnY7Hy7fbirpuAiIz9zKz0DmBRSSC/1l18hNJUeu1U8BzpwjueVk5lr8rJYaU6j7uHdkxE9kYD2BD7M4LMU5rPRdFAR5a3IdoAdN54a20vjA0Zh9P69hkQkb8QOrRMI40xT3EYJxiL2CcVN17A6SjbTG6URLHa1ooJS3s62hsa+RxNobkjQKjsm0Ci0OzOtGCWUX0mjKyEDbvKUSCHtd+Vd92wR+ccT7/jxWT5/NHEkX1ooShMRMtW2Rxd786ujh8nNINysbA/ej6y6Rl/acV8z4smtksXygikQdXVyHoj8xK4WEBeGf0k/23zSsMlPTdxYg2E0D6/SmRBEeMbQCa6AOfKpWHpphPlpNYVNHmrqUtCASOt+iBVloaI6miRAbmOtEuNCN0gOXp/xfFVP58DWVCI/fdG12OCOdyU8hdj0af0HGbnvCFWcM8MHGz4M58ApQEDCzYwRxkgTh2L3Y9NiuduUY0nMZdaXkF4wkFM/o5mbX7+UVMvX7bud4DgoiOtP0VAId0QP/GxFE1icsimk05B3y+Ccg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(36860700016)(376014)(7416014)(22082099003)(10067099003)(18002099003)(260925021911599003)(260925022911599003)(11063799006)(261009223027099003)(260925021311599003)(261021121427099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mt3hSsjuY7vcv3skCctVlMsohaxusP54N/U+foFzWA9J4gPS8eK92CFmrbJ0jvW54CeoW/iiRsL11/eD+eejXckgIAxg3kAnEXST5wkzuljRkeZwPqfSputRXDereY951vM2rFnGiVZNQr/xhjcQpkoE7E02y5txN7P2/drm+e78YoBcMm6uqF1LaAJrWmrpc6Yl/QBX6Im+hGBgCjnGO1a7jGjEqyvRKuUxkKC5jSkwSH53mEKtpvscnF8QuxsL+NbgOCIJ2+oR6RNPbMKDKBniEBZ8cLbJMiT7/bNRRvcCnLHVGWajEoD6Xx+1Ld1asOwf4MptOZoq2Y8lIWZVOJhLQEYI8qvF//dxQH6uKnE67Rt+uT6bXVjUXLPUoHxh2xodNGFMB31uwRVRfazDsLb0K9zS7jRpn3tBZxeaeyj39xdyfQtm42eSeqRGOaM4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 06:09:15.8276
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65b76600-74d0-419c-2ad2-08df30030058
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN7PEPF0000014E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8809

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

