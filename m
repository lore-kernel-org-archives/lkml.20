Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500195;
	b=1qQC+S8EQIyOl4ilIZmlf5NPfsQaPzwZlmDHM5ZtvphTjEpFGFtn+4f5zBiTcc45WeY0
	 wCfOGDJiiBDSY6BF+9E64Ts2V7guIhaAeVh36l3jKVTnpVc3NZJp/GQrS2xTk99U08w0J
	 E8NkgnQrhkdZ/4AIkUx07d29EqP9HsRdB4pJfb2NNV540l1ce9VLgc7I1pVTnLejGqXav
	 C31JHvrqKfgK2ZBY8akPzcWDRBEIXbqkQz6528mMQoxfEWcxB3NBa302dvTqWXCEDjlDf
	 UpmRE+v9rZqH9r3nxAOO9a6rBwZaX061hw2f7bWvXEp1TheGGX4EQKODiKuAETE21gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500195;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=kxdZfCqianaejY3JvRWp7nQmFeknbSDSYWLUXmk14Qc=;
	b=LHeWGYeDgb+v3lWtgtApgYPDVYFAMpKqBpORNrQ7br7ShqT742nwqDBixezW7TASe7ra
	 2/zLI5kdc0Yphw4hboPkQjkt0dYJIVGf+fIgexLFON1HiGOex5hJryal9vPGcFQRFPiR/
	 AhJI9IZbJvKLbkPvnrPhEQsF7YnfxUgO91fwa2UPZ4VbsSyvm7LNhgQgLSKgAZ0yC3v8x
	 L/9bI09R5yLx0GATUqNE7lpHq2r9000N89G0r7jFlUyoyqJiNRSwUE3WdjFiXiZ2sDzVb
	 CbDLPP+mHq8voaIK2pVGGCiMRnNUwH7q+sUcGpf8lmXkBEtU9uH4hDRcX74BhF6V6ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VGWW9sCs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F113D606A33B;
	Tue, 20 Oct 2026 12:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VGWW9sCs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F2381F000C9;
	Tue, 20 Oct 2026 12:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792500194;
	bh=kxdZfCqianaejY3JvRWp7nQmFeknbSDSYWLUXmk14Qc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=VGWW9sCsZpdK/mE8EJ+BjDumcvcub5/cRy0OwOehmm8zkN623QUsuf707zu4MQ6f5
	 ACqONfGTZfiCpebL9cCFmzWsgARPRNbVVkQDaE58PD/lCCijrRwQfNvkSyoRt5wnMn
	 HiAGTzWLYqY8Um4vDHWgaImm2wfYj8m+8+xqOeTKOwYNE9IguHRQuzi4EFif2GELyE
	 wi7TVlBYc/VJ+Lra0c52sdTxvr76i2hKGa4qpjmTLVhmgHLvX9qTp/kqSvYKvWd8sw
	 Ifoan5JWFyMSI4NUM8PUuebnwfniWqvS4p1r26J5tmK8OWY1YIgosyNMeTUmVNScor
	 9YlEEGLn5bIlg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 20 Oct 2026 14:42:07 +0200
Subject: [PATCH 3/7] arm64: dts: qcom: sc8180x: Use ICC tag defines
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
Message-Id: <20261020-topic-icc_defines_ao-v1-3-cae8d22649ac@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792500178; l=4429;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=fyKk8LoU+4YdYFJ5Wdvpb+EEr0I57u/6paLlpoIGBFw=;
 b=m0AT54Ifsj480Y5VhwNCrAe5Yo0pR51x4loamxYFFRnkeUweK4uRQh9x/iUzgjpIBvH0j20fC
 54hXm4CFspaCw6/7cX6NBrmPyzWTEPwipve9k5q4eWsnYEcE7yhZJbw
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The magic values come from dt-bindings. Use the existing defines to
demistify them.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index a85e3211958d..be79608b7161 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -54,7 +54,8 @@ cpu0: cpu@0 {
 			next-level-cache = <&l2_0>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			operating-points-v2 = <&cpu0_opp_table>;
-			interconnects = <&gem_noc MASTER_AMPSS_M0 3 &mc_virt SLAVE_EBI_CH0 3>,
+			interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			power-domains = <&cpu_pd0>;
 			power-domain-names = "psci";
@@ -83,7 +84,8 @@ cpu1: cpu@100 {
 			next-level-cache = <&l2_100>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			operating-points-v2 = <&cpu0_opp_table>;
-			interconnects = <&gem_noc MASTER_AMPSS_M0 3 &mc_virt SLAVE_EBI_CH0 3>,
+			interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			power-domains = <&cpu_pd1>;
 			power-domain-names = "psci";
@@ -108,7 +110,8 @@ cpu2: cpu@200 {
 			next-level-cache = <&l2_200>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			operating-points-v2 = <&cpu0_opp_table>;
-			interconnects = <&gem_noc MASTER_AMPSS_M0 3 &mc_virt SLAVE_EBI_CH0 3>,
+			interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			power-domains = <&cpu_pd2>;
 			power-domain-names = "psci";
@@ -132,7 +135,8 @@ cpu3: cpu@300 {
 			next-level-cache = <&l2_300>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			operating-points-v2 = <&cpu0_opp_table>;
-			interconnects = <&gem_noc MASTER_AMPSS_M0 3 &mc_virt SLAVE_EBI_CH0 3>,
+			interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			power-domains = <&cpu_pd3>;
 			power-domain-names = "psci";
@@ -156,7 +160,8 @@ cpu4: cpu@400 {
 			next-level-cache = <&l2_400>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			operating-points-v2 = <&cpu4_opp_table>;
-			interconnects = <&gem_noc MASTER_AMPSS_M0 3 &mc_virt SLAVE_EBI_CH0 3>,
+			interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			power-domains = <&cpu_pd4>;
 			power-domain-names = "psci";
@@ -180,7 +185,8 @@ cpu5: cpu@500 {
 			next-level-cache = <&l2_500>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			operating-points-v2 = <&cpu4_opp_table>;
-			interconnects = <&gem_noc MASTER_AMPSS_M0 3 &mc_virt SLAVE_EBI_CH0 3>,
+			interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			power-domains = <&cpu_pd5>;
 			power-domain-names = "psci";
@@ -204,7 +210,8 @@ cpu6: cpu@600 {
 			next-level-cache = <&l2_600>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			operating-points-v2 = <&cpu4_opp_table>;
-			interconnects = <&gem_noc MASTER_AMPSS_M0 3 &mc_virt SLAVE_EBI_CH0 3>,
+			interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			power-domains = <&cpu_pd6>;
 			power-domain-names = "psci";
@@ -228,7 +235,8 @@ cpu7: cpu@700 {
 			next-level-cache = <&l2_700>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			operating-points-v2 = <&cpu4_opp_table>;
-			interconnects = <&gem_noc MASTER_AMPSS_M0 3 &mc_virt SLAVE_EBI_CH0 3>,
+			interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			power-domains = <&cpu_pd7>;
 			power-domain-names = "psci";

-- 
2.56.0

