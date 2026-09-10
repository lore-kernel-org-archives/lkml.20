Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6D735F182
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 02:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789008096; cv=none; b=u1BNnaJhVcKQ0fr1FagU0sClr3g3Wd2Wa6x7+wZ15wdoJHz5lzyBOdHgrh35VYCHv8wIcBujXETn+k4Y1M0iWF0ge5esDhjnrZP7NvfM/YepA+d2eNiBL30l8+rMnHTq8zZeW1tr5LE9/WJma5K8YHc161A4JcvwkZQ1HC+ph04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789008096; c=relaxed/simple;
	bh=OQmciMLqvHYGP+ckrcRIvZTk09qdlHuWWO6Mr0Ak78I=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=D5CQIhmYKjdkm38qj2sOxrHTyTeVWh2nz9bvgXA2+KHyYKrWNpvKcNJ93TBvX/hfSELwMQ90CL1xeOPicBTbWZ+RWRoJQ9I+7pYvH+F6gqvdBi0aowDZodJMXfZuYQx6uJGK1G7JSignxLe1crIdd+iVmTcLv5YrsZckLEZiars=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OJrglBua; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OJrglBua"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA6041F000FF;
	Thu, 10 Sep 2026 02:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789008094;
	bh=nu1gPlwGKoa2f9NvPadg4IYpWkUCMvg0otg7hjCzfHw=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=OJrglBuaU9WW+pL5FUY/mAH1U8HHR5HruLQeZQ9r+/JrVmN3mGgghLSG+l8nTQKlR
	 or4uMkgukGXAfG1emnyr2aFnLIgdidovISRTVhcgzvPkW5HCCyrYiU5xk2RjNXhfJj
	 JYmnBbdecJZwKTPvfLhTGzeGCiotp5Dpugo3prgZhSFrjxTnG6ULADcKb1+O2RCf0o
	 2UZjXn6uHDVX8muqscS3LvTGcZl+6hCeRoUh8XZe1M6S0tD5Ymd20LURLBIMrodPkV
	 lSx/92yJRnMyHZwfUxu0ab9wB0Yb77P7vdNXzDz2+SOVRTPvgH09uZwsJtR4/Ofj5w
	 4ll0XVDwPp46g==
Message-ID: <7e11c56d-05e6-48f0-b5b8-b4a0e18ddc1d@kernel.org>
Date: Thu, 10 Sep 2026 10:41:28 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [PATCH v3 06/14] f2fs: stop using PG_private
To: "David Hildenbrand (Arm)" <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
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
References: <20260907-remove-pg_private-v3-0-6ae22f9d9272@nvidia.com>
 <20260907-remove-pg_private-v3-6-6ae22f9d9272@nvidia.com>
 <e5792e81-e8a5-42e1-aafe-58dc603f4968@kernel.org>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <e5792e81-e8a5-42e1-aafe-58dc603f4968@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/8/26 23:47, David Hildenbrand (Arm) wrote:
> On 9/8/26 04:56, Zi Yan wrote:
>> f2fs sets its PAGE_PRIVATE_* flags in page->private and checking
>> page->private != NULL is equivalent to checking PG_private. Change
>> PagePrivate() to page_private(). Meanwhile, in set_page_private_##name(),
>> page->private is first set to 0/NULL before an PAGE_PRIVATE_* flag is set,
>> but it can cause confusion when PG_private is removed and
>> page->private != NULL is used instead. Change it to initialize
>> page->private to PAGE_PRIVATE_NOT_POINTER instead and retain the original
>> semantics.
>>
>> It prepares for a future commit that removes PG_private.
>>
>> No functional change intended.
>>
>> Assisted-by: Claude:claude-opus-4-8
>> Assisted-by: Codex:gpt-5
>> To: Jaegeuk Kim <jaegeuk@kernel.org>
>> To: Chao Yu <chao@kernel.org>
>> Cc: linux-f2fs-devel@lists.sourceforge.net
>> Cc: linux-kernel@vger.kernel.org
>> Acked-by: Usama Arif <usama.arif@linux.dev>
>> Acked-by: Chao Yu <chao@kernel.org>
>> Signed-off-by: Zi Yan <ziy@nvidia.com>
>> ---
>>  fs/f2fs/f2fs.h | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index 9940a6cecf1a2..2f7ab5888b078 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -2691,7 +2691,7 @@ static inline bool folio_test_f2fs_##name(const struct folio *folio)	\
>>  }									\
>>  static inline bool page_private_##name(struct page *page) \
>>  { \
>> -	return PagePrivate(page) && \
>> +	return page_private(page) && \
>>  		test_bit(PAGE_PRIVATE_NOT_POINTER, &page_private(page)) && \
>>  		test_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
>>  }
>> @@ -2710,9 +2710,9 @@ static inline void folio_set_f2fs_##name(struct folio *folio)		\
>>  }									\
>>  static inline void set_page_private_##name(struct page *page) \
>>  { \
>> -	if (!PagePrivate(page)) \
>> -		attach_page_private(page, (void *)0); \
>> -	set_bit(PAGE_PRIVATE_NOT_POINTER, &page_private(page)); \
>> +	if (!page_private(page)) \
>> +		attach_page_private(page, \
>> +				(void *)BIT(PAGE_PRIVATE_NOT_POINTER)); \
>>  	set_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
>>  }
> 
> Very weird interface. Why do we even need the page-based interface still?
> 
> $ git grep -E "(set|clear)_page_private"
> compress.c:             clear_page_private_gcing(cc->rpages[i]);
> compress.c:                     set_page_private_gcing(cc->rpages[i]);
> compress.c:             clear_page_private_gcing(cic->rpages[i]);
> f2fs.h:static inline void set_page_private_##name(struct page *page) \
> f2fs.h:static inline void clear_page_private_##name(struct page *page) \
> 
> Seeing code like:
> 
> clear_page_private_gcing(cc->rpages[i]);
> if (folio_test_writeback(page_folio(cc->rpages[i])))
> 	end_page_writeback(cc->rpages[i]);
> 
> Makes me wonder whether we can just use the folio helper instead?
> 
> In f2fs_iget(), we enable large folios only when !f2fs_compressed_file(inode).
> 
> So naive me would assume that we can just get rid of the
> set_page_private_/clear_page_private_ stuff entirely.

David,

Thanks for the patch, at a glance, it seems fine, can you please send
a formal patch? then we can apply to dev-test for test.

Thanks,

> 
> IOW something like:
> 
> 
> From efcde918178604de11d16c6dc5485542ab4dcdaf Mon Sep 17 00:00:00 2001
> From: "David Hildenbrand (Arm)" <david@kernel.org>
> Date: Tue, 8 Sep 2026 17:46:06 +0200
> Subject: [PATCH] tmp
> 
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---
>  fs/f2fs/compress.c | 29 ++++++++++++++++++-----------
>  fs/f2fs/f2fs.h     | 13 -------------
>  2 files changed, 18 insertions(+), 24 deletions(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index ce88092d9ce26..0e9cc0fa297a4 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -1064,13 +1064,15 @@ static void cancel_cluster_writeback(struct compress_ctx *cc,
>  
>  	/* Cancel writeback and stay locked. */
>  	for (i = 0; i < cc->cluster_size; i++) {
> +		struct folio *folio = page_folio(cc->rpages[i]);
> +
>  		if (i < submitted) {
>  			inode_inc_dirty_pages(cc->inode);
> -			lock_page(cc->rpages[i]);
> +			folio_lock(folio);
>  		}
> -		clear_page_private_gcing(cc->rpages[i]);
> -		if (folio_test_writeback(page_folio(cc->rpages[i])))
> -			end_page_writeback(cc->rpages[i]);
> +		folio_clear_f2fs_gcing(folio);
> +		if (folio_test_writeback(folio))
> +			folio_end_writeback(folio);
>  	}
>  }
>  
> @@ -1078,11 +1080,15 @@ static void set_cluster_dirty(struct compress_ctx *cc)
>  {
>  	int i;
>  
> -	for (i = 0; i < cc->cluster_size; i++)
> -		if (cc->rpages[i]) {
> -			set_page_dirty(cc->rpages[i]);
> -			set_page_private_gcing(cc->rpages[i]);
> -		}
> +	for (i = 0; i < cc->cluster_size; i++) {
> +		struct folio *folio;
> +
> +		if (!cc->rpages[i])
> +			continue;
> +		folio = page_folio(cc->rpages[i]);
> +		folio_mark_dirty(folio);
> +		folio_set_f2fs_gcing(folio);
> +	}
>  }
>  
>  static int prepare_compress_overwrite(struct compress_ctx *cc,
> @@ -1477,8 +1483,9 @@ void f2fs_compress_write_end_io(struct bio *bio, struct folio *folio)
>  
>  	for (i = 0; i < cic->nr_rpages; i++) {
>  		WARN_ON(!cic->rpages[i]);
> -		clear_page_private_gcing(cic->rpages[i]);
> -		end_page_writeback(cic->rpages[i]);
> +		folio = page_folio(cic->rpages[i]);
> +		folio_clear_f2fs_gcing(folio);
> +		folio_end_writeback(folio);
>  	}
>  
>  	page_array_free(sbi, cic->rpages, cic->nr_rpages);
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 9940a6cecf1a2..0cfba8742d4b4 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -2707,13 +2707,6 @@ static inline void folio_set_f2fs_##name(struct folio *folio)		\
>  		v |= (unsigned long)folio->private;			\
>  		folio->private = (void *)v;				\
>  	}								\
> -}									\
> -static inline void set_page_private_##name(struct page *page) \
> -{ \
> -	if (!PagePrivate(page)) \
> -		attach_page_private(page, (void *)0); \
> -	set_bit(PAGE_PRIVATE_NOT_POINTER, &page_private(page)); \
> -	set_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
>  }
>  
>  #define PAGE_PRIVATE_CLEAR_FUNC(name, flagname) \
> @@ -2726,12 +2719,6 @@ static inline void folio_clear_f2fs_##name(struct folio *folio)		\
>  		folio_detach_private(folio);				\
>  	else								\
>  		folio->private = (void *)v;				\
> -}									\
> -static inline void clear_page_private_##name(struct page *page) \
> -{ \
> -	clear_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
> -	if (page_private(page) == BIT(PAGE_PRIVATE_NOT_POINTER)) \
> -		detach_page_private(page); \
>  }
>  
>  PAGE_PRIVATE_GET_FUNC(nonpointer, NOT_POINTER);

