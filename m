Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660691;
	b=w+r5bV5/ZEoem567SxeLzlEfQuZ8u1kXGJUm0kBPZIuwqO6394ecdr4z/giPdCL4x7z8
	 3e3iau/mnUDuPOFQ9EAesmxJ5oGqbRna5vK+bDxqSJvsxkY+b/h/TKD+wEjCmQn5qjsea
	 DYJwYoJbSszRU7l2E+WHCYZfpokcIjAXkiKkJI/QwBSt9+QCwlME68Y4jRiwP/3lH/Ib+
	 foi/9hDrxGZE990+BbjoqyzmvPS2BzprSd0Iz5EpDe12aRqxPLf7U4WJjo6XNyKM8JUXe
	 hI7TP+Q6GX+h2Wou1jJT/hsai+P/PDiqiGCKwo/8UXHtJJFG0ck5d/6vPw6jLo7VO3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660691;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=4ItxlYeVr4jZp+R3NA96zGYrogcZtie35UBh8ObNtXk=;
	b=f81Sv9gchjNdMYRQaa0XjenyoXEZiqkgh5x90EWgNLHImd1SuSAIhXW2m1/wgmDQ6lAl
	 y2GExomnCV3XT6IGrkB9szkt2jEr3xmfmpcmd7tsZ+3Q/I161to8rTfi63mPlZoh3/efZ
	 OSsyCcPsXe+WKg8grTxMg3nL186HedWS58NVEmB7rypHwgXOI7FbYsncnE46Nd14vtu00
	 DJ2WG+G9YJP5aSQ+XvsTlrrEA8SpDlgSnW4hq8aftYulkArVDvqT766mpbAGCavfwMj0B
	 xlbjC1pkvHHt3un+oTQySztlTU/L9uOKyZ0cLfkqesp3p6IE4reMOLpZsDU6IIxUg0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="M0r/z25K";
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBEA606D82D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 23:04:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFBEA606D82D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=M0r/z25K
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so6788680eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 15:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793660690; x=1794265490; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ItxlYeVr4jZp+R3NA96zGYrogcZtie35UBh8ObNtXk=;
        b=M0r/z25KaiUhDnTQ4GDlHUz/MJMq61W1P5hPJqoT1x4rmzyRP0H5eD0xBnsLGEVO9m
         QRVbJ5ojg/NovNjVzPbqDo9LeydmHq3xE/y9z+KWBTWSdQN087GlDk69PEjbNZB6E6Uw
         94yz8ZJSNfo23LDgURJ8KSZCo1dXXu79m+mNHAwIlUHq2eTWmPKIzmp8BTJcTzl/9Uf2
         9dz6J1n2Jq/TXWHs2cs1J6ZMM3fTJRbOL6W3FRqEDXqZSzot1PzfNoh16Uvtn37DGlNN
         1dtn1V8k83LekNVDtGlgv/n0r0ljKnb00qYo0t0+RN872TnNKJPYthEk3TSjsRfi/IHW
         dfXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793660690; x=1794265490;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ItxlYeVr4jZp+R3NA96zGYrogcZtie35UBh8ObNtXk=;
        b=RYwlRla8ZX8GUUmyp1bYAUbX3+rs5U+247oGRcF3O7cV0jUVxqhtlNUXq1I3y1ZhQK
         Ma1kFi19/IgaQCN9vVHcfIfRNrxe6VivLPlnkbkB248Cd2jkKDAwKKgTtERj9t0gW5+g
         bVlIXQ2SC8MaSH/qBG1FzBrXx7Y7BWTPXSiJPf+1hHD/h4FhdbeSiWFGOU19IImWi2yY
         dXEkVq+9l/TUCmwm2UAHsBQO++cXqU0Hya1m/+yTwYEIMMUzS0bAFqWAqqo8/rGYHof+
         uukpXKmxkshYy+tR8fTmCWd2kn5wGZrOvAM3ALkxKC0H6NRVGgokGAn1A+K+WAyrwSiO
         zs0w==
X-Forwarded-Encrypted: i=1; AKwUvBw8GpOlOR4XpaJZGzTJ5+P1tl26JxLeBirpz0TUW2rTIIrUTI0DvpcvQIk1nr1ylVy0kv64gzLkBWatPQw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Z18KSw1c/z/+Sw0vBffD9NOgVtapOcRWaqHdDEyx8cYq0BZ+r
	TkXPjbyk/KNHMmCo5UOBYp7hv1cGm6PPJv7Q9UwbZkbma62D1gZ6a2XpngdB8PgymUDSPU5lW5z
	jSMcS+BFgg5h39zrj5Nmb8S553A==
X-Received: from dyec15.prod.google.com ([2002:a05:7300:220f:b0:369:45ee:40a0])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:ae18:b0:369:f035:661 with SMTP id 5a478bee46e88-36a42389027mr14414309eec.15.1793660689624;
 Mon, 02 Nov 2026 15:04:49 -0800 (PST)
Date: Mon,  2 Nov 2026 23:04:45 +0000
In-Reply-To: <20261102230445.3993629-1-almasrymina@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261102230445.3993629-1-almasrymina@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261102230445.3993629-4-almasrymina@google.com>
Subject: [PATCH v3 3/3] vfio: selftests: Test BAR write faults after clear_refs
From: Mina Almasry <almasrymina@google.com>
To: Peter Xu <peterx@redhat.com>, Alex Williamson <alex@shazbot.org>, 
	Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, David Matlack <dmatlack@google.com>, 
	Shuah Khan <shuah@kernel.org>, Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Raghavendra Rao Ananta <rananta@google.com>, Vipin Sharma <vipinsh@google.com>, Alex Mastro <amastro@fb.com>, 
	Matt Evans <matt@ozlabs.org>
Content-Type: text/plain; charset="UTF-8"

Add a regression test in vfio_pci_device_test to verify that huge_fault
on writable MAP_SHARED VFIO PCI BAR mappings handles write faults after
soft-dirty tracking clears VM_SOFTDIRTY and downgrades vma->vm_page_prot
to read-only via /proc/self/clear_refs ("4").

Use vfio_pci_find_mem_bar() to locate a memory-backed BAR of at least
2 MiB that is safe to read and write, and zap existing BAR mappings via
PCI_COMMAND_MEMORY before each sub-test to verify both:

1. Read-then-write fault sequence after clear_refs, exercising in-place
   huge PMD/PUD write-protection upgrade via wp_huge_pmd()/wp_huge_pud().
2. Direct initial write fault on an unpopulated BAR VMA after clear_refs,
   exercising vmf_insert_pfn_pmd()/vmf_insert_pfn_pud() with
   FAULT_FLAG_WRITE set.

Skip gracefully when the device has no known memory-backed BAR >= 2 MiB
or when /proc/self/clear_refs soft-dirty tracking (CONFIG_MEM_SOFT_DIRTY)
is unavailable.

Suggested-by: Alex Williamson <alex@shazbot.org>
Cc: David Matlack <dmatlack@google.com>
Cc: Matt Evans <matt@ozlabs.org>
Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 .../selftests/vfio/vfio_pci_device_test.c     | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/tools/testing/selftests/vfio/vfio_pci_device_test.c b/tools/testing/selftests/vfio/vfio_pci_device_test.c
index 93c11fd5e081..323a316f59e7 100644
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
@@ -102,6 +105,68 @@ TEST_F(vfio_pci_device_test, validate_bars)
 	}
 }
 
+static void zap_bar_mappings(struct vfio_pci_device *device)
+{
+	vfio_pci_cmd_clear(device, PCI_COMMAND_MEMORY);
+	vfio_pci_cmd_set(device, PCI_COMMAND_MEMORY);
+}
+
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
+	struct vfio_pci_mem_bar mem_bar;
+	int ret;
+	u32 val;
+
+	if (!vfio_pci_find_mem_bar(self->device, SZ_2M, &mem_bar))
+		SKIP(return, "No memory-backed BAR >= 2M on %s\n", device_bdf);
+
+	zap_bar_mappings(self->device);
+
+	ret = clear_soft_dirty_refs();
+	if (ret == -ENOENT || ret == -EINVAL)
+		SKIP(return, "soft-dirty clear_refs unsupported (%d)\n", ret);
+	ASSERT_EQ(0, ret);
+
+	/*
+	 * clear_soft_dirty_refs() stripped write permissions from
+	 * vma->vm_page_prot on the unpopulated BAR mapping. Fault it read-only
+	 * first, then write to exercise in-place write-upgrade
+	 * (wp_huge_pmd/wp_huge_pud).
+	 */
+	val = READ_ONCE(*(u32 *)mem_bar.vaddr);
+	WRITE_ONCE(*(u32 *)mem_bar.vaddr, val);
+
+	/*
+	 * Zap the BAR PTEs/PMDs, clear soft-dirty again, and fault with an
+	 * immediate store to exercise initial write insertion
+	 * (vmf_insert_pfn_pmd/pud with write=true).
+	 */
+	zap_bar_mappings(self->device);
+	ASSERT_EQ(0, clear_soft_dirty_refs());
+
+	WRITE_ONCE(*(u32 *)mem_bar.vaddr, val);
+	(void)READ_ONCE(*(u32 *)mem_bar.vaddr);
+}
+
 FIXTURE(vfio_pci_irq_test) {
 	struct iommu *iommu;
 	struct vfio_pci_device *device;
-- 
2.56.0.385.gac671c819a-goog

