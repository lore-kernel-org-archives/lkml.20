Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46AB37DEA3
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 21:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791410270; cv=pass; b=lJ91000lE5b+QS2G4KlOgJb48kHSoojuOWe4zGVIRDxMUQ6gn1foRGSXLc80WLilbMJLx+XZgO05EIiPfo+emhDSIpRwjT/UOGhvondH6JbkTjMxfCQOfpOjHnIm9yyiXaBq9Bdtk6XviuSWmWDrdlgGV4jf6moOnaEXrKsB3nA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791410270; c=relaxed/simple;
	bh=jQIxQoCC1UvWTnm6K9i7NwsQ4oX20QZNx7RCZxsnUqc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rFzujT2eBrTvZNi1wquEEq0N7kKtfS8dCMrMHuoYARPqYm0ltOB3M3G3sgM3sb1rZoF+vE8pR0FpS3rt7VhOx1M+b4IWafExUhW333kVMcsuTxYqQBGnHRKNMbtiCdY06ezBvgGCkN96mgXVZFC4o0ACbQ3+/X7cSs+2dj3Z9UU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RMqWumMS; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RMqWumMS"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6aff0c4bda3so2818299a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 14:57:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791410267; cv=none;
        d=google.com; s=arc-20260327;
        b=TXY5H7Vs0Sacq4X79LQkAZ3lQIS6+0tuoM0CBtDP0JNKCJK4i3v7LHlDwnUsrUsFf1
         LSdX0iKWUpdnVdY80PXTJEDbXZ4E8g047F3FZrQ2GHVrbK417ti+Yh2Pa7Sv4CsNBfQ0
         7cwLSzIeUVsX5vify8AZLkZJXAipL0WacxcjNPdhs5xFJRe5jjDKgjaitj7eQWfwBV2b
         9Oqao3cY5CZyEvyYdQ2tR8DTd0AfKwqAaZS36XJuN7CFeT3WdE5grBvTHwFRLRDjnG4z
         CPqEHM8+SBRli6/auYLOoxaaw+iDetD3fH96YTQu12j6sGCynRZOXIZk4nSJQHhAU/DP
         qALg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4/EBKnunRvRh/CO8BlBy/8L1IN1ViY1vUrolg/MNJ6c=;
        fh=OHfg7U91aIhFbY3jlCzk8B3Dp1k2KjBT3kDGLdhMMc8=;
        b=QL7Y9v0HuFhs0rcDcPk68VdsOJzQxMj86dwLfAyFB7QXowwfdLzVUjTyTR9qohPSqq
         t+NLF4kap2LIIyzxSWxPJ24asyIAvdMzpEeiL/6QvuJPLlD/jOnBJClz13fraBRT7CFO
         QrTBAJejKZ7e9lmE3eagvUPl4QUM5Ct7tGePGz86f7Tup1gkj4/mPrWrX6NY4ZduPL2l
         get+q6/hYIG3jwDa5ycdtLJmhyPq2tzVuloM191+eYpYPFeMXx83uCvLuvtHCFApqwvx
         dbXhqAgnOHQBov1oIFd+myKm4yXjz7Q9oVNyazNeIWFMMdGNSaVuy3banNvPTDncYC3S
         BqKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791410267; x=1792015067; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4/EBKnunRvRh/CO8BlBy/8L1IN1ViY1vUrolg/MNJ6c=;
        b=RMqWumMSX7VswfE5np8HHb2rkTIIwLlAdwau7THDKOntyEqWqjqlFp+eJUSmwPZynh
         rqxTzQOgfuvPP9YzNHj9dB2+N3XO/Pc3HOGxd+dU+z2aHheHGqzgx0wA8/DVU+TTdI2H
         jOIemkjCRJtU3GFEzzmUnp5kCKBXO5HIHxcldTsIdmZHTR2gZGXx8Y5caBDEpGTdx0Wl
         zYg1hBG1VTluuPTKnTH2UzAkJG3tZyQxm/W3bTEvhs1rokkzwO5hSsGFG52oLn2TXiQ4
         e2aBgYlPuphxk/WZ/GwqhHO12CmyfdciEbAspaS+Gu6Ib7YAgwFwZNUakj72bqw3gkv+
         f8pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791410267; x=1792015067;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4/EBKnunRvRh/CO8BlBy/8L1IN1ViY1vUrolg/MNJ6c=;
        b=GgkPkeaPExvmgeBQBy3mzPqIttc1O2IvyPywNtnwsbpDt4K1QW/jON8fO5pItoua23
         r8btZxXP76NK/5U7XYBVQ4x+vy/w/7ycfqYHw7v1J8niJQdJwDuo3k9tNPe0CUPFNjBh
         HRUPGH9MCY4c9xI8VW6JyJgp5mHmtD1rgQelciKdmbwwpO6ArRrT82KPJdmj7AGGfnZl
         Vmc1Yx8SHxgSnlJI+KVw6BwC6pRcpfb8VMtXZaBYh0wDw3W0SYwoP/5zMU3BxyQwZTYc
         7X1pDbMM29doiMk1QP929ZKTzd4KKCq7OXTbTyUbUA9TYF0XTSzI23Nz02Mr8I6Xbu1n
         C1fQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXYVDcNQe0+azhouBfl6dSfDOPgs2svpk+3r4PN8gTXtHI1qV8m7IZA9r2Hf9qyjiRWUylPiuCU337ZbE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwQZTxeKGDahmn1GHPCdeh2rN+p9206MF0uodxhG25TKcXoI7C
	PH/IiXQm2kBF56nVh/PKo7asr4TxOw6T6gDjnS6zwNESYrokqHjnA10Lx2ryKAhzCKx9VjrtITv
	0rRhhf0W8lIUXQWqrY4cJ/yvxcEKQToq7oUzRVjY=
X-Gm-Gg: AYBFou1izufN4Ue35O5GCmM7kcwQ2NWaWtQzBr2431BWr56d9+g/WD7REI77L9WXaGD
	i90yfvD2Lf2GgQNEkAqIuK64TmL/VyrRmI1au7PzjKFy/0R3WOY2Xn7/u6UTOPsq3zGW98isA0q
	ePg1oociCLKQeqQ9mw/tf2n0CnQvchkZiIXpLXOiv1QLwHzPETrY6DRNK+/ybUzr+AJD88uRMsb
	hLasyz349IyvPHOknbRMAstOORS6OZ+urItZA5Zde7LT3VUrSu2zrx16FquQffI+I5n/o/OyFNA
	hlsMfcKRu6rOKHEiPPbzM1izXjAszizbUOPmL3qmDZLLuQK1hzDkNr2p/VH1kpsJyA64Ca/bFjG
	hu6djn9yhjmlAu4UqSqguyjLZuqn8S1HNXCyXVBjQKQ==
X-Received: by 2002:a05:6402:2790:b0:6ac:70ce:ba8 with SMTP id
 4fb4d7f45d1cf-6aff454cb04mr3301679a12.35.1791410266690; Wed, 07 Oct 2026
 14:57:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006-alpha-hugepages-v1-0-a673a18aaa70@gmail.com> <20261006-alpha-hugepages-v1-5-a673a18aaa70@gmail.com>
In-Reply-To: <20261006-alpha-hugepages-v1-5-a673a18aaa70@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 7 Oct 2026 23:57:34 +0200
X-Gm-Features: AclHuK-ikuydpyluMIED3CI-KY7xgeSn3P1vkTE8gwFcrFveOlA32P7iSrQWfvg
Message-ID: <CA+=Fv5RQXOQML5UTcWMpz9WNqHjEVN59jDaX2QhLs7cUhgOb7Q@mail.gmail.com>
Subject: Re: [PATCH 5/6] alpha: align hugetlb mappings in arch_get_unmapped_area()
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Oct 6, 2026 at 4:04=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> hugetlb_get_unmapped_area() does not align the address itself; it
> delegates to mm_get_unmapped_area_vmaflags(), and the huge page
> alignment is applied by generic_get_unmapped_area() and
> generic_get_unmapped_area_topdown() via info.align_mask.
>
> Alpha defines HAVE_ARCH_UNMAPPED_AREA and supplies its own
> arch_get_unmapped_area(), which never sets align_mask. An
> mmap(MAP_HUGETLB) with no address hint would therefore return a merely
> page-aligned address.
>
> Pass the file down to arch_get_unmapped_area_1() and set align_mask for
> hugetlbfs mappings, as x86, s390, sparc and loongarch already do. This
> is a no-op until alpha gains hugetlb support.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/kernel/osf_sys.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
> index 7b6543d2cca3..61d806176213 100644
> --- a/arch/alpha/kernel/osf_sys.c
> +++ b/arch/alpha/kernel/osf_sys.c
> @@ -38,6 +38,7 @@
>  #include <linux/namei.h>
>  #include <linux/mount.h>
>  #include <linux/uio.h>
> +#include <linux/hugetlb.h>
>  #include <linux/vfs.h>
>  #include <linux/rcupdate.h>
>  #include <linux/slab.h>
> @@ -1201,14 +1202,16 @@ SYSCALL_DEFINE1(old_adjtimex, struct timex32 __us=
er *, txc_p)
>  /* Get an address range which is currently unmapped. */
>
>  static unsigned long
> -arch_get_unmapped_area_1(unsigned long addr, unsigned long len,
> -                        unsigned long limit)
> +arch_get_unmapped_area_1(struct file *filp, unsigned long addr,
> +                        unsigned long len, unsigned long limit)
>  {
>         struct vm_unmapped_area_info info =3D {};
>
>         info.length =3D len;
>         info.low_limit =3D addr;
>         info.high_limit =3D limit;
> +       if (filp && is_file_hugepages(filp))
> +               info.align_mask =3D huge_page_mask_align(filp);
>         return vm_unmapped_area(&info);
>  }
>
> @@ -1236,19 +1239,20 @@ arch_get_unmapped_area(struct file *filp, unsigne=
d long addr,
>            this feature should be incorporated into all ports?  */
>
>         if (addr) {
> -               addr =3D arch_get_unmapped_area_1 (PAGE_ALIGN(addr), len,=
 limit);
> +               addr =3D arch_get_unmapped_area_1 (filp, PAGE_ALIGN(addr)=
, len,
> +                                                limit);
>                 if (addr !=3D (unsigned long) -ENOMEM)
>                         return addr;
>         }
>
>         /* Next, try allocating at TASK_UNMAPPED_BASE.  */
> -       addr =3D arch_get_unmapped_area_1 (PAGE_ALIGN(TASK_UNMAPPED_BASE)=
,
> +       addr =3D arch_get_unmapped_area_1 (filp, PAGE_ALIGN(TASK_UNMAPPED=
_BASE),
>                                          len, limit);
>         if (addr !=3D (unsigned long) -ENOMEM)
>                 return addr;
>
>         /* Finally, try allocating in low memory.  */
> -       addr =3D arch_get_unmapped_area_1 (PAGE_SIZE, len, limit);
> +       addr =3D arch_get_unmapped_area_1 (filp, PAGE_SIZE, len, limit);
>
>         return addr;
>  }
>
> --
> 2.54.0
>

I tracked this down and I think Alpha needs this since 7bd3f1e1a9ae
("mm: make hugetlb mappings go through mm_get_unmapped_area_vmflags"),
v6.13; the same series did the equivalent for the generic code
(7f24cbc9c4d4) and for x86, s390, sparc and powerpc. LoongArch, which
also has its own arch_get_unmapped_area(), missed it and hit a BUG in
LTP hugefork02 until 3109d5ff484b ("LoongArch: Set hugetlb mmap base
address aligned with pmd size"). Maybe worth naming in the changelog,
either way nice fix!

On the UP2000+, MAP_HUGETLB mappings without an address hint come back
aligned to 64KB, 512KB and 4MB.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
