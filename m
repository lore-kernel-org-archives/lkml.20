Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794774013;
	b=QSgm2tzyXjf0EgT3Eoje74DWkKuI1qeqerhwRVEIx3kP9u+6s7RI9PkvSEG0SW9BsfYN
	 7JxHGJeni36qIlQ4/vWSPUYHLQvosa9jJ4x4wkqvJFx7wkj4a3Z490F/cX9QCHqtHEaNn
	 nCEPIoNfPmUm2BU1p9gZsc3pDl4j5Tf1PJhDSRYRopWpzN/Hn1PH5BLzUTsuheFUd3Avq
	 QFEjPLlWUG7h0m+DVs6jyr71RuPyLyMV5d3oTFls16UiUpTAtV0AkI/vAYsnjR5/EajvB
	 cjCvXtTjSctOGDVex8OYGzMYGvScX9bNe4AaBJFzPSjcFqOgoMKqzClPsUFr3PLnQnw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794774013;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=g3K97sEmGQmx0N2tRmZrilaSVqjc2FRNQycCOBJOnTw=;
	b=nRCub1L9cZhrI+Q9ZSVgpvsKFwel8eLzmEe4uVZOk8OmrPOXreZPlIFIpRp7qilxUL2A
	 rix8K1VD/lK2qn2ktsrpZe/nK8ak9kbWZu5rwAQJiJnVERibCWb0h1crpkIZQ1Gbd+KjI
	 HXsupt90Rdg407ZM/OGp6nWB4HBEWgd9k2jNbbaPfyJvDRvbwG/iom+zUvsu0hZwBSK1Z
	 Vdr+rDM1f+DB3zS1Odjk4xMKoexgvSdTxyytYzfgo6tMLKZio2ka9X/tvZTgIsDcNelSw
	 1x8xkJMIUTC48jpna2Ef0QbXtCL0tYtpkYOZNjjDEgRe9Prqtf7lZROAX4YkqDDTyfQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BANuQbCY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BF160A2611;
	Sun, 15 Nov 2026 20:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BANuQbCY
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794774013;
	b=vRmXm3Nh9RhY+EvCxvqCPNqo2SDxa/Vocf+OcR3hSKHr87Bkqdr0eYaoRayiQbJBzVuj
	 IB7fQLrGbxTR0xb3ix8v95CR2dpNVHch+DlcOL82KOYzSV0Genh8ax4YZaVEFadjk1sb/
	 KBCihLSpybzpp9FldgE/1ZH6szhlI95kHVThCOROcsu8A0IbEjSk09HNQ/rXHktAHr7+A
	 3wcAV6qdbO0FkXzHagBr7tsbnRTHHibteWrWsV7xxD2WR3ysLdwV2k6yuvWznTUl3A5Si
	 S2+/irE/9l+xvbSwGdd4jD6z1+cxfKanJtb9GD/pss1lvsk1kt9RogMZlKDYuip3Jww==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794774013;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=g3K97sEmGQmx0N2tRmZrilaSVqjc2FRNQycCOBJOnTw=;
	b=YbJ8he/Vv1m+qXxYMHK3FBc1DsBiC3FH7g2s5KiI8qAwKyjO9hQNfg2pxnJO1AEiaWmM
	 3jQCiEnq5VCWb7lxf+Ek3JnLSkk4xTnoBgG9uX7OL888HJmwQLqDnojQsqoo4D1IHItCj
	 Nfq0pVdP7LlUsZvtkVVOx8MGsrwW2i37UC+O6J2ysfC58f/foeT/2vhTYf8gTsxfxwQAx
	 PTem4B8wLv1fHyPD2JW1k12uhPaMfCo7soo8xpylcJ9Gdon32peUOjOIb2gJEZWFTZPYT
	 4XphTYSKH5pyi1DiTUEQH00q3yKMeIr0jMbo3GXKm4DU0BRCe/6/38T3joP3kPXyp1Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 82EB51F000CA;
	Sun, 15 Nov 2026 20:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794774013;
	bh=g3K97sEmGQmx0N2tRmZrilaSVqjc2FRNQycCOBJOnTw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=BANuQbCYg4ejxjH3CjKsOz2E8y2pCZd/B5pcCJ4peUTiroU4Ez+9+r7Mc9/m0ygMj
	 Awet3/dUkCYxirhfw7GQHOL5bWfQDchURFqowhmhRFyNTmM9ZDvWxUnfidJ9c0MPcr
	 46Lqi2u01jye0JqnMTAgqSIPdLtOis6gVblHXtTMBJaHDYBmXn/sI5NM6YqxtqOQ6A
	 LTPyn+kzgyUTjGTTCv60Jh6hfg/11GK2Mp9d7fEmn0yj5ZbX1/hKwTsAoX6zLbE7O9
	 BkJH3UCnnAW2khVtzUxW0JjAr4wy/Kof8EALlXWuoHWdmFzZ4zQjgvMX4ULVv8fztk
	 H5RoSXQBN67SA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E876D4A1C7;
	Sun, 15 Nov 2026 20:20:10 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Mon, 16 Nov 2026 01:50:17 +0530
Subject: [PATCH 09/11] arm64: dts: qcom: Add Molokai (SM8845) SoC dtsi
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
Message-Id: <20261116-molokai-soc-v1-9-3b2ee920fa3b@yahoo.com>
References: <20261116-molokai-soc-v1-0-3b2ee920fa3b@yahoo.com>
In-Reply-To: <20261116-molokai-soc-v1-0-3b2ee920fa3b@yahoo.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Venkat Yadlapati <venkat.yadlapati@yahoo.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794774008; l=5077;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=dN4ehkKmhYmopR/D8W5OecyyWoWfD4UaBoOxVLeHzzI=;
 b=9dKCVynVqyOJlCguxOpqqvHvWzuLNcP4IJkVG4WKs0Md64rVCqAWC1r9aSFpW/gKaAF/SR+dw
 Aa3Fy5XnUroDNwsk3cBz8TPK4IYT496Yj+oLbAQn+SERoA29trYOBUW
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com
Content-Transfer-Encoding: 7bit

From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

Molokai is a Kaanapali derivative. Describe it on top of the Kaanapali
dtsi: it has its own TLMM, with different pins for most serial engines
and a different GPIO to PDC wakeup map, and a PDC with one more interrupt
range. It has neither the I2C master hub nor the fourth QUP wrapper, and
QUP3 SE5 does not exist. Its graphics clock controller is not compatible
with the Kaanapali one.

The SDC2 lines are muxed on regular GPIOs instead of dedicated pins, so
the Kaanapali SDC2 pin states are dropped; boards using SDC2 describe
their own.

Assisted-by: LLM
Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
---
 arch/arm64/boot/dts/qcom/molokai.dtsi | 204 ++++++++++++++++++++++++++++++++++
 1 file changed, 204 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/molokai.dtsi b/arch/arm64/boot/dts/qcom/molokai.dtsi
new file mode 100644
index 000000000000..82fd31bda1d9
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/molokai.dtsi
@@ -0,0 +1,204 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026 Venkat Yadlapati <venkat.yadlapati@yahoo.com>
+ *
+ * Molokai (SM8845) is a Kaanapali derivative with its own TLMM: the pins of
+ * most serial engines and all the GPIO wakeup interrupts are different. It
+ * has no I2C master hub, no fourth QUP wrapper and no QUP3 SE5, and its PDC
+ * maps one more interrupt range. The SDC2 lines are muxed on regular GPIOs
+ * instead of dedicated pins, and the GPU is an Adreno 829 instead of the
+ * Adreno 840.
+ */
+#include "kaanapali.dtsi"
+
+/delete-node/ &gpi_dma4;
+/delete-node/ &i2c_master_hub;
+/delete-node/ &qupv3_4;
+/delete-node/ &uart18;
+
+/delete-node/ &hub_i2c0_data_clk;
+/delete-node/ &hub_i2c1_data_clk;
+/delete-node/ &hub_i2c2_data_clk;
+/delete-node/ &hub_i2c3_data_clk;
+/delete-node/ &hub_i2c4_data_clk;
+/delete-node/ &qup_i2c19_data_clk;
+/delete-node/ &qup_i2c20_data_clk;
+/delete-node/ &qup_i2c21_data_clk;
+/delete-node/ &qup_i2c22_data_clk;
+/delete-node/ &qup_i2c23_data_clk;
+/delete-node/ &qup_spi19_cs;
+/delete-node/ &qup_spi19_data_clk;
+/delete-node/ &qup_spi20_cs;
+/delete-node/ &qup_spi20_data_clk;
+/delete-node/ &qup_spi21_cs;
+/delete-node/ &qup_spi21_data_clk;
+/delete-node/ &qup_uart18_cts_rts;
+/delete-node/ &qup_uart18_default;
+/delete-node/ &sdc2_default;
+/delete-node/ &sdc2_sleep;
+
+&gpucc {
+	compatible = "qcom,molokai-gpucc";
+};
+
+&pdc {
+	compatible = "qcom,molokai-pdc", "qcom,pdc";
+	qcom,pdc-ranges = <0 745 38>,
+			  <40 785 11>,
+			  <51 527 4>,
+			  <58 534 2>,
+			  <61 537 20>,
+			  <84 559 14>,
+			  <98 609 32>,
+			  <130 717 12>,
+			  <142 251 5>,
+			  <147 796 16>,
+			  <163 783 2>,
+			  <165 531 2>,
+			  <167 536 1>,
+			  <168 557 2>,
+			  <170 415 1>,
+			  <171 438 1>,
+			  <172 579 1>,
+			  <173 703 1>,
+			  <174 708 1>,
+			  <175 714 1>,
+			  <176 68 1>,
+			  <177 86 1>,
+			  <178 96 1>,
+			  <179 249 1>,
+			  <180 504 9>;
+};
+
+&qup_i2c0_data_clk {
+	pins = "gpio32", "gpio33";
+};
+
+&qup_i2c1_data_clk {
+	pins = "gpio36", "gpio37";
+};
+
+&qup_i2c4_data_clk {
+	pins = "gpio48", "gpio49";
+};
+
+&qup_i2c5_data_clk {
+	pins = "gpio72", "gpio73";
+	function = "qup1_se5_mira";
+};
+
+&qup_i2c10_data_clk {
+	pins = "gpio8", "gpio9";
+};
+
+&qup_i2c11_data_clk {
+	pins = "gpio12", "gpio13";
+};
+
+&qup_i2c12_data_clk {
+	pins = "gpio117", "gpio118";
+	function = "qup2_se4_mirb";
+};
+
+&qup_i2c14_data_clk {
+	pins = "gpio68", "gpio69";
+};
+
+&qup_i2c15_data_clk {
+	pins = "gpio80", "gpio81";
+};
+
+&qup_i2c16_data_clk {
+	pins = "gpio76", "gpio77";
+};
+
+&qup_i2c17_data_clk {
+	pins = "gpio52", "gpio53";
+};
+
+&qup_spi0_cs {
+	pins = "gpio35";
+};
+
+&qup_spi0_data_clk {
+	pins = "gpio32", "gpio33", "gpio34";
+};
+
+&qup_spi1_cs {
+	pins = "gpio39";
+};
+
+&qup_spi1_data_clk {
+	pins = "gpio36", "gpio37", "gpio38";
+};
+
+&qup_spi4_cs {
+	pins = "gpio51";
+};
+
+&qup_spi4_data_clk {
+	pins = "gpio48", "gpio49", "gpio50";
+};
+
+&qup_spi5_cs {
+	pins = "gpio75";
+	function = "qup1_se5_mira";
+};
+
+&qup_spi5_data_clk {
+	pins = "gpio72", "gpio73", "gpio74";
+	function = "qup1_se5_mira";
+};
+
+&qup_spi10_cs {
+	pins = "gpio11";
+};
+
+&qup_spi10_data_clk {
+	pins = "gpio8", "gpio9", "gpio10";
+};
+
+&qup_spi11_cs {
+	pins = "gpio15";
+};
+
+&qup_spi11_data_clk {
+	pins = "gpio12", "gpio13", "gpio14";
+};
+
+&qup_spi14_cs {
+	pins = "gpio71";
+};
+
+&qup_spi14_data_clk {
+	pins = "gpio68", "gpio69", "gpio70";
+};
+
+&qup_spi15_cs {
+	pins = "gpio83";
+};
+
+&qup_spi15_data_clk {
+	pins = "gpio80", "gpio81", "gpio82";
+};
+
+&qup_spi16_cs {
+	pins = "gpio147";
+};
+
+&qup_spi16_data_clk {
+	pins = "gpio76", "gpio77", "gpio146";
+};
+
+&qup_spi17_cs {
+	pins = "gpio55";
+};
+
+&qup_spi17_data_clk {
+	pins = "gpio52", "gpio53", "gpio54";
+};
+
+&tlmm {
+	compatible = "qcom,molokai-tlmm";
+	gpio-ranges = <&tlmm 0 0 206>;
+};

-- 
2.56.0


