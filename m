Received: from mta0.migadu.com (out-253.mta0.migadu.com [91.218.175.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB724E3EEC
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.253
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554040; cv=none; b=aqdZk6zaz/IH/va2OOVblJrEt3acVPBai7JCeFDgs+xVnukRfbSjfPSLOlEdg1ozNZ3nDI9xD8Qfm0m2fob7h6xK9rD6B1RiDPDRy+yknBb4h3zlOoKThuTG7mPnG1IF36OL7jy06o2a9eNvY3WtbbDmPbbiDxGIVGP04jNFPAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554040; c=relaxed/simple;
	bh=d+LT5iPAI3k8zqB026CT/v4IuW4UZWGFE1l+zibubBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=VJjI5LgAr/aUS9wLUdAF/aGPFpj2jxl+wxoVZU3ma3Lh4AJHp+wmk0uNgzC4ZMKkXQlVJ1m/g0rW5EdGIv3t5SQgANBrq7ScSoNLYWEGukeH5yIxiAOBiD2xa1zhBAXQDEndzzp9Q+KFT8p2Xa19Ao99/FYrLBNDIw7qkIxNb+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=91.218.175.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 702b54a055381590;
	Wed, 16 Sep 2026 10:20:11 +0000
X-Mizu-Trace-ID: 702b54a055381590
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
	kunwu.chan@gmail.com,
	Baoquan He <hebaoquan@kylinos.cn>
Subject: [PATCH v3 05/14] mm, swap: add sysfs create interface for xswap
Date: Wed, 16 Sep 2026 18:19:12 +0800
Message-ID: <20260916101929.149106-6-hebaoquan@kylinos.cn>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260916101929.149106-1-hebaoquan@kylinos.cn>
References: <20260916101929.149106-1-hebaoquan@kylinos.cn>
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
  /sys/kernel/mm/xswap/create    write an optional priority to create
                                 a device (empty = DEF_SWAP_PRIO)

A new device is created with si->max and nr_clusters_max both equal to
twice RAM: the cluster_info array is a sparse VM_SPARSE area mapped
lazily, so an idle device costs nothing. The runtime size can be
lowered per device afterwards via
/sys/kernel/mm/xswap/type<N>/limit (added later in this series).
The optional priority follows swapon(2)'s -p semantics (default
DEF_SWAP_PRIO, valid range -1..SWAP_FLAG_PRIO_MASK). The device shows
up in /proc/swaps as "xswap<N>".

Hibernation device discovery skips xswap devices: they have no bdev
to carry a resume image.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 mm/swapfile.c | 163 ++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 158 insertions(+), 5 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index dac5e0db0e94..b0edf5421fc5 100644
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
@@ -48,6 +50,7 @@
 #include "swap_table.h"
 #include "internal.h"
 #include "swap.h"
+#define DEF_SWAP_PRIO  -1
 
 #ifdef CONFIG_XSWAP
 /*
@@ -66,7 +69,64 @@ static int xswap_map_clusters(struct swap_info_struct *si,
 static void xswap_unmap_clusters(struct swap_info_struct *si,
 				 unsigned long start_idx, unsigned long nr);
 static int xswap_mapped_end(pte_t *pte, unsigned long addr, void *data);
-#endif
+
+static int xswap_create(int prio);
+
+static ssize_t xswap_create_store(struct kobject *kobj,
+				  struct kobj_attribute *attr,
+				  const char *buf, size_t count)
+{
+	int prio = DEF_SWAP_PRIO;
+	int err;
+
+	if (!capable(CAP_SYS_ADMIN))
+		return -EPERM;
+
+	/* "[<prio>]" is optional; empty means DEF_SWAP_PRIO, i.e. the same
+	 * default as swapon(2) without SWAP_FLAG_PREFER.
+	 */
+	if (*skip_spaces(buf)) {
+		err = kstrtoint(buf, 10, &prio);
+		if (err)
+			return err;
+	}
+
+	err = xswap_create(prio);
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
+#else /* !CONFIG_XSWAP */
+static inline void xswap_sysfs_init(void)
+{
+}
+#endif /* CONFIG_XSWAP */
 
 static void swap_range_alloc(struct swap_info_struct *si,
 			     unsigned int nr_entries);
@@ -94,7 +154,6 @@ atomic_t nr_real_swapfiles;
 EXPORT_SYMBOL_GPL(nr_swap_pages);
 /* protected with swap_lock. reading in vm_swap_full() doesn't need lock */
 long total_swap_pages;
-#define DEF_SWAP_PRIO  -1
 unsigned long swapfile_maximum_size;
 #ifdef CONFIG_MIGRATION
 bool swap_migration_ad_supported;
@@ -2275,6 +2334,9 @@ static int __find_hibernation_swap_type(dev_t device, sector_t offset)
 
 		if (!(sis->flags & SWP_WRITEOK))
 			continue;
+		/* xswap has no bdev to match a resume device */
+		if (sis->flags & SWP_XSWAP)
+			continue;
 
 		if (device == sis->bdev->bd_dev) {
 			struct swap_extent *se = first_se(sis);
@@ -2462,6 +2524,8 @@ int find_first_swap(dev_t *device)
 
 		if (!(sis->flags & SWP_WRITEOK))
 			continue;
+		if (sis->flags & SWP_XSWAP)
+			continue;
 		*device = sis->bdev->bd_dev;
 		spin_unlock(&swap_lock);
 		return type;
@@ -3423,7 +3487,7 @@ static void *swap_start(struct seq_file *swap, loff_t *pos)
 		return SEQ_START_TOKEN;
 
 	for (type = 0; (si = swap_type_to_info(type)); type++) {
-		if (!(si->swap_file))
+		if (!(si->swap_file) && !(si->flags & SWP_XSWAP))
 			continue;
 		if (!--l)
 			return si;
@@ -3444,7 +3508,7 @@ static void *swap_next(struct seq_file *swap, void *v, loff_t *pos)
 
 	++(*pos);
 	for (; (si = swap_type_to_info(type)); type++) {
-		if (!(si->swap_file))
+		if (!(si->swap_file) && !(si->flags & SWP_XSWAP))
 			continue;
 		return si;
 	}
@@ -3486,7 +3550,14 @@ static int swap_show(struct seq_file *swap, void *v)
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
@@ -4034,6 +4105,86 @@ static int setup_swap_clusters_info(struct swap_info_struct *si,
 	return err;
 }
 
+#ifdef CONFIG_XSWAP
+/* Create a file-less xswap device.  si->max and the initial nr_clusters
+ * ceiling are both twice RAM; the runtime size can be lowered afterwards
+ * via /sys/kernel/mm/xswap/type<N>/limit.
+ */
+static int xswap_create(int prio)
+{
+	struct swap_info_struct *si;
+	unsigned long ram, maxpages;
+	int error;
+
+	if (prio != DEF_SWAP_PRIO && (prio < 0 || prio > SWAP_FLAG_PRIO_MASK))
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
+	maxpages = min_t(unsigned long, ram * 2, swapfile_maximum_size);
+	/* si->max is an unsigned int: don't overflow it. */
+	if (maxpages > UINT_MAX)
+		maxpages = UINT_MAX;
+	/* Cluster-aligned, so no cluster holds a slot past si->max. */
+	if (maxpages > SWAPFILE_CLUSTER)
+		maxpages = rounddown(maxpages, SWAPFILE_CLUSTER);
+	if (maxpages < 2)
+		maxpages = 2;
+
+	si->bdev = NULL;
+	si->flags |= SWP_XSWAP | SWP_SOLIDSTATE;
+	si->max = maxpages;
+	si->pages = maxpages - 1;
+	/*
+	 * No backing file: setup_swap_extents() is only reachable from the
+	 * file-backed swapon() path, so set ops here.  Only ops->flags is
+	 * used, by may_enter_fs(); the IO methods are never called because
+	 * swap_writeout()/swap_read_folio() short circuit xswap.
+	 */
+	si->ops = &swap_bdev_ops;
+
+	error = setup_swap_clusters_info(si, NULL, maxpages);
+	if (error)
+		goto bad_swap;
+
+	error = zswap_swapon(si->type, si->max);
+	if (error)
+		goto bad_swap;
+
+	mutex_lock(&swapon_mutex);
+	si->prio = prio;
+	si->list.prio = -si->prio;
+	si->avail_list.prio = -si->prio;
+	/* si->swap_file stays NULL: this is a file-less device */
+	enable_swap_info(si);
+	mutex_unlock(&swapon_mutex);
+
+	pr_info("xswap: adding extendable swap type %d (prio %d, %u pages, max %lu)\n",
+		si->type, prio, si->pages, maxpages);
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
+#endif /* CONFIG_XSWAP */
+
 SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 {
 	struct swap_info_struct *si;
@@ -4380,6 +4531,8 @@ static int __init swapfile_init(void)
 		swap_migration_ad_supported = true;
 #endif	/* CONFIG_MIGRATION */
 
+	xswap_sysfs_init();
+
 	return 0;
 }
 subsys_initcall(swapfile_init);
-- 
2.54.0

