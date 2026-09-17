Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687E855C319;
	Thu, 17 Sep 2026 14:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789653659; cv=none; b=pVuFLmcoBKsTCAFiIqh7/Y/E1rRLYxZwK/4Y5Es/QjjLNoN2MYebH0CHI9DMBmMAJrXyEJsyOYoMJqp092kaOjJ5I6IDK+YY0PjE6/p+nv7FcofkDiovicQ3n7wr/ZMayvI+2xg4IbDgIRqmH+ZI9GuaJ4RJPnZAlNBTLLAyXIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789653659; c=relaxed/simple;
	bh=qr4ZMoF0xnAVzuY6CyLri6Kg+fDyZQ33aAoaaVdMcvg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=giqJ56yQWosEWLi8ZD93RjCY9JPEPATOg89RMz8HrV8CJ6GtXVXiBdl3tfgIk7xI9VEah7+fNuH0zkF+VZ3YsUhXj30Wf3JPyLHc7vVJOedVyiZeud4kAQY5+mqj6R9TzgzZWLnnFsUFyWfwvgy0Ej20WVgTxc98eBjFl8NHJMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=TtipBJko; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="TtipBJko"
Received: from francesco-nb.. (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 282F622817;
	Thu, 17 Sep 2026 16:00:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789653654;
	bh=PFbHrnCbgfpqZStiZJ8Sb/nHDFg7+/3mGwQ68I1HP3A=; h=From:To:Subject;
	b=TtipBJkoMi6cb3iVLiD7pa++jODJA5EF5UJJPbuB9G6kDhgrasJYojd+g6IDXKSFf
	 u7BGs/ZojQDywBeGS0BBpSeSaMlGYE3MXoYcuYNvRL+yMMYRjF8ED2I3jNt8J9rYiy
	 uJHbWWqGoEcb88/dq1g8IzYQG+wWNizk5rBGXEEm8/4yILdEneOa584tOTyz7Y1SDm
	 HXxHTw7d23EXswFiPYpgDJjH6UJro2SqFlktKmRtDlpc+NWA639jJFdfECov5xzc11
	 cGJJUFBwQXHI63P3x0zuSBVHpicWZrhQTL9qso4uu66THawaE32dNtIiS0i8dBzzyT
	 p2aZV/IBs/LeA==
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
Subject: [PATCH v5 3/4] ARM: dts: imx6ull-colibri: Set LCDIF bus width
Date: Thu, 17 Sep 2026 16:00:38 +0200
Message-ID: <20260917140042.118181-4-francesco@dolcini.it>
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

Link: https://docs.toradex.com/104446-colibri-arm-som-imx6ull-datasheet.pdf
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v5: improved commit message, added rev-by
v4: no changes
v3: no changes
v2: use the common bus-width property instead of the legacy interface-pix-fmt
---
 arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
index ec3c1e7301f4..1eb1cf2d7395 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
@@ -229,6 +229,7 @@ &lcdif {
 
 	port {
 		lcdif_out: endpoint {
+			bus-width = <18>;
 			remote-endpoint = <&lcd_panel_in>;
 		};
 	};
-- 
2.47.3

