Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794648514;
	b=gkrdyJK9NBOfZ2M22JNCe8JrbW3FKFI+wD4nNdTM7J0z8Ynp1wc00mxvUu7oVj3locgq
	 b4TWsR+v5z0KahqBou11u4M1gAi2XpuzWqvBtZKO4P3Rc2ZGhex3Afl87UIfOH313MqlM
	 sBxIBykWeNmhkbcPKjYvqQVSbwXYx3TJcj+JH8gP6b/LKFxNFs9ty4E0oorGJuczxDriu
	 OUxN+0tkvwwtx0dRMmj/3KQ6SE8/qzqX1mp/JEal35Kd1k7vIzIljyOWqlqJH7SbVu0tZ
	 BadQHh6wuwWrqjiwbPrFw9D4dMRlbHIlgXRPBV5jEOJO4X4JysaZaAFhUXz9Dia/T5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794648514;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=XzGBh5VLGXS5UYk8trLl/RJIVJzn2v5v54FjYp8yTLw=;
	b=ymPGwJj/wFtVPOaTLwD6W5MixFDYtJOkBOMsXk8F67MQoaHEf7mtACnNPaiBs6+S1s1x
	 bumKjcKpjFanLP0EU+P451cbmOMUvFnZxNQp/dUo563UmoKLsjcLt+HvVBqRhP4gXU6y4
	 rs81DS4iPx+grg7wYlMivjWkUK8hYxq20MA5Jvk574rOm1QmKCl4r6eRvGkOrfk72Okez
	 vOib05OLko6DQafV3daXpYLvnpPGFCguJwMRq127aiWytQhHhWWsO2bLLeoTC0FqP73c4
	 PFg+IUm8yledKJd0OeWNw3iMU7kxdJSBVCZVMzIZ3uzteN8IDpKxKXu5vjD5m2xn1MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hz02Jqla;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEC2606A8AD;
	Sat, 14 Nov 2026 09:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hz02Jqla
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F248D1F000C5;
	Sat, 14 Nov 2026 09:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794648514;
	bh=XzGBh5VLGXS5UYk8trLl/RJIVJzn2v5v54FjYp8yTLw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Hz02JqlaunqiwXHQIlugOQFde5c3ekg5KgAVPDURJ+wUjobSudEaF+QFBl2s46E+v
	 9zNDXVNpvHi2+1JcRZB38iT5mTfbmOa1lnMnMx8ipDg1lpu98bsRhshwvdB2A664Nv
	 N3V+GJanugNF980VeTEAOMyx4+iFV05ospXjp4HfVe3UN2P1Ags8bQrMC7Pz4QltKn
	 gCglF08BzxslJOoZ/LtlzDIrgQhsrQW86J4gcW+zlxTanromxZhOaNsDJhJpZxmQ4d
	 gR6MhcNHRUY0bngFMHpbtcvJJ1gOMOtcLziplEJZ/sh8170eQJCSUkeFKJ4YZfnDaq
	 ZeHVsYTOCckzQ==
Subject: Re: [PATCH net-next v8 04/11] r8152: fix flow control for
 RTL8156/RTL8156B/RTL8157/RTL8159
From: netdev-bot+sashiko@kernel.org
To: hsu.chih.kai@realtek.com
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
 nic_swsd@realtek.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 edumazet@google.com, bjorn@mork.no, pabeni@redhat.com, andrew+netdev@lunn.ch,
 mail@birger-koblitz.de
Date: Sat, 14 Nov 2026 09:28:33 +0000
Message-ID: <179464851357.2199510.561254259862841249@kernel.org>
In-Reply-To: <20261110032416.16968-5-nic_swsd@realtek.com>
References: <20261110032416.16968-5-nic_swsd@realtek.com>
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

- [Low] On RTL8157/RTL8159 (RTL_VER_16/RTL_VER_17), rtl_fc_pause_pkt_en()
  in drivers/net/usb/r8152.c clears SLOT_EN in PLA_RCR (line 6006).
- [Low] In rtl_fc_pause_pkt_en() (drivers/net/usb/r8152.c, lines
  6023-6031), the fallback branch of the new VER_16/17 speed decode has…

--

r8152: fix flow control for RTL8156/RTL8156B/RTL8157/RTL8159

This commit moves the per-chip flow control setup into a new helper,
rtl_fc_pause_pkt_en(). It adds the missing FC timer and
FLOW_CTRL_PATCH_OPT setup for RTL8156A (VER_10/11). For RTL8157/RTL8159
(VER_16/17) it programs a pause packet limit from rtl8156_enable(),
using the new PLA_PAUSE_LIMIT register and a count that depends on the
link speed.

> diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
> index 1517753f843ef..6f55aed4709e1 100644
> --- a/drivers/net/usb/r8152.c
> +++ b/drivers/net/usb/r8152.c

[ ... ]

> @@ -5961,6 +5966,103 @@ static void r8152b_enter_oob(struct r8152 *tp)
>  			   RCR_APM | RCR_AM | RCR_AB);
>  }
>  
> +static void rtl_fc_pause_pkt_en(struct r8152 *tp, u16 speed)
> +{

[ ... ]

> +	case RTL_VER_16:
> +	case RTL_VER_17:
> +		ocp_word_clr_bits(tp, MCU_TYPE_PLA, PLA_RCR, SLOT_EN);

[Severity: Low]
This isn't a functional bug as far as I can tell, but is clearing
SLOT_EN on RTL_VER_16/RTL_VER_17 intended to be part of this fix? For
these chips the commit message only says:

    VER_16/17: limit pause packets with the new PLA_PAUSE_LIMIT register
    instead of the FW patch.

Before this patch, the only place that cleared SLOT_EN was r8156_init(),
and only for RTL_VER_12..RTL_VER_15. So this changes the receive config
on RTL8157/RTL8159 for the first time.

This helper is called from rtl8156_enable() for these chips. That means
the clear now runs on every enable: set_carrier(), rtl8152_change_mtu(),
rtl8152_set_coalesce() and rtl8152_post_reset(). It also runs on the
"Unknown link speed" path.

Could the commit message mention the PLA_RCR change and say why the
pause frame fix needs it? The code is the same at the end of the series,
where rtl8157_enable() calls the helper for RTL_VER_16 and
RTL_VER_17_QFN68/QFN100.

> +
> +		num_pause_pkts = 0xa;
> +		ratio = 10000;
> +
> +		if (speed & _10bps) {
> +			ratio /= 10;
> +		} else if (speed & _100bps) {
> +			ratio /= 100;
> +		} else if (speed & _1000bps) {
> +			ratio /= 1000;
> +		} else if (speed & _2500bps) {
> +			ratio /= 2500;
> +		} else if (speed & _5000bps) {
> +			ratio /= 5000;
> +		} else if (speed & _10000bps) {
> +			ratio /= 10000;
> +		} else {
> +			/* No rate bit is set, e.g. a 500 or 1250 Mbit/s
> +			 * sub-rate, which the driver does not advertise.
> +			 * Disarm the limit.
> +			 */
> +			dev_err(&tp->intf->dev, "Unknown link speed\n");
> +			ocp_word_clr_bits(tp, MCU_TYPE_PLA, PLA_PAUSE_LIMIT,
> +					  PAUSE_LIMIT_EN);
> +			break;
> +		}

[Severity: Low]
Is this comment accurate? The driver already defines rate bits for both
of these speeds in enum rtl_register_content:

	_1250bps	= BIT(9),
	_500bps		= BIT(8),

Also, rtl8156_enable() already tests speed & _500bps for VER_10/11. At
500 or 1250 Mbit/s a rate bit is set. The if/else chain just doesn't
check for it.

The case where no rate bit is set looks like link down instead.
rtl8156_enable() passes the raw rtl8152_get_speed() value here without
checking LINK_STATUS.

rtl8152_change_mtu(), rtl8152_set_coalesce() and rtl8152_post_reset()
decide whether to call rtl_ops.enable() using only netif_carrier_ok().
The link change work updates that state later:

rtl8152_change_mtu() {
    ...
	if (netif_carrier_ok(dev)) {
		...
		tp->rtl_ops.disable(tp);
		tp->rtl_ops.enable(tp);
    ...
}

Suppose the cable is unplugged and the MTU or coalesce settings change
before set_carrier() runs. Wouldn't this print "Unknown link speed" with
dev_err() for what is really a link down?

The next real link up reprograms PLA_PAUSE_LIMIT, so only the comment
and the log message are affected. The code is unchanged at the end of
the series, where rtl8157_enable() calls rtl_fc_pause_pkt_en() the same
way.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261110032416.16968-1-nic_swsd%40realtek.com
