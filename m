Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794658769;
	b=HxIhilx937qqfKTZwCfCMkRlDLIRN1CYGe6FW2kawBCrTj0EYqCPnJX4Zm2cO85Ke5YI
	 CmDj13SIehHaL/g0KjWeRjG3rDmZrdbHSPbWdVRfot9IFW5aKmiOEFzLgOBYIHFuOyIh3
	 3q9FDQBhK1BFvFtugjSK1NPuaIEwb9iguWbPMtUq9aO44v1ze8R6iV6qqCf1Yt3G5Ouhn
	 trCIUxASLmBq/jsmbMzcLWF72pHAG5K2fmgBsBczcjcWIsIPBmn+5PbzwwBgZgsV8+sDM
	 8jxKPhb+2HZjmcmVBbpDxv/ipjUxE+98f+iDfOHEr+Ch0reALpPEHRQyTHIGI72GFxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794658769;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=iPdU50E1hdy4xDs7gL/aSv1EcKGyG/GxhYfWCSk8Yio=;
	b=f7lEh4o8Yf12J8jKRQD27CCiNvvXTc1N2jZdTY3skDKhx65QHJJ51Lu4SKaFRtnTB4l4
	 RBD4Cl1qEXm7Ced2/LRDVtf1JxW49N+j+yvoVnr/c4d1maw32oFzDB4LigHfenPPhRFK0
	 47w0aS1a0HtgXiMxiE0BZylWXRL1tA7A1L5FDd1P3oFoTRGKolKqFVyOu2SkyI0mIpCcZ
	 N0FPV8pBSnq7scx5aRXvaq+dUDA7YGjUOmRX7u0fSKOMS97nOgtobLgrtEeWMcQmLuV9c
	 k0dHY2hSJVJj3x5VIakIMs0JOozP2tuttXRoKYa7aYMUC4tEaezpwu63tFiDuNHBSZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F033606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 12:19:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F033606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xSCix-000000004N3-2XUv;
	Sat, 14 Nov 2026 12:19:15 +0000
Date: Sat, 14 Nov 2026 12:19:11 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
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
Cc: Jani Nikula <jani.nikula@intel.com>,
	Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
Subject: Re: [PATCH v8 00/14] drm/bridge: it6505: DP audio support +
 shared-DAI hw_params fix
Message-ID: <avhRv2PdtfFMOu2v@makrotopia.org>
References: <cover.1790552614.git.daniel@makrotopia.org>
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
In-Reply-To: <cover.1790552614.git.daniel@makrotopia.org>

Hi,

On Mon, Sep 28, 2026 at 12:49:25AM +0100, Daniel Golle wrote:
> Revive HDMI/DP audio support for the it6505, originally posted by
> Jiaxin Yu [1], rebased onto current -next with the review feedback
> addressed: &client->dev is gone (the driver gained it6505->dev) and
> "#sound-dai-cells" has since been added by commit 325af1bef5b9
> ("dt-bindings: display: bridge: it6505: Add #sound-dai-cells").
> 
> Patches 1-12 fix pre-existing bugs found during review of earlier
> versions of this series; they carry Fixes: tags and are ordered first
> so stable trees can pick them.
> 
> Patch 13 wires up the it6505 audio helpers via hdmi_codec_ops,
> unblocking the mt8186-mt6366 sound card which references it6505 as
> the I2S3 codec. Patch 14 makes hw_params succeed with no display
> attached, needed when the I2S bus is shared with another codec as on
> MT8186 "steelix" Chromebooks, where the speaker path must keep
> working regardless of the it6505 link state.
> 
> Tested on a MT8186 (google,steelix) Chromebook: the sound card comes
> up, speakers, microphone and headset jack work. HDMI/DP audio output
> itself could not be tested for lack of a suitable adapter cable.

Kind reminder regarding this series.
Some of the patches have received a review, others did not yet.
I'd be great to have the Ideapad with working audio without being
force to build with downstream kernel patches...

I've added Dmytro Malovanyi and Jani Nikula who have both also
recently been involved with other patches for the same driver.

If there is anything I can do from my end, please let me know.


Cheers


Daniel
