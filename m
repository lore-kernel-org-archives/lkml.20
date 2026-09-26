Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD647346E47
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 07:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790406788; cv=none; b=FhmrMA91hJJzGhssBGcMadq02VMuNlty6jBIICnA5wwiAg3U+TCS/V/tYt7ppYYCI8L8Q006IWWb0M4gHkturuxN1sWnzzXdB3nXNHdWHyx272lvYx5QsOLP/1JPkrmYei1Y6dX3+CetEj/33Jnb5IKg6HsC4FNDhtwBameZnoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790406788; c=relaxed/simple;
	bh=HU4uZGxFsozjvnvwADb4B8f2sx4GI5SwrBsDFGLDqU0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OloBXAQbXKN7/voMdZIyhy0bgSjHh1iInZnpSnfZpBdrjQyMF/+5qSpjxR9jby2KSqBIdz5KfXq/h4xWZCGT4A1cW1hJEo50j6AnBvNozKoSwX8Hx/qZh1+6uAdw43S1Ty361P5nFKWIzKF4YX6hjjpufcKyJCPHUlwvSRkInzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XdVCKrz4; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XdVCKrz4"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4885d4825adso897895f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 00:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790406785; x=1791011585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rY5HCiFtt5IzvJR7OZXNoiF5Qm5UV5uB0Zymmp5HUaY=;
        b=XdVCKrz4LtqvgbczWIW29vbnaNyN8DFhFUymwnKKxrsm6MYx1LwlKny+HQvr8q3Rwt
         88IXPrfZ4DQsnRdxYzd7tQMKG5FRG86co9hitBCfvpC1DhbI13ZrfjPdlfEOzRtnY1aP
         tnv3FH/NNqsWbVDDoNkYI0PiWb4fkGQLRk5ynFAPJPPfOSXaP+Oi/7FOap37U4ytx+RY
         vqcgcYlSRyakjiD+Zu3LV5yIatWT+/Lon1kD6eQUnIIT8b3MVHDiHe+/VKmVTaFPvbbH
         wHHQ2t0pGImXGZkAGQ4ya3lyeaa/vnqcqsNUaE1Xb3z+FH8YkJx6TMiJy2niwhIB631E
         LT2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790406785; x=1791011585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rY5HCiFtt5IzvJR7OZXNoiF5Qm5UV5uB0Zymmp5HUaY=;
        b=cms9SUorEjmHmrAOZwdP0elpa0SHbxTgE9GybjqDg3FWj4AzVuFxD462ug7vJpXp5o
         1gzfIYLVrLKkeQjL5ntIJ1uz5lVpXEEJWkemOPC64CSquBxqyp7C20B7lBRoR9eI9m/N
         rI0KQvN+qVmbRMrRy1xuKp4F5nkoQwGcLnc08UwZUrGA3WKPeELIj3sBbvivhGEKVxKv
         wnkGUaHNqy0bDXIQFM68iRi2wqsY0XTXa1U5WD0jK4ehlA3AEH5+DyimvJjyV4nDLH3T
         ++jj57Z/8LsXiKye8qSYPJmgH7eXnKdTQgN+oDaVlk4x8/M8cBluzfr2puboFji2mPFt
         0oVQ==
X-Forwarded-Encrypted: i=1; AKwUvBydazoa/7wM1fi1r5lHYBBv/cwlzauhCHZKbEsyuLQpK9ugHOSnWI4FzMvUHjj4/aEBHFNelFgn3pYc2sA=@vger.kernel.org
X-Gm-Message-State: AFuF++nEUVycTnadeBz2+bN05yb6sNDE2+zMMmK4V4HrXPRNpeA0ilA3
	iU6nPD/sKlG5SHEmB4tfx1OQWXyhoqJVqR9+MD9hg8Ixf8ITqGNnbL5i
X-Gm-Gg: AYBFou389fqQx/PKtFamuoBCINWssa/Ie2EZVXcQuKWNeUvfYizdO2632bRoDgz8489
	rf4eH1kvnQMgcfGji0ti4cLLiZx3snasjq668PLPm1eGSDGpFEyOCDjaAgeeyP1brO8j/RuekeI
	tbDR7S7QmC4tftUxzElUZxVZLAeT0lkryaBbauNhhQym0L55j8jDd07eUkquMrCyJvXkOnfRYFz
	jgqRC1EbFCtZ+q3v5MuQAZxzOcnVVqHzaVkuZeX/NV6vULdCMMwPTUF3hQuXLXgzHkrpQXhK9fi
	PevWffls8nbkGaZnxSj+PIvHANnvEmtJIuRqi+GNDo9iQ8dknOXnb4kOLc+poFmFk/jD29wRYKP
	0FMxrEMdOHpkJoffAbitCoyn0XgkN+NUq16Le4mHCIDgGj3m8wIt3JjpKgfMxJtGte4dd4RRpE8
	5wdqpzwGFRGbtDDNo9QhOQkUYzNq+q+pUvrIVdXd838SUTqSk8TGeHj8AUWdl797CYiTXS+kGRC
	pkE/mOGpJt1Vk7LP1+uyqiDfyqrr/HZujcFuWaqdkaGkDo4TmnC3y/2A2LLloEa70yWasFfwck0
	bVflxUkAS4qGqthQBffWQK8MJU1N8yljkiSOwAb+BZHAP3LritN8fZna2FA6+5jjH1TDt2dntwd
	XowsZEs3pxTViwC3cYw==
X-Received: by 2002:a05:6000:2583:b0:485:8ee0:dfc8 with SMTP id ffacd0b85a97d-4887175a69cmr16191456f8f.41.1790406784608;
        Sat, 26 Sep 2026 00:13:04 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b162-c701-4960-a998-3de8-2fce.310.pool.telefonica.de. [2a02:3100:b162:c701:4960:a998:3de8:2fce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a570sm11592286f8f.13.2026.09.26.00.13.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 26 Sep 2026 00:13:04 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] udmabuf: respect the device's maximum segment size
Date: Sat, 26 Sep 2026 09:12:58 +0200
Message-Id: <20260926071258.77202-1-kmehltretter@gmail.com>
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

  DMA-API: misc udmabuf: mapping sg segment longer than device claims to support [len=65884160] [max=65536]

Use sg_alloc_table_from_pages_segment() with the mapping device's
maximum segment size. Keep a PAGE_SIZE minimum because the allocator
warns and returns -EINVAL for smaller limits.

Before commit 5bf888673e0d ("udmabuf: Do not create malformed
scatterlists"), each entry covered one page.

Fixes: 5bf888673e0d ("udmabuf: Do not create malformed scatterlists")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---

Notes:
    Tested on v7.3-rc4-70-gfe2ec83746e5 in QEMU (x86_64, TCG) with
    DMA_API_DEBUG (all_errors=1) and DMABUF_DEBUG, A/B against the same
    base:
    
                                            before        after
      DMA_BUF_IOCTL_SYNC, 64 MiB udmabuf    1 report      0
      vivid import, 4 MiB udmabuf           2 reports     0
      vivid import, 2 MiB hugetlb udmabuf   2 reports     0
        frames captured                     5/5           5/5
    
    vb2-dma-contig rejected the non-contiguous import in both runs.

 drivers/dma-buf/udmabuf.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index df6dd00462423..09f1eb8432f19 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -139,9 +139,13 @@ static struct sg_table *get_sg_table(struct device *dev, struct dma_buf *buf,
 	if (!sg)
 		return ERR_PTR(-ENOMEM);
 
-	ret = sg_alloc_table_from_pages(sg, ubuf->pages, ubuf->pagecount, 0,
-					ubuf->pagecount << PAGE_SHIFT,
-					GFP_KERNEL);
+	/* The SG allocator requires a segment limit of at least PAGE_SIZE. */
+	ret = sg_alloc_table_from_pages_segment(sg, ubuf->pages, ubuf->pagecount,
+						0, ubuf->pagecount << PAGE_SHIFT,
+						max_t(unsigned int,
+						      dma_get_max_seg_size(dev),
+						      PAGE_SIZE),
+						GFP_KERNEL);
 	if (ret < 0)
 		goto err_alloc;
 
-- 
2.53.0

