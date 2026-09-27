Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5083E7BC4
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 12:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790513203; cv=none; b=W/VhPcfrGD6GCnaQ57cCROmsdQzhN6rrysd86QcI1/r/C6aO8uXtgVdqHM9Fuoh2wdbm2OFVBrmWsLnLPluI6BzAk8FIk6vrstnxLYCRD6QIZ+geqxUp16nK4YL7kV4hT/eTBhpGxkD3PkgFNOkVB6Hpw4rojgKC0usAVK5gwLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790513203; c=relaxed/simple;
	bh=5T+a23aIGmK2iqABM7bsnn+JBjwEBOQqZO+RU3YCAIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TYOmCwlaCoPCaculgj8B4UW9efnJujGUk5RcXe6Mkvl5uWy5/e/T2H3QyDr4WeCIztlFF3YQ8QhoLi/qPkgDDTadl67RhLcmZlErRz6cC8mj3PT3pdEseFS3UsQwTv3zpMi8HPuj4ZKexJvAF9thCzPTLJKHZFXUaw80RocLn/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QVMk8HLh; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QVMk8HLh"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffb83bf7aso8696385e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 05:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790513197; x=1791117997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YshmIf8br7QZ8gBxtu/Vo13g09V/Sk1mprmtIBCHo2o=;
        b=QVMk8HLhJkoGlvjM1+CL0xPLSAHlQlhhLu0zcACJ3H1J8nliHJ6pgtPD8OVnvfa788
         bDao1vT5By0Y0LpmBY6pPjGhwTQ8F1MF+LmK0Z6iMxKi9EOJ4O/EMlY6ouE5PekHxGb9
         /PXwsqWfnZfh2RxeZfOQNlxriyyTHi8SK5kFf8UmRTaDlfMLZLlbepbwCNjrNIOJ1YgU
         SnGtgnAw6/TVGhdWJBk8Cueq17wTFjhN8hNu0tIYSNAtjax1lQpBWy6V5PEa81oBYMcD
         tzV4Y1uw5ZpH9oTSk6dec/GJcXt72NqdIqY3AEQHLY/Zpl/mjUugq/9p1tJ/caG9uDuc
         vdyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790513197; x=1791117997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YshmIf8br7QZ8gBxtu/Vo13g09V/Sk1mprmtIBCHo2o=;
        b=D8HUUV3KY5ENZNMaK3R90ijBI1zTxzx56xfK+H3kWvA75oiY4ugYL3hjx90xPcMGyK
         6gi+BqrSTBsjpCMz6/HC6mlpbOVvV5J/bAOimP9ni6Lros5AEsu6+SUdgotW/ymF0B9F
         6bI9SIi7kGUah3TmJnIFyvIDy9R3rqx10bCHTKaPxEQ/g8vVYVyA74iLT1IY8Npg5csV
         8Xk37nxt6oXtkuKtHjIG0lx4tRoIxsuv3hYSQABACZPsB+dUibt2CBQlUqsSFcGSoHE9
         3+5SFumj5CP1pTAqkELg5clE6RuWvfFCL5NMikc1MQ7oaxW0Mupudo2WoVtZMaPvwxgL
         oI5A==
X-Forwarded-Encrypted: i=1; AKwUvByPzuN84I6E+i6zITBN7xQZUGxsgtH2T60wL6oiXYlUwOho79cbproizUyX0XBrInTKH0MDjvv8jmUCMJQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lhuzOJ/a7zXuEzJFIYHJmxFf0Ex45k5/j6/86Z5sMwHMiNKWxE
	T9UrNMoVL1d26j5ThFBpMCweCJXd2X72OcMzZ8/8R+SzlzP7J5fSsM8j
X-Gm-Gg: AYBFou33JMmBQZ/SMcrjMIFm/al8InmiXpnUsUJdvdeRHvyLtNRwuB8Lt+KUFPFQr+k
	zQfUp0Clbj7jLbycE6O6mIAjZ+oyxXOxIg+Izrh3Elo+Hs3afGpAAbEp+MPxTXoOPtisaqeT6+d
	P+ek9CYDikrFh+d7IuiuXpZg+eTSN04ttcEmJhN8LX5A6+t83TQqiywRp1OmiqWvFN3V9dJlqRD
	3CtHDaSlParOaB2X03Qi78Bo9aQHsG4ee0bVj44U2mO7pr2548+mXhkN0oevSmgE1ubZP58DOGf
	X6SbJZxkazJQsLWBea517g3owwfMWXlJWlu2DszH7IfoCij0yZs1T+GA6lV4j0FMvuSoP+7TFdG
	gGsoRlS2ju6udglyHba3k//HorIv54xWlx9F3L/15gfxw0p4bifc64VZhPXaJRijjd3Pgui+gzZ
	VYWdB9kil8o6dqjA+U0Pq8fowsTID58Lb9WCXlNbgN4Gzd90ks1SppzEgP+LuZcjznlyXNN0/cM
	iv3BLk/m7oUngEG8YLezs3bmHuK4aNg5KZ6dGLmbwnUPBDHNzQrLQgBq9OJdqiAKDQoXQsC6g5d
	KwhTkpYoR4CLFSndBrASxQ==
X-Received: by 2002:a05:600c:4ecc:b0:4a0:174:579e with SMTP id 5b1f17b1804b1-4a001745829mr23006575e9.28.1790513197048;
        Sun, 27 Sep 2026 05:46:37 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fef60da94sm148440605e9.4.2026.09.27.05.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 05:46:36 -0700 (PDT)
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
	Daniel Baluta <daniel.baluta@nxp.com>,
	Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v3 03/12] dt-bindings: net: micrel: Fix RMII clock select property type
Date: Sun, 27 Sep 2026 14:46:18 +0200
Message-ID: <2596c9e2fd59d04abb2eb4f4abb98767d2d2ebdb.1790512621.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790512621.git.stefano.r@variscite.com>
References: <cover.1790512621.git.stefano.r@variscite.com>
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
