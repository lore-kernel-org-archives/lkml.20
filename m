Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792967297;
	b=zxn6upMDXo53SDiin84GqAf2oCHuMZuku3TZHpv6eGeYUH5ruQ7T6WLuS4fd9PSwTmuP
	 fPFPhQdjip6gSkz1jMrQTloOGCiFaWCtKq0oT+bxXggkpkCoGstD2x0reB/FFCzgWb2fg
	 s+9ycLQzgoaC/8t90tFVxVK5PlsGwY/XbNWtCW5bVv5eyz6Xoc4ecTRmmgdJmQnypa1CD
	 77ofBS6omQHZkoi7kwSHxG1fGiYpnAP4H+8lfk8NhygOD5rGlpxAGmUMvxhjSATx/LJ2F
	 MEzIGTiCTOS8ktmXF3DKIjqOewTwaBh0ViIxlZnkWgYLMGIgPV+mhdxsqYCVgpe5isw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792967297;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=jBGXedtFj5yMPt41b+rMsSFilMVowbpHnBCDEXrvcwA=;
	b=U5kDu0XUXq2/3vCwMeKtX1+MRlQaqW5j11wMYlVDi0Wu6Mp6W97oKpwouYThen7w1zs1
	 Dn93BBOuz+DaI2S6M9KE4oOxIgvgKtn4pcOZtXL9CUqifCBFUICGC5t9mLhUOFi/tgaBW
	 I/YhuTiNUBEr2o9Nqs0LIM5m8TU21GYuai4TOKEYLHjknArfY0yNfuMQI9EsuPHRnINua
	 jDGz8TpgMsuQAv9SU1p358o3m867Rqu21BCo78MM24teN66c8qIW2cMY2Citk72rdfCvY
	 ivCwbU23pgd47hkN+wUuA61UIRZtROJbE7qmYZ7PzVPmgsSkprc6oyGswPqmkALna4Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P5kAK9eB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0595606A31A;
	Sun, 25 Oct 2026 22:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P5kAK9eB
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792967296;
	b=XC4d7REHp8iXlwAsKu7/avsurvknEWfmddmFuOgfdvAOhue6IyVNhELiObSVrxMZLKhb
	 e2Dgyl6OUbHuLZbDlTCYFRrepE03ylPW3zSukBChXaxXjyyneVNvpvCkKf5F7eZqjodCi
	 6fRNpFVtw6ScGYL8lz5q8iRu8/QQ92GK1hMAiiBF9+w86pzveFJvA8lsJZpRdi0XOxrxZ
	 0m+8LJzQz+P7BPILXxCEFndlUqx0x/rVREY0QI8llaY7HQ3cFRk5/SWSAWZ57m0RMp7O9
	 qCh1TyvmqFgYK/3ClwyrQsDNv8yq/GoL8pMd/vpMZHliwCGTwPURxxl+1gCa7IDNrkw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792967296;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=jBGXedtFj5yMPt41b+rMsSFilMVowbpHnBCDEXrvcwA=;
	b=d9OuDLD69yhAbwtuJS4JeZ4KLl8zEAVloxj1AyrY2SOqnAF1unRE4i51QHz8tz4l26A9
	 T4vsuMrK9kULagEwYpbp2y2glGvZB0c6iALpUMRDJWrpNCWpfsv4NObSqg8jZ+znZnkql
	 rd5MRysJlkUG83LU+1muu8Wm/rzGmOGTFcOhTRwxkmnCpgpkerPMtcYfck83r3ECG5i79
	 h7iMjyej4pjme1KSFgTdaV/P7j2W9k1dt/TJL7PRWEu4OBPrrmT19CGcl9qceEyl4xqrV
	 u5el6MEVBBQ5ckKOIjMGQehZbZy8e1zxh0O4V/kexArxf31PfeZ3tJ6mtYACPoefiiA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ADC341F01825;
	Sun, 25 Oct 2026 22:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792967296;
	bh=jBGXedtFj5yMPt41b+rMsSFilMVowbpHnBCDEXrvcwA=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=P5kAK9eBwYKnFill6BjwP6J5P4mWqL6AJoEL6L/5/hb0XJmGmntRQHvPHxCtTap3S
	 CXYxBS/aaa3Qh6/c7e93VHRRVxBe8/neyZOfRfgAG0GhIzd5vXdYKQoxLVX53z7NLW
	 6eB8qFsMgPXCqOs2jUTzTOU5H9fjDiJNH9HyKxO2JVE/UDr7+dkmhJ9gwcGkv//PET
	 NlZUIxHY9vrCYlQ2q61v2CXh+JBL4K9j19ISbDziC9t9RYkeCZb3N380iKRiOqQ6g6
	 K3UjFUWvSKVo2sz/eJ0Ji/OlUSN7BJrpX8tLZPmbnE6x1G2RTXUR8uRGkwSGq5ttxD
	 cYVXcko4cV9ow==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 267BC44ADF;
	Sun, 25 Oct 2026 22:28:15 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 25 Oct 2026 23:28:13 +0100
Subject: [PATCH] arm64: dts: qcom: sdm845-google: Move panel pins into
 common
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
Message-Id: <20261025-pixel-panel-pins-fix-v1-1-7cde6f7ca861@ixit.cz>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWM0QoCIRBFf0XmuQGdKKJfiR5sd9wmwsRpF0H89
 7R9uXAunFNBOQsrXE2FzJuofGIHdzAwPX1cGGXuDGTp7CydMEnhNyYfx0pUDFKQOBAdw0wXstD
 VlLnf/+ztvrOujxdP39GC1n6ehVk9eAAAAA==
X-Change-ID: 20261025-pixel-panel-pins-fix-2ef223fd2820
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Selvaraj <foss@joelselvaraj.com>, 
 Casey Connolly <casey@connolly.tech>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Petr Vorel <petr.vorel@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2816; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=sZieprxE4e1RIG8z6t14P5reed770kk+50G6rXBQCqo=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBq3oJ+en+4/21fx6ETZOMR/4ZxYH/0jNcVLy9fa
 XhiVr9xT02JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCat6CfgAKCRBgAj/E00kg
 cnu8EADJgEy9gtlVyB/MBlIDisr8uSn3q7V8RQbuFp0zlCmixuOczwSqLvqdcVHmJD48cWluUs5
 r1WRvjRyE5Hs9fPCc6yzRGzbAW0ALINPMhInIzRRikLkJTz8Tc4N/0xorCdc6zFfIB412Iv+FZR
 +LThREZvwGYo+EombXjyJNybm7CDCtXgWR8s3+u8UyQVY7Jb3r+p9dq3pq4WcCX8ars02wOHu7a
 Qxzmupa5ed/WXM3R1t/q/bAbhq1R+DQjat+ACWHO4pmQid3W5W52SXPlyHQaJdrx7d9TIFH92hA
 6IJnSCtGTyRks0jNrCLq+B7muymD1dN/Bfkyh0SMu6wQBKwAvZtarwNxeuQYr4kepyvWcVTmRZi
 8HrYsbt7swrPBDbpN4uV9UUmWZM6J2MKfTYAQYcIIVD+fRay4pJ2mMKZDbfP3rrFhoYnYSPKqtj
 AkeTVysMqInbeezc1Vq8wVYeAP8SvRG3MkPAWb7R5JDkZpcru5nFjYRCnVHZAwbbO0x2270ffh5
 WX3h5BuFNanyxkiWccaKlIy5YDx07TL6kyOSZLpfmGOdxeLhPArc4hZNgci0/tzbCtUCNU5ESg5
 fP11dU6xtEXVyzUSYNPgn9eGZDQWPjnhoPw7kVr3U16rRRiRfNmc0iUTo1bd39nDVDxAmy4Pfsk
 hZyasE5jYS9MZbQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
Content-Transfer-Encoding: 7bit

From: David Heidelberg <david@ixit.cz>

Both devices share the pinctrl configuration.

Fixes: a678adbf2d22 ("arm64: dts: qcom: Add support for Pixel 3 and Pixel 3 XL")
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
Retained R-b from previous series, added Fixes: tag.

https://lore.kernel.org/all/20260924-crosshatch-panel-v2-0-08d5c7bf72fc@ixit.cz

While it's not obvious from current DT, as we upstreaming Pixel 3 XL
bits, we already know this block was misplaced.

This will save us some unplesant rebase conflicts while we upstream the
rest of the panel for Pixel 3 XL and other bits.
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
 

---
base-commit: 20a33c6b6cbe7e4805dfb6cd68816937443aa148
change-id: 20261025-pixel-panel-pins-fix-2ef223fd2820

Best regards,
--  
David Heidelberg <david@ixit.cz>


