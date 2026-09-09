Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F29488205
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 10:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788948983; cv=none; b=Y3C2q7+EpB0fztEJg5AjjNY5nMtFZuBSlX9VlS7bDBfKlhfHoF8Hx3dFUxNEMxutrWiu5GuQzROcuwRrLR3hTGghsjq5Ua5jQFXV+JocvZAIv0yWN7CNWJGjVfWNpNHm+IvF7+POF2Zy98EUnbvrIYLA9uJNI+n2dRdLb8Zlw0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788948983; c=relaxed/simple;
	bh=ts4ZfRfU5KIs8UOnNvnduy7S8V7kGQ8dyuu1V4a1j2c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=fvQqbb0OF5d86+hXv9uX6cCHa781QD5uU0rWS58LiZraP5SwE6A/Bt3fXVNtRkRUOkHJ/45EYbjfn6+JWPNu/uKqmSpEnIG8f8xY0/pwKzOo5AgNWoDqHHCC/Ba5x74uqhGBTf+XkxYNJKDSE5nEsapOupxHOvipYcJT0grsyig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=q6DIARwo; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="q6DIARwo"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260909101611euoutp0162afebe412221b3b6fa7c0287d5c87a5~Tn5x3k-Cb2236222362euoutp01O
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 10:16:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260909101611euoutp0162afebe412221b3b6fa7c0287d5c87a5~Tn5x3k-Cb2236222362euoutp01O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1788948971;
	bh=LGz0mAO/Rs5US72whCiR/JF88NXIVvHWv+a8QAaScfw=;
	h=From:To:Cc:Subject:Date:References:From;
	b=q6DIARwoFfgiNlnynGM3cbcW0S434TF9s3kCKfB6Q5ByLQ8YURSHfRWanS63oCwYV
	 FjxJID0jYVBby1fMoSqjvxx2LqzbgSuTapisRjo6/+lbpgV5tuxJiKwHzjSAwPnUdf
	 azftai2xgg6iZ8buka55ILKQZOCyqAgGXqGrTRGM=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260909101610eucas1p112489c6964a217b1c15fd19a7fc55645~Tn5xSkgZk2468724687eucas1p13;
	Wed,  9 Sep 2026 10:16:10 +0000 (GMT)
Received: from AMDC4653.digital.local (unknown [106.120.51.32]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260909101610eusmtip248bbb2ac03e9b72cbab004bdf7c6b6aa~Tn5xBhjcA1849518495eusmtip2z;
	Wed,  9 Sep 2026 10:16:10 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy
	<robin.murphy@arm.com>, Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Subject: [PATCH] MAINTAINERS: Add files to the DMA MAPPING HELPERS entry
Date: Wed,  9 Sep 2026 12:15:52 +0200
Message-ID: <20260909101554.2106545-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260909101610eucas1p112489c6964a217b1c15fd19a7fc55645
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260909101610eucas1p112489c6964a217b1c15fd19a7fc55645
X-EPHeader: CA
X-CMS-RootMailID: 20260909101610eucas1p112489c6964a217b1c15fd19a7fc55645
References: <CGME20260909101610eucas1p112489c6964a217b1c15fd19a7fc55645@eucas1p1.samsung.com>

Add DMA trace events file to the DMA MAPPING HELPERS entry to get proper
notification for further changes there.

Reported-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Closes: https://lore.kernel.org/all/20260907120156.603600-1-donggeunyoo.kernel@gmail.com/
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c..e2f922cf5996 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7728,6 +7728,7 @@ F:	include/linux/dma-direct.h
 F:	include/linux/dma-map-ops.h
 F:	include/linux/dma-mapping.h
 F:	include/linux/swiotlb.h
+F:	include/trace/events/dma.h
 F:	kernel/dma/
 
 DMA MAPPING & SCATTERLIST API [RUST]
-- 
2.43.0

