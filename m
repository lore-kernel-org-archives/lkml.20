Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B7A279DAD;
	Mon, 12 Oct 2026 02:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791771488; cv=none; b=giT4cqpiPoC7q1BoUybbPs4o0US/KEuTz0aVFImn4o7W6mRSG4Cx2eOFwoFUNN0cZw2Ud5LFUYrFnYh+XhRfqe7rSlse3RAq/ee2Qc4Xu8ZSIcvlLFjsNja2RL7joooET0mIPpU7klmJZnH4OOyRDYYdSIS4CjP60Ake/QG/ZNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791771488; c=relaxed/simple;
	bh=g0VdQP7HRsR4RU6yEKHihUboTFdIoVo2rb6TslB9as0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u5QkbdK1jF6E+RfqodQZdLF8iwkJaDrGBeZz+i9X61UEVAm0FR1T71sqaJFUUImAM8Ma/JaikrorB0baC4UQxzoPvHgd7JR/kv5pGL5lnZ+EqHmd0fm9bbwOHsRe6EqH+TcQI1x8FhAaFbPEJhX+Q82PvNDZuoiEM6HnwsJbKXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jRd3sJ3v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jRd3sJ3v"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2376AC2BCFB;
	Mon, 12 Oct 2026 02:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791771488;
	bh=g0VdQP7HRsR4RU6yEKHihUboTFdIoVo2rb6TslB9as0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jRd3sJ3vZQbuugLmCfWntxVFSa4BL+QC9vu/HJhTK7tk8sKVwIhZ+rTHe1mMXyffW
	 JuQihdS2Iecvwn9tdxlCL2AJVateJNEIcfZhyXN6kakddHQGM2oA5rdPuW7xJOyk9/
	 YBdwxiUMkLk+2rBk8CfDm03FoJnGtXofLRx4VIK4nSSG/kS7xATQR5YCvx1ANwwQAG
	 4fgH/CRWP98g0kNn1Yqs8yD1c4TTHcQR/qfpnX5PhaYEzs2tDko5SNmEoDSUcYcruD
	 F/HejwQUuzx3oA7S59fd1QWxlxr2kQvJ9hDMQ6ifnBLucB/vlVePyba68gDcax3gpr
	 0Q579zMjZzjqQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02D20CA9EBD;
	Mon, 12 Oct 2026 02:18:08 +0000 (UTC)
From: Fabricio Akio via B4 Relay <devnull+fabricioakio.gmail.com@kernel.org>
Date: Sun, 11 Oct 2026 23:18:07 -0300
Subject: [PATCH 1/2] arm64: dts: qcom: sdm630: Drop the cluster idle states
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-sdm630-idle-states-v1-1-3181d488dc0f@gmail.com>
References: <20261011-sdm630-idle-states-v1-0-3181d488dc0f@gmail.com>
In-Reply-To: <20261011-sdm630-idle-states-v1-0-3181d488dc0f@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, 
 Alexey Minnekhanov <alexeymin@postmarketos.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Martin Botka <martin.botka@somainline.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Fabricio Akio <fabricioakio@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791771486; l=6930;
 i=fabricioakio@gmail.com; s=20260928; h=from:subject:message-id;
 bh=23wncA73vW8glTOQmjH0aK0yqRBNCdDuOK1PAtCF2Rk=;
 b=8ezxlID7sWRSwVFzsKCD/cZgl+WwuBlr58tiE5bbRuBoKrIUqqoidIeoHbAyBYFBCXt2b7ToW
 MY0thRkuZWnCxEkTnQy3HU9PepsYQq21i+N+tehu8bUjBkLHvGDyR0Z
X-Developer-Key: i=fabricioakio@gmail.com; a=ed25519;
 pk=TlMUT8bPI/ZQzp2q24BIQTb2qSx/jdUTBlGEXIRCm54=
X-Endpoint-Received: by B4 Relay for fabricioakio@gmail.com/20260928 with
 auth_id=1076
X-Original-From: Fabricio Akio <fabricioakio@gmail.com>
Reply-To: fabricioakio@gmail.com

From: Fabricio Akio <fabricioakio@gmail.com>

The cluster idle states use PSCI parameters 0x400000f2-0x400000f4. The
vendor kernel encodes a cluster state differently: it puts the cluster
mode in StateID bits 7:4 and sets an affinity-level field, bits 25:24,
to 1, so cluster power collapse is 0x41000043, and only the last
running CPU of a cluster requests one. A flat cpu-idle-states list
cannot express that condition.

cpuidle records no successful entry into any of these states, and every
request for one fails. Because they are the deepest, an idle CPU keeps
choosing one, each attempt returns at once, and the CPU spends its idle
time retrying instead of sleeping. On a Motorola Moto X4 (SDM630) with
the screen off, the CPUs made about 133,000 failed idle entries per
second and spent about 10% of the time in an idle state, and the
battery supplied 277 mA. Without these states they spend nearly all of
it in one, and the battery supplies 115 mA.

Fixes: b190fb010664 ("arm64: dts: qcom: sdm630: Add sdm630 dts file")
Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 108 +++--------------------------------
 1 file changed, 8 insertions(+), 100 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 3a1014804fb0..222ec5886818 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -55,11 +55,7 @@ cpu0: cpu@100 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
-			cpu-idle-states = <&perf_cpu_sleep_0
-						&perf_cpu_sleep_1
-						&perf_cluster_sleep_0
-						&perf_cluster_sleep_1
-						&perf_cluster_sleep_2>;
+			cpu-idle-states = <&perf_cpu_sleep_0 &perf_cpu_sleep_1>;
 			capacity-dmips-mhz = <1126>;
 			#cooling-cells = <2>;
 			next-level-cache = <&l2_1>;
@@ -75,11 +71,7 @@ cpu1: cpu@101 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x101>;
 			enable-method = "psci";
-			cpu-idle-states = <&perf_cpu_sleep_0
-						&perf_cpu_sleep_1
-						&perf_cluster_sleep_0
-						&perf_cluster_sleep_1
-						&perf_cluster_sleep_2>;
+			cpu-idle-states = <&perf_cpu_sleep_0 &perf_cpu_sleep_1>;
 			capacity-dmips-mhz = <1126>;
 			#cooling-cells = <2>;
 			next-level-cache = <&l2_1>;
@@ -90,11 +82,7 @@ cpu2: cpu@102 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x102>;
 			enable-method = "psci";
-			cpu-idle-states = <&perf_cpu_sleep_0
-						&perf_cpu_sleep_1
-						&perf_cluster_sleep_0
-						&perf_cluster_sleep_1
-						&perf_cluster_sleep_2>;
+			cpu-idle-states = <&perf_cpu_sleep_0 &perf_cpu_sleep_1>;
 			capacity-dmips-mhz = <1126>;
 			#cooling-cells = <2>;
 			next-level-cache = <&l2_1>;
@@ -105,11 +93,7 @@ cpu3: cpu@103 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x103>;
 			enable-method = "psci";
-			cpu-idle-states = <&perf_cpu_sleep_0
-						&perf_cpu_sleep_1
-						&perf_cluster_sleep_0
-						&perf_cluster_sleep_1
-						&perf_cluster_sleep_2>;
+			cpu-idle-states = <&perf_cpu_sleep_0 &perf_cpu_sleep_1>;
 			capacity-dmips-mhz = <1126>;
 			#cooling-cells = <2>;
 			next-level-cache = <&l2_1>;
@@ -120,11 +104,7 @@ cpu4: cpu@0 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
-			cpu-idle-states = <&pwr_cpu_sleep_0
-						&pwr_cpu_sleep_1
-						&pwr_cluster_sleep_0
-						&pwr_cluster_sleep_1
-						&pwr_cluster_sleep_2>;
+			cpu-idle-states = <&pwr_cpu_sleep_0 &pwr_cpu_sleep_1>;
 			capacity-dmips-mhz = <1024>;
 			#cooling-cells = <2>;
 			next-level-cache = <&l2_0>;
@@ -140,11 +120,7 @@ cpu5: cpu@1 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x1>;
 			enable-method = "psci";
-			cpu-idle-states = <&pwr_cpu_sleep_0
-						&pwr_cpu_sleep_1
-						&pwr_cluster_sleep_0
-						&pwr_cluster_sleep_1
-						&pwr_cluster_sleep_2>;
+			cpu-idle-states = <&pwr_cpu_sleep_0 &pwr_cpu_sleep_1>;
 			capacity-dmips-mhz = <1024>;
 			#cooling-cells = <2>;
 			next-level-cache = <&l2_0>;
@@ -155,11 +131,7 @@ cpu6: cpu@2 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x2>;
 			enable-method = "psci";
-			cpu-idle-states = <&pwr_cpu_sleep_0
-						&pwr_cpu_sleep_1
-						&pwr_cluster_sleep_0
-						&pwr_cluster_sleep_1
-						&pwr_cluster_sleep_2>;
+			cpu-idle-states = <&pwr_cpu_sleep_0 &pwr_cpu_sleep_1>;
 			capacity-dmips-mhz = <1024>;
 			#cooling-cells = <2>;
 			next-level-cache = <&l2_0>;
@@ -170,11 +142,7 @@ cpu7: cpu@3 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x3>;
 			enable-method = "psci";
-			cpu-idle-states = <&pwr_cpu_sleep_0
-						&pwr_cpu_sleep_1
-						&pwr_cluster_sleep_0
-						&pwr_cluster_sleep_1
-						&pwr_cluster_sleep_2>;
+			cpu-idle-states = <&pwr_cpu_sleep_0 &pwr_cpu_sleep_1>;
 			capacity-dmips-mhz = <1024>;
 			#cooling-cells = <2>;
 			next-level-cache = <&l2_0>;
@@ -258,66 +226,6 @@ perf_cpu_sleep_1: cpu-sleep-1-1 {
 				min-residency-us = <1000>;
 				local-timer-stop;
 			};
-
-			pwr_cluster_sleep_0: cluster-sleep-0-0 {
-				compatible = "arm,idle-state";
-				idle-state-name = "pwr-cluster-dynamic-retention";
-				arm,psci-suspend-param = <0x400000f2>;
-				entry-latency-us = <284>;
-				exit-latency-us = <384>;
-				min-residency-us = <9987>;
-				local-timer-stop;
-			};
-
-			pwr_cluster_sleep_1: cluster-sleep-0-1 {
-				compatible = "arm,idle-state";
-				idle-state-name = "pwr-cluster-retention";
-				arm,psci-suspend-param = <0x400000f3>;
-				entry-latency-us = <338>;
-				exit-latency-us = <423>;
-				min-residency-us = <9987>;
-				local-timer-stop;
-			};
-
-			pwr_cluster_sleep_2: cluster-sleep-0-2 {
-				compatible = "arm,idle-state";
-				idle-state-name = "pwr-cluster-retention";
-				arm,psci-suspend-param = <0x400000f4>;
-				entry-latency-us = <515>;
-				exit-latency-us = <1821>;
-				min-residency-us = <9987>;
-				local-timer-stop;
-			};
-
-			perf_cluster_sleep_0: cluster-sleep-1-0 {
-				compatible = "arm,idle-state";
-				idle-state-name = "perf-cluster-dynamic-retention";
-				arm,psci-suspend-param = <0x400000f2>;
-				entry-latency-us = <272>;
-				exit-latency-us = <329>;
-				min-residency-us = <9987>;
-				local-timer-stop;
-			};
-
-			perf_cluster_sleep_1: cluster-sleep-1-1 {
-				compatible = "arm,idle-state";
-				idle-state-name = "perf-cluster-retention";
-				arm,psci-suspend-param = <0x400000f3>;
-				entry-latency-us = <332>;
-				exit-latency-us = <368>;
-				min-residency-us = <9987>;
-				local-timer-stop;
-			};
-
-			perf_cluster_sleep_2: cluster-sleep-1-2 {
-				compatible = "arm,idle-state";
-				idle-state-name = "perf-cluster-retention";
-				arm,psci-suspend-param = <0x400000f4>;
-				entry-latency-us = <545>;
-				exit-latency-us = <1609>;
-				min-residency-us = <9987>;
-				local-timer-stop;
-			};
 		};
 	};
 

-- 
2.56.0


