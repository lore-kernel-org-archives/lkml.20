Received: from mta0.migadu.com (out-129.mta0.migadu.com [91.218.175.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2621139936D
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 18:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787769060; cv=none; b=vC3WF4LO/3gC9q9cKWb9ydRI2LFZ1/x+tJglDe/OajBzNpepaLyFiVhA/BEP7apN/cSyyQ1trKwR7sMvwiTqeLNtI6+3biFGOekYywpU0WfElHjg1Ha4SHpCP0wG+xcPUHaj0cdpODDXEWQHDMA+r1BmbfzLce6SxqGfS6ioP0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787769060; c=relaxed/simple;
	bh=sRp/KET3iYMwTo3XmECBCWWEcdW7TQWTf+Msi3bdCOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OWImM0KlaBcYuPw6Q9/CEZp4NNqSN6OUYCop1hJQOk4QFSQ+8aw6Tre+e0NAlRmpfrb+7dyxrQqZdZnz3ZVrXTJswmg1A7nlR8FC4v3ivS3fbPvLkuDZ4cGkvClPRhfrDN5TUEkAU3m3oXt9eWfa4MgVRkWhPEOBsV/S3kOoRG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ovaPIb8T; arc=none smtp.client-ip=91.218.175.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ovaPIb8T"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=sRp/KET3iYMwTo3XmECBCWWEcdW7TQWTf+Msi3bdCOU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787769038; v=1; x=1788373838;
 b=ovaPIb8TvskgL8WDU9ja1T6dEM57U/m4FBjcA/glxJXH+shadcKUF6iApMrCpMKuER/oRTtb
 LIMMQ/Nhq9KAsx1BCTOp7HFAGcmMLrx/LXKJ8Z0HKFI3kaGZUz9AvwEpKrxwoni0KsBkrjhy8EH
 PRdNjNGMQoS3RqUTREhcvbwM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: from localhost (2a03:2880:10ff:51::)
	by smtp.migadu.com with ESMTPS id cf2c048dfc5b5d89;
	Wed, 26 Aug 2026 18:30:37 +0000
X-Mizu-Trace-ID: cf2c048dfc5b5d89
X-Migadu-Flow: FLOW_OUT
Date: Wed, 26 Aug 2026 11:30:36 -0700
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Ridong Chen <ridong.chen@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>, 
	Michal Hocko <mhocko@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Davidlohr Bueso <dave@stgolabs.net>, Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Ridong Chen <chenridong@xiaomi.com>
Subject: Re: [PATCH] mm/vmscan: drop the combined limit gate in
 __node_reclaim()
Message-ID: <ao8wt1YA6ahtQb7W@linux.dev>
References: <20260826124409.35569-1-ridong.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826124409.35569-1-ridong.chen@linux.dev>

On Wed, Aug 26, 2026 at 08:44:09PM +0800, Ridong Chen wrote:
> From: Ridong Chen <chenridong@xiaomi.com>
> 
> __node_reclaim() is called from two paths: node_reclaim() and
> user_proactive_reclaim().
> 
> node_reclaim() already bails out early unless node_pagecache_reclaimable()
> is over pgdat->min_unmapped_pages or the reclaimable slab is over
> pgdat->min_slab_pages.  The identical check inside __node_reclaim() that
> guards the shrink_node() loop is therefore redundant for this path.
> 
> user_proactive_reclaim() is proactive reclaim driven by userspace and
> should not be gated by the per-node min_unmapped_pages / min_slab_pages
> limits at all [1].  With the gate in place, a proactive request is silently
> turned into a no-op whenever the node happens to sit below both
> thresholds.
> 
> Drop the gate in __node_reclaim() and always run the shrink_node() loop.
> The node_reclaim() path is unchanged, since its caller has already applied
> the same test; the proactive path is no longer wrongly gated.
> 
> [1] https://sashiko.dev/#/patchset/20260723045718.2052070-1-ridong.chen@linux.dev
> Fixes: b980077899ea ("mm: introduce per-node proactive reclaim interface")
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
> Acked-by: Johannes Weiner <hannes@cmpxchg.org>

Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
