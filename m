Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4920C334374
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 06:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788847465; cv=none; b=bfqclGRjw2bedzwu1nbSLM1PwFAPDqbcm4GUP+8jvjCAxlFjhwu+iFNJEinZZw4EwQafOajT+FaGKTNqz2PdHCQ3M7SqJSbeafHiefy8MIClV6K1VQFBbHqgnAWOnDePPDbRiA20oDbmqUgQ+n1Bk0oscrdi/AK2iyxU4Xecats=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788847465; c=relaxed/simple;
	bh=sWXCfu8FwHMoSU3G2XuP8pA5+VU1Ub4UjWZZpjiBNmo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y/iMWEyJLB5Isl2kgWufkZ9zusgoWFhoYHlNEjJ2O5+Gf8AHzDx+T3esTj/+ZNO6LZUxRbIVVrus+3brzNo2HuTqdIc9Z4cX0MrKw8LsdQfssbtRx2TgReQkCHzd0Vj3ALe5mhEbnDcaf/x8wUX3QB9pFAvcDWdEKgYEYjQ90yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WCs+jezj; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WCs+jezj"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38e041ea211so3315573a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 23:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788847464; x=1789452264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CdJpPQMHra+6KUNfJHNv+LpTpcYtMxeyZTHJMP8o2QA=;
        b=WCs+jezjWZwNkuED+E50I8y3Xm3H2z5nmxsIzc28DGOBfrbb94G8Vjac6LWqzkGsuT
         Sr4JVis39AXi0MB5y/8l78UXKlDme2TtMsc42S6WL4UiuuMLBzPQxjF4Gqgq+oaMwuVy
         ToNObICta4sovAL6/CSkwS7BowA8dWHLL67nl3A8tkRT+s1QO8zYEcnl3gU/5NrMINV4
         386iFuruA093nNNzpckFAEixZ8eVm1cWsNpN1WHTTi7bvqUmW8ed2JgiSehhV7WA3eo+
         ORt/ILDiNhdrAhBIsQk1nhxNn30/wy1KeXvugVVSlnHqcb+7Lz5lUnUkb0YoaEwv+VQl
         BoMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788847464; x=1789452264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CdJpPQMHra+6KUNfJHNv+LpTpcYtMxeyZTHJMP8o2QA=;
        b=I0PgCXSWoDXqD+O6hOiW1qw8VVaY5KYn8HWNCgZxpZuG82N4BmLHxCk3weVmJlyD/r
         qmJk8i5zS8kJPxv8nONf1Ps2Jtjpke1y9mDpJQl+wySjKZYlAX4aGCh4Q4Sqi0+R5fuZ
         7NfHuRnfeE8ENuGJDGBcXWE249EM7R1FSXJHk0A0DrCHtzWx7cOa1FcWiFwVYYd/rzN1
         p/GlxkE4JHilaaY881juC52JIDKFbzfNx9XKZi9ibBs6alCFX5rGsHd0NeciqEb3l1w6
         idcJDZGo21tRo4D/wBVfYFg/Ou3ajwSqrAJLixYaSoU0cuSpAWF8sJtXEKgTyJt71rzz
         9GJQ==
X-Forwarded-Encrypted: i=1; AKwUvByxVHWLwoxBwOvZhLBZGI3v8o6kp0HIWTxVZ3tvykqeqF36Lawe8Ma8VhHJ77FohdmDMcFIPaxvn25dw9w=@vger.kernel.org
X-Gm-Message-State: AFuF++nTWSPc2WfvMrJRlYN67ne/gnthcoa0crELHSfh7PYSsZvuRmz7
	2LrcrCxi86wPTtKZHQzxopgsyAhAQvCQVRoPU8OCBjSD36yeK7q/DcQD
X-Gm-Gg: AYBFou0ckVW6e4wB+UCYK449kA8QFcXwBmWYbC1FeCp/7jnHTZ+baRnuMK7UlaO9Dyg
	gVmzEcmnLxmwTjej4yHfQX2Nvhl03fHiKVavbm6+WE/Rc+K0fSnatw8WQ9+CmxaxWqQOINmbAB+
	r1lBL9x6YWWTrMYmSc5AwgQlCj/jCqhEwHwkEOjnfL5qaoZaYZ3mSwG61bc0s+kjwyWl4lv72EZ
	Tr1EOMCj5fevROnM8QZc2rBFF6uPUt8gy9xh/5Nswj5GAzcA8aULId02co3tO+6FxnhE84sitFn
	uKqbRfbHFiyxtQOT9cgFUCKQW7OZF3f49DznPAm6orA6c1CujT4cDCco/kp1nHDLZbcR1RK3STI
	5JrUm78SKhieEVIHmKavckR740gFdCzl3KSXqKVtgg9grxnykk1DbkZwHOapcApThA1JVvkyoPZ
	MvydfyQXK5gvXDqcfZy174ulJoXY3gxgZgHuJAsB8EjhRLUZZOBs960u53qi6ojUlaLhnsMtHw6
	V2kDktWrtqWNFZQe9cfLvuUvewWxLG1Ogy5ta6o
X-Received: by 2002:a17:90b:4c4e:b0:399:1b64:e0d7 with SMTP id 98e67ed59e1d1-39b262aaf32mr41697028a91.19.1788847463386;
        Mon, 07 Sep 2026 23:04:23 -0700 (PDT)
Received: from localhost.localdomain ([2409:891f:9124:20e6:7861:48bc:cc17:ca2a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm24617396a91.9.2026.09.07.23.04.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Sep 2026 23:04:22 -0700 (PDT)
From: Chuang Wang <nashuiliang@gmail.com>
To: 
Cc: Chuang Wang <nashuiliang@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Willem de Bruijn <willemb@google.com>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	Hangbin Liu <liuhangbin@gmail.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v9] net: reduce RFS/ARFS flow updates by checking LLC affinity
Date: Tue,  8 Sep 2026 14:04:00 +0800
Message-ID: <20260908060410.3982-1-nashuiliang@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current implementation of rps_record_sock_flow() updates the flow
table every time a socket is processed on a different CPU. In high-load
scenarios, especially with Accelerated RFS (ARFS), this triggers
frequent flow steering updates via ndo_rx_flow_steer.

For drivers like mlx5 that implement hardware flow steering, these
constant updates lead to significant contention on internal driver locks
(e.g., arfs_lock). This contention often becomes a performance
bottleneck that outweighs the steering benefits.

This patch introduces a cache-aware update strategy: the flow record is
only updated if the flow migrates across Last Level Cache (LLC)
boundaries. This minimizes expensive hardware reconfigurations while
preserving cache locality for the application. A new sysctl,
net.core.rps_feat_llc_affinity, is added to toggle this feature.

Additionally, export sock_rps_record_flow_hash() and
sock_rps_record_flow(). This resolves a symbol visibility compilation
error triggered by 'tun' using sock_rps_record_flow_hash() in
tun_flow_update() when CONFIG_TUN is built as a module. The same logic
is applied to SCTP, allowing it to use sock_rps_record_flow() safely
when built as a module.

Performance Test Results:
The patch was tested in a K8s environment (AMD CPU 128*2, 16-core Pod
with CPU pinning, mlx5 NIC) using brpc[1] echo_server and rpc_press.

rpc_press Commands:

  for i in {1..8}; do
    ./rpc_press -proto=./echo.proto -method=example.EchoService.Echo
    -server=<IP>:8000 -input='{"message":"hello"}'
    -qps=0 -thread_num=512 -connection_type=pooled &
  done

Monitor mlx5e_rx_flow_steer frequency:

  /usr/share/bcc/tools/funccount -i 1 mlx5e_rx_flow_steer

Frequency of mlx5e_rx_flow_steer (via funccount[2]):

  Before: ~335,000 counts/sec
  After:   ~23,000 counts/sec (reduced by ~93%)

System Metrics (after enabling rps_feat_llc_affinity):

  CPU Utilization: 38% -> 32%
  CPU PSI (Pressure Stall Information): 20% -> 10%

These results demonstrate that filtering updates by LLC affinity
significantly reduces driver lock contention and improves overall
CPU efficiency under heavy network load.

[1] https://github.com/apache/brpc/
[2] https://github.com/iovisor/bcc/blob/master/tools/funccount.py

Signed-off-by: Chuang Wang <nashuiliang@gmail.com>
---
v8 -> v9:
- fix errors in AI submissions by Simon Horman
v6 -> v8:
- simplify code and fix errors in AI submissions by Simon Horman
v5 -> v6:
- remove the multi-check 'old_val == new_val' by Xuan Zhuo
- fix 'modpost: "sock_rps_record_flow_hash" [drivers/net/tun.ko] undefined!' by kernel
  test robot
- fix 'tcp.c:(.text+0x3e90): undefined reference to `sock_rps_record_flow'' by kernel test
  robot
v4 -> v5: fix 'modpost: "rps_llc_check" [net/sctp/sctp.ko] undefined!' by kernel test robot
v3 -> v4: add rps_llc_check by Eric Dumazet
v2 -> v3: patch net -> net-next by Jakub Kicinski
v1 -> v2: add rps_feat_llc_affinity; add brpc tests
 include/net/rps.h          | 29 ++++++-----------
 net/core/dev.c             | 65 ++++++++++++++++++++++++++++++++++++++
 net/core/sysctl_net_core.c |  7 ++++
 3 files changed, 81 insertions(+), 20 deletions(-)

diff --git a/include/net/rps.h b/include/net/rps.h
index e33c6a2fa8bb..fc301ce3987d 100644
--- a/include/net/rps.h
+++ b/include/net/rps.h
@@ -12,6 +12,7 @@
 
 extern struct static_key_false rps_needed;
 extern struct static_key_false rfs_needed;
+extern struct static_key_false rps_feat_llc_affinity;
 
 /*
  * This structure holds an RPS map which can be of variable length.  The
@@ -55,11 +56,14 @@ struct rps_sock_flow_table {
 
 #define RPS_NO_CPU 0xffff
 
+bool rps_llc_check(u32 old_val, u32 new_val);
+
 static inline void rps_record_sock_flow(rps_tag_ptr tag_ptr, u32 hash)
 {
 	unsigned int index = hash & rps_tag_to_mask(tag_ptr);
 	u32 val = hash & ~net_hotdata.rps_cpu_mask;
 	struct rps_sock_flow_table *table;
+	u32 old_val;
 
 	/* We only give a hint, preemption can change CPU under us */
 	val |= raw_smp_processor_id();
@@ -68,7 +72,9 @@ static inline void rps_record_sock_flow(rps_tag_ptr tag_ptr, u32 hash)
 	/* The following WRITE_ONCE() is paired with the READ_ONCE()
 	 * here, and another one in get_rps_cpu().
 	 */
-	if (READ_ONCE(table[index].ent) != val)
+	old_val = READ_ONCE(table[index].ent);
+	if (old_val != val &&
+		(((old_val ^ val) & ~net_hotdata.rps_cpu_mask) || rps_llc_check(old_val, val)))
 		WRITE_ONCE(table[index].ent, val);
 }
 
@@ -136,25 +142,8 @@ static inline bool rfs_is_needed(void)
 #endif
 }
 
-static inline void sock_rps_record_flow_hash(__u32 hash)
-{
-#ifdef CONFIG_RPS
-	if (!rfs_is_needed())
-		return;
-
-	_sock_rps_record_flow_hash(hash);
-#endif
-}
-
-static inline void sock_rps_record_flow(const struct sock *sk)
-{
-#ifdef CONFIG_RPS
-	if (!rfs_is_needed())
-		return;
-
-	_sock_rps_record_flow(sk);
-#endif
-}
+void sock_rps_record_flow_hash(__u32 hash);
+void sock_rps_record_flow(const struct sock *sk);
 
 static inline void sock_rps_delete_flow(const struct sock *sk)
 {
diff --git a/net/core/dev.c b/net/core/dev.c
index 290e0f099e6b..3a0dd1f98084 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -5052,6 +5052,7 @@ struct static_key_false rps_needed __read_mostly;
 EXPORT_SYMBOL(rps_needed);
 struct static_key_false rfs_needed __read_mostly;
 EXPORT_SYMBOL(rfs_needed);
+struct static_key_false rps_feat_llc_affinity __read_mostly;
 
 static u32 rfs_slot(u32 hash, rps_tag_ptr tag_ptr)
 {
@@ -5263,6 +5264,48 @@ static int get_rps_cpu(struct net_device *dev, struct sk_buff *skb,
 	return cpu;
 }
 
+/**
+ * rps_llc_check - determine if RPS flow table should be updated.
+ * @old_val: previous flow record value.
+ * @new_val: target flow record value.
+ *
+ * Return: true if the record needs an update, false otherwise.
+ */
+bool rps_llc_check(u32 old_val, u32 new_val)
+{
+	u32 old_cpu = old_val & net_hotdata.rps_cpu_mask;
+	u32 new_cpu = new_val & net_hotdata.rps_cpu_mask;
+
+	/*
+	 * RPS LLC Affinity Feature:
+	 * Reduce RFS/ARFS flow updates by checking LLC affinity.
+	 *
+	 * Frequent flow table updates can trigger constant hardware steering
+	 * reconfigurations (e.g., ndo_rx_flow_steer), leading to significant
+	 * contention on driver internal locks (like mlx5's arfs_lock).
+	 *
+	 * This strategy only updates the flow record if it migrates across LLC
+	 * boundaries. This minimizes expensive hardware updates while preserving
+	 * cache locality for the application.
+	 */
+	if (static_branch_unlikely(&rps_feat_llc_affinity)) {
+		/* Force update if the recorded CPU is invalid or has gone offline */
+		if (old_cpu >= nr_cpu_ids || !cpu_active(old_cpu))
+			return true;
+
+		/*
+		 * If CPUs do not share a cache, allow the update to prevent
+		 * expensive remote memory accesses and cache misses.
+		 */
+		if (!cpus_share_cache(old_cpu, new_cpu))
+			return true;
+
+		return false;
+	}
+
+	return true;
+}
+
 #ifdef CONFIG_RFS_ACCEL
 
 /**
@@ -5318,6 +5361,28 @@ static void rps_trigger_softirq(void *data)
 
 #endif /* CONFIG_RPS */
 
+void sock_rps_record_flow_hash(__u32 hash)
+{
+#ifdef CONFIG_RPS
+	if (!rfs_is_needed())
+		return;
+
+	_sock_rps_record_flow_hash(hash);
+#endif
+}
+EXPORT_SYMBOL(sock_rps_record_flow_hash);
+
+void sock_rps_record_flow(const struct sock *sk)
+{
+#ifdef CONFIG_RPS
+	if (!rfs_is_needed())
+		return;
+
+	_sock_rps_record_flow(sk);
+#endif
+}
+EXPORT_SYMBOL(sock_rps_record_flow);
+
 /* Called from hardirq (IPI) context */
 static void trigger_rx_softirq(void *data)
 {
diff --git a/net/core/sysctl_net_core.c b/net/core/sysctl_net_core.c
index 23310581f494..e13af75d9f25 100644
--- a/net/core/sysctl_net_core.c
+++ b/net/core/sysctl_net_core.c
@@ -555,6 +555,13 @@ static struct ctl_table net_core_table[] = {
 		.mode		= 0644,
 		.proc_handler	= rps_sock_flow_sysctl
 	},
+	{
+		.procname	= "rps_feat_llc_affinity",
+		.data		= &rps_feat_llc_affinity.key,
+		.maxlen		= sizeof(rps_feat_llc_affinity.key),
+		.mode		= 0644,
+		.proc_handler	= proc_do_static_key
+	},
 #endif
 #ifdef CONFIG_NET_FLOW_LIMIT
 	{
-- 
2.47.3

