Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE773E558C;
	Fri, 25 Sep 2026 07:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790320101; cv=none; b=RPghhTCDzueiIW9OCLO78C5aYqSM436q1bvAsL53cBE93nHhVormy5I1b0708hcuwpcVQ0KpTThh2JqPZzpzuUC1lKZfvLVX8O67SFwRmCsWkf1V/+8tmYFpmO56y1l4vyxf+itwFHGla0DjGBpsf+B3W7jKnCTI3goiBL8yMn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790320101; c=relaxed/simple;
	bh=LJHpmpN4n2fBxLNW85aNGVYEQW9cS+9eIlZD1kckjfA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qRR9a9RS8uKA6JEZ5juPPk52GPlcVeT4dJsBGxXgoj4+wrIL0iiga9ujw8Pk7xDdyG7MKeZXvJAfj9ogJMQVCJ1LQt6RXdFtKJwMfEnBojhT/CdDG3825pX4cH37fDVSOHIlnwy/yESo3muwSIhrr/9EgBZ6cKpVt1b/Y6h11mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YKCfbKpJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YKCfbKpJ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 36B8CC2BCF4;
	Fri, 25 Sep 2026 07:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790320101;
	bh=LJHpmpN4n2fBxLNW85aNGVYEQW9cS+9eIlZD1kckjfA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YKCfbKpJcWUQyRQqv2zmMyo990Y/8YUz8KlE61LhLA5AYmQ52GBH+jAC4XOo9sYul
	 smvLNhJAMljmrj/hF9wx9dYf/yR7Svuk12eeykUA2/Wa3OMtqfpLtSMAgPPol+AhQG
	 7sTX33ZU/e2jbdMtOGJj5BEYwRP3U0hHH0LeZDUsJaBd02QNFYx4Z1uOhGqOBeWroo
	 llAQoXJOMPV9SJ6QFwjtJRbtQS7pXQKj9YYQMOhu0SOs0AdQ4Xx49HPBgXhvgiRBGM
	 SS6Zqqex57B1vNwyR5Mt5pWJmZIgtfALhVFURl93aQdP3M07ebMOqKdy2CNI8QWtkY
	 YMc5+P2c/2k2w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1891DC9830D;
	Fri, 25 Sep 2026 07:08:21 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Fri, 25 Sep 2026 02:08:19 -0500
Subject: [PATCH v2 1/4] dt-bindings: display: visionox,vtdr6130: Add
 Retroid Pocket 6 panel
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-rp6-panel-v2-1-19c425e523de@gmail.com>
References: <20260925-rp6-panel-v2-0-19c425e523de@gmail.com>
In-Reply-To: <20260925-rp6-panel-v2-0-19c425e523de@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790320100; l=1472;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=CaFv5K6fLpukUu5HCZg1CekyTprxOvXYUWdp65fN9W4=;
 b=x2KA/yVp8ENHhH1eGMIPO0tkZ9gjdp/e6GlDCY17U4OW/K1BftQn7yW1B6uQLq4+saUI8+72j
 PtLsKVJj21EBxnxO+1wgaaSYz48EQkDZqdprq3QWaK/fuvw/5GV1OEr
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

The vtdr6130 is a display driver integrated circuit, a common chip used
for various panels. One such panel is used in the Retroid Pocket 6.

The RP6 panel only lists the regulators vddio and vci, so drop vdd as a
required property. The panel is rotated 270 degrees to natural, so also
add rotation as an allowed property.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 .../devicetree/bindings/display/panel/visionox,vtdr6130.yaml      | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml b/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
index c99f4146f1bb0..682f30dc9ee43 100644
--- a/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
+++ b/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
@@ -14,7 +14,11 @@ allOf:
 
 properties:
   compatible:
-    const: visionox,vtdr6130
+    oneOf:
+      - const: visionox,vtdr6130
+      - items:
+          - const: retroidpocket,rp6-panel
+          - const: visionox,vtdr6130
 
   reg:
     maxItems: 1
@@ -25,13 +29,13 @@ properties:
   vdd-supply: true
   port: true
   reset-gpios: true
+  rotation: true
 
 required:
   - compatible
   - reg
   - vddio-supply
   - vci-supply
-  - vdd-supply
   - reset-gpios
   - port
 

-- 
2.54.0


