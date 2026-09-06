Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D41C3793B8
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 19:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788724409; cv=pass; b=EqzrWdqNZQ4gpwZ1OEPjp1Jdo94CZao8k3kwJn8xksZaFh171vFQ5kmCVWWWfZ7Du6cTCxI3iTRtPbloHwiND1oNYbGqd4ZGiCI6ZoUTEgS5j2ouUitNGz93jMKqcBQZP1/cjgyVVwXfjWiaD/eLvLrjOsa9Pa1jr1Y36hF7d7Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788724409; c=relaxed/simple;
	bh=hSYT7Bdx66+CfzHQHP4O4JmmdfZPM3QZr35weq55SDw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZWFqfXwPFo4n8KI0oLm4eGCILT1oBajxPHS4qLdCxca9LOpTlRO9M/0m2hWI2FYwDYhvpI4k10G79lmfquAZrBQ5DH2A98ayz1rtSvjaRi539x/vmFhptBkxrgY/4JHF+iUNgCoCayUp2mZL2zbgBR0tRHwV6aEkchQz6BcwcWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OzWMh9UC; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OzWMh9UC"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a7f27637d6so3477815a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 12:53:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788724405; cv=none;
        d=google.com; s=arc-20260327;
        b=K7FnLQhgmPKJCE4EGsGGK+ce5xM07rt1VpQGGtaElM3By4+yQy/ceDrb5CSV+Q8K7m
         afO9SUpUgp9nbCfpWHoUngZTWDGAG+UU+xQwxF39bJW0LVXG56Fov9IPcj4fUggIEwy4
         UD+d+bRbd4Cg90RW58IdgSH1o+ciYLKpOHg683f9LKM3jErogdNly22QkWVg+JNne72E
         z6+7TZkw+OaWkKzarf/o08mONBLNAZ6DH6byMyVzWzFrgVVLe6EoMBIn7Bql+ow3kyAq
         YpVKnSy7licHwisaWyjcKyjdm8U5T0raqk6OmR4kPI4HAR0cWnuQ99PIh5aijI+BorNp
         64ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DxbCH9V+QwRl/rwfPKpCRxtVrgQCFOwACk6jwY2+Cv0=;
        fh=1gejmot4OtCfp7ryDwrGswlfSZOsV9HO5HqXkVFIeS4=;
        b=ZvNwboQ50CMLhP802gdtxp4YH4HAaKkR/2Ds/L2yarJamCxJJ6Be85NVTd7HEIHb3P
         5JR+C3rSCszfuScXBZQbuGo6kfvTRMIXuKahwc2h0LHgvRRqwn0rP0XdtEvn/36zYQT7
         WaKo1RbShmtCoZdD+G1hAN1CkEBzMqIbY/2TqVmBKYZ95FSkkMmAbRYbLytkpZcuKyPU
         nR8ItmhsZAGjeHMXUdJ8DZEY09kEb6tHL9asJVSMQgUaHqBPfOxDTiJgT8bm1f0RcgaU
         d6/+rbLYRplcrFX8q2YBvqg8D6iLufYt1ZqkCPma6rkQhVq8VoMArxz/9m2gogWpdxKX
         n4Pw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788724405; x=1789329205; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DxbCH9V+QwRl/rwfPKpCRxtVrgQCFOwACk6jwY2+Cv0=;
        b=OzWMh9UC5Kh70Ch1R76xE23eGWOVSAOID3BsCrc6GAuvQvkWJkBfFLRCnuS7qE/17q
         iUdFtwm4UF/sSJ3QpsE397YLo/s6vZXPFJa61RmwO4QXP8Uu88IQeIOTPVmFCrjF9oxz
         DZgta+HbGgxnAxBr8h3kD7WTlwaixQOL8bXiDbMl7NPNQCYaO62HjERqH1GwyuQlDTC5
         lVbofwBXHIxWrcE4gRdYfbLZ4wJJ3tBLuMEXwFraHgxndjVGMoupiT4v0pTNJRsaQ1eP
         NVkX77abMv14+Vj7VdfgYNRJIg53PhjuLRaJchOji1d6CsxXRDzixu0iHviIuCqHv/QT
         cJ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788724405; x=1789329205;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DxbCH9V+QwRl/rwfPKpCRxtVrgQCFOwACk6jwY2+Cv0=;
        b=hBcNmQtRyf767Oa/K89pfvS7bTaQyUAVyhrsmVz6630YHRBfxr56I2mD/c+PxjakC7
         Q3sM/6Ayl7RY4b5mpUfn6rHJI3DfNF6Pu3ivNu5hG2G+iCdf4J00L6UIiGHnj0ligzFv
         elUmlrspxLiVY/9zkcf5Vkq2BNDh1FRYpgb6vx7MujQQi2Kp/r3BajFidX1m23J/SdGm
         s1HcQ50LStnNlJ2LNPEvLPro9N8IwaUECX0Z/iRZlwa49l6R/kkX0tnX//ejDvz9d6+I
         ZMN2HxsvKmr1+1UioMrtWWDQXtkptbGaQD/6PfYqKPMAgj7JfPsbAtjmTgRGg4GB5i/2
         YzYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCMItL3436ev4C8GgQjra89O44opD+Rfu2muJNOVgmgzWfyQfcy6msb5aeAqhgKuL+WTkr1d38VabTup4=@vger.kernel.org
X-Gm-Message-State: AFuF++lxz/9kV/M4ePb3h+ecraa/6IKTAZ6fnjvV2mjUXpNBURFXQQ92
	btmXhWPD2ngcDZ8ZN6BR8FdDxv6GZE1fmJOevZr4U9fB24GAXaXo7g/rcZ8lrz00DI5vLX1CioE
	datxEgBBqQTw2l810gAhDQlqVubpbU8E=
X-Gm-Gg: AYBFou2fdvAQx438xDDbf09CCIGj+o5CfikEa207sDkXsxueetwax0ZrHPKCmwa6nsy
	BdRSxg/8e79HUEM0zSDcM7flo+SBCqvWKh/PBPLoJAAlIEWJC0vXLvwLs/X64w/FON0N1xjh+Og
	PWwzV+nE4V3j2IZvaroiVukrXQOnqR0qlljOokYoUZzDNks69R5XjaqPsO9XofV+07/EjO0jkae
	JE8vp/EM/X9rer32xF4ty0P09Ie6lyLcGoSo886ctZ7fWegJ4YWtA+1LZCIkbeI4CT4po8TOIEy
	4XGy8O7z1VtqvgiuDQC2vL9A7p+J3kqPWomN+BmfpnVEw6LqZ9Ve124yrVatnLZln3X5LUcJ7ev
	klwzp5FUFxtnU/GeoKci3+GPpzr8g10E=
X-Received: by 2002:a05:6402:270a:b0:6a6:32f5:90b4 with SMTP id
 4fb4d7f45d1cf-6a7e90a5f76mr10811303a12.22.1788724404883; Sun, 06 Sep 2026
 12:53:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905-arch-kconfig-options-v2-v2-0-83e8245761a2@gmail.com> <20260905-arch-kconfig-options-v2-v2-13-83e8245761a2@gmail.com>
In-Reply-To: <20260905-arch-kconfig-options-v2-v2-13-83e8245761a2@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 6 Sep 2026 21:53:13 +0200
X-Gm-Features: AcwNN1XQRPDvO4h0CLOCTqDWdsWEz7RUDSJzPl7o_oxwW7z9viJRHQIo11NfJJY
Message-ID: <CA+=Fv5REcH-Vj71gWidKiKiOvFUULV-uNKBP-sZGJ2XwBQa-BA@mail.gmail.com>
Subject: Re: [PATCH v2 13/22] alpha: add ARCH_SUPPORTS_PAGE_TABLE_CHECK support
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Kees Cook <kees@kernel.org>, 
	Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-hardening@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sat, Sep 5, 2026 at 9:29=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> Add the page table check helpers needed for CONFIG_PAGE_TABLE_CHECK
> and select ARCH_SUPPORTS_PAGE_TABLE_CHECK in Kconfig.
>
> Alpha does not support huge pages, so pmd_user_accessible_page() and
> pud_user_accessible_page() always return false. pte_user_accessible_page(=
)
> checks for present PTEs with user read access (_PAGE_URE).
>
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Matt Turner <mattst88@gmail.com>
>
> Update the helpers to the three-argument pxx_user_accessible_page(mm,
> addr, pxx) signature introduced by commit cf8771ca4cdb ("mm/page_table_ch=
eck:
> Pass mm_struct to pxx_user_accessible_page()"), matching the other
> architectures.
> ---
>  arch/alpha/Kconfig               |  1 +
>  arch/alpha/include/asm/pgtable.h | 19 +++++++++++++++++++
>  2 files changed, 20 insertions(+)
>
> diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
> index 1d28fa8d3b66..da4ec8399517 100644
> --- a/arch/alpha/Kconfig
> +++ b/arch/alpha/Kconfig
> @@ -19,6 +19,7 @@ config ALPHA
>         select ARCH_NO_SG_CHAIN
>         select ARCH_SUPPORTS_ATOMIC_RMW
>         select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
> +       select ARCH_SUPPORTS_PAGE_TABLE_CHECK
>         select ARCH_USE_CMPXCHG_LOCKREF
>         select FORCE_PCI
>         select PCI_DOMAINS if PCI
> diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pg=
table.h
> index bdff33b505bc..6ebdd90f3035 100644
> --- a/arch/alpha/include/asm/pgtable.h
> +++ b/arch/alpha/include/asm/pgtable.h
> @@ -232,6 +232,25 @@ extern inline void pud_clear(pud_t * pudp) { pud_val=
(*pudp) =3D 0; }
>  extern inline int pte_write(pte_t pte)         { return !(pte_val(pte) &=
 _PAGE_FOW); }
>  extern inline int pte_dirty(pte_t pte)         { return pte_val(pte) & _=
PAGE_DIRTY; }
>  extern inline int pte_young(pte_t pte)         { return pte_val(pte) & _=
PAGE_ACCESSED; }
> +extern inline int pte_user(pte_t pte)          { return pte_val(pte) & _=
PAGE_URE; }
> +
> +static inline bool pte_user_accessible_page(struct mm_struct *mm,
> +                                            unsigned long addr, pte_t pt=
e)
> +{
> +       return pte_present(pte) && pte_user(pte);
> +}
> +
> +static inline bool pmd_user_accessible_page(struct mm_struct *mm,
> +                                            unsigned long addr, pmd_t pm=
d)
> +{
> +       return false;
> +}
> +
> +static inline bool pud_user_accessible_page(struct mm_struct *mm,
> +                                            unsigned long addr, pud_t pu=
d)
> +{
> +       return false;
> +}
>
>  extern inline pte_t pte_wrprotect(pte_t pte)   { pte_val(pte) |=3D _PAGE=
_FOW; return pte; }
>  extern inline pte_t pte_mkclean(pte_t pte)     { pte_val(pte) &=3D ~(__D=
IRTY_BITS); return pte; }
>
Hi Matt,

I tested this on a two-CPU UP2000 with PAGE_TABLE_CHECK enabled and
enforced. A userspace test exercised anonymous, private file-backed,
and shared mappings, together with fork/COW, mprotect(), madvise(),
PTE teardown, and refault.

Single-process and concurrent CPU-pinned runs completed successfully,
with no page-table-check warnings, BUGs, or oopses.

Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>

Regards,
Magnus
