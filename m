Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793357586;
	b=rclW/HY/HIiLgHieIfVfaVqaLMqrFr4D3r53OyzzXavjvF9jtHtFC3As9LO0h3nAu8NX
	 TV0FvhGeHzciuzFGkkbR4LrWbvURt4xQoF+pcgI3EO5ptfVPmN3mn9uIZNMxiAAmPp2Ar
	 f46SGCnvtwL11bk6tIkI1ltjxHhZtK2+jg8sfQ067uFnYSgOP1bAZ+IoaPuiQw0DStne1
	 n8oU+QGz2bLV847tyfYe5tJL8N7G1/QC3A6SbcfxAg6/gX+icTEP6133EXct/6dAdedUS
	 SM0gaegNY8ZGxHpNtECY6IBTMmgwR50sNCnbJr+Ql4/Km6pWIAi2LN/CoQWIJ9StCvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357586;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=2sRAnzrXo/IO6NHe89+B61u74l/A3iN2H9fA8EACcaM=;
	b=rSLoYV0VMzKDmUozWR15ZlcB6X2TyI/l8skRSmbH3uLVRGuRA/2a/Phi+Wtky1/jkqZ4
	 Bpl4FpZ7ADo4nPVFcuHXf59m+YpyNAs6JcEkvpR39+u6EML+TwYup4D+wxygr/YxRtMvM
	 s8Q3DAEpCJJix+fXGb1m+o5EXrkONhE0CChdD2DEzeKgdglKSdmqHkfDV7I3i9fTJs2vQ
	 Ic3P1bpg4kPiduh1VhWXV/brmwR58JhoxjgQ8OyqwgAOSRrlS5/AyOBNbqZUJ12A/yXtx
	 BOJ+S3otdZfOhxkOl8VENDfQczBAiwimXfFgblPZx9Fbuypeef3PWZwFtxWPeOA3Ctw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d78hXNlm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680AD60706B2;
	Fri, 30 Oct 2026 10:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d78hXNlm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46A1A1F000C1;
	Fri, 30 Oct 2026 10:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793357586;
	bh=2sRAnzrXo/IO6NHe89+B61u74l/A3iN2H9fA8EACcaM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=d78hXNlmewKFxbyiY89tPlnbG2q1S5ygRLy+Wl1gOj+W9itBHHQysa8fkXDhMmLzk
	 vF3TV99B5QisNBIBMBEdAClTnX78xjvCrng1MNOGwDaA9yEcbHeIPxdWyhc07bokj2
	 VQBG3iAs/i0bcTbIIPKtyf8MjvAbbQuqp5UMMxU+g4/HNvVCUEJFAQkZkXjPtINgwn
	 zON2qXK4NaAMCKNKF7ZX2ZVqE31MvJa8z2mnvova141LxElDCS+oikPPVigR/1dJN6
	 A1H0dVTyEJ7QFyuwty3zJNLaOTdPa3i5t3vUNpWiGtJY/L17k3MI2rbzvSURZvr1iL
	 4O0NT40oQwUnw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 30 Oct 2026 11:52:35 +0100
Subject: [PATCH v2 3/3] arm64: dts: qcom: glymur: Drop L4F0
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
Message-Id: <20261030-topic-sip_cob-v2-3-159e29e97c82@oss.qualcomm.com>
References: <20261030-topic-sip_cob-v2-0-159e29e97c82@oss.qualcomm.com>
In-Reply-To: <20261030-topic-sip_cob-v2-0-159e29e97c82@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>, 
 Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793357562; l=2399;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=3WPs2TL6IcBs0iGSRIe7isWNHEr2G6vhC/dWlaoG1rA=;
 b=vStYpPA0R8KpYM2DgX2unJKWjmpWlO2moH4ao2XkLlAtOXdU1IvZKuYhcZCBzq+/5mwOdNU5X
 ZjVzpoW8j8dBlQRzWE0CEoFCIfobJ5kk83mdeaI0T5vW/1yMadCX8bv
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

This is VDD_LPI_MX, already controlled by RPMH as an ARC/RPMHPD.
Drop it.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi                         | 7 -------
 arch/arm64/boot/dts/qcom/glymur-qcb.dtsi                         | 7 -------
 arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts | 7 -------
 3 files changed, 21 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 422ed0308147..422b3778c22a 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -390,13 +390,6 @@ vreg_l17b0: ldo17 {
 };
 
 &rpmh_vregs_f_e0 {
-	vreg_l4f0: ldo4 {
-		regulator-name = "vreg_l4f0";
-		regulator-min-microvolt = <1080000>;
-		regulator-max-microvolt = <1200000>;
-		regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-	};
-
 	vreg_s7f0: smps7 {
 		regulator-name = "vreg_s7f0";
 		regulator-min-microvolt = <1320000>;
diff --git a/arch/arm64/boot/dts/qcom/glymur-qcb.dtsi b/arch/arm64/boot/dts/qcom/glymur-qcb.dtsi
index 622e84f875b2..7173ab5bbeba 100644
--- a/arch/arm64/boot/dts/qcom/glymur-qcb.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-qcb.dtsi
@@ -202,13 +202,6 @@ vreg_l17b0: ldo17 {
 };
 
 &rpmh_vregs_f_e0 {
-	vreg_l4f0: ldo4 {
-		regulator-name = "vreg_l4f0";
-		regulator-min-microvolt = <1080000>;
-		regulator-max-microvolt = <1200000>;
-		regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-	};
-
 	vreg_s7f0: smps7 {
 		regulator-name = "vreg_s7f0";
 		regulator-min-microvolt = <1320000>;
diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
index e61eb3a3b8b8..27a30c4db2f7 100644
--- a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
@@ -411,13 +411,6 @@ vreg_l17b0: ldo17 {
 };
 
 &rpmh_vregs_f_e0 {
-	vreg_l4f0: ldo4 {
-		regulator-name = "vreg_l4f0";
-		regulator-min-microvolt = <1080000>;
-		regulator-max-microvolt = <1200000>;
-		regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-	};
-
 	vreg_s7f0: smps7 {
 		regulator-name = "vreg_s7f0";
 		regulator-min-microvolt = <1320000>;

-- 
2.56.0

