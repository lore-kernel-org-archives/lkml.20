Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D79485CDE
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 19:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791488424; cv=none; b=DsuTAzrIM1sDz7JPkgfQ0/6DsUUKRUY0+go1MBZ2lkfoqfCXeDHLPgmnP+xBo4Tbwa5xgiAHm9vYrxnkf7yiwNJdThPPlQNTVjQb3MQEd9a8GN7puuFo2ofmxz2c2FPpZpnaCiWVjD+z/w1jwMrvqwTMoE0emFSeKZenn/Q7w7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791488424; c=relaxed/simple;
	bh=yeElXe5PuqMK9cXSg0q/mdekpBfVZljUalhMY591reQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a7dpclhjyKnaDF2R3AWm6n7fz5HhDakAv1enyVXYuUOcfZaHf5TDtoSH1aGC6B6MzNODP1NYiubM9VOLkOzd/Jtw/45bXUim4fKHrN2pmZwcQj7cRDlUL6t/+F3BilREKHQX1X8E6yaC8KQx5dorwrXktfUX4d10LXB3pjLMX/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pyd/4jSa; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pyd/4jSa"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so65008175e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 12:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791488418; x=1792093218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ne6jQNHZSute3MOl6uhvR02t4ZAiYz3hjPWK7wQg7Q=;
        b=pyd/4jSaZHAySJcbaHbEyrsbhAurgXUMUiMctnQ35u+yeR5aaD+KRIf1Hp2KqsHwsF
         MP+1m9O9TtqfrlkLg66y+jj8Hj8oD+z6hMugo6YbcjO1RIJHOvbbBhQK+xkgEGfas3QS
         8XxoRuZZWieZWdPyzdvx/PcUkWYjTTepEMBD4mYP5skwUWHjUGm/2fDXff8DxOHLLC4i
         LaRGzwq/Ogej9mwpN8jFmZgqNsIaW6YNu0OQrhOQy47VXTe0PGjbpTIUEJS0cTQY+b2A
         zrjD44ilFdKlpOJuvKF6XH2kA6OVCGADDPMZVc7tewyhzSOvXOoUY5GyfrlVErJ5cJTS
         7Rtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791488418; x=1792093218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1ne6jQNHZSute3MOl6uhvR02t4ZAiYz3hjPWK7wQg7Q=;
        b=GqB4ePz8XMO1GVFU5JcIX4ENLhMXByT532zf6eSiiTYoNgdTG7+K0e5nelTQ2nemIV
         22+axY4nFeUxZoX11u2qvkQSbzoVdscYCF4R5bh1yIWRR7xyymhfiai3JXZAdXC0IPqa
         C4+U+pUz36Zbhd2j+mm9M47av/UPNLzRVtn8K1K7LBQfQTYD05seTwo3zFbVL6x0Mb3X
         T4oasTeHU8OIuYMr0dMBMyLHTtJKpT1iu/nYW7kvqv8NWWeO2pw6C9pE4F+MFD4lzI+n
         gIsWy2sFZDqniLU/+MPg4eqSaSIsoomhPd/8A9OkHenWrW3OrFjqks4lCzCGUyeAWgvq
         kgYQ==
X-Forwarded-Encrypted: i=1; AKwUvBz82KRbV7IYHPDLHlajOEp3gUennMtuUeNLXUZcnaxntfSFEWEAi0SvHYV2lu50T446YKsdMvafebRa3QA=@vger.kernel.org
X-Gm-Message-State: AFuF++nRYok4f0T5RrPSUf+fT2SEclpv806OJV/ylBJ3hPnno9gTvNQh
	u7JlPKsw1Cqb2XuA6bSHJV91l91KEJK8fiNujw/0HCBOKPIT/KLd+idh
X-Gm-Gg: AYBFou22R0OWaQ7O/5ofB5v0d/hPnFC4MOoR4XyEBzZuCEHokUDq5zWoV739TwEHSWe
	+l8PSVski7OdcyMb//kETOstJ3Hc5UnbPtahlkUvZi+91b/t3FbMnY3OhIy3MURO03cGbGhMCiI
	0KzxC/fb3Ih1DBrjquGu9RKj8M7o8eF6jHcOUz6PRVp7m9NbvKbMwbNDJov9Oq9/lLflh/R1+Ik
	q38azj8iRwITm+AUZ3w5IO+aCfh2ENQc3um2OxTCwQkQgDiGMSUKSjJNZbHeQVuHjRQTR+DrPp9
	+wh5CwI/fh2CvqGW5xo979XmUzmBcnWRW0CSKxqUPRwbNvD3sHAMnjoSwq5RzPpg6chB5ZfIaK2
	CuB8Uf7sLEzoFtMoA0Cyi2Br9cW9M7o5wUPIPIpI+vdIiIRy4qXNDYvCbw5R2Zds5oI+XwneP5G
	iTEmy9VrypVIogEh0UVxjqgpj4YSlpH2t0Iy87Mq02rZk8pce1Njhj9D/J3+75P+tFuaI04c88e
	vTk/KgzqT9KFRwyKodAQX/tjWOPk7oJjiCfM2x5DPOvE5i7lBtT3uYhyHZgcVQTiORqRIpYe5Wt
	A/cR/AxbcD0wXxTpOgb7Eg==
X-Received: by 2002:a05:600c:5391:b0:49f:cbf1:e77b with SMTP id 5b1f17b1804b1-4a1802eab67mr140228155e9.10.1791488417829;
        Thu, 08 Oct 2026 12:40:17 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c1e33d2sm1419065e9.0.2026.10.08.12.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:40:17 -0700 (PDT)
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
Subject: [PATCH v5 02/13] dt-bindings: arm: fsl: Add Variscite i.MX6ULL board variants
Date: Thu,  8 Oct 2026 21:37:42 +0200
Message-ID: <e5f0dc2bdf5574c907c0efdc8b5b9974a32e2cbf.1791487179.git.stefano.r@variscite.com>
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
index f044f6fce51f..ca6778b8777f 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -835,9 +835,46 @@ properties:
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

