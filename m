Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B244643F4B8
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788194059; cv=none; b=kj/U/ubBZsrvJD/RuH8gQKJi5mHGF7onoZrWBJNdmLwFHHioMKpijK9dT+ut3tZNefgxHh/fv7uNxlYQd7Nbi8NiQUTIplw/BELoX3XoJNBkqu/nq6E+A7Y+t9GKiq9HVNhgoqUyyynecJ8RSKhqJaaIIVNPtMdL68DAW3R5VSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788194059; c=relaxed/simple;
	bh=jOQ8YcDjhBP724npiodlTkEiFfBt6Rsg3hNEhswcfM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nrkq6uDQ/eU6wo1stgnvlAC4U7ikhsYwCevjjG/VHIum6W/YzkB63SeGhK3Jm4BFDdYCcWG/kZ1o+kKbYP4DczGTeGXB05v+Th6hwaXrhAubGjVUI9+1TdIW9uZdEWumdFKQi0Qx42F/sy/gqenScVhIZA+DP/qxEXX/vQt7DMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1x14xL-000000007ih-0eiy;
	Mon, 31 Aug 2026 16:33:59 +0000
Date: Mon, 31 Aug 2026 17:33:55 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
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
	Allen Chen <allen.chen@ite.com.tw>,
	Hermes Wu <hermes.wu@ite.com.tw>,
	Pin-yen Lin <treapking@chromium.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v6 00/13] drm/bridge: it6505: DP audio support +
 shared-DAI hw_params fix
Message-ID: <apWs89912pK8qK37@makrotopia.org>
References: <cover.1784947240.git.daniel@makrotopia.org>
 <7eebbd9b-3a5e-4d95-bbbb-8ba3a7238383@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7eebbd9b-3a5e-4d95-bbbb-8ba3a7238383@collabora.com>

On Mon, Jul 27, 2026 at 01:34:12PM +0200, AngeloGioacchino Del Regno wrote:
> On 7/25/26 04:57, Daniel Golle wrote:
> > Revive HDMI/DP audio support for the it6505, originally posted by
> > Jiaxin Yu [1], rebased onto current -next with the review feedback
> > addressed: &client->dev is gone (the driver gained it6505->dev) and
> > "#sound-dai-cells" has since been added by commit 325af1bef5b9
> > ("dt-bindings: display: bridge: it6505: Add #sound-dai-cells").
> > 
> > Patches 1-11 fix pre-existing bugs found during review of earlier
> > versions of this series; they carry Fixes: tags and are ordered first
> > so stable trees can pick them.
> > 
> > Patch 12 wires up the it6505 audio helpers via hdmi_codec_ops,
> > unblocking the mt8186-mt6366 sound card which references it6505 as
> > the I2S3 codec. Patch 13 makes hw_params succeed with no display
> > attached, needed when the I2S bus is shared with another codec as on
> > MT8186 "steelix" Chromebooks, where the speaker path must keep
> > working regardless of the it6505 link state.
> > 
> > Tested on a MT8186 (google,steelix) Chromebook: the sound card comes
> > up, speakers, microphone and headset jack work. HDMI/DP audio output
> > itself could not be tested for lack of a suitable adapter cable.
> > 
> 
> Whole series is
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Tested-by: AngeloGioachcino Del Regno
> <angelogioacchino.delregno@collabora.com> # Steelix Chromebook

Any chance to get this merged in the new cycle now?
