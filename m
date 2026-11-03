Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793694202;
	b=xclJCSuk4yLSR/KhMKb1K+83+/0WM2x3Xms4yOek+4j9wZ914vpOPCS+1FWkFMdw/NtM
	 fd+ZdYXA3uKSTseoKFuBots35aBwD0qBzyHpzE6lJ4MCbVHbJ0vjPb/o33Rh1pGKgp3L4
	 tos1mbqsRAE9CfoICWcxieiOKkjXCcNDV20/36VRGblS27Y8cXQ1rJGErQ2KZVhYt8QcN
	 kQLr4iPDo+ToSmrfcb/KN/YWE8/lkb+VSqA+2N99bvbG6y3htq0w/6CC2mAz9edyrl+LR
	 AdL+nqLtmqBfGEOLuHy9H2/k+O8rI9CoLXrVtulrPdiJlUG2z9U03VwkguSbCkfn5Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793694202;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=EtUju2R+r7AYp51wmtEoA2Wws7SJmf1SkZiA/dd2hvY=;
	b=SRJaz6wrEqmNHLp5uMynt99qcBhqs3DBWxpTWNpqm/oCVPF7LdE9wJu9YbzjStF5ElLJ
	 vo3ujmPrr1FqABGjhWh1l5hWtFUxOUCz+O4rkqgCcsBXNN+Ys/Jx2w4OURth+8N0ICdPW
	 AJV6q2QW1tP/Tl/kdHRwayvQek6pdMxx37gqEH4ivJD8W0iAkWA2mD8aQHBBPsJElROCv
	 vorILgQHxiMlvrnmM7zzq7lwvtrcbDngRwGRdfxgHQv3hah8NmjdTeUNQpv3noy6TtiVP
	 sQON8jAIMT8EfrFwx4eQimwK5TAGCFxzVT8086LwWosg3LKSGjqqKC1bCyZPWJsS46Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.71
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9F2606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:23:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F9F2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-83c2311eb1dso6576802a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:23:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793694201; x=1794299001;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EtUju2R+r7AYp51wmtEoA2Wws7SJmf1SkZiA/dd2hvY=;
        b=LGPDQ2az5/xXkH/d0vAaLm2gkHUYUwe4QC93TZue8hUbSDTB63c/ysN4TZPGPYxvio
         vwv2jyc2Fbdja3EDdjsIMGh/H2W7TFIdkiqJscfUYEPH1iVwmwbBUyfP9dPS9PZwbTU0
         bT/AmgX6tzEsU0C1YQ8+jkRJ1WszyWsWfAdQdWry1WCFBSx3jqOAPo8i0Zi0Yf6AE2CO
         LocGVULa+CBK9ydprQIqFLdikUucpQH0U5Z71MHXOmhoqkA6057cJlbOOmYpWfm20odS
         dDNx2GG6RgbI6z+Y4PwlRvfLu+W37jg3MKRR4VprWyIsit10g3xkQuxJPPyC382qCoWo
         Gwvw==
X-Gm-Message-State: APuU4Z+JINidTow4vqA7MkSs/43lh3yQm0WDCjUrz6sztdgKRe9oGSfR
	ChVoFHh+MYYpKwsDMkapT5za6Fo/o634fs6SVLofyklTUktk4mlYqyCWVV50722aSCt+Fg/p5w0
	gN2KQCE3PYznMr1U8hQX+4YzwavcqVSa4e/an+y0ZpapL5LisDWrTXr/37hU=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6820:618:b0:70b:afa3:fb1f with SMTP id
 006d021491bc7-714f1fd614fmr6655199eaf.5.1793694201562; Tue, 03 Nov 2026
 00:23:21 -0800 (PST)
Date: Tue, 03 Nov 2026 00:23:21 -0800
In-Reply-To: <000000000000f6bf6d0604af3b95@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae999f9.0c24fc0a.13a0ab.0035.GAE@google.com>
Subject: Forwarded: [PATCH] drm/syncobj: Silence allocation warnings for
 user-sized arrays
From: syzbot <syzbot+95416f957d84e858b377@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH] drm/syncobj: Silence allocation warnings for user-sized arrays
Author: fei.yu@intel.com

From: Fei Yu <fei.yu@intel.com>

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

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

