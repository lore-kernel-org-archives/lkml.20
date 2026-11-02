Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793635249;
	b=i7DOmAcs5LbJO5yV4jYJyGYMx/UeK8WvBHJ447+vea3qdGyKEe0ruxTCsFxZsh7T8lKN
	 0WKHdT4diS0tt0OS83rwFlXuPt/vn4JinOzyLSG8FColfTfhR8FCeCbIz3OoiXWT4dfEF
	 2bWw2b+EW2o63UmuchkXjIAxnKZKTC7UAzPb/9Vz0I/iDWlYdVgDSHeECHYu3+dS/lxAO
	 1X61dg3Q0moZTffyEFDdNvCS6IhH8nQG6lJzFRVDcgKVXEUufI9g3QsaYbmQu6TMjfe6u
	 wrwt/yC8nN1nwLkLCHalOW8J6RsMmUPxR4bGCZe7DxGuMvX90Nvi0kFNMz/Tt6m7d9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793635249;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:MIME-Version:X-Received:Date:
	 Message-ID:Subject:From:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qdDzCJX2QhExG4+G0pbTNThq0KYMMur6UF4zTamumCc=;
	b=oLYczzcKiwnCqZzNeJNoYVy3q8Q3lEcMrNTtYoeH4t2Vi/2J8D2pp3mT9Q/9o1QkzDsn
	 zmCuUt8IOhQQDJLDv0zAmr2xcYzahNRxOrgDSrPzwRjcdQoIxlKqd3ZNJdDCki0TLkC3L
	 9URi6js5X8MTd+aDzkT59pEF36jmFU6DbuFNqoDtETXj8s3E5aI/iLwtqkl+cqhb47okB
	 5QnZv5/mwpsIa9rlaH4j5pQq27xY3+NvKKrOnITyQcUDcx77IyrBR1c/iRZnWthF09b4J
	 fuYqmt0/A2r8FmmmcZOpjxepZ9t2oH8CsVZuRrxtltCqrL9SWX53g1/KIOEWCzq2h7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--chriswiseman.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ESdUcMPJ;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3C0606A5A8
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:00:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A3C0606A5A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--chriswiseman.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ESdUcMPJ
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so6110375eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793635248; x=1794240048; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:date:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qdDzCJX2QhExG4+G0pbTNThq0KYMMur6UF4zTamumCc=;
        b=ESdUcMPJnMdTnShyzCn1FAjj71GVhOeFKa3VioWa24llVaWc4RZL0f5GRmDi2cfhqN
         7xHrWVmOb/3lu4Db4R6yUuy0YAh7jAQHF8y6+WAbPIlN7Yo4I9D+NDxto8IPYoWGNpyW
         P4xz23LiQwQsIC4+bhZCrYem7VBFjLK4Zi0svTKyPDVcYD38JBBuVrkIUGZ7S7i+8rxa
         mdMVobuOjuyfTOtftlifgSyk4h7dHBkTjCcQGtklde8EkmceW1e68jTudz1oVM2Qown1
         kDYj3h+jECh71+fV6mkFApcP1SXeLBcS/jkaat0sHFwHduKJ7Zy8toEhanpuBbvnvbs7
         3bUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793635248; x=1794240048;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qdDzCJX2QhExG4+G0pbTNThq0KYMMur6UF4zTamumCc=;
        b=qMs/3kE7SsneOIMdFCauyo+1YRjcuyYn3eg/AiMlovIblQamOszh18krYlLy1jaXaJ
         6Ip+4hNM2uS51PwCqhofqeVyaxWSMzORu9B4RUpT3FHxbGiJ7Y9KN7+1+6JcSfTR88Ep
         mtBPzfcUJ5d0ZtT2KWHy3AyyrgJlVMQ2bafcvKb9XGrJSUAWkTEm9lvR40burUEC/Mok
         xzCUt+RDpzWi6i/y8nLNDoPv67xdwV9rZSb81fXQ4PdYbUfjt+Nnd+mQWPfwDqfcJvNe
         IhUY33qEG+C/JZbbdLaWQ18PgnpUtZoEt1Nfn60maoKyt7cQWqhrhVZUSAFFQGE4X1pU
         nN0w==
X-Forwarded-Encrypted: i=1; AKwUvBwDr32iesqQaCIdGc6h28xnvp3ZiA+AIRu4aNTxjnNgOjQM6hG6FocVrm0EU95o10wlrLaRs1p23D0MgeY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9B7e0gS2KZ6XsBKJlaUMWRTYIAhJDuw9pjTkDSJr9SrZQ+timf
	Rpfoe3du9MN8YIO+mSBlgQkue1KZiPz6OzZzxoVRmtENMRmXtL8AY1yDTrrA2eGochRZ8BEwDEd
	lhHU+6/+/VCsUXi/IYMUedbt3OaQWKQ==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: from dyhb15.prod.google.com ([2002:a05:7300:148f:b0:368:927a:cdaf])
 (user=chriswiseman job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:3a95:b0:36a:12c4:8bdd with SMTP id 5a478bee46e88-36a42389979mr18350254eec.21.1793635248187;
 Mon, 02 Nov 2026 08:00:48 -0800 (PST)
Date: Mon, 02 Nov 2026 16:00:47 GMT
Message-ID: <18e445c150434665.3137322e32332e3235332e313736.109a67.0000sendgmr@google.com>
Subject: [PATCH] dma-buf: Reject private mappings in dma_buf_mmap_internal()
 and dma_buf_mmap()
From: Chris Wiseman <chriswiseman@google.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	"T.J. Mercier" <tjmercier@google.com>, John Stultz <jstultz@google.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	Philipp Stanner <phasta@kernel.org>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, Chris Wiseman <chriswiseman@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

DMA-BUF mappings do not support copy-on-write.  Mapping a dma-buf with
MAP_PRIVATE and PROT_WRITE faults into do_wp_page() -> wp_page_copy()
and allocates private anonymous pages whose writes never reach the
underlying buffer.

Individual exporters like cma_heap_mmap(), system_heap_mmap(), and
mmap_udmabuf() already require (VM_SHARED | VM_MAYSHARE), and DRM
helpers like ttm_bo_mmap_obj() and drm_gem_shmem_object_mmap() reject
vma_is_cow_mapping(vma).  However, dma_buf_mmap_internal() and
dma_buf_mmap() do not check for this and pass MAP_PRIVATE mappings
straight through to dmabuf->ops->mmap().

Reject mappings with -EINVAL in both dma_buf_mmap_internal() and
dma_buf_mmap() when neither VM_SHARED nor VM_MAYSHARE is set.  Checking
both flags still allows read-only MAP_SHARED mappings, where do_mmap()
clears VM_SHARED and leaves VM_MAYSHARE set.

Suggested-by: T.J. Mercier <tjmercier@google.com>
Suggested-by: Christian K=C3=B6nig <christian.koenig@amd.com>
Signed-off-by: Chris Wiseman <chriswiseman@google.com>
---
Note: For the prior discussion Christian mentioned, commit f91142c62161
("drm/ttm: nuke VM_MIXEDMAP on BO mappings v3") added the
vma_is_cow_mapping() check in TTM, and commit fa5239f2af98
("drm/amdgpu: workaround failed COW checks for Thunk VMAs") worked
around a legacy ROCm KFD Thunk PROT_NONE, MAP_PRIVATE mapping on native
amdgpu GEM nodes.

Tested in ARM64 QEMU (Linux 7.3.0+) across /dev/dma_heap/system:

  BASE:
    [CASE 1: MAP_SHARED O_RDWR]     ret=3D0   buf[0]=3D0x00000000cafebabe
    [CASE 2: MAP_SHARED O_RDONLY]   ret=3D0
    [CASE 3: MAP_PRIVATE PROT_RDWR] ret=3D0   underlying_buf[0]=3D0x0000000=
0cafebabe
    [CASE 4: MAP_PRIVATE PROT_READ] ret=3D0
    [CASE 5: MAP_PRIVATE PROT_NONE] ret=3D0

  PATCHED:
    [CASE 1: MAP_SHARED O_RDWR]     ret=3D0   buf[0]=3D0x00000000cafebabe
    [CASE 2: MAP_SHARED O_RDONLY]   ret=3D0
    [CASE 3: MAP_PRIVATE PROT_RDWR] ret=3D-22 (-EINVAL)
    [CASE 4: MAP_PRIVATE PROT_READ] ret=3D-22 (-EINVAL)
    [CASE 5: MAP_PRIVATE PROT_NONE] ret=3D-22 (-EINVAL)

 drivers/dma-buf/dma-buf.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 1ccaffabbdbe..51e9a4dc56be 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -235,6 +235,10 @@ static int dma_buf_mmap_internal(struct file *file, st=
ruct vm_area_struct *vma)
 	if (!dmabuf->ops->mmap)
 		return -EINVAL;
=20
+	/* check for private mappings */
+	if (!(vma->vm_flags & (VM_SHARED | VM_MAYSHARE)))
+		return -EINVAL;
+
 	/* check for overflowing the buffer's size */
 	if (vma->vm_pgoff + vma_pages(vma) >
 	    dmabuf->size >> PAGE_SHIFT)
@@ -1610,6 +1614,10 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_a=
rea_struct *vma,
 	if (!dmabuf->ops->mmap)
 		return -EINVAL;
=20
+	/* check for private mappings */
+	if (!(vma->vm_flags & (VM_SHARED | VM_MAYSHARE)))
+		return -EINVAL;
+
 	/* check for offset overflow */
 	if (pgoff + vma_pages(vma) < pgoff)
 		return -EOVERFLOW;
--=20
2.51.0
