Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B69D48A2C3
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 22:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789685381; cv=pass; b=IRLDJbZzfRSxcPYYxHq09wCejIVrcULTT1rHrLy9mhUs7p6DIlYofExomYl6s2hwecJJQWYLx2mVjRzQxXFNh+343vgAQAwTocOGs5hxiAqEs6O5tdIz5Z99sM9NEt2l/6K4+QfFrYEYF5Bs/824+Wdbcexovlo0giX0Kkw219s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789685381; c=relaxed/simple;
	bh=M2q4JEGXRGUd1pDT7+w9GldgLWSXnNh0kwpB0BtvRoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tJReicECMUKICRMSUJWRyZvAoOhSTwFIZC5G+LiQOFJEt9O8IA95whkH2BfRz/SU3D6cjFQLN0ymjGY6fVOMKzKIUCwlWlMsP56BHPLnoJh4jY6XzfV/BqNfE7Lyd8MFFUd+EoujUGxBDd9gHhOftqpRjvH6YYpVaQUUWhJogqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hM0+P1PX; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hM0+P1PX"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912df756so929365e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:49:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789685378; cv=none;
        d=google.com; s=arc-20260327;
        b=iUR/QPn5MC2lxicZHq7QJy7JB8HIbJM28F5se0hlzLzGPtn9CxM1SPklMVJVgDZU5S
         2vd9s2d3XTbULe8CkCNx4NsxK7u1fzNUUUs7OJ6xfyZja4n80dQvhJZjdxXd6Rn/yRbv
         +ecq3/J+mW/dlVw+Z3uciAxnKqs14j1y2571Os9rCdz4IFZcT5M9v+7odPiwltS+0qhf
         WLqYOj4Qaa9+veS/bR4U/gGd1oNvraHI7XKKI1KAIKwK7RoiQb78hbMtBuvX4yPKMiJl
         gIDD7b5N6mN0+hyBBra2RuH0shiLz0HDJNJXaJuqC7WqfQFU8pdWEG9wUBWxuQQH8t/x
         DHFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AsEjQeiILrTCiiNJxr0LdCds8To9eh6AZ9RKtss0ZJI=;
        fh=ZmNad9EjAddmi+iGSiqzIs3HRWv3YzpKMikqlJtaI5I=;
        b=OBLI8Ez7u9cxM+660KcD6F3lIdU88nbRoBSGsp/wlpCFD1P0KQeCvoHn/Xw3DsKJp6
         ps6NR6tii1lMM0MxElwGTq5bTMAZq9+TqdfSV1zEbqAwVZoJTwJkixj1hDStBG1cCV37
         5Mmmm1zlLw18mej8JJxf4m7Ue/CKzD5EQ/pnBfeqYNbhhZ9ssRBAhN/E9hns/XcVn8cd
         +yloUd/qqcw7btYqHCABGD1cM7yneXqRz/hg7VzmyOeXCCPXj18yF5Enf6XXIJ/edSYg
         5HdNRDjQSEnrW8LfUmYC13RIxWIKY70JFH8zpQHKzDi4rMEs7TKATQGwWyAZi4VnTZBv
         N3kA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789685378; x=1790290178; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AsEjQeiILrTCiiNJxr0LdCds8To9eh6AZ9RKtss0ZJI=;
        b=hM0+P1PXUKCPfs5MhpQtcbMQRkItQFfeojtsRGKXDqId8XphxpNdmwm+uB51HrjeYQ
         o9f5llFervlYA6JJKL2h4udVnJV0X6D7muvohxx9CwMozdx3gu08m6eYPBsBCFqWTPRB
         f4GJUjfcwSrW0iI5Q6/3/7OpFEzRERFmJoc2Fpwp7WExjpFqQzFXi74gaDO6nD2IBIbg
         rOY4/zf0BBPTolqHWb8DiXaN/0vyhddCmrbVZxF7NHUBDkVZni8UvwL//vSDjPtQP+Fw
         qL+GFcbSwwfdlVRdVKCpPHzeTgihtRll/tub19UiSfqhj9YHR3cIk0hEJJtz/ZQw++tN
         iN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789685378; x=1790290178;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AsEjQeiILrTCiiNJxr0LdCds8To9eh6AZ9RKtss0ZJI=;
        b=F5GXKDxOjhwfOp6YuwqsTEYKuhY82EQDApV6x5/wPyaHhsjKNB8/t/rMNqTQQlcH6N
         2/V0LJQYXnl3diS5R53AGaJkkb8NqlaLnb9poiOG14PCxPXJxCfN++0XBWjYU5NnPckM
         PD0CaQSG9W9v2ns8j3CpXxxcJDEWnXtsdEPEXWa1ZUACbzLvGadSbipxlxsGv8AwjW6g
         94Ht1ryxJVmUlTHN2FFQ/Gc6kxX1UAbXvMlrYKVf0hYRq+SWpLuxEJ+P7EU0+W5VU0Xa
         tw7VtjIJ1MDyxUzIUMuDufYhFsNz6rJHaPyU15duQ3ym/D9l8bkaAZg5NxtYUtQ7gXcH
         zsug==
X-Forwarded-Encrypted: i=1; AKwUvByXK699H+kfj+Vm6Zc3CNjfAmmnS4jqqiAQDMHwvpOcR6AzHJkygUDEkFFC1SKf1oxchkL9+AXa9+BFbGg=@vger.kernel.org
X-Gm-Message-State: AFuF++nEAFEhkScygxxeVfzyfY0xh+ODfSBDBpl1eRndwfVy9zSq+pWV
	hdqiBmV9KjnyMcT0vdQlsVtuEVxpPoVi8ROLOMcJsxdHfUaa4XrkNqzi0y6rhTTB7KTTOZjkC5+
	UpXXuznTS34tz2J1I4L+AkS/LDxfwl8s289H2Y1ZF
X-Gm-Gg: AYBFou2apepOiLHEDHMO3xgOKRVuBhHG6egusfmoxUZmlyDgrYOB4sNw5AvlcOHM/a1
	o0o6M9wWN5qQAf+/OnFZNmQJZw2iiqxnbHz/x0+vs0hX6mryXPhltoMooUtnYj84MIzNL18CLI0
	vxq8TjVMAAS/bmhaoxowOQfar8Mc3jzvuk1p7nv5isG2Rh/mtaaYnmeCc7Pzl6/VW8DtkjZd8kz
	nyk6dsru7TkSSzDu+qrWoajWAPVLi7mJVnumhs1rzZMjNUcabJOs3VR/d/LiarVrHLS4VbLolC+
	Abu2rsdK0Rr6uSydEVI9vMBnCoVsLB05COd3yzlQMZket0h+WOQI96HucWyJ2Hcnx+wWqDL8qKp
	UgYiJ6YccNae/ih25xyz24Pgo++ZYy1u98qVSI6VD9UdMBw+31bLsmx0m9LOp4SU7bop8rA==
X-Received: by 2002:a05:600c:6214:b0:49b:9202:6f80 with SMTP id
 5b1f17b1804b1-49fc568129emr3841705e9.6.1789685377363; Thu, 17 Sep 2026
 15:49:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916-vdso-getrandom-avoid-memset-llvm-24-v1-1-80a92f2e225a@kernel.org>
 <aquyVkdYceiWdckX@zx2c4.com> <20260917173920.GB356152@ax162>
In-Reply-To: <20260917173920.GB356152@ax162>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 17 Sep 2026 15:49:25 -0700
X-Gm-Features: AcwNN1WueMFXEOIBtpgc7FL4Q7UkDA6F7pnnbV8nYZIUzRMbcrTohGPKKEuU_8Y
Message-ID: <CAKwvOdkHsw132XEY2zLxO-V4=_RyqBatavQDvLY-MpZ16ZSAdQ@mail.gmail.com>
Subject: Re: [PATCH] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
To: "Jason A. Donenfeld" <jason@zx2c4.com>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 10:39=E2=80=AFAM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> On Thu, Sep 17, 2026 at 11:26:46AM +0200, Jason A. Donenfeld wrote:
> > I don't suspect this is the right change. On x86_64, this changes to
> > code from:
> >
> >     rep stosq
> >
> > into:
> >
> >     loc_2D9:
> >     mov     dword ptr [rbx+rax*4+0Ch], 0
> >     add     rax, 1
> >     cmp     rax, 0Ch
> >     jbe     short loc_2D9

/me nods

> >
> > Which is a lot less compact. It seems like the actual solution is for
> > gcc&clang to emit this inline memset mnemonic when the platform has a
> > good one, and otherwise not. But disabling optimizations for all
> > platforms, because it's broken on one, seems bad.

Ideally, yeah.
Pragmatically:
the compiler doesn't know what you will link against or not; so it
just emits relocations that the linker will (hopefully) resolve.  I've
definitely looked at how llvm decides when to emit libcalls to
compiler-rt/libgcc ("the compiler runtime") and thought "I wonder how
this works with compiler runtime version N-1?"

There's also the requirement gcc and clang have about memcpy, memmove,
memset, memcmp always being available (-ffreestanding or not) noted
below.

> > In this case, the compiler is being smart: it identifies a loop and
> > rightly turns it into memset. But if this isn't a compilation
> > environment that has an outline function, it should do something else.
>
> As I mentioned in the commit message, compilers require all environments
> (hosted or not) to provide memset(), so the "doing something else" is
> nothing :)
>
>   GCC requires the freestanding environment provide memcpy, memmove,
>   memset and memcmp.

+1

>
> I guess another option is to just include a basic memset() like the one
> in lib/string.c so that it is only used if the compiler makes this sort
> of transformation, while leaving all other architectures alone.

It's also possible to get GCC to emit the libcall, even in the
presence of -ffreestanding: https://godbolt.org/z/6hTrYq9z8

And it's not the first time this code in particular has had this issue;

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3Db7bad082e113640fc81200ff869e5c2d7a9c29a2

(is this patch a Fixes: for that?)

Clang has __builtin_memset_inline to avoid explicit libcalls; AFAICT
GCC does not.  So we could use that here to provide such a guarantee
with clang; the code would remain brittle and likely break again with
GCC.

>
> --
> Cheers,
> Nathan



--=20
Thanks,
~Nick Desaulniers
