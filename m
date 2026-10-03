Received: from mta0.migadu.com (out-151.mta0.migadu.com [91.218.175.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E152749C1
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 00:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790987600; cv=none; b=MTshOkuC6tpplYYt3hLjLEVO27MFGVt7b6GaxCBOpCC1+q9kcXd0vfe1GYnh9AuxG6xr9l6pTKbG2ptrpeuqlb/TqBKD0tgHSvweyAtzUWGcGaMwV+yTbI7vUFU18iqOcivPV0xo6BSYZP1eCb1a6lt4j+m5/fnJYDPzhyxANEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790987600; c=relaxed/simple;
	bh=DDuVIGDigWqCms6P/FhOZp7ya9RPMmgTWKMaKBSnco8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=AzKRoJO92OGr5bnkZnkmlzR8KqbhewfDRIrMJSH/rlXobMuHro0/94Y6Ge1V0B7MGBBcHrahM9wIjBVHIMcVTVxBqwAx/ib44fWulmG75czbzjeNkTnjxOEhOFXE9o87CAnwTuToKrKT+M0IW1+x08dNi4p2vjEdlOnR9iYqAkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=91.218.175.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 894fef0c8ad9ae09;
	Sat, 03 Oct 2026 00:33:15 +0000
X-Mizu-Trace-ID: 894fef0c8ad9ae09
X-Migadu-Flow: FLOW_OUT
From: Baoquan He <hebaoquan@kylinos.cn>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	chrisl@kernel.org,
	kasong@tencent.com,
	hannes@cmpxchg.org,
	nphamcs@gmail.com,
	baohua@kernel.org,
	youngjun.park@lge.com,
	yosry@kernel.org,
	shikemeng@huaweicloud.com,
	chengming.zhou@linux.dev,
	baoquan.he@linux.dev,
	david@kernel.org,
	linux-kernel@vger.kernel.org,
	kunwu.chan@gmail.com,
	klarasmodin@gmail.com,
	Baoquan He <hebaoquan@kylinos.cn>
Subject: [PATCH v4 13/14] mm, swap: add debugfs counters for xswap
Date: Sat,  3 Oct 2026 08:31:35 +0800
Message-ID: <20261003003136.750633-14-hebaoquan@kylinos.cn>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261003003136.750633-1-hebaoquan@kylinos.cn>
References: <20261003003136.750633-1-hebaoquan@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

The mapped range and the number of grow and shrink operations are not
visible from userspace, which makes the grow and shrink thresholds hard
to check: nothing says whether the range settles, how often it moves, or
where it lands.

Put them in debugfs rather than sysfs. This is not an interface and does
not want to be one, so it does not belong in the ABI:

  # cat /sys/kernel/debug/xswap/type0
  clusters_max 2038783
  clusters_mapped 292
  usage_pages 91456
  grows 3
  shrinks 1

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 include/linux/swap.h |  3 ++
 mm/swapfile.c        | 80 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 83 insertions(+)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index c56adbbcfd3b..ae2e49386443 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -248,6 +248,9 @@ struct swap_info_struct {
 	unsigned long		nr_clusters_mapped; /* currently mapped cluster count */
 	struct work_struct	xswap_shrink_work; /* deferred shrink trigger */
 	struct mutex		xswap_lock;	/* serialize map/unmap operations */
+	struct dentry		*xswap_debugfs;	/* mapped range and counters */
+	atomic_long_t		xswap_grows;	/* grow operations so far */
+	atomic_long_t		xswap_shrinks;	/* shrink operations so far */
 #endif
 	struct list_head free_clusters; /* free clusters list */
 	struct list_head full_clusters; /* full clusters list */
diff --git a/mm/swapfile.c b/mm/swapfile.c
index f823cebb7937..ab040d24bd2f 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -49,6 +49,8 @@
 #include <linux/leafops.h>
 #include "swap_table.h"
 #include "internal.h"
+#include <linux/debugfs.h>
+
 #include "swap.h"
 #define DEF_SWAP_PRIO  -1
 
@@ -84,6 +86,7 @@
 
 static bool xswap_should_grow(struct swap_info_struct *si);
 static unsigned long xswap_grow(struct swap_info_struct *si);
+static void xswap_debugfs_del(struct swap_info_struct *si);
 
 /* Batch size for the fallback unmap; keeps the stack array small. */
 #define XSWAP_UNMAP_BATCH_PAGES		16
@@ -3416,6 +3419,7 @@ static void free_swap_cluster_info(struct swap_info_struct *si)
 		}
 		/* free_vm_area() drops the mapping without freeing the pages. */
 		xswap_unmap_clusters(si, 0, si->nr_clusters_mapped);
+		xswap_debugfs_del(si);
 		free_vm_area(si->cluster_vm);
 		si->cluster_vm = NULL;
 		si->cluster_info = NULL;
@@ -4134,6 +4138,7 @@ static unsigned long xswap_grow(struct swap_info_struct *si)
 		spin_unlock(&ci->lock);
 	}
 
+	atomic_long_inc(&si->xswap_grows);
 	return nr_new;
 }
 
@@ -4370,10 +4375,79 @@ static void xswap_try_shrink(struct swap_info_struct *si)
 	spin_unlock(&si->lock);
 
 	xswap_unmap_clusters_locked(si, start_idx, nr_unmap);
+	atomic_long_inc(&si->xswap_shrinks);
 
 out_unlock:
 	mutex_unlock(&si->xswap_lock);
 }
+
+/* Not an interface: how far the mapped range has moved, for testing. */
+static ssize_t xswap_debugfs_read(struct file *file, char __user *buf,
+				  size_t count, loff_t *ppos)
+{
+	struct swap_info_struct *si = file->private_data;
+	struct swap_cluster_info *ci;
+	unsigned long mapped, tail = 0;
+	char tmp[192];
+	int len;
+
+	/*
+	 * The same scan the shrink does.  xswap_lock is what keeps
+	 * cluster_info from being unmapped under it.
+	 */
+	mutex_lock(&si->xswap_lock);
+	mapped = READ_ONCE(si->nr_clusters_mapped);
+	if (si->cluster_info) {
+		while (mapped - tail > 1) {
+			ci = &si->cluster_info[mapped - tail - 1];
+			if (READ_ONCE(ci->count) ||
+			    READ_ONCE(ci->flags) != CLUSTER_FLAG_FREE)
+				break;
+			tail++;
+		}
+	}
+	len = scnprintf(tmp, sizeof(tmp),
+			"clusters_max %lu\nclusters_mapped %lu\nusage_pages %lu\ntail_free %lu\ngrows %lu\nshrinks %lu\n",
+			READ_ONCE(si->nr_clusters_max), mapped,
+			swap_usage_in_pages(si), tail,
+			atomic_long_read(&si->xswap_grows),
+			atomic_long_read(&si->xswap_shrinks));
+	mutex_unlock(&si->xswap_lock);
+
+	return simple_read_from_buffer(buf, count, ppos, tmp, len);
+}
+
+static const struct file_operations xswap_debugfs_fops = {
+	.read	= xswap_debugfs_read,
+	.open	= simple_open,
+	.llseek	= default_llseek,
+};
+
+static struct dentry *xswap_debugfs_root;
+
+static void xswap_debugfs_add(struct swap_info_struct *si)
+{
+	char name[16];
+
+	if (!xswap_debugfs_root)
+		xswap_debugfs_root = debugfs_create_dir("xswap", NULL);
+	if (IS_ERR_OR_NULL(xswap_debugfs_root))
+		return;
+
+	/* debugfs_create_file() takes the name as it is; no formatting. */
+	snprintf(name, sizeof(name), "type%d", si->type);
+	si->xswap_debugfs = debugfs_create_file(name, 0444,
+						xswap_debugfs_root, si,
+						&xswap_debugfs_fops);
+	if (IS_ERR(si->xswap_debugfs))
+		si->xswap_debugfs = NULL;
+}
+
+static void xswap_debugfs_del(struct swap_info_struct *si)
+{
+	debugfs_remove(si->xswap_debugfs);
+	si->xswap_debugfs = NULL;
+}
 #endif /* CONFIG_XSWAP */
 
 static int setup_swap_clusters_info(struct swap_info_struct *si,
@@ -4568,10 +4642,16 @@ static int xswap_create(int prio)
 	 */
 	si->ops = &swap_bdev_ops;
 
+	si->xswap_debugfs = NULL;
+	atomic_long_set(&si->xswap_grows, 0);
+	atomic_long_set(&si->xswap_shrinks, 0);
+
 	error = setup_swap_clusters_info(si, NULL, maxpages);
 	if (error)
 		goto bad_swap;
 
+	xswap_debugfs_add(si);
+
 	error = zswap_swapon(si->type, si->max);
 	if (error)
 		goto bad_swap;
-- 
2.54.0

