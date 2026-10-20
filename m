Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500202;
	b=GAx0ooNgT3lyXniVMqwxtXKFKt/Ce5s8l33VL4WSBX8FcEYxxJFEDj1PEFDQRkbiGRDn
	 OOVtJW18Gs/hc4qpoQoAiL2A9KR15IML0Y9eWClyuWEc+muXh/21Kv0hmFrVTqA/FZlF3
	 PXEX4Zdi6DPNJkp95yTrv3FAwPnEngfQQxohsjGhBJUp6jQZ0nY1KdOpfUiuyazMaAMi+
	 NdJMSa26lKRtB6+KHg+sM36KwalZ2b7XS7jYwdWroeNCD66rV/3e+JqK0P1mjJ1wyU/mT
	 yhtWF33Y0anoJeMPDDz3tSgyEqG7XBTbiVZ+fyG2jSn4iukBwOk5Fldcb5O/xT48r8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500202;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=LXX0mSVJfD3sfFg4FhrjyN5+Zx5enLsqoBnUui1veG8=;
	b=wX1csp2CRsdbc72cULL7WnzRq2y4L3YJK4S3P7Q5tdnrjvIboBDqk61T5a+LUaNn9ro0
	 ET6vmfFosybmSfV5KTItX40C07XdlDVOzclqdx0tbIJRzF8rQnozAqNcetz85EyGUkT/g
	 OdOn90l0XXlzqCUNrORoQaMInKRJkZc59rZIRE+JDcodt5entpJcnc5S8RvM6Lbk9SRR5
	 ufrK2Al3pBksJ41ft3+i/W5CUtgAyZZAwzY48a+im+HJwSzeeBpE1lAEv9ZpBWWTXv9Sn
	 QfTh6nWhuyUNB5tkK3UWJvbIabZveWWPHqoQJ/RGsHvprBLA5DpClN6Jbk0yy9eqDkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BfETI+rJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418E9606A31D;
	Tue, 20 Oct 2026 12:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BfETI+rJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04E341F000C4;
	Tue, 20 Oct 2026 12:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792500201;
	bh=LXX0mSVJfD3sfFg4FhrjyN5+Zx5enLsqoBnUui1veG8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BfETI+rJhIZbBpuKWPKdHjVmEVxB0/EGGl9xYC650MKY4IvZbYRVn4Dy1hRgHm8vy
	 9fCzL9pWNo3VA3t0iwMI2ooThy29Ozt9b2HjuRlO3VDsiGFaZxgFW0sMlxv9+jaSu9
	 2m/1ajkLGbmjE8CzFkzHyQyGNAMzg8MF3LtDIAm0IXfdIMkmr88A26MEzf3EXsdjWf
	 7nciwsxA4nEZsd+uq+7e4xyjUJDPt3EKHiSssvXn5CxF68DhiqaNh6Ei4OB2nkJp5U
	 HU3y/iFOvtbLFrHN8sMqqLommhEPDth6Saq66Hr3vbIeGJjs4BL7m3if1LxX/U0GjJ
	 vBrJRNXMYy7hA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 20 Oct 2026 14:42:09 +0200
Subject: [PATCH 5/7] arm64: dts: qcom: sdm845: Use ICC tag defines
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
Message-Id: <20261020-topic-icc_defines_ao-v1-5-cae8d22649ac@oss.qualcomm.com>
References: <20261020-topic-icc_defines_ao-v1-0-cae8d22649ac@oss.qualcomm.com>
In-Reply-To: <20261020-topic-icc_defines_ao-v1-0-cae8d22649ac@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Thara Gopinath <thara.gopinath@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792500178; l=4543;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=izaV2GZjJz9WvuI+KWkzL2UJuZpH2+TW8bihuPYZv+s=;
 b=8bDi48nCApGfD+p4UXB9Bov434lr83Ob3gg7AcHBMrVK3Mlm+F49t/35OrZWfQi5LnYe/cPL4
 F+cJj0L5IA5CLyMe8fHIbOmBu5vlAANtpd3warwNrrpSp3iJROwsLsX
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The magic values come from dt-bindings. Use the existing defines to
demistify them.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 844b840bc546..425bfef4c668 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -102,7 +102,8 @@ cpu0: cpu@0 {
 			dynamic-power-coefficient = <154>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			operating-points-v2 = <&cpu0_opp_table>;
-			interconnects = <&gladiator_noc MASTER_APPSS_PROC 3 &mem_noc SLAVE_EBI1 3>,
+			interconnects = <&gladiator_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mem_noc SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			power-domains = <&cpu_pd0>;
 			power-domain-names = "psci";
@@ -131,7 +132,8 @@ cpu1: cpu@100 {
 			dynamic-power-coefficient = <154>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			operating-points-v2 = <&cpu0_opp_table>;
-			interconnects = <&gladiator_noc MASTER_APPSS_PROC 3 &mem_noc SLAVE_EBI1 3>,
+			interconnects = <&gladiator_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mem_noc SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			power-domains = <&cpu_pd1>;
 			power-domain-names = "psci";
@@ -155,7 +157,8 @@ cpu2: cpu@200 {
 			dynamic-power-coefficient = <154>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			operating-points-v2 = <&cpu0_opp_table>;
-			interconnects = <&gladiator_noc MASTER_APPSS_PROC 3 &mem_noc SLAVE_EBI1 3>,
+			interconnects = <&gladiator_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mem_noc SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			power-domains = <&cpu_pd2>;
 			power-domain-names = "psci";
@@ -179,7 +182,8 @@ cpu3: cpu@300 {
 			dynamic-power-coefficient = <154>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			operating-points-v2 = <&cpu0_opp_table>;
-			interconnects = <&gladiator_noc MASTER_APPSS_PROC 3 &mem_noc SLAVE_EBI1 3>,
+			interconnects = <&gladiator_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mem_noc SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			#cooling-cells = <2>;
 			power-domains = <&cpu_pd3>;
@@ -203,7 +207,8 @@ cpu4: cpu@400 {
 			dynamic-power-coefficient = <442>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			operating-points-v2 = <&cpu4_opp_table>;
-			interconnects = <&gladiator_noc MASTER_APPSS_PROC 3 &mem_noc SLAVE_EBI1 3>,
+			interconnects = <&gladiator_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mem_noc SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			power-domains = <&cpu_pd4>;
 			power-domain-names = "psci";
@@ -227,7 +232,8 @@ cpu5: cpu@500 {
 			dynamic-power-coefficient = <442>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			operating-points-v2 = <&cpu4_opp_table>;
-			interconnects = <&gladiator_noc MASTER_APPSS_PROC 3 &mem_noc SLAVE_EBI1 3>,
+			interconnects = <&gladiator_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mem_noc SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			power-domains = <&cpu_pd5>;
 			power-domain-names = "psci";
@@ -251,7 +257,8 @@ cpu6: cpu@600 {
 			dynamic-power-coefficient = <442>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			operating-points-v2 = <&cpu4_opp_table>;
-			interconnects = <&gladiator_noc MASTER_APPSS_PROC 3 &mem_noc SLAVE_EBI1 3>,
+			interconnects = <&gladiator_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mem_noc SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			power-domains = <&cpu_pd6>;
 			power-domain-names = "psci";
@@ -275,7 +282,8 @@ cpu7: cpu@700 {
 			dynamic-power-coefficient = <442>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			operating-points-v2 = <&cpu4_opp_table>;
-			interconnects = <&gladiator_noc MASTER_APPSS_PROC 3 &mem_noc SLAVE_EBI1 3>,
+			interconnects = <&gladiator_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mem_noc SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			power-domains = <&cpu_pd7>;
 			power-domain-names = "psci";

-- 
2.56.0

