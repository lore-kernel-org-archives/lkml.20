Received: from mta0.migadu.com (out-245.mta0.migadu.com [91.218.175.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFC943B6ED
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787824010; cv=none; b=Zg/0ipXGvd5sbodcKYjT9V5omMoGJ+ozsqjnFy+PaTn2GUsX7eqs5DE+zk5E1aW/q8C5ykROKx83LAdBIM7UF2fQuLTH9H/N0xsCFY5igIk+wwOM4mZNMRNFHZO/BOeWmLZH04e/CVkMVi2+3OY5+75eVjCYPsrasNYGhqL8twY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787824010; c=relaxed/simple;
	bh=zDNm+rSomhx/7IwZ/FGYQ5n4VLnmaoMb8hdN5Y0yJJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=iamwzoUNO9v60WXkbSI9XJ0xg9pwD5PCll9emqOLmB/EaOPJtZZtmkuQN2cL/s0CxZvixCQVPkmiACxvdHIfU+0xF86MIrV2OJJtduP4jLU7KlVtb18p0p5b0VfQYhwDp4Eqkzgq2lCvo3VWl0744Ltbc/q4dLLubPoZy3VDIqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=91.218.175.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 5f4f05cb0b049924;
	Thu, 27 Aug 2026 09:46:44 +0000
X-Mizu-Trace-ID: 5f4f05cb0b049924
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
Subject: [PATCH 14/16] mm, swap: refactor swapoff + add xswap_destroy
Date: Thu, 27 Aug 2026 17:45:04 +0800
Message-ID: <20260827094509.1016740-15-hebaoquan@kylinos.cn>
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

1. Extract __swapoff() from sys_swapoff(): the core teardown logic
   now lives in __swapoff(), shared by sys_swapoff() and the new
   xswap_destroy().  swap_file operations are guarded with NULL check
   so __swapoff() works for file-less devices too.  sys_swapoff()
   retains file-matching; a NULL guard on p->swap_file ensures xswap
   devices are never matched by the file path.

2. Add xswap_destroy(int type): tears down a file-less xswap device
   by its swap type.  Validates SWP_XSWAP | SWP_WRITEOK, removes
   from lists, delegates to __swapoff().

3. Add /sys/kernel/mm/xswap/destroy: write a swap type to tear down
   that xswap device.  Requires CAP_SYS_ADMIN.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 mm/swapfile.c | 197 ++++++++++++++++++++++++++++++++++----------------
 1 file changed, 136 insertions(+), 61 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index dc112c378489..451b46b747e3 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -160,6 +160,7 @@ static void xswap_debugfs_del(struct swap_info_struct *si)
 
 #ifdef CONFIG_SYSFS
 static int xswap_create(int percent);
+static int xswap_destroy(int type);
 /* /sys/kernel/mm/xswap/: create.
  * Per-device runtime size is tuned via debugfs type<N>_cluster_limit.
  */
@@ -192,8 +193,33 @@ static ssize_t xswap_create_store(struct kobject *kobj,
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
 
@@ -3361,61 +3387,13 @@ static void flush_percpu_swap_cluster(struct swap_info_struct *si)
 }
 
 
-SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
+/* Common swap teardown after list removal; shared by sys_swapoff() and
+ * xswap_destroy().
+ */
+static int __swapoff(struct swap_info_struct *p)
 {
-	struct swap_info_struct *p = NULL;
-	struct file *swap_file, *victim;
-	struct address_space *mapping;
-	struct inode *inode;
-	int err, found = 0;
-
-	if (!capable(CAP_SYS_ADMIN))
-		return -EPERM;
-
-	BUG_ON(!current->mm);
-
-	CLASS(filename, pathname)(specialfile);
-	victim = file_open_name(pathname, O_RDWR|O_LARGEFILE, 0);
-	if (IS_ERR(victim))
-		return PTR_ERR(victim);
-
-	mapping = victim->f_mapping;
-	spin_lock(&swap_lock);
-	plist_for_each_entry(p, &swap_active_head, list) {
-		if (p->flags & SWP_WRITEOK) {
-			if (p->swap_file->f_mapping == mapping) {
-				found = 1;
-				break;
-			}
-		}
-	}
-	if (!found) {
-		err = -EINVAL;
-		spin_unlock(&swap_lock);
-		goto out_dput;
-	}
-
-	/* Refuse swapoff while the device is pinned for hibernation */
-	if (p->flags & SWP_HIBERNATION) {
-		err = -EBUSY;
-		spin_unlock(&swap_lock);
-		goto out_dput;
-	}
-
-	if (!security_vm_enough_memory_mm(current->mm, p->pages))
-		vm_unacct_memory(p->pages);
-	else {
-		err = -ENOMEM;
-		spin_unlock(&swap_lock);
-		goto out_dput;
-	}
-	spin_lock(&p->lock);
-	del_from_avail_list(p, true);
-	plist_del(&p->list, &swap_active_head);
-	atomic_long_sub(p->pages, &nr_swap_pages);
-	total_swap_pages -= p->pages;
-	spin_unlock(&p->lock);
-	spin_unlock(&swap_lock);
+	struct file *swap_file = NULL;
+	int err;
 
 	wait_for_allocation(p);
 
@@ -3426,7 +3404,7 @@ SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
 	if (err) {
 		/* re-insert swap space back into swap_list */
 		reinsert_swap_info(p);
-		goto out_dput;
+		return err;
 	}
 
 	/*
@@ -3469,12 +3447,14 @@ SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
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
@@ -3485,10 +3465,69 @@ SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
 	p->flags = 0;
 	spin_unlock(&swap_lock);
 
-	err = 0;
 	atomic_inc(&proc_poll_event);
 	wake_up_interruptible(&proc_poll_wait);
 
+	return 0;
+}
+
+SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
+{
+	struct swap_info_struct *p = NULL;
+	struct file *victim;
+	struct address_space *mapping;
+	int err, found = 0;
+
+	if (!capable(CAP_SYS_ADMIN))
+		return -EPERM;
+
+	BUG_ON(!current->mm);
+
+	CLASS(filename, pathname)(specialfile);
+	victim = file_open_name(pathname, O_RDWR|O_LARGEFILE, 0);
+	if (IS_ERR(victim))
+		return PTR_ERR(victim);
+
+	mapping = victim->f_mapping;
+	spin_lock(&swap_lock);
+	plist_for_each_entry(p, &swap_active_head, list) {
+		if (p->flags & SWP_WRITEOK) {
+			if (p->swap_file && p->swap_file->f_mapping == mapping) {
+				found = 1;
+				break;
+			}
+		}
+	}
+	if (!found) {
+		err = -EINVAL;
+		spin_unlock(&swap_lock);
+		goto out_dput;
+	}
+
+	/* Refuse swapoff while the device is pinned for hibernation */
+	if (p->flags & SWP_HIBERNATION) {
+		err = -EBUSY;
+		spin_unlock(&swap_lock);
+		goto out_dput;
+	}
+
+	if (!security_vm_enough_memory_mm(current->mm, p->pages))
+		vm_unacct_memory(p->pages);
+	else {
+		err = -ENOMEM;
+		spin_unlock(&swap_lock);
+		goto out_dput;
+	}
+	spin_lock(&p->lock);
+	del_from_avail_list(p, true);
+	plist_del(&p->list, &swap_active_head);
+	atomic_long_sub(p->pages, &nr_swap_pages);
+	total_swap_pages -= p->pages;
+	spin_unlock(&p->lock);
+	spin_unlock(&swap_lock);
+
+	err = __swapoff(p);
+
 out_dput:
 	filp_close(victim, NULL);
 	return err;
@@ -4373,6 +4412,42 @@ static int xswap_create(int percent)
 	spin_unlock(&swap_lock);
 	return error;
 }
+
+/* Tear down a file-less xswap device by its swap type. */
+static int xswap_destroy(int type)
+{
+	struct swap_info_struct *p;
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
+	if (!security_vm_enough_memory_mm(current->mm, p->pages))
+		vm_unacct_memory(p->pages);
+	else {
+		spin_unlock(&swap_lock);
+		return -ENOMEM;
+	}
+	spin_lock(&p->lock);
+	del_from_avail_list(p, true);
+	plist_del(&p->list, &swap_active_head);
+	atomic_long_sub(p->pages, &nr_swap_pages);
+	total_swap_pages -= p->pages;
+	spin_unlock(&p->lock);
+	spin_unlock(&swap_lock);
+
+	return __swapoff(p);
+}
 #endif /* CONFIG_SYSFS */
 #endif /* CONFIG_XSWAP */
 
-- 
2.54.0

