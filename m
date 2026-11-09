Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.165
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794203789;
	b=zjCc1Hj8SarneCq0vR2zJFI4evhE6oUYdY9e7MYaA9bmA//UVRYCkON0DY2BlH/wZ7UM
	 CNonroh1WAr1OOhBjnfI9XJIoPIH02PuBykrTUKHi4O/P3ppy/RKlrFCYXysDegwFHrEm
	 y3g8maNXlwSrCRJFaIowmgddv7U5NZgsZeibB9p+27mb/SbyHg0p4o6fDXad/A+IANvSP
	 zxk5Q82t6n3rLAB6DRtAJRbFesW+aqMVmHJKDCFksV50/4m1INazffo/jCYUnml6irtS3
	 BSgeIdHuHv+x+29oMo2vaZoRKjO8lu0KNy1uUfB49ng86sy+DROXb2OR5ME3EEN2OcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794203789;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-type:
	 Content-Transfer-Encoding;
	bh=cBPK2bWCIiA35KexCp977hu0u4JhPWx94qijTZF4Drw=;
	b=eyZZ5pvJHvQDy5ckfyVgT9G8qS+U3ZgGQ4SXRqwIlLtaGerLsuKtoXqtxaDtdkKk5IbD
	 DlOTjVMJDQS861hWV9l232Lrh/wySJT9arGLCcjnDVpnG0MCOkUctDyC9F9LMn94zkoHU
	 nWKR4EyEYEU57DayOIKaRYxRA9g+bajdCfjcNhNEamT7F4FQWZUpZVSyePKVmKOoQUWiv
	 IkAdDX8hh+Lfu6A9iI0WQdBoLppeVM8t/G93T+rAyFDd+H473wNFKoce6wPWMC75x+eun
	 43jcG7cwGxU5gS8LYsG1U/9L6qsEZLXUeKbHdDs2j8FiB3e9yjyFIw/w6dc8tjJT9IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="lUKae8B/";
	arc=none smtp.remote-ip=91.218.175.165
Received: from mta0.migadu.com (out-165.mta0.migadu.com [91.218.175.165])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6F8606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:56:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD6F8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lUKae8B/
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Cu449HxZRkFE3StVJpRmbTVf00lAahvBFPbJvlhsIco=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794203787; v=1; x=1794808587;
 b=lUKae8B/DlS4DBPXOqay/pn6wFDHYSYdtxFjFILwjJRJZ+fSX61q0xm9bddOQLHd7NgYzr9X
 2tz2n6VBltaLFeysUW8f/CtEtv2PktQauKKPyia1N3IkVc9OMzE3zNS2w+8RevnsfDfDvnpmb/y
 VqpOpJGg17/VWzh7uvij3nn8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 11e07ec0317c68cf;
	Mon, 09 Nov 2026 05:56:26 +0000
X-Mizu-Trace-ID: 11e07ec0317c68cf
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
Subject: [PATCH v5 07/19] mm, swap: refactor swapoff and add xswap_destroy
Date: Mon,  9 Nov 2026 13:54:43 +0800
Message-ID: <20261109055455.536925-8-baoquan.he@linux.dev>
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

Extract __swapoff() from sys_swapoff() so the teardown logic can be
shared, and make it work for file-less devices.

Add xswap_destroy() to tear down a file-less xswap device by swap type,
exposed via /sys/kernel/mm/xswap/destroy. Writing a swap type tears down
that device; it requires CAP_SYS_ADMIN.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 mm/swapfile.c | 127 +++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 109 insertions(+), 18 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 616adbb298e7..3f2b863f7dd7 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -86,6 +86,7 @@ static void xswap_unmap_clusters(struct swap_info_struct *si,
 static int xswap_mapped_end(pte_t *pte, unsigned long addr, void *data);
 
 static int xswap_create(int prio);
+static int xswap_destroy(int type);
 
 static ssize_t xswap_create_store(struct kobject *kobj,
 				  struct kobj_attribute *attr,
@@ -116,8 +117,35 @@ static ssize_t xswap_create_store(struct kobject *kobj,
 static struct kobj_attribute xswap_create_attr = __ATTR(create, 0200, NULL,
 							xswap_create_store);
 
+static ssize_t xswap_destroy_store(struct kobject *kobj,
+				   struct kobj_attribute *attr,
+				   const char *buf, size_t count)
+{
+	unsigned long type;
+	int err;
+
+	if (!capable(CAP_SYS_ADMIN))
+		return -EPERM;
+
+	err = kstrtoul(buf, 0, &type);
+	if (err)
+		return err;
+	if (type >= MAX_SWAPFILES)
+		return -EINVAL;
+
+	err = xswap_destroy(type);
+	if (err)
+		return err;
+
+	return count;
+}
+
+static struct kobj_attribute xswap_destroy_attr = __ATTR(destroy, 0200, NULL,
+							 xswap_destroy_store);
+
 static struct attribute *xswap_attrs[] = {
 	&xswap_create_attr.attr,
+	&xswap_destroy_attr.attr,
 	NULL,
 };
 
@@ -3365,13 +3393,14 @@ static void flush_percpu_swap_cluster(struct swap_info_struct *si)
 	}
 }
 
+static int swap_info_remove(struct swap_info_struct *p);
+static int __swapoff(struct swap_info_struct *p);
 
 SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
 {
 	struct swap_info_struct *p = NULL;
-	struct file *swap_file, *victim;
+	struct file *victim;
 	struct address_space *mapping;
-	struct inode *inode;
 	int err, found = 0;
 
 	if (!capable(CAP_SYS_ADMIN))
@@ -3388,7 +3417,7 @@ SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
 	spin_lock(&swap_lock);
 	plist_for_each_entry(p, &swap_active_head, list) {
 		if (p->flags & SWP_WRITEOK) {
-			if (p->swap_file->f_mapping == mapping) {
+			if (p->swap_file && p->swap_file->f_mapping == mapping) {
 				found = 1;
 				break;
 			}
@@ -3407,20 +3436,50 @@ SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
 		goto out_dput;
 	}
 
-	if (!security_vm_enough_memory_mm(current->mm, p->pages))
-		vm_unacct_memory(p->pages);
-	else {
-		err = -ENOMEM;
+	err = swap_info_remove(p);
+	if (err) {
 		spin_unlock(&swap_lock);
 		goto out_dput;
 	}
+	spin_unlock(&swap_lock);
+
+	err = __swapoff(p);
+
+out_dput:
+	filp_close(victim, NULL);
+	return err;
+}
+
+/*
+ * Drop @p from the avail and active lists and undo its accounting.  The
+ * caller must hold swap_lock and have checked that @p is WRITEOK and not
+ * pinned for hibernation.
+ *
+ * Returns 0, or -ENOMEM with swap_lock still held.
+ */
+static int swap_info_remove(struct swap_info_struct *p)
+{
+	if (!security_vm_enough_memory_mm(current->mm, p->pages))
+		vm_unacct_memory(p->pages);
+	else
+		return -ENOMEM;
+
 	spin_lock(&p->lock);
 	del_from_avail_list(p, true);
 	plist_del(&p->list, &swap_active_head);
 	atomic_long_sub(p->pages, &nr_swap_pages);
 	total_swap_pages -= p->pages;
 	spin_unlock(&p->lock);
-	spin_unlock(&swap_lock);
+	return 0;
+}
+
+/* Common swap teardown after list removal; shared by sys_swapoff() and
+ * xswap_destroy().
+ */
+static int __swapoff(struct swap_info_struct *p)
+{
+	struct file *swap_file = NULL;
+	int err;
 
 	wait_for_allocation(p);
 
@@ -3431,7 +3490,7 @@ SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
 	if (err) {
 		/* re-insert swap space back into swap_list */
 		reinsert_swap_info(p);
-		goto out_dput;
+		return err;
 	}
 
 	/*
@@ -3471,15 +3530,21 @@ SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
 	kfree(p->global_cluster);
 	p->global_cluster = NULL;
 	free_swap_cluster_info(p);
+	/*
+	 * The device is off swap_active_head and no longer WRITEOK, so no
+	 * reader can observe these; clearing them here needs no lock.
+	 */
 	p->max = 0;
 	p->cluster_info = NULL;
 
-	inode = mapping->host;
+	if (swap_file) {
+		struct inode *inode = swap_file->f_mapping->host;
 
-	inode_lock(inode);
-	inode->i_flags &= ~S_SWAPFILE;
-	inode_unlock(inode);
-	filp_close(swap_file, NULL);
+		inode_lock(inode);
+		inode->i_flags &= ~S_SWAPFILE;
+		inode_unlock(inode);
+		filp_close(swap_file, NULL);
+	}
 
 	/*
 	 * Clear the SWP_USED flag after all resources are freed so that swapon
@@ -3490,13 +3555,10 @@ SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
 	p->flags = 0;
 	spin_unlock(&swap_lock);
 
-	err = 0;
 	atomic_inc(&proc_poll_event);
 	wake_up_interruptible(&proc_poll_wait);
 
-out_dput:
-	filp_close(victim, NULL);
-	return err;
+	return 0;
 }
 
 #ifdef CONFIG_PROC_FS
@@ -4269,6 +4331,35 @@ static int xswap_create(int prio)
 	spin_unlock(&swap_lock);
 	return error;
 }
+
+/* Tear down a file-less xswap device by its swap type. */
+static int xswap_destroy(int type)
+{
+	struct swap_info_struct *p;
+	int err;
+
+	p = swap_type_to_info(type);
+	if (!p)
+		return -EINVAL;
+
+	spin_lock(&swap_lock);
+	if (!(p->flags & SWP_WRITEOK) || !(p->flags & SWP_XSWAP)) {
+		spin_unlock(&swap_lock);
+		return -EINVAL;
+	}
+	/* Refuse swapoff while the device is pinned for hibernation */
+	if (p->flags & SWP_HIBERNATION) {
+		spin_unlock(&swap_lock);
+		return -EBUSY;
+	}
+
+	err = swap_info_remove(p);
+	spin_unlock(&swap_lock);
+	if (err)
+		return err;
+
+	return __swapoff(p);
+}
 #endif /* CONFIG_XSWAP */
 
 SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
-- 
2.54.0

