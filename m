Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855358;
	b=z0UY7K4LP06ihGGsB7ZFcZVk7eIMJ8bkmW1ICe32hvUyKTYS2YuNtyRqmjC0z8Gzig2j
	 ys7NVmdV3AiZu+WiuJEf4DvPD1UB3aTJAba384Ijf6qjbAgyNK7tew+YqN3P9q5v35+f5
	 jJkLw6xDWtHaTvyLA7+ppeXq0K1LsFSGlGeyKA91484YPM9HPb4yE6btoBEvCcdInp1TC
	 PYp8hJwkOTRX5EapUafdApRbRFl3o1vo70vPBjHkD/OvmmkCX9jXAZdmrpZIJhuiXB6j1
	 zsAIU8ZUKytMVMO71fx/l1FsnBNKtpECmMMU8k62tKFBfOkJpVVkIhFqvOc4XafrWbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855358;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=e5Ei/FaRzOMLTy8hcSIPrOgugXsKPdaHkiVIDTwmXLM=;
	b=ihyRJt76W0GgSDrqKQZV3tBwNA3UMBTxi72orKqe7QbJdAos0sIHVLR88g7G4XokDgL0
	 Fd9yyNNhDAmiL/we0yGmz8uGM/5W/1umEH7M58lFDwhQHNd201Fl9//jnAODDgOsPFAvL
	 iJLXqFVwWK/J1AwNkpNSt2AQ2iZDAxd2m1dqhQzCgjp9Pc7RYoAupipvdLIf59YM4aM2j
	 nhKBDv9eN44ZxeruupOXcTMAl90l/jQg79Y7eyG0pxr60NgWlpvRZlq2yclpsxjDj5Lj+
	 KB/PH5E/hzi1boPrToTfopKXmAbPIJ41lPS9atAmehJ81bE13PwSUbpYUbesFxEnZmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S8WmW1CT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8823D606A881;
	Mon, 16 Nov 2026 18:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S8WmW1CT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A1611F000C4;
	Mon, 16 Nov 2026 18:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794855358;
	bh=e5Ei/FaRzOMLTy8hcSIPrOgugXsKPdaHkiVIDTwmXLM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=S8WmW1CTSBiLGU2JSR9WDm22omk7GyLKNJEtcWINNG/jVYBdkdIHXwrH6qYfuD8/+
	 94Zz9FtlqYiE1eSF14oSrYIXDNsN6/4WFqH9atA3mL5aEu53i0OecgnMvXiF75TpQX
	 1l+VvblRfPA9eKNPBrDDiRDbIQZEt/vxzZ/+cKm4SJqY1BRHpfOlYJBhKQQ/xSaVGl
	 NS0gX939YtONC+wC3vJSNpt9LU3baEr7WK5Ns3CXTTus1aEQeLgahsvJNS5durV2UZ
	 j6hmz6HgLllZWh3Jj4xcSKG3dNStFnnDhBZwUDYF+wB8eBsDEOkzcyM3Vyk2qZH0fW
	 MKFAcdl1MfxUg==
Subject: Re: [PATCH net-next v10 08/12] net: dsa: realtek: rtl8365mb: use raw
 VID for PVID on family D
From: netdev-bot+sashiko@kernel.org
To: namiltd@yahoo.com
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alvin.sipraga@analog.com, gusfmora@gmail.com, kuncy7@gmail.com,
 fabianotassotti@gmail.com, gabonpivovich@gmail.com, contact@c127.dev
Date: Mon, 16 Nov 2026 18:55:56 +0000
Message-ID: <179485535671.3136.12858129949728945036@kernel.org>
In-Reply-To: <24c9870b-1991-4817-90a4-e41c5bcac09d@yahoo.com>
References: <24c9870b-1991-4817-90a4-e41c5bcac09d@yahoo.com>
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

- [Low] The kernel-doc of the new rtl8365mb_vlan_port_reset_pvid()
  (drivers/net/dsa/realtek/rtl8365mb_vlan.c) gives two reasons that…
- [Low] net: dsa: realtek: PVID helpers use rtl8365mb_is_d() instead of
  family ops

--

net: dsa: realtek: rtl8365mb: use raw VID for PVID on family D

This patch changes the rtl8365mb PVID helpers so that, on family D, they
use a raw 12-bit VID in the per-port register at 0x0700 + port, because
family D has no VLAN MC table. It also adds
rtl8365mb_vlan_port_reset_pvid(), which rtl8365mb_vlan_setup() calls to
clear the family D PVID registers at setup time. Family C behaviour is
meant to stay the same.

> diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
> index 07e0486060ff0..1c2a998695d6d 100644
> --- a/drivers/net/dsa/realtek/rtl8365mb_main.c
> +++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
> @@ -2420,6 +2420,15 @@ static int rtl8365mb_vlan_setup(struct dsa_switch *ds)
>  	int ret;
>  
>  	dsa_switch_for_each_available_port(dp, ds) {
> +		/* Start every port with the neutral PVID */
> +		ret = rtl8365mb_vlan_port_reset_pvid(priv, dp->index);
> +		if (ret) {
> +			dev_err(priv->dev,
> +				"Failed to reset PVID on port %d\n",
> +				dp->index);
> +			return ret;
> +		}
> +

[Severity: Low]
This still dispatches on rtl8365mb_is_d() inside the family C helpers.
rtl8365mb_vlan_port_get_pvid() now holds two implementations that share
nothing but the signature. rtl8365mb_vlan_pvid_port_set() and
rtl8365mb_vlan_pvid_port_clear() each start with an early return into a
_direct variant. rtl8365mb_vlan_port_reset_pvid() is a no-op unless the
chip is family D.

Luiz raised these points on v7. He asked why rtl8365mb_vlan_setup()
needs a separate reset helper when the PVID clear path already exists.
He asked for rtl8365mb_vlan_port_get_pvid() not to lump both families
into one if/else. He pointed out that VLANMC index 0 is a driver
convention (VID 0) rather than a hardware neutral PVID. He also said
the _direct suffix is not meaningful, and that family-specific
implementations with the same signatures would be cleaner. I don't see
these points addressed or answered in this version.

v10 already moved vlan_4k_read()/vlan_4k_write() and the l2_* entry
converters behind callbacks in struct rtl8365mb_family_info. Could the
PVID get, set, clear and setup-time reset go through the same family
ops, with separate family C and family D functions? That would also
avoid adding another rtl8365mb_is_d() branch to each of these helpers
when the next family shows up.

If there is a reason to keep the branches as they are, could you reply
to the v7 comments or note it in the commit message?

[ ... ]

> diff --git a/drivers/net/dsa/realtek/rtl8365mb_vlan.c b/drivers/net/dsa/realtek/rtl8365mb_vlan.c
> index bf1a6a9916114..7d805c6ab5837 100644
> --- a/drivers/net/dsa/realtek/rtl8365mb_vlan.c
> +++ b/drivers/net/dsa/realtek/rtl8365mb_vlan.c

[ ... ]

> @@ -773,14 +782,51 @@ int rtl8365mb_vlan_port_get_pvid(struct realtek_priv *priv, int port, u16 *pvid)

[ ... ]

> +/**
> + * rtl8365mb_vlan_port_reset_pvid() - Put a port's PVID in its neutral state
> + * @priv: realtek_priv pointer
> + * @port: the port number
> + *
> + * On family C the neutral PVID is VLANMC index 0, which is the reset value, so
> + * there is nothing to do. On family D the PVID is a raw VID in a per-port
> + * register whose value after reset is not defined by the driver (it may come
> + * from the hardware default or from an EEPROM), so clear it to 0.
> + *
> + * Context: Can sleep.
> + * Return: 0 on success, or a negative error code on failure.
> + */
> +int rtl8365mb_vlan_port_reset_pvid(struct realtek_priv *priv, int port)
> +{
> +	if (!rtl8365mb_is_d(priv))
> +		return 0;

[Severity: Low]
The two halves of this kernel-doc don't seem to agree. Family D gets
cleared because its value after reset "may come from the hardware default
or from an EEPROM". Family C is assumed to be at VLANMC index 0 because
that is "the reset value".

The file header in rtl8365mb_main.c says the EEPROM applies to every chip
the driver handles:

 * The EEPROM contains initial register values which the chip will read over I2C
 * upon hardware reset. It is also possible to omit the EEPROM.

Both families also use the same PVID register block:

#define RTL8365MB_VLAN_PVID_CTRL_BASE			0x0700
...
#define RTL8365MB_D_VLAN_PVID_CTRL_BASE			0x0700

Is there something that prevents the family C MCIDX fields and VLANMC
entries from being loaded from EEPROM as well?

Suppose a family C EEPROM programs a non-zero MC index and a matching
VLANMC entry. Then rtl8365mb_vlan_setup() leaves it in place, even though
its comment says "Start every port with the neutral PVID". Later:

rtl8365mb_port_vlan_filtering(ds, port, true, ...)
    rtl8365mb_vlan_port_get_pvid()
        -> returns the stale vlanmc.evid
    accepted_frame = RTL8365MB_FRAME_TYPE_ANY_FRAME;

Wouldn't that accept untagged frames on a port the driver never
configured? The commit message gives this same case as the reason to
clear family D.

Family C never cleared these registers before, so "No functional change
for family C" is accurate. The final tree in the series still returns
early here for family C.

Could this either write MC index 0 for family C too (index 0 is
documented as the reserved neutral PVID), or explain in the comment why
the family C PVID registers are known not to be loaded from EEPROM?

> +
> +	return regmap_update_bits(priv->map,
> +				  RTL8365MB_D_VLAN_PVID_CTRL_REG(port),
> +				  RTL8365MB_D_VLAN_PVID_CTRL_MASK, 0);
> +}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/d9da17af-f49e-4878-a8dd-59a8919e6930%40yahoo.com
