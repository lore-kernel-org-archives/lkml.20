Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794250092;
	b=bZXf/8n/ASErGE5rkL1g2XSgD/B6bM+Nk+f+wBbrtcdBv2qYLVUtp0G0KNggdW6MGC23
	 R+HpPULv8tOyxTigA2omNikbyVC7Q5hRvnElGfJFNNGQYAZ2q39Nv+YJDG4InpnzOaSmP
	 8c917Ort9MHOxaC4TT3F3w+LRAtRpevjGXPtwDUBuXnZo0HOINypXfAwUKnRfOFqVqJCz
	 gYC2N7IFQSIJpZo1c2D/JVdDMLLxowz3/T+RewEEkw8FQT1WLxx1d3EOKjKwZQw8vAllw
	 gHQrHnLHtuifywNEGVPIlrKjoJrvsar8JeSkZ4tupoJJbuU/lmiy7UagIp/3pE9Uuyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794250092;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wzcq643kxqzm6dmiI//QkyvyRvgf5SDiG72cWiaVszc=;
	b=ilQORwLIIG/Plu+7x8+v/PZSjM3BAiDvqZWSDmyFuUdsX0uieGIuMiQjwg1sM+WlzkLx
	 CUb9ocgZugKtl9odnVQx3/rYu+U7FFPq148MX+MmhrjYSwek/rP7XROHNQZG/CuaMhV0t
	 ekuD4Bx7/Yy82bwmiwTrS3BxX4ulm6Zah89lcM20B9kjT2wnjBEvLQMlLIFBDPYObSpDS
	 Azy+zM+6X7ewSmJA95npF2DOJix4WTkk5pw1gMJShzMKXuH1V4nkOap2NpTkIvYldrW46
	 8V7xpJIBj3q37Y4E+k64ntXjrSRdWGY5Th/9J6hxM7cqaMQdk/BrqQn/jfePAmwaLmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZwBvG3Ku;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5221606A321;
	Mon,  9 Nov 2026 18:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZwBvG3Ku
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F39181F0089F;
	Mon,  9 Nov 2026 18:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794250091;
	bh=wzcq643kxqzm6dmiI//QkyvyRvgf5SDiG72cWiaVszc=;
	h=From:To:Cc:Subject:Date;
	b=ZwBvG3Ku4ZEwKSKey17VtGpJlOGR7qSBiroi5pBDv8Aw5R1tZ2MCU/eWgnF/33DS5
	 h/zqFPVc3LQLug14ppeQv8CNu8NpLAY2BCrW4zPdB/CQ/0Bzs94BOHpadBvfwE+EU/
	 SOcbuPHL3VQouyX0LpqkU8K3pTzhsrIbX3cNouXEzVs900C3ZbuzJUcGAbxZOUTULy
	 tcOVZ8yYFL5Xu5yeijdEdnBtUBjsAulBNpkYv0OfITgqxP6nmRLYZmx07/j7w59dtp
	 fVFxaE4Is5/s6PjIETaMJOSGL6/Z2v3G4eHnueTyipoMnLHhvtS3Za2Nuqty0uefsz
	 2lsBotMH0L9Jw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andyshrk@163.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Andy Yan <andy.yan@rock-chip.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: display: rockchip: Allow single 'port' node for DP input port
Date: Mon,  9 Nov 2026 12:47:58 -0600
Message-ID: <20261109184759.467215-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Existing RK3399 users have only a single 'port' node. This was common before
connector nodes were defined. Allow for this since there are already stable
users.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../rockchip/rockchip,rk3399-cdn-dp.yaml      | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3399-cdn-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3399-cdn-dp.yaml
index 195f665970bf..425b27346132 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3399-cdn-dp.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3399-cdn-dp.yaml
@@ -63,7 +63,12 @@ properties:
     $ref: /schemas/graph.yaml#/properties/ports
 
     properties:
-      port@0:
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output of the CDN DP
+
+    patternProperties:
+      '^port(@0)?$':
         $ref: /schemas/graph.yaml#/properties/port
         description: Input of the CDN DP
 
@@ -74,13 +79,11 @@ properties:
           endpoint@1:
             description: Connection to the VOPL
 
-      port@1:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: Output of the CDN DP
-
-    required:
-      - port@0
-      - port@1
+    oneOf:
+      - required:
+          - port@0
+      - required:
+          - port
 
   power-domains:
     maxItems: 1
-- 
2.53.0

