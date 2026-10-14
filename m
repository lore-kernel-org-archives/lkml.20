Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38904F4024
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977351; cv=pass; b=lVTuHj10RjB465rWieBHRPj0xjMh5ZosDk24GeiltxFkjg7CyfORpna3CPP1mDZRihF31bDEx8vuyvUD1Zzag1xkAF8Lj8ODteNpWPgo1Rv8K9L3xDtIofnP4tZCtPqEOKAFW2FAZEo3KvBl49bZzmZQIQf1HElZJnHpyKCkJnY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977351; c=relaxed/simple;
	bh=Bm8IXeZCCjjHRHqufoiH0uSm7tIaA4fZ4x02DGLBDgM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XVqB/6xHHNjf60I7D//KsjbOpZQMAidfRy69frq+P1Vt2GnPVhecm7l2GEqJA/WKfpMCgb4lNg5a37CtJIS0VUVoIeMrQTZ5T1Q/QjJZ4HtztPdcRomuZIQjN8ziRJ5sobc/muY+ECoPnUyoODPG5I+dBKQslKOKL6R7rbGj5mc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EkAqllS7; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EkAqllS7"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35159e0092aso446341eec.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:29:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791977348; cv=none;
        d=google.com; s=arc-20260327;
        b=bS8KDBzy9EdGYagnv6VVQPMFIhDdskpU5jsoTLSirS7cENsoVWbDiTNriNmz36vLHI
         1X4sVQ7Qr2uA/G2GPwXooE1C/CrKZ+pPB87P5uF5jI+2s8zSsQjoZ5HkfPcDW2QbsIf+
         c5DnywfpVc7NmOrCkm7kc5j7NjmT2V78NzsOhL+705zT7T1+wxN9NCe+RUxY03yp9suL
         jgibZ6VwMuZ+L0S/RrYFymVLc68XKRlk8CltQEg4H8qNAlaCv5pyMSqYYZC/gKArlQF1
         hJLhIgkS8U2roE0lzEWTXiT+zX2CyNTsRLANIeq5eJnGZnXNZW2mt/aBX/jTLMEIWw8z
         nynQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xWJCwZOmpC49YtbA7QzlowrBvokYI4WD90uvALsrwIA=;
        fh=cdpGPM7aMXNrN7sQ3sjeKEKuUteNw/bmoC4pufi9bDI=;
        b=JixaVfZCbdLvWnBTHOlOkjRu5cGHfx4UJorrYCaEfrX7Dj8vLaOxm3icX5I5TBktiX
         /SzUKNAmlduhM0iGnGzpgHOxuzVdcQt2VSsdS4085HSRAcFlUrVdCrHE6XOiF90pEGFH
         c0dTUvrAtv4G8ekvi9jKYMdzY4BWiWnIyoH5mNElQ76VFw5a18Tp7V9kcm1TzyYx0o2Q
         asWRl6GqadWhgXh20qaeUnm+MkmfcbgisHoRK23b6lru9wpPUAcpmDPemtXXKGGKQmtL
         eT93piW6mmRQtWEzvV8+xGB6d/Bt2Pj0ZtEIozEOKc3pRuqe7FdjNxalq0lZe7A8KFKv
         2rww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977348; x=1792582148; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xWJCwZOmpC49YtbA7QzlowrBvokYI4WD90uvALsrwIA=;
        b=EkAqllS7uOOZxDGJ4I1yKdIi3WQSBbyUhPsWLoVzgJERDBlfP0X9cEpWzjyHAR90JC
         Z1zW2YqVc7X46XPiuAerNf9mNnAJ0uUF6PLz0rzePzi7U1lf5J9vz/gZr1IuRwk27MI/
         4/D886vhZESIUjDPJZRvHbQYWiiMvCS3NjhX5siJV1JzVFlBVMBE4d5Q1ZOlRDw5uGo0
         qEQHzjWEYvo+agj8c1xw4Nkq2SVQg9Ys3jvU8s3NkIQ4fYLQcX3kMyght8wz2N51o7tV
         AXXBZTinlSID6wvgzNqIrr0dJv5ZGB14N23uEZXq5jf7doeVho73k08XFK/CJX/hTW5i
         pPcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977348; x=1792582148;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xWJCwZOmpC49YtbA7QzlowrBvokYI4WD90uvALsrwIA=;
        b=foLVptooloKjQLMxW2DB0Kj879tZD1IO1+ad2WkCTRy3MPZWozTG/Z/fkpIKVYLyAm
         r4fbsDeaCuK6ozpoxghX9E3BEXlN4bQkhss8jGIeUhZ07jQO/JyIPLPl12ap1TGV4Pra
         lpZhTxWwuLeZiBrL7MQe3JIVQTaooFuuiScCteT4oEBL3gn1Wan7ZUCbI9qiOEeQZ9cf
         WazXd0Z11dhsaeSpjlU+3NqjviSGigeYvUuy/eHrS3uMgNkBcaiqZHIiO8bYFzpdQ7Kf
         5/srgpYOLtVpYle1snI8sMDwRKSG/343xmJZK+occRebL2LFLKTCj0BaGvxMVEYoNH8t
         Tibg==
X-Forwarded-Encrypted: i=1; AKwUvBzBl1DUoYGSYS/vgxxXZYySh1w3AY/Q2esiFi4i8gNT8fGDkZhBSJ+FZjmh7LeQfroPJ/YjkJuA/qTo3rc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYO+9UG5tw4Wf6nPpgV94g9i/ed8ej8SRSm0wnUxjmo7Jy4zh1
	LKZ+PQWVMinHz5/caGRVkPD/N4Hb4WXW5OyD22dZeglhykR1QIqdd06tCEvvLKP+oawHUaYTtD4
	Qn3UJJbFVW95lKmM+ogvLbtvFRb1blZU=
X-Gm-Gg: AYBFou1bromY6Y7f2E7DW2nghyOxTB4OkAqT/C/LF3xkERyv7FvLmLGmBfrNP70wgqh
	+i6Y1wROBV9JqYkhEEQ6ajzyXAmWazaDgt3Lbh9h0grmBNFwRQUoTE4+Gkap5cNe6gIX9Nbi6Lp
	10OFx8QCq/aoMfT0u7aFYr5qnsRTjNCAfEJonAAsgUDisESfVQIBtJzN9DRddqUuuwEp9wPdeqM
	u/5EbCloJANWDOX4fUr9eS9D9NFLzBWZp13M79wm4/5C6vs5hHPMt9ZBeL2YV/1dPp8Z3ciGGRp
	bzPcYZw9EZhG5urgeclDE0kLottqNEQ/T9tD8nCbAA7zkmY1QULf3Yt52jUDaZyYrjeEUEooHyH
	dU8ox3e6cCj9EA6pWI7DNoiTt//mHPL7c8d7tFJvZ9FOojGGmLhp8Dh96TWlANa87ZxWuXBQeVH
	I6c/pfymU0LsCDWPvqzEVSIE3IWAbSczg0RN+wmQjLyFv8tm52qW0=
X-Received: by 2002:a05:693c:6215:b0:35b:cb8a:8ce7 with SMTP id
 5a478bee46e88-35bcb8a919dmr14326600eec.1.1791977347656; Wed, 14 Oct 2026
 04:29:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013223946.1836757-1-irogers@google.com> <20261013223946.1836757-2-irogers@google.com>
In-Reply-To: <20261013223946.1836757-2-irogers@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 14 Oct 2026 13:28:55 +0200
X-Gm-Features: AclHuK8qVHO7HVQy6LgzcUgjYcQf3EimC6SJcN58PVqcWVdOf6T45eXZNeTLsEY
Message-ID: <CANiq72mLUh1JB=9e=tqStuL_H3=Ormx5v-uFkCDp-0zZm7tBrQ@mail.gmail.com>
Subject: Re: [PATCH 01/11] Compiler Attributes: Add __require_explicit_initialization
 macro
To: Ian Rogers <irogers@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Viresh Kumar <viresh.kumar@linaro.org>, 
	David Teigland <teigland@redhat.com>, Alexander Aring <aahringo@redhat.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	driver-core@lists.linux.dev, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-s390@vger.kernel.org, 
	linux-mtd@lists.infradead.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 12:40=E2=80=AFAM Ian Rogers <irogers@google.com> wr=
ote:
>
> +/*
> + * Optional: not supported by gcc
> + *
> + * clang: https://clang.llvm.org/docs/AttributeReference.html#require-ex=
plicit-initialization
> + */
> +#if __has_attribute(__require_explicit_initialization__)
> +# define __require_explicit_initialization __attribute__((__require_expl=
icit_initialization__))
> +#else
> +# define __require_explicit_initialization
> +#endif

The LPC slides mention Clang 14+, but from a quick test in Compiler
Explorer and a `git log --grep` on the LLVM repository to confirm, it
seems the attribute was introduced in Clang 20+, no?

If that is correct, then it is not available in all LLVM versions we
support (LLVM 17+), so we should add:

     * Optional: only supported since clang >=3D 20.0

With that:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel
