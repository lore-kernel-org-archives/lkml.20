Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAA63E8C77;
	Fri,  2 Oct 2026 19:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790967767; cv=none; b=Sbfp2e/4noOFTwVYwEAdDVHDPwpF6j6dvHwdw0nEkD8vQEHdoWq4Fo4aqpzYcpomJ/vUHJvwGgTSqcuRd6D52Qs7ufhnxnU+JcQ/1ew0UiUgW7t82gol2Tg7MVgnXR9Cs929K2e9yA6rJIHVhHS+j2vMCbVBA4uqTROQOVBTfGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790967767; c=relaxed/simple;
	bh=HdJ0kcwGez1QOFo/k6IasmkzidJ997+L73a0ylxwx/0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YgNrNT2l1QkSej3jWE8SmQkp8PW9M+ixJFGfrcvtxB4hL2Y9eI9zDCWZc06dJvB4FW6N7sgeBVJR9aOXmypNoWFwB7bKp1/eNyXNg0qbJ1+ZhZilXu3sCbt1gNebgkbiLMmT3NVRZeMQ8zwGRpFnsF/viMa7dK7omXJpzjJLVaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jZ31VBEK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jZ31VBEK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB1EB1F000FF;
	Fri,  2 Oct 2026 19:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790967766;
	bh=zZT1sFx0zhXU9FqGRVTPkZ49g+AbixUgdpI2NAEKwOE=;
	h=From:To:Cc:Subject:Date;
	b=jZ31VBEKXWstDqWjf+dGRL/tHxrsKxOiOf51S4z8fxrM3V8KPXKS+dTk0qK0uhg/a
	 gWnwyzyGC0vckW3cCZ+jD0s05L+u98uqV9ArrVh6h9CMFaO8UKw/QFWwL9hA0BpI5H
	 mDz/vPd4mfCWjWS8/yevenwaa8vZ51aoTCNFahQ7bVUWRrGWHgUOtivtTN7KxzNt12
	 /tAPhWU9Gl+IclgAGun75wdhiN0PsRK2YaQcZSoska52S1HjasCiGc/vJopnmeU/OK
	 9/4oBCpy2wo7if/y9Wkb1Wdh7lnmXwY7XoSQXZARcT1fO43lQWFg0XHUzeErXTAwEQ
	 1DHqStT14nqTQ==
From: Sven Peter <sven@kernel.org>
To: soc@lists.linux.dev
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sven Peter <sven@kernel.org>
Subject: [GIT PULL] Apple SoC DTS changes for v7.4
Date: Fri,  2 Oct 2026 21:02:30 +0200
Message-ID: <20261002190232.6449-1-sven@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sven/linux.git tags/apple-soc-dt-7.4

for you to fetch changes up to a8ac6027e82415f431bbba49ab535c44f2edaf4d:

  Merge patch series "Initial Apple Silicon A18 Pro device trees and dt-bindings" (2026-09-25 22:59:47 +0200)

----------------------------------------------------------------
Apple SoC DTS changes for 7.4

- Initial device trees for all machines with the base M4 SoC and the
  A18 Pro based MacBook Neo. As usual, the PMGR nodes are responsible
  for the majority of the diffstat. This is enough to boot with all
  cores to a serial console but future work will be required to make
  these useful for users.
- Fixes for a whole bunch of dt-check-style issues for M1/M2/M3

Signed-off-by: Sven Peter <sven@kernel.org>

----------------------------------------------------------------
Janne Grunau (16):
      arm64: dts: apple: Fix style issues for t600x multi die .dtsi
      arm64: dts: apple: Fix style issues for t602x multi die .dtsi
      arm64: dts: apple: Fix style issues for t6031 multi die .dtsi
      arm64: dts: apple: t603x: Fix all blank line dt-check-style issues
      arm64: dts: apple: t8122: Fix blank line related dt-check-style issues
      arm64: dts: apple: t603x: Fix child-name-order dt-check-style issues
      arm64: dts: apple: t8122: Fix child-name-order dt-check-style issues
      arm64: dts: apple: t8122: Fix child-address-order dt-check-style issues
      arm64: dts: apple: t6031: Fix continuation alignment
      arm64: dts: apple: t8122: Fix continuation alignment
      arm64: dts: apple: t6030: Fix most property-order dt-check-style issues
      arm64: dts: apple: t603[12]: Fix most property-order dt-check-style issues
      arm64: dts: apple: t8122: Fix most property-order dt-check-style issues
      arm64: dts: apple: t6032-j575d: Remove unused "framebuffer0" label
      arm64: dts: apple: t603x: Break overly long lines
      arm64: dts: apple: t8122: Break overly long lines

Sven Peter (6):
      arm64: dts: apple: t602x: Fix cpus node indentation
      arm64: dts: apple: t6030: Fix cpus node indentation
      arm64: dts: apple: t6032: Fix cpus node indentation
      Merge patch series "Initial Apple Silicon M4 device trees and dt-bindings"
      Merge patch series "dt-check-style strict fixes for Apple M3, M3 Pro/Max/Ultra"
      Merge patch series "Initial Apple Silicon A18 Pro device trees and dt-bindings"

Yureka Lilian (15):
      dt-bindings: arm: cpus: Add Apple M4 CPU core compatibles
      dt-bindings: interrupt-controller: apple,aic2: Add apple,t8132 compatible
      dt-bindings: arm: apple: apple,pmgr: Add t8132 compatible
      dt-bindings: power: apple,pmgr-pwrstate: Add t8132 compatible
      dt-bindings: pinctrl: apple,pinctrl: Add t8132 compatible
      dt-bindings: i2c: apple,i2c: Add t8132 compatible
      dt-bindings: pwm: apple,s5l-fpwm: Add t8132 compatible
      dt-bindings: arm: apple: Add M4 based devices
      arm64: dts: apple: Add minimal t8132 (M4) device trees
      dt-bindings: arm: cpus: Add Apple A18 Pro CPU core compatibles
      dt-bindings: arm: apple: apple,pmgr: Add t8140 compatible
      dt-bindings: arm: power: apple,pmgr-pwrstate: Add t8140 compatible
      dt-bindings: interrupt-controller: apple,aic2: Add t8140 compatible
      dt-bindings: arm: apple: Add A18 Pro based devices
      arm64: dts: apple: Add minimal MacBook Neo device tree

 Documentation/devicetree/bindings/arm/apple.yaml   |   32 +
 .../devicetree/bindings/arm/apple/apple,pmgr.yaml  |    2 +
 Documentation/devicetree/bindings/arm/cpus.yaml    |    4 +
 .../devicetree/bindings/i2c/apple,i2c.yaml         |    1 +
 .../bindings/interrupt-controller/apple,aic2.yaml  |    2 +
 .../devicetree/bindings/pinctrl/apple,pinctrl.yaml |    1 +
 .../bindings/power/apple,pmgr-pwrstate.yaml        |    2 +
 .../devicetree/bindings/pwm/apple,s5l-fpwm.yaml    |    1 +
 arch/arm64/boot/dts/apple/Makefile                 |    7 +
 arch/arm64/boot/dts/apple/t6001.dtsi               |   11 +-
 arch/arm64/boot/dts/apple/t6002.dtsi               |   18 +-
 arch/arm64/boot/dts/apple/t600x-die0.dtsi          |    3 +-
 arch/arm64/boot/dts/apple/t600x-dieX.dtsi          |    2 +
 arch/arm64/boot/dts/apple/t600x-nvme.dtsi          |    2 +
 arch/arm64/boot/dts/apple/t6021.dtsi               |   10 +-
 arch/arm64/boot/dts/apple/t6022.dtsi               |   18 +-
 arch/arm64/boot/dts/apple/t602x-common.dtsi        |    2 +-
 arch/arm64/boot/dts/apple/t602x-die0.dtsi          |    2 +
 arch/arm64/boot/dts/apple/t602x-dieX.dtsi          |    2 +
 arch/arm64/boot/dts/apple/t602x-nvme.dtsi          |    2 +
 arch/arm64/boot/dts/apple/t6030-pmgr.dtsi          |    1 -
 arch/arm64/boot/dts/apple/t6030.dtsi               |  277 ++---
 arch/arm64/boot/dts/apple/t6031-base.dtsi          |  191 ++--
 arch/arm64/boot/dts/apple/t6031-die0.dtsi          |   63 +-
 arch/arm64/boot/dts/apple/t6031-dieX.dtsi          |   94 +-
 arch/arm64/boot/dts/apple/t6031-gpio-pins.dtsi     |   18 +-
 arch/arm64/boot/dts/apple/t6031-pmgr.dtsi          |    6 +
 arch/arm64/boot/dts/apple/t6031.dtsi               |   16 +-
 arch/arm64/boot/dts/apple/t6032-j575d.dts          |   10 +-
 arch/arm64/boot/dts/apple/t6032.dtsi               |  193 ++--
 arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi     |   15 +-
 arch/arm64/boot/dts/apple/t8122-j504.dts           |   10 +-
 arch/arm64/boot/dts/apple/t8122-j613.dts           |    9 +-
 arch/arm64/boot/dts/apple/t8122-j615.dts           |    9 +-
 arch/arm64/boot/dts/apple/t8122-jxxx.dtsi          |    5 +-
 arch/arm64/boot/dts/apple/t8122-pmgr.dtsi          |    1 -
 arch/arm64/boot/dts/apple/t8122.dtsi               |  256 +++--
 arch/arm64/boot/dts/apple/t8132-j604.dts           |   35 +
 arch/arm64/boot/dts/apple/t8132-j623.dts           |   18 +
 arch/arm64/boot/dts/apple/t8132-j624.dts           |   18 +
 arch/arm64/boot/dts/apple/t8132-j713.dts           |   35 +
 arch/arm64/boot/dts/apple/t8132-j715.dts           |   35 +
 arch/arm64/boot/dts/apple/t8132-j773g.dts          |   25 +
 arch/arm64/boot/dts/apple/t8132-jxxx.dtsi          |   48 +
 arch/arm64/boot/dts/apple/t8132-pmgr.dtsi          | 1130 ++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8132.dtsi               |  467 ++++++++
 arch/arm64/boot/dts/apple/t8140-j700.dts           |   54 +
 arch/arm64/boot/dts/apple/t8140-pmgr.dtsi          |  777 ++++++++++++++
 arch/arm64/boot/dts/apple/t8140.dtsi               |  207 ++++
 49 files changed, 3595 insertions(+), 552 deletions(-)
 create mode 100644 arch/arm64/boot/dts/apple/t8132-j604.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8132-j623.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8132-j624.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8132-j713.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8132-j715.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8132-j773g.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8132-jxxx.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8132-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8132.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8140-j700.dts
 create mode 100644 arch/arm64/boot/dts/apple/t8140-pmgr.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/t8140.dtsi
