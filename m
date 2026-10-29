Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793258722;
	b=lpfGxu4Mt1HfW6fkl8S38RIt7SIn3KJ4zKkC9eY+zykK8lYK31Hk8zeAzJDjbrqB7axL
	 iqiUdLhG7B1wZS11ntqqFueVoAv0m4DxyV8zWn3AFAoU5zbaxI4xp/ik0LKh8SrDbtuid
	 FtnHSTZR4bPHwKbDwUCJhCKOJBxrUxsrvjC9JQ93Q2F1JjegDiugqEqsnX3bWTAfORljL
	 EqreICbyDHohmW013yxvasj/HPxjqbXZZ2PD9IKNu+LLOmVLH4Uq9QjM1RICB6igjlDja
	 iZzZSEjWGAjBAd/NHutwx4B6CEr0qgwUqTQ/tKYL6P54vt85OBaSHVtB1/vNGkO0NYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793258722;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xNUN+utYqDHfZafRgwtlnx10jDhmyVmzJ84YHVaSRLc=;
	b=J6bhkjuU5VnHhSAsC8hSjXpOG6tZJ/dmhEh1t59diSWQlGyAmHU7FIxffDjxd5mjHbp2
	 OPA7UT4fHT17LHwOHgRwc/DT6/ERQBGOWXOl7qd2B8FC85laLN8jyMQyeKLzBtf+N8fiH
	 RsnaB58Rq2jf2TicAA/pNtxpyWwY8SwVASxNejiy5AuZ65VKqSte1AJJ6H8vO8UydfcI4
	 hyPLL0ekahbKaIpaHtnD2E1pB1fyuQLqSay0eL5ZmdQak6ptfyvNaMslcUK2iLyGuC8Ta
	 tB0kQrywBl+88OoHPO6MDVKxjTqmuglTDFlJ0royeQVIhx9z56JEYVwaXtNav8CLrHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=KFJuOTqr;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91E6A606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:25:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91E6A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=KFJuOTqr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=KFJuOTqr/wjEehlJbrrGSwU0UbXsfFpWkKsyYMzuXeOqtXwq6zbbDJ+1QEAGGRMGu9tAZDkWnOzXA
	 dAbNxItYz6qpjaMyjDJKu2V2Fy2XbWSN4B92bQo9lVSBILeZHZMCNYpfuosPGUWT+xdX6Mj29wjiSP
	 8ZZp1yMOOydhfCCM=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee26ae2f4de60b-a3b33;
	Thu, 29 Oct 2026 15:25:18 +0800 (CST)
X-RM-TRANSID:2ee26ae2f4de60b-a3b33
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from Z04181454368174 (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee46ae2f4db9d5-5eade;
	Thu, 29 Oct 2026 15:25:18 +0800 (CST)
X-RM-TRANSID:2ee46ae2f4db9d5-5eade
From: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
To: eperezma@redhat.com
Cc: mst@redhat.com,
	jasowangio@gmail.com,
	xuanzhuo@linux.alibaba.com,
	graf@amazon.com,
	linux-kernel@vger.kernel.org,
	trivial@kernel.org,
	zhang jiao <zhangjiao2@cmss.chinamobile.com>
Subject: [PATCH] virtio_ring: Initialize id field in packed indirect descriptors
Date: Thu, 29 Oct 2026 15:25:10 +0800
Message-ID: <20261029072511.851-1-zhangjiao2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
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

From: zhang jiao <zhangjiao2@cmss.chinamobile.com>

The virtqueue_add_indirect_packed() function fills an indirect
descriptor table with addr, len, and flags for each entry, but does
not initialize the id field of struct vring_packed_desc. The table is
allocated via kmalloc() (not kzalloc) and then DMA-mapped with
DMA_TO_DEVICE, making the uninitialized 2-byte id field of each
descriptor readable by the device.

This leaks kernel heap memory to the device for every packed indirect
descriptor entry. A malicious or compromised device could extract heap
contents by reading the id fields from the DMA-mapped indirect
descriptor tables. This affects all virtio devices that use packed
virtqueues with indirect descriptors, which is the common configuration
for modern virtio devices.

Fix this by explicitly initializing desc[i].id to zero in the
descriptor filling loop. The id field is unused in indirect descriptor
table entries per the virtio specification (only the head descriptor in
the main ring uses id for buffer identification), so setting it to zero
is semantically correct.

This matches the split ring path where all four fields of struct
vring_desc (addr, len, flags, next) are explicitly written in
virtqueue_add_desc_split().

Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>
---
 drivers/virtio/virtio_ring.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index 5c169fbb418a..42883b01fab0 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -1571,6 +1571,11 @@ static int virtqueue_add_indirect_packed(struct vring_virtqueue *vq,
 						0 : VRING_DESC_F_WRITE);
 			desc[i].addr = cpu_to_le64(addr);
 			desc[i].len = cpu_to_le32(len);
+			/* The id field is unused in indirect descriptors but
+			 * must be initialized to prevent leaking kernel heap
+			 * memory to the device through the DMA-mapped table.
+			 */
+			desc[i].id = 0;
 
 			if (unlikely(vq->use_map_api)) {
 				extra[i].addr = premapped ? DMA_MAPPING_ERROR : addr;
-- 
2.33.0



