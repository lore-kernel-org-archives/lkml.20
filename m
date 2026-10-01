Received: from mail-lr2-f32.google.com (mail-lr2-f32.google.com [74.125.230.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A03409275
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 16:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790872699; cv=pass; b=oOcBb0HZ31xb/Ct18hOunZp31PQgaGqsX5XPrUqRqFpG1vRIBz6mXmh354IF47wISiV+9K+QQHD5Ey4eFv41FCqCZAhf95NeBlWFIrjQoXVue0iGMqeWMYvYUJq/f1qi8RSw95jbE3AdklnHgUSAZBV3/a1Q7tU+1vyeBCiQU1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790872699; c=relaxed/simple;
	bh=Tkkpu8EjfEfUgGdvTsr0VXaJMzXzzWP82sMlDhW0au4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E3kKyVbGW7fw816WZzY5FnDEwTdxA44Wac+DPPDYiLRy094gEmzybYv9zQnQgGBPNlDlRxpoSR2ERPU08scuwF6GWwyv58t4j+hGvhzFBxuYnbH0BQ+F/9RWSPtvoSJa+ZqTwi3ytFj3X6evw9mcKzlnAF40kcZi5OhKBksgwSU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JKd3lMbI; arc=pass smtp.client-ip=74.125.230.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JKd3lMbI"
Received: by mail-lr2-f32.google.com with SMTP id 38308e7fff4ca-3a3156692e3so12404731fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 09:38:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790872695; cv=none;
        d=google.com; s=arc-20260327;
        b=lIcXric8YQM5XXW1XtXB7tzLjGDSdfjz4zkx2pbeBaZk0YUyVsdr/YmRy7uTgiolvY
         3comnEnO0r87nNUR+2aeqmo2m1dYykp7adgM0STXKxIXjodAoYcY1FSHce4UCmKmYTAe
         ObMcX8lj9sqZ0atNKv8DPiBcA4oUy4WFKuDlJiycswFCsmTKs6Dp/p2XYHINuWIj45ar
         pnUwo7giD1fhT0gRl7a1RIOVr+pTS8BZLkip+RRQkBegv5X8Sx8ZB1MpXlVfZ4quq4z1
         lUGVfvSUFC7qY8JvBthh91P/TGfy83O82gzms23g5B4vPU2NTaMNFSlXPSWm1WfcbJla
         Gmfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DAks9HEbKHdTGNqvLK3jLR1OIYMcVMx3tnEDOpF2WLA=;
        fh=iDEco7QoUjwyFkTICMb43GRdKfqUm5Af4nAL64HBVkk=;
        b=i2Ee+Nz0M58mQnGbK9EUNJHu15DL0xgMQ7geDr9cE/iPmLergxXwMBY/5ML//ISmKn
         Utxm3g8KGH6QRmYTn1eWghoszNZYjYDPLkSTE+Sy6LOCVnEjnw0yfQnCX1rrFEB8HlNl
         dbWa0Yf63J3slfJml3HrNx9ccx7YqUrR8ERw8yNbOmzLErjj57dmVRZiInH1v37UqYCj
         tvjiIQ+ot599hwQjoSS3EYt0Unh28C2P90IOwGXPosnI171AsS0S58NdaceYaxBRV3Vv
         g+ND6OjmRKgijsD9sGInEwKKyfSsRpjWtuhgu5oEm1kHWdYsjcqfwjkZ5aI8wDLgvRic
         265Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790872695; x=1791477495; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DAks9HEbKHdTGNqvLK3jLR1OIYMcVMx3tnEDOpF2WLA=;
        b=JKd3lMbIaC2h6KYoiJz7CjT2SaLbMsM06aQIWoqBHoApUYWELG4mi9QTsF4MlbccKB
         TIFwjGL3UnlOCwYtTGLQRSc4//t18GMqnbPyL9MTwYIdcQ6/Nd6ExrpQmHNSbEwAq07/
         MzkMaOSA8mugHjdjROUT6Qnel39L3obfLI2k2Z0D90XpT2iBnPqdD7WocZTAp7HI/eo2
         c9lueViHxXUMtNIVeOxulZn3wGtNLntN4yLZUC8TbcqDFkXkXMiHj17gWhZs5X1NKn3F
         TZeawem4+AumNQtdfn4hGAD9hldxOLPdvYHCSeMfXGMCqPthysvmtbpNr2Ut9wcx2v+X
         CLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790872695; x=1791477495;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DAks9HEbKHdTGNqvLK3jLR1OIYMcVMx3tnEDOpF2WLA=;
        b=yKBpI0iZnzXyT8Dln3PNmRpsnoML/XhCAB8oy7vg60h584uNsCkCpakvpU8KYr2xNS
         cxGy1FyvA3aFOFgdgMgfeoktaiCsdQVoXu+jASHswxqOb5VfPVteeW/yqGHTbLR6hBJ5
         9Qx+brvPTsCPW9yKpjdeLOL0ABvfuhyIzJNbA8gMLBwWtJxEJHNsu3ug2cbDynKxGVZK
         eEN+CbQ9U6LLS1FtK7PaNX2D/7y+AlULuBQjenNNXWxPdeekH3SNmReSEJ2AjmG0+586
         awqv6n0NzNuhcxJheFfcH4RW9lRX8YU0oyzqiiwuYeBoz5EebntmPFxJDJl7odJ1jXDt
         0AfQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6+pG7XesU76A4BeCCDauhx6JteILCR1Ejw2JyV2w8g4WUN+UkVg+dlFFHyvgww9sve6pSofgzjsNZ3/Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/f//kRU0rve+NyNirNpd23iXJedE3IUkLHVuC8JBDr+WCayas
	l3/601tDCz9ahDXeNySxVd1QYf7uQPeaN1Rs2u6BB43J9xy0ad+clyPn32nt8RtzZy/6lSHiXli
	t8Q5lVw79NMfzMrllVskhurOJPrOZ+DU=
X-Gm-Gg: AYBFou1Tqg3HwWKs23pWKIIg5nz6mO3zwzPzsrJXq8aCNDSgafQNgSaOwh9uVmTkLgB
	Muoq+HOE3j6jEOUgIfqyaYmYdHarJdpR2+4vpIRBQnzkI3koHmXSiia+VLqvbtQWRQ0t5N+98mT
	rmQPBE4zeq/tMdgW3i4LkP9JirRh/8nnbQp5Z2iFa7ztTDWOG/cVDJFBDz8ho+4DSqyhRgHP4I8
	v3FeszXSqx70KphznWwg92Aw6Mu0BI+lBDpWhwzwFEKj2UfAlfMF3axnE+qOnlFtV6BVyywMYcP
	cBZHvA9trw+ZhxyF/f3p2mzQJBuJ6kwPkluWcs8FkoTnShYaCk4eDZcQ7JezlwS6zV4Z/FlmAhk
	RFzM74FpmODfW0lMfK8x3As3lR/tVt+zAO/XmveXd+0o=
X-Received: by 2002:a2e:8593:0:b0:3a7:7db1:2f58 with SMTP id
 38308e7fff4ca-3a7833a51a0mr9948411fa.15.1790872695012; Thu, 01 Oct 2026
 09:38:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHD2OOfP=h=qS6nP4dtn7RTQqMEqOvXD+iURXJ7Rgc5KFjgi5A@mail.gmail.com>
 <93716ff0-e693-4056-b6e7-9d221a3c58ac@intel.com>
In-Reply-To: <93716ff0-e693-4056-b6e7-9d221a3c58ac@intel.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNQVJJRS1KT1NFUEg=?= <fredericmariejoseph@gmail.com>
Date: Thu, 1 Oct 2026 18:38:02 +0200
X-Gm-Features: AclHuK_6GxbtLuLUuFoO7naoD2n3zXVDcV52qv6-TXXJEhcqasFSHpSmWcdGQT8
Message-ID: <CAHD2OOdncei-nAvFFXfvqOuJ2mkQj3D12+eShcRW-kwHrt+GPg@mail.gmail.com>
Subject: Re: [PATCH] x86/its: Make ITS thunk pages read-only without the ROX
 execmem cache
To: Dave Hansen <dave.hansen@intel.com>
Cc: x86@kernel.org, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 10/1/26 08:24, Dave Hansen wrote:
> Your mailer is sending out HTML, but there was a plain-text version too,
> so the message at least made it to the archives. Using git-send-email is
> the most foolproof way to send these things, fwiw.

Thanks, noted. I'll try to use git send-email next time.

> If execmem is being too aggressive on for modules on !STRICT_MODULE_RWX
> configs, shouldn't the fix be in execmem *module* code?

Ok I see. Better to fix it at the root cause rather than in its_pages_prote=
ct().

One thing in the attached patch, which Claude noticed and I didn't,
probably a typo:

> +    if (IS_ENABLED(STRICT_MODULE_RWX))

IS_ENABLED() takes the full symbol name, so this should be
IS_ENABLED(CONFIG_STRICT_MODULE_RWX). As written it is always 0.

In my config (CONFIG_MODULES=3Dn, 6.18.53, ITS mitigation active under
KVM) only the Kconfig hunk is built. I tested your patch instead of
mine. Every boot reports
"x86/mm: Checked W+X mappings: passed, no W+X pages found." (it reported
7 W+X pages before), and our boot tests (kselftests, LKDTM,
kernel-hardening-checker) still pass. Thank you for your quick review.

Tested-by: Frederic MARIE-JOSEPH <fredericmariejoseph@gmail.com>

Regards,
Frederic


Fr=C3=A9d=C3=A9ric MARIE-JOSEPH
N=C2=B0 TVA intracommunautaire FR78788461903
N=C2=B0 SIRET 78846190300015/78846190300023
fmjconsulting.fr




Le jeu. 1 oct. 2026 =C3=A0 17:24, Dave Hansen <dave.hansen@intel.com> a =C3=
=A9crit :
>
> On 10/1/26 06:22, Fr=C3=A9d=C3=A9ric MARIE-JOSEPH wrote:
> > That's my first post so I hope I do things right. I found what seems to
> > me like a bug, and worked with Claude to find a patch. Hope it will be
> > usefull.
>
> Your mailer is sending out HTML, but there was a plain-text version too,
> so the message at least made it to the archives. Using git-send-email is
> the most foolproof way to send these things, fwiw.
>
> > With CONFIG_MODULES=3Dn there is no STRICT_MODULE_RWX, so x86 does not
> > select ARCH_HAS_EXECMEM_ROX and execmem_restore_rox() is the stub that
> > returns 0.
>
> Ugh. The origin of this seems to be:
>
>          select ARCH_HAS_EXECMEM_ROX             if X86_64 &&
> STRICT_MODULE_RWX
> from:
>
> > commit 47410d839fcda6890cb82828f874f97710982f24
> > Author: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > Date:   Tue Jun 3 14:14:42 2025 +0300
> >
> >     x86/Kconfig: only enable ROX cache in execmem when STRICT_MODULE_RW=
X is set
>
> That commit is trying to change execmem internal details via an
> arch-specific Kconfig tweak. It's also logically a bit silly that what
> an arch supports:
>
>         ARCH_HAS_EXECMEM_ROX
>
> depends on a module-specific option:
>
>         STRICT_MODULE_RWX
>
> If execmem is being too aggressive on for modules on !STRICT_MODULE_RWX
> configs, shouldn't the fix be in execmem *module* code?
>
> Maybe something along the line of the lightly-tested attached patch? I
> see the "11 W+X pages found" message without it, and the message goes
> away when it is applied.
