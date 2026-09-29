Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5695F53FD58
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790695079; cv=none; b=sRb92a049+QrFSxUNw/x9HKPFcY1Bcn3PC2z72F85fKpBD9RhlwPSzmvcOnHEYr8uV/uRhuLBk8NXz4wo4yAk+hND802eOygMIbQMp5P6t+O8vXDWMwgEH4zLCNxO+FUTKOEH6UKUAI9OwbcWGtxp5/c2PZxkLFGCIDTsk2s38w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790695079; c=relaxed/simple;
	bh=5lJ/BsrMrjUPA//hbCE/BIQ7KBCnAQZQan4mp6ZdTv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kjo2EYw+940ZHs3Yy0iXud80BPtZ5oq1qXQHU4Z2dOYOwQOINwAcYovXR75vOMknNJUX4FiHcjHw9m7Gix/lCNzJm4H33OCiY1P7CDMDdkU0XYkO6pf/ts9N0qIlXccgZIar9dExNMAlBQK7RMMXPY0N9DKVl6bmX2zomUX5hmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s88++gTu; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s88++gTu"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a00713639cso17006435e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790695068; x=1791299868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HhS8YlnsGyJ9HS0RFtDMzIqZYstk1VURk3XTCd55V0Q=;
        b=s88++gTuCfHOSqcsBOJXNn8QGM11QUwCqWbB88QsZ2YRlH/P0lS6zUrkAkm5cQZ1VY
         xY94LasuRYZ1Az+Wt5LnkxRXVZH22buD7/SdtvTujLFR+ygIQ9NICmMy+cTza4+LacoP
         S4KRaXSJX42mwNGZwGYxtxM8vXW0x+BU3RwEMp7bBMJNhpJR7y/W8yVDgaycQqxY3bAX
         1o+hfd0Boc+USOwdmCGA98DO9b89OXQM3rmnrMcoFACKz4DR/KMMSmb0FMEs7bOrkFvv
         +KVxllviOtBpNn4uc/l3BrLSg1mmTuLBtoveZ+zo5rfWP7xuJJO4ob1wHL3t3bgInvDp
         GiyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790695068; x=1791299868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HhS8YlnsGyJ9HS0RFtDMzIqZYstk1VURk3XTCd55V0Q=;
        b=tP7hNoFKJMI0485vdfIttORq8qDQNA3WP83Ey12MM0YJKNv/xgp8kAmocuSUzS0HCC
         MH/d7aQrPC3f1lgKkRpMR3AeuvpvWyiwbJZP55kFmE36sPEL3u8Lmqh1VNSCLexaEaWm
         yIZBLgAXW3dvXYPCj1EezN181n0kCE7khXHYRX5tnSIVVTbH9cY5zAThSUpt08EUSGs4
         OW2c3C2C6Tg7jtJQqboigoV2BTq80QVY5QdatZhf7YuGngUbl7SWLh1OngfkpzFbLvY4
         2x345stocq6R2gdaM6FpV6rTD5X2e8hxR4TlFtfNY5B7YTNqe5CZUwwKjXv2FwWqMEWn
         15jQ==
X-Forwarded-Encrypted: i=1; AKwUvByIfzFntsWTKdHTIr8oFfLHhSpwfplhUJdj2U3rFRlHpLjs5V8sFsdXBK1MUj3MhsFBts4H9br+aeSfsB8=@vger.kernel.org
X-Gm-Message-State: AFuF++l3f3U3lKYNLJEosqYGkcgCyGzR5BQXJAdsBcjTBhxQMuJw8xoe
	jVgpe/uXB+9HPsSPyFfZ0JnrLHAtUHASTMZUghLieQNjBA3UnKdCZr9x
X-Gm-Gg: AYBFou1dpJvcPBgypOipPngEW8ZvlzZwx9J0ZRX2rTEcce1w5u8r2ZaBdgGCs77M1sc
	21jxFa2GdwenVbiCmKl2Ndx9GpoUlgFnIPO6maFevWfXaIEotKkJ29ZALwsg3PM4K00DEzA08N2
	qo47WgMGBV4IsobM+RCqOXnEvsgosusdPR+LVqHMZXA9rdFE2AYND/4x0Hz4Eysdb95c4oVBbYZ
	0RNARqpjUBZ6aQ2oRUcY7MzdyEKV8CPVBJRgOSMiwuoC+4WVtR3v+jABBwktf47RHH8xLN2N1kJ
	EdM5OodUmdmofPqrae0LOLmdZs4hM3Txux3V4HeWslP4Jj40VWOEdnEIAqMnEXM2mcieZjqUrRM
	lfaCW6AX8xYO02k1a7P+71g/wDebi2mLu0GLoKPwxOMs6GQa49J0ym+fPcwc8+x92I/bohCGIAB
	5zknqaxEA3C48qjj95jp+zqkcA4PcqFCAjv0oss734PDy6KDP1eOM5XF4pM4tDZXGWFyhXPmPE1
	+mHT6mBiVGW+wfh99QamUfoKQTXpJTCSpPww6ya8rqZglTlnxjwi9qDCw2uI0N5nLi89EPumrrC
	LiajFVNn2od1M6CJ8D2IXQ==
X-Received: by 2002:a05:600c:8486:b0:49e:745d:c317 with SMTP id 5b1f17b1804b1-49fe66b426bmr281786245e9.12.1790695068130;
        Tue, 29 Sep 2026 08:17:48 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a013cf8402sm10313705e9.2.2026.09.29.08.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:17:47 -0700 (PDT)
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
Subject: [PATCH v4 02/13] dt-bindings: arm: fsl: Add Variscite i.MX6ULL board variants
Date: Tue, 29 Sep 2026 17:17:29 +0200
Message-ID: <075691831d4da249672c3141ab16b9e856ee42da.1790693249.git.stefano.r@variscite.com>
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

Document new VAR-SOM-6UL configurations on the already supported
Concerto carrier while retaining its legacy compatible. Add
VAR-SOM-6UL variants on Symphony and DART-6UL variants on
VAR-6ULCustomBoard.

The new compatibles identify the SoM storage, wireless and audio
options followed by the carrier, module and SoC compatibles.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - Split the board binding by SoC, extend the existing VAR-SOM-6UL
   entry with new Concerto and Symphony variants, and add DART-6UL.
 - Drop the redundant -board suffix from the new carrier compatibles
   and use sorted items/enum lists.

 .../devicetree/bindings/arm/fsl.yaml          | 39 ++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 233687131adb..9b1224091e01 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -834,9 +834,46 @@ properties:
           - const: phytec,imx6ull-pcl063        # PHYTEC phyCORE-i.MX 6ULL
           - const: fsl,imx6ull
 
+      - description: i.MX6ULL Variscite DART-6UL board variants
+        items:
+          - enum:
+              - variscite,dart-6ul-imx6ull-emmc-sd-card-6ulcustomboard
+              - variscite,dart-6ul-imx6ull-emmc-sd-card-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ull-emmc-wifi-brcm-6ulcustomboard
+              - variscite,dart-6ul-imx6ull-emmc-wifi-brcm-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ull-emmc-wifi-iw61x-6ulcustomboard
+              - variscite,dart-6ul-imx6ull-nand-sd-card-6ulcustomboard
+              - variscite,dart-6ul-imx6ull-nand-sd-card-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ull-nand-wifi-brcm-6ulcustomboard
+              - variscite,dart-6ul-imx6ull-nand-wifi-brcm-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ull-nand-wifi-iw61x-6ulcustomboard
+          - const: variscite,dart-6ul-imx6ull
+          - const: fsl,imx6ull
+
       - description: i.MX6ULL Variscite VAR-SOM-6UL Boards
         items:
-          - const: variscite,mx6ullconcerto  # Variscite VAR-SOM-6UL dev kit board
+          - enum:
+              - variscite,mx6ullconcerto  # Variscite VAR-SOM-6UL dev kit board
+              - variscite,var-som-imx6ull-emmc-sd-card-concerto
+              - variscite,var-som-imx6ull-emmc-sd-card-symphony
+              - variscite,var-som-imx6ull-emmc-sd-card-wm8731-concerto
+              - variscite,var-som-imx6ull-emmc-sd-card-wm8731-symphony
+              - variscite,var-som-imx6ull-emmc-wifi-brcm-concerto
+              - variscite,var-som-imx6ull-emmc-wifi-brcm-symphony
+              - variscite,var-som-imx6ull-emmc-wifi-brcm-wm8731-concerto
+              - variscite,var-som-imx6ull-emmc-wifi-brcm-wm8731-symphony
+              - variscite,var-som-imx6ull-emmc-wifi-iw61x-concerto
+              - variscite,var-som-imx6ull-emmc-wifi-iw61x-symphony
+              - variscite,var-som-imx6ull-nand-sd-card-concerto
+              - variscite,var-som-imx6ull-nand-sd-card-symphony
+              - variscite,var-som-imx6ull-nand-sd-card-wm8731-concerto
+              - variscite,var-som-imx6ull-nand-sd-card-wm8731-symphony
+              - variscite,var-som-imx6ull-nand-wifi-brcm-concerto
+              - variscite,var-som-imx6ull-nand-wifi-brcm-symphony
+              - variscite,var-som-imx6ull-nand-wifi-brcm-wm8731-concerto
+              - variscite,var-som-imx6ull-nand-wifi-brcm-wm8731-symphony
+              - variscite,var-som-imx6ull-nand-wifi-iw61x-concerto
+              - variscite,var-som-imx6ull-nand-wifi-iw61x-symphony
           - const: variscite,var-som-imx6ull # Variscite VAR-SOM-6UL SoM (6ULL variant)
           - const: fsl,imx6ull
 
-- 
2.47.3
