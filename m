Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793960146;
	b=zgwi8wqA5gEvYWhyyp6tViIjdaRP1xV5App/WzZCOa2yK6xdgf8vW7i3s8kMI2rSDVrp
	 n9pG8OVFMelxVxgmkeldkk6aNE2WH2V9yOE3NhP4+h81Cqac/1/nWrkCxBagz7iIQ3YkR
	 OanXG2dKc9ass+cGHBhI8fEy3Std91XmPR8xQ5s7jMIDJ9JkQP/8S9XOlyPssnb3R9tCx
	 Pq5jhqv6oZjxS5pLgsHtTjLK0/2aW8Lx5DXd6qf41UAvqC4iS7gAZLNsim+Cz2vcnvPjY
	 9q8Vg+uyV7bjFP5wAcS18LUV3hmTab/NVnKqZPMTpST/8xSavXaLIdnmB2yhuH/wjjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793960146;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yY4sdtE3dBVPlQLRrDOshaKq5NhLj8R0ice8LmyGNbE=;
	b=br0amcCpo5dI0UthH7ojwMM91kljpC87RizZJP6jyBUL0VuighOllPTfcOcbMfqB5PzE
	 V0rxzs9SlpeaqwNKBEP2HYh3cGHkiuB9PoL4FeJ8CarqPZ9qv4rBIgD3RklU3mOjZ+wsW
	 ZUk7GNdLEGSthxzIJdFb/7e1aZjhtRZI4cvcG2H2doOPSY6cr/Vqyd6P84RzMMQ5oXP+c
	 3S+r5BYol6WqfwUBAlHvRCXsGNRX6V+E42SZdgMhIdDadhsu7ZTOLHaUr9AkefCp23qLB
	 2Pyw3ObPJt3ZnL4QLI7XsWGc98vjwKBO3s7M5ODTuAil8wnHK5grRSrKVBuS797qtDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wg3LH9M6;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC04606A33D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:15:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCC04606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wg3LH9M6
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-353804b591eso876503eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 02:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793960145; x=1794564945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yY4sdtE3dBVPlQLRrDOshaKq5NhLj8R0ice8LmyGNbE=;
        b=Wg3LH9M6tfBjq5I4/bIE1uXcaFA1fgWulMuDqKjZwcTyHdAE33i9Yl89ZkiXo+ioBY
         7kZBGgCeIEe8feUN7hAh4MZFZXt93GYyYJ8fWqOgpZ6jl07Lon9ANCC7G7ZasRUWBKtO
         t8g2p4TgW0znUxdTTLh+WFJnurSIJZ24yAoRtiqGG+l6qISDPIwLa0l72m5yuhTGPOKS
         FUT9uSnozdN9TJMlh1NMUoEv2Empyc1nW7WLvnhwCpgxRPQucCxYEJ4d2xZCGOoZdeDy
         OoHvbTxegXOxu0SXvk+cxei2jAM2TconBLaWDTXZj4QxSltnpkRIfwqCAWJRDXB0J8wC
         sHaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793960145; x=1794564945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yY4sdtE3dBVPlQLRrDOshaKq5NhLj8R0ice8LmyGNbE=;
        b=S7QKlYaAR6l2k6JbtE3oY/Xwk5rsrFtJzluSoex8OPQEy4f6MjbDEy5tC29teLZHxQ
         Tp3hWsIQaxPUYxqbqrFpQ0RI+3YM+pydhFCD6tbXObzr+02nmmR6jpb71JAtu97cvFBa
         ByENf4SYWK0OnlNXlB0dO+Ykl3fXp2PIVci8FE1bZjsxajX/0tsb0maYmL3+6ACKX4Pm
         e2qDV1ym2T0e1jvqaziFADUMUWLkBqbtSinHdHtF/Wd9UhcYRH9MptiyJhVNzucdzW5i
         xtkPZOrc9SI+hfjQ1AJ/1qNDtyobRbksj5QrhWxA+UTtdU46qOafKD3b4y6hcW71/lYf
         vdWw==
X-Forwarded-Encrypted: i=1; AKwUvBwJijdglYnIlIWk6/Dj541wGbxYj5di7m3COjrGccaZY7aG7QSTOe38AGdVT33kt72UHOI596GMFej4Kv8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZqzdbRfLgD5ZHBmiMIUJl4q8tLr9uzlZjrOFqEQsYM8+okdpb
	IGPtZbOZwEcqQPvqlsEeLnC79n0v9Abt93lVQFSn/tPEJ2UCXFa3e60p
X-Gm-Gg: AYBFou1QCflofP3fVcQuM/4AKmTPk4YPx4+OlWKCZ+7DHl99XfWajXc6JV0e3HoagzH
	s2VG+VEiyVoceJ+u+1w3wf3EBP/DC++CQZfs6hq6rtRZAe+GGr2NldGZT0MXb58CDNUlkUn9nlp
	LIGj6rxz/D3YxxGYvPv4g14u6WOJ7Mjv9BG72oLzt64LXCAys1C8SVH1RA9fBWsxxb+U/AY+9Gl
	XIsPbiAaAGYJXqpCaBpHuc5TUuAIWZ0XXzzvyEUkIwGEkD4NvogcDhbaBm9hm1IVzLbv5NXkdL6
	1MJmq2ye1AZYEWQWUhh2rl7RWyR2lQyGxhVmKi/+/WUZMNHvoEjUw5mOrQVmwKZwtXtNJ1+tyKv
	f1eFxW/JcEwu6trTcZ2J/th+6DbiTtjHlbtz/W8JkGmtfqDbuu9HlpKJc13x1bFY1wVBsi2fzXi
	sD2uBxZCcs+nr9xByaU9GEyvSxhThivUCU0LgWCgPvSTzDm2cyG9OliUDr3apLfP0Kx4LVost/a
	piC8JB2CenEkuJjbkmoGmC5XgW4v7PZIYe8PVnpajYRK23rnV7d/19srNl1toW/leJCQLMuYwSI
	dUKZrUFU5F6olKt3GhXnDypNBGYadlne/g98+v9NhVYuY2Hh4Q==
X-Received: by 2002:a05:7301:4709:b0:369:d8e1:7bb6 with SMTP id 5a478bee46e88-36f75a25e2emr2791294eec.25.1793960144628;
        Fri, 06 Nov 2026 02:15:44 -0800 (PST)
Received: from localhost (vps-56c092c9.vps.ovh.ca. [15.235.184.193])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9fd0000sm4681361eec.21.2026.11.06.02.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 02:15:44 -0800 (PST)
From: Phat Dinh <phatdt1116@gmail.com>
To: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org
Cc: security@kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] perf/core: Do not resurrect cpuctx->cgrp after last cgroup event exit
Date: Fri,  6 Nov 2026 17:16:42 +0700
Message-ID: <20261106101642.494674-1-phatdt1116@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

perf_cgroup_switch() relies on:

    /*
     * cpuctx->cgrp is set when the first cgroup event enabled,
     * and is cleared when the last cgroup event disabled.
     */

It computes the next task's cgroup, schedules out the CPU context and
then assigns cpuctx->cgrp unconditionally:

    ctx_sched_out(&cpuctx->ctx, NULL, EVENT_ALL|EVENT_CGROUP);
    /*
     * must not be done before ctxswout due
     * to update_cgrp_time_from_cpuctx() in
     * ctx_sched_out()
     */
    cpuctx->cgrp = cgrp;

However, ctx_sched_out() can disable events itself. If a cgroup event
has a pending disable from perf_event_disable_inatomic() (e.g. its
PERF_EVENT_IOC_REFRESH limit ran out) that the irq_work has not
handled yet, event_sched_out() consumes it inline:

    if (event->pending_disable) {
        event->pending_disable = 0;
        perf_cgroup_event_disable(event, ctx);
        state = PERF_EVENT_STATE_OFF;
    }

If that was the last cgroup event, perf_cgroup_event_disable() clears
cpuctx->cgrp:

    if (--ctx->nr_cgroups)
        return;

    cpuctx->cgrp = NULL;

and perf_cgroup_switch() then sets it again. cpuctx->cgrp is left
non-NULL with ctx.nr_cgroups == 0, so the NULL check in
perf_cgroup_switch() no longer catches it and the next switch trips:

    WARN_ON_ONCE(cpuctx->ctx.nr_cgroups == 0);

cpuctx->cgrp does not hold a reference on the cgroup. Once that cgroup
is removed, the next ctx_sched_in() dereferences the stale pointer:

  BUG: KASAN: slab-use-after-free in ctx_sched_in+0xb1f/0xfa0
  Read of size 8 at addr ffff8881008972d0 by task swapper/3/0

  Tainted: [W]=WARN
  Call Trace:
   <IRQ>
   ctx_sched_in+0xb1f/0xfa0
   perf_event_sched_in+0x1a/0x70
   ctx_resched+0x32b/0xac0
   __perf_install_in_context+0x475/0xab0
   remote_function+0x105/0x200
   __flush_smp_call_function_queue+0x179/0x8d0
   __sysvec_call_function_single+0x1b/0x1c0
   sysvec_call_function_single+0x66/0x80
   </IRQ>
   <TASK>
   asm_sysvec_call_function_single+0x1a/0x20

Only assign cpuctx->cgrp when cgroup events remain after the context
has been scheduled out, so that it stays NULL as the invariant
requires.

Fixes: e19cd0b6fa59 ("perf/core: Always set cpuctx cgrp when enable cgroup event")
Cc: stable@vger.kernel.org
Signed-off-by: Phat Dinh <phatdt1116@gmail.com>
---
 kernel/events/core.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index f36a3bbaa33c..54b87584c752 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -1072,8 +1072,13 @@ static void perf_cgroup_switch(struct task_struct *task)
 	 * must not be done before ctxswout due
 	 * to update_cgrp_time_from_cpuctx() in
 	 * ctx_sched_out()
+	 *
+	 * ctx_sched_out() can consume a pending disable and drop the last cgroup
+	 * event, which clear the cpuctx->cgrp. Cgroup tracking follow active cgroup
+	 * event, so do not resurrect it
 	 */
-	cpuctx->cgrp = cgrp;
+	if (cpuctx->ctx.nr_cgroups)
+		cpuctx->cgrp = cgrp;
 	/*
 	 * set cgrp before ctxsw in to allow
 	 * perf_cgroup_set_timestamp() in ctx_sched_in()

base-commit: d095321349222961813333277881b3c74f10b17b
-- 
2.56.0

