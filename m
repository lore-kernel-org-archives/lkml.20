Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FE347A862
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 12:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789216884; cv=pass; b=UtjvWsWdxWyOcCuN9XmkAD3pyjN+dBdCVTXrkz/4coi16a8YOAdQEwgouFFrHp0m7sB8nSIA3tGsOOIHMe3hg9S4lclWHbPkWLU4vSgaZElHHy35nRvSX+5npZeuKWesc5zt3ucRgiRRO3oAyK/MY8T+8lSKE7XWxTeAPu4E/C4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789216884; c=relaxed/simple;
	bh=ljQce7QZbvSQsSjeQRo2qnnTep+8IGO0siKl5j67fFA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rvYj1QuDIBBFZNFisXp4mVa0ktlg2L/OLnM0/xWb7LA88m5gXLMxEaeMFU0NgQLiuojCIwYr02Avq4J7FipfiL6ZkfBLW9O66dnCyz/Ll/ZyCpes2IuNRaofqGZPwXnoOXvGVbZCvAgUk0Z9utvC4JzMV8R5OJs8fy7drfeTU3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IOoIKsJ+; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IOoIKsJ+"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49e717c9841so1581535e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 05:41:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789216879; cv=none;
        d=google.com; s=arc-20260327;
        b=a5sqg111flF7ojpiEC3Oipw1rLazlAqofnNx+jSVFoOte77YM33adcjo/gDfbTNWi4
         a7N/gOft8KLYgRGabYZyzl7WPdoZDd4QcZ41eepv/rVYUQHkQDRCaRYer1ZcBFtbKFGc
         qCP49tdpLvnc5k7gurUc94hEYE5AfLda98onjyOqWoKpK+aZRWNDCT6hWCkPSMe/2vcc
         wLtHKm6sg+s0N2I5Rk9X5ZBGwyUkeYVGqpULuQWrC0gGNfdOikqlDmGtqlOhx+r7Z1Re
         uyjdzKLas4EwiszcWGzj3++v0DzQBDQHz0nDH0T8bK+QD0FpmlrgbYBtSHLQsOzEZ/h/
         W4Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eMkrmsdzvhlrfqjThqc4QsEj+XaqWtVZO9BiCBmcgwc=;
        fh=+ifstASvxl3OEhE3kI8Vg9j1ldkEFgRIvEYw7bFQMg4=;
        b=niKHKeiSakG5pDnsx3db1zXA87LLrKguq/WVQT+WWPTV9vBHQpd22qShuCJ1ySCk+0
         8iDsggFlijZLCxq5hBlo4IIypyD6kr+6AkWXnlxBGLxzXxhksrJI7jaEPm84ZscZZ6gE
         fQgTnJe4rUuKxVCzCezQO7ZMKWaxvFncEHXOvbEmLSq753qmaui2raWzMiQ5FBRyYLbG
         G9uftkakwgG8Xesr1AX8sr6w+V7htzmldvylAyLedcJoLFWbNGlz3WlDpVNGLjB4Djsd
         DVlLUcpqxTUw3UZc7XWTeUCKCtwPEVimm7kGefXxqdtTs0JZbJQy//BTlQ3xskRzSZP+
         RNZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789216879; x=1789821679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eMkrmsdzvhlrfqjThqc4QsEj+XaqWtVZO9BiCBmcgwc=;
        b=IOoIKsJ+x7VaK8tzdnhgtcVouGypOQzV927qTMDECkFvJvgKhRnHz8eAtXOEixHSaz
         eWc1e35nENKnItsuLIMFLlG68FoD94gUMaTKv0RBCTHyyUruawAvaV7rStK0OoMtMaj5
         fDJncKIOVN0HvxFVvHkH6z07i/lGE38hXk0eMoPzew7xkCElVHQkfw7fNJXGpFhV8JFd
         MVPSBAc9nGOgvpP4+Oex+8V9SnQoJe8Jyxq3Hc2T06Se4bFzbXfOXol13SY/aA/MQ2K4
         leTBon8aErsvCOuL+EpuM4bT1zxt9NLGzlj0RTx6rkmJeWLUe7qoPY+i24NlzlNfWhf6
         Xe3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789216879; x=1789821679;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eMkrmsdzvhlrfqjThqc4QsEj+XaqWtVZO9BiCBmcgwc=;
        b=RadmRuxp1GLUQ3o+9C8nm9C41QuS70rnTxtnWjQkA8G0yVpghemwy6K9GroeKHEC04
         7huplxUv/JkHpZ46z3k9NNcnHiYqYyZ91WGuot5YjHrNDRgiBVzoY39GCSXG5Lndjnep
         uXh4QhnxutKItDkKA4MrE5eYnvWu24Znz6GxHUVHpIbZE1kwBSt2N7ch0FE7Jr4ZVaO/
         hj8brzAzmGGMmi14LHKqZ8YghssABissC9xCOL8sdokzhkMAMZ025IIN5U9gYNqrXEyk
         7ouu7n4HUXg7UNCfpdoo6ZYsMzQrsJ0kn45+7l4Id9p6OZg67A94xjR37Rqy+qP8YB5G
         ntZA==
X-Forwarded-Encrypted: i=1; AKwUvBweTbTzw0e+05j/zI4tD9JWucgoiD0YRc6yjIYGKyjxwVVYwFmKvbwmAkoKZDpRCIehVhganz7K9Mb8F9Q=@vger.kernel.org
X-Gm-Message-State: AFuF++lrkIRPvi6wrd2LaM7kbrcB+Jf7eXtPgoEO9ZeCYq8IWvG0zn3R
	/ZNAiTQCBeb9Psr0tevjqlkRvJu5EZqY5kv709NCoTkBD37rqCmxqKTnsiXAO3S/RcEkWW+lpxa
	NcodZ9axw9WSZVD+9wWG27Br1FEplGz4=
X-Gm-Gg: AYBFou1/oAx8V38wkbo6FtsM4nJi4EU9YNDrazrRT+pF9eKIr0wQojNsxvFgBB1h7yb
	pR78hXLSMabqNJChCevYBPDZsx3Mrd3Vks24mHQk/l+IC4hyjT8FIbwAbaE2gC1AbQ7R4FAORYu
	3aMlh3NxR/Y83gSrSc1DSPfEu6/xEDVvbWqbTyzfedxoIyDjh/GwG84UZm9LZ3WIXdBVakUXhGp
	VQyxv1pqu0KVSbh/FMYKl/1+462GwZas6eRBgd3sSB/O79mR+46w9q6VMkBXYsr7R5uHiERn9SW
	43MvNWztGrFclU3pvYUlYeWjUTR2MAgM4Kxrblk3a7tZWpONEeH/sjzfloPU90OgdSDg6s05YPJ
	w74/Jk2iOWDiDrQ==
X-Received: by 2002:a05:600c:4455:b0:49d:174e:2a1e with SMTP id
 5b1f17b1804b1-49e619c00a8mr98934575e9.19.1789216878599; Sat, 12 Sep 2026
 05:41:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911072125.2268530-1-kunwu.chan@gmail.com> <71507136-1439-4ee0-b176-e45ed3f60429@paulmck-laptop>
In-Reply-To: <71507136-1439-4ee0-b176-e45ed3f60429@paulmck-laptop>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Sat, 12 Sep 2026 20:41:07 +0800
X-Gm-Features: AcwNN1V7di3Qqso44IU6NZjZqKJSd5euIhD-AGL6x4f6Gkeg8fSwXoYBrEqOkMA
Message-ID: <CAN_Opa9H_XoQUgS5wX=5RUhavt4Ueqkw-4UFwt8-qjALPwAwfw@mail.gmail.com>
Subject: Re: [PATCH v3] srcutree: Don't transition atomic SRCU to big in srcu_gp_end()
To: paulmck@kernel.org
Cc: jiangshanlai@gmail.com, josh@joshtriplett.org, rostedt@goodmis.org, 
	mathieu.desnoyers@efficios.com, rcu@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 12:37=E2=80=AFAM Paul E. McKenney <paulmck@kernel.o=
rg> wrote:
>
> On Fri, Sep 11, 2026 at 03:21:25PM +0800, Kunwu Chan wrote:
> > Atomic SRCU must remain in the small size state. Warn if this
> > invariant is violated and avoid transitioning to big in that case.
> >
> > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
>
> Very good, queued for further testing and review, thank you!
>
> I folded the new "if" statement onto one line because some years back the
> Linux kernel liberated itself from the 80-column constraint imposed by IB=
M
> back in 1928.  We can now have up to 100 characters in a line of code.  ;=
-)

Thanks, Paul. And thanks for sharing that interesting bit of kernel
history! I didn't know about the IBM 80-column constraint from 1928.
I had assumed that 80 columns was still the current convention, so
it's good to know we can use up to 100 now. ;-)

Thanks,
Kunwu

>
>                                                         Thanx, Paul
>
> > ---
> > Changes since v2:
> > - Also prevent the transition when the atomic SRCU size-state
> >   invariant is violated, per Paul McKenney's suggestion.
> > -v2: https://lore.kernel.org/rcu/20260910084629.3695383-1-kunwu.chan@gm=
ail.com/
> >
> > Changes since v1:
> > - Drop the !is_atomic guard from v1 and add WARN_ON_ONCE() instead,
> >   per Paul McKenney's suggestion.
> > - v1: https://lore.kernel.org/rcu/20260907075829.2073224-8-kunwu.chan@l=
inux.dev/
> > ---
> >  kernel/rcu/srcutree.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
> > index 84c022ec8e09..07db4e459b30 100644
> > --- a/kernel/rcu/srcutree.c
> > +++ b/kernel/rcu/srcutree.c
> > @@ -1073,8 +1073,11 @@ static void srcu_gp_end(struct srcu_struct *ssp,=
 bool is_atomic)
> >               raw_spin_unlock_irq_rcu_node(sup);
> >       }
> >
> > -     /* Transition to big if needed. */
> > -     if (ss_state !=3D SRCU_SIZE_SMALL && ss_state !=3D SRCU_SIZE_BIG)=
 {
> > +     /* Transition to big if needed, but never for atomic SRCU. */
> > +     if (ssp->srcu_reader_flavor =3D=3D SRCU_READ_FLAVOR_ATOMIC &&
> > +         ss_state !=3D SRCU_SIZE_SMALL) {
> > +             WARN_ON_ONCE(1);
> > +     } else if (ss_state !=3D SRCU_SIZE_SMALL && ss_state !=3D SRCU_SI=
ZE_BIG) {
> >               if (ss_state =3D=3D SRCU_SIZE_ALLOC)
> >                       init_srcu_struct_nodes(ssp, GFP_KERNEL);
> >               else
> > --
> > 2.43.0
> >
> >
