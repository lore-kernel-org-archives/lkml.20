Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794829334;
	b=jGPf4/O2mYGKeXVLdpEbc9BzsYxSJ4is1psVTQfU3Y7TjSDzVIoVCb08JHRpiQqUWTai
	 9DUXDz92fzmnletW55KiDSRRHWoI0gmP/HgtHYmHWDVBSpwaQL2+3OsP2fiX65Fr2TcKA
	 3o2GYccoQp0gcjrukpb3zxCqmjkj3+WkpvUZokziCt2Dw7IYKlZ+RPeTB4LSxgrZBh+Rs
	 2FAUmr4CK/7N2FAhfS+We99INxLA91VZqUx7vgmywVjKmy1lSgtbY7gKwBl8lVhA2jW+H
	 i1Az2n9mr9ys5UsD2F2lYcIUb8w725VYNJ/gQy2XTm+zAb5jLuPft/zbFu9ArTc4KOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794829334;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=Y8ZKyCOVCF4DaHkjfoBebvbhZZJEOEN+u4zY+I/q3XI=;
	b=aI0+S6EpWTwaw29IuC96kLdHu6Qq13g4DIYo5237KehneuUuDTOZDtXQ6vtWVEfV5ZIM
	 oHExB+f/pOMAyGmmbLyXhddV3mzBAlhqPZUpXcqKJMn66JVCQWNYxQhV3tQSPKGnbRYmO
	 ysyZYLGukrSeTXhuzskK+yvfWGU/b41BSZvIL8z11HBJSBd3FXJeMbc9GlxwYBZXvoDSS
	 77VFMv1zfsy/GHFIbJCyRPwUwl4TiCZHWlfNKvmlVzljl+LTbYJIty0zSWsbKOw8IuZpV
	 AEb7aWOns/oXTXLCtXpCebuFlTgaS00FW19gVvCwlKenObSh8lQGlTTuJa+8avlyZng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=a7qhV5xg;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577D9606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:42:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 577D9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=a7qhV5xg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794829331;
	bh=rtRemMSx3UtzeqG96wyxcLAlrvIK8a5x0EolpxH9CkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a7qhV5xgNj76z0QH2oTygaP02beUsCdh9SYyE8q9xMzxBGZn5z8R4UJHU679GnyMO
	 XhJwrZHhmuiHf2SspnlLiWQzY5WXZBZEOCsjuKBXjfsT8yFXfX9nIXI55W4r5ATxx3
	 OxgjE4xa/9O4a5+cZDZuVWdP+almClyKhOgZGCge0YbrhG0dKlSxUzerR7YockCC0a
	 GmURl9d/TjuvYhNe2KtBFpdu/LuTzZurugUgAUt7LKEs07Mox/zgEaIAgkb6h7BJu1
	 zeIZOhuSIpCTqAwAuqut90ZsOJxbMCiwrBocJX/QTGh2qWnUo/vWZurHrnkn93hDe2
	 G6uPU8qbhVUkA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D9FEC17E0036;
	Mon, 16 Nov 2026 12:42:10 +0100 (CET)
Date: Mon, 16 Nov 2026 13:42:10 +0200
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Detlev Casanova <detlev.casanova@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH] drm/bridge: dw-hdmi-qp: Return -EOPNOTSUPP in HDMI audio
 functions
Message-ID: <179482905239.1644942.18191359932991723848.b4-ty@b4>
References: <20260519-fix-hdmi-audio-warnings-v1-1-9608966c993f@collabora.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260519-fix-hdmi-audio-warnings-v1-1-9608966c993f@collabora.com>


On Tue, 19 May 2026 14:00:11 -0400, Detlev Casanova wrote:
> -EOPNOTSUPP is not logged as an error by the ASoC subsystem, but -ENODEV
> is.
> It also better represents the situation: The operation is currently not
> supported (because clocks are not enabled and tmds_char_rate is
> unavailable), but the hardware is present.
>
> Using -EOPNOTSUPP in the audio_prepare callback removes possible repeated
> warning log lines when HDMI is not connected.
>
> [...]

Applied, thanks!

[1/1] drm/bridge: dw-hdmi-qp: Return -EOPNOTSUPP in HDMI audio functions
      commit: 247695b19afcea036873882ebe5db94a4e80e867

Best regards,
--
Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
