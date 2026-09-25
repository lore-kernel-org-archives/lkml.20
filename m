Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FF9369D4A
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790345009; cv=none; b=VgcEe2Mj+uuKpfRhZucLZ+YjJYZgPQPkU9j8Y5rzc63Z24YtTYYy+6pym6dQYtZKB9ogWiyxvXrbGGPh5kavsfm+gCPCq2CO2JHb5oxKtCuU8evENK+n5dllf1K0UTn2WBCuz+ce39jB7NAztvh2ol+TCYXvzCWD54lwC7DBjhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790345009; c=relaxed/simple;
	bh=0w0ZDwJddlnh904r+mRuec6f89Y7DzmrUKJMyuP3GNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pdk72BE3JnOqjrnzO+QAHV20142bzEmWgjPDcGdouFflGxVPHOWg/lH1kSjHV3epgvHxJW7PYohEaA7XB9ay1RKs5OhALQDmybFAWiuZXqFFAoXI5/6Wwwteulevsff+rAJ7sf5IsdD0TNwJKF7nkhw0hQRbzfQdRo9RHh1+0gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oe2B8kx5; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oe2B8kx5"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b2522so816605f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 07:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790345005; x=1790949805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UHsv2hT/hhrQYy+V3Qgql/tn3KVUrq4/vMJj+QwfoHI=;
        b=Oe2B8kx5WGdje4UX1VIqB44BKWKNh9zDRC5obFGZWWegFkaXdR2Q8E4bj6qN/VVB38
         eUwo9oKRDK47OKg0TM+UsJ58Kco71Koo6EDZTb/qQaQ3+BAtDpgDSCV0L2iKOaOAemkU
         y7RssTS8VwRWe0yrWOgsjehhcL9Oe4ltcnth9cXwszHr5XeqKsBBAFrgSdigrXYlCMC3
         6WL0WoVZUZQE7axqV1vaJJ6raxU22HZTchZWYBT4ieKxVQSJk4LRz3HI1cP0aBADmR6U
         3yedtmRDpEiqyWljcqK/N02gc+t+A4LqzeZgmx6+x7w7lfYJg0FHWiLQ58234hBrXyb9
         PH+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790345005; x=1790949805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UHsv2hT/hhrQYy+V3Qgql/tn3KVUrq4/vMJj+QwfoHI=;
        b=w6OEfZF5tb+GgJrzj8HGKofgXn3t54vamAdxyJ4FvoQGI5ol/m745G8k4syBuKIuB5
         4mf0uKgmvUT5brnKKnYpEVBOOrNBv06ISro7L4LS0hnf2z//JrPc7luiTBu/sPdLMgvB
         gSi50XYeVwxWEb6PWXXoMBAMZY+WjwtrNxqzMis3jC783dD11tbBdK5uZJKymU1miMDv
         2DpLFutGRPG5WBLK9+bfVVQVwP5qQ5wcYTj8LC3BaC+kC7FKaijN4gVK/HQElFhhhQ1/
         z4LSaK7TzlQ1WkHhWHXiqx084Wsmfj8xsjvMY5C/bhwUlSOlnpNZKZNRUpPwQCzHUR+M
         geBw==
X-Forwarded-Encrypted: i=1; AKwUvBz5uNkIaJn3ZNpmrPM8jf3Fz8xKeVOn7BGf4yjX5uKlZ5LKa9DHpabiXr7u4+RTxBhSf94oWko+8lbUAGU=@vger.kernel.org
X-Gm-Message-State: AFuF++lj1g/wZ1656jA1XJyqjZ25pze5lWN7oQ5zF2ViSe2Dp8DVSvLE
	iWHdCWgMVhE8ZXUK9v+1ZPbJuJ7hQyrdsvOE4v9DkZVC09Elh6ASXwp6
X-Gm-Gg: AYBFou0YwKCSu8pil3RW56+8vpg4J/OXiLnBUPVn/TmcAfY+EjKz6JWtPpTvoJL0Eao
	4utKvJ43tgmZ9c8RgRvq8OFkGYvBfy6r8WLAxIT3Nef87cNTqp4eMX5Wg/9UVEJ4nzFfRkHljVV
	OXboxrB8xuJ4hdt9IzaZ+06lCdPbvRyi48+Txxx1sRh314aJO8w82F1v5+LP6gg6h4Tz9JJQ7ix
	maE4Ea25MTfaMiErQQejyspYrKjn+a6zwz2Vbxnc4Ck0mQ+EEjeg9DxIx/dDXrHpECzJHbGh27p
	7kmKGPreDGw0eiLabLK6QflpXWdAmfWVOiPPLb2FuWcziCt5A4GQofgaU9osIToD/8uWOWFuGl/
	Kb451tW4FaGEO/XGQ9I5+Ec9Ae/zoRqlBOzh7svxoGuvcajV4oi+Xff6vtwziGg0jIopJhGCoxe
	tMrGhFviZgce+znkZ/ZaYxkrWxkEp5lwLJizEkDyoWQ/jSRpF36zJj/ldf5882g52Hs62JErMWL
	RQWtC78JalkMq/7abPMDdibuSjTmGBUCCvAGAsr8kwBzRbBeqHvxS3XJRd2iJDDHo8hMOxAYA/n
	+Ammuo5PRBdM/3BrwlFd8w==
X-Received: by 2002:a05:6000:2508:b0:486:e9ab:2b88 with SMTP id ffacd0b85a97d-488716ccc3fmr11279586f8f.24.1790345004619;
        Fri, 25 Sep 2026 07:03:24 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a355c65sm7522431f8f.19.2026.09.25.07.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 07:03:24 -0700 (PDT)
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
Subject: [PATCH v1 01/11] dt-bindings: arm: fsl: Document Variscite i.MX6UL boards
Date: Fri, 25 Sep 2026 16:02:18 +0200
Message-ID: <2174558b519394111c2cdb7986aafcd6f151c5f3.1790344389.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790344389.git.stefano.r@variscite.com>
References: <cover.1790344389.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Document the existing VAR-SOM-6UL Concerto compatibles and the new
VAR-SOM-6UL and DART-6UL board variants based on i.MX6UL, i.MX6ULL
and i.MX6ULZ.

Add specific compatibles for the storage, wireless, audio and
carrier combinations while retaining the legacy Concerto strings.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../devicetree/bindings/arm/fsl.yaml          | 148 ++++++++++++++++--
 1 file changed, 138 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 36e28e0e4ad9..726d563d1482 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -688,11 +688,51 @@ properties:
           - const: phytec,imx6ul-pcl063   # PHYTEC phyCORE-i.MX 6UL
           - const: fsl,imx6ul
 
-      - description: i.MX6UL Variscite VAR-SOM-6UL Boards
-        items:
-          - const: variscite,mx6ulconcerto
-          - const: variscite,var-som-imx6ul
-          - const: fsl,imx6ul
+      - description: i.MX6UL Variscite VAR-SOM-6UL and DART-6UL Boards
+        oneOf:
+          - items:
+              - enum:
+                  - variscite,mx6ulconcerto
+                  - variscite,var-som-imx6ul-emmc-sd-card-wm8731-concerto-board
+                  - variscite,var-som-imx6ul-emmc-sd-card-concerto-board
+                  - variscite,var-som-imx6ul-emmc-wifi-brcm-wm8731-concerto-board
+                  - variscite,var-som-imx6ul-emmc-wifi-brcm-concerto-board
+                  - variscite,var-som-imx6ul-emmc-wifi-iw61x-concerto-board
+                  - variscite,var-som-imx6ul-nand-sd-card-wm8731-concerto-board
+                  - variscite,var-som-imx6ul-nand-sd-card-concerto-board
+                  - variscite,var-som-imx6ul-nand-wifi-brcm-wm8731-concerto-board
+                  - variscite,var-som-imx6ul-nand-wifi-brcm-concerto-board
+                  - variscite,var-som-imx6ul-nand-wifi-iw61x-concerto-board
+              - const: variscite,var-som-imx6ul
+              - const: fsl,imx6ul
+          - items:
+              - enum:
+                  - variscite,var-som-imx6ul-emmc-sd-card-wm8731-symphony-board
+                  - variscite,var-som-imx6ul-emmc-sd-card-symphony-board
+                  - variscite,var-som-imx6ul-emmc-wifi-brcm-wm8731-symphony-board
+                  - variscite,var-som-imx6ul-emmc-wifi-brcm-symphony-board
+                  - variscite,var-som-imx6ul-emmc-wifi-iw61x-symphony-board
+                  - variscite,var-som-imx6ul-nand-sd-card-wm8731-symphony-board
+                  - variscite,var-som-imx6ul-nand-sd-card-symphony-board
+                  - variscite,var-som-imx6ul-nand-wifi-brcm-wm8731-symphony-board
+                  - variscite,var-som-imx6ul-nand-wifi-brcm-symphony-board
+                  - variscite,var-som-imx6ul-nand-wifi-iw61x-symphony-board
+              - const: variscite,var-som-imx6ul
+              - const: fsl,imx6ul
+          - items:
+              - enum:
+                  - variscite,dart-6ul-imx6ul-emmc-sd-card-wm8731-6ulcustomboard
+                  - variscite,dart-6ul-imx6ul-emmc-sd-card-6ulcustomboard
+                  - variscite,dart-6ul-imx6ul-emmc-wifi-brcm-wm8731-6ulcustomboard
+                  - variscite,dart-6ul-imx6ul-emmc-wifi-brcm-6ulcustomboard
+                  - variscite,dart-6ul-imx6ul-emmc-wifi-iw61x-6ulcustomboard
+                  - variscite,dart-6ul-imx6ul-nand-sd-card-wm8731-6ulcustomboard
+                  - variscite,dart-6ul-imx6ul-nand-sd-card-6ulcustomboard
+                  - variscite,dart-6ul-imx6ul-nand-wifi-brcm-wm8731-6ulcustomboard
+                  - variscite,dart-6ul-imx6ul-nand-wifi-brcm-6ulcustomboard
+                  - variscite,dart-6ul-imx6ul-nand-wifi-iw61x-6ulcustomboard
+              - const: variscite,dart-6ul-imx6ul
+              - const: fsl,imx6ul
 
       - description: Kontron BL i.MX6UL (N631X S) Board
         items:
@@ -797,11 +837,51 @@ properties:
           - const: phytec,imx6ull-pcl063        # PHYTEC phyCORE-i.MX 6ULL
           - const: fsl,imx6ull
 
-      - description: i.MX6ULL Variscite VAR-SOM-6UL Boards
-        items:
-          - const: variscite,mx6ullconcerto  # Variscite VAR-SOM-6UL dev kit board
-          - const: variscite,var-som-imx6ull # Variscite VAR-SOM-6UL SoM (6ULL variant)
-          - const: fsl,imx6ull
+      - description: i.MX6ULL Variscite VAR-SOM-6UL and DART-6UL Boards
+        oneOf:
+          - items:
+              - enum:
+                  - variscite,mx6ullconcerto
+                  - variscite,var-som-imx6ull-emmc-sd-card-wm8731-concerto-board
+                  - variscite,var-som-imx6ull-emmc-sd-card-concerto-board
+                  - variscite,var-som-imx6ull-emmc-wifi-brcm-wm8731-concerto-board
+                  - variscite,var-som-imx6ull-emmc-wifi-brcm-concerto-board
+                  - variscite,var-som-imx6ull-emmc-wifi-iw61x-concerto-board
+                  - variscite,var-som-imx6ull-nand-sd-card-wm8731-concerto-board
+                  - variscite,var-som-imx6ull-nand-sd-card-concerto-board
+                  - variscite,var-som-imx6ull-nand-wifi-brcm-wm8731-concerto-board
+                  - variscite,var-som-imx6ull-nand-wifi-brcm-concerto-board
+                  - variscite,var-som-imx6ull-nand-wifi-iw61x-concerto-board
+              - const: variscite,var-som-imx6ull
+              - const: fsl,imx6ull
+          - items:
+              - enum:
+                  - variscite,var-som-imx6ull-emmc-sd-card-wm8731-symphony-board
+                  - variscite,var-som-imx6ull-emmc-sd-card-symphony-board
+                  - variscite,var-som-imx6ull-emmc-wifi-brcm-wm8731-symphony-board
+                  - variscite,var-som-imx6ull-emmc-wifi-brcm-symphony-board
+                  - variscite,var-som-imx6ull-emmc-wifi-iw61x-symphony-board
+                  - variscite,var-som-imx6ull-nand-sd-card-wm8731-symphony-board
+                  - variscite,var-som-imx6ull-nand-sd-card-symphony-board
+                  - variscite,var-som-imx6ull-nand-wifi-brcm-wm8731-symphony-board
+                  - variscite,var-som-imx6ull-nand-wifi-brcm-symphony-board
+                  - variscite,var-som-imx6ull-nand-wifi-iw61x-symphony-board
+              - const: variscite,var-som-imx6ull
+              - const: fsl,imx6ull
+          - items:
+              - enum:
+                  - variscite,dart-6ul-imx6ull-emmc-sd-card-wm8731-6ulcustomboard
+                  - variscite,dart-6ul-imx6ull-emmc-sd-card-6ulcustomboard
+                  - variscite,dart-6ul-imx6ull-emmc-wifi-brcm-wm8731-6ulcustomboard
+                  - variscite,dart-6ul-imx6ull-emmc-wifi-brcm-6ulcustomboard
+                  - variscite,dart-6ul-imx6ull-emmc-wifi-iw61x-6ulcustomboard
+                  - variscite,dart-6ul-imx6ull-nand-sd-card-wm8731-6ulcustomboard
+                  - variscite,dart-6ul-imx6ull-nand-sd-card-6ulcustomboard
+                  - variscite,dart-6ul-imx6ull-nand-wifi-brcm-wm8731-6ulcustomboard
+                  - variscite,dart-6ul-imx6ull-nand-wifi-brcm-6ulcustomboard
+                  - variscite,dart-6ul-imx6ull-nand-wifi-iw61x-6ulcustomboard
+              - const: variscite,dart-6ul-imx6ull
+              - const: fsl,imx6ull
 
       - description: i.MX6ULL Boards with Toradex Colibri iMX6ULL Modules
         items:
@@ -870,6 +950,54 @@ properties:
           - const: fsl,imx6ull # This seems odd. Should be last?
           - const: fsl,imx6ulz
 
+      - description: i.MX6ULZ Variscite VAR-SOM-6UL and DART-6UL Boards
+        oneOf:
+          - items:
+              - enum:
+                  - variscite,var-som-imx6ulz-emmc-sd-card-wm8731-concerto-board
+                  - variscite,var-som-imx6ulz-emmc-sd-card-concerto-board
+                  - variscite,var-som-imx6ulz-emmc-wifi-brcm-wm8731-concerto-board
+                  - variscite,var-som-imx6ulz-emmc-wifi-brcm-concerto-board
+                  - variscite,var-som-imx6ulz-emmc-wifi-iw61x-concerto-board
+                  - variscite,var-som-imx6ulz-nand-sd-card-wm8731-concerto-board
+                  - variscite,var-som-imx6ulz-nand-sd-card-concerto-board
+                  - variscite,var-som-imx6ulz-nand-wifi-brcm-wm8731-concerto-board
+                  - variscite,var-som-imx6ulz-nand-wifi-brcm-concerto-board
+                  - variscite,var-som-imx6ulz-nand-wifi-iw61x-concerto-board
+              - const: variscite,var-som-imx6ulz
+              - const: fsl,imx6ull
+              - const: fsl,imx6ulz
+          - items:
+              - enum:
+                  - variscite,var-som-imx6ulz-emmc-sd-card-wm8731-symphony-board
+                  - variscite,var-som-imx6ulz-emmc-sd-card-symphony-board
+                  - variscite,var-som-imx6ulz-emmc-wifi-brcm-wm8731-symphony-board
+                  - variscite,var-som-imx6ulz-emmc-wifi-brcm-symphony-board
+                  - variscite,var-som-imx6ulz-emmc-wifi-iw61x-symphony-board
+                  - variscite,var-som-imx6ulz-nand-sd-card-wm8731-symphony-board
+                  - variscite,var-som-imx6ulz-nand-sd-card-symphony-board
+                  - variscite,var-som-imx6ulz-nand-wifi-brcm-wm8731-symphony-board
+                  - variscite,var-som-imx6ulz-nand-wifi-brcm-symphony-board
+                  - variscite,var-som-imx6ulz-nand-wifi-iw61x-symphony-board
+              - const: variscite,var-som-imx6ulz
+              - const: fsl,imx6ull
+              - const: fsl,imx6ulz
+          - items:
+              - enum:
+                  - variscite,dart-6ul-imx6ulz-emmc-sd-card-wm8731-6ulcustomboard
+                  - variscite,dart-6ul-imx6ulz-emmc-sd-card-6ulcustomboard
+                  - variscite,dart-6ul-imx6ulz-emmc-wifi-brcm-wm8731-6ulcustomboard
+                  - variscite,dart-6ul-imx6ulz-emmc-wifi-brcm-6ulcustomboard
+                  - variscite,dart-6ul-imx6ulz-emmc-wifi-iw61x-6ulcustomboard
+                  - variscite,dart-6ul-imx6ulz-nand-sd-card-wm8731-6ulcustomboard
+                  - variscite,dart-6ul-imx6ulz-nand-sd-card-6ulcustomboard
+                  - variscite,dart-6ul-imx6ulz-nand-wifi-brcm-wm8731-6ulcustomboard
+                  - variscite,dart-6ul-imx6ulz-nand-wifi-brcm-6ulcustomboard
+                  - variscite,dart-6ul-imx6ulz-nand-wifi-iw61x-6ulcustomboard
+              - const: variscite,dart-6ul-imx6ulz
+              - const: fsl,imx6ull
+              - const: fsl,imx6ulz
+
       - description: i.MX7S based Boards
         items:
           - enum:
-- 
2.47.3

