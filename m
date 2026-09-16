Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2AE448CF7
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789600102; cv=none; b=myD0J234c+yYQfHwFZsQ4UOkM5Eicw//hRgTr4WP4sfApm8hOfkh7kYt0uUpiQmX4t7ld5DOcrWYNca1J2755eEC70DbQaswHMwLV6UZbs7u43BOZ5hRmiTNQ+AdRBSzGG2qWUaCaiE7V9G//y1JJft2HhCFxJvl2PFCOBKv4UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789600102; c=relaxed/simple;
	bh=S707ZM00h8nHn46n2IWESOvC0qFAIosprI7r9Guj43s=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=uEgU9phAqvTbctSDYf+lUuvSkIlPO9IdtgDfr0mLXy3/pdUnTIiXrtU5xPvLDNezWWM6sF2mgGpYqSRn4Joj/7jNEF0nPUjpDEl9kxC+FnVMpbluj+JbzmrSyeQleRZGi8+Ugk3o314AIIV2mhu9K3B2MObVzP5uE5MuKZo73Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=eGNs2RSL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="eGNs2RSL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF1151F000FF;
	Wed, 16 Sep 2026 23:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1789600100;
	bh=EsS3V4h85OIwyWRlwYSEAgLWwmpwQNGI7X/TGNZ7g8U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=eGNs2RSLhL2M9yMOdSs2XidbN91Dw5xcUl+25yjc7oNiTyl1FxuKKCr0l0KnLFyL8
	 eqvcJlGuLtAJ2RIqSbSJTk+f9VaY5nUZj6UVutP/hCQJceL4Z29aJIIoAqUoE3h7HC
	 E3UfrBJbrA0MK4b9A81cH+8VPc5auKzDxJEXGJ+0=
Date: Wed, 16 Sep 2026 16:08:19 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Arnd Bergmann <arnd@arndb.de>,
 David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, Qi
 Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Lorenzo
 Stoakes <ljs@kernel.org>, Kairui Song <kasong@tencent.com>, Barry Song
 <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie
 <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Baoquan He
 <baoquan.he@linux.dev>, Baolin Wang <baolin.wang@linux.alibaba.com>, Ridong
 Chen <chenridong@xiaomi.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/vmscan: avoid false-positive -Wuninitialized
 warning, again
Message-Id: <20260916160819.a93fba485ffafe5b0e63b5f0@linux-foundation.org>
In-Reply-To: <20260916083456.4136132-1-arnd@kernel.org>
References: <20260916083456.4136132-1-arnd@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 16 Sep 2026 10:34:46 +0200 Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> I previously worked around a false-postive gcc-16 warning in the
> get_tier_idx() function, by adding a fake initializer. This happens with
> the -fsanitize=bounds sanitizer when the compiler creates a specialized
> variant of isolate_folios():
> 
> In function 'get_tier_idx',
>     inlined from 'isolate_folios.constprop' at mm/vmscan.c:4982:9:
> mm/vmscan.c:4934:9: error: 'sp.refaulted' is used uninitialized [-Werror=uninitialized]
>  4934 |         read_ctrl_pos(lruvec, type, LRU_TIER_MIN, LRU_TIER_MIN, 2, &sp);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> mm/vmscan.c: In function 'isolate_folios.constprop':
> mm/vmscan.c:4946:25: note: 'sp.refaulted' was declared here
>  4946 |         struct ctrl_pos sp, pv = {};
>       |                         ^~
> 
> Adding another "= {}" would solve the problem as well, but to prevent
> this from happening again after the next code refactoring, try instead to
> prevent this by forbidding interprocedural optimizations on this function.
>
> Link: https://lore.kernel.org/all/20260213123902.3466040-1-arnd@kernel.org/
> Fixes: 3de705a43a46 ("mm/vmscan: avoid false-positive -Wuninitialized warning")

I believe we want older kernel to compile properly with gcc-16, so I'm
suggesting this be backported?

Perhaps we should have done that with 3de705a43a46 also.


