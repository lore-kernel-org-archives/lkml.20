Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8EE4D7D2A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405238; cv=none; b=UidJF9BYyjMTm4mx0EgGkMVEYsjbY3WC7GyY+8JVv6xfrRXSMw9qIuboPGwVZcHG8f3sWYbPoNXi9ejhZJITVoiIOYb83j5FYCOK4fJWWpUdNKRkaESGrkydY0h1zQOorA7xB7pNpkVAUk3kmB5D21hX+HNET1CvGGs3InnpJxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405238; c=relaxed/simple;
	bh=p2BuP3I+TMrSGg/xzqyxfT/0XRDTvkwqjvU6at2DNLc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eYyK3lCO45LXq4/U3oVSIPelqPxyhcgEUIvAMWuCTruC1rYpZXuFPfZAroRHgWovJvD9VfP2RSV1HIl//6K1MAN9X5OX1yW1eFnKRGeesgSzt4w3/PAAbZiR6QTIER1nRspgEaqajZUHF8mce2gCP5msuQOKNsJ8EDzaNtdDP9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bsUEppeh; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bsUEppeh"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35f1f76ea84so3575308eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792405236; x=1793010036; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5cb5xsu/Ek8DjIcHOFj6xTziW0Tc8RenZR8/LpBW7iE=;
        b=bsUEppeh3FUIjTFdtWnu1d7AM0GagWS56d0tIcNnYNZE4g2zJcKmvN4/TENs4+zzPE
         +S36paGOtupDvRWZfbV0wLpyyRY33bLCoPdbAr1o/+UBneAkZL0EKU143SgTjlH/aRKz
         ilSngQAeHbplesBQ4CvhV9i4skL/7D0c3nAWalsDKRNVG9JtC3RysOMPGJBbbnaBPMIK
         WQL7y3b/TcAj9zboblsv9dioU6SW1/HnjfnfhG8mb3vmoDGfhHB0F8C61AI4bvD4Sy5S
         lsP8Pr2BgA0lNIQ/lnbjebdoikulhzie2A2UYllJ8XakPVKKm0RxfeTAFQhqn22dIZpV
         S1yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405236; x=1793010036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5cb5xsu/Ek8DjIcHOFj6xTziW0Tc8RenZR8/LpBW7iE=;
        b=g+4G+dF1n4mMFFKkEggG4ZJICDjbWq2Q0RbnDhxJZ2qj0wbjKAmPR+yPz+erf/iOE4
         1wGF3Qvu2C89EAEabov+tN2FJazIzGjLP/yAGK4g6xdxotHAi35VFNtE5r1gcH5fT+Xa
         MC1alFSl7pg0k+7D2DUmhl8JTrADHi+J4gtMvw4CST8nC7KncGVsZI4miOtntPIVYUXK
         gXPQBnHHAf72Efdn7ZEVPOTCoEK7MfQufV3rgl3reLtQIsVaYCxNGQZCWE/9sgswNM0s
         7kkROwr2X2QeOiAwYs9DC2y8cVZbIfXP4GBAG+Z0JHIsuo8jcqaheDmqQ8FmDOyR+XcJ
         UbPQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0PJZjSd8MwHBFlBfCZrv1QsQodLvSADTSTlCKqpttn8n4XmMGcOuELnRv98CvMhHfClivMi81t6GZhlA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJcTPvRZ/iOspFfQPXG9qEBydukNLQAhH5WzC79hk64TrjehSe
	AfOVEjqCNkuxzt8S1flliG9ovXCMZ90r7SUwQvAa494B7gqVXyXbyjuh
X-Gm-Gg: AYBFou1HHLsgnHT067/6z436pZSGHdTWM1Sup7NxeB0D1LNAsrfrb6ZAdk62kEtpEAC
	NBbVxK5xahk0DNyAvNPDHYWYuZramLhuV/87s3Kt1vFcjZE/m9cDhRjDOeU+Q1806ACihxd33+n
	+GhGdTj0cjiax0N422BUUUIlZfxByP9zKuURQT6o0dSHu+1hsk+JBHuZl44Kan4oC+f66WTnWdF
	9NtoVuTkG0D7FVyweJj0qehWJ/EYwQQ0R4bVYHfnzCSgxsABYrVlBnr8UNnQ3o9tGfZUX8dcu1n
	NGHVON0M04MAsth/WLA4o5N69+6DUA7qAFf3AyeMdS2KRKIqk1GkeUtsaoT19o7gzeW3Uc9z2To
	gRaUh3BDE6vH8pvq9QpEluglXMhdI8rJKAt6w4AdmnL9DXeIT+Lv9dc1tYJFn5UyoZRLD+CCTZ1
	KmxTJf2cFh4Cw32m03XDRFmbqJeE9OQJD+RpyS9L/RmdyUZwxkCCjT0+7udu3I4sbEP1rtTeB6s
	Ko=
X-Received: by 2002:a05:701b:4348:b0:14c:96a4:b631 with SMTP id a92af1059eb24-1851453fc8dmr10504406c88.30.1792405235442;
        Mon, 19 Oct 2026 03:20:35 -0700 (PDT)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18319d3b880sm26324251c88.10.2026.10.19.03.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:20:35 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Mon, 19 Oct 2026 07:17:14 -0300
Subject: [PATCH v2 1/3] dt-bindings: display: bridge: simple: Add
 data-enable-active to dumb-vga-dac
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-v2-apalis-imx6-enable-vga-v2-1-ef6a3a780472@toradex.com>
References: <20261019-v2-apalis-imx6-enable-vga-v2-0-ef6a3a780472@toradex.com>
In-Reply-To: <20261019-v2-apalis-imx6-enable-vga-v2-0-ef6a3a780472@toradex.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792405217; l=1828;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=PF05NXBIDireg6ZUuKSrsvk0d/GOH3dnTBdN38H+03I=;
 b=HD53baHT8u8/D5pbXuDGQl16Aht+8414McxB843sMyEC12qLowhQ0jc1HnfAvNB3zgF23VEb/
 NDRwdc+iyH3BM2jB6dL4/ITgsqWwfg90tizY7oL/Djh99ux42ruW1MI
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

Some simple VGA DACs may include a data-enable input that must be driven
at a specific polarity. Add the data-enable-active property from
video-interfaces to the input endpoint to describe that polarity.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 .../bindings/display/bridge/simple-bridge.yaml     | 28 +++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
index 7636c24906ba..b1b23d41245d 100644
--- a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
@@ -43,9 +43,18 @@ properties:
 
     properties:
       port@0:
-        $ref: /schemas/graph.yaml#/properties/port
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
         description: The bridge input
 
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml
+            unevaluatedProperties: false
+
+            properties:
+              data-enable-active: true
+
       port@1:
         $ref: /schemas/graph.yaml#/properties/port
         description: The bridge output
@@ -65,6 +74,23 @@ required:
   - compatible
   - ports
 
+allOf:
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: dumb-vga-dac
+    then:
+      properties:
+        ports:
+          properties:
+            port@0:
+              properties:
+                endpoint:
+                  properties:
+                    data-enable-active: false
+
 additionalProperties: false
 
 examples:

-- 
2.43.0

