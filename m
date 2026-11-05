Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=84.16.241.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793915516;
	b=yHAQYcWVC6s8F/4Bp2QMAqI38Ek7lKjjvCGOm4exmNyh8Wjjt1Z25IY4kBcEWjK0J+44
	 qCdhp8Bv/5xY8328AfxGXsuSKoDyL310ijXXa7w30ONGM7ieMGl22wMBrI0A95y+A88ID
	 Fmj6c65Tfn8TEDjmqBaGlV8lMYwpkj/lhSnZn8IpUwo+tYJ00G4m0INzSI8TysSll/cQN
	 jDMPiVNpzyqWU6I9a6C8Sg87uu7hvC0Wj4sAf1EACmh27hajkr3hHkmzxu8L5zvEMmBNg
	 EE6lndKZ500vvKFi2R0CkjAZzkK4nQ/KkurrppYKw1Qp1aMPtFlsgNTqZ6WrSbb7lIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793915516;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=JyvKj/BvlW8+6fz7K9+CtTrZqOGel4PT34AP4CpOPD8=;
	b=zOfxMZ+i7LLLxdLT50Deh+5vn96n4+XZ+9NgH3rVIwUD6VUIfsaQGz5Y1X68w3mn5VL2
	 7SeEHNaefHE/IoyIIih4dEXoVZRcuVPpN5O+WTL90Cfd/QcnUXeiHaz16WKz10S6qBbcO
	 G/5j0rh7ul7Zf/MKJkkBex1544NQVWO8x68W6dj3q++uVzz7u2JKiVAPNMXWAzqevXfTB
	 vVC/njn4QKrseCPlO3/qcVeq0fwYTicALTJ3hVpeAiEesL6x4kIOeyvosxON+byB/IRl0
	 eD2pnm6NKsuaCHaWkdMZ3Av/k0H7cvscXdIns1xJtrP26qRlNG5DFHtZjEAoxNfmO9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=svanheule.net;
	spf=pass smtp.mailfrom=svanheule.net;
	dkim=pass header.d=svanheule.net header.i=@svanheule.net header.a=rsa-sha256 header.s=mail1707 header.b=xvR0GAZF;
	arc=none smtp.remote-ip=84.16.241.116
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CF1606A334
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:51:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29CF1606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=svanheule.net header.i=@svanheule.net header.a=rsa-sha256 header.s=mail1707 header.b=xvR0GAZF
Received: from [IPv6:2a02:1812:1620:5d00:3b08:a3e3:d87d:2eff] (2a02-1812-1620-5d00-3b08-a3e3-d87d-2eff.ip6.access.telenet.be [IPv6:2a02:1812:1620:5d00:3b08:a3e3:d87d:2eff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 1BD4E9D45B4;
	Thu,  5 Nov 2026 22:51:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1793915507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JyvKj/BvlW8+6fz7K9+CtTrZqOGel4PT34AP4CpOPD8=;
	b=xvR0GAZFd5UZrfDKoeb5LNCdGHKkHjtkJwUiEr9kML+RBGjytpaVxAxkRIFb3VszzLoneh
	YWSB3cpehSojWjYoJhKx7BSMJAbhQJycPS/0+WWfkPZ91UukPU8oVgLYyFykAxTgghMxvr
	w5phmvTYa2fwCYhqT7gEZwIuzvm8sTtsTOj8ziNacs2kA+dZ37i+di/y/1TOm7nFSwQunZ
	cxFw58GSKZB4qlhiee81zGVNtOKwAMelO7rS1L7icKRsv3nziJ+dtCS2kgiT3Xy+KtnhNP
	wsc+eObk7Ch0IhupGxuiT5HACQxlD7/DmZBmp7ZUiNbEcrGEzW6eYabJewtJ6A==
Message-ID: <f67e328bcd20f405f2f15c62123bf3e0e740c14f.camel@svanheule.net>
Subject: Re: [PATCH net-next 3/4] net: pse-pd: realtek-pse-mcu: configure
 global power budget
From: Sander Vanheule <sander@svanheule.net>
To: Jonas Jelonek <jonas@jonasjelonek.de>, Oleksij Rempel	
 <o.rempel@pengutronix.de>, Kory Maincent <kory.maincent@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet	 <edumazet@kernel.org>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni	 <pabeni@redhat.com>,
 netdev@vger.kernel.org, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Russell Senior
	 <russell@personaltelco.net>
Date: Thu, 05 Nov 2026 22:51:45 +0100
In-Reply-To: <20261103220312.860629-4-jonas@jonasjelonek.de>
References: <20261103220312.860629-1-jonas@jonasjelonek.de>
	 <20261103220312.860629-4-jonas@jonasjelonek.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Jonas,

On Tue, 2026-11-03 at 22:03 +0000, Jonas Jelonek wrote:
> Use the optional VMAIN regulator power budget to configure the MCU's
> aggregate PoE power limit during probe. Quantize the available budget to
> the protocol's 100 mW units and reserve exactly that amount through the
> regulator core.
>=20
> The regulator budget represents the usable PoE allowance. Program zero
> reserved power so the previous firmware guard band does not further reduc=
e
> that allowance.
>=20
> Require a finite budget of at least one protocol unit when vmain-supply i=
s
> provided. Program the budget before selecting dynamic power management an=
d
> ungating the ports, so enforcement starts with the regulator-derived limi=
t.
>=20
> Enable VMAIN before hardware initialization and register one managed clea=
nup
> action to free any reserved budget and release the enable reference on pr=
obe
> failure and driver removal. Record each successful reservation immediatel=
y
> so subsequent initialization failures are covered by this action.
>=20
> Read the current budget index before programming the MCU. Retain the
> programmed MCU limit on probe failure and driver removal, as reducing tha=
t
> limit to zero would interrupt ongoing power delivery.
>=20
> Boards without vmain-supply retain their existing firmware-managed
> budget.
>=20
> Signed-off-by: Jonas Jelonek <jonas@jonasjelonek.de>
> ---

...

> =C2=A0
> +static int rtpse_mcu_get_global_budget_idx(struct rtpse_mcu_ctrl *pse, u=
8
> *budget_idx)
> +{
> +	struct rtpse_mcu_msg req, resp;
> +	const struct rtpse_mcu_opcode *opc;
> +	int ret;
> +
> +	opc =3D &pse->dialect->opcode[RTPSE_MCU_CMD_GET_POWER_STATUS];
> +	if (!opc->valid)
> +		return -EOPNOTSUPP;
> +
> +	rtpse_mcu_msg_init(&req, opc->op);
> +	ret =3D rtpse_mcu_do_xfer(pse, &req, &resp);
> +	if (ret)
> +		return ret;
> +
> +	if (resp.payload[4] > 0x7)
> +		return -ERANGE;
> +
> +	*budget_idx =3D resp.payload[4];
> +	return 0;
> +}
> +
> +static int rtpse_mcu_set_global_budget(struct rtpse_mcu_ctrl *pse, u8
> budget_idx,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u16 budget_raw)
> +{
> +	const struct rtpse_mcu_opcode *opc;
> +	struct rtpse_mcu_msg req, resp;
> +	int ret;
> +
> +	opc =3D &pse->dialect->opcode[RTPSE_MCU_CMD_SET_GLOBAL_BUDGET];
> +	if (!opc->valid)
> +		return -EOPNOTSUPP;
> +
> +	rtpse_mcu_msg_init(&req, opc->op);
> +	req.payload[0] =3D budget_idx;
> +	put_unaligned_be16(budget_raw, &req.payload[1]);
> +	put_unaligned_be16(0, &req.payload[3]);

You don't want to configure a guard band? Can this lead to flapping of devi=
ces,
where a port is rapidly switched off and on by the consumed power going abo=
ve
and below the power limit?

> +
> +	ret =3D rtpse_mcu_do_xfer(pse, &req, &resp);
> +	if (ret)
> +		return ret;
> +	if (resp.payload[0] !=3D budget_idx || resp.payload[1] !=3D 0)
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +static int rtpse_mcu_apply_global_budget(struct rtpse_mcu_ctrl *pse,
> +					 struct regulator *vmain)
> +{
> +	int budget, ret;
> +	u16 budget_raw;
> +	u8 budget_idx;
> +
> +	budget =3D regulator_get_unclaimed_power_budget(vmain);
> +	if (budget =3D=3D INT_MAX)
> +		return -ENODATA;
> +	if (budget < 0 || budget > U16_MAX * RTPSE_MCU_GLOBAL_BUDGET_LSB_MW)
> +		return -ERANGE;
> +
> +	budget =3D rounddown(budget, RTPSE_MCU_GLOBAL_BUDGET_LSB_MW);
> +	if (!budget)
> +		return -ERANGE;
> +	budget_raw =3D budget / RTPSE_MCU_GLOBAL_BUDGET_LSB_MW;
> +
> +	ret =3D regulator_request_power_budget(vmain, budget);
> +	if (ret)
> +		return ret;
> +	pse->requested_budget_mW =3D budget;
> +
> +	ret =3D rtpse_mcu_get_global_budget_idx(pse, &budget_idx);
> +	if (ret)
> +		return ret;
> +
> +	/* Retain the programmed MCU limit even if later probe steps fail. */
> +	return rtpse_mcu_set_global_budget(pse, budget_idx, budget_raw);

This index is different from an earlier version of this patch, no?=C2=A0

My (old) documentation [1] describes the retrieved index as:
    "Last updated PSE device ID. Also the PSE device the budget belongs to.=
"

I'm afraid I don't remember what I meant with the second part, but I suspec=
t the
power budget needs to be configured on all PSE devices. Does this work
consistently on switches with multiple PSE chips? If "last updated" means i=
t
might sometimes return a lower index, I'm worried this might also lead to s=
ome
cases where you query the MCU in the middle of an update cycle.

Otherwise this looks okay to me. I'll try to test it over the weekend.

Best,
Sander

[1] https://svanheule.net/switches/software/broadcom_poe_control_protocol#g=
et_power_statistics
