Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794724881;
	b=rS0u1XgHyStVHNNZ169rhm0AKm925h8H4Nyr3eCi1y15+evj5ykdPPu+s3YkBngNok9Y
	 ejQDPwGr0J4SERCcqiGnq8510tlghH6eUvqzNweh6VEQTmfhKMqy4QhGG3Us/U6PZhTQp
	 xvqB9+p4QUA6s3Zwupt5CsIPwEBL2fVRIRfzDWrhiYcHBZEvs0ny9oGdBlLluoe9yGyEx
	 LilFy5MDONIsGZtxEW30rqfX5KV2SCpZarWheJMUhgPdlUGJsH2Hka/AdnRmCBb4kpolp
	 Vrjcar5umfF+Ez46YYdB4lLPAKKL0mD3gbdtsCaOR0maAFF5HTYy0Z0WGygLKKvW6TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794724881;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=1GoOltvu7puxik2cPShNsVeQGZfVphJdF2LJTrTKpw4=;
	b=0BR/ScL+4f4IqEolHJiI69XxwshdeRQeQDieS/P24eJQ+jmeaWWO0ypW+RR2RBM30gmY
	 NUoHRHxMax/IQ0KAg9378zL34l42J/VEjpZX5GWygoxn6zWdulUTEtSyYZght8o1lyvxA
	 cJ3f0pjrRdZuznd7ZlVrkZd6TizDTU/YABJje9JmR5nnfZC5YmpE5bHiIaPg9OqjznvdH
	 p2mWuDw+fWDyd2+OGhywNKA4Ztr2TPSjtL3k8ImYh1t1r5CYwiFvvdLpVykQqmEdY2SKU
	 VM4K1g/tyKTvbgjOMuF2Z9izBLy8H8isVdlorUoYLc6exCDVphyUwOpxJrfUFC+KdMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jSDCQrDy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A1A606A323;
	Sun, 15 Nov 2026 06:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jSDCQrDy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE1F21F000C4;
	Sun, 15 Nov 2026 06:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794724880;
	bh=1GoOltvu7puxik2cPShNsVeQGZfVphJdF2LJTrTKpw4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=jSDCQrDy9+A+6d2oYO8F8jPa4/D/IuzTAXVNIU62M7Rd75yTY0ONCUbXsTVfTOYGg
	 J4COXS95r7s6K/I4x3B6hpR4GtIZe/ZhnX0iZ21hAJ7B/5rP6ukuGv8714bTemj2yQ
	 XZ+L1kVv6suMKUXyHhc+1HpYi2dCBbuR013S0yCnCpO+hf3UOFXO6x852WRbhbUdWX
	 3mXRjlDttcrIM9IQhL2iaaSD1uNObaGydGicYoixe7LO41zrXWOitmZ+7No/17whL5
	 nw7MZ9aQJtG6Q5YrbZlBsdbbn4juOWAoCb2GhHUjjHuGol1AAyllhngBuUx4NBc7ij
	 /p6yd6WNX6vQg==
Subject: Re: [PATCH net v2 4/4] net: sb1250-mac: Fix RX checksum status and
 header offset setup
From: netdev-bot+sashiko@kernel.org
To: f.fainelli@gmail.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, macro@orcam.me.uk,
 daniel.machon@microchip.com, linux-kernel@vger.kernel.org
Date: Sun, 15 Nov 2026 06:41:19 +0000
Message-ID: <179472487941.2199510.17276250717965795834@kernel.org>
In-Reply-To: <20261110230300.2769327-5-f.fainelli@gmail.com>
References: <20261110230300.2769327-5-f.fainelli@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In sbdma_rx_process()
  (drivers/net/ethernet/broadcom/sb1250-mac.c, lines 1147-1150), the RX…
- [Low] sbmac_set_iphdr_offset()
  (drivers/net/ethernet/broadcom/sb1250-mac.c, lines 1718-1726) writes…

--

net: sb1250-mac: Fix RX checksum status and header offset setup

The RX path now reads M_DMA_ETHRX_BADTCPCS from descriptor B instead of
descriptor A. The patch also fixes the combined mask/set expression in
sbmac_set_iphdr_offset(). It reprograms the IP header offset on every
channel start and keeps it when unicast and broadcast reception is enabled.

> diff --git a/drivers/net/ethernet/broadcom/sb1250-mac.c b/drivers/net/ethernet/broadcom/sb1250-mac.c
> index 433aa1e244397..7998ab9fc46c4 100644
> --- a/drivers/net/ethernet/broadcom/sb1250-mac.c
> +++ b/drivers/net/ethernet/broadcom/sb1250-mac.c

[ ... ]

> @@ -1145,7 +1146,7 @@ static int sbdma_rx_process(struct sbmac_softc *sc, struct sbmacdma *d,
>  				/* Honor the RX checksum offload feature setting. */
>  				if (dev->features & NETIF_F_RXCSUM) {
>  					if (!((dsc->dscr_a) & M_DMA_ETHRX_BADIP4CS) &&
> -					    !((dsc->dscr_a) & M_DMA_ETHRX_BADTCPCS)) {
> +					    !((dsc->dscr_b) & M_DMA_ETHRX_BADTCPCS)) {
>  						sb->ip_summed = CHECKSUM_UNNECESSARY;
>  						/* don't need to set sb->csum */
>  					} else {

[Severity: Medium]
Is it enough to check these two error bits before marking the skb
CHECKSUM_UNNECESSARY in sbdma_rx_process()?

A clear BADIP4CS or BADTCPCS bit means no failure was reported. It does
not mean the hardware checked the frame. Both bits are specific to IPv4
and TCP:

arch/mips/include/asm/sibyte/sb1250_dma.h:
#define M_DMA_ETHRX_BADIP4CS	    _SB_MAKEMASK1(51)
...
/* Note: This bit is in the DSCR_B options field */
#define M_DMA_ETHRX_BADTCPCS	_SB_MAKEMASK1(0)

The descriptor also holds the hardware's packet classification, and the
driver never reads it:

#define S_DMA_ETHRX_PKTTYPE	    55
#define M_DMA_ETHRX_PKTTYPE	    _SB_MAKEMASK(3, S_DMA_ETHRX_PKTTYPE)
...
#define K_DMA_ETHRX_PKTTYPE_IPV4    0

sbdma_add_rcvbuffer() posts every buffer with dsc->dscr_b = 0, so
BADTCPCS reads as clear unless the engine reports a failure. The MAC also
parses IP at one hard-coded offset, and VLAN detection is never enabled.

Suppose the engine leaves both bits clear for frames it does not
validate. Would IPv6 TCP/UDP/ICMPv6 frames and 802.1Q tagged frames then
be reported as checksum verified, with the stack skipping L4 checksum
validation for them? The same question applies to IPv4 frames that are
not TCP, or that are fragments.

The commit message says:

  Consequently, a frame with a valid IPv4 checksum and a bad TCP checksum
  can be marked CHECKSUM_UNNECESSARY.

The same result still looks reachable for frames the hardware does not
classify as IPv4/TCP.

This patch may also widen the exposure for IPv4. Before it, the
IPHDR_OFFSET field was in practice 0 at runtime. sbmac_channel_start()
cleared sbm_rxfilter, and the old mask expression never set the field.
So IPv4 frames probably failed BADIP4CS and fell back to software
checks.

Now sbmac_channel_start() calls sbmac_set_iphdr_offset() on every start,
so IPv4 frames can pass the header check. Any IPv4 L4 protocol that the
TCP check does not cover would then be marked CHECKSUM_UNNECESSARY.

Would it be safer to set CHECKSUM_UNNECESSARY only when all of these
hold, and leave every other frame as CHECKSUM_NONE?

- G_DMA_ETHRX_PKTTYPE(dsc->dscr_a) == K_DMA_ETHRX_PKTTYPE_IPV4
- the frame is not a fragment
- the L4 protocol is one the hardware verifies

The headers in the tree do not say whether the MAC sets these bits for
frames it does not classify as IPv4. This concern depends on how the
hardware behaves.

[ ... ]

> @@ -1717,7 +1721,8 @@ static void sbmac_set_iphdr_offset(struct sbmac_softc *sc)
>  
>  	/* Hard code the off set to 15 for now */
>  	reg = __raw_readq(sc->sbm_rxfilter);
> -	reg &= ~M_MAC_IPHDR_OFFSET | V_MAC_IPHDR_OFFSET(15);
> +	reg &= ~M_MAC_IPHDR_OFFSET;
> +	reg |= V_MAC_IPHDR_OFFSET(15);
>  	__raw_writeq(reg, sc->sbm_rxfilter);

[Severity: Low]
Is 15 the correct encoding for the IP header offset?

The comment above sbmac_set_iphdr_offset() says:

 *  Set the iphdr offset as 15 assuming ethernet encapsulation

In an untagged Ethernet II frame the IP header starts at byte 14
(ETH_HLEN). Measured from the cache-line-aligned buffer start, after
sbdma_add_rcvbuffer() adds NET_IP_ALIGN, it starts at byte 16.

The field definition in sb1250_mac.h does not give units or a base:

#define S_MAC_IPHDR_OFFSET	_SB_MAKE64(8)
#define M_MAC_IPHDR_OFFSET	_SB_MAKEMASK(8, S_MAC_IPHDR_OFFSET)

This patch is the first to make the value reach the hardware at runtime.
Suppose the field is a plain 0-based byte offset from the start of the
frame. Would the MAC then check the IPv4 header one byte off and set
BADIP4CS on almost every IPv4 frame? RX checksum offload would then
quietly fall back to software every time.

If the hardware uses a different base (for example 1-based) and 15 is
correct, could the comment and the commit message say so?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261110230300.2769327-1-f.fainelli%40gmail.com
