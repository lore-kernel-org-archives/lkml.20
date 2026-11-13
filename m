Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794558957;
	b=UR6dglQVJnaXtzxI8Y8KWnD5ta+Ae0h3ihPAEIgwdmrswVO4Guc8q7tcIP6Q9wJIL6Cl
	 HyeyQ1jgaQH9ofFgcXuTR7KjRZ/O7VI1XyRyhQttFPJhSCDHem4jwW2GnHHQcSR1Y+6h6
	 ATBd46o6W93jJYqbtDOPz9xd0Xf9XSsCTYwPL+ORsodgdgpUfnypWOfzlnSIwSpqIIWWP
	 Ub/2L/m5eu8ey4RQ/UHAG5lzSIFZOyfMpfow+kPRcIyKsCcN8TQoGjjgMlRwpC6gdU2ig
	 p0JroJFgA8AjDGapCv4j2SV25NlTp5azPOABtwTH2ByjyVrETeDt8LMs4IhApIJsJkg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558957;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3//W1SccWhFdTlPexPwjCv5xsCxoGns1OWm/hxtGYRo=;
	b=wKAm47Xx9StXlWtDmedWk2rxwIxLJ7lgCIvYW7b6T0C5hAt3zd1fQICw6vKnUxvs+7gX
	 d2JX2PnxhwcWSzS/S7O0M5d9oT29H3UcS8Mr+tqPKI2AChGBpv9ySdVjfwtDQBQJOf3Os
	 mbYaB4N02RSiQcnqSlmkyj3f/qTzYi9eu5BHCw3E6HRZR+zC/1D7cs4bp6coImAOUUEm/
	 3GyCPAYCdf3wIahrnAdKzoBqKsbgy7QyF6WszQDoV+ikbvGC1Qa3s2TusbxOhy9UgUyOn
	 X+YwNMyq1xk/bVisrpmuAf9/cNZCzNnh2jEl0OjiSz9DREjZuEq52lKXUCmtiEbmMmQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wCih3SqC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF45606A339
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:35:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDF45606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wCih3SqC
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b3b57a31f7so6097897b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:35:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794558956; cv=none;
        d=google.com; s=arc-20260327;
        b=Hd1btE2+B7U00G75Vz4fHuDNmuRE5ZLhGmJduEPWEj14o1VyZ8RYNZHiZM7Y7bCq+9
         Up+IPvHMm6aZ7zxAlQXNKO9bkHgUdOFHtrxzRY0dtZfrWwL6fC/gx+dtn2VR/E+xxupR
         xHUM4kbPZ/lQwTP8fSXj8VOVm5792FYJnOuiqWM0A3R0YMdVcgRrqOlh6h9xe0K/50e0
         t6aQdlh0+YzOOM0CYHsWNrJJGUN1bp7aacPOll4Qg2AO5cqoBL6a+JBOh21VDnNtCysg
         cLNPXtTwWwCScBWfnLNNjsGvTLtgcFG+BZWBqdv7GqM8C9vJ6KR3pe3r5t2gFveKy8t0
         ugBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3//W1SccWhFdTlPexPwjCv5xsCxoGns1OWm/hxtGYRo=;
        fh=5b0uHJm35BWr4kSslPr5WohIJwOVjE6V51YXz0V70dc=;
        b=giGcZnopNWSejd5D/t61XPIPNNH64tYvevWqvRHnZUEuXOaA9BcWTRdnWrctZOKWoT
         2vUWZXSAE6rPrxpsbSuxDQ8osjqAl2i3cL9fdNz0MfYwvIMYO2v79Y4fPqGrV4AFGQ+S
         p9xjGE0g8idNBG9vmnqPtk0bbNFasGBr3ndlHQ8aR+NaUGd4HFvBcFAqmfmFPowvlNfO
         1M265ia7g1eUG4F+6i1/l/f0q4rIrCMqpohlNM94FfmOHoUb/LcnK2LzC7cVgxqImahq
         H3Tfsf3UbZukGGtKr0vNEU09AtJsqG+CTwKtMwamikGeiEsjTSr+0dnQJyCSn/b2uRYx
         Kaeg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794558956; x=1795163756; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3//W1SccWhFdTlPexPwjCv5xsCxoGns1OWm/hxtGYRo=;
        b=wCih3SqCFjiokFFuCiGE8bgxgKqOqFWbaixdaZCHhdELPiz3V/EVTF7tHVVKlTH5GE
         nPh36v2HzXxI79kH2E72Do/BrMCcc6xgoZsIMHClx+fG1ccw8hq837vkZpgeENmJfrXM
         L25fd6wmGjjVYtSjCAqqXAWA9YQNqZkdcHXV0Kh66flYUPCrXovFdsD3q+b8wzm+a3kg
         e66OnKeGshNK7441tjnml8487zhBEQBMIfDIg5XXOw7IPri4vNDUAVUxbkHzMhal1v1s
         B3nydFcyZTfdVhgVvUwwU7P6CZbPJHthJuntCDUKmwyNUZNse7IcitkQ3ZRKhntOyqgA
         tK6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794558956; x=1795163756;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3//W1SccWhFdTlPexPwjCv5xsCxoGns1OWm/hxtGYRo=;
        b=rJez8+aldRxx0nf2eqfG7ipvVMqkIdTbex4LjIf0MqK2z/umieKnnpEwVwBNOzgLWh
         RjJniK4UxgmeDSWediQ2zuDIEqJ6IZzVjF+ymBA2mx4GhxNY8G74ba7talZkF1/eC7dm
         nkYt+b/5YGRphg95U4rMd0rxs3CHlvwAM77SpWzX5Q1qCNjC0fs+OBauzXu+FdK3614c
         UvueXB0jUZGHj6vryVfKmnPpdgxryPqmD/117tiFG2A9vy/T6JGTj6DOLiWHcxMaww8p
         fReLR8jFcCyTRaTceI7nBsRwsOrFH0HKlFw7XZFGUZpg4ABOeyQOUIEaxnU9cYpTR/8D
         bHZA==
X-Forwarded-Encrypted: i=1; AL+hErFL/ExlVSKEoQX0wBIdYgJXS7AsQtXYyO0x/Am6I/hHZIYJnKOyTBZgXKI0LS5oT0N2x27U0E3yu+Ub9iE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mjl7IIb/c24CVxcZ+Gq6fnnafMuJCYprCDeYAkb+PWRHItTY7
	95RIF6gVbIMLXybCju1mhYqdY7tuKw7ZOW2vudicU06pluqn6BMdVbBTWanGk9xGH5zu0B2eE6i
	dmblwQxcbDeIDKYV/0wnI3cy3gY710rYIgPZ4jJo=
X-Gm-Gg: AYBFou1Bp9NCZwLF5jEuY89ttn1AlS0FoEWuq86cQldkDAW4P5LrSc4HTc+aPAzvJTP
	Ekt5cApn46hBOLsPIFi3+B+fi9axkNulr/bG9mxu9qjn6UT81e+N7YLUuw9jvPwhQQ+VW3qUErq
	6IWnsZ5Yq5oJV94MXX4A23f7FQbkZWDhBz67L2aayZIkMD+YEhI5t1OH23pi5yQEhTKdLzdgW59
	dqpcL7+61dFfiPRIYG9zrcscEr4iBcgtHj166SJKn2aeXR7IeNZOQA8xSvpXYi8QcSecPy9whbc
	iGGekSoRRdDz+SRF/LniHuFrwZ2h8MjaBN4t7T8bBTYQRSZyeWtmXczYq+ZYl4sYAsoWm/SQ8qo
	2LbJeV1/6nYyhqnMcVw5C23vWbR7bj47wumsOLgRurryGpZnhfI6JDpca+WgKouO9Pg0YYN0nni
	EITzyMoiSkB4KbTrcpDYSj/x29cS0RyX4vRfzIBMquOtLBDTWl8t9gL2/4wbgV9Kt9y5NSogPPG
	PVT17LbIB9Ouj6tLXj2ceZ2ynwysQYm7gh5L+7vH1IdUDHiRzZkwO0I43c0j9sOLTMOyb+ylsze
	Mmy79mI=
X-Received: by 2002:a05:690c:e0d0:10b0:8b0:ac9e:14f7 with SMTP id
 00721157ae682-8b4aa2390d0mr7838307b3.28.1794558955813; Fri, 13 Nov 2026
 00:35:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <SN1PR12MB2528812E26B65457239E9EEDA57F2@SN1PR12MB2528.namprd12.prod.outlook.com>
In-Reply-To: <SN1PR12MB2528812E26B65457239E9EEDA57F2@SN1PR12MB2528.namprd12.prod.outlook.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 13 Nov 2026 10:35:18 +0200
X-Gm-Features: AclHuK8hCsr1kiCDrmCd8AvqeYChDR_fWiDi7TR1WcWTBYMvGP0zAoX2zTtEXHA
Message-ID: <CAHp75VcR0EjuEoq3PWwVgt38fcOB_gNh7v7_s1CUqnLFwNbcNw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/2] regmap: add APIs to bypass regmap_field and
 work with reg_field directly
To: Victor Chernyakin <chernyakin.victor.j@outlook.com>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, 
	Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 9:01=E2=80=AFAM Victor Chernyakin
<chernyakin.victor.j@outlook.com> wrote:
>
> Working with the existing regmap_field_* APIs requires you to define
> a reg_field, then use one of the regmap_field_*_alloc functions to turn
> it into a dynamically allocated regmap_field. But reg_field and
> regmap_field are practically the same struct; all the *_alloc functions d=
o
> is shuffle the data around. So this RFC proposes adding functions that
> cut out the middleman and take reg_field directly. Patch 1 adds two
> of them: regmap_reg_field_read and regmap_reg_field_write.
>
> Patch 2 ports a driver to use these new functions. The result is
> shorter and simpler, since all the code to perform the allocations
> and manage the resulting regmap_fields goes away. In theory,
> there should also be a performance benefit (we're doing fewer allocations
> and have less duplicated state), but I haven't benchmarked it, so take th=
at
> with a grain of salt.
>
> If we like this approach, I can post a v3 that adds regmap_reg_field_*
> analogs for all the regmap_field_* functions, not just the two you see
> here.
>
>
> This is not actually a new idea! Both it and the current *_alloc approach
> were suggested as alternatives right when the regmap_field_* APIs were
> being added [1]. The *_alloc approach was chosen without much
> discussion, but I think (and Patch 2 demonstrates, I hope) that
> this approach is the cleaner one.

It may be good to Cc your attempts to the authors (and active
reviewers) of the mentioned change.

> [1] https://lore.kernel.org/20130604210137.GV31367@sirena.org.uk

--=20
With Best Regards,
Andy Shevchenko
