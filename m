Received: from mta0.migadu.com (out-65.mta0.migadu.com [91.218.175.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13FA3A875D
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 21:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788729096; cv=none; b=hf5g7v6G8lhQiOz5Ed9mBEAt9S5CAQR9dwEN6A0z0oGV3CzqdBE+hUXCSZVJB/5TBPX2/EVUHZyBg3EUL2aNBBnuRVbSE41dFDDvg3lQBS6nauKQZnsWu+jMnv3L4SNK4+ahzGgo7JySl2SHlQRa0yklWnye0RqzkShMtbrQ4l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788729096; c=relaxed/simple;
	bh=Dxu7j0EZk6L/GiDC65K7Tx8+dgyMDVSk/ZzLJxt6/AA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TSGsjOhcycfj62COpGDohkX/vc8ayXqikMM2pojcbMBwH6jAd+nucUaxHZ48BsqsCpSbSUMvYllvdLQvZZT1yEYTa3zEuXJlledkH1zGwJg+xNOi45DsqOqAl1AWzsErwnEY5+QH6a62Dr4ALJu9VZJFbJKy8K8GzCi1nQX5hf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=nfqtYqiU; arc=none smtp.client-ip=91.218.175.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="nfqtYqiU"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Dxu7j0EZk6L/GiDC65K7Tx8+dgyMDVSk/ZzLJxt6/AA=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788729091; v=1; x=1789333891;
 b=nfqtYqiUzZnkeitr5nU36u2sSC4KyLJFWKe7C4dycAw8WJFGyNrbVke2m5n9mb8xhoModVKc
 XC5xtpRAOClOLuX+HOen8yEEtg5FAEl9mK1I6m9DrL4b6M/PEPn0+tfVSwbO/dtvUn1U88wrV8i
 TEw4nTx/i1/z886MuzLvbnsisnVuiVhO+1ArS231KzW5lzO27zC7Ni7EAdRPPImgA7KPtSSlwQf
 RKGHOMnxzls9TpgNjg1N+o1c0HOW03gb/8zsptidJBGdyKYhGsQhjYsR/YrtzmrZJEzKu7K6xbt
 wuMBDRyebv/sLchY7KmCHZY4Wqs/9uttgpPfVqSe/Cg8w==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7e2f3994ebc3bc99;
	Sun, 06 Sep 2026 21:11:21 +0000
X-Mizu-Trace-ID: 7e2f3994ebc3bc99
X-Migadu-Flow: FLOW_OUT
From: Paul Sajna <sajattack@postmarketos.org>
Date: Sun, 06 Sep 2026 14:11:08 -0700
Subject: [PATCH v2] arm64: dts: qcom: sdm845-lg: Enable NFC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-sdm845-lg-judy-nfc-v2-1-63aeb7b1a5f6@postmarketos.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ6CMBBFr0Jm7Zi2WKCuvIdhQegAVWlJB4mEc
 HcrB3D5XvLf34ApOmK4ZhtEWhy74BOoUwbt0Pie0NnEoIQqhBEK2Y7VReOrx8fbrui7FnVnSJe
 lzk1uIQ2nSJ37HNF7nXhwPIe4Hh+L/Nm/uUWiRFUpWeZGCF2Y2xR4Hpv4pDnwOcQe6n3fvxiad
 fC7AAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788729078; l=2009;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=Dxu7j0EZk6L/GiDC65K7Tx8+dgyMDVSk/ZzLJxt6/AA=;
 b=por4ZR85E72raYS53RE+Uo1dKYlAtpVvk5SCtroO5OKGXgPvKXN+E/kfVulqIjHPBlnPZ8BY5
 GyLSinsAyhFD6UEH7bNeUlIxUCsqDEqYzI4eoi45YSaSYziXTyuhqp1
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=

Add the i2c and tlmm nodes to support the NXP PN547 NFC chip

Downstream dtsi for reference:
https://github.com/LineageOS/android_kernel_lge_sdm845/blob/lineage-22.2/arch/arm64/boot/dts/lge/sdm845-judy/sdm845-judyln_lao_com/sdm845-judyln_lao_com-nfc.dtsi

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
Changes in v2:
- correct drive-strength
- add gpio116
- Link to v1: https://lore.kernel.org/r/20260902-sdm845-lg-judy-nfc-v1-1-282173900569@postmarketos.org
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 31 ++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index b030a10009c5..c77da1b0d57d 100644
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
+		pins = "gpio12", "gpio62", "gpio63", "gpio116";
+		function = "gpio";
+		drive-strength = <2>;
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

