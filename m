Received: from va-1-113.ptr.blmpb.com (va-1-113.ptr.blmpb.com [209.127.230.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C470331E844
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 17:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788973726; cv=none; b=gBh05zTNlssQKAZzhWI3bI8Z0OKTyOxUEZfWm+uO3SGyzgldq2WzaRihKhp1xoI+tacFjNoeg/KUqcNkMMM+Sl6o8VvO1tfYWf/4hs40c9RPx55OwCfqg3W3vUmAqXiez9Xe3AhJUxCR2ZCoinKWfP8fY4EZ/w2KI1PusL+7k3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788973726; c=relaxed/simple;
	bh=QZCW093E+D2nyI4UShEAXdlYzP5jckeOAUOyoHz6sC8=;
	h=Message-Id:Cc:Mime-Version:To:From:Date:Subject:Content-Type; b=iW4QpIhZndNv35XkOzB5pns3kbHypMkq7HGyUZBp4kvmanfTQoCm3HJwwwP1+CTKuRySE7HPUoWebaxWfCXQapl26+1W0iRYq2QCh8XEBeBJtWf0CIw8L10ZjdTO9xQ7W+GVlu+DcAFw9L5a9D7tNNm2xI7QFZ8RUEt5VEdoP+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=or1ptU6l; arc=none smtp.client-ip=209.127.230.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="or1ptU6l"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1788973718; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=ot3K2X/2YloRfCtV/mf2YWkwpChF9fDwu+aBl2Z5A1s=;
 b=or1ptU6lS/RuguvviKTmbORttXj1lBM5wzw0G+y9YkzVD2l08GwatYjRkv7lFG+EWb9JRR
 Z4rQy7jUurAMX8Dk2hj3dk6MZIECBBamyrKxysWltjrGbz4YEURwjqBxmn5jGzNQB2ZiU8
 Vz41HIzvHmzleZLE0FbVbdIG63Uf0qZNQhVisQFYBlEz8xqqU5ZhTQ4ub9f2Q0RayXxrni
 QiqjOSaBcynhGh0ZXoPNl0Y0LS/3FHf3euhvMpo3SoilOWGLJJUzzxcDmu/LdP2UVmMkPt
 6QEIQ5fGObtKD6z8erFZzHj2QhHqzmdVs8lXcul27OQtAPrkeHtxcuVh+Ti9Aw==
Message-Id: <20260909170833.5663-1-zhujia.zj@bytedance.com>
X-Lms-Return-Path: <lba+26aa19295+97a8af+vger.kernel.org+zhujia.zj@bytedance.com>
Cc: <linux-fsdevel@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	"Jia Zhu" <zhujia.zj@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
To: <jack@suse.cz>, <amir73il@gmail.com>
From: "Jia Zhu" <zhujia.zj@bytedance.com>
Date: Thu, 10 Sep 2026 01:08:33 +0800
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Subject: [PATCH] fsnotify: avoid unrelated mark reaper waits during group teardown
Content-Transfer-Encoding: 7bit
X-Original-From: Jia Zhu <zhujia.zj@bytedance.com>
Content-Type: text/plain; charset=UTF-8

fsnotify_destroy_group() unconditionally flushes the global mark reaper,
so an empty inotify instance can hang on unrelated reclamation during
close or task exit:

  do_exit
    __fput
      inotify_release
        fsnotify_destroy_group
          fsnotify_wait_marks_destroyed
            __flush_work

Skip the flush when only the closing reference remains, allowing teardown
to finish without waiting for unrelated SRCU readers.

Verified in QEMU: empty groups and groups whose marks have been reclaimed
exit while an unrelated SRCU reader remains held; groups with pending
reclamation still wait.

Signed-off-by: Jia Zhu <zhujia.zj@bytedance.com>
---
 fs/notify/group.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/fs/notify/group.c b/fs/notify/group.c
index b56d1c1d9644a..052a419ee52a6 100644
--- a/fs/notify/group.c
+++ b/fs/notify/group.c
@@ -46,6 +46,7 @@ void fsnotify_group_stop_queueing(struct fsnotify_group *group)
  * the group reference.
  * Note that another thread calling fsnotify_clear_marks_by_group() may still
  * hold a ref to the group.
+ * The caller must hold a reference and exclude new marks.
  */
 void fsnotify_destroy_group(struct fsnotify_group *group)
 {
@@ -67,19 +68,22 @@ void fsnotify_destroy_group(struct fsnotify_group *group)
 	 */
 	wait_event(group->notification_waitq, !atomic_read(&group->user_waits));
 
-	/*
-	 * Wait until all marks get really destroyed. We could actually destroy
-	 * them ourselves instead of waiting for worker to do it, however that
-	 * would be racy as worker can already be processing some marks before
-	 * we even entered fsnotify_destroy_group().
-	 */
-	fsnotify_wait_marks_destroyed();
+	/* Even detached marks hold a group reference until final destruction. */
+	if (refcount_read(&group->refcnt) == 1) {
+		/*
+		 * Pair the refcount read and this barrier with the release
+		 * decrement in fsnotify_put_group() (refcount_dec_and_test()),
+		 * ordering mark destruction before subsequent group teardown.
+		 */
+		smp_mb();
+	} else {
+		fsnotify_wait_marks_destroyed();
+	}
 
 	/*
-	 * Since we have waited for fsnotify_mark_srcu in
-	 * fsnotify_mark_destroy_list() there can be no outstanding event
-	 * notification against this group. So clearing the notification queue
-	 * of all events is reliable now.
+	 * Mark destruction waits for fsnotify_mark_srcu, so there can be no
+	 * outstanding event notification against this group. Clearing the
+	 * notification queue of all events is reliable now.
 	 */
 	fsnotify_flush_notify(group);
 
-- 
2.20.1
