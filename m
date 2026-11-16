Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794852726;
	b=sFWVliv2IVSf1Tkbg0vBap/Y2bggPGaJseW4iZ8j61hagxeZjLH65DFBK5tVwg2wH9iK
	 1eWWPhnUXNx5v7q1faUTI0+v5UlMYzLWvG8uwT4RuJa+K3+ZfPAKKo0+wPU0VKnYqIB7R
	 0oHnHiYLGCBo5z3xSHY/oKNGdcMJZYhzDo0RxC7sC2Tw1Z1TpTozbQKEiJR8TwFD30j+v
	 0n2Hh7h4o4Tbc53pusY/DhrQ2tzhVzbJmAYLMxlMgthUH99Srk66FXyoxyjLhWEpzgMms
	 e4ERFyJqUiPlHwSlN14wFmEcDcL6OjCJI/YyVqVIFTLdqLGnIKwVaNNxX3wtkTQseag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794852726;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=lnYA9xwRLKMC/0Lr3E1MKv0dCp5XHmuZfnB0s7sDW/Y=;
	b=aUrnJiqw0doodZVV7wrrAzDA6X/GfktjyR03IqvMNFa6JUaabV5vED0tO+5kyA5zcCTg
	 djyjP/cauFf/cs/jw5LXuVPgeypoHVJrXcHbrbqtwA5xs/96icS0WhpHkPEvAR/y1dEZ7
	 bPnSfK5YX0O1tjqRQMtH++5lxGYjV5MXpO3HaLWgzCKIk7LhccY6BincCSAMoZbdsC0cN
	 p7VuiLngEd8HkTZhm1cuTqGsx4xC5Lw3FApe1BWzwiG6VObV4zEIqWKxIjmlPrTucwZeR
	 wkKXhSEYLNppPQ2UmHm0pQt8R0EewdAU4FvdV+nBdRsSOtIej7XVLAA2tzRNZdbG/yQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=VS4DUEy0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E98606A31C;
	Mon, 16 Nov 2026 18:12:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4E98606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=VS4DUEy0
Received: from ptx.office.stw.pengutronix.de (ptx.office.stw.4.pengutronix.de [10.9.0.3])
	(Authenticated sender: relay-from-ptx.office.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id A8518201F22;
	Mon, 16 Nov 2026 19:11:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794852718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lnYA9xwRLKMC/0Lr3E1MKv0dCp5XHmuZfnB0s7sDW/Y=;
	b=VS4DUEy0Kr0nCe1Ga/vZamVSmmOqOTz4XH39lb6Fv71Lk+lqdLRcpFeZg9DrDlzhCt158D
	o+oIXaEUwR2x+H6Bg4/is8wBibuzkMa8DSEbeLLsozSnV8TFg4W2XhTdrqmvYkA6AvN9Fw
	nYa8lrRGp2avyvpoAXbjrYBWfjp1BYCXQY73elUDeovmuDoGieYWtMc77nR9/Wgqem7NIu
	IKcFgG0fq7tRC9fbBn44Kh4/CAFEPMZ1pwPaJyzd451q8pnlA+ymOh5UIYqqcB3pSnIw/D
	BQ0H2+LZd4imA60N+NRgJJ6S+yVE8XGXE0jdx1k1Bc6/woebKLdKm+sEHh4gHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794852718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lnYA9xwRLKMC/0Lr3E1MKv0dCp5XHmuZfnB0s7sDW/Y=;
	b=AhD545BxEDvDCLQCdWqUofc30juAYoSi25n5LexAlVg5GnWRNoSvYXzTkXsDHXidLmdCjm
	SkxuzsAZC5T5Mcf1zcKGmGS0qAiRzM+Ly56TFGiGekv87UxJJbe5jQd9Q0dW6tGW9zeb2M
	MadLx4ZMVcyxOFXN0ms4aCdQleyOQFdjr81VGch8WsoowPXDd3AMZ3oZES9zQGORuo2TLB
	c2FIG9uO3IHBohAGdQE53pC7s7E2sy9CHtIZuNS6ZF0FDc5BxTzpqS1V1p+YON4DG3wk1O
	h1Pz7IGukTAItxYDw4VMRNXVwHiLbHtt/6ekb6GaIkCCLoiAuveEy57dcDKhqw==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794852718; a=rsa-sha256;
	cv=none;
	b=L8ntS7ewq8kl+/2ve0D5zUw+4hGGKCobeJgB8lWqfsqMfaj/EB0WN+NKIdkBebHkCUDAUl
	4zW4Lx4sFyiZrD1vLueMQ/+TdFuydfvpBoYWbOP4yVZJSAt3TfnKwpyszMWfsIIsCq4tlA
	lzrSifWN9E1A42X0+RC3vWYzjt24G+UwhvMJHCAmPp2QLPYiFtd+dvZlMEQVv8/hJi4IW2
	4wA1M87eWCI2PZymaReAGxXFT4sHUZiWPUcVta6qLdZBfOIpXJ7alA3dedCrqEahWbSGA6
	P3ofIdkQSIkIcvkdSiuu6nSw8v9GtvgYWCk7xyLRfR6Mfm5swiGhrqrQRN0cqw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-ptx.office.stw.pengutronix.de smtp.mailfrom=ore@pengutronix.de
Received: by ptx.office.stw.pengutronix.de (Postfix, from userid 1058)
	id 82B711BF88A; Mon, 16 Nov 2026 19:11:58 +0100 (CET)
Date: Mon, 16 Nov 2026 19:11:58 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Andrew Lunn <andrew@lunn.ch>
Cc: James Hilliard <james.hilliard1@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next v5 2/3] ethtool: add a PHY receive byte total
Message-ID: <avtHbulALsI61uVr@pengutronix.de>
References: <20261115-submit-acx00-phy-stats-v1-v5-0-ed81a7f54373@gmail.com>
 <20261115-submit-acx00-phy-stats-v1-v5-2-ed81a7f54373@gmail.com>
 <37e4b9b8-d381-448f-a2b3-b92d7bd9033d@lunn.ch>
 <CADvTj4qh8Pvss+xEwcjshodwv-yN6haP-9aaeRXg1ydSu5ibVg@mail.gmail.com>
 <d3f2dc1c-9daf-4b5f-903b-657ae3f32647@lunn.ch>
 <CADvTj4opiu_vhat12BRzk61b7ymG+g12c2aoK+rcZHjpWZjL4Q@mail.gmail.com>
 <b84021aa-f843-4668-8172-0afcbb97c27f@lunn.ch>
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
In-Reply-To: <b84021aa-f843-4668-8172-0afcbb97c27f@lunn.ch>

On Mon, Nov 16, 2026 at 02:14:38PM +0100, Andrew Lunn wrote:
> > > Think about it.
> > >
> > > If you don't have a MAC, you don't have FCS.
> >
> > There are existing mainline PHY drivers exposing this functionality.
> > The QCA807x/QCA808x drivers use qcom_phy_counter_config() to enable
> > CRC checking, and qcom_phy_get_stats() reports the RX CRC-error count
> > through ethtool_phy_stats.rx_errors [0]. The IP101G driver also exposes
> > a phy_crc_errors counter separately from phy_symbol_errors [1].
> >
> > This demonstrates frame-aware diagnostic functionality within these
> > PHYs, rather than something every PHY necessarily implements.
> >
> > The generic byte counter need not require that functionality. My
> > question was whether rx_bytes should count received bytes without
> > conditioning the count on FCS validity. ACx00 could then report its
> > hardware byte total through that field, including bytes from frames
> > which its separate CRC checker identifies as bad.
>
> Read 802.3. What does an 802.3 defined PHY actually allow. That is
> ideally what the kernel should support with these counters. Lowest
> common denominator.
>
> So i would say RX bytes does not differentiate between the frames the
> MAC will later throw away because the FCS is wrong. I would say it is
> also O.K. to include the preamble, and the FCS, any padding up to 64
> byte frames, etc.
>
> Since this counter is not actually defined by 802.3, i would also
> allow some flexibility in its meaning. Different PHYs might have
> slightly different meanings.
>
> Look at it from the other direction. What is your use case? Does the
> exact definition actually matter? Does it matter if a different
> vendors PHY counts it differently? Does your use case require cross
> device compatibility?
>
> You have not actually said what your use case is. For new board
> bringup, debugging broken networking, the exact definition generally
> does not matter. The PHY RX counter is going up, the MAC is not,
> something between the MAC and the PHY. Neither the MAC nor the PHY
> counters are going up, something between the RJ45 and the PHY. The
> absolute values don't matter, its that they change which matters. But
> maybe your use case is different?

I agree that for bring-up the deltas are enough.

In the field the question is usually: is the board broken, or something
outside of it? The MAC counts FCS errors both when the line is noisy and
when the xMII corrupts frames. The PHY is the natural place to tell the
two apart, but only if we know whether its error counter checked the
FCS. Without that, the wrong part gets replaced.

I have seen a board where MAC and PHY both provided the xMII clock.
Frames were lost only when the clocks drifted into a bad phase, so
production tests did not catch it. A PHY that checks the FCS would show
a clean PHY side, while the MAC counts FCS errors from time to time.

So the meaning has to be known, even if it differs between PHYs. I am
fine with that, as long as rx_packets and rx_bytes describe the same
frames and the driver says what they include, for example which errored
frames are counted and whether rx_errors counts CRC or symbol errors.
That is the metadata I suggested in the v6 thread. The ACx00 byte total
also counts frames with a bad CRC, while its rx_packets does not, so it
does not fit rx_bytes.

Oleksij
