Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794802791;
	b=2PvFQ2H8UJHkPO3TA2CfDGvXvrWS/L0rOlOhu3mnclXvWWwRb86tY/+J00OvOfDj89Gh
	 1I8fz+SnuQElAy0XReqS7bvnFAw2A1ohJ5GyHm/SGTMnHpkoeBbDL+HP3dhhYtfuSIaYR
	 A++hnDedlgcPI9eYlkyQgtoJWr699pL4aqUraS89za/pQKftn4XjhAewmQMrYbuAZV52s
	 oODOwHo9eZwk869yMBugE+LHAcCS5Qr3UY7enA2kYkyxeyBTo053/sUh/aiDbF2LnmQeY
	 o8I5HdOB8/ogvUzHz+bvrF6DskVMm3iMrcAT41oH2umRsOtVICGYoJhci0qwZe0CJfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794802791;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=vzvDYpL2hux+g6h9Zw8C0pGs3K/JeL+TqV3PxRqjLH0=;
	b=ALUkKuWWGivbfDcljpYhkX0910b3Gwz7Z4veUlANbP9a9Bp/9lE++KjmV9JVQxuCUe+r
	 1YQ4yFTp1dntAEu1kg7bPz03ULkX2B09Uypkajv7cwMjfhHz6DBo4cerPei8/xUN0EURI
	 XkjhaSZwX+S141RHCS68DBmoU2/qoVT7GbYJj50efu5xXhpXO5m49aCU+LWoZ8gb9+e4s
	 eOIIoANZrH3fyWviClZZ7wvx+tV98XZr9P8+JTsw8Xj1eY1KeLeTBGzQk99wxKASEW1w+
	 65nOKQcBR0pzCDPgu1C8n5DeHUi7zWpO4h+pSYSf2aYRB1L7FZIRLqNNvXjOTUm0fXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b="QNt2YE/j";
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33F7606A31C;
	Mon, 16 Nov 2026 04:19:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B33F7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=QNt2YE/j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=vzvDYpL2hux+g6h9Zw8C0pGs3K/JeL+TqV3PxRqjLH0=; b=QNt2YE/j766bqqdllEC7drKvDF
	ttGMr/QpB+vAgxMTYw/R1vFsx1w7DdtjSfGSFwUJTjHBj4hMg+Cnfg50g28tp8hC6q/iPI4bINndj
	nH3Ak21CJWJE59rWqq+as3I+HgkHC2ozm6wfoF+0gUiu1DYAFHGfr/QW5Jz+31Z1thk4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xSoBr-00GnfA-Bi; Mon, 16 Nov 2026 05:19:35 +0100
Date: Mon, 16 Nov 2026 05:19:35 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Dong Yibo <dong100@mucse.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	yaojun@mucse.com
Subject: Re: [PATCH net-next v2 2/5] net: rnpgbe: Report link settings
 through ethtool
Message-ID: <d7351f56-d4fa-4ba0-a0c6-c7bdf7aac460@lunn.ch>
References: <BD205A7832D36E7D+20261116030917.1329989-1-dong100@mucse.com>
 <66AFF2810AB647C8+20261116031020.1330219-1-dong100@mucse.com>
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
In-Reply-To: <66AFF2810AB647C8+20261116031020.1330219-1-dong100@mucse.com>

> +static int rnpgbe_get_link_ksettings(struct net_device *netdev,
> +				     struct ethtool_link_ksettings *cmd)
> +{
> +	struct mucse *mucse = netdev_priv(netdev);
> +	struct mucse_hw *hw = &mucse->hw;
> +	u32 supported, advertising;
> +	unsigned long flags;
> +	u16 status;
> +	int mode;
> +
> +	status = hw->link_config.status;
> +	supported = hw->link_config.supported;
> +	advertising = hw->link_config.advertising;

These are accessed without a lock,

> +	ethtool_link_ksettings_zero_link_mode(cmd, supported);
> +	ethtool_link_ksettings_zero_link_mode(cmd, advertising);
> +	ethtool_link_ksettings_zero_link_mode(cmd, lp_advertising);
> +	cmd->base.autoneg = AUTONEG_DISABLE;
> +	cmd->base.speed = SPEED_UNKNOWN;
> +	cmd->base.duplex = DUPLEX_UNKNOWN;
> +	cmd->base.eth_tp_mdix = ETH_TP_MDI_INVALID;
> +	spin_lock_irqsave(&mucse->link_lock, flags);
> +	if (netif_carrier_ok(netdev) && hw->link) {
> +		cmd->base.speed = hw->speed;
> +		cmd->base.duplex = hw->duplex ?
> +				   DUPLEX_FULL : DUPLEX_HALF;
> +		if (status & MUCSE_LINK_TP)
> +			cmd->base.eth_tp_mdix = hw->mdix;

Yet these need a lock?

> +	}
> +	spin_unlock_irqrestore(&mucse->link_lock, flags);
> +
> +	if (status & MUCSE_LINK_TP) {
> +		rnpgbe_link_modes(cmd->link_modes.supported, supported);
> +		rnpgbe_link_modes(cmd->link_modes.advertising, advertising);
> +		ethtool_link_ksettings_add_link_mode(cmd, supported, TP);
> +		ethtool_link_ksettings_add_link_mode(cmd, advertising, TP);

Advertising TP? Can you point to some part of 802.3 to support
advertising TP to the link partner.

	Andrew
