Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457DC36195D
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 04:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790396392; cv=none; b=ntw2Oh3ztsE8fqMs3qOBNyx+J295mQLiE0a38xPbweyLjQKHyNDEgI34vo9iXzPxSKhrdZsy2uKuZAmTkhU/L45iIPuAF6pYCTfyH5mERzMLE4rKQD6VMBJ2z9+oHXaoguBh0G4IQ6EJs2tp2Fj3mEOzeVEzcmJBwyGO0dQntbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790396392; c=relaxed/simple;
	bh=4Y6o1wBsF/eQEgPBi/+abCQE6Kdn5XxfWvwfQFGZyX8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ge+I77GAa3dhEMaxeHPxUIikVIY1TT1Vikkj0dHcCfRoap3iBnqfVVSdOdE4PtXyAuitkjx4EXo0ZF+wORHG4gN0zopOeaFhwQzjr6C6U91zFmn6okODpk0IylJbEuLmPYCXnENSqvqwcgEQjWIUm9z5CZ6Fn0ZRlu7gZpY7oqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=keoUxYD0; arc=none smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="keoUxYD0"
Received: by mail-qk2-f42.google.com with SMTP id d75a77b69052e-53320dc09f3so4160131cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 21:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790396390; x=1791001190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O714HpujpOiT7ZMzjlfSNzchhvC2uNBRKyYZGVRuelY=;
        b=keoUxYD0P0e00/4AUO8rWEggVmlBjWv7z8K3malOM20KRwQAczsKAB6VeuCmm/iNMH
         8fH86AU96YVB9cQtKIv8WGAUO1oWwOPkWmLJ90AX3mi7DVDVFl6Fwcm8gA38fbXWRnSR
         qPdeuAwgrBiy7/MuXlG6tYzwoge3W3cgf3Ey11zlj6mZ3SOPUCjqEP1rqmGkWQblPReH
         +1QC7zAe489oAiDf4FxzT/4ZCipTGdF6qPHLW8ZD3Lf71Ja1L8n0UnyTo4yMq7nuzBZZ
         /jFigN0Y+lXAGkb8Ec8azkOjYpa2bpxpa62GjIDr5xCh18cy85uj2ehYhiLemBXJns1x
         czAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790396390; x=1791001190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O714HpujpOiT7ZMzjlfSNzchhvC2uNBRKyYZGVRuelY=;
        b=Qh8/0mlJrD9Eat4vJT1/sAkkqTQhmbKeRoXb01l1915lVaBD8v/GaX2ZhfYpychkqA
         HHYyAKMdYmyRTLuq9tNsnXTiNCkZ2PH2kOfpgY1UFc0yFHu0qn3j557bK/lZTRjbbTvs
         LdE2nXwutAKPGwDy753k/kqbtmoR30Jd8049j0HBtpInSPaAlTQentMXeBMSBdX3OEeA
         tEE/Udtwp+okgX0s2X9aefC/LomaGusngtbQcoDsNQ0QaXIcP4WGm2aVgd+9YetwfdWs
         hRHcr0JlPKHfDGsGSvPTRHLIJhNb+1P9P2h9Vb9TiSWxNjIzs7+IAOlpL39k2jfUlFH6
         JiQw==
X-Forwarded-Encrypted: i=1; AKwUvBwRlXWn/EjvUkDVT4O5W+HHoKQqeOfvOnBW9adiJ+Hkud1iisj7By2DR8NXfJcg8g9Xf3vchbriiJyQBwU=@vger.kernel.org
X-Gm-Message-State: AFuF++kKtWuJUZ2wY+2npf1k7yhkMj1dsdmZO5OE/DEnPBwz6Toyjk71
	3G/fb3sI6irLuA3geFGGOi1ws1SDyRJIIUl9T5/9QXetWkdt+bMN77Uz
X-Gm-Gg: AYBFou1k6fpDSdOfFY+O7dp2T4fzmqrpM1VwWd7QRRbIKTeDZUebnhHbCzwM/NLQQ3o
	5OD/tASsJgPCnyNXBqiGUROxur6eglqrWfcMHgFfs3JKiYyWL+IDYQBl7Bq9RUTT670/pmZMYHe
	9kvmYn7wsc6Bi3N4DHU5EwSkzPYpf1h0e7fXJ0YGW27G6p4JzcYx+OWQmOausHUT8VlYdUtGdRj
	u6Se5fjleg1gZg/bWd0YQY3I3bYiULnlyWZRA/n5KUYGuWoikV3qGHuU5rHlvZOY3urugsTJajN
	iu0p2gl0QygnxGmeWNUaUQrJhwsigKSvAxParGwPGu43YJiNVJZQ9/bJXwXE5kktqTH4PRjSRAj
	gkw2bzIRboaHC+SWs1v8zs9HlypIunx7XAeSpwPN0OfGBzOiDsPskDMuldum8BM78olU51ui6K4
	Eh6HB8zB1ENsxV4I8TC0zZpj00yJ4wQSIhKSMvI25wZLhxMPz4qCVlNK+PjYAxTo2cWGlA7XquI
	J6HQmKnIsDbjooEeZaBow==
X-Received: by 2002:a05:622a:250c:b0:530:ea12:caad with SMTP id d75a77b69052e-5330b6bfaddmr71181341cf.50.1790396390127;
        Fri, 25 Sep 2026 21:19:50 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53322133f07sm9070031cf.6.2026.09.25.21.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 21:19:48 -0700 (PDT)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] remoteproc: virtio: Synchronize virtqueue teardown with rproc_vq_interrupt()
Date: Sat, 26 Sep 2026 00:19:31 -0400
Message-ID: <20260926041943.1124650-1-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rproc_vq_interrupt() looks up rvring->vq and passes it to
vring_interrupt() without synchronizing against __rproc_virtio_del_vqs(),
which clears rvring->vq and frees the virtqueue. rproc_stop() and
__rproc_detach() stop the subdevices, and so delete the virtqueues,
before the remote processor is stopped or detached, so the remote can
still signal a vring meanwhile. The interrupt path can then pass a NULL
or already freed virtqueue to vring_interrupt().

Protect rvring->vq with SRCU: rproc_vq_interrupt() uses the virtqueue
inside a read-side section, and __rproc_virtio_del_vqs() clears the
pointers and waits for readers before freeing the virtqueues. Plain RCU
is not usable because rproc_vq_interrupt() is also called from process
context, where vring callbacks may sleep.

Fixes: 7a186941626d ("remoteproc: remove the single rpmsg vdev limitation")
Cc: stable@vger.kernel.org
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
Changes in v2:
- Rework the fix: v1 only loaded rvring->vq once, which closes the NULL
  window but not the use-after-free once the virtqueue is freed after
  the load (Mathieu Poirier). Use SRCU so __rproc_virtio_del_vqs()
  waits for rproc_vq_interrupt() before freeing the virtqueues.
- Update the subject accordingly.

v1: https://lore.kernel.org/all/20260922190159.509836-1-oss.patchbox@gmail.com/

Compile-tested only (arm64 and x86_64 defconfig + REMOTEPROC/RPMSG_VIRTIO, 
W=1, sparse).

 drivers/remoteproc/remoteproc_virtio.c | 35 +++++++++++++++++++++-----
 include/linux/remoteproc.h             |  2 +-
 2 files changed, 30 insertions(+), 7 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index d5e9ff045a28a..cd8f3a8b4870a 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -16,6 +16,7 @@
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/remoteproc.h>
+#include <linux/srcu.h>
 #include <linux/virtio.h>
 #include <linux/virtio_config.h>
 #include <linux/virtio_ids.h>
@@ -26,6 +27,14 @@
 
 #include "remoteproc_internal.h"
 
+/*
+ * Protects rproc_vring->vq: rproc_vq_interrupt() uses the virtqueue inside a
+ * read-side section, and __rproc_virtio_del_vqs() waits for those sections to
+ * finish before freeing it. Sleepable RCU is used because vring callbacks may
+ * sleep when rproc_vq_interrupt() is called from process context.
+ */
+DEFINE_STATIC_SRCU(rproc_vq_srcu);
+
 static int copy_dma_range_map(struct device *to, struct device *from)
 {
 	const struct bus_dma_region *map = from->dma_range_map, *new_map, *r;
@@ -88,15 +97,24 @@ static bool rproc_virtio_notify(struct virtqueue *vq)
  */
 irqreturn_t rproc_vq_interrupt(struct rproc *rproc, int notifyid)
 {
+	irqreturn_t ret = IRQ_NONE;
 	struct rproc_vring *rvring;
+	struct virtqueue *vq;
+	int idx;
 
 	dev_dbg(&rproc->dev, "vq index %d is interrupted\n", notifyid);
 
 	rvring = idr_find(&rproc->notifyids, notifyid);
-	if (!rvring || !rvring->vq)
+	if (!rvring)
 		return IRQ_NONE;
 
-	return vring_interrupt(0, rvring->vq);
+	idx = srcu_read_lock(&rproc_vq_srcu);
+	vq = srcu_dereference(rvring->vq, &rproc_vq_srcu);
+	if (vq)
+		ret = vring_interrupt(0, vq);
+	srcu_read_unlock(&rproc_vq_srcu, idx);
+
+	return ret;
 }
 EXPORT_SYMBOL(rproc_vq_interrupt);
 
@@ -153,8 +171,8 @@ static struct virtqueue *rp_find_vq(struct virtio_device *vdev,
 
 	vq->num_max = num;
 
-	rvring->vq = vq;
 	vq->priv = rvring;
+	rcu_assign_pointer(rvring->vq, vq);
 
 	/* Update vring in resource table */
 	rsc = (void *)rproc->table_ptr + rvdev->rsc_offset;
@@ -168,11 +186,16 @@ static void __rproc_virtio_del_vqs(struct virtio_device *vdev)
 	struct virtqueue *vq, *n;
 	struct rproc_vring *rvring;
 
-	list_for_each_entry_safe(vq, n, &vdev->vqs, list) {
+	list_for_each_entry(vq, &vdev->vqs, list) {
 		rvring = vq->priv;
-		rvring->vq = NULL;
-		vring_del_virtqueue(vq);
+		RCU_INIT_POINTER(rvring->vq, NULL);
 	}
+
+	/* Wait for rproc_vq_interrupt() callers still using the virtqueues */
+	synchronize_srcu(&rproc_vq_srcu);
+
+	list_for_each_entry_safe(vq, n, &vdev->vqs, list)
+		vring_del_virtqueue(vq);
 }
 
 static void rproc_virtio_del_vqs(struct virtio_device *vdev)
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index a44368737b39a..919d19fe99198 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -340,7 +340,7 @@ struct rproc_vring {
 	u32 align;
 	int notifyid;
 	struct rproc_vdev *rvdev;
-	struct virtqueue *vq;
+	struct virtqueue __rcu *vq;
 };
 
 /**

base-commit: aa98230e410f0ed212b6788c46b1e4d49e0ff7ca
-- 
2.43.0

