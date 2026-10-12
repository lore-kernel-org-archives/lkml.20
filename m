Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2082F5324;
	Mon, 12 Oct 2026 02:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791770583; cv=none; b=tnx48yfyYZLepjD84zj8dtdPPeM5/m3SjFCcGxVhlj1NbBLfwub6H3tnsSGKRLNUzmk9pFb+FTtuGJ8K0aYUkU5wgHDblSzxIHw/5QUkh68FkFn50sL7JiPHiU5NDdZq4FMwAmsu5mJjYBkl+O5wv3ly+e1bGA2E3a0Ugmr8BdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791770583; c=relaxed/simple;
	bh=j7G+Yjj/NtWByECic8e61S0QvcYNk0zX7apU8jeT5KQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lg6Iuw0tKqQjGxcgNgHi986MLoyuSnZGYNiXkERivyfC1Gxm26xuFCtWMQFF0jthzuHRJtBZQ6anw4HHqwcOghXXg4YcVREcpxrzClR+Y5K1w0NPWoLqdTFAcmVecGfuvwKko4Qg8iHhsL+z+1qPMMGZc7lv7rEob8iju4/ni9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gaXHEep9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gaXHEep9"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CD969C2BCFF;
	Mon, 12 Oct 2026 02:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791770582;
	bh=j7G+Yjj/NtWByECic8e61S0QvcYNk0zX7apU8jeT5KQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gaXHEep9QQTH/mAnHq5NB1pcd2WKTaruoJ3ypA3/YtPSXm2KjV4aQyOvShISk5Mv0
	 FPN3xKBZVGnXDHzpS1HNyzEcyP5q6sZdqdwROYdzizE0TDAuF2reNCsTxArw3E5pKR
	 X9VmWaQbf5AnbD/Aw06jwu0GtVw1p8yvO7bqcZsm1FM7SuBVeBCexxxMF2hhcDtm47
	 aQn9URk0KRxTfkYC44OSfhALR42eyHsSRvvHbipLkl9vBGafyj7MPx6SQCM71pYh7c
	 Z5C0PCSnmE6cCTEn9JpueehDv4SYEMSlRclCZlIRksg8jJLvBFc2dwJ706LlFq63u1
	 DDEbPEeqy5ScQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADA8ACA9ECF;
	Mon, 12 Oct 2026 02:03:02 +0000 (UTC)
From: fromdisposition via B4 Relay <devnull+me.fromdisposition.org@kernel.org>
Date: Mon, 12 Oct 2026 02:02:44 +0000
Subject: [PATCH 2/2] arm64: dts: qcom: sm8350: Add CPU dynamic power
 coefficients
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-sm8350-cpu-capacity-v1-2-3d141e0099d5@fromdisposition.org>
References: <20261012-sm8350-cpu-capacity-v1-0-3d141e0099d5@fromdisposition.org>
In-Reply-To: <20261012-sm8350-cpu-capacity-v1-0-3d141e0099d5@fromdisposition.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, fromdisposition <me@fromdisposition.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791770585; l=2954;
 i=me@fromdisposition.org; s=20261012; h=from:subject:message-id;
 bh=9YQsAJJ10PCMm3NOvwDq8LDOChng3jMGGzkFZbGKX94=;
 b=jTMFiRafgePd8fwXWjQRx2dh96IVRXVW8Aj+VEPFWMg5pvMxvhPIvBwCfKSD9tSqLn9dxO0GB
 rlzyNnSEA0BAzE3x1ioWADeTW1eoN3zGxKmHdO2g3hRNjZ14MNmIqAo
X-Developer-Key: i=me@fromdisposition.org; a=ed25519;
 pk=S0QFlGq1BQEaAtPPdAH8YKEOXMeRuSkTgctXuvtU+1Y=
X-Endpoint-Received: by B4 Relay for me@fromdisposition.org/20261012 with
 auth_id=1163
X-Original-From: fromdisposition <me@fromdisposition.org>
Reply-To: me@fromdisposition.org

From: fromdisposition <me@fromdisposition.org>

Without dynamic-power-coefficient no energy model is registered for
these CPUs, so energy aware scheduling stays off.

Take the values from Qualcomm's downstream overlay for v2 silicon
(lahaina-v2.dtsi in msm-5.4): 100, 499 and 760 for the A55, A78 and X1.
For the A78 and the X1 it replaces the 515 and 845 of lahaina.dtsi.

Assisted-by: LLM
Signed-off-by: fromdisposition <me@fromdisposition.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index df6e9d1fa..dcd1fc9c1 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -61,6 +61,7 @@ cpu0: cpu@0 {
 			clocks = <&cpufreq_hw 0>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <512>;
+			dynamic-power-coefficient = <100>;
 			next-level-cache = <&l2_0>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			power-domains = <&cpu_pd0>;
@@ -86,6 +87,7 @@ cpu1: cpu@100 {
 			clocks = <&cpufreq_hw 0>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <512>;
+			dynamic-power-coefficient = <100>;
 			next-level-cache = <&l2_100>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			power-domains = <&cpu_pd1>;
@@ -106,6 +108,7 @@ cpu2: cpu@200 {
 			clocks = <&cpufreq_hw 0>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <512>;
+			dynamic-power-coefficient = <100>;
 			next-level-cache = <&l2_200>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			power-domains = <&cpu_pd2>;
@@ -126,6 +129,7 @@ cpu3: cpu@300 {
 			clocks = <&cpufreq_hw 0>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <512>;
+			dynamic-power-coefficient = <100>;
 			next-level-cache = <&l2_300>;
 			qcom,freq-domain = <&cpufreq_hw 0>;
 			power-domains = <&cpu_pd3>;
@@ -146,6 +150,7 @@ cpu4: cpu@400 {
 			clocks = <&cpufreq_hw 1>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <973>;
+			dynamic-power-coefficient = <499>;
 			next-level-cache = <&l2_400>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			power-domains = <&cpu_pd4>;
@@ -166,6 +171,7 @@ cpu5: cpu@500 {
 			clocks = <&cpufreq_hw 1>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <973>;
+			dynamic-power-coefficient = <499>;
 			next-level-cache = <&l2_500>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			power-domains = <&cpu_pd5>;
@@ -186,6 +192,7 @@ cpu6: cpu@600 {
 			clocks = <&cpufreq_hw 1>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <973>;
+			dynamic-power-coefficient = <499>;
 			next-level-cache = <&l2_600>;
 			qcom,freq-domain = <&cpufreq_hw 1>;
 			power-domains = <&cpu_pd6>;
@@ -206,6 +213,7 @@ cpu7: cpu@700 {
 			clocks = <&cpufreq_hw 2>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
+			dynamic-power-coefficient = <760>;
 			next-level-cache = <&l2_700>;
 			qcom,freq-domain = <&cpufreq_hw 2>;
 			power-domains = <&cpu_pd7>;

-- 
2.53.0


