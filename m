Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC6B471429
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 10:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789814466; cv=none; b=Iytouety580YW8sY2G3AjxHEl0vRo4AUoBH8DLLOfxfJBdcjO8kaxo4W1aJ2IJT+4NbxWjoIvgVBNUWZc9817ZxtMMDJf9PqYnnynhExeksHruy5mgga4iCSHisKFahPPwLj3AgdLxni2rQSmqerApY2H77Hpkh1IN443EfSXSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789814466; c=relaxed/simple;
	bh=/zVhl/58ppW4f8bSySDdz7RMQAkYtKlqpvoNw49/sj4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KoOX+YzrJ9FdJx42+dR8cu86OVqABnBAPUzMTJG9KXL04Ajf5nnNxIktSJnifE9+PpdkS5D+6rHki7zClT1ss/lW3xsO7qh5ETjDKTZFkYXrLbTroKCFlDBRsyiFih0zIgnWtNgtUtXRILsVYHVGq27w8lmtAtWud2sITsZD8ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gVxzNdvi; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gVxzNdvi"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so15163455e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 03:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789814463; x=1790419263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x47tJsyRRuS9WWsrQkleNMY57Cc3HHS/YjAw1Ng37/U=;
        b=gVxzNdviichMzd2yMzrIoEvqk/U1s+6VzqyL5823Kt+CLSxSRO8k412xbU+X8Re3Dn
         I+RBzPJlwVfAEkTmqAdagEywzzSlJfGjNMP2gjNWzm79ZI1rKixefbsTngQYwi+9bcJI
         sHBmHlh+Ry2Hkz5mZpddGOI3o7xpzd2cJ5AWufzk9VZh5gX1IT/B6UrXkaQy0wxk+b2Z
         fFKRRYUuOjZF651Z9V/mNfCbg6og+w8/JqWuRh1+6NjpwmMlGvdRfuExZkIGE6kw59s4
         MwFi2sf6kxardcOXjBDW+ZtgpOguv4cS/DCzVjHCadd/lBqaPSrE8unmEIwsNuDhgE8A
         Z9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789814463; x=1790419263;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x47tJsyRRuS9WWsrQkleNMY57Cc3HHS/YjAw1Ng37/U=;
        b=K1JDSf5E9ncOvI24wRMATaXydqRTTvb1STUOOMCX6faBzN/+mgg/QONT/8C48kvC9W
         +wUH1BvlDV6OUVcih4Iz9BWYBTGmBhxvd8cXw4O2kJUCRzWHUJdKVco0ru9opz9IlcR2
         cFJENojl2XotQ29S+QQmDdirfm0SRu35G+5hZj06d2ezuH/Vlw6Z255bMJWJTt9mnYu+
         SzusJwPOPtSS0TtiUiYeb69KAjGlwxLoXOokKX3qdSq06Icj7f6Q40ZvlXKrWCxuIJks
         3FVdrgSE+MCpFAF5JJRBGvDO3nIjZL8NDOqxcZgl6TEnHfUVAXP6qLDbH1hqNYD23nvK
         v0fA==
X-Forwarded-Encrypted: i=1; AKwUvByxwcaojGKr+d5rV+cFAroDCsVn8zY9HWBeSMImscQgdayOaz/u9prR6rf4T9DpmtCCbXE5dRsjGnFhQ/Q=@vger.kernel.org
X-Gm-Message-State: AFuF++lKkZpIit3+Vujm4s7xxq2TjtsmXOa6nT+lgF389YiPLXe2SSuH
	ZOgYEJ8pGlBCKkXfUBCRZT4NxMpe/ETn69vxtlmdaPcZcC0aPxJBDptv
X-Gm-Gg: AYBFou1BQ5vsAN++6xZliK/wJmmcbmsbdtl+JSCJUwgW3YTDEYMiW5oTT2tvkiuS5Mx
	GfKTDzW2xbUaTiLdKVRpUcP8AaZwuTYh4rEnSsgiquK+2H3Ry0wLOqx7SRWVawR+6bxb3dVbhfG
	j/kYWdJSxlDm5XGxbkesHpWPMeRa/Rgg3udwFha20ECH7rgWTnMWSsrXHhVf+OHeUK6sGAgfGmU
	w7cBRdofHrrFix7we2nb2T99A+o77RVuJH6FeF5bahLLpY5vSkez2NBhfztsVUloeGbDXkxGFK/
	xIXTOKAcn/gkEa7SxA6N0z7aK9QgZFdiydIvO1tyx/Iq4gap/00BArGi6JMVVxJwnaEnTr/bks/
	YJZ+JVqNuXUOGAh2pTl+REY8aqYWbAAIM38eJoA3crE3fxaPn5b2+8GL89y/4ehPTWRQyib+rUW
	sf2GroU018cidiBO+WMS1YiUEMcnWAqgeT/G/rWlsOM0/SyFmp4CbfNS++rXg88ca7PWgvJRD06
	M+J/siKGpAa86QpSnA9hnplHYekBrIL+uU=
X-Received: by 2002:a05:600c:8518:b0:49d:28c4:b304 with SMTP id 5b1f17b1804b1-49fc5741563mr73992215e9.29.1789814463336;
        Sat, 19 Sep 2026 03:41:03 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc521f5d9sm32797955e9.2.2026.09.19.03.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 03:41:03 -0700 (PDT)
Date: Sat, 19 Sep 2026 11:41:01 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Hao Li <hao.li@linux.dev>, Christoph Lameter
 <cl@gentwo.org>, David Rientjes <rientjes@google.com>, Roman Gushchin
 <roman.gushchin@linux.dev>, Catalin Marinas <catalin.marinas@arm.com>, Kees
 Cook <kees@kernel.org>, "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-hardening@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH v3 1/5] slab: align ZERO_SIZE_PTR to
 ARCH_KMALLOC_MINALIGN
Message-ID: <20260919114101.34423251@pumpkin>
In-Reply-To: <20260903203720.63689-2-kmehltretter@gmail.com>
References: <20260903203720.63689-1-kmehltretter@gmail.com>
	<20260903203720.63689-2-kmehltretter@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  3 Sep 2026 22:37:16 +0200
Karl Mehltretter <kmehltretter@gmail.com> wrote:

> The kmalloc entry points are annotated with __assume_kmalloc_alignment
> but return ZERO_SIZE_PTR, currently (void *)16, for zero-size requests.
> This violates the annotation when ARCH_KMALLOC_MINALIGN exceeds 16.
> 
> This can mislead compiler optimizations. Clang's UBSAN_ALIGNMENT detects
> the violation on armv5. GCC and Clang retain the ZERO_OR_NULL_PTR() range
> check but eliminate an exact ZERO_SIZE_PTR comparison after an annotated
> allocation.
> 
> Define ZERO_SIZE_PTR as the greater of 16 and ARCH_KMALLOC_MINALIGN,
> retaining the existing value where it is already aligned. Assert that
> ARCH_KMALLOC_MINALIGN remains below 0x100, the value of LIST_POISON1
> when POISON_POINTER_DELTA is zero, so the sentinel remains distinct
> from that poison pointer.
> 
> Fixes: 94a58c360a45 ("slab.h: sprinkle __assume_aligned attributes")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  include/linux/slab.h | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/slab.h b/include/linux/slab.h
> index cda126def67a..563dadc16d82 100644
> --- a/include/linux/slab.h
> +++ b/include/linux/slab.h
> @@ -262,13 +262,16 @@ enum _slab_flag_bits {
>  
>  /*
>   * ZERO_SIZE_PTR will be returned for zero sized kmalloc requests.
> + * It satisfies the alignment promised by __assume_kmalloc_alignment
> + * and keeps the historic value 16 where that is already aligned.
>   *
>   * Dereferencing ZERO_SIZE_PTR will lead to a distinct access fault.
>   *
>   * ZERO_SIZE_PTR can be passed to kfree though in the same way that NULL can.
>   * Both make kfree a no-op.
>   */
> -#define ZERO_SIZE_PTR ((void *)16)
> +#define ZERO_SIZE_PTR ((void *)(ARCH_KMALLOC_MINALIGN > 16 ? \
> +				ARCH_KMALLOC_MINALIGN : 16))

If ARCH_KMALLOC_MINALIGN is just a constant (I suspect it has to be)
this would be better as:
#if ARCH_KMALLOC_MINALIGN > 16
#define ZERO_SIZE_PTR ((void *)ARCH_KMALLOC_MINALIGN)
#else
#define ARCH_KMALLOC_MINALIGN ((void *)16)
#endif
to avoid bloat at all the expansions.

David

>  
>  #define ZERO_OR_NULL_PTR(x) ((unsigned long)(x) <= \
>  				(unsigned long)ZERO_SIZE_PTR)
> @@ -625,6 +628,13 @@ static inline bool kmem_dump_obj(void *object) { return false; }
>  #define KMALLOC_SHIFT_LOW ilog2(KMALLOC_MIN_SIZE)
>  #endif
>  
> +/*
> + * Keep ZERO_SIZE_PTR at most 128, i.e. below 0x100: LIST_POISON1 is
> + * 0x100 when POISON_POINTER_DELTA is 0, and no architecture currently
> + * has an ARCH_KMALLOC_MINALIGN above 128.
> + */
> +static_assert(ARCH_KMALLOC_MINALIGN < 0x100);
> +
>  /*
>   * Setting ARCH_SLAB_MINALIGN in arch headers allows a different alignment.
>   * Intended for arches that get misalignment faults even for 64 bit integer

