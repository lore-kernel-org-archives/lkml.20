Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500209;
	b=AH0X0s8XqhHtuH2ogpfN4VwvYLnyf2jJw1tZZrxKs/fO+ROv5EY+aaybJowMuVSZQzwd
	 42ohdjQpvchFvu6c8WP95jI2hI4SPngBIZQ+i/fuXUiPWZahWRaqdKs24zQd8PrzEyyWx
	 RLxru9wRH255l1hXcU0Dyrlg284CQP32W7MDP80UwRYw2SEYAx16g0k7fnXuN2P2j0nbJ
	 N2n4/0U+Wo8TiLPcNubaYmvK0A1UZJlpeCzY23AbHx5wdWrY4KOpiEnPnrjWk2JXUD+LC
	 HQfc9rmXvlcdQzRAbjbeqrMRsjMAHFEVIbWi9NpGgGIv1duAz2qJLMY41L9QysFHIRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500209;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=pGKgNL6rpyJc1hVqQj/WIWmnLSNptvCCqKHNDu22i6c=;
	b=EBUTXlG/4JApDAAhc3Xaqm2+MjJKtFYoZSE1LofwwEZcYl0l2fgTd161Pqw949/5Z8gG
	 H15JLUbEtTuT8h9X/pr4aaGEftE15SeGwqIYWEToql2ijE04XWhHDkRunQ3k7X4744yRd
	 G2zospvTSsuP65Y8b9Uxr154FBU93qcfe40EFXoHboy75s5XWyZL5mdboK/XejMpMjJ4H
	 dRoWgGFFKPi9V9ISyZUoM4ZJqeiOU4L118YbV0glaDmlCsAuarISgkRxwIfOOJ8Glx62L
	 jZyI3k87nNbVfLXWAPJj9Q2LEGe01SrKdvY40zgV6514O1Jwg0D1b04mu/G/W0MtpkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dFx6O4FD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7199A60A2614;
	Tue, 20 Oct 2026 12:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dFx6O4FD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F61D1F000C9;
	Tue, 20 Oct 2026 12:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792500209;
	bh=pGKgNL6rpyJc1hVqQj/WIWmnLSNptvCCqKHNDu22i6c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=dFx6O4FDuLStAnNy5tnsOT2ebTm6IbPO3fV1jacTKKzSoiC+ZsjY8MFLtEoAjebxN
	 iAHm8pMxAUNtd12OsxiQH0aQqBN6qg/Y0lKeQBk+2pG/VtDT+blI6Htho6wlI/Y1LA
	 b6YA9WXuGb/EdmjyoEX4SyYpiOWVnlyao2zFgPTfK/0wfvlcm6FoivDdxRc7Lv8WO7
	 Acr/l9GAk6twWH8AUJmc+kTFoldoOKX8nMJ0XB4SfauecYER+UOiFuSHdZSOGVws5T
	 k15O1iY4/sB/JJiXr8JuNVRYOZD2TFdo+oVVr0GQmXLXVL/Ar7UazlcF3Mi4AgxfLN
	 BxHgxXM7dpWRw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 20 Oct 2026 14:42:11 +0200
Subject: [PATCH 7/7] arm64: dts: qcom: sm8250: Set active-only tags for CPU
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
Message-Id: <20261020-topic-icc_defines_ao-v1-7-cae8d22649ac@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792500178; l=4784;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=iHwl4d6dTS1YW2aWEG3SeuNbONwg6PiG3luY5xgy5aA=;
 b=KNeffiHCsQfuh4HAVHUmqOJm5+ZVFm67k+NXuoPWaRIzGNs90sTDT7i/stQzO6wuZyYvoYRMI
 ymk67F5VS6/BLrq+ksYBXshylencwz7vFSi/L7Mw+3wf5tvlr7Mgvjs
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

RPMH lets some votes only stay active so long as the CPU subsystem is.
Take advantage of that and make the CPU frequency-bound votes behave as
such.

Fixes: 8e0e8016cb79 ("arm64: dts: qcom: sm8250: Add CPU opp tables")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index f975c2183269..6d7e9645e6e8 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,sm8250.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
@@ -107,7 +108,8 @@ cpu0: cpu@0 {
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			operating-points-v2 = <&cpu0_opp_table>;
-			interconnects = <&gem_noc MASTER_AMPSS_M0 0 &mc_virt SLAVE_EBI_CH0 0>,
+			interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&epss_l3 MASTER_OSM_L3_APPS &epss_l3 SLAVE_OSM_L3>;
 			#cooling-cells = <2>;
 			l2_0: l2-cache {
@@ -138,7 +140,8 @@ cpu1: cpu@100 {
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			operating-points-v2 = <&cpu0_opp_table>;
-			interconnects = <&gem_noc MASTER_AMPSS_M0 0 &mc_virt SLAVE_EBI_CH0 0>,
+			interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&epss_l3 MASTER_OSM_L3_APPS &epss_l3 SLAVE_OSM_L3>;
 			#cooling-cells = <2>;
 			l2_100: l2-cache {
@@ -163,7 +166,8 @@ cpu2: cpu@200 {
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			operating-points-v2 = <&cpu0_opp_table>;
-			interconnects = <&gem_noc MASTER_AMPSS_M0 0 &mc_virt SLAVE_EBI_CH0 0>,
+			interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&epss_l3 MASTER_OSM_L3_APPS &epss_l3 SLAVE_OSM_L3>;
 			#cooling-cells = <2>;
 			l2_200: l2-cache {
@@ -188,7 +192,8 @@ cpu3: cpu@300 {
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			operating-points-v2 = <&cpu0_opp_table>;
-			interconnects = <&gem_noc MASTER_AMPSS_M0 0 &mc_virt SLAVE_EBI_CH0 0>,
+			interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&epss_l3 MASTER_OSM_L3_APPS &epss_l3 SLAVE_OSM_L3>;
 			#cooling-cells = <2>;
 			l2_300: l2-cache {
@@ -213,7 +218,8 @@ cpu4: cpu@400 {
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			operating-points-v2 = <&cpu4_opp_table>;
-			interconnects = <&gem_noc MASTER_AMPSS_M0 0 &mc_virt SLAVE_EBI_CH0 0>,
+			interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&epss_l3 MASTER_OSM_L3_APPS &epss_l3 SLAVE_OSM_L3>;
 			#cooling-cells = <2>;
 			l2_400: l2-cache {
@@ -238,7 +244,8 @@ cpu5: cpu@500 {
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			operating-points-v2 = <&cpu4_opp_table>;
-			interconnects = <&gem_noc MASTER_AMPSS_M0 0 &mc_virt SLAVE_EBI_CH0 0>,
+			interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&epss_l3 MASTER_OSM_L3_APPS &epss_l3 SLAVE_OSM_L3>;
 			#cooling-cells = <2>;
 			l2_500: l2-cache {
@@ -263,7 +270,8 @@ cpu6: cpu@600 {
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			operating-points-v2 = <&cpu4_opp_table>;
-			interconnects = <&gem_noc MASTER_AMPSS_M0 0 &mc_virt SLAVE_EBI_CH0 0>,
+			interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&epss_l3 MASTER_OSM_L3_APPS &epss_l3 SLAVE_OSM_L3>;
 			#cooling-cells = <2>;
 			l2_600: l2-cache {
@@ -288,7 +296,8 @@ cpu7: cpu@700 {
 			power-domain-names = "psci";
 			qcom,freq-domain = <&cpufreq_hw 2>;
 			operating-points-v2 = <&cpu7_opp_table>;
-			interconnects = <&gem_noc MASTER_AMPSS_M0 0 &mc_virt SLAVE_EBI_CH0 0>,
+			interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&epss_l3 MASTER_OSM_L3_APPS &epss_l3 SLAVE_OSM_L3>;
 			#cooling-cells = <2>;
 			l2_700: l2-cache {

-- 
2.56.0

