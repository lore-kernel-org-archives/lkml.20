Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794897873;
	b=rCt/LuV0mGwDEpUKcN8C8KltDSJkBBYSkNiPEnkg0MdSaUfOPKzRL3wu+N6SISSB0tAH
	 WLs0+ww9LIS5lrMcQyCpHjNjuWVXfT9+jgSsHl8Gj2NnJQLNI69uuBxsx7suSFswf9w/i
	 bPPay5XksHZw+4Il2u4XwHlDb6qdDJybxB+JgtgR3fa52s2zAFXhrxvsgatTpEUikhEVa
	 SRuNwr0D8H9m1N9KG+6VQG4m2mwtVvEXyonJjYXNl6Cjrk6mKJfjzzmoBiYVpRUELcXho
	 kGEOgPPgleSTgzLuipKryeb0tBoJzH7VYFPn2gQEuoghV5+98FZyci+y+uFbobrjSpw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794897873;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TH8Oi7P8KXpzIblt3KcU7nFbLbGs1WLQEa8m+elCA8I=;
	b=CXhvFq6Z4P1m7n8m96XwU65ZRK3hFDhCUlsBNN/nvmEtCr4yoE+jK2zm7JAalMCwPc8n
	 g2G53P+NOXbKnVr+xZ1L4kzoW/sWBZXAYqyfH61uGeFP8smm5RVkzGj3jRNeUwxpfL7y5
	 jnqGBJ1WcSHZ0QwUSdtCrNaJIAc+vsXT8mwzV8evJ9to2IwFLb4VwaAtV0pUcXS8NajmB
	 pC/3naNggZ1x5Flhsa+WzL2cN5v6pcgmDLz5rPNv3NggIY9be2LjdivBf4F20yVy45ARb
	 cXscdfn1YeppMd2s5oKxPLIlMa5MuLbFVopSdK9vLzBvuRKQ7RWZNljLlvRueAFMuEA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tUFbrFy2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB653606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:44:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB653606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tUFbrFy2
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b86bbce3d1so338968a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:44:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794897871; cv=none;
        d=google.com; s=arc-20260327;
        b=KtNUviBS93cfdadMTdRvjvI0I7SJdvqSqqUv20+4TzS8t43tRvT7JGxj/U3TBrKdtO
         ZVX7HxgQzNEQUfrjNQ6P3ZiSqyNqH+lN9xTafCspPI04yGQ54tn4Fq9qe7m2DpiFDc+R
         Jq8gomlwNm7G5H5+IaO1QvzIvoUFPzWNdhppXy+pM2E6pMlWBPoVBqbhNlyOHtfzpGVs
         o+MMYD5UuVoIIzIMxzcY3rO4zL8/8fFibDjoRjHXhfMXffwolT+Yv3CEv+kaU7fX/LKY
         mRv2ptM38tbbdQ07/tg/l4OdGBO/ZoG4P73gnYflshbwXrNTlRuLks1yglTIn945ZPp3
         IH/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TH8Oi7P8KXpzIblt3KcU7nFbLbGs1WLQEa8m+elCA8I=;
        fh=8KRhVAEhQ8gY/yFStK8U2dpv+4yvHmkWHHC7iqEZ2p8=;
        b=k/emk5STAq2WK+9YQmsYY3H+qnw+7XDDDDOjYvK9Okr9kKf+bHBiSRNHyZaviWhTWD
         2ceTWy/dUdYgdzNDwDNg45NHcm1iTqqlAVHtTTZWTJ9sW8RSwFCPnu+N0F12nkFY2kbi
         1ajLhZGha7NoR9EmyqbSL+VwiNa3SASivaRSd+rA5A99uztCsTdg6LLUlPLzH/hX8tss
         DBXicoPu7Pu7Oep7Dyk/1XTboWNcb984FbiqJ1jr85NlQBXkfnHUjfZpo6oWQ/p1en9T
         xU/dXuwXHJzXc/QKAQEKPSPJJvfJ/1yfowgl+SHjX67NziPrlmZzrg+8FxfY8oWAHkHn
         IvlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794897871; x=1795502671; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TH8Oi7P8KXpzIblt3KcU7nFbLbGs1WLQEa8m+elCA8I=;
        b=tUFbrFy2oVRR4D9dkth8PLtX8S+v90L+bFtrhKX9m1UuYrgY9tbNg9L8I33jAMcvqs
         8wtUR6CFIEwrSNV78pMA8IYXASYQyTqAeiPy/G2xz/gN99ddC07qWcV0yfH36XGd9maH
         BU3lNPHRyLukmyQ7TQOzty5meGpDKprrZMWPzbreXyCrvAcNigAnwOtK7CzMmtCehri3
         HE95W5EafhGtjlImAXRJ/YlYizoDU8kbh/YVuQ+Lwgv5JYD+qPrd0Dlw1HrhkSbLc2Fu
         qy7MJERiSetm3cSzlquq2MsFHjK8IVvZ+ZyKc7B5hw7sudZq08B6zZgoBO9s5nRfF9e1
         3hNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794897871; x=1795502671;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TH8Oi7P8KXpzIblt3KcU7nFbLbGs1WLQEa8m+elCA8I=;
        b=Q3omwX0lIr5uI5xAuX9hNfNHwgYdSz7KP9y6Tz7/1KRbVTkFpxYfQU+A8aCk8/bR8E
         /9veC+w1qfe0M8m+EI+BHX4+Vw4D3PRXuGv8nbMi2rVzBkTHzktQDbMafE+WnIeQZTnR
         v5KLZ3Z/usuBXaVp/f81V86J0e1W/TPtdJ2zUUHFbSaclFdKIwAvo8kKKS7ZBWi8axjY
         /YDbG0Ue2l+D3fz+iuVbNSspuenNasugL2zovQSLMsi6FXJQcDWk/RkXL40Rsdi1y1CG
         csctYFr2H+CfT8PIijWyrtC6YhQ/Gc+D1JU6aNydI9hWauFq+DALQVQVIDLnlyK399GE
         /oIw==
X-Forwarded-Encrypted: i=1; AL+hErGzIv4G/SQU9/nJaVz1WCFzeHDDAq5d1sZPep1Zy5HpIYAbo/UB8lV1duj9NSG6qzSfPwGU3KWjdhgxwDs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1bTf+HRR8D8VVuIG8/YGJNrybsP4ENWZo/O23nd1sllCfGOuN
	9KNo73PEvGhjNlvB7CeYxA8DABfbr154YrCAreB3O6XsI78sblpjD4YCEK4GPFUW5jDg/l9rTJe
	BdNZQCtZauB2fjtNUxUgzUji6hDvvW4M=
X-Gm-Gg: AYBFou1M+5/xLsqYG6wQv0OA5eQVCnrwoScMEN0xNuHDWMA3VtBSx2qM72Dnwu2IHUv
	37lfA9gu2W/3QHEHminTpe9DLVLqFjzwCQ1SsvjYwmXCEDIQK/TumQwsN/ZFrtAWN7+9BMrvS6p
	Ct8piRmTYMPvfPaNGeu5F4SRM1dcXZuBBA9fIb+dC9QC4ZIhXMS+OV8SCKWq+yQ+EB/K2iZgDYX
	GzN6GquGUAaKxQ5Ew+avkhKB3T5q8j841HMW0E6n8SvGwC5ySNGkSkxT3H3Sk4SHNxOpvX1031v
	ZwJU2CW7UU5IwIo04yULrnUxyrBQeBygTireZJrQ73T+GEITVq77ZTYA4sfNQVAu0G+W9o/s6tn
	94bIfKrit3U+nC6xln+3Sn99SM/uSNnaayH8VEYRCFpbGVMumghihvpWgrH7YW3ulCYMoccopTY
	TDXI+2rzXCDEShmKAZZwlWT0Gf
X-Received: by 2002:a05:6402:c704:20b0:6b7:b5e2:cabb with SMTP id
 4fb4d7f45d1cf-6b7c0bb993bmr5955812a12.8.1794897871015; Mon, 16 Nov 2026
 22:44:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-alpha-compile-v2-1-846bb099b319@kernel.org>
In-Reply-To: <20261117-alpha-compile-v2-1-846bb099b319@kernel.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 17 Nov 2026 07:44:19 +0100
X-Gm-Features: AclHuK8YsvjvZp7sEaeIsouBlxaLyp-jgfja8tf63lB_xIOqlJHi3e63Ijh0AdQ
Message-ID: <CA+=Fv5RbQbP5Bd3J-xyHGPXxcKO_T5TuU-eUZygf7FKfi56jEg@mail.gmail.com>
Subject: Re: [PATCH v2] alpha: Use symbol assignment in SYM_END
To: Linus Walleij <linusw@kernel.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Tue, Nov 17, 2026 at 1:07=E2=80=AFAM Linus Walleij <linusw@kernel.org> w=
rote:
>
> Alpha uses the .set directive to select assembler options, so the
> symbol assignment emitted by the generic SYM_END macro fails to assemble.
> This breaks COMPILE_TEST builds left and right, e.g.:
>
>   Error: junk at end of line, first unrecognized character is `,'
>   Error: .size expression for bcm6846_runner_start does not evaluate to a=
 constant
>
> Override SYM_END to use an ordinary symbol assignment for the calculated
> size. Preserve the symbol type, size and local size symbol while leaving
> other architectures unchanged.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202611031620.n4ptlpo7-lkp@i=
ntel.com/
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
> The generic SYM_END uses .set for symbol assignment, but Alpha interprets
> .set as an assembler mode directive. Provide an Alpha override using
> ordinary assignment.
>
> Tested the unchanged Runner wrapper with an Alpha-targeted GNU assembler
> 2.46.1: the original header reproduces the reported errors, while the
> fixed header assembles without warnings. Symbol sizes and the embedded
> Runner bytes were checked. A full Alpha allyesconfig build was not run.
>
> This patch was prepared with LLM assistance.
> ---
> Changes in v2:
> - Use __ASSEMBLER__ instead of __ASSEMBLY__, as requested by Thomas Huth.
> - Link to v1: https://patch.msgid.link/20261103-alpha-compile-v1-1-9e93e2=
260a9f@kernel.org
> ---
>  arch/alpha/include/asm/linkage.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/alpha/include/asm/linkage.h b/arch/alpha/include/asm/li=
nkage.h
> index aa8661fa60dc..275de8ac693b 100644
> --- a/arch/alpha/include/asm/linkage.h
> +++ b/arch/alpha/include/asm/linkage.h
> @@ -6,4 +6,12 @@
>  #define SYSCALL_ALIAS(alias, name)                                     \
>         asm ( #alias " =3D " #name "\n\t.globl " #alias)
>
> +#ifdef __ASSEMBLER__
> +/* Alpha uses .set for assembler options, not symbol assignments. */
> +#define SYM_END(name, sym_type)                                \
> +       .type name sym_type ASM_NL                      \
> +       .L__sym_size_##name =3D . - name ASM_NL           \
> +       .size name, .L__sym_size_##name
> +#endif
> +
>  #endif
>
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261103-alpha-compile-efdde587115c
>
> Best regards,
> --
> Linus Walleij <linusw@kernel.org>
>

I've already applied v1 as a6424204bb55 ("alpha: Use symbol assignment
in SYM_END"), and it is in my published for-next.

Since v2 only changes the guard from __ASSEMBLY__ to __ASSEMBLER__,
could you send that change as a follow-up patch? That would let me
pick it up without rewriting the existing history.

Thanks,
Magnus
