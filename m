Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66F224DFF9
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 01:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789091425; cv=pass; b=elZ5K/3opfkrbgL0EKGUYLU8EP1n6cTaZok9Czst+0aPIXXh9DXJmBZMthTE4aCZUpimwup4ibVXOBIiIdZckRTI26KoA+M9miNjNXg9OaJPMqPaPOM0g8eErf3ywtGm3STk+QpXXVwWDdUFgvoMFAyOa/x8fLM9KEtppQLKFuI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789091425; c=relaxed/simple;
	bh=vx+ssvLQ/2n0xT68XYMop9NM0klSBbbzW7GdOKIDDYo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L37nfJDDmcJGvO/iYxvy8jL+nQBGzibpxDDoXjhpUgyf+UIylzXG4ruDwwz4ORSlwDbSoQMNZ2XfNxWF6d3s57Gn2xPDXhtRTRGzfOmVlflMZg+S9rfV/iv/q3ZIOjW4OKJDiW4icmc8SLu+Umi1fpamuxpNqNveGtnwsJTiY60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eVzV5k0q; arc=pass smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eVzV5k0q"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49b965570d7so4872905e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 18:50:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789091422; cv=none;
        d=google.com; s=arc-20260327;
        b=P90+aj4LICCNmdU61W4O8tkoH+l03oNZxcAmn2pb952G9p4omrF62x0nvMvGMt/M5t
         PjJ0T+gBwpB/giXPTZx/YV3YVlB0gS3C8cFi+zbzyzpws7fKWevbqpjAdrqb1f/xbz3A
         MUwhYqcY6pwrukL3ZwwYgNKov7G1X3ZDUejDmqxCVCNg0+Q1rMzYuR4B42y4bTqnmauB
         jSuc4Ujey2FeBqqKTdJmKYqV5zobSu/+D42dcLlZY2VsY9uLGYSGOPkieNx71a9ZagHk
         I5OZF456bcayRmzYLtYYLomWoHIZFIzsbFXU2qeaDBiG4MVuAVJxdOBwFURDdFW9Neli
         NJ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QCPrKmDOLjswZ/G8gb4hedrH78EI5NhsoNyjf+nq07k=;
        fh=uwjK/4RJSRIvi3lacwEYeAr/+BMF4MM2z6SK/jDyP4w=;
        b=DOxyKxyFwf9OLg/lw+3r5iU7MADk/H95Go6idE4I/lrIByWcirOFHyZ64FdfTjtddN
         hiw0SKkoLsKXzuifYKle4FwQiK/e2t9cy8zn0EEsytGyFJvr5XGx8jVaUQR7dMF/oRdM
         7xnVjv512CEpxI79z7gJUdSnsKyOEDVhF0uHkJGJGftOZrXMe2TSsxjpNA75IgkE9tAm
         TcZA8VBU6NcqsCBCidfhB5u3opJumWKxbxwfMF4m/UYRqwvOJ9JyD2+n4jos5my4NK+L
         fy0R8TGJPT1VpU6JglbTix59GH2ftcMAuAmr6z1wPP0FtXoIRZWDnYvYfZnZneSpcwbC
         e8aw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789091422; x=1789696222; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QCPrKmDOLjswZ/G8gb4hedrH78EI5NhsoNyjf+nq07k=;
        b=eVzV5k0qLx5hWDYWn+5hQQSM4bmYBZUR1AS2DJy38sbB/YC5dlIiyJYg9+fGVvsc76
         9pZ7hgvHuqkd8Ie/+F52HaBZ6lEmN3TPqZHhjt7RRhomD20izRz94rdrh5/SRrF1i5PO
         LZyz99alU1BVd7/8abqIvjqzQx+kWKr5GUiticqmITAiGq+IDSoN8wKdW6VYFxlXY5Fq
         BIX9Z18Ic9/okrd0wXE7yObWbj35xC8qGekJ5OaRdg/NEWKuwX37Fq8jjMgYFNZO5OfF
         Q6lmMsoNK1hpL0cHoMhvityBEg/zMMtCULxwu2A5YpyUlD4eBBYj7+Yavu8aGkYzoP8s
         WlGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789091422; x=1789696222;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QCPrKmDOLjswZ/G8gb4hedrH78EI5NhsoNyjf+nq07k=;
        b=lIQYje4eNjeDMC3MnHyUhcTIBPkfrlpFuBVLuH7IC/DWlUbURD98SC8AI0mjF0w7Ia
         55K0/OE0ide47t1jZBFIe1u5+pmDx9m7VnkuoH6H+P7iU8Vu98ZVUSLElp5jb47MF+ud
         6lFAKBNCNO5KjNTakufB9Rge3cw/ID54yIMKXN+2X0GjklY4plEqCPPSqNhc4MeSfhSi
         QSXFF/OUo8i/qJs5KNdu/Re+0INR7vNaTD1Az7XZr279e4eLuXbudo+XD0SSmr7L6GxQ
         aD8gQ9FeU96K291LBom167jtWfFJ20dNtn1B6aG81DkSluPMrkvtf5ZsSW1PcUY+Ovrw
         DD1A==
X-Forwarded-Encrypted: i=1; AKwUvBxKgOR4SiUghP4/mPnDZAK6HADiKSF9Qm7gzFQkUbG8CqJTmaM4gmXhiHAtkGagInNujh5HVDncVGxtaAs=@vger.kernel.org
X-Gm-Message-State: AFuF++kVSA/reatvHgxWukAANCPqoQuN7UTYtPivZhzBOzKH4qVStqll
	bdVfnQrvAXUGJ7zC3mE9cC8wv2CiSa9JvuWQXPMJwq3jsknZO6qve9IpXkqRkP5jISSAe5AZwMf
	GwXnGq4ExDZAnQGlhU3+jOhIvCuEjkBU=
X-Gm-Gg: AYBFou3JitzM4GICc0HdfAyJbCLqwfDpZTwRo7G36N+2Q3dD5BXmYuLvTxnFgCFUtV7
	skFUENwMfT20uCbPGYNxw3H51oce3lvHdBBqX+7JgEwXUG3+JM9exiBcW4IyTweuZgY5En/9KFD
	sl7KGoBdU+griOxOB18LR6+/DktPdT9cJlitpowzALV0t3PIt8NXX4JNMRC2WhzkRNioiy6vZi0
	RG8Vy/XIyfpVBivhF1lODsU8rTNS0+qm+adomk9Wo+Zd4gSr35pak1ggwChnLldtSNnc7epOq9r
	LJx2B5cxJJM7ofP9sOv7hAhSyyT+UMnCNQaC5+P+GU2b3kexUp7zOgqpl9ykmvv4IGAm4in3h1G
	suhv77zlBw+hqj/k=
X-Received: by 2002:a05:600c:4f84:b0:49c:fc6e:8cb9 with SMTP id
 5b1f17b1804b1-49e619dbe1dmr16170215e9.29.1789091421145; Thu, 10 Sep 2026
 18:50:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910084629.3695383-1-kunwu.chan@gmail.com> <d1bf830e-8755-4eef-a8f6-35612640a478@paulmck-laptop>
In-Reply-To: <d1bf830e-8755-4eef-a8f6-35612640a478@paulmck-laptop>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Fri, 11 Sep 2026 09:50:09 +0800
X-Gm-Features: AcwNN1VvrNWvy6Z_lG_xJ7XlHcRflo55ggo_837jUIbeAoVb3xV3EQxAkPXSWis
Message-ID: <CAN_Opa_X1Gq4DxMhZvM_8XPg96Anw6UWW2EnndtVJ6vPYKE0YQ@mail.gmail.com>
Subject: Re: [PATCH v2] srcutree: Add WARN_ON_ONCE() for atomic SRCU in srcu_gp_end()
To: paulmck@kernel.org
Cc: jiangshanlai@gmail.com, josh@joshtriplett.org, rostedt@goodmis.org, 
	mathieu.desnoyers@efficios.com, rcu@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 12:58=E2=80=AFAM Paul E. McKenney <paulmck@kernel.o=
rg> wrote:
>
> On Thu, Sep 10, 2026 at 04:46:29PM +0800, Kunwu Chan wrote:
> > Atomic SRCU remain in the small size state, so add a
> > WARN_ON_ONCE() before the transition check to catch any future
> > code path that might violate this invariant.
> >
> > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
> > ---
> > Changes since v1:
> > - Drop the !is_atomic guard from v1 and add WARN_ON_ONCE() instead,
> >   per Paul McKenney's suggestion.
> > - v1: https://lore.kernel.org/rcu/20260907075829.2073224-8-kunwu.chan@l=
inux.dev/
> > ---
> >  kernel/rcu/srcutree.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
> > index 84c022ec8e09..68441c32cebf 100644
> > --- a/kernel/rcu/srcutree.c
> > +++ b/kernel/rcu/srcutree.c
> > @@ -1074,6 +1074,8 @@ static void srcu_gp_end(struct srcu_struct *ssp, =
bool is_atomic)
> >       }
> >
> >       /* Transition to big if needed. */
> > +     WARN_ON_ONCE(ssp->srcu_reader_flavor =3D=3D SRCU_READ_FLAVOR_ATOM=
IC &&
> > +                     ss_state !=3D SRCU_SIZE_SMALL);
>
> Also much better, but we also need to avoid doing the transition in this
> case, because doing that transition breaks atomic SRCU.  On way to make
> this happen is something like this:
>
>         if (ssp->srcu_reader_flavor =3D=3D SRCU_READ_FLAVOR_ATOMIC && ss_=
state !=3D SRCU_SIZE_SMALL) {
>                 WARN_ON_ONCE(1);
>         } else if (ss_state !=3D SRCU_SIZE_SMALL && ss_state !=3D SRCU_SI=
ZE_BIG) {
>                 if (ss_state =3D=3D SRCU_SIZE_ALLOC)
>                         init_srcu_struct_nodes(ssp, GFP_KERNEL);
>

Thanks, Paul. Good point. The original !is_atomic guard in v1
already prevented the transition for atomic SRCU. I was mainly
thinking of the WARN as a diagnostic, since this state should not
occur with the current code. I agree that retaining the protection
against the transition is safer if the invariant is ever violated.

> Other approaches might take advantage of the fact that WARN_ON_ONCE()
> returns the value of its argument, allowing WARN_ON_ONCE() to be used
> as a condition in an "if" statement.
>

I prefer the first approach. Using !WARN_ON_ONCE() directly in the
existing condition would make it rather long and less readable,
while the explicit if/else keeps the control flow clear.

Thanks,
Kunwu

>                                                         Thanx, Paul
>
> >       if (ss_state !=3D SRCU_SIZE_SMALL && ss_state !=3D SRCU_SIZE_BIG)=
 {
> >               if (ss_state =3D=3D SRCU_SIZE_ALLOC)
> >                       init_srcu_struct_nodes(ssp, GFP_KERNEL);
> > --
> > 2.43.0
> >
