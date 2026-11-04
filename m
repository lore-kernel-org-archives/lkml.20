Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793761775;
	b=FDPnbbrjnGTf1pG90JuOWuYIMHAV8oP05PbzR6+dXE8WeJu9T2VB0BcnE2jFtYAIa7cF
	 hBQc0u1G11AebOkcw2DlHO4hXQLaY63ALnA2NTo2WGhxHes+80TIX/Ttsf3PJUs3fBC3W
	 XnU7Be3A8NWHXWUsoO8j/WYYGABfdtmWcSj9/850o08l8cjNpiEBCthOCto/H+1VTL5Xk
	 I+Bu1GKo5jMmCT2QHKZhuTl13CeKNCTzs59qvV3nPBuUbwWvkRARXjmJqadzvjkCmMDXT
	 EuxRQ13eRjpZgwjws464QzHEuQ8L2RMAKvRMTdo5ip9ZAKSzKrk6Um8FKpBTfqI3BKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793761775;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=PtppRtqHNRbGnmxrTtd2QEJGmhauyAjEy4PUv6vEkFo=;
	b=w6dej58YO/21GA7B6L4q+GdeQkR7LfjfqnmuFpvB4dd3AgebKWR427CRNU3T4LTl67SG
	 lPOqFEgf/Hz/IJfNM2vsDe9LoV0/0EqkLzIp9Ap43cRwcilTaDcL3ew1pQBZTqLky/Hcg
	 /UdZ2nztBXnc3c6ZAk3o/4QTkNr4NtzQzFqhsdlXKmE1ghCAIj+GyVbJ/NUBAaZwuIagU
	 v6gTRxFC7Yh1gQA0emmm5iH3sxv4THWGiFnkbtJhn1hMVSzqKKsmAyvISCtUGXRXNUltg
	 EdFKdCcI/OyyNtaeqtqkIOSkDKBElGtGRMPpnOFV10JaTYHWogoOKbh6TqNg/jYpegw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ps38kg8o;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69837606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 03:09:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69837606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ps38kg8o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793761775; x=1825297775;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7YJ6D6X404SFQcrDUq7zWYgMmYofJlI5HX2JZO4pNhg=;
  b=Ps38kg8olLkIAlEz3GKrP5ipFBV3K+gtEYUS044MecTRrXObeFWocAIp
   3vQfjA4LtNG+EPjmVKD8McU/iwfCbv9ZwTQJnhg5CE0mJW2FB0igsFvqI
   XYEMad4aaW/zPTji90Nn+YWbBlVTfBzQ3ICaQNfuyOACybSWpDjv0Txf9
   BI/ybO3VQ/RGveNwM6SHvn0zYrGSfEzeAe4xoWCko8ZIkGxlgf+huViWR
   YaPO5OC46e3LEVr7R3LzdOpVSU5oubSXd/5/mBnlf63VVL4XYySn2Zwzd
   8NzarcfyeXzz6FNpQi4SJQK/56JaQ6vBUWdDAL4qcixNpImyZOWQoBwNp
   A==;
X-CSE-ConnectionGUID: unAOy5k8To2+36se7ngWgQ==
X-CSE-MsgGUID: j/CTbcDDQzClv7IlRDpOCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2536096"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2536096"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 19:09:34 -0800
X-CSE-ConnectionGUID: vU83DuhHSMmKHvCvkRttSw==
X-CSE-MsgGUID: OMFdjV08R8etQcxI1Gsgtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6420301"
Received: from yufei-inspiron-3910.sh.intel.com ([10.239.92.97])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 19:09:31 -0800
From: "Yu, Fei" <fei.yu@intel.com>
To: dri-devel@lists.freedesktop.org,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org,
	syzbot+95416f957d84e858b377@syzkaller.appspotmail.com,
	Madhur Kumar <madhurkumar004@gmail.com>,
	Fei Yu <fei.yu@intel.com>
Subject: [PATCH v2] drm/syncobj: Limit the number of handles and use kvmalloc for user-sized arrays
Date: Wed,  4 Nov 2026 11:09:30 +0800
Message-ID: <20261104030930.3852781-1-fei.yu@intel.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Fei Yu <fei.yu@intel.com>

The syncobj ioctls allocate several temporary arrays whose size is taken
directly from the u32 count_handles provided by userspace:

 - handles and syncobjs in drm_syncobj_array_find()
 - points and entries in drm_syncobj_array_wait_timeout()
 - points and chains in drm_syncobj_timeline_signal_ioctl()

These are kmalloc() allocations, so a count above KMALLOC_MAX_SIZE /
element size trips the WARN_ON_ONCE_GFP() in ___kmalloc_large_node():

  WARNING: mm/slub.c:5459 at ___kmalloc_large_node+0x10c/0x170 mm/slub.c:5459
  Call Trace:
   __kmalloc_large_node_noprof+0x18/0x90 mm/slub.c:5502
   __do_kmalloc_node mm/slub.c:5519 [inline]
   __kmalloc_noprof+0x3f6/0x710 mm/slub.c:5556
   _kmalloc_noprof include/linux/slab.h:995 [inline]
   _kmalloc_array_noprof include/linux/slab.h:1211 [inline]
   drm_syncobj_array_find+0x3a/0x440 drivers/gpu/drm/drm_syncobj.c:1241
   drm_syncobj_timeline_wait_ioctl+0x18a/0x640 drivers/gpu/drm/drm_syncobj.c:1356
   drm_ioctl_kernel+0x2df/0x3b0 drivers/gpu/drm/drm_ioctl.c:817
   drm_ioctl+0x70e/0xba0 drivers/gpu/drm/drm_ioctl.c:914

The wait entries are 64 bytes each on 64-bit, so with a 4 MiB
KMALLOC_MAX_SIZE a wait on more than about 64K handles already fails
today, with a warning.

Fix this in two parts:

 - Reject more than DRM_SYNCOBJ_MAX_HANDLES handles with -EINVAL in
   drm_syncobj_array_find(), which every ioctl taking a handle array goes
   through. The limit is derived from the largest per-handle allocation
   (the wait entries) and the INT_MAX size limit of kvmalloc(), so none
   of the allocations above can exceed it. That is about 33M handles on
   64-bit.

 - Switch the six allocations to kvmalloc(), so that large but valid
   handle counts no longer depend on physically contiguous memory.

Using kvmalloc() alone is not enough: the reproducer asks for more than
INT_MAX bytes, which hits the WARN_ON_ONCE() in __kvmalloc_node_noprof()
instead.

Fixes: 3e6fb72d6cef ("drm/syncobj: Add a syncobj_array_find helper")
Reported-by: syzbot+95416f957d84e858b377@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=95416f957d84e858b377
Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Fei Yu <fei.yu@intel.com>
---
v2:
 - Drop __GFP_NOWARN (Christian).
 - Add DRM_SYNCOBJ_MAX_HANDLES, return -EINVAL above it, and switch all six
   arrays to kvmalloc() (Christian).
 - v1: https://lore.kernel.org/all/20261103085002.3100723-1-fei.yu@intel.com/

About the limit: INT_MAX / sizeof(struct syncobj_wait_entry) is about 33M
handles on 64-bit. It is the largest count for which every allocation stays
below the kvmalloc() INT_MAX size limit, so it does not add a new policy
number. Today the real limit is much lower: a wait on more than ~64K
handles already fails with -ENOMEM (plus the warning), because the wait
entries are a kmalloc() allocation larger than 4 MiB. If you prefer a lower,
fixed limit (e.g. SZ_1M) or GFP_KERNEL_ACCOUNT for these arrays, I can
change it.

Testing on v7.4-rc1 (x86_64, KASAN, virtio-gpu in QEMU):
 - syzbot C reproducer: base warns in ___kmalloc_large_node() (size
   0x100000920), patched is clean, ioctl returns -EINVAL.
 - wait / timeline_wait / timeline_signal / reset / signal on 200000
   signaled syncobjs: base fails wait and timeline_wait with -ENOMEM and
   the same warning; patched all succeed.
 - count == DRM_SYNCOBJ_MAX_HANDLES gets past the check (-EFAULT from the
   short user buffer), count == DRM_SYNCOBJ_MAX_HANDLES + 1 returns -EINVAL
   for wait, reset and timeline_signal.
 - kmemleak clean, checkpatch --strict clean, W=1 clean,
   DRM KUnit 667/667 passed.
 - IGT syncobj_basic, syncobj_wait, syncobj_timeline on virtio-gpu:
   202/202 subtests pass, same as base.

 drivers/gpu/drm/drm_syncobj.c | 40 ++++++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index f1d4da1685457..c01cf164a4f9e 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -220,6 +220,13 @@ struct syncobj_wait_entry {
 	u64    point;
 };
 
+/*
+ * Upper limit for the number of handles passed to a single ioctl. The
+ * largest per-handle allocation is the wait entry array, keep it below the
+ * INT_MAX size limit of kvmalloc().
+ */
+#define DRM_SYNCOBJ_MAX_HANDLES	(INT_MAX / sizeof(struct syncobj_wait_entry))
+
 static void syncobj_wait_syncobj_func(struct drm_syncobj *syncobj,
 				      struct syncobj_wait_entry *wait);
 
@@ -1051,7 +1058,7 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
 		lockdep_assert_none_held_once();
 	}
 
-	points = kmalloc_array(count, sizeof(*points), GFP_KERNEL);
+	points = kvmalloc_array(count, sizeof(*points), GFP_KERNEL);
 	if (points == NULL)
 		return -ENOMEM;
 
@@ -1064,7 +1071,7 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
 		goto err_free_points;
 	}
 
-	entries = kzalloc_objs(*entries, count);
+	entries = kvzalloc_objs(*entries, count);
 	if (!entries) {
 		timeout = -ENOMEM;
 		goto err_free_points;
@@ -1185,10 +1192,10 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
 						  &entries[i].fence_cb);
 		dma_fence_put(entries[i].fence);
 	}
-	kfree(entries);
+	kvfree(entries);
 
 err_free_points:
-	kfree(points);
+	kvfree(points);
 
 	return timeout;
 }
@@ -1238,7 +1245,10 @@ static int drm_syncobj_array_find(struct drm_file *file_private,
 	struct drm_syncobj **syncobjs;
 	int ret;
 
-	handles = kmalloc_array(count_handles, sizeof(*handles), GFP_KERNEL);
+	if (count_handles > DRM_SYNCOBJ_MAX_HANDLES)
+		return -EINVAL;
+
+	handles = kvmalloc_array(count_handles, sizeof(*handles), GFP_KERNEL);
 	if (handles == NULL)
 		return -ENOMEM;
 
@@ -1248,7 +1258,7 @@ static int drm_syncobj_array_find(struct drm_file *file_private,
 		goto err_free_handles;
 	}
 
-	syncobjs = kmalloc_objs(*syncobjs, count_handles);
+	syncobjs = kvmalloc_objs(*syncobjs, count_handles);
 	if (syncobjs == NULL) {
 		ret = -ENOMEM;
 		goto err_free_handles;
@@ -1262,16 +1272,16 @@ static int drm_syncobj_array_find(struct drm_file *file_private,
 		}
 	}
 
-	kfree(handles);
+	kvfree(handles);
 	*syncobjs_out = syncobjs;
 	return 0;
 
 err_put_syncobjs:
 	while (i-- > 0)
 		drm_syncobj_put(syncobjs[i]);
-	kfree(syncobjs);
+	kvfree(syncobjs);
 err_free_handles:
-	kfree(handles);
+	kvfree(handles);
 
 	return ret;
 }
@@ -1283,7 +1293,7 @@ static void drm_syncobj_array_free(struct drm_syncobj **syncobjs,
 
 	for (i = 0; i < count; i++)
 		drm_syncobj_put(syncobjs[i]);
-	kfree(syncobjs);
+	kvfree(syncobjs);
 }
 
 int
@@ -1572,8 +1582,8 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
 	if (ret < 0)
 		return ret;
 
-	points = kmalloc_array(args->count_handles, sizeof(*points),
-			       GFP_KERNEL);
+	points = kvmalloc_array(args->count_handles, sizeof(*points),
+				GFP_KERNEL);
 	if (!points) {
 		ret = -ENOMEM;
 		goto out;
@@ -1586,7 +1596,7 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
 		goto err_points;
 	}
 
-	chains = kmalloc_objs(*chains, args->count_handles);
+	chains = kvmalloc_objs(*chains, args->count_handles);
 	if (!chains) {
 		ret = -ENOMEM;
 		goto err_points;
@@ -1609,9 +1619,9 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
 		dma_fence_put(fence);
 	}
 err_chains:
-	kfree(chains);
+	kvfree(chains);
 err_points:
-	kfree(points);
+	kvfree(points);
 out:
 	drm_syncobj_array_free(syncobjs, args->count_handles);
 

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

