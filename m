Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C233CEB9A
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790695086; cv=none; b=VuqKMOSj4QWoM07qggX1hDjOybM+QIr8mXDSuqy1oOmJEPDKwIiJTr946TAbmLE0soB/MSh86LqlR5RlTaDRqcZ/QEspczOnC7x9QsOkwy6sUhzHtl5mnwB6pROh8DAYXPLa7QkwmAYpRk2JcLS1wApZB4Sm8kQW1EmropOm4G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790695086; c=relaxed/simple;
	bh=5T+a23aIGmK2iqABM7bsnn+JBjwEBOQqZO+RU3YCAIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NcGTqHSouTFQVNLgC4cOXl3aU51pCat7pcWgLkQQC3exwc9XK74s41e8JydHpboyskQifgdVdn+SSmLHzZIqRYNhgB0jFMDALNeMZGMHdW/SYxDdILKaRg1vvQ6QP4WLMJzcudoTvmn+vNJSUtETKQoxo6SqTsJR6b6al0VZg3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dEwKTkXs; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dEwKTkXs"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so32627415e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790695073; x=1791299873; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YshmIf8br7QZ8gBxtu/Vo13g09V/Sk1mprmtIBCHo2o=;
        b=dEwKTkXsbcUwSRywhPvI/PTqFIaOSeEA09fN3+c6KiMxzu2EjStXCNOxOwfE8qiZVW
         5gdwWYj+xeSONbh18IVtKnzV1Syb4E0owhv2hF0iBs4mTmrhU+ZQmSYVh76yq51g+ExU
         OIeon1/9tAAktz7ELeYqDb2cTqShLnJR+NHc8fkIYpF7fgv6L79P50Ii82GD3IlsWpI5
         RmhyEhFD714ebA847EQuYkr2Sh4SAIQNm/hQ/AFuFLQSutGVrWZl69D3y5tyEhKJF+Kx
         WjCLqxdlwTnLGJa9EygR5nooHlzR4C29pymvG4QkxqOtjX/Otws1FOb4qH49dcv/NKpq
         bJsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790695073; x=1791299873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YshmIf8br7QZ8gBxtu/Vo13g09V/Sk1mprmtIBCHo2o=;
        b=G3y5zfH2OupOYn1EhFg1ACBuHakEg/FT84ol8CIWaMnHodmBtQ3vkG1+mWxTl46dXD
         dcyW4mDQqoVBXseAbj3v7FL1ir36IuO6jZ4nbBryAMQ6XigSnV8nSQEX7jmfM9TCTS1S
         k2SsRKLerOK64jAq91OFaSzbZp2qwogU0mkpdEQiXt1mPPWjhZe7+bMHzu+xC8vVfAKn
         sMxFbw2k0gOJv+d6B1/gaykxd0hpn2jE2fzEJPL/aVG67ZhjoLLugTGihZ/0RGO4E234
         K5Y+g2R+2xvQt7XxjDY+zUWDY6ki7/xLNpOFS4C60C6gEwiCiaeT76e3GeT1D5VRYAsp
         z7mw==
X-Forwarded-Encrypted: i=1; AKwUvByozSZPzaKHS0Btbavip69bg/IU1JljuZSnrF0blElwkOKpTTh3njN+pueBUe7Q+WiZzzln3NvDyfQsfH0=@vger.kernel.org
X-Gm-Message-State: AFuF++lMZPsibBicCyuFXwbanV7yK62uZG/WGThlZLdjj0ozGEFlO8Hc
	Ab6lm5qh0LIQbUQVjcJk4MIRaki6XaUN+2n83F0FVCAiGeUsIYfkg8f7
X-Gm-Gg: AYBFou2M9RQrZsd6/M3mbgJUMAoIjmGysmjoTq/dWS6e0cCdQqFx5K8Bo3iIk14GCD3
	2KBsxm8bbsA+sTOLNkEJcvxh61U/rH3Fq9BrGMLu2X/3EvYiGiM8PGoMUd4q+PfHZuYzaE7lQh9
	kfL50WEE/GIYnOANkOkcVKg0aYr1jOy63Z5neVp2ZThVUnGjO1syFoTIwDVmTzrnqzBIjGErKXD
	EZivaTQTztLlYkf9CW9tHnlJwla+/q/j0/WzifEmh5scXyvE9Fx723/QQAis7DQrhBL7apb7mQU
	NzBCVbeJoXHqbAwysn6owOYmI+dvwb5ln3DYr30dTLCn7YTtVJVIYKAtMSrhs29UT5mqRUBJQnk
	yNE69WCBznaypnqGRbuF1/o+aQD1jDsica3SQ/iLRm0+cupJeCG+IDOStkrjcYgAJ/a0oWutPPx
	LoUGpWQTEErvfI3gOhq7uENoto4Bn9QewYUnLf5XD4K5ciLet7En/fcloqvnXwZdvcODirseI2L
	Mi6c10hE1EN+RuHyvB+qZYV6Tk4SakJ9IOakRCSQs8RCkDNF3+jwDEZxmq+weZsryrnYt72gzVD
	ABAR5o8+S6uVdTT4sYxhjSAYWUw53tbB
X-Received: by 2002:a05:600c:c3c1:10b0:49c:fc6e:8caf with SMTP id 5b1f17b1804b1-49feaa1d628mr198851025e9.19.1790695073277;
        Tue, 29 Sep 2026 08:17:53 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a013cf8402sm10313705e9.2.2026.09.29.08.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:17:52 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v4 05/13] dt-bindings: net: micrel: Fix RMII clock select property type
Date: Tue, 29 Sep 2026 17:17:32 +0200
Message-ID: <9a0f70dc168278a484bb336835bf2e419a9d089d.1790693249.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790693249.git.stefano.r@variscite.com>
References: <cover.1790693249.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

The binding describes micrel,rmii-reference-clock-select-25-mhz as a
boolean. dt-schema requires properties ending in -mhz to contain an
unsigned integer value. A bare property therefore produces a
property-units.yaml type warning.

Describe 25 MHz selection as <1> and keep the property restricted to
KSZ8021, KSZ8031, KSZ8081 and KSZ8091 PHYs, which have the RMII
reference clock select bit. The driver checks only for the property
presence, so this does not change runtime behavior.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../devicetree/bindings/net/micrel.yaml       | 27 ++++++++++++++-----
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/micrel.yaml b/Documentation/devicetree/bindings/net/micrel.yaml
index 6fa568057b92..a1f876dc00de 100644
--- a/Documentation/devicetree/bindings/net/micrel.yaml
+++ b/Documentation/devicetree/bindings/net/micrel.yaml
@@ -63,6 +63,14 @@ properties:
     minimum: 0
     maximum: 3
 
+  micrel,rmii-reference-clock-select-25-mhz:
+    enum: [ 1 ]
+    description: |
+      RMII Reference Clock Select bit selects 25 MHz mode.
+
+      Setting the RMII Reference Clock Select bit enables 25 MHz rather
+      than 50 MHz clock mode.
+
 allOf:
   - $ref: ethernet-phy.yaml#
   - if:
@@ -90,6 +98,18 @@ allOf:
     then:
       properties:
         micrel,led-mode: false
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - ethernet-phy-id0022.1555
+                - ethernet-phy-id0022.1556
+                - ethernet-phy-id0022.1560
+    then:
+      properties:
+        micrel,rmii-reference-clock-select-25-mhz: false
   - if:
       properties:
         compatible:
@@ -105,13 +125,6 @@ allOf:
           description:
             The RMII reference input clock. Used to determine the XI input
             clock.
-        micrel,rmii-reference-clock-select-25-mhz:
-          type: boolean
-          description: |
-            RMII Reference Clock Select bit selects 25 MHz mode
-
-            Setting the RMII Reference Clock Select bit enables 25 MHz rather
-            than 50 MHz clock mode.
 
 dependentRequired:
   micrel,rmii-reference-clock-select-25-mhz: [ clock-names ]
-- 
2.47.3
