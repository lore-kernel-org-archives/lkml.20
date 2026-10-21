Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.125
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792546536;
	b=Inafbejs6ZKKu3tL065ZyAZ1GInzs0rrJWg0n5/xwFdrH3j/qvt+aFjCnie1b6uZinJR
	 H5+JPtdvw71UD+8hgDO9lsFgwyBwqKb2bpe8UkyBk8NEjVZjdso8ToertSPZH229OJp5f
	 YsXWwiW4IgGZ+c4zeOHPGvv7nCUlO4IvB6Pxq1uVkbfuu8vFyosmjUQJmOAS0dReo0UrV
	 RhZcODnx6Pf42ZIFSTJdKBNe+7j7mtcTx2B4InaYjdKzdoZUDP+yNUGMb8qGzZcU1HCCF
	 wUyRHuwY/BC2QgTa3AEJSvJTVNZcKKBzaumwsY8J6UFlEsmOAwTCjXQIg+Fmyf61DuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792546536;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=2DrsebUbLp13fzrXzEa+wLSyr3pCfG+dstsywGVgOW8=;
	b=DyVfRKB/M0cnqCZNUVlodMO09Q0Z0HZDWg+awi+CBSxm/y/QqOV/yMnaq+BVJPpYrPMG
	 WgcH/rQ3qrGk9ZaX3UckMNOhGYGKkewcIWqToOOpifRKK1kyoj7cJq0ERplwoYhP2y2JQ
	 m0xQUFEGnKj17mD07/pXZ85dmOnTVE7qAJNSTKtvfs+4BelCTgAuRiF5ZPQJxY2x4s8s0
	 oC+6SQ522eDzdUly/DQ9+T1gu/N8bky4Hx3ex/TwH1F2b6qmqY8CTRkiWHQQl2lUuaSgE
	 uqTpn3Ry8xtZFwI7otxCnQ36DAOdleSzuctgJM4IymmqCTdTVnCSNIaTiE0X2ELmhxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uJEUkpII;
	arc=none smtp.remote-ip=95.215.58.125
Received: from mta1.migadu.com (out-125.mta1.migadu.com [95.215.58.125])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F00606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:35:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51F00606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uJEUkpII
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=U4cwMEsU5qtx0w9jQC7lKQe8YciLG2ZHaqb1h0PZGWo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792546533; v=1; x=1793151333;
 b=uJEUkpII0xASAFqy+OyFz21nWdXbOvPvi06zXr7G/p7WjwYCqAgEbjhmxN5aDi6MqQfNzXEV
 1HRn1mT8xnhJBgSdHeJ20VjONagAJncpXCIKbWHS5ia8nNFOT6TQveSqergfFbO2unjJNmed1o9
 lWGx6b1iBzmzWg69aybEyxD0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6f2b2204164ec746;
	Wed, 21 Oct 2026 01:35:19 +0000
X-Mizu-Trace-ID: 6f2b2204164ec746
X-Migadu-Flow: FLOW_OUT
Date: Tue, 20 Oct 2026 18:35:16 -0700
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, cgroups@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v2] mm/memcontrol: publish null pointer before dropping
 css reference
Message-ID: <atgWux9N9a47BHE7@linux.dev>
References: <20261021010051.1529261-1-joshua.hahnjy@gmail.com>
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
In-Reply-To: <20261021010051.1529261-1-joshua.hahnjy@gmail.com>

On Tue, Oct 20, 2026 at 06:00:50PM -0700, Joshua Hahn wrote:
> struct memcg_stock_pcp hold references to cgroups that it tracks to make
> sure that the memcg never gets freed with unaccounted charges still
> living in the stock. When the cached stock goes to 0 for a memcg, its
> reference is dropped and the cached memcg pointer is set to NULL.
> 
> If that was the last reference, the css_put would free the associated
> cgroup before publishing the NULL pointer, which can be racy on 
> PREEMPT_RT. To summarize Shakeel Butt's analysis in [2],
> 
> CPU 1					CPU 2
> local_trylock() takes a per-CPU
> spinlock, which is an rcu read
> lock along with migrate_disable
> 
> drain_stock
> css_put drops the last reference
> release work is queued
> 
> kworker runs css_release_work_fn()
> call_rcu() starts grace period G
> which waits for the refill task.
> 
> <preempt>
> 					drain_all_stock
> 					is_memcg_drain_needed()
> 					enters rcu_read_lock(), but
> 					 grace period G does not wait
> 					since it started after G did
> 
> 					<prempt>
> 
> stock->cached[i] is cleared and
> unlocks. Grace period G ends,
> old is freed
> 
> 					mem_cgroup_is_descendant() reads
> 					old->css.cgroup which has just
> 					been freed.
> 
> To close this gap on PREEMPT_RT, switch the order of the referene drop
> and the publishing so that we publish the NULL pointer before dropping
> the reference. Note that this can only happen from drain_stock who can
> hold the last reference, but not on consume_stock since another
> reference will always be held. But fix this in both sites to maintain
> consistency. 
> 
> This is based on a report from Sashiko, who found this pre-existing
> issue in my page_counter_stock series [1].
> 
> [1] https://sashiko.dev/#/patchset/20260928192349.3432886-1-joshua.hahnjy%40gmail.com
> [2] https://lore.kernel.org/all/atfMngq7nyZpt4u-@linux.dev/
> 
> Fixes: e1a366be5cb4 ("mm: memcontrol: switch to rcu protection in drain_all_stock()")
> Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>

Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
