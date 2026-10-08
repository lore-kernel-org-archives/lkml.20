Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DCE393DE9
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 14:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791469684; cv=pass; b=obtWIUNI6q5NxGjCv6FrvZBogN9p+KFx0mAbae9SFgiWK/WkkkuYdi612xK8mCz+qxinsS95RSCZUmS4vrv6dOfz/5Nld/SeaQAFBf1gG37QzHOHeo5t2KfRC8xCCPEZ+oHt0Yr9pjm9Gj+dv1VatChS8tgynsLt1pHyXTBj3SY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791469684; c=relaxed/simple;
	bh=keOSQgCBg5o9yF+yqfS+kAZznzz3Kp36g6dua0RP338=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KHxKEjur1mTBBPyQni/6SIg+N12o6bJUtISPGihOalh5t9H3oXUG4kwtq5msCDJzopLTdi6i2WMV9Iz/oZCnA0Zp+0MpuN7vZYUQYnAUMJn8myV1Z4RaBXKdQ4i0qWw3x7LjJYuFZN26JEJLG4BpasJsqlJL9c5JF2zUvMjrg3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Da3JbWQe; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Da3JbWQe"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b1701294d0so304915a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 07:28:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791469682; cv=none;
        d=google.com; s=arc-20260327;
        b=gObkr2LSOyXzaPAOxNrfxWXx2YMO7I2ve4xFzOyijhXhZDwGIQzzSCXGKO4IeCER6x
         Dt0ywnMv8q/BANIUfPqefV6DAEwCjG2W4ab7+hngUusJcaXw5s6QgyGKdXLVQVnuGv45
         kAgs854G2oUveQPzsqudZm0R2pba1JmImFSLqYxtuQDMIyvKMI6BzeCtiOFERE9Ct3dy
         6WdHE7aEztq2WHA/mfrnz4ebJUH+awx6GJ+pSgyo1SgRzJBO7//oyE2kqNn8av3nWAgk
         CRznStycTOPDJjT8wKSBaGQUjsUk5cFsvcJNrVZeiVj3CdZRqcyRSiXQTgEB625Pc50U
         w4Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5ZGFIe06azsu9BMIbRvkzv0DNeRxdepAkNT9gQZRAmc=;
        fh=dF39DWvnqZaX44PxIBVGw4m2vP8iBD7uzLS5DUmqP/w=;
        b=OW+Yu/cUz+GhNrRyA/Ae9D4Jh6rFv09/qxTNLO3voL4cyOKGi2xgcGlfkYdouPiYcv
         Mt89eT8arabFYL90ddZdj5rA0XaCpW69QLB/Yw9MU0RmTsWzCICkuHoGbFNy0h4rr2mm
         tWwC4IXM2l4Gf9F8iKspAy2+t9eFDTRHeqtgRBmE86kq3c2DfLBBWl7X1YzU+IvPajVS
         2uAyHKPMdU5A/N2b60n3A+zABI/QI9ewJa6OeCR0l9P4pBj8d8SvkNcflFso0ta4lYnI
         mJRKgv6qDOwRMymtyMPrSGOqMMOq+SEBCpclQWFZjdhhz3X3DL/BcCgONm0MJ9JXnvff
         fxXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791469682; x=1792074482; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5ZGFIe06azsu9BMIbRvkzv0DNeRxdepAkNT9gQZRAmc=;
        b=Da3JbWQeOtcpPXfQI66ZICgXO1r2Fqmrg5UUtPSXnS/O5xdNmymUeL+yjv9372N/lU
         FfpcMCvhxoSwG7FM3K0wqIJfRrv0q7OuXLm/PzIrU5DsZ312S8zSPycY1NFvlPdE6lUp
         /libW7P1jYEDs4i9LUl5aPDzrMgVWdDaaNek5QZU+eyF2dmN0CqQMOSpn+Q7cxS/WEWT
         g0giq5KVepyTxr6szWhuTCXzG3bP51Y/Ft6p/7Iz0VkzIs/XssBdus65nyfiU3XqpFCI
         HgfFBNcjmRnTsQlLNlBITOwrkpJ6jKCA8goMYvZpLodBR7cOIfzUN6Eq5BePhHOVrGMs
         PFAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791469682; x=1792074482;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ZGFIe06azsu9BMIbRvkzv0DNeRxdepAkNT9gQZRAmc=;
        b=TGgZJ3yO3UJtw8fhdE7O+0NgLOBdGqWF5nAZofusCskx37Iui1tcL+MVxxG3tUNpkY
         /1K1t4LlqjE4f6jsswnGl5XlfgbHBoCeCnupCz4cDjQoNY1M60ZC+SYgY786j5VCrcWO
         mZq4Zdkr0vaDgyJBEY+XI4BHRTD24MEduQK+OljgLv7oUIccDwoe4I26snNITfEB4ke+
         Ya+WdvEVTWNGyZAH560WBxlgKeHWDUHShQh3hGNUst7mWOARaFIo1kXvsXCgok/hceHE
         kBZSiQP86uld49sHoQyV3QyundW8C+tkyXBYaxg0S/LWRowS4MAXBepnGlhXI9CEOUeK
         xTNg==
X-Forwarded-Encrypted: i=1; AKwUvBylFPdIhabSg2NadpSKkTEFooMbG6LalF3Zo79VzEKqyV80/BX+d/vByJH98nodOycaRVPrQu1lA4gEf9I=@vger.kernel.org
X-Gm-Message-State: AFuF++kCeAfPJWFc+e3Gbrc+m0ycSsxtlUFL1X9YmRLBhLKda2jWfe+e
	uqVNgnXxqTRmJPMScICZYO46tX7AFfbFdyGVQ5CnDrMA9aFZ5RLn8YHY8rroS9Cy6YKrIjtg8/C
	94EcFVnG4gllmJXZzZa1so87WLMzI4LQ=
X-Gm-Gg: AYBFou3zVdcJUMHItG5verww7e2p5p9uDS+bzdWlOusDGSvbxYKh6sGgbwGa9m7NKxM
	1orrh2yk60qMz+MK1Se52/4k0C4sjG4slROPsXdtiGTiRGkAKwm+l7Sur8NXHsefEp/4YDsMqjJ
	+F3cX5ME4KVYaVGCJhmRKiENZKPWsLPaNW9snts+/7pFl3Fjg2PtKbcVYj+PM2gjlRwmO0jQg/i
	IDY9UOhKw370bFtuQ2i2NEI4CiL2GX6/c1g6sXM12nzyUDrMmqIfhpfzvBjSn07xrjjffe/LxT5
	IDfg/XVu2IRofCccFDzYFOCH5/PyDv7osgOe/D+RHuhspmoXkEe9WidmSIH8y/CGfJx4oDnwb85
	sIb5xlA+3/7yjZrrM8YlwU/gXKds2/KSHZTVHFYVBwg==
X-Received: by 2002:a17:907:c17:b0:c29:5340:182e with SMTP id
 a640c23a62f3a-c317bb4d250mr588692966b.2.1791469681494; Thu, 08 Oct 2026
 07:28:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007-alpha-hugepages-v2-0-8e108af2d961@gmail.com> <20261007-alpha-hugepages-v2-3-8e108af2d961@gmail.com>
In-Reply-To: <20261007-alpha-hugepages-v2-3-8e108af2d961@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Thu, 8 Oct 2026 16:27:48 +0200
X-Gm-Features: AclHuK9MTZQWArXmwotud4oJKmlLTivFsz8qsoyMOcL8h1IMQPbVLGFB76zHeI8
Message-ID: <CA+=Fv5Rzq8_6wYKpaKb6xfZp6_YECw8bRmTLawA7A8if3kDpSg@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] alpha: describe the PTE read and write enable bits
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Peter Xu <peterx@redhat.com>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Thu, Oct 8, 2026 at 5:24=E2=80=AFAM Matt Turner <mattst88@gmail.com> wro=
te:
>
> The comments on _PAGE_KRE and _PAGE_URE said only "xxx". Describe the
> four enable bits as the Alpha Linux PTE defines them, in Table 22-3 of
> the Alpha Architecture Reference Manual: kernel and user read enable in
> bits 8 and 9, kernel and user write enable in bits 12 and 13, with bits
> <11:10> and <15:14> reserved. There are only two processor modes, user
> and kernel (section 22.5.1). Linux uses the read enables as its accessed
> bit and the write enables as its dirty bit, so say which of
> __ACCESS_BITS and __DIRTY_BITS each one belongs to.
>
> The names differ from what the hardware calls those bits on the 21264.
> Its PALcode loads the PTE unchanged into DTB_PTE (21264/EV67 Hardware
> Reference Manual, section 6.9), where bits 9 and 13 are the Executive
> read and write enables (Figure 5-27), Executive being mode 1 of the four
> the processor implements (Table 5-5). That is a detail below the PALcode
> interface, and it is also the layout of the OpenVMS PTE in Table 11-2,
> which is not the one Linux uses.
>
> No functional change.
>
> Suggested-by: Magnus Lindholm <linmag7@gmail.com>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/include/asm/pgtable.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pg=
table.h
> index 8a175e0c2b42..d22e28b956fb 100644
> --- a/arch/alpha/include/asm/pgtable.h
> +++ b/arch/alpha/include/asm/pgtable.h
> @@ -65,10 +65,10 @@ struct vm_area_struct;
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
> +#define _PAGE_KRE      0x0100  /* kernel read enable, in __ACCESS_BITS *=
/
> +#define _PAGE_URE      0x0200  /* user read enable, in __ACCESS_BITS */
> +#define _PAGE_KWE      0x1000  /* kernel write enable, in __DIRTY_BITS *=
/
> +#define _PAGE_UWE      0x2000  /* user write enable, in __DIRTY_BITS */
>
>  /* .. and these are ours ... */
>  #define _PAGE_DIRTY    0x20000
>
> --
> 2.55.0
>

Looks good to me.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
