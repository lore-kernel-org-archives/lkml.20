Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1027080D;
	Mon, 12 Oct 2026 02:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791770583; cv=none; b=E4ctyu1o6DbfttlOajeDqZwraTubIqT+ZNFS3GkflSXfpCIWg8FOnrPT44g1gyRpjV+oeGmZxM/U22pihMt6ehKtuJFHr2r4GLZIsUFVHgOEfpUi5W9UJZ2K6rkHVMp4h2nzn8xYuK2pluVXC6TIJ7CHEgiRld2oY74C/gg8iUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791770583; c=relaxed/simple;
	bh=0CfgHkpkcZFTTbSMQfHQU+VgfEKBuYRsB/pKJDVr1Rw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YRBq7RQnLNkzCaEPDwObsS0dvgOsUWXDvflIWcRzhm9JFIstNoMv5CjopaQM+DuN7mLS5HhUUIV/mQcT5QA4dR5+PGusthv11FFiGvJEg4G76sBQd/jqUFAEnxPGMTkKErJPW/m3LHeS8Dpgv/JEJruBw7ruf5EvswnwqLnbxag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JGJClLNh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JGJClLNh"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BAAF7C2BCFB;
	Mon, 12 Oct 2026 02:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791770582;
	bh=0CfgHkpkcZFTTbSMQfHQU+VgfEKBuYRsB/pKJDVr1Rw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JGJClLNhNM4HasSkSB3uJSXAt72fHvIKyF1FvMA6+HGxVC39xW+K+Bw9LWP9qkeQ6
	 2xkt1FcRcV+otrzb/GAdIAH6Z+KCogb3wWE6oduu15S0uGDvCmb2JDwkjoGaY0Rr0t
	 ZvgrXER4L/CYZ7moj7vdEltQ5kP19c3rnslRPq/EECRNGAH5/B//Y7qEfQETSwfl28
	 v9qKEGQJyEgfebbQPd0Mc3W1eA2NZFeruP7GUKDsP938r7x/Qabfaap7TFxqUaXFcn
	 vwQvtG2L7fAOkmIkfQ/MkbfImRGaS6aU/hy9faXbtz3hc6rtkGx2uBR2zUKDiFoXst
	 S9bHcz3vHNr8g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AC40CA9EBD;
	Mon, 12 Oct 2026 02:03:02 +0000 (UTC)
From: fromdisposition via B4 Relay <devnull+me.fromdisposition.org@kernel.org>
Date: Mon, 12 Oct 2026 02:02:43 +0000
Subject: [PATCH 1/2] arm64: dts: qcom: sm8350: Add CPU capacities
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-sm8350-cpu-capacity-v1-1-3d141e0099d5@fromdisposition.org>
References: <20261012-sm8350-cpu-capacity-v1-0-3d141e0099d5@fromdisposition.org>
In-Reply-To: <20261012-sm8350-cpu-capacity-v1-0-3d141e0099d5@fromdisposition.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, fromdisposition <me@fromdisposition.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791770585; l=2957;
 i=me@fromdisposition.org; s=20261012; h=from:subject:message-id;
 bh=yKijj+yB0/7XHdIUXiGef82v7eavz8crXac+Won0idc=;
 b=nbltg2HslGKHNvX+FksT8vnL/FngvvEQgsfWCmjwiHk2jCCKDJZ8yqT5EoUiEcm3DLEFA3YKw
 6Rwb3x+yroWAD3Z/fOQXrz86U3MCXcqDlKAJXzQgeVpGrOYNly6dRqC
X-Developer-Key: i=me@fromdisposition.org; a=ed25519;
 pk=S0QFlGq1BQEaAtPPdAH8YKEOXMeRuSkTgctXuvtU+1Y=
X-Endpoint-Received: by B4 Relay for me@fromdisposition.org/20261012 with
 auth_id=1163
X-Original-From: fromdisposition <me@fromdisposition.org>
Reply-To: me@fromdisposition.org

From: fromdisposition <me@fromdisposition.org>

Without capacity-dmips-mhz every CPU reports a capacity of 1024, so the
scheduler treats the Cortex-A55, Cortex-A78 and Cortex-X1 cores as
equal and sets up no asymmetric CPU capacity.

Take the values from Qualcomm's downstream device tree for SM8350
(lahaina.dtsi in msm-5.4): 1024, 1946 and 2048, halved so that the X1 is
1024. Only their ratios matter, as the kernel normalizes them. The
downstream overlay for v2 silicon (lahaina-v2.dtsi) keeps them.

Assisted-by: LLM
Signed-off-by: fromdisposition <me@fromdisposition.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 55b32050c..df6e9d1fa 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -60,6 +60,7 @@ cpu0: cpu@0 {
 			reg = <0x0 0x0>;
 			clocks = <&cpufreq_hw 0>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <512>;
 			next-level-cache = <&l2_0>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			power-domains = <&cpu_pd0>;
@@ -84,6 +85,7 @@ cpu1: cpu@100 {
 			reg = <0x0 0x100>;
 			clocks = <&cpufreq_hw 0>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <512>;
 			next-level-cache = <&l2_100>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			power-domains = <&cpu_pd1>;
@@ -103,6 +105,7 @@ cpu2: cpu@200 {
 			reg = <0x0 0x200>;
 			clocks = <&cpufreq_hw 0>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <512>;
 			next-level-cache = <&l2_200>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			power-domains = <&cpu_pd2>;
@@ -122,6 +125,7 @@ cpu3: cpu@300 {
 			reg = <0x0 0x300>;
 			clocks = <&cpufreq_hw 0>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <512>;
 			next-level-cache = <&l2_300>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			power-domains = <&cpu_pd3>;
@@ -141,6 +145,7 @@ cpu4: cpu@400 {
 			reg = <0x0 0x400>;
 			clocks = <&cpufreq_hw 1>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <973>;
 			next-level-cache = <&l2_400>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			power-domains = <&cpu_pd4>;
@@ -160,6 +165,7 @@ cpu5: cpu@500 {
 			reg = <0x0 0x500>;
 			clocks = <&cpufreq_hw 1>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <973>;
 			next-level-cache = <&l2_500>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			power-domains = <&cpu_pd5>;
@@ -179,6 +185,7 @@ cpu6: cpu@600 {
 			reg = <0x0 0x600>;
 			clocks = <&cpufreq_hw 1>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <973>;
 			next-level-cache = <&l2_600>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			power-domains = <&cpu_pd6>;
@@ -198,6 +205,7 @@ cpu7: cpu@700 {
 			reg = <0x0 0x700>;
 			clocks = <&cpufreq_hw 2>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&l2_700>;
 			qcom,freq-domain = <&cpufreq_hw 2>;
 			power-domains = <&cpu_pd7>;

-- 
2.53.0


