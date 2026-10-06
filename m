Received: from cvsmtppost24.nm.naver.com (cvsmtppost24.nm.naver.com [114.111.35.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEBA3A8736
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 10:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.238
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791281058; cv=none; b=l7UsdUlyc+auRugvZz5CIJVA6WRRaewkBB93w1vTgGAbpvHi8Iz3DOkjNlgfs4fbxpIr6qnkxQ++vTcz4l817CkLzK0sHHZqys/q6TSVpcMzDCorJM/BLlNwJDwiPgzpn9LAHoySwFs0kOQ2IQVDkY26FDBDj4Y8U5o9w16dLPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791281058; c=relaxed/simple;
	bh=A5gmZs9fn+OR63whkDMhyWYhbnYiQITSri73Al5C7DE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i6fOYY0UHbYgjiKN1+nDkL1335JEkbemqSYdZsSlZ55KBENNl3xE+k944vwwxWNpOLvpT8uSbBHmXxP7znqCT14tYov5/hrfBvubSKL3tXzO1V8W/ROuxY7ALFFGMnEYoPAtcjdKcFoBfk07YXLX+f28+6CBwEDe4fOUsYq1MF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=dd41eCJ2; arc=none smtp.client-ip=114.111.35.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="dd41eCJ2"
Received: from cvsendbo031.nm ([10.112.22.37])
  by cvsmtppost24.nm.naver.com with ESMTP id BBxZ4GaJQTGzOgQUd+h7Vg
  for <linux-kernel@vger.kernel.org>;
  Tue, 06 Oct 2026 10:04:08 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1791281048; bh=A5gmZs9fn+OR63whkDMhyWYhbnYiQITSri73Al5C7DE=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=dd41eCJ273JLNsWewqdS2XZZkZlmNF/NhJhQ3jVMoJMWaiE8hwO25CG3pDSgdERGI
	 Uxwpqj5YPCa7efC+sQGDURmVg3QoQQO0YPzYBNIwG4cDziCogzXw+gA8klU3vzvCQA
	 SU8KOVn9jUmfsr9gbjK0KEix6qQX2lYh55yTGf3deIM2+Gf3aCSIDVROJuvMKIPJOa
	 gXviurwcwwcc+QTJy+1uTroZy/Zrc/tCWC9yxaESrDpRxlK/bJV78NqOyVqb7mn524
	 Jl+Gdazf3oczmlGst+4Vcd5IJH2zn4R5rgCzJZ0gBhRELF/APgK344cVgEIwyMhD2u
	 uFqtGafeJMy/Q==
X-Session-ID: udVjA97BTYytlt5JFbfepg
X-Works-Send-Opt: OPewpzGdjHmdKHFOMr39Ko3YKBmrjAudFqM9KqMqFxIYkEljxBmwjAg=
X-Works-Smtp-Source: /9bdKoulFqJZ+HmXFAM/+6E=
Received: from localhost.localdomain ([115.136.205.4])
  by cvnsmtp008.nm.naver.com with ESMTP id udVjA97BTYytlt5JFbfepg
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Tue, 06 Oct 2026 10:04:07 -0000
From: sungbyeongchan <tjdqudcks0424@naver.com>
To: "Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	sungbyeongchan <tjdqudcks0424@naver.com>
Subject: [PATCH] virtio_ring: use shadow flags when detaching split descriptors
Date: Tue,  6 Oct 2026 19:04:00 +0900
Message-ID: <20261006100400.842345-1-tjdqudcks0424@naver.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split virtqueues save descriptor flags and next indexes in desc_extra
before publishing descriptors to the device. The detach path uses the
shadow next index, but decides whether to continue by rereading the NEXT
flag from the shared descriptor.

A device can change the flag after publication and make
detach_buf_split_in_order() detach an adjacent active descriptor. This
overcounts num_free and may put a descriptor on the free list twice.

Use the shadow flags for the continuation decision as well. This keeps
all detach metadata in the same driver-owned snapshot and avoids an
unnecessary shared-ring read.

A VDUSE/virtio-vdpa test which changed NEXT after publication made six
valid completions return seven descriptors, with one descriptor ID
duplicated on refill. With this change, the same test returned six
unique descriptors, while the unmodified control remained unchanged.

Fixes: 72b5e8958738 ("virtio-ring: store DMA metadata in desc_extra for split virtqueue")
Assisted-by: LLM
Signed-off-by: sungbyeongchan <tjdqudcks0424@naver.com>
---
 drivers/virtio/virtio_ring.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index db678f5a80e03..b4cb433df1dec 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -905,7 +905,6 @@ static unsigned detach_buf_split_in_order(struct vring_virtqueue *vq,
 {
 	struct vring_desc_extra *extra;
 	unsigned int i;
-	__virtio16 nextflag = cpu_to_virtio16(vq->vq.vdev, VRING_DESC_F_NEXT);
 
 	/* Clear data ptr. */
 	vq->split.desc_state[head].data = NULL;
@@ -915,7 +914,7 @@ static unsigned detach_buf_split_in_order(struct vring_virtqueue *vq,
 	/* Put back on free list: unmap first-level descriptors and find end */
 	i = head;
 
-	while (vq->split.vring.desc[i].flags & nextflag) {
+	while (extra[i].flags & VRING_DESC_F_NEXT) {
 		i = vring_unmap_one_split(vq, &extra[i]);
 		vq->vq.num_free++;
 	}
-- 
2.43.0

