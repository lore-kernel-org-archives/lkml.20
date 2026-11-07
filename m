Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794079709;
	b=NsbahbzCZvDYuIYYK/nACH8U+qB3jqYM4jLSW6Cg7Lqg4W4DAAhQWXfsPPqNXiXCDPDQ
	 1EiIHETG3fgcq8vad+YpL27nV99UyfLHmU7H2SeGQbtYiJn7ffcXkOIc+Ud8uFQvL/Ec/
	 usaKXPTZ3hrYrzFbTzuXJUizIvk8+inXuA9aK3UcRf8csW1TDG4S48bLp89XDMcwP+JgL
	 OeUhZe0U7kkfIJdbSkbNWhKkqScHkMyjp7vPsiTkFuey7EfpwY0hsN7wlB+VN2vGKQ1U7
	 N+uyNsenk0+g8aAU598C2dvT1aAQwsRntwe8vaYCg2E081fL4qyDXu6ZC5BmQJVpsAg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794079709;
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
	bh=zei65AM101ffm24bRX9zY+9DMcGLG+aMu9P6af0xOds=;
	b=R+RQt87r4u4jzn29m9gquOG98qCs81uh6rKb8rQ2nf03Xj6nQt29Kj/Fnt2j0cvjRHOf
	 g7tHiyw+4e3DOTWn1fUJSVAGSAY2hkBw0bHAPepWAerBPXVir7JnPjAwO7xlslp1yOa9J
	 yn2dKW0TMpJc/TtW4VM2tszJpgYYESnHNy7s2xIuG5NVfpSjupZV4doD67ZxacDdzn2za
	 JB1dgVCisia68SNSU+alI5sllQRdKiwsGcPiH3EI+fkEO8pqPG2hmRige5783L50AZxUD
	 VV29BFlfF/d1xczuAUEiyCPS7+gdyF7B+UfsqpErb99S+/8jqgeJtL22mEXN6Ipxt7g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=rv1qc3rf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.43
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011043.outbound.protection.outlook.com [40.107.208.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB5D606A334;
	Sat,  7 Nov 2026 19:28:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DB5D606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=rv1qc3rf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yZ/i5AhVBYZR+AzgeN7NOehiM3oa3TUHAoV0vRWjtVs6X/oocxhbnAsrSY00ogGtS07M1wwgSD5FfPmBL7OB0j9ujbxVqa5805Y9f8kpmxWM9VtOqIHwOf1zX9kMHw21qD6HmL1TH1KPw1peEkkICpRTaSkaV6n7TUB7GIOMjAKG/nXU6RxljRvWf3Mqz7UgVWfKB2QUvp82A8JkZWd30OVfK9I8dRw8VyhYKDFwKRNQFr9qYE+JfDq+LvTwjSsHkQme0z89HXfDC99wVJfo/z1kMcZFTuaA5o+QlRphWI15w8siVOhrnb8xM6RneJmCqypNSYdTQxJrFEhCpgOmOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zei65AM101ffm24bRX9zY+9DMcGLG+aMu9P6af0xOds=;
 b=Z8paD4/FMLlNwaeaX6214EWR2IiR+ZmC0bvbWesFZ2G4ju9QdLzUYwoSTXfK0xzUhb9vpauEmVbrzyFqU0WLqt3ri+R6FRlRzzBog28dVxpMA7pbsLYPlspJ085Z19xMvM+oPyi8WjpqhAMSTQHpk3sCBR0aBpS+TJ3BVaPtvc1iqnNBBY95hoo1Mc3Gfzr7QK/KdBU8OF01uyoTYTgO3z5yHkjkxpwi+Rg2AHcIlXLnbLjMF5O1jX1Aqaho4OzA+MKapVfN3Bqxi44OHDEityBA/qeIap6kXb/qUHC/bCOFjGA20wFZrJ84ejrMfD4vxcYOzo0ThNKG0n+35DjxxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zei65AM101ffm24bRX9zY+9DMcGLG+aMu9P6af0xOds=;
 b=rv1qc3rfX/T5Pmu7gXnN2/VRyTUatAV3EX+wAllIut69M6tYRB+P1xO/2tmfD8TbOQXHK2cnbeM7Dwk21tC/swbYZF0f1MlUgcpNcUkGSKuQ7xfSES9v3GJpFh9Hi4/KVZXo8MGiBFO14m4iTqSVIi3Mld2gc91dIZVDNUYgoLQ=
Received: from CY8P220CA0037.NAMP220.PROD.OUTLOOK.COM (2603:10b6:930:47::7) by
 BN5PR12MB9462.namprd12.prod.outlook.com (2603:10b6:408:2ac::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 19:28:24 +0000
Received: from CY5PEPF00000E74.namprd02.prod.outlook.com
 (2603:10b6:930:47:cafe::7c) by CY8P220CA0037.outlook.office365.com
 (2603:10b6:930:47::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 19:28:24 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY5PEPF00000E74.mail.protection.outlook.com (10.167.247.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 19:28:24 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 13:28:23 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 13:28:23 -0600
Received: from amd-B550M-DS3H.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Sat, 7 Nov 2026 13:28:19 -0600
From: Syed Saba Kareem <syed.sabakareem@amd.com>
To: <broonie@kernel.org>
CC: <Sunil-kumar.Dommati@amd.com>, <vijendar.mukunda@amd.com>,
	<Mario.Limonciello@amd.com>, <venkataprasad.potturu@amd.com>, "Syed Saba
 Kareem" <Syed.SabaKareem@amd.com>, Siva Subramanian Ravi Saravanan
	<sravisar@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Cezary Rojewski
	<cezary.rojewski@intel.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, "open list:SOUND - SOC LAYER / DYNAMIC
 AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/6] ASoC: soc-acpi: move common function topology helpers
Date: Sun, 8 Nov 2026 00:56:59 +0530
Message-ID: <20261107192744.2027264-4-syed.sabakareem@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107192744.2027264-1-syed.sabakareem@amd.com>
References: <20261107192744.2027264-1-syed.sabakareem@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY5PEPF00000E74:EE_|BN5PR12MB9462:EE_
X-MS-Office365-Filtering-Correlation-Id: 3eca648e-fd16-47f3-4879-08df3d054a87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|36860700016|82310400026|1800799024|11063799006|56012099006|261021121427099003|261021123027099003|261022075727099003|261102123227099003|261022113327099003|261022105027099003|261009223027099003|261102130727099003|261028144727099003|261026121527099003|261026140227099003|10067099003|22082099003|18002099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info:
	DQ+B0MJ8HCYWMJwsfVxStpuDz0cM6JLNABHEinxs2N8gSkVUpy4nf6l5Q3IE/QC/ehIhoiFp7E6QUEO0bpGo0q7OhBz41FST0chJKiZhcz2F8sjldiAFILuCrxsNlKgC8QgDo3IPdYCtNCuvPVtlv7YjzkrKdDYUhztETKhWDu4JdCy+cz6hM5+J3EsE27/2Wyi1kJDRTqRtJgVl3cQFBT3tuMX5dcmrsYIws1ggIL9DSGZ5zJOwOQxv/M6PKwkizTHpMOEmfB/FkV8rNFCVo66bgXFXpUP23Z5aKkyBAol5PLMsN3ozkHFRQYwTsm0EaDVChc9VxeWs9KFz9MZFbgLDCunJ7nN87eOyH5P7fG3B9IIUvUGrJsYqf/tkDYcldNOmssYFrMjK1AM9g7zh0I8+Aqq739ig4fTJonWzBs8ijQJfIFO0JHkXLFtEshIRGeCZGPy76SvLcjRNbOBE1LDoG6nAiVaMoMR0VNolVWLEtIPp9Ax6kW7J1Y+y7yPJ3xpuW1PL9VkqeGY8pqp3k50kgyaTAWYU1Rmr8+QYMwoPJKvxsdIS3/ig7Cr25sCpoWziURXac6QVKFFRNLqrYMiRZFQ2zGH5VDzRuWJZuHaQWHX0meeVeFzMWyo7T6w2q1l83p0fqsDloatQPgBd7EOYqWKkN0wUkx/WmuLHrsq9Vu0N4RYucIM0RFj3mXa80juu/I4kq4YyE/npD0K57A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(36860700016)(82310400026)(1800799024)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261022075727099003)(261102123227099003)(261022113327099003)(261022105027099003)(261009223027099003)(261102130727099003)(261028144727099003)(261026121527099003)(261026140227099003)(10067099003)(22082099003)(18002099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wt+aPn1ccz369M8Nw304rpNET54fJ58JuKwcd3fl9YRxl7/zRgxMQPYy7FtVu7zaiNmFOkoxd6dHBIcGBG3DnIdg5vdsRxmCuVD+rTCC4i+bM5EQUY1k/httPxF1HuzRGep4MDbPeB6koRy7J5Y6Gza/g7fHdOoH2DQKpDcnpuTn9FcdHXvz82T1GF6MXW9iKz/WOnfSmgQw7Czs//+Y6ycFeOT7Mnwbh/I45pyIpcM2sQSjIKWtVms7zXkYMDpNNigymVIeUZWTTvlLQeaqLwji2dWS+Etmlkf/ksPnO5PvfCtjZAYM+1Fr8LIj+30z8jha7dhFfaipwhHhwcoqRi50tNqHMPb5EyFg54ZJtNuC/Aj2JyyemJXf1qPY/TJe6QpPVM8afK9rvG9UWj4fKrG6Qq3uafApi4gTwMF0SqItbgTiY+Ja26qSBoQ+QiLX
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 19:28:24.3526
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eca648e-fd16-47f3-4879-08df3d054a87
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY5PEPF00000E74.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9462

From: Syed Saba Kareem <Syed.SabaKareem@amd.com>

From: Siva Subramanian Ravi Saravanan <sravisar@amd.com>

Move the Intel function topology helpers and the topology device enum
to soc-acpi so that they can be shared with other platforms too. The
moved helpers are:
 - get_platform_name() as snd_soc_acpi_get_platform_name()
 - tplg_files_exist() as snd_soc_acpi_tplg_files_exist()
 - get_tplg_filename() as snd_soc_acpi_get_tplg_filename()

No functional change for Intel.

Signed-off-by: Siva Subramanian Ravi Saravanan <sravisar@amd.com>
Signed-off-by: Syed Saba Kareem <Syed.SabaKareem@amd.com>
---
 include/sound/soc-acpi.h                      | 25 +++++
 .../intel/common/sof-function-topology-lib.c  | 93 ++-----------------
 sound/soc/soc-acpi.c                          | 73 +++++++++++++++
 3 files changed, 106 insertions(+), 85 deletions(-)

diff --git a/include/sound/soc-acpi.h b/include/sound/soc-acpi.h
index 2ee303b791dc..aea47a42f43d 100644
--- a/include/sound/soc-acpi.h
+++ b/include/sound/soc-acpi.h
@@ -257,4 +257,29 @@ bool snd_soc_acpi_sdw_link_slaves_found(struct device *dev,
 					const struct snd_soc_acpi_link_adr *link,
 					struct sdw_peripherals *peripherals);
 
+enum tplg_device_id {
+	TPLG_DEVICE_SDCA_JACK,
+	TPLG_DEVICE_SDCA_AMP,
+	TPLG_DEVICE_SDCA_MIC,
+	TPLG_DEVICE_INTEL_PCH_DMIC,
+	TPLG_DEVICE_HDMI,
+	TPLG_DEVICE_SSP_JACK,
+	TPLG_DEVICE_SSP_AMP,
+	TPLG_DEVICE_SSP_BT,
+	TPLG_DEVICE_SSP_HDMI_IN,
+	TPLG_DEVICE_LOOPBACK_VIRTUAL,
+	TPLG_DEVICE_ACP_SDW_JACK,
+	TPLG_DEVICE_ACP_SDW_AMP,
+	TPLG_DEVICE_ACP_SDW_MIC,
+	TPLG_DEVICE_ACP_DMIC,
+	TPLG_DEVICE_MAX
+};
+
+int snd_soc_acpi_get_platform_name(struct snd_soc_card *card,
+				   const struct snd_soc_acpi_mach *mach, char *platform);
+bool snd_soc_acpi_tplg_files_exist(struct device *dev, const char *tplg_files);
+char *snd_soc_acpi_get_tplg_filename(struct device *dev, const char *prefix,
+				     const char *platform, const char *tplg_dev_name,
+				     int dai_link_id, int tplg_dev);
+
 #endif
diff --git a/sound/soc/intel/common/sof-function-topology-lib.c b/sound/soc/intel/common/sof-function-topology-lib.c
index 57e089f8e721..413d6f11a00e 100644
--- a/sound/soc/intel/common/sof-function-topology-lib.c
+++ b/sound/soc/intel/common/sof-function-topology-lib.c
@@ -13,88 +13,11 @@
 #include <sound/soc-acpi.h>
 #include "sof-function-topology-lib.h"
 
-enum tplg_device_id {
-	TPLG_DEVICE_SDCA_JACK,
-	TPLG_DEVICE_SDCA_AMP,
-	TPLG_DEVICE_SDCA_MIC,
-	TPLG_DEVICE_INTEL_PCH_DMIC,
-	TPLG_DEVICE_HDMI,
-	TPLG_DEVICE_SSP_JACK,
-	TPLG_DEVICE_SSP_AMP,
-	TPLG_DEVICE_SSP_BT,
-	TPLG_DEVICE_SSP_HDMI_IN,
-	TPLG_DEVICE_LOOPBACK_VIRTUAL,
-	TPLG_DEVICE_MAX
-};
-
 #define SDCA_DEVICE_MASK (BIT(TPLG_DEVICE_SDCA_JACK) | BIT(TPLG_DEVICE_SDCA_AMP) | \
 			  BIT(TPLG_DEVICE_SDCA_MIC))
 
 #define SOF_INTEL_PLATFORM_NAME_MAX 4
 
-static int get_platform_name(struct snd_soc_card *card,
-			     const struct snd_soc_acpi_mach *mach, char *platform)
-{
-	int ret;
-
-	ret = sscanf(mach->sof_tplg_filename, "sof-%3s-*.tplg", platform);
-	if (ret != 1) {
-		dev_err(card->dev, "Invalid platform name of tplg %s\n",
-			mach->sof_tplg_filename);
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-static bool tplg_files_exist(struct device *dev, const char *tplg_files)
-{
-	const struct firmware *fw;
-	int ret;
-
-	ret = firmware_request_nowarn(&fw, tplg_files, dev);
-	if (!ret) {
-		release_firmware(fw);
-		return true;
-	}
-
-	dev_warn(dev,
-		 "Failed to open topology file: %s, you might need to\n",
-		 tplg_files);
-	dev_warn(dev,
-		 "download it from https://github.com/thesofproject/sof-bin/\n");
-	return false;
-}
-
-static char *get_tplg_filename(struct device *dev, const char *prefix,
-			       const char *platform, const char *tplg_dev_name,
-			       int dai_link_id, int tplg_dev)
-{
-	char *filename = NULL;
-
-	/*
-	 * The tplg file naming rule is sof-<platform>-<function>-id<BE id number>.tplg
-	 * where <platform> is required for functions that depend on NHLT blobs (e.g. DMIC/SSP)
-	 * as the nhlt blob is platform dependent.
-	 */
-	switch (tplg_dev) {
-	case TPLG_DEVICE_INTEL_PCH_DMIC:
-	case TPLG_DEVICE_SSP_JACK:
-	case TPLG_DEVICE_SSP_AMP:
-	case TPLG_DEVICE_SSP_BT:
-	case TPLG_DEVICE_SSP_HDMI_IN:
-		filename = devm_kasprintf(dev, GFP_KERNEL, "%s/sof-%s-%s-id%d.tplg",
-					  prefix, platform, tplg_dev_name, dai_link_id);
-		break;
-	default:
-		filename = devm_kasprintf(dev, GFP_KERNEL, "%s/sof-%s-id%d.tplg",
-					  prefix, tplg_dev_name, dai_link_id);
-		break;
-	}
-
-	return filename;
-}
-
 static int get_dmic_tplg_dev(struct device *dev, int dmic_num,
 			     int *tplg_dev, char **tplg_dev_name)
 {
@@ -182,7 +105,7 @@ int sof_sdw_get_tplg_files(struct snd_soc_card *card, const struct snd_soc_acpi_
 	int ret;
 	int i;
 
-	ret = get_platform_name(card, mach, platform);
+	ret = snd_soc_acpi_get_platform_name(card, mach, platform);
 	if (ret < 0)
 		return ret;
 
@@ -235,13 +158,13 @@ int sof_sdw_get_tplg_files(struct snd_soc_card *card, const struct snd_soc_acpi_
 		if (tplg_mask & BIT(tplg_dev))
 			continue;
 
-		tplg_file = get_tplg_filename(card->dev, prefix, platform, tplg_dev_name,
-					      dai_link->id, tplg_dev);
+		tplg_file = snd_soc_acpi_get_tplg_filename(card->dev, prefix, platform,
+							   tplg_dev_name, dai_link->id, tplg_dev);
 		if (!tplg_file)
 			return -ENOMEM;
 
 		/* Check presence of sub-topologies */
-		if (!tplg_files_exist(card->dev, tplg_file)) {
+		if (!snd_soc_acpi_tplg_files_exist(card->dev, tplg_file)) {
 			devm_kfree(card->dev, tplg_file);
 			if (best_effort)
 				continue;
@@ -275,7 +198,7 @@ int sof_i2s_get_tplg_files(struct snd_soc_card *card, const struct snd_soc_acpi_
 	int ret;
 	int i;
 
-	ret = get_platform_name(card, mach, platform);
+	ret = snd_soc_acpi_get_platform_name(card, mach, platform);
 	if (ret < 0)
 		return ret;
 
@@ -307,13 +230,13 @@ int sof_i2s_get_tplg_files(struct snd_soc_card *card, const struct snd_soc_acpi_
 		if (tplg_mask & BIT(tplg_dev))
 			continue;
 
-		tplg_file = get_tplg_filename(card->dev, prefix, platform, tplg_dev_name,
-					      dai_link->id, tplg_dev);
+		tplg_file = snd_soc_acpi_get_tplg_filename(card->dev, prefix, platform,
+							   tplg_dev_name, dai_link->id, tplg_dev);
 		if (!tplg_file)
 			return -ENOMEM;
 
 		/* Check presence of sub-topologies */
-		if (!tplg_files_exist(card->dev, tplg_file)) {
+		if (!snd_soc_acpi_tplg_files_exist(card->dev, tplg_file)) {
 			devm_kfree(card->dev, tplg_file);
 			if (best_effort)
 				continue;
diff --git a/sound/soc/soc-acpi.c b/sound/soc/soc-acpi.c
index 270f9777942f..7e9d7b3c6b32 100644
--- a/sound/soc/soc-acpi.c
+++ b/sound/soc/soc-acpi.c
@@ -4,7 +4,9 @@
 //
 // Copyright (c) 2013-15, Intel Corporation.
 
+#include <linux/device.h>
 #include <linux/export.h>
+#include <linux/firmware.h>
 #include <linux/module.h>
 #include <sound/soc-acpi.h>
 
@@ -200,5 +202,76 @@ bool snd_soc_acpi_sdw_link_slaves_found(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(snd_soc_acpi_sdw_link_slaves_found);
 
+int snd_soc_acpi_get_platform_name(struct snd_soc_card *card,
+				   const struct snd_soc_acpi_mach *mach, char *platform)
+{
+	int ret;
+
+	/* platform must hold at least 8 bytes */
+	ret = sscanf(mach->sof_tplg_filename, "sof-%7[^-]-*.tplg", platform);
+	if (ret != 1) {
+		dev_err(card->dev, "Invalid platform name of tplg %s\n",
+			mach->sof_tplg_filename);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_soc_acpi_get_platform_name);
+
+bool snd_soc_acpi_tplg_files_exist(struct device *dev, const char *tplg_files)
+{
+	const struct firmware *fw;
+	int ret;
+
+	ret = firmware_request_nowarn(&fw, tplg_files, dev);
+	if (!ret) {
+		release_firmware(fw);
+		return true;
+	}
+
+	dev_warn(dev,
+		 "Failed to open topology file: %s, you might need to\n",
+		 tplg_files);
+	dev_warn(dev,
+		 "download it from https://github.com/thesofproject/sof-bin/\n");
+	return false;
+}
+EXPORT_SYMBOL_GPL(snd_soc_acpi_tplg_files_exist);
+
+char *snd_soc_acpi_get_tplg_filename(struct device *dev, const char *prefix,
+				     const char *platform, const char *tplg_dev_name,
+				     int dai_link_id, int tplg_dev)
+{
+	char *filename = NULL;
+
+	/*
+	 * The tplg file naming rule is sof-<platform>-<function>-id<BE id number>.tplg
+	 * where <platform> is required for functions that depend on NHLT blobs (e.g. DMIC/SSP)
+	 * as the nhlt blob is platform dependent.
+	 */
+	switch (tplg_dev) {
+	case TPLG_DEVICE_INTEL_PCH_DMIC:
+	case TPLG_DEVICE_SSP_JACK:
+	case TPLG_DEVICE_SSP_AMP:
+	case TPLG_DEVICE_SSP_BT:
+	case TPLG_DEVICE_SSP_HDMI_IN:
+	case TPLG_DEVICE_ACP_SDW_JACK:
+	case TPLG_DEVICE_ACP_SDW_AMP:
+	case TPLG_DEVICE_ACP_SDW_MIC:
+	case TPLG_DEVICE_ACP_DMIC:
+		filename = devm_kasprintf(dev, GFP_KERNEL, "%s/sof-%s-%s-id%d.tplg",
+					  prefix, platform, tplg_dev_name, dai_link_id);
+		break;
+	default:
+		filename = devm_kasprintf(dev, GFP_KERNEL, "%s/sof-%s-id%d.tplg",
+					  prefix, tplg_dev_name, dai_link_id);
+		break;
+	}
+
+	return filename;
+}
+EXPORT_SYMBOL_GPL(snd_soc_acpi_get_tplg_filename);
+
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("ALSA SoC ACPI module");
-- 
2.43.0

