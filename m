Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794756352;
	b=uZrAyTG+1bYZq0/suK9DNkGZm4SSeuJYRJ/ilbrlt9PP+3dvTW2sh5KwYScF66p782hZ
	 RDrCOUNdUsTSVNShDk9jlF983m7zsYlvfm8cuD7l82O3MVeW1gFYpo47vY84l04SIdDA9
	 O3rwuv4kfAJcpFxpVA7zErpqWuvbVyHh/c6gQ3XSkvSg74Hwa+yBWjoBqIJ4jmGoO38jq
	 Kh9R7E3tFAlz+fH3cF+mUU0Pl6ZWynPptAxtkJJvyYkUZayCnAHABKykkix+XOaS9wG6q
	 oNbxxT4iieucjCuOCjC3JmgnXYdPGvPsk4vHzzndt6f0Dww0B1iqBmdMF6UfDmGiEtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794756352;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=Y6z3pT2mfMpUAyOstamDkN7k+wTTsLHL0mdr1VkgXOM=;
	b=xY7050o8C5nmEncdboQYlAsKXw0y6nBrhmGcdE6wEGgCLqH3s2GxwAE49RW1fq0WEU+Z
	 nVuYW8xh9OrQtr2ZRf/hqNauBtBgX/0vpvONulOBGkHx9U97J+0bhvvlHdzKxEANcPMcy
	 9E0yRy7M36EdML8yTtkY0JswJw7G+23+ITtbmRMGe2cwEGZq4crohBJOKT+56shwp2YlX
	 mtLmSM3xdj9X+i7ZgrPAD3DKExq+Bn8AON1rP4gnGa+cqZ7MDBfmTpPOv5XYREFQUeqwt
	 stMxp37wnSWS3c+Opit589mNDeZW6n40QQ428FJGUh0mR/uG1QqIfUmKl1URvjjjeEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=lrRCbPRl;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3F9606A31F;
	Sun, 15 Nov 2026 15:25:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC3F9606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=lrRCbPRl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Y6z3pT2mfMpUAyOstamDkN7k+wTTsLHL0mdr1VkgXOM=; b=lrRCbPRljZCKr0VZrEvo2TJ64H
	SNRqAV6LFPlZFqWvRyi3xN9efFWlE90RIhEqFHBL6MZEMYIfMeu6otgXSoXWhUWoOcjqukrD5wOsT
	/oC3QSoLQ2ATDchRs363GaAQpCA1Rj4HAJeDJ0OPXK5PSopMBxD2mFK/ZEHBH+zTHciQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xSc6v-00GdLG-Az; Sun, 15 Nov 2026 16:25:41 +0100
Date: Sun, 15 Nov 2026 16:25:41 +0100
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
Message-ID: <37e4b9b8-d381-448f-a2b3-b92d7bd9033d@lunn.ch>
References: <20261115-submit-acx00-phy-stats-v1-v5-0-ed81a7f54373@gmail.com>
 <20261115-submit-acx00-phy-stats-v1-v5-2-ed81a7f54373@gmail.com>
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
In-Reply-To: <20261115-submit-acx00-phy-stats-v1-v5-2-ed81a7f54373@gmail.com>

On Sun, Nov 15, 2026 at 12:45:46AM -0700, James Hilliard wrote:

> The generic PHY receive-byte counter describes successfully received
> traffic. Some PHYs instead count bytes in all received frames,
> including frames with errors.

In the general case, that is wrong. A PHY basically does digital to
analogue conversion. It takes a stream of bit from the MAC and
converts them to analogue signals on the media. In the opposite
direction, it recovers the analogue signals, converts it to digital,
and passes it to the MAC.

Thinks about SGMII. When running to 10Mbps, the MAC has to duplicate
the bits 100 times. At 100Mbps, it duplicates the bits 10 times. The
PHY then puts the bits onto the wire, it has no need to understand the
duplication, the boundary between the MAC level bits, it is just a
dumb DAC/ADC.

In order to see frames, not a stream of bits, you need a MAC.

Now, some PHYs do in fact have MACs. Those that implement PTP for
example need to reassemble the bit stream into frames. Anything which
does MACSEC. Or rate adaptation.

But in the general case, its just a stream of bits. And the byte
counters should be for the general case. And for SGMII, the definition
is a bit more fuzzy, does it include the repetition or not?

If the PHY has a MAC, it can additionally fill in the frame counters.

       Andrew
