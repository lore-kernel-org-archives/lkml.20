Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.39
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793892257;
	b=jErTJQpIkXR8dB8zyhyc3LAHvYd33kXMLpAfyQhzovgq7I8Q9dm6vZbLF7S6Ix0bmlgU
	 nozGvFLa3lPmP4kD3+l+P0NUYsaQscM8ypuvaMFfXD1lxygK0UyHRPuNx9a6yTPDHina4
	 nQ6r8I2CTySO2xlMIHVTwoNDWcMjY3vgqxC6RV88Fa+V4g7UR6sCmq/8mIumBUrt9fQ7X
	 0pfYJwaUmgaXx7H3+mUwgQKr7lhv+XUu30mKvJc0SLLTD6svxkKKpoeo9YP9c9jjvi6ho
	 DWWzzZioFDmXl5faSH86LguOelCjPVYzID3VVVgGk0k2DnGQGEMgcIXvfoD3P4H40Wg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892257;
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
	bh=YYQD1h03Kk+FoGpQZLtfP5eN82+0pOCc76wea1l2yKE=;
	b=h2HJp42/Xf/smi/JsTx6MjHJGMjHTf4CS6AS0KGp6gJr6Ut7gPESaQ+ciR3yPRKMo1Qs
	 PTsRBuEa9aC16IJH9eQBuu9xdPxf6Sblwl+ufcSjD9BI1BAtmiXsoSxEgQNH7fG1IZ13t
	 Ko149mU4c+OV6/mkdXoMquNGpN4z+GMlyD6S+3STsUypzZ0rGLMTIaAsYWS++Q5sd1zKq
	 VfG2x3rj6/JN5B+3FAts589FFJMao3Xh+CSEf6i4uLdmiiV28H6/mRmhJ7PpRH5K8FQlI
	 2uKlKE9gx35jZ3Ry+L6FczhmYqS3k0WGTcL43T4eYM638Tl0vnx8xj/kWjXUcTaaNbQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Ib2a9APO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.39
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011039.outbound.protection.outlook.com [52.101.62.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A28606A326;
	Thu,  5 Nov 2026 15:24:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6A28606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Ib2a9APO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I/U0SG4X0fvlVBEAvIWLHutEQhyljL3BiMvfJxJMX8qZasrDnQjfamefweAGp7ztAFoH+syy9wzrztC1czJLv91vuCXR2/JAwDXcOCQOBqzWOElPnig11FPOjhFfVzDupeb2B8m4UrrXCB4pEOxEI6sdpAS59bJ37qXztR55/4p+q8dwpMHjkMlhOXeKs68SzsrZ0UTeEMUYc3oXulSZBF7o3SZyiutLSqNR38Gacp7vfN31OuI1JP9UMWQO1xYkOAJufxpPjJ1PLo2iTGUI+BnHUVPu1blZ8yv6Wt5JKAmKsYrr0Juxv4Hd5/nlnaXpb/Djn4lJnxYDFyIuR3CksQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YYQD1h03Kk+FoGpQZLtfP5eN82+0pOCc76wea1l2yKE=;
 b=UDT/IicpSla3B+6PMMWKM4GSaQAST68+MDgMf5EFOvW8AtEd+HcupSDi2H1l7TJNUZY2GBeYFxlu2y9pk7aRiQJS+P7b2wnptdFmt5Hsu5EQcY5JZQrJ1wjE2hzNX5ktrAWbvmQkG2zrhLPPXxLSqD3/X69fTw+PnQjLgT/oBeBY+XWP2ei4J0/fnGNpqWgMgsT6uICCgClLKKT8Fdv3PsKmYekhVQg2TCKnKOjHvRAp8kHyfX/OcySjJ3EPaJES/I3x6PeDjpyuDpwahbjjNgGJNDhAd5493qmnHjDD3IRORX90mbql8Ou83smN5zWQVOX4A9/2JGfr/CFvLHrplA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYQD1h03Kk+FoGpQZLtfP5eN82+0pOCc76wea1l2yKE=;
 b=Ib2a9APOjjGy8sUVjlLQBZpvO0M0uM5F0W+we84PmOclgnFi3gd92wDgvzowBz1N6883EcU1+vZ19i9nOJdRzJX1wiCz1/DCYkq0VzKvb3q66J0yp3L3VDsW+u8Qxq2DV0idxb90VBTECBAoQ+CnY6MF+6GUBO4T3DRfAXfi/jc=
Received: from MW4PR03CA0035.namprd03.prod.outlook.com (2603:10b6:303:8e::10)
 by IA0PR12MB8421.namprd12.prod.outlook.com (2603:10b6:208:40f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Thu, 5 Nov 2026
 15:23:20 +0000
Received: from BY1PEPF0002696A.namprd05.prod.outlook.com
 (2603:10b6:303:8e:cafe::7c) by MW4PR03CA0035.outlook.office365.com
 (2603:10b6:303:8e::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 15:23:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0002696A.mail.protection.outlook.com (10.167.244.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Thu, 5 Nov 2026 15:23:17 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 5 Nov
 2026 09:23:16 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
Date: Thu, 5 Nov 2026 09:23:05 -0600
Subject: [PATCH v2] ASoC: SOF: amd: Load alternatively signed firmware with
 an "_l" suffix
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
Message-ID: <20261105-superm1-lms-sound-v2-1-33327881f4fc@amd.com>
X-B4-Tracking: v=1; b=H4sIAFif7GoC/32NSw6CQBAFr0J6bZvpEfytvIdhAU0jYxyGTAPRE
 O4u4N5lJfXqTaASnShckwmijE5daBewuwS4KdqHoKsWBmvskcikqEMn0RO+vKKGoa2QTZ3ayyG
 jmk+w7LootXtvzXv+Yx3Kp3C/hlajcdqH+NlOR1q9f/2RkJAzU17sOS2Z7a3w1Z6Dh3ye5y8TU
 xAWwgAAAA==
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
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0002696A:EE_|IA0PR12MB8421:EE_
X-MS-Office365-Filtering-Correlation-Id: 78900bc4-9e84-41bd-8804-08df3b50b807
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|82310400026|36860700016|921020|261021121427099003|261022105027099003|11063799006|10067099003|56012099006|261021123027099003|261009223027099003|261026121527099003|261028144727099003|261022075727099003|261022115727099003|261102123227099003|261026140227099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	VpP5Knkk3iHauq19TXU+qLmPm8peq6epbMsDVsBPP5vBW9yMJMvHuIsnPO8VPtiFXNhEwnr/y1a4dBF7P3U/ImgjooIAH/jvVZDAQyzUW4cSOjifwHb3LM6IlNtYeoHMHQWVHp21JpGSikhtuJ4j783jXT88t4vHWGFv4eVsz1eMc0cNgkcMMq17Pw3CQGVthorqQKLn6FwWMDNWoresk2zJZ+BJKAbKqql+WcdILo8F6o//F8flvGydCIPj6/S17cZEkdX1KLEsYeMiJ07g27QzTH936AdQcSOSKk6j8qJvp/hQepbl92D0vI4xrY0cyH7iWEiXF1RwzFt3+vbNpZfwQtpAqNajH06iq/4AqfmXHccvVwKU9cj/ZOeX7qny7ENsh7AVdEBnCdqDK7OQZQa2xyAw2nSG+rIB3I4hi0wk1qQ+uk/p4Vk1OMUPtqKwM6ivKxX0lfPeLwFJ2W04RBEyzj0RBWsnkj5c/5Apucw7zx83Cm3cA3onKC1QANnXZXkiBRkQUcTs0JKEXR1nQF6S6QQXvnMthGs5mzSotK7W1yUVSNxcinHkP9Dv4Cu6zdK+vWnKWPvnmc+PrHf2kyuQf7JRLFnqL5epGMY8ltfMit/Cvi5TNIPL8rR600WrgiF4hWkJcCGt+sTYKazt1hvbfpk9JF/gXeSlIJpnyx3khLXZs0WW+ZyWMXPPalI2
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(921020)(261021121427099003)(261022105027099003)(11063799006)(10067099003)(56012099006)(261021123027099003)(261009223027099003)(261026121527099003)(261028144727099003)(261022075727099003)(261022115727099003)(261102123227099003)(261026140227099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fXuExj6pPm0daBvsb9bT+CyStF/Qlff8z4Dbt2eH/I550tk76nGCXWNfNFy0wQyo52HyN+fNO7qowSE38rXK1i1rQ80u2xd+2WM/wKPmpV2e3LZMLSc+xAixhqEkUVIYRXdJGcmJGMAh4H7RgyFf+d5O8D8OUORfvRFmWJaB8FFTYlF37fzB4bVJjQR8azcN457rkgQHAblRFmAaBOnZ59v9Jvz0zBoJNLynj48sPlJkfX7q084hP+eQqXVHpG4kUHCgAOYaC8hPk50o3Hgp6h3Vv9qMbUXV64T0Sf3mh/wQtxjb3cw3S8s58Tc3zsrSfo38jRnS15WL8blmLFviwfi4t/XLrB355zJxvj7scCKfXmEx4oULDuV7eqZIlJ/hignY9kR6zU4e9bQBhTQalBTks045Y47QCD6MglRfBqC4sHzLeBdxhQaFBjz29XEd
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 15:23:17.9571
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78900bc4-9e84-41bd-8804-08df3b50b807
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0002696A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8421

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
Changes in v2:
- Clarify error
- Remove dead code for error condition
- Link to v1: https://patch.msgid.link/20261104-superm1-lms-sound-v1-1-c50b9284bcc2@amd.com
---
 sound/soc/sof/amd/acp.c | 29 ++++++++++++++++++++++++++++-
 sound/soc/sof/amd/acp.h |  2 ++
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index 86e2402b8ffd2..7bb50b8265d8f 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -1212,6 +1212,27 @@ static int amd_sof_sdw_exit(struct snd_sof_dev *sdev)
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
+		dev_err(sdev->dev, "PSP firmware signing type read failed (err %d)\n", ret);
+		return ret;
+	}
+
+	*suffix = (val & MP0_C2PMSG_63_FW_SIGN_ALT) ? "_l" : "";
+
+	return 0;
+}
+
 int amd_sof_acp_probe(struct snd_sof_dev *sdev)
 {
 	struct pci_dev *pci = to_pci_dev(sdev->dev);
@@ -1448,8 +1469,14 @@ int amd_sof_acp7x_probe(struct snd_sof_dev *sdev)
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

