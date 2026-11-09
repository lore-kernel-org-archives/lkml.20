Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794203801;
	b=HYJDwyGg01zATd7Cw8MlpEZ7Y95EX3+3p/y+k1PetoR4T4VXsCUkeCsFGsTja0JhIbTN
	 4bQ1QKKLPuzFdE8hYdMF0atp2anFKPQKPUzTFdaJ6SsWQMexfQYU9YyXEJ3PFOy/U8RS/
	 oKlNWYLseUf6RSKZv8Qzo7OKbDNZjMaRrKQoudf307vIiipKlMjAL/uVEU4NeC1kuzhrK
	 wcEZgVNLlcpMQ7ZKhdsDKAdWcBNojSE3oSqMeYd1Uz1yIQGcmbGubxtq1fax6FGSyoa5m
	 L7IC99DnrIeIE9uvo8AleOWAtushUYr4Dr3zJaL7A6rpIQn3JkmFBL6O6IlG3SLqrDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794203801;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-type:
	 Content-Transfer-Encoding;
	bh=JlCBONNT+ZbDg6qPytivkskPPXY8kXKDvS7EHo0dVm0=;
	b=H2jJcpPb8oIBBYR1VSzOXqNcYn6kWvyiMPGezNxGRhvd6kwMZRkFK3o/nkiPtzePM39c
	 VJRumfQcrhCgjABK3HegSmAzUdtc/ouunXu7qE/6lbrukgmhHD7VjJ82MdkVcmGrpKnD2
	 rfGkDFYxaENdBZlAjhA8YPoGzjKyYuc3IIiZtl77qI+D12rZBs+gm1sSg60p2al9T71DJ
	 Mc9NIF1sEBfOL5l6qIBRJACzS8I7E1EJBE+7KLEcL13S3rX0GUQvraWoXtXJw28f9nfm8
	 Y6tbcCjGo394ayGdmS7iz7dhLz/Tnamueib5voLwUI0zn5R2hYdoyjqn6vZ5NkSTP+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EY+aAeFm;
	arc=none smtp.remote-ip=91.218.175.171
Received: from mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20904606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:56:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20904606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EY+aAeFm
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=MD3o7aNueWGNBNBzZbpbzs78TOr8ucQzwGbCBJTHSEk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794203799; v=1; x=1794808599;
 b=EY+aAeFmmmKxoY2rZCPk8W28WPakqyQXhPFMw1YLdjNis6chIaFn6Y+NBpueTiHDOubo0ou5
 glSObn3VM/Ej4I7sb2rro7mWK76qOb89WbZgly/1RlwyaF2PoOlBhTGT4X755A91CRLfqa8iC/F
 Khcz//NM60VNY4DwJnO7DcKY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 1bb98dd1117171f9;
	Mon, 09 Nov 2026 05:56:39 +0000
X-Mizu-Trace-ID: 1bb98dd1117171f9
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
Subject: [PATCH v5 09/19] mm, swap: use a stable id for xswap devices
Date: Mon,  9 Nov 2026 13:54:45 +0800
Message-ID: <20261109055455.536925-10-baoquan.he@linux.dev>
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

Give each xswap device a 64-bit id from a counter. The id is never
reused. Show "xswap<id>" in /proc/swaps and use the same id in
debugfs. Destroy matches the id, so an old name fails with -ENODEV
instead of hitting a new device.

This avoids names based on the swap type, which can be reused after
swapoff. The swap type is still used inside the kernel and in dmesg.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 include/linux/swap.h |  1 +
 mm/swapfile.c        | 59 ++++++++++++++++++++++++++++++--------------
 2 files changed, 42 insertions(+), 18 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index 569989856c25..f4eb1912d1e6 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -244,6 +244,7 @@ struct swap_info_struct {
 	struct swap_cluster_info *cluster_info; /* array, one entry per cluster */
 #ifdef CONFIG_XSWAP
 	struct vm_struct	*cluster_vm;	/* VM_SPARSE area for cluster_info */
+	u64			xswap_id;	/* stable id, shown to userspace */
 	unsigned long		nr_clusters_max;/* total clusters in the xswap address space */
 	unsigned long		nr_clusters_mapped; /* currently mapped cluster count */
 	struct mutex		xswap_lock;	/* serialize map/unmap operations */
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 35c8aac1e25d..44b54118d10a 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -86,7 +86,10 @@ static void xswap_unmap_clusters(struct swap_info_struct *si,
 static int xswap_mapped_end(pte_t *pte, unsigned long addr, void *data);
 
 static int xswap_create(int prio);
-static int xswap_destroy(int type);
+static int xswap_destroy(u64 id);
+
+/* Stable device id, assigned at create and never reused. */
+static atomic64_t xswap_id_counter = ATOMIC64_INIT(0);
 
 static ssize_t xswap_create_store(struct kobject *kobj,
 				  struct kobj_attribute *attr,
@@ -121,19 +124,17 @@ static ssize_t xswap_destroy_store(struct kobject *kobj,
 				   struct kobj_attribute *attr,
 				   const char *buf, size_t count)
 {
-	unsigned long type;
+	u64 id;
 	int err;
 
 	if (!capable(CAP_SYS_ADMIN))
 		return -EPERM;
 
-	err = kstrtoul(buf, 0, &type);
+	err = kstrtoull(buf, 0, &id);
 	if (err)
 		return err;
-	if (type >= MAX_SWAPFILES)
-		return -EINVAL;
 
-	err = xswap_destroy(type);
+	err = xswap_destroy(id);
 	if (err)
 		return err;
 
@@ -3657,9 +3658,15 @@ static int swap_show(struct seq_file *swap, void *v)
 	if (file)
 		len = seq_file_path(swap, file, " \t\n\\");
 	else {
-		char name[16];
+		char name[32];
 
+#ifdef CONFIG_XSWAP
+		len = scnprintf(name, sizeof(name), "xswap%llu",
+				(unsigned long long)si->xswap_id);
+#else
+		/* CONFIG_XSWAP=n has no file-less devices; keep the type. */
 		len = scnprintf(name, sizeof(name), "xswap%d", si->type);
+#endif
 		seq_puts(swap, name);
 	}
 	seq_printf(swap, "%*s%s\t%lu\t%s%lu\t%s%d\n",
@@ -4295,6 +4302,11 @@ static int xswap_create(int prio)
 	si->flags |= SWP_XSWAP | SWP_SOLIDSTATE;
 	si->max = maxpages;
 	si->pages = maxpages - 1;
+	/*
+	 * Set before the device is enabled, for debugfs; destroy only matches
+	 * a WRITEOK device, so the create window is not reachable.
+	 */
+	si->xswap_id = atomic64_inc_return(&xswap_id_counter);
 	/*
 	 * No backing file: setup_swap_extents() is only reachable from the
 	 * file-backed swapon() path, so set ops here.  Only ops->flags is
@@ -4316,8 +4328,8 @@ static int xswap_create(int prio)
 	si->list.prio = -si->prio;
 	si->avail_list.prio = -si->prio;
 	enable_swap_info(si);
-	pr_info("xswap: adding extendable swap type %d (prio %d, %lu pages)\n",
-		si->type, prio, si->pages);
+	pr_info("xswap: adding extendable swap device xswap%llu (prio %d, %lu pages)\n",
+		(unsigned long long)si->xswap_id, prio, si->pages);
 	mutex_unlock(&swapon_mutex);
 	atomic_inc(&proc_poll_event);
 	wake_up_interruptible(&proc_poll_wait);
@@ -4336,20 +4348,31 @@ static int xswap_create(int prio)
 	return error;
 }
 
-/* Tear down a file-less xswap device by its swap type. */
-static int xswap_destroy(int type)
+/* Tear down a file-less xswap device by its stable id. */
+static int xswap_destroy(u64 id)
 {
-	struct swap_info_struct *p;
+	struct swap_info_struct *p = NULL;
+	unsigned int type;
 	int err;
 
-	p = swap_type_to_info(type);
-	if (!p)
-		return -EINVAL;
-
 	spin_lock(&swap_lock);
-	if (!(p->flags & SWP_WRITEOK) || !(p->flags & SWP_XSWAP)) {
+	/*
+	 * Match only a device that is fully enabled: one still being created
+	 * is not WRITEOK yet, and one being destroyed has lost it. Neither
+	 * is a valid target, so both read as "no such device".
+	 */
+	for (type = 0; type < nr_swapfiles; type++) {
+		struct swap_info_struct *q = swap_info[type];
+
+		if (q && (q->flags & (SWP_XSWAP | SWP_WRITEOK)) ==
+			 (SWP_XSWAP | SWP_WRITEOK) && q->xswap_id == id) {
+			p = q;
+			break;
+		}
+	}
+	if (!p) {
 		spin_unlock(&swap_lock);
-		return -EINVAL;
+		return -ENODEV;
 	}
 	/* Refuse swapoff while the device is pinned for hibernation */
 	if (p->flags & SWP_HIBERNATION) {
-- 
2.54.0

