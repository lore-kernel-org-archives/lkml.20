Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.92.39.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794804510;
	b=dJQ/hOE2UWodw2vZocFBqI6Zveiq/gFLPz3P7ho76sBKFGTU4htdwsuWkZTHkcvmC7cv
	 oY8od+i234FfY5I2D+xkRhYHknqtCH5Eeyn3EhCjvWeWJdyDMBuP8N6U2Mzg70mkZYg0K
	 FDozTua4CskZFUlZs7JqXEwrkLBWu7jlfz0R5tKugelp3yCSSHwB6xi0i2RbX/kDeZtUJ
	 /5igrtEEr6fUEEWAduvJyeh71sPR1VywrZuKwZ2O28lhDliKrNbEuROHtrxass6hGms89
	 hyxEGC3SuvK+sbJwNiiuiTyrXqm19kc7/i7YBL94qFZ20v3Y8z7x4b0O5W1kk8dTSPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794804510;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=PGVxYtVa34yvZ+9qqL8SMqtJg1pDmzI4evt177Od7oY=;
	b=PkhP5EV4YmHJQb8Tdo24s4LnDuugxRiBd51eKdQbceKeLUl+4ukDVhrT1XsDraoIk9t9
	 Gt4bd8iKojvhF5wryrTv7Ev44n5fA9LtybN8oESs1NqJbjapD5sjzdUm1+kBiGFFB1rWM
	 zMbZeUTrzaXcXsAVFpFeaAgODhaQcolEeXRTk/8cAKKD4+yD+ubgebudAtpsniocFJmtH
	 RRbwAt2vSZGlNrQVcamuVgkpVLsunnzGo7hHMIzM65VUs72/xUv+1ggzYvc/Ui/CF+NYw
	 qdUvDTYwWZg+Bc9LSd/BkhkI9oWUtRX1rX6gl1LYQ/grAOxeudjqwYgqLGID7k5f3zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mucse.com;
	spf=pass smtp.mailfrom=mucse.com;
	arc=none smtp.remote-ip=54.92.39.34
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E7E606A31C;
	Mon, 16 Nov 2026 04:48:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48E7E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mucse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mucse.com
X-QQ-mid: esmtpsz11t1794804459tffb983d8
X-QQ-Originating-IP: QwzR3JU7LTo6oRYc83IIO48GpCQyHsxxkFandPLZ2v4=
Received: from localhost ( [203.174.112.180])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 16 Nov 2026 12:47:37 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11810620712706261052
EX-QQ-RecipientCnt: 10
Date: Mon, 16 Nov 2026 12:47:37 +0800
From: Yibo Dong <dong100@mucse.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	yaojun@mucse.com
Subject: Re: [PATCH net-next v2 2/5] net: rnpgbe: Report link settings
 through ethtool
Message-ID: <2207C8DCDD49F5EE+20261116044737.GA1342898@nic-Precision-5820-Tower>
References: <BD205A7832D36E7D+20261116030917.1329989-1-dong100@mucse.com>
 <66AFF2810AB647C8+20261116031020.1330219-1-dong100@mucse.com>
 <d7351f56-d4fa-4ba0-a0c6-c7bdf7aac460@lunn.ch>
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
In-Reply-To: <d7351f56-d4fa-4ba0-a0c6-c7bdf7aac460@lunn.ch>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:mucse.com:qybglogicsvrgz:qybglogicsvrgz3a-1
X-QQ-XMAILINFO: McJfg7Aee/FZHZaIV3oLykZwMD59+ZK58lwnWmKMJDyQcThleV+PW4wa
	7YomE/70RwVRzrrw/618siYLUo0+VlUnW2eV/rWf7O0re2EgNDUIUuCAnkyERCaOuaJQMe1
	EBjqm+Xh0hYa/j6P6NnnWhs/smDTQ/xXgiPNl4ILkumyRQedPnKFCQcgpxfEFr42UqD58JM
	3TDNXXfivcyQLnb21X3vJNbqi9dSKED4E97RbABv3tk5prwzHT71AnJaq0q65L+Mn0T7r7D
	iPgG6vC64hU9VgOFX8G34GBsrv0i5pdb3WL1RKRnyRylEaJrYjs3TKGdfIUxGAB+a2cYk82
	fLQD8P+K392ZBYuzhKKW7xR2zAtFdWit/x9RnO8x2EVWRjClpWHESNm4jfDHSt0fz+64k+B
	x/6stjGGjVgb3Ra+VwmRP8uUo7yzCVIvvmc9BmgcVxPRWdSUqe+wjP6kyb4rPb95kMQdUhy
	KxRNRkAehBHEEpSWapDSAHtD5yE6HqUpBUBPJmj8AVRKEgruznuMGuaWeYSEBseaNV7QyBv
	U5wYO5GBlOz7NiTnW8xz4EH1qfaGAvZAdtK2bLE5uTccYfCANw+biCQMIosoReGpEUtObH6
	12OEat7Y2Gv0ytQ7zLD1Pc07sZYNEm4xtG6V2gmlczlq3fo/evdm2Yz1JK0zjh3sv+bppkc
	eiN5k4IyEgL/Bj9Rh910aRdgpwl6n9Bcz6CwcMg0vcObAfLrlMnHPTaMtWspdo4+m71frA8
	G64Z2LAGCntgX1Zq+jo3Tc4HAzrJm3CCvpKVfke2yVGiSWMy70qfOkVppCjdyKAcmkN8IAL
	GlgPf4CRnNa5PEMUuQ1AwPwWHazJMx7asXdFTmjvol1aqNOhLGElT+UWcbn6fMkyHgGa7Jg
	MKz4TG0dEhrrWa3zH5WgQMhR/sT4GfnQ1W049WtJxBZMuvbwK94cGpUPc6tYzYhQDkqDlzz
	B/7B7plqn1O8eWPMz5+CMcGgXglgIbZHe2Ahl7NAUY+VLjxAg2s0FxXeMvBJAV8TysQcJ12
	VGZf5UGjlPehkh9lVftet3dfBVO9sWbEmiu0dJLpSskt56nZ2Q
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

On Mon, Nov 16, 2026 at 05:19:35AM +0100, Andrew Lunn wrote:
> > +static int rnpgbe_get_link_ksettings(struct net_device *netdev,
> > +				     struct ethtool_link_ksettings *cmd)
> > +{
> > +	struct mucse *mucse = netdev_priv(netdev);
> > +	struct mucse_hw *hw = &mucse->hw;
> > +	u32 supported, advertising;
> > +	unsigned long flags;
> > +	u16 status;
> > +	int mode;
> > +
> > +	status = hw->link_config.status;
> > +	supported = hw->link_config.supported;
> > +	advertising = hw->link_config.advertising;
> 
> These are accessed without a lock,
> 
The fields in link_config contain cached capabilities and configuration.
They are initialized before netdevice registration, and subsequent
configuration updates are serialized with ethtool queries by RTNL.
Firmware link events do not modify this cache.
> > +	ethtool_link_ksettings_zero_link_mode(cmd, supported);
> > +	ethtool_link_ksettings_zero_link_mode(cmd, advertising);
> > +	ethtool_link_ksettings_zero_link_mode(cmd, lp_advertising);
> > +	cmd->base.autoneg = AUTONEG_DISABLE;
> > +	cmd->base.speed = SPEED_UNKNOWN;
> > +	cmd->base.duplex = DUPLEX_UNKNOWN;
> > +	cmd->base.eth_tp_mdix = ETH_TP_MDI_INVALID;
> > +	spin_lock_irqsave(&mucse->link_lock, flags);
> > +	if (netif_carrier_ok(netdev) && hw->link) {
> > +		cmd->base.speed = hw->speed;
> > +		cmd->base.duplex = hw->duplex ?
> > +				   DUPLEX_FULL : DUPLEX_HALF;
> > +		if (status & MUCSE_LINK_TP)
> > +			cmd->base.eth_tp_mdix = hw->mdix;
> 
> Yet these need a lock?
> 
link, speed, duplex and mdix are updated asynchronously by
the mailbox event handler, outside RTNL. link_lock protects these updates
and provides a consistent snapshot in the getter.
> > +	}
> > +	spin_unlock_irqrestore(&mucse->link_lock, flags);
> > +
> > +	if (status & MUCSE_LINK_TP) {
> > +		rnpgbe_link_modes(cmd->link_modes.supported, supported);
> > +		rnpgbe_link_modes(cmd->link_modes.advertising, advertising);
> > +		ethtool_link_ksettings_add_link_mode(cmd, supported, TP);
> > +		ethtool_link_ksettings_add_link_mode(cmd, advertising, TP);
> 
> Advertising TP? Can you point to some part of 802.3 to support
> advertising TP to the link partner.
> 
You're right. Adding TP to the advertising bitmap here was a mistake.
I will remove it from advertising in next version.
> 	Andrew
> 
Thanks for your feedback.

