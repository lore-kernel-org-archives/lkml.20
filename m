Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794116459;
	b=LVPcgScOECVn9QnrW2vdeMT60h+KE5CDSL0TTOrSOdExMprIgf+RZG9WV9VkLcdrzMuP
	 3pa8fF0yYuueezvEjOxHR389d26LpvHB9lIWwCp9ipJ2i0hFxVxBXxBp2QVzciEKTk9mH
	 MyqQO4EUOdAYL1tqoWnRhyhIc1Frz/MEKogMG32/N/fIKXF0gFR7ArUGTvvmtXos+FR8h
	 GZujl4vT95s4RIMQd3olwYKsR2qdzZB6k2iNiJ1nm+P47dC9fbrFsttGi5vg06FWv9vKA
	 5+8egc/wOuYAXc8fs8A3QimgK940R5YWUlvZ9fuiui+03rIMU2ODw/WZ3fJ/XIepPbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794116459;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:User-Agent;
	bh=I3WRrinu/jT9Jg9NAfoNC4MFsm/rU54sJV2l8lqiR7g=;
	b=ZBvHxRQU/FOT+kxf8cMU9hdMU420DuC0kFWXj3K14BA0MfYmwpUqlVmJRcGP0xaYDEyV
	 jDtDrCi6xq4sbQi3fo3auPU11ACeQJddIlMneZLh5Jv0W2tDRUmDv3xLwa7LCcEyILfH+
	 RrX8xd3oV/579Rb32VioHN/edjsY5AuBERjeOIVJpoxhwkvUxg7iJHLYffiU6dVouQ0Dx
	 Q1hDFMSpXu1DjuS7lv5rk1jDPSAnkJ2Yt4Hureffod4qcndP03Tqy5/OCPbydjsQMKFit
	 3r8QoJGxS5hhd9+rHDUrCFy4KDQvby42e+qyJKJNHlqbud/WS6c+aiqT3smfC8yLz4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=N8mJQtvW;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB77606A31A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 05:40:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EB77606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=N8mJQtvW
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b09c07b3d2so119985a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 21:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794116459; x=1794721259; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I3WRrinu/jT9Jg9NAfoNC4MFsm/rU54sJV2l8lqiR7g=;
        b=N8mJQtvWxnysTtHwSJZoeu2dpC/Z2EeY/G+qYBoLA0KHgqQHR8NyBcaNBl8Dwpq62D
         LR9kmIKdTOdfKV0UXe8w4rlPK8EadFNs5EkvSr0t0puvu85DD/6PLCfW59XcCeLXDSga
         rwYpM39+SldIYZsmteLsb+Vyah3NBzFS3PHY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794116459; x=1794721259;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=I3WRrinu/jT9Jg9NAfoNC4MFsm/rU54sJV2l8lqiR7g=;
        b=bJZj39rethlz9xOWuZ+6xTuATu7yIkhz1ud/QNMqmstWJHOAGaMuGquLe35RCPeo0I
         IHPD+Bxry8mqqCtOwMSMom6ytWHYlWOVpMcGe8aJGOAsrNaDJfAHtaY9+nJ6TeQleirP
         90a2hTbSZJlPvCyRxZdQytU/JFIxwqWtKXOVGCBzE2yV9dG7oUF++PWgkt0mtGPdXZq6
         eubMr81MK4XuPotdLbk6lCesNr19iUC9EMzTaHDhOX1HygOJqxEMTNGBQvgwgxQsS3sg
         KKkT8ESETeD4OfSDN6CBJsbl0WHjY9hjOsi1lDoxYNqiMYxoXMPIkwJ6sj++YLg3qgQJ
         cTRg==
X-Forwarded-Encrypted: i=1; AL+hErHynmpkYuQ5p5AeaSJJ3nZJGukbKPOrRsiquQhUTdkojj7JaAOj0vw/s6SJKUXbs872VSKyWJ2ibzMakOo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+p4x/YMdD5T3/oPQDLcTZC8dJicnTFNmX5QkadHm7yGWY1n7cb
	U7BG74IL7EkzyiGqw1H+Kmm0+liwDFnkAnU2b77nEyuH8cZvXNQMjLzi9cCtSdLRTPw=
X-Gm-Gg: AYBFou1N8R9JwJCEr8OrCUirO4miggYpCzamA/UL6+Rgy7gx7F/t2ZHwf9FVhbNITMZ
	13t0IkwW3htmHr+N8FpKK4c81RmWyU2BqNGFt8AmEQmlffsUYxcqz+8vNCHuqZDw+sM2k6M4htl
	YWlaYx/lQtdLzBQ4A/UO3PwfMHgaHmLschLa2Pfx8pPOB99aUJSM9yn6eMiT9khSjSl2kFYTPQu
	d4fK39vgcZhQpLR3xOIcmNVxuySVFWUIM/9BbVh4rq+55kdDdIDvyo/LL4QBCU8zsFC8DuiIf8C
	SJqrh2Tcpow/4nuKEkICZOHPm6IekyjuHeSmNP+1z6dLAkpSOhKd8+9XfStVsxgY54l8A0/OGrG
	TvYg6e7sUoKsc8wNZP2u9Rn9P4XGPbZ8TFYi8RyvbjpsQQ65uRXRkVRXi7MhXD+mAy1+9KjzvFX
	zb/MxFK0pHAQekPV5pQiKHbiSRO+BnOKyU/aTee7b4CTtVW1GBFCuav0mNIjhhskwMcTfQGujUf
	4lDcupD0l9BHB5rcmCjKco20FCOCdn8/9HpT+aYfBXL91+cGhRz8RwCIapNWo+tJ4R/jQWEg+uM
	w/1B9c/fKmQrVPyYCGNq3TZYF4Ty0qXB2vUxRoDlpXkCPdxaiJNi0/gnsJDAGlqga44uT7YTu5y
	3Y+ike39C8GQu288vk8Z1kgnYjkbWjQNEMBCgCPQeDJlgRrTGcC4pWyGMZj7u/2FdmozHWp0lHU
	U5M8Wu/X8oUxgKke77w0GOVBivn4JL1vEBfOadZIPln+VGi0Yt9TIdNSnE+YF+072t6ej200m42
	A==
X-Received: by 2002:a17:90b:3b4c:b0:3a4:e735:b39d with SMTP id 98e67ed59e1d1-3b12d57457cmr400027a91.64.1794116458854;
        Sat, 07 Nov 2026 21:40:58 -0800 (PST)
Received: from localhost ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1278918e8sm1796511a91.5.2026.11.07.21.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 21:40:58 -0800 (PST)
Date: Sat, 7 Nov 2026 21:40:56 -0800
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
Subject: [PATCH] mm: memcontrol: don't lose track of exiting OOM victims
Message-ID: <avALaDR1_epaAfOp@chrisdown.name>
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

In tests I used a 64 MiB memcg with swap disabled, and found that the
OOM killer could kill both processes if the first was still waiting for
AIO. The first process faults in 44 MiB of anon and submits a direct AIO
read to null_blk with a 10 second completion delay. The second then
tries to fault in 40 MiB. The first OOM kills the larger process, which
gets stuck in exit_aio() waiting for the read. About 5 ms later we kill
the second process too, even though the reaper gets to the first one
about two seconds later. memory.events showed oom_kill 2 in all three
runs.

The cgroup iterator hides these tasks so that cgroup.procs doesn't
show processes that waitpid() may already have reaped. That's fine for
cgroup.procs, but the OOM scan needs to see a victim even after its last
thread has started exiting. We already have CSS_TASK_ITER_WITH_DEAD
for sched_ext, so use it for mem_cgroup_scan_tasks() as well.

With this applied, the second process finishes faulting in its memory
and memory.events shows oom_kill 1 in all three runs.

Fixes: a72f73c4dd9b ("cgroup: Don't expose dead tasks in cgroup")
Cc: <stable@vger.kernel.org>
Signed-off-by: Chris Down <chris@chrisdown.name>
---

Zhan's patch for migrating a process whose leader has exited also
changes this iterator call. This patch deals with the case where the
last thread is already exiting, which came up in review of that patch.

https://lore.kernel.org/linux-mm/20261027144016.2582880-1-zhanxusheng1024@gmail.com/

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
