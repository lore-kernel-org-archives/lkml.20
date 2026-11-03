Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793732448;
	b=n1kg9hi/kHe0U6cIuN9Y2tq8o/hVkLz3vfcXG8OYI9HR13BDjenpODin0AYyWlnF1eO3
	 H75HeaZTwX2F1xGDUDlflU78dIYoXygxcr7/visNACtzopgjogtSD9krFC1+GkBy/iBsA
	 AqTNeA3WVXNKUvaFy/Ppx3AKc1E87U2/qclsaHfvVLRzGMlAHwwu6HT+WbbGKPO6usQrE
	 UzwWe7Xq5rrZEAwjIivt1cci9brln/OvGM41xyo6RDnk/5TxaBibJxhhUpwnrn82BsFLY
	 C4nqiVDMjboHJ2Y05lq91cuSV7HeEnhYQGaWurqpHNTsIVjmKcsGitslMQjLS3kXX7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793732448;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=2oC3q4owt6QQjFjaIbeG0PucmyuouGz/Xr9PAnQ9+oA=;
	b=XoiainHx1aldJSNONp5GEMyfha6G9gH6iaiASZLhhdE8r3hhA9GkFbNPJlquujviPCg8
	 5vRuUeTaDAx4pLdt6vVrjaEmwqVSANhcOdAvA5XoxWkruTLbZqr1ZPvYmrPw7mNOjHpY3
	 Sef5gvgMIVf6u4VE2Y6cLSFue/b2+l6NC7AZ7loo3nsXS+L6zqh+tC9bTKw/NPPLXp0vw
	 PddtVYdSZla13EOMMGDk1LUJw68vtXG3BKZ30ko50Oa2GXXbljB9KrOBgSykKL16xshiJ
	 e6MQ8TIk/I16Pzu0wFXB+ZRrE/BXEY1Oh4AAViD2bL0PXSXvPwR3WuP32AnO5isepHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=uCYMZqn4;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68BB2606A331
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:00:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68BB2606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=uCYMZqn4
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D19151A143C;
	Tue,  3 Nov 2026 19:00:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 862E76046C;
	Tue,  3 Nov 2026 19:00:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2C052103290E8;
	Tue,  3 Nov 2026 20:00:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793732423; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=2oC3q4owt6QQjFjaIbeG0PucmyuouGz/Xr9PAnQ9+oA=;
	b=uCYMZqn4AL6vjtDHaUoftHDKcth+idJJPZlsDoExnI3doZT4swPYKAybPtEGvhLth1J2QP
	X50mDvaTNWnKxaeqDNqHmV4/7WDpFdoHRMR4Va9rRqG4Zu2hmqz9YU1UFt+JCQIEHcVSmE
	dI9cOv6W0A9+9DdL52/1vjiyu47nRnqK0LFWFAx0eJuKK6N6h9Zpdip2bZEsxKy9O7Sr4O
	AL8V2YtpcTpU1DFY9KesTvyMXrNDqCsw/h2j6tJbasdvOh3n/mB57+XoTCWSPOBJTydSB4
	vPYjWCnEZGE5ZtE8WMfkhZa0zVmZ5juOt/jLiIYU8JmBEgXK8iqqLdn5hFbX3A==
Message-ID: <3ea92b81-1d08-4021-bd51-c96534e25b20@bootlin.com>
Date: Tue, 3 Nov 2026 20:00:20 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 2/5] net: mvneta: fix the removal of the mqprio
 offload
To: Josef Schlehofer <pepe.schlehofer@gmail.com>, netdev@vger.kernel.org
Cc: marcin.s.wojtas@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, w@1wt.eu,
 linux-kernel@vger.kernel.org
References: <20261103125021.70845-1-pepe.schlehofer@gmail.com>
 <20261103125021.70845-3-pepe.schlehofer@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261103125021.70845-3-pepe.schlehofer@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On 11/3/26 13:50, Josef Schlehofer wrote:
> Deleting an offloaded mqprio qdisc leaves its traffic classes and
> per-queue rate limits in place.
> 
> mqprio_disable_offload() passes an all-zero configuration, so qopt.hw
> is 0 and mvneta_setup_mqprio() returns before it reaches the teardown
> code.
> 
> Check qopt.hw only when traffic classes are set up.
> 
> A replacement qdisc is set up before the old one is torn down.
> Replacing an offloaded mqprio qdisc with another mqprio under a new
> handle therefore loses the new configuration, as with software mqprio.
> 
> Tested on a Turris Omnia (Armada 385) with 10 Mbit/s limits on a
> 100 Mbit/s link. After the qdisc was deleted, only TX queues 0-3 were
> used and the link carried 19 Mbit/s. With this patch and the previous
> one, the queues above 3 are used again and the link reaches 94 Mbit/s.
> 
> Fixes: e7ca75fe6662 ("net: mvneta: Don't force-set the offloading flag")
> Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  drivers/net/ethernet/marvell/mvneta.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
> index 9b9efac2846e..79711a117c39 100644
> --- a/drivers/net/ethernet/marvell/mvneta.c
> +++ b/drivers/net/ethernet/marvell/mvneta.c
> @@ -5251,11 +5251,12 @@ static int mvneta_setup_mqprio(struct net_device *dev,
>  	int rxq, txq, tc, ret;
>  	u8 num_tc;
>  
> -	if (mqprio->qopt.hw != TC_MQPRIO_HW_OFFLOAD_TCS)
> -		return 0;
> -
>  	num_tc = mqprio->qopt.num_tc;
>  
> +	/* On removal the qdisc passes an all-zero qopt, with hw 0 */
> +	if (num_tc && mqprio->qopt.hw != TC_MQPRIO_HW_OFFLOAD_TCS)
> +		return 0;
> +
>  	if (num_tc > rxq_number)
>  		return -EINVAL;
>  

