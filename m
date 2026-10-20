Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792478307;
	b=NCzI9Dh7RgYbnOTiHG8gIcTyhCY06Uc0lp/zQy38qy90NPpvgGaZ/Tof3AlAOa6UzQ0+
	 lxdc1eY8RIWYfDR66RFVlXdIOg4h9PGv8njMeoLR6Z2S9A9So40jupEKUUXCdVGN5+fCi
	 f5WflVPikGKVtoZPmRyaVXxe6mdTJPbpmPDj2sZWW2ezozUW6yZHRop1f0erZjptIbZti
	 nuuAllMaxF+8cDOcdv0lsFm5jF5na/yMh7m+rAw5oOHAClA7UbIgn3UARrLJCAMGJcNIT
	 k7XTZmx/3RE7WeoPe1ARHbKXV7IYPj61fTeg17ymCp+B7DvnZjnSAmZp8z/J2fUQVqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=54nP+hVnBR38qJFAJ37FPqemtxXLBnXTchrtQmC7INs=;
	b=Q1LNuESVoyvTcV0ieS0pn9FUjqeIa85JE2WZvko+i8Nmo4wdPdkGzrBl763eOc3HmV2F
	 wM6eJMV7stDjwsl1WEjrCFzdR/OAAUUIpT8yRb5dM5uIO2i/d+9IdgAZEeC3vC6HlxmlN
	 JA9+HYXXQ92t+ruxIVrA/WcYxadK5Ccs2JNk5AE8iJLtvjarFCv5vDBLq/nFInp55fvgD
	 vYgQJENwYL409Qhnf1RTyP7fthQQOwnS2DKAyI1SLmZykK2fmnBbqrsNVZ7US+BjBTdWu
	 aEwK9vcm2ZKYvyb5awl+H3boAlOmIi1eCUVBz8lbV9NHnor7JF4bVItmlTAxY79mdtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Aln6DWWQ;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B61B606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:38:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B61B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Aln6DWWQ
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48c45111bebso1725883f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792478306; x=1793083106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=54nP+hVnBR38qJFAJ37FPqemtxXLBnXTchrtQmC7INs=;
        b=Aln6DWWQ66nyAA9XH0EuCU+6CESveBtk2wAH+eysfQwQxncBnpy32ta5rQJP2FuDG9
         foMXr68z1yIVgvIA0V6vbJV0ZGqtgO/wNwSP+mOmHw2/CgFj2Qx9eiowrJRrhT/ttb+U
         uzN9WFHl2ux1CLe7GuIunPeHCivhj+M5O2rNz53CCeloPsLYiPERQNOrsDOAdc6qtpRP
         ywiMxJL65clx/1iZeHhJFYHAD62irJ/hVko+GSsPoQaMGQPximjG8fLKLYoh/L7LuGj9
         6WwnEo4A9NPLZ/qrE3RiteOxhMTxWtmYNG+nmjTA+c6zk60/7qSAvHHbKL4ZewVqPcCU
         3BrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792478306; x=1793083106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=54nP+hVnBR38qJFAJ37FPqemtxXLBnXTchrtQmC7INs=;
        b=x2j5VNYDmOmM23saDJVz7bGQJrWtKA3YtKgrZf601Isukev3o+SQTxLXpzKvjvaJ1w
         yaux9dQKRLs6fYQkm7iUinhn+V0W+oMwzloLTUAVPhTWGRG3p7im/2gRT2vsulzj4cn0
         z/A51fnaUy64QHrSqjiGQlfkF5e7yiMfTEyJ9cjxnzQEPzRPrTfFCFg+54NC0J54hGhk
         MffmLjjq3KIFR4/q8FLadXZK8GbvZQu9Bagxi3eEXsv1AEI9pVtYP3NxjI/A6AlIDm2F
         0WXIkSAlY/zDXabrdoxpXAXcqsT/cnPFaV+B8yo2BaW1TGYEjVmWYVShgIEuBr3TFeGs
         3ysA==
X-Forwarded-Encrypted: i=1; AKwUvByx+s2kv/VT7Jl+ttDyb6R8SKDjXgPKePZ5GgQb8olpaqGduvGL8NJfUEPmLvSAWGwvpYlc8M0LTgx61uI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfk6mf67UiE+de6dWZ3QsXe0+HbJsLvtOtizl7qxo7WlArL9tF
	D2A1tJAQ+5//mEoHpnj0HYIGkYsSf6+8/IWYjMGhJ7tT29RT6Swym8la
X-Gm-Gg: AYBFou3Ry+nzpLomqjsYrHkIvA2DJQk+ma8PSM4k5W+g2v5pcbu/9/4aRcEgtQInSZu
	jm82VtPuNvfo8pXm2JLfoWh5SR5DYD2kVoOEIYaQfNdqg6hV1DUhJGEuUTM2QC0GApCkxmXGV3H
	w2gBMYKieAwq9XMmTIid8s28kWM/9vTrA8gJe93lDfHJyG0wE/IcNEfptfLmrrntjw3As1Q0YkX
	819sSYG0TXkBcMmZTMFkXYEh86r1gfLhsprvP3WOsOlGUBvp4jBacdoRSFrAIHF/0lDJ54M6SM6
	lwqp1aVmMaOw/Lcic+noW6NvZCLr9ttkCCc/VoSPp1zZMCCFZjdbA38GRraJqQ9JEveCp1qnDKS
	MY27s++JttNXoz8a2tY1ER+pXCAR+VixWVKh+cy8zmnsMcO77frdO+0AG7rqvIpUurlmciKat8B
	RmLXXAdhrw5M002joBO53Q/g9FegsMXUes1FcOZmSypBPTbr5wuhqcV22NGAw9K+5oWzSKKoN63
	MeJfE7e/LM9hcPF8axL5q3hR5Qh6z68naGgCDo7ViHa7iJt+qQNFve0qoW/Wqhl0WY1wCSkD9dm
	LaJpso4yxuJJHHH8v6BRFaLLm/H3M3j08C9zQU5xEB3eSgej+gfSzmv6lExWqOQWfFrCL21YhN4
	UuYMGxAX1u9Ml
X-Received: by 2002:a05:6000:1e4f:b0:48e:412:3829 with SMTP id ffacd0b85a97d-48e07fb2b18mr14486670f8f.15.1792478305848;
        Mon, 19 Oct 2026 23:38:25 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9c92-6501-2169-eb9c-7ad3-f5db.310.pool.telefonica.de. [2a02:3100:9c92:6501:2169:eb9c:7ad3:f5db])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d820714sm3916393f8f.35.2026.10.19.23.38.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 19 Oct 2026 23:38:25 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jason Gunthorpe <jgg@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	dri-devel@lists.freedesktop.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [RFC PATCH 2/6] iommufd: Publish successful PAL mappings under resv
Date: Tue, 20 Oct 2026 08:37:41 +0200
Message-Id: <10fbbfdbf3a19fff48e504bcf5ec3a74f11bfd7c.1792477872.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1792477872.git.kmehltretter@gmail.com>
References: <cover.1792477872.git.kmehltretter@gmail.com>
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

iopt_map_dmabuf() stores the PAL map result in exp_phys before checking
for errors and publishes the attachment after dropping resv. The
attachment is already linked to the DMA-buf. An invalidation after the
unlock can therefore pass a NULL attachment to dma_buf_pal_unmap_phys().
On map failure, the non-NULL error pointer also looks like a live mapping
to iopt_dmabuf_revoked().

Keep the map result local until it succeeds. Publish the attachment and
physical list together before dropping resv, leaving exp_phys NULL on
failure.

Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/iommu/iommufd/pages.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/iommufd/pages.c b/drivers/iommu/iommufd/pages.c
index 0b32c65af..9e9bc6a1c 100644
--- a/drivers/iommu/iommufd/pages.c
+++ b/drivers/iommu/iommufd/pages.c
@@ -1491,6 +1491,7 @@ static int iopt_map_dmabuf(struct iommufd_ctx *ictx, struct iopt_pages *pages,
 {
 	struct dma_buf_mapping_match pal_match[] = { DMA_BUF_IMAPPING_PAL() };
 	struct dma_buf_attachment *attach;
+	struct dma_buf_phys_list *phys;
 	int rc;
 
 	attach = dma_buf_mapping_attach(dmabuf, pal_match,
@@ -1513,16 +1514,16 @@ static int iopt_map_dmabuf(struct iommufd_ctx *ictx, struct iopt_pages *pages,
 	if (rc)
 		goto err_detach;
 
-	pages->dmabuf.exp_phys = dma_buf_pal_map_phys(attach);
-	if (IS_ERR(pages->dmabuf.exp_phys)) {
-		rc = PTR_ERR(pages->dmabuf.exp_phys);
+	phys = dma_buf_pal_map_phys(attach);
+	if (IS_ERR(phys)) {
+		rc = PTR_ERR(phys);
 		goto err_unpin;
 	}
 
-	dma_resv_unlock(dmabuf->resv);
-
 	/* On success iopt_release_pages() will detach and put the dmabuf. */
 	pages->dmabuf.attach = attach;
+	pages->dmabuf.exp_phys = phys;
+	dma_resv_unlock(dmabuf->resv);
 	return 0;
 
 err_unpin:
-- 
2.39.5 (Apple Git-154)

