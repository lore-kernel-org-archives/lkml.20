Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233B83A2E36
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 09:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788688630; cv=pass; b=mzeEd1vuPKoQ+pjTNVZl0k02KPNul/DzPcUNIUXq1UUux/gUPrGah8uMp7GE8JR+3WTB9HrF1PayW+BO/L/OFdVFX93icwRnVkW6c4H2Sd5lTJ2/x0wfbuMO/w9acVCf1uypGk8J694cGS27GXG9CzIWrSoVbESwoH0g7Wa3LmA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788688630; c=relaxed/simple;
	bh=U13cH0KPgJnKYO004jjmqA/IoRiQ83LwE2ozRFiKgzA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dbhMNaCFLdJIB+9cCN+xc5htQdP4AyEJnPQRYrlep+JsMjsUV/7eNT7NHNIVc64qyCaAxphSIft/lwTI8mHLeqgyu9ASrTx7ZgCWRwtkDOptidUIsmnVgCHcItMrsf80zTk/aK/nldQfnRs/9LeXqULZoVcAhQOzl7IO9tR76KM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hu1kb8+D; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hu1kb8+D"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396673bd283so336887a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 02:57:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788688628; cv=none;
        d=google.com; s=arc-20260327;
        b=LQXSbuKX6vNyBP0RO/Dd+SuurXX/ZZ1ZPo33pbPr5Dm/GStbg4K6eLyBMrPGGXxLoz
         iYjs1uhl47ejNq3FHH6q4/xzu0PHQvOwh/zRvYtzOdBihmLlBXWy0M2ZZu2FBygu0igm
         Ji/lqhUmJniKOp4hqlImFkDPNaUE2yJu0Y4aGeqcgN7z3i9rSA9UXylc4238qNGbydUU
         I4on/3qJSCTVttinkM1mW9REDEtCoe0Io3oFWn2fSZW5MV/dqOQwGuIF4Vbe2XIPqY/m
         qAPuLn7w5wn6aIVdsVnxf9gZqavNRJUBk4qCNrWiSrEk/nck7oDsdNbR4VoJZh7+SAk2
         KhaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FNR0TadONT4lGDipXgfdwdOLaKBVMf8XKySJRN23CUo=;
        fh=DH0qnZkqR9mOruD+R2T8bTitU6PxzUttB+A65Xttdwc=;
        b=P32FPSV9T3Gt1hM3O3h53oAX2T4PsdCJQb/jpANRWjgUWlx1nXgDLFCcI2J9bN+LAX
         ttOg+cU5JbFeN1oQkP++mMkmd69cs+HKQZoPvAY2r6Z6qmkd32Oh34le3aFU4Y3aoyJH
         0ei62rMlxsVwtU89sgOf9f1A2EM3c7SMKwFaDIw7Aka1N6zLX1vlrCEEVTn0MWEYFiYZ
         E019m+N4HvyJ78DfSYqtHopLpHdspI9Z2EZDR+LEjrpMflHttQCg0bJWejwcIJDWyY49
         D98U52bqbIxh8SbiC5TcTBWe6nQU2/7FmaaAoa8tT0aO9DReYzvUFtPNX5MmkbYxn7tg
         HD7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788688628; x=1789293428; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FNR0TadONT4lGDipXgfdwdOLaKBVMf8XKySJRN23CUo=;
        b=Hu1kb8+DUmdvY0GX1WOsprHnENusDc4jSlgGCj3mcghmMb+WlfnDPwlMYM0IyKGMOy
         1tzw703XU0Mpx5z+/H7gI2UBM7JxK5s+TKYSzGVy7uPnS5kNn2mZ0fOFx1a9xwIQE0xP
         IcuQ4nHYGeYPDAnrIxNgwQkbGKbeWeA2x2DsyPZ5isKx7iB12bqx1o+IYgftxwzujq94
         cuxeKdaA8m3gHTSHcF+6LAPL/weAIS1XjCCyoA2/nu/lkaeJ4LwPC0V647usK4vkL5bL
         t1FCDcObN5qvRdfpZkTwcvqLRWw8jBBkM13EkmiTiI12RpvK/t9e4KP2km57A/cKYe/s
         NudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788688628; x=1789293428;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FNR0TadONT4lGDipXgfdwdOLaKBVMf8XKySJRN23CUo=;
        b=IcaEUQ1wIE5v3iRFoCya+n3iyZohCAS8nsCnuGlHOKk1dHiTdyBJ8czfquWPgHx9hO
         5H0vR8By0QVL570PgvjXE2fR5QJVAmnZyN76GE4kbXKdlwNJKJpKdjeZhAmh9ZvFIB4j
         p6PxDy1+rS0iVtd5JTirdXlt+05tC+1lRsZKIiYh7DNGGuES26ZCSonPx6TluJfO7B7n
         ID1RPP5fp3C5Ne59lyCngWSmMTFqYMhTKMPPAfogMUoNOlTl9v8UOZZQznJR2t6tAjmH
         r3TwbN6T3W74SN22A3eXeYVgMFrfv2M01g9LKztOQzMQGVA2+w9R88DaoFC4ckdV97Gj
         rVcA==
X-Forwarded-Encrypted: i=1; AKwUvBzgmG7FzDKEPRshLyZZr/OY5QpugHvFRWZFX1yjgS7fAmZ03Enr/OZKAQajgPaM0XaXHC12nhFComUMT/Q=@vger.kernel.org
X-Gm-Message-State: AFuF++nmR8tzTbcSS6gdlw/n8Ax6VFkLbKvGNY4JGWsczDmmSIxNs9d9
	ZNf/lBMhS5HbaaSdwwo65A01EUHiyNziFeAxCG9r0WcqFaUuUoxnoMevSUbJomTN3mbMOHU7Zb0
	jtkd4nD1Ci2daeyAaUEU0HQpI6Ol+je0=
X-Gm-Gg: AYBFou3ITlzRjJKQpxXRgUB4uKoBDsjbycIiW/0jKbWE9hLWnaWu7VYFKNmPX4LigTP
	H+w/tEVY+rWkvPyeyvPut5ZQbyU6av2GZKGWhbfoV8nOm+9U6i/fghB8vae4SaCrdvtLrJQd/HN
	2+lO8FE3bSEazCCwAHn9Dx1f8+h4IEZrJs119auyzoxetXn+GRJiI4I73s7wFCQTSMor4YH6ADe
	lfMQyIfiYY7zQZfi0d7phg3cWvRkhgBmEHRTYLLBGwL6/35n5sOPHNYBvTg2VKWYaHllq6aV+6P
	Q/j3XPwhSzZesc5tl6ISQJfYThxs96WW7EdL+QwrhtHCJ+kZ+QZgc/PUmBOH/WGBw/L25JMLZ1K
	8QAUEmS0rOA2QLtEUexUr6aT65T6laReIbHIhjrXOssGhmzoNuV8LNsGMWxDbo7FstEA0yuo=
X-Received: by 2002:a17:90b:1d83:b0:398:bad2:c10 with SMTP id
 98e67ed59e1d1-39b3d85c011mr8915334a91.6.1788688628452; Sun, 06 Sep 2026
 02:57:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906-add-rust-gpio-consumer-v1-0-24d192f93760@gmail.com> <20260906-add-rust-gpio-consumer-v1-1-24d192f93760@gmail.com>
In-Reply-To: <20260906-add-rust-gpio-consumer-v1-1-24d192f93760@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 6 Sep 2026 11:56:54 +0200
X-Gm-Features: AcwNN1WxK9zUI7wnq5z3F0MENjsFCu4a4OjUAQj32Gwuj-9LPj41p02F_uyi-BY
Message-ID: <CANiq72m6YZhqzE7GWEakmsZ35QN5UF_HTcVBavKxbq8cV7yk6A@mail.gmail.com>
Subject: Re: [PATCH 1/3] rust: gpio: add GPIO module with common definitions
To: Kohei Ito <koheiito.dev@gmail.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 10:46=E2=80=AFAM Kohei Ito <koheiito.dev@gmail.com> =
wrote:
>
> Add the top-level GPIO module with minimal common definitions. This
> module is the basis for future Rust GPIO extensions.

Thanks & welcome!

I see you Cc'd linux-gpio, which is good, but the GPIO maintainers
should be Cc'd too, since they are the ones that will be deciding on
this -- doing it for you in this one so that they are in the loop.

By the way, it is nice to see GPIO again :) Now that some years have
passed, how does it compare to

  https://lwn.net/Articles/863459/

?

Cheers,
Miguel
