Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2088847142C
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787851739; cv=none; b=aWwAmO3cpisY02n3qHY1scDbHL+BKr7AiroRxe3JGCqum+D37RpjAzruY8lhgcCATz2yHCJuZzOB6DhYNA9/kCN/JBzns8DvSYZzXYPQErW3ZFRAjlZlFehI7bUD8nyy+sRpjc+fgo2BsqmAhIMg2vqkY7LL07Fwm/fx0zk7Vxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787851739; c=relaxed/simple;
	bh=L5cngSrji5pPnnXpeHyTls2MaHRF8K1fdS0dI4G5Bnk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rSdd2jFhnriQtmp0nzDHqlKRk94ICwegs/9J7om+TYzjx6e1LQHD9+CRdbmKGOYGMq1sEv4EJKQrFwdBetLDjp3PxHy1mPbHINM/8ISm7A32ga8bOAXvxxahPLGQrDJ0Q5LxDTpSaLabMu7x0mNIRuZWYVdhRqLnHk19Pw2Dad8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eIAwqnVC; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eIAwqnVC"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso111355e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787851736; x=1788456536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jBAqHiJFBlluHKmrWNHYLsCQylCf5RMzSWDONfpSfgY=;
        b=eIAwqnVCLqOV5ZOWceyPxzJ/Ayw1FjzvR/QwycisoYj406G+e7mzwmcmC+APvHXmWb
         x97ydi2OWrwo7U+tTrlzjvZrDDe9Nd4y4BGuP3shlBkSWzQ+i5EyJEsApV29kR66tHmh
         172GNppYNJZwF3kmOV5POxA5MbTlB0dNJGrKTYB5t6/lYPhlle4z9/gSKSebvTr8bY2m
         vacTBxdlysMGRH6l8jZN8cTf8DBH5dzWeuTkthIJX3AtHVpRI2PrncrQRemjbdv1D6BO
         LVW9hw6sPJM9gACsLABDmROKISVh1ShixbvRUjdSo/f8JOCUz/YfrI3Wh2Wu/YCzpCmY
         Xdfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787851736; x=1788456536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jBAqHiJFBlluHKmrWNHYLsCQylCf5RMzSWDONfpSfgY=;
        b=k4fmwPWFvVXd9TNn/V9zmNMI5K//9FTM+sAmfSnlciE2ASVfXcvi2bLU9ELLdhhhh5
         B2qqpPRkAG8Wl7HR+BKjtVSy/4kIKh4N4fXoTRdoGLVMyxs2EVfLxWxCeHTHMfPzwehA
         5RtTCU6N9s4DNVklGkZj/nJyFuDJiS+iT3K/Cg9sPIzGJkt0tkBSTJSzsAqFzkLcIsxE
         ZEKCOFfeeHgPiy1AqJxKunD8jqCK2lJZO1RVR7dL2smrGejI52rlRavd8kgqLsvjxzvA
         Mn4ie3wTOG5gU75f8qD10VZl/8DESi6XyDgXVeBa1RI9MZF0fKnd8n5vBCYN+mUx01gl
         JYmw==
X-Forwarded-Encrypted: i=1; AHgh+Rqoz9hgiyiwxueIwIDLy34YTD0WxciaBUywZW3683JPeXqk+a4jBSi2enNCIxH4w4PyNPHAljplHQbScfA=@vger.kernel.org
X-Gm-Message-State: AFuF++mSTIYvdIu79WaZ13n6W3CTwZL98yc2Cykw2WhXPFfBNj4rZqGz
	XKSu1QOgTkjONkX+6AtmhObMJgC/ODQJvV/o3fq9NumujI1xHwVWue3g
X-Gm-Gg: AR+sD13mZRTFags6EUtxoudLqhQuN+MqCt+BnRuN33mZHzhrIzJDJoeQWbB02NFfGRS
	HUwaMS88prV0/GsYYCzu05uNU9GmlUtm1uKLASH92CyA2U+XwjTIgcKNVWvWL0CEADrXT0B9Sjk
	LTORHYqqbqtEkcFE0OD3zbUU9U7ERzeH0Wc+ckWqd31vFo/p/PUZDJm5GgIbSPMhXMBTscsZgxZ
	2SNh9YaLytnKu65CcRtlbGgkKzecWJo1cuKtkyAThlZAiuKA5y8EDlExP/jtw7DwMbjq0GddVVC
	WVwNdy53T9GOKurzT7aMhYYxDxnvkMLFvTjhVKgzSyPACr4eC7LeC+D9ReyNi2X3nJ7gbqkn2Me
	E5ehD6sBWXgUDSNCdrl1G3OP4f5t1VFRQ38T5Ux5Luvlz4i6UpiJ6hvtTa7XVPCtFG3plPgreSF
	Jm1mPxUmxNQuYaZ9LITUX0sdQxT7NiDzgD6/mIzvNDnrQAbfbS5ujVxlmcPbReSP779YlHPmhIK
	hRhFcvst9lM/DQL0UYJL+JyOQIO37vFD4Po6ZUoifSkhyBzk2t82uzivIN+9r9sjA==
X-Received: by 2002:a05:600c:46cc:b0:49b:909e:922b with SMTP id 5b1f17b1804b1-49b91c17b6dmr7287535e9.1.1787851735928;
        Thu, 27 Aug 2026 10:28:55 -0700 (PDT)
Received: from GLaDOS.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91c510c9sm2174405e9.0.2026.08.27.10.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:28:55 -0700 (PDT)
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
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX7 boards
Date: Thu, 27 Aug 2026 19:28:46 +0200
Message-ID: <7af24e53fc6dc0e84a7d2dce7090f5c465f470d2.1787851637.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787851637.git.stefano.r@variscite.com>
References: <cover.1787851637.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add DT compatible strings for the Variscite VAR-SOM-MX7 SoM variants
used with the MX7CustomBoard carrier board.

Both the first and second hardware revisions are supported, including
eMMC and NAND configurations, with WM8731 variants available for the
first hardware revision.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v5->v6:
 - 

v4->v5:
 - 

v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - Fixed commit message
 - Fixed spacing

 Documentation/devicetree/bindings/arm/fsl.yaml | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 656f2596e1d5..b732ff810265 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -950,6 +950,23 @@ properties:
           - const: toradex,colibri-imx7d-emmc
           - const: fsl,imx7d
 
+      - description: i.MX7D Variscite Boards based on VAR-SOM-MX7 Module
+        oneOf:
+          - items:
+              - enum:
+                  - variscite,var-som-imx7d-emmc-mx7customboard
+                  - variscite,var-som-imx7d-emmc-wm8731-mx7customboard
+                  - variscite,var-som-imx7d-nand-mx7customboard
+                  - variscite,var-som-imx7d-nand-wm8731-mx7customboard
+              - const: variscite,var-som-imx7d
+              - const: fsl,imx7d
+          - items:
+              - enum:
+                  - variscite,var-som-imx7d-v2-emmc-mx7customboard
+                  - variscite,var-som-imx7d-v2-nand-mx7customboard
+              - const: variscite,var-som-imx7d-v2
+              - const: fsl,imx7d
+
       - description: i.MX7ULP based Boards
         items:
           - enum:
-- 
2.47.3

