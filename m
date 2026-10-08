Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C0C3D0927
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 19:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791488420; cv=none; b=RUIGPWSOhsaznIHbpaxrJIIoZtHMzTxZPMEjsr+2a1bCuHWRNoT+MTgmpwItSgUHqXWjgs17H7vi6PbH98SD6ZhiFIyVXjjxdfDsOlZ5FApFhFOIJiyhbiIfSSsBWJJpVGuYL93RbOe2OLjvQa5tg3mSGTFpUUhw/6MRplJLsDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791488420; c=relaxed/simple;
	bh=XjUNeeMRC2ts5MdmKtrm3eVb5N5Z36fM2sJ8EfZSQaM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CvpNCxNe4PV+IvngrRSvX/GcO+QoVGtmcdvRhZ1+4QJokZ6uiIXvhbmMHJrHa8GeC8Umrvx0ZiEOOCK/Tl85mzWuvZc7Oaiglby359C6ISt0K5Z51WoxbYamuFeIMaJbWJ9i/7MhI9efc63nVvZbmzI1zj0aBVdpMnK7h0DuB0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sUvRH08f; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sUvRH08f"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so55383675e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 12:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791488416; x=1792093216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jf168IjSFgOfzHnEoVof5QzOtPwLIXW0PLzbFbqRkiE=;
        b=sUvRH08fjMys9bYnFAMAAN7wMBwgH7EPTZC+tIaqL3HGTrB/ptx3r3BT/DTvOO92fV
         u6IZW9n0/7YMONgNqjMR1p1pK2G9z7sVfDrjoHhJ5rlwnk+xR5EeShIEFbd2pKoSurA2
         nbeBlOpr1rZ8QrwsdH2pxlQFXh4kQAjSV0t2AW9tQAdizSOVThuY6iCB9Tmapez2Fkd0
         IfchSmE5mAA+cU4Sfu9OG7sttyLgLvS8XBp+tFl86u84JekAuu4QpasU58e14zCtp8oe
         cHkQM8DldEUZbgBkmb/EP409lpNVfLLOu09M02IQJE9qUlbA0AnVefYSNRyVH3F7SjYy
         cR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791488416; x=1792093216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jf168IjSFgOfzHnEoVof5QzOtPwLIXW0PLzbFbqRkiE=;
        b=Sk90GhCdRpuc6O6k73UVCufl28COHufuseVK28xl2paIUwa6Y7QhgSQnXaQJqhELot
         J8MYi0tH0EyBA+I5hgR5iQpgxKNfD+c7expXFMqkjpJtlecrPQE7AYR9iCB/vwP+sjv0
         14lCUuPT0O+AhdBM1qYmRB5SCiSSIIIH0KTuDiolVpWqDBMHqPHyMukO7VRC3LFuQgBg
         BU0YrkBFFmtZl12mEOCvRPAIGQW2P4u6NIMgtBzBRFmr/pG1EIjlg1AHdLe+/ESYVWH7
         SoQskYe00z7r17DnSUa6crlNnlsXiKuEc5zPxjofnBhS2ossDATZrAqJII5OnE6oTlRT
         NRPQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8iqBJra4iKd/IfBPW5CHJgDyx/zSS6R7M5Pr0KRhkxX2ZqODXXgG9S8Jj60Sd3IsK9FNXUkdkJBiEu/A=@vger.kernel.org
X-Gm-Message-State: AFuF++li24eF/RW7QHS6uLTZ4pB550Yxoau+RXN1YoABqTF6KAo7iddw
	4q/XfE1bwWUHnlQA9BwMV4qvYSoLOxhQmYaGUviAh3sF5tpNOD9pXzyhH3PD1zgTvXY=
X-Gm-Gg: AYBFou2cS0nzhL0e5L61HACgwj2eWcQmykYKOibHCzq6GnQ+JfoPZQ0CvhTqEd7VKoC
	Wj7x8idoXbbc9sUl5QtEI00INa6SN9nR3mcuzug9OaqdN/g2XhdhxatBaxuXOeCtMIoLOyoGaJ5
	5LN6PA5Ka4US7BxH+wz0m3hcD05YbyhDsB1VEIKdItIXZY/vDdIoizlHAcjiOCUsclewTlCr+lU
	08DqXphO4ju9fXbpLoCFubD9IfqgsRDVkY1uumjs/G4i5sA6yHmyeZLziSvxGMeuJueQ/oVKz4a
	us/d2kRynrkCTMYm4/eO+j94qwRC0cSkTvdjF1DUW7wVwCOS42x0hglDIM++hFRW7FBhMrHBMWe
	Nx7kqU8kO09r/pmeEOyS1919Z13NKDIedgI7YLeLEl4sK/b4RR8jxmF8W7BtUOFYketAzNGC6BV
	QBUJ9U9Nkid8E+xn0rLhQ43YarpsFKt9CLSZw5kK9MZRXqZ76rcryv2gjM+kBQab8dYjh5LdIDv
	WxYTb+cVQHqaDSkkRYDor4Slj/5anpJvT1v5/noYXjen2G0zMTyg8CaNw9FIszizD5mzovxG+TE
	Apy9odPtYpqNauCvRV8gxA==
X-Received: by 2002:a05:600c:8b09:b0:4a1:7ce1:2eaf with SMTP id 5b1f17b1804b1-4a180682d24mr123505435e9.34.1791488415898;
        Thu, 08 Oct 2026 12:40:15 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c1e33d2sm1419065e9.0.2026.10.08.12.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:40:15 -0700 (PDT)
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
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 01/13] dt-bindings: arm: fsl: Add Variscite i.MX6UL board variants
Date: Thu,  8 Oct 2026 21:37:41 +0200
Message-ID: <4ea26fb755799e279e195b3f8b8669c394a7f7b1.1791487179.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1791487179.git.stefano.r@variscite.com>
References: <cover.1791487179.git.stefano.r@variscite.com>
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - Collect Krzysztof Kozlowski's Reviewed-by; no binding changes.

v3->v4:
 - Split the board binding by SoC, extend the existing VAR-SOM-6UL
   entry with new Concerto and Symphony variants, and add DART-6UL.
 - Drop the redundant -board suffix from the new carrier compatibles
   and use sorted items/enum lists.

 .../devicetree/bindings/arm/fsl.yaml          | 39 ++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index c8290a83205b..f044f6fce51f 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -689,9 +689,46 @@ properties:
           - const: phytec,imx6ul-pcl063   # PHYTEC phyCORE-i.MX 6UL
           - const: fsl,imx6ul
 
+      - description: i.MX6UL Variscite DART-6UL board variants
+        items:
+          - enum:
+              - variscite,dart-6ul-imx6ul-emmc-sd-card-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-emmc-sd-card-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-emmc-wifi-brcm-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-emmc-wifi-brcm-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-emmc-wifi-iw61x-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-nand-sd-card-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-nand-sd-card-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-nand-wifi-brcm-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-nand-wifi-brcm-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ul-nand-wifi-iw61x-6ulcustomboard
+          - const: variscite,dart-6ul-imx6ul
+          - const: fsl,imx6ul
+
       - description: i.MX6UL Variscite VAR-SOM-6UL Boards
         items:
-          - const: variscite,mx6ulconcerto
+          - enum:
+              - variscite,mx6ulconcerto
+              - variscite,var-som-imx6ul-emmc-sd-card-concerto
+              - variscite,var-som-imx6ul-emmc-sd-card-symphony
+              - variscite,var-som-imx6ul-emmc-sd-card-wm8731-concerto
+              - variscite,var-som-imx6ul-emmc-sd-card-wm8731-symphony
+              - variscite,var-som-imx6ul-emmc-wifi-brcm-concerto
+              - variscite,var-som-imx6ul-emmc-wifi-brcm-symphony
+              - variscite,var-som-imx6ul-emmc-wifi-brcm-wm8731-concerto
+              - variscite,var-som-imx6ul-emmc-wifi-brcm-wm8731-symphony
+              - variscite,var-som-imx6ul-emmc-wifi-iw61x-concerto
+              - variscite,var-som-imx6ul-emmc-wifi-iw61x-symphony
+              - variscite,var-som-imx6ul-nand-sd-card-concerto
+              - variscite,var-som-imx6ul-nand-sd-card-symphony
+              - variscite,var-som-imx6ul-nand-sd-card-wm8731-concerto
+              - variscite,var-som-imx6ul-nand-sd-card-wm8731-symphony
+              - variscite,var-som-imx6ul-nand-wifi-brcm-concerto
+              - variscite,var-som-imx6ul-nand-wifi-brcm-symphony
+              - variscite,var-som-imx6ul-nand-wifi-brcm-wm8731-concerto
+              - variscite,var-som-imx6ul-nand-wifi-brcm-wm8731-symphony
+              - variscite,var-som-imx6ul-nand-wifi-iw61x-concerto
+              - variscite,var-som-imx6ul-nand-wifi-iw61x-symphony
           - const: variscite,var-som-imx6ul
           - const: fsl,imx6ul
 
-- 
2.47.3

