Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E727486E60
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792399239; cv=none; b=W6ZcF82csypTO2x9d7nAdg1qJWCYuSgzhdy/UcOquOyGCUGsG9P0Ykh4dqXab7n12eSYZaIMxXuEA4mfAcjSxnHcCysGjKwBKu9hzJqP43VUS/fZ9Zb4BrG5R12pj24SJSTXZoT82rJxXL/igVhf2xGFSxJoxpMbcRg0LgbzKn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792399239; c=relaxed/simple;
	bh=+RJy4/1CZWMGpIomq9rRX3FDlzjAyxgqndFyH/8QQ34=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=heXBXIDZkWRPO5Oawnk6DWg10mHV721370/a3WSv/HdwQIf3m+dxJ+at78mdHSuTkrydBohrbXT4plRR5HaVg2S25o2L9f/rehqLc3L0rTQe+qu1nfdJvoGigQ1gCLY29UVrIjkpq5/6BNAYFs9vssYp1+O+RP7us2Sxu485YS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PEsjW0ll; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PEsjW0ll"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD17A1F000C5
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792399237;
	bh=kbbc18Cvxb0ZkFfeTiQznolGy8+ESv8PHDFn19DRekQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PEsjW0llXDD2/F7YbD1LvXoAETqtGTb2qLvEMhdhXGIeyVH0xf8mQhIsdpEzxrCe4
	 J79Cre+MX31PuvTEcu8IDapg4pegx+RMRaRTtbPtIAIkaVoktW17xMIKYnMOBbMHyt
	 wyXE98ao91B9O5sKok76eJKXJNsJel2UngwbhbN7nf06TSo1QLK1SIgdF3GVxehBmm
	 lmWLkrjjsNU+C0kXFALxSsVr0JxEwkkCgORmPoZamEf5nP3nItH5ceetkYHDakELvM
	 7xsJfqfFxps1822qWJ/Uw8EFERvy3UTf0qwxd442PuFoq/IMAVRALzrAsHrpEmWqYY
	 nbZeVcch8Ktmg==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3a20f06cce6so24420821fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:40:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzwpaF1wCZKYWaWk8wkQupbKRbCMs1ttF507yKftqJHaAgXiQqmzz1LGcZeh4NeNs7xXCclEhL9Cml4fIE=@vger.kernel.org
X-Gm-Message-State: AFq9FYId4VxhnxyOij2tPgYOeIjWSDu/5UblSssDr7OGvrd/4lSqYYW/
	v43mYypfNCQQBesnNGQxpEa4TG3hcq/GKCR4ksSZekY0DCKOMkqjjKmA23gnYusj4zfHO/ljgek
	4vMWKVkheUvgBpVmYZGZ7AhKOv4ADB7Q=
X-Received: by 2002:a05:651c:43c1:20b0:3a9:a07b:7448 with SMTP id
 38308e7fff4ca-3ab14800861mr14136711fa.19.1792399236671; Mon, 19 Oct 2026
 01:40:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002115850.962676-1-o.rempel@pengutronix.de>
 <20261002115850.962676-7-o.rempel@pengutronix.de> <CAJq09z7rAtikR+AZ93zjruhrhTEC6GbFJEXbQsbN_OVDgk29pQ@mail.gmail.com>
In-Reply-To: <CAJq09z7rAtikR+AZ93zjruhrhTEC6GbFJEXbQsbN_OVDgk29pQ@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 19 Oct 2026 10:40:23 +0200
X-Gmail-Original-Message-ID: <CAD++jLknmkndMJQuDGMnXohvf=X7Lw-dmCjOKo4Adb6V4mXO6Q@mail.gmail.com>
X-Gm-Features: AclHuK8StAfiXPzzA-5_qpgPJKTDai8MFFCshc2OP8TDipUlYSr8l6jA-xmTMpo
Message-ID: <CAD++jLknmkndMJQuDGMnXohvf=X7Lw-dmCjOKo4Adb6V4mXO6Q@mail.gmail.com>
Subject: Re: [PATCH net-next v1 6/8] net: dsa: realtek: rtl8365mb: add QoS
 baseline and DCB default priority
To: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
	netdev@vger.kernel.org, Simon Horman <horms@kernel.org>, 
	OpenWrt Development List <openwrt-devel@lists.openwrt.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[CC OpenWrt-devel to get some real-world usecase inputs]

On Mon, Oct 19, 2026 at 6:01=E2=80=AFAM Luiz Angelo Daros de Luca
<luizluca@gmail.com> wrote:

> > +       select NET_IEEE8021Q_HELPERS
> > +       select DCB
>
> Is 'select DCB' really desired here? Drivers generally avoid
> unconditionally selecting DCB because it pulls in a non-negligible
> amount of netlink and QoS machinery into the kernel,

I'm not saying you're wrong, but the Microchip DSA switches
do select DCB for them all despite not all chips have this feature.

The argument to select it would be if the features are useful
for everyone.

I had an AI describe to me how the DCB features can be useful
for simple home routers running OpenWrt but I got a very
muddy answer :D I do not think a default OpenWrt
router userspace even uses the DCB features.

If this is just for datacenters and fancypants set-ups maybe
it would make sense to have it compile-out optional?

Arguably it is something OpenWrts default userspace
*should* be doing, even by default, since it's a well-known
and old feature present in many routers. I think they/we might
not have gotten there because we barely even embraced
DSA, such fancy stuff could be on the TODO list. In that
case, it may be helpful to have it default-enabled in the
DSA chips that support it so it can be rolled out.

Yours,
Linus Walleij
