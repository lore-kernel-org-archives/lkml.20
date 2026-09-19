Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CC137C92A
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 06:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789798398; cv=none; b=NiddXk4C08SyzmRldl+//vw1+JtDMlrZ5yN21lRkCIp8uomAO0Ypdmbn+XBF2GCgIhIAjQbqWS7AR4EnyraMmtR4EuGv6qBsFVIhrDeTdZk7wQRXt+utPMthlJt5WRxRbZBit23Xnlol5b2bakfQKS4EmWy0PehpAn5reIlZ5pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789798398; c=relaxed/simple;
	bh=y61k6gZOnEK28c4elLqVh4jmqgYX1qNkC+5TeBcNnvs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XyVW7nrr3BuYb2YwAHXBId1f2el1yZR07YluKMwaIsBz/nUOiNjUxK9N+A2zGiTSCRtaElsYqYepGajcmVi7kSjao0hnzx7fwCFGYmM0WkhgoSHS9R8q9bXiImPsO5I67mSYaY0BT3J69oRCZwTmdvGw80nOMhzUYFNBaA+KR28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TyMe7cBl; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TyMe7cBl"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39dacf053eeso1100403a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 23:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789798397; x=1790403197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VrD9gQVR4gBczVkX17GB94+S3KMBMN9yoFZXXeZXVNY=;
        b=TyMe7cBljiPEUQDYcipv0nOGMD6sAPnmVegeWQN1D6eGQhrgOoQyEza22hROXbRnTQ
         ltC7nbi5pGNT4AtCsievskGMt8cq9lne0GEWeQiSoJfzSinYLJEL8yw3j5dmhcLpReP/
         k/iiwEMrHgGWA8Z130By5wXkJzB5VYZyc4Ap1L3jI7AE0PSe6oioRmecThaecm7Sf2br
         QK1bTbY8dkLjy8WykvyvaTeRv5Jrq72eqijeIropzQB8Oy+yX7z2Y/Ty5Lx5qVXkmxGi
         Y4KS4BfLPGiX8Vio8TGSD8vo5hsw5XUbCtRzKRdEtbEnkJZtWW+sjGVoG9x3Up8INmPr
         98PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789798397; x=1790403197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VrD9gQVR4gBczVkX17GB94+S3KMBMN9yoFZXXeZXVNY=;
        b=hRWEYjsnKyFlPVHwJjwBCQcyrEMcqC77H7+oHznu3hiruxae26eFoAEqUejVwn4344
         sG2q57TDK61K+ryipFMiVnYC/cT/hd+1G5fwWC85ULWn8mLy75n+0z2mlPRs1H6/H7SK
         R036mLpTsD/C2FwSc3qST2iGMoetYoXqXme0UIk0fEVDqTWWoyCu+VkJJK7DJ+WbKjBS
         8Gp4e2GmypyvBlmF9QsEkf2E7ZeADhQLhroZkNdtUo/q6OYtg9jJCaTv4A5SbvihsZME
         VXQAbGjvxbSatkiAyu3i0jl53Ll3ejs1Y14OroeN6v1X2ujJAfOns2qF+7/7kRQ74s43
         tnUA==
X-Forwarded-Encrypted: i=1; AKwUvBwNQNEiHce99xWNynjxMLQikyjQVyfnuV0sZQ0BV5RDmqwQJYyj8pYRtr9EUF2v4ooUqpcTfp4BDSg/dkM=@vger.kernel.org
X-Gm-Message-State: AFuF++lYPcIgKY7V2ArbmTW4rklRGrR+YLLWNIjC8MSQm3Wg3WJtdMTi
	xfnjc/zUXiPzGPyR70OS5+Iykvj9qRrVwR9koiDhB/NxShYuNmkaw7Zf
X-Gm-Gg: AYBFou2CYZWVWlhvQChzxVWQHlAL30lcDsp7uvovmYb8ZfM/XYIal7Ifbm9y/1WV2Xs
	AiEhSOtrgqaAaG3x3UP9HCoz2FhqJOQRhzhVHzYM+xDdx20huCkdNKooMAwiK9ilPp9vAiCIRgT
	r1VZvRgk9lvv1jl28QagPyen2HpEGotmkCT4h6i6Bnu6V7D1rY5Gm8AsnrI9lnDHa1AyCVD+7kz
	dx0MJ7//c42GFxzSe42HDB7RO+tCXozhtiM7Rj2+x7pqSuSjzEE3E/XGP0NBfHZgJboG5HK6HeF
	olDfzd+xvVHDzBHaPKrCnrzykW1Z9lHtKsfTyQM8CP2XlOXT7Pn97OkxrB0ZyS7pV86Celfmfsr
	xIjfJQMnUTqHEdID2RcWPn0tRvgowyJQj1ET2AR8UkXMprtdNnOar5ZcecTqD8irvgsduBdFEvo
	dcrNbbyoYJChdjHFdp0nQRXcp8qE+0Rh/JT3aUqE7kddTnpeG1RW3QOiqpyazGA1U/0j7+0zSGB
	Sh69idTHaOxl+FryJGDVcMBTQX8Nph/9pVJeh/IPOKaRhP9GgD+7GZwfWGGQaFeHwmL115DEyBB
	6v9Xj6X+fQ==
X-Received: by 2002:a17:90b:2ccf:b0:39e:6a7e:ee1d with SMTP id 98e67ed59e1d1-39e6a7eef8amr3450727a91.41.1789798396697;
        Fri, 18 Sep 2026 23:13:16 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:d11b:773b:fa83:c49a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55f299fsm5781280c88.15.2026.09.18.23.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 23:13:16 -0700 (PDT)
From: "Hemendra M. Naik" <hemendranaik@gmail.com>
To: netdev@vger.kernel.org
Cc: jiri@resnulli.us,
	jhs@mojatatu.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	vishy0777@gmail.com,
	tahiliani@nitk.edu.in,
	"Hemendra M. Naik" <hemendranaik@gmail.com>
Subject: [PATCH iproute2-next v6 1/3] tc: fq_pie: add support for printing per-flow PIE statistics
Date: Sat, 19 Sep 2026 11:42:52 +0530
Message-Id: <20260919061254.39678-2-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260919061254.39678-1-hemendranaik@gmail.com>
References: <20260919061254.39678-1-hemendranaik@gmail.com>
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
index d1f67ef8..b03ee5f7 100644
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

