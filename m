Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.186
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794203781;
	b=i5rfP5CD4WXrWYr0tI5/2sCP9bzR89uVMrhicdhbMgqkHVCmCUDtjNM44MXkbyuiCrHw
	 AlG1T2jECIuUoK43b9F4ELpeld4MgTRpzNrvX1k9xR3TQPYfdh214LfqJab36zaZin8xs
	 C7/xOiXmNKSmm/wuWGPIwaNvqNC/q0ocIEWHe5i+Yx8jaIq/YHjri0IWgeSy9OzjOm4Bf
	 BYrzNJaHMijVFW4zRsVDgKcKJmTHY50gm43/EHEzESSBjPM2hAdzU/3Q6fUL7QIiAmILg
	 hseh4EVYBRiXcKpi5UTRlxQo7UzORY9VFK7rbfb+6bK5HigJmaYP8IeR8FtQ568VQtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794203781;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-type:
	 Content-Transfer-Encoding;
	bh=5dbJudx54IJdpQu2cr4+SphwgIU5JWBQZBI+ztPJly8=;
	b=S2xYUW2wTmONOk3t5dw04D+p1lvLKhmbzsAVyCVy3UjAvGYWzIsANxCDkiS6yTngkMIF
	 quA0/gRGC4AgdUwmtrYZ+x6/ALsXtLYP+EhhYlwZXN/vuQBks+5vVSYY/9RIZ4q+ezKwN
	 VBXapOQNbCxrmTS87ayVZLkA94YGLixE+//wNVL035RE+MYMOoadhtB9YpFrcpZcsPgoX
	 IkLqRl8M93g0vlT28x02R8FEUZOO9JaD7LOwpDHifASUxaBaqt6a9Hpj/92s5AQhMFjEC
	 vNjcSCm+cvimXXx3PjYhpHrA9p0L6B8/E5Zg/E+TF5WgXEswBFZnHtmKD6pghzkcXkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NNUubsk1;
	arc=none smtp.remote-ip=95.215.58.186
Received: from mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712E4606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:56:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 712E4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NNUubsk1
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Vh+7s22EVTn0GGu5H5c88rcKYKb8CNWqRRtsh7RPBFI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794203778; v=1; x=1794808578;
 b=NNUubsk1yzn4g6RkyrANA+bi6dWQTJ9RsyfqYMMGfA+aTDYrXVpc/AkIHYJmrl5mCI75t1g1
 oL7VFv8AF4GkdFG9jFNwlqn0sQ61eBslSYMxnZA0R1BV1m4tNHHatv8CozY60Z+sDzcmYD9Iuns
 QLcfnAMXQLCOio+rGPYR4Wyc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 627cd75057c981bd;
	Mon, 09 Nov 2026 05:56:18 +0000
X-Mizu-Trace-ID: 627cd75057c981bd
X-Migadu-Flow: FLOW_OUT
From: Baoquan He <baoquan.he@linux.dev>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	nphamcs@gmail.com,
	baohua@kernel.org,
	youngjun.park@lge.com,
	corbet@lwn.net,
	hannes@cmpxchg.org,
	chengming.zhou@linux.dev,
	kunwu.chan@gmail.com,
	klarasmodin@gmail.com,
	linux-kernel@vger.kernel.org,
	Baoquan He <hebaoquan@kylinos.cn>
Subject: [PATCH v5 06/19] mm, swap: add a sysfs interface to create xswap devices
Date: Mon,  9 Nov 2026 13:54:42 +0800
Message-ID: <20261109055455.536925-7-baoquan.he@linux.dev>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109055455.536925-1-baoquan.he@linux.dev>
References: <20261109055455.536925-1-baoquan.he@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

From: Baoquan He <hebaoquan@kylinos.cn>

An xswap device has no backing file, so it cannot be created with
swapon.  Add a sysfs interface to create one directly:

  /sys/kernel/mm/xswap/create

Write an optional priority to this file. Write nothing to use the
default priority. By default the device gets the highest priority.

A new device gets si->max and nr_clusters_max equal to twice RAM.
The cluster_info array is a VM_SPARSE area and is mapped lazily.  At
this point only the first XSWAP_GROW_CLUSTERS chunk is mapped; the
grow trigger comes in a later patch.  The device is shown in
/proc/swaps as "xswap<N>".

Hibernation device discovery skips xswap devices because they have no
bdev to store a resume image.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 mm/swapfile.c | 175 ++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 170 insertions(+), 5 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 83aaf00b75d3..616adbb298e7 100644
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
@@ -48,6 +50,15 @@
 #include "swap_table.h"
 #include "internal.h"
 #include "swap.h"
+#define DEF_SWAP_PRIO  -1
+
+/*
+ * The highest priority a real swap device can use: one ahead of xswap
+ * would take the page directly, and taking that slot is what xswap
+ * exists to avoid.  At equal priority the list is FIFO, so a real device
+ * that asks for this priority too and is added first wins.
+ */
+#define DEF_XSWAP_PRIO	SWAP_FLAG_PRIO_MASK
 
 #ifdef CONFIG_XSWAP
 /*
@@ -73,7 +84,67 @@ static int xswap_map_clusters(struct swap_info_struct *si,
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
+	int prio = DEF_XSWAP_PRIO;
+	const char *p;
+	int err;
+
+	if (!capable(CAP_SYS_ADMIN))
+		return -EPERM;
+
+	/* "[<prio>]" is optional; a lower one is allowed, not a higher. */
+	p = skip_spaces(buf);
+	if (*p && *p != '\n') {
+		err = kstrtoint(p, 10, &prio);
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
+	if (sysfs_create_group(xswap_kobj, &xswap_attr_group)) {
+		pr_err("xswap: failed to create sysfs group\n");
+		kobject_put(xswap_kobj);
+		xswap_kobj = NULL;
+	}
+}
+#else /* !CONFIG_XSWAP */
+static inline void xswap_sysfs_init(void)
+{
+}
+#endif /* CONFIG_XSWAP */
 
 static void swap_range_alloc(struct swap_info_struct *si,
 			     unsigned int nr_entries);
@@ -101,7 +172,6 @@ atomic_t nr_real_swapfiles;
 EXPORT_SYMBOL_GPL(nr_swap_pages);
 /* protected with swap_lock. reading in vm_swap_full() doesn't need lock */
 long total_swap_pages;
-#define DEF_SWAP_PRIO  -1
 unsigned long swapfile_maximum_size;
 #ifdef CONFIG_MIGRATION
 bool swap_migration_ad_supported;
@@ -2284,6 +2354,9 @@ static int __find_hibernation_swap_type(dev_t device, sector_t offset)
 
 		if (!(sis->flags & SWP_WRITEOK))
 			continue;
+		/* xswap has no bdev to match a resume device */
+		if (sis->flags & SWP_XSWAP)
+			continue;
 
 		if (device == sis->bdev->bd_dev) {
 			struct swap_extent *se = first_se(sis);
@@ -2471,6 +2544,8 @@ int find_first_swap(dev_t *device)
 
 		if (!(sis->flags & SWP_WRITEOK))
 			continue;
+		if (sis->flags & SWP_XSWAP)
+			continue;
 		*device = sis->bdev->bd_dev;
 		spin_unlock(&swap_lock);
 		return type;
@@ -3452,7 +3527,8 @@ static void *swap_start(struct seq_file *swap, loff_t *pos)
 		return SEQ_START_TOKEN;
 
 	for (type = 0; (si = swap_type_to_info(type)); type++) {
-		if (!(si->swap_file))
+		if (!si->swap_file &&
+		    !((si->flags & SWP_XSWAP) && (si->flags & SWP_WRITEOK)))
 			continue;
 		if (!--l)
 			return si;
@@ -3473,7 +3549,8 @@ static void *swap_next(struct seq_file *swap, void *v, loff_t *pos)
 
 	++(*pos);
 	for (; (si = swap_type_to_info(type)); type++) {
-		if (!(si->swap_file))
+		if (!si->swap_file &&
+		    !((si->flags & SWP_XSWAP) && (si->flags & SWP_WRITEOK)))
 			continue;
 		return si;
 	}
@@ -3515,7 +3592,14 @@ static int swap_show(struct seq_file *swap, void *v)
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
@@ -4026,6 +4110,8 @@ static int setup_swap_clusters_info(struct swap_info_struct *si,
 		return 0;
 
 err_unmap:
+		/* swap_cluster_setup_bad_slot() allocates cluster 0's table. */
+		swap_cluster_free_table(&si->cluster_info[0]);
 		xswap_unmap_clusters(si, 0, si->nr_clusters_mapped);
 err_free_vm:
 		free_vm_area(si->cluster_vm);
@@ -4108,6 +4194,83 @@ static int setup_swap_clusters_info(struct swap_info_struct *si,
 	return err;
 }
 
+#ifdef CONFIG_XSWAP
+/* Create a file-less xswap device, sized at twice RAM. */
+static int xswap_create(int prio)
+{
+	struct swap_info_struct *si;
+	unsigned long ram, maxpages;
+	int error;
+
+	if (prio != DEF_XSWAP_PRIO &&
+	    (prio < 0 || prio > SWAP_FLAG_PRIO_MASK))
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
+	/* A cluster index is an unsigned int, so cap the cluster count. */
+	if (maxpages / SWAPFILE_CLUSTER > UINT_MAX)
+		maxpages = (unsigned long)UINT_MAX * SWAPFILE_CLUSTER;
+	/* Cluster-aligned, so no cluster holds a slot past si->max. */
+	if (maxpages > SWAPFILE_CLUSTER)
+		maxpages = rounddown(maxpages, SWAPFILE_CLUSTER);
+	if (maxpages < 2)
+		maxpages = 2;
+
+	si->bdev = NULL;
+	si->swap_file = NULL;
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
+	enable_swap_info(si);
+	pr_info("xswap: adding extendable swap type %d (prio %d, %lu pages)\n",
+		si->type, prio, si->pages);
+	mutex_unlock(&swapon_mutex);
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
@@ -4454,6 +4617,8 @@ static int __init swapfile_init(void)
 		swap_migration_ad_supported = true;
 #endif	/* CONFIG_MIGRATION */
 
+	xswap_sysfs_init();
+
 	return 0;
 }
 subsys_initcall(swapfile_init);
-- 
2.54.0

