Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794747713;
	b=Vzy6LrBMxBCBway4H6uUQWRgia8sWGiBDQhAKxXPuMsgo78MNt0p/S3l+8sAQwGemP8c
	 xQuMJquZDkVFd9Mp0RvOEggZNyOrgPjhW0a6UeZypZ7sYy0IApVHUTrXTZTfKzUmpyyZB
	 hBA3ymM20g/KOrosg2QdH1CHpd19HMc4ObhOUT8X1RniArW7RtSrgHzelP1Tdrewrrdtl
	 wPkORsNKTxkCEOuUYSxJlZHEd5BK/w6pCkTBRQDP5lJzV2egqNt7FaHrWbGY5ERW9DfZn
	 AilahQxCP6EIBvJG4U7AG1mH1rZMB91zWtwaO0twg8jF4QARNSUabWesdssHJofZVcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794747713;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=WGtycd7FvLYNJHdPJBG0XxIZ0cTFtLOSjxz3PpUCcpA=;
	b=drtLa7Syo6l8S54mjESqaxE1oyUUWCRoEHtz5TW3XQSkEqfxlZ/x/Bmps4Nn+BP44oqz
	 Hz6fvoKFbYEy7zi0nLvwIOJCDptLFWbu4NoocVOrA9SUUub8cic5QL90qo5hUM+yD01m2
	 AprZW+cWl1P9GI347kWyNz+OUD7Vo2Z6nfSKS7LE98SHm2Ww7ln2OhEQ2Ym9MCHFVMwC5
	 9bULDzzItPhmWQ+QXPxtPwSdpAwcFJGY/4EP+JjO5F0judVpOStKfUNAED11Pl95TaRZF
	 gRFTjYc21xc/vLyTFhp0RWrSLjC6Aion0fHwIkIaFaBtkvssWkRAyOGn/+5QuwprU6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DueG3yTx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8827C606A332;
	Sun, 15 Nov 2026 13:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DueG3yTx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A68651F000C4;
	Sun, 15 Nov 2026 13:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794747713;
	bh=WGtycd7FvLYNJHdPJBG0XxIZ0cTFtLOSjxz3PpUCcpA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=DueG3yTxfG2c3qPVlHe9oRFvKPpo27ar6Jbc/zntk5yr+0+K4BhF6Qz8pDzYqFbXJ
	 sHwID2XsMa0Pqiv8uyiPeAWlHD5j/zd8GTxRbbyjKxdiLQVMnofNPOeOHDHkn7sQ5G
	 /RJfKoIdhhiKe/yYc5eymRU1TqIB3/aQqNjg0PokS5k0t5Jf0/Xu8hGYNQF0wak7Hr
	 j+nPfEBAjvQuY+68YuD4ohuHZeYKdVvGZ6xOwdJLHI7ORt5AsCCVXaEfJ/G2MiFxTc
	 jjsbNHHjrCRktumt1f4VA5QYNb2GTSrVJrXoykWrZbgZM5/SMXFuimhFUZ9z6COUQv
	 FesveXn1HtqLw==
Subject: Re: [PATCH net-next v7 6/9] net: bcmgenet: split frames that end just
 past the transmit threshold
From: netdev-bot+sashiko@kernel.org
To: nb@tipi-net.de
Cc: opendmb@gmail.com, florian.fainelli@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 f.fainelli@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 pierremarinleclercq88@gmail.com, dave.stevenson@raspberrypi.com,
 justin.chen@broadcom.com
Date: Sun, 15 Nov 2026 13:01:52 +0000
Message-ID: <179474771225.2199510.15415138115246393692@kernel.org>
In-Reply-To: <20261112-nb-genet-mtu-nn-v2-v7-6-43a5d90b3256@tipi-net.de>
References: <20261112-nb-genet-mtu-nn-v2-v7-6-43a5d90b3256@tipi-net.de>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] ENET_TX_THLD_WINDOW is fixed at 64 bytes for every platform.
- [Medium] bcmgenet_tx_pkt_rdy_thld() returns ENET_THLD_MAX (0xf0, 3840
  bytes) for every GENET version once the MTU exceeds ETH_DATA_LEN, and…
- [Low] The commit message describes the transmitter stall as a live bug
  that IP fragmentation hits on every datagram, and says the interface…

--

net: bcmgenet: split frames that end just past the transmit threshold

This patch splits a frame across two descriptors that share one DMA
mapping when the frame ends within ENET_TX_THLD_WINDOW bytes past the
transmit packet ready threshold. It programs TBUF_PKT_RDY_THLD from the
MTU and falls back to a software checksum for frames longer than the
threshold. It also reserves one more descriptor in ring->stop_thld.

> A frame that ends a few bytes past the transmit packet ready threshold
> stops the transmitter as soon as a shorter frame follows. Tx DMA then
> refuses to halt, so every later bcmgenet_init_dma() fails and the
> interface cannot be opened again. IP fragmentation generates that pattern
> on every datagram, full frames and a short tail.

[Severity: Low]
Can this happen at this point in the series?

genet does not set dev->max_mtu and has no ndo_change_mtu, so
ether_setup() leaves max_mtu at ETH_DATA_LEN. There is no TSO, so GSO
segments down to the MTU.

That means bcmgenet_tx_pkt_rdy_thld() always returns ENET_THLD_DEFAULT
and priv->tx_thld_len is always 2048. No transmitted frame, which is
about 1518 bytes at most, can satisfy this check in bcmgenet_xmit():

	split = unlikely(skb->len > priv->tx_thld_len &&
			 skb->len < priv->tx_thld_len + ENET_TX_THLD_WINDOW);

So the split path, the skb_checksum_help() fallback and the
ENET_THLD_MAX branch cannot run until "net: bcmgenet: allow the MTU to
be changed". Today the only runtime changes appear to be two:
TBUF_PKT_RDY_THLD gets its reset value written, and stop_thld goes from
MAX_SKB_FRAGS + 1 to MAX_SKB_FRAGS + 2.

Earlier patches in this series state this directly ("The MTU cannot
produce a frame past the threshold yet, so nothing hits this today. It
is preparation for the larger MTU").

Could this message say the same, so that readers and stable backporters
don't take it for a fix for a hang that can happen today?

> diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.c b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
> index 1bb5fed4a8b4d..d70079832dd24 100644
> --- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
> +++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
> @@ -59,6 +59,11 @@
>  #define ENET_THLD_DEFAULT	0x80
>  #define ENET_THLD_MAX		0xf0
>  
> +/* A frame ending this far past the transmit threshold stops the transmitter
> + * once a shorter frame follows. Widest window measured is 46 bytes.
> + */
> +#define ENET_TX_THLD_WINDOW	64

[Severity: Medium]
The commit message says the window "is one DMA transfer wide". The TX
DMA burst size, though, is set per platform in bcmgenet_dma_init():

	bcmgenet_tdma_writel(priv, priv->dma_max_burst_length,
			     DMA_SCB_BURST_SIZE);

bcm2711_plat_data uses .dma_max_burst_length = 0x08. The v2, v3, v4, v5
and bcm7712 platform data use DMA_MAX_BURST_LENGTH (0x10).

Suppose the window grows with the programmed burst. On the 0x10 burst
parts, a frame could end 64 bytes or more past tx_thld_len and still
fall inside one transfer. Would bcmgenet_xmit() then skip the split for
it? That would leave the Tx DMA stall and the bcmgenet_init_dma()
failure in place on those cores.

The measurements in the message come from one v5. Once "net: bcmgenet:
allow the MTU to be changed" raises max_mtu on every non-v1 core, this
case becomes reachable.

Should the window be derived from dma_max_burst_length, or has 64 been
checked on a core with a 0x10 burst?

[ ... ]

> @@ -2689,6 +2761,17 @@ static unsigned int bcmgenet_pkt_rdy_thld(unsigned int mtu)
>  		       ENET_THLD_MAX_LEN / ENET_THLD_UNIT);
>  }
>  
> +/* The transmit threshold in register units. Keep the reset value while the
> + * MTU has no use for more, the hardware never reaches it below ETH_DATA_LEN.
> + */
> +static unsigned int bcmgenet_tx_pkt_rdy_thld(unsigned int mtu)
> +{
> +	if (mtu <= ETH_DATA_LEN)
> +		return ENET_THLD_DEFAULT;
> +
> +	return ENET_THLD_MAX;
> +}
> +
>  /* A buffer has to hold everything the threshold lets the hardware deliver */
>  static unsigned int bcmgenet_rx_buf_len(unsigned int mtu)
>  {
> @@ -2699,8 +2782,10 @@ static unsigned int bcmgenet_rx_buf_len(unsigned int mtu)
>  /* Program the MTU dependent registers. Call with the MAC disabled. */
>  static void bcmgenet_set_mtu_regs(struct bcmgenet_priv *priv, unsigned int mtu)
>  {
> +	u32 tx_thld = bcmgenet_tx_pkt_rdy_thld(mtu);
>  	u32 thld = bcmgenet_pkt_rdy_thld(mtu);
>  
> +	priv->tx_thld_len = tx_thld * ENET_THLD_UNIT;
>  	bcmgenet_umac_writel(priv, ENET_MAC_FRAME_LEN(mtu), UMAC_MAX_FRAME_LEN);
>  
>  	/* GENET v1 maps other registers at these offsets */
> @@ -2708,6 +2793,8 @@ static void bcmgenet_set_mtu_regs(struct bcmgenet_priv *priv, unsigned int mtu)
>  		return;
>  
>  	bcmgenet_rbuf_writel(priv, thld, RBUF_PKT_RDY_THLD);
> +	bcmgenet_writel(tx_thld, priv->base + priv->hw_params->tbuf_offset +
> +			TBUF_PKT_RDY_THLD);
>  }

[Severity: Medium]
Does ENET_THLD_MAX (3840 bytes) fit in the TBUF of every GENET version
that gets it here? bcmgenet_tx_pkt_rdy_thld() returns the same value
for all versions. bcmgenet_set_mtu_regs() then writes it on v2 and
later, with no clamp per version.

init_umac() programs the TBUF size control only on v3 and later:

	if (!GENET_IS_V1(priv) && !GENET_IS_V2(priv))
		bcmgenet_rbuf_writel(priv, 1, RBUF_TBUF_SIZE_CTRL);

So v2 has different TBUF sizing but gets the same threshold. The
measurements in the commit message are from a v5 only.

Suppose a core's TBUF cannot hold 3840 bytes. Could a frame longer than
that TBUF then never reach the threshold and stall the transmitter?

"net: bcmgenet: allow the MTU to be changed" later sets
dev->max_mtu = ENET_MAX_MTU for every non-v1 core. That would make this
setting reachable on v2 through v4.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112-nb-genet-mtu-nn-v2-v7-0-43a5d90b3256%40tipi-net.de
