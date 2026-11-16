Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794839409;
	b=H3usTF6Z1kYwxXI/5Asx17kc1cWH2ORAxiIvKv9kkJLqGHcV+piU88KwbC+GgWvw594F
	 DxjInHB16s3l8xScBg0rsqpKA2tbD1zgPnoH6F4vFnKFPItfwDmI0rOXO6St7kvdFy7Od
	 FJbj+rUnsT6ioasT+47uUMcfXjFg7IZ6Pc75RjK9uJDxZmYwj5/Im5khvlPyMiyXfpdhv
	 MMfLlWY7q4xI9u5sIoFUyx1gVaA+SJXybcsXAjVsbw0mE5KcWHDzgk7Qlq6ThElkD4z3P
	 iEIs9ulDEAMvXzMZdNsF8glQe5v6udDj3QX4jmE8OEL8L9dBZ2Dx87ZbdUHQRXtZ46g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839409;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=oElFm/yj2o3LRHDrA9VBkjg9/gf3iwVC8tnrYXPGEtY=;
	b=EVBfNgk1BEiOG2ZC9JI+sGWGpx/LeMeijeg/hIPQDSibnNoSyj/6LnRu6hr9bFnZSssZ
	 IUqvDP90CI1qJuvJTriurKpL9jWAVlC36dC2tSXm93E52Tg+JpXjCCIoDXwQWrkrdqhjW
	 d/O2HeeE5zFLP/i5hl5n6DsCUReQpdChLfdOm9XfmaVVcdh+emzh9PkQ9ZS6+LPnPwthy
	 xXQeZ6MFyyrltABsyhi6OxulJt5xasrFvbiJe9G07XrsnbvV+Hqu2uUdN/9i0/ARup3rw
	 oiVIZ1gHemYdVe9YQLl92K2QJc2A0nukULCYFN1USYkS41nyhp5h71l+DHUy7Vx+lRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=bM2egM1P;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A08606A89B;
	Mon, 16 Nov 2026 14:30:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13A08606A89B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=bM2egM1P
Received: from dude04.red.stw.pengutronix.de (dude04.red.stw.pengutronix.de [IPv6:2a0a:edc0:0:1101:1d::ac])
	(Authenticated sender: relay-from-dude04.red.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 2382720059B;
	Mon, 16 Nov 2026 15:30:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794839402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oElFm/yj2o3LRHDrA9VBkjg9/gf3iwVC8tnrYXPGEtY=;
	b=bM2egM1PsJ6ui+EYrbwMd/MGeBJQrXZMVba9q4erp8UXUAkyuKuF/R+vRZONyam4Rtyfmy
	39SXrCn00xVz8fzfBSkOkTK8GPAjUjSCzEsVM3YbbvUzPZY0k8jcFlSBwGuETIbN5OL9/F
	IjgaPxmhn7hvtY2j7DadlA80JvkUQeG3jvOvJifeZjAaqIVGJw0xOTy2Z5nHMJ/IJDnPGb
	SQivj4RQTVKt5O+ieLj/77ZzrzjjhC3MWPFX3CX71xtHmCkDaGS8RyhLKTMfeX5yZMdy/9
	UZAfEC3p/YlLUrMep5dp5Z68KAmuYVCvW/87OQ8b2L29lNF70DuYUaS99k9WlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794839402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oElFm/yj2o3LRHDrA9VBkjg9/gf3iwVC8tnrYXPGEtY=;
	b=eIQ9LwT4ieKpgMveJnSzLLGvXbyTn2kfSNuOt7ZPLfH6LUMLEeXcRYIed4kk9RpraTOpa6
	Cgd3QVvx9XVwdi98oAa0EFA/ptyoUzJREkJz5c31DSslYI02lZzHdPR11SzOojS2JdPw0z
	pGCpDH7e8FS3WWeYIBj/UlsoCFD4+Ztb51SKbtwA57bCEiINy6iPkd+9gwjVj8wZWd+Saj
	aBTCyMTiGPPdTvNBvChxMl+N6x1si7y8EYFbzeacJGwijlggjxypa1GgcwyuxHsb3HfHZZ
	9lqss8IhrsqdOs/aL5/u1dGz6ndQ/crdjnI/AvG88/ryIx/6efl4cW/bebMoOg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794839402; a=rsa-sha256;
	cv=none;
	b=CiCNMn6J9bOGe2ECG93EpnChs2AHhFZHCJ+N3GdC4ng485kr69z8sIPDJIhnNnJUFMVh5I
	NQbCkdAFbQW50yq/0IHkXWh7TdbURVHTFTtBtLbTLw6aLY12iNRtvvolzJ+dhjTOY4Q5RF
	gfP8jH+ACg1TUb/3VvvPfOyG0Lpg41C3ZxW4h9vb+SUxEhFfYMDZeRa0duHhlE0O3zrs2S
	NbT32RDx1MtTr4XaJ2fyw8Yo6mdCYbh9e0YS/qEWOEtEU0MnVNlwLAmgmBlRRNdJ214Il+
	LgnAPMd4nxRrIywjRuzPsYyQc+YcQKUVGJylfDUcPSy8GgsbrdVDBlX7xvjA0Q==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-dude04.red.stw.pengutronix.de smtp.mailfrom=rhi@pengutronix.de
Received: by dude04.red.stw.pengutronix.de (Postfix, from userid 1059)
	id 17688380329; Mon, 16 Nov 2026 15:30:02 +0100 (CET)
From: Roland Hieber <rhi@pengutronix.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: Roland Hieber <rhi@pengutronix.de>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH] arm64: dts: imx8mp-skov: fix input supply properties
Date: Mon, 16 Nov 2026 15:29:09 +0100
Message-ID: <20261116142912.3011357-2-rhi@pengutronix.de>
X-Mailer: git-send-email 2.47.3
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

The nxp,pca9450c node used the non-standard 'vin-supply' binding until now.
Upstream commit 4c33cef58965eb655a0a ("regulator: pca9450: link regulator
inputs to supply groups") added support for 'in*-supply' bindings, so move
to this standardized binding to fix errors on boot:

  nxp-pca9450 0-0025: Failed to create device link (0x180) with supplier
    regulator-5v-p for
    /soc@0/bus@30800000/i2c@30a20000/pmic@25/regulators/LDO1

Suggested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Signed-off-by: Roland Hieber <rhi@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
index 5453e590f64f..1c97f2c2873a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
@@ -275,13 +275,16 @@ pmic@25 {
 		pinctrl-0 = <&pinctrl_pmic>;
 		interrupts-extended = <&gpio1 3 IRQ_TYPE_EDGE_RISING>;
 		priority = <200>;
+		inl1-supply = <&reg_5v_p>;
+		inb13-supply = <&reg_5v_p>;
+		inb26-supply = <&reg_5v_p>;
+		inb45-supply = <&reg_5v_p>;
 
 		regulators {
 			reg_vdd_soc: BUCK1 {
 				regulator-name = "VDD_SOC";
 				regulator-min-microvolt = <850000>;
 				regulator-max-microvolt = <850000>;
-				vin-supply = <&reg_5v_p>;
 				regulator-boot-on;
 				regulator-always-on;
 				regulator-ramp-delay = <3125>;
@@ -291,7 +294,6 @@ reg_vdd_arm: BUCK2 {
 				regulator-name = "VDD_ARM";
 				regulator-min-microvolt = <850000>;
 				regulator-max-microvolt = <1000000>;
-				vin-supply = <&reg_5v_p>;
 				regulator-boot-on;
 				regulator-always-on;
 				regulator-ramp-delay = <3125>;
@@ -303,7 +305,6 @@ reg_vdd_3v3: BUCK4 {
 				regulator-name = "VDD_3V3";
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
-				vin-supply = <&reg_5v_p>;
 				regulator-boot-on;
 				regulator-always-on;
 			};
@@ -312,7 +313,6 @@ reg_vdd_1v8: BUCK5 {
 				regulator-name = "VDD_1V8";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
-				vin-supply = <&reg_5v_p>;
 				regulator-boot-on;
 				regulator-always-on;
 			};
@@ -321,7 +321,6 @@ reg_nvcc_dram_1v1: BUCK6 {
 				regulator-name = "NVCC_DRAM_1V1";
 				regulator-min-microvolt = <1100000>;
 				regulator-max-microvolt = <1100000>;
-				vin-supply = <&reg_5v_p>;
 				regulator-boot-on;
 				regulator-always-on;
 			};
@@ -330,7 +329,6 @@ reg_nvcc_snvs_1v8: LDO1 {
 				regulator-name = "NVCC_SNVS_1V8";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
-				vin-supply = <&reg_5v_p>;
 				regulator-boot-on;
 				regulator-always-on;
 			};
@@ -339,7 +337,6 @@ reg_vdda_1v8: LDO3 {
 				regulator-name = "VDDA_1V8";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
-				vin-supply = <&reg_5v_p>;
 				regulator-boot-on;
 				regulator-always-on;
 			};
@@ -348,7 +345,6 @@ reg_nvcc_sd2: LDO5 {
 				regulator-name = "NVCC_SD2";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <3300000>;
-				vin-supply = <&reg_5v_p>;
 				regulator-boot-on;
 				regulator-always-on;
 			};
