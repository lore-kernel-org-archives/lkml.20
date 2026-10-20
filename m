Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500187;
	b=Bc87smziDMlldiPf5fXJjg7FPOLrwo/ormUolHozZHcmqNLQA6LTGS06VsGvVbf3gQKq
	 5ckKMQXegbE0UayaT87l2vLATrJnJllaLceZXXw2DKqoXSxgui4RthKwXh2DT4LOswGvJ
	 y7kpoyGEsiXqE0uG1t4UptIo9lz2FfrslK7UYKhWWfB1WsznvpuPiYbbPQWX+Pu7uCYIg
	 A1RV5BXdRB0bRe6M5SGhh4hjctBiP22WFEAruV7GMRbfRQH5PVSzmKaMT9sYqxpsrXOCb
	 wsf5/yyWBLubGOGAHE2TMZMbM2TShmUZscDZfNmqK18IlUzOodwokj51i+tw7ROD5sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500187;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=HEG63JYFr/Fj3C4cM9XX9+4Avc3M5MWxi2v4QHcFdKw=;
	b=NXKKsUXamYCc3SjADBU05hn4yH46v58nh7dBmJdSvHkY5o4jRAEsz3zA6ZVBs9rjmEJj
	 uuFOc59R7talP5CQtdq0Ik5lde/9jGo5DAinM0/CjZpVHBSk8nEeOfG+BE2KdXkvrjKvY
	 Kt0ggryV49Ae0qhl0MSoc+9nDlCKXTtCXH3w2NBiEJSmqwzxe/D83ngQqju6fVVX3CdFw
	 HR+QfysQIDunWctz5368XtJBw0+SgO8LSvBc0IYXItVLkpbDhXNc+K7lOrETF1IJqjNVM
	 6EZGp1lQL3Egk5wv+LMdRU+28lLcjMa/OQUD8YORCuBHba7g2EHqI71duAfmiCEEheQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LFQpDMeE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AB5606A324;
	Tue, 20 Oct 2026 12:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LFQpDMeE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 274EC1F000C5;
	Tue, 20 Oct 2026 12:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792500186;
	bh=HEG63JYFr/Fj3C4cM9XX9+4Avc3M5MWxi2v4QHcFdKw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=LFQpDMeEK86Pe0QcHUg0qnUrbL8dD6fjwVOtXdZOMYnWMcdAWolkrEcsRQEI5zGdc
	 YrYDTuqhFQf9uKaNkMy8UH0YG2SaHxQmvYEDOZfzyM2ghBf9uHVVNs5NnBR24hfrdU
	 ixFqE87pISXlD+dtuSfCRnwdJ8IqA/YfFDwSfFE/zVk9+4T3W/rTQSufzSGZPfzCAk
	 dVpVS0Qj6gsMd7Addd63nPy8wyX3H332jJ6VuuMiYQcQOXtpeKEVXA4hTr/q+KHx9H
	 QtkOEGs53pwIs7+6+zV9BujXD7itzfekpCyTnqIRtY/tjcD5AjYIbZd5S6A3++Vnxp
	 bVaP4ZrTk0V4A==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 20 Oct 2026 14:42:05 +0200
Subject: [PATCH 1/7] arm64: dts: qcom: kodiak: Use ICC tag defines
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
Message-Id: <20261020-topic-icc_defines_ao-v1-1-cae8d22649ac@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792500178; l=4494;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=p9fBIkCQogzm8WkyToHn9qbjATuzmStZrn5OeMXxcgs=;
 b=qCM5ZlExsNhw58hpVjCSrkUi8vjWsHdMZNT6Wl0FBRPmL0NxQmbGkqd/bBhxCsPtOvTk06AOB
 4EfeI1p8GyDCxWYDv+RKjzsaEmeBl8LQ5AXDo1jBCFc2D6lbk9XOlWJ
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The magic values come from dt-bindings. Use the existing defines to
demistify them.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 8c7523602d27..9cbaf8219355 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -216,7 +216,8 @@ cpu0: cpu@0 {
 			operating-points-v2 = <&cpu0_opp_table>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
-			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&epss_l3 MASTER_EPSS_L3_APPS &epss_l3 SLAVE_EPSS_L3_SHARED>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
@@ -245,7 +246,8 @@ cpu1: cpu@100 {
 			operating-points-v2 = <&cpu0_opp_table>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
-			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&epss_l3 MASTER_EPSS_L3_APPS &epss_l3 SLAVE_EPSS_L3_SHARED>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
@@ -269,7 +271,8 @@ cpu2: cpu@200 {
 			operating-points-v2 = <&cpu0_opp_table>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
-			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&epss_l3 MASTER_EPSS_L3_APPS &epss_l3 SLAVE_EPSS_L3_SHARED>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
@@ -293,7 +296,8 @@ cpu3: cpu@300 {
 			operating-points-v2 = <&cpu0_opp_table>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
-			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&epss_l3 MASTER_EPSS_L3_APPS &epss_l3 SLAVE_EPSS_L3_SHARED>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
@@ -317,7 +321,8 @@ cpu4: cpu@400 {
 			operating-points-v2 = <&cpu4_opp_table>;
 			capacity-dmips-mhz = <1946>;
 			dynamic-power-coefficient = <520>;
-			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&epss_l3 MASTER_EPSS_L3_APPS &epss_l3 SLAVE_EPSS_L3_SHARED>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			#cooling-cells = <2>;
@@ -341,7 +346,8 @@ cpu5: cpu@500 {
 			operating-points-v2 = <&cpu4_opp_table>;
 			capacity-dmips-mhz = <1946>;
 			dynamic-power-coefficient = <520>;
-			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&epss_l3 MASTER_EPSS_L3_APPS &epss_l3 SLAVE_EPSS_L3_SHARED>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			#cooling-cells = <2>;
@@ -365,7 +371,8 @@ cpu6: cpu@600 {
 			operating-points-v2 = <&cpu4_opp_table>;
 			capacity-dmips-mhz = <1946>;
 			dynamic-power-coefficient = <520>;
-			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&epss_l3 MASTER_EPSS_L3_APPS &epss_l3 SLAVE_EPSS_L3_SHARED>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			#cooling-cells = <2>;
@@ -389,7 +396,8 @@ cpu7: cpu@700 {
 			operating-points-v2 = <&cpu7_opp_table>;
 			capacity-dmips-mhz = <1985>;
 			dynamic-power-coefficient = <552>;
-			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&epss_l3 MASTER_EPSS_L3_APPS &epss_l3 SLAVE_EPSS_L3_SHARED>;
 			qcom,freq-domain = <&cpufreq_hw 2>;
 			#cooling-cells = <2>;

-- 
2.56.0

