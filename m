Received: from mta0.migadu.com (out-58.mta0.migadu.com [91.218.175.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3CF39E6EB
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.58
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789563524; cv=none; b=KD77vq4TUtESF+7GjQUjaR6vke4S9hJtaTKwWm/xymM8kjWQaT3XlHjfQy9ZzhiUGznR7oyntzaYVjFNZVMlGhbXFwrSgqWtBcesxLNBwGuYihRou71rsJgyuN1kSbU1IiIUUQOzMas16Y5OHV/BvsFzBpvtK2n9YtKTQHggdKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789563524; c=relaxed/simple;
	bh=NqgpLka1U0uH8PVx/qAWnt0LZxjjNxyG5vubBu2izC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UAQvt+Cp0YK03hwd4m4iAHJktWDblE3o9PRXkjhwQ/FksLfau+TgKpifjmCXKHXcpji04LY+UqGUE6esry1q3CayKIj2HY877ULcfTT6a235yojbwSZpbmYjvj1OvsJ2KfRumdfQwlpNbdKUCrz2z/4nfQiD55iE5ceipUa2O0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=iYnhF8Km; arc=none smtp.client-ip=91.218.175.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="iYnhF8Km"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=NqgpLka1U0uH8PVx/qAWnt0LZxjjNxyG5vubBu2izC8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789563521; v=1; x=1790168321;
 b=iYnhF8KmvZRguvgPZf84ZU8GxsIikoL3a9j1/Ou5Ps0gdAck+GnYitPMQMHdJHdHQIpYwLEO
 SxzI+CwHzNMQGQUxk8Kt2m9AxjlpGT4Zul9XFS5mdDPlY80xaOiPyaWOuOExCvQdPxflYy+plVX
 M+JrttAJcDXMheBVWPTjdkg8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b341f15ade355bd8;
	Wed, 16 Sep 2026 12:58:40 +0000
X-Mizu-Trace-ID: b341f15ade355bd8
X-Migadu-Flow: FLOW_OUT
Date: Wed, 16 Sep 2026 20:58:32 +0800
From: Hao Li <hao.li@linux.dev>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: harry@kernel.org, akpm@linux-foundation.org, cl@gentwo.org, 
	rientjes@google.com, roman.gushchin@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Pedro Falcato <pfalcato@suse.de>
Subject: Re: [RFC PATCH 0/2] mm/slub: reduce list_lock contention with slab
 parking
Message-ID: <aqqOk9ULIuV-5mQg@fedora>
References: <20260824122004.3652-1-hao.li@linux.dev>
 <a3e5581a-e039-45bb-b570-a01158b154bb@kernel.org>
 <aqPg5YRKdaZiBj9b@fedora>
 <4d9ebf64-e3b4-4b6c-9576-e8be59193f80@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d9ebf64-e3b4-4b6c-9576-e8be59193f80@kernel.org>

On Tue, Sep 15, 2026 at 09:10:22AM +0200, Vlastimil Babka (SUSE) wrote:
> On 9/11/26 13:24, Hao Li wrote:
> > On Mon, Sep 07, 2026 at 03:44:08PM +0200, Vlastimil Babka (SUSE) wrote:
> >> On 8/24/26 14:19, Hao Li wrote:
> >> > 
> >> > Detailed data
> >> > -------------
> >> > 
> >> > metric                              before             after             delta      change
> >> > ==========================================================================================
> >> > alloc_fastpath                     155,417           168,534            13,117      +8.44%
> >> > alloc_slab                      55,679,646        26,702,510       -28,977,136     -52.04%
> >> 
> >> It's interesting that this is reduced so much. Is it because parked slabs
> >> cause more slabs to stay around for reuse, despite they are unparked
> >> immediately when trying to allocate/refill? That seems odd?
> > 
> > Yeah, it does look counter-intuitive at first glance. My understanding is that
> > the parking mechanism helps by bypassing the partial list spinlock, allowing
> > partial slabs to be parked onto the llist locklessly at any point. Because of
> > this, the refill path gets to see and reuse more partial slabs instead of
> > having to allocate fresh ones so frequently.
> 
> Hmm that's an interesting effect, surprisingly large if true. Because the
> slabs we'd be parking are transitioning from full, there would be most often
> just a single free object to reuse?

That makes sense. That said, it might be more than a single object, since
build_detached_freelist() tries to free objects from the same slab together.

Even though we "park" the parking series for now, I was still curious to
understand the underlying behavior. So I add a counter in
get_partial_node_bulk() to see how many partial slabs it can see.
(counting freed objects directly is tough, so the partial slab count gives us a
rough picture)

Interestingly, each get_partial_node_bulk() on the patched kernel saw about
3-4x more partial slabs on average compared to baseline. This suggest that the
parking mechanism can supply more allocatable objects even under lock
contention, since it can avoid waiting for list lock.

For example, in the baseline kernel, if the lock is held by an allocator, a
freer has to wait on it. Once it's released, the lock might just get grabbed by
yet another allocator, leaving the freer stuck waiting. As a result, the
partial list ends up starved of free objects.


-- 
Thanks,
Hao
