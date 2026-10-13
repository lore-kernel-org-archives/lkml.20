Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B193815F0
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791861606; cv=pass; b=jKvATe7dx/dNd/QfjhQEW2y6ogJlxLCWk+oJActU5b4bfb1A1bAqLLM3BFH6WDLTezLVFcdINIYstcfXpRNsmQZ7BKV9brDWLueaGXZ6Viq6iWBMc7Mpm3hEoXF3SinyVWDs1nFf+ULf9vGNU9Z2wO9DEKapRAqTJoYvhSnzOWA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791861606; c=relaxed/simple;
	bh=72W1TYLhTlY5mHnQbwXp7nlRivybQU3gGp2mD1iL4vw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eEikFGvWfua4mBhUYgP2WIK7zy6IIOvg76rKLMsg7HAqiN83L144vpQnKu8nc0KxC+6H+M62e6PgEfayfrg6Yq6kpsnPszGJw7F0qZ6H7SOChGHLlY2TvoKZ+asqcMnEw5+TqVmJU7kl8lqPD+YaD2YJJTHWdgNkiX9xMeBPSfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eHWfmuXq; arc=pass smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eHWfmuXq"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3a808f09021so17970381fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 20:20:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791861603; cv=none;
        d=google.com; s=arc-20260327;
        b=nM5ihN+gpiOi1HaFw1Y9sVZBo9Vm3cpP5ZTz6YOqQ+ixL4/m22T1TzM4v1khTddk/l
         Ri/eV/x/j98gm9Thkgr/7eOASxoDMSdyW7iDnGDUyFd/coop99GnRqm0dNO9/h0IkocI
         t3sgyri28+yBwX4h/0zum/miSy7gPM+Rl6UIrMvth0U2g5z/41VQmcbE/5ugdAtdA4L+
         ZfNm6VGjIEP/UdvXcl2Xfpeu+LMuaS5KuZ8Ok3624J630Rc4/L84VHBmYEchrQiKlz2J
         z85+0O3T99i6JkyYPaN0FNpbWhh2Uvqbp0SnnpNNqa39zVRA38txQzvOGy0/HdcjaM4a
         NxOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8uzRKJ38CQO5fI7/X0o8JnofebUxgax7PJCqj7QJt9A=;
        fh=BgaYjRoQv34q5yKpKdJx60DkQuGmPFpOkeuZUP79XwY=;
        b=IaZcLJ/7jDGtn+3JYstqY0MJ4NY4CzzNeaIAxZOmBQRDWtX99DsJcbV5yuAJE+y/I7
         4pJgyy+RBnubD3UIEeKipqzgC1Qnam72xYtEooecEPgTFEq0/jNdx5vM2rHXQctFEK6z
         5ueKah0U95s41CNciBwhgP5upMn9g7ECva1Vp6KnZAk1T4Z7hy8b7OwGRslN39U/5oBG
         2lZ0o3tov47Ml3hflPUGI47u3ICK+1lIfQ3Gqlz86c746up66cQLle8Tcwcrrb8ohust
         Isl6G/48xkNjBg/m2AaF627Fjd2DREtDWzIny4nl5rBlebE2WVYBTD1BuaHLacJnnnqI
         ZbYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791861603; x=1792466403; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8uzRKJ38CQO5fI7/X0o8JnofebUxgax7PJCqj7QJt9A=;
        b=eHWfmuXqR7N2A2vjX92EBH8n11ngbXhuXn0GS+SI95SPao9EJczinwx4qt/6RK2YAf
         JHd2OBJVcQDHq01r1ZivkLJ28GVYDqygxdJqKvHIZCM9QlZPCS+d5r6/4LpgyAAWVfKq
         TyEyeC5Sn2Zfc8QM/oqeqCf5yIu5W9Y4lNMMDfYXl7vuRTdlclBd7ikOUBkS6MXQp0xV
         YMTgK8QHRyGJqtwKGTosYTTSRKXN+oh4Zwot0Wl1hoCrDy3diVBsMqbyyDA7v7Al5g+Y
         Hs2byLireJ+4MHzf5a9f09Leuc85y66ieR5wmA8/j9tCO7Zpnmgpa8P7VneMxLvFNopI
         mnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791861603; x=1792466403;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8uzRKJ38CQO5fI7/X0o8JnofebUxgax7PJCqj7QJt9A=;
        b=WXdbK2jTvJKqFtBUqiVmRtE9m0RH56pjTinsYxUzWyamOi1KpwHx5nhy4mL2EaElbr
         iazQvK28av8HNKcHvEm77RBtiPy1gfvuAGad6VUs27Kl5Bko8o5Ntghu3sD1Cu0KWxDj
         ZOZP/5su3cQw90qNjGME1JALhCJAJyrDfd4PKC7eyt/oNU3o+Lf5ubc5HFnqofr76Ci0
         ZtULCE5JSNXNJiTOrZZrrJkrsL9OrniQqh6KWDJCrGTHTTcBpzhc1wbHBCWKD8+f5Vj5
         1WeMjkQYX4PRNlvOyYqsxIpzgs+56zASZH6YaBMgSusn+cImAvq6llRNQc5kmBYSckdC
         cpwA==
X-Forwarded-Encrypted: i=1; AKwUvBztvBdAUegQ06mN0WRHEKKYdbX81G8u61qLGNmj+fyhvKo5QkZI6FgGgziZyrLaKYBDaXYqkyYh9iz7Ipg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKqP5MwRBFDOVmSGzMuYLiChEaoFRCoNg5mrEtIh4Ti+6UWaOMd
	EeM4jSGnqPrbeprLUzQmm4H0qUi+9fBEDQDI49bSe5h4WMGBUfvuSQxBbNvR4jFN1hCABfczOHr
	PPDmQMHu5i5tfDeSiB5zKn9uDj1r0TC4=
X-Gm-Gg: AYBFou1FXftzBSc9lUc6jubawyLAo6927EnrRWnYvDWzxH0tWPlqkGb4X+ARc432JEx
	lnD1aKAAUu+7roIuXvDwLi/Bboxf1q1n5fgEef9OX8j4lfdED6t2a3Tsz9lvbhA0A4XrCxBpW3v
	Z+1sBGx59nvIws3IlgwYsIbQBx6OMWEf3bmzmg4dBwJZzzhEq9bv8QNeojHhGeXh5tKmbXxBcP6
	6FAS6jS2d/KfDZ2LHlBouK0aR1J7sZQQMdyiSzP74/QUB3W2BF8zmjA1J+HoLZDXIVRnoEMV7VW
	54pB+uB578qdOX/hOmPTj7L/XW0tTRMjdMxsBN0VTdh0K+9aS5dRZWh+yNjWlUEFJ+JHM6II0R+
	ZK+xOvbLkq/hWTC6WRGlPuehQ2Ot7+litdmzdmd4306JK5AYISnbZaqTQyaoh+0/JEUhFo0PNxS
	dSL8yvSw==
X-Received: by 2002:a05:651c:2109:b0:3a6:772c:2757 with SMTP id
 38308e7fff4ca-3a9c5357723mr27901721fa.12.1791861602415; Mon, 12 Oct 2026
 20:20:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011191344.981000-1-linmag7@gmail.com> <20261011191344.981000-7-linmag7@gmail.com>
 <CAEdQ38GoGhoaoymQER16qF2NHwhOGjGsTh68B8oqSzeR-LL-uA@mail.gmail.com> <CA+=Fv5TC4OTgVKXdnqDWawXBm4M1m8ZHPJoX6wL8K8fdyPo5xw@mail.gmail.com>
In-Reply-To: <CA+=Fv5TC4OTgVKXdnqDWawXBm4M1m8ZHPJoX6wL8K8fdyPo5xw@mail.gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 12 Oct 2026 23:19:50 -0400
X-Gm-Features: AclHuK9hJRZQQijffp3ZG423JnMVaXslPDbjKrvlp-t3oTq7yIesmqsGhDbHdBg
Message-ID: <CAEdQ38Gcfco9N62rXueiwFBF+r=7A+SptYUsecOdq_ipihKmKA@mail.gmail.com>
Subject: Re: [PATCH v6 6/6] alpha: stop on fatal Tsunami system ECC and write
 parity errors
To: Magnus Lindholm <linmag7@gmail.com>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 12:58=E2=80=AFAM Magnus Lindholm <linmag7@gmail.com=
> wrote:
>
> Hi Matt,
>
> On Sun, Oct 11, 2026 at 10:01=E2=80=AFPM Matt Turner <mattst88@gmail.com>=
 wrote:
> >
> > > +#define TSUNAMI_PERROR_FATAL (perror_m_uecc | perror_m_perr)
> >
> > Why PERR and not RDPE? Bad parity on data read from PCI seems just as
> > bad for the consumer. If the HRM says the Pchip poisons that data and
> > the CPU takes a 670 for it, please say so in the changelog.
> >
> > > +             perror =3D live.perror[0] | live.perror[1];
> >
> > The changelog says incidental PERROR state on a CPU or environmental
> > vector cannot trigger the panic. It still can on a system vector: UECC
> > or PERR latched before an unrelated NXM will panic here. That may be
> > what you want, since the error is real either way, but the changelog
> > should cover it. It also depends on the PERRMASK question I asked on
> > patch 4.
> >
> > Two things that I think belong in the changelog:
> >
> > A CPU-detected uncorrectable ECC error (670 through
> > ev6_machine_check()) still does not panic, so after this patch the
> > policy differs by who detected the error.
> >
> > A PCI card with a marginal connection that asserts PERR# now takes the
> > machine down, where before it logged and carried on.
>
> Thanks, these are good points. Would it make sense to drop patch 6
> for now and address the panic policy in a follow-up? That would let
> us consider RDPE, CPU-detected ECC and previously latched errors
> alongside UECC/PERR, including the impact of a device asserting PERR#.
>
> V7 could then focus on the reporting and acknowledgment improvements.
> That would preserve the existing continuation behavior for now,
> without implying that continuing after an uncorrectable error is safe.
>
> Magnus

Yeah, that seems reasonable to me.
