Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793247829;
	b=EOmxpSNpxpNyteEQljaeLzaunUp9wgWmuKRvAZRht5VwIHHJ2SgMKqcWQVZL24E8Yz0c
	 75flrlHQJqpA4l28m4xfAzqSqNxKAwGC2kJ496ZO6C8rwRzlHcS2gU0Hchh5vXRW8MB9J
	 YjpX0aCLigCAk00refYx/Zhcc6mmHWeeu3xwWz7az9LXng0uZR637gqNtPKX4RWpuc+LX
	 LEdZSPrEpEUqJRB7962hLTPl8LzvBOU4Y9NyORYovnzhfnZzT0E30BJ4uu4lJ5CdE6RBK
	 nX64e/kAqt8yk7KUwO/JAwyYSmEoZBPF7ql+GBw4y5h9sMIbVNjs4An9kPCXLrR4X0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793247829;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=7dXsrgUlut7z8koNhHFnaevyZ/dqIruzgu7a/b5mCrU=;
	b=rB7RwRx6tD4UncEPNmua6OFqqoHU1qC+XQu23sdz2RQy3M/PQBWsHrIqMSxkeMa9jblT
	 7V+B5CWZs7XYEqZV2xE2WeVPVTvcHMcrowSjl8ndXEl9v11OkyFcGLlYSqh5Ee5GkbgJ+
	 RVDTDA3htQ++2YKVZh9bcnnj+YU1ZK85UCieEAuBa+YrxaUtFS7lskSyKJzwl+BhjWu6p
	 plTYNsuMN4uyz9X+uxiX/5EXWVQ5ta8IdLUTnLyCECTuWy/ldnEIGMBvGB3eTysnI9SD5
	 rA8wO7CM78MxGHwXg87Ft5fBmoxeCVpOSPyIyl/TA4NQhC3LskdI6bJ53Bemzy7CVhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="lC/NIBrW";
	arc=none smtp.remote-ip=95.215.58.223
Received: from mta1.migadu.com (out-223.mta1.migadu.com [95.215.58.223])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAB8606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 04:23:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DAB8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lC/NIBrW
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=KCVQ9p13e3GAc36gdApz1ELKMKOGi7CgHndl6zoXWi0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793247826; v=1; x=1793852626;
 b=lC/NIBrWIIa43Ewd1VbYlglYXZm0gnb6AM+04blOJkR2zPVx3qPb7Zty/QBotnG4NNv0IlCg
 K9EJROTLdodyX38OSXMr0Ro1zqJ7O70OIa52RpbWSqOb4S04H3kMyoR/CokAAmhp/FCkJPYnP5m
 /3YvbtmQdz+6tPMplXMCenuM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id cab5a1f6a6641afa;
	Thu, 29 Oct 2026 04:23:46 +0000
X-Mizu-Trace-ID: cab5a1f6a6641afa
X-Migadu-Flow: FLOW_OUT
Message-ID: <2bd4f0df-80c7-4d32-ab50-1225681ff6be@linux.dev>
Date: Thu, 29 Oct 2026 12:23:30 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/zswap: fix double decrement of the LRU node count on
 writeback
To: Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosry@kernel.org>
Cc: Dave Chinner <david@fromorbit.com>, Qi Zheng <qi.zheng@linux.dev>,
 Muchun Song <muchun.song@linux.dev>,
 Roman Gushchin <roman.gushchin@linux.dev>, Nhat Pham <nphamcs@gmail.com>,
 Chengming Zhou <chengming.zhou@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Kaitao Cheng <chengkaitao@kylinos.cn>
References: <20261028113619.38752-1-kaitao.cheng@linux.dev>
 <CAO9r8zP15iW3ECW2Bs0rfyZrifeisDunLa6qJC43M1RcE16wWQ@mail.gmail.com>
 <auJkvb-Lq0M5Enkz@cmpxchg.org>
From: Kaitao Cheng <kaitao.cheng@linux.dev>
In-Reply-To: <auJkvb-Lq0M5Enkz@cmpxchg.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/10/29 05:10, Johannes Weiner 写道:
> On Wed, Oct 28, 2026 at 12:22:43PM -0700, Yosry Ahmed wrote:
>> On Wed, Oct 28, 2026 at 4:36 AM Kaitao Cheng <kaitao.cheng@linux.dev> wrote:
>>>
>>> From: Kaitao Cheng <chengkaitao@kylinos.cn>
>>>
>>> Successful writeback calls zswap_entry_free(), which removes the entry
>>> from the LRU and decrements both the sublist and node item counts.
>>> shrink_memcg_cb() then returns LRU_REMOVED_RETRY, causing the LRU walker
>>> to decrement the node count again.
>>
>> I wonder if we have a valid use case for adding LRU_REMOVED_COUNTED or
>> LRU_DELETED instead to simply avoid the decrement.
> 
> It bugs me that it's the walker, not the callback, that adjusts the
> count. That composes poorly with the normal list manipulation API.
> 
> How about pushing the accounting into the isolation callback, which
> can then simply use __list_lru_del()?
> 
> The tradeoff is that more things need to be passed into the isolation
> callback, but that seems reasonable. It does make the change noisy,
> however, and we might want something like Kaitao's change as a
> backportable fix first regardless.

I tried three approaches.

The first was "pushing the accounting into the isolation callback", as
Johannes Weiner suggested. However, as Johannes's example below also shows,
this would require extensive changes across multiple subsystems. I doubted
that such a broad change would be accepted, so I dropped this approach.

The second was to add a new flag to enum lru_status, as Yosry Ahmed suggested,
to handle cases like zswap where the callback has already decremented the
count. However, the incorrect lru->node[nid].nr_items value in zswap is only
an accounting issue: I could not find any code that reads this counter for
zswap. Changing a generic interface to fix an accounting error with no
apparent functional impact did not seem worthwhile.

The third approach is the one implemented in this patch. It keeps the changes
within zswap and fixes the accounting issue, so I think it is appropriate.

> Thoughts?
> 
> ---
> 
> diff --git a/drivers/android/binder/page_range.rs b/drivers/android/binder/page_range.rs
> index b0c797523bc2..157256e52dd0 100644
> --- a/drivers/android/binder/page_range.rs
> +++ b/drivers/android/binder/page_range.rs
> @@ -24,7 +24,7 @@
>  use kernel::{
>      bindings,
>      error::Result,
> -    ffi::{c_ulong, c_void},
> +    ffi::{c_int, c_ulong, c_void},
>      mm::{virt, Mm, MmWithUser},
>      new_mutex, new_spinlock,
>      page::{Page, PAGE_SHIFT, PAGE_SIZE},
> @@ -684,8 +684,10 @@ fn drop(self: Pin<&mut Self>) {
>  /// Called by the shrinker.
>  #[no_mangle]
>  unsafe extern "C" fn rust_shrink_free_page(
> +    lru: *mut bindings::list_lru,
> +    l: *mut bindings::list_lru_one,
>      item: *mut bindings::list_head,
> -    lru: *mut bindings::list_lru_one,
> +    nid: c_int,
>      _cb_arg: *mut c_void,
>  ) -> bindings::lru_status {
>      // Fields that should survive after unlocking the lru lock.
> @@ -728,7 +730,7 @@ fn drop(self: Pin<&mut Self>) {
>          };
>  
>          // SAFETY: The item is in this lru list, so it's okay to remove it.
> -        unsafe { bindings::list_lru_isolate(lru, item) };
> +        unsafe { bindings::__list_lru_del(lru, l, item, nid) };
>  
>          // SAFETY: Both pointers are in bounds of the same allocation.
>          page_index = unsafe { info.offset_from(inner.pages) } as usize;
> @@ -746,7 +748,7 @@ fn drop(self: Pin<&mut Self>) {
>      }
>  
>      // SAFETY: The lru lock is locked when this method is called.
>  >  ........
>  ........

-- 
Thanks
Kaitao Cheng

