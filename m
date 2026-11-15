Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776661;
	b=2OF/EyiyTycTXUd/0t+QwQLMFI9xxafjBboQ+45Llfj0mPultQgJ/1FPboV3eIWyfRLr
	 lt7AoZUOcYJagr0S46qdgYRVRc6LxkmW2DhVSQ4RatTTS2lQhBc+eEnxr95E/XX/nXclS
	 nww/6PHCaAv2VRal/XLYBNYnVUC8iapT+vykKmfRRc+rsXETnitooHYXfMH8IU3PFRMa+
	 gWhOARjOECAlcCney5hQS2eNztHD4RzC44zF7R2oHRwEW3+5dpb/07n88z21DUWUosu0u
	 pRSdWStAFYsMo9jkRqdfjz14ROfXN6eVVGP6GmbRZyS2YOviVS6P38h339cmbOyBIBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776661;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=PibRXBXiLpEoEbrOvo9EmvvXD/tNRe86o7ZaehpKWYs=;
	b=2yOZ71hCEXVkQp3dDiVgqh/Uyy4KHtdrA4yPvRsG8z0J3bR1ze8vRsmfWa2MZK+J3WTl
	 elhEodNDQCt8lVyh3rpHxCkGSP5ySUE1/KEZVQRAPw4SoVW1X3DGFn0JQ8+9iAge9zy+g
	 wC0CKBzQHfrghSpPaqLGYO9N/1amXSB1DAffckWD15PizprVVCI5u9JlijKK3fFEei/w6
	 t6QCO8b96p2psHqnc+1GO3B+KozAuhueJCYkAzNviEdLlq6prLc6/kS2o113qB1crCZWp
	 o0e6FCJrlVVeMtxh/vE2ZRW4G/7S0gyKG+BBhZdgxJTsZilJdT4NUT1XzCLHpXgu0gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="K8vh/Cdp";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725FC606A33A;
	Sun, 15 Nov 2026 21:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K8vh/Cdp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 511531F000D0;
	Sun, 15 Nov 2026 21:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794776661;
	bh=PibRXBXiLpEoEbrOvo9EmvvXD/tNRe86o7ZaehpKWYs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=K8vh/CdpYRyzwm0mUWnyI8gQ53va8B51wGcaknHqxStrbFH0AOJs/yiYVXL8vwuAI
	 u6ABzUdt4hA0NXAYqXMRhgUWePQEbxOpKsqtu1SRm7kQ8/TVz7YwkvaKQuxaa+t03w
	 /RJuvOkbtP6Z6Kh3pQ07oLA3OqYC988MO2xVJkt+FysoJKxi1B5XengvfhtdMX01vq
	 oQ/fska3x/C8swtUp9rdcujdL+wX9aeijnkgbB9bp0jm76EuQkC+WslEp4M6SpyHoY
	 tRJO8ISjjwlNp8WigaBXH3QYsUqBEopsfTUu2vh/TyNo5mMsKbiAj3bhFuKpbTyyTt
	 MwQAMkhSGpAxw==
Subject: Re: [PATCH net] net: macb: limit jumbo frames to the RX buffer size
From: netdev-bot+sashiko@kernel.org
To: gaohan@iscas.ac.cn
Cc: theo.lebrun@bootlin.com, conor.dooley@microchip.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 punnaia@xilinx.com, harini.katakam@xilinx.com,
 linux-riscv@lists.infradead.org, rabenda.cn@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, zhengjingkun@iscas.ac.cn
Date: Sun, 15 Nov 2026 21:04:19 +0000
Message-ID: <179477665987.3136.1735758740648548604@kernel.org>
In-Reply-To: <20261114-macb-jumbo-jml-v1-1-f501395eaf9e@iscas.ac.cn>
References: <20261114-macb-jumbo-jml-v1-1-f501395eaf9e@iscas.ac.cn>
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

- [Medium] In drivers/net/ethernet/cadence/macb_main.c,
  gem_jumbo_max_len() sets the GEM JML register to rx_buffer_size -…

--

net: macb: limit jumbo frames to the RX buffer size

This commit moves the JML register write from macb_init_hw() into
macb_configure_dma(). It now derives the JML value from the RX buffer
size rather than from jumbo_max_len. With this, the MAC drops frames that
would otherwise be split over several RX descriptors and then rejected
by gem_rx().

> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
> index 5ad0e32e2b400..e7c9bb24c377b 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -3240,6 +3240,18 @@ static u32 macb_dbw(struct macb *bp)
>  	}
>  }
>  
> +/* Longest frame that fits in a single RX buffer */
> +static u32 gem_jumbo_max_len(struct macb *bp)
> +{
> +	u32 len = bp->ctx->rx_buffer_size;
> +
> +	/* Frame data starts NET_IP_ALIGN bytes into the buffer without RSC */
> +	if (!(bp->caps & MACB_CAPS_RSC))
> +		len -= NET_IP_ALIGN;
> +
> +	return min(len, bp->jumbo_max_len);
> +}

[Severity: Medium]
Is the value returned here 4 bytes smaller than the longest frame that
actually fits in one RX buffer?

macb_init_hw() always sets DRFCS. The MAC strips the FCS before DMA, so
the FCS never takes up space in the RX buffer:

	config |= MACB_BIT(DRFCS);		/* Discard Rx FCS */

The rest of the driver treats jumbo_max_len, and so JML, as an on-wire
length that includes the FCS. For example, macb_probe() does:

	netdev->max_mtu = MIN(bp->jumbo_max_len, RX_BUFFER_MAX) -
				ETH_HLEN - ETH_FCS_LEN;

Without RSC, that makes the largest wire frame that fits in one
descriptor rx_buffer_size - NET_IP_ALIGN + ETH_FCS_LEN. Wire frames from
rx_buffer_size - 1 to rx_buffer_size + 2 bytes fit in a single buffer
and were received before this patch. With the JML programmed by
macb_configure_dma(), the MAC now drops them.

Some concrete cases:

On pic64hpsc (jumbo_max_len = 16383), max_mtu is
MIN(16383, 16320) - 18 = 16302. macb_rx_buffer_size() returns
MIN(16302 + 20, RX_BUFFER_MAX) = 16320, so JML becomes 16318. A
full-size untagged frame at MTU 16302 is 16320 bytes on the wire, so the
MAC drops it. Yet its 16316 stored bytes plus the 2 byte offset fit in
the buffer. MTU 16301 fails the same way.

macb_rx_buffer_size() does not reserve VLAN_HLEN. At MTU 1513-1516,
rx_buffer_size is 1536 and JML is 1534. MTU-sized VLAN tagged frames
(1535-1538 bytes on the wire) are therefore dropped, even though they
fit in the buffer. MTU 9001-9004 has the same problem.

With QinQ at MTU 9000, a 9026 byte frame is larger than JML 9022 and is
dropped. Its 9022 stored bytes plus 2 fit in the 9024 byte buffer.

Should this add ETH_FCS_LEN, relying on DRFCS always being set, before
clamping to jumbo_max_len? The reported FU740 default MTU case would
still be fixed with that change.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261114-macb-jumbo-jml-v1-1-f501395eaf9e%40iscas.ac.cn
