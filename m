Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6958D52D2CB
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791913780; cv=none; b=aFSH0j/gZrT+scr1IbuQnbhtcuueYrgEiCtCeyipMz2ZrTaQk8Vl4Q8ARfqzjWPWBjaIJSVulTjEO3eEQvh7ZkdP6RMAh446ZsZnZf+ObWjLj6fDk8yjitvBd+eo8LMkfJjcYoZujzCK7MUCuOW7b1EEq3ks2muUg4kmmRPfo0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791913780; c=relaxed/simple;
	bh=uK36CqJkeJUpUtxP+EUGCN+MV4T0uhFT8M6h+OFg+p8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ieH8rAtW9KrNOjAkA/aZ6QpeUDVexzpgoYb02jwDnHO76nXy3Os1SbeEPBHtO0QqhYhw4x98z6oS4HosusKQNPIyNHfhNlxxXNr6ns0hZsZYOXPPTnh+s9YHzdXUwqw8c8tF6bbUongPcytXa3WTR1FNo4L9NDQ/YdDATYWaTtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QmO3Lv1d; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QmO3Lv1d"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2D617C653F9
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:50:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8D20560362
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:49:33 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
	id E2DF411D7183A; Tue, 13 Oct 2026 19:49:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791913773; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=gI7trdo1WKqFoH1Knh8GwOdvv+JqJMYetShyEjJZcmM=;
	b=QmO3Lv1dADuQ2RmGD0RkIZMERMJm1MpMaEAZ3zsnYxqBzilI63Y55TLPNeeQMLmMta/pD3
	CqX1IAivL2UvxMafF2Q5gtdV5j/H2W6a1DOl+SQsRBHLKkukJQaYAJnfJJcyhVg3KotsJy
	xBYgSOeeICt5YvlG29F1bBmhgTXGFCzqAdgtgMxvOHAnzurhk4GKFJQyOFfobJdjHTRRrz
	2W/xiXghm05pobJ1TSBHNtyCp0jXgnR4X192GBR9rUsxSM3bDDfqU5dDctsuKqUrx0B/FK
	R9z+8H9yFHpjhsPvo+addZ/o/CZw9SWHvHm2Qa2Zaxb3dlI6WYfxLvnAvgyY+g==
Authentication-Results: mail.galae.net;
	none
Message-ID: <85184f37-32d8-42ce-90db-46cde769ecf5@bootlin.com>
Date: Thu, 8 Oct 2026 10:32:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 09/10] net: ti: icssm-prueth: Move setting of netops
 to fix crash
To: David Yang <mmyangfl@gmail.com>, netdev@vger.kernel.org
Cc: MD Danish Anwar <danishanwar@ti.com>, Parvathi Pudi
 <parvathi@couthit.com>, Roger Quadros <rogerq@kernel.org>,
 Mohan Reddy Putluru <pmohan@couthit.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Jacob Keller <jacob.e.keller@intel.com>,
 Stanislav Fomichev <sdf@fomichev.me>, Nicolai Buchwitz <nb@tipi-net.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261008022656.3592191-1-mmyangfl@gmail.com>
 <20261008022656.3592191-10-mmyangfl@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261008022656.3592191-10-mmyangfl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: E2DF411D7183A
X-Spamd-Result: default: False [-3.10 / 30.00];
	BAYES_HAM(-5.50)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[129];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[netdev];
	RCVD_COUNT_ZERO(0.00)[0];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	BCC(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
	URIBL_BLOCKED(0.00)[galae.net:url,infradead.org:email,bootlin.com:email,bootlin.com:mid,bootlin.com:url,lunn.ch:email,davemloft.net:email,tipi-net.de:email,localhost:rdns,localhost:helo,intel.com:email,fomichev.me:email,ti.com:email,couthit.com:email];
	TO_DN_SOME(0.00)[]



On 10/8/26 04:26, David Yang wrote:
> icssm_prueth_netdev_init() calls of_phy_get_and_connect() before
> ndev->netdev_ops is assigned. phy_attach_direct() ->
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
>  drivers/net/ethernet/ti/icssm/icssm_prueth.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.c b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
> index b7e94244355a..b42c98e861e0 100644
> --- a/drivers/net/ethernet/ti/icssm/icssm_prueth.c
> +++ b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
> @@ -1563,6 +1563,8 @@ static int icssm_prueth_netdev_init(struct prueth *prueth,
>  	}
>  	ether_addr_copy(emac->mac_addr, ndev->dev_addr);
>  
> +	ndev->netdev_ops = &emac_netdev_ops;
> +
>  	/* connect PHY */
>  	emac->phydev = of_phy_get_and_connect(ndev, eth_node,
>  					      icssm_emac_adjust_link);
> @@ -1590,7 +1592,6 @@ static int icssm_prueth_netdev_init(struct prueth *prueth,
>  	}
>  
>  	ndev->dev.of_node = eth_node;
> -	ndev->netdev_ops = &emac_netdev_ops;
>  
>  	netif_napi_add(ndev, &emac->napi, icssm_emac_napi_poll);
>  

text:
Return-Path: <netdev+bounces-342830-maxime.chevallier=bootlin.com@vger.kernel.org>
Delivered-To: maxime.chevallier@bootlin.com
Received: from mail.galae.net ([172.22.1.253])
	by 9e7fea892943 with LMTP
	id kOIoI45Wx2pNGRkAtaWaaQ
	(envelope-from <netdev+bounces-342830-maxime.chevallier=bootlin.com@vger.kernel.org>)
	for <maxime.chevallier@bootlin.com>; Thu, 08 Oct 2026 10:38:38 +0200
X-Original-To: maxime.chevallier@bootlin.com
Received: from smtpin-01.galae.net (smtpin-01.galae.net [51.159.2.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.galae.net (Postcow) with ESMTPS id 23E71103303A7
	for <maxime.chevallier@bootlin.com>; Thu,  8 Oct 2026 10:38:37 +0200 (CEST)
Authentication-Results: mail.galae.net;
	dkim=pass header.d=bootlin.com header.s=dkim header.b="yyHoI/ox";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1");
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.galae.net: domain of "netdev+bounces-342830-maxime.chevallier=bootlin.com@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="netdev+bounces-342830-maxime.chevallier=bootlin.com@vger.kernel.org"
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com;
	s=dkim; t=1791448718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:
	 list-unsubscribe:list-subscribe:dkim-signature;
	bh=DKhOUStc32yyJJh2yPmsAjtT0L8xYwJmDHCV2AfoKVk=;
	b=lBhhGBSDLDAjLTzj6d/Nmb9RIIVTA6NokJRlUEd3jLLrd3Wl+dMLz6jNq+d5fGYCZdrFSe
	qPsIMdCsbAVfi2vkcNOrHqgHhwarwRZ9xlwVoDBwGmMMEu24fCyivb0lPl91YvuqS7bSmk
	CllzQuAxt9b0dckhvTe0bj1JhqI6f57O7k6ruoJMv7/8J9WiJzq44zh5LZiR5FdYZgVZnT
	7NWMpSyzoPJblkvsz9gAWd+Rkps3sIfycFh7FsZBVtxnF3cIfEqkLXs2BrySvegS381Cl/
	5Y/sAD0Gms0lTiC80FUpv4HyP+L3ztWR2Q1qfsGAhErP0Xrsh5dE/BSLHmZppA==
ARC-Authentication-Results: i=2;
	mail.galae.net;
	dkim=pass header.d=bootlin.com header.s=dkim header.b="yyHoI/ox";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1");
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.galae.net: domain of "netdev+bounces-342830-maxime.chevallier=bootlin.com@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="netdev+bounces-342830-maxime.chevallier=bootlin.com@vger.kernel.org"
ARC-Seal: i=2; s=dkim; d=bootlin.com; t=1791448718; a=rsa-sha256; cv=pass;
	b=MS0FIWql+kNXTq/h8fQduIOs7sK47/iyh5Rk8Vg5yMPNO99kGL1/qK0Rl+enKeSOTGvyxQ
	cKnxT6eWYUPPV4lgOxX5wEMywEpQMRS6rvC8QItZRYGW57r7CLenweCWD+HiU8aRFGq8r8
	qG43lScwrR2Yl6GHoyUkXzKw4geHJNpnoewBEPFin+AMNnLqQh1vTSUY1QNJlH44M33VZz
	XPhbMIKnSe2Q2rhrRbaeWoSvPKTHanY0h1ESrBCYaEOqsom1NUGtxdVcxsa2wEgoc2v9hL
	qJ7dYMEq2Kl9kFJGJ2+4TUkIIY+G3/AK0fo15Cf/FdmpdwfJbrKRbLoek+2klA==
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by smtpin-01.galae.net (Postfix) with ESMTPS id A11B5342DD9
	for <maxime.chevallier@bootlin.com>; Thu,  8 Oct 2026 08:38:37 +0000 (UTC)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 174EA2BDAA
	for <maxime.chevallier@bootlin.com>; Thu,  8 Oct 2026 08:32:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2728470E9D;
	Thu,  8 Oct 2026 08:32:20 +0000 (UTC)
X-Original-To: netdev@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F3B451991
	for <netdev@vger.kernel.org>; Thu,  8 Oct 2026 08:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791448339; cv=none; b=S/Y85t+FaTaNMBlF2npqhRjvOoTXTmRf8x3T38WNzx+RBazd5hW+kTPSIWpz7uGAiN0nIVxFlWQrh+fZYgSk6/rTKHLEtR2ErCb03l0/Q4ulPzm9QBk6WCeKvVGMk6ivJ1KGdLkt8czR4k/1EgILb9wChcczYoN/HL2W0Njdztg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791448339; c=relaxed/simple;
	bh=mKPxpFXIIF8Czy3FxcgFWg1HjY+yIVit76orNJybYUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TZ+w6TKfrk7kzYC6JVZUsEq209opdLjvtmMhT123pAXVhlInJ2CiwHMrTvjSemQDhUb/QeCBB7yoXvNsDxEBiSf+yxDzWcpf3ST/mxtR/m9K7AGZ0wqF/7bgQ33FucuVI9i/hZ9C5SZuW6iC7VyAg0qwFuH4Q4QT8OSd/AoUSe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=yyHoI/ox; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B2F391A1185;
	Thu,  8 Oct 2026 08:32:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8189360341;
	Thu,  8 Oct 2026 08:32:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A1E6E10333850;
	Thu,  8 Oct 2026 10:32:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791448333; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=DKhOUStc32yyJJh2yPmsAjtT0L8xYwJmDHCV2AfoKVk=;
	b=yyHoI/oxSfdhJNEDv3/CTjikWXWJLcVViQRDKXaycfcuAlZd406+P127DWOfiugd/D3kPT
	es+l7ZPrDzzrxVzEGCjdfBHqn7srcDW5pvXitk5X0S/rgaiyKfa/KIOglKufZH+/7Jcr/1
	iVlNRIJpJJSsJfTI9eA979l45dSzZr5V3SYh7GgA44kO6BrtmjUaBJaLQ+CW6/DU1jaS8l
	4midyiJUTxJjAnIt/t7/7RoKpo8VHigd7tpdij5H1ztJ9DZHdjDjqdsI5py7gbVE8Tf4eF
	2MUU0LmXwD+78xuwBWZ2abmo8JXhrmrhTcsfEXOgsygxxCmHje1udtX2G7+HxA==
Message-ID: <85184f37-32d8-42ce-90db-46cde769ecf5@bootlin.com>
Date: Thu, 8 Oct 2026 10:32:05 +0200
Precedence: bulk
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 09/10] net: ti: icssm-prueth: Move setting of netops
 to fix crash
To: David Yang <mmyangfl@gmail.com>, netdev@vger.kernel.org
Cc: MD Danish Anwar <danishanwar@ti.com>, Parvathi Pudi
 <parvathi@couthit.com>, Roger Quadros <rogerq@kernel.org>,
 Mohan Reddy Putluru <pmohan@couthit.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Jacob Keller <jacob.e.keller@intel.com>,
 Stanislav Fomichev <sdf@fomichev.me>, Nicolai Buchwitz <nb@tipi-net.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261008022656.3592191-1-mmyangfl@gmail.com>
 <20261008022656.3592191-10-mmyangfl@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261008022656.3592191-10-mmyangfl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-5.25 / 30.00];
	BAYES_HAM(-3.17)[93.35%];
	SUSPICIOUS_RECIPS(1.50)[];
	IP_REPUTATION_HAM(-1.41)[asn: 63949(-0.40), country: SG(-0.01), ip: 172.105.105.114(-1.00)];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MX_GOOD(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	URIBL_BLOCKED(0.00)[bootlin.com:mid,bootlin.com:email,bootlin.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RCPT_MAILCOW_DOMAIN(0.00)[bootlin.com];
	MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	BCC(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-342830-maxime.chevallier=bootlin.com];
	RBL_SENDERSCORE_REPUT_BLOCKED(0.00)[172.105.105.114:from];
	DKIM_TRACE(0.00)[bootlin.com:+];
	DNSWL_BLOCKED(0.00)[212.83.136.155:received,212.83.139.233:received,185.246.84.56:received,172.105.105.114:from,100.90.174.1:received];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maxime.chevallier@bootlin.com,netdev@vger.kernel.org];
	ARC_SIGNED(0.00)[bootlin.com:s=dkim:i=2];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[bootlin.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	EXTERNAL_RELAY_AUTHENTICATED(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 23E71103303A7



On 10/8/26 04:26, David Yang wrote:
> icssm_prueth_netdev_init() calls of_phy_get_and_connect() before
> ndev->netdev_ops is assigned. phy_attach_direct() ->
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
>  drivers/net/ethernet/ti/icssm/icssm_prueth.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.c b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
> index b7e94244355a..b42c98e861e0 100644
> --- a/drivers/net/ethernet/ti/icssm/icssm_prueth.c
> +++ b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
> @@ -1563,6 +1563,8 @@ static int icssm_prueth_netdev_init(struct prueth *prueth,
>  	}
>  	ether_addr_copy(emac->mac_addr, ndev->dev_addr);
>  
> +	ndev->netdev_ops = &emac_netdev_ops;
> +
>  	/* connect PHY */
>  	emac->phydev = of_phy_get_and_connect(ndev, eth_node,
>  					      icssm_emac_adjust_link);
> @@ -1590,7 +1592,6 @@ static int icssm_prueth_netdev_init(struct prueth *prueth,
>  	}
>  
>  	ndev->dev.of_node = eth_node;
> -	ndev->netdev_ops = &emac_netdev_ops;
>  
>  	netif_napi_add(ndev, &emac->napi, icssm_emac_napi_poll);
>  


