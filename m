Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E2A424D5A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788767933; cv=none; b=HqPJ9GJJiKJbwFj7zOG4mfWHy4nS2wHV7Rq3ltCphI43giBB809/uZHYn9QPJpUDuwolRZPfEbGicr1qEG8AfyISjIAMZoNM1nD7eue03JTF94km/M2BI2S/hpnd61oVbyc+x7N7Oni+EnbjPfExQImAnF4DhFvT5X8avOwpNn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788767933; c=relaxed/simple;
	bh=mxf0oO1tznDF9cRWAuZoopNyrJAvMa4wUwk5Nu5DUh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MywZ+Vc2oM6thj8fC/SSc4FDzc7xSTjtWTywwSTQls+6XRQ5uTk36u6CQoocDbKx/e3oCshl3tP7doxClmyArfQLIhZmmP6CH8Z43b9+y7yJAtkkIVgBqPVV64sli3XlfRBP90MK7vIRNaFOuMgsuCD7PG8CRKxtwQ8pKgfXpwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cvySR5mV; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cvySR5mV"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d71ae3455aso48059835ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788767931; x=1789372731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CwNQOTYYKAxRvINgOc7TCo5ZbK+NqIUlV7D1RviVpA8=;
        b=cvySR5mVV8FYAZO5T9LNWMbF5aaQryYNU1ItvVjm4lTFJdrgGV50wqQPKJaCcSD9Xm
         /vyPIKgDCOwleXmxOmASHaHjo15kn6F6JI/kGz6onn5HNe6PqGheS/SbVml38897wp4B
         nklQzg59EmY4PmYRZNvsSzja5pH8FqOcay4F68hPgnFCqcnNxEP9xW45TQ05aqdni2z0
         Hg4dNPge9JW2oX5YWH8cizLfgcoBTKCN3zk6IaoOD5p4VyhmVAB18Z0EiJhw9kmyTpDn
         BkjZOhnDf1HAYpUb4B//U/rZsdiCwBb7Gy6qOOmI1j+F5J1teJBOZtS8dqxnjfKrlYMX
         P0uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788767931; x=1789372731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CwNQOTYYKAxRvINgOc7TCo5ZbK+NqIUlV7D1RviVpA8=;
        b=eQ5jq58ZykX7JMgEFylj4E9GqjnXCO4ZjOOthDYsJxjKm2FFtMF8djviW+2JUqoXtg
         Sy7YwdrlJUHzFEybVKu2dVzKMOoKqLqiZkpa4VPBhzv2I4ieJYqziO5/G9urcLmcqBuP
         E82mD3jGMLJjTlMYLPbUqEsyAK7bwAsGren9SGmq3aLKfvEVSZbzwiH8LCC5SJhc7aYx
         6IWQkIpAEw9xA94X0B37DrYr4SCSDI4osRoxEbePuPSjDdKPk1uMFmz6cxyffiPbHwnW
         yPu7/Rk/hZNvub7zTKPF9VycXOWYB2/Cb/2D93Na0P52kfhtJhDqVM8/7ClHkxLMkMgn
         q6Gw==
X-Forwarded-Encrypted: i=1; AKwUvByhLZId8ByC6gKxi9M12R6NxAQ744NE/ZMTPUsO3BGwymKdWcRPDjAqyHdJwWZy0RTDtH50hex2HvAohVc=@vger.kernel.org
X-Gm-Message-State: AFuF++m/Wi7coR2YJNXDhlO0+OX3npWCju7dGErEIvK9Mfh7HKYdQWGP
	e9PbOF0l7p/X7sUT8R4NCjV7zeB5UweGuwf+p+b0HNOVuTzosPHixDQp
X-Gm-Gg: AYBFou1C/DEmTQahatrsotyKQQcldJCWojj1Ie04s1fL3HDOBiK7DFmbkd536BkHJS8
	TG0K7ziL0xRku72q11Y7U3k33Ddc8Vz31aInGFhxo/ToDpjaWa8bg8eLh39d4zK5dgh2I4P2Yii
	ACJalcWf4gMTa+TAnvlsoPnG0hPVUQCeXgNlh0xXXOqI5yDKOGwPkSJCG0rkDn2ASwyE3SCyqqH
	pDxEv2qh3QsFG3PBjvxsSEuYN5X4A76TWsCI7bLsLMkdjRGzPcvqvzqE/eLk4PRI49lmwidpf1F
	9PDTm8UYynAUMkhNcW9ZrT/6XeBtc7/BqCqzVP0KL7lh2cXLlzl1gpuC9+3YUMEUVaILjZ+UQ3X
	9PYPjHcLtt78uu561iBxApEZJepntk2KG4c7HCGnc1dwjkbH/b89Gdm3tCXlXaWqDc27/rneMxo
	+ZbrflKRHUl/mfZ2B4lInmoVK05jtmK5r64lXrXYeyQLPC9w2BzWIhVrsM9PnbHFIISekvmVdWe
	kC5Y9E=
X-Received: by 2002:a17:903:3c27:b0:2d9:b60d:7755 with SMTP id d9443c01a7336-2db125cd34bmr317335215ad.1.1788767930431;
        Mon, 07 Sep 2026 00:58:50 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae7637sm40945595ad.79.2026.09.07.00.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 00:58:50 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
X-Google-Original-From: Kunwu Chan <kunwu.chan@linux.dev>
To: paulmck@kernel.org,
	jiangshanlai@gmail.com,
	josh@joshtriplett.org
Cc: rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: [PATCH 02/13] litmus: Add SRCU fastpath scan-before-anchor test
Date: Mon,  7 Sep 2026 15:58:18 +0800
Message-ID: <20260907075829.2073224-3-kunwu.chan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907075829.2073224-1-kunwu.chan@linux.dev>
References: <20260907075829.2073224-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kunwu Chan <kunwu.chan@gmail.com>

If the synchronize_srcu_atomic() fastpath instead places its lock scan
before the grace-period anchor, the scan can miss a reader whose
increment was already visible before the anchor.  That reader already
existed when the grace period started, so completing the grace period
without waiting for it would violate the SRCU grace-period guarantee.

This litmus test models the reversed ordering, with the lock scan placed
before the grace-period anchor.  "seq" models the grace-period anchor in
->srcu_gp_seq and "ctr" models the per-CPU ->srcu_ctrs[].srcu_locks
counter.  P0 scans the lock counter before writing the anchor, with an
smp_mb() between them.  P1 models the reader-side counter increment,
with the smp_mb() of __srcu_read_lock() following the increment.  P2
models an observer that sees the reader's increment before seeing the
anchor.

The same outcome is allowed with this ordering, and herd7 reports
"Sometimes".  The litmus-tests README is also updated to describe both
SRCU fastpath tests.

Tested with herd7 7.58 using linux-kernel.cfg.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 tools/memory-model/litmus-tests/README        | 16 ++++++
 .../SRCU-fastpath-scan-before-anchor.litmus   | 53 +++++++++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 tools/memory-model/litmus-tests/SRCU-fastpath-scan-before-anchor.litmus

diff --git a/tools/memory-model/litmus-tests/README b/tools/memory-model/litmus-tests/README
index d311a0ff1ae6..449747c6db9e 100644
--- a/tools/memory-model/litmus-tests/README
+++ b/tools/memory-model/litmus-tests/README
@@ -137,6 +137,22 @@ S+fencewmbonceonce+poacquireonce.litmus
 	Can a smp_wmb(), instead of a release, and an acquire order
 	a prior store against a subsequent store?
 
+SRCU-fastpath-anchor-before-scan.litmus
+	This models the synchronize_srcu_atomic() fastpath with the
+	grace-period anchor ordered before the lock-counter scan.  This
+	ordering prevents readers that existed before the grace period
+	from being missed by the scan.  See
+	SRCU-fastpath-scan-before-anchor.litmus for the reversed
+	ordering.
+
+SRCU-fastpath-scan-before-anchor.litmus
+	This models the synchronize_srcu_atomic() fastpath with the
+	lock-counter scan ordered before the grace-period anchor.  This
+	permits the scan to miss readers that existed before the grace
+	period, violating the SRCU grace-period guarantee.  See
+	SRCU-fastpath-anchor-before-scan.litmus for the opposite
+	ordering.
+
 WRC+poonceonces+Once.litmus
 WRC+pooncerelease+fencermbonceonce+Once.litmus
 	These two are members of an extension of the MP litmus-test
diff --git a/tools/memory-model/litmus-tests/SRCU-fastpath-scan-before-anchor.litmus b/tools/memory-model/litmus-tests/SRCU-fastpath-scan-before-anchor.litmus
new file mode 100644
index 000000000000..931a41014de7
--- /dev/null
+++ b/tools/memory-model/litmus-tests/SRCU-fastpath-scan-before-anchor.litmus
@@ -0,0 +1,53 @@
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
+ * reader-side counter increment, with the smp_mb() of __srcu_read_lock()
+ * following the increment.  P2 models an observer that sees the reader's
+ * increment before seeing the anchor.
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
+	smp_mb();
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
+exists (0:r2 = 0 /\ 2:r3 = 1 /\ 2:r4 = 0)
-- 
2.43.0

