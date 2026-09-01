Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC0747254E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253068; cv=none; b=pzXILtPhCKI/5KviVGvU6az4D2P48bYzzocGnAm30YzRfMdjR2Mcm0IrL3DprJoCKDTJWkrUkKCv5P2QAT1DB/k1f7KOECr0eQbl7dqOVvvA+mlHiI/y5oTtzfJDoMR5DUFY2Fuk+tjhm1Z9gBu9f3JvourV3H3jCvJ3B0iF/FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253068; c=relaxed/simple;
	bh=JO8G9CpZ5mFnr5uu8P/fwBgO7hqk1L/vH8rl1o2iSZ8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZFGSH44vYXlK6NYXI3GGoZicuZ86Ngx0L6gvPr+iwP+kzRYGvAWgL95dGQMHlTGV/exE+ufWc4ZQfzZb/EcTSj0w55RM0qcofX1saPBqNGyl93bFGIYgQrJkmwuWlWfmCkLvG4cxmktm6PDH0vjMoKHEQkIfKSuRx8r0Aw/Q68g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ES6mO+6K; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ES6mO+6K"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48441a2ba14so856902f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 01:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788253065; x=1788857865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g6gNF1L2W2DbFnprEAmekbeKiRyxpCj5ws+3FN1RDWk=;
        b=ES6mO+6KtGXdpOMc4Jctqxrcrj9So1EhfoAtJSeMKJ4/HoIyhWXdDHgZYRIB/di34t
         /GgUmk4h8P81Um/mnBnrGaHowx3KcjryzXYY45VbsaGUqLMF6vaKnSo1VZFWm/3Ad+lt
         vkZVGT8trXjeJe84KUvnsEtsQWFi87bZmYj9d13fbmyWd92N15xS+p3b0KMkUIVhJgCi
         F+2qPNtn4bLaaiHTYMzfOkrNBM/IlpVSyACBHOpgJNyRuETqCQTzAqkQIllhmWvYMnWF
         AJ28Tm4ss3DIwZW/2WVKO/39y6hUY3txUqvC61O3rmTuL2jjsqgFejYWfrqBV0VLliOs
         UbjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788253065; x=1788857865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g6gNF1L2W2DbFnprEAmekbeKiRyxpCj5ws+3FN1RDWk=;
        b=ZSzutQZZe6dq6zdHBgwLlOU8W0bxVc+4YMN5TcTS2j3GDIOqmPqRaHxZwM0EThAfbx
         bHqGPvbN48dbu2RYT/1PMEPsRqu+5A7X4QzRyEk6h5wKNbCDTjEgF7Dc2NgqULkAlBxw
         saTBQD/JXdF9GEkiBFGL/xPvnPhcSOuAazIE9MFNObd3bSsHnfXbh3HUfI+bSq83904K
         eO7Cex2z7ndD8WQ7A9e4cZHc8O2bdii2ZqhjzwSdi7CZhKJcUC/Efpqdxe2o4zNyhEdR
         7GoH4w2GSsE8C7C4fv/IL92RCg//AqnvGTwdYDqIO9LX7fi9DJe7F1lESgGaOidUh6+7
         6INA==
X-Forwarded-Encrypted: i=1; AHgh+RqmSM7KpPaxh9x5TKRl8yCrI8OT7OAhzCF54BfBQifHYdMSOWThf2tvTZq5HCWWHc3awXRb8xunzNu7Bu8=@vger.kernel.org
X-Gm-Message-State: AFuF++khbAJXHa/VJsmnXm6vxAqUqnT3rPfUcio+sZLZrDKooE7BTuWN
	u31PxU1taGWir91L6ehoI+5EWgOa8HI/TINlL0ocW4Qr3IZY0TRuse6P3O/jTj9/
X-Gm-Gg: AR+sD11e4ZGL1N4wVbrwcZhS3820IWLtGbK4IjdcBvs8qUMdKS3FjbBT4ZSyPyT3bHs
	ixCLKPGMj2BcO7IS3Yoj8BsE0iwFn9+JUf4/9ln8Vk35zwIy6jcmeAhBrY7mI/f0AvfaqIV76P5
	4YUtnQ9HEQzzvkJloUEGXugE1y0dJRC0VBwexzJl6Hrm+z1UZFVDCuctEtnpf1Bse1PNMp9fFLY
	mkUir8MG9MxibJakQ9cLWIyQEc7+aWep9XrYcNMBGpMIfeEGbA8j5chwadIOC0XPW9dYdcbtZhW
	BjR4ju2rVeV6E8Gb/w0FNPlSfcATMI+RkoO9EnOako+VLGAC+1EY3813yoTxjUfVg1sXUGEVdE7
	GQkJoelJBnB+Sk/zOWcaJCJ3GN+qJogWOXA8h3mYiCp3JHHtfBCRbSTq1ygbKnsH5ZVkJYhYhqj
	xyeY7DgXry/4n/AQdTqmqt7aVkM7jlGrwZTdontkafVOl+8lwBpgHESsSJOATriFE6uu1/cIPCR
	9S+22xYt8V0HlvJ8LSlYxIK+QGxO35zKBTGhlHaNTiOQDvn6vaf5Y9ChpItlTbUKTNDlj78ONaI
	w/I0jhrjgPU6oE5j2sN0V+4OZSN8r5/sG055FPYlCpgsQ7CFnqtHFu0gkBmTeKST1mg=
X-Received: by 2002:a05:600c:4f8b:b0:49a:2c4b:403f with SMTP id 5b1f17b1804b1-49b91c46494mr428394385e9.13.1788253065376;
        Tue, 01 Sep 2026 01:57:45 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a16a-7801-fd8c-4b37-36b4-e53a.310.pool.telefonica.de. [2a02:3100:a16a:7801:fd8c:4b37:36b4:e53a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdd73f7a4sm45023365e9.12.2026.09.01.01.57.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 01 Sep 2026 01:57:44 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: mm: align hugetlb mappings to the huge page size
Date: Tue,  1 Sep 2026 10:57:40 +0200
Message-Id: <20260901085740.66283-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mmap(MAP_HUGETLB) on 32-bit Arm can return an address which is not
aligned to the huge page size. In a QEMU virt guest, unmapping the VMA
then hits the alignment check in __unmap_hugepage_range():

  kernel BUG at mm/hugetlb.c:5213!
  Internal error: Oops - BUG: 0 [#1] SMP ARM
  PC is at __unmap_hugepage_range+0x540/0x584
  LR is at __zap_vma_range+0x13a0/0x1410

Commit 7bd3f1e1a9ae ("mm: make hugetlb mappings go through
mm_get_unmapped_area_vmflags") made hugetlb mappings use the
architecture's arch_get_unmapped_area(). The generic implementations
handle hugetlb alignment, but the Arm implementations only account for
the optional SHMLBA cache-colouring constraint. A 4 KiB-page kernel can
therefore align the mapping to 4 KiB or 16 KiB instead of the required
2 MiB.

Set the alignment mask from the file's hstate for hugetlb mappings in
both Arm implementations. Huge-page alignment also satisfies the
SHMLBA constraint.

Fixes: 7bd3f1e1a9ae ("mm: make hugetlb mappings go through mm_get_unmapped_area_vmflags")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Tested an LPAE multi_v7_defconfig kernel on QEMU virt with
-cpu max,aarch64=off and -cpu cortex-a15, using both the default and
legacy VA layouts. The LTP hugemmap01/04/05/06, hugefork01/02,
hugeshmat01, hugeshmget01, and hugefallocate01 tests gave 16 TPASS and
no failures on either CPU model.

Also tested on a Raspberry Pi 400. The unpatched kernel returned a
misaligned address and became unresponsive while touching the mapping.
The patched kernel returned an aligned address, touched the full mapping,
and unmapped it cleanly.

 arch/arm/mm/mmap.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mm/mmap.c b/arch/arm/mm/mmap.c
index 3dbb383c26d54..dbb3f07a77852 100644
--- a/arch/arm/mm/mmap.c
+++ b/arch/arm/mm/mmap.c
@@ -11,6 +11,7 @@
 #include <linux/io.h>
 #include <linux/personality.h>
 #include <linux/random.h>
+#include <linux/hugetlb.h>
 #include <asm/cachetype.h>
 
 #define COLOUR_ALIGN(addr,pgoff)		\
@@ -72,7 +73,10 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 	info.length = len;
 	info.low_limit = mm->mmap_base;
 	info.high_limit = TASK_SIZE;
-	info.align_mask = do_align ? (PAGE_MASK & (SHMLBA - 1)) : 0;
+	if (filp && is_file_hugepages(filp))
+		info.align_mask = huge_page_mask_align(filp);
+	else
+		info.align_mask = do_align ? (PAGE_MASK & (SHMLBA - 1)) : 0;
 	info.align_offset = pgoff << PAGE_SHIFT;
 	return vm_unmapped_area(&info);
 }
@@ -123,7 +127,10 @@ arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr0,
 	info.length = len;
 	info.low_limit = FIRST_USER_ADDRESS;
 	info.high_limit = mm->mmap_base;
-	info.align_mask = do_align ? (PAGE_MASK & (SHMLBA - 1)) : 0;
+	if (filp && is_file_hugepages(filp))
+		info.align_mask = huge_page_mask_align(filp);
+	else
+		info.align_mask = do_align ? (PAGE_MASK & (SHMLBA - 1)) : 0;
 	info.align_offset = pgoff << PAGE_SHIFT;
 	addr = vm_unmapped_area(&info);
 
base-commit: abdf623ddb75b24659018d3952d8f61937306ae5
-- 
2.53.0
