Received: from mta1.migadu.com (out-124.mta1.migadu.com [95.215.58.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A2F36DA00
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787823949; cv=none; b=jMnFOCHubXc5Nz3I3r4N5Oz/I6kndlsAbTqN+sDaeRcQkDygLYq0ksx65heoP5vLKn8mEu0VtOEqWPPW6+jvfBzBdA2/HydIDAeJljngQ+P45+aFAVc50TRX+JtMMWniV8PzFQZRYmUt4FYrIdj0Q5Sf0CFoULZx2aFGe9V+4a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787823949; c=relaxed/simple;
	bh=uEpOqa+GFGtH/T36HAdjQsrVSLvCN9LoiBv5DWWA4uo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=h0LYpjHBvLyOudQVX56nuMFxfmwm0ssNEtpvtDRhJethjbANjnDo18w6I2s3p6P/d+9/31nLqky7M9OjSSYWY9aIoQbNTXB5reGJw5OJTIWb/DWa0rKSYkxqIribDSR9enxSurglA59qYbSgYSR7HeuStz9fKoHgsbGjpxcotm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=95.215.58.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id fe1cfcd6d97b5eae;
	Thu, 27 Aug 2026 09:45:44 +0000
X-Mizu-Trace-ID: fe1cfcd6d97b5eae
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
Subject: [PATCH 06/16] mm, swap: add sysfs create interface for xswap
Date: Thu, 27 Aug 2026 17:44:56 +0800
Message-ID: <20260827094509.1016740-7-hebaoquan@kylinos.cn>
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

xswap devices have no backing storage, so there is no file to swapon.
Add a sysfs interface to create them directly:

  /sys/kernel/mm/xswap/create    write a percent (0 = use default) to
                                 create a device

The initial cluster ceiling (nr_clusters) for a new device is set by
XSWAP_DEFAULT_CLUSTER_PERCENT of totalram_pages.  The device appears in
/proc/swaps as "xswap<N>".  Per-device runtime sizing is tuned via the
debugfs knob added later in this series.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 mm/swapfile.c | 165 ++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 161 insertions(+), 4 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 06f73c0a504a..1127e3d6596b 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -16,6 +16,8 @@
 #include <linux/kernel_stat.h>
 #include <linux/swap.h>
 #include <linux/vmalloc.h>
+#include <linux/kobject.h>
+#include <linux/sysfs.h>
 #include <linux/pagemap.h>
 #include <linux/namei.h>
 #include <linux/shmem_fs.h>
@@ -60,13 +62,79 @@
  */
 #define XSWAP_GROW_CLUSTERS \
 	max_t(unsigned long, PAGE_SIZE / sizeof(struct swap_cluster_info), 16)
+#define XSWAP_DEFAULT_CLUSTER_PERCENT 30
 
 static int xswap_map_clusters(struct swap_info_struct *si,
 			      unsigned long start_idx, unsigned long nr);
 static void xswap_unmap_clusters(struct swap_info_struct *si,
 				 unsigned long start_idx, unsigned long nr);
 static int xswap_check_mapped(pte_t *pte, unsigned long addr, void *data);
-#endif
+
+#ifdef CONFIG_SYSFS
+static int xswap_create(int percent);
+/* /sys/kernel/mm/xswap/: create.
+ * Per-device runtime size is tuned via debugfs type<N>_cluster_limit.
+ */
+
+static ssize_t xswap_create_store(struct kobject *kobj,
+				  struct kobj_attribute *attr,
+				  const char *buf, size_t count)
+{
+	unsigned long percent;
+	int err;
+
+	if (!capable(CAP_SYS_ADMIN))
+		return -EPERM;
+
+	err = kstrtoul(buf, 0, &percent);
+	if (err)
+		return err;
+
+	/* 0 means "use the default percent" */
+	if (percent == 0)
+		percent = XSWAP_DEFAULT_CLUSTER_PERCENT;
+
+	err = xswap_create(percent);
+	if (err < 0)
+		return err;
+
+	return count;
+}
+
+static struct kobj_attribute xswap_create_attr = __ATTR(create, 0200, NULL,
+							xswap_create_store);
+
+static struct attribute *xswap_attrs[] = {
+	&xswap_create_attr.attr,
+	NULL,
+};
+
+static const struct attribute_group xswap_attr_group = {
+	.attrs = xswap_attrs,
+};
+
+static struct kobject *xswap_kobj;
+
+static void xswap_sysfs_init(void)
+{
+	xswap_kobj = kobject_create_and_add("xswap", mm_kobj);
+	if (!xswap_kobj) {
+		pr_err("xswap: failed to create sysfs kobject\n");
+		return;
+	}
+	if (sysfs_create_group(xswap_kobj, &xswap_attr_group))
+		pr_err("xswap: failed to create sysfs group\n");
+}
+#else
+static inline void xswap_sysfs_init(void)
+{
+}
+#endif /* CONFIG_SYSFS */
+#else /* !CONFIG_XSWAP */
+static inline void xswap_sysfs_init(void)
+{
+}
+#endif /* CONFIG_XSWAP */
 
 static void swap_range_alloc(struct swap_info_struct *si,
 			     unsigned int nr_entries);
@@ -3312,7 +3380,7 @@ static void *swap_start(struct seq_file *swap, loff_t *pos)
 		return SEQ_START_TOKEN;
 
 	for (type = 0; (si = swap_type_to_info(type)); type++) {
-		if (!(si->swap_file))
+		if (!(si->swap_file) && !(si->flags & SWP_XSWAP))
 			continue;
 		if (!--l)
 			return si;
@@ -3333,7 +3401,7 @@ static void *swap_next(struct seq_file *swap, void *v, loff_t *pos)
 
 	++(*pos);
 	for (; (si = swap_type_to_info(type)); type++) {
-		if (!(si->swap_file))
+		if (!(si->swap_file) && !(si->flags & SWP_XSWAP))
 			continue;
 		return si;
 	}
@@ -3375,7 +3443,14 @@ static int swap_show(struct seq_file *swap, void *v)
 	inuse = K(swap_usage_in_pages(si));
 
 	file = si->swap_file;
-	len = seq_file_path(swap, file, " \t\n\\");
+	if (file)
+		len = seq_file_path(swap, file, " \t\n\\");
+	else {
+		char name[16];
+
+		len = scnprintf(name, sizeof(name), "xswap%d", si->type);
+		seq_puts(swap, name);
+	}
 	seq_printf(swap, "%*s%s\t%lu\t%s%lu\t%s%d\n",
 			len < 40 ? 40 - len : 1, " ",
 			swap_type_str(si),
@@ -3897,6 +3972,86 @@ static int setup_swap_clusters_info(struct swap_info_struct *si,
 	return err;
 }
 
+#ifdef CONFIG_XSWAP
+#ifdef CONFIG_SYSFS
+/* Create a file-less xswap device. si->max = full RAM; @percent sets the
+ * runtime nr_clusters ceiling.
+ */
+static int xswap_create(int percent)
+{
+	struct swap_info_struct *si;
+	unsigned long ram, maxpages, init_clusters;
+	int error;
+
+	if (percent < 1 || percent > 100)
+		return -EINVAL;
+
+	si = alloc_swap_info();
+	if (IS_ERR(si))
+		return PTR_ERR(si);
+
+	INIT_WORK(&si->discard_work, swap_discard_work);
+	INIT_WORK(&si->reclaim_work, swap_reclaim_work);
+
+	ram = totalram_pages();
+	maxpages = min_t(unsigned long, ram, swapfile_maximum_size);
+	if ((unsigned int)maxpages == 0)
+		maxpages = UINT_MAX;
+	if (maxpages < 2)
+		maxpages = 2;
+
+	si->bdev = NULL;
+	si->flags |= SWP_XSWAP | SWP_SOLIDSTATE;
+	si->max = maxpages;
+	si->pages = maxpages - 1;
+	/* no backing file: mirror the xswap branch of setup_swap_extents() */
+	si->ops = &swap_bdev_ops;
+
+	error = setup_swap_clusters_info(si, NULL, maxpages);
+	if (error)
+		goto bad_swap;
+
+	/* VM_SPARSE covers full RAM; runtime nr_clusters starts at percent. */
+	init_clusters = div_u64((u64)maxpages * percent, 100 * SWAPFILE_CLUSTER);
+	init_clusters = max_t(unsigned long, init_clusters, XSWAP_GROW_CLUSTERS);
+	if (init_clusters > si->nr_clusters)
+		init_clusters = si->nr_clusters;
+	si->nr_clusters = init_clusters;
+	si->pages = min_t(unsigned long, init_clusters * SWAPFILE_CLUSTER, si->max) - 1;
+
+	error = zswap_swapon(si->type, si->max);
+	if (error)
+		goto bad_swap;
+
+	mutex_lock(&swapon_mutex);
+	si->prio = DEF_SWAP_PRIO;
+	si->list.prio = -si->prio;
+	si->avail_list.prio = -si->prio;
+	/* si->swap_file stays NULL: this is a file-less device */
+	enable_swap_info(si);
+	mutex_unlock(&swapon_mutex);
+
+	pr_info("xswap: adding extendable swap type %d (%d%% of %lu pages = %u pages, max %lu)\n",
+		si->type, percent, ram, si->pages, maxpages);
+	atomic_inc(&proc_poll_event);
+	wake_up_interruptible(&proc_poll_wait);
+
+	return si->type;
+
+bad_swap:
+	kfree(si->global_cluster);
+	si->global_cluster = NULL;
+	destroy_swap_extents(si, NULL);	/* safe: xswap never sets SWP_ACTIVATED */
+	free_swap_cluster_info(si);
+	si->cluster_info = NULL;
+	spin_lock(&swap_lock);
+	si->flags = 0;
+	spin_unlock(&swap_lock);
+	return error;
+}
+#endif /* CONFIG_SYSFS */
+#endif /* CONFIG_XSWAP */
+
 SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 {
 	struct swap_info_struct *si;
@@ -4240,6 +4395,8 @@ static int __init swapfile_init(void)
 		swap_migration_ad_supported = true;
 #endif	/* CONFIG_MIGRATION */
 
+	xswap_sysfs_init();
+
 	return 0;
 }
 subsys_initcall(swapfile_init);
-- 
2.54.0

