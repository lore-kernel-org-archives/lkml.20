Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBF0394792
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789550219; cv=none; b=lM0isk66Pwgf9qyMbdfvnfIE2lYmzFxEhKckldMNlYzAzRLeSJCu/OqRuD5bL3lYEyg5SKN7zdJGD8HbwbAzu2QShvXutV1Rmw/fwDDDYgYN+Sjk1bblzkA91Ag49xxB6JUPwQ15B1sROf3TPEQsut3i6HqgSsAj5Wbm3DQV6kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789550219; c=relaxed/simple;
	bh=NXsR+7YdoDi6ZZdYasO2eePVdxt36IJHMMDJ4nl2K1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=blYvB++87jPvN1Qb/yETEFGezD9UylTCjwtdmcVsLflh93Gnyn1IpDb/J2oXo/GquDA2m5xAh4wfoJInIJ0anffROSaBElfy+pMBi8/uNIYb+Z1N1/FzuhXu/ZQyelGkcLni/MiEjOOpsxWPYZJaV5xCkA7KGXX/HRzmC58Ik3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PGB1pKpm; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PGB1pKpm"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ec6188so4994375ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789550201; x=1790155001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j6hU/GP1FtIfUUKp4semB07auuKYgomg3/U1as99ctQ=;
        b=PGB1pKpmuK5a3j+iaC9mAb5ftiK379LRC02H59pvK8hY4GFQ586yGAPnzUiqdkpF53
         QjHtsonRn6JMrHGPtZYZFwCfmgXxU3in3VKN4KKdksUtsfppIiV4lmU8JzkawhSb60ZX
         xkrZkpfLLKj5Wge4+MKh3AmXAxiVWT1htwI4QoFD6sQ4ic75SRJcDENlhuWGknuU2VJM
         Sa7dL1jvDI4npnPB047sG1NpPLnGT0SSTRGJau2GxMwTW4LQcPCBv/R7+txtVo7eLrqe
         afN7IS9tgX6psxENR7keuuEC2T2hZrjsR63o+HsGNROo0jPYiXMjjXygRnJqdFw+pijK
         pMRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789550201; x=1790155001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j6hU/GP1FtIfUUKp4semB07auuKYgomg3/U1as99ctQ=;
        b=ejcRtqPJ6HrnhmnKJOHJ0nSDnB45hbSJf8qhAZWU7dxEyceNguZxRAIX8Ryrl30n+r
         ZbGER1o1Dpr96+DDEdzZWCXTDMxuCck4YCXHMsaSJuZyczxg8tsX1cAKRlys3LHT8y9R
         Z2L0crQetS4SmUPLmneWEjwIsA4ZY+VLgp44Nnz5ztvZHCwo3hgjl/bLigyhm9m5Q69j
         iu0puR4OviK0z1lpTLVFw3JX8SuVt0VFqAFl4mK6bsxMkC8VP1EtiopHYIjcAzf5TNww
         p2iMCraVzJD4kOUGKMGq4OJ4PF8OgH0ChxIS5scT7LsCbOJiCqMa0uEIMg+xSwOQrhs0
         5X1A==
X-Forwarded-Encrypted: i=1; AKwUvBzk0IvOwcwXZKhhmN/SCAEH5YdcY1o/FyH0L0BonR1flLjfDNVywipddS6NKHNC8vmaJvXwYx63IXI78AE=@vger.kernel.org
X-Gm-Message-State: AFuF++ndvkoWz1hY5zr9zZ8VfKLD9eNDAFtIXF9p341MaDq+9pPnHmS2
	BDKrwvFwKWJT+CncB3nL2c6Sl/eEzwjsvFS4340vccdP7/rPOXDad1ac
X-Gm-Gg: AYBFou2SIXFewg+1ux4NsUUC7m455LTTWbSjnHH2s4S0MAx6+W3xWVuvL1O4TeDYHrN
	VhFQ0DNr70QEtRc8v5xvyHSE+8smx1P8J8DtMI8cSJPbWwYYDIqN0KE1G2SfiW3Y2xLvix4gxqm
	2tvO9dOx0+mppj9r/gPftq2LyIMzMpPBb4oDzttYsJvleJ85worj6TdVHUDM3FnPDxuEoBuq4p+
	Sj2J5MG+J8oAmz8lya7MAj9erOpNqEvbJeDQicRkw5YyxUczbUsjpWVej52GBGk3R6NuOPozauG
	dmrL5f8N/mODPISPpB6bdVELrI+4E2E/plYYCfgKG3Cwr5XaBd7QkzMjrfFFOxevumly7T+B7ev
	crXjstj6KaXZuAvVe/3mYIHHh1vsQSj0INRXY9MC92+mz0bm/PhbXBE/7YE9IsGDGOD8MyZ1gax
	HhkAshWnBvTk9TQoX5aJHSN7f7CXjMuXUiASVKJCLS6wF7lUIFSN3Ta1zrhfWy4U/g0tMYSa8QJ
	NC4Kd0wYkC2fC/wpw==
X-Received: by 2002:a17:90b:4d0d:b0:39d:f189:48d6 with SMTP id 98e67ed59e1d1-39e1e27b244mr4153452a91.4.1789550200800;
        Wed, 16 Sep 2026 02:16:40 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e19a2c2dcsm1414916a91.0.2026.09.16.02.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 02:16:39 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	dlustig@nvidia.com,
	joelagnelf@nvidia.com,
	corbet@lwn.net,
	akiyks@gmail.com,
	luc.maranget@inria.fr,
	j.alglave@ucl.ac.uk,
	dhowells@redhat.com,
	npiggin@gmail.com,
	boqun@kernel.org,
	peterz@infradead.org,
	will@kernel.org,
	parri.andrea@gmail.com,
	stern@rowland.harvard.edu
Cc: linux-doc@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: [PATCH v4 2/2] Documentation/litmus-tests: Add SRCU fastpath scan-before-anchor test
Date: Wed, 16 Sep 2026 17:16:13 +0800
Message-ID: <20260916091613.78352-3-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916091613.78352-1-kunwu.chan@gmail.com>
References: <20260916091613.78352-1-kunwu.chan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the synchronize_srcu_atomic() fastpath instead places its lock scan
before the grace-period anchor, the scan can miss a reader whose
increment was already visible before the anchor.  That reader already
existed when the grace period started, so completing the grace period
without waiting for it would violate the SRCU grace-period guarantee.

This litmus test models the reversed ordering, with the lock scan placed
before the grace-period anchor.  "seq" models the grace-period anchor in
->srcu_gp_seq and "ctr" models the per-CPU ->srcu_ctrs[].srcu_locks
counter.  P0 scans the lock counter before writing the anchor, with an
smp_mb() between them.  P1 models the reader-side counter increment.
P2 models an observer that sees the reader's increment before seeing
the anchor.

The same outcome is allowed with this ordering, and herd7 reports
"Sometimes".  The litmus-tests README is also updated to describe both
SRCU fastpath tests.

Tested with herd7 7.58 using linux-kernel.cfg.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 Documentation/litmus-tests/README             | 19 +++++++
 .../SRCU-fastpath-scan-before-anchor.litmus   | 52 +++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 Documentation/litmus-tests/srcu/SRCU-fastpath-scan-before-anchor.litmus

diff --git a/Documentation/litmus-tests/README b/Documentation/litmus-tests/README
index 6c666f3422ea..4d4ec9c6f2cc 100644
--- a/Documentation/litmus-tests/README
+++ b/Documentation/litmus-tests/README
@@ -78,3 +78,22 @@ RCU+sync+read.litmus
 RCU+sync+free.litmus
     Both the above litmus tests demonstrate the RCU grace period guarantee
     that an RCU read-side critical section can never span a grace period.
+
+SRCU (/srcu directory)
+----------------------
+
+SRCU-fastpath-anchor-before-scan.litmus
+    This models the synchronize_srcu_atomic() fastpath with the
+    grace-period anchor ordered before the lock-counter scan.  This
+    ordering prevents readers that existed before the grace period
+    from being missed by the scan.  See
+    SRCU-fastpath-scan-before-anchor.litmus for the reversed
+    ordering.
+
+SRCU-fastpath-scan-before-anchor.litmus
+    This models the synchronize_srcu_atomic() fastpath with the
+    lock-counter scan ordered before the grace-period anchor.  This
+    permits the scan to miss readers that existed before the grace
+    period, violating the SRCU grace-period guarantee.  See
+    SRCU-fastpath-anchor-before-scan.litmus for the opposite
+    ordering.
diff --git a/Documentation/litmus-tests/srcu/SRCU-fastpath-scan-before-anchor.litmus b/Documentation/litmus-tests/srcu/SRCU-fastpath-scan-before-anchor.litmus
new file mode 100644
index 000000000000..7df0641b5470
--- /dev/null
+++ b/Documentation/litmus-tests/srcu/SRCU-fastpath-scan-before-anchor.litmus
@@ -0,0 +1,52 @@
+C SRCU-fastpath-scan-before-anchor
+
+(*
+ * Result: Sometimes
+ *
+ * If the synchronize_srcu_atomic() fastpath instead places its lock
+ * scan before the grace-period anchor, the scan can miss a reader whose
+ * increment was already visible before the anchor.  That reader already
+ * existed when the grace period started, so completing the grace period
+ * without waiting for it would violate the SRCU grace-period guarantee.
+ *
+ * This litmus test models the reversed ordering, with the lock scan
+ * placed before the grace-period anchor.  "seq" models the grace-period
+ * anchor in ->srcu_gp_seq and "ctr" models the per-CPU
+ * ->srcu_ctrs[].srcu_locks counter.  P0 scans the lock counter before
+ * writing the anchor, with an smp_mb() between them.  P1 models the
+ * reader-side counter increment.  P2 models an observer that sees the
+ * reader's increment before seeing the anchor.
+ *
+ * The same outcome is allowed with this ordering, and herd7 reports
+ * "Sometimes".  See SRCU-fastpath-anchor-before-scan.litmus for the
+ * opposite ordering, which forbids this outcome.
+ *)
+
+{}
+
+P0(int *seq, int *ctr)
+{
+	int r2;
+
+	r2 = READ_ONCE(*ctr);
+	smp_mb();
+	WRITE_ONCE(*seq, 1);
+}
+
+P1(int *ctr)
+{
+	WRITE_ONCE(*ctr, 1);
+}
+
+P2(int *seq, int *ctr)
+{
+	int r3;
+	int r4;
+
+	r3 = READ_ONCE(*ctr);
+	smp_mb();
+	r4 = READ_ONCE(*seq);
+}
+
+filter (0:r2 = 0)
+exists (2:r3 = 1 /\ 2:r4 = 0)
-- 
2.43.0

