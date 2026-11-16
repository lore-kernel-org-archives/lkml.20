Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855741;
	b=x8DVP04WrCRfK6aPoOPsWgjk92Q+gaMWaAbUsnBfQc+A3SbOoMW2HGfiQipijbjaJhz8
	 TNQwTZZ7Ua4+/aM5nTsmqDRoMnwYqJmm9A8yepPeN49gRIUaZJEzi7Ah/0RxVw5lkfP1L
	 XGQoeJh1thI3CBbjfarwQp3waI6MrhDHV3ToouytPpxBoE6X8Wf+QH+7n2ToiCPALQGbI
	 k0PlmztW8I0J+TkjfSD3JZpuHjngd0fW5UJ9ef4Jw5kTxbWk2QWVN60Npe3V1uJoFZPdh
	 4GnjLJpHPWGhLepU6JKDFCN183vhAsS96HRRKFNIiIU7/KHfSqV99GAUNh0Iz9Ov/TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855741;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=50Zgq4Wlhu78oRiVo20JXj//1X5zV34RGR2wWKijbl8=;
	b=1QscjcsJS0nLCOd3dqUxb14VsFy5dRB2RetpbLC0q5CzJrkK8z+Z2+lA0gC5iuCUslT8
	 6ud+3sb/ApGO7uy8pEegaLfhuNisWT03UeNcXRKKwj7sH9m7hzq0Uo3DxpqFGNSiYnzqi
	 3tmYuiBq9yMRo/oHly74xDGyoDLgLKiixfFkBGZIlskmzZ7VRc2p8regPekeQ2vRVGuSw
	 hIk93/6H80DmIrz15RkrjkyjwmlmM6P1oe6iUuvt2QH2WWIu402hWpSie5tn6JKOlCBRC
	 lK7mT3CjXT9ofURKxGZwvsdYr1/vKjjLw6nJXdTua0wudlECqJC7/KB1F0OmnULeqYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bmbN1Fuf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A68606A334;
	Mon, 16 Nov 2026 19:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bmbN1Fuf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7320C1F000CE;
	Mon, 16 Nov 2026 19:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794855741;
	bh=50Zgq4Wlhu78oRiVo20JXj//1X5zV34RGR2wWKijbl8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=bmbN1FufeVvvGut5VTpcc8oWRDaThItdzZvMC7cB5IQF2Bhh8sMJ50EQcnp+351tg
	 55cPAH2eHqmt6vF6h9Kv1AbCUe1wjoXTwff9TgE6hyAODuzEzcVmJk2vX8sxdf7KEQ
	 2JphhhH1R8TzaloEMWFr6Hs8lsiVgNDFZFfB2fAkF7R8FVn9SUev4PtbWdDwVnBr5O
	 eUm1HUWQQkCIqRzOxoTz5yPYmT16dgj8yaPDEvXzPDRamXhygBf/9NEMrhBCSc7FBa
	 B7IiJiYbKvS+gooq2ZtjLntYAULwSP3gH5Zjcr5+cEFNGrGSFfttmZWVUcH41IwRaA
	 lxnEopr71LezQ==
Subject: Re: [PATCH net v5 5/8] net: dsa: b53: use the correct override
 register 2 Gbps bit
From: netdev-bot+sashiko@kernel.org
To: florian.fainelli@broadcom.com
Cc: netdev@vger.kernel.org, jonas.gorski@gmail.com, andrew@lunn.ch,
 olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, vivien.didelot@gmail.com, linux-kernel@vger.kernel.org
Date: Mon, 16 Nov 2026 19:02:20 +0000
Message-ID: <179485574004.3136.10514561050304983493@kernel.org>
In-Reply-To: <20261112180202.324504-6-florian.fainelli@broadcom.com>
References: <20261112180202.324504-6-florian.fainelli@broadcom.com>
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

- [Low] The Fixes: tag covers only one of the two bugs this patch fixes.

--

net: dsa: b53: use the correct override register 2 Gbps bit

This patch picks the 2 Gbps speed bit per register in
b53_force_port_config(). The IMP override register uses
PORT_OVERRIDE_SPEED_2000M and the per-port GMII override registers use
GMII_PO_SPEED_2000M. As a result, lower speeds clear the correct bit and
2 Gbps sets the correct bit on GMII ports.

> diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
> index 64e04c5731a69..d8dafa9e0c44d 100644
> --- a/drivers/net/dsa/b53/b53_common.c
> +++ b/drivers/net/dsa/b53/b53_common.c

[ ... ]

> @@ -1449,11 +1451,12 @@ static void b53_force_port_config(struct b53_device *dev, int port,
>  
>  	reg &= ~(0x3 << GMII_PO_SPEED_S);
>  	if (is5301x(dev) || is58xx(dev))
> -		reg &= ~PORT_OVERRIDE_SPEED_2000M;
> +		reg &= ~speed2000;
>  
>  	switch (speed) {
>  	case 2000:
> -		reg |= PORT_OVERRIDE_SPEED_2000M;
> +		if (is5301x(dev) || is58xx(dev))
> +			reg |= speed2000;
>  		fallthrough;

[Severity: Low]
This isn't a bug, but should the Fixes: tag also cover the 2 Gbps set
path? The commit message has:

    Fixes: b6a8a5477fe9 ("net: dsa: b53: fix resetting speed and pause on forced link")

b6a8a5477fe9 added the clear of PORT_OVERRIDE_SPEED_2000M at lower speeds.
On the GMII register that clear removes GMII_PO_EN (BIT(6)) and leaves a
stale GMII_PO_SPEED_2000M behind. That part of the patch matches the tag.

The change in case 2000 fixes an older problem. On a GMII port, ORing in
PORT_OVERRIDE_SPEED_2000M has always set GMII_PO_EN and never
GMII_PO_SPEED_2000M (BIT(7)), so 2 Gbps was never selected on that
register.

The case 2000 line goes back to 967dd82ffc52. Later, 63f8428b4077 switched
the code from cpu_port to imp_port, which moved BCM5301x CPU port 5 back
onto the GMII register path, and that path still set BIT(6).

In the current tree, the only caller that passes speed = 2000 is
b53_phylink_mac_link_up():

	if ((is5301x(dev) || dev->chip_id == BCM58XX_DEVICE_ID) &&
	    dsa_is_cpu_port(ds, port)) {
		tx_pause = true;
		rx_pause = true;
		speed = 2000;
	}

That code came from 41af38324341 ("net: dsa: b53: restore the NSP IMP port
2 Gbps mode"). It also covers BCM5301x CPU ports 5 and 7, which go through
B53_GMII_PORT_OVERRIDE_CTRL(port).

The commit message says the patch makes it so "2 Gbps sets it". Would an
extra Fixes: tag for 41af38324341 describe what the patch fixes more
accurately?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112180202.324504-1-florian.fainelli%40broadcom.com
