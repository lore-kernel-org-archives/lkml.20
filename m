Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794668173;
	b=Eycym10KFswHJ/MzQM9IoxZ9y9oDGuihbKBvjFNk229l67Og9OwIcc3Sn80/IEwHDzG7
	 SnzJeasX4khAjrWa6PBGH/DlLK7byCpi20H8dpV/764dAdjL8Y7DQO77/JlKJPeDVgfJ+
	 PW+/7ysIy5TS/Rr464mhmBvTimIATm94eYta9a8+Kqvm4VsiHAIk3EjxoMv39LjamRhxF
	 gXfBRhPyoZaae1tBwFdeXe2J41nV18oAK0GPfEbav4PAyYDJpxTxfKANHmm1i4zWcPDCo
	 rNSGjGMpF4aMAeHIa5fh0DAsK+xsd+T7eGrT9gani+kcsgGNAYKnRN/9ANebWSVyLFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794668173;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=HuJRg5DODuipSuWwIKWwm3W2MRRDXe1aklex2r2CrF4=;
	b=jw21rR7jq9xXtoFPtBrcYZR3OHsVfqpCfRAGxeSXKebxVxe4dx3msgFSOX/v+JPb925j
	 q9RAH8ShhRX87XgSs2tocdU2gz1vCs1jnwsszbLSZHDzi3RTWJ2gkva1fZ75ovexkUpiz
	 +SnLahU+jy1koaFRuSAt4zCw730HyZOAIxLoI0q7CtqSyq3jwYy8cDK3RsivR564B+AVM
	 ZdwgTcFrh2eepB0jUA4c6uptPBpTm0XyPj5NLXZqb76OCzAKqeIWA9oA9Dwj3bzzfyazc
	 p+0hxKlteWPSi5sF75QxwoP1ezRNYvDGyHl9tRvesAbyOPZIlxZgnsHA0FtsJPxLxpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=V0erCiVF;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C34606A323;
	Sat, 14 Nov 2026 14:56:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22C34606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=V0erCiVF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=HuJRg5DODuipSuWwIKWwm3W2MRRDXe1aklex2r2CrF4=; b=V0erCiVFcmM5ruFJvq2uaU7CWM
	ITtJr8eDNk5YjXqy+3nqKnnbuqDa+xeSnHPPf3WRwnT+5GCv9RgdZLonsXnmGBR1ArnCdYmVth6t4
	3+XwW1yiZvXaLeVweISSknwo/sHWq3wLHgWOya6n2KOGaCL2RfMAx+kmghZEi3AELNQE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xSFAl-00GVYE-3r; Sat, 14 Nov 2026 15:56:07 +0100
Date: Sat, 14 Nov 2026 15:56:07 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@pengutronix.de,
	Jens Emil Schulz =?iso-8859-1?Q?=D8stergaard?= <jensemil.schulzostergaard@microchip.com>
Subject: Re: [PATCH net-next 3/3] net: dsa: forget the port ageing time when
 the port leaves the bridge
Message-ID: <dd8c91a0-d89d-4a7a-b181-57a8c5c48651@lunn.ch>
References: <20261104-ksz-stp-ageing-v1-0-2c2bc7217dea@pengutronix.de>
 <20261104-ksz-stp-ageing-v1-3-2c2bc7217dea@pengutronix.de>
 <ac9079a2-a197-4572-9771-c04d4bba438f@lunn.ch>
 <avgLgGkgh8sJAqNE@pengutronix.de>
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
In-Reply-To: <avgLgGkgh8sJAqNE@pengutronix.de>

> With patch 3, until the topology change ends. Without it, until the port
> joins a bridge again.

O.K, this sounds reasonable.

Thanks
	Andrew
