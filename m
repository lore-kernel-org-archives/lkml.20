Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3AF74908BF;
	Fri, 25 Sep 2026 13:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790342629; cv=pass; b=M9s5M2vo56grVW7NpqpuAV9H/BTLSXi/yyJZ6QbcaF3KQAISGaelVhzkqzJa+Orjl3iTPx+6UMmsZeq6iCxZB+jyJt0vX65oBlsyZg3YTJnaw93Zpg0wddXKzGsIC6CJ/ZWttnnb8taiai6HM/l/4fjN2U2xm0uFiXu7HV4iEJI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790342629; c=relaxed/simple;
	bh=FdhcquS8zcAZN7c0wYgqa4lDKnhin/2F2Ap2WGiqtYc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=s16GHQ+P+QtjFfmcVTiwA1upFOCQMA6JGhgHA3SkcU0Qf5VDqqzjaWWe3QJ1JyCzCIk9nLqj/UzN/UXzVPe9Sf+kPqf9qXNKKnCEoyMUnKQILGRqM2GpJwvYgLmvX/NyQZgbbxZmhwOlXuoJtzp5FY7wbv0uzLayBx67YisVDnc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=dqHMBXFV; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="dqHMBXFV"
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id D5CB4200153;
	Fri, 25 Sep 2026 15:23:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790342608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FdhcquS8zcAZN7c0wYgqa4lDKnhin/2F2Ap2WGiqtYc=;
	b=dqHMBXFV5h+TJgepHN/PFBLJBiVvxvl7NS/i3ddKATSLdmGNL13XcjL99bREmPa46/cc1a
	9kU/G7kJidP57WjfziejC0AfDKUv4FWROMJHO3B1QrvbuJdlGV8tm51vgK9pZE5V+zTczF
	lUczsydndzJeeMKCWeqLQBYYp30iTHLo4RC8sFgc8JGjDQNlrRJJUBnILLR2DEmHTQVz3z
	XPJQWkLfwQI2PScER3iVeIekLXyE6JamyYqmNBINXJGI++iHuL5H8Lzu8Z7s+6iHpmUkCE
	6cgAa36UJiD6jSD/z3ml4wAhyddNv2wdcVfbSBfYvOOiE6vcXK1KOqu16/YjIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790342608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FdhcquS8zcAZN7c0wYgqa4lDKnhin/2F2Ap2WGiqtYc=;
	b=VscFHX5Nilk5f/x1aNvmluoMFXEVapp3TjgLvYMQ8hv4v3LMvZwwuEcvdg2clKw3noeHRG
	Y3F5x7SoYIddKuRH5978oCUiWl9DigVEF1+4LNOVtibWjJXNUj8yjd5JcTGtp6IdERvC8m
	F0B67Aea8vE8SoLYps+S6k6bMQiFPXyz296R1aMaerAyZlImg9w3ddVAvkqX1jIXVGtjus
	x93AjsoweTWdf0L+KnREK8xAMz/HDjIhIB9rS7PUTR8Co+lpc290MUaja4773U8tANqXwE
	/9PxkUaXjnqpbG2oqhgXzpIY/8IphCeLAtjPaMRvlb/t6ZpY1tkWXnRhJJq40Q==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1790342608; a=rsa-sha256;
	cv=none;
	b=YynP0Q/W82yQ93X7hMinn+nyM7N9P7qCjnIDcEwq/q7icZB7ctcqlV7vPiY+53ry0nygaY
	i+JJ08IqFBb2tyTGRPDB6hRlDOuxKIXjdD/xFRhJ131lhrtwKziPlsqpHvH7ZicWSRoTk7
	9ltcmt4CJ+Pcfgp1CHIgQzTttVMPXgi0CaGq/WDsCmQG/qu0f6RyLIatDtoMvfy+iFDSpj
	NQ22FB7MJ/BCdhcf5hMvtj7YEDyorullLcaxknnxk09ZMGtkvuEeuHBXivxdq1pflET05L
	/GYJcateQOXdAWheGv+/GuhVQ3c4k6UJYMV+XgBUCoXkwnk+Mh7t40FHPc94Zw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Message-ID: <61aa851b26f9aa85a3ec1dc4bc8f46d7f1fbd24e.camel@pengutronix.de>
Subject: Re: [PATCH v9 2/2] drm/bridge: add support for lontium lt9211c
 bridge
From: Philipp Zabel <p.zabel@pengutronix.de>
To: vishnu.saini@oss.qualcomm.com, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart	 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring	 <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley	 <conor+dt@kernel.org>, Marek
 Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yi Zhang <zhanyi@qti.qualcomm.com>, Nilesh
 Laad	 <nilesh.laad@oss.qualcomm.com>, Gopi Botlagunta	
 <venkata.botlagunta@oss.qualcomm.com>, venkata.valluru@oss.qualcomm.com, 
 Jessica Zhang <jesszhan0024@gmail.com>
Date: Fri, 25 Sep 2026 15:23:28 +0200
In-Reply-To: <20260924-add-lt9211c-bridge-v9-2-d78b39677a61@oss.qualcomm.com>
References: <20260924-add-lt9211c-bridge-v9-0-d78b39677a61@oss.qualcomm.com>
	 <20260924-add-lt9211c-bridge-v9-2-d78b39677a61@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Do, 2026-09-24 at 21:29 +0530, vishnu.saini@oss.qualcomm.com wrote:
> From: Yi Zhang <zhanyi@qti.qualcomm.com>
>=20
> LT9211C is a Single/Dual-Link DSI/LVDS or Single DPI input to
> Single-Link/Dual-Link DSI/LVDS or Single DPI output bridge chip.
> Extend the existing lontium-lt9211 driver to support DSI-to-LVDS
> bridge configuration by detecting and handling both LT9211 and LT9211C
> variants from a single driver.
>=20
> Chip detection in lt9211_read_chipid() is extended to identify the
> LT9211C by its distinct chip ID registers, and cross-checked against
> the chip type requested by the DT compatible string to catch a
> mismatched board/compatible combination.
>=20
> Add LT9211C-specific regmap support and use lt9211_chip_data with
> i2c_get_match_data() to provide per-chip configuration.
>=20
> Five new functions implement the LT9211C DSI-to-LVDS initialisation
> sequence: lt9211c_configure_rx(), lt9211c_autodetect_rx(),
> lt9211c_configure_timing(), lt9211c_configure_plls() and
> lt9211c_configure_tx().
>=20
> Defer the remaining LT9211C initialization to a work item scheduled
> from atomic_enable(), since RX auto-detection requires an active DSI
> stream.

This is still wrong, and I don't understand why you need it.

All scheduling initialization as a work item should allow is for
downstream bridges and/or panels to be atomic_enabled while
lt9211_work_func() is waiting for a vblank interrupt.
They expect the LVDS signal to be active at this point. If LVDS is
enabled at some unknown later point in time by the work item, any
startup timing requirements the panel might have can not be applied
correctly.

Also, deferring initialization as a work item shouldn't have any
influence on the upstream DSI signal. That should already be active
when lt9211c atomic_enable is called. Could it be that there is a bug
in your display controller or DSI bridge driver that causes the DSI
signal to still not be completely active at this point?

> Signed-off-by: Yi Zhang <zhanyi@qti.qualcomm.com>
> Signed-off-by: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
> Signed-off-by: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> Tested-by: Philipp Zabel <p.zabel@pengutronix.de>

I have not tested this version (yet).


regards
Philipp
