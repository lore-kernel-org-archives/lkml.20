Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794640772;
	b=r05ASegyiM6A85+EvPYKa55FtG+TgJOS00DBCvvKgrhz0mVLAR7SUayZkF6ISvuHFrvO
	 JwWiAxgeCbHzr1dwFZaSG9n8UPjpQBkzMzbYMPKTvVkkl9s1OnrARQvbH8ZmOShPpRCW6
	 L6cQNUjz7fuCl3cCPYUx6gP7JyqzUcWtMjm4rsoXv++v9ONfnH3Se9YeujC2a3PtLkYpT
	 GuRxG9FNjph24E3zpCoX7c/x5sDZj1V/h/OC93U01iYhyUPqbF7fy6YlKK/uU2HA1xXao
	 s0qvCPj65LM7oZNJGtRW5WevAk9Ir5wZizu+lGpvkyUZl2KwptUH7ApUOGrwaBLf4nQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640772;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=8/GdzvtxKmiHkx7Wprg5vBg/lLqnSbK4sHJwh0fCEF0=;
	b=1azGnS3Se2ISaTsEjGg8Fx1edFhy9yA0rqI7nTAoUPaD5h7oV3/kjU9/fK+Wn2QeFvo7
	 /n+8th9quiJsgP9wOpQAEz3he8ngeNoaK0n8iiEghnbeYxpKHpXV+RyHozaVf/PX+y7KW
	 wGCLrP4RpWdzspSkNjhazQRXIXt1omR+2ohvlstVXdYDs9BrqHX+6lwOpsTwNcdBFuGJA
	 fqB45/8eGrHi6FIkRfGzKAHBh2wIVsU44KKBzbnGGWxbYlOjvNcJJ4DFSOiOaanPFdyN4
	 G+aIR/zeVw5z4D64jvRaSulbosBVqWhU9w1eKuSAVH2hlBcnYSAL+pGQepxP+fyEJig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=H6iatDZ3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0374606A329;
	Sat, 14 Nov 2026 07:19:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0374606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=H6iatDZ3
Received: from ptx.office.stw.pengutronix.de (ptx.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::109])
	(Authenticated sender: relay-from-ptx.office.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 9900A20167D;
	Sat, 14 Nov 2026 08:19:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794640768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8/GdzvtxKmiHkx7Wprg5vBg/lLqnSbK4sHJwh0fCEF0=;
	b=H6iatDZ3jxMyvn1FSBCMwP6IoQgQVoRDrO+bMQ3UT/rI/sFbTC2A/aS33e9LS2ximbkest
	DgLifX8j8PutkI4FviHqly8L29CKLTRTsSYY3+7Z6i9VOn5SbFoKly+8DXOxejVe2TyqYM
	8yRg2eNvAWGTQ8VfvBXoykP5oNhds6O8yz5rcRKajaDUGNE50AnC5rs6aRqQf3sapC7h8P
	lXAvN2FglmbJc2oLaw9x/VAJWj/IJ+xnOsyvcMbtM7GxLj99Y1zW7o7Ne5CzOgNZzVjg2T
	vZqXyl6QINwgzqGEKWUARNWAz6cJtqNLGB59TFBXe4mW33StyCv7Z9xySSP6JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794640768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8/GdzvtxKmiHkx7Wprg5vBg/lLqnSbK4sHJwh0fCEF0=;
	b=YBsJfh3+5eL27NpeThVdcrO+FAYXtUd0vmL1Yj75odPC/sNNQj3loUZ1/fHuQUjiLPE8t/
	Ll7MxhOtLIMfBRQyDyVuwFZTTj7I5Pi8UH6zD7gTTjCALeUq+2zEHZ4j4lt32QYEyP2MRR
	3R89CkN2vGenIJ24pgHBEfIaehBGPeUzJg/xMU7tYw6NiN9SMlIjnumIp7LiuultSC3UqX
	WtK/wzPsEXT4cH1SkA3i2+5EV+HWxFw+axo2rmmRU4uZlpNyaXIHZlV313FjZjAitsNmnw
	1syQx1VbRuABW8JVyPvjMkYRcqU2yROY8i/BIpH0naguhF2dEdjchedpofbJXw==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794640768; a=rsa-sha256;
	cv=none;
	b=ZZGVU2/5L8jDFs9KwASXmvmgLZyYVWHRwGc3v8rbeUBwQpgjYWppEWEN/40vs4npXkscN5
	Fq4DVKIvI7w+mCQ946Rv6QvZ3huecrNDE5JLcvUXTmrmmd2tQRmBcNbqfABFS+5DwccBmu
	Uu5NmL0Pn6/fBV8Wgq06Yi3RQGt9Nr4lLuUVH9OVo1xvEpWrMyXEvG+nPwmhx8SUF3Hvy/
	DbKgRojw2u7bajo+5KFMcDWsuXiMxFAauWUc0CNQyJ3BzFaAOpQqINQDRE25i8z4NwfLu8
	0HtxGFmBHKlYabrQQlhP2hpOdP+sIPmi+AITRKo+aaWz6kC8x4N1tOavY9IcFQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-ptx.office.stw.pengutronix.de smtp.mailfrom=ore@pengutronix.de
Received: by ptx.office.stw.pengutronix.de (Postfix, from userid 1058)
	id 6A3531C00E0; Sat, 14 Nov 2026 08:19:28 +0100 (CET)
Date: Sat, 14 Nov 2026 08:19:28 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@pengutronix.de,
	Jens Emil Schulz =?utf-8?Q?=C3=98stergaard?= <jensemil.schulzostergaard@microchip.com>
Subject: Re: [PATCH net-next 3/3] net: dsa: forget the port ageing time when
 the port leaves the bridge
Message-ID: <avgLgGkgh8sJAqNE@pengutronix.de>
References: <20261104-ksz-stp-ageing-v1-0-2c2bc7217dea@pengutronix.de>
 <20261104-ksz-stp-ageing-v1-3-2c2bc7217dea@pengutronix.de>
 <ac9079a2-a197-4572-9771-c04d4bba438f@lunn.ch>
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
In-Reply-To: <ac9079a2-a197-4572-9771-c04d4bba438f@lunn.ch>

On Fri, Nov 06, 2026 at 02:30:05PM +0100, Andrew Lunn wrote:
> On Wed, Nov 04, 2026 at 12:48:30PM +0100, Oleksij Rempel wrote:
> > A port that leaves the bridge keeps its cached dp->ageing_time, and it
> > still counts for dsa_switch_fastest_ageing_time(). A port that leaves
> > during an STP topology change keeps the switch at the short value until
> > the port joins a bridge again.
> >
> > Clear the cached value when the port leaves the bridge. The switch is
> > not reprogrammed on leave. If the leaving port held the shortest ageing
> > time, for example during a topology change, the switch keeps that value
> > until the next ageing time change or bridge join in the DSA tree.
>
> Does the software bridge trigger an ageing time change soon
> afterwards?

Only if a topology change is running. Its end is the next change.

> Does a port leaving the software bridge trigger a topology change?

Sometimes, for example when the bridge becomes root afterwards. In my
test it didn't

> I'm just trying to understand how long the fast ageing value will be
> left in place.

With patch 3, until the topology change ends. Without it, until the port
joins a bridge again.

Oleksij
