Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFF22E2DDD
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 19:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791228082; cv=none; b=n0Hvuk/m9I2rDmJPMwtIfpiT7J1esF3GnV9ehLRz3Ck6mFua4zsMtrROqJ4LK29cx21pKPTbATEP06t0eoErwtxjY+NI+LjjdkOw1S2CU8BPECX0kkOxfSLOyenDfSx6RPt50RXNijKEjQ+/yZaFWkAdQl93+crXvKsgD/hsalo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791228082; c=relaxed/simple;
	bh=WdNVK+AqrFIb2aILuRPr31XV+G7xT8qwa+m+x9fR6GQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lXQpgX6oWgkhBF6s45HQqHEKZZTQDpz95r+mlEGkvHdea4aXFpr0Kdc7NaWUCCa4SFhrCQG+WazCSJ/AXEeDcDnRbYI4AiC4s1GPkBJTEwiFY1xxrZtfxNbe0zatww6oDh7Jt5fQHNdA/szC2CkTY8KaLGqGI/3uxDABgUXr83g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c773pYwE; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c773pYwE"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0d31bda43so1194384a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 12:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791228080; x=1791832880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZEnRrgsQfhAwpSCq6/7foeNKRR+8Ltv0O6gdOmb9ryo=;
        b=c773pYwEPMCLqwWAvJuogIuBCmm1eQ/hlivSy7Cv14mRF50Ti2wOc8482WK3Pm5rq6
         VdGDq8rLToaroGg0q2EVFYMQ9Xjo3rkgNXh8R9e93onTnfmKD9BFxHFk3daioCQ4Flyo
         2TpinnKHJhKTuDsrDap/skPK+2zFHWEE6i28e98dWxyrkvdEF76wMQqhoSxogDjPdE3a
         91H8XYAk5Rq8A+A5uGxL5OtbJW1rD7SE4v99Cnpj9sj/wnY/f98J5cXXNh48rrZf6KMb
         npROO4IykH4kmeLv0r9YiG6D6R5m1B16B1EUJus5Hzc/d6XLW1lnxG9KTQHJdKkyLCbW
         N+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791228080; x=1791832880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZEnRrgsQfhAwpSCq6/7foeNKRR+8Ltv0O6gdOmb9ryo=;
        b=Zvfas9JnyW6e+Ib2MOmLW/qMPmyTZ+tkrUo9IrPkTcrbqwmN9ufDPbm7+ZWbapPDL1
         +w26yGjnvvtd2w2OrK0ECckCQjtuRQsHvd2WjbOaoEEFVCR9cuncsDz67plpWI94+OZF
         2OLqTAjfno9mCScZbgLRK7gj1LSLgeDmEMRknUPYoA5jRGyFsXt63LaExx9ew0IVRph8
         /yyw7K5klK5QOuq6UQvMmBIKP8Jj6ZuqDJI9b7KoT5DMg9fHPt6/mjybaO6CfEMPg42n
         2BJEhJ0sF1MhhahBw3Po+LdwovY8uspqUGhABNHdafzTy7Zkocbn/C9gj1vMAXpbTBTK
         3yCg==
X-Gm-Message-State: AFq9FYL9y1EqK5jpPoX+2iPbmG+25Xtg2GXrOpMaaNi7ebIh6aIab43V
	8Gf9lqPYYqmBcGLghEC5nlZpfi/f6A4/P0vQh/JNmDNUHigILYXzG+qeYcesRA==
X-Gm-Gg: AYBFou1dV/ETxABChP1TdXD+2f/v8kIUuwsnTuAHesJs8Z5nfRg67hk/cHtOABSpbkp
	p9fShEgWKnnN7mn1oNDSSKb65xo2bG04eeCNtzHzBe0afULh3sEtp/ZyhGUalIPS5YUJmr9xcO8
	IvPQMi7V35vHSZtJ+YLPXh2IJ6xXsDpoWPNKQi//hzj9J0ey0BVGLtJZja+HkTCzR57vaoC5xiP
	JvmyHp00sXQnPeX3aVkcCeoGwaICWM2wTbEi9fBj3Jv6orPUutqa3dOufjYgGuQBx859MefUySz
	tespm4mig+5aZhu8rIp7mTuoDNazCvjFvKUF8DiW8uFoAJ95P4TQTXZMHTTYBcswxt7WzmcqryF
	Jl5P6qNKTv1f+mb/wtFZyrAtzQUXQyhoKTIE+ePAy6RpS8RfZ/DW0JLz68oiIGUc9wBc+zOtjsF
	g9rXQPiX6jFDI+/pw97Kz17bTuwmlrGW4LpSGok0FnQbhOAUN26rckqV2noE1+cZmmYL7yIPbEJ
	CxI5CPozNeY/mqUBi/6rcKk0KWQXIKt+3fc6PHW8FuvxeCHvbV5aJtFc2FC52pAhOCv9OKvD1TR
	CTyCDLLqYLIwuDQ=
X-Received: by 2002:a17:90a:dfc5:b0:3a1:8b70:d46b with SMTP id 98e67ed59e1d1-3a6ce80d87amr8315562a91.42.1791228079952;
        Mon, 05 Oct 2026 12:21:19 -0700 (PDT)
Received: from f2fs-test.c.googlers.com.com (225.134.16.34.bc.googleusercontent.com. [34.16.134.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a85436fb54sm820286a91.10.2026.10.05.12.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 12:21:18 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH] f2fs: cache: count the temporary pins apart from the regular references
Date: Mon,  5 Oct 2026 19:21:13 +0000
Message-ID: <20261005192114.1511660-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daeho Jeong <daehojeong@google.com>

f2fs_unlock_cache() and f2fs_end_cache_writeback() take a temporary
reference on the entry around clear_and_wake_up_bit(), so that the entry
is not freed before wake_up_bit() returns. f2fs_destroy_cache() waits
for the LOCKED and WRITEBACK bits and then expects the refcount to be 1,
but the bit waits can return as soon as the bit is cleared, before the
I/O completion drops the temporary reference. When the completion runs
in process context and is preempted there (e.g. dm-flakey in
generic/311), umount hits:

  kernel BUG at fs/f2fs/cache.c:567!
  f2fs_destroy_cache+0x260/0x268
  f2fs_put_super+0x1fc/0x428

Count the temporary references in units of F2FS_CACHE_PIN_BIAS, like
GUP_PIN_COUNTING_BIAS for folios, and check only the regular references
in f2fs_destroy_cache(). A leaked regular reference is still caught
there, without waiting for the completion.

The pinned entry is freed by whichever of f2fs_cache_put() and
f2fs_cache_unpin() drops the refcount to zero, as before. The shrinker
still skips an entry while it is pinned, since the refcount is then
neither 1 nor below 3.

Fixes: 6e392158cf54 ("f2fs: cache: pin cached block in f2fs_end_cache_writeback()")
Fixes: 61ba87b33e87 ("f2fs: cache: pin cached block in f2fs_unlock_cache()")
Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/cache.c | 40 ++++++++++++++++++++++++++++++++++------
 1 file changed, 34 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/cache.c b/fs/f2fs/cache.c
index 04b5408cbc5..a75578cd4e3 100644
--- a/fs/f2fs/cache.c
+++ b/fs/f2fs/cache.c
@@ -18,7 +18,7 @@
 #include <trace/events/f2fs.h>
 #include "segment.h"
 
-static bool f2fs_cache_put(struct f2fs_cached_block *entry);
+static void f2fs_free_cache(struct f2fs_cached_block *entry);
 
 void f2fs_cache_wait_writeback_cond(struct f2fs_cached_block *entry,
 					enum page_type type)
@@ -111,6 +111,27 @@ void f2fs_start_cache_writeback(struct f2fs_cached_block *entry)
 				F2FS_CACHE_TAG_WRITEBACK);
 }
 
+/*
+ * The temporary references taken around clear_and_wake_up_bit() are counted
+ * in units of F2FS_CACHE_PIN_BIAS, like GUP_PIN_COUNTING_BIAS for folios, so
+ * that they can be told apart from the regular references.
+ */
+#define F2FS_CACHE_PIN_BIAS	(1 << 16)
+
+static void f2fs_cache_pin(struct f2fs_cached_block *entry)
+{
+	atomic_add(F2FS_CACHE_PIN_BIAS, &entry->refcount);
+}
+
+static void f2fs_cache_unpin(struct f2fs_cached_block *entry)
+{
+	int ref = atomic_sub_return(F2FS_CACHE_PIN_BIAS, &entry->refcount);
+
+	WARN_ON_ONCE(ref < 0);
+	if (!ref)
+		f2fs_free_cache(entry);
+}
+
 void f2fs_end_cache_writeback(struct f2fs_cached_block *entry)
 {
 	/*
@@ -125,9 +146,9 @@ void f2fs_end_cache_writeback(struct f2fs_cached_block *entry)
 	 * But here we must make sure that the entry is not freed and
 	 * reused before clear_and_wake_up_bit().
 	 */
-	f2fs_cache_get(entry);
+	f2fs_cache_pin(entry);
 	clear_and_wake_up_bit(F2FS_BLOCK_WRITEBACK, &entry->state);
-	f2fs_cache_put(entry);
+	f2fs_cache_unpin(entry);
 }
 
 static int f2fs_cache_refcount(struct f2fs_cached_block *entry)
@@ -135,6 +156,12 @@ static int f2fs_cache_refcount(struct f2fs_cached_block *entry)
 	return atomic_read(&entry->refcount);
 }
 
+/* the number of regular references, excluding the temporary ones */
+static int f2fs_cache_users(struct f2fs_cached_block *entry)
+{
+	return f2fs_cache_refcount(entry) & (F2FS_CACHE_PIN_BIAS - 1);
+}
+
 static void f2fs_do_free_cache(struct f2fs_cached_block *entry)
 {
 	kfree(entry->data);
@@ -326,9 +353,9 @@ void f2fs_unlock_cache(struct f2fs_cached_block *entry)
 	 * Pin the entry here to make sure it is not freed before wake_up_bit()
 	 * completes.
 	 */
-	f2fs_cache_get(entry);
+	f2fs_cache_pin(entry);
 	clear_and_wake_up_bit(F2FS_BLOCK_LOCKED, &entry->state);
-	f2fs_cache_put(entry);
+	f2fs_cache_unpin(entry);
 }
 
 bool f2fs_put_cache(struct f2fs_cached_block *entry, bool unlock)
@@ -564,7 +591,8 @@ void f2fs_destroy_cache(struct f2fs_cached_block_list *cache)
 	f2fs_bug_on(cache->sbi, f2fs_cache_test_dirty(entry));
 	f2fs_bug_on(cache->sbi, f2fs_cache_test_writeback(entry));
 	f2fs_bug_on(cache->sbi, !list_empty(&entry->list));
-	f2fs_bug_on(cache->sbi, f2fs_cache_refcount(entry) != 1);
+	/* the I/O completion may not have unpinned the entry yet */
+	f2fs_bug_on(cache->sbi, f2fs_cache_users(entry) != 1);
 	f2fs_put_cache(entry, true);
 	goto next;
 }
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

