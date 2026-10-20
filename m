Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500206;
	b=HOTzH46C5HaObAUvobjztt1v8xrt/54OB23JLQr9FSLlua64G8wJPLMd1vaDBfaFyKJn
	 mcZz9bLTqgfFdMC3/qlFwlQ/Gm10gGBe16HI1P3B/nnpKRAxMOzNKBU/E87lQDUy0RrSU
	 r4Y2RmZBm3sFrLY/MUtVxoOePryaqtQaO3yHpqoLI+TmJ7phWP4iOzuiR1BAcWH34fZiC
	 fjtw3ZoOlwjO00sghmjtSsFNRu1FJA37kOyWyQKuyRqoiuKAQmBOeq6pAoaOjeCjp19qb
	 e8lFmRllTfeze3K88IBIWiEgT3OUzzcv5okcf2IQ5qx01qzVqDPKenerToFGCLxp6dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500206;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=JjCdQnf+8wO/TCgWfaF6WCAlo+Ii8az1WUhtSqvHT04=;
	b=wvkP0cp4uw5GqbadkpnVJ/KDcw2y8b14LBC9tP7ZODAdRS8Uvwh0nZFpBgLdqNrStWhz
	 tw+8Eg1Ffv20COrlqVfQgbb2W8ZElBRZ5FiqVXW3ykhzgyksYBt/7sBlJ7G74Q3Fx7Jx2
	 QP1AgQvWbwFNeRsHDjmXx7WKIXutZUM02yQALWcBYJb8GzS9cFPUIgkFYho04YXhvvyOj
	 2TU8EEIlKwAvW0hY0O+c8iousxxIc1+MM+WZtRCvsi7litPr0RUKEu+yNfr7Uh3F7ItuT
	 kmlCylne/xoueyQpflLGM5KWnL2YsIYtncIPINWbKldHuQ9vtMFYHHgzlPskWkgol7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TD6vngUr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B528606A336;
	Tue, 20 Oct 2026 12:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TD6vngUr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 616CE1F000CC;
	Tue, 20 Oct 2026 12:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792500205;
	bh=JjCdQnf+8wO/TCgWfaF6WCAlo+Ii8az1WUhtSqvHT04=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TD6vngUr1vl8KE8y6zB6Yh63KfeAkxEHqQE3wiYixsJmI0bYOg93uNbQs9dbR3YRp
	 Bpc8JyTQH2QUAyAjReCiGgQV+nzvpQkYTusXA6bHS+WgVtHtGuKVaNRuXBcD1Ykc5e
	 GeGr/0x3M858drIiS67dfut9Pqw29wy/tYHFU5Koz3V2K+K5IYfpodTuDK5ulrCVZL
	 b1K+ufsHa05pMKkQJEuGePL0OlH2vGbMHumH0rL4EQu/4o8yQ0vM+w5Vf5Q70FDhQO
	 8i8wn/iZMZe4vA9rWqjj5Z5qbXdeQD9gWcOYya8wUHs6zcY3itetqn6U/9sI66UWXI
	 TSPKW/rnjhp3Q==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 20 Oct 2026 14:42:10 +0200
Subject: [PATCH 6/7] arm64: dts: qcom: sm8150: Set active-only tags for CPU
 interconnects
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
Message-Id: <20261020-topic-icc_defines_ao-v1-6-cae8d22649ac@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792500178; l=4937;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=mXg6N4zFwY1LYP0Ah8v5+EQSEZZbCBTOyZQgC4jK2sI=;
 b=yKkubVvqKdGRFAsQhjVlDbmg3GVkgmh/Q0z+AEPawpyfkmVYSmZdfOdbHwf2RV4PwMd/0O+b2
 iQ06TZXN1m6B3bpe2e4zf6qWHslvdPutDmfi3LDcPBAsqDKczeUBZtY
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

RPMH lets some votes only stay active so long as the CPU subsystem is.
Take advantage of that and make the CPU frequency-bound votes behave as
such.

Fixes: 2b6187abafea ("arm64: dts: qcom: sm8150: Add CPU opp tables")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 293fcbacff34..b9846b424a93 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -16,6 +16,7 @@
 #include <dt-bindings/clock/qcom,gcc-sm8150.h>
 #include <dt-bindings/clock/qcom,gpucc-sm8150.h>
 #include <dt-bindings/clock/qcom,videocc-sm8150.h>
+#include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,sm8150.h>
 #include <dt-bindings/clock/qcom,sm8150-camcc.h>
@@ -60,7 +61,8 @@ cpu0: cpu@0 {
 			next-level-cache = <&l2_0>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			operating-points-v2 = <&cpu0_opp_table>;
-			interconnects = <&gem_noc MASTER_AMPSS_M0 0 &mc_virt SLAVE_EBI_CH0 0>,
+			interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			power-domains = <&cpu_pd0>;
 			power-domain-names = "psci";
@@ -89,7 +91,8 @@ cpu1: cpu@100 {
 			next-level-cache = <&l2_100>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			operating-points-v2 = <&cpu0_opp_table>;
-			interconnects = <&gem_noc MASTER_AMPSS_M0 0 &mc_virt SLAVE_EBI_CH0 0>,
+			interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			power-domains = <&cpu_pd1>;
 			power-domain-names = "psci";
@@ -113,7 +116,8 @@ cpu2: cpu@200 {
 			next-level-cache = <&l2_200>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			operating-points-v2 = <&cpu0_opp_table>;
-			interconnects = <&gem_noc MASTER_AMPSS_M0 0 &mc_virt SLAVE_EBI_CH0 0>,
+			interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			power-domains = <&cpu_pd2>;
 			power-domain-names = "psci";
@@ -137,7 +141,8 @@ cpu3: cpu@300 {
 			next-level-cache = <&l2_300>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			operating-points-v2 = <&cpu0_opp_table>;
-			interconnects = <&gem_noc MASTER_AMPSS_M0 0 &mc_virt SLAVE_EBI_CH0 0>,
+			interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			power-domains = <&cpu_pd3>;
 			power-domain-names = "psci";
@@ -161,7 +166,8 @@ cpu4: cpu@400 {
 			next-level-cache = <&l2_400>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			operating-points-v2 = <&cpu4_opp_table>;
-			interconnects = <&gem_noc MASTER_AMPSS_M0 0 &mc_virt SLAVE_EBI_CH0 0>,
+			interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			power-domains = <&cpu_pd4>;
 			power-domain-names = "psci";
@@ -185,7 +191,8 @@ cpu5: cpu@500 {
 			next-level-cache = <&l2_500>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			operating-points-v2 = <&cpu4_opp_table>;
-			interconnects = <&gem_noc MASTER_AMPSS_M0 0 &mc_virt SLAVE_EBI_CH0 0>,
+			interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			power-domains = <&cpu_pd5>;
 			power-domain-names = "psci";
@@ -209,7 +216,8 @@ cpu6: cpu@600 {
 			next-level-cache = <&l2_600>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			operating-points-v2 = <&cpu4_opp_table>;
-			interconnects = <&gem_noc MASTER_AMPSS_M0 0 &mc_virt SLAVE_EBI_CH0 0>,
+			interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			power-domains = <&cpu_pd6>;
 			power-domain-names = "psci";
@@ -233,7 +241,8 @@ cpu7: cpu@700 {
 			next-level-cache = <&l2_700>;
 			qcom,freq-domain = <&cpufreq_hw 2>;
 			operating-points-v2 = <&cpu7_opp_table>;
-			interconnects = <&gem_noc MASTER_AMPSS_M0 0 &mc_virt SLAVE_EBI_CH0 0>,
+			interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			power-domains = <&cpu_pd7>;
 			power-domain-names = "psci";

-- 
2.56.0

