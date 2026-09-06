Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA8333B6DA;
	Sun,  6 Sep 2026 16:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788710760; cv=none; b=ja1ONMKBF+I2fwkzrPNPSAzxmGWpTJcVYZayOQQyBxukvneGEQSnPPg7G2xZPRH8WtGwEhwLKDptCA/PKFcxZGnBEVkV+chsKj693cYbSxE2VBdza0eAh8XXWQjjnLpyFJNcre2BBc2KGoMlW7bAnE7ltoiBoSWZtpTFQhcK6aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788710760; c=relaxed/simple;
	bh=Q/g45COEM8Wm11Scr+Scf3fRTTgH3HBagUeaOFrwkL4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MbN8NDLVkZ+keqlzrJVhowwsAlI9bT0mcnaQysWFZKZn6v9PfhRDuMYj4Ta+lTzMYjCAXCVVNh+nfu+b8+1WVwEfRboNFumtBPLwWgxuiwojKBvvtiSMxQxkNSGdEnFXTkUFE+nBg1vuOmmd3Sfas/QbBWII1N4dNKll/2wKZZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VG51rxJH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VG51rxJH"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0CA39C2BCF5;
	Sun,  6 Sep 2026 16:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788710760;
	bh=Q/g45COEM8Wm11Scr+Scf3fRTTgH3HBagUeaOFrwkL4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VG51rxJHOxalx7mGLKpPzvFfi6vXUWx9trBvM4afymB1X+IE6I9pFWQ7aWMzreq3L
	 z4LruBup/CNEFNdMJoUpgPuAK3dw5eCQKQq6XXIvFODxbK4KtxveZHCxjqCW+51qN0
	 UprVerPiflp4NJ1t0LdjXi8dBAe4T6D4sDXF/dPgXkmPckoMtC0eICBOe71uMTZK8Q
	 oPVNZOyOEWY5s3ZCT4IO3ajz9X7O2B02jTXZyp2tts/3eTaBCfAxQs0Fz009FxEQTv
	 VkpglMrE+8u3AmHzhx2XEJ+skSWIumkFYvoM85UbfUgCRVZ8ouXROnTqMU6dVrmBvq
	 8b0o0YFG2G+BQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0210C79F85;
	Sun,  6 Sep 2026 16:05:59 +0000 (UTC)
From: =?utf-8?q?Juan_Carlos_Guti=C3=A9rrez_Lavado_via_B4_Relay?= <devnull+jcarlosgl96.proton.me@kernel.org>
Date: Sun, 06 Sep 2026 16:05:49 +0000
Subject: [PATCH 1/2] dt-bindings: arm: sunxi: Add SPC Glee 10.1 A64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260906-b4-spc-glee-a64-v1-v1-1-621df2155e31@proton.me>
References: <20260906-b4-spc-glee-a64-v1-v1-0-621df2155e31@proton.me>
In-Reply-To: <20260906-b4-spc-glee-a64-v1-v1-0-621df2155e31@proton.me>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Juan_Carlos_Guti=C3=A9rrez_Lavado?= <jcarlosgl96@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788710758; l=1596;
 i=jcarlosgl96@proton.me; s=20260906; h=from:subject:message-id;
 bh=2sTHkEIZ9R2X36In5QhZ4ozs/BXQZzuqStbGUoIn0/8=;
 b=PawChL5wDUDLG0nHuI8bLkcI2Gg3HO3qY1ESyyPWDgu6r45I1S1MpUoJUa6l9YXdauMIgVMc7
 X1s/4Mi5jOoAwlVfDq1T1ChCyDXymDo/1kiBnR7NAZ86NrBE3zXxddB
X-Developer-Key: i=jcarlosgl96@proton.me; a=ed25519;
 pk=2/GzZfrbHAiuUrsA5A4A9ixfHKnypfDfzyE+fToY4Io=
X-Endpoint-Received: by B4 Relay for jcarlosgl96@proton.me/20260906 with
 auth_id=1008
X-Original-From: =?utf-8?q?Juan_Carlos_Guti=C3=A9rrez_Lavado?= <jcarlosgl96@proton.me>
Reply-To: jcarlosgl96@proton.me

From: Juan Carlos Gutiérrez Lavado <jcarlosgl96@proton.me>

Add the Smart Products Connection vendor prefix and the board
compatible for the SPC Glee 10.1 tablet based on the Allwinner A64.

Signed-off-by: Juan Carlos Gutiérrez Lavado <jcarlosgl96@proton.me>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml       | 5 +++++
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index f04db28c6..ce425938c 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -902,6 +902,11 @@ properties:
           - const: allwinner,suniv-f1c200s
           - const: allwinner,suniv-f1c100s
 
+      - description: SPC Glee 10.1 A64 tablet
+        items:
+          - const: spc,glee-10-1-a64
+          - const: allwinner,sun50i-a64
+
       - description: SL631 Action Camera with IMX179
         items:
           - const: allwinner,sl631-imx179
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969..ff462d6f0 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1603,6 +1603,8 @@ patternProperties:
     description: Spansion Inc.
   "^sparkfun,.*":
     description: SparkFun Electronics
+  "^spc,.*":
+    description: Smart Products Connection S.A.
   "^spinalhdl,.*":
     description: SpinalHDL
   "^sprd,.*":

-- 
2.55.0


