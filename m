Received: from mta1.migadu.com (out-57.mta1.migadu.com [95.215.58.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC2F368D70
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789016063; cv=none; b=ShvhBfqQsIz6n2UjLGpVMbQMpOSCZI/aeH+x/104jSALKuGGE9X8ogoHwcIbploZYC1F9VJWhCSpxWTTNUpRsH3tYJCXo76jy2E82iqFhCkWtYtrfeL3CgyY3ZLmFwcdo+OboHPq2ZgAdWIfDYohrN9TX+iJQvU0JhFpeemWYYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789016063; c=relaxed/simple;
	bh=V383zAfWwZwigQCsoN9reju52t9jYgCgai+gj9LwMlE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gt/dTWyS0I4SRgknE5NA1ebT3vvOqN2bxOudix3UXjimBWzst7Zw3akw5Byk1qNIWV+tSxQ2FGpM0P8/t9DF4bRKPDutp54OvyZZN101LvIo9DWx83mQQTI9jCpfV/sgC7HlPkQw6YQypqB7sul9T8IYdAwaLjsLLchQwfKInYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TylA1K5U; arc=none smtp.client-ip=95.215.58.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TylA1K5U"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=V383zAfWwZwigQCsoN9reju52t9jYgCgai+gj9LwMlE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789016055; v=1; x=1789620855;
 b=TylA1K5UcWkXZPyl9I0LaRGkYxPzSHZPADlsQAVd8ANzU7zACo3IwoTzFLjY9oyE5hrk1EWZ
 g85XSLEWaBk2/OZCkh/EBJpFuvhSQJHPJD6DHQtltyP2b8pT6AbKTz1esN24RxgiWHL0URa14Kf
 5sewEBp/4JT7nZzRVJIKYhN0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 38b1e1fbd4224c91;
	Thu, 10 Sep 2026 04:54:15 +0000
X-Mizu-Trace-ID: 38b1e1fbd4224c91
X-Migadu-Flow: FLOW_OUT
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>,
	Christian Brauner <christian@brauner.io>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Meta kernel team <kernel-team@meta.com>,
	linux-fsdevel@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kernfs: don't hold kernfs_rwsem across notification delivery
Date: Wed,  9 Sep 2026 21:54:06 -0700
Message-ID: <20260910045406.485295-1-shakeel.butt@linux.dev>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recently at Meta we noticed that on multi-tenant systems, a workload
under extreme memory pressure negatively impacts unrelated workloads and
system daemons like below [1] and fb-oomd [2]. Mainly we observed that
system daemons were stuck on kernfs_rwsem in cgroup-related interfaces
for long periods of time.

On further inspection, we found that the workload under pressure had
registered inotify watches on its memory.events and was continuously
receiving limit-hitting notifications. The cgroup notification is done in
kernfs_notify_workfn(), which holds kernfs_supers_rwsem and kernfs_rwsem
and calls fsnotify(), which allocates the event with
kmalloc(GFP_KERNEL_ACCOUNT|__GFP_RETRY_MAYFAIL) charged to the watching
cgroup, which is already under memory pressure. So the notify worker
ended up in memory reclaim of a cgroup already under pressure, and itself
kept triggering the limit notifications.

This notification path takes the locks in read mode, but a waiting writer
blocks all future readers. That is exactly what is happening in the Meta
fleet, and it leaves daemons that are critical to the reliability of the
system stuck for long periods of time.

Commit 400188ae361a ("kernfs: Acquire kernfs_rwsem in
kernfs_notify_workfn().") added kernfs_rwsem just to safely read
kernfs_node::name.  Let's sample the name once before the loop and drop
the lock.  kernfs_supers_rwsem still covers the list, and the removal
paths take that one for reading too, so a stalled worker can still hold
a removal up once a mount or unmount is queued behind it.

Two things change for a watcher.  A name longer than NAME_MAX now gives
an event with no name, where before it gave one with the full name;
fsnotify() takes the name as optional, so the event still arrives.  And
the name and the parent are no longer sampled under one lock, so a rename
between the two would name a file against the directory it moved to.
That cannot happen today: kernfs_notify() rejects anything that is not a
file, and no caller of kernfs_rename_ns() renames one.

[1] https://github.com/facebookincubator/below
[2] https://github.com/facebookincubator/oomd

Fixes: 400188ae361a ("kernfs: Acquire kernfs_rwsem in kernfs_notify_workfn().")
Assisted-by: LLM
Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
---
 fs/kernfs/file.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/fs/kernfs/file.c b/fs/kernfs/file.c
index 8e0e90c93372..7e3800526b1e 100644
--- a/fs/kernfs/file.c
+++ b/fs/kernfs/file.c
@@ -904,9 +904,12 @@ static loff_t kernfs_fop_llseek(struct file *file, loff_t offset, int whence)
 
 static void kernfs_notify_workfn(struct work_struct *work)
 {
-	struct kernfs_node *kn;
+	char name_buf[NAME_MAX + 1];
 	struct kernfs_super_info *info;
+	struct kernfs_node *kn;
 	struct kernfs_root *root;
+	struct qstr name;
+	bool have_name;
 repeat:
 	/* pop one off the notify_list */
 	spin_lock_irq(&kernfs_notify_lock);
@@ -922,14 +925,20 @@ static void kernfs_notify_workfn(struct work_struct *work)
 	root = kernfs_root(kn);
 	/* kick fsnotify */
 
+	/*
+	 * Sample the name once so kernfs_rwsem need not be held across the
+	 * loop.  A name that does not fit is reported without one; fsnotify()
+	 * takes the name as optional, so a watcher loses the name and not the
+	 * event.
+	 */
+	have_name = kernfs_name(kn, name_buf, sizeof(name_buf)) >= 0;
+	name = QSTR(name_buf);
+
 	down_read(&root->kernfs_supers_rwsem);
-	down_read(&root->kernfs_rwsem);
-	list_for_each_entry(info, &kernfs_root(kn)->supers, node) {
+	list_for_each_entry(info, &root->supers, node) {
 		struct kernfs_node *parent;
 		struct inode *p_inode = NULL;
-		const char *kn_name;
 		struct inode *inode;
-		struct qstr name;
 
 		/*
 		 * We want fsnotify_modify() on @kn but as the
@@ -941,15 +950,14 @@ static void kernfs_notify_workfn(struct work_struct *work)
 		if (!inode)
 			continue;
 
-		kn_name = kernfs_rcu_name(kn);
-		name = QSTR(kn_name);
 		parent = kernfs_get_parent(kn);
 		if (parent) {
 			p_inode = ilookup(info->sb, kernfs_ino(parent));
 			if (p_inode) {
 				fsnotify(FS_MODIFY | FS_EVENT_ON_CHILD,
 					 inode, FSNOTIFY_EVENT_INODE,
-					 p_inode, &name, inode, 0);
+					 p_inode, have_name ? &name : NULL,
+					 inode, 0);
 				iput(p_inode);
 			}
 
@@ -962,7 +970,6 @@ static void kernfs_notify_workfn(struct work_struct *work)
 		iput(inode);
 	}
 
-	up_read(&root->kernfs_rwsem);
 	up_read(&root->kernfs_supers_rwsem);
 	kernfs_put(kn);
 	goto repeat;
-- 
2.53.0-Meta

