Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3C253ECE4
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790695082; cv=none; b=gyR0KaX01YEObUBT1+2qKoM3YyRslTcMc1Q9C355OuG8PirSeTVkydCKVMBrUS9jOOiXIGo6RUY+8uWI/k3WbOVA6d0uEQ1BVTD0QEwY1oyzb8NJUjHKniDjWDBzX/FjSSsjmfqwBIpgNHOpZycEC+6xhtnBgIKq8os2S1UOkYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790695082; c=relaxed/simple;
	bh=G6XcWLt9W/5WDaZoUK2UZH2AziJLt/KqfJMUg1KtHrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XHu46cca8XZ8JK/glK5O2dHUxEg/pPj61liXoMcJKSGj1spiINHDKzMOrwIxMtdEU7H1M5cJ0QrOgUNF4NUTq3D5wMibCx68x0jqLpZ/XibOjgq/2iETunb5AiH3mi/v0N7nHAHeO/wlK/iNW/8hYtZFO+qBdPyTiHtm5VaOw0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dKYBcH43; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dKYBcH43"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffe281cb1so19958735e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790695070; x=1791299870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X/wcOHMEVWVR3p6oq6xv8OGP6miSv6dtFwXxohtxDzw=;
        b=dKYBcH430Ni41p7Orn0RKODRmn/vH/LezrNZhO5anMA3JEXtmCWTkyxCq3X2kC/eiW
         /IAqGxe04orBxsBV7V3lsIUyHc3d5njREPWxSfWpi+8Xld2XF1V9/8HQSeFnmTIpdWz2
         CGC9JQUBufzzHc1XABjYqvrRrU22TrG58VOkYX18Qzn1lEqOqtI18GLSpkLi9Xx+zT3J
         62aNM0Pb1xKlbhP46w9g6HqFA5Ks3OQ12vETEnhXI5pgMKVlCpOVBN4M3U/5UnIQu/Jz
         hLsj6+kXFFRs/IdS2Osd2XsxJ4cuhb5rXqakLjIHL0l2YvE/N9CmhFKEdhE1XR79Dcc8
         V9mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790695070; x=1791299870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X/wcOHMEVWVR3p6oq6xv8OGP6miSv6dtFwXxohtxDzw=;
        b=yQJWyQWHpLxGuvtUGnxzeSB79UlvPJMpSw8tQ8qzVQbPAlJymQbIN+roJwXd3i8Zuc
         PFtsytyaQVNzG+psmH18mPc6XPNYNLXJweVW0Ou9jUFOSB5xMCmG0ljsHAUI1aIQbR6+
         Wj6jX14NBJMRC0fzA8kZnt6GITYmZs+WPL+joaqn9STj4D36u0CQSFiL0cs79nNgb4An
         7mbVRbYlPpIU/jFAswrWsPIF6uK3Icz0J2CIIlIb8dWWV7eXtdZp5rS0MUJDgYM5S3Ch
         sd8aG09XyVseUGlPQDzaRj666nQlThTGQi0SNLONj82/08v4/+wSF9YXbPgPDQ/cqaBg
         jeoA==
X-Forwarded-Encrypted: i=1; AKwUvBxAzFK2MZJxGjKMNEVQrqDVKE23M0D3Ba0E/7cfq0aLiooe8n/EUXKmlIt5jcrw+mCoMy+0GQSJ0lSBx4g=@vger.kernel.org
X-Gm-Message-State: AFuF++nngGKcqwQSIaG/aUWqhIf3d8jKmSV6cFEaarkjIXSUHIaznxSX
	VatOXbVW9n1N8zVrJGb2kCe7HuoEbH0Tk31Uv9+tSfJDbvJlWJoLs/SL
X-Gm-Gg: AYBFou0fJs8wweJ13Dtl+pt74bYVnScOv/8By94UsE0riOkFYi5NoecDmDaLu0BLbf6
	KoJAZi2uiTVW9RxFK7qUQJMU2eKEkDZRrtPCo1wm1cCzmIkng7hrmZ5z2JxXx6+BRx5WTDYAgg9
	No1guzH3aGJNFxTnRYL7uHb0Bag+y6tnq5pgyyd3ycGYgcLGF+SCj8Ai+oRlcjwQ6YduWhmzDYs
	ZmLRiG9G4sa3B9+PgdJKytmYLyulec7L2au+TKXjtC1Lf2sgHdeM7Ap64uWcwOkyl5OMXkPFHN9
	s9wfPri2nw4aShzvMcek1/MZfC3bLSnvpjHMZTpMSrtT7d/4iUZtGCKEV84sjRzpAM2FHQhiqaW
	xJ5QaWhMTuhxnARzScICnqGKesYLKofoGc4ivDgQ+BZhv7C64zUJSUvqGMysUIHdU39JPNpDiwB
	VNgKmyy819LqFlOq5JWuyQBvpac5pKccdc6BM8wDV+dAA+fWE0sB0ZQ02q/crR2Wqb5ZFI/m5+S
	guPV7ur9xTn27wbnQd3x7vQO5VO6/jO2CSQJqOECPPaBxO9ndMuYU/e9iFASYLUIV0HPMpJpxDO
	1YvTdiVfn0ayGnNx/0h5UG2W4/UMqb1a
X-Received: by 2002:a05:600c:8518:b0:49f:d325:9912 with SMTP id 5b1f17b1804b1-49ff06bcd79mr215836965e9.10.1790695069866;
        Tue, 29 Sep 2026 08:17:49 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a013cf8402sm10313705e9.2.2026.09.29.08.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:17:49 -0700 (PDT)
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
Subject: [PATCH v4 03/13] dt-bindings: arm: fsl: Add Variscite i.MX6ULZ board variants
Date: Tue, 29 Sep 2026 17:17:30 +0200
Message-ID: <1e6f9e01bd9e0e0801b18ddc9eb44bde200ea984.1790693249.git.stefano.r@variscite.com>
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

Document VAR-SOM-6UL configurations on the Concerto and Symphony
carriers and DART-6UL configurations on VAR-6ULCustomBoard with
i.MX6ULZ.

The compatibles identify the SoM storage, wireless and audio options
followed by the carrier, module and SoC compatibles.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - Split the board binding by SoC and add separate VAR-SOM-6UL and
   DART-6UL entries for i.MX6ULZ.
 - Drop the redundant -board suffix from new Concerto and Symphony
   compatibles and use sorted items/enum lists.

 .../devicetree/bindings/arm/fsl.yaml          | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 9b1224091e01..42d12624c1db 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -944,6 +944,50 @@ properties:
           - const: fsl,imx6ull # This seems odd. Should be last?
           - const: fsl,imx6ulz
 
+      - description: i.MX6ULZ Variscite DART-6UL board variants
+        items:
+          - enum:
+              - variscite,dart-6ul-imx6ulz-emmc-sd-card-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-emmc-sd-card-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-emmc-wifi-brcm-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-emmc-wifi-brcm-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-emmc-wifi-iw61x-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-nand-sd-card-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-nand-sd-card-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-nand-wifi-brcm-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-nand-wifi-brcm-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ulz-nand-wifi-iw61x-6ulcustomboard
+          - const: variscite,dart-6ul-imx6ulz
+          - const: fsl,imx6ull
+          - const: fsl,imx6ulz
+
+      - description: i.MX6ULZ Variscite VAR-SOM-6UL board variants
+        items:
+          - enum:
+              - variscite,var-som-imx6ulz-emmc-sd-card-concerto
+              - variscite,var-som-imx6ulz-emmc-sd-card-symphony
+              - variscite,var-som-imx6ulz-emmc-sd-card-wm8731-concerto
+              - variscite,var-som-imx6ulz-emmc-sd-card-wm8731-symphony
+              - variscite,var-som-imx6ulz-emmc-wifi-brcm-concerto
+              - variscite,var-som-imx6ulz-emmc-wifi-brcm-symphony
+              - variscite,var-som-imx6ulz-emmc-wifi-brcm-wm8731-concerto
+              - variscite,var-som-imx6ulz-emmc-wifi-brcm-wm8731-symphony
+              - variscite,var-som-imx6ulz-emmc-wifi-iw61x-concerto
+              - variscite,var-som-imx6ulz-emmc-wifi-iw61x-symphony
+              - variscite,var-som-imx6ulz-nand-sd-card-concerto
+              - variscite,var-som-imx6ulz-nand-sd-card-symphony
+              - variscite,var-som-imx6ulz-nand-sd-card-wm8731-concerto
+              - variscite,var-som-imx6ulz-nand-sd-card-wm8731-symphony
+              - variscite,var-som-imx6ulz-nand-wifi-brcm-concerto
+              - variscite,var-som-imx6ulz-nand-wifi-brcm-symphony
+              - variscite,var-som-imx6ulz-nand-wifi-brcm-wm8731-concerto
+              - variscite,var-som-imx6ulz-nand-wifi-brcm-wm8731-symphony
+              - variscite,var-som-imx6ulz-nand-wifi-iw61x-concerto
+              - variscite,var-som-imx6ulz-nand-wifi-iw61x-symphony
+          - const: variscite,var-som-imx6ulz
+          - const: fsl,imx6ull
+          - const: fsl,imx6ulz
+
       - description: i.MX7S based Boards
         items:
           - enum:
-- 
2.47.3
