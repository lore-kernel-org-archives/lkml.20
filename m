Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794515923;
	b=eVGKyTJzE/JnoKCQizYL12ATr3b2CqTZz0h6777srHX40lxMuw+wivQ1lG7j5TcYcmie
	 DVIzqWB7eA8ne89FaRNWvGxfPQVQsPFv0esJBJbRQvHCtvftAIN8iRYteD3ZA+mwhWeVZ
	 1xYJaVIk9DPcgF6JVHis/4z0MMGfNhzm+7wOyzjVwKY6zFmWlVpX7nDr0euApIaVs+VOl
	 xGXdwB0m8O9T63ctVkmVgiJQeHOnFGLiLHJoXDmdL+lCO/vT+P02QtYWBRUQ36yf0TMU3
	 +V9QBQvWlbql12AGZxSvPyebYKT4l3agok9gPPEGLlzBmTyefw2jv9HgCrrorjX2BSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794515923;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UHwyh1PaDMDAjwwV7uw3qgkgqcgl+f6qzDOdRN7ySuk=;
	b=sYHzwkOwsCXv6DAuz1zB5JUtnmkF9vmSILhVlXtS9RS1Zg8kkReaTv0LCVk2zzTkBi5J
	 RqS3Yvlqs0WniKSyfqbkfNBAti6KlJNl+csUEJ3zWeIYXmbLdbGmArgMTPWlhf3ls3xla
	 x3QS8oBsBqSyHo5qtDEGtBtsrjo9XgL1fiinqzXadaJiY0Hfjge9S9mQ/XLjoMtMTzLSA
	 0VgP8f0jTdHVLKyt+hDHVkQLCLEOlhS0+rrkDWtO72DFXJbgteeSiNBOPGKyX20S5XWnH
	 lMwE/wEnNaAFr74QZCmboNmwyKu7WPvSFOScW7xR+ko5EcEK5f+0rcF/o5V2NQgFDjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qxyd0Lk3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCB5606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qxyd0Lk3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2C541F000CC
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794515922;
	bh=UHwyh1PaDMDAjwwV7uw3qgkgqcgl+f6qzDOdRN7ySuk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Qxyd0Lk3F4hrlwDCKcqEm2Mu08zqmKwGyq0mKcsMrIHAcpSrR6ACImHL7KEGNinjH
	 z2NyNP3eRAGIwDUaoing3kgwLmIBegZWGGacjVcV2RdP+8GNd0lEZvlKSRN3Rwjzzy
	 ezrTpTx6Q3E/uHEWhDRkFhJ5txf05NdN3p2tgcQqagHNEZBIFaArN6H2P+dJ1cPvrL
	 W+jUc7rpSRTw7Z9fjITI0d1GPMLOYSp9+fAy6lpwTmOuPTYdgBUZ3UN2m7Vo07bNwd
	 CdJwK03vTJJx84/0MjCylGQqNMXxeE61HP+i817pGF/EnmAxjfNR2J/FKliaP76b41
	 k1EXSXU3kJh/Q==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5be47aa555cso258902e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:38:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGR/r0XvDsWNytIVWd3xUp13aWG0+IN4uu6Bb2surh5+xd+f/PPdEKvFH5PXnHO328/UDxv8w8NHHjzaAQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dUstaAH0oVsC35zyuocoj/HPR3qwLvg2ckjphNFeb/zr/XCHk
	kTJZV3Zf7D1l5TzoRoYtHZ5wtTV1YN8WNIz04rjcSYuDGIeXb2wX9/odhUXFr+7qAtrOjUFG2NW
	qPNr00Ic+nvgAdao/7AYnVGGJixxBpug=
X-Received: by 2002:a05:6512:3353:b0:5bf:d347:4147 with SMTP id
 2adb3069b0e04-5c1709feeb4mr199019e87.50.1794515921695; Thu, 12 Nov 2026
 12:38:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-rtl8365mb-dcb-ingress-v2-0-f8e6fbdf8c99@pengutronix.de> <20261112-rtl8365mb-dcb-ingress-v2-5-f8e6fbdf8c99@pengutronix.de>
In-Reply-To: <20261112-rtl8365mb-dcb-ingress-v2-5-f8e6fbdf8c99@pengutronix.de>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 12 Nov 2026 21:38:30 +0100
X-Gmail-Original-Message-ID: <CAD++jLmAdFoMpqM-3Xu3iin32V7ifAZGMAoLErxNP2vPWNsizg@mail.gmail.com>
X-Gm-Features: AclHuK_t5r8nzDk3zH3dBvcahJi7SHCD527mkcQ-CEPxJhjPETJ91A8L8stJU_g
Message-ID: <CAD++jLmAdFoMpqM-3Xu3iin32V7ifAZGMAoLErxNP2vPWNsizg@mail.gmail.com>
Subject: Re: [PATCH net-next v2 05/10] net: dsa: realtek: rtl8365mb: describe
 the ports of each chip
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Luiz Angelo Daros de Luca <luizluca@gmail.com>, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 9:37=E2=80=AFAM Oleksij Rempel <o.rempel@pengutroni=
x.de> wrote:

> Record which ports each chip has, report one more than its highest
> port to DSA as the port count, and reject a devicetree port the chip
> does not have. Lower the family maximum to 8 to match.
>
> Commit ca5ecd4246d4 ("net: dsa: realtek: rtl8365mb: correct the max
> number of ports") raised the port count of all chips to 11, but no
> supported chip has a port above 7.
>
> Since commit 51a4a22301b0 ("net: dsa: realtek: rtl8365mb: use dsa
> helpers for port iteration"), setup also programs unused ports, so
> every probe writes per-port registers of ports 8..10. Their learn-limit
> writes go to 0x0A28..0x0A2A, above the learn-limit registers of ports
> 0..7. We have not seen a visible effect from these writes.
>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
> Changes in v2:
> - New in v2. The QoS patches after it handle ports 0..7 only.

With Alvin's comments addressed:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
