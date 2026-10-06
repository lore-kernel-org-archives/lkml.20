Received: from cvsmtppost20.nm.naver.com (cvsmtppost20.nm.naver.com [114.111.35.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E75E3D9525
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 10:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791282091; cv=none; b=FTJ6s/sEFUxgRMULoNuCIQ7jXnANaA9L+m/Arr5R3hswTyFDqQMj/ti3dDmOO049B8cwO88RAxw2XGOZXJBNK3Gx0hLvMbA/j3WeCKqeFweusEOlW7x9HDp35xsawi+XyRPay0UFESVV9Nnxw+N3qYS+Mv/CIxUh/Jgjs+dZXdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791282091; c=relaxed/simple;
	bh=QqulCsapT2Fj83sxvE+DQ+IFCCV3oHDYRXWdlknJDXM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Iwuz/nO202rD+8ck/f7Aww6TLSNL7BhMKeVttbtqcvi90pUgc0cl1f4qp44oZM4duW2UOKQvc+FiN4xW2x+tPYWcO+IGpuowjYRqYPFOe/XsPsr3y+xRiZ7pvKexF7zdX9Qv0IwXH1qU/h8R1EjNZzVsCJH4dPq7JxAWkSx6Ny8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=NZtZY2bG; arc=none smtp.client-ip=114.111.35.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="NZtZY2bG"
Received: from cvsendbo002.nm ([10.112.20.42])
  by cvsmtppost20.nm.naver.com with ESMTP id yUuaxYN3Q9e6BcSTwm4CVg
  for <linux-kernel@vger.kernel.org>;
  Tue, 06 Oct 2026 10:21:21 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1791282081; bh=QqulCsapT2Fj83sxvE+DQ+IFCCV3oHDYRXWdlknJDXM=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=NZtZY2bGJESDcPACv4Klb5akAQJeAaikUNp5jak0dFfbWw6G2J/Eugrn6O1/AV7D4
	 MP9o3ZPLVMPo8Y2Bh2sOzsUOoki0FYyEqxCwI4A85zEL4FtMtKrdadR4XDQy7s4T5n
	 k+UHXO/hMQ+bUM3VgR50+wGB90JR9gf1P5J8eiE4rhKMgy3sz29virUJ0RqdCouXws
	 yYW+GqDsL7hy7rwjAJeKjJghhrlqM8T2IgNoXUYxmcpNd1DqA1rWvx0jzxykHNSYFC
	 flIklu9PJkcBRqabYa6zTKCFjASu3oDKXl946crAh2dRfxQJWEVMUdyZi65JHqF9GU
	 RIM5o0lNgBjjg==
X-Session-ID: ye+qwul7SeqKFDwcQXNVyg
X-Works-Send-Opt: OPewpzGdjHmdKHFOMr39Ko3YKBmrjAudFqM9KqMqFxIYkEljxBmwjAg=
X-Works-Smtp-Source: /dYdKoulFqJZ+HmmaAMl+6E=
Received: from localhost.localdomain ([115.136.205.4])
  by cvnsmtp003.nm.naver.com with ESMTP id ye+qwul7SeqKFDwcQXNVyg
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Tue, 06 Oct 2026 10:21:20 -0000
From: sungbyeongchan <tjdqudcks0424@naver.com>
To: "Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	sungbyeongchan <tjdqudcks0424@naver.com>
Subject: [PATCH v2] virtio_ring: use shadow flags when detaching split descriptors
Date: Tue,  6 Oct 2026 19:21:12 +0900
Message-ID: <20261006102112.847280-1-tjdqudcks0424@naver.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes: 72b5e8958738 ("virtio-ring: store DMA metadata in desc_extra for split virtqueue")
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Assisted-by: LLM
Signed-off-by: sungbyeongchan <tjdqudcks0424@naver.com>
---
Changes in v2:
- Drop the commit message paragraphs as requested by Michael S. Tsirkin.
- Add Michael's Acked-by.

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

