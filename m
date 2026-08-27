Received: from mta0.migadu.com (out-231.mta0.migadu.com [91.218.175.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DD4437130
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787823992; cv=none; b=rzZ0oM1XnKfy+QQZsQ8mCjLGKkTq1T0nmmhOc7NnHkx4vguf39MjVUoc3I8KY1qoDyFRhf+InRQFqQlLTZiaIs4DyWqfv+JZBnwyx4oCs9J9zNEjApL1mOkEX1Q9/sBjqMys6t6C0Aaz2cxwnZqsf4kuDLF3s7Z8hWIGBhexqCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787823992; c=relaxed/simple;
	bh=01zYfwA2N+WlL+tPsX3LVs2eU/lTEnpSEdPHRe9kIqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=Z6CFXcKj73v1Bo4A6dAi2549gaEwGkkaZA/o1KQCIgtIGREAgQb6jupHiKcRtx73r97kufQX/0yWdRhRe+nuMiY8HygvdmspxryFhOL5LMYRBcA0mHHEdk4bWGRv/7TcV1ALI4dysInsYfVt1xw8pB44XTWiXFFCyh+YPz/8dvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=91.218.175.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id c2b175c1ae2981f2;
	Thu, 27 Aug 2026 09:46:28 +0000
X-Mizu-Trace-ID: c2b175c1ae2981f2
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
Subject: [PATCH 12/16] mm, swap: add debugfs knob for xswap per-device cluster limit
Date: Thu, 27 Aug 2026 17:45:02 +0800
Message-ID: <20260827094509.1016740-13-hebaoquan@kylinos.cn>
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

Add a per-device debugfs file for runtime adjustment of xswap cluster
limit:
  /sys/kernel/debug/xswap/type<N>_cluster_limit

Reading shows the current ceiling (in clusters); writing sets it
(clamped to [0, nr_clusters_max]). Setting below nr_clusters_mapped
triggers an immediate shrink check via xswap_try_shrink().

The debugfs entry is created on device creation and removed on
destruction.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 include/linux/swap.h |  1 +
 mm/swapfile.c        | 92 ++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 90 insertions(+), 3 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index c55af4a95ef7..5e50486103b9 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -254,6 +254,7 @@ struct swap_info_struct {
 	unsigned long		nr_clusters;	/* current growth ceiling (≤ nr_clusters_max) */
 	unsigned long		nr_clusters_mapped; /* currently mapped cluster count */
 	unsigned long		nr_free_tail;	/* contiguous free clusters at tail */
+	struct dentry		*debugfs_entry;	/* debugfs: type<N>_max_clusters */
 	struct mutex		xswap_lock;	/* serialize map/unmap operations */
 #endif
 	struct list_head free_clusters; /* free clusters list */
diff --git a/mm/swapfile.c b/mm/swapfile.c
index b2c3bb21f082..6916a8b3f63b 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -50,6 +50,9 @@
 #include "swap_table.h"
 #include "internal.h"
 #include "swap.h"
+#include <linux/debugfs.h>
+
+static DEFINE_SPINLOCK(swap_lock);
 
 #ifdef CONFIG_XSWAP
 /*
@@ -66,6 +69,8 @@
 	max_t(unsigned long, PAGE_SIZE / sizeof(struct swap_cluster_info), 16)
 #define XSWAP_DEFAULT_CLUSTER_PERCENT 30
 
+static struct dentry *xswap_debugfs_root;
+
 static int xswap_map_clusters(struct swap_info_struct *si,
 			      unsigned long start_idx, unsigned long nr);
 static void xswap_unmap_clusters(struct swap_info_struct *si,
@@ -76,6 +81,83 @@ static void xswap_update_free_tail(struct swap_info_struct *si,
 				    unsigned long freed_idx);
 static void xswap_try_shrink(struct swap_info_struct *si);
 
+/*
+ * debugfs read/write for per-device max cluster count.
+ */
+static ssize_t xswap_max_clusters_read(struct file *file, char __user *buf,
+				       size_t count, loff_t *ppos)
+{
+	struct swap_info_struct *si = file->private_data;
+	char tmp[32];
+	int len;
+
+	len = snprintf(tmp, sizeof(tmp), "%lu\n", READ_ONCE(si->nr_clusters));
+	return simple_read_from_buffer(buf, count, ppos, tmp, len);
+}
+
+static ssize_t xswap_max_clusters_write(struct file *file,
+					const char __user *buf,
+					size_t count, loff_t *ppos)
+{
+	struct swap_info_struct *si = file->private_data;
+	unsigned long val, new_pages;
+	int err;
+
+	err = kstrtoul_from_user(buf, count, 0, &val);
+	if (err)
+		return err;
+
+	if (val > si->nr_clusters_max)
+		val = si->nr_clusters_max;
+
+	spin_lock(&si->lock);
+	si->nr_clusters = val;
+	spin_unlock(&si->lock);
+
+	new_pages = min_t(unsigned long, val * SWAPFILE_CLUSTER, si->max);
+	if (new_pages)
+		new_pages--;
+	if (new_pages != si->pages) {
+		long delta = (long)new_pages - (long)si->pages;
+
+		spin_lock(&swap_lock);
+		si->pages = new_pages;
+		atomic_long_add(delta, &nr_swap_pages);
+		total_swap_pages += delta;
+		spin_unlock(&swap_lock);
+	}
+
+	/* Lowering the ceiling may free tail clusters. */
+	xswap_try_shrink(si);
+
+	return count;
+}
+
+static const struct file_operations xswap_debugfs_fops = {
+	.read = xswap_max_clusters_read,
+	.write = xswap_max_clusters_write,
+	.open = simple_open,
+	.llseek = default_llseek,
+};
+
+static void xswap_debugfs_add(struct swap_info_struct *si)
+{
+	char name[32];
+
+	if (!xswap_debugfs_root)
+		return;
+
+	snprintf(name, sizeof(name), "type%d_cluster_limit", si->type);
+	si->debugfs_entry = debugfs_create_file(name, 0644, xswap_debugfs_root,
+						si, &xswap_debugfs_fops);
+}
+
+static void xswap_debugfs_del(struct swap_info_struct *si)
+{
+	debugfs_remove(si->debugfs_entry);
+	si->debugfs_entry = NULL;
+}
+
 #ifdef CONFIG_SYSFS
 static int xswap_create(int percent);
 /* /sys/kernel/mm/xswap/: create.
@@ -156,7 +238,6 @@ static void move_cluster(struct swap_info_struct *si,
  *
  * Also protects swap_active_head total_swap_pages, and the SWP_WRITEOK flag.
  */
-static DEFINE_SPINLOCK(swap_lock);
 static unsigned int nr_swapfiles;
 atomic_long_t nr_swap_pages;
 atomic_t nr_real_swapfiles;
@@ -3230,6 +3311,7 @@ static void free_swap_cluster_info(struct swap_info_struct *si)
 
 #ifdef CONFIG_XSWAP
 	if (si->flags & SWP_XSWAP) {
+		xswap_debugfs_del(si);
 		/* Unmap all mapped clusters and free the VM_SPARSE area */
 		if (si->nr_clusters_mapped > 0)
 			xswap_unmap_clusters(si, 0, si->nr_clusters_mapped);
@@ -4118,6 +4200,7 @@ static int setup_swap_clusters_info(struct swap_info_struct *si,
 
 		/* All mapped clusters except cluster 0 are free at the tail */
 		si->nr_free_tail = si->nr_clusters_mapped - 1;
+		xswap_debugfs_add(si);
 		return 0;
 
 err_unmap:
@@ -4245,8 +4328,8 @@ static int xswap_create(int percent)
 	/* VM_SPARSE covers full RAM; runtime nr_clusters starts at percent. */
 	init_clusters = div_u64((u64)maxpages * percent, 100 * SWAPFILE_CLUSTER);
 	init_clusters = max_t(unsigned long, init_clusters, XSWAP_GROW_CLUSTERS);
-	if (init_clusters > si->nr_clusters)
-		init_clusters = si->nr_clusters;
+	if (init_clusters > si->nr_clusters_max)
+		init_clusters = si->nr_clusters_max;
 	si->nr_clusters = init_clusters;
 	si->pages = min_t(unsigned long, init_clusters * SWAPFILE_CLUSTER, si->max) - 1;
 
@@ -4624,6 +4707,9 @@ static int __init swapfile_init(void)
 		swap_migration_ad_supported = true;
 #endif	/* CONFIG_MIGRATION */
 
+#ifdef CONFIG_XSWAP
+	xswap_debugfs_root = debugfs_create_dir("xswap", NULL);
+#endif
 	xswap_sysfs_init();
 
 	return 0;
-- 
2.54.0

