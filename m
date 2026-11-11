Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794363453;
	b=rnebeDIzc1G4Gr2uS4y+mRAPhV0Z7OX/kIs/VOYK5YNjeClMdd1UOK7dYGITzwgs5qdv
	 /ZFM+1oIk0OUXzyityq40/FyasGaCqw3I7/Z6eZAKo7vC25jeV3HyFx1bj/eODoC/VzvT
	 b0wb6YHPEDgiYS3M05HFUttoclwxRSahABS/fpBm7VevwYniFxRZJ7cPJzd+bveAlfS6l
	 86jrCFPtphWBCzBZW1BMuU8smSfUIa6H04P8fSAsLS/GkQJ1id9d4LrAjv4jw6YbaogBi
	 fgAUgj/+vdrb1ygeCR9cA1A9BJDdCNKC8EbcMVRo9TNouq7cA1uHLidImFlndbbgaZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794363453;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=qpHMzF8uQm7flv6KgMn2jkq7huYsicBHJwz+7Q3OqcI=;
	b=NWMOp3IFMlFynqVxTZl09ge3SNzEVy0z7gURm3VX46mvh9Q12P2OEFNo8P+7uArYqeyo
	 pL2py9RITOmEEZmueKdP85Lim6xUfcnWMkEKRgcHLEoXjYKC7G/On1fvof7TWM6LYRTFx
	 yBet5W3KU9YXjbda72ZaETvjj0T8HZ9569P1+0I0wqSXiedBb2rWsYcih6pWcCMHzlNfC
	 n2nC4JGmWOtWxtzz5L5MoRxOhOSXHBZhIp8WrAyqBZDjnKfheE2GD69/Hvm9faUDc5mQA
	 +k/9McdU+IEI0alZ40EkT4RUCTk4sY9S8TT5OSGfIqr6oKmwHjoxEHuvpetpado0vJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=XCx3yf+z;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9589606A320;
	Wed, 11 Nov 2026 02:17:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9589606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=XCx3yf+z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=qpHMzF8uQm7flv6KgMn2jkq7huYsicBHJwz+7Q3OqcI=; b=XCx3yf+zD4ZRfr1RtoYg1/xQ3i
	OcPSEuAFmPUtHDJOZBJw7+SG53vWkQ+oGJ3pSrLCDbVK/Po/xRXtKcjkOtNS+5vN3Qi3HKRzv5BWQ
	L2hfcBfCzbLCjtXtHsk0wVoehwGWEgTOBE9C7pPQPu3xhPwRzKFFSbK4NvWZ1EYfJBOE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xQxtv-00FdAT-FO; Wed, 11 Nov 2026 03:17:27 +0100
Date: Wed, 11 Nov 2026 03:17:27 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Pufan Jin <cyan2254650260@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: zynq: Add ALINX AX7Z020B development board
Message-ID: <871379a5-c6bd-4e35-b7c8-618b3af49745@lunn.ch>
References: <20261108215010.351256-1-cyan2254650260@gmail.com>
 <20261108215010.351256-3-cyan2254650260@gmail.com>
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
In-Reply-To: <20261108215010.351256-3-cyan2254650260@gmail.com>

> +&gem0 {
> +	status = "okay";
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&ethernet_phy>;
> +
> +	ethernet_phy: ethernet-phy@1 {
> +		reg = <1>;
> +

It is better to have an MDIO node, with the PHY a child of that.

	Andrew
