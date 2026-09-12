Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BD32F3632
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 02:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789180974; cv=none; b=kh/EmMbrO9cotOqBgs8XZ9S8cAOUThftGgWxpMexWNKOwSlc8cBLqVCcbl//dT3vY9+RBO2ovDGMEjifVNazmMoEo+DpJuLa4BT6wlb1lSISW/guWk2AF1aANnxiQrTh6izLTFm5XsA1+TGWjX4IvDJU0oufTpk1zZB9/DrNRig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789180974; c=relaxed/simple;
	bh=yIOgwWYaZtGZFD7XRrXRqAp5oBf5PZvCJzw4s9fhOhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H8PRikvHzN8WZ3OAGGjDMM27HWN1wLgb3dayeSE/wC2OWdXHlYT9rDQkJ8/avjcAxF6UCEdH4JM9P4Mj3Z5J9+Xl8au8YZzGrQTSCj5XGTnAyk+JqJREBVl1QNR7VOwjoW4luThO5PPYJLndvJ2U6K1RIShi2BIypXVQKkQP7R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fQKxZZJa; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fQKxZZJa"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb751so404416a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789180973; x=1789785773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TDgCYCqvsV7FflkdMtZWp0g7e5LSxJ9jwQDT4UKWYqw=;
        b=fQKxZZJaeT55zMImLo4V2/E6W8ISr5bwzQ0q9ybMZcSqD0xakdrAwK/QoMoj+EftFb
         OnvG89pyEVrO0K1kksyQ8ZJENc3HLighoukj1K2glrbBsJNxN1Vkb34p5eLVVcRlKGBp
         LVhHW1EeLbSzF27KqusghsunFhn9Jv8n1Nq+XOGhjoDIbdmy4W7/Uez1HmD1VHgNek7p
         ql+vrdXniNJsAXnwliXPBoXVtAA8aeGHQxXX3j0T+K3dPwTdHGYYi8x+HfxhAAyXP/iB
         UGGkRDGpOhXGLv+dxftm5khBxjqIe51x2tsIkIYbqsQrjxpmVMZ02hd97RKg/JpPXuwR
         2b7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789180973; x=1789785773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TDgCYCqvsV7FflkdMtZWp0g7e5LSxJ9jwQDT4UKWYqw=;
        b=W9XJF2ewh2YOV6WV4YM4BoWRoX3bR6vBd0vBpvtQlfPW28cBk7PjDGTv59N7kClVKz
         eyrw/Bcm0YBh6bd+7tCAnBufG+hfoXtynZA0EoNdVINm3pQn8y0FDktjBU+u8pP9U8CV
         KaOPJ4VwHiOafiQBWR11tZlTtGg7JaxHTWD00C2Hc+6GOL/OJD+LOteQqNG4Cu3R+EUI
         zBPwJmMDcYOKNVUoBBTraY2hpjNFbXkMJ8sXzRaDgdXv6QtGGrC5L/3CQKb2Bgdi25Hp
         pWM8wfByXfs9aZZ5WwF+l2cXM6lKW0s27AwRN6Ze9Hm4RR/FHXNdZkxZS87f/yrE5Mkc
         HvLA==
X-Forwarded-Encrypted: i=1; AKwUvBxYSdvY0GMB+quEYMOgjGHqCYmtgcDxNaaogmLOuolOg18/rBa8Y5M24mLEdP8jhNB6rAuSe67R62f+4Ak=@vger.kernel.org
X-Gm-Message-State: AFuF++l2p/t5KVvgNoIQvNFWEYDstcZ7Y17jd5Z4kmb3hOi9EdCWWq+z
	Z9nd6B6jJ+Q4Jrgi4fZ4nUOPdENcJC1uLTgQuMXjc2aP4mG5TcAiCdsI
X-Gm-Gg: AYBFou3/mTO5RGr/Y7tY/MA3j2YRa/+fFM7a0sxGmrhxmaurieyR6YETi5lbTu9/vOG
	pMQ8cPiRcKp0aazXFIyLWwyMHiL1kfqQl+cecDLZBOUw/o5WinTc/EEEas4ebGTDTyW/44NyB33
	3k2AS+Lcpp9vY2Hb1ig1UoMlQd6ILnZ2gTNkMdw6dZ65/eTHttKIujtTKW8CoXkhfD4rwq5iDIT
	2WJv1L2SdRkwiDAxFbCcBrtSPA9v2rz8J2Sn3zFsSWvOPGMFHOxtXJJTKIShFrk7dXkxVoE9RQ6
	IimEJo2p71oXDZGDtIyOwJ0KKBsS8zz6SrArL8BCHAJNK9FDbMg2CgWzl6p2eDqfcQml7I4qLEX
	7ZDNAXNQYNNzw5xN9HeXzDlC/GH8YAArth1y+vSwRt5z8HhGRXxdrkpVrJRLCp30LUzUbu1YbqH
	iuko6DMaa1656Duy9oSl0HcV5xjlDHWdkvl9trQk4JKg+TsKCgvgdzZcjcpT5/2mOwKhgvyl+PF
	adV2UpB9PdLT+Y1Fw==
X-Received: by 2002:a17:90b:1f8e:b0:398:b88c:2b7b with SMTP id 98e67ed59e1d1-39d9bd9917cmr13284613a91.8.1789180972076;
        Fri, 11 Sep 2026 19:42:52 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d950913a6sm7879099a91.6.2026.09.11.19.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 19:42:51 -0700 (PDT)
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
Subject: [PATCH v2 1/2] Documentation/litmus-tests: Add SRCU fastpath anchor-before-scan test
Date: Sat, 12 Sep 2026 10:42:24 +0800
Message-ID: <20260912024225.2872265-2-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260912024225.2872265-1-kunwu.chan@gmail.com>
References: <20260912024225.2872265-1-kunwu.chan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

synchronize_srcu_atomic() may end its grace period immediately when
its scan of the per-CPU lock counters finds no readers.  Correctness
requires the grace-period anchor written by srcu_gp_start() to precede
the smp_mb() ordering the lock scan.  This ordering ensures that any
reader whose lock increment is missed by the scan cannot have
incremented its lock counter before the grace-period anchor, and
therefore cannot be a pre-existing reader of this grace period.

This litmus test models the key ordering between the grace-period
anchor and the lock counter scan, where "seq" models the
grace-period anchor in ->srcu_gp_seq and "ctr" models the per-CPU
->srcu_ctrs[].srcu_locks counter.  P0 writes the anchor before the
smp_mb() and the lock scan.  P1 models the reader-side counter
increment, with the smp_mb() of __srcu_read_lock() following the
increment.  P2 models an observer that sees the reader's increment
before seeing the anchor.

The outcome is forbidden by LKMM, and herd7 reports "Never".  See
SRCU-fastpath-scan-before-anchor.litmus for the reversed ordering,
which permits this outcome.

Tested with herd7 7.58 using linux-kernel.cfg.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 .../SRCU-fastpath-anchor-before-scan.litmus   | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before-scan.litmus

diff --git a/Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before-scan.litmus b/Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before-scan.litmus
new file mode 100644
index 000000000000..efa9c0c4e047
--- /dev/null
+++ b/Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before-scan.litmus
@@ -0,0 +1,57 @@
+C SRCU-fastpath-anchor-before-scan
+
+(*
+ * Result: Never
+ *
+ * The synchronize_srcu_atomic() fastpath may end its grace period
+ * immediately when its scan of the per-CPU lock counters finds no
+ * readers.  Correctness requires the grace-period anchor written by
+ * srcu_gp_start() to precede the smp_mb() ordering the lock scan.
+ * This ordering ensures that any reader whose lock increment is missed
+ * by the scan cannot have incremented its lock counter before the
+ * grace-period anchor, and therefore cannot be a pre-existing reader
+ * of this grace period.
+ *
+ * This litmus test models the key ordering between the grace-period
+ * anchor and the lock counter scan, where "seq" models the
+ * grace-period anchor in ->srcu_gp_seq and "ctr" models the per-CPU
+ * ->srcu_ctrs[].srcu_locks counter.  P0 writes the anchor before the
+ * smp_mb() and the lock scan.  P1 models the reader-side counter
+ * increment, with the smp_mb() of __srcu_read_lock() following the
+ * increment.  P2 models an observer that sees the reader's increment
+ * before seeing the anchor.
+ *
+ * The outcome is forbidden by LKMM, and herd7 reports "Never".  See
+ * SRCU-fastpath-scan-before-anchor.litmus for the reversed ordering,
+ * which permits this outcome.
+ *)
+
+{}
+
+P0(int *seq, int *ctr)
+{
+	int r2;
+
+	WRITE_ONCE(*seq, 1);
+	smp_mb();
+	r2 = READ_ONCE(*ctr);
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
+filter (0:r2 = 0)
+exists (2:r3 = 1 /\ 2:r4 = 0)
-- 
2.43.0

