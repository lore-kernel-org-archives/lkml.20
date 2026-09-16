Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447F04ACC6C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 22:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789596541; cv=pass; b=emmfTnYkJBFzVcAR7/VSVO2pcrxY7N2bJM8xrRYTYBrCUR4aSeWRrtfJy4L3fx+neAedCIHkxTfzaDvlRS4nuOOooZtKSxfrVvovFHJm9oIZgUKts1p85xXBHS/F6lADCZ2oqoX3JGpJaBZ2cCEl7vA6UOjvdzY0h3QVis8nkVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789596541; c=relaxed/simple;
	bh=/sL4aX/lvFF0OA1HG7h8In3Uw6TMinzp1Ww4YC3zU+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ugExBvb8Ii8bi7jDrGFJwJchX6p9DQepjxjyyLgK3TlIGWQJyGfmQ1fNkvfNGwOIZ7tkKzitgWkRZg6wZQIe9Huao6BNEewBBLukcrqF34QOz34qkXNey2X4VsxQsjzu91REk6jjyzsLGIEvsmtoSRYiGLtG1dxkyKOS25LnSvs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ILeBu8Zw; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ILeBu8Zw"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48442ea8f59so57230f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:08:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789596531; cv=none;
        d=google.com; s=arc-20260327;
        b=KRotTBhxk9kNA2KbOWDFwuGC20+nZgXZmqHZKMW/sprKZ4ZFunNGopPD5GR4HJYXCp
         XsIIcYGH+d2GpTE2BQMSZI+nefs7CxawlsEahVmVOZTgM43teXljMbY7JkZz//63NIrR
         vZN+s3zUxvie7DZ5ddUbWdrli1B1YkbSg5q71PhR411MDs2zwDxt/y5R5z//InH68Ooh
         qXL9cB97HFPaUNQ/bthgAoY1bvUu7R7TnwMNY6z1xkgE+90NR8PvhGfxAflogBIFf51X
         Erx97Vx7dLd6AaunOwFxSgT8pBuOxMY9Hkt2Noc5B4dP4wbro4AR/W26U5fkCDtvnGyG
         AXog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y8Yimwq73XmAEZlRQgIp6o8SBW0zq5wMQmBJMpzzOFQ=;
        fh=+1EU6KAL4iDNpKgxZm1jcQdEnU2aNEfEhNFkJfMIiJ4=;
        b=FCkHAR7B9gW9EcIPJvUGnmVCKglZt+8KorC/LjZvL7G9lSE6Ul0MzzvLIcQxqhTSFX
         svQA5KGiVXpqHHkUd33ZKqqTQhcrwJACHb7MiSqZkw9uuYF4aXaeOnnVhBIIajGFlNRC
         q8bj8TbuPh26iRwjQJUi8WE+VJhiJDaxEXmqh2fqeYQSnvmoboLJTfZlINupZqN0OWJr
         rMLS/bDxsbEQcDUAZ5HWtQE+QK5EdQWWwMUBy827syu7mzpRKubJblje/EQwkgcpj38a
         AzAPUndG0z/Z1N4katowHnRNE0DX1EiXSG/PGa5Es97a5xr2SEQLUjPAZlvW0w4q7r2l
         xPdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789596531; x=1790201331; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y8Yimwq73XmAEZlRQgIp6o8SBW0zq5wMQmBJMpzzOFQ=;
        b=ILeBu8ZwxdHhFIsZIt5uezWvquR6FjpNARVHuEWaWgNyihstgYIEUmXwL8vNZ/5hR4
         Dp0hFJpBHBpYYEizG3FttiN9e2XIU8CTh7jUNXnAchppqhnZaaEdLET90YTIYzUNtqvl
         4DNs7soV0dNOrSc9lMqb8ATdY68dMSG9uiE44IctD6utoUCb6yIR8mCv2+BKPBXZFlne
         qVXmk6SK+QTTn5Vpt3Jdu1yEU8SUq4bKYDDiO8sa+RFle9zCMgoNI0DseTe3IFFgx3kQ
         0/Fw63d5craXvWDuX+5pJNBv1vbZzWqNnlIr0+OieKkGZcfcAx1+hQPjHcHUedlUFuQ6
         DAPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789596531; x=1790201331;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y8Yimwq73XmAEZlRQgIp6o8SBW0zq5wMQmBJMpzzOFQ=;
        b=lC3vzXq4yoiwunYKUnhwwMbstLEYveHps7CMF7yU4RgJchE3MqKh+lRDrGiVQt7APv
         KGWN2ZVZqnYXBXjpR7/fyUIxBGwxc8AWpk+oGbDbpHKarkcyhR/ViPcrNNaDSA1B+0ih
         gVf0joMjZ7yFRcgiPQqnOaY7UIUVezqHoYhSSuefSmInNS82t+METE7s7Qdx2Kt4xd0g
         orzOI5z9HJPqLs3/0yf6hDHFzGyiNSuOh3Nnw1TyZZNgfa9rGzCiaWi/cweGKyOmzZQJ
         AbAoitT5OJCGUhChtUGpzA6iu06ZgyYbbGi5YBTdVRfNdTcd7M2WwKbfRgwrmAFwQ02B
         OSFA==
X-Forwarded-Encrypted: i=1; AKwUvBwhju50aXoHLl5tpbo1VVSCWlHUwrM580Card0FibEEBHjwYAbhenvuWQJOK7ZYg3gqxaPSGlSUzRyKozI=@vger.kernel.org
X-Gm-Message-State: AFuF++lGDnzK8YB/QqngJSUutPsfdl6jXcODCo50f65QQ6fux5wd2Gx/
	i2IaBcQPHoCqyGAxpTfIy1WxreCfxGd8SDqhmGP4kdL/88ytp1zDz+NCUou732RuVHEqMqT9BXh
	0BTB1FuiQ6Of4o6jeKSiiVtIfUvN2DFradlNukkiw
X-Gm-Gg: AYBFou1Ebz397IvcgocengpTz/W/4cTDfyjwZ+cAMCk3VrV/9dxgO6TG6c3SWmCIWUq
	vXMBHF9YIZzGcU+5uqzHGzLmTaqk4E+zM086Jb+dDhK4fSOQSvTyPaEjoSNtMkYIDo+d546IUcV
	+IaAC7lM/KBDIWlOyZh4kGPGWVEaoSAWYY46uZjFfip4gHd9sfBER4/lbcUFRd6bVaMSHXbP2Nt
	owXMhbwOw2S0FZb/SH+DiJsonIrjO50JhR4tcYgcIixFJmCbaoZ493l2W+MXBsiyBXEiFjWXgmJ
	fPaP9gZWfZGcNZ7OQaFvKp3066pYAuoS8kk48pMdlbZbof9IuozqPMbYh80jYasWgE/olhUwZpM
	R6Gmq28SagwlneKmtTpZ0NnQIyMJq+v1QO8aMMluOpg7fKTq+JvDipkFFY7Nt52QATP54
X-Received: by 2002:a05:6000:2586:b0:486:fdd9:a0d9 with SMTP id
 ffacd0b85a97d-48713c59d8cmr1446175f8f.20.1789596530608; Wed, 16 Sep 2026
 15:08:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916-vdso-getrandom-avoid-memset-llvm-24-v1-1-80a92f2e225a@kernel.org>
In-Reply-To: <20260916-vdso-getrandom-avoid-memset-llvm-24-v1-1-80a92f2e225a@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 16 Sep 2026 15:08:38 -0700
X-Gm-Features: AcwNN1VRyt7hIoF182EzNYbfGSDx1mocH1ME-nj3k-qk8BkWMkfk9ELup6-RHnM
Message-ID: <CAKwvOdmnfkra0N34v5w8qh+8bb4X5AxLTtOULu46S8q9KCvzMQ@mail.gmail.com>
Subject: Re: [PATCH] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 2:59=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> After a recent change in LLVM [1], RISC-V builds fail when checking the
> vDSO:
>
>   arch/riscv/kernel/vdso/vdso.so.dbg: dynamic relocations are not support=
ed
>   make[4]: *** [arch/riscv/kernel/vdso/Makefile:78: arch/riscv/kernel/vds=
o/vdso.so.dbg] Error 1
>
> memset() is now generated when zeroing params->reserved because LLVM has
> an optimization (now run in more instances) that can recognize at
> compile time when it is assigning a static value to a contiguous area of
> memory and turn that into a call to memset(). Both clang and GCC assume
> memset() is always available [2].
>
> Hide the value of the iterator variable from the optimizer using
> OPTIMIZER_HIDE_VAR to inhibit this optimization since it can no longer
> assume that the zeroing is contiguous.
>
> Link: https://github.com/llvm/llvm-project/commit/90cebef1411617fc3eedd35=
9bdf00cb44b1c2439 [1]
> Link: https://gcc.gnu.org/onlinedocs/gcc-16.2.0/gcc/Standards.html#index-=
ffreestanding [2]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Link: https://github.com/ClangBuiltLinux/linux/issues/2183

Do we need to tag stable (I imagine this might be visible for older
kernels with newer llvm)?

Any idea why we only see this for riscv?  Would think loop idiom
recognition would make this transform for any target.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  lib/vdso/getrandom.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/lib/vdso/getrandom.c b/lib/vdso/getrandom.c
> index 2851afa9154f..d48d1fdb3351 100644
> --- a/lib/vdso/getrandom.c
> +++ b/lib/vdso/getrandom.c
> @@ -4,6 +4,7 @@
>   */
>
>  #include <linux/array_size.h>
> +#include <linux/compiler.h>
>  #include <linux/minmax.h>
>  #include <vdso/datapage.h>
>  #include <vdso/getrandom.h>
> @@ -83,8 +84,11 @@ __cvdso_getrandom_data(const struct vdso_rng_data *rng=
_info, void *buffer, size_
>                 params->size_of_opaque_state =3D sizeof(*state);
>                 params->mmap_prot =3D PROT_READ | PROT_WRITE;
>                 params->mmap_flags =3D MAP_DROPPABLE | MAP_ANONYMOUS;
> -               for (size_t i =3D 0; i < ARRAY_SIZE(params->reserved); ++=
i)
> +               for (size_t i =3D 0; i < ARRAY_SIZE(params->reserved); ++=
i) {
> +                       /* prevent compiler from turning loop into memset=
() */
> +                       OPTIMIZER_HIDE_VAR(i);
>                         params->reserved[i] =3D 0;
> +               }
>                 return 0;
>         }
>
>
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20260916-vdso-getrandom-avoid-memset-llvm-24-74d45fa6031e
>
> Best regards,
> --
> Cheers,
> Nathan
>


--=20
Thanks,
~Nick Desaulniers
