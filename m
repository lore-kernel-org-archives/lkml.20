Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794814805;
	b=mTSf9v5ZYfeRYR6Edb9HqbrXEfgIINr/pmhxGWnvSbuTGesSWBoEBaxf9G3DLmVfbKgJ
	 RqjmlP/BwvURght778cpDsXiiMPAj77/v97uhT8ik5MmUHaglFJF3YSM9FLf4iqXo0GU0
	 y1naHota7JblkJctTj1qutJ6STo8K1pHecuc7FvHbWsLFtMODDfGn1nl/anUsWEX4c7De
	 cGj8UT/ly0c8I1wB1UWHzIApcKmMDBshGqwzZ8WzZmdcuTCAvprORZlo5k1r3rkk1ASEV
	 umMa2d2jFCHJi2qxb7RzBhinupMHqCzIuP4Jp7nO6i/jLXc8uMWs2OOigYv3pkfZaVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814805;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=9opJWJQXDvLr9WyRFptE1frZhgX4ZeDH7s1lu44vyXY=;
	b=w3bKseL8VCSQRojHaz0aDi/P40xxev6aAH7wfVzWhZNiE8nG+It58Dj8Q4OA1UwsW9cL
	 nSM2qLtIekVmz/gQ6Hyjko00fltCNbM5Ab4XNh3Dyyk5GeWxt9NS1hAzuhStgqJKQmK+6
	 cjVdUzFT18HW3gqbGbu7D1Tu9iE7WbUsyWvbQxJkxpN/8/gwPSuQu0BN5Nx2RPlLkt//w
	 Ao1htZdPPuS5fBRSIlgVQJ61DWf2/YnjGjIt0ASR+Q6zwE6+yV8bGKH1tAjGd5iag5NPL
	 KumozC6i5KOc7Mgtht8Z0E/7eS/1uKdLW/BpACScyKHGecswQVhH/A1wMCjZyf3NhTQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i8jSv+HC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADD960A3812;
	Mon, 16 Nov 2026 07:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i8jSv+HC
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794814804;
	b=m99+Gep2zPlinGBSkYyX2zUqSFOt1hL3woATuRhdXbISLX9MtJ+EZYA4bYr9pJAljjfs
	 j/TTYE9L0UeMH/TmXT6w+MPF+Q0vEik3conlRUGTy/CjstsNlFFL8ECT9m1bxEsbL8Q/H
	 /Mmf1h7aFtjboOY5eVVCtKod0YLMi0xDbcTYbbdFA1JgztLpdAh+TgqTKT7Bumq7CTaV0
	 h7WCxANcEUXXKv8IvbS45AA9raG6U0p8yR0/4Bnld4qa6IAnEPAeH88LGkNYW7xyafizV
	 Yz+VSUqXPsO5/+EPYrpEtmqgVKPv9hH3EoHtoT9ZvtlfaPHCSS8olUN30ljH+sIdWOQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794814804;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=9opJWJQXDvLr9WyRFptE1frZhgX4ZeDH7s1lu44vyXY=;
	b=DyNw+pJISOrKihmLWKKqVB8b2vn7xMRZu0Bwqisv5KOLWJvQbr6bacSa2fARbp+ODNej
	 pj4PTbJZQjVbiz2Ctpr50gJ2IKV1/jsA8csLlMw2T7dfUguO0AtUl3BPPJVjRRW3V9E+X
	 YtqCNxa1FSeYBhom4tjZE4NejGiYjnEu7wPp5Yr7VBDGIEXl2LAxb5SZEYtsd2eZ1hc+P
	 5Dyt5LOw00hm/1HVkQ1rHOSQemOst8a/WT8waQ0rJtsWDpQGmHJ2HtZRBMsUCG7xhRXM7
	 Vtf45t+giiJ4B2nDR5XU7E8CosYuZMgx8iibvoPaHxaml0pEwxZDH4Oa7xQCyog4Cbg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 424FF1F00926;
	Mon, 16 Nov 2026 07:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794814804;
	bh=9opJWJQXDvLr9WyRFptE1frZhgX4ZeDH7s1lu44vyXY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=i8jSv+HCKwKSJzUy1FCQ9Rgs5PAGsaDD59WCDZ33aG1Y7FII3S3eZ1uF7whVfw7e5
	 HeMyZkI3BIOvrZ0y8EoAdSNvFLXRF4ilMUr4ZzDooQI613OBjavXjK2907Td7yY+Aj
	 Kaj2pqIu5fZ+aFbWt08IGebolXG+MhqVhWltjCPE3ct8SQoolNwJPkdUxlBcaMDGnH
	 RXU0zDLGkcUlAbscRSMOQjnZXmjaB3QssdMpAlH8ypDdAiolTjCDOkZ9efDS69lumR
	 0tzvG3BHPaxtDJxv0p+rTsHr4FVSEzmzHYNS0YrLAhB7Sc1xI1HuAF0iHFqbXsQEod
	 nymEE0PiRBm4g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E3D0B4A3B9;
	Mon, 16 Nov 2026 07:40:00 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Mon, 16 Nov 2026 13:10:07 +0530
Subject: [PATCH v2 09/11] arm64: dts: qcom: Add Molokai (SM8845) SoC dtsi
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
Message-Id: <20261116-molokai-soc-v2-9-9dc4dddc4e96@yahoo.com>
References: <20261116-molokai-soc-v2-0-9dc4dddc4e96@yahoo.com>
In-Reply-To: <20261116-molokai-soc-v2-0-9dc4dddc4e96@yahoo.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794814798; l=5077;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=i9U8bN2uh+CEw84A9Ix/bXaG0RgpMelS8gPMiT0FCQ0=;
 b=i5nM9EwKsqL5hRBjdyHC8vShDQY2u+6Vhvc3Cbsnf+iIO/AWWw3EAIigjluoEFpSPKXCrX7/H
 l4VbItu8oV+DC4d4d74av3nJTdgTl2bJNgnESdY3feMRvwQX2G8Cojl
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
2.56.1


