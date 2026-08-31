Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DA8511232
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188537; cv=none; b=Ux4aYXKlfFd3ure6AwSvU9QXw5OTCPd9lDkVi98a8VU3WvsdOxbgX/w/FmG0/t8yo1FYcpQGg0HQfGxsm8/9xKmHNJyP+DLG0qGGWHFXh4Ndip2R1ppPbgT6q/Gf8bS7T7rbeXxIPcQOHyvnIaB7wHQYjOkosyFcyJFRAqyz5y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188537; c=relaxed/simple;
	bh=6QezWynFjDY6iD2Ek3DWmjgfvWRMneQIr+O0VUvLvak=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ORtPMUAXkUZMbBlYxPMVlJjNJ+LByulPJNVIkmwLwiiRQdg7xftN2oSX+7mm25qVGgkcVzSnFkc5guqrk3N9jFpho0HjxkIOrxkba1fVSYxxyG3Hu58Z9RzCZsQJCNnkFCMzZIOnVYBwcyHM6bPEKq/JpjvwVMpaqF4jUeibg+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FXZGZQVH; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FXZGZQVH"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so35566795e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788188534; x=1788793334; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DhAN+MObGYdkq0qNUYLRJz8fAPXVwkTjuKoe/ub31lk=;
        b=FXZGZQVHs2SBWO2X9IFazM+U/kUBL1rSEJwERFb09jGHCtnmPOzFn6Gr2JvWd1Q4m6
         xNV/pZSDeflPjDkJjOIlJBDxzesgTgsIDdSOPFuKqep/VbDGvts3ojI6+GYuaKPSgWoC
         7Qu5VQ2T64oTJUVSnOPufLaeDPfnbeXV1jMwtvMvpgHdAtp0VnHRthqxctOdbvO4CsJ/
         E0bJwI4LG2oEXdcTEmfOVTEqiKCJVNbG8D+ZMKebPyea66kSdT8gYE+PkUISx4pEbv86
         V5PAXV/UOaMhUZuhCInQfl92g4VMACmqBXn7T0xAOKljR73HVVjgspyUU95RGnXXUlrb
         9hCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188534; x=1788793334;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DhAN+MObGYdkq0qNUYLRJz8fAPXVwkTjuKoe/ub31lk=;
        b=tVJtXtb61zjeUKfUFegpxTHCe5NTg7ufXeX1hUDzVlBHoxV8FwhKnyspY/xHB8kzxj
         MkVCOt+pOd3bTO3xQh3XHHTnqHk++OQ63uGjNIcseM1iVmsJo823cvF860Z6YobKEzsu
         +RtL+klulsQTYb/AlmXXoa1ZGM2PvQ7HMJJxs6ECzSudRTQ9uL9k3Gmj+CIR172mBKQB
         lMk0kDzhKQdsI7BEgk3/mVBSxnJT+8vB9MnUtPjyYj5Bd8CZRPSxsB1dE777c95OL1mt
         xSpUbTLyPPzB4SazQ/2gi83uvLXaZd9UE4+0eMfIjKdy0vGNZ3+YnHsCQBPWUsO9OxTf
         VkYA==
X-Forwarded-Encrypted: i=1; AHgh+RqTLmjPwMA99B2kHlsEplNkCnCUk9jD9e9E1z5Z6bIQCuTbtm1xsyrP5bdllJUR3l9Ow4nayGObMu8Jz4U=@vger.kernel.org
X-Gm-Message-State: AFuF++mKE+cLj+GPbkx2P2EG1BDj7ZshS0ToccM541cRgmXg9/NpruWc
	KeU5N3LUvzNOVEr93l1Xq4UuLEH0mrdwjXfRFDGrYRZjfz+3uXcZ76uy8dlAvS1/
X-Gm-Gg: AR+sD130QvVJ1yItQfOnAegvq7bNbQWuxcDMt1K5V/kqrZrvkqELSO8Vo/H0KOblSZS
	/L/ppiyOPKVa9Qq1u45raarIvYER1Mmfv/0WMO8gr0FAL0A7OXqN+pNtbo/L1UyasyS5uYoQYAr
	nBk3PINOLc4wSzVlNtGJCwtAEikpvw9NbCg4Jm/wvLhbkwdATHVB8b/JBhmrF/XmjCjVd+aDAyK
	VcN0KbLjPV/uwyLEunUFcZMw0dxRG+V9kNQGG8LgUWwC+Llyou5LOfn/iHVm9LEqCEBkdWuz9PY
	OlvdLDfaux6RHbY2HAfEpGqhlBqgEh296jozpgMomRWjdaWzuIwJyUq0PaF/NGOuknww89uQeBB
	E5NBCpojy6cbZvGw6K29zXE7VouJ3uUGVinLHxccVbPlE8vBMTEC6le4PaKtNv5WEZPExGJr2Bv
	Angb4NunwDSpgrS+AwZMzSdBimheSLwxv7xzVBUcp+5+1XVvoCLavDELp/1AM2wvWrN7UjJJV/b
	HoH5oSbS7lTe/eVBCFSNK9WaQ==
X-Received: by 2002:a05:600c:b85:b0:49c:c96a:d36b with SMTP id 5b1f17b1804b1-49cc96ad411mr322825245e9.12.1788188533929;
        Mon, 31 Aug 2026 08:02:13 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccea87e1asm146662795e9.2.2026.08.31.08.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:02:13 -0700 (PDT)
Date: Mon, 31 Aug 2026 16:02:12 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?= <thomas.weissschuh@linutronix.de>
Cc: Zhan Xusheng <zhanxusheng1024@gmail.com>, tglx@kernel.org,
 luto@kernel.org, vincenzo.frascino@arm.com, linux-kernel@vger.kernel.org,
 zhanxusheng@xiaomi.com
Subject: Re: [PATCH 1/3] vdso/math64: Add and use __iter_div64_u64_rem()
Message-ID: <20260831160212.16cb7079@pumpkin>
In-Reply-To: <20260831150809-69e32b39-faf8-4e22-9a1c-74c15c019d2d@linutronix.de>
References: <20260831125557.1490398-1-zhanxusheng@xiaomi.com>
	<20260831125557.1490398-2-zhanxusheng@xiaomi.com>
	<20260831150809-69e32b39-faf8-4e22-9a1c-74c15c019d2d@linutronix.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 31 Aug 2026 15:19:23 +0200
Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de> wrote:

> On Mon, Aug 31, 2026 at 08:55:55PM +0800, Zhan Xusheng wrote:
> > The vDSO basetimes for CLOCK_MONOTONIC and CLOCK_BOOTTIME are kept in t=
he
> > scaled nanoseconds of tkr_mono, so normalising them means dividing by
> > NSEC_PER_SEC << shift, which does not fit the u32 divisor of
> > __iter_div_u64_rem().
> >=20
> > update_vdso_time_data() therefore open-codes the iterative division twi=
ce.
> > Turning the loops into a plain modulo is not an option either, as the v=
DSO
> > has no 64-bit division helpers on 32-bit.
> >=20
> > Add __iter_div64_u64_rem(), the u64-divisor counterpart of
> > __iter_div_u64_rem(), keeping the asm() barrier that stops the compiler
> > turning the loop into a division, and use it for both.
> >=20
> > No functional change.
> >=20
> > Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
> > ---
> >  include/vdso/math64.h  | 21 +++++++++++++++++++++
> >  kernel/time/vsyscall.c | 17 ++++++-----------
> >  2 files changed, 27 insertions(+), 11 deletions(-)
> >=20
> > diff --git a/include/vdso/math64.h b/include/vdso/math64.h
> > index 22ae212f8b28..eb39d3411981 100644
> > --- a/include/vdso/math64.h
> > +++ b/include/vdso/math64.h
> > @@ -21,6 +21,27 @@ __iter_div_u64_rem(u64 dividend, u32 divisor, u64 *r=
emainder)
> >  	return ret;
> >  }
> > =20
> > +static __always_inline u64
> > +__iter_div64_u64_rem(u64 dividend, u64 divisor, u64 *remainder)
> > +{
> > +	u64 ret =3D 0;

Can that be u32?
You don't want to loop many times, and it might stop 32bit x86
spilling values inside the loop.

> > +
> > +	while (dividend >=3D divisor) {
> > +		/*
> > +		 * Prevent the compiler from optimising this loop into a
> > +		 * modulo operation.
> > +		 */
> > +		asm("" : "+rm"(dividend)); =20
>=20
> This could probably be OPTIMIZER_HIDE_VAR(), but for consistency with=20
> __iter_div_u64_rem() it should probably stay like it is.

Won't clang make a 'pig's breakfast' of "+rm" ?

David

>=20
> > +
> > +		dividend -=3D divisor;
> > +		ret++;
> > +	}
> > +
> > +	*remainder =3D dividend;
> > +
> > +	return ret;
> > +}
> > +
> >  #if defined(CONFIG_ARCH_SUPPORTS_INT128) && defined(__SIZEOF_INT128__)
> > =20
> >  #ifndef mul_u64_u32_add_u64_shr
> > diff --git a/kernel/time/vsyscall.c b/kernel/time/vsyscall.c
> > index aa59919b8f2c..165ad9d7f154 100644
> > --- a/kernel/time/vsyscall.c
> > +++ b/kernel/time/vsyscall.c
> > @@ -30,21 +30,21 @@ static inline void update_vdso_time_data(struct vds=
o_time_data *vdata, struct ti
> >  {
> >  	struct vdso_clock *vc =3D vdata->clock_data;
> >  	struct vdso_timestamp *vdso_ts;
> > -	u64 nsec, sec;
> > +	u64 nsec_per_sec, nsec, sec;
> > =20
> >  	fill_clock_configuration(&vc[CS_HRES_COARSE],	&tk->tkr_mono);
> >  	fill_clock_configuration(&vc[CS_RAW],		&tk->tkr_raw);
> > =20
> > +	/* One second in the scaled nanoseconds of tkr_mono */
> > +	nsec_per_sec =3D (u64)NSEC_PER_SEC << tk->tkr_mono.shift; =20
>=20
> I am not a fan of the additional variables introduced in this patch.
> Both the patch itself and the final code are harder to understand with
> them in my opinion.
> If you want to keep them, they should be introduced in a dedicated patch.
>=20
> > +
> >  	/* CLOCK_MONOTONIC */
> >  	vdso_ts		=3D &vc[CS_HRES_COARSE].basetime[CLOCK_MONOTONIC];
> >  	vdso_ts->sec	=3D tk->xtime_sec + tk->wall_to_monotonic.tv_sec;
> > =20
> >  	nsec =3D tk->tkr_mono.xtime_nsec;
> >  	nsec +=3D ((u64)tk->wall_to_monotonic.tv_nsec << tk->tkr_mono.shift);
> > -	while (nsec >=3D (((u64)NSEC_PER_SEC) << tk->tkr_mono.shift)) {
> > -		nsec -=3D (((u64)NSEC_PER_SEC) << tk->tkr_mono.shift);
> > -		vdso_ts->sec++;
> > -	}
> > +	vdso_ts->sec	+=3D __iter_div64_u64_rem(nsec, nsec_per_sec, &nsec); =20
>=20
> This could directly store the result in vdso_ts->nsec if it produces bett=
er code.
>=20
> >  	vdso_ts->nsec	=3D nsec;
> > =20
> >  	/* Copy MONOTONIC time for BOOTTIME */
> > @@ -55,12 +55,7 @@ static inline void update_vdso_time_data(struct vdso=
_time_data *vdata, struct ti
> > =20
> >  	/* CLOCK_BOOTTIME */
> >  	vdso_ts		=3D &vc[CS_HRES_COARSE].basetime[CLOCK_BOOTTIME];
> > -	vdso_ts->sec	=3D sec; =20
> =20
> I would leave this on its own line for the comment about the copy for BOO=
TTIME
> to be easier to understand.
>=20
> > -
> > -	while (nsec >=3D (((u64)NSEC_PER_SEC) << tk->tkr_mono.shift)) {
> > -		nsec -=3D (((u64)NSEC_PER_SEC) << tk->tkr_mono.shift);
> > -		vdso_ts->sec++;
> > -	}
> > +	vdso_ts->sec	=3D sec + __iter_div64_u64_rem(nsec, nsec_per_sec, &nsec=
);
> >  	vdso_ts->nsec	=3D nsec;
> > =20
> >  	/* CLOCK_MONOTONIC_RAW */
> > --=20
> > 2.43.0
> >  =20
>=20

