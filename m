Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9345452BE53
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914187; cv=none; b=o7kxEzvzDGTJhPL2kColj4MdNLa+fWdLw3F+Fnr4VOWmdB48rXEBm1+UnFvBfA1adP8K+fIn7DWCRbziw3qJr6Q6ltxsE1adPdbFb/GliHb1m7/OOTXQcbxEbEEWdkzWSt8NaHTeKEQpiguzZdvWpte7wtI2l1IVHOe9l1b3mfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914187; c=relaxed/simple;
	bh=NdOpGIfcO6f9x2Onv/2ilP7fx0BKyAVlr0BgP/3Go9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jZzEokY6l3SLEvAH1vsBCZpRn1bKBixetrqwu/0mJMpEGY4+I00j5Z4Caaa+HJBmEVJRaO0Vy2MnIm62NHFMiBpejta7u97kyAYhgZ9TUz/z6sW4bGaYL6sCIilJa5onPIAnCHZ6cncBlrU0hCP0qZUdNnCRobWAaB23HCKnFg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Yb3QhLol; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Yb3QhLol"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4CCB81A1216
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:56:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 18F7260362
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:56:24 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
	id 9211811D718B2; Tue, 13 Oct 2026 19:51:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791914183; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=N3X5m/uq3xY0OHiTRTDsP7cgVbTV1pkmV++GlfPpXRI=;
	b=Yb3QhLolfueISGSlsSoYVYE3h7vmoX8/9N8xJ8Djaa2k11p1auqTflyTZbnDsU9ZOPGGtn
	MhNz2OVfby5pTYrVSY8XXJNq46sPum2qiZOcxu8Pw4TBx2wPegvPXJgMIWHxMn8n053KAz
	2+2wEL2hTgKSpoqsYFZAWzvf11uLoOVocv6OLxkbVOjGMb1jUBq10SdDonUBhBGm3ac/Sq
	x+LtAO7th4XrKZsn/ynG5OuA37/2GILXmhZOUJ2YRkgkx/R8pCHuvDMZIphL1wXEuEUOis
	ed3lseeqL5v2zO6ptb0hahBOpHJdzk5/dCVsfL+DZow5bic6F4H10UVAZpdYbw==
Authentication-Results: mail.galae.net;
	none
Message-ID: <cb745ce9-c100-4c16-b9b1-670379d0bdef@bootlin.com>
Date: Thu, 8 Oct 2026 10:30:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 04/10] net: ethernet: adi: Move setting of netops to
 fix crash
To: David Yang <mmyangfl@gmail.com>, netdev@vger.kernel.org
Cc: Ciprian Regus <ciprian.regus@analog.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Stanislav Fomichev <sdf@fomichev.me>, Nicolai Buchwitz <nb@tipi-net.de>,
 linux-kernel@vger.kernel.org
References: <20261008022656.3592191-1-mmyangfl@gmail.com>
 <20261008022656.3592191-5-mmyangfl@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261008022656.3592191-5-mmyangfl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 9211811D718B2
X-Spamd-Result: default: False [2.40 / 30.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[129];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_ZERO(0.00)[0];
	TAGGED_RCPT(0.00)[netdev];
	BCC(0.00)[];
	DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
	URIBL_BLOCKED(0.00)[tipi-net.de:email,fomichev.me:email,lunn.ch:email,bootlin.com:email,bootlin.com:mid,bootlin.com:url,galae.net:url,davemloft.net:email,analog.com:email,localhost:rdns,localhost:helo];
	TO_DN_SOME(0.00)[]



On 10/8/26 04:26, David Yang wrote:
> adin1140_probe() calls adin1140_phy_init(), which connects the PHY,
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
>  drivers/net/ethernet/adi/adin1140.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/adi/adin1140.c b/drivers/net/ethernet/adi/adin1140.c
> index 93710baca151..ca96a919c24b 100644
> --- a/drivers/net/ethernet/adi/adin1140.c
> +++ b/drivers/net/ethernet/adi/adin1140.c
> @@ -733,6 +733,8 @@ static int adin1140_probe(struct spi_device *spi)
>  	if (ret)
>  		return ret;
>  
> +	netdev->netdev_ops = &adin1140_netdev_ops;
> +
>  	ret = adin1140_phy_init(priv, spi);
>  	if (ret)
>  		return ret;
> @@ -748,7 +750,6 @@ static int adin1140_probe(struct spi_device *spi)
>  
>  	netdev->if_port = IF_PORT_10BASET;
>  	netdev->irq = spi->irq;
> -	netdev->netdev_ops = &adin1140_netdev_ops;
>  	netdev->ethtool_ops = &adin1140_ethtool_ops;
>  	netdev->netns_immutable = true;
>  	netdev->priv_flags |= IFF_LIVE_ADDR_CHANGE |

text:
Return-Path: <netdev+bounces-342828-maxime.chevallier=bootlin.com@vger.kernel.org>
Delivered-To: maxime.chevallier@bootlin.com
Received: from mail.galae.net ([172.22.1.253])
	by 9e7fea892943 with LMTP
	id kIv3N/lUx2oM9xgAtaWaaQ
	(envelope-from <netdev+bounces-342828-maxime.chevallier=bootlin.com@vger.kernel.org>)
	for <maxime.chevallier@bootlin.com>; Thu, 08 Oct 2026 10:31:53 +0200
X-Original-To: maxime.chevallier@bootlin.com
Received: from smtpin-01.galae.net (smtpin-01.galae.net [51.159.2.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.galae.net (Postcow) with ESMTPS id 25C4110333853
	for <maxime.chevallier@bootlin.com>; Thu,  8 Oct 2026 10:31:53 +0200 (CEST)
Authentication-Results: mail.galae.net;
	dkim=pass header.d=bootlin.com header.s=dkim header.b="STo/Jjwc";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1");
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.galae.net: domain of "netdev+bounces-342828-maxime.chevallier=bootlin.com@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="netdev+bounces-342828-maxime.chevallier=bootlin.com@vger.kernel.org"
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com;
	s=dkim; t=1791448313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:
	 list-unsubscribe:list-subscribe:dkim-signature;
	bh=C8HerE4JC8nfRjub4rsf8mucx/GS3daCCcx3JUHV+As=;
	b=Drktp9RVVuqf4s/U/FLLpWuviT7neJGvMUwST7dRUAr0zRs0NZGYpOAGdKDcIuOXtLlC8Z
	W5ep16KPyoFBQ70TRfkV4ddG91t3ghiLvz3WtW/jNFXXWQ5oVM3HmVkZN/gAvw4OSKzZnR
	KN6cuUap1Mc/x5gGx2Rg4xyPI2UXFXy0cCs7iQzX+CuIeLZYYzlAb+liwT2mZvoWufg8iD
	ooBTxbc2X7X2FPcgtj4swD06tzVP8x/5zX32gakGRjvaXC7KytMs+xkUFBIfMKAicdd/kW
	x3CkfS7Cq+N9gvRHGacMpELVjWcuQUzzR/5d5Z+IlJwSeCM/0pBZPxuN1xKPgA==
ARC-Authentication-Results: i=2;
	mail.galae.net;
	dkim=pass header.d=bootlin.com header.s=dkim header.b="STo/Jjwc";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1");
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.galae.net: domain of "netdev+bounces-342828-maxime.chevallier=bootlin.com@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="netdev+bounces-342828-maxime.chevallier=bootlin.com@vger.kernel.org"
ARC-Seal: i=2; s=dkim; d=bootlin.com; t=1791448313; a=rsa-sha256; cv=pass;
	b=rejfXZpv5p3I+zCIlsWsSpBY5diQJ7QHdEg4bHUQcot22JZYq7SprsxbvVySrHyk7c4i2u
	Ki0p3Eq/ALJZ79lv624zE/Qk1lOlkgIOyFEOEVmtveR4IVPWkLAlM+3VlsdyxRlnv2JNSs
	qZVVJM2YiqQfJoBb24/w3ElNGUKAwzaZMmhhV0tekr8Ht16+wWZsomDcl0L3+N3IqZ5PH9
	s3DjAlT8h+WJ2+liRpeJU96mTkKN5Ru/Jd8Enys2j6dr8Svh02U8bXMLTbY/G6NBul+0Vm
	3kDbpB5V045Lgg+EYoi0un86GwFiIFwfzfI40Hmzyncr31XLY//1B9kKCOkTGg==
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by smtpin-01.galae.net (Postfix) with ESMTPS id 9B6BE342DC1
	for <maxime.chevallier@bootlin.com>; Thu,  8 Oct 2026 08:31:52 +0000 (UTC)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7224A30215
	for <maxime.chevallier@bootlin.com>; Thu,  8 Oct 2026 08:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4452646EC76;
	Thu,  8 Oct 2026 08:31:03 +0000 (UTC)
X-Original-To: netdev@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AA346D567
	for <netdev@vger.kernel.org>; Thu,  8 Oct 2026 08:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791448262; cv=none; b=KtR2J9J/9Z5qoNq71RB1xLgxSC58xjYjHqEp1XkgdY2lEEWytcUsfr4K9FaD07PBlKDtY8KSEgjszEz0OO2UjbbjskXsg2Rj44AqAmyEH1b5UC2ULcs1YxvopV7GEQV1muvoV346eA/a8LYECT/wCi4TNf/RXrHW2t0TBRJqWOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791448262; c=relaxed/simple;
	bh=VQRhDymlHxO4P15VM7Zlak+T81ZfGzO7SacCihV8224=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lehfxLeQxBG11s4+UjyKhGvlBoeKywy5EM1s2g5zyYyiMYny0WUVP+4B2WPK1Kd2cgfkQRWd+1+bL8XWTsbnmuXHXQW03HEG1Fya6U6LvFiaC2im0OMLoylv7J/9M4ajERpLskLxj5ES20nfzf19jxKXuRf5EkGQ8LskPhw1sxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=STo/Jjwc; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8A96D1A1185;
	Thu,  8 Oct 2026 08:30:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5D81660341;
	Thu,  8 Oct 2026 08:30:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E66AE10333850;
	Thu,  8 Oct 2026 10:30:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791448258; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=C8HerE4JC8nfRjub4rsf8mucx/GS3daCCcx3JUHV+As=;
	b=STo/Jjwc2OQdmXHw0M5scCfqG7Joy1lnnPSPQBCWUq9fcq9K32y3153GIAZ+KR5MhYiKiR
	m+Civc4hdj51qVGXPJvk7Cqr2COY2FyApwqzVYvthAdAs29cFe7ae8nsoHBWN0bxnSzEKQ
	cZrbqbzEWLIqyCyDyJ1GHLtPwwlvMeSsMNFnb3nQ2M2cEIq1+f9+1x4XfaZAop7T7AvgiT
	eM6lT6RQCFLab/C8bN2HEwZSJLGXs8D33iWL2mXvXZN3adLsvZo4+lmaVGZLTQIYu9m+00
	IZ6tOQXxgaVTyThXjTAeTJKS9ac9zFCT6zwRy12Ll+EdgVc4WqVeRf830N8V/A==
Message-ID: <cb745ce9-c100-4c16-b9b1-670379d0bdef@bootlin.com>
Date: Thu, 8 Oct 2026 10:30:54 +0200
Precedence: bulk
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 04/10] net: ethernet: adi: Move setting of netops to
 fix crash
To: David Yang <mmyangfl@gmail.com>, netdev@vger.kernel.org
Cc: Ciprian Regus <ciprian.regus@analog.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Stanislav Fomichev <sdf@fomichev.me>, Nicolai Buchwitz <nb@tipi-net.de>,
 linux-kernel@vger.kernel.org
References: <20261008022656.3592191-1-mmyangfl@gmail.com>
 <20261008022656.3592191-5-mmyangfl@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261008022656.3592191-5-mmyangfl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-2.25 / 30.00];
	SUSPICIOUS_RECIPS(1.50)[];
	IP_REPUTATION_HAM(-1.41)[asn: 63949(-0.40), country: SG(-0.01), ip: 172.234.253.10(-1.00)];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	BAYES_HAM(-0.17)[64.78%];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_BLOCKED(0.00)[bootlin.com:mid,bootlin.com:email,bootlin.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_FROM(0.00)[bounces-342828-maxime.chevallier=bootlin.com];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	BCC(0.00)[];
	MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RCPT_MAILCOW_DOMAIN(0.00)[bootlin.com];
	RBL_SENDERSCORE_REPUT_BLOCKED(0.00)[172.234.253.10:from];
	DKIM_TRACE(0.00)[bootlin.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DNSWL_BLOCKED(0.00)[100.90.174.1:received,172.234.253.10:from,212.83.139.233:received,185.246.84.56:received,212.83.136.155:received];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maxime.chevallier@bootlin.com,netdev@vger.kernel.org];
	ARC_SIGNED(0.00)[bootlin.com:s=dkim:i=2];
	MID_RHS_MATCH_FROM(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[bootlin.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	EXTERNAL_RELAY_AUTHENTICATED(0.00)[];
	TAGGED_RCPT(0.00)[netdev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 25C4110333853



On 10/8/26 04:26, David Yang wrote:
> adin1140_probe() calls adin1140_phy_init(), which connects the PHY,
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
>  drivers/net/ethernet/adi/adin1140.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/adi/adin1140.c b/drivers/net/ethernet/adi/adin1140.c
> index 93710baca151..ca96a919c24b 100644
> --- a/drivers/net/ethernet/adi/adin1140.c
> +++ b/drivers/net/ethernet/adi/adin1140.c
> @@ -733,6 +733,8 @@ static int adin1140_probe(struct spi_device *spi)
>  	if (ret)
>  		return ret;
>  
> +	netdev->netdev_ops = &adin1140_netdev_ops;
> +
>  	ret = adin1140_phy_init(priv, spi);
>  	if (ret)
>  		return ret;
> @@ -748,7 +750,6 @@ static int adin1140_probe(struct spi_device *spi)
>  
>  	netdev->if_port = IF_PORT_10BASET;
>  	netdev->irq = spi->irq;
> -	netdev->netdev_ops = &adin1140_netdev_ops;
>  	netdev->ethtool_ops = &adin1140_ethtool_ops;
>  	netdev->netns_immutable = true;
>  	netdev->priv_flags |= IFF_LIVE_ADDR_CHANGE |


