Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440AA3BE623;
	Sun,  4 Oct 2026 21:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791148901; cv=none; b=S1qDKY55A0wOiDanfdqsx5scend8cYwzUBmoX3vRgrUp9P3pp1gsEcMDtPTVjXRFIMvOxQCtZ8F1IVEShUa5fSlbTGhVs2msSboaOsAzCp17cCE0s0Djavo5W4Xh+xsjN2fyTI5VLQSl8WXCFWatQCGq6jFeZ2ZTypp++aYKawo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791148901; c=relaxed/simple;
	bh=+ClKAywWdy2bNjh3vWTCdRdcFkqdTqXmwCCoeY2z918=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nUayTNeNj+rsRPyx5tt0nsZccph0mpo+1qaQCLRhfzvZEx0J2iqRlnVIICg5WyxdT33msbaH02ADzfAypI+o45E9xyhrsAGiR2wvsDDbhLcFYhzBNz3yNrTnvpYVX25+7AikFDNds8LatxQ7jZf+pR0eX4cXaYCd/+hD00L6qDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=aKYofYFW; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="aKYofYFW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=iUejQ+v6arYz/jqDfYBOnzUc6H9Odh9nWzIu8FiM4MM=; b=aKYofYFWg58gvgwIsDdSSAXOfc
	eywD5t2A0lofStpkskMl+2kuzBYUjz3jambXevnEMEOg08qy++uMVt9MZYTVmyT4bs7aCU3Fpc+YW
	ydx6kP7TeNNdmApt63uRzuYWL+FUhutho+GV7YBB0/RHes5u+MH090Tq/FC7NxwUu6dk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xDTeB-008wYQ-QX; Sun, 04 Oct 2026 23:21:27 +0200
Date: Sun, 4 Oct 2026 23:21:27 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Dawid Glazik <dawid.glazik@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	maciej.lawniczak@intel.com
Subject: Re: [PATCH 4/4] ARM: dts: aspeed: add Intel JNCRP BMC
Message-ID: <d303c2a1-f262-412f-84b5-71e27c76e7c1@lunn.ch>
References: <cover.1790344811.git.dawid.glazik@linux.intel.com>
 <bf582c24cc3222aca1b7d78a32439fd3505dfe20.1790344811.git.dawid.glazik@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf582c24cc3222aca1b7d78a32439fd3505dfe20.1790344811.git.dawid.glazik@linux.intel.com>

> +&mdio1 {
> +	status = "okay";
> +
> +	ethphy1: ethernet-phy@0 {
> +		compatible = "ethernet-phy-id001c.c916";
> +		reg = <0>;
> +		reset-gpios = <&gpio0 ASPEED_GPIO(C, 1) GPIO_ACTIVE_LOW>;
> +		reset-assert-us = <10000>;
> +		reset-deassert-us = <50000>;
> +	};
> +};
> +
> +&mac1 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rgmii2_default>;
> +	clocks = <&syscon ASPEED_CLK_GATE_MAC2CLK>,
> +		 <&syscon ASPEED_CLK_MAC2RCLK>;
> +	clock-names = "MACCLK", "RCLK";
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&ethphy1>;
> +};

For these two nodes only:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
