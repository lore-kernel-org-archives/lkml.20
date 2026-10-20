Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792494060;
	b=ku4qj4G3JYMk/dw+K/G1ruF5Tqvg8TIjA3oMr+t8gYsBJFuhqcbqIc6ywqJm1IroLjFN
	 vtK034Zb5wZDovgtcIAbsOE23lgsRktN+9etLVpxA6kUY+w63zrq9fVVxcchXuPl+dh3V
	 RhUwzvONJgZ6/j7wxKxct0jdLzvvBhToc66FE6qAmPN78IrGK3dOlG3ymA/Lccx/opdcc
	 hofpZsYpiVYMM5gKhHeWFXsv+a+k9MENczAqMgiRQJaIk0WwwRxG42MvJjcO28apMCR/+
	 Vgauam2V9M6NKTwKRb3GqRFDXwoA+KTiLv735AYas13OjGGMEP2ibcAtn7CcD9db08A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792494060;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=SrKJjXfdM0MbsoostKwsM8/MNs73BD60MtEKBomI2y8=;
	b=hDMkv5MtJ5VkOn5QWFM0Ag8Jc6YZJIMzi2E1RaUhyFqf3JJ6tcLL5tFVN/2se63aBhhr
	 8s+nHSzFrW+jki2/w03tPWTJDhxtQsiDC91tk9XvB76uvA0aGErhmPJ5/HBpHFvalXErk
	 t2RsjZJoojRx2eQ6yWi6VPWetUhK2BfJAAhO5HIg6fmIVZvDvryx8SKY1ZlOM4tmEHJJL
	 74nzXcNqNE4+Bejwb+KJoK3bgmOgmkoDr5F+tk8L4FRp6o4ycDgcrNaWfKd/aAEX9PNmG
	 lGxaZ81AXdbgH7kO0ITiim9g9sONyh8BIGabZHDYIoMK9qdj08Q1fcOAnViS/7lVQUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b="AF//5wRN";
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A48D606A322
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A48D606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=AF//5wRN
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c40447e25e6so355047366b.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 04:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792494058; x=1793098858; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SrKJjXfdM0MbsoostKwsM8/MNs73BD60MtEKBomI2y8=;
        b=AF//5wRNdZMUPE9IcTp4QJXMtRtzpBJNa068PsS5inNZzg/KRFCrKWCoKHFu1wu57L
         BbUFWgPmXUXEz3a5hY2Ok625q0m4coZ6XHjKu38kAh14NS3RlOZYsghzxk4ZvbE3r8Rl
         b6OEMncZXahkz91KyGHXBhR0agMCg6NEwDqSqsThhWd+5EB7e0BsmRErAQsEgxXWTf9I
         dCC07j1mIt4Gmu+CeuXRmnLwl8SZcq2iOF4Du6ecMhLLNhqyrIiIqkNItKNldwRmU31e
         evVYHYngVj7AEjWIvTD38ZNDUYgtkzCyK3wnPdztIlF2woU3PPwhEJYtScQf/LtE4shm
         eg+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792494058; x=1793098858;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SrKJjXfdM0MbsoostKwsM8/MNs73BD60MtEKBomI2y8=;
        b=dy77x7aVXdPW7UMsgSFPQlwvPjlQPX/hqvSHgTBjyfls3uDn2iaKYR1bDizkNDPH8E
         HHLq+HANJuS/xCjRCEyqTcfa2v1pcIBLGGp4VyUIQGwIMerJ5HO8G5/IOXTUyOtLiIwt
         ZdjtwJbIl3ij96ZlCVApAv9Cfu6AMyB1CTgfIyUA/D+addrqVdzotBJn0IIpuAJyM4Da
         pQO6wCGMt2spHsEF0E5npkhh1MvD1HiVGZU/jaawhFelPGp9at4T/Ng5dSWa0yX0EKTQ
         e+k8Pz1t9DmvLyibKUDzWKy18+Lc47DwktlVQJME78Bgezk6VHNDsQcIQCLEiTRMOJi+
         qvEg==
X-Forwarded-Encrypted: i=1; AKwUvBxlAvYzpQ9eJAC/pbZZmE+CGhgl8Mcl9ip6XjRw8FNGDjklqPhGmMoa2lxxat+jMWzsIGAs4qG+Wo6Mjuo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJI5R2Pj0YGRNyPTc4GRgAbpjEdPZlMqy52JHUfkVEgufRqN+R6
	4A6EM9kQ07tFCDtPIlFYwi7FBqMyMBHGII9HweQ7Ni6m8M/6B7z69KFZ8ZCFKoGHZjltN/T7NNT
	iKkNsKLP9
X-Gm-Gg: AYBFou228jf7PbUei/CCT4kkbzEMpjFgrCNd36M7tsIu2fZqa9GrYX3ifm4gjAdzjdi
	Ebze26WxLS87HA0f2qHFj0X7PLTkkCvBXVYfEfqMOm+pVyymURivAussP+VNV9P4+2L4ZSfB16n
	4TKNwjQfCVJ6Nsq459fRigyCy78JOE/DiK4bCmE8OJHfWp20XWCSqyiAHxdNx8s2/rl6mws0Zj+
	jNIGFDPKjFXqOvpvEbeHldI8B+YcHK2AmGxiBysAUyC1CaCoG/BlBnFx3xZx8RrCI5r1FZVzBpA
	HpQt5ybxzL55QsI/r7e0d8/YfyGJi42XHbjeU1WwM3VY7tjNFAwmZFwx1/Stvqt1ciL2HcMn+tM
	4FxOWrKu1JUaExWVH9xrDFPROf37V6Rk6HK/7Qhbgq8/aEtyqnWutNpnPxY06JCwpHqru/VEyRy
	iC4XQ8CTxwTHLUSFPojwWQwOhcDkW4XajDyoD6o7KaHjCeTUWw/s+oNcMJNgssqwoElceQKGLFj
	zuGHncVORlG7dBm0wrBeGdmhtGkml3jgwirvAdDlUkw2PVaVA==
X-Received: by 2002:a17:906:f5aa:b0:c41:6149:cb43 with SMTP id a640c23a62f3a-c419e53f5d3mr810874066b.18.1792494057892;
        Tue, 20 Oct 2026 04:00:57 -0700 (PDT)
Received: from elver.google.com (11.26.205.35.bc.googleusercontent.com. [35.205.26.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40913c6145sm461656966b.41.2026.10.20.04.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 04:00:56 -0700 (PDT)
Date: Tue, 20 Oct 2026 11:00:52 +0000
From: Marco Elver <elver@google.com>
To: Caleb Kan <calebkan1106@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
	Vlastimil Babka <vbabka@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Oscar Salvador <osalvador@suse.de>, Caleb Kan <ckan@cloudflare.com>,
	kernel-team@cloudflare.com
Subject: Re: [PATCH RFC v2 02/11] stackdepot: add caller-owned stack trace
 fetching
Message-ID: <atdJ5AbOVXS9W7Gg@elver.google.com>
References: <20260908-stackdepot-trie-v2-0-1996d5cef732@cloudflare.com>
 <20260908-stackdepot-trie-v2-2-1996d5cef732@cloudflare.com>
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
In-Reply-To: <20260908-stackdepot-trie-v2-2-1996d5cef732@cloudflare.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

On Tue, Sep 08, 2026 at 02:13PM +0100, Caleb Kan wrote:
> From: Caleb Kan <ckan@cloudflare.com>
> 
> stack_depot_fetch() returns a pointer to contiguous storage owned by stack
> depot. That cannot work for a backend whose frames are not contiguous, so
> callers need an interface that copies the trace before they can support
> both backends.
> 
> Add stack_depot_fetch_into() to copy a complete trace into caller-owned
> storage. Leave the destination unchanged when it is too small, keep a zero
> handle as a no-op, and document that callers must keep the handle valid
> while copying it. Warn if a caller passes a NULL buffer or zero capacity
> for a valid handle instead of treating the stack as missing.
> 
> Unpoison the copied entries before returning them because
> lib/stackdepot.c is not instrumented by KMSAN. Add built-in KUnit tests for
> exact and oversized destinations, zero handles, and undersized buffers.
> Later patches add tests for stack depot internals.
> 
> Signed-off-by: Caleb Kan <ckan@cloudflare.com>
> ---
>  include/linux/stackdepot.h   | 36 ++++++++++++++++++
>  lib/Kconfig.debug            | 16 ++++++++
>  lib/stackdepot.c             | 28 ++++++++++++++
>  lib/tests/Makefile           |  1 +
>  lib/tests/stackdepot_kunit.c | 89 ++++++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 170 insertions(+)
> 
> diff --git a/include/linux/stackdepot.h b/include/linux/stackdepot.h
> index 2cc21ffcdaf9..734529767c8a 100644
> --- a/include/linux/stackdepot.h
> +++ b/include/linux/stackdepot.h
> @@ -199,6 +199,42 @@ struct stack_record *__stack_depot_get_stack_record(depot_stack_handle_t handle)
>  unsigned int stack_depot_fetch(depot_stack_handle_t handle,
>  			       unsigned long **entries);
>  
> +/**
> + * stack_depot_fetch_into - Fetch a stack trace into caller-owned storage
> + *
> + * @handle:	Stack depot handle
> + * @entries:	Caller-owned buffer to copy the stack trace into
> + * @max_entries:	Number of frames that fit in @entries
> + *
> + * Copies the stored frames into caller-owned @entries. If fewer frames are
> + * stored than @max_entries, only the stored frames are written and their count
> + * is returned. If more frames are stored than @max_entries, the copy is skipped
> + * entirely and 0 is returned.
> + *
> + * Passing a NULL @entries buffer or zero @max_entries for a valid @handle is
> + * invalid. Callers must provide storage for @max_entries frames.
> + *
> + * Callers should size @entries to match the save-side stack depth cap (for
> + * example, %CONFIG_STACKDEPOT_MAX_FRAMES or the local stack_trace_save() limit)
> + * when losing diagnostics on an undersized buffer would be surprising.
> + *
> + * A non-zero invalid @handle, including a post-put handle, may WARN. Its return
> + * value and copied contents are undefined because the record may have been
> + * reused for another stack.
> + *
> + * Callers must ensure @handle remains valid for the duration of this call.
> + * Persistent handles saved without %STACK_DEPOT_FLAG_GET require no extra
> + * reference; handles saved with %STACK_DEPOT_FLAG_GET require a held reference.
> + * Callers must not call stack_depot_put() on persistent handles.
> + * Racing this helper with stack_depot_put() on the same handle is invalid.
> + *
> + * Return: Number of frames copied, 0 if @handle is 0, stack depot is disabled,
> + * or @max_entries is less than the number of stored frames.
> + */
> +unsigned int stack_depot_fetch_into(depot_stack_handle_t handle,
> +				    unsigned long *entries,
> +				    unsigned int max_entries);
> +
>  /**
>   * stack_depot_print - Print a stack trace from stack depot
>   *
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 134b15a44625..fcd74edfd93a 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -2785,6 +2785,22 @@ config RESOURCE_KUNIT_TEST
>  
>  	  If unsure, say N.
>  
> +config STACKDEPOT_KUNIT_TEST
> +	bool "KUnit test for stack depot" if !KUNIT_ALL_TESTS
> +	depends on KUNIT=y && STACKDEPOT
> +	depends on STACKDEPOT_MAX_FRAMES >= 3
> +	default KUNIT_ALL_TESTS
> +	help
> +	  Enable this option to test stack depot API behavior at boot.
> +	  This test is built in, so KUNIT must also be built in.
> +
> +	  KUnit tests run during boot and output the results to the debug log
> +	  in TAP format (https://testanything.org/). Only useful for kernel
> +	  developers running the KUnit test harness, and not intended for
> +	  inclusion into a production build.
> +
> +	  If unsure, say N.
> +
>  config SYSCTL_KUNIT_TEST
>  	tristate "KUnit test for sysctl" if !KUNIT_ALL_TESTS
>  	depends on KUNIT
> diff --git a/lib/stackdepot.c b/lib/stackdepot.c
> index 90c52f2e0d3f..4da7279d9f83 100644
> --- a/lib/stackdepot.c
> +++ b/lib/stackdepot.c
> @@ -785,6 +785,34 @@ unsigned int stack_depot_fetch(depot_stack_handle_t handle,
>  }
>  EXPORT_SYMBOL_GPL(stack_depot_fetch);
>  
> +unsigned int stack_depot_fetch_into(depot_stack_handle_t handle,
> +				    unsigned long *entries,
> +				    unsigned int max_entries)
> +{
> +	struct stack_record *stack;
> +	unsigned int nr_entries;
> +
> +	if (!handle)
> +		return 0;
> +	if (stack_depot_disabled)
> +		return 0;
> +	WARN_ON_ONCE(!entries || !max_entries);

If this triggers (e.g. entries == NULL with non-zero max_entries), it
falls through to memcpy(NULL, ...):

    if (WARN_ON_ONCE(!entries || !max_entries))
        return 0;
