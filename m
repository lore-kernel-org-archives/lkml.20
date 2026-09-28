Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59624AFE29;
	Mon, 28 Sep 2026 11:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790595639; cv=none; b=fmFqt9d+hdOKRaUnb9Sf4x1lFSEftIxeKVca1A6vVEhFxd74yipI2rxazy748cczfDuw2fL0jT1JqOQUHIfuAZAY3lA5dC91IDvWnhSGpCkXiDV+n+0ZzhE6vMhjLNPTmZXTvabs+AsAsAVexTLJs5D6qqXGUFT1byS7JwykL4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790595639; c=relaxed/simple;
	bh=PwQabp7vFQkCJip/+vQsLqJ30uasUYxGcmKrjVXqZsk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oMEQENd63xGjVTUVpRp4oeiMFEJnzTzEgT9lZgrbppCRVPCLAyUIpwua5tvwzTunTNbtZXtIJPhn4z2tbku++fdDT8PUuGQdtetZRT0CAXM86uTIEzYDulWoliZn7JWceVbSDIL82iyEPGJ/f1YWOizfeGPl25CW15bWbDNKYr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=Rxelkcja; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="Rxelkcja"
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 692D21FCAD;
	Mon, 28 Sep 2026 13:40:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790595627;
	bh=ck+TzNVilqQY/t61zy/0IPuuHN9u4piAsUrgySTcPUs=; h=From:To:Subject;
	b=RxelkcjaRglR3eb2moD+QraCo7PnUyVi/lf+U/cFdD3THIO9n9mylKZp73EuOyyut
	 5ocDi2VCuvtdt7gyFEvLG5s94oX0jVT1W0rIQvqjuJw+JFGr7SbLIHDJe+zyz7p7b8
	 JZXWmQoIQpl2WFqNOrgaQwj9I23fxizVRLlnOKq6Zxc/jr2vimC+pzQYuCWaishCCe
	 30QxymNkbJNqitbj7E5BhLoe6NrBVDENaVe2YGhzAIJvJiQXbRNQ2ECpKYmfn4Ar5j
	 2SI8yxIvZNRelfBXdePXtKtG4M3EI3Pg0BYZF18yyS/VKPe8DaUgLO0Yeb89aqjV8/
	 0QdpeUkZPFlMw==
Date: Mon, 28 Sep 2026 13:40:22 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Francesco Dolcini <francesco@dolcini.it>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>
Subject: Re: [PATCH v5 0/4] drm: mxsfb: Support LCDIF interface bus width
Message-ID: <20260928114022.GA67479@francesco-nb>
References: <20260917140042.118181-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917140042.118181-1-francesco@dolcini.it>

Hello,

On Thu, Sep 17, 2026 at 04:00:35PM +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> The width of the physical LCDIF output bus can differ from the input bus
> format advertised by the downstream panel or bridge.


Can the first two patches be picked-up by some DRM bridge maintainer
(Luca?), so that once they are in next, Frank can pick-up the two DT
patches?

Thanks a lot, appreciated
Francesco

