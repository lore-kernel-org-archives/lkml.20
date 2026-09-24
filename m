Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2594037C0ED;
	Thu, 24 Sep 2026 14:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790258496; cv=none; b=eF3yoHT9HleBkkEon9JMZcUlnClP2D5oaffDguEymwUnEzd5m0PjrV2iDY3sVdZ+2EhqGpVj0ftIv/vIVJDAUEHEGvYjzbDv5uTEXgOf8gX2fvlqmlnpKH9JGOLW4Npb2ovGVJO2OMTlI6h81S5vrpu4h6Z9iUMA8NLWrgyGtKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790258496; c=relaxed/simple;
	bh=rtR6voWlBp6nmy7r/Mw5s0EqVFPdv3nDJeJ4GzojCQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TG5rG7jJZ3Xw+uUhVe83NuHe1yywkqyX4OqCZRZYzkJO7qpDhWmixm+KXBwyBr6Ho7/wwACXYe6gIsGNQROpxptyKytPuraNS40QNkbKYns/iPZ1cEfa655M8Mp8OpB7zX27tBdwgwHk8naOX0ZsV4sqGNOaHrSG0Nl41jdT4a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rOELeOTl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rOELeOTl"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B8255C2BCFC;
	Thu, 24 Sep 2026 14:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790258495;
	bh=rtR6voWlBp6nmy7r/Mw5s0EqVFPdv3nDJeJ4GzojCQ4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rOELeOTlQMEQ20LhH9sN776dl9/JoPloOQkb8zH8GBLZ0uieCpOSw9oR51yGQFB3o
	 fTo1YxXy4jZ1gmrph981EO270zVpVgRVZiWQhuV5t8L1yAOPGhHHUafrq28bJ7Kl93
	 452ftRHw399QgA/tJlolvW6Apz8jbf1NDycyJJ/tImS5ittU3GURMy13LcyAJ3S6So
	 eLD4w7HcmX3pKMxEiR5JmfNPJFCeIDOqp7mkcPgfHlCbFJos7dKEI8h+kRr7Jvbu+7
	 uY7dyIkrQWYC2uLFJXZIxWe+nipIQm/J7kBrMFYu4sRcxa+4xEhI/j83idogpoL9/q
	 U6NuHhIl0MAsA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A0E3C9831F;
	Thu, 24 Sep 2026 14:01:35 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 24 Sep 2026 16:01:30 +0200
Subject: [PATCH v2 02/11] dt-bindings: display: panel: samsung,s6e3ha8: Add
 AMB630QY01 panel
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-crosshatch-panel-v2-2-08d5c7bf72fc@ixit.cz>
References: <20260924-crosshatch-panel-v2-0-08d5c7bf72fc@ixit.cz>
In-Reply-To: <20260924-crosshatch-panel-v2-0-08d5c7bf72fc@ixit.cz>
To: Dzmitry Sankouski <dsankouski@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Petr Vorel <petr.vorel@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2442; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=K2rs3ud3gazsmGeLP5fMP4q2yS8qRIDd3AISDM3ybSU=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqtS08VkRqj0WEof9HjRjSR4hVLdlW/AsFGAVOI
 v956XP148aJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCarUtPAAKCRBgAj/E00kg
 cs7FEACsE94bBqkeYjQN+BTrH6kDai9p8lc8cqqrU7PHbqyH8sLrTIvvhtgGH49qKVqN2IugIMS
 G292zBUb6rYISii85x84mq742Zi8XDzVYCTzF2ohFsJK3MBloQHJTO/iSTOqlnWF2et7gd4YLd1
 4PG/1VHEy1eDkRo4UsmWwi0UbaiZ3HPzLjv6FnImaLnLefu8yDzTm1P5tQW/8fw8p8/Gc9hS35h
 09M21IGprFKpbEDZ5RtUDWIHUD8tqBgS3bXyKtVm3MF7Lh1rmnXuePierlITiwrs3mY/wYTgenu
 rPt3GLYWNHIrBcdUGbBnEms3TxdnuMVOlK2h8bcM429Tvrn4kT9vB76ZWhCYI3SijO3fxaQSfpr
 pJYBLUd8Da/lCKIBjWA/3Z/V6S5rwcKbgz8WT7BKaqoOH8FK8CRSmAHY/lLHz2YS7xWMIDQlezY
 qYrxxQouNm7luEfT8QYTJuJVGnPtdtRb6FykVEvpJXHkOB8S22QXq7ty7VGL/fdjV4StdjYos+P
 RwAjyPIVT60RO+Lg9nK1pIB1GFxX/TfvDX1dQyYescQ8WSuX3isJcLXZu+vY1rhqAXzbKBzGRK7
 X1ZWyywrWx9Hw48jHUGTuVv97Qd5r+Hgc+Q0KmaOPjpeEVAhXQQ9yYQUJQ2nggRDqFDzsbw9KfE
 bAWQMyXnTExmCKA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

The Google Pixel 3 XL (crosshatch) uses a Samsung AMB630QY01 6.3"
1440x2960 flexible AMOLED panel.

Assisted-by: LLM
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../bindings/display/panel/samsung,s6e3ha8.yaml    | 31 ++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml
index ca250b1b91712..acc2ea2969298 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml
@@ -7,48 +7,75 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Samsung s6e3ha8 AMOLED DSI panel
 
 description: |
   The s6e3ha8 is a display driver IC used in 1440x2960 AMOLED panels from
   Samsung Mobile Displays (SMD).
 
   Known panels:
     - AMB577PX01, 5.77", Samsung Galaxy S9 (samsung,s6e3ha8-amb577px01)
+    - AMB630QY01, 6.3", Google Pixel 3 XL (samsung,s6e3ha8-amb630qy01)
 
 maintainers:
   - Dzmitry Sankouski <dsankouski@gmail.com>
 
 allOf:
   - $ref: panel-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,s6e3ha8
+              - samsung,s6e3ha8-amb577px01
+    then:
+      required:
+        - vddr-supply
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,s6e3ha8-amb630qy01
+    then:
+      required:
+        - vddpos-supply
+        - vddneg-supply
 
 properties:
   compatible:
     oneOf:
-      - const: samsung,s6e3ha8-amb577px01
+      - enum:
+          - samsung,s6e3ha8-amb577px01
+          - samsung,s6e3ha8-amb630qy01
       - const: samsung,s6e3ha8
         deprecated: true
 
   reg:
     maxItems: 1
 
   vdd3-supply:
     description: VDD regulator
 
   vci-supply:
     description: VCI regulator
 
   vddr-supply:
     description: VDDR regulator
 
+  vddpos-supply:
+    description: positive boost supply regulator (ELVDD)
+
+  vddneg-supply:
+    description: negative boost supply regulator (ELVSS)
+
 required:
   - compatible
   - reset-gpios
   - vdd3-supply
   - vci-supply
-  - vddr-supply
 
 unevaluatedProperties: false
 
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
 
     dsi {

-- 
2.55.0


