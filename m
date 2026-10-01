Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A143C6600;
	Thu,  1 Oct 2026 15:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790870060; cv=none; b=OaPCnSHOB9B3s+falvNuO/c6ZAG+blh8/AsZy2ROkd2xxtzf9R/9L+ozFGbUqBH2T1Wq6JnzVYn2Ht5L/ojaT0SKJ9g8nrPHoEYP/gYdZGxNgdRbk4nPW+qS5oLJl/sx20+jr70TildIRGTd+IqSpb3NNQ2CtaBrfys6LxHisWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790870060; c=relaxed/simple;
	bh=2u1xJulGh3EIqhbCg0M9JjfYgP7uopJD55HT7p/mPPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iTcAzXsAbtGrkiJlgXJcYDn3jLvPHh9/j+R+fyFbPIbYxArhzQsm+3tIOf4FqMNVXROTUh40l6vhao/IMXp6rNYRNJmISbQlJ74D3xMeX9IY69uRSC0s98VMGtOLolDFyDWOLJrwXI4AhMvLjkCedbQLXSTICsvsF8PIaKQP6kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=QSC5cCzi; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="QSC5cCzi"
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 7CB9D1FC8B;
	Thu,  1 Oct 2026 17:54:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790870049;
	bh=4xreQkLTfr4EnWmasn1726NMPTL4rKnykYzYKu9Ts+w=; h=From:To:Subject;
	b=QSC5cCzim/N9s4EI5RmBwM41nD26tPsvtWdYmJfDD89RFLaUsz4Z0gqEsXjRbYqPH
	 IfEs/42kXnxsBQ2b5FXMhb8hgzW4GLjadsqaCO+U9hjAyZmiSe0TAqeVruxUJ2AvLE
	 Jm8pxa+AyO//yuriUx+5M+he3WM8VBrHh6+vlaXcLS/UOA+TRRGDrqFATLdnGKqpBT
	 NE5r0C0yOrWS3jgD1wLXPQLMjvanMeOb/pT/SxxIVvXNaB9J/2e7Di008Kd0p2YwpG
	 odyQhsXeyNmACrOPQ/IHVl0y1/c0sZbfwR1VaULpD8mdSm6MCX2t1aVG8gVNMTk+L2
	 nOf1wLNNeRZcw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] ARM: dts: imx6q-apalis: enable SPI1 and SPI2
Date: Thu,  1 Oct 2026 17:53:58 +0200
Message-ID: <20261001155401.2584935-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261001155401.2584935-1-francesco@dolcini.it>
References: <20261001155401.2584935-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Apalis SPI1 and SPI2 are routed to user accessible connectors on both
boards, X27 and X24 on Ixora and X38 on the Evaluation Board, and a
device can be instantiated from user space through the spi_master
new_device sysfs interface, so enable the controllers here too, as the
Apalis iMX8 boards already do.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtsi      | 10 ++++++++++
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts | 10 ++++++++++
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts      | 10 ++++++++++
 3 files changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtsi b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtsi
index b6c45ad3f430..a2ab075ce120 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtsi
@@ -31,6 +31,16 @@ reg_3v3_sw: regulator-3v3-sw {
 	};
 };
 
+/* Apalis SPI1 */
+&ecspi1 {
+	status = "okay";
+};
+
+/* Apalis SPI2 */
+&ecspi2 {
+	status = "okay";
+};
+
 &i2c1 {
 	#address-cells = <1>;
 	#size-cells = <0>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts
index 3ac7a4501620..6ef2a986ca8c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts
@@ -100,6 +100,16 @@ &can2 {
 	status = "okay";
 };
 
+/* Apalis SPI1 */
+&ecspi1 {
+	status = "okay";
+};
+
+/* Apalis SPI2 */
+&ecspi2 {
+	status = "okay";
+};
+
 &gpio1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart24_forceoff>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts
index f338be435277..6b5393accc09 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts
@@ -65,6 +65,16 @@ &can2 {
 	status = "okay";
 };
 
+/* Apalis SPI1 */
+&ecspi1 {
+	status = "okay";
+};
+
+/* Apalis SPI2 */
+&ecspi2 {
+	status = "okay";
+};
+
 /* I2C1_SDA/SCL on MXM3 209/211 (e.g. RTC on carrier board) */
 &i2c1 {
 	status = "okay";
-- 
2.47.3

