Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A0C3C09E7
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789479439; cv=none; b=IX5Ukd6IBWd54Qfk4jud57GRxcmwzfnS+R04mN1UEB6p/YzphqDYNC+C3d1c6zKVJb+LmysIDZf7e3uTWyEKT1qfwlBQ6lm5HF6J1iVZuYPTX6ej0WFRWI6OLx7iZ0dsfr5CZc42J/PSzL6+U5amWJ0OMTr4AhK4N9vnopk8U1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789479439; c=relaxed/simple;
	bh=09JMPUmRLDAazyiDuFBa/pP+61awWdH8GykDnqSq/Gc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OP+U0dTTHyrEuAcM4fOcOkYWWR1D2kCp1ZwbGkYheZ1Uvy+WEz833/Uhhr2v2autQgqO3ST0Wyh1/P1pxt9Zb3vJhYc0fa7s5oLBUmV1O1akLJ34fsZMAnWDHRg6Of+fwZgPdYA2CQ4jtkZnaGRoO2MOAEhQZzzZxgz0QACTGLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=ifzJbiZ4; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="ifzJbiZ4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=ldeR0B4GHt3b5GmwgKmYffkbyfoBxCcoI2N1ceTEtE0=; b=ifzJbiZ4sUYioCzujeRclD++2W
	raXXLxleGWSeduKUqRUmGxuy3tTqcS8Qniii5CeOs1hL0kjzRBxp6kMarv4OfAnmmhkeOZeBUKAW3
	MPQ+9Ptv/l4M5gFB2z6TPoAmk90ppF9gkMmh3m/Ixtpll1VP9lZKlJhc+HBpFCgDwi7RRseAvQAGa
	gmOPUlCwwuS7EQfDLMepixFqlRy/8bfcda/AKSF9gAMXDWHdEnJ4ctDEHADVPXIMBYAv6GPizIX1d
	ycdqxxV0hVVvWHrRquQQVhnny32EqSoOo3IEet5eNFvLFZnokuGEgRM+mPSO0vCkNgIiw5jqAhOed
	vHNXrz1g==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chaoyi Chen <kernel@airkyi.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH v5 0/3] DSI Controller improvements for Rockchip platforms
Date: Tue, 15 Sep 2026 15:36:47 +0200
Message-ID: <3800544.yaVYbkx8dN@diego>
In-Reply-To: <20260914013331.108-1-kernel@airkyi.com>
References: <20260914013331.108-1-kernel@airkyi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi,

Am Montag, 14. September 2026, 03:33:28 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Chaoyi Chen:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>=20
> This series is dedicated to enhancing the DSI controller and PHY timing
> interaction, refining the lane rate calculation, and addressing the
> associated hardware limitations.


Took me a bit to finally test all the different variants for a display
that shows strange behaviour. Sorry this gets a bit longer.


The display in question is the ltk050h3148w [0], display in portrait
orientation.

Ever since commit ac87d23694f4 ("drm/bridge: synopsys: dw-mipi-dsi: Use
pixel clock rate to calculate lbcc") [1] and the subsequent fix in commit
93e82bb4de01 ("drm/bridge: synopsys: dw-mipi-dsi: Fix hcomponent lbcc for
burst mode") [2], that display has its output shifted about 20 pixels to
the right, with the line then continuing on the next display line.

We have this display running on all the Theobroma-System modules, so there
is a lot of variant data :-) .

Your series actually fixed the PX30 part of that shifted output, but for
the RK3399 the results are sort of mixed:


What was confusing me was that in the Rockchip vendor kernel, _all_ DSI
variants use the standard px30 phy settings? The whole original lookup
table seems to be gone? And that replicating that setting actually fixes
the shifted output on RK3399 too?


RK3399:
	original:
		shifted
		mode-clock 59400, target_mbps 450

	patches 1+2:
		shifted
		mode-clock 59400, target_mbps 450

	patch 3:
		blank disiplay
		mode-clock 59400, target_mbps 400

	use static px30 phy with patch3:
		image is compressed in height and displayed two times one below the other
		image is _not_ shifted anymore (so left+right alignment are correct)
		mode-clock 59400, target_mbps 400
=09
	use static px30 phy without patch3:
		image is _not_ shifted anymore
		output is correct
		mode-clock 59400, target_mbps 450


PX30:
	original
		shifted
		mode-clock 59556, target_mbps 450

	patches 1+2:
		output is correct
		image is _not_ shifted anymore (so left+right alignment are correct)
		mode-clock 59556, target_mbps 450

	patch 3:
		output is still correct
		mode-clock 59556, target_mbps 400

RK3588 (DSI2) for reference:
	output is correct
	mode-clock 59756, lane_mbps 398


Do you have any insight, what could go wrong here?

I'll apply patches 1+2 as they're correct, but will keep patch3 out
for now.

Also Sashiko seems to still be unhappy with patch3.


Thanks a lot
Heiko


[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c#n299
[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3Dac87d23694f44af44a98d21dd77016f2756b6b1b
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3D93e82bb4de0196c4caeca1d8a6eef67863981d8f



