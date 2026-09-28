Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8695497398;
	Mon, 28 Sep 2026 10:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790590127; cv=none; b=aikCGmjfK6qNDEtdKgCE70fdp23q+I20HhoL9R6OrwNJPCT3l+iP+nyxoreCE7TnJpe1F9Pf+mlBHmUTDf9wWkg5neyKuQqhT7fWGmIjVMirCSYQuUmApneRpDwJq2c49z45p8TVBGDF7BeoGbmHHRp/CVt5hbJ/Hid7eqO6R1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790590127; c=relaxed/simple;
	bh=k6VynnZ+N0kAdeAd03ynKQPR8TBTY7wOhaOTHQKca+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d9h6VmQ4kWUyiFY/qtm60zR18nPiMxOUlZh2bwqI0EXVILJBFIx4puX6nL6LYiMfoU+w+oCVnvWiLPG76R45O2kYSnqjxvvKlznoMW6bM7nF3S/XIA36/aBmgPmP4OcJHes//9O2I4KzxPqFtyi8JK6qeQiIzPLXjrIqjCTMuaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cYi0UKhH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cYi0UKhH"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E36DB236;
	Mon, 28 Sep 2026 12:06:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790590013;
	bh=k6VynnZ+N0kAdeAd03ynKQPR8TBTY7wOhaOTHQKca+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cYi0UKhHY06B7Vg62VtL/Uqyke32Y27qqq3plWvR9m6EVW/CNEflE+5kqP2JeozAf
	 o8RgWh+ZMIiO8DNusL1tMpQ7W1egqmADBEVBq6ch6vulOHK4Q1qExGccxe3mT8xLGv
	 jVTbhMYiYuw0ld5Li3bK/+10oRYcX3LD5PSwMP9A=
Date: Mon, 28 Sep 2026 13:08:41 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Liu Ying <victor.liu@nxp.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Marcus Folkesson <marcus.folkesson@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Philippe Cornu <philippe.cornu@foss.st.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Adrien Grassein <adrien.grassein@gmail.com>,
	Russell King <linux@armlinux.org.uk>, Simha BN <simhavcs@gmail.com>,
	CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
	Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Chris Morgan <macromorgan@hotmail.com>,
	Martinez Canillas <javierm@redhat.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: (subset) [PATCH 1/2] dt-bindings: display: Use consistent
 indentation in the example
Message-ID: <20260928100841.GC22609@killaraus.ideasonboard.com>
References: <20260913123331.100293-3-krzysztof.kozlowski@oss.qualcomm.com>
 <179057359762.92994.13773102514654073802.b4-ty@b4>
 <8499ed1a-df9e-4e5a-b609-3da8499a47b5@oss.qualcomm.com>
 <20260928065837.GA22609@killaraus.ideasonboard.com>
 <ccb949ea-5fa9-47e5-be75-af8155328dc8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ccb949ea-5fa9-47e5-be75-af8155328dc8@oss.qualcomm.com>

On Mon, Sep 28, 2026 at 10:08:43AM +0200, Krzysztof Kozlowski wrote:
> On 28/09/2026 08:58, Laurent Pinchart wrote:
> > On Mon, Sep 28, 2026 at 08:03:18AM +0200, Krzysztof Kozlowski wrote:
> >> On 28/09/2026 07:33, Luca Ceresoli wrote:
> >>> On Sun, 13 Sep 2026 14:33:32 +0200, Krzysztof Kozlowski wrote:
> >>>> Correct indentation in the examples to consistent 2- or 4-spaces
> >>>> indentation to fix dt-check-style warnings ("example 0
> >>>> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
> >>>> re-indenting entire example just for that is too much churn.
> >>>
> >>> Applied, thanks!
> >>>
> >>> [1/2] dt-bindings: display: Use consistent indentation in the example
> >>>       commit: 370c5d9004f8b754351981d59fc26851bf943e93
> >>
> >> Thanks, but I expected no one will pick it up, so I asked Rob to take
> >> it, thus it is already queued.
> > 
> > Please explain your merge plans in the cover letter next time.
> 
> The merge plan was this going through drm-misc. It got reviews, no one
> applied, even Dmitry for msm only reviewed the msm-bits (second patch),
> so I asked Rob to take it. This was not planned, but result of usual
> drm-misc inactivity for bindings (many bindings were not taken in the
> past or with noticeable delay/pings).

If that happens again, could you please reply to the series on the
dri-devel list to tell it will be merged through the DT tree ? I don't
think there's any issue with merging patches that way, it's just
coordination that's lacking.

-- 
Regards,

Laurent Pinchart
