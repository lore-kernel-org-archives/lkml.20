Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C149838D686;
	Fri,  2 Oct 2026 15:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790953653; cv=none; b=pOEGRF5XkVjV29cPMCyzdcvxuSN8Zzfa2UJaJnrzX5itMOLuOSov8VBQpkt+T8fhag/Z95V49mZS07Uvim2ijQLAbOceI5hvldrIT+NjnTj0rBjVpSPbbDaslH4kqnOcNHHxA/w274b06XqdZ3SD0cciFV6EP3gW1Yl8nnyucno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790953653; c=relaxed/simple;
	bh=13bZStv85FpFIHW8gZI+hpyHoxi0U5R4QF46QFdkxX4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jibEE8pGJDhtp2WbkGt4smF1Nmw6EsD87fefPv4lpT87pvDnF3LrGpZ2EZjbfr9NML3COC3rEmtHAqhsedSnWEBYsxQh5j770wefLlsTs8S9Ksum4/iRqONLHEtBL6gdZuIeOqF9Fa94d0A6jP7P1YBCN8KTPBHhrIvIqriKxSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=VGxsK7sD; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="VGxsK7sD"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B87E91476;
	Fri,  2 Oct 2026 08:07:27 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3D8273F85F;
	Fri,  2 Oct 2026 08:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790953651; bh=13bZStv85FpFIHW8gZI+hpyHoxi0U5R4QF46QFdkxX4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VGxsK7sDBXO/7gDm2H1ChGRW3Zan9sw1aBRtaHF5b6LYde2WCw//s/aDx6sxt+B7L
	 px4qa0iVH/GfWasQfbU++Di/++AFaQdvw278Le0z+os9LEY3NuPqywMFFlFPM0Yxhv
	 5XXHxombWP1yQp7Do+JdNG3L56/GOpP9h666uT6g=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 02 Oct 2026 16:07:20 +0100
Subject: [PATCH 1/5] dt-bindings: arm: coresight: Limit static replicator
 to atclk
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-arm_coresight_hi3660_remove_dynamic_funnel_clocks-v1-1-c3edca1c480b@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790953646; l=1552;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=13bZStv85FpFIHW8gZI+hpyHoxi0U5R4QF46QFdkxX4=;
 b=0dQSJnuLIp03OHtIUMZBxxZ0BaxAH2a7Ya+4Hp9GIIc1X5leO1J8wP6e0JmLBHw3lenYJU3FS
 0yui3j7SDcuAX+gOjTDsazD4q/LJw0JqOovMjQ7LTmlt6lDjIE9m6ZY
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

Static replicators have no programmable registers and need no APB
programming clock.

The Zynq clock controller registers dbg_trc and dbg_apb and calls
clk_prepare_enable() for each gate the bootloader left on. This does not
depend on the CoreSight nodes' clock references, so removing the unused
consumer entries leaves this protection intact.

Keep atclk optional for SoCs that need to control the trace datapath.
The unchanged driver still accepts legacy firmware that supplies
apb_pclk, atclk, or both by name.

Assisted-by: Codex:gpt-6
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 .../bindings/arm/arm,coresight-static-replicator.yaml         | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
index b81851b26c7495047333b0ee0b5e690c0b153a61..e5596f6d0ce0f28429630f7344507ce49db59e68 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
@@ -31,17 +31,10 @@ properties:
     maxItems: 1
 
   clocks:
-    minItems: 1
-    maxItems: 3
+    maxItems: 1
 
   clock-names:
-    oneOf:
-      - items:
-          - enum: [apb_pclk, atclk]
-      - items: # Zynq-700
-          - const: apb_pclk
-          - const: dbg_trc
-          - const: dbg_apb
+    const: atclk
 
   label:
     description:

-- 
2.34.1

