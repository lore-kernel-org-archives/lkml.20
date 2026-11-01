Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793514053;
	b=b8PdQgB5cE7IYrutOai9F+NuEvdqpZiKRo+O1T9GQKHuZXUD/Y3ILcNAju18VfhGvxyN
	 mPOwtMy/ss0WYXGWfBWZ0NTHAirONF5qA/G9A+qEHH8Np5EqzsVzC1Upk2iowZOoOq7Hx
	 ZifGaO9bhCs94tG4iFAgJzvI8U8nLR4ivhkMjfsjk/XVcP/o0FYvkTK2RGMmbtWwWq2Cn
	 KHH0x2eyiCU64h1/FBA11xzImtKeBfGhwfcZIQBrcuZwbShR3KfE9ax+UUUJNPbW2mC6v
	 uLHUDZo0L6je/Sn4UrsdCBS7eIPQ2r0C+uUu7pbYmmAeZ21MTo+bXkgI1hYsVgsByuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793514053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=IYshlx1rrOjmioOuAid1HYQHTMbhnYO1NumeTZBupyw=;
	b=08buywlZdp2J4SPNlF/4uony3RXJxt8W2yZ3AeB15IBWv92FNU2S00KIdkwcZo47gBRl
	 sNKVgz9yVNyqUGGnfM1Rtg7/KR/G7WeES5owzOFB/9dKWAtinuajPXEB78DEfh3e+M0Nd
	 gOkI6tK2WzjM0VHTNv16jS82ZvtuiQ7CjZ1+1mUgy58k33ljn4mmBsn8A8oi8+xLTv8R3
	 o6NyW583/aPrYU3W1h5BBtPQIn9iTCOd/alImm9NRP/Y/29ODqx9S53d/J05BfUzl82+k
	 7OwciyiObLC233YS1uMaiJ33qXz6rQcuxb0yE161IJkkO9qMIPCRG9fv5ExMDQ3Z6cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XbWkVcSS;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305B360A260C
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 06:20:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 305B360A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XbWkVcSS
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a223755e4so8512782eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 23:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793514052; x=1794118852; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IYshlx1rrOjmioOuAid1HYQHTMbhnYO1NumeTZBupyw=;
        b=XbWkVcSSHCPOe/uDVhoGNtnaUmBqv/17tlsucC5WEoCnM4se00HO6irUbzq6Z133V5
         qn2//bX6+EWkXZYsSR0xR10Q6W73jK14HL2nCcZH91xZ/4pgv0oYIfy4geCUOeFzUx1g
         vjYHObDM8lRbS0CQlXoZR1oaULDG7TjU0xgZ5uZ+BM3s8gz9lS223+A49sn0cBPtAu7G
         H2v3XNbgGvVcEpd3evCKKNjyDCQNMjRmo0RuENlp0qH1ZoPj9TzCjG2MmbZCAcDCkCl3
         95Il+mn1lTPTKiqhy+vfFOmRlRCWF5yRjU542XwO1N9w/I+iw687bHdu0gi+JQOKYmYK
         lBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793514052; x=1794118852;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IYshlx1rrOjmioOuAid1HYQHTMbhnYO1NumeTZBupyw=;
        b=QewASk2jadNUi/RVlkBgNHXGlCYG058hADaFfKN/vN3MNqDGZrk1FVsBKFonNWQHut
         aCxxiNMpPZDqtMVClc0cTRhIHHY+fnOp4wn01nktPWnl+v73WjU2FUxVNMYT6pLt3sOw
         /nXc4Lx4E+Mkk9nNsZQcgT3KN6uucK9RX9Ws2quSDWOIVSwgw23p2ci3qGT+ZZ3Wxvu/
         3TN7A75o+aLi9Yqz3eQSdrQMQ6rYBz/CPclRET5vOpL2scGvYZlzGQoYFzqUXKRbWrk9
         WXQ8/hOTYy+KerJA3bnk+3aQjoNsSo6HZKgAC26wB1v4Tf2qYWyKesLbfDT1qJnUNOc9
         M49A==
X-Forwarded-Encrypted: i=1; AKwUvBzoNzbJbdUhR4XvrcvfGrEaSpde+1wvAL1OFqjfyrod6vTBqHndByLsBIuJHu+vulttxBV6Xki1hriXo+E=@vger.kernel.org
X-Gm-Message-State: APuU4Z83i8CmqU7D49VODG9yIrkoSL0V+u2jcjNlEmP2Qwffixzu2B3y
	Px47eOUZA2Rxr0FBBRvBC41TIVZZRvVIHSTO5dGAd9jQqCDpWuDfBg8dM5hviIgPinPnYVYMw5x
	ahCZpqpEH1ocafaIDfoNelOUJPQ==
X-Received: from dycng18.prod.google.com ([2002:a05:7300:ce12:b0:36a:1148:43f8])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:2504:b0:36a:8a6:6916 with SMTP id 5a478bee46e88-36a4236f746mr9770764eec.18.1793514051896;
 Sat, 31 Oct 2026 23:20:51 -0700 (PDT)
Date: Sun,  1 Nov 2026 06:20:49 +0000
In-Reply-To: <20261101062049.998160-1-almasrymina@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261101062049.998160-1-almasrymina@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261101062049.998160-3-almasrymina@google.com>
Subject: [PATCH v2 2/2] vfio: selftests: Test BAR write faults after clear_refs
From: Mina Almasry <almasrymina@google.com>
To: Peter Xu <peterx@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Alex Williamson <alex@shazbot.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, David Matlack <dmatlack@google.com>, 
	Shuah Khan <shuah@kernel.org>, Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>
Content-Type: text/plain; charset="UTF-8"

Add a regression test in vfio_pci_device_test to verify that huge_fault
on writable MAP_SHARED VFIO PCI BAR mappings handles write faults after
soft-dirty tracking clears VM_SOFTDIRTY and downgrades vma->vm_page_prot
to read-only via /proc/self/clear_refs ("4").

Specifically, for each mappable read/write BAR (already aligned up to
SZ_1G by vfio_pci_bar_map() with MADV_HUGEPAGE), verify both:

1. Read-then-write fault sequence after clear_refs, exercising in-place
   huge PMD/PUD write-protection upgrade via wp_huge_pmd()/wp_huge_pud().
2. Direct initial write fault on a freshly mapped unpopulated BAR VMA
   after clear_refs, exercising vmf_insert_pfn_pmd()/vmf_insert_pfn_pud()
   with FAULT_FLAG_WRITE set.

Skip gracefully when /proc/self/clear_refs is absent or soft-dirty
tracking (CONFIG_MEM_SOFT_DIRTY) is disabled, or when the device exposes
no mappable read/write BARs.

Cc: David Matlack <dmatlack@google.com>
Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 .../selftests/vfio/vfio_pci_device_test.c     | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/tools/testing/selftests/vfio/vfio_pci_device_test.c b/tools/testing/selftests/vfio/vfio_pci_device_test.c
index 93c11fd5e081..75ccc557efb9 100644
--- a/tools/testing/selftests/vfio/vfio_pci_device_test.c
+++ b/tools/testing/selftests/vfio/vfio_pci_device_test.c
@@ -1,10 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0-only
+#include <errno.h>
 #include <fcntl.h>
 #include <stdlib.h>
+#include <unistd.h>
 
 #include <sys/ioctl.h>
 #include <sys/mman.h>
 
+#include <linux/compiler.h>
 #include <linux/limits.h>
 #include <linux/pci_regs.h>
 #include <linux/sizes.h>
@@ -102,6 +105,86 @@ TEST_F(vfio_pci_device_test, validate_bars)
 	}
 }
 
+static int clear_soft_dirty_refs(void)
+{
+	ssize_t ret;
+	int fd;
+
+	fd = open("/proc/self/clear_refs", O_WRONLY);
+	if (fd < 0)
+		return -errno;
+
+	ret = write(fd, "4\n", 2);
+	if (ret < 0)
+		ret = -errno;
+	else
+		VFIO_ASSERT_EQ(ret, 2);
+
+	VFIO_ASSERT_EQ(close(fd), 0);
+	return ret < 0 ? ret : 0;
+}
+
+TEST_F(vfio_pci_device_test, bar_write_fault_after_clear_refs)
+{
+	const u32 rw_mmap_flags = VFIO_REGION_INFO_FLAG_MMAP |
+				  VFIO_REGION_INFO_FLAG_READ |
+				  VFIO_REGION_INFO_FLAG_WRITE;
+	struct vfio_pci_bar *bar;
+	bool tested = false;
+	int ret, i;
+	u32 val;
+
+	ret = clear_soft_dirty_refs();
+	if (ret == -ENOENT || ret == -EINVAL)
+		SKIP(return, "soft-dirty clear_refs unsupported (%d)\n", ret);
+	ASSERT_EQ(0, ret);
+
+	vfio_pci_cmd_set(self->device, PCI_COMMAND_MEMORY);
+
+	for (i = 0; i < PCI_STD_NUM_BARS; i++) {
+		void *vaddr;
+
+		bar = &self->device->bars[i];
+		if ((bar->info.flags & rw_mmap_flags) != rw_mmap_flags)
+			continue;
+
+		ASSERT_NE(NULL, bar->vaddr);
+
+		/*
+		 * clear_soft_dirty_refs() stripped write permissions from
+		 * vma->vm_page_prot on the unpopulated BAR mapping created by
+		 * vfio_pci_device_init(). Fault it read-only first, then write
+		 * to exercise in-place write-upgrade (wp_huge_pmd/wp_huge_pud).
+		 */
+		val = READ_ONCE(*(u32 *)bar->vaddr);
+		WRITE_ONCE(*(u32 *)bar->vaddr, val);
+
+		/*
+		 * Replace the VMA with a fresh unpopulated mapping at the same
+		 * hugepage-aligned address, clear soft-dirty again, and fault
+		 * with an immediate store to exercise initial write insertion
+		 * (vmf_insert_pfn_pmd/pud with write=true).
+		 */
+		vaddr = mmap(bar->vaddr, bar->info.size, PROT_READ | PROT_WRITE,
+			     MAP_SHARED | MAP_FIXED, self->device->fd,
+			     bar->info.offset);
+		ASSERT_EQ(bar->vaddr, vaddr);
+		madvise(bar->vaddr, bar->info.size, MADV_HUGEPAGE);
+
+		ASSERT_EQ(0, clear_soft_dirty_refs());
+
+		WRITE_ONCE(*(u32 *)bar->vaddr, val);
+		(void)READ_ONCE(*(u32 *)bar->vaddr);
+
+		tested = true;
+	}
+
+	vfio_pci_cmd_clear(self->device, PCI_COMMAND_MEMORY);
+
+	if (!tested)
+		SKIP(return, "No mappable read/write BAR on %s\n", device_bdf);
+}
+
 FIXTURE(vfio_pci_irq_test) {
 	struct iommu *iommu;
 	struct vfio_pci_device *device;
-- 
2.56.0.385.gac671c819a-goog

