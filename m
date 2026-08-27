Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CE635C684
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787821198; cv=pass; b=i2Fj5ngQBcC5UgMSyHkjs1iydVnVLmqfFC+MebkI1BJpSJYKecZHpQIxxrDO4tzVZWER0uAeM7i21SMtEtSuYkz62iU6kmFBf0lZpezi9BIZxZ7eiG+SRxAAffl2Q5S3Ws5Vki8UnU4nOnAW8A8v9LEHbqr5vt1y/9iA5oJWz1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787821198; c=relaxed/simple;
	bh=Zl0Xi1im1WWgWmTNZS51xXxuwsxPbGv4es/ndeBbCpI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YWe+3pS1KdeknzYZzpC/p3560AlZFki9aOLX5ljICBJgZyfChV3E3NsmquJ0TuiJIXE0eeumns4ewVh84XsQawdhJVIxHD+30dt7sDLjF57aARJxRknp36Zf66IBu/f6hfEpskiHLXeWHHpnzGVb2LIpQNUR9qpNyVr1qzqlH44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oq53GHdg; arc=pass smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oq53GHdg"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc1a4c62804so1986012a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 01:59:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787821195; cv=none;
        d=google.com; s=arc-20260327;
        b=X5feeP0xuOw6tDPt/8ITKqN+L9QfTVibp+TdhOGc/2k4kwCn/WKuEqFVodTfmzRMoP
         Qs6tHNy6FB5DKY4NAuckhcI7vyxPg5J9qqpAfNFa+Rc/TP5w1XgvoGBEV/yasQ7rGfX6
         Qmdt1pJjL0wYWo3JD1v+sXIi8WdJGydLseU/o/ajwgvXJFt7MAJLHbWgfkwjsGOiASY4
         YU4kMTThVoMJyxrheDiHBJhDN3u4mTy5ZJY/kIfLnVstD/9EkOwVipV9YHbTU0oNLKM4
         vPjjp4d4o61m9UX1KR2cjKlRmQacdf0AMiN3paykqfGrpWrfjETZHtj/byzN0nHtKZYz
         QlKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U5o/wEz5/lt+36aU3uUCxwokoFei+3AJ1EnYcOWvnko=;
        fh=wiu+eLObkymFbaWEFqkNdczOXlZ4UwUX/3yC9zeT1DM=;
        b=ihb8c9JSriKCaq9mcUAxPaoGT3tnD86pH/BizUbqzYwPOCfxGAvNPWQMILa16o2TpF
         d03VSzfYyypj4Y3drwpLSqUvFpGLGCzy/Tev1XdmHpJ6eI9qDAJ7pjGxMLVPmTia9BX9
         g015EBG6VCji69A4hUr0DEzo00zsSu26STO2//lbLrRBX+mtOzg5XESFv8G7luwO6nO1
         cn6loqhOpZqDQFBt9iLYNyJkMNWP8uy90KJ+CFscvThxNqVnTeHcAfUFoer6ACAXJUmI
         evwObJ2tv5726gF8VBUzk4DJx85Wbtp8RJww1zZXh1WxzqbujYCUCyTNmbc44umv45JU
         U0kg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787821195; x=1788425995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U5o/wEz5/lt+36aU3uUCxwokoFei+3AJ1EnYcOWvnko=;
        b=Oq53GHdgNBdqw4+AGnl28IpzRIZOTbf/GvP5Z6tRTf5X7JsgLaGws2zwYrU48NOg2Y
         yHB7uQw/icx3wMS7ZM8qWlKeyyneWrtTwz3dNsYNvEXPA6I6m4YYR0L/mz966mwK5JXw
         yOZ63Ji/1liHBXwoDsXIUBgEnbEJm7BvMa8aOCcfD9DcxHk/DSAgJz8mCdKxI7YxneoY
         LXV08AGywKQlxQBmnJbUST5qar15JgrBheCAOMXXMqGln92b/Y2fdRU/RykQuFberDnm
         8a0RbFdmNxA1TEDN4kNdT4cRJIV0gxHcgccTmbI/ZIkcQDhr0EJmdLMaxEJhDu9JgdqN
         eA6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787821195; x=1788425995;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U5o/wEz5/lt+36aU3uUCxwokoFei+3AJ1EnYcOWvnko=;
        b=nstFi6r0QClNrWbK8UWtMq2wSA/wPsECCGJnhYr5Uld7E8u6iJ5eEiquC3WnZqCT9C
         u0vanEm4P/a02/o9IeBpWskc1OY8LdrymjdMX+S26EaeOSCr8WoneSTKD8JIbn7uoGyc
         6vLW4vYj8HRHYdXP5Uf4TZTUc3WkSSmhqjmdHKqb5gfYN86R1l/KmKA5EuGJTOfRgsCJ
         Ynzd8eya0dAsBaYiVqKcQTjI7UHtoFBYcKnKxBb3IfCjSFDvRLxVi8GGE/G/DQgGUcep
         WtzmyX0IyqLlIHy5btAHjYvLcj2H9I+DDkVBsjwAGEr2NJ37BxUG0yQFaZHBCGfEgO7A
         RHGQ==
X-Forwarded-Encrypted: i=1; AHgh+RqFyTLFCODI6yeZvE8pq22kqzH3+KgLyskRI2dTupz8kpGUA+e2A4sA6g6sdPXMr/5PFkgtTNk0vevEm6A=@vger.kernel.org
X-Gm-Message-State: AFuF++mn7r2PweJwhhd6fpay6jnIo25DPg+MV1xmpP1W7taqDwM37uyc
	f2EAGkgcsVlJdheXuUM8YxlEH2foO/P0gpwJOKGXOTskPktHROY/91ndtlg08LBQzgl9WhaUod2
	S7VxjD+36ffpqscu44Hhg+AqEUFBancI=
X-Gm-Gg: AR+sD11W2UmawRw+PpvCH8khjJS+VZEqh6AI79KQY2cAg37rxU1CcKgOEw3jarmwtDE
	ZzZ9Tid056nRB+PCbv2a7ppNgnoXRCkI438frjKbMHRykpgpTfGF45qmdya9B/ZQsWF8vxKJbxP
	awP0JrWYxBlz7kp2qbSami3ydq3AP5QGVTEYSoKZEjugLDezuPL4MFzHi8NoD4m6A4boAmEs2V8
	bTMgUkspv5Osk6FM6ghvPBQi1UbJbjcR/ZXaoRJYJW4JlUzfD5NJ2H7MpV37owonYj8o45c3XyG
	nbwYV+O0YBvkiNcxKMxaiO7q0Zr7M5N+jPc+lYTdo4jk4aMelgZalfEhdutZ+N78n7u/CI3c8PZ
	ENFpz2WCgXV0IYLnVCD6qFw3ecLUCQyhLbp0AjskRgVB7O+jTIzK+opqduPIX
X-Received: by 2002:a05:6a21:680d:b0:3c3:bbe6:95de with SMTP id
 adf61e73a8af0-3cf75e8e39cmr32380428637.6.1787821192868; Thu, 27 Aug 2026
 01:59:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824-b4-fix-pcs-lynx-an-v2-1-9bb1dec96f0b@gmail.com>
 <20260825214928.rz52tysloa5yxq2y@skbuf> <CA+DkFDaHQVE8g2iDUrSbRcY6-xihJQpRNommh57B8wRnePZa1A@mail.gmail.com>
 <20260826153634.ygcvnsbtc4ibpp7f@skbuf>
In-Reply-To: <20260826153634.ygcvnsbtc4ibpp7f@skbuf>
From: Patryk Biel <pbiel7@gmail.com>
Date: Thu, 27 Aug 2026 10:59:40 +0200
X-Gm-Features: AcwNN1WGPx46vyjABkQI0k31IMmNVq4-GWF-LqDO9U9Aw1o6rsQ0YaaLuGai6Tc
Message-ID: <CA+DkFDZLv5BS7z7MEV_uBFdNgfrBQr_nkzGa2q6BKx_F4fU0xQ@mail.gmail.com>
Subject: Re: [PATCH net v2] net: pcs: enable autonegotiation for 10g-usxgmii
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Vladimir Oltean <olteanv@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Aug 26, 2026 at 5:36=E2=80=AFPM Vladimir Oltean <vladimir.oltean@nx=
p.com> wrote:
> I suspect our documentation is wrong, in that both for USXGMII and for
> 10G-QXGMII, we have the same text:
>
>   Set the Link Timer value from 0 to 6.4ms in 3.2ns steps (312.5MHz clock
>   periods or 312.5 million XGMII columns per second). The reset value set=
s
>   the Link Timer to 1ms (312500).
>
> But when you think about it, 10G-QXGMII multiplexes 4 ports over the
> same lane. So each XGMII receives one block at 1/4 the rate of the lane,
> because of the time slicing. Consequently, by my logic, the PCS link
> timer, which uses the rate of those columns to keep track of time,
> *can't* have the same link timer tick for both the single-port as for
> the multi-port mode.
>
> I was suspicious of the link timer limit I obtained (263050 ticks,
> corresponding to the ~0.84 ms I was talking about yesterday). Higher
> than that, and the AQR412C system side autoneg would restart (and a PHY
> counter would continuously increase, indicating this). Furthermore, the
> AQR412C system side PCS would never lose block lock.
>
> So I wanted to see whether an ENETC, using the single-port USXGMII mode,
> could also make its AQR112 PHY to fail in-band autoneg in the same way.
> And surprise, I could, by increasing the link timer to 1037500 ticks.
> Surprisingly (or not), the maximum # of link timer ticks for USXGMII is
> 3.94x the maximum # of link timer ticks for 10G-QXGMII.
>
> So actually, I suspect that when we program a link_timer of
> LINK_TIMER_VAL(1600000 ns) on 10G-QXGMII, in reality this results in a
> link timer of 6.4 ms. And my AQR412C doesn't like a value this large.
>
> The above is pure speculation/intuition, but it's the only thing that
> seems to be consistent with all data so far. The only unknown is - why
> does your PHY tolerate a link timer value that the AQR412C doesn't, and
> will it work when we set the link timer to 1/4 that value?

That sounds plausible to me, especially given the ~4x difference you
measured between USXGMII and 10G-QXGMII. I hadn't considered the
effect of the time slicing on the link timer before.

> Could you please test the diff below, which should give us the info to
> the second question?
>
> diff --git a/drivers/net/pcs/pcs-lynx.c b/drivers/net/pcs/pcs-lynx.c
> index 305740b577fc..735ef4069a7f 100644
> --- a/drivers/net/pcs/pcs-lynx.c
> +++ b/drivers/net/pcs/pcs-lynx.c
> @@ -24,8 +24,11 @@
>  #define IF_MODE_SPEED_MSK              GENMASK(3, 2)
>  #define IF_MODE_HALF_DUPLEX            BIT(4)
>
> -/* USXGMII replicator link timer step is 3.2 ns (312.5 MHz clock) */
> -#define USXGMII_LINK_TIMER_VAL(ns)     ((u32)((ns) * 10 / 32))
> +/* USXGMII replicator link timer step is 3.2 ns (312.5M XGMII columns pe=
r sec)
> + * for single port mode. For quad port mode, it is 1/4 of that.
> + */
> +#define LINK_TIMER_VAL_USXGMII(ns)     ((u32)((ns) * 10 / 32))
> +#define LINK_TIMER_VAL_10G_QXGMII(ns)  ((u32)((ns) * 10 / 128))
>
>  struct lynx_pcs {
>         struct phylink_pcs pcs;
> @@ -187,7 +190,10 @@ static int lynx_pcs_config_usxgmii(struct mdio_devic=
e *pcs,
>
>         link_timer_ns =3D phylink_get_link_timer_ns(interface);
>         if (link_timer_ns > 0) {
> -               link_timer =3D USXGMII_LINK_TIMER_VAL(link_timer_ns);
> +               if (interface =3D=3D PHY_INTERFACE_MODE_10G_QXGMII)
> +                       link_timer =3D LINK_TIMER_VAL_10G_QXGMII(link_tim=
er_ns);
> +               else
> +                       link_timer =3D LINK_TIMER_VAL_USXGMII(link_timer_=
ns);
>
>                 ret =3D mdiobus_c45_write(bus, addr, MDIO_MMD_VEND2,
>                                         LINK_TIMER_LO, link_timer & 0xfff=
f);
>

I tested it and it keeps working fine. Logs below, but there is
nothing new compared to the previous test.
Given your other email, for v3, I understand that I should retarget
the patch from net to net-next.
I'm just not sure how you'd prefer to handle your changes. Should I
fold them into my patch for v3, or are you planning to send them
separately?

root@tru-:~# ip link set up swp0
[  134.191267] mscc_felix 0000:00:00.5 swp0: configuring for
inband/10g-qxgmii link mode
[  137.215349] mscc_felix 0000:00:00.5 swp0: Link is Up - 1Gbps/Full -
flow control off

Best regards
Patryk
