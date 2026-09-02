Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846EA33C192
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 04:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788321919; cv=none; b=gQCrFMQIUi5VxcyiPIEN31lbpV9I6excJidNH8qyl8YhhVVMt/04aZG5rvf9ZVfYr1xlVUxifK/t9TgyWMKXNGFXN1wi5jR4ON9t1VtFlaCd00/SkTiPnJz0whqtRJre+pbwcGhtP2JudvCfTdhW2e1lyhBgZ7bUbKh5Vw79h5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788321919; c=relaxed/simple;
	bh=GbeRlDFB/Ojrth/vw1XdAvxwKBOubQN4yOMhkl5AS1k=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Y259QKAbQ6HbI7SOHEw4HdWbZKu5485x+gs97/ECBiax6+fhJnGZdzXYpb7+nLX+Ch0kC6Alj8QC/76b4/k+Srn+QOtCNmpvqsAMuANF+FLJOLc9Ad0EPzZF0fUa98cu0kjCOP4w98sOQiFuUO99XB/3GZk/+oxzj1I343WvMBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SjwjlyGb; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SjwjlyGb"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-855a66e5b5dso7824237b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 21:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788321917; x=1788926717; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sggsj0swIY6SNlhR5Rlr4w6l9mVN7Mj25L4G93WgJu0=;
        b=SjwjlyGbhriZMEkj9jJpqzEk0TtZ2Xzv5+szURgcf7xHhyICpP3fYbcc16LChvSamn
         L58WyX5AdvRUvEX6zCgYOadE/EPj2UXEmH+0CvdAnm6409JGsekNlgoGUzknnx/pCC48
         P8oF/M4vsc5F7eQptLAJ1h7fNDyG3zCz569XLRrUO1AJx+LnZsdAqx86aPCTSBCgsFHw
         aasUMt30uxz0u8ciA/dCii0d32b+k8l8odbEj7fB7rUkTOoTbAGbItxbtGV0PjHN2vvQ
         63Pg/jo9V3kkeQ+KJkpaTGiIJLr7L5eT44UxrVPw+iV+pF4odqGcwYKrdrVUdATl5dxP
         h2lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788321917; x=1788926717;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sggsj0swIY6SNlhR5Rlr4w6l9mVN7Mj25L4G93WgJu0=;
        b=LLxvD6Bfoa/iXJgjDFlZy0o669cy9cTR+M57KF9EKFP71Wq28CAy2W1EuqIU2UgBaX
         5jFigfSnmYBeoofT0Dcfo4rswJboJ/6cqLjPNtZCJcD4riyXwnHDk/XInhEb5d2cPRwp
         8bkIp+yCpJ3NX9e36kgY291/60TCc+Wm+Cqm4pWTCBuBzZsCoYpwc/lcsaT+LeB31Ude
         JbNJR1fDm8qzQpyx2dUMiZ2eCNddzciQw/tlZ0KbkFLn55qQGvQZXYdk4QTvxKcSnRVK
         WB5nHiaaBuHUR+oZhyKfVsXiKncKRZnVhh6+DH3VacA8qOW2oxvsOJa2NGoAMETBUgR4
         TTHQ==
X-Forwarded-Encrypted: i=1; AKwUvBwoBTyVZr3qglZZxTi/4iLx0ANq7QZxgnkcGE/1ZgdYSId+aM4iJ3QDt1pkO3GLCISSLGN98LZs8Mbdk1U=@vger.kernel.org
X-Gm-Message-State: AFuF++mZwFdkl0euducM4PmJzdb28N3ZrCCkKEfY23YJbHB+mSG2N4gh
	YGwLxePNzsuri8Al3uKp6upRbjccimxvcbYBNlJIJrr+UGch/+0ec8ftStOrTzTUhQ==
X-Gm-Gg: AYBFou0wsSBcc1I7lkvvDTynD5klkmq5QILXN8GjsZLe2pZFr3kdaf0WN0CelJaDzlm
	SYzIdMNNLxWQWgA98URjINOH+3aEU/NiRjLaB9CPWBs04XnPsjfDzpHpsR0ZeaL56Nd0optlA5X
	Pt/GhTXk2kAj6e07r+Z9qt+545m1LPCMEcBK+fEs5ntXZoXAj2QquK25m0TuhWBs8ZWHv8YqdgA
	MFDTY9ofOUn0sP1wxL235UxLXPx0XY0w8cz1w5biiU/UfMriII/cplO9eE6Q8DW5kVpuoalvezu
	elf5kOEAfnbbK8SWN4tguwAqp8Azyb1YjHUXPGlCDIkA0nRFavwYPi1+523w/RG9a/zfAgu94K2
	bO+rft41ap87x0wPZxVzzzKq0qvTnoIDobLz6WGZ9N55e5fsolfjiQ60gDfpwx9DuBA+gJYdC+m
	b6QOD6UJeIaopgT718U9bD2iLUvIm4SWDA0uPfzVdbQzusSiktUGhQ4VZPvgoCXmkUbsg+BsATa
	LInEuvxc57TKYlGZnsNEjB+vaIEfvW8cGm+GQfisiuQ/GxI
X-Received: by 2002:a05:690c:81:b0:80b:9f4e:a70 with SMTP id 00721157ae682-86c526f66dfmr8698707b3.26.1788321915018;
        Tue, 01 Sep 2026 21:05:15 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-86c1975dd91sm8720547b3.49.2026.09.01.21.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 21:05:14 -0700 (PDT)
Date: Tue, 1 Sep 2026 21:05:09 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
cc: Ackerley Tng <ackerleytng@google.com>, 
    Alexander Viro <viro@zeniv.linux.org.uk>, 
    Baolin Wang <baolin.wang@linux.alibaba.com>, 
    Barry Song <baohua@kernel.org>, Binbin Wu <binbin.wu@linux.intel.com>, 
    Christian Brauner <brauner@kernel.org>, Christoph Hellwig <hch@lst.de>, 
    Christoph Lameter <cl@gentwo.org>, 
    Claudio Imbrenda <imbrenda@linux.ibm.com>, 
    David Hildenbrand <david@kernel.org>, JP Kobryn <jp.kobryn@linux.dev>, 
    Jan Kara <jack@suse.cz>, Jens Axboe <axboe@kernel.dk>, 
    Johannes Weiner <hannes@cmpxchg.org>, Kairui Song <ryncsn@gmail.com>, 
    Kiryl Shutsemau <kas@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
    Leonardo Bras <leobras.c@gmail.com>, Lorenzo Stoakes <ljs@kernel.org>, 
    Marcelo Tosatti <mtosatti@redhat.com>, 
    Matthew Wilcox <willy@infradead.org>, 
    Mel Gorman <mgorman@techsingularity.net>, 
    Miaohe Lin <linmiaohe@huawei.com>, Michal Hocko <mhocko@suse.com>, 
    Minchan Kim <minchan@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
    Oscar Salvador <osalvador@suse.de>, Peter Zijlstra <peterz@infradead.org>, 
    Qi Zheng <qi.zheng@linux.dev>, Rik van Riel <riel@surriel.com>, 
    Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
    Shakeel Butt <shakeel.butt@linux.dev>, 
    Suren Baghdasaryan <surenb@google.com>, 
    Vlastimil Babka <vbabka@kernel.org>, 
    Yang Shi <yang@os.amperecomputing.com>, Yu Zhao <yuzhao@google.com>, 
    Zach O'Keefe <zokeefe@google.com>, Zi Yan <ziy@nvidia.com>, 
    linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 04/25] mm/fbatch: lru bit set, no extra ref, while folio
 on per-cpu fbatch
In-Reply-To: <e0887417-85a7-453e-e733-561dc11db08f@google.com>
Message-ID: <04101fb5-a723-1fe0-37ee-5e62b5fbb9d7@google.com>
References: <14a16945-529b-8bc0-ab38-3ea97e54e223@google.com> <e0887417-85a7-453e-e733-561dc11db08f@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Aug 2026, Hugh Dickins wrote:
...
> --- a/include/linux/mm_inline.h
> +++ b/include/linux/mm_inline.h
> @@ -343,6 +343,23 @@ static inline void folio_migrate_refs(struct folio *new, const struct folio *old
>  }
>  #endif /* CONFIG_LRU_GEN */
>  
> +enum {
> +	LRU_NEXT_NEVER_TAIL = 0,	/* Used by a tail's compound_head */
> +	LRU_NEXT_BATCHED = 1,		/* Not used by any aligned pointer */
> +	NR_LRU_NEXT_FLAGS
> +};
> +
> +static __always_inline
> +bool lru_add_del_folio(struct folio *folio)
> +{
> +	/* BUG_ON(folio_test_lru(folio)); */

That was a good statement of intent, but clearly I never booted
a system with that BUG_ON uncommented: it actually needs to say
	/* BUG_ON(folio_test_lru(folio) && folio_ref_count(folio)); */
because once the refcount is 0, __page_cache_release() chooses to
lruvec_del_folio() before non-atomically clearing lru flags.
To be fixed when respun.

> +	if (!(folio->lru_next & BIT(LRU_NEXT_BATCHED)))
> +		return false;
> +	folio->lru.next = LIST_POISON1;
> +	/* BUG_ON(folio->lru_next & BIT(LRU_NEXT_BATCHED)); */
> +	return true;
> +}
...
