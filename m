Received: from mail-qv1-f100.google.com (mail-qv1-f100.google.com [209.85.219.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95311479887
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789417466; cv=none; b=MTZ0aTsQuLjFGsKTkbY7RQGthezksVc3yD8Nh2jrtAQ/7nVRwXNpNf4M9fGCm1XLbdK/N4WjBjQ5Pn8rEJp5vZ/Wwlkc1f5VIniT9fmW6ku18NeA5choZUcSTMSVwI5Vxrhcp+OgXfRepLmI2dYhhRnvySuxyrx3dsCT+z/20+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789417466; c=relaxed/simple;
	bh=QzGyE3gc3NE4McPOtuP5S55HZ8A8IfEQPntOV+MpgGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y8NHC4hqWQOoWZ9Su/wC7GYJrqNtgm9U3h5o7z4nV3A7nYYM8vvPo+aqkulCHf9D72PIr3YkCIVQglYqFiupOL3vZRNXVhM5ybTIAYxXQy+9sIm6m0evfFsryDB/wiekkLVkbtyTws7IkCArR7PYsARoGuOeTiaT3nyiHkSEgVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=OkMlmVxB; arc=none smtp.client-ip=209.85.219.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="OkMlmVxB"
Received: by mail-qv1-f100.google.com with SMTP id 6a1803df08f44-9106fad6f0cso8812216d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:24:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789417462; x=1790022262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9PdHc/PVNJgEKpmU97s5aFFCrW71lWLYc+Sp0PVMH3I=;
        b=jhHygynAKjShFZCs2VMfYnQ4s4sp12e8jYlRbh1VPOiRFwvvsOlzhXW/eWLIqnBERA
         6B7KtfZm3GFVYJq8/HGX1RkCRX8wVn1108Xrxsqb+TXGl9ATeGMJfZdRvnAaO1fCYHRF
         oau1CGkfUbb2BL+G8ZVvDzSEptBx5aaT7nrx9HQPQvB2MnHWLvKzywJegiutfvC+YDq+
         9i1NiEcF2I2Yjg7S9iVBnfFBUuqZjjRoNV7zN7OPR5GgxlFqJygyjEmwfo/F6tdwDCwV
         yyAB1DvhZM0hYDY4bllwme8xLfYMasYu9TN8X1cCi3MfVM4P2mXgPydQwu6x4da6d5t1
         JOPQ==
X-Forwarded-Encrypted: i=1; AKwUvBwoVx6g9aPVsbgGYSN3DXoZ2kl34w6XnG6XRE9V9lR+5L45S4x57kLQdjeco0+XhyLS+n+yTe9TzGmNLtg=@vger.kernel.org
X-Gm-Message-State: AFuF++n+BaaPq498uvpNc0Lb8sx7FqLesMnq/QaFTNe7Q/IO1nGQc7W+
	XKWRWEvbOkGTyBTYsJawuXRraePGeRuuKatXxRSTOMIhXPN1qzufAPpamjg2jcOiFPj3rxI/wJG
	S9gWaW/XIXcAKeGdHij2lSqL6lYfUKNuZmQNJfWf3x5JPjpp6mvOx1+B3lBlroWmWawIyi3EGtm
	imosjg7WJi3UzJBUR+3stOh/7KpIUIUBjE6SmqarCWPvaCxK5cxtrl1+zlmhZNiX1kC1wXieS9p
	jpR9xBpWlAPzxTKtyMXJA==
X-Gm-Gg: AYBFou2i7M2ZRwnybOd4m3Zt6RWriY/cRJ2zqe5t8ussZ/Lr6wVGGic9VMKI9fxItge
	4mMytDdXen6oWlza00KKx0ILW2l0cZkujZtkPHchmA7CRfm+ZjpfKIQCBzeRyJi73Tj0pTM8dO6
	2v7qlcvFuF20bloQxOFwajJ9k61sdFLZq5FZgNNNGNOmya4s8eIeDcq18lCaKUauZnLrGnuHR/O
	0W0tvCXOlGAtuBasVf6lT2xGQmEn6DXZgifvP16ARiLrjFkmdj2wKJONQiOjKy0Y6YbpfQRCfpy
	tXjPMGsyKyXGwOCWEA7RF7Tt/1/eOvueeDg8SzwBzYGkLfPsOLMHPxmAKEsKJ4nU7P+RULqDh2u
	d+k3JqqM890Ejssw+EPLrNcoyxnhbY5gTopa/BFjDBfz9yvTOen9oY5wFUs3Q896sQgjpaJe0zr
	p0gSK3GOvQyUPeSmx/xpavowZF9bkwThiwiGKHca8s
X-Received: by 2002:a05:622a:1904:b0:51c:84f0:d903 with SMTP id d75a77b69052e-5310cf4eb51mr65348441cf.17.1789417462336;
        Mon, 14 Sep 2026 13:24:22 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id d75a77b69052e-530ca5134e0sm1443431cf.19.2026.09.14.13.24.22
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Sep 2026 13:24:22 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4c7f887ac6bso1276123b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789417461; x=1790022261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9PdHc/PVNJgEKpmU97s5aFFCrW71lWLYc+Sp0PVMH3I=;
        b=OkMlmVxBDf6ujDO7831RpnCzvz4ocnitJ/JT1sCzf18S/H6QMJj2dMMnh/GVN4HAub
         gTTvmONnAb5EV7zXI8HCtLruWwjzBV/BWfkvxfFnb1slZ8O4TnqzWZnulvtFp0sg/C8g
         +qhcyxS/P/t0NRGAWOEJPZCBIBM6RbtJq9uqQ=
X-Forwarded-Encrypted: i=1; AKwUvByX0C4U35SHVUQeytHI3E5b9D1zXlLiyJk2Nf/KC8CVP7CfQ6JqzdVgBQh8lJjUtvQrPtDIFDmOfAEYYP4=@vger.kernel.org
X-Received: by 2002:a05:6820:1f0f:b0:6b1:b375:481 with SMTP id 006d021491bc7-6c53bf22621mr4454250eaf.0.1789417461198;
        Mon, 14 Sep 2026 13:24:21 -0700 (PDT)
X-Received: by 2002:a05:6820:1f0f:b0:6b1:b375:481 with SMTP id 006d021491bc7-6c53bf22621mr4454212eaf.0.1789417460636;
        Mon, 14 Sep 2026 13:24:20 -0700 (PDT)
Received: from lvn-dbc2489.lvn.broadcom.net ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699bc6sm11623741fac.3.2026.09.14.13.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:24:19 -0700 (PDT)
From: Rishi Chhibber <rishi.chhibber@broadcom.com>
To: gregkh@linuxfoundation.org,
	arnd@arndb.de
Cc: bryan-bt.tan@broadcom.com,
	vishnu.dasa@broadcom.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	shuah@kernel.org,
	rdunlap@infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ajay.kaher@broadcom.com,
	alexey.makhalov@broadcom.com,
	vamsi-krishna.brahmajosyula@broadcom.com,
	yin.ding@broadcom.com,
	tapas.kundu@broadcom.com,
	Rishi Chhibber <rishi.chhibber@broadcom.com>
Subject: [PATCH v3 4/4] selftests: misc: Add vmw_zerocopy selftest
Date: Mon, 14 Sep 2026 13:22:09 -0700
Message-ID: <bdd076790dccd495db77b1e932cf2f1236090df2.1789413109.git.rishi.chhibber@broadcom.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1789413109.git.rishi.chhibber@broadcom.com>
References: <cover.1789413109.git.rishi.chhibber@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Summary of changes:
- Add tools/testing/selftests/drivers/misc/vmw_zerocopy: a
  kselftest_harness test covering the ioctl input-validation paths, plus
  its Makefile and config fragment
- Add the target to tools/testing/selftests/Makefile

Cover the input-validation paths of the vmw_zerocopy ioctl added earlier in
this series: an unknown ioctl number, a bad message pointer, an unknown
message type, a non-zero reserved word, neither buffer supplied,
zero-length and oversized data and metadata buffers, a wrapping
address+length, a wrapping PAGE_ALIGN() of the end address, an unmapped
buffer, and zero-length and oversized raw payloads.

These are all rejected before any datagram is sent, so they need no
hypervisor peer. Two further tests submit a well-formed message and assert
only that any failure is not a validation error, which holds whether or not
a peer is listening; they also check that repeated sends do not depend on
per-call setup surviving. The whole test therefore runs on any guest where
the module loads, and skips cleanly when /dev/vmw_zc is absent so it does
not fail on kernels built without CONFIG_VMW_ZC.

Signed-off-by: Rishi Chhibber <rishi.chhibber@broadcom.com>
Reviewed-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
Reviewed-by: Vishnu Dasa <vishnu.dasa@broadcom.com>
---
 tools/testing/selftests/Makefile              |   1 +
 .../drivers/misc/vmw_zerocopy/.gitignore      |   1 +
 .../drivers/misc/vmw_zerocopy/Makefile        |  20 ++
 .../drivers/misc/vmw_zerocopy/config          |   2 +
 .../misc/vmw_zerocopy/test_vmw_zerocopy.c     | 276 ++++++++++++++++++
 5 files changed, 300 insertions(+)
 create mode 100644 tools/testing/selftests/drivers/misc/vmw_zerocopy/.gitignore
 create mode 100644 tools/testing/selftests/drivers/misc/vmw_zerocopy/Makefile
 create mode 100644 tools/testing/selftests/drivers/misc/vmw_zerocopy/config
 create mode 100644 tools/testing/selftests/drivers/misc/vmw_zerocopy/test_vmw_zerocopy.c

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 2d960626750e..325723e92bf3 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -20,6 +20,7 @@ TARGETS += devices/error_logs
 TARGETS += devices/probe
 TARGETS += dmabuf-heaps
 TARGETS += drivers/dma-buf
+TARGETS += drivers/misc/vmw_zerocopy
 TARGETS += drivers/ntsync
 TARGETS += drivers/s390x/uvdevice
 TARGETS += drivers/net
diff --git a/tools/testing/selftests/drivers/misc/vmw_zerocopy/.gitignore b/tools/testing/selftests/drivers/misc/vmw_zerocopy/.gitignore
new file mode 100644
index 000000000000..68941a8c0553
--- /dev/null
+++ b/tools/testing/selftests/drivers/misc/vmw_zerocopy/.gitignore
@@ -0,0 +1 @@
+test_vmw_zerocopy
diff --git a/tools/testing/selftests/drivers/misc/vmw_zerocopy/Makefile b/tools/testing/selftests/drivers/misc/vmw_zerocopy/Makefile
new file mode 100644
index 000000000000..195826f72f9c
--- /dev/null
+++ b/tools/testing/selftests/drivers/misc/vmw_zerocopy/Makefile
@@ -0,0 +1,20 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+include ../../../../../build/Build.include
+
+UNAME_M := $(shell uname -m)
+
+ifeq ($(filter $(UNAME_M),x86_64 i686 i386),)
+nothing:
+.PHONY: all clean run_tests install
+.SILENT:
+else
+
+TEST_GEN_PROGS := test_vmw_zerocopy
+
+top_srcdir ?= ../../../../../..
+
+CFLAGS += -Wall -Werror $(KHDR_INCLUDES)
+
+include ../../../lib.mk
+
+endif
diff --git a/tools/testing/selftests/drivers/misc/vmw_zerocopy/config b/tools/testing/selftests/drivers/misc/vmw_zerocopy/config
new file mode 100644
index 000000000000..03e4a430c5ff
--- /dev/null
+++ b/tools/testing/selftests/drivers/misc/vmw_zerocopy/config
@@ -0,0 +1,2 @@
+CONFIG_VMWARE_VMCI=m
+CONFIG_VMW_ZC=m
diff --git a/tools/testing/selftests/drivers/misc/vmw_zerocopy/test_vmw_zerocopy.c b/tools/testing/selftests/drivers/misc/vmw_zerocopy/test_vmw_zerocopy.c
new file mode 100644
index 000000000000..af8035c4fa0f
--- /dev/null
+++ b/tools/testing/selftests/drivers/misc/vmw_zerocopy/test_vmw_zerocopy.c
@@ -0,0 +1,276 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * selftest for the VMware zero-copy buffer sharing UAPI
+ *
+ * Copyright (c) 2026 Broadcom. All Rights Reserved. The term
+ * "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.
+ *
+ * Every input check in the driver runs before the message reaches the
+ * transport, so all of the tests below are meaningful without a hypervisor
+ * peer listening: they assert that bad input is rejected with the documented
+ * errno. Tests that would require a live peer only assert "not one of the
+ * input-validation errnos", since the transport result depends on the host.
+ */
+
+#include <errno.h>
+#include <fcntl.h>
+#include <stdint.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <sys/mman.h>
+#include <unistd.h>
+
+#include <linux/vmw_zerocopy.h>
+
+#include "../../../kselftest_harness.h"
+
+#define VMW_ZC_PATH	"/dev/" VMW_ZC_DEVICE_NAME
+
+/* Driver-private, but fixed by the UAPI's documented buffer limits. */
+#define VMW_ZC_TEST_MAX_BUFFER	65536
+
+FIXTURE(vmw_zc) {
+	int fd;
+	void *data;
+	void *metadata;
+	size_t page_size;
+};
+
+FIXTURE_SETUP(vmw_zc)
+{
+	self->page_size = (size_t)getpagesize();
+
+	self->fd = open(VMW_ZC_PATH, O_RDWR);
+	if (self->fd < 0)
+		SKIP(return, "cannot open %s: %s", VMW_ZC_PATH,
+		     strerror(errno));
+
+	self->data = mmap(NULL, self->page_size, PROT_READ | PROT_WRITE,
+			  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(MAP_FAILED, self->data);
+
+	self->metadata = mmap(NULL, self->page_size, PROT_READ | PROT_WRITE,
+			      MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(MAP_FAILED, self->metadata);
+
+	memset(self->data, 0xa5, self->page_size);
+}
+
+FIXTURE_TEARDOWN(vmw_zc)
+{
+	if (self->data)
+		munmap(self->data, self->page_size);
+	if (self->metadata)
+		munmap(self->metadata, self->page_size);
+	if (self->fd >= 0)
+		close(self->fd);
+}
+
+/* An unknown ioctl number must be rejected, not silently accepted. */
+TEST_F(vmw_zc, unknown_ioctl)
+{
+	struct vmw_zc_guest_message msg = { };
+
+	EXPECT_EQ(-1, ioctl(self->fd, _IOW(VMW_ZC_IOCTL_MAGIC, 0x7f,
+					   struct vmw_zc_guest_message), &msg));
+	EXPECT_EQ(ENOTTY, errno);
+}
+
+TEST_F(vmw_zc, bad_message_pointer)
+{
+	EXPECT_EQ(-1, ioctl(self->fd, VMW_ZC_IOCTL_MSG, NULL));
+	EXPECT_EQ(EFAULT, errno);
+}
+
+TEST_F(vmw_zc, unknown_message_type)
+{
+	struct vmw_zc_guest_message msg = { };
+
+	msg.message_type = 0xffff;
+	EXPECT_EQ(-1, ioctl(self->fd, VMW_ZC_IOCTL_MSG, &msg));
+	EXPECT_EQ(EINVAL, errno);
+}
+
+/*
+ * The destination is owned by the kernel: @reserved is not an address and a
+ * caller that treats it as one (e.g. a binary built against the older header
+ * where this word was peer_id) must fail loudly rather than be misrouted.
+ */
+TEST_F(vmw_zc, reserved_must_be_zero)
+{
+	struct vmw_zc_guest_message msg = { };
+
+	msg.message_type = VMW_ZC_MSG_USER_BUFFER;
+	msg.reserved = 1;
+	msg.u.data.buffer = (__u64)(uintptr_t)self->data;
+	msg.u.data.buffer_length = 64;
+
+	EXPECT_EQ(-1, ioctl(self->fd, VMW_ZC_IOCTL_MSG, &msg));
+	EXPECT_EQ(EINVAL, errno);
+}
+
+TEST_F(vmw_zc, neither_buffer_nor_metadata)
+{
+	struct vmw_zc_guest_message msg = { };
+
+	msg.message_type = VMW_ZC_MSG_USER_BUFFER;
+
+	EXPECT_EQ(-1, ioctl(self->fd, VMW_ZC_IOCTL_MSG, &msg));
+	EXPECT_EQ(EINVAL, errno);
+}
+
+TEST_F(vmw_zc, zero_length_buffer)
+{
+	struct vmw_zc_guest_message msg = { };
+
+	msg.message_type = VMW_ZC_MSG_USER_BUFFER;
+	msg.u.data.buffer = (__u64)(uintptr_t)self->data;
+	msg.u.data.buffer_length = 0;
+
+	EXPECT_EQ(-1, ioctl(self->fd, VMW_ZC_IOCTL_MSG, &msg));
+	EXPECT_EQ(EINVAL, errno);
+}
+
+TEST_F(vmw_zc, oversized_buffer)
+{
+	struct vmw_zc_guest_message msg = { };
+
+	msg.message_type = VMW_ZC_MSG_USER_BUFFER;
+	msg.u.data.buffer = (__u64)(uintptr_t)self->data;
+	msg.u.data.buffer_length = VMW_ZC_TEST_MAX_BUFFER + 1;
+
+	EXPECT_EQ(-1, ioctl(self->fd, VMW_ZC_IOCTL_MSG, &msg));
+	EXPECT_EQ(EINVAL, errno);
+}
+
+TEST_F(vmw_zc, oversized_metadata)
+{
+	struct vmw_zc_guest_message msg = { };
+
+	msg.message_type = VMW_ZC_MSG_USER_BUFFER;
+	msg.u.data.metadata = (__u64)(uintptr_t)self->metadata;
+	msg.u.data.metadata_length = VMW_ZC_TEST_MAX_BUFFER + 1;
+
+	EXPECT_EQ(-1, ioctl(self->fd, VMW_ZC_IOCTL_MSG, &msg));
+	EXPECT_EQ(EINVAL, errno);
+}
+
+/*
+ * A near-top address must be rejected by the range check before any page-count
+ * arithmetic runs, whether it wraps on start + length or only on the
+ * subsequent page alignment.
+ */
+TEST_F(vmw_zc, address_length_overflow)
+{
+	struct vmw_zc_guest_message msg = { };
+
+	msg.message_type = VMW_ZC_MSG_USER_BUFFER;
+	msg.u.data.buffer = ~(__u64)0 - 15;
+	msg.u.data.buffer_length = 4096;
+
+	EXPECT_EQ(-1, ioctl(self->fd, VMW_ZC_IOCTL_MSG, &msg));
+	EXPECT_EQ(EFAULT, errno);
+}
+
+/*
+ * The page-alignment-only wrap: start + length does not overflow, but rounding
+ * the end up to a page boundary would, which previously yielded nr_pages == 1.
+ */
+TEST_F(vmw_zc, address_page_align_overflow)
+{
+	struct vmw_zc_guest_message msg = { };
+
+	msg.message_type = VMW_ZC_MSG_USER_BUFFER;
+	msg.u.data.buffer = ~(__u64)0 - 0x7ff;
+	msg.u.data.buffer_length = 0x800;
+
+	EXPECT_EQ(-1, ioctl(self->fd, VMW_ZC_IOCTL_MSG, &msg));
+	EXPECT_EQ(EFAULT, errno);
+}
+
+TEST_F(vmw_zc, unmapped_buffer)
+{
+	struct vmw_zc_guest_message msg = { };
+	void *gap;
+
+	gap = mmap(NULL, self->page_size, PROT_NONE,
+		   MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(MAP_FAILED, gap);
+	ASSERT_EQ(0, munmap(gap, self->page_size));
+
+	msg.message_type = VMW_ZC_MSG_USER_BUFFER;
+	msg.u.data.buffer = (__u64)(uintptr_t)gap;
+	msg.u.data.buffer_length = 64;
+
+	EXPECT_EQ(-1, ioctl(self->fd, VMW_ZC_IOCTL_MSG, &msg));
+	EXPECT_EQ(EFAULT, errno);
+}
+
+TEST_F(vmw_zc, zero_length_raw)
+{
+	struct vmw_zc_guest_message msg = { };
+
+	msg.message_type = VMW_ZC_MSG_RAW;
+	msg.u.raw_buffer.raw_len = 0;
+
+	EXPECT_EQ(-1, ioctl(self->fd, VMW_ZC_IOCTL_MSG, &msg));
+	EXPECT_EQ(EINVAL, errno);
+}
+
+TEST_F(vmw_zc, oversized_raw)
+{
+	struct vmw_zc_guest_message msg = { };
+
+	msg.message_type = VMW_ZC_MSG_RAW;
+	msg.u.raw_buffer.raw_len = VMW_ZC_MAX_RAW_BUFFER_LEN + 1;
+
+	EXPECT_EQ(-1, ioctl(self->fd, VMW_ZC_IOCTL_MSG, &msg));
+	EXPECT_EQ(EINVAL, errno);
+}
+
+/*
+ * A well-formed send passes every input check, so it must not fail with one
+ * of the validation errnos. Whether it ultimately succeeds depends on a peer
+ * being present, which this test cannot assume.
+ */
+TEST_F(vmw_zc, well_formed_send_passes_validation)
+{
+	struct vmw_zc_guest_message msg = { };
+	int rc;
+
+	msg.message_type = VMW_ZC_MSG_USER_BUFFER;
+	msg.u.data.buffer = (__u64)(uintptr_t)self->data;
+	msg.u.data.buffer_length = 64;
+	msg.u.data.metadata = (__u64)(uintptr_t)self->metadata;
+	msg.u.data.metadata_length = 64;
+
+	rc = ioctl(self->fd, VMW_ZC_IOCTL_MSG, &msg);
+	if (rc < 0) {
+		EXPECT_NE(EINVAL, errno);
+		EXPECT_NE(EFAULT, errno);
+		EXPECT_NE(ENOTTY, errno);
+		TH_LOG("send returned %s; a hypervisor peer may not be present",
+		       strerror(errno));
+	}
+}
+
+/* Repeated sends must not depend on any per-call setup surviving. */
+TEST_F(vmw_zc, repeated_raw_sends)
+{
+	struct vmw_zc_guest_message msg = { };
+	int i;
+
+	msg.message_type = VMW_ZC_MSG_RAW;
+	msg.u.raw_buffer.raw_len = VMW_ZC_MAX_RAW_BUFFER_LEN;
+	memset(msg.u.raw_buffer.raw_buffer, 0x5a,
+	       sizeof(msg.u.raw_buffer.raw_buffer));
+
+	for (i = 0; i < 16; i++) {
+		if (ioctl(self->fd, VMW_ZC_IOCTL_MSG, &msg) < 0) {
+			EXPECT_NE(EINVAL, errno);
+			EXPECT_NE(ENOTTY, errno);
+		}
+	}
+}
+
+TEST_HARNESS_MAIN
-- 
2.52.0

