Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6542836A01A
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 18:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788719473; cv=pass; b=lkwp5L6Tw8G/8e3hW46kHUKknZwkhVnF6rNj47c+7tuha+a06JxExC4e2tnDAwoSLlN993TBkHU7A8eRfhlXoFbAZYNvFQpCYsciMpnvAbScvPe9Gz+OBi2qyTc8CM+DHTM6m45viCuodBONg6IOn21g6JU7shBzXYF+uQCGJto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788719473; c=relaxed/simple;
	bh=z2zRx5xIYzBTRZFTx4rfNkA/ccYpqsaQrW2/mbf7wNw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ndUkmxoe9ZJ9g6k53pp4nx1D7GrU9uHFIArRQ7CsT33A2xQgQ/ueX1mmxFYVvT1j1WiGK3/jiwPJoEd6zfqbj/NAnWenqbzGLecqTaUJhXITjQb5oQMyv5/9LhMhq3kobehSkytoh25XYwPdNYPbUCTxOfcutwyDAtoFfbGkno4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hgC3fKf9; arc=pass smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hgC3fKf9"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6b1a0d75a4fso1622908eaf.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 11:31:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788719469; cv=none;
        d=google.com; s=arc-20260327;
        b=cs9ZSElOIEiSIiWf7KT8e7mHxyOynamW+a/H51z9DeX4P2HqccPO1sghD1p0xGEx3e
         webrMw5QMJVjAldMOTUBapivaV0uHL90XhydyCINxcXf81W5hyiy/Qmj8dLEA7RjjDwo
         anvyFguEgPjjoFZhc4eWRwVkka9Tcuih9QAMmY5wkTR6jveTvwLaD5ob6RtWTLGTc7IN
         nNHbKlLUxMtgo0GKkgaZ8m9ZRgv77cwKYm97OI649yFvPakNrsS5b3r/Gs9Nnw4OV9Gh
         zdFAaKl8eimd8xfkAnlSGmKrN9QVCdUlJr7F2Swjbd60NQmp+5h4NsT1zU2ndQZv1GIW
         Q5TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gVW2rYt7tF88/8e8E+2HUuoezaWujAL+SsxCklpr1lc=;
        fh=vL9YnDOjrYAGvwfSsO85tlt1wwh+W4ITkLDvBnwFM8I=;
        b=mRcW1Ty9TDVZ/pua+dg1TDZSAEV7hz/g6oozzOWjldDI7bsVYuM7hevv7mi28PUQ7s
         qH7hUC1hpYDXKwMltQn+43XDT3OZylfwyjkMKxsCZIBZRuEWGOC+hmXqavb318+0UnHk
         o4t1nUfQhZuv/3hSThy/hwEpOqsBIkc9aBVk/LRkEgH0eIT0jaNzQmLuWY1B+efgbOXa
         fGTI7nuprqHXghsH7y+eTKHJZR+KWTg/GG2DA36wOAm9CLASUZ0p18EjZ7714q3eO5oj
         Zk+AgYZqchsfRJ+f4vySkmQFbfK0xSJi5LOok1nlE3OH6OOkBnxMLWOqIyizTIZT+Fme
         0kiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788719469; x=1789324269; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gVW2rYt7tF88/8e8E+2HUuoezaWujAL+SsxCklpr1lc=;
        b=hgC3fKf9Q2lD71dMzFLPJ2/cVucXzJPmtzHUhRL7M0XxxAroZrsx/He6YEVtvKze1O
         ImeM8Go+plvjQUojcP7oT9PduoWF7krinnlvKgBVzWsMQp6/SV0V41QNH4uj0TuNV/6v
         /BmwAU7RCeBCN2XVzU1nrOIZBE5ErNrSSajDEU3zQ2lqANuPS2dvAp2mneXlnnSq0DEy
         FzI+pWyFpXsoTKrgFQwq2oD5HuU6g22qfWYho+N8u5FF5w9U2GLB0daAppaXjYhGz9bi
         skeb+PDQ09f7Fn/CUTCWKE9W3mUxYbGb5PfFhpfSrRYsCuUUEipcIOSb1meTmC27ANdw
         bLuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788719469; x=1789324269;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gVW2rYt7tF88/8e8E+2HUuoezaWujAL+SsxCklpr1lc=;
        b=BMW+LpigK2Xayjaf38AD3ZdvtZE+FY2tVTUOL+XDBYPh1Z+ElJc0m/JtLZNKaigx2F
         gKaCE6jF9BcWeuoRquaxDEHOxrfdKSSH01Oo7rYqcTznCQcplAkCdTzVaaXyfJmQkbwY
         fHd2rpGH3WQZQkjo4PVbWfP0G1wQWiebY0/9A/pHJuslEO8WFC3J/fQXVdRiv6zYJskU
         uu619eW6QivZUzSx5vQmm2MCKxN7g9ndTr6ZhMWswvYqElGUnwypGvokVM6y8oBAtxo2
         P/0mrPmJkevE6tZ5bNVobdUjftKy2uZHijn5Vkj3aiatOuxqEiQwdtAF5QeYcVQlTfg8
         gB/w==
X-Forwarded-Encrypted: i=1; AKwUvBy0QhnNPOqj/tLrsSBQs1umP8Fda2G5zWR6Y+IwlOprJmJa3Yfsm6J5Nx6Mqik0iYyB6AkdFlVX6UB9eRw=@vger.kernel.org
X-Gm-Message-State: AFuF++lwklTLv/1vVXzoEMYXHYpvswuw83c38eB+ktST/LLmbWuILfFN
	o2oEBx1LKZOQ7o403ncvTkuhQxwM5JHPE41kpvYzqswPcpAzyoBfu1ap1la0pVxoJIj3zy/gpJ4
	ILYJDgUKqL1HhVjf9OsvKOfyvi3dQV3c=
X-Gm-Gg: AYBFou29TviDUu1WE/MpWdSJpR47eDqLP7nT+NHDLJF06yrgBLJm+UII4ic79q+Nbhw
	zbQu9norL/HFd7gefgTQm/nItfwzM/iGmGK2h+hfZ6ZaCxgkLenZLcn24cKopzragdKjHffqrtU
	zULrrLI+JJGu0kCn6yzeSkTOdK5cLidOjvg4BTYybbasxepEfZbPXxU51jZjxBObdfLwl2zCNOi
	Ln1uSOREgegJg3owUlwZV219GE2IP18Pmj5NOFuz8VHev6t7kMQumn++n+OFYhH9/OhmED4Pxzz
	LwtbeJdiFXHzqcmbbjefQZMpwhrx/vsXm3i6rSc9l6/IReibBtcXd000TpcxnQ/YLQfmJsTGgwm
	GS/E=
X-Received: by 2002:a05:6820:1987:b0:6b7:46fa:16a2 with SMTP id
 006d021491bc7-6b746fa1a6bmr9651192eaf.55.1788719469386; Sun, 06 Sep 2026
 11:31:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904095416.1692962-1-kyle.switch@motor-comm.com>
 <CAAXyoMN-RX1aY_isyajES5LgiDMp7_YTbM=jiS6d-8o2kKQXqg@mail.gmail.com> <27a16f29-14a9-40d0-941b-f07d5b63ec4a@motor-comm.com>
In-Reply-To: <27a16f29-14a9-40d0-941b-f07d5b63ec4a@motor-comm.com>
From: David Yang <mmyangfl@gmail.com>
Date: Mon, 7 Sep 2026 02:31:00 +0800
X-Gm-Features: AcwNN1UZ-8BrSMDGVBN5KLRtkn4qqRe-CbA17Xg-DeFLgJqOf9TG7E-yF7aBSzc
Message-ID: <CAAXyoMO0MpXdvRLHow8wfe3vBj=VgQMz8ZFExnQshB8uVNH43A@mail.gmail.com>
Subject: Re: [PATCH net-next v5 1/6] net: dsa: motorcomm: refactor
 registration path for upcoming switch families
To: Kyle Switch <kyle.switch@motor-comm.com>
Cc: andrew@lunn.ch, olteanv@gmail.com, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	linux@armlinux.org.uk, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ming.xu@motor-comm.com, xiaolin.xu@motor-comm.com, 
	jianmin.wang@motor-comm.com, wei.zhang@gl-inet.com, sijia.huang@gl-inet.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 10:08=E2=80=AFAM Kyle Switch <kyle.switch@motor-comm=
.com> wrote:
> >>   static const struct of_device_id yt921x_of_match[] =3D {
> >> -       { .compatible =3D "motorcomm,yt9215" },
> >> -       {}
> >> +       {
> >> +               .compatible =3D "motorcomm,yt9215",
> >> +               .data =3D &yt92xx_series_info_table[YT921X],
> > Redundant if you use both runtime identification and the match data.
> > Also I'm concerned with early IO operations, although I didn't see any
> > incorrectness here.
>
> Ans: we have considered this issue before. in the next version, we
>
> will consider whether to do it via chip_detect() or using indexed
>
> assignment. From your suggestion, what are the side effects of each
>
> approach and which of the two approaches do you recommend?

We didn't use compat info since we can do all the probing after the
reset, but I think the compat info here is "just enough". You can
still change your mind in any series later.
