Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F849466B03;
	Mon, 21 Sep 2026 10:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984988; cv=none; b=M0rFn3rz9u/nSJFUY8obRnFMVH+TuaAgGnwhVt0iD/bKHwQUTmuUg8HvShi8qvrRMwFYb/wpKPaohTa7Us0coeK50x5hR1VSecOct6aubiR0LhVqW9RRSRyb3eYvdUOMyJ0Q4/voZyxj4j3ARun6KLDe7GdWq92pets2EtSJH0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984988; c=relaxed/simple;
	bh=wse+kezUK4OPr1Q8vimIEyV46wqlvIFGwwV3Za4Rx2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UNEfZsQmHmfTbKJDQXGLF4EeD8wf1QemYUGORtfQUS0gdm8mqQOlcfrLEBbnNvn0LsyTTAG94azZmPq7jBXKUwWduLCu/GOBsw/V0Wc5mzOIPCVrkytISbleFdEjI7TIDMJhC8YShJp4wpKv16OQhJmbacnCF7nVlgtvPqzgUfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=cuLLnOrI; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="cuLLnOrI"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 1A4FC1F947;
	Mon, 21 Sep 2026 12:03:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789984984;
	bh=4lv/4qA49zZhVU6Mtn/HDxpZJGQJyADrP9l8XahpZC0=; h=From:To:Subject;
	b=cuLLnOrIpN8MYL71+U54afnRLtYNj/apQyXqHsXD9V/kHSFYbwoBTBFnCQcYdNKDH
	 fMg36K1GT5vECr5fNb2Db3WPSzoY1SLhnGhqu8eYP4g1TnaBRQxUZ92knI4Ka3haIW
	 +P2RCIwINK245R2oFTShmrgCQJcLEfMR79X9ovppMS2DxPcGQdDacjfU8LwDyRu4nE
	 JAy9bK13RJq9ryRnODkiNkcdIr/RtUDSo0YvvkB7DBaYELvv5NFoSGOdaRujsitttc
	 wGenHDupm2H7gCaGJ98fMkAx1rkJUNRn72umjS/GD/kz5KbhwC/qzbmeDNK+HGsL3t
	 mMY8HON3Y+o9Q==
Date: Mon, 21 Sep 2026 12:02:59 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 0/3] drm/bridge: Add Thine THC63LVD827 LVDS encoder
 and 10inch LVDS panel on Colibri iMX7
Message-ID: <20260921100259.GA61633@francesco-nb>
References: <20260908100230.83796-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908100230.83796-1-francesco@dolcini.it>

Hello,
just a gentle ping on this.

On Tue, Sep 08, 2026 at 12:02:24PM +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> This series adds support for the Thine THC63LVD827 DPI to LVDS encoder and
> afterward uses it to add a DT overlay to enable the Toradex 10inch LVDS panel
> on Colibri iMX7 / Iris

I did not get any feedback on the binding (apart a small comment from
Frank -> thanks!) and zero feedback on the driver. Maybe some DT and DRM
bridge people can have a look?

Thanks a lot, appreciated.

Francesco


