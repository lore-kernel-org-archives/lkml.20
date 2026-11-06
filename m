Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957367;
	b=jjJIy/ilPPyrNMZibEpQf3VF2jQuqlTUwMrPlq0nqEkngZzrVpLR6TLNeSQHDglcNK85
	 dIp+Mz/8EC/lRA8Ll+7+XbZX/EfhJ1NdDDb1cIA19PHIb5azbHdkyqM5mcgMR7ZEBHwI2
	 NgZR9Xg1c14d13cjZRSNmx6dJDdtFytNmqdVLdjcaoqruAz97Ob4q72MOohgAfBJNabnX
	 l8mGZUMk2XhTmd3StfOBKIF/F74LZwzyof9QS8HR4QB7kHDZgeRZL/n7mp4oIhh9xhv7b
	 YVrMpKadLYI+jt0jbA3dpx1IYKbX4HuybQZtA2XKbrLQYqTcR+yU1R2aC25wzbdCFJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957367;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=kONM/d67RItVUEs4Jc7bcoXUvIAPjCJJ4DsmGKSzB18=;
	b=PXrdR79E0O0VN9JpUsVqWa5/t6PFu8b0xAdh7mYGvSRmEtah2XYZR0bg+7t7P6/DBxWg
	 rz2YDYXQqHLMafMoODuQlKmd9n9hrAzhyC7sppbj8HAopQ8Erf5ZyoGURiXA0SW/BMavF
	 ocvW2bbc4F+5e7bVBLE++XpH9U5BFXR6BlTcz7eoLRtHAxh4bbGHe3X4IMU3tZhmEz9W0
	 HgXToUH/F9BjjC1RBLz60u5C84ixXI40m8PY6XB5gcOnuCvcVVYA0qSJWmzbo9a8gyFvp
	 EWC/2yJssIEN6atOoaM+NKUlptDOQNF069JxjVmo2QSMvE2vkdNUbWv2VOaFyD0CF6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SG6joK37;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FE1606A328;
	Fri,  6 Nov 2026 09:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SG6joK37
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3603E1F008A1;
	Fri,  6 Nov 2026 09:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793957367;
	bh=kONM/d67RItVUEs4Jc7bcoXUvIAPjCJJ4DsmGKSzB18=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=SG6joK37Nsf7txh3LOtMkDDRQ7emIJ5RI3Qtb6aodhOPG/pI3ydJstHiI9Bu4m1pm
	 1R4Px26cIolMwrnQWD5aEH3wuYwnQ0jz+S8YA+Klri25FUUqZhyqKWkb0PmEw+E7OH
	 eelscPzFecKw6bFugTGHSSaeq5idBN5SrJHKHTJB3f+zuHaRlgerVtyJ/rI6wVcWue
	 lymtUA7FqT/amTZSY0G/9b5Vp1HdT/W1APHSzeWQNVFiYYCiHm0LMNNndluF9EuCMW
	 EEO+2P67Z2E3NZToVxIVhZDOhUuMicqzt2J+ayzPPjFADM8a8zyKfRu+tS/Q7U+9PQ
	 WJ2GSUa2T3fcQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 06 Nov 2026 10:29:04 +0100
Subject: [PATCH v3 3/8] arm64: dts: qcom: glymur: Drop L4F0
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
Message-Id: <20261106-topic-sip_cob-v3-3-52cd3826ab49@oss.qualcomm.com>
References: <20261106-topic-sip_cob-v3-0-52cd3826ab49@oss.qualcomm.com>
In-Reply-To: <20261106-topic-sip_cob-v3-0-52cd3826ab49@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
 Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>, 
 Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
 Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>, 
 Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793957347; l=2458;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=udfYQ6nE+MXQI1LT0fQMxS1CixjRh7nHhIuKD+ztcAg=;
 b=TnGdwzgzDKfblYc6V8zEyycG9EmEiYYCyjONMYwkPhCXqIfOuLUCwlNW9hw4DJNlU0iZ3S5lv
 Uto9KM373heC0315sjQM3kDEz/Nu5NktC7k59SOyGH7EqfJl+GDKD+L
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

This is VDD_LPI_MX, already controlled by RPMH as an ARC/RPMHPD.
Drop it.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Tested-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
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

