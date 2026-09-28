Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com [74.125.229.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D6D175A7F
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 04:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790570067; cv=none; b=VTZhuU3CRnFSP6qN9GzJUCFzcRj913IFAwuw6MncXH4p2rWZe7933njT68l4zcD4N5J5sy6qNgr61JYVgCcLh55Sqol1f16IF5UQafwE0NghlrEVIlN2lS3UA2aea7MNQ8ljvqLpsr3oLYq4cVdX6OfsHLyeWTcTM9NeBupff8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790570067; c=relaxed/simple;
	bh=g3a5zgk0jvl6QiyHNyoJvGyHFF7Prr8MVyKuTY9699o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qKeQdqGErPUs4NT0onZBrw/Da8bApN8ifqdtIAdIhW2ZvXp7AjU4BSQPuJF5OCIbiNP3zqOWIIY9lkTWhMXOtJ13cuDbiEMxbcH7RD3+egYsl1p70EdtyyjJSzOk5XDHFSE12+XcAXpI0bejtgTBYeky5v8AoyGCysFx/hvNRgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PTmgM4Zz; arc=none smtp.client-ip=74.125.229.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PTmgM4Zz"
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-142dd046b87so1769791c88.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 21:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790570064; x=1791174864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w9i4AZxPKZ+TR4dqLECza08nA+0rm81FwGX8+6DQ4hM=;
        b=PTmgM4ZzdvnvpQTZqxdqmDB4QbEHO/xFuS5ZFYTcqkPXkFx7RTryssqrrbpIimQagf
         kBNM0Q8E037Of5riWZ6S3FztQWwOXzx+kyOIQwsw7oDdXmII6c01X3xMVLBpEhuOvpwM
         LsxkJ1vYamlXdM26pNh0/k1Kfg9B4c1paSY1U30icsA1Dq9RaXcaJhnjFCwxxqCE5/2a
         b6n9LbjkcOW3l9JXRxResquuIIopPvtMn3U2KSxATu1hG+XB6eR/W3ensO9WYHUA/BlV
         Y3ISEyryhKURHdHKypenci8vR1Vs1ml5OAEMd12SReLqMTkd2NyLmn9Vz2RKLqQ4YRgn
         sufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790570064; x=1791174864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w9i4AZxPKZ+TR4dqLECza08nA+0rm81FwGX8+6DQ4hM=;
        b=cF2eKmu1W1HGk6b1dOJe5jOCHfgfZpTd0nfbhmG+az3t/QiVCKIEGndNGM8TB7rshu
         9BDZ62pzkxkAaH8rmPpPIzN63f7dceK0TbGMEZZLO03PSsvlmbkqy5xRDMKpE/SGLPiM
         qK62fqAA4E21rLdM+usGNKvKuy54waX9q9uyCnYbHwZwJFlAQWaJYhvWLeRs71ogIbZP
         7B9pv84/Sm/Fr6rhVtMVW9zYQyQhX9LefbpVRQlsxs1cbKX42d4PBB9l0ksPF0NLaMky
         LlpHbt/RHXnr3b1N0BBf0tDIJsntMy8QXFPwxcj9+A0SbFM8ynNlME8vLBSIOLAFJMlw
         FTlg==
X-Forwarded-Encrypted: i=1; AKwUvBxXSR7Z860huO78OHdlmx8N/zja4hveTiB87/Dt3rcfhU5u3EqW52oMVGBxTzhIXGUntGgp6pcQ8Tplywc=@vger.kernel.org
X-Gm-Message-State: AFuF++muii1x0Aq3O/4yHRytNM4rVcsdHpNygvM7gAf/5XQS4LNohlq3
	8mrMtT6wWFe7HIkTIU1U87hkA42UK9ilhcphanZ42azjGipODOW2Ze8s
X-Gm-Gg: AYBFou2vPsXvZZF3IoGClKFvvRzMgGWzA0dJSM7Lf06YR/fRQtiBI7qXVo/iqrLu/vo
	vLF+DzHaZCwxWjtRR8VuBjrtVqTU8y1ym/D82GYcOSJjhZsoPAudrOH6xH/qSVYDRtjwtMlauEy
	DbCJIKkw1Ns5h2vUWnmaDrgrsom/UPPVJvYCLCaFgovwb4PxbfHKOfnHKmkadbL5aN78vmtz+yj
	8C6wsAen7hKeWzqJ3kpDbqvFjDkfPKViOVU6LRYlB9GUJdVDXGCgKuKd0b5zP6BZQkMvIWmZHNM
	u5ye0Rx85YyDKTP1HgQeLv7GiC1UQA2komyt5ViAnDtbORX+xOQ+8p7ZMJJB7PEbmHbeGf2CDmB
	Je7Qx16nWTbi8PhK9hl31EnnbLatLKw5ujMe5poVgQcCd1j0rAdoCsJfBmcKgruQ43JO7p4vsfA
	KbDmaTXPYr+V4dY1OZS4oXRn8MlHxZY7pEy2qaJnTSXTQ/i+ACzR//TyasLvtFo6cxBUV7KKviY
	Qg5iE2tw3LdlQBY5DkBkB0qgUB5KmwHsJbSnC3vZhoOwLH5K4QEC2PsYg6MAabiW/ZGE7CtXhpe
	ws2LhvI=
X-Received: by 2002:a05:7022:ea8b:b0:144:eaa7:2765 with SMTP id a92af1059eb24-146ce67f3c1mr9015303c88.18.1790570063660;
        Sun, 27 Sep 2026 21:34:23 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:571a:2a:d409:bce3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145adbcd1bcsm27921045c88.14.2026.09.27.21.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 21:34:23 -0700 (PDT)
From: "Hemendra M. Naik" <hemendranaik@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	jiri@resnulli.us,
	jhs@mojatatu.com,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	vishy0777@gmail.com,
	tahiliani@nitk.edu.in,
	"Hemendra M. Naik" <hemendranaik@gmail.com>
Subject: [PATCH net-next v9 1/3] net/sched: sch_fq_pie: add per-flow statistics via class ops
Date: Mon, 28 Sep 2026 10:03:56 +0530
Message-Id: <20260928043358.6866-2-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260928043358.6866-1-hemendranaik@gmail.com>
References: <20260928043358.6866-1-hemendranaik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FQ-PIE schedules independent PIE controllers per flow but exposes no
per-flow AQM state. Without class-level statistics there is no way to
observe the per-flow drop probability, queue delay, deficit or dequeue
rate from userspace.

Extend tc_fq_pie_xstats with a type discriminator and tc_fq_pie_cl_stats
for per-flow metrics. The nine existing __u32 counters keep their
offsets, type is appended at offset 36 and class_stats follows it,
growing the structure from 36 to 64 bytes.

Wire up fq_pie_class_ops with walk, dump, and dump_stats only so that
'tc -s class show' reports per-flow state (prob, delay, deficit,
avg_dq_rate, dq_rate_estimating). Filter attachment callbacks
(.tcf_block, .bind_tcf, .unbind_tcf) are omitted on purpose.

Signed-off-by: Hemendra M. Naik <hemendranaik@gmail.com>
Signed-off-by: Vishal Kamath <vishy0777@gmail.com>
Signed-off-by: Mohit P. Tahiliani <tahiliani@nitk.edu.in>
---
 include/uapi/linux/pkt_sched.h | 17 +++++++
 net/sched/sch_fq_pie.c         | 88 +++++++++++++++++++++++++++++++++-
 2 files changed, 104 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/pkt_sched.h b/include/uapi/linux/pkt_sched.h
index 490efd288526..fef848eaaab2 100644
--- a/include/uapi/linux/pkt_sched.h
+++ b/include/uapi/linux/pkt_sched.h
@@ -953,6 +953,21 @@ enum {
 };
 #define TCA_FQ_PIE_MAX   (__TCA_FQ_PIE_MAX - 1)
 
+enum {
+	TCA_FQ_PIE_XSTATS_QDISC,
+	TCA_FQ_PIE_XSTATS_CLASS,
+};
+
+struct tc_fq_pie_cl_stats {
+	__u64 prob;			/* current probability */
+	__u32 delay;			/* current delay in microseconds */
+	__s32 deficit;			/* number of remaining byte credits */
+	__u32 avg_dq_rate;		/* current average dq_rate in
+					 * bytes/second
+					 */
+	__u32 dq_rate_estimating;	/* is avg_dq_rate being calculated? */
+};
+
 struct tc_fq_pie_xstats {
 	__u32 packets_in;	/* total number of packets enqueued */
 	__u32 dropped;		/* packets dropped due to fq_pie_action */
@@ -963,6 +978,8 @@ struct tc_fq_pie_xstats {
 	__u32 new_flows_len;	/* count of flows in new list */
 	__u32 old_flows_len;	/* count of flows in old list */
 	__u32 memory_usage;	/* total memory across all queues */
+	__u32 type;
+	struct tc_fq_pie_cl_stats class_stats;
 };
 
 /* CBS */
diff --git a/net/sched/sch_fq_pie.c b/net/sched/sch_fq_pie.c
index 5982847df8f8..8cd99ff40d0a 100644
--- a/net/sched/sch_fq_pie.c
+++ b/net/sched/sch_fq_pie.c
@@ -511,7 +511,11 @@ static int fq_pie_dump(struct Qdisc *sch, struct sk_buff *skb)
 static int fq_pie_dump_stats(struct Qdisc *sch, struct gnet_dump *d)
 {
 	struct fq_pie_sched_data *q = qdisc_priv(sch);
-	struct tc_fq_pie_xstats st = { 0 };
+
+	struct tc_fq_pie_xstats st = {
+		.type	= TCA_FQ_PIE_XSTATS_QDISC,
+	};
+
 	struct list_head *pos;
 
 	sch_tree_lock(sch);
@@ -563,7 +567,89 @@ static void fq_pie_destroy(struct Qdisc *sch)
 	kvfree(q->flows);
 }
 
+static struct Qdisc *fq_pie_leaf(struct Qdisc *sch, unsigned long arg)
+{
+	return NULL;
+}
+
+static unsigned long fq_pie_find(struct Qdisc *sch, u32 classid)
+{
+	return 0;
+}
+
+static int fq_pie_dump_class(struct Qdisc *sch, unsigned long cl,
+			     struct sk_buff *skb, struct tcmsg *tcm)
+{
+	tcm->tcm_handle |= TC_H_MIN(cl);
+	return 0;
+}
+
+static int fq_pie_dump_class_stats(struct Qdisc *sch, unsigned long cl,
+				   struct gnet_dump *d)
+{
+	struct fq_pie_sched_data *q = qdisc_priv(sch);
+	struct gnet_stats_queue qs = { 0 };
+	struct tc_fq_pie_xstats xstats;
+	u32 idx = cl - 1;
+
+	if (idx < q->flows_cnt) {
+		const struct fq_pie_flow *flow = &q->flows[idx];
+
+		memset(&xstats, 0, sizeof(xstats));
+		xstats.type = TCA_FQ_PIE_XSTATS_CLASS;
+		xstats.class_stats.prob =
+			READ_ONCE(flow->vars.prob) << BITS_PER_BYTE;
+		xstats.class_stats.delay =
+			div_u64(PSCHED_TICKS2NS(READ_ONCE(flow->vars.qdelay)),
+				NSEC_PER_USEC);
+		xstats.class_stats.deficit = READ_ONCE(flow->deficit);
+		xstats.class_stats.dq_rate_estimating =
+			READ_ONCE(q->p_params.dq_rate_estimator);
+
+		if (xstats.class_stats.dq_rate_estimating) {
+			xstats.class_stats.avg_dq_rate =
+				((u64)READ_ONCE(flow->vars.avg_dq_rate)
+				* PSCHED_TICKS_PER_SEC) >> PIE_SCALE;
+		}
+
+		qs.qlen    = READ_ONCE(flow->qlen);
+		qs.backlog = READ_ONCE(flow->backlog);
+	}
+	if (gnet_stats_copy_queue(d, NULL, &qs, qs.qlen) < 0)
+		return -1;
+	if (idx < q->flows_cnt)
+		return gnet_stats_copy_app(d, &xstats, sizeof(xstats));
+	return 0;
+}
+
+static void fq_pie_walk(struct Qdisc *sch, struct qdisc_walker *arg)
+{
+	struct fq_pie_sched_data *q = qdisc_priv(sch);
+	unsigned int i;
+
+	if (arg->stop)
+		return;
+
+	for (i = 0; i < q->flows_cnt; i++) {
+		if (list_empty(&q->flows[i].flowchain)) {
+			arg->count++;
+			continue;
+		}
+		if (!tc_qdisc_stats_dump(sch, i + 1, arg))
+			break;
+	}
+}
+
+static const struct Qdisc_class_ops fq_pie_class_ops = {
+	.leaf		=	fq_pie_leaf,
+	.find		=	fq_pie_find,
+	.dump		=	fq_pie_dump_class,
+	.dump_stats	=	fq_pie_dump_class_stats,
+	.walk		=	fq_pie_walk,
+};
+
 static struct Qdisc_ops fq_pie_qdisc_ops __read_mostly = {
+	.cl_ops		= &fq_pie_class_ops,
 	.id		= "fq_pie",
 	.priv_size	= sizeof(struct fq_pie_sched_data),
 	.enqueue	= fq_pie_qdisc_enqueue,
-- 
2.34.1

