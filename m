Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA29486658
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914018; cv=none; b=RQjBhqG9q5bQToIHVKIQeDrx5He79YUh71exj5WaCTtV0vgGBV7hmLp3U2bxWVHMKRYaGqj39Zx47c4wZoOsb16g3vjjjA0mC3JNKH+9FQp6ThkrIFkNfGEJb2DLgHmhT5/dwaDoA2aHIiBf7WY+6rRA3UlTA/VhQcd0E04Ax14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914018; c=relaxed/simple;
	bh=IpINi0Meh/ceR8PmkA1Z6Cs7XKH2RnVqfzp/0nZnnXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NIAbUtlDeRB4q1CLWiIBTs4mTgFdldHp6TDojuVga6d8BMnXD7zbVGu9+kMAMcL3PhHeZzd8Dmwd98hJFIllE7DSd2zYX+HhD+1ud7YeNsZJXPoviFifeC28sHo9fgK13ZQ1Ho77+1e4rVyEknvTX+C07668VKUi17ZGEWoWkpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Y49L1ZQa; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Y49L1ZQa"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0D8851A1201
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:53:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D50DE60362
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:53:34 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
	id 5417711D7188E; Tue, 13 Oct 2026 19:50:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791914010; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=QJ2Nk756NuMuezB9ERPbUvt9RU65XI7ZUq4xhUdRrpQ=;
	b=Y49L1ZQa59QxsJ3ieW3p/0PFmYrCcJAsMP1Pq6CHQ3JMkcxRPDsuowMt6iQ332z15EeExX
	zELr/WpKUYA6TdaaWU/yCZFATJRZdE4BE+sQkeoxaZobIHn6nzZ3fo/HsP4Y1tqUT8y5jC
	/9eA3wbs8MSI/SLw6KewIQrhK/daUKidfW8TTrKUmYebuJ/HehO0trLciXrFeusG7bAB65
	ppWF+MMm5oG8z3lx4LLEX1p9GmdD77IMhDTqxhA4lxNbG8oaW45LgNOvIbDN/Jd0vpfxfO
	WKN3JncxWxarEba8SXWCmbrPBRkSY1duuQEDEF1psRICXuHak2yGXZ6FeO56kA==
Authentication-Results: mail.galae.net;
	none
Message-ID: <b44d36a0-43a1-4399-8c79-29d1f57984cd@bootlin.com>
Date: Thu, 8 Oct 2026 10:30:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 03/10] net: ethernet: actions: Move setting of netops
 to fix crash
To: David Yang <mmyangfl@gmail.com>, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>, Stanislav Fomichev
 <sdf@fomichev.me>, Nicolai Buchwitz <nb@tipi-net.de>,
 Jacob Keller <jacob.e.keller@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261008022656.3592191-1-mmyangfl@gmail.com>
 <20261008022656.3592191-4-mmyangfl@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261008022656.3592191-4-mmyangfl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 5417711D7188E
X-Spamd-Result: default: False [2.40 / 30.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[129];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[netdev];
	BCC(0.00)[];
	DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
	ARC_NA(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
	URIBL_BLOCKED(0.00)[infradead.org:email,localhost:rdns,localhost:helo,lunn.ch:email,suse.de:email,davemloft.net:email,bootlin.com:email,bootlin.com:mid,bootlin.com:url,fomichev.me:email,galae.net:url,tipi-net.de:email,intel.com:email];
	TO_DN_SOME(0.00)[]



On 10/8/26 04:26, David Yang wrote:
> owl_emac_probe() calls owl_emac_phy_init(), which connects the PHY,
> before netdev->netdev_ops is assigned. phy_attach_direct() ->
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
>  drivers/net/ethernet/actions/owl-emac.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/actions/owl-emac.c b/drivers/net/ethernet/actions/owl-emac.c
> index 0a08da799255..2538275a1e57 100644
> --- a/drivers/net/ethernet/actions/owl-emac.c
> +++ b/drivers/net/ethernet/actions/owl-emac.c
> @@ -1552,6 +1552,8 @@ static int owl_emac_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	netdev->netdev_ops = &owl_emac_netdev_ops;
> +
>  	ret = owl_emac_phy_init(netdev);
>  	if (ret) {
>  		dev_err(dev, "failed to initialize PHY\n");
> @@ -1563,7 +1565,6 @@ static int owl_emac_probe(struct platform_device *pdev)
>  	netdev->min_mtu = OWL_EMAC_MTU_MIN;
>  	netdev->max_mtu = OWL_EMAC_MTU_MAX;
>  	netdev->watchdog_timeo = OWL_EMAC_TX_TIMEOUT;
> -	netdev->netdev_ops = &owl_emac_netdev_ops;
>  	netdev->ethtool_ops = &owl_emac_ethtool_ops;
>  	netif_napi_add(netdev, &priv->napi, owl_emac_poll);
>  

text:
Return-Path: <netdev+bounces-342827-maxime.chevallier=bootlin.com@vger.kernel.org>
Delivered-To: maxime.chevallier@bootlin.com
Received: from mail.galae.net ([172.22.1.253])
	by 9e7fea892943 with LMTP
	id IEhxF9FVx2pYBxkAtaWaaQ
	(envelope-from <netdev+bounces-342827-maxime.chevallier=bootlin.com@vger.kernel.org>)
	for <maxime.chevallier@bootlin.com>; Thu, 08 Oct 2026 10:35:29 +0200
X-Original-To: maxime.chevallier@bootlin.com
Received: from smtpin-01.galae.net (smtpin-01.galae.net [51.159.2.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.galae.net (Postcow) with ESMTPS id D872310333857
	for <maxime.chevallier@bootlin.com>; Thu,  8 Oct 2026 10:35:28 +0200 (CEST)
Authentication-Results: mail.galae.net;
	dkim=pass header.d=bootlin.com header.s=dkim header.b="2VH/QRrU";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1");
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.galae.net: domain of "netdev+bounces-342827-maxime.chevallier=bootlin.com@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="netdev+bounces-342827-maxime.chevallier=bootlin.com@vger.kernel.org"
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com;
	s=dkim; t=1791448529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:
	 list-unsubscribe:list-subscribe:dkim-signature;
	bh=xxECxQ++O9X0OKyJZXgkZtO03GupF5npmg5sevhbrog=;
	b=nscG30XWyMqPAHreLeTg4rpllg6UsfY+WDchqoNl2vTjV4+VRyyxIHSh/ayokSmjGh5gbM
	ZSBS8bZeyNAgnmas9RhFCWnN3Ua/qvo5ivIu/Eoq+tiNG0XyetLWNbmfvSvok5w4c+JmZv
	k5LglvU6Wl+mcKexIAkxsGsuDf44NU2miKmi2htZS13ubS7N0RG9bqorPZx6yK2Uwf1W5Z
	JuR0stsssr4v+0pWV5S9IFfMYlRnk2APteTb1QvpdPaaaVWmoBJOy0ntz3dCsXu1m+j+on
	WtTA0gkt/vn2rG6us7t8Qw7bsCPBR7ZhsguJt4CD2oIjZJoqTreJW4SzUobkbw==
ARC-Authentication-Results: i=2;
	mail.galae.net;
	dkim=pass header.d=bootlin.com header.s=dkim header.b="2VH/QRrU";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1");
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.galae.net: domain of "netdev+bounces-342827-maxime.chevallier=bootlin.com@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="netdev+bounces-342827-maxime.chevallier=bootlin.com@vger.kernel.org"
ARC-Seal: i=2; s=dkim; d=bootlin.com; t=1791448529; a=rsa-sha256; cv=pass;
	b=jJ7iUlEal41Mf8G+dDKojvkow1cgI70DXK02SWWHhsKHbEXzEIPk1kVfdFfRCsukHbyu3u
	AoIfYIE2gsMpPcTSRCHXCjGIBNr4tBWVZxYdTDgr2PjmvsvKiENDcGdlNxut7l8uDiv3bO
	TMWvb05R4x53qm0pa9glKul4tBnj1fGGZlLhWEuxnhpVMmbnTl6/KleAX6pzXBF//JRAYv
	d6X803SGdyj7GZxvvBWaUmS8zPAC1FEhbHe/ixKqhP9OO4v/DP9jGAiN/ALujxTffIfZxU
	naFxZTVOzgKs12ymi8DriysuBnj8BjFftDPROp5jAIpwCDeMA0Nx/w6judC3aQ==
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by smtpin-01.galae.net (Postfix) with ESMTPS id 4B867342DA8
	for <maxime.chevallier@bootlin.com>; Thu,  8 Oct 2026 08:35:28 +0000 (UTC)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BA7A029484
	for <maxime.chevallier@bootlin.com>; Thu,  8 Oct 2026 08:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2307246A611;
	Thu,  8 Oct 2026 08:30:32 +0000 (UTC)
X-Original-To: netdev@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B24A3D75A4
	for <netdev@vger.kernel.org>; Thu,  8 Oct 2026 08:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791448231; cv=none; b=II8Freetrleip4oSbfpXXxseiNWyQ52JbLgSXjhRrzu7xGVszuTvo+qFoonkB3pdxXrv99qKkYQWvk+Xt622x7SE6JpXCDu6GvALGYDzUyXQPlJp/49dBdfwC73YTnC3ktfxIzuFdWHSd4FOETKXLAWfad2q2/4fE3K4WhiFUZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791448231; c=relaxed/simple;
	bh=NK4BN9I4Kbmst7DqPYbh2MeXJQp4Qdfp8C4ZhaQniaU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nkJiCWsGxIvYdEf9LTk4jHmqH5BykINm8GXTLkgv2+xvIKJlWkIB7hJJdpD0hsKujdghX//UHYOeBKdz9VTvXKeDxBZ3K+MfF49+O/oqLiTSXY5DZhk2ahtmUsKdvb0ZQvn7vU2+xX2sOKthuECpKu/TjMHDpPEGe1hcEpptoQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=2VH/QRrU; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F3ACE1A1185;
	Thu,  8 Oct 2026 08:30:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C3FEC60341;
	Thu,  8 Oct 2026 08:30:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B0D4810333850;
	Thu,  8 Oct 2026 10:30:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791448226; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=xxECxQ++O9X0OKyJZXgkZtO03GupF5npmg5sevhbrog=;
	b=2VH/QRrUho2xFw/tBmEw9RjXx/KeuK4roNPFgZM78+4XHVP4W2OQzheGIGq3728PvD02yt
	C2Gb8SokhmGuvHzU/vj3D+zMCFZWPASBe11zuv36fSDGdjRE2TS/gzxPjO5BnMmZ5OsfWE
	jA2r3Ad2tEPK5yjme2raaU1kZBfJdHUMGj3SJqIHsZFroLdXUeQLWkuPYsWPvO8Ri5BYhn
	Gnh9dED8kgmEjiIMkPX7Zx52ki6WeGTsMPTR8gdk/EuMyGwBDgnVnv8FqWANPelltfgxMq
	rQb7snen7yxmwPmLztfLmullzXxqsrEryAaHzasSoZC423QjI8DhPOkHUeoJ3A==
Message-ID: <b44d36a0-43a1-4399-8c79-29d1f57984cd@bootlin.com>
Date: Thu, 8 Oct 2026 10:30:20 +0200
Precedence: bulk
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 03/10] net: ethernet: actions: Move setting of netops
 to fix crash
To: David Yang <mmyangfl@gmail.com>, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>, Stanislav Fomichev
 <sdf@fomichev.me>, Nicolai Buchwitz <nb@tipi-net.de>,
 Jacob Keller <jacob.e.keller@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261008022656.3592191-1-mmyangfl@gmail.com>
 <20261008022656.3592191-4-mmyangfl@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261008022656.3592191-4-mmyangfl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-2.14 / 30.00];
	SUSPICIOUS_RECIPS(1.50)[];
	IP_REPUTATION_HAM(-1.41)[asn: 63949(-0.40), country: SG(-0.01), ip: 104.64.211.4(-1.00)];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAYES_HAM(-0.06)[56.67%];
	MX_GOOD(-0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_BLOCKED(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bootlin.com:mid,bootlin.com:email,bootlin.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_MAILCOW_DOMAIN(0.00)[bootlin.com];
	MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	BCC(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-342827-maxime.chevallier=bootlin.com];
	RBL_SENDERSCORE_REPUT_BLOCKED(0.00)[104.64.211.4:from];
	DKIM_TRACE(0.00)[bootlin.com:+];
	DNSWL_BLOCKED(0.00)[100.90.174.1:received,212.83.136.155:received,104.64.211.4:from,212.83.139.233:received,185.246.84.56:received];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maxime.chevallier@bootlin.com,netdev@vger.kernel.org];
	ARC_SIGNED(0.00)[bootlin.com:s=dkim:i=2];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[bootlin.com:dkim];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	EXTERNAL_RELAY_AUTHENTICATED(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D872310333857



On 10/8/26 04:26, David Yang wrote:
> owl_emac_probe() calls owl_emac_phy_init(), which connects the PHY,
> before netdev->netdev_ops is assigned. phy_attach_direct() ->
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
>  drivers/net/ethernet/actions/owl-emac.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/actions/owl-emac.c b/drivers/net/ethernet/actions/owl-emac.c
> index 0a08da799255..2538275a1e57 100644
> --- a/drivers/net/ethernet/actions/owl-emac.c
> +++ b/drivers/net/ethernet/actions/owl-emac.c
> @@ -1552,6 +1552,8 @@ static int owl_emac_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	netdev->netdev_ops = &owl_emac_netdev_ops;
> +
>  	ret = owl_emac_phy_init(netdev);
>  	if (ret) {
>  		dev_err(dev, "failed to initialize PHY\n");
> @@ -1563,7 +1565,6 @@ static int owl_emac_probe(struct platform_device *pdev)
>  	netdev->min_mtu = OWL_EMAC_MTU_MIN;
>  	netdev->max_mtu = OWL_EMAC_MTU_MAX;
>  	netdev->watchdog_timeo = OWL_EMAC_TX_TIMEOUT;
> -	netdev->netdev_ops = &owl_emac_netdev_ops;
>  	netdev->ethtool_ops = &owl_emac_ethtool_ops;
>  	netif_napi_add(netdev, &priv->napi, owl_emac_poll);
>  


