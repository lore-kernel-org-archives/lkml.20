Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.202
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794203833;
	b=FJgV5eVDsEIyOl+YBQuYuSgekabMKVSbtTh6/G73Q1xd5alYykSFnsGr5hawBnHfezl3
	 +Q1N13Df0++Y5L8fyI8RUe2Qrs/QxLNFY582PlLcP3lTgse9ARnP27arJYDBEcCqPO0gU
	 cCQNMFfU33JDYizuKog2z0y9eXWxYjSm5ougcMAafZ8SypUt1LEh1bVy9zjtVvzHIIhga
	 gpSEFqBYhCUoAbST0l5qUXPspeCDHYp9eoSNPfNJi7kWIq7gby9mHyHFci45Zptm6fTxR
	 aESynbbnoAPkT5Tzw0uEc8rcVlMnoOOJ8FTcfqt2Nrb1PvGZvtlOSG3VK4R+el8XVAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794203833;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-type:
	 Content-Transfer-Encoding;
	bh=1Mcv/XJaMcAv3XMoY0dY+kxAeOd8sz09Ek9mVYGDsbE=;
	b=CnqESg2VVI8hLIu0/8dKbS0Qk6Ez8Pw3HlfTRL83x+X/OExmREIr18qcYculQAHhk08Y
	 UNUyjhFNqfVz8fF2WkuiSiypWjOJbt5wDt5IA1SjDNbjbviNYwtoUV30mIU13exrmUMZL
	 QcwescEhfKGSgmxdUP2o40N6jb5bsdWgewE6xF0cpPQ3F85EZNPwAnUKvnMjTDjv6RkYA
	 OsKLdCZa9qoik3IutUfDJJN0aOWws06OCAoth/IegS9pzEvw6GVg+0QxqmSkbp6WqqEJ7
	 0N76W2YAP/6mQBXGNUGp+btP/58kaDK8upPqip2ykydQL+l4R4CLPdieNkdADN+iTYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=r02Jn7yl;
	arc=none smtp.remote-ip=91.218.175.202
Received: from mta0.migadu.com (out-202.mta0.migadu.com [91.218.175.202])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB4D606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:57:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DB4D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=r02Jn7yl
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Gk1lEeXwH6beBGZ93Rd5bpmNiJTelW9F3TI6PxqpXmM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794203830; v=1; x=1794808630;
 b=r02Jn7ylr8duxxZ01z3Co9kR29/PZyplz6fdzEbDoXVRk1b7itSxBwQHuG/rZNzcU5fVbOaM
 X5sokBywT9f4NxnM/gg1BvE2dqMSeO81/IJn9NMszB5k8YGA3Ogj45tZhRsozcyndVPe3siwqpl
 owRGf13cl3N53iDdRrMphau0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 8f47b3e4ceaa730d;
	Mon, 09 Nov 2026 05:57:10 +0000
X-Mizu-Trace-ID: 8f47b3e4ceaa730d
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
Subject: [PATCH v5 14/19] mm, swap: add debugfs counters for xswap
Date: Mon,  9 Nov 2026 13:54:50 +0800
Message-ID: <20261109055455.536925-15-baoquan.he@linux.dev>
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

The mapped range and the grow count are not visible from userspace.
This makes it hard to check if the grow thresholds work: we cannot see
how large the mapped range is, how much it grows, or how much free tail
it keeps.

Put this information in debugfs. It is a debugging aid, not a stable
interface, so it does not belong in sysfs or the ABI:

  # cat /sys/kernel/debug/xswap/xswap1
  type 0
  clusters_max 2038783
  clusters_mapped 292
  usage_pages 91456
  tail_free 16
  grows 3
  shrinks 0

The shrink counter is initialized here. It will start to increase when
the shrink path is added.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 include/linux/swap.h |  3 ++
 mm/swapfile.c        | 78 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index f4eb1912d1e6..29623c5138ab 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -248,6 +248,9 @@ struct swap_info_struct {
 	unsigned long		nr_clusters_max;/* total clusters in the xswap address space */
 	unsigned long		nr_clusters_mapped; /* currently mapped cluster count */
 	struct mutex		xswap_lock;	/* serialize map/unmap operations */
+	struct dentry		*xswap_debugfs;	/* mapped range and counters */
+	atomic_long_t		xswap_grows;	/* grow operations so far */
+	atomic_long_t		xswap_shrinks;	/* shrink operations so far */
 #endif
 	struct list_head free_clusters; /* free clusters list */
 	struct list_head full_clusters; /* full clusters list */
diff --git a/mm/swapfile.c b/mm/swapfile.c
index ba730fa19194..2624233b4fc2 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -46,12 +46,14 @@
 #include <linux/suspend.h>
 #include <linux/zswap.h>
 #include <linux/plist.h>
+#include <linux/debugfs.h>
 
 #include <asm/tlbflush.h>
 #include <linux/leafops.h>
 #include "swap_table.h"
 #include "internal.h"
 #include "swap.h"
+
 #define DEF_SWAP_PRIO  -1
 
 /*
@@ -92,6 +94,7 @@
 
 static bool xswap_should_grow(struct swap_info_struct *si);
 static unsigned long xswap_grow(struct swap_info_struct *si);
+static void xswap_debugfs_del(struct swap_info_struct *si);
 static int xswap_map_clusters(struct swap_info_struct *si,
 			      unsigned long start_idx, unsigned long nr);
 static void xswap_unmap_clusters(struct swap_info_struct *si,
@@ -3488,6 +3491,7 @@ static void free_swap_cluster_info(struct swap_info_struct *si)
 		 * pages, and the unmap helper handles an empty range.
 		 */
 		xswap_unmap_clusters(si, 0, si->nr_clusters_mapped);
+		xswap_debugfs_del(si);
 		free_vm_area(si->cluster_vm);
 		si->cluster_vm = NULL;
 		si->cluster_info = NULL;
@@ -4265,6 +4269,7 @@ static unsigned long xswap_grow(struct swap_info_struct *si)
 		spin_unlock(&ci->lock);
 	}
 
+	atomic_long_inc(&si->xswap_grows);
 	return nr_new;
 }
 
@@ -4336,6 +4341,73 @@ static int xswap_mapped_end(pte_t *pte, unsigned long addr, void *data)
 	*mapped_end = addr + PAGE_SIZE;
 	return 0;
 }
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
+			"type %d\nclusters_max %lu\nclusters_mapped %lu\nusage_pages %lu\ntail_free %lu\ngrows %lu\nshrinks %lu\n",
+			si->type, READ_ONCE(si->nr_clusters_max), mapped,
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
+	char name[32];
+
+	if (!xswap_debugfs_root)
+		xswap_debugfs_root = debugfs_create_dir("xswap", NULL);
+	if (IS_ERR_OR_NULL(xswap_debugfs_root))
+		return;
+
+	/* debugfs_create_file() takes the name as it is; no formatting. */
+	snprintf(name, sizeof(name), "xswap%llu",
+		 (unsigned long long)si->xswap_id);
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
@@ -4552,6 +4624,10 @@ static int xswap_create(int prio)
 	 */
 	si->ops = &swap_bdev_ops;
 
+	si->xswap_debugfs = NULL;
+	atomic_long_set(&si->xswap_grows, 0);
+	atomic_long_set(&si->xswap_shrinks, 0);
+
 	error = setup_swap_clusters_info(si, NULL, maxpages);
 	if (error)
 		goto bad_swap;
@@ -4561,6 +4637,8 @@ static int xswap_create(int prio)
 		goto bad_swap;
 
 	mutex_lock(&swapon_mutex);
+	/* Two creates would race to make the root directory. */
+	xswap_debugfs_add(si);
 	si->prio = prio;
 	si->list.prio = -si->prio;
 	si->avail_list.prio = -si->prio;
-- 
2.54.0

