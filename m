Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794208250;
	b=TQERt45XW0MhDqXA+/WsLUeW2QxTJQuTi1XHFbpHbOTTm4qQotlU/FK4oygNjcQLgitc
	 o134X/dOupNBilpQVLWuMSOJ0WqpSgZS/PctHAH5AcIi30HKT8HAO61LkgIDwLpkYufjU
	 zo2bT+1PP+xuGQJckVeMQjXcEBbZ8TGTN7nAcEWozlnT3fmVpsTtYsN1n/Q7IU3IlayNW
	 2FWOb8n72PgFi0rbdtcT0fH5VLHxH3EvYsHs7Sxpu+06zlEd3VDcPqaHHvgylc4ZCs3Yw
	 7pWZYwFlq0bRnUU6J9QmLIVe/RhMJMJkUqczEwjlhQiJL2lhbJWBRmmJr2qZyTtLjeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794208250;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GS/mJj08Rc3NXrACJw8MkLnqyZ1jMTdN85GRwUjehtI=;
	b=SpdsI0e8DjmefXhwyC3uVxvGCCSs8IK3QBffhJq0kwY+JIY9G0bBkUObEbzSNmylIIM+
	 DZCXeripOqYtA8TfpxzI+GP/H9JmL92p+Nhxlr6YtkvixfnTEpFru5tT8+O6kQqWmjGVz
	 Z07ApXpS0pf5Fv/tK+qerMDAGiWk5FCJQc+pg+uNwbBsJu9ALCLCr8uILYrk9TSs7ZoJJ
	 TEelT/hqeyAA0pQf9FUvYVRDelxI/S/baNufDoyAyXCOLxEaAI7U0IDfVAxx1xGf8l7mt
	 G3ZUyQmuUzflAOp6hDqfic4zlttBpEeiBeTm+fLdeLTEa4wrRfO5WEHnu2VmgVG3d1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=utXlC+B9;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A71606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 07:10:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2A71606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=utXlC+B9
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1a8cc11ac42so350785c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 23:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794208249; x=1794813049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GS/mJj08Rc3NXrACJw8MkLnqyZ1jMTdN85GRwUjehtI=;
        b=utXlC+B9lNVmec7vDnfUP+LG62IC1L9WwmdukL75G4GSyXOzmby/YQLeyBqGxuWX+z
         TE0HJEMm3MxVBN0MWaqFLz2Ci0v478VtHrHthpGj9ZhpljpkIDzh1hmquchmVLZ7OPfN
         MBzwhzXhgg6An6mCR8Iq9mH9ogHfXnt7BSr9innTaE5S2RLp+B/bdVoxxS4xv2KEHESK
         9j53AeZz4fnsukaWHXkf2jTYt5CEvB4FT+/i9FZWcnEOcDyKM9S5hJY9id3NVmNvFOHD
         UKmznvPJ76wXz/cF0qyBA80ofZr9JMyMVvQ1ocXjcSPS83YvukZxxCy0X7RSXeKmDSQ+
         HguQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794208249; x=1794813049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GS/mJj08Rc3NXrACJw8MkLnqyZ1jMTdN85GRwUjehtI=;
        b=2cEyGwSDufFl7eNIdi3DmbPJ6mR2Twm/ECW3DyLRtMVticBTbrdOVCh78o17VRoYOK
         swRGobwuTWsP15PpMhUGQLg6yyZygXcuO5J8YNYSAoTfRphzgA90ZTSfCeX8tJ9Sd+V/
         DiXLqojK2FMHSC/496dPvj2I7mRUScn7f9Wc4eA8KqRJ4SEZcU5ypiyxsY9p1kMcij51
         aYEA1a1eiHupaEYq4Xydmf9QY7d4b0qTZU0MLsYjR8/vKQOTaDcx7IjRcknOTC/NuNLR
         uiXAPKDzowHPWp54OWj0yuOozznhYvP+B5nG8V9a5HNoYG1m+p/g2aZII89cMiC6+vH7
         I0xg==
X-Forwarded-Encrypted: i=1; AL+hErHxXQv86jPpJrYjOK0CcomAdtkOu5lT/6VbIqfkAjy/M5fru+pSiHZrBcn/3N7RAvnsFxE4dRrqZ0Dofms=@vger.kernel.org
X-Gm-Message-State: APuU4Z92yDXuoeO1Vew9VY9Xk9hAsTZZ80n1FR2sTaWvs1zyRtnB0Ylx
	o/qmPQGHhH+4CqnVPlad44kh29QjmcZcssxYcUSSSyAwQWurpyBtKxtk
X-Gm-Gg: AYBFou0RtBMHb41joymvqn47rGQVvNlbtXxUk+dZY4TEnAEz07MSsMMUQlx0fs2rpKv
	iEQ792krMZi9W0tLug+Ub9seSBbOLpD2g7L2w3Fi8eiiF9eFuyJwzWxVZ2ZQo615Byo4T6Kwk3w
	4rv5hQ+yklFLGQKNP9wXJzu0XUKIxaeYUoQWPo1/kRJGEyuob7j/InIWu734AV85sWAMIskIN7Q
	4NDuftI12lllptEOzFvr6JSshdRijBfxfgXzcqk84mjlEEASAg+9K9OZRCx42qep5ROo+Ygu+6S
	EH/EcpuUclTRXDLHoVdxqaNZrNKKYO6FeJiBfDfMmO9tkhHaztdQrG/ovNuVY+degm2qd9gPW7z
	8Mf3yI3wsFW3qWUd4hsLSvLJZGB/Bz49ADfoFgIgv7yNJwZTpuj3SYb9j3K5nlu6YKN3V572Tr7
	rSbDhaI5iyqLJ91ENIbhwM0ivquJCtLhR6cj/51QgLVw8jB46hP6kaByNruD1gjzX++DmOClggn
	jTBDN3/hu2AHvaRbSoX053KV3SfCtCUF/2vc9uEj2GcPOK+U7UVFSD3Z1ZhhykBAhYtrTiNHnim
	6Uk/b9AEyNyeWvwG919diaCoYEMG9x4S89uo8JpSsA6gFaaULUDWUy3nrctkyWsGA4WE/63a1Mo
	VdkwUC7QjkNWXXddCNpeZTSYFUJDK
X-Received: by 2002:a05:7022:1709:b0:184:992:c9ec with SMTP id a92af1059eb24-1b39fecbba5mr4577720c88.38.1794208248293;
        Sun, 08 Nov 2026 23:10:48 -0800 (PST)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:cc96:e14b:76e:f8f1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755eb6efsm13443513c88.4.2026.11.08.23.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 23:10:47 -0800 (PST)
From: "Hemendra M. Naik" <hemendranaik@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	jiri@resnulli.us,
	jhs@mojatatu.com,
	shuah@kernel.org,
	donald.hunter@gmail.com,
	ast@fiberby.net,
	toke@redhat.com,
	liuhangbin@kylinos.cn,
	j.koeppeler@tu-berlin.de,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	vishy0777@gmail.com,
	tahiliani@nitk.edu.in,
	"Hemendra M. Naik" <hemendranaik@gmail.com>
Subject: [PATCH net-next v10 1/4] net/sched: sch_fq_pie: add per-flow statistics via class ops
Date: Mon,  9 Nov 2026 12:40:14 +0530
Message-Id: <20261109071017.438478-2-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261109071017.438478-1-hemendranaik@gmail.com>
References: <20261109071017.438478-1-hemendranaik@gmail.com>
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
index 5982847df8f8..c834c8f45898 100644
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

