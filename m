Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794757219;
	b=wfpe9SjGmcM5c4P/vY0yEaJ0jLkf5z2SCEZlCyrUTrzy0nmUIOZ9ZgR2UoopmnLt2G2j
	 3413l+toakqhPaW8j1Kcz9VQ3JS0I4Ae1S1cxQtNGoa3C6IGfiLb//n9AZP4D99aZxSV+
	 rINFsuqTfHtYK0qLvYdzSL2XW75pj9NbEYhiwwwb5YMzToUTm2mSrGWgLfBwJtt+fHbw7
	 sN3HjoWuDBJBxK9BSl4hXa/Q8OPsvilHh4UyvgVZk5YWPR5rIBu3AzlRQpRn0MvzkGdQo
	 1nFlGF/XY4XAjqgF0H82TP74HWCgYvXbQPYRpxlAEajYrIXmq3cs+vAfJ1aDQf0UO6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794757219;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=bPIObcCpstMVT58z9EEfKNxmTMDtqL8XKVOJge404XA=;
	b=uwZzxB4on7Evto5q+bq3E50mEuJPi0qZ7zQiCob871sQ2VEn4LqTqcs4mvycrylL3acz
	 tjgBMfBY4qVA/omf0DXOnAv9T2pIEPEfSeXg7x0OXHOgzbEp0i4j8tnHiYfwH9AAAbvjy
	 bx8MnlOZRGNLxGK/hWOr73q4utqnSfFx1vLJHx8AFA9+6KViZ5PSn6wg2d2u6vExnwaUL
	 IsW5T/cQPK0vgmK3de3yRnTS7JnZH4+nk7b9dz+c4z6W4Dg02T8jVMJl+fEEzXs22jmAg
	 krJAGmIFEr1MFaI8i99ko7iG/md1fKwHLkFurlLKFC+xe5Dj+8v6Nn8JYhumYhY3rog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=0wPdOtAB;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612F8606A31D;
	Sun, 15 Nov 2026 15:40:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 612F8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=0wPdOtAB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=bPIObcCpstMVT58z9EEfKNxmTMDtqL8XKVOJge404XA=; b=0wPdOtABb/1DvBn4wuVw0f9jFG
	Zc+cO0CosdnTTmEtvzVy2r3NvmIjfViMv16Qyh/CiTE8lxZDZEjlwpRCkSaiuKTDAQHCFM0mNqPAq
	HWGEmo4ur2qL2/MscWoZgzAZbKFzhbX/P3dFkywsceh61k5Ymr31lUqA3K0+4E9H7Ia8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xScKz-00GdQK-8a; Sun, 15 Nov 2026 16:40:13 +0100
Date: Sun, 15 Nov 2026 16:40:13 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Arun Ramadoss <arun.ramadoss@microchip.com>,
	Jiri Pirko <jiri@resnulli.us>, Linus Walleij <linusw@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vivien Didelot <vivien.didelot@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@pengutronix.de,
	Jens Emil Schulz =?iso-8859-1?Q?=D8stergaard?= <jensemil.schulzostergaard@microchip.com>
Subject: Re: [PATCH net-next v2 2/3] net: dsa: ignore the old ageing time of
 the port being changed
Message-ID: <f5375974-fed7-481c-b19c-c055f9309255@lunn.ch>
References: <20261115-ksz-stp-ageing-v2-0-7af27320033e@pengutronix.de>
 <20261115-ksz-stp-ageing-v2-2-7af27320033e@pengutronix.de>
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
In-Reply-To: <20261115-ksz-stp-ageing-v2-2-7af27320033e@pengutronix.de>

On Sun, Nov 15, 2026 at 11:59:52AM +0100, Oleksij Rempel wrote:
> Pass the port to the ageing time notifier. When
> dsa_switch_fastest_ageing_time() takes the minimum, skip the cached
> dp->ageing_time of that port and use the requested value instead. DSA
> updates the cache only after the notifier.
> 
> Without this, the minimum includes the port's old ageing time. During
> an STP topology change, the bridge lowers the ageing time to
> 2 x forward_delay (8 s with forward_delay 4 s). When it restores the
> configured value, DSA programs the cached 8 s again, and the switch
> keeps ageing at 8 s.
> 
> An automated review of the lan9645x bridge series pointed this out [1].
> I reproduced it on a KSZ9893 and tested the fix there.
> 
> Fixes: 77b61365ecef ("net: dsa: remove the transactional logic from ageing time notifiers")
> Link: https://lore.kernel.org/netdev/179180428624.434549.14425623884223795761@kernel.org/ [1]
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
