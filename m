Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336A9455632
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791913989; cv=none; b=nvVlQgS4lA3VUKStX0qseg//5P8XSJshxQ2We1wqEoe36Q8EJ5wXqBbD0O6ve3ygyc4mF9nVzKqV0MMR0XZDTxArDJd1hophgqd9wCGmVAbam98rHlDHM1qKeNZom9czeZfT+Az4yd+x20lnjwdVAa2rOCeL/pSzEBKDkVFuJsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791913989; c=relaxed/simple;
	bh=UtmtYmaW6Cssk0+1yKQdXj2osa6Eg3FWou1uNuwu5W4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ILi7PivjKtTPKT4rHdBZtovBMGFZGorkrmuRLWRe+fvsglN7gH6pRfBcTmx4Lx64Vkx8wHdhg2F9Sn9EYluojT2HPTfoOx9bZQGGFePf+Grg2a7peASfeotM8wf68LiYaCGsM7IuwR9qOfjvfMy2JA2Szin+GPDhYig9xFU247Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VG51OGnO; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VG51OGnO"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B6E6E1A1201
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:53:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 822AA60362
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:53:06 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
	id CDD9711D718AA; Tue, 13 Oct 2026 19:50:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791913986; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ttSrJSqeOB5o22OsLjipA3xmWar20zg1N0hk0L/3n24=;
	b=VG51OGnO1H2HcaF9KzsyUnLY57x/uXHkiAaPV7dUa+X5ZJ/uMbXgNSM33ocV4N0ZQtmUF8
	zRiyZ5qIbQ5eisXGfe2YYH7XupbbO6MhEU2AvGaiSx+9Cg2bXmztW0LNu103iI121MbWus
	7d7yUuaDx8AsWX8d9NiCcbyqWFuL+e5S9u3MsHjww9X6X5dNxDEwO2E2I26LSg8acH32OE
	VRq0i+aNdYO1RWrqXL1B87Xm9nnyasgR2iD/hbaOW/UmZ4IuqWyzjcPwCTIZrUVVdUHXm3
	m3VLcFoaGkRD99IRLLhaH5yedayoVWbIAMGv1TR52J6xUI6pD4NOIF1/IKMvBA==
Authentication-Results: mail.galae.net;
	none
Message-ID: <b75ee714-508a-4480-90fd-0b4006d354b1@bootlin.com>
Date: Thu, 8 Oct 2026 10:31:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 08/10] net: ethernet: aeroflex: move setting of netops
 to fix crash
To: David Yang <mmyangfl@gmail.com>, netdev@vger.kernel.org
Cc: Andreas Larsson <andreas@gaisler.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Jacob Keller <jacob.e.keller@intel.com>,
 Stanislav Fomichev <sdf@fomichev.me>, linux-kernel@vger.kernel.org
References: <20261008022656.3592191-1-mmyangfl@gmail.com>
 <20261008022656.3592191-9-mmyangfl@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261008022656.3592191-9-mmyangfl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: CDD9711D718AA
X-Spamd-Result: default: False [2.36 / 30.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[129];
	MIME_GOOD(-0.10)[text/plain];
	BAYES_HAM(-0.04)[54.82%];
	URIBL_BLOCKED(0.00)[bootlin.com:mid,bootlin.com:email,localhost:rdns,localhost:helo];
	BCC(0.00)[];
	MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
	DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[netdev];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	TO_DN_SOME(0.00)[]



On 10/8/26 04:26, David Yang wrote:
> greth_of_probe() calls greth_mdio_init(), which connects the PHY,
> before dev->netdev_ops is assigned. phy_attach_direct() ->
> phy_link_topo_add_phy() reads dev->netdev_ops through
> netdev_need_ops_lock() since the commit in question, so probing crashes
> with a NULL pointer dereference when CONFIG_NET_SHAPER is enabled.
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
>  drivers/net/ethernet/aeroflex/greth.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/aeroflex/greth.c b/drivers/net/ethernet/aeroflex/greth.c
> index a593adc16c78..fccb67beebee 100644
> --- a/drivers/net/ethernet/aeroflex/greth.c
> +++ b/drivers/net/ethernet/aeroflex/greth.c
> @@ -1421,6 +1421,8 @@ static int greth_of_probe(struct platform_device *ofdev)
>  	/* Check if MAC can handle MDIO interrupts */
>  	greth->mdio_int_en = (tmp >> 26) & 1;
>  
> +	dev->netdev_ops = &greth_netdev_ops;
> +
>  	err = greth_mdio_init(greth);
>  	if (err) {
>  		if (netif_msg_probe(greth))
> @@ -1498,7 +1500,6 @@ static int greth_of_probe(struct platform_device *ofdev)
>  		dev->flags &= ~IFF_MULTICAST;
>  	}
>  
> -	dev->netdev_ops = &greth_netdev_ops;
>  	dev->ethtool_ops = &greth_ethtool_ops;
>  
>  	err = register_netdev(dev);

