Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418179;
	b=GiiqflH0p3WD9Eow7hfFyaEpDhS2c3DSqaXmSRnv+fKv9LK7GUjffl599o5I//A1sAwe
	 y/cYRGZcwG7xAWS6DuzJ1EcEZPWPx6rDnGBp18Lumf/wnsqvCCtR50RXTmZbXmjQXYaz+
	 9FWjZKlFNWKcMEBG42BcohWlHBr6tO8G+hkAcPL2NPUc2EiMsG0+JxfOGRXA7PfJK8I/V
	 qu4LSwmSvCOJL51PkbrkewYCtqsT1yPlErEH7jA45Smp7nEsGeMPwK4gfNr0dU+pxfDtl
	 72+7NvjKgYLHR/Fp7MtiyJX6qp2VrQPFuoPhdiU5kZyNXBVQlpK6IdSosIW70VPvB1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418179;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=VZ6QtUIYoRtgth2mB5V2nOYQdbdPArbDj3uel9p2Yes=;
	b=eQiVyxWwNL4zNDj0A9G2kr/KilIjxoEdaKpTTFeYnyj9MQyfA8/6LEea2f22AGIkNYer
	 jckSu+7wzoUbMhTA01DlnKTq6IyUyJmXBy4+64C9A4kmiHRM46dP6eet6SV3R0+hba4XM
	 QoiIZ6/8ppstKkBqLPYk7ljVLgHTw05WpUPXIfMJdELpLwDqH2EEXSHEu+nZOrUlt7tDB
	 nul0r+vo+yNknkzopUbb2+ozvyPrso1W8EDWg88GEiuGTLkpC2gZ2F9gzmDHfT1qJfk8G
	 5Ve4emunrNGKVffBcLYpK8qKQXCvIGIJhWBfCR5D6Rv9ykfz1DSD3JNWiKBAP/rEnGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=W0p2DOEH;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD587606A31C;
	Wed, 11 Nov 2026 17:29:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD587606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=W0p2DOEH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=VZ6QtUIYoRtgth2mB5V2nOYQdbdPArbDj3uel9p2Yes=; b=W0p2DOEHXZmrx6mBaqiAGEKYwt
	JWElRtiVhq/HVCISr9tADAXkzuuCVaRI03yu0fBLWdzJ4LZopPSHyp2qJ7iM3Er3ugHBhrn0mkvGp
	cFIHF2IXdpvPlunNcwsw/jVpkKAYfZFSUat6ghbrOrOPSP7F8YLiExPGoBigGCceaq/k=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xRC8a-00Fnhp-2s; Wed, 11 Nov 2026 18:29:32 +0100
Date: Wed, 11 Nov 2026 18:29:32 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Pufan Jin <cyan2254650260@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] ARM: dts: zynq: Add ALINX AX7Z020B development
 board
Message-ID: <6be8f6fa-501d-4e0d-8808-ece49e8eb7de@lunn.ch>
References: <20261111162917.97532-1-cyan2254650260@gmail.com>
 <20261111162917.97532-3-cyan2254650260@gmail.com>
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
In-Reply-To: <20261111162917.97532-3-cyan2254650260@gmail.com>

> +&gem0 {
> +	status = "okay";
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&ethernet_phy>;
> +
> +	mdio {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ethernet_phy: ethernet-phy@1 {
> +			reg = <1>;
> +
> +			leds {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				led@0 {
> +					reg = <0>;
> +					color = <LED_COLOR_ID_GREEN>;
> +					function = LED_FUNCTION_LAN;
> +					default-state = "keep";
> +				};
> +
> +				led@1 {
> +					reg = <1>;
> +					color = <LED_COLOR_ID_YELLOW>;
> +					function = LED_FUNCTION_ACTIVITY;
> +					default-state = "keep";
> +				};
> +			};
> +		};
> +	};
> +};

For this part only:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
