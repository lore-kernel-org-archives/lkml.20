Received: from spam.axera-tech.com (unknown [114.118.28.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0048477E38;
	Tue,  1 Sep 2026 09:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.118.28.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254451; cv=none; b=MV8ux4nCL0ohtOoPIBMumNzwnrygXWYA6tThWEoUqoexafO11jq4FWerbiCi7XSJDyY0TL2/WnAP/JWVzubQqGsHo6FhzNj521LNf9Zn8Mp2XMhDpxlTzGGi7xZv2x4jcYygZAnKymZQLPdtOf1HwLqkLPzZLszuf3vPj94bU3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254451; c=relaxed/simple;
	bh=F+grr6TyjghM0kMzH6YVeD4LuxiU9ojQTyXZ495EXAg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=NSAcDR5kqTaD8q55O4clsQfY0QULrrgTxb0CxZ1p59/e03T0IsjlgPrz9UyUAiqTBHEJ15rOvR3/iPl6uF5bJKAV8VX0DCKkLEJVeBuFPLaTJzXB/JkoGWr+Az/cSDlJ5K98h1WXKyuewqlj8Rqzjxs7BK27YTPFBdjPqUMkCKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axera-tech.com; spf=pass smtp.mailfrom=axera-tech.com; arc=none smtp.client-ip=114.118.28.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axera-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axera-tech.com
Received: from aixinexchange02.aixin-chip.com ([10.122.86.161])
	by spam.axera-tech.com with ESMTPS id 6819Jd94047675
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 1 Sep 2026 17:19:39 +0800 (+08)
	(envelope-from lenghonglin@axera-tech.com)
Received: from [127.0.1.1] (10.126.103.103) by aixinexchange02.aixin-chip.com
 (10.122.86.161) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 1 Sep 2026
 17:19:38 +0800
From: Leng Honglin <lenghonglin@axera-tech.com>
Date: Tue, 1 Sep 2026 17:19:32 +0800
Subject: [PATCH v2 5/6] arm64: dts: axera: add AX650 Demo initial support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260901-ax650-v1-v2-5-993bea305476@axera-tech.com>
References: <20260901-ax650-v1-v2-0-993bea305476@axera-tech.com>
In-Reply-To: <20260901-ax650-v1-v2-0-993bea305476@axera-tech.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788254374; l=6119;
 i=lenghonglin@axera-tech.com; s=20260818; h=from:subject:message-id;
 bh=F+grr6TyjghM0kMzH6YVeD4LuxiU9ojQTyXZ495EXAg=;
 b=SRmfHRCi2NnTJrL8P100TueYzZCFmjBP2ddi+uBUAHfaH5IwfeyQwfLQfIsRSwvByHhpkI442
 2yd4kDIrj9bAHrEol245Iju4NZGplxRTfD9NSNvDuwzxn3W91VuUlKV
X-Developer-Key: i=lenghonglin@axera-tech.com; a=ed25519;
 pk=fo0agzxyiwbJZc3VZRLVthobvWCvq0qAViAw4TxhF80=
X-ClientProxiedBy: aixinexchange02.aixin-chip.com (10.122.86.161) To
 aixinexchange02.aixin-chip.com (10.122.86.161)
X-DKIM-Results: [10.122.86.161]; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:spam.axera-tech.com 6819Jd94047675

Axera AX650 is an Arm64 SoC developed by Axera Semiconductor. The
AX650 Demo board is based on the AX650 SoC and provides the hardware
platform used to validate this initial support.

Add the initial device tree description required to boot Linux on the
AX650 Demo board. The SoC description includes eight Cortex-A55 CPUs
booted through PSCI, the GIC-400 interrupt controller, the ARMv8
architectural timer, the Cortex-A55 PMU, and the DesignWare APB UART
used for the serial console.

The board description provides 8 GiB of system memory, the serial0
alias, and the stdout path for the console.

The platform was tested on an AX650 Demo board using the vendor boot
chain to load the kernel and device tree. A kernel with an embedded
initramfs reached an interactive shell on the serial console, and all
8 CPUs were brought online.

Signed-off-by: Leng Honglin <lenghonglin@axera-tech.com>
---
 arch/arm64/boot/dts/Makefile             |   1 +
 arch/arm64/boot/dts/axera/Makefile       |   3 +
 arch/arm64/boot/dts/axera/ax650-demo.dts |  30 +++++++
 arch/arm64/boot/dts/axera/ax650.dtsi     | 136 +++++++++++++++++++++++++++++++
 4 files changed, 170 insertions(+)

diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index fc726b215f12..93740acb553d 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -10,6 +10,7 @@ subdir-y += apm
 subdir-y += apple
 subdir-y += arm
 subdir-y += aspeed
+subdir-y += axera
 subdir-y += axiado
 subdir-y += bitmain
 subdir-y += blaize
diff --git a/arch/arm64/boot/dts/axera/Makefile b/arch/arm64/boot/dts/axera/Makefile
new file mode 100644
index 000000000000..76f436a9466a
--- /dev/null
+++ b/arch/arm64/boot/dts/axera/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+dtb-$(CONFIG_ARCH_AXERA) += ax650-demo.dtb
diff --git a/arch/arm64/boot/dts/axera/ax650-demo.dts b/arch/arm64/boot/dts/axera/ax650-demo.dts
new file mode 100644
index 000000000000..d8690287bfcd
--- /dev/null
+++ b/arch/arm64/boot/dts/axera/ax650-demo.dts
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Axera Semiconductor Co., Ltd.
+ */
+
+/dts-v1/;
+
+#include "ax650.dtsi"
+
+/ {
+	compatible = "axera,ax650-demo", "axera,ax650";
+	model = "Axera AX650 Demo";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	memory@100000000 {
+		reg = <0x1 0x00000000 0x2 0x00000000>;
+		device_type = "memory";
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/axera/ax650.dtsi b/arch/arm64/boot/dts/axera/ax650.dtsi
new file mode 100644
index 000000000000..38547df8b619
--- /dev/null
+++ b/arch/arm64/boot/dts/axera/ax650.dtsi
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Axera Semiconductor Co., Ltd.
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	#address-cells = <2>;
+	interrupt-parent = <&gic>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			compatible = "arm,cortex-a55";
+			reg = <0x0>;
+			device_type = "cpu";
+			enable-method = "psci";
+		};
+
+		cpu1: cpu@100 {
+			compatible = "arm,cortex-a55";
+			reg = <0x100>;
+			device_type = "cpu";
+			enable-method = "psci";
+		};
+
+		cpu2: cpu@200 {
+			compatible = "arm,cortex-a55";
+			reg = <0x200>;
+			device_type = "cpu";
+			enable-method = "psci";
+		};
+
+		cpu3: cpu@300 {
+			compatible = "arm,cortex-a55";
+			reg = <0x300>;
+			device_type = "cpu";
+			enable-method = "psci";
+		};
+
+		cpu4: cpu@400 {
+			compatible = "arm,cortex-a55";
+			reg = <0x400>;
+			device_type = "cpu";
+			enable-method = "psci";
+		};
+
+		cpu5: cpu@500 {
+			compatible = "arm,cortex-a55";
+			reg = <0x500>;
+			device_type = "cpu";
+			enable-method = "psci";
+		};
+
+		cpu6: cpu@600 {
+			compatible = "arm,cortex-a55";
+			reg = <0x600>;
+			device_type = "cpu";
+			enable-method = "psci";
+		};
+
+		cpu7: cpu@700 {
+			compatible = "arm,cortex-a55";
+			reg = <0x700>;
+			device_type = "cpu";
+			enable-method = "psci";
+		};
+	};
+
+	pmu {
+		compatible = "arm,cortex-a55-pmu";
+		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>,
+				     <&cpu4>, <&cpu5>, <&cpu6>, <&cpu7>;
+		interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	soc {
+		compatible = "simple-bus";
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		uart0: serial@2016000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0x02016000 0x0 0x400>;
+			clock-frequency = <200000000>;
+			interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+
+			status = "disabled";
+		};
+
+		/* GIC-400 register frames start at offset 0x1000. */
+		gic: interrupt-controller@4901000 {
+			compatible = "arm,gic-400";
+			reg = <0x0 0x4901000 0x0 0x1000>,
+			      <0x0 0x4902000 0x0 0x2000>,
+			      <0x0 0x4904000 0x0 0x2000>,
+			      <0x0 0x4906000 0x0 0x2000>;
+			#address-cells = <0>;
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			interrupts = <GIC_PPI 9
+				     (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13
+			     (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>,
+			     <GIC_PPI 14
+			     (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>,
+			     <GIC_PPI 11
+			     (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>,
+			     <GIC_PPI 10
+			     (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
+	};
+};

-- 
2.34.1

