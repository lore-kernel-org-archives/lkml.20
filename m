Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794899446;
	b=Xc2FoA6eQe1JhYMFKXaaZ5ypogZJ2BK/3We98jc5EUPJJDIiRH1WxSaMzC9ULzhzhLCF
	 V4tbx0NZetYOOLuUsAp1BiWR406bj4m78Gkn3V/F7fXYLRQNx/uddN0g0vPnV6WkgynnF
	 1LORBWI3+1sMGc/f+0NxdktD0QW2f8vpTW5demDcI8nwc3ny76dYNY7BbjawAvVleVSjD
	 oksUr5rtsbZLmoHAfQuInn8Qz8GbgvSSfCVhduWQ3R+hCuMInUy0g61IZ1h90RMpzoAZS
	 ycxbhJUkAanlysroD4CYosxE+hhsK1SPHKUmh79QHlXk8XtNs2sHW5KFju6l2V8QE/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899446;
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
	bh=7Yh7g6+ls0YXloQW4lcXcbUh9g1Cu6xfmR8M8g3ZcQM=;
	b=Jx3KuiTcOXj28FqLtuQnD+THKxpTmQiZvGgdetSbvVgSzrRn9SxzruvfdfdckfDQEMlu
	 nOsHZRXhBRpxhTGAHb/ZOMWdposesmKRJ2xg1VFYgcAdE69UxU23pL3BsTxC4I8j1L2+A
	 JNc7wdilj/KEWhdAKkAxG4Z2OPCN2dORo6UwWd6lKQoe0g12L2y5TLLxWyeidcc6QsB9T
	 ltFgE9HUR2yzhiTeJoaboM3L5dTn0F70i6dJXT0xl6aLxy9wFCWqCVX+giiTBv7/eo1Xw
	 XS/VFZm3SQ/TxiZUBI8CEVTK9HMgckJNL1C1lO3hEKvep/9lVO64Uy9BmWqffnCaKNQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=kML0aFxu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.46
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013046.outbound.protection.outlook.com [40.93.196.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAECF606A32A;
	Tue, 17 Nov 2026 07:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAECF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=kML0aFxu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XQ2HxWfozp91G94xxResyVaVK9O+JhZvGHAgDTSlQ+SdiHSPr8CZ/CPTpLuX69c6GyIWBDMzCQKtEPo/KaJHXb1T6iwvHLfGcfqxgsTMRQizk1yY32L1Uexx3u8iJ+waf9X/e3aK9J4RhPC6tRowag8FShWMJ8b2yBV2EjQ3aP71IJNgHBn7OzaxGqYdTsA6wBP8P/1KH701S0+NFzaOVoAerKs9JFQ5VUoda5db4/JkNt1/25aiz79No6uo2fiSsC10X509HdM0VacV2/S3QrV7A2fvDLllW/Svfz6m5dIBGDCgwKM/TSfNvTdPCHAJ/5YcjM5JXwrGDHYbQ5ZzJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Yh7g6+ls0YXloQW4lcXcbUh9g1Cu6xfmR8M8g3ZcQM=;
 b=Wi8B+7Vgd4qhl6JyYOTD7rUIa+Ac+s/KDB/abkJBoY+X+tgDMexQ2VqZZpwgm4d1oqfpjhHuoz7a7NHp0pIsROaR/Xj6VY9U6ZxWmcVlfTxtdGFH1XUL/htrbpkiAVVon+35aqEUPCIZQ+FEKi++OFNhF3jJPPkL7fyPe+oezcZdVTa3xExmGltblE79gWVwhwoF02Vr2YG9ZeSpivI38co1Qwh9tfg14gl7mYAgvRjim1gwjNy+vRs59NrUINfQl4qtqJFffVb0hh7/y7RW0aDzk/7KwwjpDa9enCoJ0giauVeiixEFmsgRh3B6D9etYVCrha4FBsPVm1ZMCg9RVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Yh7g6+ls0YXloQW4lcXcbUh9g1Cu6xfmR8M8g3ZcQM=;
 b=kML0aFxu4sdqE/5KwRob/R+PQth4yMKhl2POP88tNr2PgD6D6GzlIrtnv8NcXYqDwZQVAGfn4mygVVd849ckXPErX220Vlbx6insAsX2T/Lmgu9Jhp5BOWP8C+fZsq5+uu+iCOS/K51CtKhiKXDbpgmDt84J9NEo6l5SldyM8F8=
Received: from CH0PR03CA0015.namprd03.prod.outlook.com (2603:10b6:610:b0::20)
 by DM4PR12MB6277.namprd12.prod.outlook.com (2603:10b6:8:a5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 07:10:42 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:610:b0:cafe::62) by CH0PR03CA0015.outlook.office365.com
 (2603:10b6:610:b0::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Tue,
 17 Nov 2026 07:10:42 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 07:10:41 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:10:39 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:10:38 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 17 Nov 2026 01:10:35 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v6 04/23] soundwire: amd: track full pad teardown across suspend/resume
Date: Tue, 17 Nov 2026 12:35:39 +0530
Message-ID: <20261117070906.803139-5-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117070906.803139-1-Vijendar.Mukunda@amd.com>
References: <20261117070906.803139-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|DM4PR12MB6277:EE_
X-MS-Office365-Filtering-Correlation-Id: b3842ff3-4676-4a0e-75ae-08df4479e432
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|10067099003|11063799006|56012099006|261026121527099003|261026140227099003|261028144727099003|261021123027099003|261022105027099003|261022075727099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ycLQ/Vx22KXy4WMhW1cqeCoGACq9cXzasGAmNqftZs/bhdjHeArmnAf/yYSskQVhkZAi1Qqa+Bw36GMiz+cx0PpCjaK/FFSSYQeVWutQW+GQi6yMsyg6L6A370jjTfikh7NTReZZQ0O0JQ2FeQ2IFIrLK7kBkrMG+8N9pgJkJCysR6yAdMBIs8aY2tyd8ih4vA1piGuEHssxvv4nzwPzLNGFnhNA1jdxReBEOlpPPXjXWKFLrLLIhIdr1qufPNMZRobrz4uJMKPwg2P0bPJJNjBXLwl5PvrgOCStWQcIZp8sjBY+9DgOMtuEkcN1mEmmcB//VsRCQ5y/Zrb/mdgamkNvaOA23L15IV5UtwXVklVDLS0lMkEMOIQHn1g2FOUQDlTC6tJ1vvc+1llDiNgwFgdBZ2eJ9l+mrhMtm+/f8QXkkroO8p3I70RDn5nF5/7ktGbAbb1viDKRG+iR+ZLNf5dIgOVtfB8VHfJ1u8ZUIjPhcXd7HCCDYm9Io+vw72kYl4odssDEYfKsIzrXOvOlAFteKu8bYi8V2z1ez55aHj3LlO485KFIfdw9UrvO7PKM1LzI0koYKh8X3YpP23eFnvt0UqBocBnDoFYfOgbCq4wLByY8fkrdXD5gX3xQAHBXKcCCKJGW8zeX1dmVShSeLSA+jI6YVBR1LkMgipyBtWc34DHBZ8AAZVgVR0eUyQ+mj+8tn0Tisn+DklY9YaP5uQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(10067099003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261021123027099003)(261022105027099003)(261022075727099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	34zw8NDb3oY2T4tO/lYPxwLxD56IGQTIbVvhk24RR6woza93N1SSTiiSsDae0GaEiqyP36XCx3cS7FSXbTYZq6933GDhpKtByorR9o7qO4ZX+3U8DL7U+JqI64zFRllUmkI73EJz6p25Ziq3kB0E9QlNDY3x7yDG+LQJ2NOQmd39QG31kDXu0HeFE2eGiYhoIBsijqXiE0h4pdsK3mMWdLNVR4TbtNsLSOdv5ItoeOWY86JEkQvHaHbnqKm0cCevTPe28w+4uosb+VfHZmMl8acYc16qNXB1XryJGgcEzrr2TUmHUTUJ+HiccYFdM9KimgBEsStT88oUzSXHeYWCp1hB5OM6PHfynMZ5BFozPCnSVKtW73rPUQHMaN0f2aGyxeecWfXlJm/ClQVWdwhHQzpUNoILxmmzfUj7ZqxrawOzzwsilk0ChLIiIiqxqYDE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 07:10:41.9829
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3842ff3-4676-4a0e-75ae-08df4479e432
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6277

amd_sdw_pad_ctrl() performs a full pad teardown (keeper, pulldown, schmen
and OE) for system suspend, while amd_sdw_oe_ctrl() disables only OE for
POWER_OFF_MODE runtime suspend. amd_resume_runtime() must distinguish
between these two cases to restore pads correctly: a full teardown requires
amd_sdw_pad_ctrl(true) on resume; a POWER_OFF_MODE runtime suspend in
which only OE was disabled requires only amd_sdw_oe_ctrl(true).

Introduce pad_fully_torn_down flag to track when a full pad teardown was
performed. Set the flag after amd_sdw_pad_ctrl(false) in amd_suspend()
using amd_sdw_pad_ctrl_supported() to gate the assignment to revisions
that support pad control. Clear it after the full restore in
amd_resume_runtime(). On resume, restore all pads if the flag is set,
otherwise restore OE only; both paths delegate revision gating to the
respective helpers.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c   | 12 ++++++++++--
 include/linux/soundwire/sdw_amd.h |  7 +++++++
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index b21691652490..28f5dbe131dc 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1418,7 +1418,10 @@ static int __maybe_unused amd_suspend(struct device *dev)
 		if (ret)
 			return ret;
 		/* System suspend: tear down all pads */
-		amd_sdw_pad_ctrl(amd_manager, false);
+		if (amd_sdw_pad_ctrl_supported(amd_manager)) {
+			amd_sdw_pad_ctrl(amd_manager, false);
+			amd_manager->pad_fully_torn_down = true;
+		}
 	}
 	if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
 		ret = amd_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D3);
@@ -1510,7 +1513,12 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 				return ret;
 		}
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
-		amd_sdw_pad_ctrl(amd_manager, true);
+		if (amd_manager->pad_fully_torn_down) {
+			amd_sdw_pad_ctrl(amd_manager, true);
+			amd_manager->pad_fully_torn_down = false;
+		} else {
+			amd_sdw_oe_ctrl(amd_manager, true);
+		}
 		writel(0x00, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
 		if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
 			ret = amd_sdw_host_wake_enable(amd_manager, false);
diff --git a/include/linux/soundwire/sdw_amd.h b/include/linux/soundwire/sdw_amd.h
index 470360a2723c..c8bd8e1a4771 100644
--- a/include/linux/soundwire/sdw_amd.h
+++ b/include/linux/soundwire/sdw_amd.h
@@ -75,6 +75,12 @@ struct sdw_amd_dai_runtime {
  * @wake_en_mask: wake enable mask per SoundWire manager
  * @acp_rev: acp pci device revision id
  * @clk_stopped: flag set to true when clock is stopped
+ * @pad_fully_torn_down: true when system suspend performed a full pad
+ *   teardown (keeper, schmen and OE cleared, pulldown asserted). Cleared after
+ *   all pads are restored in amd_resume_runtime(). False on initial probe
+ *   (zero-initialized) and after a POWER_OFF_MODE runtime suspend in which
+ *   only OE was disabled; in the latter case amd_resume_runtime() restores
+ *   OE only, leaving keeper and schmen untouched.
  * @power_mode_mask: flag interprets amd SoundWire manager power mode
  * @dai_runtime_array: dai runtime array
  */
@@ -106,6 +112,7 @@ struct amd_sdw_manager {
 	u32 power_mode_mask;
 	u32 acp_rev;
 	bool clk_stopped;
+	bool pad_fully_torn_down;
 
 	struct sdw_amd_dai_runtime **dai_runtime_array;
 };
-- 
2.53.0

