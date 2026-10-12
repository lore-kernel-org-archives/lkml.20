Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9232C39AD2A;
	Mon, 12 Oct 2026 03:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791777422; cv=none; b=PV8D9qTkStzKHr2sQ+ovW2qt4ZTK3TinBttzmEOoRmSXBTwuk3Pwtqqta4i8RiYiRxjwzefF+g1w+J97yPcOjIooYg0rQ45XDQ2+OUM74QfpztsU1SzUhb9NGgFyWUvNTk2mxiTJeu4UDQQXcSWVFlDbSAScg5wkATKn/H/T/pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791777422; c=relaxed/simple;
	bh=gc0hSO3wTS1XEE1RasKoMiGHI8IJJCTk95DmVfI7aIc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XfF4rcnVTQ2Ogg12Vqqd2xJOsQXoSzyqGuL+Zp1VT2bd8VdkSxcMj+ADS93qjmYW6aUWRGKPWKVTXlKn+PQ0HdZiYh45Bv0Y4J9nxNXqRMsOSNB0zRNP3dm+LETl+fRVT7lAzfmqQgvrne3Wu3BnV8uef33Ilra30p5JAOhkQvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hhwXqeQ9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hhwXqeQ9"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 14C60C2BCFC;
	Mon, 12 Oct 2026 03:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791777422;
	bh=gc0hSO3wTS1XEE1RasKoMiGHI8IJJCTk95DmVfI7aIc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hhwXqeQ9w3gPN3D7+EL7+DUocLKYQdfYaLXnhXH6tyvRzST7O6VhtRtL+rc4W+gZ3
	 Q08zOPi0ezvJta6xXwb4D+MRv2wGcBajWWh59REKfrcZHLLQeYp+wvNUlhwoW95YeR
	 PdugPCjMdsTGSf5k1Zh9Bc9vNQxFJRo4F13NnCildDVLkQL2AiNUzgKXscvNQSulV4
	 OIUxJSffHUElf0f8iBAMccauGcNNC1d9O1dnYkAwRyl+HuLPD4NM32w7RFTBg2dhyf
	 uPNt0zJyQzjKw2BZlyA8m3MCXvmlnpjtAZyJY2O7cY02BE0Sq5resBRKE//tiUTzDt
	 IY5/rtDx3CmWw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA91FCA9EC5;
	Mon, 12 Oct 2026 03:57:01 +0000 (UTC)
From: Demeter Barna via B4 Relay <devnull+me.fromdisposition.org@kernel.org>
Date: Mon, 12 Oct 2026 03:56:05 +0000
Subject: [PATCH v2 2/2] arm64: dts: qcom: sm8350: Add CPU dynamic power
 coefficients
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-sm8350-cpu-capacity-v2-2-67ce449becf0@fromdisposition.org>
References: <20261012-sm8350-cpu-capacity-v2-0-67ce449becf0@fromdisposition.org>
In-Reply-To: <20261012-sm8350-cpu-capacity-v2-0-67ce449becf0@fromdisposition.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Demeter Barna <me@fromdisposition.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791777425; l=2952;
 i=me@fromdisposition.org; s=20261012; h=from:subject:message-id;
 bh=nJ/twsPPlHNDxpm4/9etJ/nV+4PF9bKsWVIDlqFJByA=;
 b=VoVTCS4qG+TFctOBDtU9iyI3w+JaErTJfdfO/7H6P+nGg9ru2oUcv2Chj6cpOVuELxGq1DO7j
 aSkUKJ+c2w6ALn7sAuH5j9eqO8oP+0M1xoH2kdc35ZI56ZmgukUpXbn
X-Developer-Key: i=me@fromdisposition.org; a=ed25519;
 pk=S0QFlGq1BQEaAtPPdAH8YKEOXMeRuSkTgctXuvtU+1Y=
X-Endpoint-Received: by B4 Relay for me@fromdisposition.org/20261012 with
 auth_id=1163
X-Original-From: Demeter Barna <me@fromdisposition.org>
Reply-To: me@fromdisposition.org

From: Demeter Barna <me@fromdisposition.org>

Without dynamic-power-coefficient no energy model is registered for
these CPUs, so energy aware scheduling stays off.

Take the values from Qualcomm's downstream overlay for v2 silicon
(lahaina-v2.dtsi in msm-5.4): 100, 499 and 760 for the A55, A78 and X1.
For the A78 and the X1 it replaces the 515 and 845 of lahaina.dtsi.

Assisted-by: LLM
Signed-off-by: Demeter Barna <me@fromdisposition.org>
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


