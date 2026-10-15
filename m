Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666BA3EC691
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792036172; cv=none; b=L/zDWwVi+axpNIWyndAOCi7w0y4tVyVvy6BoVNfFCzMHM9rh/2XXAFmGc6SzUto1e7i8C0b7Mz8vqgT8wqWqk8ghWfd4cT/LGbA/z7s6IFpK+1weTnlN25FwSl1qcN4nPsLjvm3zqxY9HBmDqAkiUM/j+odchmzpXBv5O8jgF88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792036172; c=relaxed/simple;
	bh=9La12g5qlo3BW0g8udb9Zc50S7ZaicRK1fogOHwlSKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BpBwQOBTd7M6gf+kfYtnQkG6sidfIIkiHe3Qfdve9ytkHuZzxmsTAxI/2GfPNrhB3jmH5nBeP2UilSAlA0HY6WMtmtYSRRBIcUbvPFZ1mZbgoWGGu2N1Jq096mFjxXrn2EL0lg2ak9rv30VYI7qluR9HC8Mo0t5yzsoZeBYQsPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VORphHEV; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VORphHEV"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91b54d1e9cdso9908526d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792036163; x=1792640963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cgj8L8l43KRuqjoHn6Iq0rLDkoXVgfoxHPbyG5KPP/o=;
        b=VORphHEV+QpwlPXA6FoZOZaq/1CDsPF14RCoY1FI4XZS82Fa1SB4Z39Ef+oV3Pj72D
         JQeAAsOhnuZLTvXdn0iAC7RamawErxBDDh1Eho34W1t1O5F30W2GPxRuQ2/+VXHeLNaW
         /t4GNM0UozxQUwt9NPIksmMXB8P25pUdNZKg+jOanfmNaAUjy2zx+lbyykWyvK/Ul5aq
         xJFotLQsAjK3ZNtGYTcI/FOkuk4BivbL81oU5dBQ8/MRIlDTQlVBx/qzz7fYrFIUqnpt
         jOPwYDhXPolxwLcKP6b8XwCBFBUIwqjcRWvwsKNkA9zLWstSQC2qxXlWDDgpf+gxWBz0
         sv/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792036163; x=1792640963;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cgj8L8l43KRuqjoHn6Iq0rLDkoXVgfoxHPbyG5KPP/o=;
        b=qcdPNAR8aIakU+XuOa9llxLDbnLfHy/V1VFXG4RnjaSQBH4Ai+twxFvYTctjfIKiRn
         upIMl2jJGLfCcY8e0+h4+h2MGoqlJUCKG6sz1bLni2W3h8O7/pN8T5x3fibKIWncwzym
         zDbpBzMjvT6M7nwWVF+WFdFkhb6iEV0IBDX9mkbl1lVKzQPZMCplymL8b98rRKbzPLJO
         giC6AvbbfCHd2TyBTmDVwwogJMT15wDvbI4HrK9Bb/qQaDvclanJJXhCAAVp0mO70D2E
         qTiz2/zFIGnTHiJ6D5CrEvaZMvyQCPdIOhyM+b2gsJjFjQh+HRIUIUQdnZ085SrC2tcS
         H84Q==
X-Forwarded-Encrypted: i=1; AKwUvBzMpsVW9oreYguzZu2XXuf/wHpB3n33ay+QCtBLwB9mLe7rcTRm9HyA2dBHzmUfqyssZf3URJgqwAmE6mU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1mgu+1tifcVG6woWddTi+0P+s6YdLGqX0Zc/ofJ07oOoypeLw
	UX/77LAXm1azDf/qWHreaU7vTA6GpTC0r16hKO2xPhVUPb+2uQoqudg=
X-Gm-Gg: AYBFou3D2WQEP/l/DKiJbcltcyxizbnZIZfAIved0u1AQTAXv020oyzzZPdvjB179MS
	wagBrfZazHbDP7DxD6Ld6D70G29/7DQdvXqbfPlmMES7a5uHSH5QFqjNG8ZPg650vvhyvex1Iy6
	/dA8KHA4CJH8cVGo3YpPE78MVOoD7rn8Ok+WF/Wd1txA7Ug98KxPOEyphBy6oGMKCdbNJ1ttNky
	F1gFq6UfYaWnrbLQFc7k+X4bR3fj8jv2axeMRHx+lhgdZrswsT7LfCBzNB8nOeIdWRJeZKR39sK
	qu7wlf8FpSWibuRIiZ8coTW79IsaFq6SE283oDxSpJ/GKucavKdtWol9mJAMNLi8/Ta6xnIELUa
	dG+tmWTwuB9+LpHw2gL1PJKu6HUxuwWoiK5DYixd7QItA08lJPRxJyMNx8ex2W5+G1AdXLpHbDj
	NAysYToHKBPNQeSGsLTRVwe9lArn+X1S/ML8oRjxlNg99f1s3zIf+6IQ08/17fz+/aiQ77Wy7F5
	K0emjnYc74rvGgu7V4sHLJEIUsKyVKqNw5AHPa3VjoXEwLoZomG+Lmyt0kgdx4AO9shp4QqBBgp
	2LtNOLBpO6+NWrvLX9aCPZuPZsoYE5PMhTh0wGE=
X-Received: by 2002:a05:6214:20af:b0:917:a58b:3629 with SMTP id 6a1803df08f44-91b55561e5amr317123806d6.26.1792036163057;
        Wed, 14 Oct 2026 20:49:23 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b3864dsm70540626d6.14.2026.10.14.20.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 20:49:22 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	Vasileios Almpanis <vasilisalmpanis@gmail.com>
Subject: [PATCH 3/4] usb: gadget: pch_udc: track successful EP0 DMA mappings
Date: Wed, 14 Oct 2026 23:49:15 -0400
Message-ID: <20261015034916.2773248-4-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015034916.2773248-1-mhun512@gmail.com>
References: <20261015034916.2773248-1-mhun512@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DMA address zero is valid, and a failed dma_map_single() does not
create a mapping to unmap. Track successful mapping explicitly so
cleanup handles both cases correctly. Return -EIO on mapping failure
instead of returning the positive dma_mapping_error() result.

This issue was identified as part of our ongoing research while
reviewing kernel code.

Fixes: f646cf94520e ("USB device driver of Topcliff PCH")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Compile-tested only.

 drivers/usb/gadget/udc/pch_udc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/pch_udc.c b/drivers/usb/gadget/udc/pch_udc.c
index c360bc556cdc..38b9159e2461 100644
--- a/drivers/usb/gadget/udc/pch_udc.c
+++ b/drivers/usb/gadget/udc/pch_udc.c
@@ -328,6 +328,7 @@ struct pch_vbus_gpio_data {
  * @data_requests:	DMA pool for data requests
  * @stp_requests:	DMA pool for setup requests
  * @dma_addr:		DMA pool for received
+ * @dma_mapped:		EP0 receive buffer has a valid DMA mapping
  * @setup_data:		Received setup data
  * @base_addr:		for mapped device memory
  * @bar:		PCI BAR used for mapped device memory
@@ -351,6 +352,7 @@ struct pch_udc_dev {
 	struct dma_pool		*data_requests;
 	struct dma_pool		*stp_requests;
 	dma_addr_t			dma_addr;
+	bool				dma_mapped;
 	struct usb_ctrlrequest		setup_data;
 	void __iomem			*base_addr;
 	unsigned short			bar;
@@ -2887,7 +2889,10 @@ static int init_dma_pools(struct pch_udc_dev *dev)
 	dev->dma_addr = dma_map_single(&dev->pdev->dev, ep0out_buf,
 				       UDC_EP0OUT_BUFF_SIZE * 4,
 				       DMA_FROM_DEVICE);
-	return dma_mapping_error(&dev->pdev->dev, dev->dma_addr);
+	if (dma_mapping_error(&dev->pdev->dev, dev->dma_addr))
+		return -EIO;
+	dev->dma_mapped = true;
+	return 0;
 }
 
 static int pch_udc_start(struct usb_gadget *g,
@@ -2996,7 +3001,7 @@ static void pch_udc_cleanup(struct pch_udc_dev *dev)
 		dma_pool_destroy(dev->stp_requests);
 	}
 
-	if (dev->dma_addr)
+	if (dev->dma_mapped)
 		dma_unmap_single(&dev->pdev->dev, dev->dma_addr,
 				 UDC_EP0OUT_BUFF_SIZE * 4, DMA_FROM_DEVICE);
 }
