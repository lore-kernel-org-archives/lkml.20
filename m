Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794826838;
	b=SplFXr/w0Al7QqJYRfwIJR7tiwR/e+5hJ69q3dyJm6NE5HQSSKkA/R5Kua3ShUvi5FvF
	 AL9522AiKwWuINEjqvaA3fw077vUi0FEuNtJdqL3MdQYFwFvuemSJgdpu14LNYvuRkHXi
	 dO7KNGr1ZwefMTfNA9FGbDUAS7AS+HK5ErKj3owp//7iwvkHh4pUXB4ul1NfQOT/G6MHH
	 0wiJ6xHvTKhhGY67iBb77E/YPwa1Fal+WOft51JmiY5E09j7BLPXFrwgkvG36TuVcaY/G
	 Rszh2ApMrCkWGzlbEI9HZgkyYIqN7li9lGwLCSwDpcJaObNu9BusTUM1JfzF1ed9uOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826838;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=ka3guBqxxM4Qr+XP1T4WnJINYyUxWKYswjO+habAv3w=;
	b=CN9CuYgg8o0Td9XIusZpSXcaa/Lm5I6q1UmUu1CZWNA2j869xGmzYrkMbihSFyvrXph+
	 +g6/RWXkd9oSXDYA83REqKn44k8M0AVvtm14xX6By3qcwEy54AfkB8Z6LUFNFe81UUwpy
	 l4VuaHkxPVvel1N9ifdb3J+tSB3Ek8PsjVvdGLUTpvs9pFs/yc5pPUGIRC3QXxZ9opfkV
	 M2uuaFv57fbK9zoh4cIQrCGZBRg2Jusr3QHHueSlE+0GxBzJfmhMeBoXy6Ia+C0NvZgbX
	 OFQXYBuhxNxtPqMcUVlHL+oshnchjl8yrhLKTCvBaD2FN64WTS2rMPB+0pEb1eKcHgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SISEzRGg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2CB606A894;
	Mon, 16 Nov 2026 11:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SISEzRGg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5671A1F000CA;
	Mon, 16 Nov 2026 11:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794826838;
	bh=ka3guBqxxM4Qr+XP1T4WnJINYyUxWKYswjO+habAv3w=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=SISEzRGg4WR+yVM5byzl4U4yWgWrHsvA8w5TXTKJdxpk8cd8IwlIqOl+8GPxXijcW
	 NajaQUMdARyrXgVRiavGv1aL/8F4pG9k0Fix7NtXgkv5wqNs0xDKsmquHaDgl7wAdP
	 Oy3kPXpDoKJNqrZ5FMWLLtmhrFjINpk6WKxvf0NDdvQugIbzPWSR9s+rIyneQhEmng
	 XB1OfjKpnuuu4pBr/MJGntqyqLQSYOyvGeT/7Q/ZgnXF923UngAenTsfeXpH5C9m9N
	 70SpgWdAo4nVDH3SJ8x3MZogoQESPJRHw7vCThCgBBXvyISSmiIPwu4pOCxs42ga1u
	 DR0tSdNW9br4w==
Subject: Re: [PATCH net-next v2 3/3] net: dsa: forget the port ageing time
 when the port leaves the bridge
From: netdev-bot+sashiko@kernel.org
To: o.rempel@pengutronix.de
Cc: woojung.huh@microchip.com, UNGLinuxDriver@microchip.com, andrew@lunn.ch,
 olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, arun.ramadoss@microchip.com,
 jiri@resnulli.us, linusw@kernel.org, f.fainelli@gmail.com,
 vivien.didelot@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 jensemil.schulzostergaard@microchip.com
Date: Mon, 16 Nov 2026 11:00:36 +0000
Message-ID: <179482683686.3136.4297608809022872177@kernel.org>
In-Reply-To: <20261115-ksz-stp-ageing-v2-3-7af27320033e@pengutronix.de>
References: <20261115-ksz-stp-ageing-v2-3-7af27320033e@pengutronix.de>
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

- [Medium] In net/dsa/port.c, dsa_port_switchdev_unsync_attrs() now
  clears the cached dp->ageing_time, but nothing on the bridge-leave…

--

net: dsa: forget the port ageing time when the port leaves the bridge

This patch clears the cached dp->ageing_time in
dsa_port_switchdev_unsync_attrs() when a port leaves a bridge. After that,
dsa_switch_fastest_ageing_time() no longer counts the departed port's
value. The switch can then return to the bridge's long ageing time when
another port of the same bridge gets a restore.

> diff --git a/net/dsa/port.c b/net/dsa/port.c
> index 15e7da20b0e2f..54c9709840952 100644
> --- a/net/dsa/port.c
> +++ b/net/dsa/port.c
> @@ -415,6 +415,12 @@ static void dsa_port_switchdev_unsync_attrs(struct dsa_port *dp,
>  	/* Ageing time may be global to the switch chip, so don't change it
>  	 * here because we have no good reason (or value) to change it to.
>  	 */
> +
> +	/* Forget the ageing time cached for this port.
> +	 * dsa_switch_fastest_ageing_time() skips 0, so this port no longer
> +	 * counts towards the minimum.
> +	 */
> +	dp->ageing_time = 0;

[Severity: Medium]
This clears the cache, but the leave path never writes the switch's ageing
register again. Can the chip still stay at the departed port's short
ageing time?

The hardware is only programmed in dsa_switch_ageing_time(), which runs
on DSA_NOTIFIER_AGEING_TIME:

net/dsa/switch.c:dsa_switch_ageing_time() {
    ...
	ageing_time = dsa_switch_fastest_ageing_time(ds, info);

	if (ds->ops->set_ageing_time)
		return ds->ops->set_ageing_time(ds, ageing_time);
    ...
}

That notifier is only sent by dsa_port_ageing_time(). It is reached from
dsa_port_switchdev_sync_attrs() when a port joins, and from
dsa_user_port_attr_set(), which is gated on the port still offloading the
bridge:

net/dsa/user.c:dsa_user_port_attr_set() {
    ...
	case SWITCHDEV_ATTR_ID_BRIDGE_AGEING_TIME:
		if (!dsa_port_offloads_bridge_dev(dp, attr->orig_dev))
			return -EOPNOTSUPP;

		ret = dsa_port_ageing_time(dp, attr->u.ageing_time);
    ...
}

Take one switch with br0 holding lan1 and lan2 at 300 s, and br1 holding
only lan3 at 10 s (or 2 x forward_delay during an STP topology change on
br1). The chip runs at 10 s.

When lan3 leaves br1, the call chain is:

dsa_port_bridge_leave()
  dsa_port_switchdev_unsync_attrs()
    dp->ageing_time = 0;

br1 has no ports left in this tree to send a restore, and br0 has no
reason to send one. The chip stays at 10 s. br0's FDB entries then age
out early, which causes extra unknown-unicast flooding. This lasts until
br0's ageing time changes, a port joins a bridge, or br0 has its own
topology change.

At that point dsa_switch_fastest_ageing_time() would return the minimum
of the remaining cached values (300 s), but the hardware is never set to
it.

The comment kept just above the new code says there is "no good reason
(or value)" to change the ageing time here. In this case there is a
usable value: the minimum over the remaining bridged ports.

Could the leave path recompute the fastest ageing time over the switch's
remaining bridged ports after clearing the cache, and program it? The
register could be left alone when no bridged ports remain.

The commit message notes that "The switch gets the restored value only
if another port of the same bridge is still in this DSA tree", and the
v2 changelog moves the last-port case to the cover letter. The
multi-bridge case above would still leave the switch at the short value
this patch is meant to fix.

>  }
>  
>  static int dsa_port_bridge_create(struct dsa_port *dp,

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261115-ksz-stp-ageing-v2-0-7af27320033e%40pengutronix.de
