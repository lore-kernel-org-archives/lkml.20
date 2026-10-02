Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E47C74E0B6E;
	Fri,  2 Oct 2026 15:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790953655; cv=none; b=ZDmbTRZ3j3fazBKri+8HEwLvDKxexObZaSx+aCy7PHxfM+PFRANm7RLAJ6L0229oOLelLWcnDG5GRkMDrJjUB+5OL5rdGa+FWwVX2qXNNkLagwBNI62BgfpbSWwYeM/6B2Y7W89gFiIR+s4+6MiMn8vxrm7wUOfdY7oSvbA6Uvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790953655; c=relaxed/simple;
	bh=qPXndyy+kCfqWJ1DYoikXvZ2oalM7quMrTOswRv6HKs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J3/HdwbKaMsmPNHjP5BuRPaf9u2xjE9uUUsMZsV13DdbA5KBrBBHCuOtC0BjmUiK0p7uB0+Gaz+jQ+D1G7/hzPUKZc1GTDuNzq5mocQlaEt3EiVvywInZq3rwkmnUGd7+TVHaNWXZVhZ/KRd8M/FQ1FN/WJgypi6CXg0r0lMPa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=GhFfG2f9; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GhFfG2f9"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0665169C;
	Fri,  2 Oct 2026 08:07:29 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 695183F85F;
	Fri,  2 Oct 2026 08:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790953653; bh=qPXndyy+kCfqWJ1DYoikXvZ2oalM7quMrTOswRv6HKs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GhFfG2f9Y0IRkOmbzbQG0O3xg2WbRMQytQS77OaA0ftVa8l/8TKH7NyMyJ1uqvl1+
	 G72UqhdaJSXmhgSWoN12fh3Sq8vaJInDoJBTpBpejbxJ1N/vpEVgmPjLJxzRY+sW+j
	 zEVe5MMWtE5bM2/wAZUVfIj11AwJ+YzwmiMCIk1M=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 02 Oct 2026 16:07:21 +0100
Subject: [PATCH 2/5] dt-bindings: arm: coresight: Allow atclk for static
 funnel
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-2-c3edca1c480b@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790953646; l=1077;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=qPXndyy+kCfqWJ1DYoikXvZ2oalM7quMrTOswRv6HKs=;
 b=3U/T4ZX39pINBBA4zZJbihfCnZaXVZF3laNIkkxBej1iFUWHL6REmRyxIwzgBHIvqByz493Ax
 17lxpH6tagaCvaJ6sdGuEjIDsBln15n40lB2smZc4UOCY1/b6JQjqw/
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

Static funnels have no programmable registers and need no APB
programming clock. They can still require a trace clock for the ATB
datapath.

Document an optional atclk input. The CoreSight funnel driver already
enables it when present.

Assisted-by: Codex:gpt-6
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 .../devicetree/bindings/arm/arm,coresight-static-funnel.yaml        | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml
index 9598a3d0a95b20e6272d4d72329a081101cca524..f502dc1a462d85e9cb6dfafc603a40360fa0fb41 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml
@@ -30,6 +30,12 @@ properties:
   power-domains:
     maxItems: 1
 
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: atclk
+
   label:
     description:
       Description of a coresight device.

-- 
2.34.1

