Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792508011;
	b=htzziymAhrnMqkqMx1anTmjNGT/lt4PwOQVaNIGwW5V9IspSZkoO2stXRdctQP5yZKeu
	 HmR6ZuU08lUQolHS1UVYAp70MobJygvaYMSs8IxMv6CVcJ20XOmUH9TZR1yojZ0fsut5i
	 GJbEPLpEuSL5rA7o/IDuP+erWBKdSpQPjQOioVXWRuZI6bIdUUb1kdYkHb4mAqXs57GTI
	 s0gt5nmsyUtHGT78JmH2EtGr2eAziGjYimfJRyd16suXfzDeiEkufQxWJDite7W+7xfEX
	 0ll92anBKJLQsKYCOinQF8Enqk7najy4DHgbszMXlnfKX43AGTskXmJ/YEZUYB/oyug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792508011;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=PcThqUHv81EySKNyOUFRZgMbmffug3lqbPzwxJtZ+tI=;
	b=Z2zkA5bXWadMgBY9NEA8kOlNX3/CInZUOeW3+8j3jofmGRMacrmn2yb5duR0+LLSyf/d
	 yeC7UaCjYLj0maaPZRIioKSX6mUt6mwky1t40hotiR1rmyYEprG1kR5j2hyD/iiRbmyog
	 E1dF7LcgT3ZC3J2R6Fvy6iZGZ3t3bHud6WEeBGik6NvWG9Xo2juH/6rIbBkRcCTw4AR6Q
	 WoVajkB4pq4qd3By2G4yIwgGZaPjPaE4iJ5G4MpSQc031ovrE97gqQ7tY+V/YfqCATF6q
	 setW7v1OfWern3TfiwnNPkCx7XzU3jdfpWx3k+6pduVfG7gpqIExv4CHJjZZ2klfXXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=OtWrqvrv;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B495606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B495606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=OtWrqvrv
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c2dc63f8d8aso557005666b.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792508010; x=1793112810; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PcThqUHv81EySKNyOUFRZgMbmffug3lqbPzwxJtZ+tI=;
        b=OtWrqvrvLMaqZlyJqzQJrDIN6qcFtzq8yJw3gAv31DZZeRYFsbtlva//C9uSvMKB4S
         c+74gEAVtpGAQNRL6fv9EoWxrFoVmPzCvexRssafRomuQgxDy8AfRV3lQFWrY5+MUPgN
         tOocy+vFTZrdbfNV7lnxwsE4abcnaVKYjtzXyj30+1QDJz/AM/wKoJI5BBn0oHsQ/LV7
         HuBixC/GOfVp+2vYVrYnH7etv/wyHLAmMvrPpkhCF2gyTcuyuR/BtwlHrgMTTKLObwST
         bF+xmDn7ImJbF8W7dgDG8djGvykRNKgMQF1yhJfU7hOMuZp6BwEbIJlBh8eEcWztf98z
         QGyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792508010; x=1793112810;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PcThqUHv81EySKNyOUFRZgMbmffug3lqbPzwxJtZ+tI=;
        b=uy6+v4PMAH5XWVGPZhkwFO599brEXJZIF9DUupe9JgVZ/p4+ov8oeQItt72D8+2Qcu
         QU+tZ0e8PxUFsrT9ayXk6hZdPXUB6zlgtId+xo9XZo2MA2PAcJV4u8gyBlJtmK7LkoPA
         Ea/bM8PEGFvbMEJXkztaf5EuyB+0VWyzgWV97rzlGjMcuL6A7/sI455TEnVmtAfrFq+G
         4hXoy22Wlnd1X0LTvAP94r1v/G0pQZFRYUGT12VMHWRlKV83VnDLb6sjrk86t05XTCv+
         9E4rhV5hfAKF9wWbT1c3KBuyIq7JQZ/UvwIZvGMzqcUtqwBHWCPnXoG+xlJqowVfwzS4
         o0Nw==
X-Forwarded-Encrypted: i=1; AKwUvBzYNy258v4wNA69sU55W1DB1zh0FurOWoHo6a2/48dAz5kLG4rN4jwJ1qteC+akowVvMviMTghCx9rCErs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUJ1AvrQvGh+T55iXf4Xp2/bS5DLUAP8GAuFf+rkq0xUWe9S2C
	hMdqHRdDZ6R58hnOGjL6rI3GVeqqisAWdR4HARkzLAItfo5aEuYmccZImlR8gAZu0Q==
X-Gm-Gg: AYBFou0B+sWorzlexAICNV2paj5pVwndV8AawX/LWZO+Km89FuJRx1xaQBIO7D+65cb
	5WMtyHzSBhYGLCZCyv+OvK+uYvLoCGv/L68865WuxEp5YIiQ5I9RepylNsrdHTJVBQsa6BRgtGp
	zuRBgWM5zSJM9fDNWRDPT01RxTyyFVztX08hrWSJpd5EegIsiEvTd/dZGY0UCcdBM4UJM4XlUOC
	84NgEJiqU1wRB8lNjQM1YUskHowVLIvVI9fFQkbUCqF2RQIyDu1tF8UIMAEgcESlNO4A7YeG+bE
	2pLE9/oiQ2T3yf/AUl8YtYY+uONoZWAZf83poYcVrjvBPchlu6dxj3JdBsY5X8OYWNOPhcHreJG
	zAPgq6yVimU7RdhPBvGZZoQNeS2ZDqBghG76bDdgax4SxxVpE/xiLV0jRrvNA4UObwVkDqx4yYE
	gSKN6IRNc2fWRquvH6vg3W7VztpfZwvdBeJRLJgXMbFNeh9B2hYNUvSXT2Yxgbuu7fhgiO7+TiO
	nq2R3BzBtZ5BAgfPfvxSznlZxpZlevON+PQgefcl1F4
X-Received: by 2002:a17:906:7953:b0:c2e:2252:6ddb with SMTP id a640c23a62f3a-c419d540411mr840520166b.10.1792508009154;
        Tue, 20 Oct 2026 07:53:29 -0700 (PDT)
Received: from elver.google.com (124.100.205.35.bc.googleusercontent.com. [35.205.100.124])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1b140fsm5516530a12.9.2026.10.20.07.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:53:28 -0700 (PDT)
Date: Tue, 20 Oct 2026 14:53:24 +0000
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
Subject: Re: [PATCH RFC v2 05/11] kmsan: report trie-backed stack depot traces
Message-ID: <ateAZGtPTpdBDSbn@elver.google.com>
References: <20260908-stackdepot-trie-v2-0-1996d5cef732@cloudflare.com>
 <20260908-stackdepot-trie-v2-5-1996d5cef732@cloudflare.com>
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
In-Reply-To: <20260908-stackdepot-trie-v2-5-1996d5cef732@cloudflare.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

On Tue, Sep 08, 2026 at 02:13PM +0100, Caleb Kan wrote:
> From: Caleb Kan <ckan@cloudflare.com>
> 
> KMSAN stores ordinary origin stacks and synthetic alloca and chain origins
> in stack depot and retains the resulting persistent handles. Once trie
> storage is enabled, these handles can refer to trie-backed entries, while
> kmsan_print_origin() still relies on the hash-only stack_depot_fetch() API.
> 
> Use one KMSAN_STACK_DEPTH array to materialize each origin and chained
> stack in turn. Preserve the chain's head and next-origin handles before
> reusing the array for the chained stack. The array covers both the regular
> save limit and the smaller synthetic records.
> 
> Pass the scratch array into a common origin-printing helper. Keep local
> storage for standalone kmsan_print_origin() calls, but let kmsan_report()
> reuse its existing stack_entries array after printing the report stack.
> With x86-64 Clang 19, the regular nested report path uses 752 bytes, below
> its 768-byte size before this conversion.
> 
> lib/stackdepot.c is uninstrumented, so stack_depot_fetch_into() unpoisons
> the successfully copied range before returning it to KMSAN. Remove the
> now-redundant explicit unpoisoning of chained entries. Origin depth and
> use-after-free metadata remain in the handle's extra bits and are
> unchanged.
> 
> Update test_stackdepot_roundtrip() to use caller-owned storage while
> retaining its frame-count and kmsan_check_memory() checks. This verifies
> that the copy-out API returns initialized entries to instrumented callers.
> 
> Signed-off-by: Caleb Kan <ckan@cloudflare.com>
> ---
>  mm/kmsan/kmsan_test.c |  4 ++--
>  mm/kmsan/report.c     | 28 ++++++++++++++++------------
>  2 files changed, 18 insertions(+), 14 deletions(-)
> 
> diff --git a/mm/kmsan/kmsan_test.c b/mm/kmsan/kmsan_test.c
> index 31f47cc4dab4..7c04e4b21873 100644
> --- a/mm/kmsan/kmsan_test.c
> +++ b/mm/kmsan/kmsan_test.c
> @@ -669,7 +669,7 @@ static void test_long_origin_chain(struct kunit *test)
>   */
>  static void test_stackdepot_roundtrip(struct kunit *test)
>  {
> -	unsigned long src_entries[16], *dst_entries;
> +	unsigned long src_entries[16], dst_entries[16];
>  	unsigned int src_nentries, dst_nentries;
>  	EXPECTATION_NO_REPORT(expect);
>  	depot_stack_handle_t handle;
> @@ -680,7 +680,7 @@ static void test_stackdepot_roundtrip(struct kunit *test)
>  		stack_trace_save(src_entries, ARRAY_SIZE(src_entries), 1);
>  	handle = stack_depot_save(src_entries, src_nentries, GFP_KERNEL);
>  	stack_depot_print(handle);
> -	dst_nentries = stack_depot_fetch(handle, &dst_entries);
> +	dst_nentries = stack_depot_fetch_into(handle, dst_entries, ARRAY_SIZE(dst_entries));
>  	KUNIT_EXPECT_TRUE(test, src_nentries == dst_nentries);
>  
>  	kmsan_check_memory((void *)dst_entries,
> diff --git a/mm/kmsan/report.c b/mm/kmsan/report.c
> index d6853ce08954..0770658ba932 100644
> --- a/mm/kmsan/report.c
> +++ b/mm/kmsan/report.c
> @@ -83,9 +83,9 @@ static char *pretty_descr(char *descr)
>  	return report_local_descr;
>  }
>  
> -void kmsan_print_origin(depot_stack_handle_t origin)
> +static void kmsan_print_origin_with_buf(depot_stack_handle_t origin,
> +					unsigned long *entries)
>  {
> -	unsigned long *entries = NULL, *chained_entries = NULL;
>  	unsigned int nr_entries, chained_nr_entries, skipnr;
>  	void *pc1 = NULL, *pc2 = NULL;
>  	depot_stack_handle_t head;
> @@ -97,7 +97,8 @@ void kmsan_print_origin(depot_stack_handle_t origin)
>  		return;
>  
>  	while (true) {
> -		nr_entries = stack_depot_fetch(origin, &entries);
> +		nr_entries =
> +			stack_depot_fetch_into(origin, entries, KMSAN_STACK_DEPTH);
>  		depth = kmsan_depth_from_eb(stack_depot_get_extra_bits(origin));
>  		magic = nr_entries ? entries[0] : 0;
>  		if ((nr_entries == 4) && (magic == KMSAN_ALLOCA_MAGIC_ORIGIN)) {

Routing KMSAN's synthetic alloca and chain origins into the trie (patch 10)
breaks KMSAN after 1024 origins:

	__msan_poison_alloca():
	    entries[0] = KMSAN_ALLOCA_MAGIC_ORIGIN
	    entries[1] = (u64)descr   /* unique per instrumented local variable */

	kmsan_internal_chain_origin():
	    entries[0] = KMSAN_CHAIN_MAGIC_ORIGIN
	    entries[1] = extra | ((u64)id << 32)

Because the trie in patch 10 is keyed starting at entries[0], *every*
alloca origin in the kernel is a direct child of the single depth-1
[KMSAN_ALLOCA_MAGIC_ORIGIN] node, and every distinct stack handle is a
direct child of [KMSAN_CHAIN_MAGIC_ORIGIN].

In patch 10, a node's child array cannot exceed 1024 children
(roundup_pow_of_two(1025) = 2048 -> 16424 bytes >
STACK_DEPOT_TRIE_POOL_USABLE_SIZE = 16208 bytes). Once 1024 local
variables are poisoned during boot, every subsequent new
__msan_poison_alloca() and kmsan_internal_chain_origin() permanently
returns 0.

Even below that limit, a 3-entry chain origin takes ~120 bytes in the
trie (node + child slot + side-table slot) vs 48 bytes in the hash table.
