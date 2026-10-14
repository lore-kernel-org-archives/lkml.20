Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE125616A6
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791996167; cv=pass; b=b8WBfZg/OiR5dOpZYCeh8fzpp67rQ8ZAbiLcT/cyukhQx+tmSlb+qTQwFlfLiQXrdTEgprEdkam0rGW6wUx+4kaWW2Lm2vlLF8g053AsukGF0NHA6SRQatHpnT8Jdf1f3dPx6Qi/Azyoj+ah3zN5AOhLGLD+ADgMf4Si5zpXq+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791996167; c=relaxed/simple;
	bh=rKi6pIGi82k0LBkwFIDIO88q817cjLLfthYLujR5pLw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SiM1Co0S1hTKofCeyjQ66xBqRw1yjls31lr7b8vasoZLkbfTVi8nvYRmRwJHMZ95Iw8MywuFC+CGZfZB7vWcKxwcg9gWh3JAYk3qpma8ERAJXrZy3g1SdhSEnkwTWnogbJRP1iCisF5832aChs5arhYuUkoVywPJ7/CLtAXzrvQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dmMXDdVY; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dmMXDdVY"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a0e1b0681bso31686435e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:42:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791996164; cv=none;
        d=google.com; s=arc-20260327;
        b=g9YhOL/LuTbopS09AH9/0DYmIR4hFo0OA+/+ihvx2MzfGgT9UT43GX+UnYFb3isjBj
         YOIn9f9ZmJHgh9w8lwUghaU3jIy4b3KSi06yPhjEJhYVGN1Mz4+dx/TYKKCdPHCScEWJ
         M0/h5LRX7VrJgTbB+sirQdqbk89tCq+fUedI7raE3g/k2Ojo/ZA3rAMNI/mD9IDkHEHi
         O3PdtHlpyIv0Qui6f7kTrC4PMUXfoRuDYONZq593Rd2PzXkXhezjO7YGn16V5Ut7kzKc
         pFhz39sU343K4pbVj1TgUqs3uEiC2Gz3YOL43Bv9tQOip1oHT6KxfUz04DboFFhjcMFw
         z0NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v6p8wLsPj+VDCmBDPQwmg7rxehQ7WvfbYU3RH6s6NRw=;
        fh=dtn+APK16jfvQ3jLcbS7R8kGklfsUSDVQsDPPxDwRW4=;
        b=PUmn275OGQRUU//0gt+CjTniljfsw0PYoXfgiZQPvYXwp5yMoIDPHiG3lJqGq9Ec0c
         1VJjwn6neF5VK6f4IXumHl0/AVIjAKuhs8tLnVAtLhQs88700rNqXT1e+1/RdTHLi2Qm
         d9EMTWt+hqWCKpDV4ZYNYq84XWjqrC0bBwwBuwHM5YurIFnyjqbkStplR29/BHmsrduE
         PaNAt79XDzpE/5JnZpVkwot9VQKC4vZOR861hL5yG0760qskbadLVltbf3h+yz/GM+jt
         A6x8ivfNGz/1n3/LeMllB/yht8NhnLYgkBJdBf3rgltNWkW6pFmwkBZwGTjS9gJFUexP
         fvYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791996164; x=1792600964; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v6p8wLsPj+VDCmBDPQwmg7rxehQ7WvfbYU3RH6s6NRw=;
        b=dmMXDdVY2jP8tZe8P6v2xi1BqZ7oM4Vo7UkR8hG4mqvAflhEuaDxi+XkmtwORVdvYW
         OkgvFV2QG33DnbHTumfqp9KW5Au7JA1YUs14FFNHPsENlSkYS7nNKkoCqIFBy5qjvs1B
         VzupZizSCTCJQRGfF0PN/AUSeYHz4G88ft8oteMcO0RuWvjov8Q7aQH13zYeDcgVfVqP
         gUQOas2wd7Hl4VVLMTXcEquTt9M0tv+1egjiIQIu7Sm7RnANC6Lz1ef2NqaCc876uVee
         JFxKeopjHhpEbAX5WLkLXnlZTPodWcNdZeTGZ2o1fiXNfTh0WCEIEHSOlPCjfzxYsZuL
         oKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791996164; x=1792600964;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v6p8wLsPj+VDCmBDPQwmg7rxehQ7WvfbYU3RH6s6NRw=;
        b=rEJ2p4ob77u7d//aX9GHCLeH4aicZ8+4KEx+GEr3JUCPAkrj+1+zxvzkmRKU2JQoKq
         tqmOk4HGfkfnOk4pT8yw92X1nxotJaYs1xIgCf0vdJrW/2y9+xE/Zj/mfEgXz7IM8rB/
         cAefQ3VvrWN5PW3mgAxIDpyCUQQr5eHhdIbbidbBA44wJXnmLKU+I8NQmrvyzCmQHH1F
         4uiwzyYZ2Of4hniRJx01Raz6Q9b/78tS/GyOMl8HhMspX2SKp69qDEW5Sr0xd2Jcv+M5
         KE8+O5Q9mm+R7GRWwrXynLJ0Pr11n/N2YcG/Qd1cgv4IFWqzlj6dNoglOvumOMorRoBg
         6/xA==
X-Forwarded-Encrypted: i=1; AKwUvBwojoZxiGKvtJytKg0jIhWH02M/XW/cLacvVwMNI80U5xUUS4C6mruP153gde/NQU1yrswI/oDZFCwE3w0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/xu7x/Mmtt0QYyAi3nAv9/nJkxfBNmIiwXnNHMmzgLnmT1gOF
	QaQ38i7vO2YQ5M2QjsxYRA9w8o2L4nmswH5MCq8P1t0toes2Xl2F3lPCXq8ypBimmaAZcn166Qk
	IgnENsqYWuh4aSZ6Xvx4clLoIJVVcMoqXjh7TUxjE
X-Gm-Gg: AYBFou3rNNz9yHQ0SyoHaSKBtzjQ8rnb7OouSzriTh8z1C73HewACUezP4hQzs5XXuO
	Ki/WxTMEP5+raqF11h2ab2sif/dms1eQqTmi9CvOgwpj9Kbz2ynFWQkNET9IUXoUNzP24cpdn2b
	PiYrQK/6GD8kHQLjFvp2KV3cpRM+0rAb2ZHrm4ccZu4QAyW3PQQAcABOS4yY75brgCDe7cXeep/
	ZDGdacybYGpqPU/D1ww6Qoo0GH4w2Um6P23nlVTNlKk4rsAKlokP0Y14cvTZt8KSBLlrfmYKHTn
	2IWvaqtAkHwtB3ujuw6DIT5VuXRl3s7wShZm2GmzFisvdchCWwuEf2uuewaxP0cdFWQVqsNJKN4
	Nc7ACdKSTBgFqxLcsTUb1xSphkO4T83SGscwiM8oniV5DOZblwU+/xEWRLPYo5W/nDQ2f6zYl8R
	D1F9MBEThzhDx/35SplOXvc3dMZyjAXQKv/nJWAtkmHf89zLbrGoyQ
X-Received: by 2002:a05:600c:4e89:b0:4a1:96cd:2f64 with SMTP id
 5b1f17b1804b1-4a196cd312cmr283584205e9.1.1791996163311; Wed, 14 Oct 2026
 09:42:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-kselftest-deps-llvm-v1-1-f2ee70ae1b79@kernel.org>
 <CAKwvOdmQkYy3xqTsumSxLdHpaXnt1Hb9g++DVmAYcx=cvjFBeg@mail.gmail.com> <38d31a6b-b3d0-4b15-9b24-62d2bd6f9040@sirena.org.uk>
In-Reply-To: <38d31a6b-b3d0-4b15-9b24-62d2bd6f9040@sirena.org.uk>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 14 Oct 2026 09:42:30 -0700
X-Gm-Features: AclHuK9Ord4aUgNPJNBcBx9FYXt-xGJSQPIiEoaEK27XDm7YBaJzhLkX1ABzBeU
Message-ID: <CAKwvOdnoZfE3bqNnRBTR4G805V4-iooe9YwS8ZO0ka2h9bgDQg@mail.gmail.com>
Subject: Re: [PATCH] selftests: kselftest_deps.sh: Support LLVM
To: Mark Brown <broonie@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Guillaume Tucker <guillaume.tucker@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 3:01=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Tue, Oct 13, 2026 at 02:07:28PM -0700, Nick Desaulniers wrote:
> > On Tue, Oct 13, 2026 at 12:40=E2=80=AFPM Mark Brown <broonie@kernel.org=
> wrote:
>
> > > +       clang_target[riscv]=3Driscv64-linux-gnu
> > > +       clang_target[s390]=3Ds390x-linux-gnu
> > > +       clang_target[x86]=3Dx86_64-linux-gnu
>
> > ^ should this be either i386-linux-gnu or i686-linux-gnu, or does
> > `-m32` get set somewhere?
>
> Hrm, that'll just be a cut'n'paste from lib.mk which does not so far as

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/too=
ls/testing/selftests/lib.mk

> I can see set -m32 - it sets i386-linux-gnu for _i386.  Does that need a
> fix too, or am I missing something with how it works?

Ah, no looking at
commit 624c60f326c6 ("selftests: fix LLVM build for i386 and x86_64")

it looks like selftests have i386, x86, and x86_64 where x86 is x86_64
IIUC.  I see you also have a distinct i386 target.  My bad.

Acked-by: Nick Desaulniers <ndesaulniers@google.com>
--=20
Thanks,
~Nick Desaulniers
