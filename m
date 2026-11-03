Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691560;
	b=4rwvdjAOX4MP4ODm1ufHAlrX7RfAELOARrKALnzEo+1idR+gh4YMkDJhJaZ6Yc56R3BI
	 zT0KfmlG5CULLjaI4ELKCbjRym/A+wXzMGFRzoxU1qRhIbQUOUmbxcI9tdcnfhFRB/54s
	 v0mbWPuaJplzqxiizBGajsdmgqmu0OdFiQx11xonDH/guwRaobLx69MwpJ/dI7pgJTsK4
	 hHAGTiL3Ig6mtGB/j8LjJhwQIS65GLKDLO8uWwRscffQt/qFJAWm2Wa8bH+ORaVYWXOrc
	 51WGwlSMnicCfYJyzNMHAW8qHcpVO7b9LFJaLOA3qzcRXZKYoWNRrk+OvrEDkiLv3/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691560;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WpkE14Q4sQba37WFN2Ur4rSIpx78Tl3jKpBy9GMhz9Q=;
	b=Czwf26ZHAlJQUqPBOLicAS5lXKjTxThiuDiU5VmAZoVkql79qehgWVLCKEAbJkhfn9ei
	 a3EyUVBjfL+1XnJvyBGl5fn90pDVBwGIQh5bBue7A4KCUYp7I/anRknWmMwBU4Exn/qwC
	 c59E3BOkm4ZYKH8lhabucCat5mACsg9itPRU9Xc4/7HNsDDrNnX7VGKuiU0R31UouAfc+
	 ei3MIVy2QtJae9ssN3bdbnk7OW1zbMLn04pUPdklHDDbMoib5/W+HHNebKBiY9nRUXFKK
	 GAZkAi5Yn2sVQ5qH2UIZS48GrEYlsk13WkvoKPQE/WqR7eUoIkhJGPnJZ/3BOWD7Ahw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=g6uHF35M;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40B35606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 07:39:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40B35606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=g6uHF35M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=g6uHF35MtQcdhvWnEesB/72cx3T9iq9L2LNY5qN7PO1OjUp8wQVDH8xKraWisn2QkEfFClgYMWK/I
	 3LHBsF0nP4dKTE5UmlmKknN+534Kb/qGuPvqkdV0h4t2C0soQ/qrAoF5uaIghMQzqWgeJqaOnpEoGb
	 WN0Gk47m3jRpDM9I=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86ae98fa08db-31565;
	Tue, 03 Nov 2026 15:39:16 +0800 (CST)
X-RM-TRANSID:2ee86ae98fa08db-31565
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from Z04181454368174 (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee96ae98f9feae-efdf8;
	Tue, 03 Nov 2026 15:39:16 +0800 (CST)
X-RM-TRANSID:2ee96ae98f9feae-efdf8
From: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org
Cc: tglx@kernel.org,
	akpm@linux-foundation.org,
	ljs@kernel.org,
	vbabka@kernel.org,
	linux-kernel@vger.kernel.org,
	trivial@kernel.org,
	zhang jiao <zhangjiao2@cmss.chinamobile.com>
Subject: [PATCH] uio: uio_dmem_genirq: fix crash when releasing failed DMA allocations
Date: Tue,  3 Nov 2026 15:39:04 +0800
Message-ID: <20261103073904.1303-1-zhangjiao2@cmss.chinamobile.com>
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

In uio_dmem_genirq_open(), when dma_alloc_coherent() fails for a
dynamic memory region, uiomem->addr is set to DMEM_MAP_ERROR (~0).

In uio_dmem_genirq_release(), the condition to free DMA memory only
checks if uiomem->addr is non-zero. Since DMEM_MAP_ERROR is non-zero,
the driver attempts to call dma_free_coherent() with an invalid
virtual address (~0) and an uninitialized dma_addr, leading to a
kernel crash.

Add an explicit check against DMEM_MAP_ERROR before calling
dma_free_coherent() to skip regions where allocation had failed.

Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>
---
 drivers/uio/uio_dmem_genirq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/uio/uio_dmem_genirq.c b/drivers/uio/uio_dmem_genirq.c
index 41c18ec62a45..65ee0f3de326 100644
--- a/drivers/uio/uio_dmem_genirq.c
+++ b/drivers/uio/uio_dmem_genirq.c
@@ -87,7 +87,7 @@ static int uio_dmem_genirq_release(struct uio_info *info, struct inode *inode)
 	while (!priv->refcnt && uiomem < &priv->uioinfo->mem[MAX_UIO_MAPS]) {
 		if (!uiomem->size)
 			break;
-		if (uiomem->addr) {
+		if (uiomem->addr && uiomem->addr != DMEM_MAP_ERROR) {
 			dma_free_coherent(uiomem->dma_device, uiomem->size,
 					  (void *) (uintptr_t) uiomem->addr,
 					  uiomem->dma_addr);
-- 
2.33.0



