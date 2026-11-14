Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794655539;
	b=Y95IwmWbZUMLev0C517UCBHs6FBH0qTupKKGpB5/dYa7r3NaSNZMlgl8OnhHIEzzm+0W
	 tiPPAuNjulGl4MDL1qKQyNjy5l+9ziW7f3h6FQtarqUUYnNzCubtLJXvk07stO2iQHh/G
	 yd9xh5b+tkS1Hd5YB4gTt8gz8IziARdvVqS25NiLN3a6eLEsNsQYNXKIgN1B+VPcd83lR
	 ggH4F+hOLJTIruKKWuFjXe8/d0YRfGDXuVyJLb6ssWRhI7FnP7nq7GWljXBErDDryZpae
	 cJov8XRrIroUWaqFcupq3F3zqovktylCzNhqTJrn2bWtbtqaNn9BoMVgoj8HcdYcVng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655539;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=4eKOGVbqcbO2J+lZ/HT16uw5nka7xe8u+7fHYo1uQRQ=;
	b=c9dNphCbhCfdZhWVVNk7XcIp2sXYIYnc04lvSkytIHGiRPxWGKg3wRdxusdfR3UXNvIi
	 jRGYJhmpXUMIc7pP9gJ1xF3aNA93XmkAhhuO/Htm+PiBPrv2BAnX1WezhT3J0MV3Q3shq
	 S0i3T4jTAVUjdVy08mFMiIUrkT0id4vi/JsciWZGg81uFavT2cX3McBn9dk/c5OJC9e4i
	 9jY94iMQy2MHMgRIjIMjDQVoWdWuBqUj6bmlUYg2QWyEoKYuJE8z9RfKx31wdJ6/Lc227
	 sWc6J+LBdQh4pHToNlgYMUf+8bzUYEePw9VqezpvMGXqz7uwJcqvEnM2RW4DBJOcyuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ftop1jhn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7B8606A33B;
	Sat, 14 Nov 2026 11:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ftop1jhn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D71A1F000C4;
	Sat, 14 Nov 2026 11:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794655539;
	bh=4eKOGVbqcbO2J+lZ/HT16uw5nka7xe8u+7fHYo1uQRQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ftop1jhnfpGxoXOk5SafmD7l5cno+NOfBuh2yQnjhuUFaLB7KH0iYmilpAkHVnRyj
	 i5zW+d9+caDvJ7dRwAmcsbwX3ajSem669v/yJlIjieGxsiM16tSkCh8FSodQ5A6cki
	 +VRVFP0jsLYyZK8kV81+PcHk5dd6a6PHNYlWXlFB5VMJom1fY0pNqaCzQtjmFN1tF3
	 JP1/dzoeGDd3MnviR7hmeFiMAs/EauKrCw90xAWoz1WY74g6H6z8O0jOJ7QXbiR2Jh
	 0CWfWovMbsmEsy86MKABMupkxti2yALrS49ZZ/l5ThcfYHi+Jl0JTN0dP7SooTTLdV
	 KjiuJ8bS5A3eg==
Subject: Re: [PATCH net-next v4 4/4] net: phy: dp83867: support setting
 output-impedance
From: netdev-bot+sashiko@kernel.org
To: s.trumtrar@pengutronix.de
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 afd@ti.com, andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
 michal.simek@amd.com, edumazet@kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Date: Sat, 14 Nov 2026 11:25:38 +0000
Message-ID: <179465553811.2199510.12732274072788992215@kernel.org>
In-Reply-To: <20261110-v7-2-topic-dp83867-v4-4-a268f83b1ec1@pengutronix.de>
References: <20261110-v7-2-topic-dp83867-v4-4-a268f83b1ec1@pengutronix.de>
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

Critical: 0 · High: 0 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The new 'ti,output-impedance-ohms' property turns an absolute
  ohm value into a fixed IO_IMPEDANCE_CTRL code with a straight line: 70…
- [Low] After this patch dp83867.c holds two conflicting descriptions of
  the same IO_IMPEDANCE_CTRL field.
- [Low] In dp83867_of_init_io_impedance(), the comment '/* If no nvmem
  cell, check for the boolean properties.

--

net: phy: dp83867: support setting output-impedance

This commit adds support for a ti,output-impedance-ohms devicetree
property to the dp83867 driver. A value in the range 35..70 ohms is mapped
linearly onto the 32 IO_IMPEDANCE_CTRL codes, and values outside that
range fail with -ERANGE.

> diff --git a/drivers/net/phy/dp83867.c b/drivers/net/phy/dp83867.c
> index a3cd5cb11ea0a..ca668e75f0c99 100644
> --- a/drivers/net/phy/dp83867.c
> +++ b/drivers/net/phy/dp83867.c

[ ... ]

> @@ -553,12 +557,29 @@ static int dp83867_of_init_io_impedance(struct phy_device *phydev)
>  						"failed to get nvmem cell io_impedance_ctrl\n");
>  
>  		/* If no nvmem cell, check for the boolean properties. */
> -		if (of_property_read_bool(of_node, "ti,max-output-impedance"))
> +		if (of_property_read_bool(of_node, "ti,max-output-impedance")) {
>  			dp83867->io_impedance = DP83867_IO_MUX_CFG_IO_IMPEDANCE_MAX;
> -		else if (of_property_read_bool(of_node, "ti,min-output-impedance"))
> +		} else if (of_property_read_bool(of_node, "ti,min-output-impedance")) {
>  			dp83867->io_impedance = DP83867_IO_MUX_CFG_IO_IMPEDANCE_MIN;
> -		else
> +		} else if (of_property_read_u32(of_node, "ti,output-impedance-ohms", &val) == 0) {

[Severity: Low]
This isn't a bug, but the comment above still says "check for the boolean
properties". The block now also reads the u32 ti,output-impedance-ohms
property and can return -ERANGE. Could the comment be updated to match?

> +			if (val < DP83867_IO_IMPEDANCE_MIN_OHMS ||
> +			    val > DP83867_IO_IMPEDANCE_MAX_OHMS) {
> +				phydev_err(phydev, "'ti,output-impedance-ohms' contents out of range\n");
> +				return -ERANGE;
> +			}
> +			/*
> +			 * 0x00 = 70 ohms ... 0x1f = 35 ohms. The datasheet
> +			 * does not specify the settings in between, map the
> +			 * range linearly to the nearest one.
> +			 */

[Severity: Low]
With this mapping, 50 ohms becomes 0x12 and 0x0f is about 53 ohms. The
non-OF dp83867_of_init() in the same file still says something different:

	/* Per datasheet, IO impedance is default to 50-ohm, so we set the
	 * same here or else the default '0' means highest IO impedance
	 * which is wrong.
	 */
	dp83867->io_impedance = DP83867_IO_MUX_CFG_IO_IMPEDANCE_MIN / 2;

So after this patch the driver has two descriptions of the same field. A
nominal 50 ohms programs a different code depending on whether
CONFIG_OF_MDIO is enabled.

The commit message mentions this mismatch, but both the comment and the
two values are left as they are. Should the two paths agree, or should one
of the comments say that its value is only approximate?

> +			dp83867->io_impedance =
> +				DIV_ROUND_CLOSEST((DP83867_IO_IMPEDANCE_MAX_OHMS - val) *
> +						  DP83867_IO_MUX_CFG_IO_IMPEDANCE_MASK,
> +						  DP83867_IO_IMPEDANCE_MAX_OHMS -
> +						  DP83867_IO_IMPEDANCE_MIN_OHMS);

[Severity: Medium]
Can a fixed linear formula give the requested impedance on a given chip?

Commit ab1e9de84aff ("dt-bindings: dp83867: add binding for
io_impedance_ctrl nvmem cell") says the IO_IMPEDANCE_CTRL reset value is
"factory calibrated to a value corresponding to approximately 50 ohms".
It also says:

  There is no fixed mapping from register values to values in the range
  35-70 ohms; it varies from chip to chip, and even that target range is
  approximate.

That is why a per-board nvmem cell was added then, rather than an ohms
property.

With this patch, ti,output-impedance-ohms = <50> computes 0x12 on every
part. dp83867_config_init() then writes that code over the factory-trimmed
value on each probe, resume and soft reset:

	/* If specified, set io impedance */
	if (dp83867->io_impedance >= 0)
		phy_modify_mmd(phydev, DP83867_DEVADDR, DP83867_IO_MUX_CFG,
			       DP83867_IO_MUX_CFG_IO_IMPEDANCE_MASK,
			       dp83867->io_impedance);

As a result, the RGMII output impedance can differ from the requested ohms
from one chip to the next, and no error is reported.

If the binding description for ti,output-impedance-ohms also documents
this linear mapping, the ohm semantics become DT ABI that the hardware
cannot guarantee.

Would a raw register code property work better here? Another option would
be to document the ohm value as approximate and keep the reset value as
the 50 ohm point.

> +		} else {
>  			dp83867->io_impedance = -1; /* leave at default */
> +		}
>  
>  		return 0;
>  	}

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261110-v7-2-topic-dp83867-v4-0-a268f83b1ec1%40pengutronix.de
