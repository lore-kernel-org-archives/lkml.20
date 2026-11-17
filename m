Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794930873;
	b=mPkqY5H6NMupOUsKamiy94iiNNBQUCtVhYmKhSzQ0d0ZqEiC1wmc6kBk0ZJX37EF7iph
	 o5UFUrktBJGCuyA+lD2DwoyckEr9tPHJg/5EpuklZj3AnqmoaZB4ukF6ufjFi6i+QniCF
	 noOKHNs/hqDPNJ/i6fcG7+j6xU4/QrWySKa5wou5wi3Sp9wNoVcjk82/leB0TuAZmD0pg
	 SIHLM+Wzri1nBcm3bRlAguJjs0LMwyL335RApGgSgdGqnKC3+gUZ8WYW0ztkSYGrFE5GN
	 AZb5vIijtWHaXVrT1Cy5m31Wg/LAKvG9LkYy/ZjaqAlgdgO+qPPvOGJhDflNP5WqcZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794930873;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=+exUxtgPdVBwoKR5r/DiwCvHxmnKqLuiNXXsjqjObOo=;
	b=uATvde2sAo+xEfk7ixkGk4ZwHiQAFkUnfuYtmpgWVx9vJeFRieKCT97qSgCD8BQCFcgM
	 4uZ49Pt5cVD5Lx3OIMLzeH5pRemt4CnfgfEILhCEYUjFY8Et/ghYnusd7eX2X4/lSOQk6
	 T4hlgS155pGs6TlhfBgR9ko7kU50wSJPPimtdurx+0XPdNZa5DUQpOGuM0qN14/w9EQqn
	 YkuC29FWB1PE6PBV6sL9RaaeGJ9uTKUIpX9wYUtDsOHmZyZWlli4V1dSV8v8W5vm/QZS8
	 5f8KQE7xlVLwZMPiHUjvgfs53MnKZ4ss+xVgONsKKtbA5mF4I6+yWAa96QyXOJI0v0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--eagleshaw.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Kw232SXE;
	arc=none smtp.remote-ip=209.85.219.71
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56166606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:54:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56166606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--eagleshaw.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Kw232SXE
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9210a12765eso13019836d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794930872; x=1795535672; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+exUxtgPdVBwoKR5r/DiwCvHxmnKqLuiNXXsjqjObOo=;
        b=Kw232SXEqQB/sRXu4G798/Ok4AHHylVlXdQ8W3R7eXXCzcexSel+ae5s/iW+fOcpYU
         Ncgi9Pw0b4rtqhulcadpOfz3RT0ECGQfW7lfE1RJiQ3w9ujU9y+0KdoHOOfLKI9ecR7o
         yCwzZsOGpG04AX7/HSOZYeVT8HUD7aI/Xm6jhak/He6AwIMR2qZcYup6xBbTevEFmCxo
         YOYZvgcFbu7JXUdM483nOp9FBGnIjuJrf8EyRTE5Vqr/B2g9Q63z6GG7rZQQ3ALmO0Ga
         koa9EKamvpTef7pKzb3bVc1PHOgsyh0EGGAl2HLKZZ9gTNrTqTWKYqTfpV4AcQBwO0If
         U/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794930872; x=1795535672;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+exUxtgPdVBwoKR5r/DiwCvHxmnKqLuiNXXsjqjObOo=;
        b=UXiNOClEk4KybNypOaezQmBZkqNa5SEXoiHYCDaijtS0vU0hoJYdzsal7voQ8VIaz5
         oMp/Nnmt7jJyDtQDNFjTLQJW2p/t8WvJW5bWaZs8TGst7yEnoja/4ODAank22owSfuFy
         ouNGLRaiIxFxRqUqRXLgrnD1QQAuFKA23masVqxTB7L4Z/UFOyaMhEEW4/iitrVIBpWx
         uovVhz0oCn1x1PWoKo9gb03qMUopvuA2kJ2bQfK+/N+uk6t8Wrfh9I3QhlOLpt4rtpBK
         QrRsLB3AuxltgGrV1uIFYvLWYR2OgbsMr4lqfYqjPfRrq4Odyc53O9k2tWrr/n6fC8rG
         NjLg==
X-Forwarded-Encrypted: i=1; AL+hErEQS8E/vIPkYNkjxeaaPBlbGowkc/EijocOh/BZvqtHRpeRpKGSmRlzentBSpSSlRvhtAm5dZ+oqkIB0FE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VOiACEY2s57Xs0vG0izVz9T1lL7pdiOXNG4dQuwYn1YNZbFmO
	ckn5hvrz+g+nQwe1egFFA7gLck1n2264IbpdLp/lPbkGCC8Qld4mxxm+QAUyRlRpJFb4BHQWuOD
	YwtNiK5twIXWghMslfg==
X-Received: from qvbpe4.prod.google.com ([2002:a05:6214:4944:b0:91f:2759:c36b])
 (user=eagleshaw job=prod-delivery.src-stubby-dispatcher) by
 2002:ad4:5cec:0:b0:91f:2abb:a791 with SMTP id 6a1803df08f44-91f2abbad25mr212446406d6.20.1794930871987;
 Tue, 17 Nov 2026 07:54:31 -0800 (PST)
Date: Tue, 17 Nov 2026 15:54:31 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261117155431.1654298-1-eagleshaw@google.com>
Subject: [PATCH] dma-buf: heaps: system: zero pages after set_memory_decrypted()
From: Ying Xiao <eagleshaw@google.com>
To: Sumit Semwal <sumit.semwal@linaro.org>, "T . J . Mercier" <tjmercier@google.com>, 
	Jiri Pirko <jiri@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Philipp Stanner <phasta@kernel.org>, 
	Jacob Moroni <jmoroni@google.com>, Xuehao Hu <xuehaohu@google.com>, 
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	Ying Xiao <eagleshaw@google.com>
Content-Type: text/plain; charset="UTF-8"

system_heap_allocate() allocates pages via order_flags[] with __GFP_ZERO
while the direct map still has the memory encryption bit set. For the
system_cc_shared heap, set_memory_decrypted() subsequently clears the
encryption bit without re-zeroing, leaving ciphertext in DRAM on
confidential computing (CoCo) guests instead of plaintext zeros.

Skip __GFP_ZERO during alloc_pages() for cc_shared allocations, and zero
the pages once in system_heap_set_page_decrypted() after
set_memory_decrypted() succeeds.

Fixes: 78b30c50a7ac ("dma-buf: heaps: system: add system_cc_shared heap for explicitly shared memory")
Reviewed-by: Jacob Moroni <jmoroni@google.com>
Signed-off-by: Ying Xiao <eagleshaw@google.com>
---
 drivers/dma-buf/heaps/system_heap.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index c8959eadc71d..5f98d0df11e7 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -72,11 +72,19 @@ static int system_heap_set_page_decrypted(struct page *page)
 	int ret;
 
 	ret = set_memory_decrypted(addr, nr_pages);
-	if (ret)
+	if (ret) {
 		pr_warn_ratelimited("dma-buf system heap: failed to decrypt page at %p\n",
 				    page_address(page));
+		return ret;
+	}
 
-	return ret;
+	/*
+	 * Clearing the encryption bit does not clear DRAM, leaving ciphertext
+	 * from when the page was encrypted. Zero it now that it is decrypted.
+	 */
+	memset((void *)addr, 0, (size_t)nr_pages << PAGE_SHIFT);
+
+	return 0;
 }
 
 static int system_heap_set_page_encrypted(struct page *page)
@@ -376,7 +384,8 @@ static const struct dma_buf_ops system_heap_buf_ops = {
 };
 
 static struct page *alloc_largest_available(unsigned long size,
-					    unsigned int max_order)
+					    unsigned int max_order,
+					    bool cc_shared)
 {
 	struct page *page;
 	int i;
@@ -388,6 +397,12 @@ static struct page *alloc_largest_available(unsigned long size,
 		if (max_order < orders[i])
 			continue;
 		flags = order_flags[i];
+		/*
+		 * Zeroing while encrypted is wasted since decryption leaves
+		 * ciphertext; system_heap_set_page_decrypted() zeroes instead.
+		 */
+		if (cc_shared)
+			flags &= ~__GFP_ZERO;
 		if (mem_accounting)
 			flags |= __GFP_ACCOUNT;
 		page = alloc_pages(flags, orders[i]);
@@ -438,7 +453,8 @@ static struct dma_buf *system_heap_allocate(struct dma_heap *heap,
 			goto free_buffer;
 		}
 
-		page = alloc_largest_available(size_remaining, max_order);
+		page = alloc_largest_available(size_remaining, max_order,
+					       cc_shared_buffer(buffer));
 		if (!page)
 			goto free_buffer;
 
-- 
2.56.0.679.gc527c65306-goog

