Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794203754;
	b=mbDBmnpzIQ2Y7SJeyOR5t32X8PMnGeZhG6l++Y3vQyGLqmj45sEQ1HpnXr/9jwRpbCl/
	 MeHOEDbG2CYvg513ygyDwLqC0VTxiAMtFRBxVb6kwbs0mya/8roB5MRf6QdrjoLZ5WxBx
	 cvEuU7jApmd+u60ONKw7lX7AOios5zfu3d7MMPb4vVIxmbyLAhXeZTQU/p7Fum1N6efiy
	 ELd7Tl7aiJmk7Log4QbQFun9sRE5OqDfqX1LPXwQreSEcf7ewIDv9Pw/fdpNbUfsTrfSS
	 6aBHTNYdekH/BpA3aDbKpXwADCduYXDZnZe8iwL1qM0jVmA9DZrPU2X9YRnQ+ohjYpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794203754;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-type:
	 Content-Transfer-Encoding;
	bh=9GIo2UkpkdP7onxkxyabBA7g4HiK1e7Qvtr70HBzPDc=;
	b=Dvv985rUz1ehmj6/MtX09pZchBByMw8XgYfcSX/oa0k81cY0sL8pDPV3gBiBAbx1LNYo
	 7G/qv1m74NQ3mQ8qqrUO675VDmgvCHlDaywNLsJPQ5hBNBJqBWBBOj2ceVmlT375tzBBb
	 aFIeG9yzh9YOuDYhac5pXbi4na9JZErzNoO8Czm9GwbxEh9HC+0E9cl2/5ltQclu4fWn9
	 rjO9QDzDj35sMCyCL7HSZERtIVjqN8jkTVItiK0JyvNccfN+9ox7rgw4lns2ynUMAUTV8
	 7NwtTWsV+z2TRBvLulqt3zMtCl0drWImsFOAOZekZOh7Rxo69eIX4CX4ZSBU2KRpAnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KPzpAcvd;
	arc=none smtp.remote-ip=91.218.175.140
Received: from mta0.migadu.com (out-140.mta0.migadu.com [91.218.175.140])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB02606A333
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:55:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FB02606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KPzpAcvd
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=2b09xWFiKgnG0Sfu7a8FAk8GskA1FlvJgr+XW/Xe4eg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794203751; v=1; x=1794808551;
 b=KPzpAcvdtVuRgjoxcp2n3RxeWG+mKs8AjnC1u9Yj7H5XLonpACRSBh5NipiE48sptrQ8h/hr
 OR6FUr/1Z/57HJskOh+lX/r2ZU4hyMuWBtVtmX7CsqcyoyhFoqnpI7NWuZgb9Elsit1X2vMSRdO
 gGNye416qPSJ7wcjHWaBOPO8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 50ffbfaeaaba1c97;
	Mon, 09 Nov 2026 05:55:24 +0000
X-Mizu-Trace-ID: 50ffbfaeaaba1c97
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
	Baoquan He <hebaoquan@kylinos.cn>,
	Kunwu Chan <chentao@kylinos.cn>
Subject: [PATCH v5 02/19] mm, swap: refactor free_swap_cluster_info to take swap_info_struct
Date: Mon,  9 Nov 2026 13:54:38 +0800
Message-ID: <20261109055455.536925-3-baoquan.he@linux.dev>
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

Change free_swap_cluster_info() to take struct swap_info_struct* instead
of (cluster_info, maxpages). It now extracts the fields from si and
clears si->cluster_info after freeing to avoid a double free on the
swapon() error path.

The new parameter also lets the xswap path access si->flags in the
function.

Reviewed-by: Chris Li <chrisl@kernel.org>
Reviewed-by: Kunwu Chan <chentao@kylinos.cn>
Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 mm/swapfile.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 0b1fef65b6a0..619bd5305120 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -3155,14 +3155,17 @@ static void wait_for_allocation(struct swap_info_struct *si)
 	}
 }
 
-static void free_swap_cluster_info(struct swap_cluster_info *cluster_info,
-				   unsigned long maxpages)
+static void free_swap_cluster_info(struct swap_info_struct *si)
 {
+	struct swap_cluster_info *cluster_info = si->cluster_info;
+	unsigned long maxpages = si->max;
 	struct swap_cluster_info *ci;
-	int i, nr_clusters = DIV_ROUND_UP(maxpages, SWAPFILE_CLUSTER);
+	int i, nr_clusters;
 
 	if (!cluster_info)
 		return;
+
+	nr_clusters = DIV_ROUND_UP(maxpages, SWAPFILE_CLUSTER);
 	for (i = 0; i < nr_clusters; i++) {
 		ci = cluster_info + i;
 		/* Cluster with bad marks count will have a remaining table */
@@ -3174,6 +3177,7 @@ static void free_swap_cluster_info(struct swap_cluster_info *cluster_info,
 		spin_unlock(&ci->lock);
 	}
 	kvfree(cluster_info);
+	si->cluster_info = NULL;
 }
 
 /*
@@ -3201,11 +3205,9 @@ static void flush_percpu_swap_cluster(struct swap_info_struct *si)
 SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
 {
 	struct swap_info_struct *p = NULL;
-	struct swap_cluster_info *cluster_info;
 	struct file *swap_file, *victim;
 	struct address_space *mapping;
 	struct inode *inode;
-	unsigned int maxpages;
 	int err, found = 0;
 
 	if (!capable(CAP_SYS_ADMIN))
@@ -3297,10 +3299,6 @@ SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
 
 	swap_file = p->swap_file;
 	p->swap_file = NULL;
-	maxpages = p->max;
-	cluster_info = p->cluster_info;
-	p->max = 0;
-	p->cluster_info = NULL;
 	spin_unlock(&p->lock);
 	spin_unlock(&swap_lock);
 	arch_swap_invalidate_area(p->type);
@@ -3308,7 +3306,9 @@ SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
 	mutex_unlock(&swapon_mutex);
 	kfree(p->global_cluster);
 	p->global_cluster = NULL;
-	free_swap_cluster_info(cluster_info, maxpages);
+	free_swap_cluster_info(p);
+	p->max = 0;
+	p->cluster_info = NULL;
 
 	inode = mapping->host;
 
@@ -3675,6 +3675,8 @@ static int setup_swap_clusters_info(struct swap_info_struct *si,
 	if (!cluster_info)
 		goto err;
 
+	si->cluster_info = cluster_info;
+
 	for (i = 0; i < nr_clusters; i++)
 		spin_lock_init(&cluster_info[i].lock);
 
@@ -3738,7 +3740,7 @@ static int setup_swap_clusters_info(struct swap_info_struct *si,
 	si->cluster_info = cluster_info;
 	return 0;
 err:
-	free_swap_cluster_info(cluster_info, maxpages);
+	free_swap_cluster_info(si);
 	return err;
 }
 
@@ -3960,7 +3962,7 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 	si->global_cluster = NULL;
 	inode = NULL;
 	destroy_swap_extents(si, swap_file);
-	free_swap_cluster_info(si->cluster_info, si->max);
+	free_swap_cluster_info(si);
 	si->cluster_info = NULL;
 	/*
 	 * Clear the SWP_USED flag after all resources are freed so
-- 
2.54.0

