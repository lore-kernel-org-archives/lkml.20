Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022075.outbound.protection.outlook.com [40.107.75.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519E137E2E1;
	Mon, 28 Sep 2026 05:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790573796; cv=fail; b=Kc4gCltkHcvhpH2syBrD5qzw4Gv4UiU5JGUAwHZfzDqvOeLkCILIJ/iaWFABvTKScbxgjHn+GTySh3oycb2MXs9GZdiMF2CMAtRnsvDQCGI//LBNh4S5FgV9NJ5TVtoqA+J85FjwfFgaivUjGl5fHiVA1x6tEY3WHPpTVpMQRhQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790573796; c=relaxed/simple;
	bh=fg3egYSV3T3lz//XoCmeYl03FaZf7ST4PdotI4e5rgc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gpLO6Y++gDf4eTSwxNp2VtFFtc7qJ/SSi6AnJ0A8TvKbeaYXFMv7rUToaebAvlmSjb7j4+1do7bwxayaYd8+lNipXmDDYpEX5hLlzUPlBfUoLZsxCN8wdd0KWMyhlT1c6FTSqLNC6DPoi9WF7Wi8G07eb3CA5fGgTen2neQpGuA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i0U3pNfl31dvguWTxPj6oVjw/aw8eRxWe3s42xRLjsGjjKPhEAZ7CPQc8cfUjXYk9KpwCIsupWrTZTnrY/PpkvpQE7M43g88gxiSgny9WnzhXsboQAj1PG3+NgW4dYxbECR6kHEOef9wE/EW3Y2Z4VV/fGVHwvZl6OYerZ01VkNVKis4UfcTQ93EyZuqpfmPL9xB2QuLYkjlMdLs5/daLt+N5ZGtmYDfkrloQr4nUTt+fheBNhYSRv3QHTLg8omxznk+lLWnQUMmfEPDrA1HCiXYkI+Xn6gO2YG2NuPbKo4hFgNq/aZ0HGhMmTbMA+8jvKBjXNZIOQZHjJ0DyHgbPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a1d+BX0LWDOmaxlZOSsFVl4teabkjDG27YohcXb6xPY=;
 b=oQOpGPsZrXFV7zgygcSkmOvU50ZsEEWs3ChHT5d2M8vy8429x/ZuBeXL9HQJI9OitPrUlpx/ox3XLWCBBWBPKIyf5jJNfdZJN+/9K8J48F3zTj72CDgOmBUMA687HocyWFGHpNMnXtAaAsUKdbzAq9qouGnD0P40+tJkSVoCKwwktAkx5ES6KIei5tDsvTgXiabgCkMKc8J7c2CJg2pWDhm1s4CO1hZ1Vwncz38j6f73C2anYK2dcRA6vzzKcxdO61Xt05oKyHVx4i4tiJ4e5Xc0CIYunE/SOWgh6UZRsnT/2OMrBJ0ofjRpYJ2af9tKKuEClrhtwkNzWPm3My1IzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI3PR01CA0010.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::16) by KL1PR06MB6324.apcprd06.prod.outlook.com
 (2603:1096:820:99::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 05:36:30 +0000
Received: from OSA0EPF000000C8.apcprd02.prod.outlook.com
 (2603:1096:4:296:cafe::1c) by SI3PR01CA0010.outlook.office365.com
 (2603:1096:4:296::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 05:36:30 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C8.mail.protection.outlook.com (10.167.240.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 05:36:29 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 5721543B1074;
	Mon, 28 Sep 2026 13:36:28 +0800 (CST)
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
Subject: [PATCH v2 0/4] ASoC: cdns: Add Cadence I2S-SC and I2S-MC controller support
Date: Mon, 28 Sep 2026 13:36:09 +0800
Message-ID: <20260928053613.2158446-1-joakim.zhang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C8:EE_|KL1PR06MB6324:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b8a0afc1-8fa3-481f-5bef-08df1d2272d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|7416014|23010399003|10067099003|6133799003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Dp4THVtMSpNsj1JJg5LY/Mpq7JiSfbmSj/QlA/qegogDXyKFlftZX4cDheoNPgB2PEZ7O7cKdoIcWeksjRTcbl3qCKs/pFkrsi/FCmBC2hl76Y9d3WtaEzR+I9F7H6/Z4u5LBEqVqw6szrT3TlawuHHuYvQTPKuGQIuffHMxwvTSiFfDDEMUnY2BwgsCgIjN6kN5k6Z4M/7F4qzNMApmEveQFykq7/RGFp6bTE0VbkgK7T3DwMJC5DjcAGkJ1LD7/GS/qxkuhde82YWG5cpZf+79N6xqJYxtHpEjI2h5DdqCc+iepo53WL9LoT6aB6e7i0QV9u4uLIoUCu3FDIDF7hptD1wWFnfzL9lQJu/QLEHvLvOEWO9n49pcPLyxsajXY8y8227adxqOQ4U+RGngj78ejKFPW+Zp8EG0kdFNXc6IdB7SSKkXXcv71b07n/hbzJ5bYlTO4B23L5dGLTEJ+YPjcnuHM06mkvo/wjXvgFGFxxloK5ydABfrm4zvrgxJjmKy/DV+WYlY/bUwXfsLH2kXXnRBnouEc98NeTSJxDlNUuq7Pgj512uDNBYHFkPuw0eaJJV/7xP3diLynuMjB6ZSZVQCwJPu0ZSConyujF+Gchwm/vwSn8f0zIZJJh86fFFNQToJ+6h1n8q6+LHrqvPpm4wgQfamuipPAhhswvkcCt+DdIsxQeEQNNNV28mZrjHxOZCr6QCJA7/MkXxVNg==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(7416014)(23010399003)(10067099003)(6133799003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BKah87uJeBUWX9puwPQx1PdfwEQeu/fqTKj0k7QjzqoByxEa8SKApuYMRUxFPn2Lri2wExv+RVzCB6mM0/gJqY8JGBVjqBZ55oExvsHXCi+ZPSLMKkwnEsxQGB+JiwQ8ZOh5T4D/ABf5SRS6oC+SlyK0LRW8enVupHH4uDMVd5dIxzU7HlLJPcLEl9zHSv75ca7u7ZWKj4wLtiDD8U/ueLeo1b3kxhB/9V4NrqTZC1I3Ok8Ll7tAeI5YbtC43bdDAXf9M+X6td8JR+s1A2AziFJSPwUMD5TNfO3euR9NACPZMVAIvvGziwGZ2+O9ooUiJwPPBd4rwbH/atugObHfPD66n/VU1APan1m49c8qJ1HOkZqv36WNrFuV1JUI+AJQsbfnG4dIc6Z75r5HrDAx8gBh3PUXde2eBtHKwuO8xHOfT8pGPz7zBGILR0ybo0Gy
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 05:36:29.8515
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8a0afc1-8fa3-481f-5bef-08df1d2272d5
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C8.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6324

From: Joakim Zhang <joakim.zhang@cixtech.com>

This series adds support for the Cadence I2S-SC and I2S-MC controllers
integrated in the CIX SKY1 audio subsystem, together with their DT
bindings.

I2S-SC provides full-duplex stereo playback and capture in standard
I2S, left/right-justified and DSP modes, along with TDM operation
supporting up to 16 slots. I2S-MC provides multi-channel playback and
capture through a configurable set of its 8 data pins, described by
cix,pin-out-num, cix,pin-rx-mask and cix,pin-tx-mask, and exposes a
transmit DAI and a receive DAI.

Both drivers register the dmaengine PCM helper, select the audio
reference clock parent for the 8 kHz or 11.025 kHz sample rate family
and keep the minimum functional-clock to bit-clock ratio required for
safe clock domain crossing.

Changes in v2:
- Move the IRQ request after the clocks are enabled and the reset is
  released, so the handler never runs against unclocked hardware.
- Disable the IRQ before switching the regcache to cache-only mode on
  suspend, and re-enable it only after the cache is synced on resume;
  check the status read in the ISR (both drivers).
- Replace the manual runtime PM bookkeeping with devm_pm_runtime_enable()
  and drop the remove() callbacks (both drivers).
- Switch to RUNTIME_PM_OPS()/SYSTEM_SLEEP_PM_OPS() wrapped in pm_ptr()
  and drop the __maybe_unused annotations (both drivers).
- Serialize the shared transceiver clock state in prepare() against the
  trigger() state machine with the existing spinlock (I2S-SC).
- Disable clocks in the reverse order of enablement (both drivers).
- Sort the cdns/ entry into the vendor list in sound/soc/Makefile and
  switch sound/soc/cdns/Makefile to the '-y' object syntax.
- Clean up the includes and initializer style (both drivers).
- Add a NULL check for the match data in probe (both drivers).
- Factor the MC transmitter and receiver configuration into a shared
  helper.
- Drop the compatible string from the DMAC stub node in the binding
  examples.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>

Joakim Zhang (4):
  ASoC: dt-bindings: Add Cadence I2S-SC controller
  ASoC: cdns: Add Cadence I2S-SC controller driver
  ASoC: dt-bindings: Add Cadence I2S-MC controller
  ASoC: cdns: Add Cadence I2S-MC controller driver

 .../bindings/sound/cix,sky1-i2s-mc.yaml       |  123 ++
 .../bindings/sound/cix,sky1-i2s-sc.yaml       |   93 ++
 sound/soc/Kconfig                             |    1 +
 sound/soc/Makefile                            |    1 +
 sound/soc/cdns/Kconfig                        |   21 +
 sound/soc/cdns/Makefile                       |    7 +
 sound/soc/cdns/cdns-i2s-mc.c                  | 1121 ++++++++++++++++
 sound/soc/cdns/cdns-i2s-sc.c                  | 1160 +++++++++++++++++
 8 files changed, 2527 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/cix,sky1-i2s-mc.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/cix,sky1-i2s-sc.yaml
 create mode 100644 sound/soc/cdns/Kconfig
 create mode 100644 sound/soc/cdns/Makefile
 create mode 100644 sound/soc/cdns/cdns-i2s-mc.c
 create mode 100644 sound/soc/cdns/cdns-i2s-sc.c

-- 
2.50.1

