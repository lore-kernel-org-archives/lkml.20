Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1B43D1A8E
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 06:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791615353; cv=none; b=pwcXhATcJ2kotOkJYekiIGEIf9fqSJgcEVAxkERYyPy4+ZsGwpPfsZYJqaB/P+keq43wlevEaXeR769GbZ7d9yw2NZIwI4cqX8wyQFZaoMhtosCSnZ47lfCK7JvdXuWJ1p/JsaK5GGLMIPmKGplmZy27auh+K6yKfsB3qHa8F74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791615353; c=relaxed/simple;
	bh=46pdqWWWiOsJ5zguAHSYvDLWrSpcqWMhxDddkipq130=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hNLFKEJejz8IDN9hHkK9occaHWT+V97qni5sA+7XvzpFKmBtI8k2hxytJc6/TaOBTrLSMqFamjKzPg/34Pt4YljBCvwBTUaw72xINu6JeYm/8OH8W3cVmkZwUaVZVYzZxWoZmU1B9lVgKZLysSUzxNOhbXsAo/bfntFnrA2Pxl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OH80fbb7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OH80fbb7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB5C91F000FF;
	Sat, 10 Oct 2026 06:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791615351;
	bh=QRWnPGtWKckNp3hs8edix9eHlTIjDYrtAUIeCheZUps=;
	h=From:To:Cc:Subject:Date;
	b=OH80fbb7FijIsySrCttb8hNTS0py1Tro1H3JnuxrFmx6UbThO+JXzIiQfsKTusWFR
	 a0rkAQXZbpoQagFC2GpYv4ZulK6+YIpEDCCJPm6VSLGYXrExGljrmqmT49ot2SynbO
	 9JWskV+pdL3psv0K1YBQjMlKqVV4pHhiLLK9PKbmIqJc/i6yMq0qZgdUHHW0CShS3a
	 V3Vwuw1ss9y5W/THs75nt7GrwV2wjSarT7MjdCrx5XcBwBVWd61y8RRFDZ6/PbtjmF
	 FyByD0FJbS5FUxLPSfHZDPbR2WBceWcdA+r6ZWHeDOu3P5uv48APr6GIAx2XFT5Jxo
	 5ObqeGhvZ5V0w==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>,
	stable@kernel.org
Subject: [PATCH 1/2] f2fs: fix to use bio_in_atomic() in f2fs_write_end_io()
Date: Sat, 10 Oct 2026 14:55:45 +0800
Message-ID: <20261010065546.1762091-1-chao@kernel.org>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chao Yu <chao@kernel.org>

f2fs_write_end_io() uses in_atomic() to decide whether a write bio which
exceeds max_atc_write_bio_size or max_atc_write_bio_entry_cnt should be
completed in sbi->wq rather than in the current context.

However, in_atomic() is not meant to be used outside core kernel code
(checkpatch.pl warns about it), as it only looks at preempt_count(): it
misses irqs-disabled and RCU read-side critical sections, and on kernels
without CONFIG_PREEMPT_COUNT it cannot see spinlock-held sections at all.
In those contexts, a large write bio will still be completed inline,
which defeats the purpose of the above knobs.

The block layer provides bio_in_atomic() for exactly this purpose, it
checks rcu_preempt_depth() and preemptible(), and conservatively returns
true if CONFIG_PREEMPT_COUNT is disabled, let's use it instead. The
difference is as below:

 Context                              | in_atomic()    | bio_in_atomic()
 -------------------------------------+----------------+----------------
 Hard IRQ / softirq                   | true           | true
 IRQs disabled, preempt count 0       | false (missed) | true
 RCU read lock (CONFIG_PREEMPTION)    | false (missed) | true
 Kernel w/o CONFIG_PREEMPT_COUNT      | IRQ ctx only   | always true

Note that on kernels without CONFIG_PREEMPT_COUNT, write bios exceeding
the thresholds will always be offloaded to sbi->wq, since there is no way
to tell whether the current context is atomic. The thresholds default to
UINT_MAX, so the default behavior is not changed.

Cc: stable@kernel.org
Fixes: 3de6b8094115 ("f2fs: Run f2fs_write_end_io() asynchronously")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 2613e8821af6..86150f7a372c 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -398,8 +398,9 @@ static void f2fs_write_end_io(struct bio *bio)
 
 	sbi = bio->bi_private;
 
-	if (in_atomic() && (bio->bi_iter.bi_size > sbi->max_atc_write_bio_size ||
-			F2FS_BIO(bio)->entry_cnt > sbi->max_atc_write_bio_entry_cnt)) {
+	if (bio_in_atomic() &&
+	    (bio->bi_iter.bi_size > sbi->max_atc_write_bio_size ||
+	     F2FS_BIO(bio)->entry_cnt > sbi->max_atc_write_bio_entry_cnt)) {
 		struct work_struct *w;
 
 		w = &container_of(bio, struct f2fs_bio, bio)->work;
-- 
2.49.0

