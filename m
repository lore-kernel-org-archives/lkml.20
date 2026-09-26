Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B669642DA3D
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 11:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790420758; cv=none; b=gyusKzvXXzruT/e5FNAnmTe+LWv+J4pupJ3orIpF35pCMV8VyTEGaeCBszAvGUAZageHIB5q0MIjd65HOm3Ys157vJ1YyYlY/1ZJKwZl8rP8UAeBvanFdzFCP11qzLawpvhNZHtxXYRgQ71eBDksDnSPu8bjAPz883JdQDPRZbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790420758; c=relaxed/simple;
	bh=GSQ3hDWXYSkg8hP0PKeLVBE+MKKwYtIsOLRtw6mZj1g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sk8XI3Ni0h9OOCdyiPezG5dv8hhQLgl5H+1qSRAHQ7IE1J09gbx3dqQ+TOdTYx62mnVMEhr6BLbvYhAkWIiH8LQw4ajQ7Z/Izq3Dvv7WvKG11woF9Hb441cOJVAxkE1NxZTzzv074qELtzu7/vrNjzq9IfNOIlpzjtSQKTb4yH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tFoyomxk; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tFoyomxk"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3920so12264235e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 04:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790420754; x=1791025554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OuCfL206+SFfyH6z1qMo483rq8R+i1flYwR2z4BngNg=;
        b=tFoyomxkYwlGVcfK5MuDvJ286EgJ+Q3RLQJMLiO0OC01z2J5Nm0NUBgViudmij/tFV
         LgbUzwU2ieTnlgOJ+HhIkJDwGscMWdu2dA0JjuRseedJE3FMtciG3QkzMW0zmQk2Aqq4
         0WZd4iUSkcaiBYlWE8YbCn1/IQrSg9mujtwWcxWDRXh+h7BwGFIKhqhAyUH5tRZ+AftT
         3bFw+MR0jsdoc5XPFSRJrQHMDAKufaJOUzlrBho8GSH7TkvzkRj+ijMKWEta2M8TTNS8
         C4q+LfDCwcg5hKuUWp3ULKwRVaUWNWIjdiqn1T8PqY9CV1DoTYKt5nwaEcMDglX5Ja8J
         oxhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790420754; x=1791025554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OuCfL206+SFfyH6z1qMo483rq8R+i1flYwR2z4BngNg=;
        b=oW00Sjj7tEZMvkgcu/5ZpMCg0u/9U/F4IL7tG0TH5wSfo368aMYTUwXzk2M0VQ3Xkq
         cvWTKTgsFWRVNH32B79S7Fj6uQo7aIRdN8nmWsqeqQqWAH+RtzeqhDG+bl9++Xvv5Cte
         XnZ+gf7LA9ojt3biQVpmicJrMX3aOlCksMWRJ/Q4JujuP/qDpuanwj3GyrGHZ2nAUvzX
         ebcCmY/j3v5Z/+LMbbNEY9j+KBo1NlgJAdI4DMYmeoNXwKMjcK38/t69wZmqmKV9XACz
         exeG5oN/XCHpjdQ3RnA1cMg7mW7dwZZs/yrhPKUpnS9uxvS29MFaRXY3JUrg4CtKjevX
         fbmw==
X-Forwarded-Encrypted: i=1; AKwUvBx0wMkU4MRQmJkkVQQ0YloqqydR/uTU7UOYdA2aKgZmKb/18w9diWhH7MMbWlVtEKhJ8CD6JVS247C9us4=@vger.kernel.org
X-Gm-Message-State: AFuF++maNhWZ4T1tjSxeOyFNmO+mlCe03waogDJgOdt6ldQlg0ZAnQ3Y
	zePyiLxFWqlZzBedjc5OxeBP23nC6oKdwyWifCKiB2Z92In8R+D/rV9ijuYrg2FQPsU=
X-Gm-Gg: AYBFou2vQSMPY8tx25M6+R06+7CQj3DcOG3NmdUv1ou443T7p+Afh/FzdZVKvhGwuNp
	15q6t6el2/K+Ce0P0JE541ueS+wrX6CuId9J1Dcl19AiF72hg+ieB6dy32mQBhhCcCI7/UgDva9
	tIxWdeB9oR1a/IWPXei7Bcg4w0Rl0w10ralo6xCjh7GRCV9pyGP6Uc13C5O03G241atleNUhQh7
	J+oVj6ZDwnrZCE+g1XbnZihS/MU3DEJBrVmrzH5XxznitVawevRCqXlhUrpUj4FIPG7F4FGimTJ
	y3k3QHEbfUFEO/KfV75pn4kMxEVYM05i78ieuQWbgbW1/3Ahub2lq5uWIoDu4k0uVAOuhXTMZJL
	tXQs5/7JC9+qijicI6JtB0IiSO/ymmTPWzAoCBFX/PBS1NCBbd2VO+olkoYjNnFIQu+yRHPAwtk
	jLsGANLGNZqSo7ihSMkJakIDfOHZC//IzSG7k0xfDmdombVeSTDEe1mPnrvW0tH2le2eQAucPo0
	qiWOTiCQeUPNt/oFbaWdL10Y4kz2QLtms4T6fnteKHuMzReUJTRR2K08qC/9cIXlCKbugd23FCP
	tajIFxZMuipgY787rVAWIQ==
X-Received: by 2002:a05:600c:4754:b0:49c:c96a:d36b with SMTP id 5b1f17b1804b1-49fe66d1663mr148201725e9.12.1790420753924;
        Sat, 26 Sep 2026 04:05:53 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a64f795sm12124664f8f.31.2026.09.26.04.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 04:05:53 -0700 (PDT)
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
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v2 02/11] dt-bindings: net: micrel: Fix RMII clock select property type
Date: Sat, 26 Sep 2026 13:05:30 +0200
Message-ID: <6580cb8231c0ccada44d3e510374f6c21b65d283.1790413032.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790413032.git.stefano.r@variscite.com>
References: <cover.1790413032.git.stefano.r@variscite.com>
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
v1->v2:
 - 

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

