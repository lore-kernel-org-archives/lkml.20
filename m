Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794486252;
	b=wTNKTCkiJTe65Bk/zx6S/GnXscd0ck9PTmJada9LgF1Hl/MtMSbvP/ffwtbmx53z9IBW
	 cWUqYkyUpl+ilILKadzruoArVzQYh7M05+V5ra4plbE73XThz3WG7SesTc6bgMuNFuXEO
	 pg7/byxvnduwhvLPNyqCrfgD5ft6auO9+5F/eC+GSaPINlk2TjzS1A4CEl+8G4DRhZRcO
	 mv9DvrOuAgVfb8u5lP+3vyIacDrUPCAynMS+MXsksARQj9DR/tN9p2tYpGZspbbmrxQ1Z
	 3Qa1JvMWiWox5Vv7n1TOtzU69/c/vAAVx6XCc+S3fb62+j4hBOn4JxIXWAMkl+WZQ+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794486252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=GsIbIoeOdN4hRu67cJKyoEtdVFyqYqyLk0dos7CScCU=;
	b=ax1t88YqtcccJGuyKbsjsIbnxNkYXqBa/0rzACSeVxZRqBBUJk3Fo32c9AD53tWZHGBY
	 aMeW/Tj0Eqv/tFxOZohpv1+0ES2zOvsQI/fza3nKx9fX9fmnUyxxtJnMEqvFrF/V2oVOC
	 h8Guhe3L91D3ztts5N4EukHNrxqOWaQhqmjGY9eLU2voiW0eCMld5V2ibDLq+ycmgyz/q
	 cvLNN3tzCFiSW4xl347mscdQwEx2bZtEdKG2OuOmmSnw9Lngs8kq8rRsVddgQbCYgFNJx
	 2qJTuAQdy4ShATAcR1Ulo58g2EscyPbY+rV8OSMpcfiObuVlRH1qIjAR7MSB5rDlPQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xRCnTnlw;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF80C606A334
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:24:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF80C606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xRCnTnlw
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b6e8b6d424so6291171a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794486250; x=1795091050; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GsIbIoeOdN4hRu67cJKyoEtdVFyqYqyLk0dos7CScCU=;
        b=xRCnTnlwyQK/GwQHxD3U4V7068WV71muUSmVB9T+ddX6SRehGgIRfKDBahkM38wTRv
         kNZp5kkNQzsufsP7DK7ZzC+86U4LtwZ/ulFefiWzKJ8kG+5b4enkrM+5Wt3q5Dd4Cud9
         f1SW0m8Ng3vnfQD+16RQHbrBZ0rte2lorC2UhcHuZIPqevOF0tP0IE+QcVf2d2ARWXJR
         Bgw8Zi+IRfyhg15kYLr2z4JdAKyo0ZI4qiEPudMMsoXS3+HTWqJNUSbHsxXS5ideZ7JG
         dBqxoKOUg/XpiFtpkkpYfwXWYXaJBbnyVPEQZu8XpYe3BdCLBvTjtAUpMlO6WlBWvz9C
         25Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794486250; x=1795091050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GsIbIoeOdN4hRu67cJKyoEtdVFyqYqyLk0dos7CScCU=;
        b=K/5l9R+xkCtk8RgW9d+byDWDeDGk82rDWrP3yROGMK68qcy6wEaRLx1t4IcQyS0Ogp
         lCEOwDSxmrokcr+iopVs6EM9kW9nxgR72Xf3d2lcO7fNDV5xOpEFUe3o6Wd2WmKeRsS1
         eMkxeqvQSvIWy7/YnOPyn0ie5eFUoBYcFuHp6soeTbTOqzELV90vVu2jW5AldXkM3S8J
         OEI7IcoD/9aUSKd4Y8hZnO34N0MHD7H0QJlY5O+INi6JypFeoGmoz4J/MF4MJKcqIGxu
         ZoYhWNKcIMYBSMuX6GYsj2ouy04PToRkIvg4ASX/psRA+H3qbpbSENjB5rVGumfh6DG0
         0B1g==
X-Forwarded-Encrypted: i=1; AL+hErGgDHzZAGpZ4/gBrwYng2ZZlr1CsdAu/XnVQNLXoPOWs1bbq+YcvAdDPkpKYLQ23Yq+Gil542d9fvSo9xo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9P3O6G9jdpuNuhMa/E3hmVxevk30CrZFj4rXyuW0ni9RkNsmnN
	P8Nui3U290ADOgaZfu56E8zG00+sWdiSZgGLuoeHjbFFPKH5aGaJwCOP
X-Gm-Gg: AYBFou0sfeim/bzRoNCwxUby1lU9FGiur2TWQP3KIO1iShexcaxPEWXvI316FX2VT+s
	ayCMo2jgs4jRcWwqsDF53K9u+Veke4gzEj4Mnh2AymNTkZgArp5mYIn2qlp8ZkAjU4g+grzPGUj
	AkPXN2j6Eam53dSZjIeShBHOej/crDstex4SGlxLK4Om9f5LBfT58NVClzZW9ntlH2M7R78a7PA
	Xo3BqGlFJG4pqawrYHKLVj5ZyjsGNSmy7VAJquefGfLmNS6g2mXTdbzH5UuhovcCE5tsngybwKV
	9Y1WbyxNsTjT7mQmqEMAO2tE30f4HCnxU/fecwXCTMRCSMRbJTfgahhJFVzvq9WOtwG7Fs9sH8l
	WPwo2LSoFJWx/PPuZ0IN1GGzWLeJbJgMbOCl8qrANaOVLR5QzMYemPWX2hzeoo9hfRxEVH7KdEw
	dEUR9PEajfnzJBklqaB5phQEQlyeX8eXg9/j8tYEbEzeOxeymIx0xJh6k1yjFUM7ddkJEOH6RYE
	Na+ymrCUbYDGd0eP3nOSvdD2rZLnfFkWIeLJtgoYcxr5IjuzAMuzWiJqaNFMd6nuGfl+tv7eU/N
	WJwFuCaSXdPYxvOsyhgmYzAJrQAt+58ZxJdgizzU
X-Received: by 2002:a05:6402:5607:b0:6b7:b872:27b6 with SMTP id 4fb4d7f45d1cf-6b7b872305cmr250988a12.13.1794486250115;
        Thu, 12 Nov 2026 04:24:10 -0800 (PST)
Received: from crispy-cucumber.local ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b77918d094sm1835931a12.26.2026.11.12.04.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:24:09 -0800 (PST)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 12 Nov 2026 14:23:23 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: sc7180: Add GPI DMA
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
Message-Id: <20261112-sc7180-gpi-dma-v1-2-2a8eceb49563@gmail.com>
References: <20261112-sc7180-gpi-dma-v1-0-2a8eceb49563@gmail.com>
In-Reply-To: <20261112-sc7180-gpi-dma-v1-0-2a8eceb49563@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Erikas Bitovtas <xerikasxx@gmail.com>, Vitalii Skorkin <nikroksm@mail.ru>
X-Mailer: b4 0.15.2

From: Vitalii Skorkin <nikroksm@mail.ru>

Add support for GPI DMA on SC7180. This SoC uses the same GPI DMA as
SM6350.

Signed-off-by: Vitalii Skorkin <nikroksm@mail.ru>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 101 +++++++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 29e345a6a13f..8bf669ce9f89 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/clock/qcom,lpasscorecc-sc7180.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,videocc-sc7180.h>
+#include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
@@ -881,6 +882,26 @@ opp-384000000 {
 			};
 		};
 
+		gpi_dma0: dma-controller@800000  {
+			compatible = "qcom,sc7180-gpi-dma", "qcom,sm6350-gpi-dma";
+			reg = <0 0x00800000 0 0x60000>;
+			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>;
+			dma-channels = <10>;
+			dma-channel-mask = <0x1f>;
+			iommus = <&apps_smmu 0x56 0x0>;
+			#dma-cells = <3>;
+			status = "disabled";
+		};
+
 		qupv3_id_0: geniqup@8c0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0 0x008c0000 0 0x6000>;
@@ -908,6 +929,9 @@ i2c0: i2c@880000 {
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SC7180_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
@@ -928,6 +952,9 @@ spi0: spi@880000 {
 				interconnects = <&qup_virt MASTER_QUP_CORE_0 0 &qup_virt SLAVE_QUP_CORE_0 0>,
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_0 0>;
 				interconnect-names = "qup-core", "qup-config";
+				dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				status = "disabled";
 			};
 
@@ -962,6 +989,9 @@ i2c1: i2c@884000 {
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SC7180_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
@@ -982,6 +1012,9 @@ spi1: spi@884000 {
 				interconnects = <&qup_virt MASTER_QUP_CORE_0 0 &qup_virt SLAVE_QUP_CORE_0 0>,
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_0 0>;
 				interconnect-names = "qup-core", "qup-config";
+				dmas = <&gpi_dma0 0 1 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 1 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				status = "disabled";
 			};
 
@@ -1016,6 +1049,9 @@ i2c2: i2c@888000 {
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SC7180_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
@@ -1052,6 +1088,9 @@ i2c3: i2c@88c000 {
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				dmas = <&gpi_dma0 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 3 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SC7180_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
@@ -1072,6 +1111,9 @@ spi3: spi@88c000 {
 				interconnects = <&qup_virt MASTER_QUP_CORE_0 0 &qup_virt SLAVE_QUP_CORE_0 0>,
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_0 0>;
 				interconnect-names = "qup-core", "qup-config";
+				dmas = <&gpi_dma0 0 3 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 3 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				status = "disabled";
 			};
 
@@ -1106,6 +1148,9 @@ i2c4: i2c@890000 {
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				dmas = <&gpi_dma0 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 4 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SC7180_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
@@ -1142,6 +1187,9 @@ i2c5: i2c@894000 {
 						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				dmas = <&gpi_dma0 0 5 QCOM_GPI_I2C>,
+				       <&gpi_dma0 1 5 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SC7180_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
@@ -1162,6 +1210,9 @@ spi5: spi@894000 {
 				interconnects = <&qup_virt MASTER_QUP_CORE_0 0 &qup_virt SLAVE_QUP_CORE_0 0>,
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_0 0>;
 				interconnect-names = "qup-core", "qup-config";
+				dmas = <&gpi_dma0 0 5 QCOM_GPI_SPI>,
+				       <&gpi_dma0 1 5 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				status = "disabled";
 			};
 
@@ -1182,6 +1233,26 @@ uart5: serial@894000 {
 			};
 		};
 
+		gpi_dma1: dma-controller@a00000 {
+			compatible = "qcom,sc7180-gpi-dma", "qcom,sm6350-gpi-dma";
+			reg = <0 0x00a00000 0 0x60000>;
+			interrupts = <GIC_SPI 645 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 646 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 647 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 648 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 649 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 650 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 651 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 652 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 653 IRQ_TYPE_LEVEL_HIGH>,
+						<GIC_SPI 654 IRQ_TYPE_LEVEL_HIGH>;
+			dma-channels = <10>;
+			dma-channel-mask = <0x3f>;
+			iommus = <&apps_smmu 0x4d6 0x0>;
+			#dma-cells = <3>;
+			status = "disabled";
+		};
+
 		qupv3_id_1: geniqup@ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0 0x00ac0000 0 0x6000>;
@@ -1209,6 +1280,9 @@ i2c6: i2c@a80000 {
 						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SC7180_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
@@ -1229,6 +1303,9 @@ spi6: spi@a80000 {
 				interconnects = <&qup_virt MASTER_QUP_CORE_1 0 &qup_virt SLAVE_QUP_CORE_1 0>,
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>;
 				interconnect-names = "qup-core", "qup-config";
+				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				status = "disabled";
 			};
 
@@ -1263,6 +1340,9 @@ i2c7: i2c@a84000 {
 						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SC7180_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
@@ -1299,6 +1379,9 @@ i2c8: i2c@a88000 {
 						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SC7180_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
@@ -1319,6 +1402,9 @@ spi8: spi@a88000 {
 				interconnects = <&qup_virt MASTER_QUP_CORE_1 0 &qup_virt SLAVE_QUP_CORE_1 0>,
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>;
 				interconnect-names = "qup-core", "qup-config";
+				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 2 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				status = "disabled";
 			};
 
@@ -1353,6 +1439,9 @@ i2c9: i2c@a8c000 {
 						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SC7180_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
@@ -1389,6 +1478,9 @@ i2c10: i2c@a90000 {
 						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SC7180_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
@@ -1409,6 +1501,9 @@ spi10: spi@a90000 {
 				interconnects = <&qup_virt MASTER_QUP_CORE_1 0 &qup_virt SLAVE_QUP_CORE_1 0>,
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>;
 				interconnect-names = "qup-core", "qup-config";
+				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				status = "disabled";
 			};
 
@@ -1443,6 +1538,9 @@ i2c11: i2c@a94000 {
 						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
 				interconnect-names = "qup-core", "qup-config",
 							"qup-memory";
+				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
+				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
+				dma-names = "tx", "rx";
 				power-domains = <&rpmhpd SC7180_CX>;
 				required-opps = <&rpmhpd_opp_low_svs>;
 				status = "disabled";
@@ -1463,6 +1561,9 @@ spi11: spi@a94000 {
 				interconnects = <&qup_virt MASTER_QUP_CORE_1 0 &qup_virt SLAVE_QUP_CORE_1 0>,
 						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>;
 				interconnect-names = "qup-core", "qup-config";
+				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
+				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
+				dma-names = "tx", "rx";
 				status = "disabled";
 			};
 

-- 
2.56.1

