Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792430144;
	b=0S4Xbe7gfmEftnpE+tW7jw4dkNuHTRqdipGWG/j9XxDy6h2x+murXa1H3mqAzb4EM9w+
	 siSbCQnvQDeb2OBlwMXGq8sKueTKI8AGBCO+2Sg51bhkc2WYGrzynhxueeBCVXQ0PGzKc
	 49GFsBlOkXLwo+th/fpqfnJDQ3nAPR82CnQwbIROQaxDiWzBVBzMlElcWmp6FFhqK+ZcX
	 uW/qfvvsvR0KjN5AYSx7Axdi1OM4tcLrLcTBLifJy1A19EIHXGYa9TQSwnO9N5w5ltmhW
	 t0dANZz+PuYsPkHGYyqw9hot0+xvzYqbcC0q9rcIhBGgBPSljzkyQ1HB0W+eCvntX9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792430144;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id;
	bh=cG5xrX9QqSeMx2ZjAs83pHr9hHusqEvEX7bER0iIoPE=;
	b=mLArwPzOMyzhn2mfDntpekPwLKlfJ+n/tT3IP85co65oO7BR5qS2WioI/rwpZ8JvlstS
	 2xi9jemVhg0XClaAFibc6I8NJnzqZy2eWAsveRHAQEZiQNuGhRfxZaqVv61577i8CijMA
	 mJtl8ERuZlV+ndwdqHe4q2s5UhiLg68fVSVEsW4fkZLbL4FHczGkiG2vGJsrjsmh5G+Ue
	 MAmWQJxIAiEDPwU57teJtOY8RqjioHVESBbkh4kyh//YA/wQwM70sRehnIiZ0qC9JIhUF
	 SikOOti0f2UkXupk+Ps04UYry/qbMxe1AkWckwUDAhUYCPOVM6qhL+ERKGMCiYmGdXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YTlPjxZW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC018606A319
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YTlPjxZW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CDF31F000C4;
	Mon, 19 Oct 2026 17:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792430143;
	bh=cG5xrX9QqSeMx2ZjAs83pHr9hHusqEvEX7bER0iIoPE=;
	h=From:To:Cc:Subject:Date;
	b=YTlPjxZWvWOyVbE7lWsXQqpkTrxPBcxM+WrKnk03YBNtXfNU2Uc0wIJRw+1qP1NJa
	 idBxw8TspubsAkIUbkZX81sSo1++z3z9kV46z2qaEXCwTpqTk//Qjj0Vx21LvZX8m2
	 T+po2bT0V6qMlGdXH44Qsv/lYXtqGUGulyfcDhRoouqMntXqGWXm15UzdN8AydJgCE
	 PMDG8SRsLFhRiCU50fOu5OLgHD0ndhroMyvhnStPidSao+lQdaygHI6VII7QsVUrAO
	 jU5CTSuCzcBR7/v5pBkxxbdfyx4gKvkDb6ghi62rPT+ie++CA/XHxeNPihOpmIadpE
	 IUsxQjg1WvBPg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 3517A1AC57D0; Mon, 19 Oct 2026 18:15:41 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] regulator updates for v7.4
Date: Mon, 19 Oct 2026 18:15:19 +0100
Message-Id: <20261019171541.3517A1AC57D0@finisterre.sirena.org.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The following changes since commit 93f51579e7df248780214094418f205253383cc5:

  Linux 7.3-rc4 (2026-09-20 13:48:15 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git tags/regulator-v7.4

for you to fetch changes up to ba83dd4a47bb47da3d2791b2ad6cd816a851b5d0:

  regulator: rpi-panel-attiny: Fix probe failure after a host cold boot (2026-10-16 20:59:46 +0100)

----------------------------------------------------------------
regulator: Updates for v7.4

This is quite a quiet release, especially given the general onslaught of
cleanup patches seen elsewhere.  There is some of that, but not as much
as I'm seeing elsewhere relatively to the size of the subsystem.  We do
have some new drivers as well, plus Linus Walleij has done a big
overhaul of the AB8500 driver including feature buildout.

 - Substantial cleanups and feature additions for the ST Ericsson AB8500
 - Overhaul of the configuration for the LP872x.
 - A bunch of DT binding conversions
 - Support for Maxim MAX20024, MPS MPQ4210, Nexperia NEX10000UB

----------------------------------------------------------------
Bhargav Joshi (4):
      regulator: dt-bindings: ti,tps6586x: Convert to DT schema
      regulator: dt-bindings: ti,lp872x: Convert to DT schema
      regulator: dt-bindings: nvidia,tegra-regulators-coupling: Convert to DT schema
      regulator: dt-bindings: Reference Tegra regulator coupling schema

Chandradhar Kumar (1):
      regulator: fixed: reject incompatible platform devices

Diederik de Haas (1):
      regulator: tps65185: Remove redundant dev_err_probe()

Donggeun Yoo (1):
      regulator: pf1550: fix division by zero in the ramp rate selection

Duje Mihanović (1):
      regulator: 88pm886: Add Vbus regulator

Eduard Bostina (1):
      regulator: dt-bindings: Convert TPS65023 to DT schema

Enlin Mu (1):
      softirq: Remove redundant h->action from preempt_count mismatch error

Fabio Estevam (2):
      regulator: pca9450: Use LDO5 low-control enable mask
      regulator: pca9450: Support regulator-off-in-suspend

Hemanth Selam (2):
      regulator: fix typos in comments
      regulator: fix repeated word in log message

Jisheng Zhang (6):
      regulator: mp886x: fix vsel_mask
      regulator: dt-bindings: mp886x: support mp8864
      regulator: mp886x: add MP8864 support
      regulator: mp886x: check get_voltage_sel() return value
      regulator: mp886x: fix pontential division by zero
      regulator: dt-bindings: sy8827n: support standard properties

Justin Yeh (1):
      regulator: core: Export helpers used by regulator couplers

Karl Mehltretter (1):
      regulator: qcom-rpmh: Fix the return value in rpmh_regulator_vrm_get_optimum_mode() kernel-doc

Kees Cook (1):
      regulator: axp20x: Remove const from new_desc allocation types

Krzysztof Kozlowski (1):
      regulator: dt-bindings: Use consistent indentation in the example

Linus Walleij (10):
      regulator: ab8500: Fix AB8505 VANA voltage selectors
      regulator: ab8500: Add AB8505 VAUX3 3.05 V setting
      regulator: ab8500: Handle AB8505 VINTCORE selector 7
      regulator: ab8500: Treat cut 1.0 VAUX3 as fixed
      regulator: ab8500: Test dedicated enable bits only
      regulator: ab8500: Propagate mode enable read errors
      regulator: ab8500: Use linear ranges for LDO voltages
      regulator: ab8500: Add buck converter support
      regulator: ab8500: Preserve OTP-enabled buck regulators
      regulator: ab8500: Use scoped guard for shared mode mutex

Luca Weiss (3):
      regulator: dt-bindings: qcom,rpmh: Add supply names for PM6350
      regulator: qcom-rpmh: Add supply names for PM6350
      regulator: qcom-rpmh: Add missing regulators in PM6350

Lukas Beckmann (1):
      genirq: Discard cpumask of irqaffinity= boot parameter if parsing fails

Mark Brown (11):
      regulator: mp886x: add MP8864 support
      Add supply names for PM6350 RPMh regulators on Fairphone 4
      regulator: fix typos and repeated words in comments
      regulator: Add MPS MPQ4210 buck-boost regulator support
      Add AB8500 buck regulators to the Ux500 device tree
      regulator: mpq4210: Address the post-merge review comments
      regulator: add support for the Nexperia NEX10000UB dual output LCD bias power supply
      regulator: mp886x: fix two issues reported by sashiko
      regulator: Allow mtk-regulator-coupler to be built as a module
      regulator: dt-bindings: Tegra coupling DT conversions and cleanup
      lp872x: remove platform_data based probing and adjustments

Neil Armstrong (3):
      dt-bindings: vendor-prefixes: add vendor prefix for Nexperia B.V.
      regulator: dt-bindings: document the Nexperia NEX10000UB dual output LCD bias power supply
      regulator: add regulator driver for the Nexperia NEX10000UB

Rob Herring (Arm) (3):
      regulator: dt-bindings: Convert mediatek,mt6380-regulator to DT schema
      regulator: dt-bindings: Add MAX20024 sd4
      regulator: dt-bindings: Drop obsolete MAX8925 .txt binding

Svyatoslav Ryhel (7):
      regulator: dt-bindings: ti,lp872x: Deprecate ti,dvs-gpio and ti,update-config
      regulator: dt-bindings: ti,lp872x: Document input supplies
      regulator: lp872x: Fold driver header into driver file
      regulator: lp872x: Remove redundant regmap wrappers
      regulator: lp872x: Remove platform_data based probing
      regulator: lp872x: Add support for input and regulator power supplies
      regulator: lp872x: Use macro to fill regulator descriptor

Tapio Reijonen (5):
      regulator: dt-bindings: Add MPS MPQ4210
      regulator: Add MPS MPQ4210 buck-boost regulator driver
      regulator: dt-bindings: mps,mpq4210: Use the -ohms unit suffix
      regulator: mpq4210: Use the -ohms feedback divider property
      regulator: mpq4210: Drop the mod_devicetable.h include

Tomi Valkeinen (1):
      regulator: rpi-panel-attiny: Fix probe failure after a host cold boot

Wentao Liang (4):
      regulator: core: Fix c_rdev reference leak in regulator_resolve_coupling()
      regulator: core: Fix rdev reference leak in regulator_resolve_supply()
      regulator: rt6190: Fix runtime PM imbalance in rt6190_out_enable()
      regulator: core: Fix coupled regulators reference leak on removal

 .../devicetree/bindings/mfd/ti,tps65910.yaml       |  12 +-
 .../devicetree/bindings/regulator/lp872x.txt       | 161 -----
 .../bindings/regulator/max8925-regulator.txt       |  40 --
 .../regulator/maxim,max77620-regulator.yaml        |  17 +-
 .../bindings/regulator/maxim,max77826.yaml         |   4 +-
 .../bindings/regulator/maxim,max77838.yaml         |   4 +-
 .../regulator/mediatek,mt6380-regulator.yaml       | 117 ++++
 .../devicetree/bindings/regulator/mps,mp5416.yaml  |  36 +-
 .../devicetree/bindings/regulator/mps,mp886x.yaml  |  30 +-
 .../devicetree/bindings/regulator/mps,mpq4210.yaml |  68 ++
 .../devicetree/bindings/regulator/mps,mpq7920.yaml |  50 +-
 .../bindings/regulator/mt6380-regulator.txt        |  89 ---
 .../bindings/regulator/nexperia,nex10000ub.yaml    |  69 ++
 .../regulator/nvidia,tegra-regulators-coupling.txt |  65 --
 .../nvidia,tegra-regulators-coupling.yaml          |  38 ++
 .../devicetree/bindings/regulator/nxp,pf0900.yaml  |   2 +-
 .../bindings/regulator/onnn,fan53880.yaml          |   4 +-
 .../bindings/regulator/pwm-regulator.yaml          |   2 +-
 .../bindings/regulator/qcom,rpmh-regulator.yaml    |  16 +
 .../regulator/richtek,rtmv20-regulator.yaml        |   6 +-
 .../bindings/regulator/silergy,sy8824x.yaml        |   8 +-
 .../bindings/regulator/silergy,sy8827n.yaml        |   9 +-
 .../devicetree/bindings/regulator/ti,lp872x.yaml   | 204 ++++++
 .../devicetree/bindings/regulator/ti,tps62360.yaml |   1 +
 .../devicetree/bindings/regulator/ti,tps65023.yaml |  90 +++
 .../devicetree/bindings/regulator/ti,tps6586x.yaml | 196 ++++++
 .../devicetree/bindings/regulator/tps65023.txt     |  60 --
 .../devicetree/bindings/regulator/tps6586x.txt     | 135 ----
 .../bindings/soc/mediatek/mediatek,pwrap.yaml      |   3 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |   6 +
 drivers/regulator/88pm886-regulator.c              |  26 +
 drivers/regulator/Kconfig                          |  21 +-
 drivers/regulator/Makefile                         |   2 +
 drivers/regulator/ab8500-ext.c                     |   2 +-
 drivers/regulator/ab8500.c                         | 748 +++++++++++++++++++--
 drivers/regulator/axp20x-regulator.c               |   6 +-
 drivers/regulator/core.c                           |  10 +-
 drivers/regulator/fixed.c                          |   4 +
 drivers/regulator/lp872x.c                         | 672 ++++++------------
 drivers/regulator/mp886x.c                         |  34 +-
 drivers/regulator/mpq4210.c                        | 243 +++++++
 drivers/regulator/nex10000ub-regulator.c           | 147 ++++
 drivers/regulator/pca9450-regulator.c              |  81 ++-
 drivers/regulator/pf1550-regulator.c               |  19 +-
 drivers/regulator/pv88080-regulator.c              |   4 +-
 drivers/regulator/qcom-rpmh-regulator.c            |  55 +-
 drivers/regulator/rpi-panel-attiny-regulator.c     |   6 +
 drivers/regulator/rt6190-regulator.c               |  18 +-
 drivers/regulator/tps6105x-regulator.c             |   2 +-
 drivers/regulator/tps65185.c                       |   6 +-
 include/linux/mfd/88pm886.h                        |   7 +
 include/linux/regulator/driver.h                   |   2 +-
 include/linux/regulator/lp872x.h                   |  86 ---
 include/linux/regulator/pca9450.h                  |   4 +-
 kernel/irq/irqdesc.c                               |  10 +-
 kernel/softirq.c                                   |   4 +-
 57 files changed, 2457 insertions(+), 1306 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/lp872x.txt
 delete mode 100644 Documentation/devicetree/bindings/regulator/max8925-regulator.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6380-regulator.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/mps,mpq4210.yaml
 delete mode 100644 Documentation/devicetree/bindings/regulator/mt6380-regulator.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/nexperia,nex10000ub.yaml
 delete mode 100644 Documentation/devicetree/bindings/regulator/nvidia,tegra-regulators-coupling.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/nvidia,tegra-regulators-coupling.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/ti,lp872x.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/ti,tps65023.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/ti,tps6586x.yaml
 delete mode 100644 Documentation/devicetree/bindings/regulator/tps65023.txt
 delete mode 100644 Documentation/devicetree/bindings/regulator/tps6586x.txt
 create mode 100644 drivers/regulator/mpq4210.c
 create mode 100644 drivers/regulator/nex10000ub-regulator.c
 delete mode 100644 include/linux/regulator/lp872x.h
