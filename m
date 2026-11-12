Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794515633;
	b=BbGJLWkrtnCZcAcEPM4844V9OB91pIrmhhs5nh0XX9lfWt9onil8+6LoI6F6qghZeTNL
	 aBvC6YkSs/f1Rbf4Yvlr59074oor2Co5bJrgQySnUp5fGAQT0cfqlhtL1ppKGkKawP7RL
	 mTgQuCulY96n5Xo0SGE/qUx3tBCoWspgMO2VM8IliqDhf5f4NJivhrhHH2OYsMFdN6vCZ
	 FOCCx3HIZVCHolrJXKBXipebHtUe4C19yeqTcBkq2AaQbmSeCeTDJUxLA6Yr7g9ZnfT49
	 FZTO6hHRC8i75T6i0Dpl3VVkdHlI9Rk6EObPLZ/y2LEndzumJ9K67NACoW99bEvXN9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794515633;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SJVo0kq9ZIhx2MTsLF5tHAHH/u/EXnQs3SWVLemHcVA=;
	b=tGo3t5SOtmRoJXzo7PYuLrpk8EX2eNJNS1ax4ErCYCq2A3WnmWgYQh78p2Lq8mEk61mP
	 uFuj1OnSAICw5OM76iZx3Efw8WwpIxUt27nyBGGyUTRZqF5r9io82fMbFxHNzp3aXCdHl
	 HxsvJlThco3hLXS7ELIJy84Z7Jon2RcCv9YFOUnwuoNYDdVDIRCKi3Cdiu533gCqN4Qaf
	 jYrL37yTsmcyxOo7/WgtsOLGmiG2DNDIhVrLcWMR7dpxHPDk4nCamtCYfq5MgTNtagIqL
	 QFQ8Fcsl0PjlG6k8fGMqs1ih7N+hRdc3Hp65gnhDi/HdBSPY5URlGxu3AISTBnEnYug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ABY1QDe1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E2D606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ABY1QDe1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F0F51F000C4
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794515633;
	bh=SJVo0kq9ZIhx2MTsLF5tHAHH/u/EXnQs3SWVLemHcVA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ABY1QDe1LbATdjQXJ0YDtqjHxt1pdNX1pK2YtHFoyHiXlyIJIohHPO4bvowxjvoms
	 tj7mnzBniHa3k6hiP8UeF4BM+2l+LIFHJThskZPImspxdCw7D5qzcIDdm1Y5i1KLMn
	 FkBQZTI7p1e8wsAPTsUwwGYuPnJzPYN6vCvop/RwszV3wRFF0135wwmQCYRuLZa5Um
	 pYhIKbPnt5OMPvn4woWtsqnW8aJCeKth5cUKM4wzn+uankNC41I5AnsmOo8/OJ+rS8
	 /6SlyZ1Get56Ia0UNcrxoj7+2+jvsUa8xqUnVfDDRvp7V6WlH2O2ggJX+QEWDySPB0
	 ZNiD/P/9KV5Bg==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3adfcafaabbso1698571fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:33:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEBdyzxoCBIN1/fwMbpmYf+5ST/J9KeMXRBEWniA/U3ikrewiTmoIqVZ4WL0ONJhWDTOmhv/UwX38JzKIU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Saybt6SuMq6hexOSQvYe+SiKPyHwGS8p7/pXEn+tzwhx4P9cu
	ZiXdHfXMKvmgjQMCQ962cd63csUU3lgPyz3mOY+cs/Khatv/m4vqDD9G+8qO9EEpKZezrorxOh7
	XjTY29ME1zzL8smvm7eAHlZY2btjxUBY=
X-Received: by 2002:a05:6512:31ca:b0:5bf:aa60:26ac with SMTP id
 2adb3069b0e04-5c170a27234mr168752e87.67.1794515631894; Thu, 12 Nov 2026
 12:33:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-rtl8365mb-dcb-ingress-v2-0-f8e6fbdf8c99@pengutronix.de> <20261112-rtl8365mb-dcb-ingress-v2-8-f8e6fbdf8c99@pengutronix.de>
In-Reply-To: <20261112-rtl8365mb-dcb-ingress-v2-8-f8e6fbdf8c99@pengutronix.de>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 12 Nov 2026 21:33:39 +0100
X-Gmail-Original-Message-ID: <CAD++jLm2d=xRZm1deNmi4J5AgZy1i1yqKFd2pTyJXQ7vnp2ZsA@mail.gmail.com>
X-Gm-Features: AclHuK9yp7a2NrLjfOQFqjSofozhv3Qv7luLwSklQKps2cfMM_xtltmfP-EWkW0
Message-ID: <CAD++jLm2d=xRZm1deNmi4J5AgZy1i1yqKFd2pTyJXQ7vnp2ZsA@mail.gmail.com>
Subject: Re: [PATCH net-next v2 08/10] net: dsa: realtek: rtl8365mb: program
 the PCP of untagged frames
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

> Program the PCP that the switch gives to untagged frames whenever the
> port default priority is set.
>
> With PCP trust, the switch classifies an untagged frame by this value.
> The value is 0 after reset, so untagged frames would be Best Effort
> whatever the port default priority is. PCP trust is added by "net: dsa:
> realtek: rtl8365mb: offload DCB apptrust".
>
> The switch also puts this value into the tag it adds on egress. So far,
> an untagged frame that left a VLAN-tagged port carried PCP 0. With a
> default priority set, it now carries that priority as its PCP. The
> standards require this:
>
> IEEE 802.1AC-2016, 13.1: "The priority parameter of the
> M_UNITDATA.indication shall take the value of the Default Priority
> parameter for the SAP on which the MA_DATA.indication was received."
>
> IEEE 802.1Q-2022, 6.9.4: "For untagged frames, the priority parameter
> signaled in the corresponding M_UNITDATA.indication is taken to be the
> received priority."
>
> IEEE 802.1Q-2022, 6.9.3: "The priority and drop_eligible parameters
> are encoded in the PCP field of the VLAN tag using the Priority Code
> Point Encoding Table for the Port". With the default priority
> regeneration (Table 6-4) and the 8P0D encoding (Table 6-2), the PCP
> equals the Default Priority.
>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
> Changes in v2:
> - New in v2. PCP trust needs it, or untagged frames would be Best
>   Effort.

I really like the patch and the very helpful commit log.

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
