Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793962337;
	b=qlXFDOa7Gx2Y7FUjaTm4eR2a7khU7kHzosQMkdO6fLsoa73g4yzc83OOESyA2USN9rP6
	 NHW3ZTeUvP6U6cWZeCLpzBZaNx2Jmq/WLSfwx0tKsyeKr18UghRzJZxxbATw6SQYFrIy2
	 F0AurBUx/JjaBSXEXVkfeFI+kiENVyDBo1bcKxILD9iWH4jNT7ikkRQG47SYoJZ4la1M4
	 F78leIZmUD7YHLgfUfQFZ7RhkgcbaWuvOx0FFw0i8rwoIWoxPZRiYGzgRginAWo/0dZiS
	 aJ2K4uo9piiNAif4RY+aVftwbNoF/2w6QNIO6whr1ToLUxyUAD13Nc7oSXySFmbJwNw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962337;
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
	bh=zjEFtYnIJemLeHeDk1qbheAF0TEXUiZkbC+PO61IwB8=;
	b=tT4FOJ5S5UCY/2u/uUfyFq9GsacDmVuqzLlN5RXv/AXkVI669Ob5xHrUnA8koK/l5Ycz
	 pW+zfH+pBB0Pf0iFOFhi3SJ5e/gqXL8OFFDHqTnGy/IEhbQLtQ0sSqai1oLEYyqxvUnAE
	 9NcZ6K6zCsiUkZ1gST6Ja6pGW+9Y5sVDodKJpp+ENJ8tHQWiOusjaQkZW/66nJCrRqYeB
	 kpVJ3z75vYBSq9bWuHa49TmbQFW+9ErnWt5oMgwRxgO5FwvAqmQQ98ohUXy4vMUWT+2TF
	 by9xsWc+nP7gHbAuJ/VPwaraLw6Lx979froJJRswIJ//MaC262fZKiLh3NdkMCXzwig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.77
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022077.outbound.protection.outlook.com [40.107.75.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EDE606A32C;
	Fri,  6 Nov 2026 10:52:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2EDE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q+Zq2F5pu8WExcx9BSZ8SyrUpLO85wOwC3TxQ3Za8d/AUN8aLk9+/y8SypRMalOQOz2Qd/dvxsJN9M0te/PLrMkoLHhq5pUS+Ifom1K3ASSG/VBR30NPTZUjkt+QNhK8+NGflIJnL9lR5+hro96rzSx4AVTdRzSqzadFkw8ZaTn7N55GjaNGamSzuFRVrZfi4NeEsP9BlJa3ETMsEm11W3SM3pBnNh/rymXYKBC0W6BDE5B+fVvXnAMokSftEXUUGpR+3eo7RHNCbtpubHANlVXnxMCog+dF/47Rob0t3EMdSwtSwAQ+MjsxdetAfcdDzcv0rIsYH3DKYWA5sAgCAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zjEFtYnIJemLeHeDk1qbheAF0TEXUiZkbC+PO61IwB8=;
 b=xeV0aArMSS1bMwNW3p6keLolOuD378lHq1cfkAUstpePD/H4JLUzT6c0Q28VktbXpu/gkSSH7Y+y461CS8FA104uh1PHBtL/803n3AbGwmTc6GQMWodlqTsKGuiPzMBoT32Wzvc4n0dgD7TY87BE5HDZMLBDAd1zZq8qXCvM3CTLufjgfivvfUxr/PiaD2IjPrkseEwPY3LGX20ogyEsOsxGpNPVdhSxrV7oYOQjSqNf2PyZKH0770s4eC/1Xd8XSxmzwdPBza8NFWWIDA5DRQYXL4PVPV+ool967zS7U5B/j3DRNc2tFaQP629ZSxETcysA6a3AGX3vhI1UOnUK9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR02CA0036.apcprd02.prod.outlook.com (2603:1096:300:59::24)
 by TYZPR06MB6113.apcprd06.prod.outlook.com (2603:1096:400:335::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Fri, 6 Nov 2026
 10:52:13 +0000
Received: from OSA0EPF000000CA.apcprd02.prod.outlook.com
 (2603:1096:300:59:cafe::46) by PS2PR02CA0036.outlook.office365.com
 (2603:1096:300:59::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Fri, 6
 Nov 2026 10:52:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CA.mail.protection.outlook.com (10.167.240.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 10:52:12 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 1EDCC4102E61;
	Fri,  6 Nov 2026 18:52:11 +0800 (CST)
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
Subject: [PATCH v5 0/4] ASoC: cdns: Add Cadence I2S-SC and I2S-MC controller support
Date: Fri,  6 Nov 2026 18:52:04 +0800
Message-ID: <20261106105208.1246554-1-joakim.zhang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CA:EE_|TYZPR06MB6113:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f4222d0e-adff-4542-d691-08df3bf40373
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|7416014|36860700016|1800799024|23010399003|6133799003|10067099003|18002099003|261102123227099003|56012099006|261021121427099003|261022075727099003|5023799004|261026140227099003|261028144727099003|261022105027099003|261026121527099003|261009223027099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	58gr5CIHT/v3p4mpRvnYsbwUqdfuM2pT8W65gO0pQ9GigES4xC5MnnFcmyEtuPK2VxNDIOROIs9phMauatVYP1HP9QaU2Tqgubt9fvVKbwBt5gxMGu487al2MSx0w7MWMvOplfyARL09lYh4/KBO39E3tR/AgirV7Wh4boiq8PxfFHHWnS5hyawgOTVO4Ra/O+uko/ujxgio1rAUh5zafLIdZT/fIlTxQ9Gn5Ef1b1W02C0qA1z2tON3h8VascDEiGFMjf0VMhzbJzT/Fzw0gr4yHFf9pnMlqcgcZc5LSJguVimrYahYkxIsyPZTo0F23jyEIK75XP8/o4oYTS6APqp4ZD4iFez8dt4ElDwIuCi/g5/xUZccVNmIP14aFdoWAX3UNTVDV9xx+9+upT7mDWYRrTeo28nrp4bpxaG0gNfqxR/mL1mQr63GXv3xrYJuyyxgI2kqHhohF0OH5BshEEHbOmlSch22IW4nBWlzmD7FD0sUFtwGjvLaSRlSo5g7O8G5wRcepg4mBOo9ntRYGpR1DZp+rG8R0KOeXtH2iq++GHCGlgSEwkJJ8GpzGC+pHpzE4X/puQnRlj0qSUO7XrYeas2xf5p2TCbk7GLQcHfFlfcmq+HF28CH0yI6JN5Bwgp2kVLBJQ9Mh9C1CW7uX1oS0+TYP2VxWfxQwVYhbfD7YD5Qi2BQRmQQwJoVUx8HVqC47+O6ua13vTMRmpYYiQ==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(7416014)(36860700016)(1800799024)(23010399003)(6133799003)(10067099003)(18002099003)(261102123227099003)(56012099006)(261021121427099003)(261022075727099003)(5023799004)(261026140227099003)(261028144727099003)(261022105027099003)(261026121527099003)(261009223027099003)(261021123027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+0J+llzrkkNXwjnRkHwZKU6GkBoyGc5dy/aZUGfb2JaL5y5r2qf5W3dgz9yUjmyrSLVv/s7oBP5vMaKB+6PhowiNZshJd9poJ+ggd92S9/pawzHi2YgHDdUJn0UUXVFqSKzzI61G8FeaTdRGCLt97SHrIDVHYRp2yxcBbERmBNUvLZMHkzaOM0/yNNAc00qWxY9jUABav89EtFAyb66GH0S0te/iInhmWNVKnP5u6BU6KGvitYtB92E2DhGkev1kjrN3zGst1zEja84hL6xlyD438uCS7HMSrIdvrWiIG7dyE7HB7TWhEcnL5qnUSAc9OVWOuT6UrW3nXqLmpe0GQz5zQc2aGLMxmIB8nUyRlQ6azqKlyeeY3qXJLZsuUKwPbNGKE5G+oE9Gdtdqd10fgQ1a2LW712yfSCrhKbK8SSRkpB0q+h51yMNnBqddWblq
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 10:52:12.3800
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4222d0e-adff-4542-d691-08df3bf40373
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CA.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6113

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

The two binding patches are unchanged since v4 and keep Rob's
Reviewed-by tags.

Changes in v5:
- I2S-MC: fix the DSP_A/DSP_B mapping in set_fmt(). The DATA_WS_DEL bit
  was assigned to the wrong format: per the controller implementation
  specification, data aligned with the word-select strobe (DSP_B) is
  DATA_WS_DEL set, and data delayed by one bit clock after the strobe
  (DSP_A) is DATA_WS_DEL clear. Swap the assignment for both the
  transmitter and the receiver.
- I2S-MC: return -EBUSY from hw_params() when the sample-rate family of
  the new stream needs a different i2s clock parent than the one already
  in use, since the transmit and receive DAIs share the clk_i2s parent
  mux; the parent is compared with clk_is_match().
- I2S-SC: let set_tdm_slot() switch TDM mode off when called with zero
  slots, which is how machine drivers return a DAI to standard I2S
  operation, while still rejecting negative slot counts.
- Both: rework the probe and teardown runtime PM handling. Enable
  runtime PM only after the IRQ is requested, unwind the clocks and the
  runtime PM state through a single error path, and gate the clocks in
  the new remove() callback when the device is still runtime-active;
  this also covers module removal with CONFIG_PM=n, where nothing else
  would disable the clocks.

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
 sound/soc/cdns/cdns-i2s-mc.c                  | 1152 ++++++++++++++++
 sound/soc/cdns/cdns-i2s-sc.c                  | 1171 +++++++++++++++++
 8 files changed, 2563 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/cix,sky1-i2s-mc.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/cix,sky1-i2s-sc.yaml
 create mode 100644 sound/soc/cdns/Kconfig
 create mode 100644 sound/soc/cdns/Makefile
 create mode 100644 sound/soc/cdns/cdns-i2s-mc.c
 create mode 100644 sound/soc/cdns/cdns-i2s-sc.c

-- 
2.50.1

