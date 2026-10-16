Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD15637DE9B;
	Fri, 16 Oct 2026 06:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792130478; cv=none; b=dSjnH+y+msL8Hn2uI1eGkU+P+9r6dzcRhBAxVga0vgxlF/oPyTRF3uOsh53w1mKNOpNTu+IKAEVoirvhheRLC0jN2lr9OVDB+hR3hg/AQBvNLUyvkd9zSkJnZf7HiyvDGYkDm7rEf+Wc8Jj7hBt+eTGWM+q1RhC4LNVe11qgucg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792130478; c=relaxed/simple;
	bh=+ENbR2risJNFZC/JmklEoG6wyW9i45reZfKNYm0550c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dn8lub/LKkwixmnjVmvkVuFPMf4s3hj+maypcr2MX6YBxVV4pNqSRgyfDXxsQji2jxrvBZ5GsNPEulLsWHqu4nbVBGoRsBqiHDygkeH9E9iuI6/23YLdbQyBDgi8MsQTyuuOL0JBOJlysAOBVdHfu+Vb0lG56IC6dtnGG2HeJtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CNzSvGss; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CNzSvGss"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 960FCC2BD00;
	Fri, 16 Oct 2026 06:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792130478;
	bh=+ENbR2risJNFZC/JmklEoG6wyW9i45reZfKNYm0550c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CNzSvGssb8aRrWT0ugXLBqod0A27r3a6l05OhFRkQVh3AMDpFjt8b/utCa4XrAW1Y
	 LgOR7fzP4Ma1gqmJUByOB5TKbzWAUwANBFf0V8dbjk0LOxYYNX3wN9nNDeZB0EC4UT
	 HZaJsaiZ5pN95w+wFmbJbpzYUGS1Rwx6KS024GYCITILHqRupr63d1qK/11OPOwl/S
	 0143j6H3rACrHfcGMpdTYn1V3J18N+GJX6JFqhBl0VVB+412+Lsq1TFtLrJX2SRrq4
	 feXs/vqy0uN36T1BYOHMqM0UAJCjrSxRUkowK2QF+Sh+o4t/ZEJfCcJyFF/TassIV2
	 +VMcaMvxu0zbQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D388CCA46D;
	Fri, 16 Oct 2026 06:01:18 +0000 (UTC)
From: Demeter Barna via B4 Relay <devnull+me.fromdisposition.org@kernel.org>
Date: Fri, 16 Oct 2026 06:01:16 +0000
Subject: [PATCH 2/2] arm64: dts: qcom: sm8350: Add CPU OPP tables with
 memory bandwidth
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-sm8350-cpu-bw-v1-2-044ac6dc9565@fromdisposition.org>
References: <20261016-sm8350-cpu-bw-v1-0-044ac6dc9565@fromdisposition.org>
In-Reply-To: <20261016-sm8350-cpu-bw-v1-0-044ac6dc9565@fromdisposition.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Demeter Barna <me@fromdisposition.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792130480; l=13046;
 i=me@fromdisposition.org; s=20261012; h=from:subject:message-id;
 bh=/adEGRnVjbnBkbE+ua7tuLcsVoNlkLjUrrtbWkPtG3Y=;
 b=s9ULoNWFTkQZYHQJDZqb0Wk2EQsakEMC5o1uQi7mHQPin5tYDdsknq12yilI5W0e4z63K0Zzf
 4cJG9vWKQwXC+y1S5xnhDvgiGkUsI9nk+Uqq5sDrx1K+K8ONUncqfOf
X-Developer-Key: i=me@fromdisposition.org; a=ed25519;
 pk=S0QFlGq1BQEaAtPPdAH8YKEOXMeRuSkTgctXuvtU+1Y=
X-Endpoint-Received: by B4 Relay for me@fromdisposition.org/20261012 with
 auth_id=1163
X-Original-From: Demeter Barna <me@fromdisposition.org>
Reply-To: me@fromdisposition.org

From: Demeter Barna <me@fromdisposition.org>

Without them nothing votes for the CPUs' memory paths and DDR stays at
what other clients request. Vote for CPU-to-LLCC, LLCC-to-DDR and L3
with the CPU frequency, as on SM8550 and SM8650.

The frequencies are the cpufreq-hw LUT; the LLCC, DDR (LPDDR5) and L3
levels follow the downstream memory latency tables.

Assisted-by: LLM
Signed-off-by: Demeter Barna <me@fromdisposition.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 336 +++++++++++++++++++++++++++++++++++
 1 file changed, 336 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 52e8c2963..4e33a1e10 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -65,6 +65,13 @@ cpu0: cpu@0 {
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			power-domains = <&cpu_pd0>;
 			power-domain-names = "psci";
+			operating-points-v2 = <&cpu0_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
 			#cooling-cells = <2>;
 			l2_0: l2-cache {
 				compatible = "cache";
@@ -89,6 +96,13 @@ cpu1: cpu@100 {
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			power-domains = <&cpu_pd1>;
 			power-domain-names = "psci";
+			operating-points-v2 = <&cpu0_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
 			#cooling-cells = <2>;
 			l2_100: l2-cache {
 				compatible = "cache";
@@ -108,6 +122,13 @@ cpu2: cpu@200 {
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			power-domains = <&cpu_pd2>;
 			power-domain-names = "psci";
+			operating-points-v2 = <&cpu0_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
 			#cooling-cells = <2>;
 			l2_200: l2-cache {
 				compatible = "cache";
@@ -127,6 +148,13 @@ cpu3: cpu@300 {
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			power-domains = <&cpu_pd3>;
 			power-domain-names = "psci";
+			operating-points-v2 = <&cpu0_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
 			#cooling-cells = <2>;
 			l2_300: l2-cache {
 				compatible = "cache";
@@ -146,6 +174,13 @@ cpu4: cpu@400 {
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			power-domains = <&cpu_pd4>;
 			power-domain-names = "psci";
+			operating-points-v2 = <&cpu4_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
 			#cooling-cells = <2>;
 			l2_400: l2-cache {
 				compatible = "cache";
@@ -165,6 +200,13 @@ cpu5: cpu@500 {
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			power-domains = <&cpu_pd5>;
 			power-domain-names = "psci";
+			operating-points-v2 = <&cpu4_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
 			#cooling-cells = <2>;
 			l2_500: l2-cache {
 				compatible = "cache";
@@ -184,6 +226,13 @@ cpu6: cpu@600 {
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			power-domains = <&cpu_pd6>;
 			power-domain-names = "psci";
+			operating-points-v2 = <&cpu4_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
 			#cooling-cells = <2>;
 			l2_600: l2-cache {
 				compatible = "cache";
@@ -203,6 +252,13 @@ cpu7: cpu@700 {
 			qcom,freq-domain = <&cpufreq_hw 2>;
 			power-domains = <&cpu_pd7>;
 			power-domain-names = "psci";
+			operating-points-v2 = <&cpu7_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
 			#cooling-cells = <2>;
 			l2_700: l2-cache {
 				compatible = "cache";
@@ -379,6 +435,286 @@ cluster_pd: power-domain-cpu-cluster0 {
 		};
 	};
 
+	cpu0_opp_table: opp-table-cpu0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-peak-kBps = <(150000 * 16) (200000 * 4) (300000 * 32)>;
+		};
+
+		opp-403200000 {
+			opp-hz = /bits/ 64 <403200000>;
+			opp-peak-kBps = <(300000 * 16) (451000 * 4) (403200 * 32)>;
+		};
+
+		opp-499200000 {
+			opp-hz = /bits/ 64 <499200000>;
+			opp-peak-kBps = <(300000 * 16) (451000 * 4) (499200 * 32)>;
+		};
+
+		opp-595200000 {
+			opp-hz = /bits/ 64 <595200000>;
+			opp-peak-kBps = <(300000 * 16) (451000 * 4) (614400 * 32)>;
+		};
+
+		opp-691200000 {
+			opp-hz = /bits/ 64 <691200000>;
+			opp-peak-kBps = <(300000 * 16) (451000 * 4) (614400 * 32)>;
+		};
+
+		opp-806400000 {
+			opp-hz = /bits/ 64 <806400000>;
+			opp-peak-kBps = <(300000 * 16) (451000 * 4) (710400 * 32)>;
+		};
+
+		opp-902400000 {
+			opp-hz = /bits/ 64 <902400000>;
+			opp-peak-kBps = <(466000 * 16) (547000 * 4) (883200 * 32)>;
+		};
+
+		opp-998400000 {
+			opp-hz = /bits/ 64 <998400000>;
+			opp-peak-kBps = <(466000 * 16) (547000 * 4) (979200 * 32)>;
+		};
+
+		opp-1094400000 {
+			opp-hz = /bits/ 64 <1094400000>;
+			opp-peak-kBps = <(466000 * 16) (547000 * 4) (979200 * 32)>;
+		};
+
+		opp-1209600000 {
+			opp-hz = /bits/ 64 <1209600000>;
+			opp-peak-kBps = <(466000 * 16) (547000 * 4) (1056000 * 32)>;
+		};
+
+		opp-1305600000 {
+			opp-hz = /bits/ 64 <1305600000>;
+			opp-peak-kBps = <(466000 * 16) (768000 * 4) (1152000 * 32)>;
+		};
+
+		opp-1401600000 {
+			opp-hz = /bits/ 64 <1401600000>;
+			opp-peak-kBps = <(466000 * 16) (768000 * 4) (1248000 * 32)>;
+		};
+
+		opp-1497600000 {
+			opp-hz = /bits/ 64 <1497600000>;
+			opp-peak-kBps = <(466000 * 16) (768000 * 4) (1324800 * 32)>;
+		};
+
+		opp-1612800000 {
+			opp-hz = /bits/ 64 <1612800000>;
+			opp-peak-kBps = <(600000 * 16) (1555000 * 4) (1420800 * 32)>;
+		};
+
+		opp-1708800000 {
+			opp-hz = /bits/ 64 <1708800000>;
+			opp-peak-kBps = <(600000 * 16) (1555000 * 4) (1516800 * 32)>;
+		};
+
+		opp-1804800000 {
+			opp-hz = /bits/ 64 <1804800000>;
+			opp-peak-kBps = <(600000 * 16) (1555000 * 4) (1593600 * 32)>;
+		};
+	};
+
+	cpu4_opp_table: opp-table-cpu4 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-710400000 {
+			opp-hz = /bits/ 64 <710400000>;
+			opp-peak-kBps = <(300000 * 16) (451000 * 4) (499200 * 32)>;
+		};
+
+		opp-844800000 {
+			opp-hz = /bits/ 64 <844800000>;
+			opp-peak-kBps = <(466000 * 16) (547000 * 4) (614400 * 32)>;
+		};
+
+		opp-960000000 {
+			opp-hz = /bits/ 64 <960000000>;
+			opp-peak-kBps = <(466000 * 16) (768000 * 4) (614400 * 32)>;
+		};
+
+		opp-1075200000 {
+			opp-hz = /bits/ 64 <1075200000>;
+			opp-peak-kBps = <(466000 * 16) (768000 * 4) (883200 * 32)>;
+		};
+
+		opp-1209600000 {
+			opp-hz = /bits/ 64 <1209600000>;
+			opp-peak-kBps = <(600000 * 16) (1555000 * 4) (883200 * 32)>;
+		};
+
+		opp-1324800000 {
+			opp-hz = /bits/ 64 <1324800000>;
+			opp-peak-kBps = <(600000 * 16) (1555000 * 4) (1056000 * 32)>;
+		};
+
+		opp-1440000000 {
+			opp-hz = /bits/ 64 <1440000000>;
+			opp-peak-kBps = <(806000 * 16) (1555000 * 4) (1056000 * 32)>;
+		};
+
+		opp-1555200000 {
+			opp-hz = /bits/ 64 <1555200000>;
+			opp-peak-kBps = <(806000 * 16) (1555000 * 4) (1248000 * 32)>;
+		};
+
+		opp-1670400000 {
+			opp-hz = /bits/ 64 <1670400000>;
+			opp-peak-kBps = <(806000 * 16) (1555000 * 4) (1248000 * 32)>;
+		};
+
+		opp-1766400000 {
+			opp-hz = /bits/ 64 <1766400000>;
+			opp-peak-kBps = <(806000 * 16) (1555000 * 4) (1248000 * 32)>;
+		};
+
+		opp-1881600000 {
+			opp-hz = /bits/ 64 <1881600000>;
+			opp-peak-kBps = <(806000 * 16) (1555000 * 4) (1324800 * 32)>;
+		};
+
+		opp-1996800000 {
+			opp-hz = /bits/ 64 <1996800000>;
+			opp-peak-kBps = <(933000 * 16) (2092000 * 4) (1324800 * 32)>;
+		};
+
+		opp-2112000000 {
+			opp-hz = /bits/ 64 <2112000000>;
+			opp-peak-kBps = <(933000 * 16) (2092000 * 4) (1324800 * 32)>;
+		};
+
+		opp-2227200000 {
+			opp-hz = /bits/ 64 <2227200000>;
+			opp-peak-kBps = <(933000 * 16) (2092000 * 4) (1516800 * 32)>;
+		};
+
+		opp-2342400000 {
+			opp-hz = /bits/ 64 <2342400000>;
+			opp-peak-kBps = <(933000 * 16) (2092000 * 4) (1516800 * 32)>;
+		};
+
+		opp-2419200000 {
+			opp-hz = /bits/ 64 <2419200000>;
+			opp-peak-kBps = <(933000 * 16) (2092000 * 4) (1516800 * 32)>;
+		};
+	};
+
+	cpu7_opp_table: opp-table-cpu7 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-844800000 {
+			opp-hz = /bits/ 64 <844800000>;
+			opp-peak-kBps = <(466000 * 16) (547000 * 4) (614400 * 32)>;
+		};
+
+		opp-960000000 {
+			opp-hz = /bits/ 64 <960000000>;
+			opp-peak-kBps = <(466000 * 16) (768000 * 4) (614400 * 32)>;
+		};
+
+		opp-1075200000 {
+			opp-hz = /bits/ 64 <1075200000>;
+			opp-peak-kBps = <(466000 * 16) (768000 * 4) (883200 * 32)>;
+		};
+
+		opp-1190400000 {
+			opp-hz = /bits/ 64 <1190400000>;
+			opp-peak-kBps = <(600000 * 16) (1555000 * 4) (883200 * 32)>;
+		};
+
+		opp-1305600000 {
+			opp-hz = /bits/ 64 <1305600000>;
+			opp-peak-kBps = <(600000 * 16) (1555000 * 4) (1056000 * 32)>;
+		};
+
+		opp-1420800000 {
+			opp-hz = /bits/ 64 <1420800000>;
+			opp-peak-kBps = <(806000 * 16) (1555000 * 4) (1056000 * 32)>;
+		};
+
+		opp-1555200000 {
+			opp-hz = /bits/ 64 <1555200000>;
+			opp-peak-kBps = <(806000 * 16) (1555000 * 4) (1248000 * 32)>;
+		};
+
+		opp-1670400000 {
+			opp-hz = /bits/ 64 <1670400000>;
+			opp-peak-kBps = <(806000 * 16) (1555000 * 4) (1248000 * 32)>;
+		};
+
+		opp-1785600000 {
+			opp-hz = /bits/ 64 <1785600000>;
+			opp-peak-kBps = <(806000 * 16) (1555000 * 4) (1324800 * 32)>;
+		};
+
+		opp-1900800000 {
+			opp-hz = /bits/ 64 <1900800000>;
+			opp-peak-kBps = <(933000 * 16) (2092000 * 4) (1324800 * 32)>;
+		};
+
+		opp-2035200000 {
+			opp-hz = /bits/ 64 <2035200000>;
+			opp-peak-kBps = <(933000 * 16) (2092000 * 4) (1324800 * 32)>;
+		};
+
+		opp-2150400000 {
+			opp-hz = /bits/ 64 <2150400000>;
+			opp-peak-kBps = <(933000 * 16) (2092000 * 4) (1516800 * 32)>;
+		};
+
+		opp-2265600000 {
+			opp-hz = /bits/ 64 <2265600000>;
+			opp-peak-kBps = <(933000 * 16) (2092000 * 4) (1516800 * 32)>;
+		};
+
+		opp-2380800000 {
+			opp-hz = /bits/ 64 <2380800000>;
+			opp-peak-kBps = <(933000 * 16) (2092000 * 4) (1516800 * 32)>;
+		};
+
+		opp-2496000000 {
+			opp-hz = /bits/ 64 <2496000000>;
+			opp-peak-kBps = <(933000 * 16) (2092000 * 4) (1593600 * 32)>;
+		};
+
+		opp-2592000000 {
+			opp-hz = /bits/ 64 <2592000000>;
+			opp-peak-kBps = <(933000 * 16) (2092000 * 4) (1593600 * 32)>;
+		};
+
+		opp-2688000000 {
+			opp-hz = /bits/ 64 <2688000000>;
+			opp-peak-kBps = <(1000000 * 16) (3196000 * 4) (1593600 * 32)>;
+		};
+
+		opp-2764800000 {
+			opp-hz = /bits/ 64 <2764800000>;
+			opp-peak-kBps = <(1000000 * 16) (3196000 * 4) (1593600 * 32)>;
+		};
+
+		opp-2841600000 {
+			opp-hz = /bits/ 64 <2841600000>;
+			opp-peak-kBps = <(1000000 * 16) (3196000 * 4) (1593600 * 32)>;
+		};
+
+		opp-2918400000 {
+			opp-hz = /bits/ 64 <2918400000>;
+			opp-peak-kBps = <(1000000 * 16) (3196000 * 4) (1593600 * 32)>;
+		};
+
+		opp-2995200000 {
+			opp-hz = /bits/ 64 <2995200000>;
+			opp-peak-kBps = <(1000000 * 16) (3196000 * 4) (1593600 * 32)>;
+		};
+	};
+
 	qup_opp_table_100mhz: opp-table-qup100mhz {
 		compatible = "operating-points-v2";
 

-- 
2.53.0


