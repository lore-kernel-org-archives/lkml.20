Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448AA5678F2;
	Thu, 17 Sep 2026 14:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789653658; cv=none; b=g+Q+qjdJ/hpFi33aEawpVZN4oLUuMN6SKOTyEdLPld+nrPj6V7snppDV4baxNj+4/Iy37wUq7SWVG9WdtswzMRdUAzYv8LTAP3q+dr/9dOniDyQQozo71hncls4Y21POmFSv4jAsvzVTPiR1oHgWa0iOhANX/KhhurRMf0tZwSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789653658; c=relaxed/simple;
	bh=HjGKnLXmM/pZvSr+7lUDLroI/aE6p3IZyf8xeSRC0/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QmdFdXdrMryqi/mKTUDJ1o59ID6uK/kT9X6jOFRgtw+vgX4mo6b1ns341FeVhCW3OsFmlhs+B3sPC6QMSRONxn57WfeREuBKPHyLRJpFU9LAtY5+nGv2UsKP0FHN+tHAQow6KYE2NuAzlVS0AN9GEffOqHfpRwTezga4YQgtzEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=LQtryhQO; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="LQtryhQO"
Received: from francesco-nb.. (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id C631E227EA;
	Thu, 17 Sep 2026 16:00:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789653651;
	bh=JJ+u9N0IVMNFM/Z0N49U31h73iEiUichEwKQu4MgjTo=; h=From:To:Subject;
	b=LQtryhQODYGsTRK0Z+111hA5x+GCNYdaduOJ4eAB52xvmx1LrZ41Ly2YdHtzGTsGm
	 wZ2/cNGC+xE7ydPKkAUVJ1mupDnhZSU1Vj1EphFtRmwrnyqdR7fEwfRvTHTpvCP9Ls
	 kYb15/UsB7HN1Kv7NAsyPyhiwQn8K08loGYluaU0cA9ABUAAoo89IvNAqevgzjwBtz
	 Cwpw78UPPqvzC8ysCBYJaq6X6rSJ7rg3N92AvffjRUPKE4pSXLNTpZvdKY9KXAa5DP
	 vYN6AX6FoUkfuMos6XDOm+7lBesXlZCOdrFn4xVctfrlGCytSA779G2e5gTplKvO+X
	 LPa6hVg4orAuw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 1/4] dt-bindings: lcdif: Add endpoint bus-width property
Date: Thu, 17 Sep 2026 16:00:36 +0200
Message-ID: <20260917140042.118181-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917140042.118181-1-francesco@dolcini.it>
References: <20260917140042.118181-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The DPI output of the LCD interface can be configured with a bus width
of 16, 18, or 24 bits. Introduce a bus-width property to the output
endpoint, specifying the number of parallel RGB bits connected.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v5: add ack/rev by tags
v4: use /schemas/graph.yaml#/$defs/port-base
v3: use video-interfaces.yaml
v2: use the common bus-width property instead of the legacy interface-pix-fmt
---
 .../devicetree/bindings/display/fsl,lcdif.yaml       | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index 2dd0411ec651..89cea0c14cf1 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -68,9 +68,19 @@ properties:
     maxItems: 1
 
   port:
-    $ref: /schemas/graph.yaml#/properties/port
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
     description: The LCDIF output port
 
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml
+        unevaluatedProperties: false
+
+        properties:
+          bus-width:
+            enum: [ 16, 18, 24 ]
+
   display:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: phandle to display panel
-- 
2.47.3

