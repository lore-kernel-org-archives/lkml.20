Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793686620;
	b=xfZ6//ba8Wz2Ga0g57bb9kpC94V9DEu1c+v92u/vff/V5EIRBK8YAUMJhmikvIbeWMyV
	 7QPsdK5UHfEPVwvKFWaR4hcGTH/KB41zBwGmh6VOXaMkjEQFqgWdMKqx6b3oOCD+5tjim
	 ne37M0YPHVa5GcGvCnbICEoWArAieA2xZQn0ZTXaOcil3nKU5+1WjjeCbTFjAqOA7J7h8
	 /IA3GmcmT/l4GPhDi3PawH6d+viODexmmYkkOJqMLpl9fXGu0hF781gWiYiqTdvVierjR
	 fsSE+/aPHX77KfVXYZBrM8gKHJuehdEHj9zYOmd/ZBBjOsHEAxK/tKHtgx1tMmg2hvg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793686620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pcF95d2N0nbmD8wQITiL4ERByWo0KclkZHfIyTQMA9o=;
	b=gN84vdSik5uX6+XQQ7qkgHgjbmKe/wkhiGE4yT0k86XBZJ/TZNZCRib4YQcm/c29XM1N
	 i+JUgXr+eplZ5avNWFhDA7pUhATi0ThdlslnRhQJ3+psEN9uWqDYrXgY/OU7Xdg/qauep
	 O0mkrb/kQpk1PuWQFRDInhkBoi8RAFBzNHGKrAzG9VsgS58b43VB7pxmpKLRYVlJT4pAm
	 r4BAS8X3kJTfB4akCDnoaMjgTSK7tFTUc/JjbCBRn+4gqS8pQ6ZzgpwYB01Crp0vgWnTb
	 6iyayliO6hdzD97j4a2+5wj/m7rgi59GjWDKhF8VXyE0SLVX7UBdF54E3h1NAXSJBuA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ggG7WReS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA908606A332
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 06:16:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA908606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ggG7WReS
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91c75267b0fso42340056d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 22:16:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793686619; cv=none;
        d=google.com; s=arc-20260327;
        b=k2cqwQCg5FrH+quh3DS32/kjo8EG0Jjdhlc6mnZnQl3fEk5vFf8AlBpLwtRCNCTEXU
         k37j/IbpaGu2lyRVRGOhUIQkgtUEKEFExbVoLSaHMj2R2haxgSMZyjhqD76dpuGCpM9Z
         4USVR9s/XYdL2gyzMqfuc06spXfECFWkTh60Yvcw1MSgLsfTPDGfAmIFhNSb1AKXQlNS
         ndg9B5BgUWv8UoMDk00QKf9paOxBNycZ4RJnY9eYEKT83noBsG7i4pGW90GL/18lK+BJ
         Nks15JVUU0hzVWqbk6yWiEyrU7GZ0sZB0Sh286JJHKCFaRu0jcXRy/svG/PTIPdFkD/E
         8dLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pcF95d2N0nbmD8wQITiL4ERByWo0KclkZHfIyTQMA9o=;
        fh=15epTnTy6OwbBWCFzRhk8P2NRrMq9nuavUpkfgsZpYw=;
        b=Sg9MCUaPAexskXEcfVXvUFZ2/IrGziIbLEmFbdMlSHiMx9XnAl+G5+AWTSEk7dMqHl
         ZwAaUSMGmZ8vk/jXsMYALUvgGhIjlmkefT6ll+x6glBQs35OgrHr5XBWrBr1L3sIEw3P
         mpcI1txD7YM2bq+ZqtmSk3j5O/j5DKDgnUJGVQEDXP/UzyddiqaqvGVpzArRx4qec6nl
         upyPdOf+USnnWpfUouOzVJxSEkCyzl9FgU9RlvJyo/23OZPjrqt9sQqFwHZrOne4aI9f
         +uh6V/hbKxezO7Pe5UUi2eARMzVaUjeyv79wDunh6lvGg8AdGfBSAnUXssSO3YZ3NDIA
         dWnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793686619; x=1794291419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pcF95d2N0nbmD8wQITiL4ERByWo0KclkZHfIyTQMA9o=;
        b=ggG7WReSSjYiZc8egHRr3yORSA9vmHTvuRcNLhgObTmj4FyavzQ9qjR32UJmnQJt4X
         7pJ+ZlY3InbU5ma5q50MF3GARosdc3bQTkJzhTRnbTOPAvCYqR+qKHGl+gVI0E7tJcFg
         RR9Na1sHcqr8VCfp5Gy143eZ46V0ERbWkJy+ZlNCGW1wBwadBWDVOLL+Lf0qFs+w9bG5
         KwMMEVu2NUmDaWIewXCtXWnhMtHZaLuc71i++n3BS7FGT4MwqjJih7LND5jbfV85L0EB
         CPryclfjGBIhxWCtCbkIDD66Yl2GwFnN9Q60l5m97g39tFRcnG7nW++6QbOOmfOp3AIs
         61KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793686619; x=1794291419;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pcF95d2N0nbmD8wQITiL4ERByWo0KclkZHfIyTQMA9o=;
        b=qaYjZCBJz0KdNuSYZCEUW5KlGQDrVVm+/plzhAOe2xdyoRv/f+nv2ulzo+KLcC1N7O
         Zvd0SsLhQGKJ7zZ3RfIiSP4hIdIyM1wZaS1BjDu23+AT8ftangaiOrc6TjyjFTApbFV4
         dlRMiIy7qHfvaFnhqgcIZyRPlHKgE+nmSMa7ykRbOfeENtri4ShogtbtdB+e73R8AiL9
         /4vrQu5uY+DTkhMbuFdYrbdiSx6xefNLPKUDWueAy/EpNtC84Zu+n+Eg/28ojIU1HNmH
         PRAY27VSPYuBO0Go/j71Hp1dZS5pOG4MW9zqVk9HB6zUq3C/vqF94dlmkul1Cl+P6Ovq
         qpoA==
X-Forwarded-Encrypted: i=1; AKwUvBzPmwjNJrMcbsMGqxbQES8TjJ4z/54UWHFMSpYLOqT5Ufgc1LDuD3lX3c+k6E1LMQB9kXp2D1p1w6WmxWs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ufxp1wfVDghgmOoEs0OlhvcI8FSxPdOml0V4U8xYBiHVweV7m
	xKSORTj4xgixgePKXI5w9Aw5KcnAMJywSZGNaz6No+01T54pva3v3dmsCdpT1QThfu5XCUqUWzM
	6TtTUXT6Ld9ovKUT8CCXbMXvGCg/p9cA=
X-Gm-Gg: AYBFou2veXqrMTSsCfCmTDuqsxMvV2Q2JI4fzHl3DhQxIhFW1ZpIIW1CQ3dface491c
	4FbFyz0ZGEhqlNrdvleJ0g8Q5bVoNb9bvK0LA25ubOf6q78l8f4FVuUrWQcEGkzZ8nEUfd6zFQO
	tqw1PTryfWhkuaGhUUWhCSA1+hdckYNO6d+tTCENzArYFfwTbfQPh51h/Z7m+jHoo2KsDsKPXor
	U9iFoWWmZ+dBjNU6bqMm5K27UBPhaTwpgQ0Z+I6CwYDs64U7ddXSutEk9n9/7atks0LYf7ULywR
	IFnTR4eIzeT6RgCWqGx3msEBG1rNqcMgFrNAgolX9WHk5AkUxNuIlraTnV3DytRJvP4S7v9uUvI
	ott4UDMWa6wAUvg/k6WiPd1yAYSqQPD+RDsJtb3JhYoTgrJ6nCtSRSONuCqW8yyQ5PckxPR20mk
	fO/AuwFvaEWweDLKKa7LL7ZxyJlOnBckSySr0afhKjv/dy9c9S2FXZ6m0pO6C0sIJsr7je
X-Received: by 2002:ad4:5cec:0:b0:91c:273e:4fa5 with SMTP id
 6a1803df08f44-91ca4badc8fmr209856706d6.57.1793686618829; Mon, 02 Nov 2026
 22:16:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <n59f1S6wQICe5ZxgcNxb3w@nvidia.com> <20261024055055.602558-1-austin.linux@gmail.com>
 <2T-GACGvSDOWv7aIZ37w4g@nvidia.com>
In-Reply-To: <2T-GACGvSDOWv7aIZ37w4g@nvidia.com>
From: Austin Schuh <austin.linux@gmail.com>
Date: Mon, 2 Nov 2026 22:16:47 -0800
X-Gm-Features: AclHuK_rxvwx-oxtrUFzGyyxWEarVbq8HBl2KDSkLQPCh9cTIpyOb-qam44wAX8
Message-ID: <CABsbf=HAJXq=gmQh9Kc22fuThYVHWNShD58TkttQG1qm8L1TGA@mail.gmail.com>
Subject: Re: [PATCH v2] firmware: tegra: bpmp: populate debugfs in the background
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-tegra@vger.kernel.org, Aniruddha Rao <anrao@nvidia.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 8:08=E2=80=AFPM Mikko Perttunen <mperttunen@nvidia.=
com> wrote:
>
> No need to explain what the userspace can do. Generally please compact
> and unslopify the above. No need to explain every possible resource a
> driver might need from BPMP, or details about the patch that lets you
> disable the mirror.

Done in V3.  Hopefully the comments + commit are more direct.

> >
> > Measured with initcall_debug on an Orin Nano running 6.18.39 with
> > NVIDIA's patches: with an earlier L4T release, the probe returns after
> > 1.2 seconds instead of 6.36.  With the BPMP firmware from L4T 39.2.1 it
> > returns after 0.51 seconds, and the mirror is complete and renamed 2.2
> > seconds later, about 1.3 seconds after init has started.
>
> This paragraph is kind of difficult to parse. Please just say which
> device and kernel you tested with, and what the change in time is.
> A recent upstream kernel would be preferred.

In V3, I've got just the numbers, measured against 7.3-rc1.

> This seems a bit overkill. We should be able to populate multiple
> instances in parallel, just avoid removing the root unless there are no
> users left during failure cleanup.

That's an easy change, done.  I started with a mutex to keep the
exclusion simple and easy to reason about.

> > +
> >       root =3D bpmp_debugfs_get_root();
> >       if (IS_ERR(root))
> >               return PTR_ERR(root);
> > @@ -818,7 +821,11 @@ int tegra_bpmp_init_debugfs(struct tegra_bpmp *bpm=
p)
> >               }
> >       }
> >
> > -     bpmp->debugfs_mirror =3D debugfs_create_dir("debug", d);
> > +     /*
> > +      * Fill the mirror in under another name and rename it to "debug"
> > +      * once it is complete, so that userspace never sees part of it.
> > +      */
>
> 'never sees an incomplete state.'

Done.

> > +     /*
> > +      * Mirroring the BPMP's debugfs tree takes several requests per
> > +      * directory, which on Tegra234 adds up to seconds.  Nothing else
> > +      * waits for it, so do it in the background rather than hold up e=
very
> > +      * device that depends on the BPMP.  The workqueue is freezable s=
o
> > +      * that system suspend waits for it instead of failing its reques=
ts.
> > +      */
>
> Something shorter suffices, I think --
>
>   /*
>    * Mirroring the BPMP's debugfs tree can take several seconds,
>    * so do it asynchronously, on the freezable wq to ensure requests
>    * don't fail due to system suspend.
>    */
>
> Or such.

Fair, done!

>
> Thanks!
> Mikko

Thank you!
  Austin
