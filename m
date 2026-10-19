Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022082.outbound.protection.outlook.com [40.107.75.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974C13EFFD2;
	Mon, 19 Oct 2026 12:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792412467; cv=fail; b=n8mYxdWn8tZ95kX4Y6QD+p/KJH8tHbiTbL38GcqWN7QOxSaK0ZES7ZnRBPW7DG81Jz0zNI3wsNTpB29h6iL2zj9lgjpgFZJWSdenHIfo7U2k7CQntCtDSI+LeRDK5S7X4OrCzrwv9r0Bh/3mkkAPyK+OP4pj7yOYH0jFQmA1BQQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792412467; c=relaxed/simple;
	bh=kthlRknPYb8M2slktUb9hpOPBfx2K/YlIFeqwiChSqc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oJ5AdkAFKiH6Fo/B0MWpTAjzgGqe34jhGAjwYXQr1y3iQ6gQdZiNONuvwWionidWHRPwaXSk2HnJnRFPVqA25lWvx/CTK3snT54kH27HzNbRmnmuqzwhnGWhF21qoFYdU9FspyL8EvuvFF4oQ3/+pL30HkaNhwpqt9OWpBfbZ60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qkaDApiZ1GDNR8DUETIj9Drl/R4Zk+dZD9sLItoAp4EhCiXxuiYgHoxgaALhVf4LcvaAa3jHEguOfp93A9ZvyEPHf7eUe1E+dhrCEq2BP4+wjtG2gYLZiUtwMWysFKI/wcESd84brL/mQ4qOQoilw4UusrudTZcHpE3Gt/jaOx9vD+XCmVnYMWiLXv1qnWRc1do2dASpA4SbEMz6yGyAbx73KRxls9yRkRjAM7R37/7EuL+TL/4bFBCiG+yGb515oI8bVV9JziJ61193aNdRE+eH6v5SzdQ5cYHsEB5AglHl/ZcWoioUDsvbM6hjbwwTTSZCTLujiq8H40DgxXVKAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2APhm8lfa9Ft4CtFmrqQrgve6oSg6tOnLmbAdpv4hE4=;
 b=rtVySKE56fJT39VrVuBrLu1HB85EIdOLKH8w57Ye5jJzZ7pM2er+zrNhWSeS2wX7ylmYfibFWmN95Zn+M7nSv38kkC4JuSTkbPSCm7sBwg06OYsBO1Q0wyX64FQ/gt07DhHkpeGRjrSOJOPnitae3ZLggA7I9Uh2tWCiKwIM3XMWElzkZshKATyvs1MsC6ZJxNki7A0EBi5gvvFNuygpaqHged+waXOkQ01/M8tKVo3Ig09zQW2/PB59OHNHgY8ndLiKr0NjXXZL6Zpmqy9uolQIPEX+p2stFc6i51ELS3EmcujZ4dV/7BeQF6bCOAPpixA6WRczacu8iCGtZ5L3BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR02CA0033.apcprd02.prod.outlook.com (2603:1096:4:195::20)
 by TYNPR06MB8573.apcprd06.prod.outlook.com (2603:1096:405:3d4::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 12:21:01 +0000
Received: from SG1PEPF000082E5.apcprd02.prod.outlook.com
 (2603:1096:4:195:cafe::2f) by SI2PR02CA0033.outlook.office365.com
 (2603:1096:4:195::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Mon,
 19 Oct 2026 12:21:01 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E5.mail.protection.outlook.com (10.167.240.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 19 Oct 2026 12:21:00 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 01DD442C6446;
	Mon, 19 Oct 2026 20:20:59 +0800 (CST)
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
Subject: [PATCH v4 0/4] ASoC: cdns: Add Cadence I2S-SC and I2S-MC controller support
Date: Mon, 19 Oct 2026 20:20:44 +0800
Message-ID: <20261019122048.1107179-1-joakim.zhang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E5:EE_|TYNPR06MB8573:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 81393278-1690-4936-1b55-08df2ddb7006
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|82310400026|36860700016|56012099006|261009223027099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	5v03vraeNWfPdrc0S3lPFA6evZ/twkxmYDEdO8XMiHEee361Qopp1ZK4EC5YDi06DKxgEA6FPOavoRBb+LgBzhGxiQhf8Zi+MP5K9TTtWMpgjfOcnfImuwWdRAeiq1v6xWggIQCyS+g/CG1Ty0iPMpFlaEA6NUCsRpSf8MFEDZoj/2H16/NX1ws13RIzUMKr2oXJcgYJI6Pc6afVjKNGsHzz4Mp+GxOhfbycHA2drOHj5lRvXmh+BaJdoqUwUx8vDmMBBD/j8Gesr1QsNFTsk4K33Lon5p8jmoopTtDMziVHfFktjS4yx4jCQuHEUIEMQrSiAV8Pagw8b5LWHDPsgXpAurBlilXEhn1aG7Uqlb1tH8Zwn6shXrtQVdkUzmPCMUMo4OyoTk8TZXRyyl35AI5gHij61UcTCHdiJA1S8zv/MR40hk12OO1q81wxGUK0GSnC7CYGZwKPsXMIhhRx5dcmfB001Ke8wyb1fNwuacy6HaP+7IX9ku/Q2Albu7pXaU1MhiICT5/Aq11ErzZuWiCs4I+Kg6oVQ7bVQcdAVnhWvzn+t8jsm8z0UX/JpTXwSfMtJRptYIJ9TuUrL9q+wiUA7yfiYL+lmbax29twV0MtzfrvBTyg8HmTcAByliOd0FF58YDse6q7jysZlIgXAZdmK6E62pMrVezcs81cpg+JF+uj3rtm//6NgJURE8zGm2WNbiJz+UKEJ8u+hCpo7A==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(82310400026)(36860700016)(56012099006)(261009223027099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NxZQ0W1D7VoAWzIsAMOJddjOxz8eVmyQrhJXygPDHCHDy+mkECTwGP9r0JLqS4d8kzktAbaVWWBhauopU27PZVDc5imr+VqPblU9MBOBflKf6sD7G6Wc3FaAHcnK7ZDNPjMYko29d4Y4QJpZZ4q3SK5XA1Fr4HymOzlHOP5nd9XYMVOLDFtTk/s70C4n6ovr+2/ReipeXkO5hGbRoRh+T5qIW3vnwdOLiCPXWd0uu4p0Sbw+iULPakRTCjJLSNZRSS8TBt2MLpjPTnfKWZwC/O82WTwtIAy8jDPcMBFIrN/PhlDAU9p749QE8r+svDl+paH5xqGjR5dUZ9zFJ/IH/YoTwhEnDDYBlrZgdiiGkRxfunhzBrN0nzuhXB+9GBqcGQ4fM71GlXA3vCO+3AYyswqgJBAIIVvVe3rhXl9E0k35TWvRaVFS1H4ptiwVItHf
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 12:21:00.8774
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81393278-1690-4936-1b55-08df2ddb7006
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E5.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYNPR06MB8573

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

Changes in v4:
- Enforce the dma-names order in the bindings: a single "tx" or "rx"
  name is still allowed for single-direction instances, but a pair must
  be "tx", "rx".
- Drop the DMA controller stub node from the binding examples.
- Select REGMAP_MMIO; a COMPILE_TEST build without it would fail to
  link the regmap MMIO users.
- Include the transmitter and receiver synchronizing-unit reset bits in
  the masked register write of the I2S-MC DAI probe, so that the write
  actually programs the state its comment describes.

Changes in v3:
- Add the explicit <linux/bitfield.h> include, which a W=1 build of the
  FIELD_PREP() sites needs (both drivers).
- Fix the probe error paths: disable the manually enabled clocks and
  drop the runtime PM usage count on every failure path, unwinding
  through a single goto label (both drivers).
- Return dev_err_probe() directly instead of logging with it and then
  returning the error separately (both drivers).

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

 .../bindings/sound/cix,sky1-i2s-mc.yaml       |  119 ++
 .../bindings/sound/cix,sky1-i2s-sc.yaml       |   89 ++
 sound/soc/Kconfig                             |    1 +
 sound/soc/Makefile                            |    1 +
 sound/soc/cdns/Kconfig                        |   23 +
 sound/soc/cdns/Makefile                       |    7 +
 sound/soc/cdns/cdns-i2s-mc.c                  | 1128 ++++++++++++++++
 sound/soc/cdns/cdns-i2s-sc.c                  | 1166 +++++++++++++++++
 8 files changed, 2534 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/cix,sky1-i2s-mc.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/cix,sky1-i2s-sc.yaml
 create mode 100644 sound/soc/cdns/Kconfig
 create mode 100644 sound/soc/cdns/Makefile
 create mode 100644 sound/soc/cdns/cdns-i2s-mc.c
 create mode 100644 sound/soc/cdns/cdns-i2s-sc.c

-- 
2.50.1

