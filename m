Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794835445;
	b=aJ98Y69caN3yeETmzhgbX2y2blb5PHnp0s52mqju/jRQQ8C85AHqDVioDJEWimRY6h8h
	 2BeoKGZHN+h2UP9eveBbgXH+gx5EOaGHdcmgJTHLFOts15gL/U8SUnY0G9uWTPmE1nr7v
	 ETUIQL34rQRaKqzHls+w8a850xE6dzn+BZ38LDTdjF/AqhLRWTo1KjmmVhiyGU3NlaOWs
	 B5m9+78Vi0dhcoLVxO0l6yCnMxFfg2fbkCMD/EhdCqVXgCdLlWp7C2uOdNOs5SoXJEuyw
	 NFWi8Z63QNTbR4+EANEQA2HIkG5LunVKN859zOHZJUdvW8Z/TkMm0Zvqud53ENrfTUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835445;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=qx+AUpAhMJt1J7QRW7d2f1kOG/gDW9Kz+HDeXa559dw=;
	b=ijx8d5vmYVDmDZZoJplIXFGr7WdI73WG9cNHq3TxGf4yLEjBdauFxdiwZR7GolxT5yj0
	 JeL8vS6+eqXVezMtZyJjM/DNWGwL6+kQCQxQQa4qNZg6NsfyPxXPKlGZ3q9BeB5trAjVG
	 gTph8dPBtWnFlsmFqge8j9HPBYGy1WnvJw0Rl1ezR2QJGpkltOPiFzkJgkv/BZGShH2BR
	 LG564w26AkrMnCu6o7HmNddyi6OFp0Iik4dPzqM25Yfm9O2CKciC6YEwikO6MSU4pBZeh
	 w6SfNax5iEMqgCu+W9Rui0w/PLONG7ew84kgaSr/VabXAI6ZT95BT4qsFJ5o8TlBCSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=xT2VUVRG;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8880606A32A;
	Mon, 16 Nov 2026 13:24:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8880606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=xT2VUVRG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=qx+AUpAhMJt1J7QRW7d2f1kOG/gDW9Kz+HDeXa559dw=; b=xT2VUVRGEd4+VyjMQ/UWOuTdPW
	GVaP5Yg0M5SyHLw9lojrZ9zsZR8J6M9eB3F7Kbo5ddhv30/b1tJPINV0LhHnK1BbgL8mheZMT4RNL
	IUGclre9BAfvJJx6VSt/b4EXTwHxijZyd5MaoRna1WFIkWGwg4jxgElGv/yKjbIwft3A=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xSwgc-00Gv5D-9G; Mon, 16 Nov 2026 14:23:54 +0100
Date: Mon, 16 Nov 2026 14:23:54 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Oleksij Rempel <o.rempel@pengutronix.de>
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
Subject: Re: [PATCH net-next v6 2/3] ethtool: include errored frames in PHY
 receive byte counts
Message-ID: <46fc8da3-3995-4d9e-8c9d-2fd73764330a@lunn.ch>
References: <20261116-submit-acx00-phy-stats-v1-v6-0-8feef8e76cd5@gmail.com>
 <20261116-submit-acx00-phy-stats-v1-v6-2-8feef8e76cd5@gmail.com>
 <avsBVtVgsluPNpVY@pengutronix.de>
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
In-Reply-To: <avsBVtVgsluPNpVY@pengutronix.de>

> For this series: keep rx_bytes as it is, report rx_packets and rx_errors
> as you do, and keep the byte total driver-private for now.
> 
> @Andrew?

I replied to the previous thread, since discussion is still ongoing,
and so there should not of been a new version posted....

    Andrew

---
pw-bot: cr
    
