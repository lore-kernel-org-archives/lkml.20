Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819682;
	b=IhL1ExugRSpGpM6IUfO0WBEBmkOdWHcf1QRXDnqgjeovYAaVY9IFULR7dL3eb7QCmIqi
	 2p9yY5jdRtijjAHKBznnspkfsvkBBLTR7/ar32TGE28E2zPDpLqLCNcT3W2W770SGCLBH
	 N5qzO58H/wMZkUTZSjb+yU2TOUQ4vCavx+tmTsYNAT16YPnKdruFhzvWEM/sbYQEbnEKQ
	 AAA0T1NvUgrzR1uIN+QsfuC4ICk2qBLz5yzcrH3WstmBXWvC1iCQLFT/fEYSYjY+VIpVL
	 lMjXGeQfiey0DM1oJGtAvcKG9VC4QxcLy9GKomN6O0GIxwCkPSv8bxTQkweUimeYCSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819682;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=N7HaPBFNC/ksv2Gq/mq4OqshzZisX2DBMIyRet24wDc=;
	b=Tpnjo6UKROU3il52KV4FuKq0tmPPrt1qA2D8Jl/yJNGqdI/tpN0SZLbamLOo/7PzSZwQ
	 c67VV26aiYEBrroRyZZTDmyV6b6ojeBsQLCZu6IxLePDuMoOkD6Ku3w8a+XuegqXbEgWu
	 aLMwy65HJJgdFLZneGdt9BuE//gBIT8vj326QSyoClxsfx98qGiYJYL6f9Hmqob3hAopO
	 C2cXJtcGhGecfUgDeCG0PkeYBc2i0QIQMmqex0TF047N2V13cqhDcqR461alVRyoOvEL4
	 2saU94KFjNXFfTVTLWTF89z+NXNe9StvTNP6xcR912H2cDTz7mhFJVpJCTOcEVsidPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76636606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:01:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76636606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xSsaQ-000000007zg-05VE;
	Mon, 16 Nov 2026 09:01:14 +0000
Date: Mon, 16 Nov 2026 09:00:59 +0000
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
	linux-mediatek@lists.infradead.org,
	Jani Nikula <jani.nikula@intel.com>,
	Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
Subject: Re: [PATCH v8 00/14] drm/bridge: it6505: DP audio support +
 shared-DAI hw_params fix
Message-ID: <avrGSwE-Zocwtojl@makrotopia.org>
References: <cover.1790552614.git.daniel@makrotopia.org>
 <avhRv2PdtfFMOu2v@makrotopia.org>
 <DMWGDF7FB9IX.4M4NOJ417NRA@bootlin.com>
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
In-Reply-To: <DMWGDF7FB9IX.4M4NOJ417NRA@bootlin.com>

On Mon, Nov 16, 2026 at 08:22:23AM +0100, Luca Ceresoli wrote:
> On Sat Nov 14, 2026 at 1:19 PM CET, Daniel Golle wrote:
> > If there is anything I can do from my end, please let me know.
> 
> Yes, you can reply to the questionss I asked about some of your patches.

Sorry, I missed those replies, I've found them on lore now and replied
to them. Let me know if you agree with the proposals, and I'll prepare
and send v9 asap.

Cheers

Daniel
