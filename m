Received: from mta0.migadu.com (out-9.mta0.migadu.com [91.218.175.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C479643C06F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787824022; cv=none; b=g5fY5//zsvprIlbBrOWv/FMWY2P4HvyeGLPE/0Tt7tp4dZKfhC59X10aRiW+uw4TE2Farid/WnkaXpVgmhCbNBaOeK9bUjw3kcJQkFUPZzW/ABBfIKBz13fItdX4srwxt47zZOJIRRudM+vhlmRofA5PqZ/XCAav+JJM3C468mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787824022; c=relaxed/simple;
	bh=ykR7JzdWLBB4rybRBDW+ul92bSafOadTYV2l8/fzH8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=cASj0RDKRicFYGAy+EjoeZgR1BpjC6P8YeLBXehm9jjdXysMbmK+kCFR95Gxhlg6TWwWSMtjOVFnupqv5cam8ktWe/MxZI9dxFq4TXgWaXvCLFu7Bbhieu/d8bPRAPfo45DavHl31gSFyFScMmd/lb747+oKY9Nul2qERjGP8wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=91.218.175.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id dc4479b2fc1e8339;
	Thu, 27 Aug 2026 09:46:55 +0000
X-Mizu-Trace-ID: dc4479b2fc1e8339
X-Migadu-Flow: FLOW_OUT
From: Baoquan He <hebaoquan@kylinos.cn>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	nphamcs@gmail.com,
	baohua@kernel.org,
	youngjun.park@lge.com,
	hannes@cmpxchg.org,
	yosry@kernel.org,
	shikemeng@huaweicloud.com,
	chengming.zhou@linux.dev,
	baoquan.he@linux.dev,
	david@kernel.org,
	linux-kernel@vger.kernel.org,
	Baoquan He <hebaoquan@kylinos.cn>
Subject: [PATCH 16/16] mm, swap: allow setting xswap device priority at creation
Date: Thu, 27 Aug 2026 17:45:06 +0800
Message-ID: <20260827094509.1016740-17-hebaoquan@kylinos.cn>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260827094509.1016740-1-hebaoquan@kylinos.cn>
References: <20260827094509.1016740-1-hebaoquan@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

Let the create interface (/sys/kernel/mm/xswap/create) accept an
optional priority:

  echo "<percent> [<prio>]" > /sys/kernel/mm/xswap/create

A missing prio means DEF_SWAP_PRIO; and permitted values are
DEF_SWAP_PRIO or 0..SWAP_FLAG_PRIO_MASK, being consistent with the
swapon(2) ABI. Like a regular swap device, prio is set once at creation
and is not chnageable whne the device is active; use xswap_destroy
then create to cange it.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 mm/swapfile.c | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index ae0c549cc9aa..258b52bce438 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -52,6 +52,8 @@
 #include "swap.h"
 #include <linux/debugfs.h>
 
+#define DEF_SWAP_PRIO  -1
+
 static DEFINE_SPINLOCK(swap_lock);
 
 #ifdef CONFIG_XSWAP
@@ -159,9 +161,11 @@ static void xswap_debugfs_del(struct swap_info_struct *si)
 }
 
 #ifdef CONFIG_SYSFS
-static int xswap_create(int percent);
+static int xswap_create(int percent, int prio);
 static int xswap_destroy(int type);
 /* /sys/kernel/mm/xswap/: create.
+ * Write "<percent> [<prio>]" to add a zswap-backed swap device; a missing
+ * priority means DEF_SWAP_PRIO.
  * Per-device runtime size is tuned via debugfs type<N>_cluster_limit.
  */
 
@@ -169,21 +173,25 @@ static ssize_t xswap_create_store(struct kobject *kobj,
 				  struct kobj_attribute *attr,
 				  const char *buf, size_t count)
 {
-	unsigned long percent;
-	int err;
+	long percent;
+	int prio = DEF_SWAP_PRIO;
+	int nr, err;
 
 	if (!capable(CAP_SYS_ADMIN))
 		return -EPERM;
 
-	err = kstrtoul(buf, 0, &percent);
-	if (err)
-		return err;
+	/* "<percent> [<prio>]"; a missing prio means DEF_SWAP_PRIO.
+	 * %li keeps kstrtoul(buf, 0)'s base-0 behavior for percent.
+	 */
+	nr = sscanf(buf, "%li %d", &percent, &prio);
+	if (nr < 1)
+		return -EINVAL;
 
 	/* 0 means "use the default percent" */
 	if (percent == 0)
 		percent = XSWAP_DEFAULT_CLUSTER_PERCENT;
 
-	err = xswap_create(percent);
+	err = xswap_create(percent, prio);
 	if (err < 0)
 		return err;
 
@@ -275,7 +283,6 @@ atomic_t nr_real_swapfiles;
 EXPORT_SYMBOL_GPL(nr_swap_pages);
 /* protected with swap_lock. reading in vm_swap_full() doesn't need lock */
 long total_swap_pages;
-#define DEF_SWAP_PRIO  -1
 unsigned long swapfile_maximum_size;
 #ifdef CONFIG_MIGRATION
 bool swap_migration_ad_supported;
@@ -4340,7 +4347,7 @@ static int setup_swap_clusters_info(struct swap_info_struct *si,
 /* Create a file-less xswap device. si->max = full RAM; @percent sets the
  * runtime nr_clusters ceiling.
  */
-static int xswap_create(int percent)
+static int xswap_create(int percent, int prio)
 {
 	struct swap_info_struct *si;
 	unsigned long ram, maxpages, init_clusters;
@@ -4348,6 +4355,8 @@ static int xswap_create(int percent)
 
 	if (percent < 1 || percent > 100)
 		return -EINVAL;
+	if (prio != DEF_SWAP_PRIO && (prio < 0 || prio > SWAP_FLAG_PRIO_MASK))
+		return -EINVAL;
 
 	/* xswap has no backing store, it relies on zswap. */
 	if (!zswap_is_enabled())
@@ -4391,15 +4400,15 @@ static int xswap_create(int percent)
 		goto bad_swap;
 
 	mutex_lock(&swapon_mutex);
-	si->prio = DEF_SWAP_PRIO;
+	si->prio = prio;
 	si->list.prio = -si->prio;
 	si->avail_list.prio = -si->prio;
 	/* si->swap_file stays NULL: this is a file-less device */
 	enable_swap_info(si);
 	mutex_unlock(&swapon_mutex);
 
-	pr_info("xswap: adding extendable swap type %d (%d%% of %lu pages = %u pages, max %lu)\n",
-		si->type, percent, ram, si->pages, maxpages);
+	pr_info("xswap: adding extendable swap type %d (prio %d, %d%% of %lu pages = %u pages, max %lu)\n",
+		si->type, prio, percent, ram, si->pages, maxpages);
 	atomic_inc(&proc_poll_event);
 	wake_up_interruptible(&proc_poll_wait);
 
-- 
2.54.0

