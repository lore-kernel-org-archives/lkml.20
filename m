Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794921524;
	b=EgYWdJHryl/Wmc7DcSmjTKmzwmqSBilkoTzcija9nCUh8BsADAg9XIgjK6xy+cYsIq/+
	 SXnKaz85EU4jmFAZ3czV626Y6kvnPUXlnOwxSgrd63M6KUlB0HKyJ34pU0Jm0tMFgTx1C
	 /DpNKKO0VwFY+pdqsTt44jEwvwCezKXRZz59iHc6dKhasx3BnqomJsC72A6LxOwjeO26o
	 ns8UMZYfTxB4HjP3ANVrlALRWlu4TCxiez6Gekq/4E27xpgbYhcAXvedfeSS+x71MlNP2
	 58k7c7W73hzVVvlB216IJr/Z2f69CuYYxKPoewJ6TV7kSmUpSayErYFoptawTofEibg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921524;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=Mq6W0SJjV2XsZGqNGRaOoIh0Y0rXmbfMH2IslWU3UVU=;
	b=MQjGS79dopAVfLdOHdkyFOMwmcconqdbQlYIqC9AgPLxSYuz6kRQqPmROWzOwSPbBpnP
	 /b35vmaxs0WFRc13j70n8xa1sW5Ki1Ibn7JtSoOo20hLd+4OQZXdM61muNgXbVlSokIR+
	 eko1HSvyoPsQC4BlopA9EJKLurYMR0xcPCmZia6N7DuwoDcv1oprRLp1eFgwQKWDdt7uA
	 KGaONxyYp3iI88n0iE12YplyVfP3zKX7Tfps2aHKzSBq09fehSElu3L3FgZqGeoKI1Ea5
	 kCxWgv2MtTyov6WjKObeHfG0inMoIvbxNrm0/kYBhGUTPityEe09XtmeD2aFL8OcxeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=CBaZuYf2;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B584606A887;
	Tue, 17 Nov 2026 13:18:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B584606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=CBaZuYf2
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C9770A0021;
	Tue, 17 Nov 2026 14:18:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1794921522; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Mq6W0SJjV2XsZGqNGRaOoIh0Y0rXmbfMH2IslWU3UVU=;
	b=CBaZuYf2Jmkqul+6ohs43/H/0rXKbMHY8vJSrEFi2jXDPn8Qf/pjVEofkZdqUt538IRKRU
	QUFTuPr9B8yDUxvZCRM92n9adYYzTVTIb/eJT3FwTaNDX6u0tFBFpETDIHkD3WvFd3Uown
	8+Ue1IfL/9ILTBHzRu7uFrl51+b+V/ajP9xg01DIuiGmQHPUJB/YSt/to2MdeXM2Hljt/U
	JLUes1EguIeh5nAVCb3HSVfmyt0PZ5NBa7lo12iTkU35SWlTyUStWQX7vgwNw3jUnZY38D
	DIJoXtJnChkRphYQGz3D7Hpv9ZoEMy8nR6PPyyJH6WuEm27xx7Nqh4cZq7tr2w==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Tue, 17 Nov 2026 14:18:40 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: Horatiu Vultur <horatiu.vultur@microchip.com>,
 UNGLinuxDriver@microchip.com, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: lan966x: free the RX pages when the TX
 allocation fails
In-Reply-To: <20261117-lan966x-rx-pages-tx-alloc-fail-v1-1-13f310d66650@microchip.com>
References: <20261117-lan966x-rx-pages-tx-alloc-fail-v1-1-13f310d66650@microchip.com>
Message-ID: <ca8a0d98bb7981610f0b4e33ce92aac0@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 17.11.2026 13:49, Daniel Machon wrote:
> lan966x_fdma_init() allocates the RX ring and fills its DCBs with pages
> from the RX page pool, then allocates the TX ring. If the TX allocation
> fails, the error path frees the RX ring and destroys the page pool, but
> does not return the pages to the pool first.
> 
> The pool then never finishes its shutdown, and 
> page_pool_release_retry()
> keeps warning about the pages still in flight.
> 
> To let the pool shut down, return the RX pages before destroying it, as
> lan966x_fdma_deinit() does. lan966x_fdma_rx_alloc() does not check that
> every DCB got its pages, so skip the entries that are still empty.
> 
> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
> ---
>  drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c 
> b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
> index 1fbe910c5ec38..586ee648c7741 100644
> --- a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
> +++ b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
> @@ -54,9 +54,11 @@ static void lan966x_fdma_rx_free_pages(struct 
> lan966x_rx *rx)
>  	int i, j;
> 
>  	for (i = 0; i < fdma->n_dcbs; ++i) {
> -		for (j = 0; j < fdma->n_dbs; ++j)
> -			page_pool_put_full_page(rx->page_pool,
> -						rx->page[i][j], false);
> +		for (j = 0; j < fdma->n_dbs; ++j) {
> +			if (rx->page[i][j])
> +				page_pool_put_full_page(rx->page_pool,
> +							rx->page[i][j], false);
> +		}
>  	}
>  }
> 
> @@ -999,6 +1001,7 @@ int lan966x_fdma_init(struct lan966x *lan966x)
> 
>  	err = lan966x_fdma_tx_alloc(&lan966x->tx);
>  	if (err) {
> +		lan966x_fdma_rx_free_pages(&lan966x->rx);
>  		fdma_free_coherent(lan966x->dma_dev, &lan966x->rx.fdma);
>  		page_pool_destroy(lan966x->rx.page_pool);
>  		return err;
> 
> ---
> base-commit: 994089a3fa3882f27f4bed9fc5815ee7df502e88
> change-id: 20261116-lan966x-rx-pages-tx-alloc-fail-2b8e412f15f2
> 
> Best regards,

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

Regards
Nicolai
