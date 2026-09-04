Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECDC42E416
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 07:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788506452; cv=none; b=FXbC+5TkoKx4bV+pjhhprP05qmSqblTvnfBf1O8IUJjP2+bHWc/IQxJTWMyxf23L8eF+J2eXmPdqbw6eotIA6IcB8awThrCM9sRg/Bv2NKRLH4wIPRghJjtdOFlBYAdp5cRJoicVySNCSdj8Nvv/91nmBgaIgf09z1oiTClLifk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788506452; c=relaxed/simple;
	bh=UBYBBoGbVT0qDMPUQ7wtDEFeoAv8u4EqWKANGBDwPQU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=miic3yQWFgxrSM4D5ycl0vAYw7i3tFeWJ95B2xzD/7+ssCrM9+mSbBGGt43OvjIx+RtSNTMlom3lD5anYCD7stmkhsTaL86yYT5wXuRhXMVTtPRfqzPGkiISz2raag+JkVPFDplVUKyqjyfH6U/QgHOgFXhDVtkCkxsIfTpBWJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5bfaa014978so353616e0c.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 00:20:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788506448; x=1789111248;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NS7q+6fusbmwIYCwSSgkm4FqpxMVHZCBweF5L2Z29Tk=;
        b=IAzL0pJYjcJboQ8/arOUKKYKDM4WDoxnIiaPmvNm7w2G5H7BafzaOwaJ1jHFIuNcqY
         +1AtV6m8LhP66WInzJyZgXXPAZiE7GeSHXn6MCUbY+6sqS0qq4JSAxy4Y0nJ0+a3NC0z
         Hh8mMdcMXNBUZMnSRWlOevyoYJDdE2Mks8WWFR0rU+tbwWX1uYDEmfOT5IlEw+VIQNyw
         qEKJJtCjR/b62wAZhpgy77x44cI0MLUwNbnYXSXXhAWM7oXG/ZVsdldUDYS8nOvrly1e
         7ewiM1hI0dk2marhkztGpK9DoyWCG/Y1A+/lKiKxnNi1WDMvDJdX7pXlaZ1ibcgm701J
         8YHA==
X-Forwarded-Encrypted: i=1; AKwUvBzXRrvqUv4VR1jrIXexd4X/MxTJhyt+CKiHD4i7RSao20EsARuMazH19c1D1ECTw5WNcQBBAd9yra7iUoI=@vger.kernel.org
X-Gm-Message-State: AFuF++m6+lAhzQD9bsnxVLyzQjY11O5UOC2SA5FBHBUMk/IomhfyKCRX
	cYe/mZ3b8zuY2XGwArDSccmGzUKCqaVDjoI3ktiEXDi7CocrAge70C5eE/lVnp7ZPmY=
X-Gm-Gg: AYBFou2cEppr4ED6Rz83CY2hP4os/3srQUkwrt1TufmVMHOgLtnre4YqYYg8HmIEF5R
	4redL3D4OiKm0FcakBGWBbjFd/t12oMYGsSOWu2d5U/TNQpxrz5ZTH5qAufxswa+Kr+rRXWGzMT
	knZffL/C0cTCSC7jrwiNuLoSEMe/eQXyEF7bKm0CBFzrdosfnv58B7pWMdMdNqJX2aJzaiDTjLv
	vAMIRbY3RIodEpW4p0zxHveo7OnV4NRR4VD/ek3LMzNDAxhiHIL5tkxzHbbxirO5AW6planPBLP
	0f2+OA9OLtRFGtjyXM1flH6/Y06WdEEHiFd7ZCjfQb3IJMk5wIOIcmzUNp3vgh4BAMFw1kja7DT
	GYkz+/El1POQDk8HKWPA3mywKjt58rTNYOBEzaDyBR78cUcJQ2wdliAWtdGYxiDhnMqn5SkVf4J
	XaDo6c7izs/zjAXKOkIaUoso57Htj4t74o05DC9aQZURCbJyzmNmwbEyZf9CQPvS85oDO3cs7db
	6UMDcoYcSDKslspUdJCXBZBu/RBVNzRE+I0
X-Received: by 2002:a05:6122:17a2:b0:5c5:d531:2f4e with SMTP id 71dfb90a1353d-5c7ed8053f1mr1616526e0c.5.1788506448594;
        Fri, 04 Sep 2026 00:20:48 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ecac1033sm1415870e0c.18.2026.09.04.00.20.47
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 00:20:48 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-97bf8f6a31eso235524241.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 00:20:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxsUKovG/W3H735A17NSAueXDzYrCcWxc5rKIYw/9s5rSPyngtgi5RTlYPt4GLCsvos+r7cBRj8JbszA1g=@vger.kernel.org
X-Received: by 2002:a05:6102:26cd:b0:780:7e65:f0ab with SMTP id
 ada2fe7eead31-78a4a58e509mr845164137.1.1788506447549; Fri, 04 Sep 2026
 00:20:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <e481b6de46cecc6ea604ae165272c667274cc621.1788437140.git.geert+renesas@glider.be>
 <b3d19098-eccd-4619-b667-ad3b7e0a4422@ti.com> <69f7eabf-95cd-4bfd-a1bc-a1227c4b31e8@ti.com>
In-Reply-To: <69f7eabf-95cd-4bfd-a1bc-a1227c4b31e8@ti.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 09:20:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWyj-x-tm4E+ZC8KMkzx48hpAxkrK==0hjXeG_HQYZDLQ@mail.gmail.com>
X-Gm-Features: AcwNN1W87AoGB0mn6F4o5J_OUipieRwifJnmyyR6p6PKe6C7v2GciBlPCkwdp3k
Message-ID: <CAMuHMdWyj-x-tm4E+ZC8KMkzx48hpAxkrK==0hjXeG_HQYZDLQ@mail.gmail.com>
Subject: Re: [PATCH] net: ethernet: ti: davinci_mdio: Drop commas after match
 table sentinels
To: Siddharth Vadapalli <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-omap@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Sept 2026 at 06:44, Siddharth Vadapalli <s-vadapalli@ti.com> wrote:
> On 03/09/26 18:00, Siddharth Vadapalli wrote:
> > On 03/09/26 17:36, Geert Uytterhoeven wrote:
> >> It does not make sense to have a comma after a sentinel, as any new
> >> elements must be added before the sentinel.
> >
> > While I agree with it, this seems to require a 'cleanup-series' rather than
> > an individual patch, given the following statistics:
> >
> > As of [0], running
> >      git grep "sentinel.*}" drivers/net/ | wc -l
> > gives
> >      84
> > and looking for the ones that terminate in a comma by running
> >      git grep "sentinel.*}," drivers/net/ | wc -l
> > gives
> >      38
> >
> > So there are '37' other instances (apart from davinci_mdio.c) in
> > drivers/net alone that require a cleanup.

[...]

> > Since this isn't a functional change, I am not sure why a specific change
> > is required in davinci_mdio.c, unless you plan to cleanup the remaining
> > '395' occurrences in the remaining code as well. I am not against the
> > patch, but the reason for picking just davinci_mdio.c for cleanup isn't
> > clear to me based on the commit message.

I know. Over the past few years, I fixed several of them I encountered,
but never got to fixing all of them. After rc1, I flushed a few patches
that could be sent independently, so there it was!

> I have posted the following series to cleanup all networking drivers
> (excluding davinci_mdio.c since that is done by your patch) at:
> https://lore.kernel.org/r/20260904043724.2955444-1-s-vadapalli@ti.com/

Happy to see my single patch triggered your great response!
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
