Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0D04D179D;
	Mon, 21 Sep 2026 23:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790033202; cv=none; b=OwTQkkCowsrCaw/xqlbJ5xsZxPFXA1Fq5Auib+ctTnRr8aFlGYNK5b60UBEufuMwWv4BQFenLrCts5Kt802Z+3OWADu6gsxols2ZuVbazSRNSPt+cQNq0O17sXZD4DELTkzaVRF0oxDPuUSY4A2YXEgF9qNASTS8IaXIpmvg05Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790033202; c=relaxed/simple;
	bh=GihPZgOS6Aa+Vqu93fxtHz99TBP1eGnKwBt4CoCKr8U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dPFTxN7JTRUudysEf2OA0pgouJ1I4VTJYjiw9/du7J/gUvhreVJ+yvFUfjzr6KCvOuDeVRTGUKVliIVd63XJTqFFbkWknEiRw2bVy7TC3pFN9wAPJFuYsLLxambpXe2QmnFIaFo11i+QqCPeqo0DEjeK54Puq5HJcdMje2MVxbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V+qUp1zs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V+qUp1zs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 528391F00893;
	Mon, 21 Sep 2026 23:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790033196;
	bh=vMyFKvxUmCZhsqO9EBuGwBlR+qTh9JpZNPfVYrU1ubY=;
	h=From:To:Cc:Subject:Date;
	b=V+qUp1zs/3DdbzgoKB7EkNsvZBWbqcBJfrvjLaCqxolEnhj310krtqaZHDiwQYsrW
	 UXuo3E2PZUkzal8G2DQJtXDDubbkN4jJIWcTNEu6fePjz3jEVcynxgrdWRygpWLQJn
	 6VWbSd6AjK2pQ0pSglGGaLIKO8v+52SH83QIp0MPlxtwOO7x5GBAVq3SKuF0k5FFXI
	 cIEKEI5KV0CXOVyOj1FDduJQnFFDg9ItbKRHdwQlso5amVnwHADOL1ogLPQfbaNUA+
	 6sITdMPiwv2EjorkWM34UR7GVH3h0v6hCv5VsBY9zgXIHErrDZ8Vz0pEzrqQgT5kun
	 H475wsbzTY2GQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Flora Fu <flora.fu@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Cc: mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] dt-bindings: mfd: mediatek: Allow MT6357 ADC
Date: Mon, 21 Sep 2026 18:26:31 -0500
Message-ID: <20260921232632.3131680-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MT6357 PMIC nodes can contain an adc child using the MT6359 AUXADC
binding. Add the child node reference so the ADC subnode is evaluated
instead of rejected.

Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
index b67fbe0e7a63..dbb48e380e77 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6357.yaml
@@ -62,6 +62,13 @@ properties:
     description:
       List of MT6357 BUCKs and LDOs regulators.
 
+  adc:
+    type: object
+    $ref: /schemas/iio/adc/mediatek,mt6359-auxadc.yaml#
+    unevaluatedProperties: false
+    description:
+      MT6357 auxiliary ADC.
+
   rtc:
     type: object
     $ref: /schemas/rtc/rtc.yaml#
-- 
2.53.0

