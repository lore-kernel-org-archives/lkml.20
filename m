Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793670684;
	b=Tj2p1PMhvxHthFaj7BDQu32MYRfi8kiARz+oxIr+aPZ9NEEZ20PuCeAmMfG8r/HWfg5q
	 WCB+ferXzR7RRp7BC7iCkKmnYa9FXSAOTm3iPOXRb2i9PpSezoASP3r1pBAhfUZHVXGos
	 be8FypUe2dkYibJk4/VxomucHNtyp/fMjoltj286KEZrWi38JNlEX3wvIDCDzcBh5HO7Q
	 xsouoMf+y7mNEE6CKOM6xWByHrCcFXr9GODn5UYQHch4N4IxdUD41K8I1h9wD5/aG5ZPr
	 pXzW86isCDkKKuLY20SA612bXe3kcuxF5HzSJJLgw6M+icPhJ8qEFIvq7dlDhpU4RAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793670684;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=xjAO2eaT/JXn3CAMxY8DUMmy42acig/EBIl7/8Aipgk=;
	b=2K8hZA3ad/V2oFua3qfr3CI0Of6TotctNUsyCGWkjnh4+bCW+bX2sk91TeqpyhCzG+q6
	 yVvBfRRR7mE0IfS14F7qmw2PmovpAbe6z5qMkmpSOUb2GafNiH23TZbOndATq26JYa/T4
	 1GZSBKdB8sH05inDtudASi4tR3iOI8BY2LcP26qHOWGCa87X2w5t/dBAItSeVMPY+IPCE
	 DtLS+JKoZYSR5WCkUh2v3Mwn9UwNDYGSnWwe/0Wvk+bEw+kleFqoAQhyNGUWxmv7+wGaa
	 Y0O4QOT8XZbuNDb8qrpfF88gh4EHZ7gUEKdzbTrqBXY9gfejuGsjQCZnkZUW2qTgqCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b="t1nI1/Xa";
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77793606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 01:51:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77793606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t1nI1/Xa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=xjAO2eaT/JXn3CAMxY8DUMmy42acig/EBIl7/8Aipgk=; b=t1nI1/Xa8SYhdnl9fBMOMYPIRF
	3Yvz+su5OZQurf0W/F4prwVAxP5Z88c7QUrnVnn855vpgJRlemGbmR2RPR++heQWO+MKkcAC8LKGy
	EYT3fqODTmXnC07vzA8ebw3VuV9w4Ju4lqsxaGr0+AAwxMLDyVnK+ROrif4NBEvYCMd7GwiO3+zA8
	hLvCt9L6IcG84zN+v5h1hte9yfdPBWwXnNfV3PflqQOKxcRY/wAfIbCRSWFaB9H2xIbb77xUzj330
	NVEAa4rx/Z2mPayjCsqN3mE6BJs2rMnjRhSinT/V3FAQ/2gfoCTDkhxSYR4wctDN2T611TeUA82Nz
	uDUGZ+lA==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO3gI-00000000p3n-30ho;
	Tue, 03 Nov 2026 01:51:22 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	kasan-dev@googlegroups.com
Subject: [PATCH v2] kmsan: headers: cleanup function and parameter names
Date: Mon,  2 Nov 2026 17:51:21 -0800
Message-ID: <20261103015121.2465303-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.56.0
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

Use the correct function names and function parameter name in the
kernel-doc comments to avoid kernel-doc warnings:

Warning: include/linux/kmsan.h:146 expecting prototype for
 kmsan_map_kernel_range_noflush(). Prototype was for
 kmsan_vmap_pages_range_noflush() instead
Warning: include/linux/kmsan.h:156 expecting prototype for
 kmsan_vunmap_kernel_range_noflush(). Prototype was for
 kmsan_vunmap_range_noflush() instead

Warning: include/linux/kmsan-checks.h:72 function parameter 'to_copy' not
 described in 'kmsan_memmove'
Warning: include/linux/kmsan-checks.h:72 Excess function parameter
 'size' description in 'kmsan_memmove'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Alexander Potapenko <glider@google.com>
---
v2: add Rev-by: from Alexander; rebase & resend

Cc: Alexander Potapenko <glider@google.com>
Cc: Marco Elver <elver@google.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
Cc: kasan-dev@googlegroups.com

 include/linux/kmsan-checks.h |    2 +-
 include/linux/kmsan.h        |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

--- linux-next-20261102.orig/include/linux/kmsan-checks.h
+++ linux-next-20261102/include/linux/kmsan-checks.h
@@ -65,7 +65,7 @@ void kmsan_copy_to_user(void __user *to,
  * kmsan_memmove() - Notify KMSAN about a data copy within kernel.
  * @to:   destination address in the kernel.
  * @from: source address in the kernel.
- * @size: number of bytes to copy.
+ * @to_copy: number of bytes to copy.
  *
  * Invoked after non-instrumented version (e.g. implemented using assembly
  * code) of memmove()/memcpy() is called, in order to copy KMSAN's metadata.
--- linux-next-20261102.orig/include/linux/kmsan.h
+++ linux-next-20261102/include/linux/kmsan.h
@@ -127,7 +127,7 @@ void kmsan_kmalloc_large(const void *ptr
 void kmsan_kfree_large(const void *ptr);
 
 /**
- * kmsan_map_kernel_range_noflush() - Notify KMSAN about a vmap.
+ * kmsan_vmap_pages_range_noflush() - Notify KMSAN about a vmap.
  * @start:	start of vmapped range.
  * @end:	end of vmapped range.
  * @prot:	page protection flags used for vmap.
@@ -147,7 +147,7 @@ int __must_check kmsan_vmap_pages_range_
 						gfp_t gfp_mask);
 
 /**
- * kmsan_vunmap_kernel_range_noflush() - Notify KMSAN about a vunmap.
+ * kmsan_vunmap_range_noflush() - Notify KMSAN about a vunmap.
  * @start: start of vunmapped range.
  * @end:   end of vunmapped range.
  *
