Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792680111;
	b=G7qxzl81u1jZtPEsY78OQtDyffdpnpzLFTj0UDgQinqB12SBEi74m1YWF3i37vtzmeER
	 Fjd/rTF2UwC3ZLL4ZQocU5bb7Jr/p2mNcAFsChh18qmbOBC5sD/F8Chjgx+UvoZlDDwre
	 XsR6cd4lP2P//7iyDH0ELq7TWjzonDqwcdJ5KG2u5pohKnQHZ4L2gP9a/Y1Dm9rtyOENf
	 uSdO7R3cgl3Vt1XUiQjQLOuzkZK4lHw5ihlrazi6nqefnL5R6CLTJdRCNViijCBt5LB+O
	 fv5YbwaIMIcNoDu4NrM3QVfyxLG5wLIv8/sIJLT0TbWnlvxbkMYCECRlOuTfjybrP7w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792680111;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=dSDh+9O/xetrecos0iU+4Fv5r+zKEOgXOLe1b/YsqR8=;
	b=3zFvZDgxSz94MEXpQ1+X8ekvz3jE3hfPFOyH/luo18wmON7kQ2eCbEH5PeLz3oLA68fS
	 MnVtIv72LD+AHhAC72iWGlk2V2l/2WK2Xdgu2uqq8KlBpCNG1oO6uWnp9fQkoELTD2Zwy
	 Cdu/MONYhZ0SWIicMlEpWNJ2yC4GQCWw3H5WD1wVqXO7exaTYwB/bNee9UhXufgyb59HS
	 ptFTbx2GH538jwOmTG6tmbzXWFjSxXuc++7yxPeylymHgRYsy7OqWzvQU8kfecC5um/HK
	 NV0RkmslTfzvy+NXkijbR9xgvAcK4n4U3j0nZJ+WFwuDFVsR6b+qFYYS45qNo+qP/Aw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=bepmSuHo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47361606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:41:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47361606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=bepmSuHo
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 7540D2008F0;
	Thu, 22 Oct 2026 16:41:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792680108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dSDh+9O/xetrecos0iU+4Fv5r+zKEOgXOLe1b/YsqR8=;
	b=bepmSuHoL8+3Qm6NjpSEbrqCVV9L4dnRqkmHUCXRqzVH8KtttV36LumURIAL1dY0opZtlo
	drgrye2KkABEBHsx6vVqd3McFvgR8S3ai6MiF3O256OsyFOlscX17sV7TCxCUuE3bWc0NL
	Gx+G7d6OI5R5PG78SP4EE9WJMBL9jsVhPi8dX3N/ChuBd0cjWn3g4UqXYx70wdnEPQfg+x
	Ywio3y3V7CgI4o3AI/uNBVWNk+wbNlC5VKUrhu6hmwrXzi1QIxTyLy3tcFFcu5xjOMeeRT
	4A8JC/wnsrX+FKgd+yitp0ZnS5h/TKtRp2Rxc7zsOoqUsb/r5KX2MSUE7JJqJw==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1792680108; a=rsa-sha256;
	cv=none;
	b=OOEwosMBsNH/ESho3mqUyOqa+hK0KNiCJGEo+d7qs1fhGDtcKWZcX2uPv9XEmCjpi+Lg3f
	tcvRSS0iZBByJ3M715UrHj1MUrQAkuA2JLLPgcNnv00Czy9P2QpBq4cRMokjcvzZEjNz6p
	x64u4PicPBwbeVOAdfobbBYudTvWk06UkdEsC7avj4rplnbRpFk/srHX8ZOuhXxV1Gu2Pr
	opngWHqUI6V0hNyQwx6lx4XA581In8zFvAfJRNiekM3j7QDBsimL0bKLXYiF4mnhSeAtLv
	pFJXe4fKJJSA+0d9haDuLkIW3qk9rtc9d2/AGl6uKiTuVDu7IWUkItRB15aMuA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792680108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dSDh+9O/xetrecos0iU+4Fv5r+zKEOgXOLe1b/YsqR8=;
	b=OGJoRtSxhXh4eRWd0TXd2KXD+2Nfa8+6OLryGWyaa+mHtbH8J1CdwMOWiZm61xIN9a2jp1
	CHDNd6F5RGcIzpBiD0J+Wa1FnR0zR7/9RrNJKghS1t7d+4/4oqC+In0ALeTom5dgUTSN8t
	s6GJbe2hgKR6zDjACgscYScsY/rAXHdSdwrcC0EiG8igHWD3/3RqBnaho1KVooBntlcAhw
	7BxnAFY4iqQDGw6DkXulTmXs4noziXtpeFD3VGPUhgPBlaYZRXUtfAMNJYVoU9oZza2f8q
	igURKCIXhU26NBpkwdAYmpbFWEENW6lS1GK8zboYrtVZ3uZ7eZWmwGPo3WNkqQ==
Message-ID: <5caae686a2ef9787cc12840beb6fa10b948a47c2.camel@pengutronix.de>
Subject: Re: [PATCH v3] reset: core: Serialize concurrent deassert/reset of
 shared resets
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: shengjiu.wang@oss.nxp.com, krzk@kernel.org, hansg@kernel.org, 
	linux-kernel@vger.kernel.org, broonie@kernel.org, alvin.sipraga@analog.com
Date: Thu, 22 Oct 2026 16:41:48 +0200
In-Reply-To: <CAA+D8ANcekkPnB-N_uH12NYxz7omxciAgMW+NL4uakXdGc13ww@mail.gmail.com>
References: <20261021030925.3543841-1-shengjiu.wang@oss.nxp.com>
	 <ef5277d07f977a82030b1e61ef8db2609a5d6aa1.camel@pengutronix.de>
	 <CAA+D8AMQ+yExGtpRkTpL0g1AQ-tarF_fUsNj5HsghmF+nGNhzQ@mail.gmail.com>
	 <CAA+D8ANcekkPnB-N_uH12NYxz7omxciAgMW+NL4uakXdGc13ww@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Do, 2026-10-22 at 21:31 +0800, Shengjiu Wang wrote:
> >=20
[...]
> > > In short, do you have an opinion how (far) this should be backported,
> > > and does this warrant some Cc:stable tag?
> >=20
> > You are right that this is only a partial fix for 0b52297f2288, and tha=
t
> > reset-gpio did not exist back then. Since the race is latent - it is on=
ly
> > reachable once a shared provider whose ops sleep exists (reset-gpio bei=
ng
> > the first) - and since the patch would not apply before 8c91302a29bc1
> > ("reset: protect struct reset_control with its own mutex", v7.1) anyway=
, I
> > would like to drop the Fixes: tag and Cc: stable for v4 and present thi=
s as
> > a correctness improvement to the shared-reset locking. Anyone hitting i=
t on
> > an older kernel can backport by hand. But let me know if this is accept=
able.
>=20
> Hi Philipp
>=20
> Do you think is it ok to drop the fixes tag?

I think so, yes.

regards
Philipp
