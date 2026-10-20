Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792494691;
	b=XV3n2OA03wLvl5xvwDnYk5sSTOu851NhUPYe6AgiMw82VWsAx0YQW2+Kuwqk7bKQIKui
	 Q6EO0THbjALwEGc46g/gh5AbhfraSZxLYQyF5IfBRjuI+7XrztnwfeQ38LXXgFQD2Hciv
	 7Agy0And9GJAB6EqHjhXjHTec1hIqEiTekm4qa7lqIA/mLCRTxFjZ/s88lnAa6VTwXFgK
	 AUNnghoPG2UFNNbIgdGxwtFLadL3G1uOiyNL50Howr3kvkJG8OTXhFketiL2pcfxJ9lFn
	 3qDKt7FOsxLLrTe8wXjQOOLFOJ+lxC92MpyDzI1sxgcOVdLR+QhggZK3C17RlxD9/+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792494691;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=ggEXMwLsYCLMlRFbTt+v08PermoODsbkyiROOo7B4QE=;
	b=S0lJr5TH48wllZn5aOCKKdQDGNAF3bmmapsp3IbaC04x7IGHxD+mXrVhniRs8YSV7ajq
	 73bITcon6QToZSyq1nxahyRzkX6rN1cMdhaIisgUiHLivyfFsuOzMcTtX+wCEZVBZqCCG
	 v0ho3oktam+s04jTor5GkhtZXoFR1SUX+1MSo1AnDKEU/aHFn2q3Tme6fTY4mTwH4ooxA
	 u2RuBe7mD7fbwReuMDQFopo/tLOgA3XKxWYOu38vZP/tMseGHYCVs8THlCQszBhvqcaMi
	 to5fzIq47GhHkSKWgiOgEzDk0G42ky6cwbkwqnyNfNfWQG1TLk/iFuqWigqYdh7w9AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=BJG9lMEF;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9F2606A328
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:11:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B9F2606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=BJG9lMEF
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1ddc7c9beso14683305e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 04:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792494689; x=1793099489; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ggEXMwLsYCLMlRFbTt+v08PermoODsbkyiROOo7B4QE=;
        b=BJG9lMEFG9kOK41/rJ3Zyr6sac4rVn95aUaKMUeUk1ZmnGuTbvCW+WEqwwj9LkooN/
         uOXEbBFZmjJICPruSPFzP4U/VdsuOJPVp92yZzL67tZXivYVyMqWKwB2+s40Q47kVTrU
         A4AEtTI8lt4cxhr+p/4CbN1DgUl9X3VJwDYF2zlbAsnLzuX6XTf/RG6X8q8+QAPBA8ek
         qSDQqU1VPW5TYYCeWrpESxvxzbjX5jNzGkIXaQvRyQ1ioDi/CTPNzRJZvxszEkd8Aoz+
         +GhcpR8s57a1d8bUYcvwW+1zlpDXYfvcNKopMqMiJaFKvBAvMuzJEw/IaTAOlRtVqthT
         iVcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792494689; x=1793099489;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ggEXMwLsYCLMlRFbTt+v08PermoODsbkyiROOo7B4QE=;
        b=YAn+4ITCAcZQqcrMdFhuY9ewmTSwO+wl1/+RiabJemvc603v30syzC6hjbBIkZpOZ5
         z4XSaoTzL3Z0uYshPn9HqI6JK5AuYR/v/lYZANsxBHjy9qJ1fTAEugyBoRmLZtMCBxno
         PaUOcGpTOay5lmjk2AKhgbIH0a7YZofLdIaXeG3sg3lm9/ybjtR4rZ0C8wnTA9PnQodm
         ye1l00j0yrzL7Xv0+8ogq+R9sulvH6fhJhZ1flsTj4aMwStKA1xgiZx8XE10DZLedh5J
         mo89bYbo5rZeUaN4XDyWMyYj8PSMs9PMQvhCK+CCSz9TpAtpjG36wm6/VX4eD3UrYogz
         w7zA==
X-Forwarded-Encrypted: i=1; AKwUvBytwQmqtOo+aHnBQgKKsXfOeMoRIAfDrjArkuDW6MhfmHQxgmCEVv4CGQC/T/khHQjYpRJZ3bMwfU40eiI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkbvakCiOvxK/voM3Ja7yT0+e7HTKBGqq2/EQFToB2kHecHljY
	tq9/8OW+kYUWPaAj1bk8wqXim1xEUzfoZCiGgAF3E3Igg01TkpDR0PZbbax1MMOjX9WPS3IxcfA
	Gf459qZjv
X-Gm-Gg: AYBFou3zDQHkpdaKRpq6N/g5NOI/ZmucEpVoWPdk7MXXIWtFus9m/gOXXGB29wvq+WV
	uXJnD8h3PpQNS6swiAexNsun6wSXlZhrKeA60sOMW1N0QxGDf8q/Q53UmFcW630Na2nEVg7HzQw
	dR+A0ZPOWL209EB1wj9gqwwFIUDzcJiXG6xEolgfcBp4SGKDV/ACZkwHMcCjF28Ofi26ruD8HoL
	0MvJOjcX/SZKFb/s9PE7cLF8jo01U/fWQzQQSz1lqmtPJcmmgS7FgqfzDaQCxlwGmLFAcGK+Hnt
	qSDa5lAsoQ7oJ3rLvoy5HcrM0xOBPanL0L9NKkgTTXwx4qNnkIltFVYc1puvdJ5zdomb3eWBwtC
	6RL22aLCq3gWhm8JuBli4TiSec5Qb+kNmf4zjn1FIudoIL9C0AU9mx6KQBarz2PqjEetKq3y638
	e7VVLqv87t4iBSmQsv50ZsqhvGcptHSNT1U3/n+5qd5bt1ElSvEPvNYWdg3r6vOEqc3VGcqmyUJ
	3cYrt9a0wcDcD7KxK/a0OV9jiZMzGU4PWi+RVs=
X-Received: by 2002:a05:600c:a112:b0:4a1:96cd:2f73 with SMTP id 5b1f17b1804b1-4a1d75aa9e8mr173055685e9.1.1792494688776;
        Tue, 20 Oct 2026 04:11:28 -0700 (PDT)
Received: from elver.google.com (11.26.205.35.bc.googleusercontent.com. [35.205.26.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d818d61sm5313367f8f.31.2026.10.20.04.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 04:11:27 -0700 (PDT)
Date: Tue, 20 Oct 2026 11:11:24 +0000
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
Subject: Re: [PATCH RFC v2 03/11] mm/page_owner: preserve accounting with
 countable stack depot records
Message-ID: <atdMXELJWveehYmX@elver.google.com>
References: <20260908-stackdepot-trie-v2-0-1996d5cef732@cloudflare.com>
 <20260908-stackdepot-trie-v2-3-1996d5cef732@cloudflare.com>
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
In-Reply-To: <20260908-stackdepot-trie-v2-3-1996d5cef732@cloudflare.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

On Tue, Sep 08, 2026 at 02:13PM +0100, Caleb Kan wrote:
> From: Caleb Kan <ckan@cloudflare.com>
> 
> page_owner keeps stable struct stack_record pointers in its stack list.
> It uses each record's count with a one-count bias to track live base pages
> and reads the stored entries directly. A later patch adds a trie backend,
> which provides neither a flat record layout nor an independent count field.
> 
> Add STACK_DEPOT_FLAG_COUNTABLE to keep these records on the hash backend
> and deduplicate them separately from all non-countable records. Store the
> discriminator in a new u16 flags field and narrow size to u16. This keeps
> the record header size unchanged while covering the configured maximum of
> 256 frames. Do not otherwise split hash-table deduplication: ordinary and
> GET saves can continue to share records. Make COUNTABLE mutually exclusive
> with GET because the two flags assign incompatible meanings to the record
> count. Reject countable records in stack_depot_put() and require COUNTABLE
> in __stack_depot_get_stack_record().
> 
> Mark both page_owner save sites countable so its existing accounting and
> reporting continue to use stable hash records. Extend the KUnit coverage to
> verify direct-record access and isolation between countable and
> non-countable records.
> 
> Signed-off-by: Caleb Kan <ckan@cloudflare.com>
> ---
>  include/linux/stackdepot.h   | 28 +++++++++++++++-------
>  lib/Kconfig.debug            |  3 ++-
>  lib/stackdepot.c             | 20 +++++++++++++++-
>  lib/tests/stackdepot_kunit.c | 55 ++++++++++++++++++++++++++++++++++++++++++++
>  mm/page_owner.c              |  6 +++--
>  5 files changed, 100 insertions(+), 12 deletions(-)
> 
> diff --git a/include/linux/stackdepot.h b/include/linux/stackdepot.h
> index 734529767c8a..7ff67c70d727 100644
> --- a/include/linux/stackdepot.h
> +++ b/include/linux/stackdepot.h
> @@ -53,7 +53,8 @@ union handle_parts {
>  struct stack_record {
>  	struct list_head hash_list;	/* Links in the hash table */
>  	u32 hash;			/* Hash in hash table */
> -	u32 size;			/* Number of stored frames */
> +	u16 size;			/* Number of stored frames */
> +	u16 flags;
>  	union handle_parts handle;	/* Constant after initialization */
>  	refcount_t count;
>  	union {
> @@ -84,8 +85,9 @@ typedef u32 depot_flags_t;
>   */
>  #define STACK_DEPOT_FLAG_CAN_ALLOC	((depot_flags_t)0x0001)
>  #define STACK_DEPOT_FLAG_GET		((depot_flags_t)0x0002)
> +#define STACK_DEPOT_FLAG_COUNTABLE	((depot_flags_t)0x0004)
>  
> -#define STACK_DEPOT_FLAGS_NUM	2
> +#define STACK_DEPOT_FLAGS_NUM	3
>  #define STACK_DEPOT_FLAGS_MASK	((depot_flags_t)((1 << STACK_DEPOT_FLAGS_NUM) - 1))
>  
>  /*
> @@ -144,6 +146,11 @@ static inline int stack_depot_early_init(void)	{ return 0; }
>   * Users of this flag must also call stack_depot_put() when keeping the stack
>   * trace is no longer required to avoid overflowing the refcount.
>   *
> + * If STACK_DEPOT_FLAG_COUNTABLE is set in @depot_flags, stack depot stores the
> + * stack in hash-backed storage for callers that need direct stack_record count
> + * access. This flag does not imply %STACK_DEPOT_FLAG_CAN_ALLOC and is mutually
> + * exclusive with %STACK_DEPOT_FLAG_GET.
> + *
>   * If the provided stack trace comes from the interrupt context, only the part
>   * up to the interrupt entry is saved.
>   *
> @@ -178,11 +185,12 @@ depot_stack_handle_t stack_depot_save(unsigned long *entries,
>  				      unsigned int nr_entries, gfp_t alloc_flags);
>  
>  /**
> - * __stack_depot_get_stack_record - Get a pointer to a stack_record struct
> + * __stack_depot_get_stack_record - Get a hash-backed stack record
>   *
>   * @handle: Stack depot handle
>   *
> - * This function is only for internal purposes.
> + * This function is only for internal purposes. @handle must have been saved
> + * with %STACK_DEPOT_FLAG_COUNTABLE.
>   *
>   * Return: Returns a pointer to a stack_record struct
>   */
> @@ -260,10 +268,14 @@ int stack_depot_snprint(depot_stack_handle_t handle, char *buf, size_t size,
>   *
>   * @handle:	Stack depot handle returned from stack_depot_save()
>   *
> - * The stack trace is evicted from stack depot once all references to it have
> - * been dropped (once the number of stack_depot_evict() calls matches the
> - * number of stack_depot_save_flags() calls with STACK_DEPOT_FLAG_GET set for
> - * this stack trace).
> + * Drop a reference acquired by stack_depot_save_flags() with
> + * %STACK_DEPOT_FLAG_GET. Calling this for a handle saved without
> + * %STACK_DEPOT_FLAG_GET is invalid; persistent handles are owned by stack depot
> + * for the lifetime of the system.
> + *
> + * The stack trace is evicted once the number of stack_depot_put() calls matches
> + * the number of successful stack_depot_save_flags() calls with
> + * %STACK_DEPOT_FLAG_GET for this stack trace.
>   */
>  void stack_depot_put(depot_stack_handle_t handle);
>  
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index fcd74edfd93a..3a78c67b6b36 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -2792,7 +2792,8 @@ config STACKDEPOT_KUNIT_TEST
>  	default KUNIT_ALL_TESTS
>  	help
>  	  Enable this option to test stack depot API behavior at boot.
> -	  This test is built in, so KUNIT must also be built in.
> +	  This test is built in because it exercises internal, non-exported
> +	  stack depot helpers, so KUNIT must also be built in.
>  
>  	  KUnit tests run during boot and output the results to the debug log
>  	  in TAP format (https://testanything.org/). Only useful for kernel
> diff --git a/lib/stackdepot.c b/lib/stackdepot.c
> index 4da7279d9f83..66c5e8594566 100644
> --- a/lib/stackdepot.c
> +++ b/lib/stackdepot.c
> @@ -94,6 +94,7 @@ static const char *const counter_names[] = {
>  	[DEPOT_COUNTER_PERSIST_BYTES]	= "persistent_bytes",
>  };
>  static_assert(ARRAY_SIZE(counter_names) == DEPOT_COUNTER_COUNT);
> +static_assert(CONFIG_STACKDEPOT_MAX_FRAMES <= U16_MAX);
>  
>  static int __init disable_stack_depot(char *str)
>  {
> @@ -467,6 +468,7 @@ depot_alloc_stack(unsigned long *entries, unsigned int nr_entries, u32 hash, dep
>  	/* Save the stack trace. */
>  	stack->hash = hash;
>  	stack->size = nr_entries;
> +	stack->flags = flags & STACK_DEPOT_FLAG_COUNTABLE;
>  	/* stack->handle is already filled in by depot_pop_free_pool(). */
>  	memcpy(stack->entries, entries, flex_array_size(stack, entries, nr_entries));
>  
> @@ -609,6 +611,9 @@ static inline struct stack_record *find_stack(struct list_head *bucket,
>  	list_for_each_entry_rcu(stack, bucket, hash_list) {
>  		if (stack->hash != hash || stack->size != size)
>  			continue;
> +		/* Page owner countable records have a distinct count lifetime. */
> +		if ((stack->flags ^ flags) & STACK_DEPOT_FLAG_COUNTABLE)
> +			continue;

This splits hash deduplication unconditionally even when
stackdepot.trie_enabled=0 (the default), and even for page_owner's
free_handle traces (__reset_page_owner()), which never touch
stack_record->count. Prior to this patch, persistent hash records had
refcount_set(&stack->count, REFCOUNT_SATURATED) and page_owner safely
overwrote it with its 1-biased page count while still sharing records
with non-GET callers.

The interface looks error-prone to me.
