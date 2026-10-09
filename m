Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB46344021;
	Fri,  9 Oct 2026 20:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791578993; cv=none; b=goNQ5n1EaSNHcwVaPrF32eZEUTYC/9617HzHjoDdtHoDD656rqYIZ4k7AAstje8y4XZ5V3HSMCdDsaPPMXOAD2SoPiqBjRVH9VZ2sMbTUIx51vdekon6tccVa9Leq/VOsnV0Jcs6VNLKluYP8feOeRMUK7wQvQqyKlFTC129yDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791578993; c=relaxed/simple;
	bh=bS8ffElq8Vg3QV8tgH8g3k8lB4aEbkKQfj/QlcnNgCs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rDFbuasNPPWz72czyCkbBPspO2c1s4fV88TGdl0kPV1a810Ojnp8mSO1ueqYe5jQ8pQrUbtdE9VxBxKbIKAaPDO/v9KnpAoYkOdsuEzhqrpmDGoMmPqJQ7CjrJUMU83Bim63V6G2JPCw8vdGBsN5q2Z0YioGhXU9rUWqPQKuNAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I2AXzG51; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I2AXzG51"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B4C0FC2BCF4;
	Fri,  9 Oct 2026 20:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791578992;
	bh=bS8ffElq8Vg3QV8tgH8g3k8lB4aEbkKQfj/QlcnNgCs=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=I2AXzG517INSAJu7L2uvJpLsB/Vn7vy8gFLgJhdHNGFNOth74iOcnBht5h+bH4jBw
	 yb6Jm1olzbuLsN/eAf6Vi/eMnML69+w4lPhFtzYFVz+1GZw9bmJAjrV58c6lZBrnTE
	 EQRPob9m6reGdvrEq5s67YpzOhykKF0CySvhSKy2yr1feKRWhpyZ/abN1ru7Gcvbdg
	 mh3YRmh8Cm44siCnAaRAvA2Dw3mnUHKlyAXCRDSXwTRP/SAN8wmB2QrglhaPD5qBfg
	 R5FnV3E2uMqG4dO4uDXjKYyyxlNCrTMuznXRI3l983MvFk//m8iFnJsluO1ucYO9Q+
	 1ZJ/ted6tDPcg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C61ACA9EBE;
	Fri,  9 Oct 2026 20:49:52 +0000 (UTC)
From: Fabricio Akio via B4 Relay <devnull+fabricioakio.gmail.com@kernel.org>
Date: Fri, 09 Oct 2026 17:49:30 -0300
Subject: [PATCH] arm64: dts: qcom: sdm630: Add interconnect paths to the
 BLSP I2C and SPI controllers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-sdm630-blsp-paths-v1-1-6a86ba193e8e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrB0YE1TsVYoLE0cdaW3IaCmId
 zfW5Vv8v4NyFFZ4ZDtE/orKZ0ko8gz81C0jo/TJYMhUBVGD2r8rS+heGjB066TonC3r0lsiayB
 1IfIgv//z2d7Wzc3s12sEx3EC1O244HUAAAA=
X-Change-ID: 20261009-sdm630-blsp-paths-bb3575c30032
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, 
 Alexey Minnekhanov <alexeymin@postmarketos.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Martin Botka <martin.botka@somainline.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Fabricio Akio <fabricioakio@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791578991; l=4078;
 i=fabricioakio@gmail.com; s=20260928; h=from:subject:message-id;
 bh=98XWULvFlrGsaywNs2+4EVpHMKg2rfljbJphpWqR6lo=;
 b=Ism90WRgddmgiwZX1UP/7b5dUo0Qz3uuoN+deMvUbCRxczEXZlwEOeo9NinTMHkSZmrKjOPsA
 3z8GX6YneovCXnJ8EKrhHQvVc9zpkkyIBx65quj2KnEXVB4wvl7MJAx
X-Developer-Key: i=fabricioakio@gmail.com; a=ed25519;
 pk=TlMUT8bPI/ZQzp2q24BIQTb2qSx/jdUTBlGEXIRCm54=
X-Endpoint-Received: by B4 Relay for fabricioakio@gmail.com/20260928 with
 auth_id=1076
X-Original-From: Fabricio Akio <fabricioakio@gmail.com>
Reply-To: fabricioakio@gmail.com

From: Fabricio Akio <fabricioakio@gmail.com>

The QUP I2C and SPI controllers move their data through the BLSP BAM
DMA engines, which reach DDR as the aggregation NoC masters BLSP_1 and
BLSP_2. No path is described for them, so nothing requests bandwidth for
those masters while a transfer runs.

Describe the path from each controller's BLSP master to DDR, as the
vendor kernel votes it. On a Motorola Moto X4 (SDM630), with the
boot-time interconnect votes released and system-level sleep enabled,
an I2C transfer running as the SoC entered that sleep hung the SoC
without these paths; with them, 5,000 transfers ran through about 3,000
sleep entries.

Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
---
Tested on a Motorola Moto X4 (SDM630), whose board file is not in
mainline yet, on the sdm660-mainline tree. System-level sleep there
comes from changes not yet posted. The UART nodes get no path: their
driver requests no bandwidth.
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 3a1014804fb0..20225732e4a8 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1811,6 +1811,8 @@ blsp_i2c1: i2c@c175000 {
 			dmas = <&blsp1_dma 4>, <&blsp1_dma 5>;
 			dma-names = "tx", "rx";
 
+			interconnects = <&a2noc MASTER_BLSP_1 &bimc SLAVE_EBI>;
+
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&i2c1_default>;
 			pinctrl-1 = <&i2c1_sleep>;
@@ -1831,6 +1833,8 @@ blsp_i2c2: i2c@c176000 {
 			dmas = <&blsp1_dma 6>, <&blsp1_dma 7>;
 			dma-names = "tx", "rx";
 
+			interconnects = <&a2noc MASTER_BLSP_1 &bimc SLAVE_EBI>;
+
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&i2c2_default>;
 			pinctrl-1 = <&i2c2_sleep>;
@@ -1851,6 +1855,8 @@ blsp_i2c3: i2c@c177000 {
 			dmas = <&blsp1_dma 8>, <&blsp1_dma 9>;
 			dma-names = "tx", "rx";
 
+			interconnects = <&a2noc MASTER_BLSP_1 &bimc SLAVE_EBI>;
+
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&i2c3_default>;
 			pinctrl-1 = <&i2c3_sleep>;
@@ -1871,6 +1877,8 @@ blsp_i2c4: i2c@c178000 {
 			dmas = <&blsp1_dma 10>, <&blsp1_dma 11>;
 			dma-names = "tx", "rx";
 
+			interconnects = <&a2noc MASTER_BLSP_1 &bimc SLAVE_EBI>;
+
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&i2c4_default>;
 			pinctrl-1 = <&i2c4_sleep>;
@@ -1919,6 +1927,8 @@ blsp_i2c5: i2c@c1b5000 {
 			dmas = <&blsp2_dma 4>, <&blsp2_dma 5>;
 			dma-names = "tx", "rx";
 
+			interconnects = <&a2noc MASTER_BLSP_2 &bimc SLAVE_EBI>;
+
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&i2c5_default>;
 			pinctrl-1 = <&i2c5_sleep>;
@@ -1939,6 +1949,8 @@ blsp_i2c6: i2c@c1b6000 {
 			dmas = <&blsp2_dma 6>, <&blsp2_dma 7>;
 			dma-names = "tx", "rx";
 
+			interconnects = <&a2noc MASTER_BLSP_2 &bimc SLAVE_EBI>;
+
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&i2c6_default>;
 			pinctrl-1 = <&i2c6_sleep>;
@@ -1959,6 +1971,8 @@ blsp_i2c7: i2c@c1b7000 {
 			dmas = <&blsp2_dma 8>, <&blsp2_dma 9>;
 			dma-names = "tx", "rx";
 
+			interconnects = <&a2noc MASTER_BLSP_2 &bimc SLAVE_EBI>;
+
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&i2c7_default>;
 			pinctrl-1 = <&i2c7_sleep>;
@@ -1979,6 +1993,8 @@ blsp_spi7: spi@c1b7000 {
 			dmas = <&blsp2_dma 8>, <&blsp2_dma 9>;
 			dma-names = "tx", "rx";
 
+			interconnects = <&a2noc MASTER_BLSP_2 &bimc SLAVE_EBI>;
+
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&spi7_default>;
 			pinctrl-1 = <&spi7_sleep>;
@@ -1999,6 +2015,8 @@ blsp_i2c8: i2c@c1b8000 {
 			dmas = <&blsp2_dma 10>, <&blsp2_dma 11>;
 			dma-names = "tx", "rx";
 
+			interconnects = <&a2noc MASTER_BLSP_2 &bimc SLAVE_EBI>;
+
 			pinctrl-names = "default", "sleep";
 			pinctrl-0 = <&i2c8_default>;
 			pinctrl-1 = <&i2c8_sleep>;

---
base-commit: aac26bee2287c88af5be5a5ff96d783b19a28790
change-id: 20261009-sdm630-blsp-paths-bb3575c30032

Best regards,
--  
Fabricio Akio <fabricioakio@gmail.com>


