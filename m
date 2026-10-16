Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618FF3E832A
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140715; cv=none; b=hNUJL9rjqKc4Ld+VhWVQHfMg3jadLgz/v299U4L6NT2vNQLq/U1t/vaPBfU80rB+W9S+JmHdwEzF27JQppoX6H4+GoFnCg2XFhkHT0bLMut0UJm18Pay2pqEnGYuqgW/aWbKk7fR0bhilhkBy4w2KA7I03ljYseL6pkyWsR+cCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140715; c=relaxed/simple;
	bh=jmoLeS4tTqLIlhpLQ4Ft9yABYozo/BQsK+CcmQXIwSQ=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=hgFS3g3BBTVV+0QrGXuffoJvXaCPBVsFt2FpkrSPpmk2515pbOIJQ1hfJcvt1T4SkBGw77DC3z3X7PUlJduiJEHsX3Z/815pmviwZPIUHULARobzAQpzp48lPW4v8+H4wkkMAQnYxD1TzzN7s5Uava3S/LSJ7ywOMDUXY+ydT4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FyCLCVxk; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FyCLCVxk"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1440FC6220F;
	Fri, 16 Oct 2026 08:52:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 48DB36075D;
	Fri, 16 Oct 2026 08:51:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5481B10328C00;
	Fri, 16 Oct 2026 10:51:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792140708; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ChS8CbLEvyFZVuYslDWXhsoD8DGk8VUp5ILUon7wnlY=;
	b=FyCLCVxkCDn6SxkXHmUNA69irjP1CxhoV/CWQHtcj/s82zfmdSuPFeHZcqDwuI6y2RZgwc
	wIev23C/pJfx83qUOIuOWk1zftExtkKtkdIwQ0IIFjjI/xCSIGSzbK+8YtsHQMksKb5QOW
	gVpfKo+NHJiF47Q8YidnxrqEySqpEmuRheElrrfeFa9rtFMRHDWYM/Qzn6+tRRBQ9i21ii
	NmV0nCvarkBkTupW8iHUMUonhdAMrNN0Q/O7QPLlV5V18cL6gu+QH4QFF2Y4yOnNh1DIN5
	LT1+gdlbxOSU71IeNW1Xhtw34nFeySDy3R+5ybE2YAAC95oEvPJWD1RCm6YHTw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 5/8] drm/bridge: ite-it66121: Advertise HDMI 1.2
 capabilities
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andy Yan <andy.yan@rock-chips.com>, Liu Ying <victor.liu@nxp.com>, 
 Phong LE <ple@baylibre.com>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20261001-bridge-advert-hdmi-caps-v1-5-f8806570e243@collabora.com>
References: <20261001-bridge-advert-hdmi-caps-v1-0-f8806570e243@collabora.com>
 <20261001-bridge-advert-hdmi-caps-v1-5-f8806570e243@collabora.com>
Date: Fri, 16 Oct 2026 10:51:32 +0200
Message-Id: <179214069221.3071818.10591269637696395115.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

On Thu, 01 Oct 2026 04:14:36 +0300, Cristian Ciocaltea <cristian.ciocaltea@collabora.com> wrote:
> Bridges using DRM_BRIDGE_OP_HDMI are now expected to also provide a
> supported HDMI version.  This is not yet enforced, but will become
> mandatory once the migration to the new caps-based HDMI connector
> initialization API is completed.
> 
> Since none of the chip variants handled by the driver can drive a TMDS
> character rate exceeding 148.5 MHz, advertise HDMI 1.2 as the supported
> version.  HDMI 1.2 allows up to 165 MHz, so set the bridge's
> max_tmds_char_rate to ensure the connector limit derived from
> supported_hdmi_ver remains within the hardware capabilities.
> 
> [...]

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

