Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793759471;
	b=1CqO3wn/DangYGvhlFZBcm5AnDO/pZoDP4zIIT9JK+quKzFLAUtauFYONVy4n3f0l28T
	 Vmd8b773W5YVW3176UW8IQXmQUrgwyNERh/Oq8hxLHvGkxQo36IkJpq9OM3PPCvqu7UoP
	 tUhDL9nOfr65gJaX0UZBz05JGXdTr6v0j0HtgFo0rgSp11+A0xKYqh2Z7ESd6Mg/lhc8T
	 8vqPL49j3IJSWCUgAngF0uf6+cOIbMk74Z5D6GO4jLUs3RkGVDOqCiIPJjMnPznUk8WUe
	 QAuBPYu1i3eHsQGy5S4cJp4Wd31erL1IDCETMTGCyRmmnGCvYall1qwW7LBZQD3ZHMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793759471;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type:Content-Transfer-Encoding;
	bh=lvmb6Bzik+x2SYN/C+TFAdbPa8LlOTkg6meLTFLA5zA=;
	b=rODQuQ47En1XXHI8zCf12ERaLK0WLBKM1U5oRfawic+Ij3j74RprygpC22GtcKK55FcN
	 a8dC5b1Orx0D/BXQqC9nJhOc4iNMgznGx7yWGs6vnJSXkWo4JJ/4YOxb9QDOQECt/ttDv
	 cKSzIycAqgsg3lYvCisMUn0MfE7DtEecx9d0yDYe1AA1tXVkehThuE73CnIOBhiGZTFEO
	 4M6DTjyDyG54oEyRQQuZ0H2tjzDWkBO/f3/ZRmXSrHamF50is2OECLOYYOFAqJTh/qXl9
	 uZjpYMMxCynKVstJ3f/FbO2ebmPKXkcq/TyyvX8XUNJ+HqBae16QpbuARHSCdEHnmNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057C5606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 02:31:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 057C5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4cbf700ddccso210253b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 18:31:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793759470; x=1794364270;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lvmb6Bzik+x2SYN/C+TFAdbPa8LlOTkg6meLTFLA5zA=;
        b=OfP3GU43Ja8orTDG2BAR6Bvpmyy3VH5lDjdx2r+SzSoFe3P2ZMtk/9zIxXkKF3CzmP
         3FHvYRy0vKUaaYMgmxbmXdsFNu12PFyZTNyiUPAN29KsXmBCHFqyYTFGjwyY23H19sPK
         w/eyNBxyuoUbfUTwOSn5d/JdWBvLdLlqGEJ0UEwyJCxbiHsrW9tECtUwFmoMp+a/FjoV
         z6B+GDs65dAWLyps0935uRVa80ETBw/AzWQcQc3MNH9u4QjRzLiqsr9vn8Ui989xofjo
         Mq6EWYT4HL4vuCxfpL0aYHZbu1c4PUcED/t6lqmUNAIYLyOyYKdPzjL+iZ6oKoJlTCVu
         +Rfw==
X-Gm-Message-State: APuU4Z8nCfhwym4wcHPhFuAuE2sdhaZHzdVXVFioLhvv6eAU7dB61Ozy
	tDRgPXSZLPdm7JxFTlKiI5MguW3AG6DLHW1VdOTjTW4JhN9CXaEh5ePCGrVzu6TkKP5a3R8OQq2
	NlUf9jC5e3863nacVYBlCEpJ/42FhUKgA9MoDCe3Ov8fxPioRdMX3zXQTDCQ=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:16a6:b0:539:df4e:2d20 with SMTP id
 5614622812f47-5640dd92404mr9584351b6e.27.1793759470094; Tue, 03 Nov 2026
 18:31:10 -0800 (PST)
Date: Tue, 03 Nov 2026 18:31:10 -0800
In-Reply-To: <000000000000f6bf6d0604af3b95@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aea98ee.0b257d1c.25e26f.0003.GAE@google.com>
Subject: Forwarded: [PATCH v2] drm/syncobj: Limit the number of handles and
 use kvmalloc for user-sized arrays
From: syzbot <syzbot+95416f957d84e858b377@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [PATCH v2] drm/syncobj: Limit the number of handles and use kvmall=
oc for user-sized arrays
Author: fei.yu@intel.com

From: Fei Yu <fei.yu@intel.com>

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git=
 master

The syncobj ioctls allocate several temporary arrays whose size is taken
directly from the u32 count_handles provided by userspace:

 - handles and syncobjs in drm_syncobj_array_find()
 - points and entries in drm_syncobj_array_wait_timeout()
 - points and chains in drm_syncobj_timeline_signal_ioctl()

These are kmalloc() allocations, so a count above KMALLOC_MAX_SIZE /
element size trips the WARN_ON_ONCE_GFP() in ___kmalloc_large_node():

  WARNING: mm/slub.c:5459 at ___kmalloc_large_node+0x10c/0x170 mm/slub.c:54=
59
  Call Trace:
   __kmalloc_large_node_noprof+0x18/0x90 mm/slub.c:5502
   __do_kmalloc_node mm/slub.c:5519 [inline]
   __kmalloc_noprof+0x3f6/0x710 mm/slub.c:5556
   _kmalloc_noprof include/linux/slab.h:995 [inline]
   _kmalloc_array_noprof include/linux/slab.h:1211 [inline]
   drm_syncobj_array_find+0x3a/0x440 drivers/gpu/drm/drm_syncobj.c:1241
   drm_syncobj_timeline_wait_ioctl+0x18a/0x640 drivers/gpu/drm/drm_syncobj.=
c:1356
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
Closes: https://syzkaller.appspot.com/bug?extid=3D95416f957d84e858b377
Suggested-by: Christian K=C3=B6nig <christian.koenig@amd.com>
Signed-off-by: Fei Yu <fei.yu@intel.com>
---
v2:
 - Drop __GFP_NOWARN (Christian).
 - Add DRM_SYNCOBJ_MAX_HANDLES, return -EINVAL above it, and switch all six
   arrays to kvmalloc() (Christian).
 - v1: https://lore.kernel.org/all/20261103085002.3100723-1-fei.yu@intel.co=
m/

About the limit: INT_MAX / sizeof(struct syncobj_wait_entry) is about 33M
handles on 64-bit. It is the largest count for which every allocation stays
below the kvmalloc() INT_MAX size limit, so it does not add a new policy
number. Today the real limit is much lower: a wait on more than ~64K
handles already fails with -ENOMEM (plus the warning), because the wait
entries are a kmalloc() allocation larger than 4 MiB. If you prefer a lower=
,
fixed limit (e.g. SZ_1M) or GFP_KERNEL_ACCOUNT for these arrays, I can
change it.

Testing on v7.4-rc1 (x86_64, KASAN, virtio-gpu in QEMU):
 - syzbot C reproducer: base warns in ___kmalloc_large_node() (size
   0x100000920), patched is clean, ioctl returns -EINVAL.
 - wait / timeline_wait / timeline_signal / reset / signal on 200000
   signaled syncobjs: base fails wait and timeline_wait with -ENOMEM and
   the same warning; patched all succeed.
 - count =3D=3D DRM_SYNCOBJ_MAX_HANDLES gets past the check (-EFAULT from t=
he
   short user buffer), count =3D=3D DRM_SYNCOBJ_MAX_HANDLES + 1 returns -EI=
NVAL
   for wait, reset and timeline_signal.
 - kmemleak clean, checkpatch --strict clean, W=3D1 clean,
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
+ * largest per-handle allocation is the wait entry array, keep it below th=
e
+ * INT_MAX size limit of kvmalloc().
+ */
+#define DRM_SYNCOBJ_MAX_HANDLES	(INT_MAX / sizeof(struct syncobj_wait_entr=
y))
+
 static void syncobj_wait_syncobj_func(struct drm_syncobj *syncobj,
 				      struct syncobj_wait_entry *wait);

@@ -1051,7 +1058,7 @@ static signed long drm_syncobj_array_wait_timeout(str=
uct drm_syncobj **syncobjs,
 		lockdep_assert_none_held_once();
 	}

-	points =3D kmalloc_array(count, sizeof(*points), GFP_KERNEL);
+	points =3D kvmalloc_array(count, sizeof(*points), GFP_KERNEL);
 	if (points =3D=3D NULL)
 		return -ENOMEM;

@@ -1064,7 +1071,7 @@ static signed long drm_syncobj_array_wait_timeout(str=
uct drm_syncobj **syncobjs,
 		goto err_free_points;
 	}

-	entries =3D kzalloc_objs(*entries, count);
+	entries =3D kvzalloc_objs(*entries, count);
 	if (!entries) {
 		timeout =3D -ENOMEM;
 		goto err_free_points;
@@ -1185,10 +1192,10 @@ static signed long drm_syncobj_array_wait_timeout(s=
truct drm_syncobj **syncobjs,
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
@@ -1238,7 +1245,10 @@ static int drm_syncobj_array_find(struct drm_file *f=
ile_private,
 	struct drm_syncobj **syncobjs;
 	int ret;

-	handles =3D kmalloc_array(count_handles, sizeof(*handles), GFP_KERNEL);
+	if (count_handles > DRM_SYNCOBJ_MAX_HANDLES)
+		return -EINVAL;
+
+	handles =3D kvmalloc_array(count_handles, sizeof(*handles), GFP_KERNEL);
 	if (handles =3D=3D NULL)
 		return -ENOMEM;

@@ -1248,7 +1258,7 @@ static int drm_syncobj_array_find(struct drm_file *fi=
le_private,
 		goto err_free_handles;
 	}

-	syncobjs =3D kmalloc_objs(*syncobjs, count_handles);
+	syncobjs =3D kvmalloc_objs(*syncobjs, count_handles);
 	if (syncobjs =3D=3D NULL) {
 		ret =3D -ENOMEM;
 		goto err_free_handles;
@@ -1262,16 +1272,16 @@ static int drm_syncobj_array_find(struct drm_file *=
file_private,
 		}
 	}

-	kfree(handles);
+	kvfree(handles);
 	*syncobjs_out =3D syncobjs;
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
@@ -1283,7 +1293,7 @@ static void drm_syncobj_array_free(struct drm_syncobj=
 **syncobjs,

 	for (i =3D 0; i < count; i++)
 		drm_syncobj_put(syncobjs[i]);
-	kfree(syncobjs);
+	kvfree(syncobjs);
 }

 int
@@ -1572,8 +1582,8 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *=
dev, void *data,
 	if (ret < 0)
 		return ret;

-	points =3D kmalloc_array(args->count_handles, sizeof(*points),
-			       GFP_KERNEL);
+	points =3D kvmalloc_array(args->count_handles, sizeof(*points),
+				GFP_KERNEL);
 	if (!points) {
 		ret =3D -ENOMEM;
 		goto out;
@@ -1586,7 +1596,7 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *=
dev, void *data,
 		goto err_points;
 	}

-	chains =3D kmalloc_objs(*chains, args->count_handles);
+	chains =3D kvmalloc_objs(*chains, args->count_handles);
 	if (!chains) {
 		ret =3D -ENOMEM;
 		goto err_points;
@@ -1609,9 +1619,9 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *=
dev, void *data,
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
