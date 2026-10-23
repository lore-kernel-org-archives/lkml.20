Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792737622;
	b=R0yHWj40fVv8K4FCOEBCGO/2c9XLjv6C7sZ1aZVvRyga+cZg4PU9A5/k29U+Je4tpRrw
	 8zCL3z/zHcxyyq+i0/hHOOBghrstoEWueszIz3hqOIuhvqGxkD4WHuf+6XxKuhSvlO2Qk
	 jRp72r2KZEAgu1tUn2uvulvL6ipRjGSHhQ/cuGyCueRNYr3+w2hqgojYCErLsxDhdO7gn
	 1feQ35uVUQ6MhcCINYAOe4zTwjXF6jZQHgDquY5Y4a0zsNYdDSX4Xlt5SCMtFdJsv18yF
	 DH8VhFIPWhU/Nkt9TqvLiNWt0oPRj2YdAirCEv/K0KMUcz57oIMVot/CUv9ANqs9tZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792737622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=7r0UNu5wEL8POkOSz3+rOlJOKvPQ5Qd38WxY0JoWHCY=;
	b=tMlmMvFYx35ZD7w+jQRvGlkD5O2qNGUEKK+geQ+uF9wdTaym/02rycynkj7xZBXsT6/F
	 BIdr2tVU3UrjAO1g8hxLlVSebgK6RrUdXTuN6ZI/n0k952fZC20P5WGfOyHd4dBmAlJ2e
	 /b5gEpZ/sfdWR4HZvBFKNMOBMUpInCPUsQepeboA/vTideWw9ovNWfynyI4Gk7h8GNV1f
	 joUZXYQwswJfJoBEQGeP8XSLeI//KuwKRpZ6ecFcVjoOOt4wedOHDLm0LVqDTshXx/S7k
	 395gWzdHpWGwPJ7PsbDAvFUdzbWibvZBDtTR3dVlQ+kWKpfq0YBfowBXG0tW9b05aeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SqiI834I;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8E760A3818
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:40:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A8E760A3818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SqiI834I
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1df4c0966so2378395e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 23:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792737616; x=1793342416; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7r0UNu5wEL8POkOSz3+rOlJOKvPQ5Qd38WxY0JoWHCY=;
        b=SqiI834I39va7l3yboJlN/zD/L9WM25KLneG14hpeRk7rVJY0zl7N9XJbly8pj/uXL
         4VfXV57g1LOJemivqZPnATrIZUhRmyu3BdUl2GAzM9FYvUhxek7LWaO+tXL2+FLZI1WS
         fmn6roPNONFMKksLuKgHR6dhPzlbcK09XiUPIUwmyW98H6SbSWg6KSPiQJBqVn+mhex9
         Ey1euNmwJFduuSP3QOsITXWoZcs+Fr6IwVH02YHBvk0zbV9oVXaueclBgj5kzeQloRmd
         NbwQb7Ut1g6mbM5v1CMBQbWaAlBf6CHN+AiAJHmB4hBQURHL1LpzlXn7Jmfb6KCj2iZd
         gRDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737616; x=1793342416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7r0UNu5wEL8POkOSz3+rOlJOKvPQ5Qd38WxY0JoWHCY=;
        b=BbPrQelpc1AwfQCZa4e9bcJeeev1q5PMQsYyvLH/i4VKP8OFRwVsFmnaeJa0RgWp/3
         l3tGRJY8JmsAj20WRXMUfuwcjrcvFmnCOkvi5fKV0r3tZcLhEOvBrUlKHnwZuloMeGFO
         TIBOShQDAdx/1R9KXL4765oj2aCfhwbG5yj5rMY/kAurSZydNNFUJpVayPbIYZ+6zRBx
         1qrohOMqbSfrZKtVkk7L6kKVugw5Xz48Y3OHTTcIIgvYGoNzQeW2P/Ur/XEaE34Ox9Ca
         aJH0oMI2c+mJh8AZAb786/uIxlzPb6O84Nk+oaJfxxkVywK9mhcBh1M/pEUdhK5aJguj
         acjQ==
X-Forwarded-Encrypted: i=1; AKwUvBymnblbcZCC7IKOzd5JxUt2g90VUnU8ee/OzxynpagRD1IEwOFlFgpl1Hj12w2/M7tP3+8l6rlq/fOuR90=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6SmsrLKqF7HKsHq4SEM4X7kR+TN5ze8R2sBlQwxEbSXtn3iY+
	6aL8Bh18qdjfoFUjLJUQzmrG2FCuBVKoaP+GEnvhRMhCFY80TP4hW+LX
X-Gm-Gg: AYBFou0IOJER0wVEWMCXwcybyss9bZJ8sac8inLDQC82udQvPW2ER7VEI9kvpisjFgC
	+7zp0iLQHntLy+iJZvQEtWXcUTXru0PR/7hxAN+K460Mz10v5LtDndJglmwQYJTUYp2Rn2Mnih1
	FlXX1oc6eXttX66d1fbYEjSqhZ10jh/Bm+qfbwiQ0pka32rORR2s6zzugYMZScWji+7C9WHGlrN
	Y6UeU2uA/V/kVmldeIK+ohognmGt5QLS7gJxP6qA6GMlTXFGTmvbBgyMMCbwlp/zBXOZb1yiYTG
	9vBuGLbzp1uSqamJizZmTqWby6N4rrBGUmemmnkpdZqwQdvnTjKUFQ0vJgHYbIL+dOgDJ0x0Phg
	Czotoakvf6lKPe47Cg8WSaqStfRj7ASNHpcODbI4BNSB5pFmQcSEH5rTdSdNyWYQwoz54tvJDAM
	73eO9tjWp6aSK2pt4qJfpC7kEwKBcgsHEDrbUcpD7v9K+f24GmI+olmzunyvXp8r+WgI5X/tD/y
	mu9mLLOQ0tDCzITvMv40CvUr+5B8x2geFnPviuAtYEMb3ola6sCDjWIQnVUoROXEt5j4MpUjERW
	8kKWFF7GuHwTnaJL7u8zDEppopFu+yCzijy3Sg1WzIzAX3AlLvVV3G1Ft2QgPhOs9A1/RRVnf/M
	nxaI=
X-Received: by 2002:a05:600c:6387:b0:4a2:bbd:ea3a with SMTP id 5b1f17b1804b1-4a211c51aa9mr18565345e9.6.1792737615806;
        Thu, 22 Oct 2026 23:40:15 -0700 (PDT)
Received: from [192.168.1.22] (cst-prg-49-173.cust.vodafone.cz. [46.135.49.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38030c47sm3104782f8f.21.2026.10.22.23.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:40:15 -0700 (PDT)
From: Tomeu Vizoso <tomeu.vizoso@gmail.com>
X-Google-Original-From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 23 Oct 2026 08:39:37 +0200
Subject: [PATCH v3 12/16] accel/thames: Install memory mappings populated
 and dirty
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-thames-v3-12-3ab40aa17157@tomeuvizoso.net>
References: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
In-Reply-To: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
To: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
 Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
 Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Beleswar Padhi <b-padhi@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robert Nelson <robertcnelson@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Suman Anna <s-anna@ti.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 linux-remoteproc@vger.kernel.org, linux-hardening@vger.kernel.org
X-Mailer: b4 0.15.2

The GEM DMA mmap helper maps the whole buffer up front, but with pages
that fault on their first write, since the A53 in the J722S has no
hardware dirty-bit management. The GEM shmem helper maps by page fault,
one at each page's first touch and another at its first write, which
its write-notify needs. Neither helper can install the pages writable
and dirty, so the driver sets the protection itself: for contiguous
buffers it calls dma_mmap_pages() with it, and for the others it
installs the pages with remap_pfn_range().

This saves 20% of the total time in the first invoke of a model on the
J722S.

Assisted-by: LLM
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 drivers/accel/thames/thames_gem.c | 76 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 73 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/thames/thames_gem.c b/drivers/accel/thames/thames_gem.c
index 5a4dc497768f..9f55169c6370 100644
--- a/drivers/accel/thames/thames_gem.c
+++ b/drivers/accel/thames/thames_gem.c
@@ -808,12 +808,82 @@ static void thames_gem_shmem_bo_free(struct drm_gem_object *obj)
 	drm_gem_shmem_free(&bo->shmem);
 }
 
+/*
+ * Installed dirty and writable: the A53s have no hardware dirty-bit management,
+ * so every first write would fault.
+ */
+static int thames_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
+{
+	struct drm_gem_dma_object *dma_obj = to_drm_gem_dma_obj(obj);
+	pgprot_t prot;
+	int ret;
+
+	vma->vm_pgoff -= drm_vma_node_start(&obj->vma_node);
+	vm_flags_mod(vma, VM_DONTDUMP | VM_DONTEXPAND, VM_PFNMAP);
+
+	prot = vm_get_page_prot(vma->vm_flags);
+	if (vma->vm_flags & VM_WRITE)
+		prot = pte_pgprot(pte_mkdirty(pte_mkwrite_novma(pfn_pte(0, prot))));
+	vma->vm_page_prot = prot;
+
+	ret = dma_mmap_pages(drm_dev_dma_dev(obj->dev), vma, vma->vm_end - vma->vm_start,
+			     virt_to_page(dma_obj->vaddr));
+	if (ret)
+		drm_gem_vm_close(vma);
+
+	return ret;
+}
+
+/*
+ * Every page installed now, dirty and writable: they are pinned for the
+ * object's life, and the helper would take two faults on each.
+ */
+static int thames_gem_shmem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
+{
+	struct thames_gem_object *bo = to_thames_bo(obj);
+	unsigned long addr = vma->vm_start;
+	struct scatterlist *sg;
+	pgprot_t prot;
+	unsigned int i;
+	int ret;
+
+	if (vma_is_cow_mapping(vma))
+		return -EINVAL;
+
+	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
+
+	prot = vm_get_page_prot(vma->vm_flags);
+	if (vma->vm_flags & VM_WRITE)
+		prot = pte_pgprot(pte_mkdirty(pte_mkwrite_novma(pfn_pte(0, prot))));
+	vma->vm_page_prot = prot;
+
+	for_each_sgtable_sg(bo->shmem.sgt, sg, i) {
+		unsigned long len = min_t(unsigned long, sg->length, vma->vm_end - addr);
+
+		ret = remap_pfn_range(vma, addr, page_to_pfn(sg_page(sg)), len, prot);
+		if (ret)
+			return ret;
+
+		addr += len;
+		if (addr == vma->vm_end)
+			break;
+	}
+
+	return 0;
+}
+
+/* Only the GEM reference: the pages are pinned for the object's life. */
+static const struct vm_operations_struct thames_gem_shmem_vm_ops = {
+	.open = drm_gem_vm_open,
+	.close = drm_gem_vm_close,
+};
+
 static const struct drm_gem_object_funcs thames_gem_funcs = {
 	.free = thames_gem_bo_free,
 	.print_info = drm_gem_dma_object_print_info,
 	.get_sg_table = drm_gem_dma_object_get_sg_table,
 	.vmap = drm_gem_dma_object_vmap,
-	.mmap = drm_gem_dma_object_mmap,
+	.mmap = thames_gem_mmap,
 	.vm_ops = &drm_gem_dma_vm_ops,
 };
 
@@ -825,8 +895,8 @@ static const struct drm_gem_object_funcs thames_gem_shmem_funcs = {
 	.get_sg_table = drm_gem_shmem_object_get_sg_table,
 	.vmap = drm_gem_shmem_object_vmap,
 	.vunmap = drm_gem_shmem_object_vunmap,
-	.mmap = drm_gem_shmem_object_mmap,
-	.vm_ops = &drm_gem_shmem_vm_ops,
+	.mmap = thames_gem_shmem_mmap,
+	.vm_ops = &thames_gem_shmem_vm_ops,
 };
 
 int thames_ioctl_bo_create(struct drm_device *ddev, void *data, struct drm_file *file)

-- 
2.54.0

