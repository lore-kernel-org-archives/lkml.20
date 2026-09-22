Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82325452BC;
	Tue, 22 Sep 2026 12:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790081452; cv=none; b=bxxg6n6giPx/VykhjqUzno/YA1jQOjfNPAi2YHS2GdNZBfH2q9MV5t6p3y+SUA5c5tek9Sb6tvBGyFUZHHYzytsQdskndXHixehR0ehA7QdYamR5NyAvgwQx//AYYH0FPIsa+UlwlUCye1s1xOR9A/ZPbnTjynPg0Y2uZXIbw34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790081452; c=relaxed/simple;
	bh=TBCEHkUTcZd5RXV/4RGxi5DuCsTfSv69e2BM3k1GCO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HtRt62Cy0aiXQGZyNnTO6TZnFUB7ATuplkAzV51A5t0FulynRU5PRehXLdo5DvFlSkHdXxj4Ps/Jq0DNbwi3rqU/iJuVhZ5sNWA28Nc65LJARqt1mR8JU0dt1E5tstsEU8n3kZKAyxPMcGUWzkJjrHsm/U/1+c2EduKab6ZsBtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=x3Abvig9; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="x3Abvig9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=q03pcSGxXBeOQEQK9TaS9voA66lNR23OiFk9hSJIVQ8=; b=x3Abvig9d7sJvUivUPXDYsKCqK
	hoW1ohDpIZxqlg5HDIib5erf8VoS/iHn8gnn9nWBeEQrT151RrENa+vSIfCuWxrwglgUMAqNJV2w1
	ztrZW7v+yRGwy79jSQ1pMM7tsh83AsxmVmwfr5elJFemVgsoXuaaMvkmYZIEZabLs9Gs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x8zx5-006alj-Mu; Tue, 22 Sep 2026 14:50:27 +0200
Date: Tue, 22 Sep 2026 14:50:27 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com, tan.siewert@9elements.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
Message-ID: <1b2b77f5-c10f-4de8-bcaa-aa410f73896e@lunn.ch>
References: <cover.1790079398.git.prasanth.padarthi10@gmail.com>
 <cb05fc2f4158b03d312b94cd9361173fe92ac528.1790079398.git.prasanth.padarthi10@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb05fc2f4158b03d312b94cd9361173fe92ac528.1790079398.git.prasanth.padarthi10@gmail.com>

> +&mac0 {
> +	nvmem-cells = <&eth0_macaddress>;
> +	nvmem-cell-names = "mac-address";
> +	phy-handle = <&ethphy0>;
> +	phy-mode = "rgmii-id";
> +	pinctrl-0 = <&pinctrl_rgmii1_default>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +};
> +
> +&mdio0 {
> +	status = "okay";
> +
> +	ethphy0: ethernet-phy@0 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <0>;
> +	};
> +};

For these nodes only:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
