Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794826837;
	b=a/LxJLLSIUtlQL2gwRB1o0ZOnzmdi8Qvn+SRV6g+07E2NiLQud2dglI6Enhc+Vgsi1Uk
	 2piHk/wiultvKg1bymuiFi7int8iAwhoFqxs6m48Zt1Htjewc8FEfuXB8Vn4v7RZZWpz2
	 XogrC3i2s9T6FP7M13HewrWdrEIRa82XmA9amy1OhFqF1bFR4KJFt7sKQ+bbPVGwX+7uN
	 1vWoJZmvU9QgbbDirzh1vOsFbFoA4Q8PClXFQRWf9wjsM7PHdRROTx4g5RrkQpg5oPcHK
	 lYmpaPrxBVtkP23bpUV9p6Ndf3O24EPzA9bEFOrpzE1J+fhwmcmEg8sxOX2SBQ5hhiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826837;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=jRQaov11bNgWz0yrd9PclPsPFo/vCJZ5F4x0YK2Zcjo=;
	b=y3bfyXhvQ5sUo1AdE74tZonuCKr71V4/CyAO7Z6zTmoWC2nmzRuQjpIEmKa5yPjbwS9K
	 DjpaEtEVaXPDRHYpxrP5Kj6kRuk67Sx4C02J4CSU4BbY2/beQTrYRhqMxtXbkAMJwqH/W
	 cH49YtZCSDvdlv3LH7uK8uFJvGBDMD9OtnmnFSBYAgL6GQsWm2tosUNjEsRYgG8W9SKp9
	 BcmZBHOu9gjo+I01ewYyG9ozvWNwMMZl/kok7uZEy7iI/mibWJfPMBf2XXx5r7BrOXhft
	 l4CBAKsmmvMVl1HqpH5GvCjMOAXu1L75jxx97f7itXQm0pArbOdV2zLVfTEwrP8iKGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ke50lvbv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA3A606A336;
	Mon, 16 Nov 2026 11:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ke50lvbv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AE331F000C4;
	Mon, 16 Nov 2026 11:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794826836;
	bh=jRQaov11bNgWz0yrd9PclPsPFo/vCJZ5F4x0YK2Zcjo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Ke50lvbvWzEtbJQQFsFv7GCmAsYQlc6D7rR9u1AF81EcLg1KizIoA6gS24yZcOfeH
	 HTYsHJ8g8uT2nrc4ODl8Foz6i1QK6F0Ao3x6fmORMG9hBn5FhTbQQ55hR+ogS1oFkM
	 g91FN+1WCf1Jkc8spoIoIDn7W6ib/KhnsN6K7bYBLmaDD/Whe7LT+nQwBom2GW/KA5
	 eCMrhGsA80DWc+jwG6FpGMYMx6Vyn2jQcRJjCt2mp6TD6+vK1rYOA3hOacAGwWPzds
	 AyGrFdCFbmicQHa/H3cSckIOVzqE6+kcMb1eXEwAkzNb0CNYjyNLBvD5BsMFnKASnh
	 oQS2c2q0Ydngw==
Subject: Re: [PATCH net-next v2 1/3] net: dsa: microchip: ksz9477: apply a
 shorter ageing time at once
From: netdev-bot+sashiko@kernel.org
To: o.rempel@pengutronix.de
Cc: woojung.huh@microchip.com, UNGLinuxDriver@microchip.com, andrew@lunn.ch,
 olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, arun.ramadoss@microchip.com,
 jiri@resnulli.us, linusw@kernel.org, f.fainelli@gmail.com,
 vivien.didelot@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 jensemil.schulzostergaard@microchip.com
Date: Mon, 16 Nov 2026 11:00:35 +0000
Message-ID: <179482683512.3136.850497985215218789@kernel.org>
In-Reply-To: <20261115-ksz-stp-ageing-v2-1-7af27320033e@pengutronix.de>
References: <20261115-ksz-stp-ageing-v2-1-7af27320033e@pengutronix.de>
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

- [Medium] In ksz9477_set_ageing_time()
  (drivers/net/dsa/microchip/ksz9477.c:1361-1371), the new Fast Aging…
- [Low] The Fast Aging pulse in ksz9477_set_ageing_time() is a fixed
  blind sleep: KSZ9477_FAST_AGE_PULSE_US = 2 ms (ksz9477.c:1293),…

--

net: dsa: microchip: ksz9477: apply a shorter ageing time at once

This patch makes ksz9477_set_ageing_time() pulse the Fast Aging bit in
REG_SW_LUE_CTRL_1 for a fixed 2 ms. It does this whenever the programmed
ageing time gets shorter or the Age Count gets smaller. The goal is that
stale entries no longer outlive an STP topology change on a KSZ9893.

> diff --git a/drivers/net/dsa/microchip/ksz9477.c b/drivers/net/dsa/microchip/ksz9477.c
> index 8d4647e23cda1..a9d701f0404a7 100644
> --- a/drivers/net/dsa/microchip/ksz9477.c
> +++ b/drivers/net/dsa/microchip/ksz9477.c

[ ... ]

> @@ -1336,8 +1343,32 @@ static int ksz9477_set_ageing_time(struct dsa_switch *ds, unsigned int msecs)
>  			return ret;
>  	}
>  
> -	value = DIV_ROUND_UP(secs, data);
> -	return ksz_write8(dev, REG_SW_LUE_CTRL_3, value);
> +	new_period = DIV_ROUND_UP(secs, data);
> +	ret = ksz_write8(dev, REG_SW_LUE_CTRL_3, new_period);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* data is the new Age Count and mult is the old one. An entry
> +	 * stores the Age Count when it is updated. The datasheet does not
> +	 * say when a new Age Period applies. On a KSZ9893, entries outlived
> +	 * the new ageing time after it got shorter, and after the Age Count
> +	 * got smaller. Pulse Fast Aging in both cases. On a KSZ9893 the
> +	 * pulse removes the dynamic entries (checked on one user port) and
> +	 * starts the new period.
> +	 */
> +	old_secs = mult * old_period;
> +	new_secs = data * new_period;
> +	if (new_secs >= old_secs && data >= mult)
> +		return 0;
> +
> +	ret = ksz_rmw8(dev, REG_SW_LUE_CTRL_1, SW_FAST_AGING, SW_FAST_AGING);

[Severity: Medium]
Does this flush the dynamic FDB entries of every port on the switch?

SW_FAST_AGING is BIT(1) of REG_SW_LUE_CTRL_1 in ksz9477_reg.h. That
register holds only switch-wide lookup engine controls, next to
SW_AGING_ENABLE and SW_LINK_AUTO_AGING. Fast Aging has no port or FID
selector, so each pulse removes dynamic entries on all ports. That
includes ports in other bridges that had no topology change.

When the software bridge shortens its ageing time, it only expires
entries that were not refreshed within the new time. This pulse also
drops entries that are still in use. Unicast traffic to those addresses
then floods until the hosts transmit again, and a host that only
receives can be flooded to for a long time.

The pulse can also fire when the ageing time grows. From the reset value
of 4 x 75 s, a request for 301 s gives:

    max_val = 255   (76 * 4 != 301)
    data = DIV_ROUND_UP(301, 255) = 2
    new_period = DIV_ROUND_UP(301, 2) = 151

data (2) < mult (4), so the switch-wide flush runs although the ageing
time went up from 300 s to 302 s.

Neither the subject nor the body says the flush covers the whole switch.
The commit message only says:

    On a KSZ9893 the pulse removed the dynamic entries on the one user port
    I tested.

The driver already has a per-port flush, ksz9477_flush_dyn_mac_table(),
which is wired up as .port_fast_age. Could that be used here, or could
the commit message at least say that all ports are flushed?

> +	if (!ret)
> +		fsleep(KSZ9477_FAST_AGE_PULSE_US);
> +
> +	/* Clear the bit even after an error. */
> +	err = ksz_rmw8(dev, REG_SW_LUE_CTRL_1, SW_FAST_AGING, 0);

[Severity: Low]
Is a fixed 2 ms sleep long enough on all chips that use this function?

The new define comes with this comment:

    /* The datasheet gives no pulse length. A 2 ms pulse worked on a KSZ9893. */

Nothing checks that the dynamic entries are gone before SW_FAST_AGING is
cleared. ksz9477_set_ageing_time() is installed through ksz9477_switch_ops.
That covers many chip_data entries in ksz_common.c, including the 7-port
KSZ9477/KSZ9897/KSZ9567 parts, but it was only tested on a KSZ9893 with
one user port.

The other Fast Aging user in this driver suggests the timing depends on
the chip:

drivers/net/dsa/microchip/ksz8.c:ksz8_flush_dyn_mac_table() {
    ...
	if (ksz_is_ksz8995xa(dev)) {
		/* Allow the 800 us fast-age cycle to finish before restoring
		 * normal ageing and port learning.
		 */
    ...
}

Some untested chips may count each entry's stored Age Count down at a
fast tick, or may need more time to sweep the ALU. If so, could the pulse
end before every entry has expired, so that stale entries still outlive
the topology change?

> +
> +	return ret ?: err;
>  }

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261115-ksz-stp-ageing-v2-0-7af27320033e%40pengutronix.de
