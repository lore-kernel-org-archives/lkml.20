Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3F85304AD
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914117; cv=none; b=bM/D7tKjeG4xWwsR+RBeDjiBRoXACyj4+7VZO08V3kaYT8Zy0JUPTFq5WSZQLyQeJaLK5dh8QOtXKgtJkK7Ece9xk6opN/zsl9XtvHABB2gRqlnezT7pFPG4qesCWSeQfpjnVb1OMWjUecXghMAKiHEeo/Mx1eEh40vlSEApLck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914117; c=relaxed/simple;
	bh=hCygAOcpoOgYSOhn3ir2c13VrfChCeMianiS4x5J6n8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ovTAnb/1Oddm7zWrI+X2MLTH25pfSe9QjGxg2vaujGLojaaGaKndj2dyKqoEknX1s6apyYDGZe8pDDLIwgjD8PNQk9x6RBgDL3irlDwoK5neSNNZ2ramg4dlA0+10U3NiUBPLb56PKSH/XrIHtV6lwumgI21s4UZV5u3gU25Bds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=B2auG8qs; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="B2auG8qs"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 31A69C653F9
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:56:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8F0F160362
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:55:14 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
	id 1E29B11D718AB; Tue, 13 Oct 2026 19:51:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791914114; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=+ZpQqUUT5xDOkosuVKHI5oZ4WAPT6O1QigZ2jMnin5k=;
	b=B2auG8qsXAgiMXzUAd7lNLlZzED4ZLAXpCAEQA3/W2zAIdWi6gm+c2eTb4piyB4kQzbUQX
	0suQKjJNAbjXQLTwCUcOYfDpJThV92Nj5wvVAQIh3xzDjjbyvRvtC8XFywOCA28UpCmmeB
	Zd44ExVJNvi/ezAWwitMKgn5+A2wkeezNwJMKtmyW73BmK1ju6dM801jDd7jA2B5jKmgeT
	7Kh+3nt2ntrP3y2+bTXjTMBUqpLNXOqOQE/4247xJRtsnaWZ6Pj0kMXhHmF8j/7AX3Eg2X
	pQjb+/AXVwAAN4gfyyXfKOnTlIBMTZlLTP7Qi5WFO7fo6p1oKke3WagKBpGUeA==
Authentication-Results: mail.galae.net;
	none
Message-ID: <e0a76d2f-cfe5-497b-b25b-aeae2e174ab5@bootlin.com>
Date: Thu, 8 Oct 2026 10:29:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 01/10] net: hisilicon: hisi_femac: Move setting of
 netops to fix crash
To: David Yang <mmyangfl@gmail.com>, netdev@vger.kernel.org
Cc: Jian Shen <shenjian15@huawei.com>, Jijie Shao <shaojijie@huawei.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Nicolai Buchwitz <nb@tipi-net.de>, Stanislav Fomichev <sdf@fomichev.me>,
 linux-kernel@vger.kernel.org
References: <20261008022656.3592191-1-mmyangfl@gmail.com>
 <20261008022656.3592191-2-mmyangfl@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261008022656.3592191-2-mmyangfl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 1E29B11D718AB
X-Spamd-Result: default: False [2.34 / 30.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[129];
	MIME_GOOD(-0.10)[text/plain];
	BAYES_HAM(-0.06)[57.16%];
	DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
	RCVD_COUNT_ZERO(0.00)[0];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[netdev];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	BCC(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
	URIBL_BLOCKED(0.00)[localhost:rdns,localhost:helo,bootlin.com:mid,bootlin.com:email];
	TO_DN_SOME(0.00)[]



On 10/8/26 04:26, David Yang wrote:
> hisi_femac_drv_probe() connects the PHY before dev->netdev_ops is
> assigned. phy_attach_direct() -> phy_link_topo_add_phy() reads
> dev->netdev_ops through netdev_need_ops_lock() since the commit in
> question, so probing crashes with a NULL pointer dereference when
> CONFIG_NET_SHAPER is enabled.
> 
>   phy_link_topo_add_phy from phy_attach_direct+0xec/0x37c
>   of_phy_get_and_connect from hisi_femac_drv_probe+0x1f4/0x558
>   Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> 
> Assign netdev_ops before the PHY attach, as was done for emac in commit
> 7c9f391ec89c ("net: emac: move setting of netops to fix crash").
> 
> Fixes: ded86da4bbb7 ("net: ethtool: relax ethnl_req_get_phydev() locking assertion")
> Signed-off-by: David Yang <mmyangfl@gmail.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Thanks,

Maxime

> ---
>  drivers/net/ethernet/hisilicon/hisi_femac.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/hisilicon/hisi_femac.c b/drivers/net/ethernet/hisilicon/hisi_femac.c
> index d244a40df430..016605e86f0b 100644
> --- a/drivers/net/ethernet/hisilicon/hisi_femac.c
> +++ b/drivers/net/ethernet/hisilicon/hisi_femac.c
> @@ -830,6 +830,8 @@ static int hisi_femac_drv_probe(struct platform_device *pdev)
>  		hisi_femac_phy_reset(priv);
>  	}
>  
> +	ndev->netdev_ops = &hisi_femac_netdev_ops;
> +
>  	phy = of_phy_get_and_connect(ndev, node, hisi_femac_adjust_link);
>  	if (!phy) {
>  		dev_err(dev, "connect to PHY failed!\n");
> @@ -850,7 +852,6 @@ static int hisi_femac_drv_probe(struct platform_device *pdev)
>  
>  	ndev->watchdog_timeo = 6 * HZ;
>  	ndev->priv_flags |= IFF_UNICAST_FLT;
> -	ndev->netdev_ops = &hisi_femac_netdev_ops;
>  	ndev->ethtool_ops = &hisi_femac_ethtools_ops;
>  	netif_napi_add_weight(ndev, &priv->napi, hisi_femac_poll,
>  			      FEMAC_POLL_WEIGHT);

