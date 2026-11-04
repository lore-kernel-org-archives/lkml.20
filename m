Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793829360;
	b=gEQlM24TU2D1f6+/3V/ZFYWjGjUau+s44OPfp+0FsNs/QAAN8ciOtz1x/dVHN68QtixA
	 f+JGXY09IZDR2jY6Qy0V6x0uv86lNlPyR7odYs6cLGG+hEleHMFLaZXei4gj74xVG5bai
	 2Ia6QjnR9iyaqh0HottYhh+r4UN1xjGGzZpVu4/kmiJI/tW+dTC1NTM3tjpqBV/MF9kso
	 jFAdUB51hubCzCKSBvfjzNvF2zD7Khn5YKG+asrGJ8Z8137h+XEVLxf2eEDXmCs2y9vHa
	 L5uNppahBk5PMK0Ay/pDPbjgdMtYppqffnT8w589ftJD1UpPtdAB8yYJLrQC2CyINlA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793829360;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:X-B4-Tracking:X-Change-ID:To:CC:X-Mailer:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=NGXHUpuwQym4I4YGxxMhI6C2lnX8VWsQO5IQd9uMOPc=;
	b=x90HzTnQv20WCuJb0ixeG2K1y+r23o6VbFs9qyElyxzvs3G3oihHeV5CZsVmuJfs+ONK
	 tYRD1Zeo5JEEnJCakevytg9QKfZl9f1Pzy+/0NPjt75JzxZANRs9cTqrtZMYS+uPDc1h4
	 v4MLFIvMZZQy3U3Fv8TJxZlr4lXzXuokrIwNVI2mYVV0UlvJwjHf1BbcAm5pE41xEpH1R
	 B6WXwdoBZfakEufFr+Fph8RD1J03fwUhMq1VUmFZiWAMBwptEMf89a2CL59RfTohJNEch
	 /hrdCXe5/IxH57ws+QyASa0B/tsp6lyjisMaT75A9s6a4c4hfbP/GTpgud0XP5r4yHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="L0Ws/Z0m";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.47
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013047.outbound.protection.outlook.com [40.107.201.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934C8607490C;
	Wed,  4 Nov 2026 21:55:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 934C8607490C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=L0Ws/Z0m
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uCE+apGpa9B2xFdadPHT8Bl/4+73NxrLPWvpCngVwf0Ev3VJ0Y2B5PnfuR90Z1VuoZ5JGYx6wyqJJDpd5vUkoJ7U97CLRrJrs/mlP1z9Led9GH+QfV9HDERH+pDMW16zF8zYjDS7y3Kvug+ARqwcm5l7rRGu3nSXpFtAaMvUBJ7LmpKDRBnN/wxN4lMDCkkxbSi/Xv5YHnmGBBGGVnRbXMmXnnQAVr2ruHawf51soaWTg6UHH3oJ3a6vGsazmmV2ZKKPV1aqaUQtzymI48mQh3edHirH9fVMYeBX6DyzjYvpQUmLHGxWDSbikV9WLh5uzgaYtrSkkCQKAbmCquDl8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NGXHUpuwQym4I4YGxxMhI6C2lnX8VWsQO5IQd9uMOPc=;
 b=blINXackJt191SOLSR2+mRHPRlURuR41Y0G4Ean4YolkDeKBXW49dkesLi8NjLUEHZs/fZWHEbsoqLjmiP8xsWyZTWPuUNnJrUfd2cYwmkd3/CXQUAt78jfanF9U115KjorABCUg1Cg6LP+8ewmW2sgdXF04nrzEgB3+vRxzybbMNdNejXAlYRUfYM10OOgRbI6i17fqurr+Ako4uQ/x67VEYTt7J+NTvjoFJQ1K/AtpqerxK6PbdBJ9+uy+YfeuEMM56junna/NemY+s0ATs4c+TKfU8pYPXk2p+wtpYe9GWQ7bHFKXnUsju2YVrf1CRfj05vlZ4uAXSC33q9b4ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NGXHUpuwQym4I4YGxxMhI6C2lnX8VWsQO5IQd9uMOPc=;
 b=L0Ws/Z0mqjIDDAq5mEqufttKqlQjEVUgM39KJpfjWMSedFLifaBNWEvXT9O3b8qQm6lP/7+dJhxNBp12SzresCFx9nB/uhLcxww6wUDL3PjvCLEm61NFLFdcX4IDofCTpabEUaU3V5Ax5qe8lFXT7I7EP2BdwV3FQD1NCA2qKyY=
Received: from CH0PR13CA0050.namprd13.prod.outlook.com (2603:10b6:610:b2::25)
 by IA1PR12MB8191.namprd12.prod.outlook.com (2603:10b6:208:3f3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Wed, 4 Nov
 2026 21:53:50 +0000
Received: from LV8PEPF0000005A.namprd02.prod.outlook.com
 (2603:10b6:610:b2:cafe::2f) by CH0PR13CA0050.outlook.office365.com
 (2603:10b6:610:b2::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4 via Frontend Transport; Wed, 4
 Nov 2026 21:53:50 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 LV8PEPF0000005A.mail.protection.outlook.com (10.167.245.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 21:53:50 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 4 Nov
 2026 15:53:49 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
Date: Wed, 4 Nov 2026 15:53:27 -0600
Subject: [PATCH] ASoC: SOF: amd: Load alternatively signed firmware with an
 "_l" suffix
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261104-superm1-lms-sound-v1-1-c50b9284bcc2@amd.com>
X-B4-Tracking: v=1; b=H4sIAFap62oC/yXMQQ6CMBBA0auQWTtJp6JEr2JYaDvVIVJIhxKSh
 rtbdfkW/xdQTsIK16ZA4lVUplhBhwbc6x6fjOKrwRp7JjItap45jYTvUVGnHD06E1p7OZ4ouA5
 qNycOsv2et/5vzY+B3fIdwb5/AMgg+t11AAAA
X-Change-ID: 20261104-superm1-lms-sound-c0f429351fc7
To: Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	"Kai Vehmanen" <kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, Vijendar Mukunda
	<Vijendar.Mukunda@amd.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <sound-open-firmware@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Mario Limonciello <mario.limonciello@amd.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF0000005A:EE_|IA1PR12MB8191:EE_
X-MS-Office365-Filtering-Correlation-Id: 1accc3e0-262f-486f-e709-08df3abe1c38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|7416014|1800799024|10067099003|261102123227099003|18002099003|921020|56012099006|261022105027099003|261022115727099003|261022075727099003|261021123027099003|261021121427099003|261009223027099003|11063799006|261028144727099003|261026121527099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	IKfODCsbvBaD/uFsbmcWzF4rVPvuh1HJ2VBKdyn9w9qfj8Sb0ZeO6SPe/bBGSTDaDp1pNDO0oIj9ngzD9sqQeK9/1gDEMvWrgJYpolZNYCiOLaj/opV+bxdphQ7col009uMhMmriWmUZTcEXfbjgf2noLPvM64c77CnUEAqqyZnAisquFpyyg2Y+QKrM5GVm/KTHGc0DSq+oUTDhYw1hPqjLjpFhpsHJWSMprDXVg0uhN6wmw7HhR8SHAGAcPJBrgdVEjcIcRHPoYyKXjIL8gb3eDJ5IZjmDtrYlgnT6xnQQyb32GanG1NUao876HOIAi1tfDNi9lIoKShwX4J83YAM4V3/39WNUkiIW+MAtvb7wVvvkJLlmcicS2/yoF9GJwtnR32qNFfhkx35Hf4IdhzHUcGMpLq6eoKtg1wFUaPCvymeuNJKlonfzZY7qWPGONeSVSBq3ryZEzdXo9+ARLtFUqnqXScIPIegf+yJXAHzMCR/43LoNBT5hon3/S4VscTnV0/qkH67qO33HT/7pSVnvRwGKR120nd3h0fm/7H7uf2vY85vMlI8BifxlmfNiKcihQshPRH/shbfCcKxCQa/B163mUCTo2RPF0iO5lnqgza76w/k8vHsSglJHv7/8zHr9bjvPuor2yid6Se6vN2Vgu8fEAEPjkGthxmosvzcp558O7RJlK3qTm5L9D/RYqRpTZ9MzgQ8wTfUP6SecZ4I16vbuhig0JnXvTcLCQr14AKaZiU7E3dSrO5qY4Wwy
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(7416014)(1800799024)(10067099003)(261102123227099003)(18002099003)(921020)(56012099006)(261022105027099003)(261022115727099003)(261022075727099003)(261021123027099003)(261021121427099003)(261009223027099003)(11063799006)(261028144727099003)(261026121527099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	i2UJmi+crIeTxHht37oQlX+F1xRmOLMszUUrfi2Ou4uQigcxb5eh95yDf21xDss8dP1XY3WLmtVOIXMISSkvXu/Tf3aRHPSzQZURFDRtvraKkoDd2qz2eJBJErxQoR7O07p0HU3yPWH5GyF5IZMXLvdooAZYIZF4Fj9wJ5/Jwrml1THnk0+1eJR5M3PD+iLAqK8shMlxLajk5YawGmLJVcvfkH8gQSK2NwCTyZ1sS9SAvBbjdkT4Q8sXQX5y0qzQ4Ro2EkDAljYUbXQ9GKOGtHQHHHeOJ1rfwrnkly1msDmLmfUX4CeP28pnjClBbaWtuftCA7pUP+ZGWtfTGB1G4RQ0CqKWh/HrV5xuBICiiePEPmF6DyJ5vOUv8WpOHQFLILWmJa2zB1Crj3gEutZ6wvYRBHoz0ShBGgZvTdQo8IvSNtWiZkxrvDeBlyDYY6tE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 21:53:50.1148
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1accc3e0-262f-486f-e709-08df3abe1c38
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	LV8PEPF0000005A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8191

Platforms ship BIOS with either a default or an alternative trust
authority. The PSP validates the signed DSP firmware image so it must
be signed with the matching scheme. Firmware for the alternative scheme
is named with an "_l" suffix before the extension
(e.g. "sof-X-code.bin" becomes "sof-X-code_l.bin").

The PSP reports the signing type in bit 6 of C2PMSG_63
(0 = default, 1 = alternative). Read it over SMN, as is already done
for the other PSP mailbox registers, when building the signed code
image name, and add the "_l" suffix for the alternative scheme.

Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 sound/soc/sof/amd/acp.c | 33 ++++++++++++++++++++++++++++++++-
 sound/soc/sof/amd/acp.h |  2 ++
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index 86e2402b8ffd2..2f1a8be8460d4 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -1212,6 +1212,31 @@ static int amd_sof_sdw_exit(struct snd_sof_dev *sdev)
 }
 #endif
 
+/*
+ * The PSP validates the signed DSP firmware, so it must be signed with the
+ * scheme the platform firmware uses: images for the alternative scheme are
+ * named with an "_l" suffix before the extension, the default ones have none.
+ */
+static int amd_sof_acp_get_fw_suffix(struct snd_sof_dev *sdev, const char **suffix)
+{
+	u32 val;
+	int ret;
+
+	ret = amd_smn_read(0, MP0_C2PMSG_63_REG, &val);
+	if (ret) {
+		dev_err(sdev->dev, "failed to read PSP firmware signing type: %d\n", ret);
+		return ret;
+	}
+
+	/* all ones means the register isn't accessible */
+	if (val == 0xffffffff)
+		return -EIO;
+
+	*suffix = (val & MP0_C2PMSG_63_FW_SIGN_ALT) ? "_l" : "";
+
+	return 0;
+}
+
 int amd_sof_acp_probe(struct snd_sof_dev *sdev)
 {
 	struct pci_dev *pci = to_pci_dev(sdev->dev);
@@ -1448,8 +1473,14 @@ int amd_sof_acp7x_probe(struct snd_sof_dev *sdev)
 	sdev->debug_box.size = BOX_SIZE_1024;
 
 	if (adata->acp_sof_signed_firmware_image) {
+		const char *fw_suffix;
+
+		ret = amd_sof_acp_get_fw_suffix(sdev, &fw_suffix);
+		if (ret)
+			goto free_ipc_irq;
+
 		adata->fw_code_bin = devm_kasprintf(sdev->dev, GFP_KERNEL,
-						    "sof-%s-code.bin", chip->name);
+						    "sof-%s-code%s.bin", chip->name, fw_suffix);
 		if (!adata->fw_code_bin) {
 			ret = -ENOMEM;
 			goto free_ipc_irq;
diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
index b17a36b31ee0d..81eeeabc5cf5c 100644
--- a/sound/soc/sof/amd/acp.h
+++ b/sound/soc/sof/amd/acp.h
@@ -97,6 +97,8 @@
 #define ACP_EXT_INTR_ERROR_STAT			0x20000000
 #define MP0_C2PMSG_114_REG			0x3810AC8
 #define MP0_C2PMSG_73_REG			0x3810A24
+#define MP0_C2PMSG_63_REG			0x38109FC
+#define MP0_C2PMSG_63_FW_SIGN_ALT		BIT(6)
 #define MBOX_ACP_SHA_DMA_COMMAND		0x70000
 #define MBOX_ACP_IRAM_DRAM_FENCE_COMMAND	0x80000
 #define MBOX_DELAY_US				1000

---
base-commit: 68e9934bd17af558b62cac8a444de28d4d5cdb9f
change-id: 20261104-superm1-lms-sound-c0f429351fc7

Best regards,
--  
Mario Limonciello <mario.limonciello@amd.com>

