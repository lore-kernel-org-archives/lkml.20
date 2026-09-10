Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744FA4718E0
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 21:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789076618; cv=none; b=p6RqaM8fBceWFsGc19v62WoQkTtDtgGI9FH2sZWZSM/qJ48tM1kBOpBOd5wPujJ9xTeLxUgiha0ZOYQYrsBLvEfhvY00N3BMWpIzjW5qLMYb9Lwy3kYcPHwS97zUmuBym8c8wlF/1Us+x4/rc7d2qkH8MXl9oPa2LukVdXDWU4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789076618; c=relaxed/simple;
	bh=hF1OOna5+siVkl98K1uKmIL7QgQiQ9Fmb5h9aoxyeXI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i2HLbtPHSoNXJ7TZQ/dAcNpfLOIUdakdpQQaiXaufgYbmi01K+0gqDKky+uZdslWBfhd0ToNBSEeDCLNnNc3ikP3fnZQCXWQCJjhzD96vtpDXhmenClu/ASSUCyKpYfX9CNIkpMCcVzhnsi0yDXkma5WcWM5B3l9WFfxZepnCuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VMB9ylAm; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VMB9ylAm"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d6f9e2f681so2009185ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789076617; x=1789681417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gOaQ+0e1S7d/dfvzPb/zhOODMpmgq3yDQAQBbqXoi4c=;
        b=VMB9ylAmBRMA+pK/2Sw32tKgVJ13j2eHYJXyZ8ZeJZhuSYH3akn2oNSmYR10YiEzul
         wy7qK3rSRgP4og3sB+lNW/cMT1R3xPKKOnqGIeYk4jMrHzpSSd9ql52m/USA8yHD9nuA
         X+jaZrYcTEzHq6pbNoH1Pa2+N/lKzjhd4oJp3dZKBMwSXxEZQz++sPTKlmM//o2E59PT
         toqcrEuipNgQlGviglj8HJsNST9t+tWpBYaOdqkVqiCsT/6DqqoQeLbiQxaDsz4FZEIv
         DdVTQT/UpmXpZw2JJ45eKCSMbR+B/Lzqx+VdQW3jRwh/M8TlnrPzdbPlTv1joiCEXB42
         7nqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789076617; x=1789681417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gOaQ+0e1S7d/dfvzPb/zhOODMpmgq3yDQAQBbqXoi4c=;
        b=BI8uuz//TnARNGBAiGjwcqvjJg9TaErCB5AVR/Gz8e1Dc3XEVCjcqVUczmjeR5CMTd
         Q4jZTv77fqI3VXDd2vesDVp46ZrKDzEG/3bzdF8tFH7eKR9DffXWoMTicX8FDc4L6ayc
         gTD6wiBnlHFg/WNTd8mnu4DQCLEMUGhdv1qVRpYwmRd46bmSHsRt4Yz9J8SfuT6w0uA1
         z+qI49zfGNS7URYBfmrvNv8/dv4azzOfHWkdgrze8VbdxYc4P4mDhoZfu87zdzdbyEL+
         vPqkl3xEQIIGywsFN7JV4SA7+Yljx/kxousTrhNyNrl28oIL+qpxc4YW8eLf7RALMkT1
         rzVA==
X-Forwarded-Encrypted: i=1; AKwUvBwI+7viXjJatJRwtusstAE1cKbF3VeXRqL6dAdOJhvMAhMq7l7ZikTbkHeaBBK9iMil61bLiNlMJUY8zoQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nQtG8YxIAmoPUWAyRbN1rzXnZ9t2sh4UtmNhmx4xTWadT5qi36
	olb5ofstagNzkbZs9dYLRsbrl85gXxGlrSK05YLl3RtriQYYRNmeDgTR
X-Gm-Gg: AYBFou08PI/sTrVXsZaVOoikXCvwTyvsmW/zCnwC4o5r2ejKj3197MImBuIYrYW1ohE
	un4cyw/p5ceJ0yku+q3NiiGhO81dSBg9Yw0BLRxv3kTjvJ0nkS7hmQS9ptpWGN5XGJ7MVFOO15o
	2QNeq+fg7ApSPllEy5VVDHUHszKGyM4OI9zKImPtBbdM+ALRjHrx8NUsNE+ewWwVTNG3gvXGM2h
	YQgR7rEBbPEr/b7LgeFPHtO5Bmg0y/DeHnF0Mgy/qdYH8gDpKLpM0yMWQdnEAilI8C4LFxEX2V2
	6ILQzJA/GKMGFP+4gFsA3Q9uSmVmmdB63QmCRIO9TG/lsJZSJIFcbaJnNkMCJAlNoQu8SirfFfi
	mBBNKUoxyC2bcSRBnK7A8mmlNzNTMBsvpRKJ+PzwH/eBXWvpdpfG1wNP3KuyTP2lfQXkXWM0BAl
	i6DTHxwM8rvF9IcBhgbz/TQTx8V9ITdr6KsZBfuqY33KiJ1NImryqw9K+lRleYdeE0tcczcmntK
	jbUtU9SzEAsnkrhYIGRni18oM0HbP+twHrX2z01gTAik0NjPPT++b/Hxn0AmgLJJ9WwNA5Is6CG
	n3+pN+BMFPiulU0sVD1G+SYEwTO4To7wP3p7sqnHvaZm27DG
X-Received: by 2002:a17:903:26d0:b0:2d6:f988:398f with SMTP id d9443c01a7336-2dd2a33ff1emr25239445ad.12.1789076616696;
        Thu, 10 Sep 2026 14:43:36 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cca26cdsm2021275ad.7.2026.09.10.14.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 14:43:35 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Anatolij Gustschin <agust@denx.de>,
	Yuri Tikhonov <yur@emcraft.com>,
	Dan Williams <djbw@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dmaengine: ppc4xx: check dma_map_page() errors in probe
Date: Thu, 10 Sep 2026 14:43:34 -0700
Message-ID: <20260910214334.86689-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In ppc440spe_adma_probe() the helper pages are mapped with
dma_map_page() but the returned DMA address is never validated with
dma_mapping_error(). On 440SPe the mapping goes through the
SWIOTLB/direct map, which can fail under memory pressure or with an
IOMMU, returning DMA_MAPPING_ERROR. The bogus address would then be
programmed into the CDBs used by the async validation and
mult/sum_product operations, causing the engine to DMA to or from
arbitrary memory and corrupt data.

Fail the probe when either mapping fails, freeing the pages and
unmapping the first page if the second mapping fails.

Fixes: 12458ea06efd7 ("ppc440spe-adma: adds updated ppc440spe adma driver")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/ppc4xx/adma.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/dma/ppc4xx/adma.c b/drivers/dma/ppc4xx/adma.c
index 279a431ccae3..89e778896d7a 100644
--- a/drivers/dma/ppc4xx/adma.c
+++ b/drivers/dma/ppc4xx/adma.c
@@ -4156,8 +4156,22 @@ static int ppc440spe_adma_probe(struct platform_device *ofdev)
 		}
 		chan->pdest = dma_map_page(&ofdev->dev, chan->pdest_page, 0,
 					   PAGE_SIZE, DMA_BIDIRECTIONAL);
+		if (dma_mapping_error(&ofdev->dev, chan->pdest)) {
+			__free_page(chan->pdest_page);
+			__free_page(chan->qdest_page);
+			ret = -ENOMEM;
+			goto out;
+		}
 		chan->qdest = dma_map_page(&ofdev->dev, chan->qdest_page, 0,
 					   PAGE_SIZE, DMA_BIDIRECTIONAL);
+		if (dma_mapping_error(&ofdev->dev, chan->qdest)) {
+			dma_unmap_page(&ofdev->dev, chan->pdest,
+				       PAGE_SIZE, DMA_BIDIRECTIONAL);
+			__free_page(chan->pdest_page);
+			__free_page(chan->qdest_page);
+			ret = -ENOMEM;
+			goto out;
+		}
 	}
 
 	ref = kmalloc_obj(*ref);
-- 
2.55.0

