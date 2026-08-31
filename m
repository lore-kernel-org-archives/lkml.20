Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C264B3C0A0F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 22:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788216947; cv=none; b=Lh4tSvaHrjjzwOEG+eVCRyeIdAdUFT47ewwFoUyk7dhfQc1A7IzWZiDbAdpx4BuT+9fQTEDyHTPx+qxjlFw5hbWnBDk4Do6+plqbXfVCCQBABBxMswl6Aa+hlPz5iVFBmF3VMxWbWmmK6RENjW9ptpSpkgvl1qfUq1xJtXPYyak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788216947; c=relaxed/simple;
	bh=dhXJ+FBhl0dUtNLwfVJ2+FMZJSif3+49a/oOSrqpjqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e8L5FitrwDjkRmK297Aami1oL12GPX8CprZDdeNJzkAGoN10q3dMr1vbxNNWyPPjFbOyKUNgBKoa87CR0QrWxpWL11EupGO7qeaHe++vCpY1s+aIx6KTsvhTWVT9X02V4qF/XZDchKhQLgse6kByWiZSGVXusCCX8ZRb9V71Y8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eiT9lVrH; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eiT9lVrH"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b8be0409fso1880135e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788216943; x=1788821743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PrCJwvq4FJRDCkfm44Ye55Kq5POR7NnqJpsxGpwWsOs=;
        b=eiT9lVrHqHOSMZk0XfQ/IlzKn3vvT9YUy/9eWBIlmAyalbWf6sJPULW4/YeAx7K5IE
         TZVgW5G8tX73a41KCXPnTI3UZQRVi+16VDRa1Ba3xyRk1GMLiU6KbTUHSCujSJCxEsNK
         7cKFO2flcCfw+I1J8w34JLLtgD9HmVCJ8vwzLSAfcXIKbciAYptswSSVpKeFvBxX9f1k
         dQJNeivCal0gYltHC0Ow0h87clATdBIFSflpJJFiNbdvERYuX8dOGmhQZiMGbyvzpuUJ
         JHHmnxTIHxWUbm6G/HRTWOo/zNrt7zII3tWoIoz4dvhYUrwZ8ycid14+w9mDqyQztSkj
         xGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788216943; x=1788821743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PrCJwvq4FJRDCkfm44Ye55Kq5POR7NnqJpsxGpwWsOs=;
        b=JSUZhAqW91jHtTndf7ZB+7a7PrvBjogMYNI/xobIg3THGxZYGvlPBgMkHos5I7u5kA
         iJdqWUBIAUJ+nC+6WEIkeNW3R2QVu2t5q99eTlgLs6g7g2cZ+EOX4B8qlAARxBDX0Byh
         bxRsVykOU7A5/g/yXx5koYrwRqMHfpEPaabp+7IQ0XgM/npKjz0eYgyB6nwmV27ZRYPV
         tD6s7Gf4C2FwlznLqfApRuSctHuw7sX3Sb623GQX5pQ6stPkU0mPDJZNDvhN7u23IK+7
         CijQzLonQrqQnEy0vmic4n0BQeloJCdJDUxi05U6AqPhEDmf7QPSfJv5EVBq4EDJ0m15
         h1Tg==
X-Forwarded-Encrypted: i=1; AHgh+RrX8q/zpws84yLqtutLwc+sgNIoAp8osXQuqKtuG1LbCD7POIR0MHysD5e8kg0RTEKfX63gAh0suQ7djzA=@vger.kernel.org
X-Gm-Message-State: AFuF++loNQunVtLvBd5Si9y/QSjyAmaOTOScCkiHu+jawEoO6ZgLuRkM
	xjOzgHlzJWHQWlj/YEvWI/vtcQJV/XKM8fIeOt1g3B5p7Q8lAwcV5DkT
X-Gm-Gg: AR+sD13nCp2RWIgISykUkuT2VoXQisojo9QZmJUzdtd6CrW7ceEGWnxZXGz6iJA++Pr
	382QN2flCc4n7+k+F8ue6sp0EGzNM+vDw3txUcHA1mHWo7IM38FWpFla/2yDGVKqn8cGSpkyKRf
	/jMoz5Ab5TSkTQ1ndX63F7nvxXksAMu43Y1/g+DGQe0uFM5eD7SJn5n8c2LE/Ruqv9poeVt4x5H
	OJbKDcgxNWP/+mtShlGMkqzzy7WEyhavkBRcRiCF41piLtxUeY9wwtomyoG0rTqJ2htySd1akRQ
	XDDVoN/hHawfbr1T8/FGVhtQjrSoWDnt6j31Jsxkv7Q4l6PTdRgaSKU0MP9L79ho5Xmkx3I/4cw
	emOAXBf6+q8C9Qsm8b/2dbWpE/skYTiVb+6Ob5TGfD9YLNBPuWJ3COmMh6tllj3AQgntpbjzNNh
	MIRVMEUylHm8J3Ya7gVAxI3fhnqVwdT8D4gHDCWFOamtimVjvpKYESir374VASZGTCZtHElbX9P
	vcYNn7tzPpMZ5sMBt5oJcJORA==
X-Received: by 2002:a05:600c:1d15:b0:499:d366:f572 with SMTP id 5b1f17b1804b1-49b91c4338cmr399173455e9.10.1788216942522;
        Mon, 31 Aug 2026 15:55:42 -0700 (PDT)
Received: from GLaDOS.station ([187.14.102.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10153sm24452615e9.4.2026.08.31.15.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 15:55:42 -0700 (PDT)
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
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v8 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX7 boards
Date: Tue,  1 Sep 2026 00:55:18 +0200
Message-ID: <7af24e53fc6dc0e84a7d2dce7090f5c465f470d2.1788184274.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788184274.git.stefano.r@variscite.com>
References: <cover.1788184274.git.stefano.r@variscite.com>
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
v7->v8:
 - 

v6->v7:
 - 

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

