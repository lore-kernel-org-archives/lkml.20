Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012035.outbound.protection.outlook.com [40.93.195.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B464751476C;
	Tue, 13 Oct 2026 15:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791906477; cv=fail; b=U1njqE7W9mR2+db7F0D0lMCvSvZg6pIH06gt+xV5+qm3miwAl+tDMPAkyHmG5V5LsXz4dNLhf6fX9yewe+TI46BdNMRLUNa5wQZavu9b7y6ZAbke85q2zTT8c5GgmmUq92yW4T/pNX+uAWy3t4tsE16Y1/mQK/gQ2TexCbudtVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791906477; c=relaxed/simple;
	bh=grHL63Vu4IFddOGUgJNl6TsV4fZnj/KRmwqFoTgfGV4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jFq7Ymtu9zkMLLu1xkbmGXxfKXMAm5wNuh52k0QmhpsQS9JmdqIT/uhiYRh5ru4XgBG6kbw6JAEifae3y64V3HdkfLFLFqr36nLk6/JmZO9DLp49H4lAiH1vJj78XZlM9FzJO0MIJa8UHkfnN5TcZiCbcVTC2I/ffo+2FQEMU68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Xipq6SHa; arc=fail smtp.client-ip=40.93.195.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Xipq6SHa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c8b6VRFmXqK5P4NWq/Q3zthb+54Kh4eMPxczKsoOfNGRYehAh83lOndnw7wAGAehGgCzE3RFKncg2KgGO9pEvZ0GYZtJ9q1QvLy1Fa74iNs7WuO/KoPbfU9N+yqSgwcaWoABdHZPk82Cqkj9CG2HeVx6OcC32P7VGvGmcgft5csaaJaKSQ2LkissBIlXTSjMnNdQVrPciGtFJ7Ui1BGo5lfLDgFqZNJzuMAgbu/VOvsUWnLTdFEybV7pGYO3CA8EGmtKu5physpmWkNuofaoroAK0e59TDEYfdPdWQIEPfNe4n5cyi3gH+Lp/DDGWuJXf9AqytTYfAnTpqzBIAaRHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2cRonvBjTtyqV+nuH7m2ZcvTXvCGu9XezJ3DS6V0gVU=;
 b=e44//HFGVXnEtgeN1r5t06JKCai9I2vuDrZJJF9mYCvK/wDdmmrZ5vk/EkQLBCOFsE8TfTbv623t2cIkALk+4wpJVEQv3hVU2HKnXHqj0PNj2V62KErXAQ2U/OSKzsRklsTBmHBru41Qrv/j03kSG2S1DAwiuEa7ZeTjEz3rHitk/883gXy1SqTsarxryHE7bTQo+rM36PV6zGZU1nfRBPorg8jkmk6N1FLnktLuIUQz0smvoDFXriC2kbFNqV3XBjQin8cioI5tz30uqpLCUxXCM8X8/Yot27Z00sP5qMsV93mGpzF7MBkBFeAnbRnuJVqmnp8gItF76BblYuyPIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2cRonvBjTtyqV+nuH7m2ZcvTXvCGu9XezJ3DS6V0gVU=;
 b=Xipq6SHahXkWV6K8nT0m9Hv9J/NoY3GUdtjGxosTE+dgxJVFVLZ9kE6VU+JHoHa8FHpk7833B6kfibt7Mj5Om+epIvvN+5O6LxheJnZ2X2WwL/BXD+bZH/A6HuC5kJxErmtPnkY6k2YhrpfNS+feVvAxWPt9sZZ/wVNh+RFuHOU=
Received: from DS7PR03CA0151.namprd03.prod.outlook.com (2603:10b6:5:3b2::6) by
 IA1PR12MB7735.namprd12.prod.outlook.com (2603:10b6:208:421::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.18; Tue, 13 Oct 2026 15:47:44 +0000
Received: from DM2PEPF00003FC9.namprd04.prod.outlook.com
 (2603:10b6:5:3b2:cafe::4) by DS7PR03CA0151.outlook.office365.com
 (2603:10b6:5:3b2::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Tue, 13
 Oct 2026 15:47:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DM2PEPF00003FC9.mail.protection.outlook.com (10.167.23.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 13 Oct 2026 15:47:43 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 13 Oct
 2026 10:47:37 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 13 Oct
 2026 10:47:37 -0500
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Tue, 13 Oct 2026 10:47:33 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <yung-chuan.liao@linux.intel.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>,
	<Vijendar.Mukunda@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <sound-open-firmware@alsa-project.org>
Subject: [PATCH 0/9] ASoC: SOF/amd: ACP7.B support and ASP carveout firmware loading
Date: Tue, 13 Oct 2026 21:11:32 +0530
Message-ID: <20261013154644.3788064-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.48.1
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
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC9:EE_|IA1PR12MB7735:EE_
X-MS-Office365-Filtering-Correlation-Id: 7492ee74-a645-4e68-8332-08df29415226
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|23010399003|56012099006|11063799006|261009223027099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	4rnYn1ziMS/tENRV63uXb3ks3UE2Qy5uDtOhiLXe4yAK1hLvtYu2yOJWwGRkJO2WEl85Y9FDiL1hrajM+f26wKk3rD3a8QucXkP59PbQfFYTyz9UhFyD0rxtkUB+YesTijON7DKwG0a6vX00g6La20j9GfT5BcP+7cwjj0B7i8us9llnSc9K+wOtOGsvH4Svb4usFmUfp3tQZIW0K4VdE8d5Zg3UhbfkU33MXQOp0SWHqTieb5S40DUPUAEEo3R5tsj4br4GbimLWd07yiRi7FHGPENUOcCngJibdeqJnCZipHJoDYLzTqYLmjyplDuMJFAnO51fc+Yxaonbx611oG6wStGW4GuEJALyZLO991pvo1hYrZXoVqtRpmkrUWgDwYCYMFDVjBgiP3k6jHqA67+IPfWN8qcwyU9zLaadBjBEfZ71XAZwtY3qnSbG6UGrTaN2TvUjJAetjDXZOQfImy7gHvAqmVVrm1JE3oEf26NlK3bx5tBiI99dgGUAVOYCfsHboFQNKSRRQNaLyUg+uKUUlId153N72F8W12HW+9AiM9RAmI4mGVdlf+CpZpoKbGN5qkzF6hERIEpMwD3PjV0ieVCTZe6PRpZXDh4h2/6auY0o8Z45LnMg2FSVvpYwb0W69TxCidzB9WDfai/O0lxohoBHgjv/bzexIZGPMVKFKC3NhNujOckRmhqlBXrjLBlTZArvXGtoJceFreH0rQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vMdD8pWWqrWSLxDB2cxzpYM0Y8//BK70XtfPfysG3NaD87q2JOfAxiKe/laVgH66EsONxEDE48xKHQC16LUZUxHhgdzk3dS6+a6jIBmN9llMFABusdHw8/omOnEfRfhPVju3pvQGgQOq5QeGYBBKMamqoPhioiEwkiZQmiM1fIHl+4ax2EQjhq5YRZ8e2fT/Ct3osOi6+QQ/nq2ed47v8Rl46lycMaQrKj0IZPioj7dEQnKXsKTXzotqmTTzNjT2NmtAzO5mnt6V4EFV6pmG1pHvPeiKRCIawxDqH81eBr3GqMbc13hIelB79SE5XLxzzyv9M4cgucaSpEcdx+ebKzVbhf3kPza0tX9EbAYf+MUT7XipJycbUbL21ZtYlzt4+QelQOq5KWjswKbqhQ/+HodGD5hrU3AvazunQ0ib6LzBJJyGBSCGY9t/ZzB2Xogp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 15:47:43.6995
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7492ee74-a645-4e68-8332-08df29415226
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM2PEPF00003FC9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7735

This series adds ACP7.B platform support to the AMD SOF driver stack
and implements the ASP-authenticated firmware load path required by
both ACP7.B and ACP7.F.

Patches 1-2 are preparatory renames and restructuring. The existing
acp7x machine table and chip descriptor are renamed to acp7f to
accurately reflect the hardware they target (ACP7.F). The probe
callback is restructured to select the per-revision descriptor via a
dedicated static pci_device_id entry rather than encoding it in
driver_data of the shared ID table.

Patches 3-4 add ACP7.B hardware support. Patch 3 adds the ACP7.B I2S
machine table with its driver name, firmware image, and topology file.
Patch 4 adds the acp7b chip descriptor and extends acp7x_pci_probe()
to select it for ACP7B_PCI_ID revisions alongside the existing
acp7f_desc path.

Patch 5 propagates the PCI subsystem Vendor and Device IDs from the
AMD SOF machine driver into mach_params, enabling downstream SDW
machine drivers to use them as an SSID.

Patch 6 is a cleanup: register variable declarations in the ACP7.x
SDW wake and PME handlers are consolidated to u32.

Patches 7-8 address PDM controller selection for ACP7.B/7.F. Patch 7
introduces acp-mach-common.h as a minimal shared header for types used
across all AMD ACP machine driver variants (I2S, SoundWire, and SOF),
and moves struct amd_pdm_pdata there from the SoundWire-specific
soc_amd_sdw_common.h. Patch 8 fixes a gap in the SDW machine select
path where pdm_sel was not propagated to the machine driver, preventing
acp-sdw-sof-mach.c from configuring the correct DMIC DAI link on
ACP7.B/7.F platforms.

Patch 9 implements the two-stage ASP carveout firmware load path for
ACP7.B and ACP7.F. At probe time the driver queries ASP for the
physical base address and ATU group of a pre-allocated 32 MB MALL
carveout region; probe fails immediately if ASP does not support
carveout. At load time the signed firmware image is sent to ASP via
the MPASP mailbox VALIDATE_IMAGE command. ASP authenticates the image
and deposits the raw binary into the carveout; the driver then
SHA-DMAs from the carveout into DSP IRAM. On D3->D0 resume the
carveout content is preserved, so the ASP authentication step is
skipped and the driver restores directly from the saved carveout
address.

Vijendar Mukunda (9):
  ASoC: SOF: amd: rename acp7x machine table and descriptor to acp7f
  ASoC: SOF: amd: select descriptor per PCI revision in acp7x probe
  ASoC: amd: add I2S machine table for ACP7.B
  ASoC: SOF: amd: add ACP7.B chip descriptor and wire per-revision probe
  ASoC: SOF: amd: Propagate PCI subsystem Vendor and Device IDs
  ASoC: SOF: amd: consolidate local variable declarations
  ASoC: amd: acp: add acp-mach-common.h for shared machine driver types
  ASoC: SOF: amd: propagate pdm_sel to SDW machine driver via
    mach->pdata
  ASoC: SOF: amd: add ASP carveout firmware loading for ACP7.B/7.F

 sound/soc/amd/acp-config.c             |  22 +-
 sound/soc/amd/acp/acp-mach-common.h    |  25 ++
 sound/soc/amd/acp/soc_amd_sdw_common.h |  14 +-
 sound/soc/amd/mach-config.h            |   3 +-
 sound/soc/sof/amd/Makefile             |   2 +-
 sound/soc/sof/amd/acp-common.c         |  17 +
 sound/soc/sof/amd/acp-dsp-offset.h     |  58 +++
 sound/soc/sof/amd/acp-loader.c         |  64 +++
 sound/soc/sof/amd/acp-stream.c         |   9 -
 sound/soc/sof/amd/acp.c                |  91 +++-
 sound/soc/sof/amd/acp.h                | 107 +++++
 sound/soc/sof/amd/acp7x.c              |  11 +-
 sound/soc/sof/amd/acp_asp_mailbox.c    | 559 +++++++++++++++++++++++++
 sound/soc/sof/amd/pci-acp7x.c          |  80 +++-
 14 files changed, 1005 insertions(+), 57 deletions(-)
 create mode 100644 sound/soc/amd/acp/acp-mach-common.h
 create mode 100644 sound/soc/sof/amd/acp_asp_mailbox.c

-- 
2.48.1

