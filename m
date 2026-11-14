Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794692764;
	b=KtuaVfsIHMBZBAyxJm/kZs1z1Qgqx4fTp95ctGkMAQwV2EqZcPdA3mbV8XWGOM3jTjrF
	 Pzx4z8AOTzRXIriupdW3UctO45LOyUJLSebI21p9T6RS+5l5kRq/AW5XSpxcn8Ay/Q4dz
	 jIocA7TjcujmdYakDRZwA6wjoxONyhhzNkfHeiy+gjAT9Put9AZhjMdcOVn/JMJEJjHIO
	 F8UU4a5xsXNZ6jJNrlynyDqGbYRUmBy0m4nyMkybSh/wV7HxlMmK/l/cxKPH34aNT2gA4
	 Ji3+C5is7gRityqV5BtEUyMUXZ5fA5RoGoxVAjEXi+CGFdHcLUZwjVsHyaju6NV4i4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794692764;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=gqg88/emFc38P4J1Mas5qTG5S+BH3tBGNUdqoIHsm7I=;
	b=bvwscu6/rsonQnRD+8u8OJ/PPM2OYWKFomRmio5q4Q4/LsIxKukVtCJ831kfomP7hhuv
	 MWFvZ6pwdaN9CYBbMEWgZi8mTDM66Py0cgNK36iOjzzGtZ0Dn1vKR1AHES40uKjZnvjyM
	 +395GWA6gK6abEwLHgYmjiOb7xMAo1757+PQd7jThhRGmYz8NwdWj2HGnjA7S5PHnJgIu
	 LuPPhlVIlCQlgucFLohPbuZL8d/f6g5kgBtT6OfSMdgQYIG1GpqAlGLOCb19LWvt1J6Pt
	 aemskW/wE3NWUEckEnWayBDyAsLhWLjOqTxnoExUrt2TZRSQ6C3OGWZD9B91LqaZNRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=R4aioWO4;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1140606A323;
	Sat, 14 Nov 2026 21:46:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1140606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=R4aioWO4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=gqg88/emFc38P4J1Mas5qTG5S+BH3tBGNUdqoIHsm7I=; b=R4aioWO4OX11sBMgPDbwz90NWc
	G4oO/MrOZDziirRTPzZZ+D4atniVjcEpLbQIrlXlHHDSQjRmO/2hJRVdqs+pVo+mEBI6hI5S8D69C
	TgJVL0UclzH3qecoZ8IY9wmP6ZlLsl9c3yGycBo7Rztnl/4dUI4F0R4QsqslbT5UhSRs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xSLZF-00GXW7-O7; Sat, 14 Nov 2026 22:45:49 +0100
Date: Sat, 14 Nov 2026 22:45:49 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: aiyengar1990@gmail.com
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2] net: stmmac: dwmac-sun8i: Fix use-after-free
 in the MDIO mux error path
Message-ID: <f4a0dbf2-4266-4397-a1f5-62b1bc7f3fb2@lunn.ch>
References: <20261113-sun8i-emac-mux-uaf-v2-1-6203666b2687@gmail.com>
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
In-Reply-To: <20261113-sun8i-emac-mux-uaf-v2-1-6203666b2687@gmail.com>

On Fri, Nov 13, 2026 at 07:55:00AM +0000, Arun Iyengar via B4 Relay wrote:
> From: Arun Iyengar <aiyengar1990@gmail.com>
> 
> If mdio_mux_init() fails after the scan of the internal bus has powered
> the internal PHY (the external bus returns -EPROBE_DEFER, or an
> allocation fails), the dwmac_mux error path puts rst_ephy and ephy_clk
> and then calls stmmac_pltfr_remove(). sun8i_dwmac_exit() then unpowers
> the PHY through the clock and reset control that were just released.
> 
> Unpower the internal PHY before releasing them, as sun8i_dwmac_remove()
> does.
> 
> Fixes: 529254216773 ("net: stmmac: dwmac-sun8i: Balance internal PHY resource references")
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
> Sashiko's review of another dwmac-sun8i series of mine pointed this
> out. Build-tested only (arm64 and arm, W=1): I have no board with the
> internal PHY (H3, H5 or V3s), so the error path was not exercised.
> 
> This patch was developed with Claude (Anthropic), which checked the
> report against the code and wrote the fix and the commit message. I
> reviewed it.
> ---
> Changes in v2:
> - Target net-next instead of net, drop Cc: stable (Andrew Lunn)

Maybe i was not explicitly, sorry. If it is for net-next, it should
not have a Fixes: tag.

	Andrew
