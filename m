Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793762822;
	b=T2swqWUPXSXpXV7QrJ1LaxFA6nu9u7stLm2zV+B00ntJ56GpwJeEEcGo49d61yHQ4HBq
	 Ozd7cDHC1PJ6LtV1gNEuKmwzz/HtJWLWIJeq8OQ0/8oz3hxzOnDScsufxjwpcvZjU7rme
	 5LdWLft4ic1UW6yxhCLBFYKxSjbFzKM67NMJkinupDz/w9X/Kj3e4UtImIemDgjNPScE6
	 eCXp4b0G2AlXEGpQBl6zozlNiycGdm7NlXX8PcPcAbyB9YpRW4zSfktoRrE+kITa3tA4i
	 ZDpLSqFBz+HQLaqBtdpoSIszntWwa+ZRFTk+mqBeIfs4gjOGPsNhVHb20vNTKbDmnYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793762822;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=B9B3FNQjMSXeLDrpaplOz7Hf5ldnMqGVp7cTjZ4hcFs=;
	b=RYhncfSa42tB+I4Q9bjNsm0Ms0G69Ox6Bll4LkNjNeIOH55p6Rt24wCC/a1LOB9+GJMU
	 F0DWnpxq6WWY/KhbgZ65U9ajEmu0tgUfRwWKo3GFrN/RtuixGlh9Rwb8xNh6339v127Do
	 RPW4u8uNX0Ul0Wul8/oLAsCHBz9ReAalbQGCBsoDw7+EX4YZWgr/UoSRGZJXWW39/qeke
	 vUrMJcIRYsyTUDx5o8qfrgBZbVrCX0QNah/07Klwv7hUKqicT6mo6iM+LMUuSmKptHfze
	 QAtLaA0eNw0UoyfLIyd4BjGawrNRohrRo+ThCggg2XicI/a0lC/KlvJXEmLgzKRnWjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=lQNLr1yb;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 688C4606A328;
	Wed,  4 Nov 2026 03:26:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 688C4606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=lQNLr1yb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=B9B3FNQjMSXeLDrpaplOz7Hf5ldnMqGVp7
	cTjZ4hcFs=; b=lQNLr1ybdBsa0Xvv5fVyt3xcZAoQSeNEQ8ifbki6wtJ2KUIwl9
	wAW7BqkQgTB4cE6/we82WPZqWp+1p9t0AJAq1NdgY2aWXQZk+s9+ryXcXFINCdx+
	XLRvnS1/MTEUg8wnislKvtp5nKxclZ1Xnv4/U08t8jEoRalkQnGirSlBk=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.194.56])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgAXnUH4pepqKzSAAA--.3770S6;
	Wed, 04 Nov 2026 11:26:55 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v6 4/5] arm64: dts: qcom: sm8750-lenovo-elden: add the Lenovo Legion Y700 Gen4
Date: Wed,  4 Nov 2026 11:26:47 +0800
Message-ID: <20261104032648.209747-5-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104032648.209747-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261104032648.209747-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgAXnUH4pepqKzSAAA--.3770S6
X-Coremail-Antispam: 1UD129KBjvJXoWxGFyrAr4rGw4fZryDZw17trb_yoW5XF17pF
	nrCr4rGryv9F1a9FsaqFW0ga93uan5GFW8KrnrWFyjkryrtrykKF4agwnxJFy8JrW3Xw40
	vFn3Zr9akF1xAw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmGb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUAVCq3wA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28C
	jxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI
	8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E
	87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64
	kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI
	1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r48MxAIw28IcxkI7VAKI48JMxC20s02
	6xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
	I_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
	6r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj4
	0_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8
	JrUvcSsGvfC2KfnxnUUI43ZEXa7IU00oGPUUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREBB2rqNlcjBwAgsz

The Lenovo Legion Y700 Gen4 (TB322FC) is an SM8750 tablet. Add a board
devicetree with the board compatible, the chassis type, the GPIOs the
boot firmware reserves and the board clocks, which the SM8750 dtsi
consumes: the XO and sleep clocks and the two divided CXO derivatives,
as on the other SM8750 boards.

The rest of the board enablement (SPMI PMICs, console and storage)
cannot be validated on hardware yet and is left to a separate board
series. The camera PMIC and the regulators it provides follow in the
next patch.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 arch/arm64/boot/dts/qcom/Makefile             |  1 +
 .../boot/dts/qcom/sm8750-lenovo-elden.dts     | 50 +++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00..e0b65a36c5 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -453,6 +453,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-hdk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-valve-deckard.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-lenovo-elden.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
diff --git a/arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts b/arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts
new file mode 100644
index 0000000000..821950715c
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026, Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
+ */
+
+/dts-v1/;
+
+#include "sm8750.dtsi"
+
+/ {
+	model = "Lenovo Legion Y700 Gen4";
+	compatible = "lenovo,elden", "qcom,sm8750";
+	chassis-type = "tablet";
+
+	clocks {
+		xo_board: xo-board {
+			compatible = "fixed-clock";
+			clock-frequency = <76800000>;
+			#clock-cells = <0>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32000>;
+			#clock-cells = <0>;
+		};
+
+		bi_tcxo_div2: bi-tcxo-div2-clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-mult = <1>;
+			clock-div = <2>;
+		};
+
+		bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK_A>;
+			clock-mult = <1>;
+			clock-div = <2>;
+		};
+	};
+};
+
+&tlmm {
+	gpio-reserved-ranges = <39 1>, <74 1>;
+};
-- 
2.53.0

