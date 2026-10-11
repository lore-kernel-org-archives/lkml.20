Received: from mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AA93C109F
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 05:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791694814; cv=none; b=e7j5q1x/wCKhsGhXiVrKJEmtYRzhPNlNmC8ct6bK6e6bpKt6m2WlLPjls4dsFPBIM73aRgk7AZe4CXt1UPbUSMuG+7pjHGDnX2PyxauTXQ7yd7QkUkfIItknPEMYjoFN/HpetmEzE1Weji2FL3vDDrt1oPKmiPN1Xb0unxzL8no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791694814; c=relaxed/simple;
	bh=1HuUJaxdjLUcaFiwr5i8Gt9zxnjbL+m1NmdgUhx7MSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hq/GrcIrGJra7Dk6NfKRq9u82Qt2G2pti/QzO9pHtf3JtoRJSEfl2EFH5YVYYzXqAvmk4ZQGREpjULygi2TFCK9P+yDzbvlBAZdHjZxChCdN4o8vj1bhEfDA3Hbnmyg4XHUwpIeSGu3MCxXZ2T60VIQsF4ra5MwmeliW66YP6ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=eQ86C4gM; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="eQ86C4gM"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=1HuUJaxdjLUcaFiwr5i8Gt9zxnjbL+m1NmdgUhx7MSk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791694809; v=1; x=1792299609;
 b=eQ86C4gMs4ibqqMZu8e33y9Yqfuchn35YGYQgnZCI6j1mrgfYOUXLsJHHMNNVbh/P+CMWofR
 a60NDVka10ARwLg8rTQNIn1XrML+CPzJrd+4A+jlLO9BSbJDgdDgPeaIdgy67b2GpNiDLMTi+ck
 dVOb+q+2GDWinoCYOIj+JEsc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0d66700324061ff8;
	Sun, 11 Oct 2026 05:00:08 +0000
X-Mizu-Trace-ID: 0d66700324061ff8
X-Migadu-Flow: FLOW_OUT
From: Qi Zheng <qi.zheng@linux.dev>
To: akpm@linux-foundation.org,
	hughd@google.com,
	baolin.wang@linux.alibaba.com,
	usama.arif@linux.dev,
	yi1.lai@intel.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH] mm: shmem: assign a lock class to the unused huge shrinklist
Date: Sun, 11 Oct 2026 12:59:56 +0800
Message-ID: <20261011045956.30277-1-qi.zheng@linux.dev>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20261010161622.3a460fdbcd6765adb5c1eb7f@linux-foundation.org>
References: <20261010161622.3a460fdbcd6765adb5c1eb7f@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Qi Zheng <zhengqi.arch@bytedance.com>

The unused huge shrinklist shares the default list_lru lock class with the
dentry LRU.  Although they use distinct lock instances, lockdep conflates
their dependencies and reports a circular locking dependency:

	WARNING: possible circular locking dependency detected

Give the unused huge shrinklist a dedicated lock class to fix this
false-positive lockdep warning.

Fixes: b9b1861d4f7a ("mm: shmem: make unused huge shrinker memcg aware")
Reported-by: kernel test robot <yi1.lai@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202610091403.d1d8080b-lkp@intel.com
Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 mm/shmem.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index 5a9bcc7c66926..a6e3c9c7f72da 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -5164,6 +5164,9 @@ static const struct dentry_operations shmem_ci_dentry_ops = {
 
 static int shmem_fill_super(struct super_block *sb, struct fs_context *fc)
 {
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+	static struct lock_class_key shmem_unused_huge_lock_key;
+#endif
 	struct shmem_options *ctx = fc->fs_private;
 	struct inode *inode;
 	struct shmem_sb_info *sbinfo;
@@ -5243,7 +5246,8 @@ static int shmem_fill_super(struct super_block *sb, struct fs_context *fc)
 		goto failed;
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
-	if (list_lru_init_memcg(&sbinfo->shrinklist, sb->s_shrink))
+	if (list_lru_init_memcg_key(&sbinfo->shrinklist, sb->s_shrink,
+				    &shmem_unused_huge_lock_key))
 		goto failed;
 #endif
 
-- 
2.54.0

