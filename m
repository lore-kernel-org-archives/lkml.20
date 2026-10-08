Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6656A46D2A5
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 08:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791448212; cv=none; b=Jjou+anMWdfRNFhga6+66RE/uj1A5YjxdROSLjn1r4VFhNeZwVWBE6P+OYTd/iTUBirlph/bdOkF7M0N/mFuxHlSTjKd83OtsChdOMUSvbqH1tiKN5SZkSDIs//FDax6hy+Rf6DmMQlkiC3YAB0EKdxnyih5AIARLXeWvL6SMxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791448212; c=relaxed/simple;
	bh=Y2/Ewf5IkZDC5G7ubw4tGMSTAq4i4xDhgRpZcpWtjVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gD6846jczuqD2Uq9sLgUrPUPI4LmJCo59S7x6kigXLaq22NN+DtogaEvx2yLPhgW9G+o6qQxAc+H4ISnfHbKS8JJk1SNdAfCRW9yb01PBA8qIpu1ZLKlS7ap/Jcr8VmOzE5+WVm/Pjm4rCsGkq4gAbUULl6qrC4TpNo0FGD53L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=iwr/rdHs; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="iwr/rdHs"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 73A7B1A1185;
	Thu,  8 Oct 2026 08:30:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 45E9E60341;
	Thu,  8 Oct 2026 08:30:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BE5B510333850;
	Thu,  8 Oct 2026 10:30:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791448206; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=NX/RScijLlgmk9jFAka1C5iMtn80JrFrW2GWXIg3HGQ=;
	b=iwr/rdHsWsqYD7Mi+W5+eTfQcFta6E+UJDQ63DaewWeqZWrO/boVErgHpuPNWI/D+PlnLT
	hutoZoxlbr9fRk8ql6x0g5l8EBJnh9AMSPVjTzK2eOhZljYl9KpTzvS09cwCJFK0x2Cw96
	3G67jdKzpIzELAHrpFN86Y6G1eTR3djLBSp1p94ZCzrU79dFG0Q3lCdfw88riHvzkD97Jn
	oRreRkS+DcEFxIeK7Ah6bN7Ve0zI8rFKJRnsGLZqL0L4j83pZYmNW1XSX+oKhBpEEZ9/Y7
	sGhnys8bZjnLkEz9+AgYgqatbieOcP7ALb8X3DtkHM03DbgKAXBxQ8v3yN2p+g==
Message-ID: <cdf6cbfd-1892-45dd-aa44-754a3412500a@bootlin.com>
Date: Thu, 8 Oct 2026 10:30:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 02/10] net: hisilicon: hip04_eth: Move setting of
 netops to fix crash
To: David Yang <mmyangfl@gmail.com>, netdev@vger.kernel.org
Cc: Jian Shen <shenjian15@huawei.com>, Jijie Shao <shaojijie@huawei.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jacob Keller <jacob.e.keller@intel.com>, Nicolai Buchwitz <nb@tipi-net.de>,
 Stanislav Fomichev <sdf@fomichev.me>, linux-kernel@vger.kernel.org
References: <20261008022656.3592191-1-mmyangfl@gmail.com>
 <20261008022656.3592191-3-mmyangfl@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261008022656.3592191-3-mmyangfl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 10/8/26 04:26, David Yang wrote:
> hip04_mac_probe() calls of_phy_connect() before ndev->netdev_ops is
> assigned. phy_attach_direct() -> phy_link_topo_add_phy() reads
> dev->netdev_ops through netdev_need_ops_lock() since the commit in
> question, so probing crashes with a NULL pointer dereference when
> CONFIG_NET_SHAPER is enabled.
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
>  drivers/net/ethernet/hisilicon/hip04_eth.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/hisilicon/hip04_eth.c b/drivers/net/ethernet/hisilicon/hip04_eth.c
> index fc2c47dcfaab..d0409de5c553 100644
> --- a/drivers/net/ethernet/hisilicon/hip04_eth.c
> +++ b/drivers/net/ethernet/hisilicon/hip04_eth.c
> @@ -976,6 +976,8 @@ static int hip04_mac_probe(struct platform_device *pdev)
>  		goto init_fail;
>  	}
>  
> +	ndev->netdev_ops = &hip04_netdev_ops;
> +
>  	priv->phy_node = of_parse_phandle(node, "phy-handle", 0);
>  	if (priv->phy_node) {
>  		priv->phy = of_phy_connect(ndev, priv->phy_node,
> @@ -989,7 +991,6 @@ static int hip04_mac_probe(struct platform_device *pdev)
>  
>  	INIT_WORK(&priv->tx_timeout_task, hip04_tx_timeout_task);
>  
> -	ndev->netdev_ops = &hip04_netdev_ops;
>  	ndev->ethtool_ops = &hip04_ethtool_ops;
>  	ndev->watchdog_timeo = TX_TIMEOUT;
>  	ndev->priv_flags |= IFF_UNICAST_FLT;

