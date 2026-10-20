Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500191;
	b=d8h9NxUq2PM/5857VPxWp1giLE7UX0CLCwQqIDq22gK0w0T+lsa87FU2LNJtREOuOQYx
	 VxWz8fqLVQnAqhCrNoG9mgY+dsmhSM6XS+9uk+ioBpweYOlM9hT5ZVrxJ29DaFHmUwqBy
	 0DnxqCWLjggEVAWyQdndw7AgowI4760Mu3yCxHDAn4gqfL8ZLdsy321XPAN6puoznFG9Y
	 ygW77/e5PHHXBE//QOjvrJj4F0ALecS3kKKaFu8EPxvQEOJqkchQYtDNqOr/7sbcKjwCc
	 iz9Ur60BmzKd4rOMCJ8sKXhMzVC4zdYR4nhmhJnp5eF4eG4YFirupBNTITWmYTiw/0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500191;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=MVCL73K9OKscy8732C/XX4AudTbxU6kKFArkDg8Njkw=;
	b=eI8AwkhRhXeOGQmZkve2jDWH2gWE0H2RUorr2SYXDoAFC8H0ESQ8poA7QsJVrpHY2xJV
	 TkLaBoj2K/M4z73s3jpnsPht0ghDGovEpFVvA3LV32W8znrBPYvV0vnzigvkS6GFt8kUN
	 eZGoora93k98kjvCGwmaOrwi0YTbapkrvH2YO2JRH6vjXM7ZnSxdQmmdJ+jOBoYLTDZU0
	 /feztyTTpopp2hG90CzP0cEMH0+wA1y8l6pXTpMK+alpYXVK03ujQOLl/Q0JdsuOuRp9b
	 lnezYkI2jTJfNcsG+khaOuvcVwCvS3sTmbaxoIM2/acKtDY0B6YcRBSVxTuEikCEljA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QPlCBRPH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38E9606A327;
	Tue, 20 Oct 2026 12:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QPlCBRPH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E6D71F000CB;
	Tue, 20 Oct 2026 12:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792500190;
	bh=MVCL73K9OKscy8732C/XX4AudTbxU6kKFArkDg8Njkw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=QPlCBRPHieKlq4IJu4Ni1ns6h3KSA5ICS51/VpvUKsEJVipKU4/dV5qaSu0QgzaMm
	 7Ut05RRMWeKCY3yd3oO97fZSj+yEeQWOjTFRLoQO2hc31SjNSmXlY/XqfHNrsK5xWA
	 kSGmtlGvCOMysvHymacOk9CVJtbxrqxVvoEOVbcsw8EhhTtF6KqUhCjUo2P+1TiOEm
	 K3Y0SG7VwLTRP33+A0ckB21f/pIOq/NcjDCIV7dZ4dEkSMlYb6rI4dbs1u6dTM2JJJ
	 mRuxc3tsF78T1pf6wsG9UcA9TF7Jfp1DOUKRKUSlu6gNxXA7PwxFcPXHq79WZv9hph
	 KJKUlV4struxA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 20 Oct 2026 14:42:06 +0200
Subject: [PATCH 2/7] arm64: dts: qcom: sc7180: Use ICC tag defines
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
Message-Id: <20261020-topic-icc_defines_ao-v1-2-cae8d22649ac@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792500178; l=4402;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=jdJzsPYQpyVaPuW5rFhX+L4So5dJHDkXygUX5luWybU=;
 b=jImjhZLWISZcrxy8NB6YHMrmiHJXKyjvnZBNx5HbtEwf0RXw8OrN9Aag/X3SU+dT0xflz86rk
 8IddeQeCIy2CfOX+F03FKnKhFSsk0e3Q+MVLUmR/XCJ72NSKKk+rLE3
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The magic values come from dt-bindings. Use the existing defines to
demistify them.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 70fbfb31d4a4..29e345a6a13f 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -89,7 +89,8 @@ cpu0: cpu@0 {
 			capacity-dmips-mhz = <415>;
 			dynamic-power-coefficient = <137>;
 			operating-points-v2 = <&cpu0_opp_table>;
-			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
@@ -119,7 +120,8 @@ cpu1: cpu@100 {
 			dynamic-power-coefficient = <137>;
 			next-level-cache = <&l2_100>;
 			operating-points-v2 = <&cpu0_opp_table>;
-			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			#cooling-cells = <2>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
@@ -143,7 +145,8 @@ cpu2: cpu@200 {
 			dynamic-power-coefficient = <137>;
 			next-level-cache = <&l2_200>;
 			operating-points-v2 = <&cpu0_opp_table>;
-			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			#cooling-cells = <2>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
@@ -167,7 +170,8 @@ cpu3: cpu@300 {
 			dynamic-power-coefficient = <137>;
 			next-level-cache = <&l2_300>;
 			operating-points-v2 = <&cpu0_opp_table>;
-			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			#cooling-cells = <2>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
@@ -191,7 +195,8 @@ cpu4: cpu@400 {
 			dynamic-power-coefficient = <137>;
 			next-level-cache = <&l2_400>;
 			operating-points-v2 = <&cpu0_opp_table>;
-			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			#cooling-cells = <2>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
@@ -215,7 +220,8 @@ cpu5: cpu@500 {
 			dynamic-power-coefficient = <137>;
 			next-level-cache = <&l2_500>;
 			operating-points-v2 = <&cpu0_opp_table>;
-			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			#cooling-cells = <2>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
@@ -239,7 +245,8 @@ cpu6: cpu@600 {
 			dynamic-power-coefficient = <480>;
 			next-level-cache = <&l2_600>;
 			operating-points-v2 = <&cpu6_opp_table>;
-			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			#cooling-cells = <2>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
@@ -263,7 +270,8 @@ cpu7: cpu@700 {
 			dynamic-power-coefficient = <480>;
 			next-level-cache = <&l2_700>;
 			operating-points-v2 = <&cpu6_opp_table>;
-			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			#cooling-cells = <2>;
 			qcom,freq-domain = <&cpufreq_hw 1>;

-- 
2.56.0

