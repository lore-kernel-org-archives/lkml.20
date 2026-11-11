Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794425059;
	b=nXO8txPLlhmAamTICRGNBFvyi2mOss5BO5vtbtv3ysuihR2Cqkl5Id+rq/3kgVjpCYlr
	 wHxl4I0TbunE7pOOHJ66Zyav9UxNCtkiB3+yhyJfLC6Ijizm+IESks43Ejrtr90kpdh6f
	 jtR2BU3OjGWwfdKwECVdth+OlPJUG0zfNO0+ZNjcsp2XD/ISqeuIFfq4zAe9iCWLeAWLR
	 KjGu5oaMUtskby9GSaG2L9swsWxltPBy3TO7k1EZpCciR98H/37u+acuxZXE+P/Bs1hch
	 OZ1lTGKC5E4GYDIyhiCKsZO5hwS+hZxSCw8H9/udU+iCNDDTFMKuWUYt6H/6yMaCSKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794425059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=s6lt1PxCFx0agGLbXpFKlY/hoUAzM5xkPqAiIkWnGNA=;
	b=mCCH57YKOXxUcuk8oJrcP4xO+z6tDzNU5OMswMvoFdxvOOPxBZMAqNi2zoM/Pt6obKph
	 I4VLN0m/0d409VXB/FQ9JEUqMIRfy/apo8BXZHQMW8oibw4pOJu3BWU7f3ZnNARoPLGRs
	 5mYeYgVbVdY0FJPIPHRc96wlzeXVNZy7yZr3wH0KKgzgUNzHVA54K+GrHtqLSgwo3/GoS
	 aFmylNxGt456p5pl7KiJxkJXcsDeJOUZAh4WyfLoZO01qNN47y1Hqdebi5VnVFnURcxYR
	 78sVhL7h1oWy2PkD6JHwYcYUtadQzuiaY/24ozzGJbJuKwihsnSYAlCMcjnV9aWh3Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UOq3nT8j;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CDD606DD5A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:24:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31CDD606DD5A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UOq3nT8j
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4c734afb8deso4002096b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794425058; x=1795029858; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s6lt1PxCFx0agGLbXpFKlY/hoUAzM5xkPqAiIkWnGNA=;
        b=UOq3nT8jfNIxrMk+znyvt21C9lwSewOGrh1jpeVu5iK5VmdqJeDT4fPjN6nDS+s/rz
         E6Ho+bO3iAXvXkGBGN7CjciNZSs05x40V5C4Z9f0REOobKvYRI7U+31LkNo568hjhRz2
         VA+FxI4lBIGhJ+ugD1He8j+J8VFk+dt26q+Q+oobnfzOprmYbN898bflauRMBfEEy4rd
         5Njig5Se7CnUBaBXRSmjOERE/lZ83r/qYtfGEy9EiotAynG+Zijcmr8jieR2cggp/ebU
         BtjWu6T0pL3mwZ94u0gf7+eonYPgaPav+OYjwJPpOUc8KIt158SxR+gGtte9ruBukesx
         e0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794425058; x=1795029858;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s6lt1PxCFx0agGLbXpFKlY/hoUAzM5xkPqAiIkWnGNA=;
        b=aE6FEM0S+3VBD0yN/cF/6IArvsSVP3qAXcCw6FgR3NWOJFNiYoHRF6Z7jkGVxgpSvj
         93Gq5cWUegkE/eU5VZCowsSLiOoWCvT2x7H5sdxXC86Dw6tIlia0ayNfPZ76gTCvQUMj
         kdEC4eViV+bK+3LVeXQMvnTZOZDqXWBpeB0MBkRCplSs6nEbUjrqSC0U3XM8RABnAbSm
         1bt/Nb5/6I50y0r3qps4FWnQnSAjfh5G+t0Bp6x1mSXX2pte31Bv/wfk03izndgGfOA4
         JSGQGUhzo1ovbVcTOg3sUE1F7Nk0YUPb5rpn+UfTuKO7ocSka1wnkMIv4Msxfc1zc1tp
         4t5w==
X-Forwarded-Encrypted: i=1; AL+hErE7Ukftz7tIsrYkLKYhUhuUBMZr9AyxG/Wtmnht0sWHT6Jtpt8jhJdAMO1zypDU8W3zJxcefHKCVaZD7zw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pe1OMHPDlLiJ2VEGNPBoyfQ1h6h4tqp4En94fr4HOCIuY8n5k
	P7eiHwtXZX7N+Tn+DTltSwUk28+PFqS2R3SuL2Dxmo8JTU6t2XsxSPTQiZm4MGMl43yJXDzXNyT
	aGgWXVrpDdxzSUw==
X-Received: from iltr6.prod.google.com ([2002:a92:c5a6:0:b0:542:f469:6209])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:23c7:b0:568:e5f:5dbe with SMTP id 5614622812f47-56b97d0f43cmr3278637b6e.61.1794425058062;
 Wed, 11 Nov 2026 11:24:18 -0800 (PST)
Date: Wed, 11 Nov 2026 19:24:06 +0000
In-Reply-To: <20261111192411.4133780-1-dmatlack@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111192411.4133780-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261111192411.4133780-3-dmatlack@google.com>
Subject: [RFC PATCH 2/7] vfio: selftests: Verify memory behavior in vfio_pci_find_mem_bar()
From: David Matlack <dmatlack@google.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux.dev, 
	kvm@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org
Cc: Alex Mastro <amastro@fb.com>, Alex Williamson <alex@shazbot.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, David Matlack <dmatlack@google.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Josh Hilke <jrhilke@google.com>, Kevin Tian <kevin.tian@intel.com>, 
	Leon Romanovsky <leon@kernel.org>, Logan Gunthorpe <logang@deltatee.com>, Matt Evans <mattev@meta.com>, 
	Matt Evans <matt@ozlabs.org>, Mina Almasry <almasrymina@google.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"

Write and read back test patterns before returning a BAR from
vfio_pci_find_mem_bar(), restoring the original contents and
PCI_COMMAND_MEMORY state afterward.

QEMU's pci-testdev exposes a readable, writable, mmap-capable BAR2
whenever membar=<size> is passed, even if membar-backed=on was omitted
and accesses are dropped as unimplemented MMIO. Probing the BAR upfront
lets callers skip cleanly instead of failing later DMA or fault checks.

Suggested-by: Alex Williamson <alex@shazbot.org>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 .../selftests/vfio/lib/vfio_pci_device.c      | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/tools/testing/selftests/vfio/lib/vfio_pci_device.c b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
index d5308fe61490..9840463594ab 100644
--- a/tools/testing/selftests/vfio/lib/vfio_pci_device.c
+++ b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
@@ -13,6 +13,7 @@
 #include <sys/mman.h>
 
 #include <linux/align.h>
+#include <linux/io.h>
 #include <linux/iommufd.h>
 #include <linux/kernel.h>
 #include <linux/limits.h>
@@ -265,6 +266,33 @@ static const struct vfio_pci_mem_bar_desc mem_bar_descs[] = {
 	},
 };
 
+static bool vfio_pci_mem_bar_verify(struct vfio_pci_device *device, void *vaddr)
+{
+	const u64 pattern = 0x55aa55aa55aa55aaULL;
+	u16 orig_cmd;
+	u64 orig;
+	bool ok;
+
+	orig_cmd = vfio_pci_config_readw(device, PCI_COMMAND);
+	if (!(orig_cmd & PCI_COMMAND_MEMORY))
+		vfio_pci_config_writew(device, PCI_COMMAND,
+				       orig_cmd | PCI_COMMAND_MEMORY);
+
+	orig = readq(vaddr);
+	writeq(pattern, vaddr);
+	ok = (readq(vaddr) == pattern);
+	if (ok) {
+		writeq(~pattern, vaddr);
+		ok = (readq(vaddr) == ~pattern);
+	}
+	writeq(orig, vaddr);
+
+	if (!(orig_cmd & PCI_COMMAND_MEMORY))
+		vfio_pci_config_writew(device, PCI_COMMAND, orig_cmd);
+
+	return ok;
+}
+
 bool vfio_pci_find_mem_bar(struct vfio_pci_device *device, u64 min_size,
 			   struct vfio_pci_mem_bar *mem_bar)
 {
@@ -273,6 +301,8 @@ bool vfio_pci_find_mem_bar(struct vfio_pci_device *device, u64 min_size,
 				  VFIO_REGION_INFO_FLAG_WRITE;
 	size_t i;
 
+	min_size = max_t(u64, min_size, sizeof(u64));
+
 	for (i = 0; i < ARRAY_SIZE(mem_bar_descs); i++) {
 		const struct vfio_pci_mem_bar_desc *desc = &mem_bar_descs[i];
 		struct vfio_pci_bar *bar;
@@ -300,6 +330,9 @@ bool vfio_pci_find_mem_bar(struct vfio_pci_device *device, u64 min_size,
 		if (size < min_size)
 			continue;
 
+		if (!vfio_pci_mem_bar_verify(device, bar->vaddr + desc->offset))
+			continue;
+
 		*mem_bar = (struct vfio_pci_mem_bar){
 			.bar = bar,
 			.vaddr = bar->vaddr + desc->offset,
-- 
2.56.0.567.gdb80ae8cd5-goog

