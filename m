Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794057454;
	b=sxw0fQw9A2E9TMzYQEu6bEyrLKHDVfkg3LKxloD8k+h9vYT+yeyVlJju2JYsUJvSHVih
	 ZpG760BQzr5k7gb73l2t6RKo5O8+yYAnODZIKFI8lgM+txmmtZhbqq0Vut8M5ZbdCpCgY
	 zvzDkcOxdyQOMOlWYirB+wh/myqYAMzXMVrsIgJMaiJzHY7AS5nCHOimJmESp8prMwUAQ
	 JHmXM4xUcNCg5pFZwOWI+HpvRmk6vf/Jey675Y5egJd+v/ctrIqEvWg0A4coACTnhMM3J
	 S3sqgqthHN6akHDUwBltTDZtKrB9b6OUQuWkcMThO7h7izdSh7WzQx6UMpKSGfCuSGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794057454;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QzumoAbO9NG/cegBxumiz71GDAJVD0gixQxGqBuh4Jo=;
	b=kbUBsvDNqTODkmVS0KGmIEoejEWEjF6bU+EGb7jTz6ADPVJb88Gaj9gj530tcTHAS5th
	 LaOiOx8d5mPD4MrMppdll5RWPCK1Q9FM8faEI6dKj7JwyYDBs9YX73wbO2pvFVYSAFGvv
	 nRTEsq6U9Upe4M/jNlOAq9ucvdHjciBGaEjey/R6FJtHZo94ajvbriFan6LQpGNH1nXaO
	 Kr9j+bYHqZaAFJjOs3rW7slipYg959CCDDNEVQ4GBKq4vsYdXiRsbPT3Noj4ZWNNtqvBc
	 a7OErk57liNIKIejXQj0rPPApIjVRXQaXxr16Z0OjVkH5q9CeKvKlP4m7ajdfL5sDeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DfurfJAc;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C6F606D818
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 13:17:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73C6F606D818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DfurfJAc
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so15685145e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 05:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794057453; x=1794662253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QzumoAbO9NG/cegBxumiz71GDAJVD0gixQxGqBuh4Jo=;
        b=DfurfJAc06ICG2Wh/z1HxUI1Onf7jVj3wETYHKPp/pvNUAy99rdwR2YXWAvBma24NZ
         Ux8RfqCMcxS4MvGW2fziRdY8yE9Xk0dZmHqIXy4vXzYyAgI+3n1p+4m9UrTfnjuOq1fW
         rRN33/wUlS6ZpRMnklrv7DrSCXsdy3A9L1Y45X9Y5/s+IypPnlGxf8MofDkfOcK+tOoT
         iUN++doVO5L2igS7QMef+uGW8JcCSdwp3TlpI0U4pqUJVowFmYi2Qqad4uIAXsh53yo9
         +/esM6448VTPgMwM9Isw92maQDXGEPCqxBs21z4dKpEAzqf4cgOpqo03fbfT7GENJ9Wi
         rKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794057453; x=1794662253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QzumoAbO9NG/cegBxumiz71GDAJVD0gixQxGqBuh4Jo=;
        b=KQMl79QYp3kAPxQqgqAm5HtW4wKizQ5mF5eoM03Q+fHTw8gQAakDmO4I0V7/Wol5aZ
         5doVuVtqVdbjzVZFUj3+4a8hYYnPIPL5HaAWAK1Q2GpGrZeLNUgsrCqeeo//B6o/eOQw
         kb6QRP1uTbJTBNkh8/Zf+ek0tMUktccEK4RgnfaymEVRYB3OJxGBinoz2cUx7P3MSING
         KwfrHcT0WwPx6dUkPrFKWlig1KaBnFV0YEINtVZYgkF9/GdvAnJmI5600spxryF1PaHL
         Ta6I3UQVh36jhkh0AVECVjMlCgk6qolrA3b7D/Yaku7UyT6fYgWeQTBsJ05iiQvGfFa2
         tlqA==
X-Forwarded-Encrypted: i=1; AKwUvBwjNnlsaKuuIUFQJidJ26wA8EuAEaPvLr02Q7Pp57YZ/9M+PL9oFtetbP3uhh1BO6MoI/qHZ1Y/lPjT044=@vger.kernel.org
X-Gm-Message-State: APuU4Z9I5KBPohxw++xApUW7ynUXVFKZjJETLNGjcVDEvRB5/s0jn+c6
	hesLHL+QDX6Iv4ZcFkk8s31NGLzdeEplzCl+Dssnkixd1UicBqkdzczb
X-Gm-Gg: AYBFou2NW3SBwZS7f0w26UenmOTvz5T24EZUy0UvHqDw6/Ib2vg8br+ALisMM7PV1fG
	q8rUhCmC67U0wlZ4U83TaRqdQQB5nBcb/PnSmyVLYw9GT5tXPFIlKXbUh6Led5ROygy6OSgrAr7
	rX4zeZcC8+R1tj6FbpQBA7+Yqv0NxPsNH406z5h/KBHhkBTbhjzZZ0MkWEsJPBtgjf7jm5z1rWF
	DUUgFGC6jExzAwbiKwrZQns/lL0fcOVrFgcEw517CbZ90qTIghIkhSL0rZExr461W/rgon9c1lp
	iv0WjPghib6kG2YDKt3gQUSqCb7+GfIOBWHQO31eg+Y+yt7e+cGfstvgDHO2vwmPamrAc6+wmp2
	zm2FZ79zRE8ancpSNXnvgE19r8XU3ZMYCKrV78r1aYPiagySvYBzQIccYZY2LvqHmREefpzYSS1
	/zaDyBeTXjVBWXcrB86vMIBT9kBDmg/1UiOZw8coqKmtStRbG/TiOSxITRNnFHnC+tHO/rzN1gg
	Nh5+ftfurfbw1oQkuZj7moxZEmkFWlyxk1wTyfyu/JmvtXVmpfAlDY0NXUUWyEjs9Sp7zyMKY47
	zuztodN0K17fOM3VJxy5S00DRoPnCIUHp+1vOs2clN5Y+h5RBM5DBP8pnwJ9UI4P6g37Cm8dovT
	fbrk75yYz+ewgEibmDS7f50gwrESUVv3UMbrLysaH1gsYXC+XBit8zndg7e6YY3HPuijKnQ/rpz
	DZA46wGcrxGchbjz79NJdB4VzoLx6GxNQ=
X-Received: by 2002:a05:600c:4ece:b0:4a1:a6e0:4ce4 with SMTP id 5b1f17b1804b1-4b6e035effamr93976305e9.33.1794057452720;
        Sat, 07 Nov 2026 05:17:32 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-b149-1401-90c6-65b4-035d-1e3d.310.pool.telefonica.de. [2a02:3100:b149:1401:90c6:65b4:35d:1e3d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e3279f9csm65132675e9.8.2026.11.07.05.17.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 05:17:32 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Marco Elver <elver@google.com>,
	Bradley Morgan <brads@mainlining.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	linux-rt-devel@lists.linux.dev,
	kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/6] sched/core: Pause KCOV in __schedule()
Date: Sat,  7 Nov 2026 14:17:08 +0100
Message-Id: <20261107131710.89264-5-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261107131710.89264-1-kmehltretter@gmail.com>
References: <20261107131710.89264-1-kmehltretter@gmail.com>
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

kernel/sched/ is built without KCOV instrumentation, but it calls code
that is instrumented with KCOV, such as sched_clock(), architecture
CPU-capacity helpers and profile_hits().

During preemption and schedule() calls, these callees can add
nondeterministic scheduler coverage to current.

With CONFIG_KCOV_SELFTEST added to x86_64 defconfig, the interrupt
selftest fails under QEMU, detecting spurious coverage in
arch_scale_cpu_capacity().

Annotating each callee would spread exclusions across architectures.
Pause across __schedule() instead, extending the scheduler exclusion to
its callees.

KCOV_PAUSED remains set while a task is switched out. The guard in its
resumed __schedule() frame restores the prior state.

Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 kernel/sched/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 3f13170c2939..1691eb19f31a 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -7219,6 +7219,9 @@ static void __sched notrace __schedule(int sched_mode)
 	struct rq *rq;
 	int cpu;
 
+	/* Callees instrumented with KCOV would leak coverage into current. */
+	kcov_pause_scope();
+
 	/* Trace preemptions consistently with task switches */
 	trace_sched_entry_tp(sched_mode == SM_PREEMPT);
 
-- 
2.39.5

