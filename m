Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013042.outbound.protection.outlook.com [40.93.201.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D08133F8AD;
	Fri, 16 Oct 2026 09:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792144022; cv=fail; b=ebT3lB217TOkcviVRfRRJU40xp5wurZdSBzZy2RxOucZ2NXlRMo0Baj7NwXsbHmbyrHwfF52iRVMBU1HlPvAbhpVC+rJ06X0vKmAmlA7Iimkx5rL95VeAR28phkSuCxWAMGMxMh9zjKzXTtR9aMWSkf6MKxyWaAPgnx7LCijkhk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792144022; c=relaxed/simple;
	bh=qtMQZk1fdsgfOOnSftU1eJWvJlHckDTGGEZi5JZQeVo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JxX+zz32TMGOIjhSlWbeKAnFl8WcocM72qOCTh1Y2YgsurQRoP2Qf5032vvTjoX4dVGYQqboyyoDjIJuGnsa/2tWgduL61BtGnVWl+pOTs2xcOAkv4mSCvvgIz6AzP4qR90zHLz6nrAzKAP/V40uK1TcYIB7i7bV5z4T+84dZxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uzkmvHq2; arc=fail smtp.client-ip=40.93.201.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uzkmvHq2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IkEF9YnpPnCwYcYwkMOyxEMOe0EAqmAr3yYdAEr4m3Jwn9+p5psHPNZWwiRcxP2WWkessDYtoOTs7engO+2i+ztsUvDLEmC7dIow+ubE7hv/CQPyqT86HMWjYSey3d84gdDHPTZGXlJAG1eCl35MXGO6nogpgIqaJK5MucqKLe57y4gXLT8C1tJ1R2VzqOoAY4Xxdu265P3kQr22cUVgPL56V/WpF9ktPlo+duWnhOXnH61VtOGm3J/VcX5czcG2b3oYLyDBjpSE1sXDfAhLRbRMLGEh4XuefyRUeUW6lU0pfHb+Dixbw5vAnVRJQbO95v2YtmpL6r0bm6ePdntNag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kn66B2RnXN4azYuL1+97OCaW/SVNH/83tlXJgfJmUvI=;
 b=u3ESrc/20wk7vlK8BJAIMH59hKqGgjyr+0pKi+0JTTeb+artWKuQOq+PeV0l8T+3zlrSAqNghP5eJop6Y5HyA7U0SBJcr+nX806ycT56vu4duAJYC6lJ34M1u0kdkVELkr1u7heH+42EA1F+gx8Jr8S6RBm/PfwOI3EzoU9wdnGMnN0kIPsxqdgMJfzKBf94nSmch2EeyRExpNXPoy2xz1NEKyj4Ku7pqUA765RiEfOz4gVdMZ5qnPaVLgSM46BIBPdHqdRpFCQGa7GSMfj/VH5iNXkH1sSbeJsjc/HwNO65E1zKClr7yHNEdyBFUbK9vG3GDkIFDC6XRQaIizDQuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kn66B2RnXN4azYuL1+97OCaW/SVNH/83tlXJgfJmUvI=;
 b=uzkmvHq2e8dJ8iLXJQd7nDH7lGONlWoA3SSxjZT2o2Ss15CSoDGjfCDjrBNnrHsHxGwlmYG9NtlDBjwjkpXaXNfpnan5lO5TNeHIwlXMT529CD/mK8bhSx1P+wzHL/lzECS21UTrLr4Rzc2y9dejjrwgcXl3GvQLUrwxQ6hnS38=
Received: from BN9PR03CA0280.namprd03.prod.outlook.com (2603:10b6:408:f5::15)
 by SJ0PR12MB7473.namprd12.prod.outlook.com (2603:10b6:a03:48d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 09:46:54 +0000
Received: from BL2PEPF000352CE.namprd02.prod.outlook.com
 (2603:10b6:408:f5:cafe::2c) by BN9PR03CA0280.outlook.office365.com
 (2603:10b6:408:f5::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Fri, 16
 Oct 2026 09:46:54 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL2PEPF000352CE.mail.protection.outlook.com (10.167.249.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 16 Oct 2026 09:46:54 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 16 Oct
 2026 04:46:46 -0500
Received: from xhdasiikbal50x.xilinx.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Fri, 16 Oct 2026 04:46:42 -0500
From: Asif Ikbal <asif.ikbal@amd.com>
To: <neil.armstrong@linaro.org>
CC: <jesszhan0024@gmail.com>, <maarten.lankhorst@linux.intel.com>,
	<mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
	<simona@ffwll.ch>, <thierry.reding@gmail.com>, <sam@ravnborg.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, <michal.simek@amd.com>,
	<naveen.gaddipati@amd.com>
Subject: [PATCH 2/2] drm/panel: simple: Add AUO B101UAN01 panel
Date: Fri, 16 Oct 2026 15:16:38 +0530
Message-ID: <20261016094638.2958431-3-asif.ikbal@amd.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20261016094638.2958431-1-asif.ikbal@amd.com>
References: <20261016094638.2958431-1-asif.ikbal@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL2PEPF000352CE:EE_|SJ0PR12MB7473:EE_
X-MS-Office365-Filtering-Correlation-Id: 50571df1-f2f1-4389-76c2-08df2b6a692d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|82310400026|23010399003|1800799024|376014|18002099003|22082099003|10067099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	wWlrgRaAd2ZDhI9r/rrmW9uBXx9xJy8Fpa0i8n8KzY+JR/mZfkJMqR/+yBTOWDylhgTRFtEnevMvk3iYahW7AMPPcnpdI9RJoFyKS7p30EdDCuenU9hh/nMEstXss6R7YGHjWWqYPvpur61VccTGeW+5fy8v2C5d0L/eW52A9S0fCGGhEsO6Jec+Jhu6B5Zxj0MkTkII5jVkTB6jerBM1QCHMb/1Xryk+FzA5GaZT6Y/a2Udc8/DgQ4piFTdV/uY/CkoTtnpokX2oKoy+uF68hmKPsXBHsOAQjsfGJoVgkWxECVw2vr6EWmYxu9wjBE9ignmYqNlrubblNqtG+tFMCHKVDSwpJ2f0U2vYMf+aM3omBo8CG2byT8qi+DNF4B9tp+lUgvp2yd0oRWmVpoNCMKIRKElicUWMUXb7FdD5Z9wopaolpp28lGUHljVP44jN53lRP/u0gM5ZTSnXqvV4/pYgvm+LmWo5Riuox5+SRL3Fdf2BJsiu7YLkArK7bl64HyaWlJNTvqDcYs7hLX87XzPnhMTqcfCOuDYbehtkUajQ+tqRXW2lR6/VhwEnCIJALqiInguB1r/L4gsNW2L4JVbw7VFoBtlV1K40wIWV+TnkGsyoyrBdrUYt6InuXUxejC1viSizpAvYjQkufl+n3pVEXITPb0zfU2G6a7tkzRW7RK+C+ekFgb5tIfLMMPJzKSO/6qntEAMDvI0Hwu3SA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(82310400026)(23010399003)(1800799024)(376014)(18002099003)(22082099003)(10067099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IDtH2PbQawICbzQWv975RxQoY23j9Tc3SGxpn4DvbE8cq+ta4CW3i6rCd2L6P8bB10sh8UAUqSfkReennCHqWSqbgnPD+Kn0fpmU3PytL2t7EmAoErTPDhmXtbPAlDXBOeRwQ4gu7rumQlx42SN2kpCTWrXBAZYNobJTBnygNyS2QIU1ha6Cwm7Y/8dSEpZEGJ6oHV9m29yyuvqfdhuR4MxksWVo8Cei7rYa4Dn27SK5hwGmgU8nBLddn4/gWP72ympLPVXnUBLMElnymfZsv+vhmL+x/Sq6EqQD6f4hofQ0eZqKWxCP4BoVbWQ6BLdgLlZ+V9vLUTbACfqsCMxg1mL3bQSM4xDWNbAir1PnFQfmfQ0pKm7AbLg3eGCOb1EkwuW2j2It02e40z9efW5aUz2sF3uh2ITlXfT6T+vT919iXom9Ey8sFKLWUxPBbke2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 09:46:54.0580
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50571df1-f2f1-4389-76c2-08df2b6a692d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL2PEPF000352CE.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7473

Add support for the AU Optronics B101UAN01 1920x1200 10.1" WUXGA
MIPI-DSI TFT LCD panel.

The mode is taken from the MIPI interface timing section of the
B101UAN01.7 (H/W 1A) datasheet and gives a 60 Hz refresh rate.

Signed-off-by: Asif Ikbal <asif.ikbal@amd.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 32 ++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index a944c34642dc..46ec17b6c365 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -6389,6 +6389,35 @@ static const struct panel_desc_dsi auo_b080uan01 = {
 	.lanes = 4,
 };
 
+static const struct drm_display_mode auo_b101uan01_mode = {
+	.clock = 148350,
+	.hdisplay = 1920,
+	.hsync_start = 1920 + 40,
+	.hsync_end = 1920 + 40 + 40,
+	.htotal = 1920 + 40 + 40 + 40,
+	.vdisplay = 1200,
+	.vsync_start = 1200 + 4,
+	.vsync_end = 1200 + 4 + 4,
+	.vtotal = 1200 + 4 + 4 + 4,
+	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+};
+
+static const struct panel_desc_dsi auo_b101uan01 = {
+	.desc = {
+		.modes = &auo_b101uan01_mode,
+		.num_modes = 1,
+		.bpc = 8,
+		.size = {
+			.width = 217,
+			.height = 136,
+		},
+		.connector_type = DRM_MODE_CONNECTOR_DSI,
+	},
+	.flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE,
+	.format = MIPI_DSI_FMT_RGB888,
+	.lanes = 4,
+};
+
 static const struct drm_display_mode boe_tv080wum_nl0_mode = {
 	.clock = 160000,
 	.hdisplay = 1200,
@@ -6572,6 +6601,9 @@ static const struct of_device_id dsi_of_match[] = {
 	{
 		.compatible = "auo,b080uan01",
 		.data = &auo_b080uan01
+	}, {
+		.compatible = "auo,b101uan01",
+		.data = &auo_b101uan01
 	}, {
 		.compatible = "boe,tv080wum-nl0",
 		.data = &boe_tv080wum_nl0
-- 
2.43.0

