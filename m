Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0E14766A9
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 14:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787842346; cv=none; b=Bpfw5mTikLeBIA2qa8Fr9Jd3dPouKJjERLCTLubOfPG9ieb8fFW5qnWwqY6v1doK+c9k33RnrFhPRmBkHrpdMzgFT5vEUmbP0kE4EoTtRQED/sWW4G5PGiMpHAUXSMD1gWhQwvJj5ZMI3s27iIIcp6C/bMLerU2r/an4gzgelNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787842346; c=relaxed/simple;
	bh=IRn4Qs3ZfELuL6Zf2MFClaZaLle/GcI7tEOGt8JybBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mMlPHcjmg8JVI32HeRfKawbZUc+41ZE8gpS7MXkzkW7wVvS9n0+0B/OwtUm1CUzoxhDBF1Ly/Zgym7OjpOHvJExKIjGd7jb9DSn+ZHTov07ZAVSgSnL5RRmCLKMYxhJdRwZJPfMyaVwzsX5yfBgf4hvAcGn0Q6FeWP9wXD0ZHRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=sk1m66IQ; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="sk1m66IQ"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-81ecf499af9so40371107b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1787842335; x=1788447135; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2PhM8hHOikt+Le7MMX66XCq3uKxujYXBd3b3EMmxqtI=;
        b=sk1m66IQUs8NOnDaBLKYzpse7epXKRdX6nbtwX9q757hxwTHftMq7lE7e/OEUUiJWB
         N478q9Zx5oc9OT9stndnRqPvgfJiDaKRyF5ZL7UwkwwuHS46f3ui7bm8OI7N8riMlDOj
         7uCItxia/yfCbWtzQLgxRVa4AFtQETB909X3uokb1jbDBidCqjIHjalfUVByHLMqDyqj
         zAv0sTOyLvvcmZYSah7fTn0g5jRecFlkR0ZqW//MGlhLFST/0P+ID1YH4/1vwy9TD9A6
         QKtU5t+pOTliS226dD/aiDuneTcx0j9gyV08A1GM32wOOpavikrdiqJppqDmqDYKsJKX
         3pxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787842335; x=1788447135;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2PhM8hHOikt+Le7MMX66XCq3uKxujYXBd3b3EMmxqtI=;
        b=bLRfX/5SdN7ZIlJfj3TRNGqCsli/1oIs1oBgjaLtQLkWWz8fm2LxRwqsQeeyt4oWSF
         tC7FhWehhjnQ3mYOQvqCrhowA/2TFx0B8A9he0n1OfgeTLzRMiItkuycCd38aTfjNBW9
         IlzXDA82yqbxY0mY1Mfq9D7ifROwKKA+xGWBP2sgYWfASiKMji+bCjRUPJ/7K/JODSqq
         L2VpDlckYDoVnYjQ1hDtE8eDnux4lps3A+6ecdP7x8SioI7FspCeWicNl1CqbGFtrSYX
         xNtmbZpIgfOpaZVC6g145UnsbcuACvNqJSUaJBaLeBmR0+7jMPciaun/Wk5mgeq0MB4G
         viog==
X-Forwarded-Encrypted: i=1; AHgh+Rrmh4CjWCBvjl3DHqw+MhsWfUgEAiJ2RjRVZArzAsR1373ziYlRloWB6YBVHbZzn7+GhA2mnHwC8wWWh10=@vger.kernel.org
X-Gm-Message-State: AFuF++nvXXevrrt8tRXOxtsTSW+LruuJ7EKBSjiNsYW34wy7dluIXa+R
	8nAKOgemp2yzFFCuBoZx+kyUUupw71SJ+v/6S9ulxktQc7T9jVBHRSxuljGhTQCzUuE=
X-Gm-Gg: AR+sD132lbnjzqcCpxRPcROPflyoBoFvCwLlSr0pWZiSjXz7vvGlJxo60ahfERIItID
	p0ZOYm0ZK5Yw8epexNHhjQakHzJbN93XtMVFUAyL163rxzOLHTOTW3Nj86wHtKQIM8CqrnXEJF3
	+AK9FZlDtOb9d0DdozlYGNoi1M9y8vQ2+Z/AjVhtoujdoCrIoNKNbfk7jH0eF0uXGWdpvvsWUyC
	Qljxn6eDvi4iC9Jlmw4JoXRO+sjhQrBkBIgWhnGDJx/WBkPqBnAeidAjw1DpC20MgxfzHRKwy2o
	z3bhKjZ0sbM2VbVkf6xMoqrDoPybzgg5zvPLRDMlhL4UCTWi+iWt3ZsjoTDCHTidr75AoNw/TcH
	Xmb1VPPbA12VZb295jl/U+1LWSMCVTVzaaPHtpFz7tKVE+vhYwieOiQ6Gp5zrq3NZZXh870FVFp
	GkUt5m8Yh6Ip8kVaTgWq46CEt+I3ToHcrf+t0WR9mZ5rYeNa9oqR5m3bYxBkj4
X-Received: by 2002:a05:690e:150b:b0:66c:e3db:e14e with SMTP id 956f58d0204a3-66d256611f2mr5655360d50.8.1787842334856;
        Thu, 27 Aug 2026 07:52:14 -0700 (PDT)
Received: from localhost ([2605:8600:200:1a83:fe59:7385:2855:8588])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66d2471d460sm3060976d50.12.2026.08.27.07.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 07:52:13 -0700 (PDT)
Date: Thu, 27 Aug 2026 10:52:09 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Ridong Chen <ridong.chen@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>, Kairui Song <kasong@tencent.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Ridong Chen <chenridong@xiaomi.com>
Subject: Re: [PATCH] memcg: sink mem_cgroup_uncharge_folios() into
 free_unref_folios()
Message-ID: <20260827145209.GA3004@cmpxchg.org>
References: <20260827030516.462926-1-ridong.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827030516.462926-1-ridong.chen@linux.dev>

On Thu, Aug 27, 2026 at 11:05:16AM +0800, Ridong Chen wrote:
> From: Ridong Chen <chenridong@xiaomi.com>
> 
> Every caller of free_unref_folios() invokes mem_cgroup_uncharge_folios()
> on the same batch immediately beforehand.  This pattern is duplicated
> across shrink_folio_list(), move_folios_to_lru(), folio_batch_move_lru()
> and folios_put_refs().
> 
> Move the uncharge into free_unref_folios() itself so the batch is
> uncharged in one place before the folios are freed.  This removes the
> repeated boilerplate at every call site and makes it impossible to free
> a batch without uncharging it first.  No functional change intended.

Hm, IMO this is confusing. You're making uncharging an included
service in a subset of the page allocator freeing API. Batch freeing
uncharges, but single page freeing does not.

I don't think saving 7 lines is worth that API caveat.
