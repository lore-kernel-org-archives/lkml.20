Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793901808;
	b=Gxc1YSo0oYJ6q8e4USQmNcRrpUI4cP/Dm8R4WkXt35ACepIm1nz7aMg5gxbILN3m5XKF
	 0M6o0/xipXw7L20oTro3ju8S07Hn43rGv84X7rGDYhIZCqxSm1TSV7kEzUMxS8pvg4R2k
	 +rGsRiCC7pdu7W4KTN2aic52QyOAxbCq7J83kLIGG8BjHs6xe9MNBJSD/uWQayB5MLNbB
	 e+SVKUI7tDhjAXcF6YuPUtsqYs6w+L8I8gqauo+twcanxU6yTr6K1R+ep3L65LlM1H0lC
	 QtqGF92yp+ztN5unUvQ0NoHA2rbAWRsNmX3ha+HS91+HagQA7w7QXE4t3CFC/5lNczQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793901808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qDc7DXHL5O9CQ+ekpIUK5nGMzM9mpnwpQAg4QUsM0cE=;
	b=BW3pFkP55tFSSrmhqnoeun9tvJpyl8B2D6By5R0/EE2OnJmQ5pczKTnxv4akxHcRa4hN
	 2sLwxXvGMyO7LW+O569totBq4Bus1i7wKyMCdZ042SXE2Jqja7xDLJ/iWfXEstpky8QX9
	 aieiZkSdhXL+1Tn0C1sRuyZZqJkfeNc3N8Selki0xxhNuGUYUOv1D1jin0nvQF/DZWmef
	 V30l7YzGqKlrZploaXLKtVjNabfKCkcwNig/xtUI3lTS3XALUahjrxNE0ZcDXobtUlk11
	 acnYztXTYF9mUYbsmVWJhPRHsQVfwHocz6GtPPds1ssi0hyXEKq9uD7xfejOhDGBzBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QAncIksR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80550606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:03:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80550606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QAncIksR
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so26277015e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:03:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793901806; cv=none;
        d=google.com; s=arc-20260327;
        b=FJwszK3o2UOPkfcDszM0e5/zhTpouGFUVSO0mgPnd5lA3P7W6WA+Sm2lAWufBGOIuP
         lm6YQdSHr2s4N1tIIkWAxhQbTqdCWcHzCkzTiOn+cdKIXSUCECi4JT3+wtLYE1yOpwPe
         fSZdRu5AXHy97kH4pz21d3Eko4MY/68UBIAMJRoUL3PnfQxotQ0RlGbk/TPzOH0vTIDC
         6fol3iY24Pf02i1PqrvfhiOAk21gLCESuoE7sHbC6TFS5lHkz+N2D+ROTYK5ZHC4snzm
         T/5uhr8lOQGitgriyvSNUjOcG8D/0DI5WHv/Y8PF0W4IhbNSRuXdL1gckK+eklT9mgJF
         3VkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qDc7DXHL5O9CQ+ekpIUK5nGMzM9mpnwpQAg4QUsM0cE=;
        fh=bupzv78FnxKzlOlurTyyf8Gzz2SZrOqa0xtUlYYlJXM=;
        b=aKNQeJFUw2TLsAuaJ1/gPm44oO7b9z/9uiSq0zeQLi3IDFbkJ1jeElUY+IGBYRNlHl
         cYyJOaIODk7yHxqhc2Viz4elLv7GQI9v2Qegse1+HkS+CXVZjvX22Z4eD7ZLGFRK6d0p
         jRlvuL8SPI5WVbfu1Tzihzo3FFGziJJNidy1J9SxSF3leaXRPAznCOLMXYX5Cvc7FuDY
         uepdyMGx4yjyxWZpfstIGKgMCfRHG9PNPSd78mymriyunDYgeyCuD9SOTHVYGQJ/EV43
         zhOpddWU8oA/wV7ROWGNh8woAWamieYB6UZGJLa+Di46Y8SrcAcHWNytn5b1LHBE84VC
         2QgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793901806; x=1794506606; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qDc7DXHL5O9CQ+ekpIUK5nGMzM9mpnwpQAg4QUsM0cE=;
        b=QAncIksR2vXXpHGSwp7bjc2MZCXx7lACZXYR3qgMBTiBVW9C3H0WxAQEkqEgmgTqjt
         o6T5+jdsKyRYC1NUBBYhDORQg8F4qY13FWe5RJeVpkUIBisGcChkyja+Q01su18yserf
         7Ee58NIaAKXbHUuFvUtiNbQ98IEwtlXdmbn6AV0IJlLiMKBjeuKmLN+bzEzDQqg5HD1C
         E7qCCkR2GoEdeGJMw756pGx3z4FSac7/GpYaahTF4imYJTUuG/6uqtRg6kpQGiaDGzD4
         N7hfou/hKVQQyX878YI5Ar4W17V/bYzMLviR3vBfj/DY6H3L6sNaRwtF221e6lgGylUe
         u11A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793901806; x=1794506606;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qDc7DXHL5O9CQ+ekpIUK5nGMzM9mpnwpQAg4QUsM0cE=;
        b=HUhjErENfyo1QCuc1yO98/skD3c7LMlviu8zB1EIAanYiF8Bukt6pHv9G64PpdI/Kv
         JOoUQoO4heQTex+2W7f6d4HI2QVcQ1ohfOOpPh5ahltLt2hOg48w+y7DEUg8qKZ7DVfA
         n86CEL6vKEjikRjr93LHYdhrrWU+Hy8hoFa2okm5sBkVeqtFXbb7Zm9gNrp6tYdUOTmd
         rAvz+hNe5xLtDvRDbTH07tHr567mNMDdScsNKhhps6lVmvUxvcOwMRLZFWc4i7En39ym
         GanQbibPlOiWbUdVZ9icSxkRRROzKlDaIFkxqj9nTWwvzkQrlDC/kF+eCgWOrrBK8RCC
         cGdA==
X-Forwarded-Encrypted: i=1; AKwUvBwi2N3lmZU4Y3IVGULSwuF590VHJ5IyBA0lJXxzlZM/vO79jQyD0tYMuM7ShvfX5kNxGGAvzi9cSa70eS4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dkhf+ebbpCZYg/ckJublPH7M7IS6KYi+Kg2/sZoJJbQ6tOxFU
	HpHBTbjgCasGE9BlUxvbYVabHKE7dF61TVcFn3ryEAeMaLDoaVWIIs0zTJE0eBg2Ob1pAMHnbia
	XXG6GOTw1DXHXJgTDzApSv2qs2LADqEkMhizqFLBG
X-Gm-Gg: AYBFou3DoyXETfoYqMbNlSckhQB3XiwLNA0cD/SJFP2IWW3Zqfyx20HscsjN3gdake1
	LzZX7InKDET+upSY8hCLYHR6flaVodnKVyAiDPXOK5UWC8A3bMNrE2R1+fSLA/yzPR4xHpA3Kqw
	eIzUip4K5JV/itGsxBWXvxkiYuePuZBdR/nwpZV9kXD9eH8tdlQt7/jd+f5gQO5+zr0q66lsgfu
	cgAH2M80FZ/4MmqgC0oefafZN8UuPKzUvhMgzaURf/rJ4zZC/UJO25Coo0i+V937KmjV6thSzhU
	SSrkmA/XEumn5q2z7ZgfEwxi9mQxdJ99wqwFqnL9rNqpMK47CUyUbYbdBhfdCcxkrONfLWb52xt
	lGgb1sA2rF0HxqoWQdpixG4y8C57YZu8EZg/kO499A8YIx67R8xKPO8FawbJQDicpIIrxbpdnVA
	4v5uHBuIqg8Tv2JbN37q9E4xpoZhMb2sulER8uA07NlhOhOLC8YFjYyGqt7Kxich7LG75sB5PMl
	Oee3t6mgXiClvrFr+xLPQgYRO5BctxaMVBGpATolgaw/V03Kpt5MBUwGw==
X-Received: by 2002:a05:600c:354a:b0:4a3:5aee:2c25 with SMTP id
 5b1f17b1804b1-4ac181e759dmr461771285e9.31.1793901804993; Thu, 05 Nov 2026
 10:03:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105175748.3057520-1-vineet.gupta@linux.dev>
In-Reply-To: <20261105175748.3057520-1-vineet.gupta@linux.dev>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 5 Nov 2026 10:03:13 -0800
X-Gm-Features: AclHuK8C3o2kc44T55unuXB9fXbsGmvBzidv-Ub4iWxmKhGyxfDi4rGo075tswQ
Message-ID: <CAKwvOd=J8bYO6kzFO=mOfWi0NiHq9Y7u6JwV2WfZiS0VOoMpYg@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: move gcc's -Wconstant-logical-operand to W=2
To: Vineet Gupta <vineet.gupta@linux.dev>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Peter Zijlstra <peterz@infradead.org>, Jakub Jelinek <jakub@redhat.com>, 
	Julian Braha <julianbraha@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 9:58=E2=80=AFAM Vineet Gupta <vineet.gupta@linux.dev=
> wrote:
>
> GCC 17 adds -Wconstant-logical-operand to -Wall. It warns when an operand
> of && or || folds to a constant other than 0 or 1. Unlike clang's version=
,
> it also checks constant left operands and operators that come from a
> macro expansion. With CONFIG_WERROR=3Dy, an x86 defconfig build fails in
> prepare0:
>
>   arch/x86/include/asm/cpufeature.h:72:36: error: use of logical '&&' wit=
h constant operand '4194304' [-Werror=3Dconstant-logical-operand]
>
> The warning is meant to catch && written for &. Kernel history has no
> such catch. Of the 13 earlier kernel fixes for clang's version, only
> commit dd7fe5d9fd6a ("rtc: max31335: Fix comparison in
> max31335_volatile_reg()") fixed a bug that the warning found. Commit
> 394b52462020 ("drm/i915/gem: fix bitwise and logical AND mixup") fixed a
> & written for &&, which the warning cannot see. The other fixes rewrote
> correct code. In GCC's own tree, the warning found two sites since it
> was added, and both were false positives.
>
> Disable the warning for GCC unless W=3D2 is given. Keep clang's version,
> which skips macros and constant left operands.

Acked-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Suggested-by: Borislav Petkov <bp@alien8.de>
> Link: https://lore.kernel.org/all/20261104160722.1637541-1-vineet.gupta@l=
inux.dev/
> Signed-off-by: Vineet Gupta <vineet.gupta@linux.dev>
> ---
> v1 -> v2:
>  - Replace the four per-site fixes with this one change (Borislav, Peter)
>  - Link to v1: https://lore.kernel.org/all/20261104160722.1637541-1-vinee=
t.gupta@linux.dev/
>
>  scripts/Kconfig.toolchain | 3 +++
>  scripts/Makefile.warn     | 1 +
>  2 files changed, 4 insertions(+)
>
> diff --git a/scripts/Kconfig.toolchain b/scripts/Kconfig.toolchain
> index 2acbd40a38f1..1d68075f0469 100644
> --- a/scripts/Kconfig.toolchain
> +++ b/scripts/Kconfig.toolchain
> @@ -233,6 +233,9 @@ config CC_OPT_WNO_FORMAT_OVERFLOW
>  config CC_OPT_WNO_STRINGOP_TRUNCATION
>         def_string "$(cc-option-str,-Wno-stringop-truncation)"
>
> +config CC_OPT_WNO_CONSTANT_LOGICAL_OPERAND
> +       def_string "$(cc-option-str,-Wno-constant-logical-operand)"
> +
>  config CC_HAS_COUNTED_BY
>         bool
>         # clang needs to be at least 20.1.0 to avoid potential crashes
> diff --git a/scripts/Makefile.warn b/scripts/Makefile.warn
> index 556fa249ca07..03b677bdbb0a 100644
> --- a/scripts/Makefile.warn
> +++ b/scripts/Makefile.warn
> @@ -167,6 +167,7 @@ endif
>
>  ifdef CONFIG_CC_IS_GCC
>  KBUILD_CFLAGS +=3D -Wno-maybe-uninitialized
> +KBUILD_CFLAGS +=3D $(CONFIG_CC_OPT_WNO_CONSTANT_LOGICAL_OPERAND)
>  endif
>
>  endif
> --
> 2.53.0-Meta
>


--=20
Thanks,
~Nick Desaulniers
