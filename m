Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E51C411672
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 15:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787759778; cv=none; b=A4AuaxCyJoZZMlySMdXBsxiyqbpGU7gdHz9cG+D9PiqJzYPBU3FjkQwd45UU/XnOlnbGU7rV8mfcb0un5DCVGvsU1JXol+Xl7N8/VH8ablOxzdhgark+TG1QZZi6ALIeoh/bi9IJ5f9iVG2Mr3R4G6RhssU8YVVJsZ938KVzHyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787759778; c=relaxed/simple;
	bh=aPbThtVn2a5yVpmAeAy4q70n3v4x4rA1pZJ1h66SXbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X439oZH0KLoVRlO7nMavbdPzNI/kG3HVBRNNX7Gl+3h+MVRH/MCY5F2OM6qWa4flmlDl4eRwXHczVjH6s6xKYEvQGsbd3+/JqL4Z6m81zAS5xdc8VmCbzmrtq1pa/ojFD/JPWiPVZ8/5eU3XoTwlfN1DU/tJckrxooFbgvB+a2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Lqdb6oz4; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Lqdb6oz4"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c197eaaab00so184227766b.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 08:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787759775; x=1788364575; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2PawRXrBau0zB2jedd4Fn83owcrKfoiMEkW0CI97ock=;
        b=Lqdb6oz4+kc+h62O7cmLb5UwG4+wa6Afr4iaGY50YpNBts+Dnkip9y/2D0EQnOuDPU
         NqPcA4JQJmukBnwNozJ3/LKM7/BnNEEPoLII/hiZOJBh1B9eKjwghGnoJQ+BJ1pnfOpT
         H+VY+kNU7liFLaMHYPncgwOJqytCuuqhj3fRr2y9YHkSkgogmfpg+orjva+2oiqmPzpO
         R1875KY3LyXV149UNg9mlHQMSfgq2hEcsp9lDYj6k5nubPWxsiIiTkGdsUEI7gMa7y7u
         BPNnsSISa/EL9rnDpdn1yksiSGWQqKjp9pVR4hiM10hJlTSUPikzohfLRiBBwRM88JwP
         7Sog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787759775; x=1788364575;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2PawRXrBau0zB2jedd4Fn83owcrKfoiMEkW0CI97ock=;
        b=SLJFCPVffZSoyaSmdXFps7Dwf9aEPgpFXrE6S81q09jqLdYeS7Z28svb09FQHbzv7i
         6qbv5swTS9QVAZAgZey9MNeIR2xlRVM7+vnlYmeeWZIa59vxD/xuD+RwcpPCu6Xm6YQm
         3KtpMoVsyIWd/xU/12n/iU0Yo84s2y8nHV4/UilGm9JagcY8fTqeTo/ioQ7ah9+QzKJH
         Z4/iiafm43um66E6t5asrISO2K7knNyOKrCxk4uD58a60TVP4ZkRhsYk8f+weUcQAbGd
         r6YFy2q3nu9Pgx5/0MDuKHdDRwGPa1nI2NQNq1ZWV998k1qzYHbznus8cBnoTmHPAAq5
         JFog==
X-Gm-Message-State: AFuF++lH9IMsbtZRksGiWWLRjvFduCJ15Yb49fpz8hUdR1mJUbYWHIbC
	T54geJXzqfmFP9Ehz48U8Ju+qMvwnJAhdbLhCoY+RzBg+rZ+jWCagz6uAal7TqY1XI0=
X-Gm-Gg: AR+sD12gua/Yj92gteWpnr+8BjzwtAhDPb+rNTSn9d8Azj0yMsYf5a90mRXUdaEtcwK
	VZ6IOFxzslW9NKgtlJFv52ACJ854SR4oOqJse5NigykpjyHcvrxAjefsF6ms3QmTce9ne76thdn
	cVSiBlzjAWQ2sH4C3kQHy4KApJk8WwVI/GGkHntovDGXPvyPaQxU7R64e4tfSBiL572CpePHQMG
	62JZ1xpBDHfKjFbobRQgU0C5giwUjt3QxQlIx/hhpLy9DbvJsTgM0lT4jWPRszFY2Bq2vMSugEp
	VfFTdoSVa1UEgD8R1FZE/Zf8Oot6lO5BMTjftVID7SGYUbMtInf2L2mVz3hzxLS87586hXFHQWk
	CgqVnxq6xvsCPFSwSp1D9LFoh6p6iMVOrXCL3qKy23zR6HqaG9KlfwrueuGOLrqAKWICP1tQpmU
	BJeEth4pu15K55nIgjs+m/8ED5EbR5AdwrXdjyaQ2g7jXI1+wDMhQ0SccOvfu2mw==
X-Received: by 2002:a17:907:3e8d:b0:c25:3553:43eb with SMTP id a640c23a62f3a-c2535534997mr66219466b.18.1787759774696;
        Wed, 26 Aug 2026 08:56:14 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a6fcdd5sm606680966b.20.2026.08.26.08.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 08:56:14 -0700 (PDT)
Date: Wed, 26 Aug 2026 17:56:12 +0200
From: Petr Mladek <pmladek@suse.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Kees Cook <kees@kernel.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Tycho Andersen <tycho@tycho.pizza>
Subject: Re: [PATCH v2 1/2] vsprintf: Don't leak pointers for %ps without
 KALLSYMS enabled
Message-ID: <ao8MnDuF9nnI9KxG@pathway.suse.cz>
References: <20260821152614.2202196-1-bigeasy@linutronix.de>
 <20260821152614.2202196-2-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821152614.2202196-2-bigeasy@linutronix.de>

On Fri 2026-08-21 17:26:13, Sebastian Andrzej Siewior wrote:
> The "%ps" format modifier prints the name of the symbol which is more
> valuable in terms of debugging and does not leak the actual pointer.
> 
> Without KALLSYMS it will leak the pointer which is not intended. The
> default policy for pointers is to print a hashed value and not to leak
> the actual pointer.
> 
> For !KALLSYMS, print "(unknown)" for any symbol resolution. If hashed
> pointer are disabled print the bare number.
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  lib/vsprintf.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> index 2bc6ef483576c..fcb63f22b1997 100644
> --- a/lib/vsprintf.c
> +++ b/lib/vsprintf.c
> @@ -1008,7 +1008,9 @@ char *symbol_string(char *buf, char *end, void *ptr,
>  
>  	return string_nocheck(buf, end, sym, spec);
>  #else
> -	return special_hex_number(buf, end, value, sizeof(void *));
> +	if (unlikely(no_hash_pointers))
> +		return special_hex_number(buf, end, value, sizeof(void *));
> +	return string_nocheck(buf, end, "(unknown)", spec);
>  #endif
>  }

My understanding was that we were going to use

	return default_pointer(buf, end, ptr, spec);

It would print the hashed pointer unless no_hash_pointers was set.
IMHO, it would make the handling of pointer values more consistent.

Best Regards,
Petr
