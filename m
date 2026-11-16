Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794834894;
	b=TxpzXCNTE1zcMHy4e+Npt3/MosCPyImRE1w5T96VvA9ZU4zVJqhFNghS0+QmI+PIStdi
	 NgaKriqjcoVTyQdzkg9rJKEjCc08LMJ4GNcKD6cam4/hsDoKxHWKiyL6cBHQXo6qvbI/N
	 zE7RJDwmU0HI07rZ5mOaovzgbQK2MdmHjQIH+9XwYTsqIaSvPePUCR1M+te5NbNGZ+N6F
	 Imq5AuPk1mqLyVdvh3fEKAxhJdNbMpoDElDzYky5fnxo7vi5IWM8AIndnqd4PCRLZY8CP
	 TbPTKr7PnUTBZSUKdJQCgLj34uONVnjNKUTp/IDThjqlg9uLz3E+ccJhECC+lXYrbpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794834894;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=saSSu8OJb34DRRyfzx+SMprQFdVlTOpbeYoIc7lod+g=;
	b=UywmHcNLEEIm/TALGrUROvQDMmyRwDHZVt7bdGZYDbjVzXw9z5bWpwdhBylzblnzS9AN
	 RxuxKR9EumEu5UAzQubuf7gNLAtmyfTGpZ4JdObWbV2n4CZjP4/+QWMO/McfeAw69wmDh
	 9ajINgTn0lh8ObOT+Nj7FlNrDxP2zuJ7YxSvmnbkhR5kww00crJJhkwSI2Hc2wj1Zr+ha
	 lVH+PCAj7gL5W0vPokiYYEjZm3NrD5lWjYrJQto2HhIWVpens0WM1q/WCtBy7z7DuLhg9
	 3bxvSCXgf6ZfdxhT0fZhTM3ypr/T6b5HXnf3HZAPvxmOm/CCYWkvwsGuIgQXAylLmOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=5SfnfT0w;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F033606A330;
	Mon, 16 Nov 2026 13:14:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F033606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=5SfnfT0w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=saSSu8OJb34DRRyfzx+SMprQFdVlTOpbeYoIc7lod+g=; b=5SfnfT0wIk+W2UiIuxKOPa3AId
	p7ln8yC2lcl7g3wnoflEQwJnz+p/UTqrARj3M4+SWPwpaREJ7WGoc9kxhkW0UjTdQOAPTsuwO70MU
	fVB/oyTcNczdTMnSdNiuaWCGppqdmMF7rmRHMEf3Pa9ujbd7xGzlEehWj3FW2zE/cXe8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xSwXe-00Guz6-3Q; Mon, 16 Nov 2026 14:14:38 +0100
Date: Mon, 16 Nov 2026 14:14:38 +0100
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
Message-ID: <b84021aa-f843-4668-8172-0afcbb97c27f@lunn.ch>
References: <20261115-submit-acx00-phy-stats-v1-v5-0-ed81a7f54373@gmail.com>
 <20261115-submit-acx00-phy-stats-v1-v5-2-ed81a7f54373@gmail.com>
 <37e4b9b8-d381-448f-a2b3-b92d7bd9033d@lunn.ch>
 <CADvTj4qh8Pvss+xEwcjshodwv-yN6haP-9aaeRXg1ydSu5ibVg@mail.gmail.com>
 <d3f2dc1c-9daf-4b5f-903b-657ae3f32647@lunn.ch>
 <CADvTj4opiu_vhat12BRzk61b7ymG+g12c2aoK+rcZHjpWZjL4Q@mail.gmail.com>
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
In-Reply-To: <CADvTj4opiu_vhat12BRzk61b7ymG+g12c2aoK+rcZHjpWZjL4Q@mail.gmail.com>

> > Think about it.
> >
> > If you don't have a MAC, you don't have FCS.
> 
> There are existing mainline PHY drivers exposing this functionality.
> The QCA807x/QCA808x drivers use qcom_phy_counter_config() to enable
> CRC checking, and qcom_phy_get_stats() reports the RX CRC-error count
> through ethtool_phy_stats.rx_errors [0]. The IP101G driver also exposes
> a phy_crc_errors counter separately from phy_symbol_errors [1].
> 
> This demonstrates frame-aware diagnostic functionality within these
> PHYs, rather than something every PHY necessarily implements.
> 
> The generic byte counter need not require that functionality. My
> question was whether rx_bytes should count received bytes without
> conditioning the count on FCS validity. ACx00 could then report its
> hardware byte total through that field, including bytes from frames
> which its separate CRC checker identifies as bad.

Read 802.3. What does an 802.3 defined PHY actually allow. That is
ideally what the kernel should support with these counters. Lowest
common denominator.

So i would say RX bytes does not differentiate between the frames the
MAC will later throw away because the FCS is wrong. I would say it is
also O.K. to include the preamble, and the FCS, any padding up to 64
byte frames, etc.

Since this counter is not actually defined by 802.3, i would also
allow some flexibility in its meaning. Different PHYs might have
slightly different meanings.

Look at it from the other direction. What is your use case? Does the
exact definition actually matter? Does it matter if a different
vendors PHY counts it differently? Does your use case require cross
device compatibility?

You have not actually said what your use case is. For new board
bringup, debugging broken networking, the exact definition generally
does not matter. The PHY RX counter is going up, the MAC is not,
something between the MAC and the PHY. Neither the MAC nor the PHY
counters are going up, something between the RJ45 and the PHY. The
absolute values don't matter, its that they change which matters. But
maybe your use case is different?

	       Andrew



