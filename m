Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957387;
	b=b17rjCREnnsTtXrqAWERQH0oF/3B97+UAdH8VsfdISY66sHLMCZMcnKsXfGtvHWyq+Kk
	 DjJWunQrCkjJBLgIXOFPwccAFekM99PwZJ9ms92RrGm0C7FBrb+rJ3oApi5Y0rsfDCH92
	 sKDIGafzoLv5PqDujflgTGQPzW48YyJvTuUWS5vs3qNosVwsI9unk745HcmYrwaOFJBpe
	 UWS2dwv4iW06/a33Kg8e9GHFlbLrUl51/nm1HwfNRf5gPGHHQ7AnuwRdbl/cH7IrIXQIG
	 4ZDECzSgj3ahkAGr1mHX6+RXUgpL0KIGCE+oKJIz3k4/AQ1Bv0B1PnLdwxzdBJ59S9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957387;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=x0R5VqHbnaDHZP+6wtvRh01uAHGsZpbnIKXHCYTx6JQ=;
	b=Q58TAQ6P3bVCIggs5iOygIhRDcWIq/4jl19OrB3DM4Swmzhc6vm+K/aUmo74kR+TKSqY
	 p0AQ4veqE3CLoUBzo99OqDsNWeT7h88nrt8xiVeIzDTawz1S4gg0aMtbla5oAMCh82iwu
	 h9NV/Erozrwr5P7dXH5KWvWT4ecnJaDwOrAbtTAwzg5VO8FpJknBxyqCHxm8w6D3AgQFM
	 Fb2BDjGVea1gzSIdXOcCnSdSsPlsRq15p1y4ZwbSVLdDd9iY9W4pqSG1dKG+m9h0GOixw
	 8H4i3nTOcPFEnqmV0nTOqv9bzwOOn+9skxu5VG+eYtacEm7lMSJhXi40T776M3yXVqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nnufsCwF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D670606A32C;
	Fri,  6 Nov 2026 09:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nnufsCwF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 733571F008A3;
	Fri,  6 Nov 2026 09:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793957387;
	bh=x0R5VqHbnaDHZP+6wtvRh01uAHGsZpbnIKXHCYTx6JQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=nnufsCwFDsMiYYYS0PQRKnStoa9uhhNxdCM71bFfZtxcyMg82WLYPpujY5yirD5op
	 86jDhl7EIzAZm3s9beR5us77ltAc1qYBOA/TR5F85b09EBY6pEQk+IAPFxZAA2ym76
	 +HOeZqsjPWHUnCtP1aFtVAJjCTki/zhHtJb4tGMJ4uuZfL2lLWz010w6RuFbX94H2s
	 eV0GD7nWvOIGNi+tvHXuDcSo1+leITuu3z/wmZVVbWFcas5R5v8RXbTd6J8W6A7niI
	 nmfog/1AmbPY6IX91n0O6pIg3xexgXjz25HKQaeTq41PCbjerV4QxoP8cVV26uTrMF
	 v11OV+pJd0keA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 06 Nov 2026 10:29:08 +0100
Subject: [PATCH v3 7/8] arm64: dts: qcom: glymur-crd: Move DP0/DP1 to
 common dtsi
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
Message-Id: <20261106-topic-sip_cob-v3-7-52cd3826ab49@oss.qualcomm.com>
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
 Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793957348; l=1753;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=CQG/y4ib4Ac8iCmYhPKzckLYsBDBwLmuSPsnjO/m0no=;
 b=OFCIgf7ewT19HjaqWcZTlhu0cC8JDTItzaRTRrOjfZNR0zF1p91Nmqoj67ELmOctBdVGsOU3R
 66Vl2NhtMzSAPrZzn3t63lxFLLH8b8UW2FGFV6kgGQnyVRhgsT8iM+F
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

This seems like a rebase mistake, move it to the shared DTSI.
Doing this also enables it on Mahua CRD (that includes glymur-crd.dtsi)
which is very much a bonus and not a problem.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts  | 16 ----------------
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 16 ++++++++++++++++
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 28d9b0e4e21f..439838e8a27e 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -12,19 +12,3 @@ / {
 	model = "Qualcomm Technologies, Inc. Glymur CRD";
 	compatible = "qcom,glymur-crd", "qcom,glymur";
 };
-
-&mdss_dp0 {
-	status = "okay";
-};
-
-&mdss_dp0_out {
-	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
-};
-
-&mdss_dp1 {
-	status = "okay";
-};
-
-&mdss_dp1_out {
-	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
-};
diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index aa63ae968bae..2ec62423ad79 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -529,6 +529,22 @@ &mdss {
 	status = "okay";
 };
 
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
+&mdss_dp1 {
+	status = "okay";
+};
+
+&mdss_dp1_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
 &mdss_dp3 {
 	/delete-property/ #sound-dai-cells;
 

-- 
2.56.0

