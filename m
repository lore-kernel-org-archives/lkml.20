Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695798;
	b=1ZyhFJ8xLlLTcvE6w3Vq+v63jNgXG61nfix+go1mFV9pYafnSgrNj8RwEVtrudvAMx02
	 e3gsUWHpAZP9CEPVKylj3RyTzJNJGySTDGJHN4UCzjUx0mNMGC3rp7FDJDAvWbeScIpQH
	 gU6LsAzrlBBNNRsk32uQrMvWluWi5qI5U5jobqyrPXi05APqXilein96njlTHmE3bQlgi
	 2gmCQ3d9nVD82yPArSz8YJc289BmaxKGseCoQwfgoEKNovBtWsuDGzRLtwYKRp23VEhqS
	 x4XGBTd5DZtRH7xuZ1egWXuMZ+A31Pf1NdeMQRkJqBm4ygDVap5gjSMaVa2i2i5whJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695798;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=FnnKqXzbCWAbNR7ep3HlDFqIRyplHOyYkvtsHl9jSMs=;
	b=gWwDVOKPuWjt6W8nTEnsk9FFK30ODRyarBJf50tM3uBx1bElSb6p+fTfgNAxCjPSaPFo
	 07gDB9r8j1CylVHHnLPNBxCEhBI2WWkaIum27/66ez9mA37Bs4QlQZ3Qc3KAN0w+HRjQb
	 OhOV54kmtptah4Zz6VzFjciU5wL1e62KoMlCUTJsIjnA8sC/V+VMaEmpRXuC0gNWP6Qkg
	 whH5QXXFKU3MSxnbP7fPerXeZzLNSBlJWVJrj51A8SmF2Vrl55n1P1MO8GjXkvsrLYhBn
	 yDF9EsFG5EoqAj5tVQ8LZrb13gIzcDaKkWRYeLy5poLOA1zLvjb1/OXO5Px+1u+aN8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Sfz0FCzo;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0167606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:49:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0167606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Sfz0FCzo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793695796; x=1825231796;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XOUlFfeLLSixvT9Wn+UA3hCGLjCu5uBQYP7kE7xuOzs=;
  b=Sfz0FCzoIT7ANPz20iAjiXTg/MUrDBa157wTmBfFG4NUZF0P9B+Fb8rS
   Mhh6284hVwWcOTQmaLlAJsdNXRY7kOfOgsbudF8zlotg/hmc1D1NuXwiY
   q8OSTJPBmtxkp5z9kdm0xXmOqzV7nxiW72obfRHx8L1OmxG2S3LpXJit1
   czpfXK1Aj8oz6sn7BZY24iwV4lwNhbwTIqQtGxHxXYd7WOJqbk2OUdCA8
   WhAqbByDut8FTcTNy2FOQtjvILYPqznY8FtDMy1yQJAzxv/WyMYHTdG0+
   U/5Ii2MFDneqMYCO3PaTUonL9v31SQM/JX+Ag0/gZjI1hyXFlZJx4KYne
   Q==;
X-CSE-ConnectionGUID: S9NX9buoR++Hm35+FzVRmA==
X-CSE-MsgGUID: noJq/gsxQmOe122F4T1WVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2318082"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2318082"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 00:49:55 -0800
X-CSE-ConnectionGUID: 0PR2XKbHTDmA9cDYgn6gmg==
X-CSE-MsgGUID: H9H4gAGPRgSS1mROKaCLhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6699480"
Received: from yufei-inspiron-3910.sh.intel.com ([10.239.92.97])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 00:49:53 -0800
From: "Yu, Fei" <fei.yu@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org,
	syzbot+95416f957d84e858b377@syzkaller.appspotmail.com,
	Madhur Kumar <madhurkumar004@gmail.com>,
	Fei Yu <fei.yu@intel.com>
Subject: [PATCH] drm/syncobj: Silence allocation warnings for user-sized arrays
Date: Tue,  3 Nov 2026 16:50:02 +0800
Message-ID: <20261103085002.3100723-1-fei.yu@intel.com>
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
Content-Transfer-Encoding: 8bit

From: Fei Yu <fei.yu@intel.com>

The syncobj wait, timeline wait and timeline signal ioctls allocate
several temporary arrays whose size is taken directly from the u32
count_handles provided by userspace:

 - handles and syncobjs in drm_syncobj_array_find()
 - points and entries in drm_syncobj_array_wait_timeout()
 - points and chains in drm_syncobj_timeline_signal_ioctl()

A large enough count makes these allocations exceed KMALLOC_MAX_SIZE
and trips the WARN_ON_ONCE_GFP() in ___kmalloc_large_node():

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

The allocation failure itself is already handled by returning -ENOMEM,
so the only problem is a warning that userspace can trigger at will.

Pass __GFP_NOWARN to all allocations whose size is derived from
count_handles. Guarding only drm_syncobj_array_find() is not enough:
the wait entries are much larger than a handle, so a count that passes
drm_syncobj_array_find() can still trigger the same warning in
drm_syncobj_array_wait_timeout().

No functional change and no new limit on the uAPI.

Fixes: 3e6fb72d6cef ("drm/syncobj: Add a syncobj_array_find helper")
Reported-by: syzbot+95416f957d84e858b377@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=95416f957d84e858b377
Signed-off-by: Fei Yu <fei.yu@intel.com>
---
Testing: on v7.4-rc1 (x86_64, KASAN) the syzbot C reproducer triggers the
___kmalloc_large_node() warning with the same size (0x100000920); with
this patch it runs clean. DRM KUnit: 667/667 passed.

Notes:
 - An earlier attempt [1] added a size check returning -ERANGE, but only
   for the handles array, so the syncobjs array and the much larger wait
   entries could still warn, and it changed the ioctl's error codes.
   This version keeps the existing -ENOMEM behaviour for all six
   allocations.
 - kvmalloc() was not used on purpose: it would let userspace trigger
   multi-GB vmalloc() attempts. A hard upper limit on count_handles
   would be a uAPI change; happy to do that instead if preferred.

[1] https://lore.kernel.org/all/20251227160830.34291-1-madhurkumar004@gmail.com/

 drivers/gpu/drm/drm_syncobj.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index f1d4da168..10aede1c0 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -1051,7 +1051,8 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
 		lockdep_assert_none_held_once();
 	}
 
-	points = kmalloc_array(count, sizeof(*points), GFP_KERNEL);
+	points = kmalloc_array(count, sizeof(*points),
+			       GFP_KERNEL | __GFP_NOWARN);
 	if (points == NULL)
 		return -ENOMEM;
 
@@ -1064,7 +1065,7 @@ static signed long drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
 		goto err_free_points;
 	}
 
-	entries = kzalloc_objs(*entries, count);
+	entries = kzalloc_objs(*entries, count, GFP_KERNEL | __GFP_NOWARN);
 	if (!entries) {
 		timeout = -ENOMEM;
 		goto err_free_points;
@@ -1238,7 +1239,8 @@ static int drm_syncobj_array_find(struct drm_file *file_private,
 	struct drm_syncobj **syncobjs;
 	int ret;
 
-	handles = kmalloc_array(count_handles, sizeof(*handles), GFP_KERNEL);
+	handles = kmalloc_array(count_handles, sizeof(*handles),
+				GFP_KERNEL | __GFP_NOWARN);
 	if (handles == NULL)
 		return -ENOMEM;
 
@@ -1248,7 +1250,8 @@ static int drm_syncobj_array_find(struct drm_file *file_private,
 		goto err_free_handles;
 	}
 
-	syncobjs = kmalloc_objs(*syncobjs, count_handles);
+	syncobjs = kmalloc_objs(*syncobjs, count_handles,
+				GFP_KERNEL | __GFP_NOWARN);
 	if (syncobjs == NULL) {
 		ret = -ENOMEM;
 		goto err_free_handles;
@@ -1573,7 +1576,7 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
 		return ret;
 
 	points = kmalloc_array(args->count_handles, sizeof(*points),
-			       GFP_KERNEL);
+			       GFP_KERNEL | __GFP_NOWARN);
 	if (!points) {
 		ret = -ENOMEM;
 		goto out;
@@ -1586,7 +1589,8 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
 		goto err_points;
 	}
 
-	chains = kmalloc_objs(*chains, args->count_handles);
+	chains = kmalloc_objs(*chains, args->count_handles,
+			      GFP_KERNEL | __GFP_NOWARN);
 	if (!chains) {
 		ret = -ENOMEM;
 		goto err_points;

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

