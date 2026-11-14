Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794670843;
	b=vi+MQ6yLPytyTx+91pLCdSVn4LPMZgoCQdR2pQnb94V4kaSUW9y3Ocs8rcjwBekpXQSi
	 Umv9Ej7RX3R/AG0FGkRqkxhyBoz04SBD2zUCm5RWu8URcKWpwhJorOvVAVXLnQ88tW9BS
	 w9qqlZadnQoGP7kctdTL6ZZ6+p2iltDjtUefbH0Vel5PiqTgxSHj6XDZqAf08sdtGoYW+
	 U6lu7kq7tuRgkhDeMlwYrCrjp3XgWJv1af4/yFI7qFokZ1eQJ7c1AAxeFZF2jNULJlHXN
	 bJ/fs1s9g+K7KLPC8bGsOWoABN7c1tJgVg0J839fBIz1MFS5efLuFKsUEXOQeF48k7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794670843;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=Danho8kSiKQHq08Zb9vx8F6XBw/ja+vgqnHZ4RsTBHU=;
	b=EUADrD4/ZotzP2aXTWX/oxJwFpR+Xa63BGD8N3z6Dr57qJUHMDvb7rhWk7r4wdqbtH2W
	 ZgsgqpH1aXFb4e8xYc6/OYhXbC6JZYMI656wVXuQSSMJL9y22H1yRWdI7IMvDibmc4vya
	 NpJLaLgfaLzKEfKmxSxIf7leFMbVKeNT5dutcfoU4LduuAqBw3b9Stg0AXSC5LRxqToDR
	 QXNkEJfektlLZ+ZeRLzDDeI/kTbZ2Q2rq8/ZmPR9/GrnlgYKq2OjsuWI/52gT011/N0tf
	 qIF4MgVpFSxN11DRDt5RhpUxM3RcpcOsi8GRmlVPOyRFk1nQpPDXDZuo112Fgx8QXug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=FsGyj6PK;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EE2606A323;
	Sat, 14 Nov 2026 15:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78EE2606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=FsGyj6PK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Danho8kSiKQHq08Zb9vx8F6XBw/ja+vgqnHZ4RsTBHU=; b=FsGyj6PKCp+qr7NZ/hWhXOh+pl
	S0ClFLsTUqoeZ+HpcsSq3jx2jnTVJZhOx+NzdvIZ4e+vDmB/hFI6bGVNJ9prbSyrBgN470tX8v5oa
	zqqMaAEIvUp5NgW8Q/3gPoJWYMWBLoauOUHr0bGic9lK6a6cndSj0TQmwOUIOsd0dWec=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xSFrp-00GVtl-H1; Sat, 14 Nov 2026 16:40:37 +0100
Date: Sat, 14 Nov 2026 16:40:37 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: David Yang <mmyangfl@gmail.com>
Cc: netdev@vger.kernel.org, Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: dsa: motorcomm: Resync SMI slave after
 interrupted MDIO access
Message-ID: <54eced73-d0ee-41da-9ff4-63aa88667d23@lunn.ch>
References: <20261111163954.1132921-1-mmyangfl@gmail.com>
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
In-Reply-To: <20261111163954.1132921-1-mmyangfl@gmail.com>

>  static int yt921x_reg_mdio_read(void *context, u32 reg, u32 *valp)
>  {
>  	struct yt921x_reg_mdio *mdio = context;
> @@ -108,6 +196,12 @@ static int yt921x_reg_mdio_read(void *context, u32 reg, u32 *valp)
>  	u32 val;
>  	int res;
>  
> +	if (!mdio->synced) {
> +		res = yt921x_reg_mdio_resync(mdio);
> +		if (res)
> +			return res;
> +	}
> +
>  	/* Hold the mdio bus lock to avoid (un)locking for 4 times */
>  	mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
>  
> @@ -136,6 +230,9 @@ static int yt921x_reg_mdio_read(void *context, u32 reg, u32 *valp)
>  
>  end:
>  	mutex_unlock(&bus->mdio_lock);
> +
> +	if (res)
> +		mdio->synced = false;

Why defer the recovery to the next transaction? Why not do it now. And
if the recovery fails, you can report the transaction which actually
killed it, which might be useful for debugging.

       Andrew
