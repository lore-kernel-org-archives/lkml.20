Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A004E48F02F;
	Tue, 22 Sep 2026 18:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790101913; cv=none; b=Fpg2/zAsQm8yqbGPtcToWwmErK1ow5mj1EeSCtdayUgiYHa6yPPJZz54rshecSG4YuYin2P5WjCihFihYtLAa3y+QRaBLlfZw8Me6oOMrq6vdwU7SV1qwxykesy/wEC4dVIcbs3kDiLfFt90gpDO8muGBDsgL6Jy2N2M8ZhyuE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790101913; c=relaxed/simple;
	bh=ygWooVNEZiXB3XhfdkYZisA8ayKLuTuXOvOG6qD2dDU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j7vBXLcjxWx7fPVhvEB382LJUXnR7GThz1cvAfvR+EPOIP1TPVnw0dHq83e6F3wealZM6MijNK4VmgebbmSUmrT4XdGCRQi0uq4gpOdSx4A06SLfG2uRb95sFtPtsfl+XG70Le3jSmIZPnFb7X+xvTCgCKijuSXcz/eaBOsZHpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FZZ/7jXH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FZZ/7jXH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F33E61F000FF;
	Tue, 22 Sep 2026 18:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790101912;
	bh=iTJT8av1Tcx2ax4Ir2KLPb4Q8kU8v+ehpETOvg/bF0c=;
	h=From:To:Cc:Subject:Date;
	b=FZZ/7jXHBWa6hxdiGFLm44ShDiFLGB8X2MvYgyMRTlRtCQ+U7b1/uQ7eMMPjlTCs4
	 CU6+T6acJLVC8MdXVvLa8cSVC7SFvjrA4asVErnEDCzuPhe18HalBxTCfnLlDfraSs
	 IW6QfF+/Zm+S1dsad45I3k9BBoPx559aCdjtxwwVH6FMSLJB691a0crswBxhHtMMMi
	 vXKDbWaS2ntktQI3ekE39Xs2ZgZRtQ5H0rPv1d7zaZwaFnKz/QPEOSCOS7FLx7PWEw
	 6G0fpXEm9XZgDxpeB6fBJSzn67jjght7J+kBoljUEoLJG+36nhBQYMIzTISTup494R
	 ki8i0lCxiD1WQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Michal Simek <michal.simek@amd.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: mtd: arasan: Add ZynqMP props
Date: Tue, 22 Sep 2026 13:31:38 -0500
Message-ID: <20260922183138.290114-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ZynqMP NAND controller nodes contain "num-cs" and "power-domains"
properties. Add num-cs with a range of one to two chip selects and allow
one power-domain.

Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/mtd/arasan,nand-controller.yaml   | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/arasan,nand-controller.yaml b/Documentation/devicetree/bindings/mtd/arasan,nand-controller.yaml
index b90d3b48c2f2..4262996dd51e 100644
--- a/Documentation/devicetree/bindings/mtd/arasan,nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/arasan,nand-controller.yaml
@@ -35,6 +35,14 @@ properties:
   interrupts:
     maxItems: 1
 
+  num-cs:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 2
+
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.53.0

