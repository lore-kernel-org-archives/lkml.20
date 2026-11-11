Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794362596;
	b=ksSi9ER/WTCMf6fnAeH5k/bIE+H4eHwHJ+S0VHC02Dgq/brQyxbggU/+mOfzNaS6ASyC
	 VcDTwGE7rxgHyTj3K4j5F3tOIKpu3uMmquzopEDEyiFbbJgWT89oTXHzmMSYwgp0NcvyZ
	 TrhOFXxzTeKXqBM/0q0ym5oQZnwJ739vUZz8s9KWJN0flBXFmvycbrUE+0wO0dQO5uy7S
	 qGqK9QobCm3fTzQxBQLIdbFTTAmuIayLabjscdHR/mLtWFbGMqa9ogPIOXl7RHWHQWdZ0
	 sNfqrWas7B5IoJWZBap0En1c0MW9phquUmYmXM4bkGYgENriq4DCIyErj8iVU6ZGZeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794362596;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=PtD+44Uzw4MKG+LuK7ob8toYzH1shhUFBZcPYFP/Eew=;
	b=TKvWUNrcaCclGXb2Q+LKzCfwEP7LSNd/isM9RpbbmQt4BDh1QH3xeA6e0Y0xSxkPLYJo
	 Drs6Ytir3kzUQXlknapDDsHSFeI/PI0v8EWI757ycA4OgJLA9jLLCuBEwoD8MpOmVxWzd
	 CyNxSCj3qBYR4aIbujGsaWZHXzRyTPlX6kAdrbzJ5sDkzyMe++bS4jDhhGuVW+6HrI3UM
	 +7sj9CMT36VcAZUhloVQzXKPUjhz4bTyQ8HWhE9OxP8PuPvYndYWwFnZAQXSLMzn7+zOa
	 +qUUR6sAyU3YgfyMgiQG09mkkC3T1BnCpRYE4dkPGFF+DxZ+ipdO3AluotkpSnPzM0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=3ceSsrTl;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299B2606A327;
	Wed, 11 Nov 2026 02:03:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 299B2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=3ceSsrTl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=PtD+44Uzw4MKG+LuK7ob8toYzH1shhUFBZcPYFP/Eew=; b=3ceSsrTliBiIk6ELRKiNGggeTA
	8d/vHheyxmAYyB140cfXUEYMabTNTn4kOP6Nfiq3teZe8ALg9nX2TtPC9LS06b7OGpX+eo9T6srJq
	LPzczDLRasuzvvGBTt3Kh+7+DQm5sKwWyVKnU6dMcH7cb4mtX17Bnd65RIcFVsUyCzkk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xQxg8-00Fd2J-6T; Wed, 11 Nov 2026 03:03:12 +0100
Date: Wed, 11 Nov 2026 03:03:12 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.li@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com, Nate.D@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v1 1/1] arm64: dts: freescale: Move Variscite Ethernet
 LEDs to carrier boards
Message-ID: <9c416362-4e28-4327-b8c3-bd789d2922f0@lunn.ch>
References: <20261105101739.10614-1-stefano.r@variscite.com>
 <auy-OW_td7N8oHK_@SMW015318>
 <auzAh7404GAsY-U0@Lord-Beerus.station>
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
In-Reply-To: <auzAh7404GAsY-U0@Lord-Beerus.station>

> 2. The Ethernet connectors, LEDs and their wiring are on the carrier.

The PHY itself is on the Module?

    Andrew
