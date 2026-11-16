Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794804012;
	b=QGYpzKFxOJO9XPTU6+z5LSzp6QyTzq+ZNRHwRUzOHAFRrc/KMwx2XOGigF+nbEd+vmxO
	 g6RheCA82Vwf8UddMyuge24NLCPMpVsWHHAzln4e+LDFNt5hYrmLaYrimuDyVOtcPycbs
	 2HOYVhP2UO9Z2T4L4FlCfKxVOEtXMoN7zOgQA/Sheo+gPXkCgw+m2bFB+f9tNxeUoSE1v
	 cCnDIA4mhqCWrvBGNxMoE7wEan4VEVgQAxffix9hOWgdmAStu8m9qQYAJvILTj9/UZZpx
	 YMbk9Rg6VPkv08oefE5uhtnPClmUAJQ7kcUitfveAVK8jDed/vIIMbnWb29mx6zzqog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794804012;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=sWwEw+N/tUMf8KTGvE0p0U9rt4hRa07tRtC2pDcX9QQ=;
	b=Ab1VB3LMP2cEzdeM9C0nrHwqeWLNbOTduVcCLnkEJjnTR2Wsqnrl5OSre8BKfU02rCmc
	 N3/4wutyRe7tJih24GtzwOM60N1m7Bsr+sP2FU7i/vHugBjzCInrRPvywdkBUlwc4/Lun
	 3XRPQzLsF+M7kDYvkVK4+HtUb4CL4SdRzUB7EjhcHWo/gB2KCR5xYfRZGX/fpMFmsVviU
	 pgaai2gS5TriQ8y5yRRxG8lRM5BRNZ6uQ8avSwx2xAllSLTHhWD2kFBj2ro9edF5w970Y
	 m0/wgS7+kRqS9zhMXc7Fth/FBHNtpdqga5s9G4HX8ayPd/EGOX8OmiXrQ37wpseVhtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=XJ5kSQXC;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45797606A31C;
	Mon, 16 Nov 2026 04:40:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45797606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=XJ5kSQXC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=sWwEw+N/tUMf8KTGvE0p0U9rt4hRa07tRtC2pDcX9QQ=; b=XJ
	5kSQXCKrLHcytOzsrzR5/7W53+c0Bl9pbocsQlnrp/tuWm9v4XLcr+sA+MerGFYwCDogdU1Y0tELH
	uyqlvS8WX6VVuP1GRwDF59wa2/ujjheRl3i6BH5O5+DoFYgRbkPx8+QKmbgbILX4Ub5J/6qbKpWbU
	J6XIxPjOoTassmQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xSoVX-00Gnxf-Uc; Mon, 16 Nov 2026 05:39:55 +0100
Date: Mon, 16 Nov 2026 05:39:55 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next v5 2/3] ethtool: add a PHY receive byte total
Message-ID: <d3f2dc1c-9daf-4b5f-903b-657ae3f32647@lunn.ch>
References: <20261115-submit-acx00-phy-stats-v1-v5-0-ed81a7f54373@gmail.com>
 <20261115-submit-acx00-phy-stats-v1-v5-2-ed81a7f54373@gmail.com>
 <37e4b9b8-d381-448f-a2b3-b92d7bd9033d@lunn.ch>
 <CADvTj4qh8Pvss+xEwcjshodwv-yN6haP-9aaeRXg1ydSu5ibVg@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADvTj4qh8Pvss+xEwcjshodwv-yN6haP-9aaeRXg1ydSu5ibVg@mail.gmail.com>

On Sun, Nov 15, 2026 at 09:12:35PM -0700, James Hilliard wrote:
> On Sun, Nov 15, 2026 at 8:25 AM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > On Sun, Nov 15, 2026 at 12:45:46AM -0700, James Hilliard wrote:
> >
> > > The generic PHY receive-byte counter describes successfully received
> > > traffic. Some PHYs instead count bytes in all received frames,
> > > including frames with errors.
> 
> That restriction comes from the current kernel-doc definition of
> ethtool_phy_stats.rx_bytes: "Total successfully received bytes".

Yes, i found this.

> Should we instead clarify the existing rx_bytes definition to include
> errored traffic and use it for ACx00, dropping rx_bytes_total? That
> would leave the existing packet counters unchanged.

What do you mean by errored traffic?

Think about it.

If you don't have a MAC, you don't have FCS.

	Andrew
