Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5593BED06
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792081410; cv=none; b=brGlvMDHSKbkiSzfo1k3LfprPIQmfADAMXCmJBJx28jHM6jFZ8vFQ8+JP1E7CKK+lDxJ/NNQUrOExs20IHTaLW7pjWrbyptB90KxMErpKZDbXBY4GsVezQtUvjFRX6PRJ8olZfYx3sqjzSllZJI6DeTopwGXtsDzu2IkhgM469Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792081410; c=relaxed/simple;
	bh=QPdfVv0xjaBDwPQ8HURDYLE3vCH7R5wni8Gxnxxzetw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g1kjvwidsNq3QWrnKpmIz/fVP5wJ4nrFOt1nrTuDBxEFa5evWRmRZKMzdAXYGa1qeKTEAY6+u94bWU5/7KoZ5L85mudlDrV6yqRt18j2YvrJXxM/HvUq1OTg7Trt91yIoys0Hjn3SetioF68o3w7AFhmpmgFJUGOXQ9dZfzv50c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lXe+7zyH; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lXe+7zyH"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48870973bddso101722f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792081386; x=1792686186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H1Zj18i8wLD+v0cMejrP3M0EMkqe51uSgByins6dl78=;
        b=lXe+7zyH4kYd19om9kS0Bcig0FSzepg2dPbg92YkJImuGuT0xHUhQQsIYcfQdXhjXx
         +tPSiNImd8NvXrsTSX+gPhbPFxpXJBceOL//qFU8sCAMCHmiyeJDo9Odcn8Hyf/kFY/Y
         Jc/+++lWJwysZGYw9DOZFAO1I/lbCjLNNz0emcGeD5tKoeKZe8X1pPI1+hx7jZ9b3I5C
         zlvJnKTQkVX5VQKn/j9d2+2lyxP/EQIwlbGaOPw6TcZ/SA+XGxe4Gc19vEAqVm+Yec5a
         f1uplWRiKzpum1IA75tYbkwh9HYPBXE0U50vpGY8Y4eaKqd7NghgOHF3ATMvGUX4QWg1
         2V+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792081386; x=1792686186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H1Zj18i8wLD+v0cMejrP3M0EMkqe51uSgByins6dl78=;
        b=QXs76HeC7+BO5k0Hyc5v7FTbb/s+ySSet3O/v2DFfHNShQCLNZRUCtCdJ003BLUpZt
         y2n4R1CPFeluhriET5sSfztncl+1Tc7gh/x3IHUwtx/ethpzeBLBbzhs5He8pQfYenM4
         Ipqc1AgCj5+nzaaRNwPXs7tr7JrnFa5ClekfNRbXcmZn+48QXtcQpqHkFLfCI3un9fQw
         bn5nyKY2M/3ZzmV7RNJRmmpogsGh+mafwo6UeRgBp5z6cWLKLUWrxeB+Q9stJDJb6y22
         N/TDKEhrDZ/9gB15LXYC9TfF9BKtVtavNZ3Uj832KO3J9qeyjOLNN3RnYDv2/dgfJbAQ
         Xk9A==
X-Forwarded-Encrypted: i=1; AKwUvByPbsxd053h0j74NdB+6UU6RDynQc35FBE5GI5P41IAReTdrfS0G5WCtgq4ucOU7XvEphzbbOQSM3aHTTg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIwqJt56w9L0pNFM84N6m3QnnJSpPv1TdJgPdPNpDrUtSDw5RT
	Dz4ytDbOdRm2WSDDW7+H374kO7qXykWujObUsZjsswpllkpN+cQla/Oyax05ng==
X-Gm-Gg: AYBFou1EultiC99LpHXtB3qSG1UH9rdTwfPGKrSKd1MiGfN77VQ3OdOm+Erx4kwJLdf
	8yPNW6wJVhB1JqmQLISOQKARsL0d+Z7zzqt4ulcK8iYZvGvV/R6Vx6xlYFkWgxrwf61ogJy7iv/
	zgmEWX0z+OoOw4I5v4KEIVPLP7cStXP4uDGZ/hKZE6FueQOWz9mtYiOUu24ohaPPq06Aqw/Ql97
	JPEZydn3eaqWSV90ONZfrZwc7MhktlU9gKvUUOdZU5tqguo+/iQbAIvng85DTr+TuitAG8zt7VS
	xigoSO3m6hdvlysWWl7TUhNphLKGOUeVIElsx0C94kujPMjY0dz6Amozw0tTG9MAjyY7vTlGH55
	hvbV2EkYcx/dVUoKkmfvi0eqsBwyOLcLre2Afc5OuODhKQtv4tcYVM21eEENWHPTygPBIENgTnB
	rSWfB8+qKUh4cjmqC1H33auIQA/Tkr4w1dhXZ7G7Q4xuuafvRbhM+9cAptbs5UN3gJ1XDKWyohe
	2zCzOx2RrPj6gs9qMdCeVl/DjRvsgQlMpXd9r9zGJFSYH/imTaKQCSjLlt7I6ZmtbyH+wvrUAwt
	hL4mzqUkUjBiyhCwX8XijA==
X-Received: by 2002:a5d:428f:0:b0:487:13a9:80d with SMTP id ffacd0b85a97d-48dfadffbcbmr1105292f8f.10.1792081386308;
        Thu, 15 Oct 2026 09:23:06 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab4f34sm20616982f8f.28.2026.10.15.09.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 09:23:05 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 1/1] arm64: dts: imx8mm-var-dart-sonata: Add OV5640 camera support
Date: Thu, 15 Oct 2026 18:23:01 +0200
Message-ID: <20261015162301.63838-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add support for the OV5640 camera connected to the Sonata carrier
board's first MIPI CSI port.

Describe the sensor on I2C2, its 24 MHz reference clock, fixed supplies,
and reset and power-down signals controlled by the GPIO expander.
Connect the sensor to the MIPI CSI receiver using two data lanes and
enable the receiver and CSI bridge.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mm-var-dart-sonata.dts  | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
index 57d29a5c3821..427a255fe8ec 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
@@ -75,12 +75,39 @@ clk40m: oscillator {
 		clock-output-names = "can_osc";
 	};
 
+	camera_clk: oscillator-cam {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+	};
+
 	pcie0_refclk: pcie0-refclk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <100000000>;
 	};
 
+	reg_camera_1v5: regulator-camera-1v5 {
+		compatible = "regulator-fixed";
+		regulator-name = "CAM_1V5";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+	};
+
+	reg_camera_1v8: regulator-camera-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "CAM_1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	reg_camera_2v8: regulator-camera-2v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "CAM_2V8";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+	};
+
 	reg_usdhc2_vmmc: regulator-vmmc-usdhc2 {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -95,6 +122,10 @@ reg_usdhc2_vmmc: regulator-vmmc-usdhc2 {
 	};
 };
 
+&csi {
+	status = "okay";
+};
+
 &ecspi1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_ecspi1>;
@@ -200,6 +231,26 @@ ft5x06_ts: touchscreen@38 {
 		wakeup-source;
 	};
 
+	ov5640_mipi1: camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		clocks = <&camera_clk>;
+		clock-names = "xclk";
+		AVDD-supply = <&reg_camera_2v8>;
+		DOVDD-supply = <&reg_camera_1v8>;
+		DVDD-supply = <&reg_camera_1v5>;
+		powerdown-gpios = <&pca6408_1 3 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&pca6408_1 1 GPIO_ACTIVE_LOW>;
+
+		port {
+			ov5640_mipi1_ep: endpoint {
+				remote-endpoint = <&mipi1_sensor_ep>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+
 	extcon_ptn5150: typec@3d {
 		compatible = "nxp,ptn5150";
 		reg = <0x3d>;
@@ -263,6 +314,21 @@ st33ktpm2xi2c: tpm@2e {
 	};
 };
 
+&mipi_csi {
+	status = "okay";
+
+	ports {
+		port@0 {
+			reg = <0>;
+
+			mipi1_sensor_ep: endpoint {
+				remote-endpoint = <&ov5640_mipi1_ep>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
+
 &pcie_phy {
 	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
 	fsl,tx-deemph-gen1 = <0x2d>;
-- 
2.47.3

