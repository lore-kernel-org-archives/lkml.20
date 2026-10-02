Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8FF5013D1
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 17:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961056; cv=none; b=lbKqgT9zxGEbV+7j5DgugWkhvFsnulbhAAPxt4yoPmrqY6CeWjjSG/mm1Jgq6p8sD1Nwa67fEUo3cebltT8z2Bj8ygr+gzdekI0/jWdSUMlKqzwE+o/u0dB9QmjiJt5kT/6PSnSwv5ntLSrWiVQQgCMF3tj2x83Qek3GCck3HMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961056; c=relaxed/simple;
	bh=9oP9VQ+JM/9PdWJ+5+ZGbwB85sJAY1eTAyp/fwZIqqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EaCxuCJS7vrVBeRwow3w+PpTIbKV08KG5FHmfH1f27jjueTFXzdDz6TG8C8DEM5kAoommPmntbHlWh88TmSbehwLd5UHWlpmXM2qKlhoJdZa27ZhW+YcPRNgkw6nqdRy9/Gwy2Uk2X8u0x9B1iAcqTuaybGH37P2XCSElD4D2bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PTDS2njE; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PTDS2njE"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398b3b189e0so112165a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 10:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790961040; x=1791565840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mAD1Y95K173b5qZp91CTYZls79sZInjIuGPu7Lg5CCM=;
        b=PTDS2njECMv+y9/XkEXZ6VHGXO75v/cXAKGDvLPQ3OIMWMWqN2J5Fd90x7GynHc3nA
         ExjVbNYyrKMAhrxfagH3HkdTxXi/nBzMjIgilDoQ2/x+EU1Z6iXAINhQZXcWspJ2oY0T
         roNzx4v7YvKcvYhoh4KRItOGOcHZPsq8PivWf26b9fNH/Wso8Hdpxm/Szm20MtwOBcyw
         4nbXxNYZrTygmZ+79VwtpMm3rWOXl7F69yvXjxP+B7yinvFbs/eD8YVtGvA2bMIcGPyH
         PFlIETNnA7UdDtKRuQ+dCpbTBFjBLimJzRcQogBmd+LBfECMPdDkZjG6iEGr3OTF63+G
         hPWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961040; x=1791565840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mAD1Y95K173b5qZp91CTYZls79sZInjIuGPu7Lg5CCM=;
        b=R8k8LamlkHT+eozrQToH3T2bTCsAad/4fQSLW0Xa9WJ4iNKZzFz8x/eIB49KvfjEeE
         KaPVmY1OQbq/WeR9M1rVrSL+ViwEro6jYYlVhsG2v/lO+lhGyKpBTXVFRyDFn0i9c3d/
         5/r/M9+Ctf+wAo/9g5nVJrJgdFPubn/yKDRjVTtWE6uRWNptDBKMuTiDW9tjJnD5egYA
         fsAjU9ZZgmNjtirenpnmjMSmaRrlM3uJFcku4H1DrPj4hU6punYw9SxzKUpnCc9Dlcxo
         RfqjUJZww4TRbdO0GI1SgTMbkG8LI9Sx16/Dafbvm9MoYfaiZSp4yxPO5YuHV26QZciK
         KNJw==
X-Forwarded-Encrypted: i=1; AKwUvBxEXVj+fPovXotUjhcnnd8xrqehYDCB260COUnSXiy8NySy8JXroPI508tUeEACMUPkvUOXfUgSf1Ik+GE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJx2hZ6Rx3sGGJgicBxQKJa17n+5PV3KpA0T6JLN/fAV+RHVYMg
	P1q+0mv1F8ldOVnewdFVt7wY8Fuoni0dLojIbFq9Uy24zgEb8wmm9zNH
X-Gm-Gg: AYBFou1DWPtJTSjIcaPau3jjj73Med4GC82We/7fII1ms8TnPGjtYLo0Vsy5E2yWCKc
	WxW5SN7V6dFzFtBw8lJm5+CSQN0MT2xx6/gSsRrmx435iqTzBZAj9ozRR3Lgbk3NAUhzpC/vjP0
	P7RTyyqwbTNp2w/z2RimNH0Qv6rxQWCNTXK7b+f/bPIZkBOVDb+AtBAZb6LAYD8Z3bQ1d9rb+yo
	gMaKKn7SCrFVNyd0vm6wVCeVbV4Oh02grfzlvf2pDkg6Uz6KsARezdApkjCGIzmtKk7AQcp1Viw
	UN0Fnsys7SIghWl3pX2xaKfYE3OwNKxaOPrUZpzZUjKHNEYTMDw6kULbm5kkQ15XQxyNom2POcb
	vMzT3ogvGIpL7XCmEOtHMzWyN5a34sWZGe/IK9seImhwgDIjSwnvEzyRlv9/0cOgcy9tN28PR6F
	4gqT412pgRQoGHnq4ofpiCpNg3I3OdhNt3XUJ9o87oL9rgvENQofDKjh29fOmAaOtnrBLimSodi
	yybhYbhbou2VLztJ2Q=
X-Received: by 2002:a17:90b:2fcb:b0:3a7:f45:5cc8 with SMTP id 98e67ed59e1d1-3a70f456851mr373445a91.25.1790961039819;
        Fri, 02 Oct 2026 10:10:39 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a7024d0f5fsm1597719a91.0.2026.10.02.10.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 10:10:39 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net,
	lianux.mm@gmail.com
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	peterz@infradead.org,
	boqun@kernel.org,
	npiggin@gmail.com,
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
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH RFC v2 09/15] rcuscale: add hazptr scale type
Date: Sat,  3 Oct 2026 01:08:41 +0800
Message-ID: <20261002170847.3653663-10-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002170847.3653663-1-kunwu.chan@gmail.com>
References: <20261002170847.3653663-1-kunwu.chan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add hazptr reader and synchronize operations so that synchronize
latency can be measured alongside RCU and SRCU.

Use a small set of objects so readers do not always protect the
same target.  Each reader protects the object selected by its CPU,
while the updater round-robins through the objects.

Use hazptr_synchronize() for both normal and expedited scale
operations, since hazptr has no separate expedited operation.

Link: https://lore.kernel.org/lkml/20250625031101.12555-1-boqun.feng@gmail.com/
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/rcu/rcuscale.c | 70 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 69 insertions(+), 1 deletion(-)

diff --git a/kernel/rcu/rcuscale.c b/kernel/rcu/rcuscale.c
index 1097ec15879c..5aca31c3c01d 100644
--- a/kernel/rcu/rcuscale.c
+++ b/kernel/rcu/rcuscale.c
@@ -39,6 +39,7 @@
 #include <linux/torture.h>
 #include <linux/vmalloc.h>
 #include <linux/rcupdate_trace.h>
+#include <linux/hazptr.h>
 #include <linux/sched/debug.h>
 
 #include "rcu.h"
@@ -418,6 +419,71 @@ static struct rcu_scale_ops tasks_tracing_ops = {
 
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
@@ -1110,7 +1176,9 @@ rcu_scale_init(void)
 	long i;
 	long j;
 	static struct rcu_scale_ops *scale_ops[] = {
-		&rcu_ops, &srcu_ops, &srcud_ops, TASKS_OPS TASKS_RUDE_OPS TASKS_TRACING_OPS
+		&rcu_ops, &srcu_ops, &srcud_ops,
+		TASKS_OPS TASKS_RUDE_OPS TASKS_TRACING_OPS
+		HAZPTR_SCALE_OPS
 	};
 
 	if (!torture_init_begin(scale_type, verbose))
-- 
2.43.0

