Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BA54DA9D6
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 12:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791548714; cv=none; b=lK17lQGhZ832A8Oundnz1Kw9O3kdNc118i4UkKRxKSao5yJ6/zLKfwehYlvjahBW34yTBTuajl5eqCxJy6yAIzVJmr7nRktCBcKaL8fOKD49bTAXiVQ1sCJPw8uxbYucOz+p6BIcegPH0lZMZArIyppRSs87V19Anah2z3l3EiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791548714; c=relaxed/simple;
	bh=hIx/JZ8ZXCx17f3OrIeJ7eJQdRS7F04oOVjlMosIUV8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h5W/zupE4g5JbggxV+QaAAq+QMJUJdjV6h+2Qrp0pfjtXykVs+Gp1P0Ean7qH62m/xIL/lSKwwWRPH0Qe/vjES2hgnZzIhfF4ZKJ++xdc0bm7HrqOcbUfmBzwnV8ZXf5VCtiTRabuRDepIRPn4eQzUZI9rOypdZTL+yXQVlGj8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R5i22PC1; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R5i22PC1"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so34317575e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 05:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791548693; x=1792153493; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GJ2EntfC5k3oRjFV7IUX8CiLH1W3oXSVY1zFXmllLxA=;
        b=R5i22PC11AoAr3E9s8K3T6E4Sh3oCUOmblGiX87gXcEpunhYlVVO51wC7CkeSjXV1L
         2bacCfpuC98uueEjZ47qF4pqrHfle8NTwYPCUPPf2iiORgFJwAWDZbVm4kbVhG+HGNnY
         /OTPY7NYVDyE/9UBoRIObnNUTkP35FrBv+rUt9iZFEMHLeR0gOjnHTRzwl8CVafyNIPA
         OXzkB2EAtGk8vBG3F5RBi3olFSFPYofzbPh4aH0djGz0nggiPzL419jutvq6LKE1IT3M
         MdccBgKHkRvhsm59fjyMWNwGntiGeLUxsstiL39ORZgGoUjdu9E2gioMos0jSKqMHjyX
         Uxlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791548693; x=1792153493;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GJ2EntfC5k3oRjFV7IUX8CiLH1W3oXSVY1zFXmllLxA=;
        b=wOa3wf6VDbnh/qPO9hkCE2UvBsLSQlXQ3BqvZPbqcpVMsrXoW8ce/Ba3rBRUEAOKCO
         CKdtHMWTYTjWj+wSTy8gw2OASQz3RXSNAUjAGiHvLKjk6mi2A8B96OZ2Jbkqj5unt2j5
         GunGdSp0LXBjcEughEioU3y7Y7/GGLBNy7+6hKeH4Q+P74FmdfPCSwGq7zzjJ1ygyc1D
         +3w7jZLHWpWgSii6vzMiyicP7N6z2p4c7/6qpJnBGTLdgrZf/tFiwHGK1UQcT0IFXBPa
         vdvulafkL8PV+MYVIQ6x3rsQ3vLIKPmuTMUOsQ58s6l6THNVp8oDl7ksyMK4Rfjo9GSE
         fQOQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMhtSVzkrWbqU8BVgCeaWoCuNBFELCoBBQte9GynZ5I2XZS8qwQlGg/CcDZ+apHoVLT0YQOgxA1rtJ8Mw=@vger.kernel.org
X-Gm-Message-State: AFuF++m9bUcyukU6/AfWhWyRbACkd5MJ3RteIO6eLOgT97Iv/ibpHz+w
	SfygyRI9AvZdK8EiTq5nYwI1Ik0PqKOwmm7xO4yxE+ZXo7WPUx8Wv5qR
X-Gm-Gg: AYBFou174rrBuJ7LxAg+JwmneTF5HfxSJbnsEMEKI+oQk1Ky7dT3Y2Ay+2BASxRMpvp
	0Ho2eA6t1BfoTKCh6+heLqLNXmLaUmWQw5xawol5CBUymPXiepXcP62Xu9T0c3Gu93uQPmHlU6Y
	HM+dgUjZZhSPzn1kSbm+REHdoPdxYN6HwCprYLTLuDqbm0M+3hKydZo8ZDLDZ2bCdpALmcsAmYB
	Tn0zIJRv58FJl6x5BFYUIn75lk8ys8GkpvLHaRMmw9bTEAfVn4ShQxGZgUmsaIvyq0+tl7oS+cR
	IhF36Ia9Wvqi0jCaQJmI8fXJdcvS3J3BObqLu9KnGTJR1EEHL17vjvoL1tdlTacOcLcai+MEUR/
	r4y28lVylRuQrPPs/2W0/PUMG9HhA4X2PMCZdZrZCfPrTWKA+WLS6aZBtZAOEelU2oU83UgDYtI
	1vYFARb/G28ST5hd1xeSqdaLJsTPtAv1KtL+8/d/znuwN242+S0l04hnmjWO/nW8eBA/XVcEMtv
	ZGLOX+bL5zAYtUnNxW4ibMZoYMiHanya4JI485/6QDOgI7uIWXUs0Ggp21L5ppa3XVRaQ==
X-Received: by 2002:a05:600c:548d:b0:4a1:71e5:9420 with SMTP id 5b1f17b1804b1-4a18e49c128mr32347995e9.13.1791548692391;
        Fri, 09 Oct 2026 05:24:52 -0700 (PDT)
Received: from [192.168.151.120] (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18beacd2csm61164875e9.14.2026.10.09.05.24.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 05:24:51 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <34f98a75-1050-4116-a2f7-2f118b77cd4c@gmail.com>
Date: Fri, 9 Oct 2026 13:24:50 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] kconfig: use the value argument in
 sym_get_near_range_bound()
To: Leizhen Zhang <lzsx618@gmail.com>, nathan@kernel.org, nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261008164540.3686383-1-lzsx618@gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20261008164540.3686383-1-lzsx618@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Leizhen,

On 10/8/26 17:45, Leizhen Zhang wrote:
> sym_get_near_range_bound() is meant to check whether the given value is
> outside of the active range of an int/hex symbol, and is called with the
> symbol's current value from sym_calc_value() and with the default value
> from sym_get_string_default().
> 
> Since commit 9b8719973ee2 ("kconfig: use unsigned integers for hex range
> checks") it ignores its value argument and uses the current value of the
> symbol (via sym_get_range_val()) instead. As a result, an out-of-range
> default is no longer clamped in sym_get_string_default(), and
> savedefconfig writes out values that are equal to the effective default
> again, for example CONFIG_A=4 for:
> 
>   config A
>   	int "a"
>   	range 1 4
>   	default 8
> 
> The existing savedefconfig_range test did not catch this because it only
> covers symbols without a prompt.
> 
> Parse the value argument again, and add a test case for a symbol with a
> prompt.
> 
> Found while fuzzing Kconfig input with ASan/UBSan.
> 
> Fixes: 9b8719973ee2 ("kconfig: use unsigned integers for hex range checks")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
> ---
> v2:
>  - Use my real name in the From and Signed-off-by lines. No code
>    changes.
> 
> v1: https://lore.kernel.org/r/20261005202524.3461824-1-lzsx618@gmail.com
> 
>  scripts/kconfig/symbol.c                          | 5 ++++-
>  scripts/kconfig/tests/savedefconfig_range/Kconfig | 7 +++++++
>  scripts/kconfig/tests/savedefconfig_range/config  | 1 +
>  3 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
> index 2e87af0985..11302faa28 100644
> --- a/scripts/kconfig/symbol.c
> +++ b/scripts/kconfig/symbol.c
> @@ -195,7 +195,10 @@ static struct symbol *sym_get_near_range_bound(struct symbol *sym,
>  	prop = sym_get_range_prop(sym);
>  	if (!prop)
>  		return NULL;
> -	val = sym_get_range_val(sym, base);
> +	if (base == 10)
> +		val.s = strtoll(value, NULL, base);
> +	else
> +		val.u = strtoull(value, NULL, base);

Minor style nitpick: I'd prefer a comment clarifying that the 'else'
branch is for the 'hex' type.

But... since I'm planning on a refactoring of this int / hex parsing
soon, this is fine for now.

>  	range_sym = prop->expr->left.sym;
>  	val2 = sym_get_range_val(range_sym, base);
>  
> diff --git a/scripts/kconfig/tests/savedefconfig_range/Kconfig b/scripts/kconfig/tests/savedefconfig_range/Kconfig
> index fd59d9082e..d879870a52 100644
> --- a/scripts/kconfig/tests/savedefconfig_range/Kconfig
> +++ b/scripts/kconfig/tests/savedefconfig_range/Kconfig
> @@ -58,3 +58,10 @@ config INT_CONDITIONAL_DEFAULT
>  	int
>  	range 1 2
>  	default 3 if USE_DEFAULT
> +
> +# Default outside of the range of a symbol with a prompt
> +
> +config INT_PROMPT_DEFAULT_ABOVE_RANGE
> +	int "int with prompt"
> +	range 1 4
> +	default 8
> diff --git a/scripts/kconfig/tests/savedefconfig_range/config b/scripts/kconfig/tests/savedefconfig_range/config
> index d939cfe5fd..079a3107a0 100644
> --- a/scripts/kconfig/tests/savedefconfig_range/config
> +++ b/scripts/kconfig/tests/savedefconfig_range/config
> @@ -5,3 +5,4 @@ CONFIG_HEX_DEFAULT_ABOVE_RANGE=0x20
>  CONFIG_INT_IMPLICIT_DEFAULT_ZERO=1
>  CONFIG_INT_CONDITIONAL_RANGE=2
>  CONFIG_INT_CONDITIONAL_DEFAULT=2
> +CONFIG_INT_PROMPT_DEFAULT_ABOVE_RANGE=4
> -- 2.34.1
> 

Thanks!

Tested-by: Julian Braha <julianbraha@gmail.com>
Reviewed-by: Julian Braha <julianbraha@gmail.com>

