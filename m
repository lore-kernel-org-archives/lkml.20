Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.142.180.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819398;
	b=A5FQDcjbshwMD7BFVIiXoJnjkATY5/U4KWiQzjpBWBAljETuPEdZaoeOdglCh7eX1Y8+
	 j4WN1esGl0JoZi4D8i/KInqUZu7PpXcfAXOOF/kL1MUzJBKcJYQcEa02EgV1HU1edT3ab
	 EuWPrJXh7a/fodbl4beX4VvjP8jixxf4wsxtuPZVQMVk2AWHg6jb/hCq4nGn2qMwVQxdc
	 DzOuak0lt6GV8LrzSz09jPOMVrD0mYn0s2kCcQ87cu3FWAD7j2RuAmhVNqF2YpPzWgb8I
	 JTzKRLPT3i8dPUUk2QUffw04oUZkhc/8z92E7WUZE1PyTeWPrLmPakrA97oRsPdGl1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819398;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=nWHWGQOqMeeouKQY4a/YXbC8ScdtcsCKi4ObLazlgrU=;
	b=gkgcpXnr2E/0UqZ54/WEcGRbunTnKjdKHepQhziDP3xGDOvDYbi0iZSCowMj1twWiNmV
	 iIMOxqDUeX9RUpvL4zZ52WtMavlegU4WZMF3sGnaTsyLt1nD94PEIW46uSVptOer5uOep
	 aXt9FSj6CabNgH3eQkYq5zO7f8XAe1qz27wY3JrYUh2L/C7G8OHdwDeXaRyxsxegqGVvS
	 wR4222tbttppI1bRO+ZcmMVIXfdYCeGFNHE6gds7h9KlE8/863ekVcuNDFigZcpdSoR/v
	 ARBlciiKdx69w0EyrNoh2DyBeMRbMBJB5ELQSZvLeld5Jj8H9ehgJ5rHT1uKzYl7n+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=makrotopia.org;
	spf=pass smtp.mailfrom=makrotopia.org;
	arc=none smtp.remote-ip=185.142.180.65
Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0877606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:56:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0877606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xSsVs-000000007sv-10gN;
	Mon, 16 Nov 2026 08:56:33 +0000
Date: Mon, 16 Nov 2026 08:56:18 +0000
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
Subject: Re: [PATCH v8 08/14] drm/bridge: it6505: avoid division by zero in
 audio FS debug print
Message-ID: <179481904178.211952.8076269834336042526@makrotopia.org>
References: <cover.1790552614.git.daniel@makrotopia.org>
 <26ee2c94c42fb09c081201071cb5730c96c8c25b.1790552614.git.daniel@makrotopia.org>
 <179251509978.78870.2485132679226608837.b4-review@b4>
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
In-Reply-To: <179251509978.78870.2485132679226608837.b4-review@b4>

Hi Luca,

On Tue, Oct 20, 2026 at 06:51:39PM +0200, Luca Ceresoli wrote:
> By just looking at your patch and the current driver code I'm failing to
> understand what's going on with the REG_AUDIO_INPUT_FREQ register:
>
>  * it is read, but never written
>  * its value is used by:
>    - it6505_enable_audio() only for logging: is that logging really useful?
>    - it6505_audio_input(), just checking whether it is 0xFF or not; what's
>      that 0xFF? Is it documented? A macro hinting at what 0xFF means would
>      be better than just '0xFF'
>
> If you could share what that register is for, it would probably answer some
> of those questions.

I don't have documentation for it either, and with ITE gone there is
nobody left to ask. Judging from the debug print, which computes the
sample rate as 6750 / regbe kHz, it is a read-only measurement of the
audio sample period, and 0xff looks like the counter saturating when
no audio clock is present.

As for the logging, I don't think it is worth an extra i2c read and a
division in the enable path, so in v9 I'll drop the read and the
print from it6505_enable_audio() instead of guarding the division.
Without documentation I'd rather not invent a name for 0xff and leave
it6505_audio_input() as it is.

Cheers

Daniel
