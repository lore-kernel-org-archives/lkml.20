Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A737447F2D3
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 16:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788451794; cv=none; b=fDxe/6C7cvslJ9yV7yZXOOmw/4toci/PgLCbUM5D9rVMvPpYepSiFJw1CSOpddrfBQCXXsGlJ7Ll2DruyIsGGfKmVJmchoKGaKBKejS76q6TBJAPLni+FWZ/ZnW7Go1GSsP3SE9R1zodcCIj9PJDoPHLEyoRS+Z2fzl4fAScZfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788451794; c=relaxed/simple;
	bh=y9xlXomUPjh97sBuED4lVkdt0i/ExCaifL5j/pOcuIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U384f7j6JPcneEw5B3oq1AnvgBSOrfKdn1TcmdAFQuFIVOeXN7Dk4QBCBp2hxyKQAf/a/KCOFoUAwLW/jUNb4cP8yz92l6HiMZ+bqrHAG0xKwc9psA7hr01VjoCb/ozRGh19+YNwPV9FtR9kJ687KtmgzHvtdtPlNig9H9NrNX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=f62wACns; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="f62wACns"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=0F2j0b3N5nABk+G76sOWdFQNdQLNUEsOfL8WiePX1eU=; b=f62wACnsBJRZajkD5HjKr+au6x
	g/J41+y8dRpjPLFdC3+6o5J0eTXoKedc8Wd4OZkPPP4d6bvf00zXXWKZrSkf1+13SK5zl4G//t/0f
	+qA5mDF/uFAVm0e7SodRu3Fil+dYJ8mfxw+Z6SnBbYIPuekFphYJ+NvA0EC78LmEDQHnrx9IhErg4
	vRhKxaF9U9/jPQRoGVaEkI0rr4qChRrBwsgND8F2iEha9/uaFvr7dNJwUXcjQvuOqkLXIyYWeDq2w
	s9mwTh1BWr7eiDXBXIPiJqJiga6YLmBcvvh0j+B+/MY6KDZX4gYLrZQgjtmuQ7Rkw/b5PpAFAKata
	Py3kjq/Q==;
From: Heiko Stuebner <heiko@sntech.de>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Simon Wright <simon@symple.nz>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Andy Yan <andy.yan@rock-chips.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Algea Cao <algea.cao@rock-chips.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/bridge: dw-hdmi-qp: use drm_hdmi_acr_get_n_cts() helper for audio N/CTS
Date: Thu,  3 Sep 2026 18:09:14 +0200
Message-ID: <178845174737.2601151.16427479820258337465.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <86fcf349-0a7a-4618-9001-612371b0f71b@symple.nz>
References: <86fcf349-0a7a-4618-9001-612371b0f71b@symple.nz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 21 May 2026 19:36:47 +1200, Simon Wright wrote:
> dw_hdmi_qp_set_sample_rate() open-coded its own N and CTS lookup
> tables and search/compute helpers, but it lacked the out-of-table
> CTS fallback needed by strict HDMI sinks at TMDS rates not in the
> table.  The original LG G3 OLED audio mute (linux-rockchip 070633)
> was caused by dw_hdmi_qp_find_cts() returning 0 at 185.625 MHz,
> leaving AUDPKT_ACR_CTS_OVR_EN clear and falling back to the
> controller's internal CTS auto-measurement, which produces incorrect
> timing on the wire at out-of-table rates.
> 
> [...]

Applied, thanks!

[1/1] drm/bridge: dw-hdmi-qp: use drm_hdmi_acr_get_n_cts() helper for audio N/CTS
      commit: a9f09b5ea0c3db1e2d4c0f8d3ebdd612d8aa0366

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
