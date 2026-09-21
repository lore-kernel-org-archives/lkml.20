Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6009B381B10
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789985565; cv=none; b=dHIvRXQw1oUVZ0vdfm/Jc12CMjBgNOUWhTrtYDtOkKGbK96fT2z95tq94GQozXGVI49nPv9WiuoKVsaGM9dOnDj7UPlRA4nO4vxTsZCMSvQUkO4J0KDPk5YsPnalkWEDbXV9aBG1ZUWEJ6yj3UTlH0nNtJJPyd+DhfYOalAhIQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789985565; c=relaxed/simple;
	bh=KKwhb/oSPtsp1yRz2ZuESm5esBcN5/jst4ue59zuig4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=Fihu5qdJSOOw7IwwshBoa7J8nvJeGHPt9Aq5UxWqo8oXr+LiztYhPC8gCkKAZdo0dtXHcSfJcXX2xCBiQl56+2uKusAloVLOtp2aFB3DCIl4te4WJ7WGyxpRtPGSWW6xvirzlBGBhDsSN64VPouExNFTJH7hnI39CecUonYC26U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=P/4DeJ6/; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="P/4DeJ6/"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20260921101240epoutp02397ed3f0ed29a1c1acfdc2c2ad0f315f~XTmIhiprJ1305313053epoutp02E
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:12:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20260921101240epoutp02397ed3f0ed29a1c1acfdc2c2ad0f315f~XTmIhiprJ1305313053epoutp02E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789985560;
	bh=H6EckjlZbTDuDbr8yAjtNMKEFEFvX00BNEUZIPb4CHo=;
	h=From:To:Cc:Subject:Date:References:From;
	b=P/4DeJ6/e0/RjQVsRJ0kC/ReA4NwL273z7HLSEO6wmDztjTGpKhs8+NW9k2BvaRXS
	 PI5XVb01d6OPU57or+aZXGt8wP9eQL4xB5nsEeYET9dwpe8GVlx+KbYQ/bDejMfCMl
	 phikOd3M2fyhImrCEAbxJjk3mR8DdsG5b63oAvbg=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20260921101239epcas2p174aa964020ddd17ed666d3db3b656bde~XTmIFdRIH2148721487epcas2p1Z;
	Mon, 21 Sep 2026 10:12:39 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.38.200]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4hpJvC3NrVz6B9m8; Mon, 21 Sep
	2026 10:12:39 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20260921101238epcas2p39bec3831b3cbaaa71de0ece7b7f7329d~XTmHUpWgl0503405034epcas2p3B;
	Mon, 21 Sep 2026 10:12:38 +0000 (GMT)
Received: from KORCO090182.samsungds.net (unknown [12.80.211.164]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260921101238epsmtip13d954d6aed26e77e2ba84064f8c60b7f~XTmHQTWSs2430824308epsmtip1L;
	Mon, 21 Sep 2026 10:12:38 +0000 (GMT)
From: Janghyuck Kim <janghyuck.kim@samsung.com>
To: sumit.semwal@linaro.org, christian.koenig@amd.com, phasta@kernel.org
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, Janghyuck Kim
	<janghyuck.kim@samsung.com>
Subject: [PATCH] dma-buf: don't WARN_ON_ONCE() on a failing
 dmabuf->ops->vmap()
Date: Mon, 21 Sep 2026 19:09:46 +0900
Message-Id: <20260921100946.353521-1-janghyuck.kim@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260921101238epcas2p39bec3831b3cbaaa71de0ece7b7f7329d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260921101238epcas2p39bec3831b3cbaaa71de0ece7b7f7329d
References: <CGME20260921101238epcas2p39bec3831b3cbaaa71de0ece7b7f7329d@epcas2p3.samsung.com>

dma_buf_vmap() escalates any non-zero return from dmabuf->ops->vmap()
into a WARN_ON_ONCE(). But a failing vmap() is not, by itself,
evidence of a violated invariant or a driver bug -- it's an ordinary
runtime failure of a fallible operation, no different from any other
allocation-shaped kernel API that can return an error. The dma-buf
core has no visibility into what a given exporter's vmap()
implementation considers a normal failure versus an internal bug;
that distinction, if it matters at all, belongs to the exporter, not
to this generic passthrough.

-ENOMEM is a concrete, easily reproduced example of this. Page
allocation on the vmap()/vmalloc() path can fail purely because the
calling task has a fatal signal pending: should_reclaim_retry() in
mm/page_alloc.c intentionally gives up reclaim and returns false
once fatal_signal_pending(current) is true, so that a task that is
already being killed (e.g. by a userspace low-memory killer) isn't
stuck retrying reclaim on its way out. The resulting -ENOMEM from
dmabuf->ops->vmap() is expected behaviour in that case, not a bug in
the exporter -- and it is far from the only way ops->vmap() can
legitimately fail (an exporter may just as well refuse to vmap a
buffer for other, unrelated reasons of its own).

This is exactly the kind of condition Documentation/process/coding-style.rst
warns against for WARN*():

    WARN*() must not be used for a condition that is expected to
    trigger easily, for example, by user space actions.

A failing vmap() is reachable purely by driving the system into low
memory and then issuing an ioctl that happens to map a dma-buf -- no
driver misbehaviour required. Turning that into a WARN_ON_ONCE(),
and on panic_on_warn kernels into an outright panic, doesn't help
debugging; it just turns an otherwise-recoverable error into a fatal
one.

Drop the WARN_ON_ONCE() and simply propagate the error, consistent
with how other allocation-failure paths in the kernel are handled.
The dma_buf_vmap_unlocked()/dma_buf_vmap() contract is unchanged:
both still return the negative errno from dmabuf->ops->vmap() to the
caller. Only the WARN_ON_ONCE() splat (and, transitively, the panic
on panic_on_warn kernels) is removed.

Signed-off-by: Janghyuck Kim <janghyuck.kim@samsung.com>
---
 drivers/dma-buf/dma-buf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 36cdc342627e..252495761a21 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1670,7 +1670,7 @@ int dma_buf_vmap(struct dma_buf *dmabuf, struct iosys_map *map)
 	BUG_ON(iosys_map_is_set(&dmabuf->vmap_ptr));
 
 	ret = dmabuf->ops->vmap(dmabuf, &ptr);
-	if (WARN_ON_ONCE(ret))
+	if (ret)
 		return ret;
 
 	dmabuf->vmap_ptr = ptr;
-- 
2.34.1

