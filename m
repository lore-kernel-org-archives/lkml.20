Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792444390;
	b=i9LwmhOdL7C6+6b4NQY2PkZ9aUc5XCxspQd8r5Ap8PFMtEfqpElzJRguY50ffkI5OZEc
	 s4Uomt1LuDR/eMcT1YTDy7kMnms2gq8lb99CaKTbL2KV/XWCD9pYZ/Z9yxlymjsM/Ao2N
	 0wfwCFP5u8tQw/sGph7oAf67tTSxiHrsmuhCyGnJY0DWDiDr2nLneNBCMP7j0EPBHlpb/
	 WWE2VDHzAWlMIlLKePuhF2PiMgneffzeqzn2Uia2fwJ93xSJqNTOneUdo/Horc8b/89ns
	 Zp7Oe6iTQHr5Yvifk/1tDL9G8phjPLRhJE3QU6MIuH5pPylh7Zuh3+PQhdLM/eGK2eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792444390;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=nag2B8Ch3hK9SXC5XfJia0Hg3V0D0m5XcYZNjThfpdc=;
	b=c1jKiYlC1ESC81iMAwbGV3jLnIXvNcc7VyA4qfKSK3f0oGwAVGaS8kOYlUXBly/Gw5tQ
	 VvMX6qGvDCvUzVEWiRLgett65nc0qTmsu/Ag6X7sYmU3tjDVL0P36YWDa9lp4Yq/LWfTg
	 tz4V5FHY8/ugFCsV1BmbidbN/rUV4HlRrkIQgwmX8AtmiUr3TgYADxuSmgSCnWCnU5X6A
	 fUZThYwzT0ByPK//JRespIVbLBCwizHAL7BvVndvIGK9HzMKCgfyvlzrs6EOO+6pOAaYq
	 6GqAaexnyN5Xuo+V1DYHeRHnu03TjRMq+axTLkEShYrE4MvnD6EgLfXKI9CX1X+XVKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=NqIpl9pC;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3432B606A31D;
	Mon, 19 Oct 2026 21:13:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3432B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=NqIpl9pC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=nag2B8Ch3hK9SXC5XfJia0Hg3V0D0m5XcYZNjThfpdc=; b=NqIpl9pCltsIliKDjXgVxf4lwC
	eoz/IuSR/baG4ak0YWk8mCCIY9AQ5xezNNWWv5SzcgfwZL4tBXAqLKT4uK1exSqs1nvV801XkQgYi
	quUGrzfQtsfGo5W07K/+hv5JVmvlvhyCEiQ1VshMXlcCuBI5GOIAvQ10agAtOC35fzf8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xIuf0-00Bi1J-0V; Mon, 19 Oct 2026 23:12:46 +0200
Date: Mon, 19 Oct 2026 23:12:45 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Miguel Jesus Seron Gonzalez <info@gluon.es>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dongjin Kim <tobetter@gmail.com>, Chukun Pan <amadeus@jmu.edu.cn>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: odroid-m1: use rgmii-id for gmac0
Message-ID: <c8860bfb-b8b8-4255-9b98-42c129ecddc6@lunn.ch>
References: <20261019192254.6933-1-info@gluon.es>
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
In-Reply-To: <20261019192254.6933-1-info@gluon.es>

On Mon, Oct 19, 2026 at 09:22:54PM +0200, Miguel Jesus Seron Gonzalez wrote:
> The gmac0 node uses phy-mode "rgmii" with the MAC delays
> tx_delay = <0x4f> and rx_delay = <0x2d>. On some boards this TX delay
> does not work at 1000 Mbit/s. Dongjin Kim reported iperf3 throughput
> below 200 Mbit/s on REV 1.0 20220613 boards. On a REV 1.0 20211112
> board, TX from the board stalls completely in iperf3 and ping loss
> grows with frame size (5% at 56 bytes, 20% at 1472 bytes), while RX is
> unaffected. Other boards work with the current value, so it seems to
> be marginal rather than wrong everywhere.
> 
> Instead of tuning the MAC TX delay again, switch to phy-mode
> "rgmii-id", so that the RTL8211F PHY adds both RGMII delays, and drop
> the MAC delay properties, as suggested by Chukun Pan. Dongjin
> confirmed in the same thread that rgmii-id works.
> 
> With this change, on the REV 1.0 20211112 board at 1000 Mbit/s full
> duplex, there were 3 retransmitted TCP segments out of 24929 (0.012%)
> over almost four hours, no RX/TX errors and no ping loss.
> 
> Fixes: fd3583267703 ("arm64: dts: rockchip: Add Hardkernel ODROID-M1 board")
> Link: https://lore.kernel.org/r/20250819075522.2238643-1-tobetter@gmail.com
> Suggested-by: Chukun Pan <amadeus@jmu.edu.cn>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Miguel Jesus Seron Gonzalez <info@gluon.es>

> @@ -200,7 +200,7 @@ &gmac0 {
>  	assigned-clock-rates = <0>, <125000000>;
>  	clock_in_out = "output";
>  	phy-handle = <&rgmii_phy0>;
> -	phy-mode = "rgmii";
> +	phy-mode = "rgmii-id";
>  	phy-supply = <&vcc3v3_sys>;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&gmac0_miim
> @@ -209,9 +209,6 @@ &gmac0_rx_bus2
>  		     &gmac0_rgmii_clk
>  		     &gmac0_rgmii_bus>;
>  	status = "okay";
> -
> -	tx_delay = <0x4f>;
> -	rx_delay = <0x2d>;

Correct from the DT binding point of few.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
