Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0AD558218
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788880077; cv=none; b=K7Bw9gLKgaRkqy3c+kgB+himn8/fiSaZZlCT3pytBdu4YmwCqV+vt0nsq+EkUxdRICMBYosBqrKuu8s2X/tiQ+MlkHt2TfEiU1rIBG+lD78kBLs+W4bGjshzdn6EDSs2H44l0E1JtSvEGVwKFga88tuAYwlvifqW5wPNmtDT47M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788880077; c=relaxed/simple;
	bh=d4Q2zLt3ieSVP12saAart1vpTxsBMp+NxFkPlMaj3yk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qhbTMS/pQInzosnbzro/6sPlBgk/U7u+tvNIFsL2huP9EgI7eTvPmcmvQJFJVyAvb9McKfezjjOpCE+mrmlzVzoZdGbELetL4JgAM701XTtHn465xu2oOoxz/+1jvUoXCXH+pMYh3mniX7z0W1zXqTZDiKkhUTG1HHeUBtI+ruQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE3991F00A3D;
	Tue,  8 Sep 2026 15:07:36 +0000 (UTC)
Message-ID: <60fe39c2-d92f-4bd0-be33-04d702f8f753@kernel.org>
Date: Tue, 8 Sep 2026 17:07:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/14] mm/zsmalloc: replace PG_private with pointer
 comparison
To: Zi Yan <ziy@nvidia.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Kairui Song <kasong@tencent.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Minchan Kim <minchan@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>
References: <20260907-remove-pg_private-v3-0-6ae22f9d9272@nvidia.com>
 <20260907-remove-pg_private-v3-1-6ae22f9d9272@nvidia.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260907-remove-pg_private-v3-1-6ae22f9d9272@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/8/26 04:56, Zi Yan wrote:
> zsmalloc uses PG_private to indicate first zpdesc in a zspage chain. It is
> equivalent to check zpdesc == zspage->first_zpdesc. Replace
> is_first_zpdesc() with zpdesc == zspage->first_zpdesc in obj_allocated().
> 
> For get_first_zpdesc(), first_zpdesc is from zspage->first_zpdesc, so
> replace is_first_zpdesc() with first_zpdesc->zspage == zspage, the second
> requirement of a zspage chain, where all zpdescs point to the same zspage.
> 
> is_first_zpdesc(), is only used in VM_BUG_ON_PAGE(), so performance impact
> should be negligible. While at it, change VM_BUG_ON() to
> VM_WARN_ON_ONCE_PAGE().
> 
> It prepares for a future commit that remove PG_private.
> 
> No functional change intended.
> 
> Assisted-by: Claude:claude-opus-4-8
> Assisted-by: Codex:gpt-5

Assied-by: LLM :)

> To: Minchan Kim <minchan@kernel.org>
> To: Sergey Senozhatsky <senozhatsky@chromium.org>
> To: Andrew Morton <akpm@linux-foundation.org>
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Acked-by: Johannes Weiner <hannes@cmpxchg.org>
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> ---

Nice cleanup, one comment below.

Acked-by: David Hildenbrand (Arm) <david@kernel.org>

>  mm/zpdesc.h   |  2 +-
>  mm/zsmalloc.c | 24 ++++++------------------
>  2 files changed, 7 insertions(+), 19 deletions(-)
> 
> diff --git a/mm/zpdesc.h b/mm/zpdesc.h
> index b8258dc78548d..4fd81c2e80769 100644
> --- a/mm/zpdesc.h
> +++ b/mm/zpdesc.h
> @@ -26,8 +26,8 @@
>   * with memcg_data.
>   *
>   * Page flags used:
> - * * PG_private identifies the first component page.
>   * * PG_locked is used by page migration code.
> + * The first component page has zpdesc->zspage->first_zpdesc == zpdesc
>   */
>  struct zpdesc {
>  	unsigned long flags;
> diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
> index 825022a7a328f..24526185fd31f 100644
> --- a/mm/zsmalloc.c
> +++ b/mm/zsmalloc.c
> @@ -290,11 +290,6 @@ struct zs_pool {
>  	atomic_t compaction_in_progress;
>  };
>  
> -static inline void zpdesc_set_first(struct zpdesc *zpdesc)
> -{
> -	SetPagePrivate(zpdesc_page(zpdesc));
> -}
> -
>  static inline void zpdesc_inc_zone_page_state(struct zpdesc *zpdesc)
>  {
>  	inc_zone_page_state(zpdesc_page(zpdesc), NR_ZSPAGES);
> @@ -476,11 +471,6 @@ static void record_obj(unsigned long handle, unsigned long obj)
>  	WRITE_ONCE(*(unsigned long *)handle, obj);
>  }
>  
> -static inline bool __maybe_unused is_first_zpdesc(struct zpdesc *zpdesc)
> -{
> -	return PagePrivate(zpdesc_page(zpdesc));
> -}

I would keep this helper, reworking it and moving all comments regarding *how*
first detection works in there

-static inline bool __maybe_unused is_first_zpdesc(struct zpdesc *zpdesc)
+static inline bool __maybe_unused is_first_zpdesc(const struct zpdesc *zpdesc)
 {
-       return PagePrivate(zpdesc_page(zpdesc));
+       /* Only the first zpdesc has its zspage->first_zpdesc set to itself. */
+       return zpdesc == zpdesc->zspage->first_zpdesc;
 }

-- 
Cheers,

David
