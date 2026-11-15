Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794747712;
	b=Y3mj6J83agkSxMpctBTlY24Chys0PlB7GsIdiqYG9uahOLCHtetS6vEkXlW7bhCyR3/w
	 D/Wg8polJ2izFHCKHVsWFy3ue27k6mOytJqzyXFb7hZNjCzywCzm3RR28gGQKtBcfAF7n
	 zfwZt2HOqH2OCPzEZh4Co7BupSofLrSA0UFzgechez/OitijC0BZGqoegHfEmzqQX/gr+
	 Bb1Lecf52H1zZ3U1dJXPNHG/isehQT5zS0Qf7Zcw+14xWdw7adVOeatxkuw+zoVyzqSBx
	 glotwlxNr8HqVEyG4whcsBf2dOGIMK6iQlu5wB/MipogHYtSd3ICKgR5YQdYcyORlRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794747712;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=gkucXmxRsiWMinqiKC7kSNxuxKvG2TjMO2LavFDIAQQ=;
	b=rvXNOA+U8ZvoTyaI/in5RedDADkiGQvQIU/6mvfq1ga50Y1YbfzYrOLU/yl2a0iCcg3D
	 fPJ6k3JgG7J6sJlkSCymb48kEHwC/AFIPg4k6WvPXzl2LXvZ/cU7a+rFTrJ2nMJyXooHR
	 MqyYAd+1vsun0/y1JVMol2L0xUBd1qvvYyOJEjq0psm1TFiYFfZzs5u0/gVgZmGVewI7n
	 ZBMs5POfS1CSdFpCooFyc10ax+jJTHyjBuSHKrMhFkY7PFm0R2ueCNaOby7uZXTH7QHTU
	 M9/lD7Ouca+JVGk5SdWKby5n+5h0qey/HVMEF89lW0LRIVgi/fbtd2jVkCwNQAyk5lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UvRf9VNZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F29C606A31A;
	Sun, 15 Nov 2026 13:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UvRf9VNZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A8551F000C4;
	Sun, 15 Nov 2026 13:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794747712;
	bh=gkucXmxRsiWMinqiKC7kSNxuxKvG2TjMO2LavFDIAQQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=UvRf9VNZG4Rh2hZUubqGZyPHK712q0hlS04qrxqK/ouc+kjGXuNpgRe0d/gf+N4pr
	 WbmvzyFb267QKUZk0O1/xsBEbXDzKv7iQXT4UQHoSSg+vZf1dN8BXth0zX1Xq4Ekmf
	 mPLpkolrkjAEh2GQ3W3suLzQYdstcUhNclXq/jiFxXaM/+DbbVexLbFu43n/fHrAc2
	 rf150opQ+15o8wjJs3idFxInYtfXo4VRoyk+pwU9Zf+hio6kZkLFstxMK1VkenRF7r
	 siELBMkgGG6ZKAX4Hr7vDRGleel/WvE01GlXTkiR5OMyiQd6Jn9dnBfJcy9bjX5usb
	 lz9kCeRo+vwLA==
Subject: Re: [PATCH net-next v7 5/9] net: bcmgenet: derive the receive buffer
 length from the MTU
From: netdev-bot+sashiko@kernel.org
To: nb@tipi-net.de
Cc: opendmb@gmail.com, florian.fainelli@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 f.fainelli@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 pierremarinleclercq88@gmail.com, dave.stevenson@raspberrypi.com,
 justin.chen@broadcom.com
Date: Sun, 15 Nov 2026 13:01:50 +0000
Message-ID: <179474771091.2199510.12424783948813016163@kernel.org>
In-Reply-To: <20261112-nb-genet-mtu-nn-v2-v7-5-43a5d90b3256@tipi-net.de>
References: <20261112-nb-genet-mtu-nn-v2-v7-5-43a5d90b3256@tipi-net.de>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] In bcmgenet_init_tx_ring()
  (drivers/net/ethernet/broadcom/genet/bcmgenet.c), the buffer-size…

--

net: bcmgenet: derive the receive buffer length from the MTU

This patch replaces the fixed 2048 byte receive buffer length with a value
taken from the MTU. The RBUF packet ready threshold is computed from the
MTU and programmed into RBUF, and the buffer length is that threshold
plus the status block. UMAC_MAX_FRAME_LEN and the TX flow period are
also derived from the MTU, with a floor at ETH_DATA_LEN.

> diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.c b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
> index b0b0d9b423482..1bb5fed4a8b4d 100644
> --- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
> +++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c

[ ... ]

> +/* A buffer has to hold everything the threshold lets the hardware deliver */
> +static unsigned int bcmgenet_rx_buf_len(unsigned int mtu)
> +{
> +	return sizeof(struct status_64) +
> +	       bcmgenet_pkt_rdy_thld(mtu) * ENET_THLD_UNIT;
> +}

[ ... ]

> @@ -2792,7 +2845,7 @@ static void bcmgenet_init_tx_ring(struct bcmgenet_priv *priv,
>  				  TDMA_FLOW_PERIOD);
>  	bcmgenet_tdma_ring_writel(priv, index,
>  				  ((size << DMA_RING_SIZE_SHIFT) |
> -				   RX_BUF_LENGTH), DMA_RING_BUF_SIZE);
> +				   priv->rx_buf_len), DMA_RING_BUF_SIZE);

[Severity: Low]
Is this change to the TX ring intended?

In bcmgenet_init_tx_ring(), the buffer size field of the TDMA
DMA_RING_BUF_SIZE register now gets priv->rx_buf_len. That value comes
from bcmgenet_rx_buf_len(), which only uses RX quantities: the RX status
block plus the RBUF packet ready threshold.

At the default MTU this is 64 + 0x80 * 16 = 2112, so the TDMA register
value goes from 0x800 to 0x840 on every interface init.

The commit message only talks about the receive side:

  "The MTU is still fixed at ETH_DATA_LEN, so the threshold comes out at
  the reset default and the buffer only grows by the status block the
  hardware already wrote."

It doesn't mention that a TX DMA register changes as well.

The TX ring already used the RX constant RX_BUF_LENGTH before this patch.
What is new here is the changed value, and the fact that the TX
programming now follows the MTU through the RX threshold and its
page-size clamp.

This line is unchanged in the later patches of the series. So once the MTU
can grow, the TDMA field keeps following bcmgenet_rx_buf_len(mtu) and not
any value picked for TX.

No functional effect has been shown. The per-descriptor TX length is in
length_status. The last patch in the series, "net: bcmgenet: reassemble
jumbo frames from status block fragments", reports 16361 byte frames
sent byte-exact over UMAC loopback while this field stays at rx_buf_len
(about 3.9K at most). That suggests the field does not limit TX.

Would it be clearer to keep a TX-specific value here? If the change is
intentional, could the commit message say so?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112-nb-genet-mtu-nn-v2-v7-0-43a5d90b3256%40tipi-net.de
