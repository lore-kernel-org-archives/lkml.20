Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793113771;
	b=L1oYpvO3uFhiL3XIrFL8G748DsXkLLYmYKBkWayOtFeqnbNou+Ej4Cjg+/Epn/x76BE2
	 pWa9DS/8wcCTLEUVkUPTIe+04ytwVrzZHQ/OGC5XddgIQzJSJeQ7iNZQxs8hpWSiaaIsc
	 J2+TT5PrCSJ4lbApC5VlX1fkotEw5+EhXyagJRxsM4NgCZCKNPocCGCwDdkDzRjnN1krB
	 rRUzippzslsOmXI2r0lQFcCNKYooMe3qQ6KxW8hfumVHpxKnqPOgRcosov00/vMauq8mB
	 eiE6idlxuCL6+tnEzbtx6sAXv+9eUj7HAVybl0qSEn+RnuabP5uRCrpWrp27mH3H3ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bNcskWWrObU6xyaHbWvG80GKO/ps3fkYEC50TXpqK7g=;
	b=pGSDU9cvZr0DXyCr8lquUOiL7NltmBCo4yWLHClJo4Y03EG55wgF1fUoRjEEvFiwabP8
	 IQsohCWTSjYLAnp+4ZN8GP6MzYurGJGCQ7j0dl9lQ1vR8t+MswNG6YDNDCL4723dT5WVn
	 1kPROeIylJqxtND6lscNuhio/GLHh5eUOkJH5Pwq+ughgcCispLASoYHlY51S6jQ8+8Va
	 rxunAJhkT/eENXqp8nh+AzcTd7yqFbvOv3FW9xgjliB/jmkakwj3+dzE5cGQ82hP9+xjY
	 JZ+GahHNl4PWAQBFxh18AnF5nJwEYHWwDZod2DRyFv0vEJGIrMw0Vn2qW7VZ5JqsmlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qLf38993;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FA5606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:09:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9FA5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qLf38993
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e95bd1c14cso38128795ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793113770; x=1793718570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bNcskWWrObU6xyaHbWvG80GKO/ps3fkYEC50TXpqK7g=;
        b=qLf38993ZdVcRqJfR/ZyaGYo0s9QaMq6TX16I3tpkTZQiYBIVkRgYW65IJyndUFfV+
         hMbe4m2vc/7cNL43gVOwLyN2QRkBoIFlv6oI5E0N1mRccaVli5tiUR0b9w6gGheTeAli
         q/o2I6+QobFt+OJJ1kn5GjmY9y9R7hC4kEmUC7lPzNgliE8cNsEYK7top1KTdi51aDY3
         25ilmlEInj5SKUZW/5lFzWrlVaXY+LvNbvWg9hJVCOFMCmVf8XRBv97Y7rG6g+OWcSuC
         5DIXmFNib7uoUqrBTBaOp02MF71gI/7tWDVjl0Jg/Xb/8P8AQM/aCSHsNFhigjw7V454
         s/iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793113770; x=1793718570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bNcskWWrObU6xyaHbWvG80GKO/ps3fkYEC50TXpqK7g=;
        b=zuRZ98au30Mhf4H+5/FBirGyaoDYvAdm/VstPmDn7wOp0X7gQD6d2kgsU1W+KgAxF2
         k+MTsSuK57FCa2VFWGiaHjYGd/4uIu/iFoTRFk0aPlQmRbyxFL3EHtG3UETBN3nKKFAh
         mUP7nFCBxIzdzijs2TlXl9/BKODTwFLm5puneomrtMVrCs6tGLJrlmgDCOtpchPnlIRs
         igW18Ub0E2U3VgrvhusreeQCx6FCwd9EsWYZ2Q1uBP77jYzcvAHjwnunujNufRDQevbg
         C5TR++xlGHKwXVVpjtAVWJ9k3EPzVBGf3zqLOSV9+5DoXeXosLhd+BfiQNxq1khwFDrV
         zTOA==
X-Forwarded-Encrypted: i=1; AKwUvBzIRzQm+wdKJx4olW6kWzD9UMpn2LEuDhRrdBATdn5ACL9GOVXJTWvIKCkvNC7127R0dNpofnZKZi+32sI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUffrbCbUaD1KF0+eYmY2Nu/WcZ3qHrPQDm8f7skU6dBLiBKaQ
	i/xV9Em8qqJw5sugrOhC9yq4dX9r2J9FOU8dIBSQKhselvpaYiI6hFY0
X-Gm-Gg: AYBFou0Cs1U45l3xXZmAlBqAd3oM3gQhyxJJNHf/l9hrx3fCBQZJPBSGCvMZWGiP5xE
	MnSdk/wWCEH09ASbIYmyTPZe3IClZqQyb0D57rinclqADDleu0qA6Kg4/6RJDAUS9N1QsdDivTo
	Umeeqr5L36CNTb/qNe7XFPm5pOkEGjz9U9bdDHshnRRLhSUfroQkZZAytF7ChZdqvzoBR0euH22
	5jv4VgkXVcUcwTKviOAXfwK0sOHi2U3NnVCSL5J2nLdt3nCuwH+4YcU7u+g2hmKJLwRNvNeVf1k
	w/H4TPi1sOIP1tRGganCl0W4DnfimaP2qkGrbvxEmZn7/jr/9BI7wzZdxIJZ9YQ35fdAZIHuMLM
	+XBlKiwKPkf7tOrvRIJaf8wWd1W7XcawrROhM2nRekNn2ZJ/4JFQdXSSjB/Ax3B9aRfcRD4uglk
	5bCku9KbbZiOHPZm0K4XuCqiD/QFOn8tY4lEz5mAS2XLUku8sc4GBlQxa2U0uPM5bBvHSm08lJd
	PWiYeDOOp7P3n3/dtJWp/7cNhWImEocx5hDkgtN7i7W74lGIolMVlXJQjhI/D1LLS4Nzg7o+8lA
	YSaMZKXqcWUzVzz8c8kmV0969e4=
X-Received: by 2002:a17:903:390b:b0:2e6:24da:a4b8 with SMTP id d9443c01a7336-2ea9c83f978mr88983565ad.38.1793113770023;
        Tue, 27 Oct 2026 08:09:30 -0700 (PDT)
Received: from lgs.. ([101.76.249.61])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae64549dfsm11334995ad.4.2026.10.27.08.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:09:28 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Scott Branden <scott.branden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Olof Johansson <olof@lixom.net>,
	Desmond Yan <desmond.yan@broadcom.com>,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] misc: bcm-vk: fix DMA allocation memory leak
Date: Tue, 27 Oct 2026 23:09:21 +0800
Message-ID: <20261027150921.137189-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
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

bcm_vk_dma_alloc() leaks dma->pages and pinned user-page references
when page pinning or coherent SG allocation fails. DMA mapping
failures can also leave the SG list and earlier mappings unreleased,
as bcm_vk_sg_alloc() skips the partially initialized slot.

This issue was found by our static analysis tool under development.

Fixes: 111d746bb476 ("misc: bcm-vk: add VK messaging support")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/misc/bcm-vk/bcm_vk_sg.c | 43 +++++++++++++++++++++++++++------
 1 file changed, 36 insertions(+), 7 deletions(-)

diff --git a/drivers/misc/bcm-vk/bcm_vk_sg.c b/drivers/misc/bcm-vk/bcm_vk_sg.c
index 8662bb865129..b237a5332b7f 100644
--- a/drivers/misc/bcm-vk/bcm_vk_sg.c
+++ b/drivers/misc/bcm-vk/bcm_vk_sg.c
@@ -78,7 +78,8 @@ static int bcm_vk_dma_alloc(struct device *dev,
 		dma->nr_pages = (err >= 0) ? err : 0;
 		dev_err(dev, "get_user_pages_fast, err=%d [%d]\n",
 			err, dma->nr_pages);
-		return err < 0 ? err : -EINVAL;
+		err = err < 0 ? err : -EINVAL;
+		goto err_pages;
 	}
 
 	/* Max size of sg list is 1 per mapped page + fields at start */
@@ -90,8 +91,10 @@ static int bcm_vk_dma_alloc(struct device *dev,
 					 dma->sglen,
 					 &dma->handle,
 					 GFP_KERNEL);
-	if (!dma->sglist)
-		return -ENOMEM;
+	if (!dma->sglist) {
+		err = -ENOMEM;
+		goto err_pages;
+	}
 
 	dma->sglist[SGLIST_NUM_SG] = 0;
 	dma->sglist[SGLIST_TOTALSIZE] = vkdata->size;
@@ -108,8 +111,8 @@ static int bcm_vk_dma_alloc(struct device *dev,
 			       dma->direction);
 	transfer_size = size;
 	if (unlikely(dma_mapping_error(dev, sg_addr))) {
-		__free_page(dma->pages[0]);
-		return -EIO;
+		err = -EIO;
+		goto err_sglist;
 	}
 
 	for (i = 1; i < dma->nr_pages; i++) {
@@ -121,8 +124,8 @@ static int bcm_vk_dma_alloc(struct device *dev,
 				    size,
 				    dma->direction);
 		if (unlikely(dma_mapping_error(dev, addr))) {
-			__free_page(dma->pages[i]);
-			return -EIO;
+			err = -EIO;
+			goto err_unmap;
 		}
 
 		/*
@@ -167,6 +170,32 @@ static int bcm_vk_dma_alloc(struct device *dev,
 #endif
 
 	return 0;
+
+err_unmap:
+	/*
+	 * Unmap completed SG entries and the in-progress DMA range,
+	 * which has not been written to the SG list yet.
+	 */
+	sgdata = (struct _vk_data *)&dma->sglist[SGLIST_VKDATA_START];
+	for (i = 0; i < dma->sglist[SGLIST_NUM_SG]; i++) {
+		size = sgdata[i].size;
+		addr = get_unaligned(&sgdata[i].address);
+		dma_unmap_page(dev, addr, size, dma->direction);
+	}
+	dma_unmap_page(dev, sg_addr, transfer_size, dma->direction);
+
+err_sglist:
+	dma_free_coherent(dev, dma->sglen, dma->sglist, dma->handle);
+
+err_pages:
+	for (i = 0; i < dma->nr_pages; i++)
+		put_page(dma->pages[i]);
+	kfree(dma->pages);
+	dma->pages = NULL;
+	dma->sglist = NULL;
+	dma->sglen = 0;
+	dma->nr_pages = 0;
+	return err;
 }
 
 int bcm_vk_sg_alloc(struct device *dev,
-- 
2.43.0

