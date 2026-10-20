Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500199;
	b=sOcbJm9azaeTL9zJSTDiJrsKV6N/9Dym6qbARqzTtWEuBJp7PPIwUJQ56ahAqvaMV1+s
	 p8//71z5gPuLYkbvZ6muGzLBXcBAuZv780AI1HQUYTvlUuGlGuP/xcPEYdZhDjNoMILWV
	 LirUowT7WwL9JUDCecMwzh5JP/sKZGz/93LbFqRCAlZ1HdUqCXM0lpFqXIfr/tlgkxgI/
	 rI0jxfVnkEwVVwrNpQhGn7ALrG5TUVtT7tV3wOna9/NMOelzYOumWfcq1nA1QPmBm4hl+
	 Z3YWkY9muZ223sym/7Ipj0yxdotJ5hRfRe1q00D863QNwqlP1VA6Zq3xEVXfcebTPWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500199;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=6NLaPsCD502GLjmrNRijAZPttbkXCqtqYy/ug9gr+/0=;
	b=VYHMMtI2FXMttUVEboUl8wONm9vvRohEMg2rSH0g+EZRBuNBzhaaHL1eHK4NgOaP+tAD
	 J4BThNiv4o9fRLCWGBsTGvaG3UvD8ihPsV6sy3tCAVdigQuICJGr9Zx0ywGdu1L4JewT/
	 2pq4PN79H/xr9s0aiIo2eJEYP4G+hl9nrovu/OtPD0SszNdQaN7vDDp62tLt1dXsjRCY+
	 N6ARNYReJ8OB0b6Tq5GzvBBIsprif+PiHVzv3rxp8TKTyKb0S6pmC5spIE9/HBBbbb7+b
	 boKLq55TqoC/oL6hRcbxoOAbaUFsmk0X9X9V8aj70Ho9BDhioLpRGO9HFL4etyyt/FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TdxX6Jjh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F134A60A260F;
	Tue, 20 Oct 2026 12:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TdxX6Jjh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AA781F000C7;
	Tue, 20 Oct 2026 12:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792500198;
	bh=6NLaPsCD502GLjmrNRijAZPttbkXCqtqYy/ug9gr+/0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TdxX6JjhM+vAIkSO9JHRAm23eojX2+puLtAchA6gy3vD1LfTp/u59So8RtOu7hhlK
	 Zs0Uo5dV/Ubl1luwQXSjUoj1B2YPWnEzS4WlqOqGfrmhTbefySYWNHplXqzqBn+RAi
	 i4zhBaM6nsG3BJ9K+BTxU/916h5aT7V1Vf6XGr7uNFGWjRYEqmxMJhnyETLrUZaaH/
	 JxVgLCyybP3kX/yM6V9B3WVmFn37JXkaVy75AK6eA4s6GjypaU0KCuQBZFNjzG1SjN
	 as/mAL6FegB6yf7w/zIgnWn7EvjGnuRcolruC3wp4Iz3QKlevYaxHeheMA3jsPcvoC
	 1A8uYKN6UadYQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 20 Oct 2026 14:42:08 +0200
Subject: [PATCH 4/7] arm64: dts: qcom: sdm670: Use ICC tag defines
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
Message-Id: <20261020-topic-icc_defines_ao-v1-4-cae8d22649ac@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792500178; l=4916;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=+NbtuUZaB7kBQ0fOUihcF56TxzciS4SX52kAVE6/K28=;
 b=xMpa2jo8qtg4mgKiUS0tNUpcJQteg8nQGDc/H5e7nnrpTHBx3M5vpV1CFIm2viPJdReybr4OE
 F5bQI0FEKG5AFd5JP/6Ic1aST9sSieCAUlMhLpejnAoV3E66NcV4cVT
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The magic values come from dt-bindings. Use the existing defines to
demistify them.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 711e15b56cb8..084d22479ca9 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -14,6 +14,7 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,sdm670-rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -58,7 +59,8 @@ cpu0: cpu@0 {
 			dynamic-power-coefficient = <203>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			operating-points-v2 = <&cpu0_opp_table>;
-			interconnects = <&gladiator_noc MASTER_AMPSS_M0 3 &mem_noc SLAVE_EBI_CH0 3>,
+			interconnects = <&gladiator_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mem_noc SLAVE_EBI_CH0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			power-domains = <&cpu_pd0>;
 			power-domain-names = "psci";
@@ -85,7 +87,8 @@ cpu1: cpu@100 {
 			dynamic-power-coefficient = <203>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			operating-points-v2 = <&cpu0_opp_table>;
-			interconnects = <&gladiator_noc MASTER_AMPSS_M0 3 &mem_noc SLAVE_EBI_CH0 3>,
+			interconnects = <&gladiator_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mem_noc SLAVE_EBI_CH0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			power-domains = <&cpu_pd1>;
 			power-domain-names = "psci";
@@ -107,7 +110,8 @@ cpu2: cpu@200 {
 			dynamic-power-coefficient = <203>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			operating-points-v2 = <&cpu0_opp_table>;
-			interconnects = <&gladiator_noc MASTER_AMPSS_M0 3 &mem_noc SLAVE_EBI_CH0 3>,
+			interconnects = <&gladiator_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mem_noc SLAVE_EBI_CH0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			power-domains = <&cpu_pd2>;
 			power-domain-names = "psci";
@@ -129,7 +133,8 @@ cpu3: cpu@300 {
 			dynamic-power-coefficient = <203>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			operating-points-v2 = <&cpu0_opp_table>;
-			interconnects = <&gladiator_noc MASTER_AMPSS_M0 3 &mem_noc SLAVE_EBI_CH0 3>,
+			interconnects = <&gladiator_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mem_noc SLAVE_EBI_CH0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			power-domains = <&cpu_pd3>;
 			power-domain-names = "psci";
@@ -151,7 +156,8 @@ cpu4: cpu@400 {
 			dynamic-power-coefficient = <203>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			operating-points-v2 = <&cpu0_opp_table>;
-			interconnects = <&gladiator_noc MASTER_AMPSS_M0 3 &mem_noc SLAVE_EBI_CH0 3>,
+			interconnects = <&gladiator_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mem_noc SLAVE_EBI_CH0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			power-domains = <&cpu_pd4>;
 			power-domain-names = "psci";
@@ -173,7 +179,8 @@ cpu5: cpu@500 {
 			dynamic-power-coefficient = <203>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			operating-points-v2 = <&cpu0_opp_table>;
-			interconnects = <&gladiator_noc MASTER_AMPSS_M0 3 &mem_noc SLAVE_EBI_CH0 3>,
+			interconnects = <&gladiator_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mem_noc SLAVE_EBI_CH0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			power-domains = <&cpu_pd5>;
 			power-domain-names = "psci";
@@ -195,7 +202,8 @@ cpu6: cpu@600 {
 			dynamic-power-coefficient = <393>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			operating-points-v2 = <&cpu6_opp_table>;
-			interconnects = <&gladiator_noc MASTER_AMPSS_M0 3 &mem_noc SLAVE_EBI_CH0 3>,
+			interconnects = <&gladiator_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mem_noc SLAVE_EBI_CH0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			power-domains = <&cpu_pd6>;
 			power-domain-names = "psci";
@@ -217,7 +225,8 @@ cpu7: cpu@700 {
 			dynamic-power-coefficient = <393>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			operating-points-v2 = <&cpu6_opp_table>;
-			interconnects = <&gladiator_noc MASTER_AMPSS_M0 3 &mem_noc SLAVE_EBI_CH0 3>,
+			interconnects = <&gladiator_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mem_noc SLAVE_EBI_CH0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 			power-domains = <&cpu_pd7>;
 			power-domain-names = "psci";

-- 
2.56.0

