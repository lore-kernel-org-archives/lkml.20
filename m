Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811533;
	b=zh8FIwxm3C7H8iTA6MuMo510VX47C3DQYae8U5kduWoyvpKja3ZxKScoBfQqD59sacsN
	 SBQsAoGkn36e6fgm387SbGIwJSwXafRzA+ydYwKAtysd76cXbH2MKhy5BQ1jAJoYEjli6
	 pkcaeA7jlgM7SWRGWIwnaqCD0zvI61PqgCeErFkVlPAeteqUfceZP0n+Nqsr4M6oubT1S
	 e+56op+2iqmGf5AQeZSQwRlIlAf3JsAiSvZKwQRwDnVhJXh/uLWJVKGgUtqPk9fMOmq9Y
	 dDJKBpbW8wL3Tw31vkXmhgpxlQ6n1vmKMObHT2S4ERDVjuYa+ICBxuN1opp2pRkcBWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mOm43uVjDHc2zReKMHzQN6iIWpo1wHm4zcoGnRZJRRg=;
	b=toLgojWun7YMifAZsH9TQepvm4r8RZkLBfgkcLwH7Uy/ISNIObsVytS9YMo1vnSjGvDe
	 K6HcLv9DNE7dYjmtSKknVRh5Nh0ifFIBRVhN0x8WyjB3SQjeIbNfkcQ5lHOZM1XwM0uwV
	 BXh2pUy6As8qsveJDdY0FIgXQ3x0+B19GOfHyDrItFtl2YJLOzA/1jQ6RwML/xspTk1Om
	 O2mXqItYjK92hPmi3urIjlQ9DyfcDCiUPa65hUOQCzDJS8VuyMrO4N2MTf02vBxNOBs/6
	 g8XCGiItbY0LRZcWZKMVYY200mbDQj8n6JMMlnuYk+Uu3gpdjyPC/oQ2aynMa440cGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ANygCtmE;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C49606D82C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:58:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60C49606D82C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ANygCtmE
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15ea896ddc8so1618146c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811532; x=1794416332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mOm43uVjDHc2zReKMHzQN6iIWpo1wHm4zcoGnRZJRRg=;
        b=ANygCtmEabL2DlL1vQlsQM2V0AtBPyADMKMlCJWmID9fbbwmQs5upuFgx6EU3yvhKo
         6caM3e2hkkYO5GJr7HHs+Js9ExbyddYDzxIlemrd8dAXA7Zu9APdFA1UHE8diifgdk8a
         lmdBb0VWG5nNoMzfJrINFe2jSCYp+laLzbezywwABqXJTWGEic2IdMbDjiSu5RV0+CVJ
         eIqDGjL4iNpOnsFQO7sePrDbbe2pzXFrEn6oNowXFyvwpyOWoIVbsF52+leys0IMgc2l
         DNaM0njeFmPb1ZBzxYZ6tHpA5QdzerC11YzE4j+NaXlXjJhySqwp7mgr6wcLnzJmPe3C
         ukow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811532; x=1794416332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mOm43uVjDHc2zReKMHzQN6iIWpo1wHm4zcoGnRZJRRg=;
        b=nK5JMMujmNR/9Udj440b/I8ARKGNHS5zER/1UQBrSGP3e41IYX0D3w5ayG6DaxmQ8r
         LhDNZk7aWrzZ1Gp3aqy6sBk1AK9o9OeTvN/QEFLfeepyjtmMKxdiBJ/s23NWxCiXQbiB
         xKy3q8EBEaZYx56hczch1ZX9xBfvxb0ugt1I8a1GHYGQxopz4N+IAZdOj9J1/afYL96l
         quT1vA5eaPqRiGIKcRTMtrbXEwXlyZi3sDrF8c0PxMOUA/8IHFxNAL+vW9lHbsNKKZMH
         +FlWJnGWqv7j2UW1MmHK90z09vkI5BOvRgSDIhB5WHUuSiU1xhHI3+kbE2exoz/KVpO8
         Nbzw==
X-Forwarded-Encrypted: i=1; AKwUvBxtbdLp0uTapUj82ftTffmLhhQviFMATBYzLQt8QaZdtHyJJk/lt5AF1rj/vh61ZBU6UzUJ+nvP5RqdsLY=@vger.kernel.org
X-Gm-Message-State: APuU4Z98gBDLPgMqwMdXmfW4AvDvIcdYuZayYzFKmeI2vhDCcup2i03j
	v/mCflyHKqmzSbOINa0ICaSzIByu/zhCUaie6Zg2vmhInHwhbnRsm8Cp
X-Gm-Gg: AYBFou1W8tBcZHcgiAGBwg/eK8cKOOug3/xlT01J9Hw+VRnaJm6hlxUgMA84QEZi8Lz
	iQlst2ABauW3ruMsb11hoGmeWXyiq1v8Pb1BSVqEpyvdVZ9n3K4172AVRJGxhRV8D9sbH0F5Av+
	DNcTWow2B1oc42IqTi4fiIY4DvRGOUFq/CJJ1o2tb3xqOy7/0kp44kcJI5HLx758zaqvghTSIl1
	hsQGmItoCU68MIgLqYBygWEH4YAzk+OS6rp/UAskxKS/+l4USuQLMDteU+VsiuXRAWJHqWvUEHw
	UmgCLquI3S/ehvpajmhUptfwC3HweYRe+ZLi7vb4uFrum1yp2hHd6zEnEXONEfADDJWMqeDcZOq
	/w8tbI8qKHvjHOUjBM2RjrpQ/a9kLW7V5LxncK4tmcjSIpz2+i+iBEdguYlHXu/3u2XIYtI9Vj9
	dA5xc/ygqbzW9tmV3sQbUaU3rGT/5ynft7q3wTyVDHJWeryr3EGgmBMpUQwBJ2dEewXPoBI5Txf
	26GF8RAC1i6aM1mKpEQvx3mOJg4dwVbtvcyjGzvcQrOZyM+YbA1YWwavjPwasjevpUHmMDVo9ix
	9wz8OV/cy18JhwSUyW1XfdzKzsDQItQ/lxj1qqWR78UaSOmQdRUISVEoDwVY
X-Received: by 2002:a05:7300:5b89:b0:36a:1732:1e7 with SMTP id 5a478bee46e88-36a424c7b7dmr37599893eec.31.1793811531717;
        Wed, 04 Nov 2026 08:58:51 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:58:51 -0800 (PST)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	boqun@kernel.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	dhowells@redhat.com,
	j.alglave@ucl.ac.uk,
	luc.maranget@inria.fr,
	akiyks@gmail.com,
	dlustig@nvidia.com,
	joelagnelf@nvidia.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	longman@redhat.com,
	rostedt@goodmis.org,
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 23/28] rcuscale: Add hazptr scale type
Date: Thu,  5 Nov 2026 00:54:41 +0800
Message-ID: <20261104165504.2430480-24-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104165504.2430480-1-kunwu.chan@gmail.com>
References: <20261104165504.2430480-1-kunwu.chan@gmail.com>
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

Add a hazptr scale type for per-writer hazptr_synchronize()
cost and per-reader hazptr_acquire()/hazptr_release() overhead.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/rcu/rcuscale.c | 67 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/kernel/rcu/rcuscale.c b/kernel/rcu/rcuscale.c
index 5659eaebc5c0..6e3e3f296f85 100644
--- a/kernel/rcu/rcuscale.c
+++ b/kernel/rcu/rcuscale.c
@@ -40,6 +40,7 @@
 #include <linux/vmalloc.h>
 #include <linux/rcupdate_trace.h>
 #include <linux/sched/debug.h>
+#include <linux/hazptr.h>
 
 #include "rcu.h"
 
@@ -460,6 +461,71 @@ static struct rcu_scale_ops tasks_tracing_ops = {
 
 #endif // #else // #ifdef CONFIG_TASKS_TRACE_RCU
 
+#if IS_ENABLED(CONFIG_HAZPTR_TORTURE_TEST)
+
+#define HAZPTR_SCALE_NR_OBJS 8
+static int hazptr_scale_obj[HAZPTR_SCALE_NR_OBJS];
+static atomic_t hazptr_scale_sync_idx = ATOMIC_INIT(0);
+
+struct hazptr_scale_state {
+	struct hazptr_ctx ctx;
+	void *addr;
+};
+static DEFINE_PER_CPU(struct hazptr_scale_state, hazptr_scale_state);
+
+static int hazptr_scale_read_lock(void)
+{
+	struct hazptr_scale_state *state = this_cpu_ptr(&hazptr_scale_state);
+	int idx = smp_processor_id() % HAZPTR_SCALE_NR_OBJS;
+	void *ptr = &hazptr_scale_obj[idx];
+
+	state->addr = hazptr_acquire(&state->ctx, &ptr);
+	return 0;
+}
+
+static void hazptr_scale_read_unlock(int idx)
+{
+	struct hazptr_scale_state *state = this_cpu_ptr(&hazptr_scale_state);
+
+	hazptr_release(&state->ctx, state->addr);
+}
+
+static unsigned long hazptr_scale_completed(void)
+{
+	return 0;
+}
+
+static void hazptr_scale_sync(void)
+{
+	int idx = atomic_fetch_inc(&hazptr_scale_sync_idx) % HAZPTR_SCALE_NR_OBJS;
+
+	hazptr_synchronize(&hazptr_scale_obj[idx]);
+}
+
+static void hazptr_scale_sync_exp(void)
+{
+	int idx = atomic_fetch_inc(&hazptr_scale_sync_idx) % HAZPTR_SCALE_NR_OBJS;
+
+	hazptr_synchronize(&hazptr_scale_obj[idx]);
+}
+
+static struct rcu_scale_ops hazptr_scale_ops = {
+	.ptype		= 0,
+	.readlock	= hazptr_scale_read_lock,
+	.readunlock	= hazptr_scale_read_unlock,
+	.get_gp_seq	= hazptr_scale_completed,
+	.gp_diff	= NULL,
+	.exp_completed	= hazptr_scale_completed,
+	.sync		= hazptr_scale_sync,
+	.exp_sync	= hazptr_scale_sync_exp,
+	.name		= "hazptr",
+};
+
+#define HAZPTR_SCALE_OPS &hazptr_scale_ops,
+#else
+#define HAZPTR_SCALE_OPS
+#endif
+
 static unsigned long rcuscale_seq_diff(unsigned long new, unsigned long old)
 {
 	if (!cur_ops->gp_diff)
@@ -1140,6 +1206,7 @@ rcu_scale_init(void)
 	static struct rcu_scale_ops *scale_ops[] = {
 		&rcu_ops, &srcu_ops, &srcua_ops, &srcud_ops,
 		TASKS_OPS TASKS_RUDE_OPS TASKS_TRACING_OPS
+		HAZPTR_SCALE_OPS
 	};
 
 	if (!torture_init_begin(scale_type, verbose))
-- 
2.43.0

