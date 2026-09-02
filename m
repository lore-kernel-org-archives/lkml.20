Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3FD3EC817;
	Wed,  2 Sep 2026 20:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788382759; cv=none; b=LXGZm0lP1y6469fKrjwQ3Eif2XG0r+LtTtBfMei9cPcic8aofyDFs6sxOBg7iDggizTHTTrXEgM3luyMd0645VvNQqx4mMXCS6cKb4CUTQFhEovsuaX52qL0b4SV6TSN1B/Xz1luH+UaeZfyP2Nn9s9Y5bAkR/p67C4FvvUeKJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788382759; c=relaxed/simple;
	bh=o6ZMOO1F2veKkIxKQMkgJPH1tbnxOMIvUn/ozfxNnmo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G5vGObms9spFlbEdMjGTC5XYeNsOP6yOwmlO/2UTWPC8br5TCqqcUOLk5ZJgtqobMdy/oAxw47Y42fsLuQm5B79EYiBqs8BaVTFzL98pNQQO2GQd3V/AGgRZEdN1zR3e+9ecjSHx661t6/uMrEhzAjV1KocjZycgfcx011cWpY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YRQZJRSD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YRQZJRSD"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 269C9C2BCFB;
	Wed,  2 Sep 2026 20:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788382759;
	bh=o6ZMOO1F2veKkIxKQMkgJPH1tbnxOMIvUn/ozfxNnmo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YRQZJRSDOPdmBfqSG5imhLnHSKM6Dm6iUvbzoabqvKmKQHMirJowNQupWYaocPdKe
	 EjUa55gp8Qw/pmEGRoiCDG6tyKkybmVcu5yT5Ar36Oa9NEcyRNoslZYHeSwfLaXm83
	 YzcaWUNeQtaqNgSw4tWVR84YYJJ8ybNYreDY0dALVL0TuAp25yfVkTgrYPQylzQJOl
	 gQzooVvynnntAU9P4+EZNnXEHGqLVGFaMUcQzFO/Xh/kgdIstW6RFV6M1SNkHuRHJj
	 4aiw6ep8ZN+r4SjON+vFu9wVvEPr8weoyGTg880WbwHEHZWEG5FuxLZ4wxE+3ewAm8
	 Wwl4RDDzj3nhQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09E7EC61DD6;
	Wed,  2 Sep 2026 20:59:19 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 02 Sep 2026 22:59:13 +0200
Subject: [PATCH 2/3] arm64: dts: qcom: sdm845-google: Improve NFC pins
 description
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-sdm670-sargo-nfc-v1-2-bed1cbbffc46@ixit.cz>
References: <20260902-sdm670-sargo-nfc-v1-0-bed1cbbffc46@ixit.cz>
In-Reply-To: <20260902-sdm670-sargo-nfc-v1-0-bed1cbbffc46@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Richard Acayan <mailingradian@gmail.com>
Cc: Marco Mattiolo <marco.mattiolo@hotmail.it>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2154; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=1g5bzY+HsNyCbevfoHcORR+VD1MfbCn1WfNGutR8+KA=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqmI4lOhMcUlhuWQwB8IJwJ0OMA0LRE/4ETGGyk
 2h/u6PZJoiJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCapiOJQAKCRBgAj/E00kg
 cjnmD/96ZqcIp7Pv1yb8cSdUWl6kGkV9H7jNxfyUoqFmPEJWYwJKwD88Q6lPnsJety5miI/0mYL
 B/GAn2NxMheJRMCJlK/58aUTAGekVYWyFbB42vD0IAv5qKMKiBMit/1wkdTvMCOEShthcfwuz86
 KGGD94K+TFIbJ0wGIkAhfvjCzisGoHJGlRM19T/iUuoH2FwMZLDrDrlxFpAD5ZgJk4UQcA22eMe
 GLgHtf9nDWt9YwrDXZS3JArqnxhoCFsgN6suaJFB9TUYfcZOtKDMaGHcs9FKmgKS+21lKjKjLlH
 nEiWin2Yj9A8Kl4Yc7AwdZgZmdHaLdRv9YC6w6zCeA2HfWbabHtpzcbK1wVDVOtc4g3XfaZ1ywK
 +RAtUfm5SYUFunS59EBkWCQAx1WaqUhLCMuLprbE25dCf0NKyNGz6aJ2kU2x16QNmQaMXKiTnHj
 StIuCe30NL5JX3x+egXp71wwqjXIJWZL6EowVtxhVj9ROTa0btsOYASGmkvC5czETOjY9kJD4YD
 HScjpP//QW+jtAiLJ7NxodZQRi11XgxNR1nUMftqAJm/v0CFDyj2oAow3dlZCTWUdtpfdwEb04G
 UPUJCRsSVco76Sosvffn7Ufl59yATUHRt1uO6JiQFWM/Sne6ZSfdKSQMY7XDDVWB902G310tAa+
 ZnaHlOFySJSOAyg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Be more clear with pin description and group all of them into one state.

No functional changes.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 34 ++++++++++++++--------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
index f73d4ea57705f..f1379857e2742 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
@@ -400,17 +400,17 @@ nfc@28 {
 		compatible = "nxp,pn557", "nxp,nxp-nci-i2c";
 		reg = <0x28>;
 
 		interrupts-extended = <&tlmm 63 IRQ_TYPE_EDGE_RISING>;
 
 		enable-gpios = <&tlmm 25 GPIO_ACTIVE_HIGH>;
 		firmware-gpios = <&tlmm 79 GPIO_ACTIVE_HIGH>;
 
-		pinctrl-0 = <&nfc_int_default &nfc_enable_default>;
+		pinctrl-0 = <&nfc_default>;
 		pinctrl-names = "default";
 	};
 };
 
 &i2c12 {
 	/* Bottom spkr (right) CS35L36 @ 40 */
 
 	/* Top spkr (left) CS35L36 @ 41 */
@@ -473,28 +473,38 @@ &qup_uart9_tx {
 	drive-strength = <2>;
 	bias-disable;
 };
 
 &tlmm {
 	gpio-reserved-ranges = < 0 4>, /* SPI (Intel MNH Pixel Visual Core) */
 			       <81 4>; /* SPI (most likely Fingerprint Cards FPC1075) */
 
-	nfc_int_default: nfc-int-default-state {
-		pins = "gpio63";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-pull-down;
-	};
+	nfc_default: nfc-default-state {
+		enable-pins {
+			pins = "gpio25";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		irq-pins {
+			pins = "gpio63";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		firmware-pins {
+			pins = "gpio79";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
 
-	nfc_enable_default: nfc-enable-default-state {
-		pins = "gpio25", "gpio79";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-pull-down;
 	};
 
 	touchscreen_reset: ts-reset-state {
 		pins = "gpio99";
 		function = "gpio";
 		drive-strength = <8>;
 		bias-pull-up;
 	};

-- 
2.55.0


