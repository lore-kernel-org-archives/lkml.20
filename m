Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022074.outbound.protection.outlook.com [52.101.126.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AF853A8B6;
	Tue, 22 Sep 2026 11:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790076128; cv=fail; b=gel3lnH9iaZejt3FiSETjTxpr5JXPL67PwX25Bcmoaai2J9U1mnJHejJ0A6dnwIOC716og1GlPwYTMHGOrrBM+aljvMUNF1rUrxZvs5ThjC4M3rbyn3i9Y5Y8THX6M2WK8n6subhr9iQiiR6vC87JwHHsx++gqN7imwdeO5o0HQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790076128; c=relaxed/simple;
	bh=OrkltoyfCh6ydNxGAkycmmL7o+fiKOFLeIaarY5iihw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Gdkcb4VxF7aKlWSTumj9M6/0zCtfK4VAV7yKh7bztk3jQjjTG0DmlORXtznGWmUNzxa4G18vqIZsk/gY6mMOf4vMitFKI8egFz8XUNOPqkXKy4vdv+zezm9ChchCaPSoNqBJwVPfPQFpR9W0wi0Uhec2Qk8syVdHRiDOJfAmN+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NEXdr5KPkQt8bY/Fl8prbVMnq3bcttjNQA+Ix7CRYWX9ERRQKG0wduplePibVcOqzvRfuBuoPw7xiCHiRzQrgD8HBEKLGINb1SoikfrBRYmV2v2+KL4bjGNnap0rb4kppG8qNTOpaourq9LP3hhFkjS9lM/uHNCtMqUY7I5tyuvPGoGFZdbajxmp7/LF8zCeFJokpLCMMVV0vqk3HenW8I7izbXX18lrjb6y6A9QBCR21udXn15UsSZMJhh91zvP5XVZn9BAF/rvcHNlunP6/QrZHWQZf6ELw8KA590uFIF+AMP7+V0cnXLL+NWTkfZaP1U5koyIywUs5yVX13K1Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OkqNSn0Hs6gKeSUhV0IVboz+B/Xlnl0+vdmzIZFdm9U=;
 b=CRIEWhVeGtequ2anU94slSZlwBPu5qNRCch9Jr35e4hxY6nQ06YtCmt4Ll1TAiGk9ql+ApGgp7zty9M1LRiTlFwsj+rfBFF+KjDQbFgJiDdrS4O0L1ehvHkImP7JoSzaEKZmCIkILNcTiUGcOtP1OPlbkIUEpMlccG8bhAe6yNhn8us+OLgiEI5bEAxWvS1V3dOQzJ1H6yBCCxbXRC9ZUD4PuMIaKYCUk8ebR6kCss/i3wN1jRpdROFdNTjxF3CeRv7KfXtc+V/qv3OCG5HABpqpic6B9GKM+oflCwOS+p4bmWFNcV9P2rX3wlPze580GFyGIRTYaBDCqpWgLI5pNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR01CA0011.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::6) by OSNPR06MB9169.apcprd06.prod.outlook.com
 (2603:1096:604:47d::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 11:21:57 +0000
Received: from OSA0EPF000000C9.apcprd02.prod.outlook.com
 (2603:1096:4:191:cafe::3d) by SI2PR01CA0011.outlook.office365.com
 (2603:1096:4:191::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.13 via Frontend Transport; Tue,
 22 Sep 2026 11:21:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C9.mail.protection.outlook.com (10.167.240.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 11:21:55 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 5A9E0427F201;
	Tue, 22 Sep 2026 19:21:54 +0800 (CST)
From: joakim.zhang@cixtech.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de
Cc: cix-kernel-upstream@cixtech.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Joakim Zhang <joakim.zhang@cixtech.com>
Subject: [PATCH 0/4] ASoC: Add Cadence I2S-SC and I2S-MC controller support
Date: Tue, 22 Sep 2026 19:21:30 +0800
Message-ID: <20260922112134.4167305-1-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C9:EE_|OSNPR06MB9169:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4d611b1a-9947-415c-7f84-08df189bb59d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|82310400026|1800799024|36860700016|6133799003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	CmHUip+yOXDCQZ9kSGqxI1WO/iYcJVI5WbEaLSe+t3cw/CO6/dzfInphyU0M6KlE1h44YlklvLzSHao3nMr08tgQobcxyopEcpLl6WBz6X8IJPq7WgFS56rEHhcr7PLAZCZHOFLFU2xw8IH5dVwz4mQDSzTA/iFDG2lKnEIwZsv9YqtGhDc8A1d6PVV+UNzPwKBRUKvt6c0sgr61YsYge8fIy27cm1Bu1HQar7MiwyYoJLDJdS2R5VZCeZzO1bWFN8/Q8XhorEBwPKJfb6cOdta8D+I3+viGj+WDUKPmAMZHmRFCqsgYt3kHSGAxAirbnFLFGmBnBinJsLmtANCzZTdcYrx6NjtiTFWzZd22I01U4sRZcfVN6W+KDJaFA64RJYhpPxbB7SlWPn/RoiYK+xDbkfz2MV+pBcdgZP0l3jYlK8euJG/eOMiBZwDJ2vZ9xIQw3IL4ErF388QifWVnZ8wRHt+agtBIHkgYV3XxEzL72kvc3n+4xtjKUCAVo/gLHtz/07TF7rHvMSDoL6cHC2cpgcfFHJc26Gs1ZXK9BTbaunZ/ywSztXRn8vxmKn+tmRXidHvCVLXMPavHfj//H+Spgl7afieK13zq2mhwM2d0sSEvZ+3NppeR36bpTf1+FXl/NJ3Tb4YRwDguTblhbnnBRNIaOrUAluyB0zIejZAR0Apm03idNOXaQcApHZF8
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(82310400026)(1800799024)(36860700016)(6133799003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dGUqBiFLa/skMEgTruyranHBrBu7d/T+wKa3HUD2VVYZvk1zwVTnXfWyG1YzEHrUmHuPYFWG8DtILz7AXUTj08M7veLvlE3TE0QXlf/6Qn2zHJ2TvJdJAE+817waHWPv+0rlqeU1iHgfGMcu+cBaIofDZsnEQz1AofzKcX2jDivhExqKVF4LuUOgwW00uFW65wY5fAlh4V/0YZtyp2pUyy+c5LcV761QFeljRJj66ggyZKpHI1+Uk4yQIvVwypzVoeEeHdbrkQC+lEgKNO1WfF+vDMzKPhIPTvQ33W3/lRj95sNkDItQDcs6A+2z/VWmop7DhJQB+yUZ5oomGeFoQNZ6oQzozG2Kd+LuWLBsZtMKn8rvGG41++ijSbx/21mf8l5QYvK/IPoPQBEhfuxbK0sLNvOqDQfuBy8EdzkHJbLaUylqmtHWhd8SSecBlNuh
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 11:21:55.3706
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d611b1a-9947-415c-7f84-08df189bb59d
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C9.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR06MB9169

From: Joakim Zhang <joakim.zhang@cixtech.com>

This series adds DT bindings and ASoC CPU DAI drivers for the two
Cadence I2S controllers integrated in the CIX SKY1 audio subsystem.

I2S-SC is a full-duplex stereo controller supporting standard I2S,
left/right-justified and DSP formats, mono operation mapped onto the
left audio channel, and TDM operation with up to 16 slots per frame.

I2S-MC is a multi-channel controller which moves up to 16 channels
through a configurable set of its 8 data pins, each pin carrying two
slots, and exposes a transmit DAI and a receive DAI which can act as
clock provider or consumer independently.

Both drivers register the dmaengine PCM helper, select the audio
reference clock parent for the 8 kHz or 11.025 kHz sample rate
family, keep the minimum functional-clock to bit-clock ratio
required for safe clock domain crossing, and support runtime and
system suspend/resume with regcache restore.

Joakim Zhang (4):
  ASoC: dt-bindings: Add Cadence I2S-SC controller
  ASoC: cdns: Add Cadence I2S-SC controller driver
  ASoC: dt-bindings: Add Cadence I2S-MC controller
  ASoC: cdns: Add Cadence I2S-MC controller driver

 .../bindings/sound/cix,sky1-i2s-mc.yaml       |  124 ++
 .../bindings/sound/cix,sky1-i2s-sc.yaml       |   94 ++
 sound/soc/Kconfig                             |    1 +
 sound/soc/Makefile                            |    1 +
 sound/soc/cdns/Kconfig                        |   21 +
 sound/soc/cdns/Makefile                       |    7 +
 sound/soc/cdns/cdns-i2s-mc.c                  | 1149 ++++++++++++++++
 sound/soc/cdns/cdns-i2s-sc.c                  | 1153 +++++++++++++++++
 8 files changed, 2550 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/cix,sky1-i2s-mc.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/cix,sky1-i2s-sc.yaml
 create mode 100644 sound/soc/cdns/Kconfig
 create mode 100644 sound/soc/cdns/Makefile
 create mode 100644 sound/soc/cdns/cdns-i2s-mc.c
 create mode 100644 sound/soc/cdns/cdns-i2s-sc.c


base-commit: 4d4bc656580bcc448f8e6d6b3b3a903120eb29bb
-- 
2.50.1

