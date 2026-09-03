Received: from mta1.migadu.com (out-198.mta1.migadu.com [95.215.58.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E598331A4C
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 02:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788401009; cv=none; b=BuVayTD9TuQzMPFMtRPDYVe8/wdqe7BDJYF5Vq8Gh3g5FCpmSR1ofCEDMNPMRlOJN9lDSvTuRv2a4z+XX+ITGG2Q9Gf2Wdfo29Dkvs3fjpd6JhgyHPr4n6DXffJzQfPtkjX+Dp2Cs5ey8Lar89IQrOJtIUxUWr81SSD0X5+T1sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788401009; c=relaxed/simple;
	bh=fMhzI8X3Hok8lOxj6VX1r6zGfn4fks2SS0FP4mBh2DU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gEpvJ0PyucW6K55EmVmIarY5bCdxkfIjDWJ4bUOJK2PF3k5wDvTwkgTq1jXv1TQuBvcau4V6RxewCnlBr0iB+kcD7A8HJleCVvpq4dNAoVFRR7EZFAmvJmLb4/PTdjTxOaQKqzTfLN6qJSlfqW4rHNtSwHhcNMyXtD2tCMPMesw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=Rm1NSdWW; arc=none smtp.client-ip=95.215.58.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="Rm1NSdWW"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=fMhzI8X3Hok8lOxj6VX1r6zGfn4fks2SS0FP4mBh2DU=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788401004; v=1; x=1789005804;
 b=Rm1NSdWWuYi8h02xvSc3+x4Wtl/F7vu1G7YDGirMIwkDIzzwfAaaX35l0XP6/jZTRXeuQpTH
 oNz+gpCxUkNOYoL8gWGxJEAncSjTeNLZDNfbiMLXV7WgOVRTtZZTA0jXbtLV5PLwAwQpBhXEoT3
 0a3qu/PNy3RET582JxmDLhUifd+beyaCrZ4jqKUCBI6JX/i1aLoTByisS+YExkJA/LnYkReJ0oQ
 lx/+JFDjBoHdJDK1J/QxMcQ0Ktp/5LDMXXqB224+CHazR0HnHaa+6Hocwy85k8mIRdy8YZOQJhA
 n5j1b9HjAJgq/9+sLiqzL3VDgV+a2q3TNygDEeRhUSTsw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c2330e0bba2a5027;
	Thu, 03 Sep 2026 02:03:14 +0000
X-Mizu-Trace-ID: c2330e0bba2a5027
X-Migadu-Flow: FLOW_OUT
From: Paul Sajna <sajattack@postmarketos.org>
Date: Wed, 02 Sep 2026 19:03:06 -0700
Subject: [PATCH] arm64: dts: qcom: sdm845-lg: Enable NFC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-sdm845-lg-judy-nfc-v1-1-282173900569@postmarketos.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQ5AMBBA0avIrE1SpairiIXolBFK2hAi7q6xf
 Iv/HwjkmQI0yQOeTg68uYgsTWCYejcSsokGKWQptJAYzFoXCpcR58Pc6OyAympSVaVynRuI4e7
 J8vVP2+59P5VL3rpkAAAA
X-Change-ID: 20260902-sdm845-lg-judy-nfc-5f9e5775393d
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Paul Sajna <sajattack@postmarketos.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788400991; l=1832;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=fMhzI8X3Hok8lOxj6VX1r6zGfn4fks2SS0FP4mBh2DU=;
 b=dutbgdT4lcSahJt3rMyBn9aPC1+A80dpRLeYOfrWAPlvWDFQ+Wavm9pHgsSmwkBKReAa7WtAF
 HhJxRkM5c7yCbEOweP8Q6cf//AjBi1CXysJPRWZw/e4YSmTZohuxMZr
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=

Add the i2c and tlmm nodes to support the NXP PN547 NFC chip

Downstream dtsi for reference:
https://github.com/LineageOS/android_kernel_lge_sdm845/blob/lineage-22.2/arch/arm64/boot/dts/lge/sdm845-judy/sdm845-judyln_lao_com/sdm845-judyln_lao_com-nfc.dtsi

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 31 ++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index b030a10009c5..069d1cf3dead 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -471,6 +471,25 @@ &gpu {
 	status = "okay";
 };
 
+&i2c3 {
+	clock-frequency = <1000000>;
+
+	status = "okay";
+
+	nfc@28 {
+		compatible = "nxp,pn547", "nxp,nxp-nci-i2c";
+		reg = <0x28>;
+
+		interrupts-extended = <&tlmm 63 IRQ_TYPE_EDGE_RISING>;
+
+		enable-gpios = <&tlmm 12 GPIO_ACTIVE_HIGH>;
+		firmware-gpios = <&tlmm 62 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&nfc_default>;
+		pinctrl-names = "default";
+	};
+};
+
 &ipa {
 	status = "okay";
 };
@@ -551,6 +570,11 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
+&qup_i2c3_default {
+	drive-strength = <2>;
+	bias-disable;
+};
+
 &qup_uart9_rx {
 	drive-strength = <2>;
 	bias-pull-up;
@@ -609,6 +633,13 @@ sd_card_det_n: sd-card-det-n-state {
 		function = "gpio";
 		bias-pull-up;
 	};
+
+	nfc_default: nfc-default-state {
+		pins = "gpio12", "gpio62", "gpio63";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-up;
+	};
 };
 
 &uart6 {

---
base-commit: 32b6ef9a5d0eca44f9cd91f52f4faa89f145a0de
change-id: 20260902-sdm845-lg-judy-nfc-5f9e5775393d

Best regards,
-- 
Paul Sajna <sajattack@postmarketos.org>

