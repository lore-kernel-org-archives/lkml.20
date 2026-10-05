Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABF14BEE58
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 15:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791212906; cv=none; b=gNsR8SXIrk8zWKKQNAZUmn1Nl2Xh4dJi1P11A24H8vCDmZ9RiWS947IjVClGLkrWOXELRE4M6DdkNDLxjuvY25w6mMGusL0cyjWqHrqdxHwNFY2lQuTPDe0yGqs30tlIgxVjLgloH9GMOM3fJ8YKNIZplaXleHQFAczkiLTODqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791212906; c=relaxed/simple;
	bh=J8/YNJFhP6TS5MnT72KIs13l+tBu2a1RWpE7Dhi9QK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RinUjaDBpH/xdU2y7/maOX31/AplSqM3TDO3UA/2Nmlg2fO6LrFQAsG73n1JrGvxRlAQlrxyH/qT2Rg5Ju1MvzuQNzIA/64/QvkF9zlg93BsJcvQPf1/wYz9welVoEfAc9eLd2iL8DCHpVvhqN9r3plpba/BGE1mqLVBj8mNKx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KVv4heeQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KVv4heeQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 816221F0089E
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 15:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791212904;
	bh=J8/YNJFhP6TS5MnT72KIs13l+tBu2a1RWpE7Dhi9QK4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KVv4heeQxEfiB3Q1r+Bp9otf4nKzjh8fGh1oMQVYeAHhZTirLIt8kmOmtxFqVjMJs
	 QzwvdytY3JKYCZHrXHN+kxWvhzFupsPsp/8pv3FfJtGPw3SASyK2+Eh0aXjrwzTQo8
	 2zHo0FHZX4Mb9Qis7iqk2AfbBzyD3aMKZFbkujh78NNhXZBd4Hh/oCmMt394hkUpQZ
	 pbsLg253vKAodKTBQSCIbI0b+w3QV0CapWHesT143pv+kyzfIYZsWYzHkTrrpBd31w
	 69lB4YUljwc+OUI2N1bsG+OXWjJhdWJDytKvMOT+TyLCW+m/B5aO3f3ClysUhcLRzr
	 V+jQDHEQ6xnxg==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5bb79ea1170so1473873e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 08:08:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxqgU+N3C3XGYufuxGggjntzLN2XeSNezlUl8hcrGNKIHF7w2fGnnyNPyjXDph/E8sDDkR+zUDcywtmygw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKpJ0JtBXwk8VijU1y+AZZ/3NH5RPs5WVO3Rn+d8zsZvKXDCYB
	1KqUK5pww9n1ZJmlfe2klrbKbjxawsrQNaNCkXwEGTAREDvRWUc2AJuJF91E8lvXMyO7xapTG6Y
	wQHlpswjOlgcCNBHoGG3w3wZa80iRhXs=
X-Received: by 2002:a05:6512:3da9:b0:5b8:f9b0:5779 with SMTP id
 2adb3069b0e04-5bb93808e18mr4188370e87.8.1791212903303; Mon, 05 Oct 2026
 08:08:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002115850.962676-1-o.rempel@pengutronix.de> <20261002115850.962676-5-o.rempel@pengutronix.de>
In-Reply-To: <20261002115850.962676-5-o.rempel@pengutronix.de>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 5 Oct 2026 17:08:10 +0200
X-Gmail-Original-Message-ID: <CAD++jLmpZ+wCUfYven5QPDZkkF4CQ1q6oOqqdi6KBff=ODm2gg@mail.gmail.com>
X-Gm-Features: AclHuK-gijgPCjzrDAGs0RpdNHkIZxu2oUwqSys4GApvYJlCIW_79sCrT3xWLvs
Message-ID: <CAD++jLmpZ+wCUfYven5QPDZkkF4CQ1q6oOqqdi6KBff=ODm2gg@mail.gmail.com>
Subject: Re: [PATCH net-next v1 4/8] net: ieee8021q: add tt_to_pcp()
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Luiz Angelo Daros de Luca <luizluca@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
	netdev@vger.kernel.org, Simon Horman <horms@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 1:58=E2=80=AFPM Oleksij Rempel <o.rempel@pengutronix=
.de> wrote:

> Add ieee8021q_tt_to_pcp(), the inverse of ieee8021q_pcp_to_tt(): it
> encodes an 802.1Q traffic type back to its Priority Code Point, and
> completes the pcp/tt helper family.
>
> A driver that reseeds its PCP classifier through ieee8021q_pcp_to_tt()
> stores traffic types in the hardware tables, while the dcbnl priority
> ops exchange 802.1p priorities across the DSA boundary. Reading such a
> table back therefore needs the reverse mapping to restore the 802.1p
> value, which no existing helper provides. Because pcp_to_tt only
> transposes Best Effort and Background and is the identity elsewhere the
> two directions are numerically equal; provide tt_to_pcp as its own named
> function so the read path does not decode a traffic type as if it were a
> PCP.
>
> The first user is the Realtek rtl8365mb DSA driver, whose dcbnl
> get_default_prio and get_dscp_prio paths read back traffic types and
> must return 802.1p priorities.
>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

Perfect, this is very helpful stuff.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
