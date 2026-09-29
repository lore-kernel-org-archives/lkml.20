Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3712F3D9556
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790660931; cv=none; b=MdZjt0YF5e5+CsVrcWQd+ya8p5xA2jO09UMmpysGzl00p8hNvprljNx0qXB16pjitnqK4P5cdGModYIVye6/2d8SK+ns/rW3yzym8GC+eovXr/JKNmOzZF6oqzZZXeWTybXIEfq93TaYdWELIWsjaOB4AkuEbjgoEmM5Kc0kFU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790660931; c=relaxed/simple;
	bh=29ZEC5PLjG/gXCEI5HDKF6BpnkTdM5aT/oFaP2wsL48=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oYgP08wWzW6jJhp9QdlN5W3ZR3kpPlvUODXB/UbjNE0+t4RGzxI69YeJPEGfsr5+hEoGeNOJad41J+3zIKypPlddgPgnEeOxwVqnxLC3tN0btXPZ+vtORBfa8h/9V+rNe3vjb6G+6wv/fLSvG2PIeDTyJIdGrgC+klfPLO9wHPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U+fOKjz2; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U+fOKjz2"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so23192545e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 22:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790660928; x=1791265728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9WcZ52LtgxmvNFnY7nqHOBLnLq9Jyv8OCVXDEjqGBY8=;
        b=U+fOKjz27dNxI8/l0o9duI/7azrFo5v+OUnZpQ/+B3/oKe0Ld7Evm3T+qnp6KEVe66
         jgmoJuDv33jN6/Q03tjO3UJq21pHsKZsQejs8WPNwaZAfwLEOlP0RXdlRnVqUHmJzP2Q
         Rw0rqUhkcsYDAUBnN8ZGXUL6BhxLogEE2hW+NLuakp42iw8E/bIHQlV/5gTTsIqW9u0M
         WRkkTR10Dd1Xl1FODLkDRLRBfwXDWUrJB0IIGtse8XcJqzmz3UvAEiaqGMqu9r0+lwmY
         7lOxvoLH2/Tgjc0vVsouVFNMzdr2pFNECJd5oKS/l9X4xiDwOAOGrhI8Dvd+25vuzcjO
         DFNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790660928; x=1791265728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9WcZ52LtgxmvNFnY7nqHOBLnLq9Jyv8OCVXDEjqGBY8=;
        b=qju4T/X4j7NPMFGRcl52DyziVCNsiVG7GL5bXkiKauQn52joQo0V2V0GN5CnpbZERw
         7A3EromJxRsNUg10w9sNFoiGPrJzBBAy7oNKFef7inUZLHG5oFkbF9Ep/vPuviIbxAox
         6RgZ7Ne4jFs6pw5q1tE/ur2j+HZobGnfIMdtw2xqLkkmn0pzbOcwfpprQbDZkj1fOOe3
         lFGEcgbHbGOy9WAz0tRDvTCqImqBl8ijK8RtU1Azl1mKkgaxn4JuaOYLTw/4WVyGNx2y
         21LHb4eIWxxaQAQ139YY4wedQV5QZEHjbg9THO+0pcFZtaMf5omayNF1jWc2sF5G6u1w
         djNg==
X-Forwarded-Encrypted: i=1; AKwUvBwHkN5ddWUnijnjpHmyfxBaQhRn2h7Ww+DuxnPMoP2X80ZMWXdFiZrg8FOHr5rv+Jz0y8WwRzP0yx9eaqk=@vger.kernel.org
X-Gm-Message-State: AFuF++kobc7ITP2aJWgOcG3uUIb+0hw7HYhlZ+FyXrpYFQfhm0LDLFCe
	shsXfz/+1tX8FdbrU5Vezd6PsKQ1ANHdnTCI+JHCF3ZrfbV0aXaty5CwyXc+F6sl
X-Gm-Gg: AYBFou3svoY7CTD+c4jwcMaCyIhlrNw9h4mmyponC2DiB6LY28XYfD9f7ccyghKKZN/
	wmxR8/TiPCUrQIdu6uh7C5Id6JnsISuHumSRvYObtacvjyL5sixxAkNnbIEUTVUcNZv7TsWxZdx
	SHpJbOMkjw+djMBOFWOQpqRg8kc+z1ruIx/J5lST6EUoAGSD1nNQBPkhujvnInSiJmQk8JHqnCS
	3NFC7WDqfMLbpHR+8IzRxoLlgGg5KHhwvAJX6X6GYe4xw2ft4SIYvINk2CkDUKu06xG0v5Wy9xn
	WHgTzv1ASJtME83FkpTdSuGfpOjhF8ky7lxtDB1UwB5TF000aLYHTuTch3S8sy7LEU48qUPdoZr
	gN4MMB4YuRmztEmo0CjpXCbWyRtONG/iRrOj92Ug5CkJ3BGfhyM5BqLv93SOzObftf55dLqYuhS
	sEvsTGtVBq3hdGFmlVbKa9pBcL/laF6oG5cPAW0c04y8SuvPlLq8VDbQKn9ztleaEvSK/yUOPyF
	i8TBjK2bsb1OMWyGh6nRL/Ooh8SyXMzD5GOUJWaRCBVqlTmGwnzABa/juk8K5g+GDrlySC1XWqM
	dpnozCMjGJvFUBX9e/+AGfHkxiAFwkSQvGBGEOjWZXQ6MqoVwTd0rKDRcUwi14o9HgPL3O+yLyP
	V
X-Received: by 2002:a05:600c:530f:b0:49f:ffdc:939d with SMTP id 5b1f17b1804b1-49fffdc9a4amr93691455e9.9.1790660928275;
        Mon, 28 Sep 2026 22:48:48 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9c32-f801-0451-cc94-d3ca-f56b.310.pool.telefonica.de. [2a02:3100:9c32:f801:451:cc94:d3ca:f56b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf8fa5bsm58477615e9.6.2026.09.28.22.48.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 28 Sep 2026 22:48:47 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] udmabuf: respect the device's maximum segment size
Date: Tue, 29 Sep 2026 07:48:35 +0200
Message-Id: <20260929054835.94118-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

get_sg_table() merges physically contiguous pages without accounting
for the mapping device's maximum segment size. This affects both
importer mappings and the udmabuf misc device mapping used for CPU
access.

With DMA_API_DEBUG enabled, DMA_BUF_IOCTL_SYNC on a 64 MiB udmabuf
reports:

  DMA-API: misc udmabuf: mapping sg segment longer than device claims to
  support [len=65884160] [max=65536]

Use sg_alloc_table_from_pages_segment() with the mapping device's
maximum segment size. Return -EINVAL if the limit is smaller than
PAGE_SIZE because the page-based allocator cannot honor it.

Before commit 5bf888673e0d ("udmabuf: Do not create malformed
scatterlists"), each entry covered one page.

Fixes: 5bf888673e0d ("udmabuf: Do not create malformed scatterlists")
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---

Notes:
    Changes in v2:
    - Return -EINVAL when the maximum segment size reported by the device is
      smaller than PAGE_SIZE instead of clamping it. (Christian)
    - Add Jason Gunthorpe's Reviewed-by tag.
    
    Tested on v7.3-rc4-70-gfe2ec83746e5 in QEMU (x86_64, TCG) with
    DMA_API_DEBUG (all_errors=1) and DMABUF_DEBUG, A/B against the same
    base:
    
                                            before        after
      DMA_BUF_IOCTL_SYNC, 64 MiB udmabuf    1 report      0
      vivid import, 4 MiB udmabuf           2 reports     0
      vivid import, 2 MiB hugetlb udmabuf   2 reports     0
        frames captured                     5/5           5/5
    
    vb2-dma-contig rejected the non-contiguous import in both runs.
    
    For v2, a focused importer advertising PAGE_SIZE / 2 returned
    -EINVAL under KASAN and DMA_API_DEBUG. No warning, BUG, or DMA-API
    report was emitted.

 drivers/dma-buf/udmabuf.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index df6dd00462423..018937435356e 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -133,15 +133,22 @@ static struct sg_table *get_sg_table(struct device *dev, struct dma_buf *buf,
 {
 	struct udmabuf *ubuf = buf->priv;
 	struct sg_table *sg;
+	unsigned int max_segment;
 	int ret;
 
+	max_segment = dma_get_max_seg_size(dev);
+	/* The SG allocator requires a segment limit of at least PAGE_SIZE. */
+	if (max_segment < PAGE_SIZE)
+		return ERR_PTR(-EINVAL);
+
 	sg = kzalloc_obj(*sg);
 	if (!sg)
 		return ERR_PTR(-ENOMEM);
 
-	ret = sg_alloc_table_from_pages(sg, ubuf->pages, ubuf->pagecount, 0,
-					ubuf->pagecount << PAGE_SHIFT,
-					GFP_KERNEL);
+	ret = sg_alloc_table_from_pages_segment(sg, ubuf->pages, ubuf->pagecount,
+						0, ubuf->pagecount << PAGE_SHIFT,
+						max_segment,
+						GFP_KERNEL);
 	if (ret < 0)
 		goto err_alloc;
 

base-commit: fe2ec83746e501645709761605c2464a44fd2929
-- 
2.53.0

