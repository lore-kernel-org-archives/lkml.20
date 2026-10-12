Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C1D3019BA;
	Mon, 12 Oct 2026 02:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791771488; cv=none; b=Atz0cc/Xa8GqZgoxaSj9uLSS7G+bbwzRXN4l88KGjxxTCb2BtZuEswvkO33Sz2tZE38xndRHbEB7ZiF/jlCRm25kGQb5A8fpQbE604HZhvZc42e6vxirxV3a1VJzRduIu7v89MvHFEQLgIokYMRrD5DbzXtRHtgYCsgRfVaUTcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791771488; c=relaxed/simple;
	bh=wqZgFcQv79nCxhdK/QeqPWm6bn1L/7fctlQZfxmiUdg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ctxP0Iyfj4iDRy1xWxUcTTJJMLzYv3Kukxb7ax1InDctk/ed1rJaGZVhEWjTVGNfphY6LDa/BrVe/1U2f2T2HX1cwHgPq+dDx4i/k3h2q+twL37mnis6ZDIqFBdOII1w/oVx6tiLPnyoHUGfEKvR+bE3zVi/4uu2i47xs5ygZug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FNWJzD3s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FNWJzD3s"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 33C75C2BCF7;
	Mon, 12 Oct 2026 02:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791771488;
	bh=wqZgFcQv79nCxhdK/QeqPWm6bn1L/7fctlQZfxmiUdg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FNWJzD3syijxx/nawoyQYIN8WdGj0mycfm/Tje159OLnGiRmv/ltA0Io5pHIkmNiM
	 oW4QPpR98SabhbSlXjoB/37bnIW7EBBkCIYOfFJhCYjlA2pUrpZCjlfNlXCY5HxqCg
	 NUKE4YCX739e0Bu86hv//C3vjQgCR3ewemCo1QTE3/OjrgKwGXZdKKuPmoGsmEj6N6
	 Rv8lnZRFbKUx3coM4nG0tACkfqEhzZNWv65bN7Sq9gFvnyPqDLxCWnWyOuSp1/qPzw
	 WsjzsJ2YpFrukPO6eW48n7wR1+XMgZpZg9fRTfQ1M/2Ok312zCoM7EgqMqEENV/oSJ
	 jgr8lV6OI/bzg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15438CA9ED3;
	Mon, 12 Oct 2026 02:18:08 +0000 (UTC)
From: Fabricio Akio via B4 Relay <devnull+fabricioakio.gmail.com@kernel.org>
Date: Sun, 11 Oct 2026 23:18:08 -0300
Subject: [PATCH 2/2] arm64: dts: qcom: sdm630: Fix the CPU retention idle
 state parameter
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-sdm630-idle-states-v1-2-3181d488dc0f@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791771486; l=1587;
 i=fabricioakio@gmail.com; s=20260928; h=from:subject:message-id;
 bh=JPfucNV2H7AMDe9ybxbNQCBK1Hyzzm9nRs65fQ2KOPs=;
 b=oQp29R2EyUSznPiQGQnc1SYh2rurX09E6rz6/LF2N6c5QUF5eqrvTIMJEs5rI4W5EAZUvXEFG
 D3oqHL25NynAR61z3Hk/8dKEyVGFtGfa+2+Yi2vE6+i4m00sRXxQyNL
X-Developer-Key: i=fabricioakio@gmail.com; a=ed25519;
 pk=TlMUT8bPI/ZQzp2q24BIQTb2qSx/jdUTBlGEXIRCm54=
X-Endpoint-Received: by B4 Relay for fabricioakio@gmail.com/20260928 with
 auth_id=1076
X-Original-From: Fabricio Akio <fabricioakio@gmail.com>
Reply-To: fabricioakio@gmail.com

From: Fabricio Akio <fabricioakio@gmail.com>

The CPU retention states set bit 30 of their PSCI power_state, which
marks a state that loses context. Retention keeps it, and the vendor
kernel requests it as 0x00000002.

With bit 30 set, no entry into these states succeeds on a Motorola Moto
X4 (SDM630). With it clear they are entered about 50 times per second
across the CPUs, and the failed idle entries across all states drop
from about 30 to about 9 per second.

Fixes: b190fb010664 ("arm64: dts: qcom: sdm630: Add sdm630 dts file")
Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 222ec5886818..a58bad0fb638 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -192,7 +192,7 @@ idle-states {
 			pwr_cpu_sleep_0: cpu-sleep-0-0 {
 				compatible = "arm,idle-state";
 				idle-state-name = "pwr-retention";
-				arm,psci-suspend-param = <0x40000002>;
+				arm,psci-suspend-param = <0x00000002>;
 				entry-latency-us = <338>;
 				exit-latency-us = <423>;
 				min-residency-us = <200>;
@@ -211,7 +211,7 @@ pwr_cpu_sleep_1: cpu-sleep-0-1 {
 			perf_cpu_sleep_0: cpu-sleep-1-0 {
 				compatible = "arm,idle-state";
 				idle-state-name = "perf-retention";
-				arm,psci-suspend-param = <0x40000002>;
+				arm,psci-suspend-param = <0x00000002>;
 				entry-latency-us = <154>;
 				exit-latency-us = <87>;
 				min-residency-us = <200>;

-- 
2.56.0


