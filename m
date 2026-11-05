Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793837167;
	b=Z2OXAk4Xx2BxkzbLDiTWaGgAariV84U8mnPpxdCJKU1Quri3SIgIudLg4j1mUmtPA1y1
	 mLYZyZPfEICYOYcFHud0iM24O7RK+bGY3AeuNEJM0WUpiUInHTVkyoslxKNneGXJI67cX
	 e8NwnQXqXbw4eyapH1vqgAUAwxLdklbHkWypoeaP/UoUAwuI7+vSrm1h2HmuQ9g9x3czI
	 M0c9Ub7TgP8r2rUesXp34prHUfEw8kwHZ0VA6TLZ/9mfDG7523ROon/MPtRJyVMufZZPk
	 MmMKWaJTZhtfw7eKtd7Z4tRoUVN16uqxqzW92JmwTe4q2vVrRAxkiqscKgpxlxcit+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793837167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rBao9fgm6zvnqMZ/xw9mMi296PqW8mAwycCLa5M4/yo=;
	b=wxb0tSoKUmGvO7Fc4uvYlEwU4qHTt9W3goYWOPWto47yg12GMsUKV5mscakWBZs2fuF/
	 xb9JVsus1PzonqlT9vVgjGD7xa8FjJNcTIQ+uqk1PVOAWEdUI84RZZIq9uO7et9ekGzn2
	 c8Qr1Jve6Cjmzwnq53Z4xVbYccMQTuPPeEY2hpaAoqSZ4UNbrDn0Tl5pLuUl7OoM4KY97
	 xqsZkkf75xtrGMqsXpaGUAPa8hcEjc4lZbCuKDIDbgXpigVnH7Wakqb9IanVBC+UDlWxq
	 PfqL+ALv9BTqrWb8NJenk1AcX4l+cbD429mfLchbRT2k/FAXmDMurmw6HCkQ0It68IA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UW7+Lg7r;
	arc=fail smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F159C606A32D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 00:06:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F159C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UW7+Lg7r
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c247f6687dcso218045866b.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 16:06:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793837165; cv=none;
        d=google.com; s=arc-20260327;
        b=Xk9grSowyyNc8qya03rxBcgre6uN8MKHJPl2sXt38PPLls/sL4aOBzgqMPjWLmIovb
         rdyg9F+3MnLJ71/zdoBcmN+GgLsnWnBRok9numjaCvs5y2yecHGh6ASHiG/eVlsU3Zr4
         wCkuM/vZoq45UegZSplgrA48je0bUYNDvhusyzhxzmkW3q6lAmmQX7dAciAlE91bQKwm
         IZQKOKQqtIhMxUvpnjvPLdOplzPWDTblkyh+y6LMC23k7HsdakEVED7Hm9xbasEEfYW2
         Llfr3V3vDLao5zfoWvZFP7D9HDdO4rpixUS1992Acl5MMHpiimTFHkWIK7Z8TeI4uAXO
         W4Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rBao9fgm6zvnqMZ/xw9mMi296PqW8mAwycCLa5M4/yo=;
        fh=heA63wkfMLbTNmVBLg636f7U0IFFjK/JKlajoYn+foE=;
        b=OIZCNo4U9SjLsvkYoRS17aagWSbsDekv/vV1M7uuYxiVIYzXYA3e0F33zI7lNZkPZG
         kYRSFyKTQJ1nxtKL0690VkUwPw1YbspzxxsGYay5kplcNBguvdzCs8UNCECsrQm8UQ2h
         9kYtHdI3M+N6NuDVtrcBfIb0HPxwBRjCHIccr7rGPON/Qjxvxc7GRfv6u8NKIcASSc/p
         yd/G4rY7pzO/0eiBFFij5A1BlEWIQL36f/rbz+VQcZy/aGxgqhEuBHs29RzOs64Emx0f
         ApDTePjUqlFZTp1G8psirjWG1ufIc1Tz+yLxtAm/fuEbhZwrgM8SeCSbnx2KB1mg8bkJ
         Pzjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793837165; x=1794441965; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rBao9fgm6zvnqMZ/xw9mMi296PqW8mAwycCLa5M4/yo=;
        b=UW7+Lg7rFdK2cPOSHdibyhfqd0mNfE52oRphbaahRpCOHjIZJidko9tTbllyzCryjy
         siNubT2yNT8UsddMzx39cRlaaf4u9pnE+6dIm/dTOyiVwyDFMyx/T503O/SAkgV4IgXs
         efUG5InyQPdPjXkVj3FyrgQw8Tp3Uwud4aaLkD2TGlBzm2pE66Yo0XieOJu07M7lI+DV
         gUkNX9hygDXotIY7g19Ob5YY4jcsnCTMlsFTY/Azp5LW+ukD9CKA5AAnTO8zpTJXxWqx
         5Vgp8TB7FfNb2pRMsONUAcd0wfnBxqAeiMrEDvVnn/35z4BZWsrn2RkRHETiQqHGP/C3
         KXdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793837165; x=1794441965;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rBao9fgm6zvnqMZ/xw9mMi296PqW8mAwycCLa5M4/yo=;
        b=iNXaJSwnUYiw46lIqVLadOqE3dvc2bK0jCNWphaU//6ifDOfyiFrWVJJrz8/OxzZ5I
         3JUBEwxRkC2G5gTBqdxvhZ+zOkDyoDG0z7oVZaSVvAiEL8Meiy5YTCD4tnblRg7pcVd3
         0ngKwU4TCQHHWExvMmLv8l6iS5jvNm1u0PxGvR9XRqLDqKxmV2Q0VXDxch7sYWMHVXWE
         YbMtYGvgUuOERj6lSW7F4e93gOWVSw9n9vXfvgYW3TrMOvcSZyH+gDNzZgS9PivbGj7G
         j17vhVGpnbRedXpvSKhR3QGPa8rda0avFnJPzZ17K+IqZ3du5Ne7ThlcCuySHh+7rXj4
         gfIw==
X-Forwarded-Encrypted: i=1; AKwUvBxOToO1OMoiMuZsLJXCLaXOH7KIrg8CVlH72t69Oczt8NddHvaJVQK+ISvC5fVnxdsqjFrBbBdExgTg248=@vger.kernel.org
X-Gm-Message-State: APuU4Z801OxyQBGYf+ptnGti6ZWjP15kDOuDBh6GKtjTceLGs6jzu6DJ
	LWcv2ubLBPwHcXX8pOMIEcI43b/l7mSSKr5jzb9U4arZIr3qbrkzNEwT+IkGSrr76PC4riPylub
	YVMVoFj62EYO6asu/HVfzEUkS/tEcmsyduVMwMFrN
X-Gm-Gg: AYBFou3QOvw9rVdrZ5UpsUZbjiYUXAwGi6r4pzcvg2IC/YJDTwSeL+LdysJdVXC30Up
	2ofg5ICfOXvP1DkvMpNSG0LW33C7pZ74wYLMmvSM4YfulKjIrlRhSpVPZ+hw+N8rHv+3kkhbTmj
	Cl2j63agHlSaYBsCz2r9e/0q4L96bQ/jDcFbJYWKhCAb4HYton1oAEs84mHIf7wXpzwerPTtcJy
	5gPjwnYriAPjnOB1a8khAPrD1DvFx2BxIEdWmhWt6MgyecnLE/+z7HDc6OXqCPCcslfQk3FpTDS
	H8PrLbO9Kp0oEkypjVyVbASW70xBQEzdDczgNAPDaoliB0p6uwy2sKyIMpUsBH10TBwhWmMiS/2
	PkNe0x2CBcJGk90fwgq9229wnD92twrPnTJF8LDxvz2TERFW/2Pc7+Q9XAOUvuPOfOypuf70=
X-Received: by 2002:a17:907:3351:b0:c4c:b560:2a71 with SMTP id
 a640c23a62f3a-c4cb5603d9emr979541566b.36.1793837164883; Wed, 04 Nov 2026
 16:06:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023001603.560210-8-wusamuel@google.com> <20261023001603.560210-9-wusamuel@google.com>
 <20261028134012.01d52e94@pumpkin> <CAG2KctpGPHo-S3AEvBhK5HPUnDHfoJu6Z-r+cS1hQ4Ps=B3DmQ@mail.gmail.com>
 <20261030100215.6f8e0d4f@pumpkin> <CAG2KctqdPq6NmK6rB13s2bgM7kP2w4OMMy2hdp_OFMVYYhTnZA@mail.gmail.com>
 <20261104142307.431fc12f@pumpkin>
In-Reply-To: <20261104142307.431fc12f@pumpkin>
From: Samuel Wu <wusamuel@google.com>
Date: Wed, 4 Nov 2026 16:05:52 -0800
X-Gm-Features: AclHuK8Z7yNuvzdyvQXTyXXmXbvszi-XVmOSWc_IPj379xX-z3zgWWYR8Kt4UgU
Message-ID: <CAG2KctrY6GmVqsKP+fXYCsL6wDR4zp1kdRd7a7uOdCgg_JcMdQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to /proc/kallsyms
To: David Laight <david.laight.linux@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 6:23=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Tue, 3 Nov 2026 17:14:26 -0800
> Samuel Wu <wusamuel@google.com> wrote:
>
> > On Fri, Oct 30, 2026 at 3:02=E2=80=AFAM David Laight
> > <david.laight.linux@gmail.com> wrote:
> > >
> > > On Thu, 29 Oct 2026 15:05:45 -0700
> > > Samuel Wu <wusamuel@google.com> wrote:
> > [...]
> > > > BY_NAME matches names exactly, like kallsyms_lookup_name(), so they
> > > > would be different symbols at different addresses. Please correct m=
e
> > > > if I'm missing something here!
> > >
> > > Only that the user might really want one of the copies.
> > > Sometimes there is only the copy.
> >
> > Good point. I'll have v3 add KALLSYMS_F_PREFIX + pos/next_pos
> > pagination to cover these. A prefix query for "foo." also finds the
> > copies when plain foo does not exist (expanded on this in my reply to
> > Andrii's Oct 30 mail in this thread).
>
> I'm busy rebasing my patches - they got stamped all over :-(
> I should get a v3 that applies by the end of the week.
>
> I will add a 'prefix' variant for you.
> The 'next symbol matches' flag is exactly that (actually it is a
> this symbol is a duplicate to avoid issues at the start of the array).
> So in this case that application would always need to read
> the next symbol (by name).

Thanks, that would be helpful. For my v3, I'll keep the lower_bound()
approach so the two series stay independent, but I can switch over
once your series lands, so there is only one search over the name
table.

> I think it might be more sensible (less pitfalls later on) to return
> the symbol number - not that of the next one.

What pitfalls were you anticipating? If the current symbol's position
is returned, userspace needs another ioctl() call and an -ENOENT
check, to learn that there are no more matches. Alternatively,
returning the next position means every call pays for a look-ahead,
which for an unfiltered query walks the module symbols even when
userspace only wants the first match.

Andrii, do you have a preference between the two?
