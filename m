Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793728250;
	b=w5BHg2q3rAjqcHSE7ownaFp4pWq+2fGvpiH8TJ8ZGZe7WwMfNgucuxMUxCK/u2p7oAtU
	 GjhcD3w3EV3kzrv5u7Pu8Lt6Aj83TWCXCXiKS9gm5NokEGb0fb8kZRfziDU7mb2NklvF1
	 wOlUtHNLMJSLJuvDn3l1JRvGJx75nUNwp6DgKgrO9kKnu2gXx1ZSO6MylSWCkOHADG61n
	 5x0snDN6J6IM697BZtIubJ0MyZbnaNLe9evuOAuwHSPE6+7fAGx/pc4lpDsOVjSu8eesm
	 okNrEL5JYKQ/Hsv036kG9PSiO6iOp5bCL7TpdnDDiT37iPqxIBPiVugVg6wBtcCOqhA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793728250;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=d98sL6dlVlb3fgyLP/grb3l4g2YK6zKiWi4X2zK7GoI=;
	b=oP5CZjFCgTHHDSQnVZhQB4h6IdWl9tVEIn64viu2NLxIfdn9QmeWuLr3Ty4MEbYleegG
	 fMdGgPeevxe5XN0slOtTo7IR5YwzWesert+S1+VqUpvoYeljp2B+ieDbV/RAr5hYcudEc
	 vVvjVek2WIIKJmm+7LiGSQ2C4n2wxFmO738ZdJHgFbpJZuL/A++lEZQmg7D0OyMa1/Lgp
	 yPVu15yBc88YEv8xLEC+Wup2nEVmTqsX0rwKTB1uJUWkIOZldlO3EndCP2h/Ycgo7SNZa
	 HaHrZz6972xq7GlcnGGOE0y3BpezRl4stNumvbnFUd9CYEfnFQeQhvqbZb0oth65H5A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XpQVXOcL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31FF606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:50:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C31FF606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XpQVXOcL
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a206f0b95bso285e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:50:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793728248; cv=none;
        d=google.com; s=arc-20260327;
        b=P36YCxJrdk7p+VAbaH8WPIv/78SbJ27Q7sdh/6fU0zNByGnCHj4aRdjRkiDR2H5tBb
         0TeHc4e/Ou9CGkF4IfnFT6vEULVDdVHTb1DGA4K14OnfsjPk7BVHg2Nc3VyHbBFD4YKk
         9mldrYdElv2R9svIne5aF9wCL82lteSRw+Duuw/bdGhZWYEBdTDGOcwHvvcncJm5gZF6
         0mUoT5BOLUWXPKKofISSUuGQW3vBgalFXRVC9+D64pU1bGYknqxCm3ZHM2QCxekMKu9Z
         lQdGqzW/Gm+dQOiUSIoHFliItyI1oHD1Vk564QKp/4/Xm/iwgopTLcpzt+DSVQX3lrIx
         W8aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d98sL6dlVlb3fgyLP/grb3l4g2YK6zKiWi4X2zK7GoI=;
        fh=aMiy1Nfsl91MAWOxw9VF+YUNqPj+aVdXN4DBVA1fd7w=;
        b=HMxX/YpFdhTqxHodr0Bwz6mnjIPEmIVzPaeetrGEFYtUJhDqNe4+z7ubqOWL43wgkD
         gbsy6R4Jt32JL6TY9LnbSjvt3NU/2KO/1tebXI6MD2xj+O+Kdvn7+Qq2uwl/qgjHq0hB
         /gxqg6x/mbR5fQ947RSk5Ca/0ENseYBfHYWKIIgkh1zEToW92SjOk7NCgVWRN3ecNO/m
         AEjNx8wlmyPB8rgCX0p5GKOhQPq6YL+vMhWTEn2+jooW6zVaBPUmgYN+YdARvNiq0Ed7
         jGFxyKXDGe83z5H21uM2TcsUm9R/ni43GbQAWS272iIOGbyr+vOFcKH6EXU0xuvaeyad
         GM8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793728248; x=1794333048; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d98sL6dlVlb3fgyLP/grb3l4g2YK6zKiWi4X2zK7GoI=;
        b=XpQVXOcL37Aial4LhGuOfR0x/2gg3577Qp0W5IErzF49hcILsqHfnlZIhWxzc9xddE
         freQ3VDpWxIjTlIvrQZIK9rTKyIs3pSgzCwJncK424hO3iu+wTIS1pN0KkXOYRbkjae+
         uN2qvvkEwNB6GadJf4vicUmTKOlvRyNo9wYkBwkqLSuvU7fhmUNusdz6HtlyGzudE1jF
         fWmIkfyi7T+z1fQHIy0ZYx+yRbCYwOFtipOBOSUxORH8VdGxBZ6q53Q0a+uxdkgtaYoo
         ffVw5+5Cf6ToVF2we5Gg9C2GmtEvwv8C2tOv57C247yyrwT6o0EySsQPcTaZrjPqB2fh
         nhGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793728248; x=1794333048;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d98sL6dlVlb3fgyLP/grb3l4g2YK6zKiWi4X2zK7GoI=;
        b=QMtjgBmc0wwHZrAeYC+v8q2Ev2yrYMavfl+VS+dA4UIB9nKIFO6vRfdaLe1H5sRbLo
         yOOKmTNjtszmyYfuGsEc4oL7bWgTlS2hIEJFTf8px8+6oz5BBLM4cCHaOKsROZhvcqOM
         OUg3ycJa+92p90MtcLUvm+QH+NIi26w1Is1zTWiA6FlKGT0Nwj7SyVuIzHvMi+083FZS
         ZVIMYIM8JaV81Ad96hG0pE0wSCB+x768Ou12gzthtPRvlY/47bKsEjlUlRNZpYNiyxfM
         bAGe9L/OoMfFVikJSEEHvjXtj+snD+Et5YuzTNFSRSnyzoLxIMGUI2RDPTXKBGeSYVf/
         HFyQ==
X-Forwarded-Encrypted: i=1; AKwUvByY0CZniIhklpyzKGxtnFrz3LuJxh4XErOk/SErwYn6f+oyrK0mxxAqN+N8qiB2JrgC4jOzYx/TAm/9ZUY=@vger.kernel.org
X-Gm-Message-State: APuU4Z90C+qF5H/lJ7IyTX3OkPrnfXhge1GcPoJ41IHbdEaG1UBiXuqx
	aAeq58Fdj+F4RZgWA2pmgrFzhqEUzA1ikWrDP09IlxvTEK2a9LdaLzHfgNPP45FeBIAjC61LVXD
	WjbPgXbzY8f+AXj0Odrtk7iS0loawpIknz/KvtIlQgLS5YaMTt6cPQiVcuaDeRA==
X-Gm-Gg: AYBFou15/ZSB/LWgXS31CmrUgAf/r0g5etzmky5t3pThy6L2RVgMSBjp99WvozcPDZm
	ReWtAo8zjSb8fRF6ZOtMHPf5Z3WceXwuiJu5jmMA/G/kbVT6nnxFcbaxjwBc5mdODKAUIYJrA7q
	plsQlyIKfPODtR8DKv2bLNtosOHxbKRU9WcJwoBYLSLqmIm1yR4xfowmhfSmn8CBEqeUuhu/kMD
	JyHolVNVbEBphhR56CcAWFBRo7euIstuWYc7n7TZW3MQP/EWOKy/9TnSVtzJ7iG4uxmtnBjJUfF
	BlPi5ndIM43UkCEccTW4yiNo6CnAzkEQEcHp16Gmzhhz1cxDEBX40soU9pNsu46XaI7hRhLk7P0
	BjzjyrB7J/6dQOSnDSOzyVm51LpUGVMOaEJQt807X2SfsOFbEzCLdVtDBsIcuckwy7R4RpEjId9
	c/PezNvyriHACiHft0nBLVXYCBx87vqZA/Ltr3ssNv
X-Received: by 2002:a05:600d:848e:10b0:4a1:eb02:37c with SMTP id
 5b1f17b1804b1-4b2c55b2b1fmr867185e9.6.1793728247764; Tue, 03 Nov 2026
 09:50:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102234813.1069156-1-wvw@google.com> <aunKa8uBZJTCzVjd@willie-the-truck>
 <auoCjmMnzRE8c1cN@arm.com>
In-Reply-To: <auoCjmMnzRE8c1cN@arm.com>
From: Wei Wang <wvw@google.com>
Date: Tue, 3 Nov 2026 09:50:34 -0800
X-Gm-Features: AclHuK9_lwqQICSBvCDQ12EV2wMp0iVdU4Jo-z-GyS8-J8k5xR21p5bgCHg2xk4
Message-ID: <CAGXk5yq0Abvr3LvJLTaRoBFJSE+45LznsMGge3n3fU6hB3MiGw@mail.gmail.com>
Subject: Re: [PATCH] arm64: suspend: Save and restore TPIDR2_EL0 across CPU suspend
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	wei.vince.wang@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 7:49=E2=80=AFAM Catalin Marinas <catalin.marinas@arm=
.com> wrote:
>
> On Tue, Nov 03, 2026 at 11:50:03AM +0000, Will Deacon wrote:
> > On Mon, Nov 02, 2026 at 11:48:13PM +0000, Wei Wang wrote:
> > > On systems with FEAT_SME, TPIDR2_EL0 is part of userspace thread stat=
e:
> > > the AAPCS64 SME ABI uses it as the ZA lazy-save pointer, and the kern=
el
> > > context-switches it eagerly in tls_thread_switch(). While a task is
> > > running, the live register is the only copy of its value.
>
> [...]
>
> > There's a lot of unnecessary (AI-generated?) detail in here. Please can
> > you trim this down a bit? I don't think we care about the firmware part=
,
> > the stuff about idle or the bionic crash. The bottom line is that we're
> > not saving/restoring a live EL0 register across suspend/resume.
>
> I should get an LLM to trim it down when applying ;).
>

Fair point, I'll send a v2 with a trimmed commit message.

> > > diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
> > > index 7afbece885a3..c7b7fa6491c3 100644
> > > --- a/arch/arm64/mm/proc.S
> > > +++ b/arch/arm64/mm/proc.S
> > > @@ -103,6 +103,10 @@ SYM_FUNC_START(cpu_do_suspend)
> > >  alternative_if ARM64_HAS_TCR2
> > >     mrs     x2, REG_TCR2_EL1
> > >     str     x2, [x0, #104]
> > > +alternative_else_nop_endif
> > > +alternative_if ARM64_SME
> > > +   mrs_s   x2, SYS_TPIDR2_EL0
> > > +   str     x2, [x0, #112]
> > >  alternative_else_nop_endif
> > >     ret
> > >  SYM_FUNC_END(cpu_do_suspend)
> > > @@ -142,6 +146,10 @@ alternative_if ARM64_HAS_TCR2
> > >     ldr     x2, [x0, #104]
> > >     msr     REG_TCR2_EL1, x2
> > >  alternative_else_nop_endif
> > > +alternative_if ARM64_SME
> > > +   ldr     x2, [x0, #112]
> > > +   msr_s   SYS_TPIDR2_EL0, x2
> > > +alternative_else_nop_endif
> >
> > nit: We use msr and REG_* for TCR2, so it would be more consistent to d=
o
> > the same for TPIDR2_EL0 if the assembler is happy with it.
>
> TPIDR2 is not defined in arch/arm64/tools/sysreg yet (for some reason,
> only TPIDR_EL1 is). Since this is a cc stable, I think we can leave it
> as is and do a TPIDR* cleanup going forward.
>
> --
> Catalin
