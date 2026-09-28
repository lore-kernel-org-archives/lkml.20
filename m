Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9A53246EB
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 04:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790570442; cv=none; b=Zaa4+ovRw5LwI6oMc+k7DyWiIAEcGP2Gjb4SS7DaVnKCuJtKELCSJTSqcbTmHOILGT/KtLpZ3HbRkAg0T1ANb0F44fEY6pYYQZaTuDcgLdF7g1+6wD/MAC6fpjNqMZCLIDnSRGnoiOpc54Bdk/9sC6A6YU0vTb48BKouKtzFaV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790570442; c=relaxed/simple;
	bh=d2swiA7I6cFbtKN9uMLHwpoHtcqZjjVynhBD4VanSRA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BSalyf9dJMbfc8f+XIklRw7CoJgmkWcK0GutJt7Dqz3yFmtODJVI6+n8xczTh2TrsLk0GgjI80SCS2lLIluRL5jri3WaAvEvMw617Rl7BhxK2P4IY0wKfPDRxiCBsiiiUy2drZfZNe9HVD3T2HskVTrujz6ncXxg7udrkwjwEmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XF1gzB7L; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XF1gzB7L"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33c24422d4dso3172641eec.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 21:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790570440; x=1791175240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nKobARkBm3jckAeWzRLINPL374n1cjc6XoeTqsHKNiU=;
        b=XF1gzB7LkTVzFhbFMnBy9tptktBXBzlKC8z+34ZfmEI0+2kBr07g2F/+TQZSiguTUs
         4gmqcXPKGZoVvCl9MeXJxA6MV5UPsAQ7Q7KRgRE1FqMM2UqCMGcpwQ5cT32dYziDNGJC
         txJQxWuye/YSH8buuzkzbr/sIZCsCEcqXxC1QNQX7yqS6votn9j4CaAZMar3emp6p+Vy
         RUpLkD2a6sj8Jb0THqulfWDt7J904chu36fg7YPrcGaxwE25ySBPj7XhAcM2EPKpilso
         p4GKr9zq6qUh6DbwRVJN+kfpcd+x/j2gbs91qyEXIEJrYQj9naPpzxT6loVW9xwMvHPx
         GP9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790570440; x=1791175240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nKobARkBm3jckAeWzRLINPL374n1cjc6XoeTqsHKNiU=;
        b=noVmTG72YXWSg20eYyLGMRJJ4BbSlkq/xxQOMduqvElqYm+A1PUJYb/VGXX0oV9JZS
         l95Xj24rH/dxIftjpJWNhuhURuWhXYcU5iYO28N3cqIw3+WsMQqUUz3y9L9nO0f6cf/V
         ZW8hetgP8EeyfrWByM+yEalnhXmzR8FouFWPVUL7M+effoKqItQXeBwC+kX0tq2luIQx
         qvf3LxtZ5kBWAa4WJ7kl4dWYiEUm9MXkFDhdXegVlkzg1/bidXuOiIee7XYfY/7lnh6W
         cwhgcjlJeJGunfCFb73Hy4PuBqShwtn0/NqgoYhzs17z0MftEWw4ScEDKRKBsZZYi0VZ
         VmDA==
X-Forwarded-Encrypted: i=1; AKwUvBySLiUJMPAYDSgaaH2jGqVxU7CFaO0LF9pFvtptZTD2x0rDrB/rXdmf//y23N5jc3JZbfmu9jpRVkJzNAM=@vger.kernel.org
X-Gm-Message-State: AFuF++kBZjc5LjMzqUSDo2wFxB5NP9cTRU1BuExIISDHzxdQOx09BZZ0
	0d9f2V4v8Apj1J6lUaPt7r/9DeOrd7nDS97l9j1TSudmtzG/rEYDrEAj
X-Gm-Gg: AYBFou35Dnqpx3ehFezzdiZpz3noEUE9YxRP3u+wu97wHbNt49UdRo5OQCjrY2qQGl2
	TijZB2teLh2SA0EwqWHy0m4z4zyQdXuOgSUUjFwxAnr+qrflhHY0DjIb2hgOTzuBhj+mAYXeOrQ
	Uln5klYoxNj1jx4u5UJUWfuGiDkTPoPjvX1LP0dVLchbTHzJefsOVTxbWODguTuTvqQkDTP3/C8
	ICOkLzfCgSSfsVlshV15hyBI8ndZ9W27IKAD/bo8a8yTNqodwtpUrOIeNKMlJm0PCeew6EZ4aWn
	OyX++OFpl5yEVukOWIDniA3HLjzcA8CLmBDqYP22/+zclXaXKGo/8bvtRPEZDq3dFgcaS+urMIV
	CEv2BH1B5z2aH+RooSICeIRiYP9XM0pF0PnGaeZ0pD2hgkgqPmtogE1JvbLxRAu8N2V+MWzx41Y
	UBjlOGE8ZEAMnu7u160xqjOc/WkP9TUdmhUDI5aeLC40aBi2ZJBSIOzIuZpMp8NOeobtD394jQS
	vYvX4m2bFmPi2F+E41LmxL5xydnQSvL0AFb2daYs00XVGhwxVY78HBS+qs5dDZwVbT27WZE
X-Received: by 2002:a05:7300:16a8:b0:33c:1dab:89ba with SMTP id 5a478bee46e88-34272b3bc7amr8010642eec.36.1790570439920;
        Sun, 27 Sep 2026 21:40:39 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:571a:2a:d409:bce3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144f4eb9esm24529067eec.19.2026.09.27.21.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 21:40:39 -0700 (PDT)
From: "Hemendra M. Naik" <hemendranaik@gmail.com>
To: netdev@vger.kernel.org
Cc: jiri@resnulli.us,
	jhs@mojatatu.com,
	linux-kernel@vger.kernel.org,
	vishy0777@gmail.com,
	tahiliani@nitk.edu.in,
	"Hemendra M. Naik" <hemendranaik@gmail.com>
Subject: [PATCH iproute2-next v8 1/2] tc: fq_pie: add support for printing per-flow PIE statistics
Date: Mon, 28 Sep 2026 10:10:19 +0530
Message-Id: <20260928044020.8304-2-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260928044020.8304-1-hemendranaik@gmail.com>
References: <20260928044020.8304-1-hemendranaik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`tc -s class show` for an fq_pie qdisc now prints the following
per-flow PIE statistics:

 prob           drop probability for the flow
 delay          per-flow queue sojourn time (microseconds)
 deficit        remaining DRR byte credits (signed integer)
 avg_dq_rate    dequeue rate estimate in bytes/second
                (dq_rate_estimator mode only)

avg_dq_rate is formatted using tc_print_rate(), which converts the
kernel's bytes/second value to a human-readable bits/second string
(e.g. 3906Kbit), consistent with how other tc schedulers display
rate fields.

Add `tc -s class show` examples to tc-fq_pie(8) demonstrating the new
per-flow statistics with and without dq_rate_estimator enabled.

Signed-off-by: Hemendra M. Naik <hemendranaik@gmail.com>
Signed-off-by: Vishal Kamath <vishy0777@gmail.com>
Signed-off-by: Mohit P. Tahiliani <tahiliani@nitk.edu.in>
---
 man/man8/tc-fq_pie.8 | 18 ++++++++++++++
 tc/q_fq_pie.c        | 59 ++++++++++++++++++++++++++++++--------------
 2 files changed, 58 insertions(+), 19 deletions(-)

diff --git a/man/man8/tc-fq_pie.8 b/man/man8/tc-fq_pie.8
index 457a56bb..8027783c 100644
--- a/man/man8/tc-fq_pie.8
+++ b/man/man8/tc-fq_pie.8
@@ -153,6 +153,24 @@ dq_rate_estimator
   pkts_in 6082 overlimit 0 overmemory 0 dropped 4 ecn_mark 0
   new_flow_count 94 new_flows_len 0 old_flows_len 8 memory_used 1157632
 
+# tc qdisc add dev eth0 parent 100:1 handle 200: fq_pie target 2ms flows 3
+.br
+# tc -s class show dev eth0
+.br
+class fq_pie 200:2 parent 200:
+ Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)
+ backlog 22800b 2p requeues 0
+  prob 0.57679 delay 2.38ms deficit -52
+
+# tc qdisc add dev eth0 parent 100:1 handle 200: fq_pie target 2ms flows 3 dq_rate_estimator
+.br
+# tc -s class show dev eth0
+.br
+class fq_pie 200:2 parent 200:
+ Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)
+ backlog 22800b 2p requeues 0
+  prob 0.57679 delay 2.38ms deficit -52 avg_dq_rate 10742Kbit
+
 .SH SEE ALSO
 .BR tc (8),
 .BR tc-pie (8),
diff --git a/tc/q_fq_pie.c b/tc/q_fq_pie.c
index dc2710cd..0c85e17f 100644
--- a/tc/q_fq_pie.c
+++ b/tc/q_fq_pie.c
@@ -274,6 +274,8 @@ static int fq_pie_print_xstats(const struct qdisc_util *qu, FILE *f,
 {
 	struct tc_fq_pie_xstats _st = {}, *st;
 
+	SPRINT_BUF(b1);
+
 	if (xstats == NULL)
 		return 0;
 
@@ -283,25 +285,44 @@ static int fq_pie_print_xstats(const struct qdisc_util *qu, FILE *f,
 		st = &_st;
 	}
 
-	print_uint(PRINT_ANY, "pkts_in", "  pkts_in %u",
-		   st->packets_in);
-	print_uint(PRINT_ANY, "overlimit", " overlimit %u",
-		   st->overlimit);
-	print_uint(PRINT_ANY, "overmemory", " overmemory %u",
-		   st->overmemory);
-	print_uint(PRINT_ANY, "dropped", " dropped %u",
-		   st->dropped);
-	print_uint(PRINT_ANY, "ecn_mark", " ecn_mark %u",
-		   st->ecn_mark);
-	print_nl();
-	print_uint(PRINT_ANY, "new_flow_count", "  new_flow_count %u",
-		   st->new_flow_count);
-	print_uint(PRINT_ANY, "new_flows_len", " new_flows_len %u",
-		   st->new_flows_len);
-	print_uint(PRINT_ANY, "old_flows_len", " old_flows_len %u",
-		   st->old_flows_len);
-	print_uint(PRINT_ANY, "memory_used", " memory_used %u",
-		   st->memory_usage);
+	if (!st->type || st->type == TCA_FQ_PIE_XSTATS_QDISC) {
+		print_uint(PRINT_ANY, "pkts_in", "  pkts_in %u",
+			   st->packets_in);
+		print_uint(PRINT_ANY, "overlimit", " overlimit %u",
+			   st->overlimit);
+		print_uint(PRINT_ANY, "overmemory", " overmemory %u",
+			   st->overmemory);
+		print_uint(PRINT_ANY, "dropped", " dropped %u",
+			   st->dropped);
+		print_uint(PRINT_ANY, "ecn_mark", " ecn_mark %u",
+			   st->ecn_mark);
+		print_nl();
+		print_uint(PRINT_ANY, "new_flow_count", "  new_flow_count %u",
+			   st->new_flow_count);
+		print_uint(PRINT_ANY, "new_flows_len", " new_flows_len %u",
+			   st->new_flows_len);
+		print_uint(PRINT_ANY, "old_flows_len", " old_flows_len %u",
+			   st->old_flows_len);
+		print_uint(PRINT_ANY, "memory_used", " memory_used %u",
+			   st->memory_usage);
+		print_nl();
+	}
+
+	if (st->type == TCA_FQ_PIE_XSTATS_CLASS) {
+		print_float(PRINT_ANY, "prob", " prob %lg",
+			    (double)st->class_stats.prob / (double)UINT64_MAX);
+		print_uint(PRINT_JSON, "delay", NULL, st->class_stats.delay);
+		print_string(PRINT_FP, NULL, " delay %s",
+			     sprint_time(st->class_stats.delay, b1));
+		print_int(PRINT_ANY, "deficit", " deficit %d",
+			  st->class_stats.deficit);
+
+		if (st->class_stats.dq_rate_estimating) {
+			tc_print_rate(PRINT_ANY, "avg_dq_rate", " avg_dq_rate %s",
+				      st->class_stats.avg_dq_rate);
+		}
+		print_nl();
+	}
 
 	return 0;
 
-- 
2.34.1

