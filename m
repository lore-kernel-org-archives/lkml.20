Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792424047;
	b=MCbXB1ioyZZnl2QWZq4k3BAzGQp7I33SB6P9PieMYx/RwrzcyU9XuT2iVdxfgRJKdDSp
	 9XpBxr83qqQOQXF1sGN//q2j2AGh4/MljoZoYmmwk1k+/wrC2B/NvalBrVg87M8WJ6VIO
	 8FJoaJc2oeX76elITmcXo6PVFXE3Oi5f9ptJYUeAUNSXl/7Egzq5hZF7Xc8eQ7TJsbSko
	 9Q5f/VOumhfjj1Y7w2IU1A1wICONE7WqCvSDs4mj+0WXOjMX9X4yUV9jzt73hiScskM4V
	 97o+XiIZe2k7nusMWmFKZgUW11KMYqMbzlB5ZNbX+uBQbBwN1TDhYzFP5K7DopeGC+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792424047;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=037pbkZpfZs6WmkCXWU1bQZKknfpzZlqCAFxJxn68Ng=;
	b=hxm54epFnBWBdCgCw4au0ZmzKAIixpBoLzSt4SUlxicLuh3zEla2mJtqClEJMUpjQMCa
	 Z6Erl/EIJCjeVgXa7vO7lN95KYTmufunRLD1UY29f8sYTte9u3dpKnGKXEb1hOCdB0EEe
	 gLUEfrG11UXH1vlg0zU07XjpMUn9HxRQFvzUw0fL5z1vw7tMTrtTlTik+VtoJEblEPSxA
	 I5uW7XzUhU4AyaFKQvkcex6R8BA2qPF1B/fQ3SULdfXosOUKhAo8K9EXOOgNaZ9soLbjw
	 hRa/zvqkAzulUi88+p3t2vlggdqWu8cHEXg+a6c3bXX8dVP5TBaSS9LhN0Z7Enz/MXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=XTjEsxF1;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2073760740BA
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:34:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2073760740BA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=XTjEsxF1
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so20201215e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792424045; x=1793028845; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=037pbkZpfZs6WmkCXWU1bQZKknfpzZlqCAFxJxn68Ng=;
        b=XTjEsxF1u8ZPjfobm2yPWsdk3tKUGKgx6p6zaEX4jn2GCBBXLO3emhbQ/XsLSeNd3V
         scBbc+pjaYeAcSRvNIxasSW1d5zT4T8NUGxqKACuO2TJaCP7HdRB87wU1hIuVIpCRhvL
         snuDJgZFRPULy0IL9SvXMzndqeSkGjjeUtm5im82sQjW2in9AckIECh0XOsQgh+jIqES
         xN5Q1I3aNKHR0fwrE90I8AZx1QnVgMsrsxnMzZ01P55zXrz+jNAjC9zOLhj7bdA5+Onu
         v4wx6U1Px3qPmSyQ+OMh8qcVVjJD2DiTtUJo9ziqwI+RIskq/649DKw2erOsrz6OKJ1X
         UqeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792424045; x=1793028845;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=037pbkZpfZs6WmkCXWU1bQZKknfpzZlqCAFxJxn68Ng=;
        b=X74MsUd1E235Ob2c6isnUqGZsqQdwJc8xtHD5NyIhCxVXyxhHH/8I+dSB4H3rQ0LuC
         V6JMjYynA/Q6k2Jb+SCmfOCunotwWOAp5pGc6zfjXXLfqdZFTQRrPhTRjXXGBvl5hv4H
         MNu7M4/1hxaf0KEGWjhzWU9Y2i6WfRQ9IRAviCGt4y4dgpzQEXaGKtusqkvHsm0wa0D7
         oOwcnMsI0FgXMuw9rrlcA9P1hqlImQnGsPlvxH1Yq3mN6xWHRdGBQM00LdiDqX/PRv/k
         0Gx/lbiJ3eWiCJPRevHUxE69wYXuL/y2GyUpXZEVVlWJrS2Cj5y03yzkSeAHDWe5rV2s
         UuEw==
X-Gm-Message-State: AFq9FYKB1y5bkhS1Jqs3TsBQVSdFNfRYBvd7Wb+r41HwKlAsRulkukP0
	uymjh0dN2lbja6GHTfWGdzXe6ookMGV7hdFRzvXGxRfBXkvJF9yqZzyhVfbBt+BsH4A=
X-Gm-Gg: AYBFou0wyBLG6BsrzWKtHmZ86O4O5E/HWRZxKBmtBAOA6YUMBu4eh3hImRDdNyak/zo
	ks9ziu4TjfxM2VrEPVPztXV9cuM/bUQ6EY3j2dd+7h0YkEtbUoxSHCpO7PrwxGUK/6JUGyYjsiG
	Aq/H+tCAE6f02DqTQNUjWK9vCZklIGTRnieR53DFM2g+TZvwb/jkubzHFxFsXXy3LA0v0Ky8p+8
	rRRNNzQ6pdJA0RdgCxCReEBgW2RoUXlRra0HC0HGRUJSIRIZijU3Sg6CCQt13LUJS87CYgx1Qz8
	JK1JAv/sCUWrRa52RBmCI0cSRdCiKx24R85pYKz8Q0crsFLjhxRbGNqubEiuYjVZhLoSZC2D4P4
	JWCKKBscyPPLqFYn81dT89ZD/ehOPRlkaRTmnNbYA27E0LXVFjAicDykMVXb+mXqZZv3S1U6vyL
	OtncoNrcBRdv+kB96rJhOtAg4E5ZiKVSmcotJp6lJucos6myHicEYSP0AsArNcQRO2R8ptGueM
X-Received: by 2002:a05:600c:4689:b0:4a1:ddf6:fd78 with SMTP id 5b1f17b1804b1-4a1ddf6ff41mr133241885e9.26.1792424045415;
        Mon, 19 Oct 2026 08:34:05 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd50aafbsm25272820f8f.52.2026.10.19.08.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 08:34:04 -0700 (PDT)
Date: Mon, 19 Oct 2026 17:34:02 +0200
From: Petr Mladek <pmladek@suse.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Kees Cook <kees@kernel.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Tycho Andersen <tycho@tycho.pizza>,
	Namhyung Kim <namhyung@kernel.org>
Subject: Re: [PATCH v4 2/2] kallsyms: Don't leak pointers for unresolved
 symbols
Message-ID: <atY4apm9PB_vQpKB@pathway.suse.cz>
References: <20261019-vsprintf_kallsym-v4-0-ffd3c012d00c@linutronix.de>
 <20261019-vsprintf_kallsym-v4-2-ffd3c012d00c@linutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019-vsprintf_kallsym-v4-2-ffd3c012d00c@linutronix.de>

On Mon 2026-10-19 12:21:51, Sebastian Andrzej Siewior wrote:
> __sprint_symbol() is supposed to resolve the passed address to a symbol
> name. If the symbol can not be resolved it will print the actual pointer
> that was passed. The pointer policy is to not reveal actual pointer
> values.
> For post-mortem analysis the pointer in the backtrace shouldn't be
> relevant. In BUG(), WARN() and panic() related backtraces the PC
> register will contain the actual value.
> 
> Add snprintf_default_pointer() as a wrapper around default_pointer() and
> use it __sprint_symbol() if the pointer has not been resolved.
> 
> Cc: Namhyung Kim <namhyung@kernel.org>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  include/linux/sprintf.h |  1 +
>  kernel/kallsyms.c       |  3 ++-
>  lib/vsprintf.c          | 27 +++++++++++++++++++++++++++
>  3 files changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/sprintf.h b/include/linux/sprintf.h
> index f06f7b7850911..596c73a57371e 100644
> --- a/include/linux/sprintf.h
> +++ b/include/linux/sprintf.h
> @@ -24,6 +24,7 @@ __scanf(2, 0) int vsscanf(const char *, const char *, va_list);
>  /* These are for specific cases, do not use without real need */
>  extern bool no_hash_pointers;
>  void hash_pointers_finalize(bool slub_debug);
> +int snprintf_default_pointer(char *buf, unsigned int len, const void *ptr);
>  
>  /* Used for Rust formatting ('%pA') */
>  char *rust_fmt_argument(char *buf, char *end, const void *ptr);
> diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
> index aec2f06858afd..5d51c825c1e71 100644
> --- a/kernel/kallsyms.c
> +++ b/kernel/kallsyms.c
> @@ -483,7 +483,8 @@ static int __sprint_symbol(char *buffer, unsigned long address,
>  	len = kallsyms_lookup_buildid(address, &size, &offset, &modname, &buildid,
>  				       buffer);
>  	if (!len)
> -		return sprintf(buffer, "0x%lx", address - symbol_offset);
> +		return snprintf_default_pointer(buffer, KSYM_SYMBOL_LEN,
> +						(void *)(address - symbol_offset));

I do not see any obvious problem with using:

	return snprintf(buffer, KSYM_SYMBOL_LEN, "%p",
			(void *)(address - symbol_offset));

What was the motivation to create a custom wrapper, please?

Best Regards,
Petr

>  
>  	offset -= symbol_offset;
>  
> diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> index 40565c857913d..b2ca1d195bc9e 100644
> --- a/lib/vsprintf.c
> +++ b/lib/vsprintf.c
> @@ -849,6 +849,33 @@ static char *default_pointer(char *buf, char *end, const void *ptr,
>  	return ptr_to_id(buf, end, ptr, spec);
>  }
>  
> +/**
> + * snprintf_default_pointer - Format a pointer and place it in a buffer
> + * @buf: The buffer to place the result into
> + * @len: The size of the buffer, including the trailing null space
> + * @ptr: The pointer to format
> + *
> + * Formats the passed pointer the same way as the %p modifier. Does not write
> + * more than len bytes to buf including the NULL terminator.
> + *
> + * See the vsnprintf() documentation for the return value.
> + */
> +int snprintf_default_pointer(char *buf, unsigned int len, const void *ptr)
> +{
> +	struct printf_spec spec = {
> +		.base = 10,
> +		.precision = -1,
> +		.field_width = -1,
> +	};
> +	unsigned int w;
> +	char *endp;
> +
> +	endp = default_pointer(buf, buf + len, ptr, spec);
> +	w = min_t(unsigned int, len - 1, endp - buf);
> +	buf[w] = '\0';
> +	return endp - buf;
> +}
> +
>  int kptr_restrict __read_mostly;
>  EXPORT_SYMBOL_FOR_MODULES(kptr_restrict, "printf_kunit");
>  
> 
> -- 
> 2.55.0
