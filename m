Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB894A3F1B
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789550202; cv=none; b=g2pVfCzAufteNhmOC+CUkZjuyhmIeStVWJAlh1aCapkuBWQcuFUNNbr0RJRVle1AmxOTqdE0CO9VMmzLbE22RrIDgXZor4HPCzHMchN40CpE+sQLErX6+9Wf599RRyusF3zzDsQ+FKQrYIBDp8L37eVpI7wrpA1Nt99pcce7fuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789550202; c=relaxed/simple;
	bh=6sTeDDjKSFvgsN4cu4tsIBYnWTn8JjdXtJLzUSVRVGI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cnru3ZNugMIpauOtZIaCdsoHgmcFJL/JQbrFvYXYeTerobLLqrdsYdMiwT8i8bjdmjLEgj/LDO4tN0ZHNm/bbMF07pm9f9lJAfUuBj/iE+bNclMb+jan8MY+L7eHx3UbbzeMiFjUQZ9YbS63fR9cRb9evqd1FhXdmCt1fh4D+Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Poj58zWN; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Poj58zWN"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b910bdf2eso444812a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789550193; x=1790154993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bAaYJ0cCHSkAupcV4TiiavIJbWVLvlaY/AF2/Kqu3b0=;
        b=Poj58zWNQCnM3Rb6zRi0eY8e9/xDCDKNY8WNeB1i3Wqj/ZvVweQLI2CEWYrYH30awn
         a7in4wnU9DVrKV5NdEENsHcZE+zWrtxEa/A+MtIAqyrwt93y8Z21fIOV5zIPiE/laEuj
         le7YIunlF2x4LH/YDqBu7hpaAUjXS7yzRxKI7H4i4PYtx+UxnRUgSPEMcsQpc6MJ6arg
         R8YxTMntP+ov8ASvZr6KuMaVNAZrh8EaYWtptfXZJSHqJCa/wSV86/vELjE4mWV9/1Im
         p/sjy236zedUppNWSwV3aTJX8JWaAiS4diRchbiuGDhOol4N6eh7LDRgbioPxYC4+Ild
         9RqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789550193; x=1790154993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bAaYJ0cCHSkAupcV4TiiavIJbWVLvlaY/AF2/Kqu3b0=;
        b=zJ4QNVlcrFXnioKGKzEc/Q6UWolCh50s40fIUkoXdrb5HhYxJAyVXKxv501TKiugmv
         jenlWwpcEPGKAaleG6HTRUkrRvqxx/BPFLiCAvjK3SbhacqR/PwJgUzlTb52rwDFdJqu
         Xti8sPdrYGjZ3oWn6dv5BmX/W0dfFgqvlEIEMsxrS0xGFTJYHIDuWa0kIMJsP7mJ2gbH
         /XjA0owMYPspck4IjFUT9Kyv6PjmkfBVVo8aQFHJGzSkMRaursO4kcVuYEcc3WJN3/u7
         SiQGeqiurSsgnJo7KObGV3X/ouyS4CqlMuUVsDEdBEKTViNk/v5winiiH05p2QC7olUf
         7cPQ==
X-Forwarded-Encrypted: i=1; AKwUvBwegk+0GkDj/eWgp7f7TQD5e0vWFCTpCIpGaRXvbr7lprK27sg2YLtJxwqgiUibn0D6W47AD+Mbr6O4iFg=@vger.kernel.org
X-Gm-Message-State: AFuF++lvRW6zg+tSedNDVe7RlDU4rBJXNG9OejpllWjAVwGw5hX99ff7
	VJV1MRwuwRn3dc84cJ9bjVtQQ5/w/Okby01gpli4ZwUV9vX47lGUtGcE
X-Gm-Gg: AYBFou2fgtV3gDYTDD08OgWD9zaaiLI5Zj1d4NRMUGyq1e3CN6h5GzNtCftVOHsRR0V
	lkRtQPzEYIvBFgeV4KijU+U+4W6XE4kE6MvY4gARRydqmUottwT7lULe1Fl3WMVt7yboYdpIocU
	sEB2Kp5650G5PnMMEszrPZAstTHp1P4bn0F/4anO+Ad2w10gSaACgX5+BwI0gJECDgDuc9ZeFbu
	KPN5Zt77AMxKRu+TsEREJUvzvXa3kpaG0d6EBUsuKrXg/nvRuRhZ/UQMzSO5+kkUco1/c6NRBRD
	sGX00NGAyV63HT4ZKRQOPX1vknafZM+kBALCtjzNiQzgVKz/JXmlOTCwH32c0dJnABE1+r39i/P
	f2KLGwjRn4BmdJB57R80GUy2K3i9kMARiHdO8wR3iwJjELB3qBc2q6BgvVwFz5fL5cisYqlc/7L
	KMbNenV1Y+hwU9dXhVg27TYqgzRPAqF2cvI6WMT3g3GbmzmTJV6F57ePf4JpFb+w3mLpjMgO47m
	OmLJwbbDVw348J2UQ==
X-Received: by 2002:a17:90b:2d4f:b0:39e:1b0c:4773 with SMTP id 98e67ed59e1d1-39e1df86c10mr4712387a91.0.1789550193313;
        Wed, 16 Sep 2026 02:16:33 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e19a2c2dcsm1414916a91.0.2026.09.16.02.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 02:16:32 -0700 (PDT)
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
Subject: [PATCH v4 1/2] Documentation/litmus-tests: Add SRCU fastpath anchor-before-scan test
Date: Wed, 16 Sep 2026 17:16:12 +0800
Message-ID: <20260916091613.78352-2-kunwu.chan@gmail.com>
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
increment.  P2 models an observer that sees the reader's increment
before seeing the anchor.

The outcome is forbidden by LKMM, and herd7 reports "Never".  See
SRCU-fastpath-scan-before-anchor.litmus for the reversed ordering,
which permits this outcome.

Tested with herd7 7.58 using linux-kernel.cfg.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 .../SRCU-fastpath-anchor-before-scan.litmus   | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before-scan.litmus

diff --git a/Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before-scan.litmus b/Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before-scan.litmus
new file mode 100644
index 000000000000..8028f2ade733
--- /dev/null
+++ b/Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before-scan.litmus
@@ -0,0 +1,55 @@
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

