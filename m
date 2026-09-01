Received: from spam.axera-tech.com (unknown [114.118.28.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9F4478861;
	Tue,  1 Sep 2026 09:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.118.28.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254452; cv=none; b=d1hmInRoYrTJ0Fc/yp0D1lFov/nILbRBBAYQvpwbFPoHw+6puIh3pfhIdQmq0LYo5zTjhOLUuhtjmEJVf5DOlvVCbFpak/FV9suJlSxssw+UyZMzDiV5grHleGs8LtQ3x8P3w2QPCC2oK0UiIr3eXCA/jleUUVjHJWJd1svlILc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254452; c=relaxed/simple;
	bh=TvbSsDTgak+MnPeEHsbRPhBZ/tYUMEamDNLCmIvEvAQ=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=nymBAMX9b0v15PFuaSXJDXwuR7SlT8eDrIuAPFSO+QE3b18TPljhnaT5smju70d135LJGpZGPXoMsDJ/Elu9tBNXgvKCWNU7fSGDwp0rNKn6HP/8VxOb6VxR3BO/69F4W0y/ao5fBpkxJShNCQPxIKEDdx8f5dUlfdWYD1JYT1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axera-tech.com; spf=pass smtp.mailfrom=axera-tech.com; arc=none smtp.client-ip=114.118.28.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axera-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axera-tech.com
Received: from aixinexchange02.aixin-chip.com ([10.122.86.161])
	by spam.axera-tech.com with ESMTPS id 6819JZwg047669
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 1 Sep 2026 17:19:35 +0800 (+08)
	(envelope-from lenghonglin@axera-tech.com)
Received: from [127.0.1.1] (10.126.103.103) by aixinexchange02.aixin-chip.com
 (10.122.86.161) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 1 Sep 2026
 17:19:34 +0800
From: Leng Honglin <lenghonglin@axera-tech.com>
Subject: [PATCH v2 0/6] arm64: Introduce Axera AX650 SoC and AX650 Demo
 board
Date: Tue, 1 Sep 2026 17:19:27 +0800
Message-ID: <20260901-ax650-v1-v2-0-993bea305476@axera-tech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ+YlmoC/0WNQQqDMBBFryKzbkomYohd9R7iIsaxSaGmJGmwi
 HdvtIXCbB68/2aFSMFRhEu1QqDsovNzAXGqwFg934i5sTAILiRXqJheZMNZRtZOjcFWNiOShKI
 /A01uOVJd/+X4Gu5k0r7fDeti8uF9/Mq4e7+swH+2HGeEA8e6rRXJ4aoXCpolMvZs/AP6bds+1
 kTiarcAAAA=
X-Change-ID: 20260818-ax650-v1-9f5c1965d1e6
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shi Zhicheng
	<shizhicheng@axera-tech.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will
 Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski
	<krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus
 Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <soc@lists.linux.dev>,
        Leng Honglin
	<lenghonglin@axera-tech.com>, <hlleng233@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788254374; l=4126;
 i=lenghonglin@axera-tech.com; s=20260818; h=from:subject:message-id;
 bh=TvbSsDTgak+MnPeEHsbRPhBZ/tYUMEamDNLCmIvEvAQ=;
 b=mMwg/ZYv+GPQG2N4MH/cT9w60+UYs1WADBAWWEumWX6pR8+sSiW936+94pPy1P6G5wLHR1RnQ
 WCjmiIRJmIrCdpOddVo8rpupSe6ZRx4XyC2EeDDQ4kqQpIYP2J7HpR0
X-Developer-Key: i=lenghonglin@axera-tech.com; a=ed25519;
 pk=fo0agzxyiwbJZc3VZRLVthobvWCvq0qAViAw4TxhF80=
X-ClientProxiedBy: aixinexchange02.aixin-chip.com (10.122.86.161) To
 aixinexchange02.aixin-chip.com (10.122.86.161)
X-DKIM-Results: [10.122.86.161]; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:spam.axera-tech.com 6819JZwg047669

Axera AX650 is an Arm64 SoC developed by Axera Semiconductor. The
AX650 Demo board is based on the AX650 SoC and provides the hardware
platform used to validate this series.

This series adds the initial upstream support required to build and
boot the Linux kernel on the AX650 Demo board.

The initial platform support includes:

- Axera AX650 SoC and AX650 Demo devicetree bindings
- ARCH_AXERA arm64 platform selection
- arm64 defconfig support
- Cortex-A55 CPUs and PSCI
- GIC-400 interrupt controller
- ARMv8 architectural timer
- Cortex-A55 PMU
- UART console
- 8 GiB system memory
- Axera ARM64 SoC maintainer information

The patches are organized as follows:

- Patch 1/6: Add the Axera vendor prefix.
- Patch 2/6: Add devicetree bindings for the AX650 SoC and
  AX650 Demo board.
- Patch 3/6: Add the ARCH_AXERA arm64 platform option.
- Patch 4/6: Enable ARCH_AXERA in the arm64 defconfig.
- Patch 5/6: Add the initial devicetree description for the AX650 SoC
  and AX650 Demo board.
- Patch 6/6: Add Axera ARM64 SoC entries to MAINTAINERS.

The series is intentionally limited to the minimum platform support
required to boot the board with a serial console. Additional
peripherals will be added in subsequent patches.

The platform was tested on an AX650 Demo board using the vendor boot
chain to load the kernel and device tree. A kernel with an embedded
initramfs successfully reached an interactive shell on the serial
console, and all 8 CPUs were brought online.

Validation performed:

- DT_SCHEMA_FILES=Documentation/devicetree/bindings/arm/axera.yaml make ARCH=arm64 dt_binding_check
- make ARCH=arm64 CHECK_DTBS=y W=1 axera/ax650-demo.dtb
- scripts/dtc/dt-check-style --mode=strict on both AX650 DTS files

Signed-off-by: Leng Honglin <lenghonglin@axera-tech.com>
---
Changes in v2:
- Fix the GIC node placement and unit address in the AX650 SoC device tree.
- Correct the GICC register region size to 0x2000.
- Fix DTS property ordering and formatting, and remove a duplicate include.
- Expand the AX650 device-tree commit message with platform and test details.
- Remove the unverified Reviewed-by tags.
- Add the official Axera website link to the vendor-prefix commit.

Link to v1:
https://patch.msgid.link/20260821-ax650-v1-v1-0-e1b013938e6b@axera-tech.com

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Shi Zhicheng <shizhicheng@axera-tech.com>
To: Leng Honglin <lenghonglin@axera-tech.com>
To: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Walleij <linusw@kernel.org>
To: Drew Fustini <fustini@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: soc@lists.linux.dev
Cc: hlleng233@gmail.com

---
Leng Honglin (6):
      dt-bindings: vendor-prefixes: add Axera
      dt-bindings: arm: add Axera AX650 SoC and AX650 Demo board
      arm64: Kconfig.platforms: add ARCH_AXERA
      arm64: defconfig: enable ARCH_AXERA
      arm64: dts: axera: add AX650 Demo initial support
      MAINTAINERS: add Axera ARM SoC support

 Documentation/devicetree/bindings/arm/axera.yaml   |  24 ++++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |   8 ++
 arch/arm64/Kconfig.platforms                       |   5 +
 arch/arm64/boot/dts/Makefile                       |   1 +
 arch/arm64/boot/dts/axera/Makefile                 |   3 +
 arch/arm64/boot/dts/axera/ax650-demo.dts           |  30 +++++
 arch/arm64/boot/dts/axera/ax650.dtsi               | 136 +++++++++++++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 9 files changed, 210 insertions(+)
---
base-commit: ff68e5f557f69a08fdcfa4ce8b1b809d63bd4f45
change-id: 20260818-ax650-v1-9f5c1965d1e6

Best regards,
--  
Leng Honglin <lenghonglin@axera-tech.com>

