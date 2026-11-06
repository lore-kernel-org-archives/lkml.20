Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.96
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793952041;
	b=TjVX7gOF+90xMKtjybG6cfp0y/dXRGbPNPwAK/QgYboPp+2SDXRoHDgDo6KUVACljVlf
	 ojeehiamQux/IXLMnPe5XNWYuoNlM7LRqUG+PGUiu3YZlkpX69sO6GpJhVT2y09A4DNbo
	 khaU6TEjew7IMOEZ9pqGgLSGyBRZPyHBpcIF3Xl+WgtLfSs+2T+wA8Yl3XKOvRp2pWyVN
	 zUkPuGiHRsczOjg0M8Be/p7nFUQDwTGPZ5Ui7SpX0GmCt0gt/htV7HpOnmDyH4hdpEZD8
	 l6Ox3BXlJtOYtN2KqE9CXvambqZMpfDg18dm7fSBG6fHlnxYGSvmKb69zsCK5VmGKdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793952041;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=CSAmRJxA26lVa9d8ef5jJKzg0pl+9P3AFrDuUmlmVQM=;
	b=YiIzZy2vDzdpRpZoHwAfVnYjihReNJFtr5IogJdE1MXd1Gc+SWv9HQKtGy6I+XuyKqnp
	 6vu7XAlJJMFozYHngutqjDLJOUqsQRD5Qad5uje4DA5U/BpOoQqRP9ujEqk76zHPtaYK9
	 iFiF3ZBS9PAko4pQeHZX9tY5nFWAn1ANJI7FsQg0qWVqXa0KNvqTy232KB01mXfcCTp71
	 Z6TapY/4/PLBw4FRRWtyWpAzRo2SVolvdsXfUfSEEBx4Vuns6REz0RndIIZI2y7s0y9Oz
	 sqECpU0w2qH3O9LwiEWfXQZcUla7J9Qvxhd4Ih1Yyj3UhsJ5XCFEiT5qL4UCoN1mXfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LGvYi3hL;
	arc=none smtp.remote-ip=95.215.58.96
Received: from mta1.migadu.com (out-96.mta1.migadu.com [95.215.58.96])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658DE606D81D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:00:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 658DE606D81D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LGvYi3hL
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=VW9Si2+KVl36tjewGW8VX2mt2qPP953x9tJRVdyvaNg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793952038; v=1; x=1794556838;
 b=LGvYi3hLOxsmHxvPgvYUsw4MpiOqhAN+N52L4SG7wkmr+5vonjfqNsyf757Zzt/7RyTGp9ap
 zgkFgZhB13sP21GFEICGj9K7w6VlmrLbz7VHv17xxR+hSRoiN77C9IBgZCQxb3YoHX/yniq/enK
 st4tK9a3Et1Lr0EihTqVJq78=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9a35c9af166ee30d;
	Fri, 06 Nov 2026 08:00:38 +0000
X-Mizu-Trace-ID: 9a35c9af166ee30d
X-Migadu-Flow: FLOW_OUT
Date: Fri, 6 Nov 2026 16:00:31 +0800
From: Hao Li <hao.li@linux.dev>
To: Harry Yoo <harry@kernel.org>
Cc: Zhan Xusheng <zhanxusheng1024@gmail.com>, vbabka@kernel.org, 
	urezki@gmail.com, paulmck@kernel.org, qiang.zhang@linux.dev, 
	akpm@linux-foundation.org, cl@gentwo.org, rientjes@google.com, roman.gushchin@linux.dev, 
	linux-mm@kvack.org, rcu@vger.kernel.org, linux-kernel@vger.kernel.org, 
	zhanxusheng@xiaomi.com
Subject: Re: [PATCH 2/2] mm/slab: don't queue the page cache work under
 krcp->lock
Message-ID: <au2JBV_Y0DJVwVVD@fedora>
References: <20261028134647.3176080-1-zhanxusheng1024@gmail.com>
 <20261028134647.3176080-2-zhanxusheng1024@gmail.com>
 <auifTNDwbBTJeu81@thinkstation>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auifTNDwbBTJeu81@thinkstation>

On Mon, Nov 02, 2026 at 02:35:40PM +0000, Harry Yoo wrote:
> Here I added bit more context and adjusted comment. End result:
> 
> mm/slab: don't queue the page cache work under krcp->lock
> 
> Commit 56292e8609e3 ("rcu/tree: Defer kvfree_rcu() allocation to a
> clean context") deferred page allocations to a workqueue. To avoid
> deadlocks with the scheduler, it used hrtimer to queue the work instead
> of queueing it directly.
> 
> Commit d0bfa8b3c411 ("kvfree_rcu: Release a page cache under memory
> pressure") later added a backoff mechanism under memory pressure, but
> did not consider that queue_delayed_work() with delay = 0 immediately
> queues the work and introduced the deadlock commit 56292e8609e3 tried to
> avoid.
> 
> run_page_cache_worker() runs under krcp->lock, from kvfree_call_rcu()
> callers that may hold more, such as set_cpus_allowed_force() under
> pi_lock, so it kicks the refill work from an hrtimer. Under memory
> pressure it instead queues the work with a delay of
> rcutree.rcu_delay_page_cache_fill_msec, which may be 0, and a zero delay
> queues it at once, taking pool->lock under krcp->lock.
> 
> With the delay set to 0, calling kvfree_rcu() on vmalloc memory under
> pi_lock after a drop_caches makes lockdep report:
> 
>   Chain exists of:
>     &pool->lock --> &p->pi_lock --> krc.lock
> 
> Use the hrtimer when the delay is 0.
> 
> Fixes: d0bfa8b3c411 ("kvfree_rcu: Release a page cache under memory pressure")
> Cc: stable@vger.kernel.org
> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
> Link: https://patch.msgid.link/20261028134647.3176080-2-zhanxusheng1024@gmail.com
> [ harry@kernel.org: add more context to changelog and adjust comment ]
> Signed-off-by: Harry Yoo (Meta) <harry@kernel.org>
> ---
>  mm/slab_common.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)

Reviewed-by: Hao Li <hao.li@linux.dev>

-- 
Thanks,
Hao
