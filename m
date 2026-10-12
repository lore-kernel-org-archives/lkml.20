Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092F8372EF0
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791801622; cv=pass; b=BGX09dhGBm95tD8GbrktUNn7xAd5f/HmcmkglMdTYHvQ7cwYKTdgrPRTjhsThK6A3gID4hZpSD9wJWlIz1SXGsopVG0JL+ZS+bOa84S14rfjP8CMu+HINJsJZ8tNQ0swGdqtfbehnxqmRilUeXlGXsu4+tJY0RPh1Vei3bDE2eg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791801622; c=relaxed/simple;
	bh=92KIamnWD8cd5WYLKJyli8qdGUGMlFHe2PGqMoGdBQI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LGM6Xdjgba9s/PYzmdb/o3mPhMFRyQnjtcR9T2k5JwIU5KRT5BNNoT2rXM/FRxo5pX33+e2vaJpQHbCRbBwOooOocY6mscVK5Yj71McQeetJhWC4D4NFP0iZO7zWxhqnC9hOcUGP9EyXSwhg5xSxOvcGZCnjo3PVJifj2fBt2EA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oNH5l3zT; arc=pass smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oNH5l3zT"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3a1eb6fa0f4so18808581fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:40:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791801619; cv=none;
        d=google.com; s=arc-20260327;
        b=b/JtARiDB45hpiU72x1JlGNWUWIZq9AurjeoW2Sr3DJDPtcOCDcdyfx9UcG/e7HpaG
         tDuWPvrwGKcYkLdfEgCCPfcDpYu6x9i1MUZkMGww/NsMBse6CW4nZOGPF+s/H5HklV6l
         eSwZ9r5+AONrjGJsZf0saDiUS+GsqSGR94u3Fdd1v61XMX/n9zktEW+9Sgt1vjbEoO0/
         Av0eIp97WusEGHxjRWCSn6/l5lUS5bY9AIkrfGZ7wfFiLT8IieFK+Nvrl8N/nN/CGuS+
         H5V2obAb+OvwjuP6xZEc0BofOdcedzyE1oOL8HK3nt611S4Gi2Y3oW+fDMiNFEDoPybA
         LeLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qb9r1QTfT6Icnt2JRunI17mQhOI8vmMkb4F7tmAW4fo=;
        fh=AzB7ZNwC8vs8/z4s2s2msFSfksuQtuwT83HQh3U/ZIw=;
        b=Sr7v5dCv9DpWnL3DTCWuuj2DaqOHUaIV90oQZTRSSZ+CjaIutajCPXd8QUlWonxAmf
         q2wSRoL38tizfLR+0O/wOogGgQrQXgEvsedcJxI19t5hLJ/ai1K2CJzAeZBZueQZZaqV
         tfxrnqe/06J9iRx3QEzDusDD5WTsjO8QOGhg9UfXVYqn8Qz2TaVZ6QP3QlyZ5IIHrU5F
         qKWJamZ5D/+9z1FLOkwI8eBYW6Pc48y6zyqL4H0y7+8gyCaL1RXciUMMp2faFOyjNOCN
         RQBm9hXPATnJDHb2tMMz+k8T+lYAmg/7j77ohVGQ25wRsnKpeTVV4FQRUMLUIMBe+vqE
         dmGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791801619; x=1792406419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qb9r1QTfT6Icnt2JRunI17mQhOI8vmMkb4F7tmAW4fo=;
        b=oNH5l3zT/XPHOXZTbeRvG4Q4AU34Xsdlct4Y08OF/Hkh9kUjAIJwq2pkjguXnD7WxE
         /qG5F/neSRsqxoorX/TGENQ98q4f8g7yIDNsh1uhN3rWQ3UkqbIAvcC/HH5W/NTDW4q5
         +btJyoxWDRp69AyOc1kR+5FsIrOswNbukJ47rAkN+uXFpPz26MNEMjF6L76jkBbnkFgs
         7fPb82nu6a1nsQm5dDdH1Gq9dCfDHiFg72GpxqAqggCbemNg5G5pmK/7f4NpgP7kRdQp
         e4XYWb47XmaaGobn4EQl6bT4QkmX1o7KurYFrl3zbbMZRmER9LgGDKpp8RT0AQbQLx4g
         PFHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791801619; x=1792406419;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qb9r1QTfT6Icnt2JRunI17mQhOI8vmMkb4F7tmAW4fo=;
        b=WEFVbHBx2Y6ERc9yXiEkhuMcloo/Emjbfep9H6mMpaz7DBGH2kwrlgtwAyjKirWbn1
         ttTO/ZUJBEXwj7KefszzJ8MjimcR3J8q4qR/R6l+7PvlMx+T2qBPoxMAh0yWT950wZUB
         iIvIe/ELoT63g3GmeA914Rz3/d8IAgFxNyJ/KJp9KlZ6lDkQhKqMzBGuLNebyKOGh1Rm
         mulTpvnEGg3kNp/eatvqMRMhpnFJZbAhijFqTQdNkft0q/m+TrcORJ9LfcGUL6vtL3Yp
         pfRz0cUwu+FArNTvm1bG8Yl1VOapFNqO7T8/GGrpJeGn411FpE1Zx2qn6kitxGWQDe3H
         JQwg==
X-Forwarded-Encrypted: i=1; AKwUvBwEiZU996qEOLhx9QKTOo+ZAYoDoKHpIXMEDLn7R9JXsprP4uJkxJF/OCXaDLkp71w3YlZJEd5D6qIBym0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvQwwiYsjR6UlI/RIHruz7kGmfqtmixThzLVikpCx2+oELoQ1J
	ti6ZFU8P2WI6QUpOtlenT3FkUDgaZjZejS20finArBcETpdgiggIZ9VEXqt9ho31+HLIDIJVnyv
	tg812GyrbIeON6uCmQsPz7U9jVh+G8YE=
X-Gm-Gg: AYBFou2xkDv0GhWMzVk5kG0NBGanJceJCBWu8qb8ciG7O3ddQRDbcfs/9nHc3KVxAwM
	mB+EZvcMHvnbkeTiUb7tTilg6GKKWO4r180rWXSATtF28qg+zkFPTEs5u/XEOIkpqvD5hU2sRlc
	l8LnJB8NmvpfQNbGP1aM5MbwNQGTd2cV6iygL3FyFi9zMb3TUfQkgXWshAG2+oEILFduMyCTI8Q
	IcX6Q05Rq3PwIu91WAIb4tTTUoKKOBVPXoDC24HF2e/n2c/01gLFZcrFogoEex4rNd+9A4eZik3
	ChdHxfxcaeyhwbhrPlT3OyXIUBMSfBD2RvrjA5WqKGs6ua6vYNJqdK0U0DnHc9fiSfYmLFwwUo6
	88oIU+2thtruQ5kKkqvEv94yJkrEkCpkedj4CepfSamC89NCLB9Giy81keISJDdWT5hqTS2gUR2
	D+Ir1pCDTXtkf5PIwsKx3aTRgO10N2iHL3BITi+L5k
X-Received: by 2002:a2e:bc18:0:b0:3a7:5ff2:576 with SMTP id
 38308e7fff4ca-3a9c4eb3dadmr26987981fa.1.1791801618912; Mon, 12 Oct 2026
 03:40:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
 <20261011-gpio-mxc-cleanup-v6-8-cb47ce2ad758@nxp.com> <CAHp75VeonKZtX8moOdXrmTJbjH5Ew5iVdDDc3KfqQ9r_tvHg1g@mail.gmail.com>
 <asyw9ns870F0g7UD@shlinux89>
In-Reply-To: <asyw9ns870F0g7UD@shlinux89>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 13:39:41 +0300
X-Gm-Features: AclHuK8j5vu_bU9arYI-L7AJUk-wyVDtV4Vr4-xee8wNlRYyo0Qc1_7I9JALruk
Message-ID: <CAHp75VcO8YEBbt--P8WO-_Vu1O0mR2nsdqeBSG=JgavCEoR3Dg@mail.gmail.com>
Subject: Re: [PATCH v6 08/13] gpio: mxc: use local dev variable
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 1:01=E2=80=AFPM Peng Fan <peng.fan@oss.nxp.com> wro=
te:
> On Mon, Oct 12, 2026 at 12:30:07PM +0300, Andy Shevchenko wrote:
> >On Sun, Oct 11, 2026 at 2:54=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp=
.com> wrote:

...

> >>         struct device_node *np =3D pdev->dev.of_node;
> >
> >Why not this one? Is it even used? Perhaps you want to have
>
> of_alias_get_id() is used, there is no counterpart in fwnode api for it.
>
> >  struct fwnode_handle *fwnode =3D dev_fwnode(dev);
> >
> >here?

What about using to_of_node() for that one and fwnode for IRQ APIs?

> >> +       struct device *dev =3D &pdev->dev;

...

> >> -       dev_info(&pdev->dev, "%s failed with errno %d\n", __func__, er=
r);
> >> +       dev_info(dev, "%s failed with errno %d\n", __func__, err);
> >
> >This message simply needs to be killed, with initcall_debug in the
> >kernel command line you will get something similar from driver core.
>
> ok. Let me fold the change in this patch, I would not introduce
> another patch to just drop this line.

Why not? This is a logically different change. Since the driver was
not touched for a long time there is a technical debt, you can first
send fixes separately, followed by a number of the drops like this one
(remove a noisy line), followed by new features. Make it three patch
series.

--=20
With Best Regards,
Andy Shevchenko
