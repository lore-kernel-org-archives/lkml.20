Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859BA4052CD
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 04:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790829745; cv=none; b=rERfOO21E4aGCTHTHOTZspeJMFUJqTPVWdwGVWyAlffRz+Z7k1lfUB0UcQMT32pCJp+GMcWSjV4lKtnXw97B2xzib3jxhi/Rc5HpfEZjh/Gf6UbWpzlGXScJpnN3U2hG6YKtGroHHx9Ix5MuyrTBLpN84HHvnpan9ba0I9xMfVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790829745; c=relaxed/simple;
	bh=vZ2a1RS1CoeagLQdph6wHtoMViLnpsPlbekfBXE+tuE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Tgs6gXMPcFGAdefE8v07csXeEWdcu8o4yMs4r4kj9HtiofwQWdx01dkXoZU3eElpYSRPovyUwgz6BhTqOkdYsmBjiEc7GtO+qTIiL22QEIc5K3axCmw18nVe9RTE86gawLYfLZzoIdT2gbsQZz4dDkZOAIeTEbjWCXuV74IaMGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UqXfvQin; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UqXfvQin"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so45495225e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790829739; x=1791434539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p2Gp1DxjHQ0qTISrrSjvk99H2tt8CfuvB/h7scE7CDY=;
        b=UqXfvQinxt+NHrhgqikrVcvkpAftlLeI45IG08yG5MN843l66qXD4S4RO7BaWSbNZw
         iYbPUZPwU5vFjGYM+WJc0cF3mK4lud76GLWQJqEs+A8oKLMvOsI3A+KdcbsMzl+5NDnJ
         9rEqJwfanwwxJ63tiGZ6akqHzL18DqS/1FOt7jZV/9SRhQMTTYCj1eNWkwrLgAZhm7dl
         qKehcURJ3AQSEzNVMQRy7C5O3uKBoxlX/gwc577j/2Kn7c/KkSXbr88LpiQlbBZMTj5u
         VraxuyooadZn5OoRDDxz7h2Nz5pOtJZFg+PPJO8BvEwvWJSX52BTP2yEssK2UrKr01SK
         7vXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790829739; x=1791434539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p2Gp1DxjHQ0qTISrrSjvk99H2tt8CfuvB/h7scE7CDY=;
        b=rqCla3bBS4sB8Y9xeesktJV3cjAI4EjUgP77s+S5c3oYFsEowpFEh0etl3pkMbOmKa
         50rOlwoKgDTGYyGLI2JtVHdW/gAFQJIMajSD3Q9KxigWceQzJQ5bjc+3++xh4wlk2hXx
         Qc/+7jA3oyzyUXhDzd13odmj31IZgZQ5pqD165etU4f8H925X8GC85g+bRZbXelJUe6i
         fK5z/MvMThsM2U6CvVh8ifkARtMYaxGgrOsnVI08uccT2LOsZov7RkwlH+WfiU0MA4eN
         /w1fMPXgw+sKAUUnF+VVOxO9rUdk1+PJyj18WRr8aAJZpA/IZleCHkbYH1rvrFcpngx2
         0XPA==
X-Forwarded-Encrypted: i=1; AKwUvBws26ZG8i9lWvJWadJj+UES5SrMMnCFjT6lMM7b2HyqLMZjYDy2EvamZFmWkKYtLJjbsfWt4yICbCSgVEw=@vger.kernel.org
X-Gm-Message-State: AFuF++lVA3aDBjCxeEaj2b/OxtrE7COleRhuVnkKHODbsY9TctGQub4K
	IYN+JcSVtIOwtE8Chyl/hGYGpO331qzltWuNZGzV/0lxmXXnjQYWQCgI
X-Gm-Gg: AYBFou1PxH68i1NUgriOTHn5r+BMxWW4YtH5sKYvSX3r8NIfZCr+ibSjdZQ3jUrdQ5b
	D6pI23lQvRlVQZg5b4GIho5gf1he/6pJYwCwoomE7nXhliT4iLvcvL6zdX1bU7YxX6xr7IE3b7j
	6Eko4gD2RgQbtTamFTcyLBq2YoDCLWqSzX94WrLkWVEUvgYr3MK9SJZzE9MsGq2wP6cTlqwFRIz
	FyjYK3+D5WV4/B7D2xn8hrEH3p3zwTip7Iw91lWyNG3WGxJbPGrBw/ZIHmLF3CdzPeaC/W7ZRkg
	qOWDUwGz2NOUrZl6nMznvQ0NJrNZ1TsBelRFCFUHSvcU6skAJ7sANSix93MiibVmOFDNycMj9uf
	fBx0zakhkaRqltRSE+8NRHInHSCRrxbdtQqpfS7b71mrRloK5ew5RtRjRbIWyEMjrcA0wxYVCA9
	Scpmy2cu8WqYO/hQBi315AFJRLvGdTddEi3W1+C7mneJIpa1jHxZVogc90j/sfSXwRcELDrl7vn
	FDyMK5P9jIRnPAo4/ct15+Sc+VC4FA34EK0Fe1tVTqP5OtRkPSK5io0FCq1yaz+4nHVKbqiakUF
	jtB/I7hS3KO8d0miPLBv0WKysFFGup5UR8rhdvL0hYsWE3G5bgTM
X-Received: by 2002:a05:600c:8b38:b0:49f:ce72:e930 with SMTP id 5b1f17b1804b1-4a01b13d7d9mr54875995e9.34.1790829738870;
        Wed, 30 Sep 2026 21:42:18 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-095-117-056-101.95.117.pool.telefonica.de. [95.117.56.101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f6c5059sm32619515e9.0.2026.09.30.21.42.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 30 Sep 2026 21:42:17 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Muchun Song <muchun.song@linux.dev>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Alexei Starovoitov <ast@kernel.org>,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: [PATCH 1/2] mm/slub: preserve no-lock freeing after memcg charge failure
Date: Thu,  1 Oct 2026 06:40:55 +0200
Message-Id: <20261001044056.75079-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261001044056.75079-1-kmehltretter@gmail.com>
References: <20261001044056.75079-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kmalloc_nolock() can obtain an object before its memcg
post-allocation charge fails.  For a single object,
memcg_slab_post_alloc_hook() rolls the allocation back through
memcg_alloc_abort_single().  That enters the regular SLUB free path,
which can take a sleeping list_lock on PREEMPT_RT even though the caller
selected a no-lock allocation.

Use kfree_nolock() when the allocation flags disallow spinning.  This
keeps the SLUB object rollback on the no-lock free path.  The failed
allocation continues to return NULL.

Fixes: af92793e52c3 ("slab: Introduce kmalloc_nolock() and kfree_nolock().")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 mm/slub.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/mm/slub.c b/mm/slub.c
index 54ec125033571..a1f08338102e2 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -2519,7 +2519,10 @@ bool memcg_slab_post_alloc_hook(struct kmem_cache *s, gfp_t flags,
 		return true;
 
 	if (likely(size == 1)) {
-		memcg_alloc_abort_single(s, *p);
+		if (alloc_flags_allow_spinning(ac->alloc_flags))
+			memcg_alloc_abort_single(s, *p);
+		else
+			kfree_nolock(*p);
 		*p = NULL;
 	} else {
 		kmem_cache_free_bulk(s, size, p);
-- 
2.53.0
