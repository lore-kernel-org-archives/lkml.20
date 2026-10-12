Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924D139D3D0;
	Mon, 12 Oct 2026 03:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791777422; cv=none; b=iye6LLEjPyOlAbBv6lsYKYBgV7eI0HKJiodLiCP6ey+MEjHIpcliU0bb99/pqWd7W874Scnc/ERegPfex/4VXlKefXGFtpVfmoq96bWc562NFq+3fiN3uZeG3BVqhV1fuzS/PTYdntRFOOdmeZnwLjLBKM5Orkzgg3S/KYweE6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791777422; c=relaxed/simple;
	bh=NHzwTkQG4yAkX3Qh+2ESSWoni3WCPGxUA/lRinVo0sU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lp1e2sKM5w6+uA0RPQxq3N7KfNjuCisWlnkmO8K8vAdEmaqdZ4R7W2cuJBxYdT3llpeRd462fKtmQKnWXWVGsUjkFOyurguLR0+bdw9qSm8odl4pLy2s9BrGiQd/oGs+pM4LwvnLaZ4CxZ7JUR/0sjAbj4WJ10yrdKkhK88JqC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nRBfWW2v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nRBfWW2v"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03593C2BCF4;
	Mon, 12 Oct 2026 03:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791777422;
	bh=NHzwTkQG4yAkX3Qh+2ESSWoni3WCPGxUA/lRinVo0sU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nRBfWW2vwDfsYlKkFGAsqs4o46lJXafLxY/iRFRLVGQYW37s9toZkq9JOF211eevH
	 gR2pFTx+5oM8hsrkjpn7Zgq2RAxdzwDOIaWht6APPZSV6e8Rk+X0Lu7Dw3hNTQvmeE
	 cprOiQzqiA14JSutLIPjAdE9vazp8cMJyKoZEAbndjNK3rvP7CrfVXk5IZX0ATHtNf
	 dC89SwDDawsSD8EX6w4AArZMIDCJ4d56ZgtIGajPvQy/Pagz8vGV/qEdax+4wuhE2Z
	 g0BMCYoZd93B4elH6kb/7NLUdTV6gi4kZO7AY2p+FPGhEn0lnCakkN8e+5TDvXZisI
	 mkVe1d7Bih3IA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA787CA9ED5;
	Mon, 12 Oct 2026 03:57:01 +0000 (UTC)
From: Demeter Barna via B4 Relay <devnull+me.fromdisposition.org@kernel.org>
Date: Mon, 12 Oct 2026 03:56:04 +0000
Subject: [PATCH v2 1/2] arm64: dts: qcom: sm8350: Add CPU capacities
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-sm8350-cpu-capacity-v2-1-67ce449becf0@fromdisposition.org>
References: <20261012-sm8350-cpu-capacity-v2-0-67ce449becf0@fromdisposition.org>
In-Reply-To: <20261012-sm8350-cpu-capacity-v2-0-67ce449becf0@fromdisposition.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Demeter Barna <me@fromdisposition.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791777425; l=2955;
 i=me@fromdisposition.org; s=20261012; h=from:subject:message-id;
 bh=u8+scJQOHR1b0/s/1esht/dAa+mGypkRg3dAhGlCBTk=;
 b=cnBsmhtlENeGvcgtC478IxDywDmjTpIP+1CEuUUr931oMMZTUWZa7Bx/Reoy3LWaj8RlqqNRP
 RqvWz0uzBkHB5JloRq1RVPIdf4/NH4u6lHHusyAZZU2/GIn+XesG71C
X-Developer-Key: i=me@fromdisposition.org; a=ed25519;
 pk=S0QFlGq1BQEaAtPPdAH8YKEOXMeRuSkTgctXuvtU+1Y=
X-Endpoint-Received: by B4 Relay for me@fromdisposition.org/20261012 with
 auth_id=1163
X-Original-From: Demeter Barna <me@fromdisposition.org>
Reply-To: me@fromdisposition.org

From: Demeter Barna <me@fromdisposition.org>

Without capacity-dmips-mhz every CPU reports a capacity of 1024, so the
scheduler treats the Cortex-A55, Cortex-A78 and Cortex-X1 cores as
equal and sets up no asymmetric CPU capacity.

Take the values from Qualcomm's downstream device tree for SM8350
(lahaina.dtsi in msm-5.4): 1024, 1946 and 2048, halved so that the X1 is
1024. Only their ratios matter, as the kernel normalizes them. The
downstream overlay for v2 silicon (lahaina-v2.dtsi) keeps them.

Assisted-by: LLM
Signed-off-by: Demeter Barna <me@fromdisposition.org>
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


