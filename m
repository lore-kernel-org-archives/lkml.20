Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25EC72FC893
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792019353; cv=none; b=N3okT0YyZQ/ME2xEZBGePs3DndDohDD+AQyKp0IoLzYttQS72cLGZjWlpY2hF5MFmJ3C66XzWZd1PXnHf2/u0oiCS/WBDVZMA6K+2DDnfDsQK7OCXr/P/SURNMRaKFM4du9h1/Z42pT+441cDMwC4iAyQJnm5s6V9B+uJm1GSCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792019353; c=relaxed/simple;
	bh=gfk+T8P/u+pE/Fhb/Q2Yk7BonKL8voYUqTaS2OXtfc0=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=oU7OChS4/WGBAwdX4k9im9JHdMj5jm4KvZKbhRDIHhpqTwLK0fPr24LdD81rVE88p15sJqGjb3FV4ur650cpiosAwbBGd+I1XqR5IGLWMbErh8el8bLVMulChbuZlIqMkSA6LlBVnri3Upb9pojMjODw19zNwtEMFKnDKH4Roec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=wPW2HHY0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="wPW2HHY0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 102F51F000C4;
	Wed, 14 Oct 2026 23:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1792019351;
	bh=cbmYsA9KrEptMrJ4TWH3Zu5hn3Aq4CSH6awCQPo0RqY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=wPW2HHY0GoMweDWZnBFXZJZVavcyDJP8YNyVymfc6W5aZU6VEOoxj7GOJN1L0eH8R
	 MauY1JmmqzvI6WJX6rEfJ1ip5JGLPov29C9a8jqeAVE2ZDC6ChTa17LNRWZbO0qf1Z
	 HRtYpL0p47CIJRiu/CFRK6CFRJsPcrtd1knpcaTk=
Date: Wed, 14 Oct 2026 16:09:10 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Hui Zhu <hui.zhu@linux.dev>
Cc: Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>, Shakeel
 Butt <shakeel.butt@linux.dev>, Barry Song <baohua@kernel.org>, Axel
 Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei
 Xu <weixugc@google.com>, Johannes Weiner <hannes@cmpxchg.org>, David
 Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, Lorenzo
 Stoakes <ljs@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, Hui Zhu
 <zhuhui@kylinos.cn>
Subject: Re: [PATCH v6 0/2] mm/vmscan: fix NR_ISOLATED accounting and
 throttle MGLRU eviction
Message-Id: <20261014160910.eeaa24697b614d1b94806d0d@linux-foundation.org>
In-Reply-To: <cover.1791968227.git.zhuhui@kylinos.cn>
References: <cover.1791968227.git.zhuhui@kylinos.cn>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 14 Oct 2026 17:00:22 +0800 Hui Zhu <hui.zhu@linux.dev> wrote:

> The legacy reclaim path has two mechanisms around isolated folios that
> MGLRU lacks:
> 
> 1. NR_ISOLATED_ANON/FILE counters are updated when folios are isolated
>    from the inactive lists. Compaction's too_many_isolated() relies on
>    them to decide when to back off. The MGLRU reclaim path never
>    updates them, so compaction cannot see MGLRU's in-flight isolation.
> 
> 2. shrink_inactive_list() throttles direct reclaim via
>    too_many_isolated() when isolated folios pile up. MGLRU's
>    evict_folios() isolates folios without any such check, so many
>    concurrent reclaimers can over-isolate the same (oldest) generation,
>    leading to unnecessary swapping, thrashing and premature memcg OOM.
> 
> Patch 1 fixes the counter accounting in the MGLRU isolation path.
> Patch 2 adds a per-lruvec throttle, mirroring the legacy behavior but
> adapted to MGLRU's per-lruvec contention and its dynamic type
> selection/fallback.

Thanks.  Questions for yourself and maintainers:

[1/2] is nice and simple and reviewed.  How about I queue this for
second week of the upcoming merge window?

[2/2] is much more code, isn't reviewed and has a Sashiko whine[*].  So
I'm thinking this is 7.4-rcX material.


[*] https://sashiko.dev/#/patchset/cover.1791968227.git.zhuhui@kylinos.cn


