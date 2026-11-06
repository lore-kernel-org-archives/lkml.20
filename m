Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957393;
	b=Ir+vqWt5YHVroY0CAFxnam5hF2kxVzCBGPtoyRm8+j9G03GtIvVs2zk/lWybWr+AAsV0
	 d0JBRjmmfcvflM+wZ4ocSW1b9yiN4HlfPtfrE5jP3SA1QBikNvhqUE53c6ZsFey+wvYlJ
	 5WzukHNhhaMyLn2vY6QsQTQaI/fDQ8dB+uA07viA8yN0KSfDJ/dXUCQmJKIvbq7kPyQab
	 /6KZ/eI93WIVL78ZwOWn5tX9OpKzH9ZA+jXaRAv1jNKpKNI9yZXiKSG+fcUh0d3WcxRRW
	 BbafNOJf7HjwbcwkFt0wRUaJfVjXeWXlwSS7WcpRop/Dv7EyScMzkxFbpnyXIfVpQEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957393;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=MQ9OkB6wfqdTgcVkBd82n0DdBKm1PB/QvTWs0MZGpyw=;
	b=xbLYefXowe7disDmo+ekVhODtps7xzsO3k9r047apzSTsUmub1QGUc53yGMIKZgSVj69
	 h+W/zcXxnHUtWy3EfkeH/84b1Hkhkjmt/z8RKYznjtlHHZB8qsu0HczevqV8kCIuqGoQR
	 sjqG8ojtP+BOP2Cq+DwzsigpDpYFxRCOOt+xUrS4L43HJPFIbBO2E6c4vqq5DBQMv3AsU
	 Lr1IiTa94lhzfQrLgUx1TbmnA4+NGyKIVpHlBwgzxgFU6BJo0iq/iWH1+pT3/SAoGOloU
	 /qOmb7zmPnnqS7kqtaEeYxMBc5osXI48Nlc91EaOtV+E+WKW9PnOHIjGtUNFXCNAIpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f+ynfFm1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C756E606A335;
	Fri,  6 Nov 2026 09:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f+ynfFm1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD9401F0089F;
	Fri,  6 Nov 2026 09:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793957392;
	bh=MQ9OkB6wfqdTgcVkBd82n0DdBKm1PB/QvTWs0MZGpyw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=f+ynfFm1lMlvrWztprxCIOa3Xn+dvSau3++K8ZnlhqFYcBqHrMgvEooJsrxZFY6Br
	 M4+t4QjhkKR7SOhV5J+V3IVh2OS9Ki0IvnzAMICx6vlPt1zkJfQc41xxCkleH4l8ce
	 BwxEAJWpqHv4wLqD1Eo4DddcUrcDJMtYuHCLXHgiBW65CqsqEsshYbtNMma2IidzY6
	 APCr0xl/aoZ+cev/aeWFculsP65dc1DruHSYR2L3c1GX534bcJvzg0hVBsuiZK81s+
	 /OEX3I7t8MYipba7CcgJUPFtPq5+FfPgJGBgWWrW5WhwOpyehDkhSjnarC5uf82jDV
	 upUR0D9AoUN9A==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 06 Nov 2026 10:29:09 +0100
Subject: [PATCH v3 8/8] arm64: dts: qcom: Add Glymur SiP CRD
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-topic-sip_cob-v3-8-52cd3826ab49@oss.qualcomm.com>
References: <20261106-topic-sip_cob-v3-0-52cd3826ab49@oss.qualcomm.com>
In-Reply-To: <20261106-topic-sip_cob-v3-0-52cd3826ab49@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
 Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>, 
 Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
 Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>, 
 Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793957348; l=1849;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=vI7NkJXkioSvW8rX6O7CD/xKKKlgwoa1oPgcQyYMCK4=;
 b=CJNa9AxG2ApR6KUIwz91Rf/xTdXnufAZcpZ9JOb5TiudvD3Vs2sqpMJMC6pY67zsPslhk3S0A
 5vWodauWn7PDHgH7qMe72I9YQ0nQLEFsIrN1/aswgFbxcYcO/sGNj9+
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The Glymur family of chips comes in two flavors: CoB (Chip-on-Board),
where the SoC is soldered down to the PCB and SiP (System-in-Package),
where an entire module is soldered down instead.

The SiP flavor is used for the couple highest-power SKUs and brings
with itself a different power grid. Add support for that.

Build it on top of glymur-sip.dtsi for the power grid and reuse
glymur-crd.dtsi for the rest of the board description.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile           |  1 +
 arch/arm64/boot/dts/qcom/glymur-sip-crd.dts | 14 ++++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 830c43000897..2684cac9f9c8 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -22,6 +22,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-hp-elitebook-x-g2q.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-lenovo-yoga-slim7x.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-qcb.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= glymur-sip-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-advantech-som-db5830.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
 
diff --git a/arch/arm64/boot/dts/qcom/glymur-sip-crd.dts b/arch/arm64/boot/dts/qcom/glymur-sip-crd.dts
new file mode 100644
index 000000000000..5b4c6f80cfab
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/glymur-sip-crd.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "glymur-sip.dtsi"
+#include "glymur-crd.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. Glymur CRD (SiP)";
+	compatible = "qcom,glymur-sip-crd", "qcom,glymur";
+};

-- 
2.56.0

