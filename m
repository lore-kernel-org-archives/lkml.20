Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F39E4DAFAF;
	Thu, 17 Sep 2026 14:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789653659; cv=none; b=jvY8uRqqRjhiWb+ezPlsN54D++AJcJQAy5PYFOAeW2dZlKdZijwipGPevi3C/8GoBgwWz5XfcjoQzjuKPoTwp9nUqswhnSQVMvcA+hjS6rmKC8Hpgv7rac0AWhVOCTPMk3X90iFZruPkPvzOB1scrEWWOa4gctMiWJsxCQk7bO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789653659; c=relaxed/simple;
	bh=kr8DC1yojJk9nG43YgDicPPWVcN0PW9KjVsyZqPW4LQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PKSZiyFECCSDHMj+fFIPG4r9pDquKkUMzj+B656PBkX4sVsXEreaBwxAXWbKGNABbyy3OeABHj6kglVYsCWEdfYdptvDptenf8ENv+F+BP5MYMzVc/bX4We1SOZ1zCkyEYU4hXowu9iSL7vBBQiELyVsx9/PV4e8ZiRL4Z34JgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=o8DF/4JR; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="o8DF/4JR"
Received: from francesco-nb.. (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 470F322814;
	Thu, 17 Sep 2026 16:00:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789653655;
	bh=skm3Fsv3AnGbhO2KEqDrMKHxJwSa91rKkWRnJk3LvDI=; h=From:To:Subject;
	b=o8DF/4JRMTOHW/jpaD2ArSG6uCfSEZWqONE15xTIfEKOz+uu5wfDl61IegBEq7kOf
	 LJl9AVBg5PS61g0BImpy/hPT/bCcFZRI4nd/Ov4cXdtdNSj5ZwcEULd4Zlc7MA6Yq7
	 VP8veGsMYmhiC0gcxdkEF6B/1dcVk3bihQMeeZ4l5nOuMtt4BjAuIKvWZaJGe9kGpy
	 dR+h/exB7vpWQ/8bZP3p3ZYlf5CPejusB8UlErEiUi1nCuG+taHIGaS7Ckxlg271qz
	 +tWKOLTfjtamlzO88VAQedwN/4xJUK09qAiuvbWNLQtOH6C5/9oYy47211flVHzp0o
	 RaBzuZ/4nORjQ==
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
	Robert Foss <rfoss@kernel.org>
Subject: [PATCH v5 4/4] ARM: dts: imx7-colibri: Set LCDIF bus width
Date: Thu, 17 Sep 2026 16:00:39 +0200
Message-ID: <20260917140042.118181-5-francesco@dolcini.it>
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

The Colibri family standard defines an 18-bit parallel RGB interface on
the edge connector. The additional six LCDIF data signals required for a
24-bit interface are mapped to module-specific pins whose location is not
fixed across the Colibri family and which may not be available at all.

Generic Colibri carrier boards can therefore only rely on an 18-bit
interface. Set the LCDIF bus-width property accordingly.

A 24-bit interface can still be used by a specific carrier and module
combination by overriding the property in the carrier board device tree.

Link: https://docs.toradex.com/103125-colibri-arm-som-imx7-datasheet.pdf
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v5: improved commit message, added rev-by
v4: no changes
v3: no changes
v2: use the common bus-width property instead of the legacy interface-pix-fmt
---
 arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
index 8666dcd7fe97..c4088d3c5ab1 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
@@ -537,6 +537,7 @@ &lcdif {
 
 	port {
 		lcdif_out: endpoint {
+			bus-width = <18>;
 			remote-endpoint = <&lcd_panel_in>;
 		};
 	};
-- 
2.47.3

