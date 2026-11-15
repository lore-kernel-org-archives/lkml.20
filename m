Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794727838;
	b=ZdBEsGN3eZwFonDhDKy+FeY5KLmK+5mdHgD6SsQ9ot/Gka6YgxmhsYQKcEdKrHTTCeNa
	 KN1QfcuPU9jGl3L4nogZ908WBftqNz00exwaGcOReykuBxzRorc6RPlRq2S57h5PsscOe
	 8cGjV3xeQToh+uRSMg19hVR3BTzKdL9amvrrEHOvY/ZUJae+2Txy8LTSntjuRXOXUBAKG
	 lodw30hRKskFrSbSuvIfIJ1NL+YoOonYAxGAN4NY0HxostpOBAi8qmasnOgoP00euXK5C
	 QwANE603Oc/KbCtn1s3udUIu1H+s67//sy5cUQ9ho8kn28GOsezn2SeN2i1ft1N3mVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794727838;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=wnuFYzbhBXekzIWEaL42aGNHtd+IajpxPPBS5oHSFLw=;
	b=dzJ0im8/tsTcx/JzqRAmMLtcZKisw9+U86nzOpi0LisGR9Az3PdcpFzGgMKVnI44RsHP
	 pJtmPh3J7e3ryfdCteqTkRadm3tzqf5zxgjNVpKB/kLKbB4vjQzGdH+/Ff+e13bn3chCX
	 QGA+OS21u/9F2CIPabg6kNGtwcuZYjGWdmrp8zCcULWyrkHfMYZoXHOBizqjx0ImLq9Ew
	 5wyAhPqPyuda3zAvfWUBlWLey6RkhqDfw5mr1BAuQzwtnBbnDB1vh2B4sfZOyjvZTclYx
	 yZSmiwCrIuCe5iAAVz33mk1hXiMFC05iXed80aVbMgbUCZK7vXI8Tw7l/R+RjiwO6Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ZN2/yiOV";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEDA606A31A;
	Sun, 15 Nov 2026 07:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZN2/yiOV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E8481F000C4;
	Sun, 15 Nov 2026 07:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794727838;
	bh=wnuFYzbhBXekzIWEaL42aGNHtd+IajpxPPBS5oHSFLw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ZN2/yiOVFnaePFSzA+kAesklGPjKiJlJU8Mu1knrXurzxEGSlLb4XITD4+SaXCLSw
	 bAcXL1kn6TfB+rSp9dE+zvAImUe8bmjFO7bv7S6JIbIl9T8N5cmLEA1p6Oe4wGtorV
	 cz4vYgSvT8JsJQ2VAgf4UdleM9kmk55gRMc91q3uWKrb0GKJCLbB7Y/r1a9CLUXs4Z
	 +XST2wNTUaeqLthEnwAJ7JDNCp/F9YsrkGxghdmK1fhI4VJH2EBlXaG4YvttB0QSXs
	 M0mfmpzqpuxykHPlK76PC2ZrP4GEiH8NsKaFDfEqyzK/nbRWGGwJUC6Y5TcWkCAv1w
	 dTurQY6RyJkHw==
Subject: Re: [PATCH net v5] net: ethernet: adi: adin1110: mask the RX IRQ of
 the port being stopped
From: netdev-bot+sashiko@kernel.org
To: wuyuehong@cmss.chinamobile.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, kees@kernel.org,
 nuno.sa@analog.com, hkallweit1@gmail.com, nichen@iscas.ac.cn,
 alexandru.tachici@analog.com, lennart@lfdomain.com,
 linux-kernel@vger.kernel.org
Date: Sun, 15 Nov 2026 07:30:37 +0000
Message-ID: <179472783713.2199510.12438659767919750066@kernel.org>
In-Reply-To: <20261111-adin1110-net-stop-v5-1-yuehongwu@cmss.chinamobile.com>
References: <20261111-adin1110-net-stop-v5-1-yuehongwu@cmss.chinamobile.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] When adin1110_net_open() fails after it has written IMASK1,
  the port's own RX-ready interrupt stays enabled even though the port…

--

net: ethernet: adi: adin1110: mask the RX IRQ of the port being stopped

This patch changes adin1110_net_stop() so that it masks the RX-ready
interrupt bit of the port being stopped instead of the peer's bit. It
also changes adin1110_net_open() so that, on ADIN2111, the peer's
RX-ready bit is unmasked in IMASK1 only when the peer is running.

> diff --git a/drivers/net/ethernet/adi/adin1110.c b/drivers/net/ethernet/adi/adin1110.c
> index 53fac3dc8be62..c41fad7835d07 100644
> --- a/drivers/net/ethernet/adi/adin1110.c
> +++ b/drivers/net/ethernet/adi/adin1110.c

[ ... ]

> @@ -895,12 +896,24 @@ static int adin1110_net_open(struct net_device *net_dev)
>  	if (ret < 0)
>  		goto out;
>  
> -	val = ADIN1110_TX_RDY_IRQ | ADIN1110_RX_RDY_IRQ | ADIN1110_SPI_ERR_IRQ;
> -	if (priv->cfg->id == ADIN2111_MAC)
> -		val |= ADIN2111_RX_RDY_IRQ;
> +	common = ADIN1110_TX_RDY_IRQ | ADIN1110_SPI_ERR_IRQ;
> +	own = !port_priv->nr ? ADIN1110_RX_RDY_IRQ : ADIN2111_RX_RDY_IRQ;
> +	peer = !port_priv->nr ? ADIN2111_RX_RDY_IRQ : ADIN1110_RX_RDY_IRQ;
>  
> -	priv->irq_mask = val;
> -	ret = adin1110_write_reg(priv, ADIN1110_IMASK1, ~val);
> +	/*
> +	 * The write below is absolute, so only keep the peer port's
> +	 * RX-ready IRQ enabled while that port is running; a stopped peer
> +	 * must stay masked until it is opened again.
> +	 */
> +	irq_mask = common | own;
> +	priv->irq_mask = common | ADIN1110_RX_RDY_IRQ;
> +	if (priv->cfg->id == ADIN2111_MAC) {
> +		priv->irq_mask |= ADIN2111_RX_RDY_IRQ;
> +		if (netif_running(priv->ports[!port_priv->nr]->netdev))
> +			irq_mask |= peer;
> +	}
> +
> +	ret = adin1110_write_reg(priv, ADIN1110_IMASK1, ~irq_mask);
>  	if (ret < 0) {
>  		netdev_err(net_dev, "Failed to enable chip IRQs: %d\n", ret);
>  		goto out;

[Severity: Medium]
The commit message says "A port's RX-ready IRQ is now enabled only while
that port is open". Is that still true if adin1110_net_open() fails after
this IMASK1 write?

This write unmasks the port's own RX-ready bit. Three later steps in
adin1110_net_open() can still fail, and each one jumps to out without
masking that bit again:

	ret = adin1110_read_reg(priv, ADIN1110_TX_SPACE, &val);
	if (ret < 0) {
		...
		goto out;
	}
	...
	ret = adin1110_set_mac_address(net_dev, net_dev->dev_addr);
	if (ret < 0) {
		...
		goto out;
	}

	ret = adin1110_set_bits(priv, ADIN1110_CONFIG1, ADIN1110_CONFIG1_SYNC,
				ADIN1110_CONFIG1_SYNC);

out:
	mutex_unlock(&priv->lock);

	if (ret < 0)
		return ret;

When ndo_open fails, __dev_open() only clears __LINK_STATE_START. It does
not call ndo_stop, so adin1110_net_stop() never masks the bit either.

The port then ends up in the state the commit message describes as the
bug. Its RX-ready interrupt is unmasked, but the handler skips the port
because netif_oper_up() is false:

adin1110_irq()
    adin1110_port_rx_ready()
        if (!netif_oper_up(port_priv->netdev))
            return false;

Any frames left in that port's FIFO keep the level-triggered interrupt
asserted, so the threaded handler keeps running and drains nothing.

On ADIN1110 this lasts until the next successful open. On ADIN2111 it
lasts until the peer port is opened. The peer's open sees netif_running()
as false for this port and masks the bit again.

Could the open error path mask the own RX-ready bit in IMASK1 again while
priv->lock is still held?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111-adin1110-net-stop-v5-1-yuehongwu%40cmss.chinamobile.com
