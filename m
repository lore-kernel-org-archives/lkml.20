Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794757101;
	b=fdY310yyBC5j0Hu8KVtJwMTFa0SQQWCvlnZSOe+bnYKzR4XDSrYQLXDhpb/B/mjrdZnJ
	 wZmdmX73ID2uoyC3AXkLFpuIP615tbp3jZsdxMw3bLVayz3eHKNjlZxQGTst9/U6pCuDv
	 GT7UqP0ERZC6oDI1wHCD7tz04C9sD7WL5BvlqSnlBTAGTodtJk0LQX8Sw06omi0q8W1W9
	 r3E14NxGrgMyNF2k3oQg6d7iKU9vFonhB3QDRctJT0B7LKVUoEMuoB6arkLpG9/jTJ53v
	 HPvhMEYz40n6fyl/qmXy2vhkNqy5vOKLreKFPFYbDCNiDSyh7y0frWYWqgeOaZ9VoIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794757101;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=kjUb2QBVxfOsNlHQ0DPSHIBk+8dBDbVKHbOy3HIK0ps=;
	b=ZqShYqKTfE/KgPyq+aXmXa4Upa9OEAaskyGU23tMkZ6tr+YPIAOGflMp01W+pqxoKsEC
	 qHX0CM0LK9+iU/vBkTQvFNeSMrkRduSgW6J+gzmotazMRPFGInc7Ihm+LhbkdnjESqUC5
	 7JT8sHNIzEUynVeDfoaZUyQAb+9ixPLLyQljq73QoG44WTT9htkbvxY4Zh+IoyoDOOSVR
	 KwbwYRkA78dzpweCTw6A3peo2QRJsH76ouGHTsK7gfGn2xJ1ddq5W1E+jkwmUj2V6IeG1
	 x4094NgVRFaC2zjLZfBs7bCbS/lUoPteaeOLbMa3I67zjx76Y10nNUEMXcK4EN+XasA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=djoWjanA;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDC9606A323;
	Sun, 15 Nov 2026 15:38:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DDC9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=djoWjanA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=kjUb2QBVxfOsNlHQ0DPSHIBk+8dBDbVKHbOy3HIK0ps=; b=djoWjanAFV8NB/jD9HENjMURCS
	OONd5UOcpqmbiSEnRDz7gJL3l0E4rhIs3yfSyyRgQdDMjR/FqoRha3GqAWzCk00uFzcwgYNSWYDxh
	l3kSg93tj3eeQZoAQ12qXbZY32/HzDGRfWkcRBbx1WR9NlJI1UFAVWxmX4KQ46JLS9hU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xScJ3-00GdPP-M5; Sun, 15 Nov 2026 16:38:13 +0100
Date: Sun, 15 Nov 2026 16:38:13 +0100
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
Subject: Re: [PATCH net-next v2 1/3] net: dsa: microchip: ksz9477: apply a
 shorter ageing time at once
Message-ID: <8a5d8502-3c38-4161-9b1d-381ef6e2344c@lunn.ch>
References: <20261115-ksz-stp-ageing-v2-0-7af27320033e@pengutronix.de>
 <20261115-ksz-stp-ageing-v2-1-7af27320033e@pengutronix.de>
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
In-Reply-To: <20261115-ksz-stp-ageing-v2-1-7af27320033e@pengutronix.de>

On Sun, Nov 15, 2026 at 11:59:51AM +0100, Oleksij Rempel wrote:
> Pulse Fast Aging when the programmed ageing time gets shorter or the Age
> Count gets smaller.
> 
> The ageing time is Age Count times Age Period. An entry stores the Age
> Count when it is updated, as the datasheet says. The datasheet does not
> say when a new Age Period applies.
> 
> Without the pulse, stale entries outlived an STP topology change. In my
> STP tests the switch ran at 300 s as 4 x 75 s, its reset value. With
> forward_delay 4 s, the bridge asks for an ageing time of 8 s. Read back
> right after the write, the register showed 8 s. In three tests, an
> entry learned before the change still stayed for more than a minute. I
> think the switch uses the new Age Period only after the running one
> ends.
> 
> The pulse is also needed when the ageing time grows but the Age Count
> shrinks. From 8 s (4 x 2 s) to 31 s (1 x 31 s), an entry stayed about
> 63 s in one test.
> 
> On a KSZ9893 the pulse removed the dynamic entries on the one user port
> I tested. The new period then started right away.
> 
> I found this in STP tests on a KSZ9893. I tested the fix there with
> kernel STP and with STP off. With mstpd I checked only the programmed
> ageing time, not the FDB.
> 
> Fixes: 2c119d9982b1 ("net: dsa: microchip: add the support for set_ageing_time")
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
