Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055DD2AD3C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 03:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788321202; cv=none; b=PyvOcf96Gp4K/uK64+dusDivDn8fyjV6P9rJieO+2q2duQzWfe7LBdRUb8xLZN6S2z6h+hHKsKI/ByIQNf/CXy6Awbpjpt0Iwe8YQBGztcZeYBWiJvMY9tViNzTi+kON53KvVflVwRjVs1YCR5PnvrkTJk5L71jWIOOtv1fk3Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788321202; c=relaxed/simple;
	bh=DWyXtGKCFcLcmBruy07T0qhMMySVP7dfZtEM8AJJROY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GyX2bk8jOcuaw69zroxw7N14Bv1nENsW20yfgU4BEA+WP8MUisVbtr/so3MClCUVwNl5coC8gNdwu+hr2tc6hK8C/vv54ZMdMvoJABJ9AuAenHO4mePVvnn1q+6ett63UXbSi6eN4AyhLPOyoNPPWBLJPR7CK0+/OyaRk5TvUDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ONeMNfDy; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ONeMNfDy"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d94c868ea5so5586805ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 20:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788321200; x=1788926000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hg+2sotZuSoFWu3kV8aYbXJlZcYn1u1/mg6yUnnLhl0=;
        b=ONeMNfDyERvTOnvQEbT5l+gC8IAv1k+/AUx4FY65+JTJ1n52FVwcPoPRq95ooO5a51
         uRMrwWpMR5muiY5rbI9k0nZKw8B62GEw5E8xDsKjeOAmU/9Z4orzn647Ri50GJH6Q9Ya
         9kJlfftlAOd0C0nXfXIMwzLMCGj9uRxx5ia5/Nks0KcbeqfsBXRFu0ICPvU8c/rEErGu
         odAo8T0x1nIKChUFoMrLeFiDsxhMkbup4l1mRnIBKYMzz3AUZBix4pOz+M1DjO3SaDn8
         XFFZvx8PiNOM/SFvTbHGlEuVB/A9Ds77V4LGT4THJAeCwUBXHovidmZaFETShxvi98P1
         0Efw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788321200; x=1788926000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hg+2sotZuSoFWu3kV8aYbXJlZcYn1u1/mg6yUnnLhl0=;
        b=ffMrBBnaxZNZx0gI5DQ4eiemwISgGvggskzzEbu8KakuQ170TYqljAp8Fr9p2Qn6de
         sYoBRi0/kqQ8RKMVwfy3GcM/jvNku/EnpLR+RAa2VUN4FczQYnfJa6CX36K7QrdAeH6j
         +HNdfsoiaqfSOPfJw4qww/nvWXSdeuVY/eSSjiYyFLZh6m1iAyUGruuKytlnS4ZBBsbB
         RKu0+YqWjbgIy/o79oR1Jt1ayXVt+/sP4uW6Vn3nZGrTqpJQUJQirKr7WjWucmATMTO+
         qMhflihC2WOZGXIddErIaUkB0HJC7T+nOXHlwYzkyfWTIsnIHrLO62vGrqwDx2lawE3i
         BrjA==
X-Forwarded-Encrypted: i=1; AHgh+RqFneWj34CGQSSBIB4uNOa6fnJtvqdZi23iitC1aPiljQI8Uen+wwIwqa2ovq9BOTBOR9if42U02ejCwJM=@vger.kernel.org
X-Gm-Message-State: AFuF++m4937IFUm8rZwRdx/QgRhpA99hrHzvQUGASkjN3MVelzlupKt8
	hH89AXDjDe7xwB038W5qx9nYUoOG+WD9pRD4Ygtf9n0Su77cC8Wh4Ldt
X-Gm-Gg: AR+sD12GSN4bjDplcuXsCdXSw0Pb4XQDXk849+0caJxeNYsJVRSzv9BVIb/DuLmeZJk
	dql45JFHZc4DRpMck+KyPGzlscs/quoYHmsAmK6EOwTtiWWM6mqJRIx06uqMozyFJCMBtiWk2X7
	2rrXevn7+hxoLMMuBgZJwtysgkey1XNgxczdLX/x86fRMSlADEVvu/JsTYnOdNGc3YYL6O1GYcG
	lnKn5czIc2jZlu6HszcYWwAMYig0Wqa0RcYpmv++DbiOu0mv5P808hltDcWHNr1sKlNwZID/AUW
	dHcUf6kuotCcrDssb7T4RqWCzpk4+SCw7fhKy3QflbGI6GKjTvxPPyQJML+W5oBgAxkSA9I0A5E
	z1SRVqBsU1Al0bItUOsHeLcRocK2CCyaistNw+OAkX8nPMfRbm5cFv2KdY0GGDLI2YMkRfvinC0
	mBdxd4RUlC6PJyMM2nm19s9je7Mz3HEad5Wsoer0P0w3nWKaxO0uuqwRJZT3AN+9Uq8/NjNabzL
	QhJdDw6W1A6gqW838xd4/SVnYsZ+3bEwbJvmKRWnezbBI/vwcoq87hoTpIYlyRe
X-Received: by 2002:a17:903:1a68:b0:2d8:d4d0:7932 with SMTP id d9443c01a7336-2daec7a260dmr24412985ad.22.1788321200217;
        Tue, 01 Sep 2026 20:53:20 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:5fdf:d463:f07:1882])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f07b7987csm2502377eec.16.2026.09.01.20.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 20:53:19 -0700 (PDT)
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
Subject: [PATCH net-next v5 1/3] net/sched: sch_fq_pie: add per-flow statistics via class ops
Date: Wed,  2 Sep 2026 09:22:29 +0530
Message-Id: <20260902035231.81866-2-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260902035231.81866-1-hemendranaik@gmail.com>
References: <20260902035231.81866-1-hemendranaik@gmail.com>
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
for per-flow metrics. Append type and class_stats after the nine existing
qdisc counters so qdisc xstats offsets stay compatible with the flat
struct fq_pie already shipped.

Wire up fq_pie_class_ops with walk, dump, and dump_stats only so that
'tc -s class show' reports per-flow state (prob, delay, deficit,
avg_dq_rate, dq_rate_estimating). Filter attachment callbacks
(.tcf_block, .bind_tcf, .unbind_tcf) are omitted on purpose: this series
targets exporting statistics, not making fq_pie filter-capable.

Limit flows to [1..65535] so every per-flow class handle fits in a
16-bit TC minor (TC_H_MIN wraps at 65536).

Signed-off-by: Hemendra M. Naik <hemendranaik@gmail.com>
Signed-off-by: Vishal Kamath <vishy0777@gmail.com>
Signed-off-by: Mohit P. Tahiliani <tahiliani@nitk.edu.in>
---
 include/uapi/linux/pkt_sched.h | 19 +++++++
 net/sched/sch_fq_pie.c         | 90 ++++++++++++++++++++++++++++++++--
 2 files changed, 106 insertions(+), 3 deletions(-)

diff --git a/include/uapi/linux/pkt_sched.h b/include/uapi/linux/pkt_sched.h
index 490efd288526..c6373f410d11 100644
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
@@ -963,6 +978,9 @@ struct tc_fq_pie_xstats {
 	__u32 new_flows_len;	/* count of flows in new list */
 	__u32 old_flows_len;	/* count of flows in old list */
 	__u32 memory_usage;	/* total memory across all queues */
+	__u32 type;
+	struct tc_fq_pie_cl_stats class_stats;
+
 };
 
 /* CBS */
diff --git a/net/sched/sch_fq_pie.c b/net/sched/sch_fq_pie.c
index 069e1facd413..4e3eb8329d99 100644
--- a/net/sched/sch_fq_pie.c
+++ b/net/sched/sch_fq_pie.c
@@ -310,9 +310,9 @@ static int fq_pie_change(struct Qdisc *sch, struct nlattr *opt,
 			goto flow_error;
 		}
 		q->flows_cnt = nla_get_u32(tb[TCA_FQ_PIE_FLOWS]);
-		if (!q->flows_cnt || q->flows_cnt > 65536) {
+		if (!q->flows_cnt || q->flows_cnt > 65535) {
 			NL_SET_ERR_MSG_MOD(extack,
-					   "Number of flows must range in [1..65536]");
+					   "Number of flows must range in [1..65535]");
 			goto flow_error;
 		}
 	}
@@ -509,7 +509,9 @@ static int fq_pie_dump(struct Qdisc *sch, struct sk_buff *skb)
 static int fq_pie_dump_stats(struct Qdisc *sch, struct gnet_dump *d)
 {
 	struct fq_pie_sched_data *q = qdisc_priv(sch);
-	struct tc_fq_pie_xstats st = { 0 };
+	struct tc_fq_pie_xstats st = {
+		.type	= TCA_FQ_PIE_XSTATS_QDISC,
+	};
 	struct list_head *pos;
 
 	sch_tree_lock(sch);
@@ -561,7 +563,89 @@ static void fq_pie_destroy(struct Qdisc *sch)
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
+			((u32)PSCHED_TICKS2NS(READ_ONCE(flow->vars.qdelay))) /
+			NSEC_PER_USEC;
+		xstats.class_stats.deficit = READ_ONCE(flow->deficit);
+		xstats.class_stats.dq_rate_estimating =
+			READ_ONCE(q->p_params.dq_rate_estimator);
+
+		if (xstats.class_stats.dq_rate_estimating) {
+			xstats.class_stats.avg_dq_rate =
+				READ_ONCE(flow->vars.avg_dq_rate) *
+				(PSCHED_TICKS_PER_SEC) >> PIE_SCALE;
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

