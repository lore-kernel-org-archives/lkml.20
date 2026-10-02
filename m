Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A9544E2F13;
	Fri,  2 Oct 2026 15:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790953659; cv=none; b=K4nuAcVw54ccppGPbr3qfMlJY8Akv21m0t1kDvfWDe4y6QLATm1/gAebD57CEwWOiR9QgMmy9GQpr9rPzvBH5iCLdhyvRyK8aiNYAGlwuzA7W9yhzNHueHfzSA6i7n2U/LXgMNyuQaQIZ3NIMsfCrQuFcOAPM+DMek9EIhAMsJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790953659; c=relaxed/simple;
	bh=yWFT1K3i7aJrk+BbSrleSZ7UGUVzLFr8Caz7ll3jtx0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nZnJp8KsCaWoUBjZEV/z4FUz9diq3QDlv234AGT3PbykBBoYmvA1pSkjOPNWsyk1aoKpXbUsot8WNATUL7OzIP7hCoSFhsBdooN/O/iDpUVZlrMnPHJ+Neq/DhaOGyHUP1nK5YSd+uCaPfTIJY2TuU6n4UbgHIA7ggVnRRXx5EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=orYyS3YS; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="orYyS3YS"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62856497;
	Fri,  2 Oct 2026 08:07:34 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C46D53F85F;
	Fri,  2 Oct 2026 08:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790953657; bh=yWFT1K3i7aJrk+BbSrleSZ7UGUVzLFr8Caz7ll3jtx0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=orYyS3YSTVO9mVZDvRgOr4HxRJ/ufqsvz/DSWcJrHi6SdSeywbHihINzaC/5tTVd6
	 e0H1eZehbxtCa+ZAMW26Elbf7ZcQcF3+lrp5lZeGiflyK1vXzslt4IQTexT+3MHyvA
	 55ZnjzR3tQrU4VjOzMD8RTUamFYZC4v4fjVbQe8k=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 02 Oct 2026 16:07:23 +0100
Subject: [PATCH 4/5] ARM: dts: zynq: Use dynamic CoreSight funnel and trim
 clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-4-c3edca1c480b@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790953646; l=3469;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=yWFT1K3i7aJrk+BbSrleSZ7UGUVzLFr8Caz7ll3jtx0=;
 b=drOOmBwpRXFfNH20GS1Wjw5AczOaagKp8yX+EwXOB4HR5Wh7hrMm5Qlt1OTIESi20eG7BN2TM
 MJ84XiscDrXD7P77nh4F65f+B9ktNf2WIbj3G+qweaLZzI3hhMiCx3x
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

The Zynq-7000 funnel at 0xf8804000 has input-enable registers.
Describe it as a dynamic funnel so the CoreSight driver programs
them. Keep the existing apb_pclk reference required by AMBA probing.

The static replicator has no programming registers, so remove its
clock references. CoreSight drivers do not request dbg_trc or dbg_apb
for the funnel, ETB, TPIU or PTMs. Drop those references while keeping
apb_pclk for the programmable AMBA devices.

The Zynq clock controller registers dbg_trc and dbg_apb and calls
clk_prepare_enable() for each gate the bootloader left on (see
zynq_clk_setup()). This does not depend on the CoreSight nodes' clock
references, so removing the unused consumer entries leaves this
protection intact.

Assisted-by: Codex:gpt-6
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 arch/arm/boot/dts/xilinx/zynq-7000.dtsi | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/xilinx/zynq-7000.dtsi b/arch/arm/boot/dts/xilinx/zynq-7000.dtsi
index 153b8d93cbee2c30b399c0770f2022b307fe0808..4280fe6da379064b6ac5bf9e9a5b891830a094b2 100644
--- a/arch/arm/boot/dts/xilinx/zynq-7000.dtsi
+++ b/arch/arm/boot/dts/xilinx/zynq-7000.dtsi
@@ -68,8 +68,6 @@ regulator_vccpint: fixedregulator {
 
 	replicator {
 		compatible = "arm,coresight-static-replicator";
-		clocks = <&clkc 27>, <&clkc 46>, <&clkc 47>;
-		clock-names = "apb_pclk", "dbg_trc", "dbg_apb";
 
 		out-ports {
 			#address-cells = <1>;
@@ -464,8 +462,8 @@ watchdog0: watchdog@f8005000 {
 		etb@f8801000 {
 			compatible = "arm,coresight-etb10", "arm,primecell";
 			reg = <0xf8801000 0x1000>;
-			clocks = <&clkc 27>, <&clkc 46>, <&clkc 47>;
-			clock-names = "apb_pclk", "dbg_trc", "dbg_apb";
+			clocks = <&clkc 27>;
+			clock-names = "apb_pclk";
 			in-ports {
 				port {
 					etb_in_port: endpoint {
@@ -478,8 +476,8 @@ etb_in_port: endpoint {
 		tpiu@f8803000 {
 			compatible = "arm,coresight-tpiu", "arm,primecell";
 			reg = <0xf8803000 0x1000>;
-			clocks = <&clkc 27>, <&clkc 46>, <&clkc 47>;
-			clock-names = "apb_pclk", "dbg_trc", "dbg_apb";
+			clocks = <&clkc 27>;
+			clock-names = "apb_pclk";
 			in-ports {
 				port {
 					tpiu_in_port: endpoint {
@@ -490,10 +488,10 @@ tpiu_in_port: endpoint {
 		};
 
 		funnel@f8804000 {
-			compatible = "arm,coresight-static-funnel", "arm,primecell";
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
 			reg = <0xf8804000 0x1000>;
-			clocks = <&clkc 27>, <&clkc 46>, <&clkc 47>;
-			clock-names = "apb_pclk", "dbg_trc", "dbg_apb";
+			clocks = <&clkc 27>;
+			clock-names = "apb_pclk";
 
 			/* funnel output ports */
 			out-ports {
@@ -536,8 +534,8 @@ funnel0_in_port2: endpoint {
 		ptm@f889c000 {
 			compatible = "arm,coresight-etm3x", "arm,primecell";
 			reg = <0xf889c000 0x1000>;
-			clocks = <&clkc 27>, <&clkc 46>, <&clkc 47>;
-			clock-names = "apb_pclk", "dbg_trc", "dbg_apb";
+			clocks = <&clkc 27>;
+			clock-names = "apb_pclk";
 			cpu = <&cpu0>;
 			out-ports {
 				port {
@@ -551,8 +549,8 @@ ptm0_out_port: endpoint {
 		ptm@f889d000 {
 			compatible = "arm,coresight-etm3x", "arm,primecell";
 			reg = <0xf889d000 0x1000>;
-			clocks = <&clkc 27>, <&clkc 46>, <&clkc 47>;
-			clock-names = "apb_pclk", "dbg_trc", "dbg_apb";
+			clocks = <&clkc 27>;
+			clock-names = "apb_pclk";
 			cpu = <&cpu1>;
 			out-ports {
 				port {

-- 
2.34.1

