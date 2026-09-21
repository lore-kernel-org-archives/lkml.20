Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EA53C1D4D;
	Mon, 21 Sep 2026 23:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790033333; cv=none; b=u1nBwAMjlQvTczJrVNBvUolOOImfeMbprWfopn/3YxVQLgFjiFa0oWlakSDP2jlw3CsLB1fAwqc/VWNMxar7g+lW+Li185KF+Qq8GYf2d8pHzR0bewoRgkodaIoOlXIckIJ/64GdK3x9NEfxWObADNAjOhzLYKHfUnA2fSsEFbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790033333; c=relaxed/simple;
	bh=rvxFVCi8l1oHqpLRwxE7IM/SxNzZSu5rHf2IMDJrxxA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k0NK5qaThKefIIDZlPTy3mtej8jCpfcimYATeNwbS/kdXfTILk2S7hKgQ9+JIcIk1sPa/Yr6kjYbGeosWgaO+AWkUh4qiSfQdEVw7mdRRoTdvEhZ1rKtV8nra/onn8rvw+CesNxr7H9SITXWW1ZsmOSw/AFvnOZOApjtT1MbBms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G6AW76Pw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G6AW76Pw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EADF1F000FF;
	Mon, 21 Sep 2026 23:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790033318;
	bh=6dICvcKm3BIGHLqArm5a68sfhcX4BHfmX+37PnEVNIU=;
	h=From:To:Cc:Subject:Date;
	b=G6AW76Pw+tuclNLlmPboPUnIfHQGSTZEibH7WL1m/ALP5AoJDpuQx5Gx9WxDS9gnD
	 5RmJF3TKIfhME64en1Y9uszNmBlYyJ9wcDRoXchXbcmU5+FxAlKDeVAP+GoSt/LpPF
	 8LHQptJjbfvQDufL2/2ytujbOq1oECVJ13KybRG3bvzyMM85G72Do7lReNfVFAdhLa
	 3TU9+L2q8UbXM5cZBqYsiCVKZRvdk4Fz+47u+UyYObxJBpKKaEruOVST7wzT6BrSiV
	 Xgr/PuKcIGfbw5t0JDnnPNFe9omz6RpZgn2WGtxEhcNKVp9KrSp3g8Nd3AUUuRc0Q7
	 U5//tIn3pmjBQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Leo Yan <leo.yan@linux.dev>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: arm: coresight: Allow funnel clocks
Date: Mon, 21 Sep 2026 18:28:33 -0500
Message-ID: <20260921232834.3138571-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some static funnel nodes have APB and AT clocks. Allow one or two
clocks and the apb_pclk and atclk clock-names entries.

Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/arm/arm,coresight-static-funnel.yaml      | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml
index 9598a3d0a95b..4a3d08f9568c 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml
@@ -30,6 +30,16 @@ properties:
   power-domains:
     maxItems: 1
 
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: apb_pclk
+      - const: atclk
+
   label:
     description:
       Description of a coresight device.
-- 
2.53.0

