Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632F23FA5E9;
	Sun, 20 Sep 2026 11:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789902348; cv=none; b=FVNh0B/8hiJc6ZrpXJvKg4yR+DNQXWvqAI6MO2NOnQ5aYIBCWkF/c8bixmFR4xgkriSkxbkNNejBcxTtmHi6mF0WJzL/+JafAHd9ZHmuX8AqQjZcvpZNGoJLrEnY24Goyt6jmRBBDvaCVva8MZ7HKzZ/dpKVNicdMWR7tt3J8KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789902348; c=relaxed/simple;
	bh=HTqwxsoDW+GEiKMw2vob+DK+lRuaIjBeMDVIQ5kYLkM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oRas4eKffP7JBc0kqEHeztorbUkfmzjIEMDx5ZSYPV+N448TxWXmpe8uxdOSjFLFVoRO/vwo25WH0+xTyeoRtZPXqddAnGqb+eXmxc0e4kfINfLFRWL9tD0x2lo74QB5JgI079Ao6AAdZxD+F355j7hJ9rBG+y3llG3ucPCQmqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bb3ke8de; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bb3ke8de"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2C71EC2BD00;
	Sun, 20 Sep 2026 11:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789902348;
	bh=HTqwxsoDW+GEiKMw2vob+DK+lRuaIjBeMDVIQ5kYLkM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bb3ke8dej6t0QfTVIxvP2ZVnXbwgoG8XWSxK0bIB6AsZS7J0eZdtp1dTgOb/1klwo
	 UqrFjbS2IRwVBlb4Q0EGUdt8JlXde+8TleGkBp8IOBPf+nsxLLpGUfZHpKNDGV7RFB
	 ISUY8a/cj8pV/7r4H/P2jIMtxgS/czHYpQpcYMF5Kqrw2LdGlrzlAXuKimFBUXn2ws
	 6Pza/ukQRNv4twKQryCwE/5bq0tun5HlgAFuTsrH7PPEvh31zSHSkwTv/eLgy+Qpgc
	 ivGw8m5CythWqkoPR5LWK2WKkolwYpECM5OkjgVmgVdhify6hZ5g1gFY5nq+2SXzWr
	 Bpw3hrCYmFc5w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08E33C982DA;
	Sun, 20 Sep 2026 11:05:48 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 20 Sep 2026 13:05:53 +0200
Subject: [PATCH 10/11] arm64: dts: qcom: sdm845-google: Move panel pins
 into common
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-crosshatch-panel-v1-10-de6e9512da96@ixit.cz>
References: <20260920-crosshatch-panel-v1-0-de6e9512da96@ixit.cz>
In-Reply-To: <20260920-crosshatch-panel-v1-0-de6e9512da96@ixit.cz>
To: Dzmitry Sankouski <dsankouski@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2078; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=puhYBKAvcXrkzyBsz4dN1R4eP/UpYe/4QMTawDDkgQ8=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqr74JVEiz5zQ0X52ozV/QHxD0RPEohfVwfMJ2N
 fdXIiuroWiJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaq++CQAKCRBgAj/E00kg
 cmLpD/9unZMFCRNiOwDCmS6g5x4zNaqo+BCoje8/YDwVoUgmsuU/QYKoMpQm8ol9/W/kluikFjL
 lmuftUd1pL+B7aFPf083xkQFODkEEV3uLFV/m2340y334wxT1KEVVh75sOiqE5GbQDiuK+yzlFN
 CyRdNt3MCxlacz0xzPnhvDSPhsTChucXV+CWd2w8azTiyaGbxY5x+BtpClM8HGAAmeU9IYtFalX
 8FuFyeqDx8bG5QlfInDNhMc0LFHIEukJJD6J3892iwpIo867Fl4ZSUiR8DfC3rJ3JaavTL49jmO
 y6qGi930z6BHG1+51vs8zn8ivQjqE8Q/VKsyPiw0G8xMmMNQHQ5+6/rGWP2gZfaEGjPZI9GTTWd
 NJTuqj6e8Ke/HvdhtrBGVASBGc4Zpbv7xNLzlbWAH4NL7Fg86XMsjbhzNTmwpa8qjoQyrNljcSB
 O3n0vZQcu8CnP+r74CSoSJgPKGLIfNMILfy/APGPuVrsuegzCwB8BD8ZDrhGqvpcTlT2zPfND6x
 KYFIBQVwxFYJ/S31jgQq3C9G+sx4jjAy3eQVulr3nQ8nq2MK0r0Ff1T5TV53JgVV1cg8gZIx1Hs
 dACeeO8uZuY6MDz+I2D8mEnTCLMZRXth1q4GETz8iTKZekJ5lfLrcKSeHt92aRdBeSiLbcL+Oy3
 284ew0QdCasew9Q==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Both devices share the pinctrl configuration.

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


