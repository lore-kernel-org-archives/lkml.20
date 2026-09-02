Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6148A2D59E8
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 04:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788321777; cv=none; b=m5dd6R79Dfqws/lTW/pg4MJwPQffBwDhzh4Oj4XieuEhQQokdIFqoB3sQvJWuYgW9xAZAHYPpQwvvYyaDra42T4NE78ZaxPmDUQkps3WPuQjfgB7dQVWt1RFp+hHJzhcBssr7qawaTXPI/KCjREGdmCmND+v3q5m5ueSobkodrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788321777; c=relaxed/simple;
	bh=n3aaHDXSmcIKZYcvJpd6FMlFLA92h3BzIgKTFlEOKz0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SKtufK8N6bdMJd76oil8GdqhNQWEOBvQ6fVS8vdQySdRGwSHCZ+hK59X5xFub/GmMgcgweaK0Bjd52mo1UwQ3U7aM6/UbCLsclkcyM5I7fFb3/bJ+33nuQBCI0NX59zwIMC+YHhuUqEgKGAxga4JVAcGb/RXJyf6zAUEnxHAB3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CB+qmMN5; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CB+qmMN5"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc2276e6daeso505412a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 21:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788321776; x=1788926576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cp9Qlfxn11kdtIRK4RNM5kGmebRrzSCw/XK4eBIQAUM=;
        b=CB+qmMN5XXJM1YhnuHuCF5UAyYZBMVWOWH85MFVhgWl3VVvJofjo528D/OrcNBiVRp
         7T6Jxofp58UQ7oTpP9AomFvxs8Kq2KqJF/AwNScaQ+fg1TMseNrheYHJ/GPCAsNLGepi
         ay3suOvI+53pkwFScnk05uogjzpEzI+qLvAAamdqf8R7jwlPR9yX2sPD4ea37OtQj5aR
         gXEhDr8BrKlFc7fBro5uQTeywaFre9H6aqvNdhNLQAqtBkI3cxJY6J+QfmKHESe00ajQ
         LeQmG5ht9XaO1HXOMuix8wR/TCLbiOq0YAjFz7//jP653dsMBI4/tJZqqr3FW9AkxSYx
         I+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788321776; x=1788926576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cp9Qlfxn11kdtIRK4RNM5kGmebRrzSCw/XK4eBIQAUM=;
        b=O5XfM95nA/Sq2b9RB19Buj7zAXHupV63Nekr41scZaLkjqbBTTYKTOMsrq5KYpxEV4
         wDLHTvozLiL4idZ+w3ClPn6UMnOjUUhiu7bdo7YvngZSVax/jSaFekjBEfUNAJSHByQP
         9rygJi5cRNCynaRH1O4yS6QfLVEjr3WpdQ3it6W+kRAFYowQxmY53XRKHK1CTTS0/u3l
         +XTiLBkkBzylnUZFX6dZaX7BDRmIlFZM4CI8PGJ7LhQZNyQ6yU4KCsCGqjlsR0OKV9RF
         wYxL6Wim1RWPrcoewP8nUKVtwDQ7n28rovK0RRaoqXcftL8Bre4dJXfj4ohGK9yb0HYx
         S8Sg==
X-Forwarded-Encrypted: i=1; AKwUvBxgQ+feufF6PJxzlxF1MILyptF7vOrkKNwF+W11KIw6rNr9DJaqpzfdS/cvtGF8mMDxj8He8Co49ZbNQIw=@vger.kernel.org
X-Gm-Message-State: AFuF++k4eQrmONGQmbwnc/f3sChdcS/eQWQi/USURNsFwxDqbe0GuXD1
	OwLChCq66PEiAPyYesAvMo3WnOFOuW5JqOdl3YnmGdctjH4HEk9yZclP
X-Gm-Gg: AYBFou2Rwb6GLyq2QAhig+VZ7u7avgp63SpaFTjd0bdFS/ME5dNH2vQkyyUqcswgjUK
	i6zcmZRlqQIuiw6fP349OqbWP73/CHCE7FP7YSll2xLSER7JoXK2cdCPdyxsH6VUi9gVzpuIMxd
	FCBwPGLlkQfjRXW0ztFOxWuMCM92UW1xXAmcnW1PhTXkxU2C28sU9X41UjeCw/8jhspV0nM9/WP
	m8sKhARUrUrroV573Kz0IhNwtK0tgKnl5jBJK7fHZggHrW/icpIVJ3tSIIIJy1UNNVFaYehtvla
	69jnfZePFoy8S70yRXcwAj1nmmg1+gguqHrzEmnMST7Gwx/iPQ1Sq8zFdOCbLbtRspEVhE2IGMF
	opG3AUWPG8vtoeUxAEDJEmRniaEijPksULRkX5H+7V+UJcfOnA6uPRf4rCRGi95IWECwVlEey8e
	3QQGIlt69dI7Wr+40o4yf1YI7o5NdDvdIqfBU7EHYLHtowzvMK6Pq4WA7aiiYsFIDEXSMWJ+rl5
	OeRrLXQy69qJD4f9ZpAh0XgwC/+c3dW9+AX4udxqwyxqU2tl1lQfCJ6rDmO4pG/
X-Received: by 2002:a17:90b:2d4d:b0:399:1b64:e0d7 with SMTP id 98e67ed59e1d1-39aee108918mr3174818a91.19.1788321775643;
        Tue, 01 Sep 2026 21:02:55 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:5fdf:d463:f07:1882])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f07baa594sm3364529eec.22.2026.09.01.21.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 21:02:55 -0700 (PDT)
From: "Hemendra M. Naik" <hemendranaik@gmail.com>
To: netdev@vger.kernel.org
Cc: jiri@resnulli.us,
	jhs@mojatatu.com,
	linux-kernel@vger.kernel.org,
	vishy0777@gmail.com,
	tahiliani@nitk.edu.in,
	"Hemendra M. Naik" <hemendranaik@gmail.com>
Subject: [PATCH iproute2-next v5 1/3] tc: fq_pie: add support for printing per-flow PIE statistics
Date: Wed,  2 Sep 2026 09:32:19 +0530
Message-Id: <20260902040221.83734-2-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260902040221.83734-1-hemendranaik@gmail.com>
References: <20260902040221.83734-1-hemendranaik@gmail.com>
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

Update the UAPI header to mirror tc_fq_pie_cl_stats from the kernel.
class_stats is a direct struct member (no empty qdisc placeholder).

Add `tc -s class show` examples to tc-fq_pie(8) demonstrating the new
per-flow statistics with and without dq_rate_estimator enabled.

Signed-off-by: Hemendra M. Naik <hemendranaik@gmail.com>
Signed-off-by: Vishal Kamath <vishy0777@gmail.com>
Signed-off-by: Mohit P. Tahiliani <tahiliani@nitk.edu.in>
---
 include/uapi/linux/pkt_sched.h | 17 ++++++++++
 man/man8/tc-fq_pie.8           | 18 +++++++++++
 tc/q_fq_pie.c                  | 59 +++++++++++++++++++++++-----------
 3 files changed, 75 insertions(+), 19 deletions(-)

diff --git a/include/uapi/linux/pkt_sched.h b/include/uapi/linux/pkt_sched.h
index d1f67ef8..776e86e5 100644
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
index dc2710cd..1b89ee3a 100644
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

