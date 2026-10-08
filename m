Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869F843499E
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 13:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791466391; cv=none; b=Uw2UdfXsz08z3eWTEXRJvNjpdJmLcXflTZsZ7pijnReH0ZZ1mRSFEjHSDhdUn0/iI/MYBDa4Z8Il5Xaeay1NPftY698916zoTM5w7NOKoypslLTRAwncHPu3gfxCKJ8gx7bdM+dg2vMAGogL21pAiO6124UMV82XvFWRlZpDfz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791466391; c=relaxed/simple;
	bh=vWf07tfvgfXqq9x5vPvFNxiioX3rP0NNTwrPBMXf0a8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CF3/dr9hsMGX/tDmgJ/bSCOACDxNuKY+C8mfhZFDC4ue+2tvRLmhla1G68Pr3XKLN5wuB+9BAqXv3wkpoKXwzlA0TvgD3yBTOq1qUaQyFt4HHY8YHrBSMbjyc8BRqsJiRhe6R9JRm7plqCw5RPRWgt238OKq3F184QLD0xuWt44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T/Hf8mED; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T/Hf8mED"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-88c72646f03so2780907b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791466389; x=1792071189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cIIQ0NNMwq4KqCvPXSeyFJb/IFn6XyVFmklAzgkrN6k=;
        b=T/Hf8mEDCZ8fl80LgRVM73sVbbgj7TQ08Nqu5Jm3LQWVuqtZ2SCcb/aVsM1j+ZEEce
         el2sqRx6mhWTqrd94yfrh9TIxWNiy/N2L2B92QSnIChhHuzvlOu/YYgz/uBz8H6eCibu
         Idx5zkZ83cUSJ69nGDWp8XEY9Uiao8/Gzve53Q7KYqJqI13TwwFyLjIGg5KqWPjvpjgV
         tQ9RO2bYlaICv/wUy1BTiRpXesnpcjQakh4YZPrxMwM74TIKAba8RBUy2FYBk3VcIwyk
         UaNtDhSamA4SqtmOm7pvtO2ez9YWNKT7cr9ze5TEkFNdDJZSNmU/+JImS2yoS4YxdPPt
         WFsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791466389; x=1792071189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cIIQ0NNMwq4KqCvPXSeyFJb/IFn6XyVFmklAzgkrN6k=;
        b=l59NLSgszY5jE38RJHzmJu94KI9hGASEHA6cF5QGH8PKv9wAOsRY1irqjZ6ajXkUgE
         70yPi6pSL2OoQVCBLLpXS6ciFgQmlxXHnfGeDFFa0hK5naPzGZeou5lNHifquoWbkxPc
         304gHoH5vM1T1O4DM/LRu00JtoJXxoxoByme+YEDfsm0Fse4+aVTRnkzrzTGVlnFm1zO
         EUCVs7ZqJHbFuCqhErR8NoM4US7037B7rlQKmVVevmhb7HLDNk9kSCB+i/tQWFjjuCX8
         WFXC4dvSNJC2iwjj5dA3/YOHS8AqSHjz3QIObUTo9Ns92i9RRGhKTk1ucaD814a9FVvT
         KaTQ==
X-Forwarded-Encrypted: i=1; AKwUvBy10MJ657VTJAbk/yYG6B83tSfHj0hohOxbIuGCU/HtQ3PB/MkghSfzM18mrR66xR+NPuoxY/+hvUYJqGw=@vger.kernel.org
X-Gm-Message-State: AFuF++krFoo5cu6A8yB3w+yU/gYj3e4fhaLrQpy85PF5MnaM6B58K0Ah
	Dpkpkmmz26QIWgRykUfQCKgJumel0fjY8gEWoHPkvNCJBRIi4e8O6vq+
X-Gm-Gg: AYBFou3tf1/bGHVTKZmh5D886ISeByn8H3DoqtOTFnjmZ6wfp2FuL8GDbZfeiLm10vM
	r3mGaMtudnQr/1eYJBCEmSAZMx1g9WfFCFX4Qxw2Q9dh7ywapRUSyitk8MWA6CtIypfAlvpJbgX
	OUthnBpoimvAXHObN5iZ2ckjFF9rrQEQ9/Gkh50NLzAyRiG2GqAWhHPcHg5oXCTsl5RYee+mYET
	TIM5Qnsdce4QcRXa4nq8lAK9RMz2f81IbnHqlwBToFXrKdukQ7x9+SoLZ2LtF9IYoCFUtp91MZQ
	IsGAQSa2O0Mk19UCeZw+GBQX69oybt998dBEAkUZl+ZaHYcvR8Dp67wRAIfkIpeaM5i00Dn97CV
	dRmfZ++f9FXcxQF8ivPd3LD3n2QMwSkl0lFlSRPJq4kGgUXqFiO3v566irBbbPHK6Qgzek6Yv8s
	2PjsGupoD6NZTQMz0bdjvcWXrK9MBQsNP1PVy4EkBd7Bs68B6R0GGQzPmNXGxiAXjFvMMfnsMtb
	hhZv4S/tI5iaMJgj02e9YXwIT74NgJy0Bvh30o=
X-Received: by 2002:a05:6a00:4098:b0:87a:3144:8c4c with SMTP id d2e1a72fcca58-891b54cd522mr4832798b3a.59.1791466388432;
        Thu, 08 Oct 2026 06:33:08 -0700 (PDT)
Received: from localhost.localdomain ([2409:891f:1a45:888f:ce2:7571:bd00:d119])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-892b87f259fsm1656626b3a.3.2026.10.08.06.33.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 06:33:07 -0700 (PDT)
From: Chuang Wang <nashuiliang@gmail.com>
To: 
Cc: Chuang Wang <nashuiliang@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	Hangbin Liu <liuhangbin@gmail.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v10] net: reduce ARFS flow updates by checking LLC affinity
Date: Thu,  8 Oct 2026 21:32:44 +0800
Message-ID: <20261008133252.3750-1-nashuiliang@gmail.com>
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
(e.g., arfs_lock). In high-load scenarios, this contention often
becomes a performance bottleneck that outweighs the steering benefits.

This patch introduces a cache-aware update strategy: the hardware
steering update is skipped when the flow's previous target CPU and the
new one share the same Last Level Cache (LLC), as cache locality for
the application is preserved either way. The per-queue flow bookkeeping
(rflow->cpu) is still updated, so RFS keeps steering packets to the CPU
the application is running on, and subsequent packets take the fast
path in get_rps_cpu() (tcpu == next_cpu). A new sysctl,
net.core.rps_feat_llc_affinity, is added to toggle this feature
(default: off).

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

  Before: ~200,000 counts/sec
  After:       ~10 counts/sec (reduced by ~99%)

These results demonstrate that filtering updates by LLC affinity
significantly reduces driver lock contention and improves overall
CPU efficiency under heavy network load.

[1] https://github.com/apache/brpc/
[2] https://github.com/iovisor/bcc/blob/master/tools/funccount.py

Signed-off-by: Chuang Wang <nashuiliang@gmail.com>
---
v9 - v10:
- Move the LLC check from rps_record_sock_flow() into set_rps_cpu()
  by Eric Dumazet
- Drop the sock_rps_record_flow_hash()/sock_rps_record_flow() exports,
  which are no longer needed.
v6 -> v9:
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
 include/net/rps.h          |  1 +
 net/core/dev.c             | 23 +++++++++++++++++++++--
 net/core/sysctl_net_core.c |  7 +++++++
 3 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/include/net/rps.h b/include/net/rps.h
index e33c6a2fa8bb..65d1fc43f8b5 100644
--- a/include/net/rps.h
+++ b/include/net/rps.h
@@ -12,6 +12,7 @@
 
 extern struct static_key_false rps_needed;
 extern struct static_key_false rfs_needed;
+extern struct static_key_false rps_feat_llc_affinity;
 
 /*
  * This structure holds an RPS map which can be of variable length.  The
diff --git a/net/core/dev.c b/net/core/dev.c
index f587645e930a..8b046100525a 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -5122,6 +5122,7 @@ struct static_key_false rps_needed __read_mostly;
 EXPORT_SYMBOL(rps_needed);
 struct static_key_false rfs_needed __read_mostly;
 EXPORT_SYMBOL(rfs_needed);
+struct static_key_false rps_feat_llc_affinity __read_mostly;
 
 static u32 rfs_slot(u32 hash, rps_tag_ptr tag_ptr)
 {
@@ -5160,7 +5161,7 @@ static bool rps_flow_is_active(struct rps_dev_flow *rflow,
 
 static struct rps_dev_flow *
 set_rps_cpu(struct net_device *dev, struct sk_buff *skb,
-	    struct rps_dev_flow *rflow, u16 next_cpu, u32 hash)
+	    struct rps_dev_flow *rflow, u16 old_cpu, u16 next_cpu, u32 hash)
 {
 	if (next_cpu < nr_cpu_ids) {
 		u32 head;
@@ -5179,6 +5180,24 @@ set_rps_cpu(struct net_device *dev, struct sk_buff *skb,
 		if (!skb_rx_queue_recorded(skb) || !dev->rx_cpu_rmap ||
 		    !(dev->features & NETIF_F_NTUPLE))
 			goto out;
+
+		/*
+		 * RPS LLC Affinity Feature:
+		 * Reduce RFS/ARFS flow updates by checking LLC affinity.
+		 *
+		 * Frequent flow table updates can trigger constant hardware steering
+		 * reconfigurations (e.g., ndo_rx_flow_steer), leading to significant
+		 * contention on driver internal locks (like mlx5's arfs_lock).
+		 *
+		 * This strategy only updates the flow record if it migrates across LLC
+		 * boundaries. This minimizes expensive hardware updates while
+		 * preserving cache locality for the application.
+		 */
+		if (static_branch_unlikely(&rps_feat_llc_affinity) &&
+		    old_cpu < nr_cpu_ids && cpu_online(old_cpu) &&
+			cpus_share_cache(old_cpu, next_cpu))
+			goto out;
+
 		rxq_index = cpu_rmap_lookup_index(dev->rx_cpu_rmap, next_cpu);
 		if (rxq_index == skb_get_rx_queue(skb))
 			goto out;
@@ -5308,8 +5327,8 @@ static int get_rps_cpu(struct net_device *dev, struct sk_buff *skb,
 		    (tcpu >= nr_cpu_ids || !cpu_online(tcpu) ||
 		     ((int)(READ_ONCE(per_cpu(softnet_data, tcpu).input_queue_head) -
 		      rflow->last_qtail)) >= 0)) {
+			rflow = set_rps_cpu(dev, skb, rflow, tcpu, next_cpu, hash);
 			tcpu = next_cpu;
-			rflow = set_rps_cpu(dev, skb, rflow, next_cpu, hash);
 		}
 
 		if (tcpu < nr_cpu_ids && cpu_online(tcpu)) {
diff --git a/net/core/sysctl_net_core.c b/net/core/sysctl_net_core.c
index 473c162736d6..6043ccb52cff 100644
--- a/net/core/sysctl_net_core.c
+++ b/net/core/sysctl_net_core.c
@@ -560,6 +560,13 @@ static struct ctl_table net_core_table[] = {
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

