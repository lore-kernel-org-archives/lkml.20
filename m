Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794836990;
	b=xgiqT919StIHPpmdW/yKdFlov375s/o+DxRF7GpT3pOoNU3XjwlKi9tlXpA2LFgW2aWc
	 asiNm/o8lRjIitV6BIGgKQhPB5yxOvybS/l00vXPWUNietI8BMHnMVBIc1Qjl8XYI1+7I
	 jqPpfOEtGbziAlQ94CxoDjAszoCf02mQrF0FB90+ap+xXXe7yK9sKHk+PPDp8HyyrQlCe
	 ZdasIZ653hWqfZ53KwloQORuMW8fg/kIEotYU481Ew8GihMSNxLOOkbmpzY9YW1O0l9b4
	 gsbi35Fcw97hSEZopAk0kfCxOdjkHcgTI/cl/pQ7vrzt3wj15NTmgVqDq8Zc2/KW9SQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794836990;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=gdx6G54EaavkSa2IIFB+Zk19zOXBn7Mab2x0vdfXTYw=;
	b=Zc7uDfy24BEVDvgenZpLG6pNPbrK1xBJCk8wV/dMx+vkjcM4U2osKex/nVFiwOCpcGRT
	 iBZTmH5hh9xyhpdR6q1YsOVDq+LOFE1yBXK4Uqpr7O7m5qeHmllrvXL8hkOsiJ2/tXp6s
	 EDryFyP59d3azl8avBAfzo3lExmaQB+PMIV95ElLZhKNRenG+2AIP/ay9QVYj3QrexPMo
	 Esc+xSuHRjCtcLENBkCR+36ONpVuvBko6JZ3g+vV/Jmkos1U3UbWBW+yXrr2a7/9HVUt+
	 CAsgQy1qicuDGc3nCJhaMBN7BlgKaqDNQTszJX6xIdL49aY0PBnTduBUFbtWnrtAGjg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=f+EumINX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE98606A32A;
	Mon, 16 Nov 2026 13:49:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DE98606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=f+EumINX
Received: from ptx.office.stw.pengutronix.de (ptx.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::109])
	(Authenticated sender: relay-from-ptx.office.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 40A0E201D0E;
	Mon, 16 Nov 2026 14:49:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794836986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gdx6G54EaavkSa2IIFB+Zk19zOXBn7Mab2x0vdfXTYw=;
	b=f+EumINXHo2I+vkH67roUUxoUbagAf22Zz5nQHK5JHpu24cuao5TdzojXMj9XaEUukbike
	lD9wIBT3j3Msar0gZtC2Snvf8lNurzXceQ3V2Sns1Oabq+5iXY1o13ySaG5sfJWRGrS+EO
	vM0GRWScmqOmAscrvHUj/b30Mu2XlTEOTJDSY3/jvsBju2KVIk8zs8HRFCvrLI5bn7/Sof
	AUE7rfPiWEY5Q/2mUr2vvXWYtW/0kedlroxEWuQxzN9uY9yapRoTy2iRK3Cf6pOCmY/xLj
	+FEYCcDmU6ZNaYZZnRBXuYMJQJ3CxzKydkgZ/QidIvtfmMfsum6FBzdDabFNNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794836986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gdx6G54EaavkSa2IIFB+Zk19zOXBn7Mab2x0vdfXTYw=;
	b=aQg3hXDcuspy+XKgStAKwOjfr+NsN9ujy32L8HjuHIUPdhlKG8jNfs22+UKsyyn5u5+twg
	2cPlKSH2qwi2ukCk6CczyD/+CVPayyxEgGEL1lNWW2Wq3+lwGW7hQnSMVGy59hxdPDcjM7
	Rwu3lamcdxqKt9dZM0WOn7F6RBqsMVdqa2W/QpGIOyfXBiUwrlrgmu7K6zbYt8HM+mq+Oh
	SSJwCeN1MFquBDMNCBoZyaNVDUx/yhOWjGJa8m00IupcxJHvN89aBfvdBDOVi+NXBRdVIG
	Tyr2htZOeUUlfxEzcIBQaJnn8MSRIpGg9iVyNHqh/GGT683l8EX1fvKNpKwGLg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794836986; a=rsa-sha256;
	cv=none;
	b=cvD+Pzqqae22c9jz8Jijkfya0rOoQ0UJqwrvfc25lMJAtlFP80X8ycHJaUZ6Ky/BVoxlpu
	hRj4MW1HlJulD7bKGFsaHqfBBlR3Sj/8z++E/GoxwOEqMqpHuO/NjkY0eJkyJoPDQzHN3l
	0gi/YdcQfeqpbOyQNKqhdrbaOkrtbs4iNjggtilQNPJh7uiun74FqCMjn+rO2zTr8n12qI
	gbCYyKlijJ5melgrkzMwZI5wmbrZ67P/gy+9cJtujBg4xntJatQVEp7Nv4HM8jtDeZfFNm
	l8+nHUz3tTuDoGNhkvsa9YD1oa7q+zWPJmDjBjtrUmkMOAS5oTc8pw83v0TqXw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-ptx.office.stw.pengutronix.de smtp.mailfrom=ore@pengutronix.de
Received: by ptx.office.stw.pengutronix.de (Postfix, from userid 1058)
	id 2A1731BFA16; Mon, 16 Nov 2026 14:49:46 +0100 (CET)
Date: Mon, 16 Nov 2026 14:49:46 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, linusw@kernel.org,
	luizluca@gmail.com, alvin.sipraga@analog.com, andrew@lunn.ch,
	olteanv@gmail.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH net-next v2 08/10] net: dsa: realtek: rtl8365mb: program
 the PCP of untagged frames
Message-ID: <avsJ-gmYVHqx48ON@pengutronix.de>
References: <20261112-rtl8365mb-dcb-ingress-v2-8-f8e6fbdf8c99@pengutronix.de>
 <179478369746.3136.10805769576309531848@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179478369746.3136.10805769576309531848@kernel.org>

On Sun, Nov 15, 2026 at 11:01:37PM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 · High: 0 · Medium: 1 · Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
>
> - [Medium] rtl8365mb_qos_set_port_prio()
>   (drivers/net/dsa/realtek/rtl8365mb_qos.c) now does two separate…
>
> --
>
> net: dsa: realtek: rtl8365mb: program the PCP of untagged frames
>
> With this patch, setting the port default priority also programs the PCP
> the switch gives to untagged frames. Under PCP trust, that value decides
> how untagged frames are classified. It is also what the switch writes into
> the tag it adds on egress.
>
> > diff --git a/drivers/net/dsa/realtek/rtl8365mb_qos.c b/drivers/net/dsa/realtek/rtl8365mb_qos.c
> > index 378cd6ed7fe64..2a849d0e4898a 100644
> > --- a/drivers/net/dsa/realtek/rtl8365mb_qos.c
> > +++ b/drivers/net/dsa/realtek/rtl8365mb_qos.c
>
> [ ... ]
>
> > @@ -192,6 +201,13 @@ int rtl8365mb_qos_set_port_prio(struct realtek_priv *priv, int port, u8 iprio)
> >  	if (ret)
> >  		return ret;
> >
> > +	ret = rtl8365mb_qos_regmap_update_field(priv,
> > +						RTL8365MB_QOS_PORT_UNTAG_PCP_REG(port),
> > +						rtl8365mb_qos_sel_mask(port),
> > +						untag_pcp);
> > +	if (ret)
> > +		return ret;
> > +
> >  	return rtl8365mb_qos_regmap_update_field(priv,
> >  						 RTL8365MB_QOS_PORT_PRI_REG(port),
> >  						 rtl8365mb_qos_sel_mask(port),
>
> [Severity: Medium]
> What happens to the untagged PCP field if the second write fails?
>
> In rtl8365mb_qos_set_port_prio(), the UNTAG_PCP write goes to the hardware
> before the PORT_PRI write. If the PORT_PRI regmap_update_bits() then fails,
> for example with an SMI ACK timeout from realtek_smi_wait_for_ack() or a
> bus->write() error in realtek_mdio_write(), the error is returned. The
> untagged PCP is not restored.
>
> On that error, the DSA core rolls back the software state:
>
> net/dsa/user.c:dsa_user_dcbnl_set_default_prio() {
>     ...
> 	err = ds->ops->port_set_default_prio(ds, port, new_prio);
> 	if (err) {
> 		dcb_ieee_delapp(dev, app);
> 		return err;
> 	}
>     ...
> }
>
> dsa_user_dcbnl_del_default_prio() does the same with dcb_ieee_setapp().
>
> After that, dcbnl reports the old default priority. So does
> rtl83xx_port_get_default_prio(), because rtl8365mb_qos_get_port_prio()
> reads back only RTL8365MB_QOS_PORT_PRI_REG. The switch, however, keeps
> using the new untagged PCP: it tags untagged frames on egress with it and,
> with PCP trust enabled, classifies them by it.
>
> Could this leave untagged frames tagged and classified by a priority whose
> request failed, with no way for software to see it, until a later set
> succeeds?
>
> Elsewhere the series avoids this kind of state. For example,
> rtl8365mb_qos_set_apptrust() batches its writes "so a failed write cannot
> leave the trusted table half programmed". Would it make sense to restore
> the previous untagged PCP when the PORT_PRI write fails, or to order the
> writes so that a failure cannot leave the two fields out of step?

Restoring the old PCP does not help here. A write can fail for two
reasons. One is a register access the regmap configuration rejects;
that is a driver bug and shows up on every call, not something to
recover from at runtime. The other is an MDIO bus error, and then the
restore goes over the same failing bus, and the state of the switch is
unknown whatever the driver does. Reordering the writes does not help
either: either order leaves one field new and one old on failure. So
v3 keeps the code as it is.

The other review comments on this series are valid, so a v3 will
follow.

pw-bot: cr
