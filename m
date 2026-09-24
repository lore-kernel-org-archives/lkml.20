Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EB937F337;
	Thu, 24 Sep 2026 14:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790258496; cv=none; b=qtcmkTaQFXixfH3m8fEJvNYZJKBO9bcKB+xxHAwvtMZvCnl+yBWbOgpvdgNQa9K9NXd7f6FNeoAJWuiycKB/qL7SWVMLke4v+3Pl2qFeMnwySpxNbTD15hLP1szU5g7WqnHkozSxs/UqKV15XJGYV7Pmcy/z5zfPmxxGYTjV0nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790258496; c=relaxed/simple;
	bh=VtMHnds7jZXNRknUpJEYmVpmQX6SoqmzQo6wLw7z8cw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZYyJ3fPShLnDReTooXFZCnyDdGFk5yuRQANYeK8pX/XWRck1pPFPG2qGviTpP2dCcxND+YpOWX7kqX9DUOrgJwcOa4cN4QlIhPjtC6R7yk18k/cvJdkdW0rMDc22wuie4m2rp3Rqsr+m9Ox6ufnKwzfcD3jAWXAk8RQle19CxmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EOcGZbFc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EOcGZbFc"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 44CFBC2BCB3;
	Thu, 24 Sep 2026 14:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790258496;
	bh=VtMHnds7jZXNRknUpJEYmVpmQX6SoqmzQo6wLw7z8cw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EOcGZbFcgHj0/yTyzroq+04u0HHDVaTRO5S0gMaGz7PzS4U5/4Xqubf5yT2cJIUH5
	 ooaevxS1RiJsBBFRjDVIlquTXNXm7Jqdha5C5g2ci7j+8hjWqmnCs5z+mn1GZ8a8U4
	 5TV29/0kfP/1RmuWrCAc/sN+BU9wlt30wnnOGlRZWTqmyL+It4mD2JZesNDhBSOEeE
	 I1x1SUYr9Z4SyPx4HGqNTZ8pns54+iN9KdWIQat5TnyIHUYEudoiQi88ag1mwNnSjw
	 xmm0nteEibdBXCuofFTxbRPp2aNDLU1YTyqVaRCcm5qVX76cXv3OBKjh65exEeiOQf
	 g6mk3i7yc99WQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3143AC98321;
	Thu, 24 Sep 2026 14:01:36 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 24 Sep 2026 16:01:38 +0200
Subject: [PATCH v2 10/11] arm64: dts: qcom: sdm845-google: Move panel pins
 into common
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-crosshatch-panel-v2-10-08d5c7bf72fc@ixit.cz>
References: <20260924-crosshatch-panel-v2-0-08d5c7bf72fc@ixit.cz>
In-Reply-To: <20260924-crosshatch-panel-v2-0-08d5c7bf72fc@ixit.cz>
To: Dzmitry Sankouski <dsankouski@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Petr Vorel <petr.vorel@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2126; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=tmWWZMnJdIiah2Ra+OBrkILlOUVZlqnIlNSnhIb5uBA=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqtS09f2wlNMXFy/rZ1CQYqSibfi/pXLBtMVeu6
 1wnc12nzs2JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCarUtPQAKCRBgAj/E00kg
 ct0AEACyeppnguTHriwBUu+k8lbdUGxD74whGrWZu8DAEYfw1G06WQYsn5KpfTWmNkAkLo/vewT
 mBgQJexOmb34ahjlHFOfgNlMs/ocRMHkzxEUCJaeWLYGnZr+ibyXj1+EyEupXSEmsrh1ygyXW6I
 MLtYVuoB3kjTlGOMagMPCFKjLI+AS8ZeCHpWg/hmNH/MTmUX0sx/Hh+5aXgX/mjl2WVLeXouaFR
 A8XhBYI/ySZZKVIH0r06QiVj7OVwhEdbe91JxOuqBeMDaNM4pgl1clv9ZIJIt7EYyMNzxQFZyd7
 FjSixpSOt2ol6xFTKCr0lUOj48Rb15v7st6H99cklzd0KOyFbSM+YOgjxH21H5/3ZTbK7kr3FlN
 DQOjvgV+9n5V68DvoyhdJDqtETDxXoN9DANks5UHEzRCeUeN/nXK1RXqxX3+PaC5WI45F6UeUmt
 fySCAFFdJUG4fp07YWdw3M3Wo0wT2zmfyjxIl1/eXmXkQ+PmGZEfVX3kvbN3PUEKCvDJYFyGccI
 66jrb5pQsElKZEhjYaO7eLhXg/8SDSiiiTggCGt73Zb7mYbpH9GhOJZpxQ1mgxMWrPAdTcvGnKa
 jzqonpUah+XR9NSSiAFuavk9Nd2ELcQbb5QtuLMp8Ohg6Vh0rLY8SWVQpM676fIHCmasq+p04rs
 jzBkIthjorSBAlA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Both devices share the pinctrl configuration.

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts | 18 ------------------
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi  | 16 ++++++++++++++++
 2 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
index fa89be500fb85..a000c75494f1c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
@@ -61,29 +61,11 @@ &mdss_dsi0_out {
 };
 
 &mdss_dsi0_phy {
 	vdds-supply = <&vdda_mipi_dsi0_pll>;
 
 	status = "okay";
 };
 
-&tlmm {
-	panel_default: panel-default-state {
-		reset-pins {
-			pins = "gpio6";
-			function = "gpio";
-			drive-strength = <8>;
-			bias-disable;
-		};
-
-		te-pins {
-			pins = "gpio12";
-			function = "mdp_vsync";
-			drive-strength = <2>;
-			bias-pull-down;
-		};
-	};
-};
-
 &wifi {
 	qcom,calibration-variant = "Google_blueline";
 };
diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
index f1379857e2742..d54cb47cdf95b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
@@ -473,16 +473,32 @@ &qup_uart9_tx {
 	drive-strength = <2>;
 	bias-disable;
 };
 
 &tlmm {
 	gpio-reserved-ranges = < 0 4>, /* SPI (Intel MNH Pixel Visual Core) */
 			       <81 4>; /* SPI (most likely Fingerprint Cards FPC1075) */
 
+	panel_default: panel-default-state {
+		reset-pins {
+			pins = "gpio6";
+			function = "gpio";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		te-pins {
+			pins = "gpio12";
+			function = "mdp_vsync";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+	};
+
 	nfc_default: nfc-default-state {
 		enable-pins {
 			pins = "gpio25";
 			function = "gpio";
 			drive-strength = <2>;
 			bias-pull-down;
 		};
 

-- 
2.55.0


