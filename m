Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13D024E01F1;
	Fri,  2 Oct 2026 15:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790953657; cv=none; b=QDaC2sfX0Lltw5I+2Q+noDgq8nVsSN8368GXgJlIGHL7oM0jpSr0b+0hGv7BFwGgbPhA8TjvY4lmSc8xT+645iDAsrqqxs+PcG9yyVDyOB5heY2CkACuA8uMTgBM29iiuyrHKHKhovE+KFJsY7BKOBUBU8317mQbEJKAJARgoA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790953657; c=relaxed/simple;
	bh=sXzqmP5MlK+j1Yq6dP9z+/8Nn3NdnH1jYeNuVgR8xAo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LA8P7Na13AxjWvxKYrIONZuA9lDTA22LTF7WvjfJdQwhb1LYwwt1LGHjzy3mCce1OS3Fe+RKaFd7wc2pQ4tZFYMacTy0Cs7rI73Y3dFLm3Dbfp5C5nxmAeG5CLpD8YRSVZ1Umb7VbmpReiBIxSsq4Inpxw2YR16BIFYl5hKKW9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=DY7dMa4l; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="DY7dMa4l"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 203E316A3;
	Fri,  2 Oct 2026 08:07:32 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 90EBF3F85F;
	Fri,  2 Oct 2026 08:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790953655; bh=sXzqmP5MlK+j1Yq6dP9z+/8Nn3NdnH1jYeNuVgR8xAo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DY7dMa4ls3OeW4IVZ4rKAhA3JFq3w9JUXxsuZpGkppAJuChPSDO9M9C5lnMxrsZmX
	 AURly6ptP1s7vfiLZb3qEdS9w801Bc9MUCgF4z6OjwbGYWOtKNmCOMy5nr6PmS5zih
	 bgz7NNolNxMjeanRjQ8hfoCxK8YQtvDC/7aDseV8=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 02 Oct 2026 16:07:22 +0100
Subject: [PATCH 3/5] arm64: dts: hisilicon: Drop PCLK from static CoreSight
 links
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-3-c3edca1c480b@arm.com>
References: <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-0-c3edca1c480b@arm.com>
In-Reply-To: <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-0-c3edca1c480b@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Wei Xu <xuwei5@hisilicon.com>, 
 Michal Simek <michal.simek@amd.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790953646; l=1790;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=sXzqmP5MlK+j1Yq6dP9z+/8Nn3NdnH1jYeNuVgR8xAo=;
 b=szTlIePqWbhXyJsQ8PeTJfpBnTmtYz68rIJOpnXuktOfJF6IpYxwG1u3t/HuOYWd9nRB0R5fR
 ngvTMfSU01ECEzY3U1zf1+y8+V6A7ivV2bkOdlhH+JHapA3U6ngxbFh
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

The static links don't need to program registers, therefore apb_pclk
reference is unnecessary, remove the pclk properties from those nodes.

Assisted-by: Codex:gpt-6
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi | 4 ----
 arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi | 2 --
 2 files changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi b/arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi
index 4c6a075908d1f8e3b9bba7cf9f0a2220819ea188..629b412d1b9fcc060f1eff9517652d3ddb7db441 100644
--- a/arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi3660-coresight.dtsi
@@ -306,8 +306,6 @@ cluster1_etf_out: endpoint {
 		/* An invisible combo funnel between clusters and top funnel */
 		funnel {
 			compatible = "arm,coresight-static-funnel";
-			clocks = <&crg_ctrl HI3660_PCLK>;
-			clock-names = "apb_pclk";
 
 			out-ports {
 				port {
@@ -397,8 +395,6 @@ top_etf_out: endpoint {
 
 		replicator {
 			compatible = "arm,coresight-static-replicator";
-			clocks = <&crg_ctrl HI3660_PCLK>;
-			clock-names = "apb_pclk";
 
 			in-ports {
 				port {
diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi
index 3f387f4cf5e02386cd130da877a62f395173c806..df449c53fb98cbdc11454cea7deabaea6177c68e 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi
@@ -62,8 +62,6 @@ etf_out: endpoint {
 
 		replicator {
 			compatible = "arm,coresight-static-replicator";
-			clocks = <&acpu_sctrl HI6220_ACPU_SFT_AT_S>;
-			clock-names = "apb_pclk";
 
 			in-ports {
 				port {

-- 
2.34.1

