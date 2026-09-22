Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EED490C08;
	Tue, 22 Sep 2026 18:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790101887; cv=none; b=loBXRjn666QfkfF4WME6M1ofVAgGqagKQyBuQIno4WoZ24fH03UVC9lGmA4GRiYXZbEWOOglLbDRNnxzBIWlSB6lr2VGzCKl8WWvatSDQmApMef9AcoIjS4+86ir5EKrSJ74jtIUJPENCNRDvjN1tM5lmtzWi/RQtI9+AKKcs18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790101887; c=relaxed/simple;
	bh=ZzwACR0NY0wCdoycxCgPjGKuQv84KH68XZlerQsou5I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JjKtwoaJ/uXi5VoY0S7q7yFxinfKv8nSJRzMvvaHJfBnun6d4f/iu4TzwXEQ7kqKA+Bb85lzIGtefKIfTGMJ+FCjZVukgi83r0WEAversI+nXWfe6Gh6soIRv+FfjggFx8lFXp5dhL8rHu5mi27iZrQrb76r6siUXjxVGElbbdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VkLhgJ12; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VkLhgJ12"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80BD01F00893;
	Tue, 22 Sep 2026 18:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790101885;
	bh=zxMWe1Gn1onetdReGCnPNu372D/8gHhav9+ZEra4BaM=;
	h=From:To:Cc:Subject:Date;
	b=VkLhgJ12vAKrxbUuncHIicgmjCFQy21k7qkQhdQGikCFSAXRV0ONjKk6u42HXvlHg
	 AAjw94Kuq7Y15isBWpt1P95x9o+6AK+Wz0Pl44KLKsCYiBQH9Vv64XDBlSfDphngX5
	 vXZonHDGdfZj/2E9OfhdoFcls6OMOtEtlPhJ2znP1WCT9uJOx8c05a7+Q1DLIv0C1V
	 25QYBAQR+DAlEsEoBrOk1+Z9DWZ50bYPSeL72ZHxp2vhuJPfxuttEIbjjz75jbZ6+0
	 GIWnP8bTSgI3D+61qzpPCVTC2bOs0rEEDTAbnU9/YgUD8vVk0pIj3aNhIcF35j8lKi
	 ibrOh3LPeETkA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Eugen Hristev <ehristev@kernel.org>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] ASoC: dt-bindings: mediatek: Fix MT7622 clock count
Date: Tue, 22 Sep 2026 13:31:20 -0500
Message-ID: <20260922183121.289108-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MT7622 audio nodes have 33 clocks and clock names. The shared MT2701
binding listed the longer MT2701 clock set as the common minimum,
so MT7622 DTs failed validation as too short even though the binding
already capped MT7622 at a smaller list.

Set the common minimum to 33 and make the MT7622 conditional require
exactly 33 clocks and clock names.

Assisted-by: LLM
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/sound/mediatek,mt2701-audio.yaml          | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt2701-audio.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt2701-audio.yaml
index 30f331366566..10df1e7c7eb9 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt2701-audio.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt2701-audio.yaml
@@ -32,7 +32,7 @@ properties:
     maxItems: 1
 
   clocks:
-    minItems: 34
+    minItems: 33
     items:
       - description: audio infra sys clock
       - description: top audio mux 1
@@ -74,7 +74,7 @@ properties:
       - description: audio APLL root pd
 
   clock-names:
-    minItems: 34
+    minItems: 33
     items:
       - const: infra_sys_audio_clk
       - const: top_audio_mux1_sel
@@ -132,8 +132,10 @@ allOf:
     then:
       properties:
         clocks:
-          maxItems: 34
+          minItems: 33
+          maxItems: 33
         clock-names:
-          maxItems: 34
+          minItems: 33
+          maxItems: 33
 
 additionalProperties: false
-- 
2.53.0

