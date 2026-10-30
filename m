Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793393054;
	b=d3+qgOcAvX2Ze5K4ytC6e90CzEBYN1TxfEmUuH/xDQeOLR/gDQmcQqHwyfU/35WPPaFR
	 BKLH51XdwAZw8I6LiF7swfFPM76Gbfekc4+4gtMd13f7zEkl26sbFq347P9802EtnYvhU
	 MhaPUaJyZS3yzCLX5N8Z7hA33m67k2ftfVCuBjoex7iUQhRuR4sAixLfayTXjx1CdVR0x
	 Hf7CVyKgZ/sCnIhprl+XbdF5vhZTjhEtDObaFwJwS0X/jgUT8+hMc+HUi5Wr0E2CbB7Ng
	 lVCbBb7OEQZ3eieKYnCrSWuVLr+Qr188f0qc4GCQJE9F3+vWQ9NkrgCXKDYxBQXjnoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793393054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:MIME-Version:X-Received:Date:
	 Message-ID:Subject:From:To:Cc:Content-Type;
	bh=DSlnmf5Y/dE13YqistFiwJnejRPeyo3JQxaBXnk1KRU=;
	b=RXm9Pvs4r8/X0CyAs8E4mHlh6i3srS5lpfCYXpH8+dn4jaC8ncrjWqbne7ErYIF35le4
	 1KhKi6Dte8Yzune8f49LVDS9GR4LH/R9s2SJRA6GK3CdcKSptI4lapB0vU9Fbn0HPpaAM
	 GPlE19/wmXqzzmTYkDralqX9QwAG+W1pq2bvOsnq7VpmCGxCyVFrzuBB6UPRlQxpHGRQ2
	 BD8qZvoVT4edHUjrpJ6SSEh6/nqRAw1wp+kMzsbg0Z0d5w5lHn3wKLpXj94fFW+RJnT2s
	 Vwj8pDRr8ne1nat1oGMSxWFl9ZLjhuh68VZ6AfBSFY01gVdSJjhmxypfCy2/avbIWQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--chriswiseman.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dO0sjXln;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F88E606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:44:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F88E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--chriswiseman.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dO0sjXln
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-351788121cfso5077138eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793393053; x=1793997853; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:date:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DSlnmf5Y/dE13YqistFiwJnejRPeyo3JQxaBXnk1KRU=;
        b=dO0sjXlnleCUcLpXi4+J7kx552VHUv3qYnTZRcKFzzAjQ4dRRR2Ba6LuU27hNlQ1JV
         JlalXKTeXaFSrzThp8x2nmql5ZlmONx2sDiJ0EmI+ifOtl5g/5Svkp5H4Mci3//1MHA1
         Cr/gYxCNxsmOOvRKGvD7Ktlh40fzNHZAuq4L+T4t1cn6L/q/c1iSYRN0RwTSQ7hIQCrT
         5DonK0tJrj8qtidPs8Rtddg8VPDn4C6dNpAHhvTI0UIH4D6eed+Qq5fLFTCCf12bg+X3
         5lP0WR8pcNUn7kEY+y8WMr2VHal9LR/fdqGLIPmknc/QkLhnZNVorwoamROB+qzMP3/0
         v2Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793393053; x=1793997853;
        h=content-type:cc:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DSlnmf5Y/dE13YqistFiwJnejRPeyo3JQxaBXnk1KRU=;
        b=V0PPMZvUWqHmAckewIH073CLrw5Xg6nZCGhv/Om63kTj1glNb+wJRVmWvDZkAlcXP0
         hF2Oip3G5+3HxxnC2UX5ppIhN3I6FCa0srLaI8tRIOLItLL53qqfeuCmZDvsOWVKE1S5
         HGt8xDwtcX7Md17XR0Hs5hxVNvBA0ZbV5xMPYuEHlZOo6rFpm5E4mcTWT33Elp4muSx0
         lYuHD+Oty21yPzISGY/db+NNIun3b7X6wHHFqC6cYkmvTqsdJljAvFJ/bwFINa6Tylmd
         brVHKngXYAuA3CaDfIJOSpfmP2ni50kObv99ggUI8VzJUs+9mYGwhPYTlXY30CIUK3ty
         o2Zw==
X-Forwarded-Encrypted: i=1; AKwUvBxisV9FUNa5OquXVB3wW6t30+3RzenCIulukPad+cChQXBqxfk4uPNXW59x5UElMfCMDLI278ZLZudl3Mk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXyDI5I4SopXTgLeThVHbsa85i7C9AmgeJNqg6Fy+Ku5MSs0XL
	uzARVAWTuR0hWe5tT0H/cDoXpXKhKAIrZhlWC2LyxAKoHeE6GAkq/8Y0LHV9VXBQjRgaPRdVXOE
	vR553bnnsy3YqAvWy5h9VVmxBhSI4SA==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: from dyaz18-n1.prod.google.com ([2002:a05:693c:6392:10b0:36a:15cf:f589])
 (user=chriswiseman job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:88cb:20b0:343:9eb1:9940 with SMTP id 5a478bee46e88-36a423e8150mr4993140eec.26.1793393052930;
 Fri, 30 Oct 2026 13:44:12 -0700 (PDT)
Date: Fri, 30 Oct 2026 20:44:12 GMT
Message-ID: <18e3697ad6321d35.3137322e32332e3235332e313736.e98e6.0000sendgmr@google.com>
Subject: [PATCH] dma-buf: system_heap: Reject private mappings in system_heap_mmap()
From: Chris Wiseman <chriswiseman@google.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, "T.J. Mercier" <tjmercier@google.com>, 
	John Stultz <jstultz@google.com>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Brian Starkey <Brian.Starkey@arm.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Philipp Stanner <phasta@kernel.org>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Chris Wiseman <chriswiseman@google.com>
Content-Type: text/plain; charset="UTF-8"

When commit 381295758792 ("dma-buf: system_heap: Rework system heap to
use sgtables instead of pagelists") stopped using heap_helpers.c and
added a custom system_heap_mmap(), the check rejecting private mappings
was dropped.

Other exporters and buffer allocators reject private or copy-on-write
mappings in their mmap handlers: cma_heap_mmap() and mmap_udmabuf()
check that VM_SHARED or VM_MAYSHARE is set, and drm_gem_shmem_mmap()
and ttm_bo_mmap_obj() reject vma_is_cow_mapping(vma).

However, system_heap_mmap() omits this check and calls remap_pfn_range()
even when userspace requests MAP_PRIVATE with PROT_WRITE. As a result,
subsequent CPU writes to a MAP_PRIVATE mapping of a system heap buffer
fault into do_wp_page() -> wp_page_copy(), silently allocating private
anonymous copy-on-write pages whose writes never reach the underlying
system heap buffer pages.

Reject non-shared mappings in system_heap_mmap() with -EINVAL to match
cma_heap_mmap() and mmap_udmabuf().

Fixes: 381295758792 ("dma-buf: system_heap: Rework system heap to use sgtables instead of pagelists")
Cc: stable@vger.kernel.org
Signed-off-by: Chris Wiseman <chriswiseman@google.com>
---
 drivers/dma-buf/heaps/system_heap.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 1ef1bb3acbf1..f668dc8cb54a 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -235,6 +235,9 @@ static int system_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
 	pgprot_t prot;
 	int i, ret;
 
+	if ((vma->vm_flags & (VM_SHARED | VM_MAYSHARE)) == 0)
+		return -EINVAL;
+
 	prot = vma->vm_page_prot;
 	if (cc_shared_buffer(buffer))
 		prot = pgprot_decrypted(prot);
-- 
2.56.0.317.g454f8302e1-goog
