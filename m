Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.106
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793792032;
	b=Kykwiqm9ks+sz9SG432ubHBPFxRLpUPmqZCQV6CU1VfZX3qcbmPRuqfWz0/A77iES0Li
	 vwdMP91nS+S9H4a4EiDuRfnEwL6qTNecvroJrLrJZP16RM6yoKGc0bJVcm26Dk+WHd2b0
	 ydFr0FPG5i9B3BbjLt2Pd1jPMvvVhzBinqYKg5djVBbqi7yW5MgHhygjVoeW+S7XeGRpg
	 MCH6rGY/xUe7wUAQafW9rrV8mn0XT7+VLzZ5OGOnetIycvipxfoalLx3xnpaDWectd9Hb
	 3gL2JU331Lt/BRTOR8Sg9lJqOQbxlXxDS+S8yMsyTxM5r8p/Ric3OIuI9EK/oSH9byQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793792032;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=iLRmmarQrutlcpUJnkZ7FMmvPx1rvpOHPDTMLMisppI=;
	b=eNJNu20cFPnQgz/xYp+2R95JRPoancCjJgKj0s9Zn/5DcNhTYfiiPrqEoVY1Roe/kNSw
	 lAKjwYnu4uHw+BNkApfm+XiItjC5hFOnkEwxXAP7e6gqnt/rCjCNe6otzFinBJyy4TNu1
	 FMURsy0MEt7qVXRWIUMpJE4ZQjCk/OvJLtUtjnPd4racfixq0ldS6Chgj/7Qajtq6aTdN
	 E61TUdgOQUxXd1cC9X8rLlW2SduD9yEDAKFq8jeblI9GEOdCQbJcTouMgDF1P/9zRYPsY
	 sEkWNZmrQqwb3DjrJ6hlObXmUvoIpbCtdyWm/75e1kDbYJ8diN7tYUHNpXRZZ0hsWyQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.106
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023106.outbound.protection.outlook.com [52.101.127.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700D6606A328;
	Wed,  4 Nov 2026 11:33:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 700D6606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D5Q+TgvYb5q4HnCshVtuYU1M0xy4XHUqaTndSuQsEfxFrY6eQe2Amyf4rnwHevLiFKxuyP8lid0dmDUSGYRNJhnp36bsof86+XLvd2DXL9CxK/bIw6GoTryTQM8thkLR/Yg1YqheXpyI1Wof7GEd50yx6PUDeF7BL4PRBLOfFP6JBhbhJUuetTLI0+4EH4zmBVgDvYCK+LUMIdeKShtY+dAgq2w5z1k5jqLcJYzMqg5PxD0re2CUuIeUxwWjO/TS2ixGQFtPNoFWo6F9v7fBcHr4YeL8EMx8Tl10wVOoJ51yYLmzO1aiK4HFypQTxky6zhWv19HTvNe5VdPNLeNESw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iLRmmarQrutlcpUJnkZ7FMmvPx1rvpOHPDTMLMisppI=;
 b=uPU93ejvG9srRQyaBAXxneHsmH0KiBcC/y9FVPFeDYhaS+YgtAQ1wQbUL57ntkE/JqK8d8KCVWIm6WhrQzeBkbOiIXA3S7I0caVQVeodPNUDJ7w4SLqu1P8bRip5TtS4lt4hW4XOC2Hzb+9D5NQFqUvZE56U8qALPvzERQClvn7142B7j4c0K38o4zA1uRlQj2t4Qxxr9lLoHyMwJFS1rn+Qih3Hhz1sOqDKFgam+28LJJ0diaXnMptxXCAjKbwY6ptvanRJmbGqHvRsA1Q79D2/d4pP41/YZpx/4A06Wr+rkTH5uQ9r82N8/I27PN6/syahzXLNeDPEtrPBek3oDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR01CA0033.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::23) by TY0PR06MB5442.apcprd06.prod.outlook.com
 (2603:1096:400:31e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 11:33:47 +0000
Received: from SG1PEPF000082E5.apcprd02.prod.outlook.com
 (2603:1096:4:192:cafe::ad) by SI2PR01CA0033.outlook.office365.com
 (2603:1096:4:192::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.9 via Frontend Transport; Wed, 4
 Nov 2026 11:33:46 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E5.mail.protection.outlook.com (10.167.240.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 11:33:46 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id C65AD42CB741;
	Wed,  4 Nov 2026 19:33:44 +0800 (CST)
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
	Joakim Zhang <joakim.zhang@cixtech.com>,
	Joakim Zhang <joakimzhang@cixtech.com>
Subject: [PATCH v4 RESEND 0/4] ASoC: cdns: Add Cadence I2S-SC and I2S-MC controller support
Date: Wed,  4 Nov 2026 19:33:38 +0800
Message-ID: <20261104113342.3660269-1-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E5:EE_|TY0PR06MB5442:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7e1f6429-38fb-49d7-69f0-08df3a677d4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|7416014|376014|82310400026|1800799024|261021121427099003|261022105027099003|261022075727099003|261009223027099003|261026140227099003|261026121527099003|261028144727099003|18002099003|261102123227099003|6133799003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	k6EAaK/fyGKbw0RUiHsb0rnSs+ah594bmt8Y35UFOou0dWks/lSIo0rZsDZ3d4CCxSwntaftpyGEAaNZ8zk1fdOg8vSaeOw79vYPKk8Wjq1erypXHQ+RVPS+e5XLbjr1qk5pb/kmKp3iDXi1bU8hNzbTHGD++36jDdfTtKNLWUHB6RCiFaiu0QUa3RsP8oqq3EhqfwKoCfFDeqcxRlXut7aB2IvL8zXzW+9tylla+gYvHPt+zBRNwiVIC4cEDnD95n+vflxR4Y681blCSOuF1Oc3uL5S3qdvdTqRGOBGz6Bk/iuSHPyG9hNp0h3RAUjc/DPmySbJnYmDsXd0SIL9ObGdL96elLRc9Gi0b4a1SzRSTYGTLi9KIRQLmNnsixaOkCMkQee7mvz6PjGJ1fbYbOo+F19w32ITIEzicqF9CF4SvCC+o2RVphBNMWmT5+qDCty+lFIYvPWFx+L7MGGaNMqeZ8eWi6FggB+pWRnMQSuigM0GhHM/eo9g4ldYSVqVriTPXzsJPgCpPWyuporK5kNM2pe6YIzBdFUk42au9uXRPVdsGKBtJdWO6fpLPNJVwGLz6E4byRmeN491ZoSU32LOb1PskvlVyFmZ9hVAK07gFud5oeUJCAy+UA6C7nr54fwJ4yWIN9uVvJUMk4uXd0dXsTz6gDzvNGWujvlHn7WLQB09nNKYBBbBZqVcauRXenjo8c7n2WSn0SGHbfb+3Q==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(7416014)(376014)(82310400026)(1800799024)(261021121427099003)(261022105027099003)(261022075727099003)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(18002099003)(261102123227099003)(6133799003)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	449FNjPpYLRkV2ZhFqA4Es2o9OAQFGBfvlQJOlgKglCKtbBGUI15YbDQi5F3nMBbR9aPOwjnYaVcVRW3PIIL90XwzoAMnUX28XxNr4lED+OwELDl/FAJ1K+7FwZtGINUWsC5K1XldsSSHkOmifz8EqUu/3nr0iP8l78OACh+dwkh1anOBqu/yU2+RDozRkjLsh+vqfin6m2U2exHPBKvkPyquDnRmn3BLhOMbAE01sxFoxvV24JN56JMJHYsR00cqKYoFOKlpD2bIaHSXdx+nu3Xoi2KTmgW6IZk0rjD3LdZY4Hy7imNO2sXwhE4X/PzVbtpqcV8VY2jvJlAFpJe033YCmKZkOY9NqepmCKRTyg0+1zZ95w1hJLemqYBOyKIwjvgpYnLqBd+I1vDQySYo8xaU7fNRKjGK7UYZyluK0sm5+MoNrqWbfk5lYmtmDrM
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 11:33:46.6132
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e1f6429-38fb-49d7-69f0-08df3a677d4c
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E5.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5442

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

Resending to carry the Reviewed-by tags received on the two binding
patches; the patches are otherwise unchanged since v4.

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

Signed-off-by: Joakim Zhang <joakimzhang@cixtech.com>

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

