Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBB34C10E3
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789659120; cv=none; b=rXIouHMPGETHOgKIlkkvvPqOiIX/MbSx2KqT3/tEKDJaQS15jbtJz6ehYU4PoK1yr2NjMEQpB/4QDAfBrzW4WEBGLF3LqCtVWiTrqqYWTBaUcbyo19bfFdRfWKHWoNAmXDdvJNhWFW9UCzr/r/V/Z1bN6g08YC5SdAXciUqbYF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789659120; c=relaxed/simple;
	bh=y4rW0+iTuHqQYiPqvhew4HLaTLfoEXjeW9ZziEhZT3M=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=vDd1rVRmhCSPTOq1DPdWeYmO3xkKkXKqeTszoSXxIbfDEtN/q17OVn7IvM+PLyv4c63RpY1DqJg3V0O8UjAREDVYjC8f6dvp4+qC6H91JfivdZ8ieH+SsPSk7xa60r+SD+rFA4fg3ye3AlWfK14aJpRi9DfPk4EdNo1DbN6BzdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VV7lnBEb; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VV7lnBEb"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6A2284E407AC;
	Thu, 17 Sep 2026 15:31:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 348755FAA3;
	Thu, 17 Sep 2026 15:31:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 33CAB11C7B08C;
	Thu, 17 Sep 2026 17:31:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789659104; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=O/UhMYfdk2U4n2hFq6QKqBP9YQQubGPiuAzVZ40AtnY=;
	b=VV7lnBEbBtQc754RGNtkKA7EeCaVJLqlaGng8lA/GrVM9zrw0j4DRXIa+E7JiMbnhip5Zy
	Cs5vT2XdBwJsE8+03hr60NhdfRUjHehiO54hqB+UOReIPC9u4cEiyWlPuqkxu4553b56v3
	2CAQ9UWfH+VmE2qIcDndOeMoRL8gdUWbyPJg/xoG1Ld5iGNKnA6CocLs+Pi6cechDCKwvt
	aRK2RIT85js5Lrp/TBVFb5auVQkTIYUfv2nXwLZNtAQuDJxZMDYpZWv+wDuXElsidjZEU5
	JMy1Ky0/OOW6kes0rtW2LF1YBXsYYuaVc1hbpFHqYv3VMRa1rAKVfxwSSR67sQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 2/4] drm: mxsfb: Add optional DPI output bus-width
 configuration
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
In-Reply-To: <20260917140042.118181-3-francesco@dolcini.it>
References: <20260917140042.118181-1-francesco@dolcini.it>
 <20260917140042.118181-3-francesco@dolcini.it>
Date: Thu, 17 Sep 2026 17:31:33 +0200
Message-Id: <178965909367.1648606.14106712106252415784.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

On Thu, 17 Sep 2026 16:00:37 +0200, Francesco Dolcini <francesco@dolcini.it> wrote:
> LCDIF programs LCD_DATABUS_WIDTH from the selected media bus format. The
> format reported by the downstream panel or bridge describes the display
> input, but it does not describe how the LCDIF data pins are physically
> wired on the board.
> 
> These can differ. For example, a 16-bit LCDIF bus can be connected to a
> 24-bit display by wiring the available color bits to the corresponding
> display inputs. In that case, using the display's 24-bit format to
> configure LCDIF selects the wrong data-bus mode and changes the assignment
> of color bits on the LCD_DATA pins.
> 
> [...]

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

