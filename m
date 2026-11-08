Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794127301;
	b=YnIvMZ2d7kF60p/wdeKrBnlAGUN7k71MhMx9XhIje43grrm0xHfFBg2Q5zknKOEoHH4I
	 eE58dJyFc9v5eVnqnC2y7sGtxxa7sdROcbZ3CQabtmrbJAOHjZaQz+Z6zhzWoQIuoFYNt
	 ZT01A0ieEqNV2A/yPeIsHjHNy/YboMA+gtH+N0a6NqFvAOBIN60EEcblzouP2tA+SUsn+
	 5JyWZRW/InPLcZgylAvawCn0sKHvt0It2puM9SBAqRN+TYXMfq6Tora4vxpVHlMDX0UTR
	 WH6ndD5qu8x14eUFMh2qiq3a/VRoe51oeNBKTmJJB4L+i6opy1Obisbc8DlJZ1h5d3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794127301;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:User-Agent;
	bh=04OWJWl0q4USzjLVzwemPm053ugbzZoSSOQ6EL5Fbvs=;
	b=WFRsOyqZmgl617yBnLOijefwYrT2wMHpxTdFKKHhlHgJF4yu+bzwHYD/B95Qx8pZIVdi
	 WLLhs8blRWXKeTNHnIbpruwncEYrOV70QhKQ5kXiNISn+ooVHbp4zeDeanYkP84hR8wfw
	 zTzRcOW4P3AkGfpN0leljXMxxlxujaNoUxH0yh5AnhBWk2gIDvMiV0No59rtzzYZfzO3I
	 BFriokoXZvwiCJpcuAnMSwawv3hB3wesSgzbgeKplMlhILJhO0VkWqzA3vkpZsLgiZHY3
	 9sVZ4Vb5jTtuzyEnid3mqNMTtzTgGEHG5ibse6f1hbyjJ8ZQ4dQwux45jRyU2M4hWxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=d4G+Qk7i;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4726606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 08:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4726606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=d4G+Qk7i
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b0b3754f57so127764a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 00:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794127300; x=1794732100; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=04OWJWl0q4USzjLVzwemPm053ugbzZoSSOQ6EL5Fbvs=;
        b=d4G+Qk7i9L7YqnXb63Yt8hNFVlT9F14ZiFmxza3GzeCu8eU7/7uSBFQfb6vy08FOlW
         X/Po1s3J4ztNeKa6n71PqF1FHeBsFng7jQJxQfOQjplrHxf+TvCfin+simyiUHXuU2EC
         X8H+K6tMSmyw5qBXCO+tth7JyW4GlR3KP3g50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794127300; x=1794732100;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=04OWJWl0q4USzjLVzwemPm053ugbzZoSSOQ6EL5Fbvs=;
        b=ekMzzjRu/RXfULPOz/SFpb56+j8/i97t4aBwxVr3ooTakU0/zytuf815Z6UdKhNA6F
         Ptim9EHSCskumfQFgoygE5NIFi+HZS36V8qefd3Mafp9Q4kpEIrVUT+EDLEtjwpMPFB2
         zcmdANRF8b1y22NFxxU4eB6DVZUmXL/mQ+wh18N8uzMi0waACqGLO1+ZuDv4bzc3dEsN
         OQxWunQd2aM8sGsZRPgY3MG4pNvDCn95YRM/zLH+xlqCYS2Sxrz9tdJEuFwNdUsiN6Gq
         PYrOIHOPdyqvYsV8nzhjrBZ/FPLDupdApLhqm1gwDUTzq/j8YfYgcXq4ATDuOQrtmawT
         P9Jw==
X-Forwarded-Encrypted: i=1; AL+hErFJHeOPzbjcClASWU/zy4n570MeCekWsffTeVIibsQf1k7nx4qXHGBsvI3qbiwYT4LzLS4iI4l+bqrWtZU=@vger.kernel.org
X-Gm-Message-State: APuU4Z98uzLenkRz2gq2gzHfXX8kk6mszbUW1pSpCbUW51izDbBIwgZr
	Pp4afHARtS40n4GC8vyJAuPrfeu2364fk7c6Psveki9SL5hsulN8pKFokfCTSTGSvUg=
X-Gm-Gg: AYBFou2La3GrfMPeogDTvLnv1kjcuyZCb0Zg+HvEhFXLUl8s3DzKipp9jQ+5Vms4ANl
	Bc5mcF6a3/Su9RWygTH9UlhLn+15j1HO/H1NkNH4y+9uDb345fH9iAnS/FyD0/95jf3HAlNmbqJ
	K+ut7vdmw1pS5uFvjxMt6S261OvLm4vGmFt8AdO7VyDBwQFjoT4U74GWiMRJcVEvHet6CS3TCjQ
	382lruxWz+h6H4PkokaOMKbZQZPLTxC65N0aWBHl6WVoEWa2jd2z3IbNFI7Yb6mkn2m8uCxsQO+
	+vSa1/nPgteA5vqGkD4UIOQBOd0EHs1alFe9cdyOoi0KcUXZ3WFkt8pUP72PcDZMlnkZY1vtmK/
	+lBqyAA5iyX8M8PhAgEy69eIbsej4XRTY1qF0UwxHbchFbEzfh7UdUZfM+EgZxHvvqfSmI48PXu
	UbbaYI6gUfVlXC7RzHk7cP2r2sg0/9U2oKyisTcW4cn+6Dm+SVhx/rIuGjUm6WfB9S6SZ4iYlso
	cV/yvtZIfeU5PAphWZwCNDPSDdZnbXX5hD6Soam1YS6VfN1SK5CHqxyp8SNRa0WqQAppdWynX3K
	Nsq6gT+huvxZXVpgmqx3I2mYWsoaPjIsjiYolbA5PPxdJZS8e4tR4uqvXZtU22V7o1qtZBPTE4b
	Mtsh27TdQw5XIRUgBwJ1ZntqSGU5kpRN5aKU/n4vVut8xTrwZqyda5HvtGKhai1CyYwdcOpOLdn
	YqwfNeAClipml8NYNIDIAhEM87TZQq9/ZKch48CaRMkt0F/ZmO2Bob
X-Received: by 2002:a17:90b:4b83:b0:3b0:ac2c:1619 with SMTP id 98e67ed59e1d1-3b12d3e713amr651515a91.39.1794127299954;
        Sun, 08 Nov 2026 00:41:39 -0800 (PST)
Received: from localhost ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b101bc4586sm3906321a91.2.2026.11.08.00.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 00:41:39 -0800 (PST)
Date: Sun, 8 Nov 2026 00:41:37 -0800
From: Chris Down <chris@chrisdown.name>
To: Andrew Morton <akpm@linux-foundation.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>
Cc: Muchun Song <muchun.song@linux.dev>, Tejun Heo <tj@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Zhan Xusheng <zhanxusheng1024@gmail.com>, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH v2] mm: memcontrol: Don't lose track of exiting OOM victims
Message-ID: <avA1wXhTMs9eY2NF@chrisdown.name>
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
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

When oom_evaluate_task() comes across a victim we've already killed, it
backs off until the victim's mm has MMF_OOM_SKIP. This gives the victim
a chance to free some memory before we kill anything else. However,
since commit a72f73c4dd9b ("cgroup: Don't expose dead tasks in cgroup"),
css_task_iter skips exiting tasks once signal->live reaches zero. That
happens before exit_mm(), so a single-threaded victim can disappear
from the memcg scan while it still has all its memory.

This can kill another process when the first kill would have been
enough to recover, and we've seen it happen in production. If the
second victim is in a cgroup with memory.oom.group enabled, the extra
kill can take down the whole workload.

In tests I used a 64 MiB memcg with swap disabled. I started a process
that faults in 44 MiB of anonymous memory, submits a 4 KiB direct AIO
read to null_blk, and goes to sleep. I set null_blk to take 10 seconds
to complete the read so the victim would have to wait for it in
exit_aio(). Two seconds after starting the first process, I started a
second one that tries to fault in 40 MiB.

The 40 MiB allocation hits memory.max partway through and triggers an
OOM kill. The OOM killer picks the first process, which has more
resident memory. With the read still pending, the victim blocks in
exit_aio() before it can tear down its address space.

memory.events showed oom_kill 2 in three runs. In one of them the first
process hadn't submitted the read yet when it was killed. The slow read
just makes the window easier to hit.

The cgroup iterator hides these tasks so that cgroup.procs doesn't
show processes that waitpid() may already have reaped. That's fine for
cgroup.procs, but the OOM scan needs to see a victim even after its last
thread has started exiting. We already have CSS_TASK_ITER_WITH_DEAD
for sched_ext, so use it for mem_cgroup_scan_tasks() as well.

With this applied, OOM selection backs off while the first victim still
has memory to free. The 40 MiB allocation completes and memory.events
shows oom_kill 1 in three test runs.

Fixes: a72f73c4dd9b ("cgroup: Don't expose dead tasks in cgroup")
Cc: <stable@vger.kernel.org>
Signed-off-by: Chris Down <chris@chrisdown.name>
---
v2: Give more concrete details in changelog (akpm)

 mm/memcontrol.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 84f4a8fd4d16..cb7cfae9ce5a 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -1451,7 +1451,13 @@ void mem_cgroup_scan_tasks(struct mem_cgroup *memcg,
 		struct css_task_iter it;
 		struct task_struct *task;
 
-		css_task_iter_start(&iter->css, CSS_TASK_ITER_PROCS, &it);
+		/*
+		 * An OOM victim can start exiting well before its mm is
+		 * torn down. Keep it visible so oom_evaluate_task() can
+		 * back off while there's still memory to free.
+		 */
+		css_task_iter_start(&iter->css, CSS_TASK_ITER_PROCS |
+				    CSS_TASK_ITER_WITH_DEAD, &it);
 		while (!ret && (task = css_task_iter_next(&it))) {
 			ret = fn(task, arg);
 			/* Avoid potential softlockup warning */

base-commit: fa4ad798f6f681031775266044ba1b0cf3c670bd
