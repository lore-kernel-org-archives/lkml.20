Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7892D5A01
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789358623; cv=none; b=Zlxr3lrp8WFgpdVgt2Cfr+GNP6wdNvQwXuCgqMEQ8PbZtDMEPumsjyGocM8m1wbUFDRyFY0PMV6qve0O3Bcg7pJXsyBr3zLT381qhhdWDLFVes+ly1NehdQNgwPBtULH6GJb/LGUN2f6n7nIbszI8esVzTf/7qt5JWlk3iLz66Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789358623; c=relaxed/simple;
	bh=qqo7APMuYRmz40m72oBvQUrF3Is0BBdbdy3rNR4+DjA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tezizaFRu3ZlDzTxRUr0S8QG8wzzxEJxk4nxZcoeJou4LnqsBuisrZU5CXAY1AAkxZMiGNmuaIcnzIZd+7pJ9ppKKFSGSpAjclu0YOwWH6Zi44FHS/0Olpkf9DSEn9QVM7Ql8OSkHksbG6piClZjraoB2ZOu1lWhbtWWat5ASbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sbI/yAjw; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sbI/yAjw"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530e2f50d01so20861381cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789358619; x=1789963419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nLnzNTwl6cA2paC1JejIJZG6aTRG3ekKPHTOqpPPe4s=;
        b=sbI/yAjwGv7BFyWo9cKeU1EAiTrO4nFr7XST8Obx5ZBEjBzSjWELL/ra6HkwsqGFc1
         zZ5/iEGtPzYv7IsQl5VoBgCFzdn6wnMAm/3RhhVoj38ZLq5VZcSxse/MuPqcs3313Px2
         UF3yHQpORzBUYbIkoZPxm9aBfuUOLyeSqZtz9BVc6YCzA5w+7Zxnifn5mEZxKeJrt8LV
         QXYiQwgflEUqWqKZcmqS++6yoq6gl6sZ7zqdY7agl35AnK62LQ56NT+9QLmMkDNOZWFs
         8t+kCai7szrMHe3p6B2hMfc1gVQGsOdnI2mvKqiZZmRjNKqPX8CRLLW0hm3Iyyf/mqnE
         ZZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789358619; x=1789963419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nLnzNTwl6cA2paC1JejIJZG6aTRG3ekKPHTOqpPPe4s=;
        b=Ijg+TbLfa0bY5+Ok+LLTikhOYjHu3AnFke4EmS6++U1luBRbHpsB81Ov9MygkL7Eo2
         ucZ9S0dZZ3JmDcOCM7IMWC/cC4JTg4NFcTztvFkGtKSQRajrAMOcuOsYPvTEoFNX88qY
         dIqIp5vxFmM1HnSs2Q80FRbbptAIaLym+QcVB/9lWXY3ysox3BI9n2iYnUOAkGbzNUYA
         In9qabPL/YSOSgP2teRB85v42uPQcdmvQUrXS4/U9dGJfMp16VAJGL3VOiS1/rDEErU9
         lJ2XjZl4n2iSERCOoAZzzW3vBiE2eUwwN3ul8NKvR8QJQRvSU5DqOUoYme0THAWST723
         Dbvg==
X-Forwarded-Encrypted: i=1; AKwUvBy6C2AZjQVjzEoQXnaTCXmnNpalbS8Dz3w87YTBW56Ugn/QZnCK8H/PtbXI2GXa5RhHjr1c7S5cjJCXcBM=@vger.kernel.org
X-Gm-Message-State: AFuF++mD/v+Dl30VuISJ6LKb+KZJfuvzwLa7OQ8/TTAzTeJeq3IF/J0M
	v4hd33LRtFJYKOJEWERg2Z6jeNbZUs8cmzWIO6ko2oKJW4+owAKUKQ9T
X-Gm-Gg: AYBFou0DDpOUqGB/Q6C9P2banTeWKGndjf8hdG0b6LJ6Y5LoDvh9S/ONCr33z4Mz5gX
	IF47tiz4W6rlmZf/b4NAj6ZuQx8bqCH1dPJlIs5sevJqssFkfm0kRcVizG+xJc4Zx/19YvkH6nt
	vdZRT2unmtXX8EeaDzDWaadXdij5XBVteLD5GzwQUJW5nJvca83/nSzeaT2XpiurIygt8XId4HD
	p6k1RDEA0APdC2fod3DxxYwDykHGinD9EmCF8UkJrxIQknGlHWSrxOUm1Rw0vDSWOAHeauxGN61
	wIkHGNHaaejGCGSwsyI3YNo/ntkHUz+vFnVsTOK4DPSTWTRfp3WnsNC/9/7YbSJGlC/rHA4XgBI
	XiENUp1t9gVAYBySAzp9nIsR76yNi7dW3L3CPtNdKX57bA+eYyy8JcmKa1VExdBoTRmDBbxPR00
	y+VkIH4AZKn7tYAGl1PX830WfnWWnXwzt0jI4asmyYOzlCInl3ja+knPa3U4TFeAAJdZ6zz9RnT
	AWmm1GeP8YejTAUjnj175NsFMYpAymj
X-Received: by 2002:a05:622a:394:b0:530:b2e1:2f45 with SMTP id d75a77b69052e-5310d0c4294mr11756231cf.60.1789358619562;
        Sun, 13 Sep 2026 21:03:39 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca45b61dsm88435551cf.6.2026.09.13.21.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 21:03:39 -0700 (PDT)
From: Yuho Choi <oss.patchbox@gmail.com>
To: "Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
Cc: Srujana Challa <schalla@marvell.com>,
	Vamsi Attunuru <vattunuru@marvell.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v1] vdpa/octeon_ep: Fix race condition in device deletion
Date: Mon, 14 Sep 2026 00:03:32 -0400
Message-ID: <20260914040332.1892175-1-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When firmware delivers OCTEP_VDPA_DEV_DEL_EVENT, octep_event_work()
checks if mgmt_dev->status is OCTEP_VDPA_DEV_STATUS_ADDED, but does
not claim ownership before calling octep_vdpa_dev_del(). Meanwhile,
userspace management deletion via octep_vdpa_dev_del() unconditionally
calls _vdpa_unregister_device() and marks status as REMOVED.

If a queued hardware DEL event checks the ADDED state and the management
path subsequently deletes the same oct_vdpa, the worker proceeds to call
octep_vdpa_dev_del() on the already unregistered and freed device. This
results in _vdpa_unregister_device() being invoked twice on the same
object, triggering a use-after-free or double release.

Fix this race by:
1. Atomically claiming deletion ownership in octep_vdpa_dev_del() using
   atomic_cmpxchg() from ADDED to REMOVED, and returning early if the
   device was already claimed for deletion.
2. Clearing mgmt_dev->oct_vdpa upon unregistration and on dev_add
   failure so dangling pointers are not referenced.
3. Reading mgmt_dev->oct_vdpa safely in octep_event_work() before
   invoking octep_vdpa_dev_del().
4. Canceling event work and ensuring child devices are unregistered
   before marking the management device UNINIT in octep_vdpa_remove_vf().

Fixes: a5786561649a ("vdpa/octeon_ep: Add vDPA device event handling for firmware notifications")
Cc: stable@vger.kernel.org
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
 drivers/vdpa/octeon_ep/octep_vdpa_main.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/vdpa/octeon_ep/octep_vdpa_main.c b/drivers/vdpa/octeon_ep/octep_vdpa_main.c
index 85a3d35ea1e4..e29647bcf196 100644
--- a/drivers/vdpa/octeon_ep/octep_vdpa_main.c
+++ b/drivers/vdpa/octeon_ep/octep_vdpa_main.c
@@ -523,14 +523,16 @@ static void octep_vdpa_remove_vf(struct pci_dev *pdev)
 	int status;
 
 	oct_hw = &mgmt_dev->oct_hw;
-	status = atomic_read(&mgmt_dev->status);
-	atomic_set(&mgmt_dev->status, OCTEP_VDPA_DEV_STATUS_UNINIT);
-
 	cancel_work_sync(&mgmt_dev->setup_task);
+	cancel_work_sync(&mgmt_dev->event_wk.work);
+
+	status = atomic_read(&mgmt_dev->status);
 	if ((status == OCTEP_VDPA_DEV_STATUS_READY) || (status == OCTEP_VDPA_DEV_STATUS_ADDED) ||
 	    (status == OCTEP_VDPA_DEV_STATUS_REMOVED))
 		vdpa_mgmtdev_unregister(&mgmt_dev->mdev);
 
+	atomic_set(&mgmt_dev->status, OCTEP_VDPA_DEV_STATUS_UNINIT);
+
 	if (oct_hw->base[OCTEP_HW_CAPS_BAR])
 		octep_iounmap_region(pdev, oct_hw->base, OCTEP_HW_CAPS_BAR);
 
@@ -612,6 +614,7 @@ static int octep_vdpa_dev_add(struct vdpa_mgmt_dev *mdev, const char *name,
 	return 0;
 
 vdpa_dev_put:
+	mgmt_dev->oct_vdpa = NULL;
 	put_device(&oct_vdpa->vdpa.dev);
 	return ret;
 }
@@ -619,8 +622,13 @@ static int octep_vdpa_dev_add(struct vdpa_mgmt_dev *mdev, const char *name,
 static void octep_vdpa_dev_del(struct vdpa_mgmt_dev *mdev, struct vdpa_device *vdpa_dev)
 {
 	struct octep_vdpa_mgmt_dev *mgmt_dev = container_of(mdev, struct octep_vdpa_mgmt_dev, mdev);
+
+	if (atomic_cmpxchg(&mgmt_dev->status, OCTEP_VDPA_DEV_STATUS_ADDED,
+			   OCTEP_VDPA_DEV_STATUS_REMOVED) != OCTEP_VDPA_DEV_STATUS_ADDED)
+		return;
+
 	_vdpa_unregister_device(vdpa_dev);
-	atomic_set(&mgmt_dev->status, OCTEP_VDPA_DEV_STATUS_REMOVED);
+	mgmt_dev->oct_vdpa = NULL;
 }
 
 static const struct vdpa_mgmtdev_ops octep_vdpa_mgmt_dev_ops = {
@@ -653,6 +661,7 @@ static void octep_event_work(struct work_struct *work)
 	u8 event = readb(addr + OCTEP_VF_EVENT_REG(0));
 	struct vdpa_dev_set_config config = {0};
 	char name[OCTEP_VDPA_NAME_BUFSIZE];
+	struct octep_vdpa *oct_vdpa;
 	int ret = 0;
 
 	switch (event) {
@@ -663,8 +672,9 @@ static void octep_event_work(struct work_struct *work)
 		}
 		break;
 	case OCTEP_VDPA_DEV_DEL_EVENT:
-		if (atomic_read(&mgmt_dev->status) == OCTEP_VDPA_DEV_STATUS_ADDED)
-			octep_vdpa_dev_del(&mgmt_dev->mdev, &mgmt_dev->oct_vdpa->vdpa);
+		oct_vdpa = READ_ONCE(mgmt_dev->oct_vdpa);
+		if (atomic_read(&mgmt_dev->status) == OCTEP_VDPA_DEV_STATUS_ADDED && oct_vdpa)
+			octep_vdpa_dev_del(&mgmt_dev->mdev, &oct_vdpa->vdpa);
 		break;
 	default:
 		break;
-- 
2.43.0

