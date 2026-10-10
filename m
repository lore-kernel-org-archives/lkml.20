Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99052414409
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 06:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791615354; cv=none; b=ILGq9sHPYcpWSFLSXKfV8QFTe48Fs8eQhx0FjbbXyIP2SZnRtiO84m14CErIemz4ck6ZwOlwxlLIXI87HSjM1ZJ05zktQaBF9I+HCUGuftF+bCEW1eKumk2o0QwBI/RGIz5lcCiwCibFIBTlkUWCkx1/z607WHcOCfZM8n7MxzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791615354; c=relaxed/simple;
	bh=5n3Bt0KAZOlUUymoVVDlUyHCw9bJ1wKlVf5MS/5k0es=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tnqAjozo8NkSc0wKsTu4jJmc/NQNNDOxV+5aUOJXg5PQv0WW/zcYnK7zxm3VhQ0oLPJglcRevnIoRWW8XXjv5qZzQ6m4sGjVtYMu4uW4CTB2/bsXpZu6Gv5+AEnisjd5Td3SYKUHGYh6kO1H2XVy8P2aQ+RXOP03I3QXRAyZLuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GdCJdeCV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GdCJdeCV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B90A1F00893;
	Sat, 10 Oct 2026 06:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791615353;
	bh=JOiUkN7r2Yeqd3aPeXM7mU/7MNeWq1sCh7vWVmWB6IM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GdCJdeCVWTngnRoJPARDVzsKUxv9wJM3oQuo+SGP3xA5kRR4+R9NeH3R2OTSVQHVX
	 iK1v5dDlh01XBndl3MZfj0ERycFAuzdXy/cedmu2NyNErjGfjzm0LbVmJJRiwynvsS
	 0DEhYkHOoLWaWthnwNCtcBSGSL2tUmGx/eXFRWmyo57547W+iJjqTMCCAeUVdaZRpZ
	 esAmxMXpAU1bLqiBQqvWSABUmgu5xgwvrCgSu+Li8X0QpMWE7DfrMHqALzIoPaSdTJ
	 iKYF7axicYp5V1mzjqVItI67N/6Zxo5IeMU7tdaYoOaij6EvaXtNVsdFhgn+DHiofg
	 RPv8PFbO/yNHQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>,
	stable@kernel.org
Subject: [PATCH 2/2] f2fs: fix to use bio_in_atomic() in f2fs_read_end_io()
Date: Sat, 10 Oct 2026 14:55:46 +0800
Message-ID: <20261010065546.1762091-2-chao@kernel.org>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
In-Reply-To: <20261010065546.1762091-1-chao@kernel.org>
References: <20261010065546.1762091-1-chao@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chao Yu <chao@kernel.org>

f2fs_read_end_io() uses "in_task() && !irqs_disabled()" to decide
whether it is safe to sleep, the result is passed down as @in_task to:
- f2fs_put_dic() -> f2fs_free_dic() -> f2fs_release_decomp_mem()
  -> vm_unmap_ram(), which may sleep.
- f2fs_end_read_compressed_page() -> f2fs_cache_compressed_page()
  -> f2fs_grab_cache() -> f2fs_lock_cache(), which may sleep in
  wait_on_bit_lock().

However, the check still treats below task contexts as sleepable:
- with spinlock held via spin_lock(), i.e. preempt count != 0 while
  irqs are enabled.
- with BH disabled via local_bh_disable().
- inside an RCU read lock on kernels with CONFIG_PREEMPTION.
- with any spinlock held on kernels without CONFIG_PREEMPT_COUNT.

So the "sleeping function called from invalid context" issue fixed by
commit 08a7efc5b02a ("f2fs: vm_unmap_ram() may be called from an
invalid context") can still be triggered.

The block layer provides bio_in_atomic() for exactly this purpose, it
checks rcu_preempt_depth() and preemptible(), and conservatively returns
true if CONFIG_PREEMPT_COUNT is disabled, let's use it instead. The
difference is as below:

 old: intask = in_task() && !irqs_disabled()
 new: intask = !bio_in_atomic()

 Context                              | old intask     | new intask
 -------------------------------------+----------------+----------------
 Hard IRQ / softirq                   | false          | false
 IRQs disabled                        | false          | false
 spin_lock() held, IRQs enabled       | true (wrong)   | false
 BH disabled by local_bh_disable()    | true (wrong)   | false
 RCU read lock (CONFIG_PREEMPTION)    | true (wrong)   | false
 Spinlock held, w/o PREEMPT_COUNT     | true (wrong)   | false

Note that on kernels without CONFIG_PREEMPT_COUNT, bio_in_atomic()
always returns true, so dic freeing will always be offloaded to sbi->wq,
and compressed pages will not be cached in f2fs_read_end_io(); this is
the price of correctness, since there is no way to tell whether the
current context can sleep.

Cc: stable@kernel.org
Fixes: 08a7efc5b02a ("f2fs: vm_unmap_ram() may be called from an invalid context")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 86150f7a372c..8da443fec0a6 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -271,7 +271,7 @@ static void f2fs_read_end_io(struct bio *bio)
 {
 	struct f2fs_sb_info *sbi = F2FS_F_SB(bio_first_folio_all(bio));
 	struct bio_post_read_ctx *ctx;
-	bool intask = in_task() && !irqs_disabled();
+	bool intask = !bio_in_atomic();
 
 	iostat_update_and_unbind_ctx(bio);
 	ctx = bio->bi_private;
-- 
2.49.0

