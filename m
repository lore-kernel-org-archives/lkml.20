Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794515757;
	b=1DxJbWGexuA7a/iegS7GYzI5916BVX1pZWRrB+xFd6WUGVomtNm7MnI+nmhnxkOXj1ui
	 e+tRQiRktvt4A9cwUcTophhBZSMLNit0ng5Z3sug/DynugPtI0i3ZOBq4AAvCFT4G6/iI
	 1GAETt+cJm9OxOhHWgsXk2yUK3mB/9TX4BbtsddvKfR7KL6xTG6S+ihhMw20iaQzWg25A
	 lx48J743216spToSjK9X9JlLBL+uAZjWRhYb7ErLA2hIJFDGkHAza2tiJX4S9aDfhY6Lo
	 00lGc1F+Ajje7Y9SuZzX0pzfsJIKpccOPodOl+uL1VP7aglKeBtlnw6nAg4xCsiXttQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794515757;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6nnQnFl772x0ttUe5n0YYK5lmJ4sIS9Uyk55NkUhIc4=;
	b=bMc86FpcbsL0bXsJk1NBnYsZ5u8tTOCoFWY350619+oSXHGYvI/cjHzlnWHh3DbPhH0O
	 CcIhCxA921ry7MeeybDm96mp2J4AQ/U3UfisvUzu15hJkg+mwRK26r33Uu/0aB2C+gHfF
	 +cxTi0O+39Rab+Vaib5PH0OYuRuDTW6HRX6CanO2N9vQE5xoB6L+5e7bO0AGbV7Ni+Na2
	 0MYjIWjj1bbTVyheBZKgpITfeOFkgaW/oeG4shrVFy5l6VtrOdpO8GXT/xxE57Efpnpok
	 YmPJDinVCNJDBTgKgSVfWxXKfiR/LMhDwp1KJmRzxBAKYCkaedDsWMHXP63oCGOsJxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bcbRho79;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07328606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bcbRho79
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 944CC1F000CB
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794515756;
	bh=6nnQnFl772x0ttUe5n0YYK5lmJ4sIS9Uyk55NkUhIc4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bcbRho79og5+TrQo9mGVyPrV7+u0qubmPkZytHvLGZsm9an4QzBix04Di/VU6UVeI
	 y8mIow9HaoTxdGPzeJBHdyQytGyy7AM9YZepZrfQ/dB/qrOOtGC+lmwkDvBtiwrRfj
	 Ic3eZVTMc27Ij82dz3cDaxyApb+CVN0fsA90FYV9KXGCShqccyWQ8HUrebqOPf1V77
	 kCcP7AMu/NcbzhHfJRyOwJVvAEHvGyW46jfUgK8h+Pf58LMbxqm+ZaMqUQWF/7c/Dg
	 JL3zP5AvQFqg8LTH67rkx5LBCus/aQRR9wFnfQdePozRbZ+aCA8F1Mf/ZA5bVIGkLT
	 XhFFLamz/hhhA==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5be4a2d94adso254615e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:35:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHYMTUE3GisEiafy+lEbpVbokjLjzYv6tGeSZE6YPvFWLiavDdSm6vf5oPI+UD/914HqzazB1Fm1/r7yn8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iyyorqO06hb+tFbkToS0p4fxESXdqnnI2qre8PTou34wD3wff
	xVmnvOotgK91/lcMfQXxe/kRn7Yi11jgKmlisw1K0lxMdB7jg1jK3wEbRgy8M9z87sYAJ67Mg+z
	KNUqNkpZYBFwwPGg+AT9ZNcdbnZ2M+/0=
X-Received: by 2002:a05:6512:1192:b0:5c1:5703:46f4 with SMTP id
 2adb3069b0e04-5c1705d8515mr195706e87.7.1794515755373; Thu, 12 Nov 2026
 12:35:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-rtl8365mb-dcb-ingress-v2-0-f8e6fbdf8c99@pengutronix.de> <20261112-rtl8365mb-dcb-ingress-v2-9-f8e6fbdf8c99@pengutronix.de>
In-Reply-To: <20261112-rtl8365mb-dcb-ingress-v2-9-f8e6fbdf8c99@pengutronix.de>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 12 Nov 2026 21:35:42 +0100
X-Gmail-Original-Message-ID: <CAD++jL=EGaGXJCMGoTX-R5YU+OSU26NpbO3MBbr+yWBO0q6-yA@mail.gmail.com>
X-Gm-Features: AclHuK-MB5ZypNmDSpTL7UbjyzH-7DqQYw4we94SaKV5K5KPZVzBJ2hsaKf5r_8
Message-ID: <CAD++jL=EGaGXJCMGoTX-R5YU+OSU26NpbO3MBbr+yWBO0q6-yA@mail.gmail.com>
Subject: Re: [PATCH net-next v2 09/10] net: dsa: realtek: rtl8365mb: offload
 DCB apptrust
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Luiz Angelo Daros de Luca <luizluca@gmail.com>, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 9:38=E2=80=AFAM Oleksij Rempel <o.rempel@pengutroni=
x.de> wrote:

> Wire up port_get_apptrust and port_set_apptrust. The admin can then
> choose through dcbnl apptrust which ingress classification a port trusts
> for its priority: 802.1p (PCP), DSCP or both. A port that trusts nothing
> keeps the port default priority.
>
> In the driver's model of the hardware, the trusted priority-decision
> table is switch-wide, so all ports that trust something must trust the
> same selectors. While another port trusts a set of selectors, a request
> to trust a different set is refused with -EBUSY.
>
> When both are trusted, DSCP must come first. When PCP is trusted, the
> switch classifies an untagged frame by the PCP given to untagged
> frames. A PCP source ranked above DSCP would then hide DSCP from
> untagged IP frames. Refuse the order pcp dscp and any unknown selector
> with -EOPNOTSUPP.
>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
> Changes in v2:
> - move selector and precedence validation into rtl83xx-qos.c behind new
>   qos_get/set_apptrust callbacks; weights and -EBUSY stay here (Linus)
> - use one-hot decision weights; in the driver's model, the v1 linear
>   weights could tie PCP with DSCP (Linus)
> - define the apptrust slot order once (enum rtl83xx_apptrust_slot) for
>   the shared selector table and the backend source table
> - write the PCP and DSCP weights with one register update, so a failed
>   write cannot leave the trusted table half programmed (sashiko)
> - check that all apptrust sources share the one register that is updated
> - rank DSCP above PCP and refuse pcp dscp with -EOPNOTSUPP, because
>   with PCP first, untagged IP frames never reach DSCP

Very thorough and resolves my issues!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
