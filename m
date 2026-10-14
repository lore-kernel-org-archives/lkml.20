Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E464E432A;
	Wed, 14 Oct 2026 12:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791982379; cv=none; b=EBzcVdbL2E3xvuWpwE+DHLdjalhGms2MVHsKFPU5uJCnZhlJYrSF6EA/rRd3KwFhaMKoe6ImjL2UQUhbqeGvh58RUEcLIYlpPf9U8Y1lVuoY+fqBOEEN5+SjzBTaL+k2Yb5nEJkMjDMIX73WNHH+H8bqWqPRmn7PtsQesgCBy+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791982379; c=relaxed/simple;
	bh=IPfUWD6LEzhnk2YunaaQklJ2otUfpv/fDDLCMcSIbpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HaUlt0VMDz47VH0m6nz4QgeGFlMMCc8AQuKH3ED/iRbpyEJXHth/aIp95CqLluM0/ItcatBF/ZsZYQ8QffQXsRgB4SFBuqJiYpaHK97bguFaWgy9yRZixP7/5k1Nd4YxeUGNtfvlqQvyANs3sxBDtVgZR0eYKiULLM7El+buBKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=A/L8DwWe; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="A/L8DwWe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=hvc2V3oM2jK/anoO6/69ZkcwK/ZYlgwZcHP0MTpy6U4=; b=A/L8DwWencGpuxcWNwuJFUtr8M
	vfAWBJ4RbgFT2vLUKpXYH7A6Cxda3UVNSAMZNgvohP/aLkLNvbHqYmeCmlCybYr5735dSrDGB9DDs
	xBL1tG6Q1yVPbgEtOXQHhQpnV+4oeT+ElpJtuyrGCskr+tr2nfGvpzjHqYkdJZE6SmMg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xGySo-00Aje5-IV; Wed, 14 Oct 2026 14:52:10 +0200
Date: Wed, 14 Oct 2026 14:52:10 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, arnd@arndb.de,
	stefandoesinger@gmail.com, krzk@kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 24/24] ARM: dts: zte: Add ZTE ZXHN H3600 board
Message-ID: <0386c1dc-5026-4c45-9679-cc6e76f58e36@lunn.ch>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
 <20261014072109.1759502-25-ghahramani.navid@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014072109.1759502-25-ghahramani.navid@gmail.com>

> +&gmac_port4 {
> +	label = "wan";
> +	phy-handle = <&phy8>;
> +	phy-mode = "gmii";
> +	nvmem-cells = <&macaddr_tag_1e 1>;
> +	nvmem-cell-names = "mac-address";
> +	status = "okay";
> +};
> +
> +&mdio {
> +	/* the ZX5201 WAN PHY */
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&ext_phy_pins>;
> +	status = "okay";
> +
> +	/* external Sanechips ZX5201; its SerDes answers on address 9 */
> +	phy8: ethernet-phy@8 {
> +		reg = <8>;
> +	};

You have phy-mode == gmii. Such a PHY does not need a SERDES. We need
a better understanding of what is actually used here.

	Andrew
