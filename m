Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794208712;
	b=B8zq7BbagCv3R+ungDMSWoRey6n05zY3XzEXNyFEZIshSwKZ1QiDF7+z1j8jHcStBgiF
	 av5A+62/Nftf67JZiMGc76keWGxcOdi+d4tJJC8JaVwR4sN0735RE3qze6VO7/AYpWYbY
	 KYJA8Ffa7qOCrGFfwOkeQU36IykLN04PVOBycE78Z5Yw4wptL5PZ1OAu1GPUirMpLnyV8
	 m6iyetrciA2m2Gqo1nARIm/P/otQkoyL9+K8tb13AbuvFbUZMIkcymWHWP0063XFq3G1Q
	 Eo2sYiPoDxUZ/stp7komF/MZYLAgpqch9eC11gNMy75ra1r/daLZjUnDM9jR3vihrEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794208712;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nKobARkBm3jckAeWzRLINPL374n1cjc6XoeTqsHKNiU=;
	b=I24GMrP8LbTatEfrVvCYN+8Vwkuo1TlWEAUgqZ8YH98ARyXQTE3e5wyVdWPqAvQruMAE
	 yMWnmEyy6sSiOMXyJgpIFDfTXmIdSJG3cuicvUTl9etSwkBSKIu+7iX/FFDJrTfxgdrz8
	 ELB77CPMPk37zjQwncVP+72zlzMvVXNvVyOUkSV1naxH2d/8JvuqkTjgSIvqmj3p61eZA
	 XQUEL7uc1yosNSyLcmo0xnWJBEg+nIsyTK+C48+UElX6az2pIuoJ+lfzbbwttHtTnBx35
	 om+/rssNCPdLNtzHq+s6r9OfrMQ5o5m7YAcfnApb/x6gqY4TQhC6TneNaxsKm13fF+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yHFZmGFj;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54526606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 07:18:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54526606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yHFZmGFj
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3700ed8dbe3so1387412eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 23:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794208711; x=1794813511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nKobARkBm3jckAeWzRLINPL374n1cjc6XoeTqsHKNiU=;
        b=yHFZmGFjdpiEy/DkDAhRt+WwDBC/oURvyflBaXZQuRg5Cc+PBOKBXw6l4nF1EC6/Ku
         1w9MEk8iVlicKYKLMibemG/SaCqzMMMa4oCcgRGklWWO+WQg5KEn+lOpKRK2UHLoe3fI
         2LZcnYDdSTOfHpdPH4RpUT5xEQZkU63cNakMDL2Rt8h5o+h/9qefBLXO4lVW9geT4Fqc
         IxAFpd+IKhP60L+4mXLZlVUfEXL7aBEg0poMYFpkTz2rGPAiE+ZqHT4VpzPlv1iR3pjO
         PVnggzySWyHhtz9s64FCmHDnSrsPTKMyGLyfj1FmR+tKzfWDRUBkU+eURV0+mDfRK6ro
         8sng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794208711; x=1794813511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nKobARkBm3jckAeWzRLINPL374n1cjc6XoeTqsHKNiU=;
        b=aDtfmEgbFUxDIQ+fUyhGJnGNQUYbgkvFMwuMXV2z7p2VOvG7QT58lbEj0lIJqDXsik
         TW8m7PLKmMBsGZALEIlNJzhMGi1cLid9fotI1QBIeqbrNaC2TAkbqO9AP1mMwfKl0EGu
         WjAn7lazeQxzKdHRml3juGb/sQkRRRaXgTBsSGj7z/i9YrKuvbotsJFt7MtdDS0lJx9c
         vGPdb9O2pAnEw3rsPN3emNgAvd2Uyk0026YqlV3VvdzLxVYSJEhu+W0ZGHhmgMdD6vRH
         5vqM4WrtzMkyOFTI0mHtaxcGkhYXc8lZ9fKtSRAp2TUaL5LJ+IkjscCUbg9LnA7YRN7F
         9m7A==
X-Forwarded-Encrypted: i=1; AL+hErE54xGqIBBv72KQjOlmoOy7wuP6GTyF51RDIgdAeIzil95JEWLrptUweO1OP8ps4RyO4KUFbCHzPxVdr2w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+O7xWmCBVzZtmacOHd7Gl7xZcwjSaNMXAMA3P0XGR+ulYMGbWv
	5mmaxM1K8GIe1zIgGOnG8+zecuZCnQu44+FJmeHjt5tSkgDzzrybh8y7
X-Gm-Gg: AYBFou10P5/z51yUwp53qxGnOTRtBrnhGHUreK+qsKGmpQbQvgwAfp89HR4xIi/pCj6
	tQ1FEAHptgBCWaizubdqW/eKx90tdYDE9shWYdK6ZmMcFqY39s6oOKW6yLL2386ffg3pScvSjC8
	AuPZoQhrh9DNsdf58FLDh5FVQBGmhYbFrhgSQ3v2RugdcJhsZ8KrOJqkE+Whw8Lja6F65q57kME
	U4yIIR4yb+T7j5bjh2nqfpcuHQoRwYfBeQC/ACBaEl1MKMjweDCgIwvCnEW7kk/2oFqWuqNUzRq
	Diux2vJ6wLuYR7ijeP2wRU9kQgXydK7ldHurxM7tEW+F5upBXkrR5guG2D90zoK8WSTo97MaTSP
	9J5+gokDnXa7/jSCtHtPbk30EgBpCvWr1rl/KKTI7z9MVMdlxFPsVxhJGoFp+acGQ/wNEH5JIWP
	quSg4lbNT0Rfyzw6Y2cbu4qbMfHhkm3d/xflzu88y/MS/ffJZ4f1D5cJUTJsyaTwN2gutlRqcyM
	MU/5BnIE6dQijUKLyPttLTGRaFMxl6BKILt+d2XEZtfjYPDcwgUrX4J4OeuT9COSAkOOve+QQXJ
	kUbm5dUBD51Hpj31JoN9B8l7FwcmMOKyedS6rtD3vNPlDtO3/R0XooGlEQYFcCwNzZX27RvPiaw
	CGg+95IHbcP1pcxcr5Yk7zjKnyxML
X-Received: by 2002:a05:693c:41db:10b0:351:4866:255c with SMTP id 5a478bee46e88-3725e82af56mr6000056eec.32.1794208711363;
        Sun, 08 Nov 2026 23:18:31 -0800 (PST)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:cc96:e14b:76e:f8f1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372661ede11sm12878306eec.21.2026.11.08.23.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 23:18:31 -0800 (PST)
From: "Hemendra M. Naik" <hemendranaik@gmail.com>
To: netdev@vger.kernel.org
Cc: jiri@resnulli.us,
	jhs@mojatatu.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	vishy0777@gmail.com,
	tahiliani@nitk.edu.in,
	"Hemendra M. Naik" <hemendranaik@gmail.com>
Subject: [PATCH iproute2-next v9 1/2] tc: fq_pie: add support for printing per-flow PIE statistics
Date: Mon,  9 Nov 2026 12:47:47 +0530
Message-Id: <20261109071748.438946-2-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261109071748.438946-1-hemendranaik@gmail.com>
References: <20261109071748.438946-1-hemendranaik@gmail.com>
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

