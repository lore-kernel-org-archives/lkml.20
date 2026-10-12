Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936B87080D
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791778569; cv=pass; b=EuvAs1Bj7+AbkQPGZuIpUouptv7V3StKZ5XHh2oTtOrNm6WJDHO5C9g6o23jm1DOzJV6tWRXACcIgfflApGSQU6U+7vBWkGcEEEO/DTgK5zG2Unce6RSF4eYJdW0c7dyE4qycXCYhZobhqHC9BF5plXlVi3SzP/kTJ4HP5KUm94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791778569; c=relaxed/simple;
	bh=4aAnPaETAOU+Ufhay9D/FXsDB1jN6gSDnOn1vFCvUOQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LYpxt2gHGAowE5fn1ZRu6yMxkwXpiv8yai7d3QHlb6GMXeas2NF37WHvOhGC/iu9WMEUe80HkOmjXVsB46xQnjHkJ+OzGIfPHWzjkPajMbY/HIY6kUKdtWVyR3lgYTzJYHKtaMiE9S0gTf/GSui42Ub2Ap1BBCar31c6UxoyhT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CIqbqb8Z; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CIqbqb8Z"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8ab37e44643so7629497b3.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 21:16:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791778567; cv=none;
        d=google.com; s=arc-20260327;
        b=VOYI/Egja9xc0BeCdFISMzxHhh/AXwzV7SYhdudVqiX9LSVWdVaCXXLy1pd+xr3vyw
         FLTAVmyudUlDcWLAQa8z0MccasOiG8mnrX3AYVjSPWjzLLUHOEgP0CMmknqjSPn3RSgG
         GMTSkSUv0uz2CuGSelb54vZ73K48VdilcG7P/7adcqKL+dPsCp86YmnTNeclth/nPoV1
         jh0sngnWqi0iHO6PiNuXXuczoF/DlB/L6PCbX5ejWhLic+7pEaWzo2yKXk0nNCyg/gEI
         WoBpHSvdGXtVs7NUtMuKaLVZ2J3YwkomQIfgGyjslQ5zvl0JmrTICOi9sYkABojh/Pqx
         /Cbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FmrFlC4CymhdGvHPqaBIxxVKsVUaCyNEYowNbJO6Wtg=;
        fh=69KUFEyFq1D4rcSpzz7iF0QMmT4T4sXsaEgm1+D2k9A=;
        b=rF2hUKP17w2wMAn2dPwL0+Ik610enDJ1nk21S2Lk0J31SEqAMy79dDXVboqH9mAW1Y
         aUhUy0T0FxTt/6u/4dVAH/aYefPUYlP1tJhWsIBrHqjUw0QF054MKy3dQ0JmQhi1Jysm
         tKcILhKnkGzdrhsnz8Dhwmc2XOYvK5MK08PUpUVvtwnhKG6Mc0W2qEfC9WEcPQLyEq74
         42ruCyDFNutC2s4QgAa9pJmlgAqiSuwJou54E8ysjHbWTdc0Cl0pb1cxotZsXiQGt4jo
         GyPt0hdF2y8yhUdf1grmt5U/vGKlYBGpmBHzQOPL6Jc3WfFbUQhgxaaC2BY7rEoZGedQ
         2i6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791778567; x=1792383367; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FmrFlC4CymhdGvHPqaBIxxVKsVUaCyNEYowNbJO6Wtg=;
        b=CIqbqb8ZW3ZGCzesQ5obng9/Viri0Mxcq5PFOEUwB6lqhZ8wkL6YqmkLNx6m1yHYOh
         oMBrz0bTeyzqLTCJTSnFkTJ2mNykI4ILIN2OuhyCntPTu8F/h9yYSyj5TgkVkhBUV2ki
         HqCy68yFR95mnNn2wx2x/EBQFyZsWhrI/oS9C7QAZKQpVzPaZWY2oGLoi+ODBIZAVvQ+
         l4dwQSgp1IOxMbz+U7EIv6WKHtzjNgYIq1/lpwkkCjIZ9z4ubBn1XcZ4UR8l0iEzfLsu
         vgpX1kF0Jy/PWYFBh8JE4BNCJswJOhQjlYaO5ThUWA9LKAFMCNkciDt3BUuu2/9fcOb/
         0/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791778567; x=1792383367;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FmrFlC4CymhdGvHPqaBIxxVKsVUaCyNEYowNbJO6Wtg=;
        b=t5g2xQnrGkyhrzM8FQxmDDV7xcQ2uxPZsycbjatZJD79ujWOkh0910d8zXlViiL8mH
         KKAucASdyFlJuDJT62ZHyW5fvf0Su2XuqDnHfOrh1o4Rolmn0lcOhZAOVNKuBTUlMMLX
         k+SczBHwOM8yx0NRDJ4FapLhQYvX75Q82nusfzLrJFwRAzk0HsstWPiMad0KiVbxMu7f
         8Z3auADL4qkCCNJO2NVbc3Y2iLPZv7uuCrIqgs+Ittp+sl9c1ccemmGx8d2m805tKSr+
         vEUX088ZL18fqIubdXqFaKhlx2Si6o5vdpnOoIvjn0dD7yAwMEmhCwUnV+wd/q7Ffq83
         UzBw==
X-Forwarded-Encrypted: i=1; AKwUvBxb2RsPcpg+h6EXBeAYOvaq2Nh40p9jzNbMxdf8210n3RZCTh6eMf6SV0LsBksJwckSM+8YK161Nmp8l6w=@vger.kernel.org
X-Gm-Message-State: AFq9FYKibmTmwAPWZbBzGjsbezroOGzxbTxy1fblg87E+/zDSIlplvqE
	jqNw+n1/gETJxsfvKUn+TXfc2MIah8luMKbt7RHQlumn6Ppk65eVPtc/dhf21nejh96L50xDUpd
	fgQLCBZy2GaOUrJbDv4iVGZCOTy8jhUw=
X-Gm-Gg: AYBFou0gCoMlSIU8XipEI3G7De9ff9tSyif7/t2jhp6V3zTkJn2Z/ibEElbSrtmXqVp
	x1kTTIUavXVZSQhZICDulsb38HuANiCgZKjGuzs25B9XzLjTH+3AkMTEwNwqmJf54M78nA0Yya0
	c1TW0qnP05th5by/vCXST02OpHu73uPPyDC8qRlB+fCIHInv/vjabjqs+DlrpDM9qezqvOON47R
	dK6C2yUtTsQ/J59fpXjdtMd5ilWQRMBuC7BZzvOkUaJOEK9XFjdTcuh320aOjzLxaxMRTk27bhy
	U315TCdebgq2PBWwp6QqBquV95xy7RpPfGkXt5S4g6FQyLUyjDtgvK+5kp7vNxkTxldXA1Zix75
	8oTS06kfWkE7N
X-Received: by 2002:a05:690c:61c6:b0:8ab:3918:33c9 with SMTP id
 00721157ae682-8b07edfb3ebmr24808907b3.96.1791778567173; Sun, 11 Oct 2026
 21:16:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010093843.103169-1-kanishkasolanki456s@gmail.com> <DM14QKTSWM6K.YSJFASLMY53E@nvidia.com>
In-Reply-To: <DM14QKTSWM6K.YSJFASLMY53E@nvidia.com>
From: Kanishka Solanki <kanishkasolanki456s@gmail.com>
Date: Mon, 12 Oct 2026 09:45:55 +0530
X-Gm-Features: AclHuK-CkT6UlEdY9rvyIC5NaUw_85FFG0zYLy6H2r1vScvrdc1APxGJLTHTkV4
Message-ID: <CA+khhQvUULygvTwxEzQ5mae_saCRnk1GYXNWw+U99QpkpZ=1pQ@mail.gmail.com>
Subject: Re: [PATCH] mm/page_owner: make page_owner stack depth runtime configurable
To: Zi Yan <ziy@nvidia.com>
Cc: akpm@linux-foundation.org, vbabka@kernel.org, surenb@google.com, 
	mhocko@suse.com, brendan.jackman@linux.dev, hannes@cmpxchg.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 5:12=E2=80=AFPM Zi Yan <ziy@nvidia.com> wrote:
>
> On Sat Oct 10, 2026 at 5:38 AM EDT, Kanishka Solanki wrote:
> > The stack depth for page_owner allocations was previously fixed at
> > PAGE_OWNER_STACK_DEPTH (16).
> >
> > Replace the fixed stack depth constant with a compile-time max ceiling
> > (PAGE_OWNER_STACK_DEPTH_MAX =3D 64) and expose a module parameter
> > 'stack_depth' via module_param_named. This allows users to configure
> > the stack recording depth between 1 and 64 at boot or runtime via sysfs=
,
> > while preventing unbounded stack usage.
>
> What is your motivation? If you see page owner stack gets cutoff due to
> insufficient depth, explain your use cases first.
>
> >
> > Signed-off-by: Kanishka <kanishkasolanki456s@gmail.com>
> > Signed-off-by: Kanishka Solanki <kanishkasolanki456s@gmail.com>
> > ---
> >  mm/page_owner.c | 15 ++++++++-------
> >  1 file changed, 8 insertions(+), 7 deletions(-)
> >
> > diff --git a/mm/page_owner.c b/mm/page_owner.c
> > index fbbda7ba914b..fcb584070f1d 100644
> > --- a/mm/page_owner.c
> > +++ b/mm/page_owner.c
> > @@ -15,11 +15,10 @@
> >
> >  #include "page_alloc.h"
> >
> > -/*
> > - * TODO: teach PAGE_OWNER_STACK_DEPTH (__dump_page_owner and save_stac=
k)
> > - * to use off stack temporal storage
> > - */
> > -#define PAGE_OWNER_STACK_DEPTH (16)
> > +#define PAGE_OWNER_STACK_DEPTH_MAX (64)
>
> This uses more stack. Do not do this.
>
> > +
> > +static unsigned int page_owner_stack_depth =3D 16;
> > +module_param_named(stack_depth, page_owner_stack_depth, uint, 0644);
> >
> >  struct page_owner {
> >       unsigned short order;
> > @@ -172,15 +171,17 @@ static inline struct page_owner *get_page_owner(s=
truct page_ext *page_ext)
> >
> >  static noinline depot_stack_handle_t save_stack(gfp_t flags)
> >  {
> > -     unsigned long entries[PAGE_OWNER_STACK_DEPTH];
> > +     unsigned long entries[PAGE_OWNER_STACK_DEPTH_MAX];
> >       depot_stack_handle_t handle;
> >       unsigned int nr_entries;
> > +     unsigned int max_entries;
> >
> >       if (current->in_page_owner)
> >               return dummy_handle;
> >
> >       set_current_in_page_owner();
> > -     nr_entries =3D stack_trace_save(entries, ARRAY_SIZE(entries), 2);
> > +     max_entries =3D min_t(unsigned int, page_owner_stack_depth, ARRAY=
_SIZE(entries));
> > +     nr_entries =3D stack_trace_save(entries, max_entries, 2);
> >       handle =3D stack_depot_save(entries, nr_entries, flags);
> >       if (!handle)
> >               handle =3D failure_handle;
>
>
>
>
> --
> Best Regards,
> Yan, Zi
>


Hi Zi,

Thank you for the feedback.

I misunderstood the original TODO comment in mm/page_owner.c:
/*
- TODO: teach PAGE_OWNER_STACK_DEPTH (__dump_page_owner and save_stack)
- to use off stack temporal storage
 */
You are right. I will drop this patch.


Thank you
Kanishka
