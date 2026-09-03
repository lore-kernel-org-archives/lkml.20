Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A6B34D384
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 05:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788414138; cv=none; b=KDN0Q3Q3nE7FbuNr6ktEA4ypNT+ZnnyXb0D3q2MT2MeBcyTH5EqnKhUFGT1P6q+Ul1fPla0CE5tnUkSU31RdC+jqUX1na5rZkHke9aZS5v9wBOUJvhYItDzkfeL+Ganc9HsVDd19eH/kuKX2JpxjI2LSe/K2PVT6/xYHca4XyOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788414138; c=relaxed/simple;
	bh=JFvimDF/nC4GyJcyYXBmi1GWoNLnYOalMPaJjDbNjTM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=QNe1IoanG6EvmHyRe7bT8gCMLL5I4lwhWijs5mbxFq2WuL0lewOOah2TKEowFYcnnRbiaYlFqYTQIzqGHOQUbs/cmKbTtRMKPQW3dm4NJJb4wze292uS5gdM9i+k3amC+Nr/x0v/dJCDO1ob6JoJ6FJl4O8FT8/uw9gsfXgWOB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eAHD+tl8; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eAHD+tl8"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-86e7f44b773so7739517b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 22:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788414136; x=1789018936; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LGHrNuRdGCT3E2jNxaNq/dU0WCvzVt7mq2GAEQXwTJ0=;
        b=eAHD+tl8KbHmkQrU5xBxA+16OywgeVUD+fnZrBAers2RokIm/dfwssR8nRfBvGaz/R
         xPEerE2EvuXuH2i1fy9W3ByL3M4dzRfKJKhtF7Bs8qTe+95X/hK2hiz9tfHfsg/nGCSm
         CerKqtE0D7pDx/o39DTpRhUUwrYnI1csUTfui+hVRHa7s0EwhNRpZylSzPgqslFObBEl
         fBxVJ9qEDoXh7lm2xMyTJvpW5EYKRWZ262PTqQTqGnKr18Pv/lVfmOZu4BcuWPnAS9eM
         KYw/Dl5+DYim68zzYpCe3sczPQlXHsM9Ts1fJo9UIlqAIKkDQc5RCeLD+AJl59x6f8lW
         Vplw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788414136; x=1789018936;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LGHrNuRdGCT3E2jNxaNq/dU0WCvzVt7mq2GAEQXwTJ0=;
        b=c7YlJwOxuxVrLYdwDTQhvspyjPR+L7k5s8WXk30lQ+OUy6VLMnrFfHcFNaqRM22GTx
         /zRUDrOAvXKywvfUB6CvnivZ8k39alkHMtisEVDw12u/3ExceWzaGJPEyUJcfhDIcF/e
         ahjWogOEnZ+dtbIbTmfC0IkO8dUU1ozfdhJoDkU9G/az+Oc1H4TGRM2KhevaRLTEclA4
         ajYBmgGIWuHP/FibqywiE8BpxrW4qnhPfoFldZTCqFfaMYklQBE2xBI5PoweuKybQuSz
         m+MbT0PSKd//EfGwIlGnD9Sf/fhCpm9f83YC/chr6ufXfiRHKoKwz6bRPg5ozfsABBDl
         0Z4g==
X-Forwarded-Encrypted: i=1; AKwUvBzl1F9mDn2CFBESepLNcHJWgjPjCfrp7l6L6cMCYnrzoUuc+D9aObr1MLcT7fLvS4MhDdhrBCdr7/spyFg=@vger.kernel.org
X-Gm-Message-State: AFuF++mPuPKK1ES39qCX02j9IcLWe8N0LsUTYIBXYwH8FBubGTr/FdQH
	IQrkVxz0WVjf1z0FQS+kK/0ywUEKHbS5gfqp1mTge9k2xX0S77huzgUkjNIcB803Bg==
X-Gm-Gg: AYBFou1ft82XECapGeFc2ln8kXv12k1CPvegcuM+S8nROo17gMNJ2nrK7N2bknnyERR
	XjtkppQNhfowuFUzN+BCpvtoKbCh9XuD+8VqRJPE5TF4bQXOAqDyzYGwBJtZ9HfoqsKTEmmgQT2
	E4pnQNq5tBI5Tqu65BCFuJxG9yTAhXDq3CAVTW5gWOvD1FM/go5MvxZhdvE5IQKC3LCXjlZ0m3z
	liLRwnx3tbo+FRWzrMjDRl0YHkV9jhUaJsDufmYTTs1VIsd+rdgjDbVX9ARoJLmO7c0YMss5H6G
	lY4W5r7mdqm/uqB9RjPKlY5CONId9cTF5ebomBBqVqL5FRYr1y8j2Ps3IWU9/ZOvx9jxpnA8Vmw
	og+eoRfyJ6+KPs+T+Mgo+KdWFDo+TCZRAmvNYgfgNA7820Mllbb/Ed49pRLCpuJGG7kTNkK5CA0
	rS42k+wID+tYXxd3fdvACX6kmUvoP6BGHgk007wfM+quL6fKncWVu1+ZxEeHcacyHgzconOdOua
	ubwKRyFvn0A0K0s77sXdw/Yp5Wg7cZyrIHW2WXCnOKXOuWm
X-Received: by 2002:a05:690c:e206:10b0:81f:653d:4992 with SMTP id 00721157ae682-86c4f66936emr40296267b3.13.1788414135682;
        Wed, 02 Sep 2026 22:42:15 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-86c129b2f95sm33668537b3.18.2026.09.02.22.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 22:42:14 -0700 (PDT)
Date: Wed, 2 Sep 2026 22:41:56 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: Kiryl Shutsemau <kas@kernel.org>
cc: Hugh Dickins <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
    Ackerley Tng <ackerleytng@google.com>, 
    Alexander Viro <viro@zeniv.linux.org.uk>, 
    Baolin Wang <baolin.wang@linux.alibaba.com>, 
    Barry Song <baohua@kernel.org>, Binbin Wu <binbin.wu@linux.intel.com>, 
    Christian Brauner <brauner@kernel.org>, Christoph Hellwig <hch@lst.de>, 
    Christoph Lameter <cl@gentwo.org>, 
    Claudio Imbrenda <imbrenda@linux.ibm.com>, 
    David Hildenbrand <david@kernel.org>, JP Kobryn <jp.kobryn@linux.dev>, 
    Jan Kara <jack@suse.cz>, Jens Axboe <axboe@kernel.dk>, 
    Johannes Weiner <hannes@cmpxchg.org>, Kairui Song <ryncsn@gmail.com>, 
    Lance Yang <lance.yang@linux.dev>, Leonardo Bras <leobras.c@gmail.com>, 
    Lorenzo Stoakes <ljs@kernel.org>, Marcelo Tosatti <mtosatti@redhat.com>, 
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
Subject: Re: [PATCH 07/25] mm/fbatch: LRU_NEXT_ACTIVATE bit to optimize
 folio_activate()
In-Reply-To: <apThx6sWOQ-aZcN7@thinkstation>
Message-ID: <821cced3-dcc8-6c80-a92c-c568c2639e5a@google.com>
References: <14a16945-529b-8bc0-ab38-3ea97e54e223@google.com> <16b39f43-d91e-7b23-900e-90cec13837ff@google.com> <apAllneItXmyjRPo@thinkstation> <7b30ca86-dca6-83b7-a632-180e35ed2a0c@google.com> <apThx6sWOQ-aZcN7@thinkstation>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 31 Aug 2026, Kiryl Shutsemau wrote:
> On Fri, Aug 28, 2026 at 01:40:51AM -0700, Hugh Dickins wrote:
> > Do you have a head for smp_mb__ barriers? I'm more anxious that
> > I might be missing one or two of those.
> 
> I think the release side of PG_lru is missing.
> 
> You effectively turn PG_lru into a lock over folio->lru.next.
> 
> The acquire side works: test_and_clear_bit() has a return value, so it
> is fully ordered.
> 
> But there's a problem with release. set_bit() is unordered. You
> correctly placed a fence in __folio_add_lru(), but every other
> folio_set_lru() is problematic.
> 
> For instance:
> 
> 	CPU0 				CPU1
> folio_batch_move_lru()		folio_batch_move_lru()
>   lru_add_del_folio()
>     lru.next = LIST_POISON1
>   lruvec lock
>     list_add()
>   /* no barrier */
>   set_bit(PG_lru)
> 				  folio_try_get() == true
> 				  folio_test_clear_lru() == true
> 				  lru_next == stale BATCHED ???
>   lruvec unlock
> 
> If CPU1 sees a stale BATCHED, lru_add_del_folio() returns true without
> doing the list_del() or the NR_LRU_BASE accounting, and CPU1 then goes
> on to lruvec_add_folio() a folio that is already on a list.
> 
> I think we need to have a helper that would set PG_lru and enforce
> release semantics.

Thank you very much for this, Kiryl: it helps me considerably.
But I have to cool myself down close to absolute zero to think
about these things, and can only manage that occasionally.

I've nothing useful to say yet. I believe I understand you, and in
particular your last sentence, which I take as an observation that
clear_bit_unlock() is well-established, but what we want is
set_bit_unlock(), perhaps better named set_bit_release().

Of course I'm not competent to add that to N architectures, most of
them unfamiliar to me.  So I'm looking for a reasonable compromise,
to minimize the additional overhead needed for correctness here,
just using what we have already have (test_and_set, smp_mb__).

When I read up further on KCSAN, I saw that it intends to catch
such ordering issues, and I'm hoping it will help. There are KCSAN
reports with "lru" in, even without my changes, but more with my
changes than without: I'll look to cut those down.

Thanks,
Hugh
