Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C253672AE
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 21:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791408667; cv=pass; b=h4mZVc+PfiygDvrOTM4O4AtNuITwcWHmhtO/NVT88D4X60Jwdz22DsyTeRnS1QwGkHz2fd9v+klqb8oSnXgPYjT2YmAsqBvc7r8/s6G+k8YC7ddsk+jb/vmSV/Sj43sWBi2svh5jvY95Iy9y9Oa3IS3SBz7g93+eJdVXtepS4RA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791408667; c=relaxed/simple;
	bh=jyYp3pb0AgusDhktJ+pxszPoIX1VX2C1hCG1RwKoqyQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p7NNAU0wUxjTb4KNWlAftSmh0a+UVuGIQcp5E7ejIDcasqf8ZBdwGDKxFAuGBkhl9SdCkrbwJqPEkuQDxi5XSTVsr52kwXsOq5hMNvYfNIdhi2P1EoiHB5/wYWsZmMI5rOsUd5DUAR7DS+b6zFBBoWlAQqh+WZKb1fVOGwQVqsA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DdavwPz+; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DdavwPz+"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6afe8d3980aso2708687a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 14:31:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791408664; cv=none;
        d=google.com; s=arc-20260327;
        b=sWs7cG+JBM4xJBY27GQyNjUla7ZGkbNqYnTRgiKoVvGlEzpqWPadzgaThP4Cu6FNX8
         KNO6XwmjbEcOwyZZcbrSUk6hrx5OzCf9z8RIoPDhvSQN0BjAKaYH0zIjhcDnWNAdfL0O
         L5Dn8dkLWC8uYioznpNxBEmH7qNIP5TJxVM2whb/BW4X/7NszAe8RlHm6AFs8/e8Fmsa
         iVSmaY5NqGxoJmbocE1rQDnoVgzFqQMtikCO8uToEH9l11Eu5FILDgsjLTB9FOhWZxc1
         XPSzBwU5MTTqmInndo9wb7inYxPqiFL+eWusWapVepS6ipg6ENwmm1NuWMkmHkds8yfG
         DTCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cbqtNnVw1HEZgkaqa1EZpXgjqsXmDXnG5DSMPLrpj0c=;
        fh=v94eBCYA7MMeYuVE6VZP1HAGNO/glRMNd1LHhhQmgUg=;
        b=lPupyweOY6hA+x2gs3U0czECuMwQUUndZTt+7SJ4tBF3tJD2C76BXg54cVHbGXl0Mj
         qnDVTtClVDxNgT6VtHF9yb+Paz2RuJFa46/WxfkugMLNmvVau1Ts5LcAVLUFHyL27QrA
         f5DJX7+iX582awZtilxJ3hfuywQ8FrLhJi6NOxnGeQ82Ai3d7wIU8wh+hSvVrD4TxY87
         h1smkRyQJEiLquZdKi9GYFaHF4NRMS8VhLi4XRmXxqfdzBf9swxbv1Eu6M2wOjiRDiic
         iIxfkLGJM3run7fmMGq2ef5uZMfw2hpcXBEla3ob0raGy8tTtJqiZqRQHQKLjVPKFU5l
         +gLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791408664; x=1792013464; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cbqtNnVw1HEZgkaqa1EZpXgjqsXmDXnG5DSMPLrpj0c=;
        b=DdavwPz+K2dI57XQHDTKfcEw0jbzVlyL1jcQNXVwNxHVnx/xTqgnUOUy5U8QP/96ch
         70TCCAaR4l7gAUYCmXo42dqJEBgkY7n21wRT6zg9Wu3d8Zj4/xBTPnPiJRH7ANCBRblZ
         apFQi45loGWPwGUi9LVMBcMzWA2YQGcIhUmjdd5nUj1NHfOcz7mMR7DQveO9NGOU6pu2
         vLWyMG7MUPv4LTc1OO/Csjfzp9HhsLNXw134KRe5I0Nu3ipaCwwRzdarI8/x1tsBW4n/
         ZiqWsiWb6AhkuyGMKFCL2PLHjJl2gw4gMvdk6BBy0Qw8JdG6NGOQNycsJr8R1uh2vs1m
         DWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791408664; x=1792013464;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cbqtNnVw1HEZgkaqa1EZpXgjqsXmDXnG5DSMPLrpj0c=;
        b=SLoitzfldlS/V1wt2vuoAniUYh+jujG/4ffEHAOpAq/NXVGYrT3sKQed5tv9de4tPT
         f+mm2D09ImOFnF+y28nvP3LSf3ej7UkAIK8km5GCiC+IGpQFKli75qJGJdvMiK8IFL2r
         lPdqkKQc2bt1AS/pNkaoz6Kf/tIcKuO1eo42L/8JaR07WiPRWc6wDiEqRelk2MpmsyL1
         rM4ZOp1Vo3m2l/ZxyWIoNRj8UbrZSkGoGnR3rFb087qZThv4gqWaaiNSToTaLVvfu74M
         ooP18usEKqOVp/JYJnJG1ESr+/0DImMjVGzhzbCdxdBmk4a/qOJcQUENDmyvso+OEUZR
         nrzg==
X-Forwarded-Encrypted: i=1; AKwUvByexT74kjojEMhWaXhSGwq/Q49OJXpd8WbHQyAwPF1Kl9kTHLQpLNqHZpxfRlZe4ZbfkSLhFn2isNLcvFg=@vger.kernel.org
X-Gm-Message-State: AFuF++kvlCz8+oLxsd0ZpKVyvWGdIZ3qQHmir4jFlnAsuvg0bH1eV5H0
	Fso8FPV5U+uiQdU1xog4VkNE24ysX5xQv5aWcSDroVPOotdyThCUomyLWEgvOzu6UvQxlvsxsyX
	Nr9MRZ5jeat6dHQM7U8hGaq3UnV098SA=
X-Gm-Gg: AYBFou036Vb196nzaiaAjiSEkZrxWqN5Ta5qLgmEGDdexh6VhMif6l1AJdoAknEKVcN
	ap0h2q11g5bfVH32aICqwmMWmkDEklS7LnlzF79EJ6yv705LGND9YeB/0X+1P7P1Ol0HP8cD6Ji
	nqltP/YutWl+CA7IgGjchdF1LmP7WLkAVQ0gk9UnhHr+XqAESB+kcWK8ZxPlXEZv9qaWQL92ApL
	puTJ8zJvZvfQI7sv+y5d00Pd2BKiX7JDvhCRVNtpeIcY3HMPrSVne24vTn9IzD/0GPf4SgNuiQd
	6vRcM4sisnCID7Sj+DpydlrYOQ6vEeBHPCU2PEAvMC8pER9DyOM8mUyWv4AZWexZmuqLcVqqcUE
	lC/wNxA1wjQvd2jR3dnB55Fd+SEmJgqNBhoa37QaDFA==
X-Received: by 2002:a17:906:c14c:b0:c2a:8d00:f8d0 with SMTP id
 a640c23a62f3a-c317bb373a6mr376649066b.4.1791408664109; Wed, 07 Oct 2026
 14:31:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006-alpha-hugepages-v1-0-a673a18aaa70@gmail.com> <20261006-alpha-hugepages-v1-3-a673a18aaa70@gmail.com>
In-Reply-To: <20261006-alpha-hugepages-v1-3-a673a18aaa70@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 7 Oct 2026 23:30:52 +0200
X-Gm-Features: AclHuK_1O1y5cBqpKVUa8hYIbFNU87Dgww6OpAlAPQAxMQLFzeejAiCOK92ZrOk
Message-ID: <CA+=Fv5QQ4KKDuMzjqxWKoWsKD70Z6XSa8TGzUq4XgB+OWGLS6w@mail.gmail.com>
Subject: Re: [PATCH 3/6] alpha: clarify that _PAGE_URE and _PAGE_UWE are the
 Executive bits
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Oct 6, 2026 at 4:04=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> The Alpha Architecture Reference Manual defines eight protection bits in
> PTE<15:8>: KRE, ERE, SRE, URE, KWE, EWE, SWE and UWE, for Kernel,
> Executive, Supervisor and User Read and Write Enable. Linux uses only
> two of the four privilege modes, and its user processes run in Executive
> mode, so the bits it calls _PAGE_URE and _PAGE_UWE are in fact the
> architecture's ERE (bit 9) and EWE (bit 13). The true URE and UWE bits,
> 11 and 15, are unused.
>
> The names have been misleading since the beginning, and the comments on
> those defines said only "xxx". Spell out what the bits actually are. No
> functional change.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/include/asm/pgtable.h | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pg=
table.h
> index 8a175e0c2b42..d123fd0d4091 100644
> --- a/arch/alpha/include/asm/pgtable.h
> +++ b/arch/alpha/include/asm/pgtable.h
> @@ -65,10 +65,18 @@ struct vm_area_struct;
>  #define _PAGE_FOW      0x0004  /* used for page protection (fault on wri=
te) */
>  #define _PAGE_FOE      0x0008  /* used for page protection (fault on exe=
c) */
>  #define _PAGE_ASM      0x0010
> -#define _PAGE_KRE      0x0100  /* xxx - see below on the "accessed" bit =
*/
> -#define _PAGE_URE      0x0200  /* xxx */
> -#define _PAGE_KWE      0x1000  /* used to do the dirty bit in software *=
/
> -#define _PAGE_UWE      0x2000  /* used to do the dirty bit in software *=
/
> +/*
> + * The Alpha AXP ARM defines 8 protection bits in PTE[15:8]: KRE, ERE, S=
RE,
> + * URE, KWE, EWE, SWE, UWE (Kernel/Executive/Supervisor/User Read/Write
> + * Enable). Linux only uses two privilege modes: kernel (mode 0) and use=
r.
> + * User processes run in Executive mode (mode 1), so _PAGE_URE and _PAGE=
_UWE
> + * correspond to the architecture's ERE (bit 9) and EWE (bit 13) bits. T=
he
> + * true User Read/Write Enable bits (bits 11 and 15) are unused.
> + */
> +#define _PAGE_KRE      0x0100  /* Kernel Read Enable (bit 8) */
> +#define _PAGE_URE      0x0200  /* Executive Read Enable (bit 9); "user" =
in Linux */
> +#define _PAGE_KWE      0x1000  /* Kernel Write Enable (bit 12) */
> +#define _PAGE_UWE      0x2000  /* Executive Write Enable (bit 13); "user=
" in Linux */
>
>  /* .. and these are ours ... */
>  #define _PAGE_DIRTY    0x20000
>
> --
> 2.54.0
>

Replacing the "xxx" comments is a good idea, but these describe the
OpenVMS PTE (ARM 4th ed., Table 11-2). The ARM has a part for Linux
itself (II-C, Alpha Linux Software), whose PTE (ARM Table 22-3, the
same as the Tru64 Table 17-3 this series cites for GH) names bit 9
URE and bit 13 UWE, reserves bits 10-11 and 14-15 (SBZ), and has only
user and kernel modes (ARM 22.5.1). The Executive view comes from the
21264 PALcode loading the PTE unchanged into DTB_PTE (21264/EV67 HRM
section 6.9), whose bits 9 and 13 are the hardware's ERE and EWE (HRM
Figure 5-27; mode encodings in HRM Table 5-5). So I'd keep the names
and describe them from ARM Table 22-3, with the 21264 detail in the
changelog, maybe something like this:

#define _PAGE_KRE       0x0100  /* kernel read enable, in __ACCESS_BITS */
#define _PAGE_URE       0x0200  /* user read enable, in __ACCESS_BITS */
#define _PAGE_KWE       0x1000  /* kernel write enable, in __DIRTY_BITS */
#define _PAGE_UWE       0x2000  /* user write enable, in __DIRTY_BITS */

Magnus
