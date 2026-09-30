Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950F749A3C3
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790765029; cv=none; b=WiTyfW6Z0/0cS7Ebrmt1BJxuSiI0VBbiMzQYM/CoIpzZZQjbGTZTBW9hLkxkIHzUZ9+1IhAfACHyAQZ5ZKpxJ0xKrT0TSd3Wd4PvlJ8x/tMfwmQrwg5a4Z0sc8qVTtYqcceexpWDLMhA+DgqjILWtz0/bn2OgKw7TTQpdaD9Gd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790765029; c=relaxed/simple;
	bh=9ayUJ468IBwRfm4IZUJTKdQdOmbu5XIPSAW4+dOlH+Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=D5smR7QXTi6mO17c0gLHHU/loFQOnehYejPb48Hc53z4iiT+5ZBi2y5N+RuNgaCkpGO/HyQ9YwyW7R0Bunn7idAhtflZ6Abn+8lCdYogUI05E/0ziC+qu/BWUH9VrR8rBPQci4XrNek29uY7az/YoGC+dQLjC+9gFy8DY6DCNSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=uwMIm2Zg; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="uwMIm2Zg"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C2D294E410CA;
	Wed, 30 Sep 2026 10:43:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 79C9160749;
	Wed, 30 Sep 2026 10:43:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6EB92103282F2;
	Wed, 30 Sep 2026 12:43:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790765014; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SkK7nzvmdXccAthjxNIG0aZSr8ABcmG303myl+zYPu4=;
	b=uwMIm2ZgNp+9UTQoK8f6qN0jFJlsClA7TYMdrOhRR30NVVR+4ZdxQGjNgpKEgLZFZW8nIZ
	SrNoCIqlXzss7mn1ttQ/Qxs9iwIOqGwaiIyHS7f8XJRsoU/PdS3L7SfsaglWWl5EzdiZS2
	fKkGKYH+p5A7avdTSZ+Ksneuesud+ZDK58ji934XC/j2wQoha9yjpQq+D1sCwh7KV9K4cl
	yWQ8zQiO6j8FZv5fMBwbnYrCNdB2ASYJVZK0k16+VvCMtx4suIiKP5ypE9nkNENHEehtFt
	lpEE48vI9N0KOP0Tc4A9tCy5r4AU1j21Swd8J7sOxaEPlmJPQM9Rfk/zt+9VFg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco@dolcini.it>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>
In-Reply-To: <20260917140042.118181-1-francesco@dolcini.it>
References: <20260917140042.118181-1-francesco@dolcini.it>
Subject: Re: (subset) [PATCH v5 0/4] drm: mxsfb: Support LCDIF interface
 bus width
Message-Id: <179076500400.452568.15346989916115503276.b4-ty@b4>
Date: Wed, 30 Sep 2026 12:43:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3


On Thu, 17 Sep 2026 16:00:35 +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> The width of the physical LCDIF output bus can differ from the input bus
> format advertised by the downstream panel or bridge.
> 
> Such a distinction is required when the LCDIF bus width does not match the
> width of the downstream display interface. For example, an 18-bit or
> 16-bit LCDIF bus can drive a 24-bit display by wiring the available color
> bits to the appropriate display inputs. Configuring LCDIF solely from the
> display's 24-bit format in this case selects the wrong LCD_DATABUS_WIDTH
> mode, changing the color-bit assignment on the LCD_DATA pins and resulting
> in incorrect colors.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: lcdif: Add endpoint bus-width property
      commit: 54d28d79d91d85090814fadc39ee050920de84e1
[2/4] drm: mxsfb: Add optional DPI output bus-width configuration
      commit: aafd4205a75de54cb46458bbc70f35a0be1d7533

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


