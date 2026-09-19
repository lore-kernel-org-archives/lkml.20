Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCFA364950
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 06:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789797738; cv=none; b=JmQcQhjN2fh2D7djfc2rQLVKTD9BDauENLVtmLvDkbdtzvDqrosBosv8SKIJ2mw6Z9lUypOQ76QEAS6URAQfcq+1HdQJpOmN7ugFeio/nAgomAmJjH/5Mh9QPueEHIgM8Zz5Ikv9qP3NjUGXX6K8fNjIl3vfOzIvnNS1FC/N4Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789797738; c=relaxed/simple;
	bh=+nPH63PYpepS1OxdMwzBuz4YyCVz/0H4x0ZyMduaJRs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UkyP67zNSZ9jjLkZjfq2u4QhwYXlxf5hiAwCcqMeK38VWthrxCM93U8E8QVlsxVczprGLC+9NtmuunIHr0g23kI9hLPM858JqFzShAQv7eXcXk1pwFJ3cJX0GLcNL2bfIad2NyuEDAyae3trk2dMh8tPfix+m38UkdkfJbVbRLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mgOPvkA8; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mgOPvkA8"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2d90ba1d807so17932945ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 23:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789797736; x=1790402536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5MahHOdimanlD7mnHIbSl1eg7/7nycaIsLCZiXoOM1U=;
        b=mgOPvkA8wt5Mj07FvBAle86YMBmBOFLG/vHSPjxJZOAp+fxWERouUd6RLw2spGb32K
         /MnIjY476yKlCbmoznBq7lhdQ7ODgsWqC515o21vsaqtdAYyTBqo/Lf2yE9vwVJM+/Es
         a0Dg8cIh5qKxEkf7kbQJaT+Yr889LAtV5Audo+hcvYpTgzxd2CG0ads2peve6dy/kDzq
         j8pb/BTXRWj0rm9Gb0YHbjBRHsVmp+uRz1HRtQtdgLBC96BKXCao5lIJaTLnNyu7xr5k
         WjuuO4OgxJ6Fa+f0PxPvqrig6nt1m1eVbVy1ObvUnu6+94uAAbGvRRYv/utDgFh5MGBi
         BHzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789797736; x=1790402536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5MahHOdimanlD7mnHIbSl1eg7/7nycaIsLCZiXoOM1U=;
        b=k36XamHezfWWjK67sykiJjEXsNHm0MtMAQANFnPuagp8LTYWChe8bbIuikVocgD/Kq
         cfsphdjvmquimSH2/vhlnAoJSU3OLlGgYaKoeqIhmPP21ANjVjMvqfe5r0Ee7CKH0sp4
         tSYjtdwnwGYsMmPRQ3g3tSwz/gQFxFTq+JNmauHqEi1OryrGTp/N2qejs9cB5B8onUEw
         x0nMVWC2mFESPrWvKcdBpcTG4IrACLkVorYvHMvUUPpG2j4TiKzzUaGPsnsqSmR55OaG
         TFbjjisy2q7lz4HX1fZRxl+nHt2uQ8Gth8mjONExnQW3Y/jUOfAZsUuGDvtk8zdWuFBs
         R88Q==
X-Forwarded-Encrypted: i=1; AKwUvBw+L+AeuNw1QEElwDI5NT8brkI5DcoBtFAGcbsCpplg87Qu2lSyD0ufGvq0SXaiJQJybaaYwNUgWpt/j3w=@vger.kernel.org
X-Gm-Message-State: AFuF++krk8d3Y1/Upz43pzFhAPFINRgWCtK5AUMk8RVR3vJYbVUkULmD
	kawIPHAtiPuMLZ8iTVIfMN4vZJcwyo5W/LNZhYpuigXGU92iZS11eD0u
X-Gm-Gg: AYBFou2oc4IXp0SUatnRQNYHOQxI6Nz6x+aaZy/CYKVGU/feiK5BKGWn3hd1JLwLKm0
	CcrgfKiVIgy6UoVLWMkjhMZCjLTf8T2ONeGjnC+3ss//l0KFY+aCPgAR6OzIRoeYQFtbxEMkrZL
	unR7mIDEe0K/YAvJQ56W47Q5ZHdvJvpP2cQrC4ksN4/gh0TXanapTe09/tGG3YoAkNChuqDTyCf
	TV5aDmcL2P13JYk74O8lhgeoaeX7EtQrScW8b2ddLK4nb7YLgT/NZ9voOm1kDOz5v1cSEe17LMz
	gPNyuCgU5GzvEjYwFW8uQk+UyREuw/tlTeHpQPGsvfKpYPXnXNnOd+Yip+nXYezOJMZwybKVf3M
	TPbINJYQt2/pzjQ0tdVZ1DthY/WkKGozxdtr5GA18JuHRX6fztTmsHeX1Vlw9KSAdTbuSbhIyhf
	SAxyOCL9MiygLs3Kn4G7Y6y2tW0uA6RJZlFDy23q+Ye/NK/Rp+DMU0QEVK9CTmOge4nX/0+WERs
	KCSSmrY5i5Q2kr5fPwKkCAwkEw6kGQmP38jECbrSqCxt6TM4Tefq/TCpUVDvpe0fs4n4O3uQGo=
X-Received: by 2002:a17:90b:2f46:b0:39e:6c68:c789 with SMTP id 98e67ed59e1d1-39e6c68caa4mr2822577a91.63.1789797735987;
        Fri, 18 Sep 2026 23:02:15 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:d11b:773b:fa83:c49a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c33140f7fsm3658321eec.13.2026.09.18.23.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 23:02:15 -0700 (PDT)
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
Subject: [PATCH net-next v7 1/3] net/sched: sch_fq_pie: add per-flow statistics via class ops
Date: Sat, 19 Sep 2026 11:31:23 +0530
Message-Id: <20260919060125.38063-2-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260919060125.38063-1-hemendranaik@gmail.com>
References: <20260919060125.38063-1-hemendranaik@gmail.com>
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

Derive delay with div_u64() from the full 64-bit nanosecond value rather
than truncating to u32 before dividing, which wrapped for sojourn times
above ~4.295 s, and widen avg_dq_rate to u64 before scaling it by
PSCHED_TICKS_PER_SEC.

Signed-off-by: Hemendra M. Naik <hemendranaik@gmail.com>
Signed-off-by: Vishal Kamath <vishy0777@gmail.com>
Signed-off-by: Mohit P. Tahiliani <tahiliani@nitk.edu.in>
---
 include/uapi/linux/pkt_sched.h | 16 +++++++
 net/sched/sch_fq_pie.c         | 86 +++++++++++++++++++++++++++++++++-
 2 files changed, 101 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/pkt_sched.h b/include/uapi/linux/pkt_sched.h
index 490efd2885267..9c0c9787f0c32 100644
--- a/include/uapi/linux/pkt_sched.h
+++ b/include/uapi/linux/pkt_sched.h
@@ -953,6 +953,20 @@ enum {
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
 struct tc_fq_pie_xstats {
 	__u32 packets_in;	/* total number of packets enqueued */
 	__u32 dropped;		/* packets dropped due to fq_pie_action */
@@ -963,6 +977,8 @@ struct tc_fq_pie_xstats {
 	__u32 new_flows_len;	/* count of flows in new list */
 	__u32 old_flows_len;	/* count of flows in old list */
 	__u32 memory_usage;	/* total memory across all queues */
+	__u32 type;
+	struct tc_fq_pie_cl_stats class_stats;
 };
 
 /* CBS */
diff --git a/net/sched/sch_fq_pie.c b/net/sched/sch_fq_pie.c
index 5982847df8f85..3a3ef83f328b2 100644
--- a/net/sched/sch_fq_pie.c
+++ b/net/sched/sch_fq_pie.c
@@ -511,7 +511,9 @@ static int fq_pie_dump(struct Qdisc *sch, struct sk_buff *skb)
 static int fq_pie_dump_stats(struct Qdisc *sch, struct gnet_dump *d)
 {
 	struct fq_pie_sched_data *q = qdisc_priv(sch);
-	struct tc_fq_pie_xstats st = { 0 };
+	struct tc_fq_pie_xstats st = {
+		.type	= TCA_FQ_PIE_XSTATS_QDISC,
+	};
 	struct list_head *pos;
 
 	sch_tree_lock(sch);
@@ -563,7 +565,89 @@ static void fq_pie_destroy(struct Qdisc *sch)
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

