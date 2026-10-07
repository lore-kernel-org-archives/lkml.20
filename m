Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7CE414429
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 21:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791409186; cv=pass; b=KZKZavAju95rb6OoQ0hW2qQjKEsnFOdVT+oNt9dwoUE6N40WVullUmQD9RQ5Z8y4iv2YK2lZTcS3DU3ZmN3uX1pbglg0L3kBH54+8xGvv2Fc+/jC1pv9qp4dsBOeKDxIRuAqTRD5xQIMPDMdnY3Q+hkVCNKtnodt+l6L7+9Oaaw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791409186; c=relaxed/simple;
	bh=JWyzPvpHBQXTzwd806QqR5HZOKZL3EpwVaQS4P551iQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FBlSv8EFsyTfb0hA5sTW4Z2fxu+HZ6HG7uvKuKTUemK00vBVhvlTYWemofv5jHtyPGvNIKI7cAZBCh2zhR8l33nld9MgrA+clOUI6LchhKE0mZjj0brKFxqazRVSnUCo6/fB+l4KInrRCWYJwN9xW59Z5rJMQrlkn35Z4KwFx/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lyItYuDf; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lyItYuDf"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6aa97d1cbffso3890393a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 14:39:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791409183; cv=none;
        d=google.com; s=arc-20260327;
        b=XGAqrC8Gy3LIV2uXiPwVGBqfSxNdfbsJ6G2uwuAK4A2khe14j6ufqi1uQEIleh6MpL
         u0jyhr/yvfnnzfq4vWngvSTfYIJY0UcRmZLKmUUm5ymvmj9GeDrlmNkunI4lFoI2ayk7
         nEMqssMi21BJKdE7oIlHJe+mI5JinhTbRBBJuebGI1Hs7mW8edXq3ubsp4PdjsGqYPb5
         e16kUTt9QMjyGwFPaBTsxw90AAToU8B8hce/KFddX6o/pN0URMVD18g/4CtKD+HmVBsn
         W/I3OZ7NtKambYK+hh+pfngLRgMTyiEZk1Po0o66DlSGOUGB/803bGYC/mFFGJdOJATM
         weqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/Wx3j8s7em4It+YW2aPLKaUN9j3qGpzQEd9/wpoKXk0=;
        fh=+N/GdWZyOLVLEuXbeGLO55tzGDLKVRJg7mQ5JWPmt14=;
        b=Byd+xZ+PZvNKuJZ6L9DlANdV9xsHdPMIzJjKnJ+Znc2zUe345b3FcuFsSo4elESaez
         hAzMWpXzj1DE+26TE6nJ6nhDTAoVB3BE4Q09lGyEJqjL6XwXp31YXCs4AqexqDyzRiqu
         7dYd1k7k4rtRbPiPmSM2GWcal8ct3mLni1gChBoGCg/NUVhkytECIuR5hsqxrp18flxi
         rN1N8CpVIX2US4uIKHEnKLRriNlckBNJwCz79P8T/CQInGXusJyu/30WLobA+Pbnqga+
         3U14qZBNLV2p/zzJtZKyhFeXF1g6sQGDXRdLcI0SBUxc6RF1IrWrIPSEcgm9eIcBbWKX
         Ox+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791409183; x=1792013983; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/Wx3j8s7em4It+YW2aPLKaUN9j3qGpzQEd9/wpoKXk0=;
        b=lyItYuDfZEizGw12eTzsXvcr3yjV2dsXijbNh6XIvNbuajd6cJ95NxEFJPKgsB7iUS
         uKZjNLgsx2sahJFPVMvm2Vg7pPmmqGfhx3Ve0BuQEFZ+qmAB/oV9bLqMkz3RclDtaUb0
         Rul/GBAJyq4t42Tl1wUO3JQLLbMDnhddeMrnfncCKDQ85XhGDiIjCFwWIs5lbsvsck5G
         P52b5rZh5pvDK6c84PJ04KC76QFWyJrJbDuMlBZYyUhlF7FWWy5HuxICIuJOv3KcWPrm
         21Uxjp0fG8XwOcqRaFGXyhpxoo6UgVv45TuIsHhfGmwtedMTNWK2Phy4q2/LpGrgp8c0
         wRYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791409183; x=1792013983;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Wx3j8s7em4It+YW2aPLKaUN9j3qGpzQEd9/wpoKXk0=;
        b=ki8Ec/EC4bctH1UrBneGooK7ih7fJlY/F+4jaFpO4N0jfrQOQLHkknUKYphZU6IKOi
         KznG6qR166QcNv3T8r8OcehJktgPrykEG/GGpHIpI3RSvc0S2RgthUl9VKtIkV+thD6y
         EDvBk8Zb+nmyXNyj1Q28ER8U2Ow6dE/Ai5YWaj+2NIZNHiUYVyQLbCuMT2slRdtUlmtG
         jirISx3yoY1bNJ3G1VcowG08TkPwI5/OYVPrD3WkS2kw1EJP7Zf9KAFR3izwu6pOKsM3
         HVL/Pt7S644LhSRcKOxePzcXuUbpK0GqtLKGGYYuz3pcSgpRdR8i6fo5g44kN9pzwnfv
         ovtA==
X-Forwarded-Encrypted: i=1; AKwUvBw0zq1RdfY8FuLHMeHYQMpuuNeXmEPC45LKokcUF7tLaKKxaHmDKoJs0t7ZylkWYZsY2ipDZmIaPMGJuZw=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3iCf1go1ewsUrOwh8RCptlWiRUvSLlM0X4JJyafZGm7jORvB2
	SwQZ9PnlKWAxpceYFCnw4zAef6Sg/17ZZ6pNFxtH5uEElNAs76PlRhjOn+aRnkOoXBaPJ1/Fe3C
	+u84qzT0tbsN5d1KikY70iXBszhwdY2Y=
X-Gm-Gg: AYBFou1mYXUuXZNkbN/gJMlUlPj2YwpAQIY5TXJ3ETYIXtLGwQ/fDsswgDf/usHHzrD
	ZwRynqL0bMbMArs5qGRI1jqy8Eg/kv53so9oTOKAEIP345PR328fG6d3PyrersXIbjbn93lUPEM
	Yom3WUPCphCOEgm4ql0wvKwcZjBgrlih6/ePUPGB+OmzxoM4kJdOrpmV6+DEQPFj0Kx9HXSM39L
	V6qpSni7NhWFp1onI6beGuVIZTXPiTKHHLOntsskC2JXPl2KkVFus541pJ7ew5QVd+qUDzmSTF2
	KKgZUe7hulkXILbPYUEKzOraQ3SO3FAuYd12ivSTaWPPmmD/v+j5+dE4z0e+OGAt/wuVwcTcE9M
	kLdcQxYcTXv4tf1OdYLy31RJ3CASTTTghqpD/W/7bjkyLmPtu4/zc
X-Received: by 2002:a05:6402:4488:b0:6aa:ff76:3076 with SMTP id
 4fb4d7f45d1cf-6aff47a80f9mr3341037a12.32.1791409182860; Wed, 07 Oct 2026
 14:39:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006-alpha-hugepages-v1-0-a673a18aaa70@gmail.com> <20261006-alpha-hugepages-v1-4-a673a18aaa70@gmail.com>
In-Reply-To: <20261006-alpha-hugepages-v1-4-a673a18aaa70@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 7 Oct 2026 23:39:30 +0200
X-Gm-Features: AclHuK8vegbe0yGNt0PdkgPJ1Zuj7G3aOsGulVX-hIw4x7EklG3ldXU5N1EvPa0
Message-ID: <CA+=Fv5SC4byEbdap5NpoqBgD7ZutMV8DTR3h5h8Pxv_jVOdB_Q@mail.gmail.com>
Subject: Re: [PATCH 4/6] alpha: define granularity hint PTE bits
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Oct 6, 2026 at 4:04=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> Bits <6:5> of the Alpha PTE are the granularity hint, described in Table
> 17-3 of the Alpha Architecture Reference Manual. A hint of N marks the
> PTE as one of a block of 8^N physically contiguous, naturally aligned
> pages that the translation buffer may map with a single entry. With 8KB
> pages that gives 64KB, 512KB and 4MB blocks.
>
> Define the field and the helpers to encode and decode it. Nothing sets a
> non-zero hint yet.
>
> Add the hint to _PAGE_CHG_MASK so that pte_modify() preserves it. Swap
> PTEs leave bits <31:0> clear, so pte_huge() is false on swap, migration
> and marker entries, and page table entries above the last level keep a
> zero hint where pmd_bad() would reject anything else.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/include/asm/pgtable.h | 51 ++++++++++++++++++++++++++++++++++=
+++++-
>  1 file changed, 50 insertions(+), 1 deletion(-)
>
> diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pg=
table.h
> index d123fd0d4091..605b82f73a98 100644
> --- a/arch/alpha/include/asm/pgtable.h
> +++ b/arch/alpha/include/asm/pgtable.h
> @@ -65,6 +65,8 @@ struct vm_area_struct;
>  #define _PAGE_FOW      0x0004  /* used for page protection (fault on wri=
te) */
>  #define _PAGE_FOE      0x0008  /* used for page protection (fault on exe=
c) */
>  #define _PAGE_ASM      0x0010
> +#define _PAGE_GH_MASK  0x0060  /* granularity hint, PTE<6:5> */
> +#define _PAGE_GH_SHIFT 5
>  /*
>   * The Alpha AXP ARM defines 8 protection bits in PTE[15:8]: KRE, ERE, S=
RE,
>   * URE, KWE, EWE, SWE, UWE (Kernel/Executive/Supervisor/User Read/Write
> @@ -103,7 +105,36 @@ struct vm_area_struct;
>  #define _PFN_MASK      0xFFFFFFFF00000000UL
>
>  #define _PAGE_TABLE    (_PAGE_VALID | __DIRTY_BITS | __ACCESS_BITS)
> -#define _PAGE_CHG_MASK (_PFN_MASK | __DIRTY_BITS | __ACCESS_BITS | _PAGE=
_SPECIAL)
> +/*
> + * pte_modify() must preserve the granularity hint, or
> + * hugetlb_change_protection() would turn a block into single-page PTEs.
> + */
> +#define _PAGE_CHG_MASK (_PFN_MASK | __DIRTY_BITS | __ACCESS_BITS | \
> +                        _PAGE_GH_MASK | _PAGE_SPECIAL)
> +
> +/*
> + * Granularity hints. A PTE with hint order N is one of a block of 8^N
> + * physically contiguous pages, naturally aligned both virtually and
> + * physically, that the TB may map with a single entry. With 8KB pages t=
he
> + * four encodings give 8KB, 64KB, 512KB and 4MB.
> + *
> + * Every PTE of a block must still carry the PFN of its own page, and al=
l of
> + * them must agree in bits <15:0>: the protection, fault, hint and valid=
 bits.
> + * __ACCESS_BITS and __DIRTY_BITS reach into that range, so young and di=
rty
> + * updates have to be applied to the whole block too.
> + *
> + * The hint is advisory: an implementation that ignores it still transla=
tes
> + * correctly through the individual PTEs, so it is safe to set on any Al=
pha.
> + */
> +#define GH_ORDER_MAX   4                       /* hint orders 0..3 */
> +
> +#define gh_cont_shift(order)   (PAGE_SHIFT + 3 * (order))
> +#define gh_cont_size(order)    (1UL << gh_cont_shift(order))
> +#define gh_cont_mask(order)    (~(gh_cont_size(order) - 1))
> +#define gh_pte_num(order)      (1UL << (3 * (order)))
> +
> +#define for_each_gh_order(order) \
> +       for ((order) =3D 1; (order) < GH_ORDER_MAX; (order)++)
>
>  /*
>   * All the normal masks have the "page accessed" bits on, as any time th=
ey are used,
> @@ -269,6 +300,24 @@ extern inline pte_t pte_mkyoung(pte_t pte) { pte_val=
(pte) |=3D __ACCESS_BITS; retu
>  extern inline int pte_special(pte_t pte)       { return pte_val(pte) & _=
PAGE_SPECIAL; }
>  extern inline pte_t pte_mkspecial(pte_t pte)   { pte_val(pte) |=3D _PAGE=
_SPECIAL; return pte; }
>
> +extern inline unsigned int pte_gh_order(pte_t pte)
> +{
> +       return (pte_val(pte) & _PAGE_GH_MASK) >> _PAGE_GH_SHIFT;
> +}
> +
> +extern inline pte_t pte_mkgh(pte_t pte, unsigned int order)
> +{
> +       pte_val(pte) &=3D ~_PAGE_GH_MASK;
> +       pte_val(pte) |=3D (unsigned long)order << _PAGE_GH_SHIFT;
> +       return pte;
> +}
> +
> +/*
> + * Swap PTEs leave bits <31:0> clear, so this is false for every swap,
> + * migration and marker entry, not just for ordinary small pages.
> + */
> +extern inline int pte_huge(pte_t pte)          { return pte_val(pte) & _=
PAGE_GH_MASK; }
> +
>  /*
>   * The smp_rmb() in the following functions are required to order the lo=
ad of
>   * *dir (the pointer in the top level page table) with any subsequent lo=
ad of
>
> --
> 2.54.0
>

This looks good to me,


Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
