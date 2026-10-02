Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 942824E36CE;
	Fri,  2 Oct 2026 15:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790953661; cv=none; b=mUcIEP9GjXBs3sKhNRamJBwMSBd1xcIa7umGNZlF4Rq45n4RN6Mgl6zzSjv1iv6oPCG2MlNLNRJcrws7as8fctvUHk45xLJpdqJ/+d1NDsY9+8VEglDBy+bzGNoPwyKbK66bdWKOnYfu1SXwudbVnt07L5tG2q50CAH03P+PUWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790953661; c=relaxed/simple;
	bh=EtEbIevaHoU1h59GeXCFBe5QGE2fZdeAN5/cQyHH45Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=apepZNq9OM4zPLawZ6yVfhJr58bF8fK6/EncqTV52WhoLDrPytOiwn5RaTrqXXrji0tusHXc3QFeorllDzec+3Q9ipIXwFFtymR0G1HCBTCrocbM0agqLQ+8KUNRUCVrvacnrY4hGfppiqXsr/waYg5b/X+Xj46L4iZ0FvUHv9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=QuHgYZXC; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="QuHgYZXC"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A64C8169C;
	Fri,  2 Oct 2026 08:07:36 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1353D3F85F;
	Fri,  2 Oct 2026 08:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790953660; bh=EtEbIevaHoU1h59GeXCFBe5QGE2fZdeAN5/cQyHH45Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QuHgYZXC4DajEwRDu7Xaz72LkmmBmd2tgLKCgx164MsL8yk9drecUUsqxZjK/ebLS
	 boFPzWqd6g5tzJeTMJgekN17q75lpan1Eaq/UHFk90CJ4nWUy6G0dDLXXqEJYn4ibM
	 mQZ/qYiaazKPivD79nTc9MAzluTRsaAp90catOv0=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 02 Oct 2026 16:07:24 +0100
Subject: [PATCH 5/5] ARM: dts: qcom: apq8064: Drop PCLK from static
 replicator
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-5-c3edca1c480b@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790953646; l=890;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=EtEbIevaHoU1h59GeXCFBe5QGE2fZdeAN5/cQyHH45Y=;
 b=HUjL6TKbkcRHVBOoawur6aFG3yfPZ76e/a59I7QikVzblfgBJKHqlVZUER3WpfmUnv2wkSaBM
 /UndvBEMsLsAIqtfzwyeTfOQFxoT/QvJQrsF+7SPHfFxo8OxKrS5JBE
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

The APQ8064 static replicator has no registers to program, so it
does not need an APB clock. Remove its RPM_QDSS_CLK reference.
Other programmable CoreSight devices keep their clock references.

Assisted-by: Codex:gpt-6
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index 09062b2ad8ba550c3c2ee5849c96fb68fa2dff4b..d3ae9b835b9f45ce0bf66c850006a6ab149a183e 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -281,9 +281,6 @@ scm {
 	replicator {
 		compatible = "arm,coresight-static-replicator";
 
-		clocks = <&rpmcc RPM_QDSS_CLK>;
-		clock-names = "apb_pclk";
-
 		in-ports {
 			port {
 				replicator_in: endpoint {

-- 
2.34.1

