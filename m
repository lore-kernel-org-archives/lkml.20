Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF745360EED
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790237665; cv=none; b=Ymtp7DFCwyyWQY+9i6NiQR39UNQfeOFBqIV8b7KKpIvsh+PRUeCwxjOz5pdS+oeibLFL5ZYalQXB5Y66tUkAfz8DOAyBrjyylv/QWd9Ktw7a95uuHgn9KtqK5X86faHUfoUv/Vk8CV8lPFdeF8gEFZXye6SflEuOfFsICxT+xEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790237665; c=relaxed/simple;
	bh=K0fsSgxKq2ln7j68MKS5MGj2Nkoi1eo+UetTzJbmA94=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LrccKdc3qTKqa2JKlgTrTy2lCn2Gpp2zN9d0IRKDx1lMp0DHessKXoQVSmJ/ntrFl9flexfYY5XIbcnCRim1v5QIdLR4MNeEpRI7eR0LWBHP2CfoyZhp/FHBMyVzFCbfYwWLTdiG5ni+iC+6c6/ETX8y+Tm0eWnUtWBmKm6HNFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Xv1PvXgn; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Xv1PvXgn"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2dd77300825so11009215ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 01:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790237663; x=1790842463; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QY+uIFb8Jskmb4qAUQ6fq8eqhb4SrN9u0oh78e9QSOg=;
        b=Xv1PvXgnYz3Odyyi3VMt13Xq08fy180jX2+nGtvHOZ6EoFlipfvsONtpNc/dhKZsYM
         6vVt96Q9d0YuaxEqbxhX5O9JyDloQXlRIVv4wu4ld//mTXkU54AcZ54l8CrDhLVpoowh
         WaZ/Cm7iaUMKIWY+6e/L09nSsnRuYo5VSmXyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790237663; x=1790842463;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QY+uIFb8Jskmb4qAUQ6fq8eqhb4SrN9u0oh78e9QSOg=;
        b=yx+j9Cm8nM+aoL3Wl4A8w15rB8Pb+/b167OQPpSXwEFXVyD4Kll+9dn14B9KA+V5yB
         hIp2PJdYdujF3TwOoQxs9cKeLnDhbdjKfvNBK6YYDaJyOSTQR8y2+TffLEGO46FZKRgH
         C02KoR+7mVwaRn2DUOhiFw1Ghfhu0PeyBZ8j+KIr6KmlcaEFIjZ4/KipwTgQ5RAEUW5r
         LqFXf2zRJE23mdR41sm2ZDwCUFnThBAZ/JTv1CMmfgEFmjBylKHgaOR6Wn1SNYIOnZbN
         1MZfrtRVcDjSj7/opLpvLhlC30BF6l+3WxS4RBuC70hy5GM8eHrsIMpk9tT+QdTpSMf1
         wt4w==
X-Forwarded-Encrypted: i=1; AKwUvBzbU3xHm6lxdz/YO8Mi8Yrlqv/jfw2uY+jz00wlJTcd4I5Bbzeym0QW7oCEGbpeTMM3bmYzu/TWONH6lPc=@vger.kernel.org
X-Gm-Message-State: AFuF++lt8UPALQJS9+LVZ2LuIOFgGzySKIDM5RuXXoNdfxWWsU7He+M6
	TthI2q5tRRwN1sC53K0WyANPM60+bP6oOmtGUl28OIt5a6vMKEA4RYQb0jNbA/J23KmVM3fRW9a
	YO1Nt7w==
X-Gm-Gg: AYBFou2xG233TlDtusQMug47FKdrh9vX+SxANeTUSF9PlIEJo0nel3x4A/AjOwQwdqm
	SallS79cWussauWz0EK1yjJSDtC6hRKi8kn7jj3n5AHrk8kRXVG+KksvB83PaUVnqc3H4xnTuYh
	dPZyxaOXkvdfi26jatN2OcuGC1oGXQWlXxL/1pzfQQqOw6S2GTUEwyQnPGwaZCvoDFYoenLqL24
	OK8+rIfrPzFL7TfM4V5onxPuQ3N8bvhpx4vIR5Kz8U/mzspxLZslU44TWTft0DKdU2nTPTxIOM9
	iS1aU0MMcH7FD4G/oybEnYth1c7ox8oc1rrgpyIYnpk5PK7xI8ts//FAFJwb7QzpIzPlot6jiFP
	Bs7sKf1sOFjahcbWIiRcT+ve+w8JliZvW8Hx599TrKgrzE1UUNlXbjhLioJwvcr3B6zhUTb/jgs
	2bFirK+FDm7z2jr3b9CbMvpJji3h8zQoXH4ovdja+FfIWg4ecoPQ+gyyfq8T0+VslXeGWu5DYhn
	+5aXOVev/59CDtAEvknSh83IvcXqWh+0/9E5A==
X-Received: by 2002:a17:903:1aac:b0:2d9:216a:cdd3 with SMTP id d9443c01a7336-2df7da8ac3emr16626245ad.18.1790237663105;
        Thu, 24 Sep 2026 01:14:23 -0700 (PDT)
Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com. [74.125.229.140])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5c16f6sm22562925ad.35.2026.09.24.01.14.22
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 01:14:23 -0700 (PDT)
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-142dce6e235so1382897c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 01:14:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxwRP5mOMU12Sm5XFmPXAOu7R650KmfEBGP2diWwZXnLx/Nat8GEgXjnwDqyfGPXsTmkXwgZU6GH363pL8=@vger.kernel.org
X-Received: by 2002:a05:701a:ca87:b0:143:3617:c595 with SMTP id
 a92af1059eb24-14504037affmr1305843c88.1.1790237656651; Thu, 24 Sep 2026
 01:14:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-unqual-v2-0-60a1407a0cd4@chromium.org>
 <20260914-unqual-v2-2-60a1407a0cd4@chromium.org> <CANiDSCt9nOM8OWY21Q=ei5dmOK2O+DB1aYdd9NrbLt3e+pJPUg@mail.gmail.com>
 <20260923162234.394061af@pumpkin> <CANiDSCvqC_Kn20zOA+dQBmppi4KAO5g_4a_s-opkDa+CT=0YWQ@mail.gmail.com>
 <20260924091039.1c4aab7d@pumpkin>
In-Reply-To: <20260924091039.1c4aab7d@pumpkin>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 24 Sep 2026 10:14:01 +0200
X-Gmail-Original-Message-ID: <CANiDSCuvv6HMiS2pSEJcs0JXEgEc3KLAQdWFoE0JADYY3q0ONg@mail.gmail.com>
X-Gm-Features: AclHuK_M2llILC4se-3V9ujJTvnBUyNjUPlWlcmqOnYpwALZ3LA8rFj7EdDtPTI
Message-ID: <CANiDSCuvv6HMiS2pSEJcs0JXEgEc3KLAQdWFoE0JADYY3q0ONg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] x86/uaccess: Drop the address space qualifier from put_user()
To: David Laight <david.laight.linux@gmail.com>
Cc: x86@kernel.org, Thomas Gleixner <tglx@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Sept 2026 at 10:10, David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Thu, 24 Sep 2026 09:19:16 +0200
> Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> > Hi David
> >
> > On Wed, 23 Sept 2026 at 17:22, David Laight
> > <david.laight.linux@gmail.com> wrote:
> > >
> > > On Wed, 23 Sep 2026 13:08:20 +0200
> > > Ricardo Ribalda <ribalda@chromium.org> wrote:
> > >
> > > > Friendly ping?
> > > >
> > > > On Mon, 14 Sept 2026 at 15:53, Ricardo Ribalda <ribalda@chromium.org> wrote:
> > > > >
> > > > > __typeof__() preserves every qualifier, the address space included.
> > > > >
> > > > > When we do __typeof(*__user *int), we are declaring a __user integer,
> > > > > which is pretty much meaningless. A value in a register or in the stack
> > > > > does not live in the user address space.
> > >
> > > Doesn't that mean it is a smatch bug - so should be fixed there.
> >
> > I don't think it is a Smatch bug: __typeof__() preserves all
> > qualifiers including address spaces. Smatch is just enforcing that
> > more strictly now.
> >
> > I'd prefer that developers explicitly say when they are crossing the
> > address space boundaries, and TYPEOF_UNQUAL() seems to be the right
> > macro, which also Dan recommended.
>
> It depends where you are removing it.
> TYPEOF_UNQUAL() also removes const - which you don't want to remove.
> It is also entirely horrid on older versions of gcc.

What about using TYPEOF_NO_ADDRESS_SPACE() defined in 1/2

https://lore.kernel.org/all/20260914-unqual-v2-1-60a1407a0cd4@chromium.org/

Would that work for you?

It uses TYPEOF_UNQUAL for smatch, but keep typeof for normal builds

>
> David
>
> >
> > >
> > > Somewhere in the middle of this there ought to checks that the value
> > > is the correct type (eg pointer v integer) and that, for put_user(),
> > > the destination pointer isn't const.
> > > Using:
> > >         auto __x = 0 ? *ptr : x;
> > > can be more succinct than other versions - might not help here.
> > >
> > > David
> > >
> > > > >
> > > > > This annotation did not trigger any error until a recent version of
> > > > > smatch[1] started caring. And as a result of that now we have tens of
> > > > > warnings like:
> > > > >
> > > > >   drivers/media/usb/uvc/uvc_v4l2.c:1112:13: warning: incorrect type in argument 2 (different address spaces)
> > > > >   drivers/media/usb/uvc/uvc_v4l2.c:1112:13:    expected void const *from
> > > > >   drivers/media/usb/uvc/uvc_v4l2.c:1112:13:    got unsigned int __user *
> > > > >
> > > > > Instead of __typeof__() use TYPEOF_UNQUAL(). It maps to
> > > > > __typeof_unqual__() in recent compilers, so the address space annotation
> > > > > is gone.
> > > > >
> > > > > [1] https://github.com/error27/smatch/commit/e53027a4e816a772403baafa83c09e4a94c1cb8f
> > > > >
> > > > > Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > > > Link: https://lore.kernel.org/r/20260825-unqual-v1-2-7024fb81b4f9@chromium.org
> > > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > > ---
> > > > >  arch/x86/include/asm/uaccess.h | 4 ++--
> > > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/arch/x86/include/asm/uaccess.h b/arch/x86/include/asm/uaccess.h
> > > > > index 3a0dd3c2b233..4e576c0b9131 100644
> > > > > --- a/arch/x86/include/asm/uaccess.h
> > > > > +++ b/arch/x86/include/asm/uaccess.h
> > > > > @@ -172,7 +172,7 @@ extern void __put_user_nocheck_8(void);
> > > > >         int __ret_pu;                                                   \
> > > > >         void __user *__ptr_pu;                                          \
> > > > >         register __typeof__(*(ptr)) __val_pu asm("%"_ASM_AX);           \
> > > > > -       __typeof__(*(ptr)) __x = (x); /* eval x once */                 \
> > > > > +       TYPEOF_UNQUAL(*(ptr)) __x = (x); /* eval x once */              \
> > > > >         __typeof__(ptr) __ptr = (ptr); /* eval ptr once */              \
> > > > >         __chk_user_ptr(__ptr);                                          \
> > > > >         __ptr_pu = __ptr;                                               \
> > > > > @@ -231,7 +231,7 @@ extern void __put_user_nocheck_8(void);
> > > > >
> > > > >  #define __put_user_size(x, ptr, size, label)                           \
> > > > >  do {                                                                   \
> > > > > -       __typeof__(*(ptr)) __x = (x); /* eval x once */                 \
> > > > > +       TYPEOF_UNQUAL(*(ptr)) __x = (x); /* eval x once */              \
> > > > >         __typeof__(ptr) __ptr = (ptr); /* eval ptr once */              \
> > > > >         __chk_user_ptr(__ptr);                                          \
> > > > >         switch (size) {                                                 \
> > > > >
> > > > > --
> > > > > 2.55.0.1007.g17ff1f9808-goog
> > > > >
> > > >
> > > >
> > >
> >
> >
>


-- 
Ricardo Ribalda
