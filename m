Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819207;
	b=DGdWmy01CyAysCTDRhstEYNM0IwH3nHg6bipW6xI0rWC56XXFHT8zMylQGwoRRkCWItV
	 Gdrp0FjVBM/j0/OEPVpQE81jX2Mk20o9zgUjHDeyY3Z0wdakpP42RIcoTJsLogBna+LlB
	 7UIdrZC/mRrBBYX1rh+7Eu4wHmNcPDheAXD1D0JdQw8G9CDBzCITUDDoNjXqfYqXG/W3W
	 NLzyEADREUvkkDXpXpSwE8y538XlKmG32d7ETUfGLmy3AvBfej+MHRqhpDp1Pu2qfc1//
	 Ao0syxbl//p+/9Ma0hW8C/2J1XrTH/ULlCga3V4XM0lO7oXbIBVErYJj6q9kdUEdz0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819207;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=yeyghiiI6ugMxMzEYBna16w+kHo55vTWBdtlwVeJhVE=;
	b=ikuwvjErJ01LYNh6OZflmdy0Xb9ECfSmhkImd54TI0gpbn73oZY5TYQj6bMb2/tnblPw
	 SOMpnVbzRHgg0Q9v523Cf3YSgwZ2mW+JQvw6w9PFW1KrUy3eKoDSMY+hffU+6OXWTFC7g
	 lqvddRqtSYypUU/pAsT+OZWdj/eAdMRg07+vl9rzKPIyz/+2XCBHXLlry4A+Om+yjgbCq
	 OJ4K09TiiKQowtjXtDfnzAxhNWfOXTz4XyQfsvIvejgUkq2nTCrMLTQ/Ocv/26aupHFHi
	 xus/uLEhSffQgkA5Dztw1V6lh3MB37QX71z7MlpzLlngkvc+em5QbUne0EWlWTLMO6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5A3606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:53:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A5A3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xSsSY-000000007q8-22SV;
	Mon, 16 Nov 2026 08:53:06 +0000
Date: Mon, 16 Nov 2026 08:52:46 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hermes Wu <hermes.wu@ite.com.tw>,
	Allen Chen <allen.chen@ite.com.tw>,
	Pin-yen Lin <treapking@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v8 04/14] drm/bridge: it6505: unregister DP AUX adapter
 on bridge detach
Message-ID: <179481904177.211952.12953364281549371036@makrotopia.org>
References: <cover.1790552614.git.daniel@makrotopia.org>
 <ae0941be8fb5e20a309f2e30b5e2d8818168aa38.1790552614.git.daniel@makrotopia.org>
 <179251509976.78870.2847307917157375162.b4-review@b4>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179251509976.78870.2847307917157375162.b4-review@b4>

Hi Luca,

On Tue, Oct 20, 2026 at 06:51:39PM +0200, Luca Ceresoli wrote:
> The drm_dp_aux_unregister() docs don't say it is idempotent, so is it fair
> to assume it is and always will?

It is today, as both drm_dp_aux_unregister_devnode() and
i2c_del_adapter() return early for an adapter that is not registered,
but you are right that this is not a documented guarantee.

> I think it would be much cleaner if user drivers took case of calling it at
> the appropriate times, not more.
>
> A flag similar to it6505->extcon_state used in patch 3 could allow that?

Agreed, I'll track the registration in a flag in v9, like
extcon_registered from patch 1.

Cheers

Daniel
