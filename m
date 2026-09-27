Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E643E3CCFAC
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 12:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790513198; cv=none; b=A2qzPhMhWe1tbHMfk8CBeesUC9mUga4f7Ph7TMMGYXwLoEIxEyNyFo5Ue62qgmqv4JXD0jZRhqPOf/HBWnxv38dOqsmFcPcjCZPzaax/wvyPdBXOKwldjDRcclJGT627UWVqEG1kUjbzUpqiR/CDOJ6EuqFDgXelqV08McawNg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790513198; c=relaxed/simple;
	bh=0w0ZDwJddlnh904r+mRuec6f89Y7DzmrUKJMyuP3GNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=blWKB2op6o+d8t7Lail7IAEHik+tZnolY+GqwLTm94O4Jq8ZV29pPhLKAClQEm6dSeaKFaMP998FbPYGTV3fMfnd1gP89XEQkiAxswxvkqkAw9XIyplqYtWX0rWsn3VbG58eXRq+glrxP0Vo4oQQuj1Pn/CnDImzKnAQ1aXXT2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rYxBWbpo; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rYxBWbpo"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so11989135e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 05:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790513194; x=1791117994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UHsv2hT/hhrQYy+V3Qgql/tn3KVUrq4/vMJj+QwfoHI=;
        b=rYxBWbpoK8Q7W9iD33Q41lIKCRdq04EDX23iuj2CFNa/8EH+ozoOLSjN80PzgAKjHV
         y6PpqMVVucoKHE60oc63T6rD5ZUFSjgpq6IGGNcA+DY78/uiE6I/ZyWe9u//d4Sh+pBQ
         mbk/R5aICerF69/iGRSVsgVuwx85BrlNsl3/Q7tyqbBA/Wabg2LXui5gnJZGu6y14DpK
         C4tIQfG9yQCCYkA//i5Fo9KiAwTBlLvbSE6DkoHA7gkxIJUhgtac1iAjEi5xS1bg4CbH
         qh9MrT/BvOEbFQsb7xnzePiOTtifF1F0BLtrxBrO4lVIrsJKyquZpmcFQ2ngnwcdqLFG
         fe8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790513194; x=1791117994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UHsv2hT/hhrQYy+V3Qgql/tn3KVUrq4/vMJj+QwfoHI=;
        b=yZF/guqh1yArKsFGXVXagth9kCKPPhj4F7KCSIdI9qVVtZh4doA7+g9Qitb9jJdZYR
         ocT/vqcqZe0zTv9vyPEFgS83mmCXpjWp8eBZXl3H9EYOt4+xSE/VpnL3kt8Px+v3+3DB
         QW2uxhRAt0UyOxIRKBAB6KwK5keY6pP2WTwSzZIq7oldwwJeLey6h7twq21WPnzcNPAr
         zXNOvYj0v1nPxdVUuU85cc+VGVg2zbzU8jpNGrar/ccOE9kLs3YImJr+5G1TklKlWzdO
         BR43sI0BvsSE5dP+yze6myAWfhQVg59TPx/UOYS0hQH2m6mrCrvOGsXHwze7H3FXfZm0
         fbsQ==
X-Forwarded-Encrypted: i=1; AKwUvBxfjtKymAgMRgJuwj9d6yV+L9+oNkcJbi4ATdr60Nbcaqkvety0QDfmGD4NwS4xasW4P5BDGs4u/kRtLQU=@vger.kernel.org
X-Gm-Message-State: AFuF++lgNeioN8dLV2LcZ/nWT5t98nK0C2Ra0gmRjB5eS4FpmNA7RRAA
	BtCrIHdgPUYRzkyfVWYZQp7eJrNM5vUM7LjmBCZFVuukYzYShFtcXdH1
X-Gm-Gg: AYBFou2yuo7QYtzdTV5f2T0N5Mlv2rg/adVsVkgYo44jIlo9eofkIytJbUeIiMaHxk3
	q64vU8+BDukz945tAgQg6ccrhWoWjvSgIARZhHl+1hnTaoO4WR8lMlxRGjob7/Gyv11EvTGX8MU
	NmMaoJFwisJLIa/U6IPDi4zpXDDKhxopQAxdlOxD2FYpENyRETwMTrA7hAP6pdgMUBIwX5Cvuic
	EKCvH5uhaGCuUS3lrfZeWIYxl5KWZuZjGUsBq101/oPncM7SzF2oqoM/0VeJtI8MpvZxGGobFk3
	iHxZ/vGMKRONgeF9TrAAkXDFh+RprsJk3MW86+CmJYOHO+1jQKesjGDFw4Z8/WK7eY7cy7mIVGa
	9WraoFZv+OiSkzxEfrPT6yFECnwMp6XwBQJoqjEfhMQWOZVT135mM5Tcp0w6aRktXWtYwI+7w/i
	KHG+6WxCUNngWMPYID6fRPbpOL2WjfABM2zGEyIjIGpQ1OTT4KOABrHJBz3yuVDphO+eRTYkqWm
	ZHOrM+/yUajhBgdzGSYcdo47oGKI8GEskx4EeIREPp4jL7/Varj+TCxwpkROjN/Xdoby7J+zw2A
	2zX3OjOpcAJjdPz06p32tg==
X-Received: by 2002:a05:600c:1c21:b0:4a0:2dd:7573 with SMTP id 5b1f17b1804b1-4a002dd77demr20084135e9.33.1790513193690;
        Sun, 27 Sep 2026 05:46:33 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fef60da94sm148440605e9.4.2026.09.27.05.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 05:46:33 -0700 (PDT)
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
Subject: [PATCH v3 01/12] dt-bindings: arm: fsl: Document Variscite i.MX6UL boards
Date: Sun, 27 Sep 2026 14:46:16 +0200
Message-ID: <a4e262cfb08153c23c80cd3098a684816993f1e9.1790512621.git.stefano.r@variscite.com>
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
