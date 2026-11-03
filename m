Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793743422;
	b=zbh8F0hlvBH63HG1pPYx/Qs1VlY8T7F36mYf7seRXlIL0Y1IdOZx9Xg9iDn+hXa8mT54
	 872ffq5+NwYKr9zj1EMYqApMCPBVN+rs6JXTCDLHD8qTTeDGx1aHAx0h3H0jMdQeFONyz
	 HY6Wi1Jk61OD2WZ1Jevs9csY7Ndzr4Ds6leKiDLDeiDYTw3O2mIVJeP7ugJPsgPTYWNZz
	 yYc/M+kmAO91XJLWI8XKU64FHKP5vmTagV5fL6kQeIMeed2hQJQR6q+Z4ve0faKaeDmuW
	 205pH3IAo5us8nPJr0iEh2M2UoJKLqnNwgCNxkN0EDMZ7m4vzinzTHhWV/WGNY8Vnog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793743422;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=lT95gwxqijZuWNZmAFyry0p0ILAiPcgM7CWPA1WXiYY=;
	b=umSBxgUBLAUfViMD29/hAqksnsS5B42NTIMDqM3sTI0a/uNlG2CyG5+mh9FRWnd0eIup
	 uKa+9Mb8dV7FvTWbYawbTtsvjJeQCpSw830yHH6odf2Elf+5gyxocIRH/u2Mk64Syw8IL
	 7M9Ry5i0RSFChaHlW66wz0+HE9Wfis7vm6OOIwu1LDKEUW7VKwQoJ1+GfJKCzbVcs7Zlm
	 FILSE8EsbqPl7v0CsI5b8nD0YX6gfLO2dZkm820f47kr76Pd+7XAspZOp0jVfS5a2vONk
	 B2XXrxpsonEoDSm6Yvqon1ODhWpGooriwsu788WMctTVvhhOa6hrsimDdl8nh5RoUfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YrPHjkfQ;
	arc=none smtp.remote-ip=209.85.215.198
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470C1606EE90
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:03:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 470C1606EE90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YrPHjkfQ
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso62528a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793743420; x=1794348220; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lT95gwxqijZuWNZmAFyry0p0ILAiPcgM7CWPA1WXiYY=;
        b=YrPHjkfQQh4ijubwBazdKI+yMwlkLJUg5TjWVSXFcp1YDbSKtWorLoUvwdNWd4YVHA
         ror4GM67h5kJBzOor5OLrdVV5xOl+YsnuViIsfJT6nbleXHUAUIhcmma3wfOn2gyaQ5w
         8MGGX5DEJD58BhkizxiB7w2Sp51vDUXFJ5Tx+oTQ7fd3tAYKAVBTLxFF9iioRgF2WiTw
         9/RDrW+i7ay1RyvVUW1LkU8yrKh46TkN+8G+myBIT0Kg1cdlM/gLvGC8WJYsG9XtkvUo
         tDbBZDkIUB3WvP7lSslMD+hVrzxs+PChef2VOMH/n7++b2Yiws6h26sYH24gE9oJitfL
         5TVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793743420; x=1794348220;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lT95gwxqijZuWNZmAFyry0p0ILAiPcgM7CWPA1WXiYY=;
        b=SNnEcPPLatM1mDg6VVFFpx0+1WonlPDMk9CRKlAGL2PrBPOA4TBNlNohy9GFwviCOL
         BR2vyptManfSMoxYPpQfD4PWAugeK8A5/gKm1Mlq7yVm/qcwbW5tFEpag23x+ZI8uQs4
         c9kHHlX3RBZiSsQHaom13M3oHJGoXCW0Ep9ME/rxAfb55D08l7Jmofcnvh+bzO4zAKP8
         wXGHMdWScQ4rn5ND2LM6TI+uGQOUVwGHS27gkV1A5GbtwpY2StTTJ5iaPMT4+Io/9W+a
         nSRsSHbvoQ9a5oUDFqKegw6BprP4OHg5XC6nRYnxyj1/g2/MX94JlMq6MRU6n1c0QUYQ
         9GEA==
X-Forwarded-Encrypted: i=1; AKwUvBznMXoUN5ul1S1LW5Qmf0bhg1IcZLfDSubX9Tj9nv/bQywEJ53ABpcHsMqB4eM0HLOpCyfSK9wQ8x3Yvns=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lZ32+I9Q54OgiI884Zo+7iBMDVM9RwkKRNoy/dvzLvFJIfSbf
	n1Xbs8B7LOlC9qvt3fup/THT417DhGOjk5/Xxpc5kvKJFZtQaWaxtDw7q67F+R0qKRqi65LAgPP
	bKrNzFvlyAjb/rQ==
X-Received: from pgbdw19.prod.google.com ([2002:a05:6a02:4493:b0:cc9:f793:b980])
 (user=skhawaja job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:e397:b0:3b0:96ce:104f with SMTP id 98e67ed59e1d1-3b096ce1144mr146764a91.5.1793743420343;
 Tue, 03 Nov 2026 14:03:40 -0800 (PST)
Date: Tue,  3 Nov 2026 22:03:37 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103220337.3578111-1-skhawaja@google.com>
Subject: [PATCH v3] vfio: selftests: Remove libuuid dependency
From: Samiullah Khawaja <skhawaja@google.com>
To: Alex Williamson <alex@shazbot.org>, David Matlack <dmatlack@google.com>
Cc: Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Samiullah Khawaja <skhawaja@google.com>
Content-Type: text/plain; charset="UTF-8"

Replace libuuid with a minimal uuid_t and uuid_parse() in libvfio, and
drop -luuid from the build. libvfio only uses libuuid to parse VF
tokens, so pulling in an external library is not worth it.

libuuid is often missing from cross-compilation sysroots, which causes
the VFIO selftests to fail to link:

  ld: cannot find -luuid: No such file or directory

It also complicates building against glibc alternatives such as musl, see
https://lore.kernel.org/kvm/c2f7e904-2646-4b01-864d-d185221c7f56@gmail.com/

Reviewed-by: David Matlack <dmatlack@google.com>
Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
---

v3:
- Reword the changelog and drop the testing note from it (David)
- Move the libuuid comment to uuid.h and explain how it differs from
  the kernel API (David)

v2: https://lore.kernel.org/all/20261102200624.1570562-1-skhawaja@google.com/
- Move the parser to lib/uuid.c and lib/include/libvfio/uuid.h (David)
- Drop the vfio_ prefixes and add a uuid_t (David)
- Mention musl in the commit message (David)

v1: https://lore.kernel.org/all/20260925013110.3447626-1-skhawaja@google.com/
---
 .../selftests/vfio/lib/include/libvfio.h      |  1 +
 .../selftests/vfio/lib/include/libvfio/uuid.h | 16 +++++++
 tools/testing/selftests/vfio/lib/libvfio.mk   |  3 +-
 tools/testing/selftests/vfio/lib/uuid.c       | 42 +++++++++++++++++++
 .../selftests/vfio/lib/vfio_pci_device.c      |  2 -
 5 files changed, 60 insertions(+), 4 deletions(-)
 create mode 100644 tools/testing/selftests/vfio/lib/include/libvfio/uuid.h
 create mode 100644 tools/testing/selftests/vfio/lib/uuid.c

diff --git a/tools/testing/selftests/vfio/lib/include/libvfio.h b/tools/testing/selftests/vfio/lib/include/libvfio.h
index 07862b470777..e9d513c3a08e 100644
--- a/tools/testing/selftests/vfio/lib/include/libvfio.h
+++ b/tools/testing/selftests/vfio/lib/include/libvfio.h
@@ -6,6 +6,7 @@
 #include <libvfio/iommu.h>
 #include <libvfio/iova_allocator.h>
 #include <libvfio/sysfs.h>
+#include <libvfio/uuid.h>
 #include <libvfio/vfio_pci_device.h>
 #include <libvfio/vfio_pci_driver.h>
 
diff --git a/tools/testing/selftests/vfio/lib/include/libvfio/uuid.h b/tools/testing/selftests/vfio/lib/include/libvfio/uuid.h
new file mode 100644
index 000000000000..5c4ebe5ae3d3
--- /dev/null
+++ b/tools/testing/selftests/vfio/lib/include/libvfio/uuid.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef SELFTESTS_VFIO_LIB_INCLUDE_LIBVFIO_UUID_H
+#define SELFTESTS_VFIO_LIB_INCLUDE_LIBVFIO_UUID_H
+
+/*
+ * Minimal replacement for libuuid's uuid_t and uuid_parse(). These mirror
+ * the libuuid API, not the kernel's: uuid_t is a byte array (not a struct)
+ * and uuid_parse() fills it in place (it does not take a uuid_t pointer).
+ */
+#define UUID_SIZE	16
+
+typedef unsigned char uuid_t[UUID_SIZE];
+
+int uuid_parse(const char *in, uuid_t uu);
+
+#endif /* SELFTESTS_VFIO_LIB_INCLUDE_LIBVFIO_UUID_H */
diff --git a/tools/testing/selftests/vfio/lib/libvfio.mk b/tools/testing/selftests/vfio/lib/libvfio.mk
index eff95828719e..d1d1b2b05af1 100644
--- a/tools/testing/selftests/vfio/lib/libvfio.mk
+++ b/tools/testing/selftests/vfio/lib/libvfio.mk
@@ -7,6 +7,7 @@ LIBVFIO_C := iommu.c
 LIBVFIO_C += iova_allocator.c
 LIBVFIO_C += libvfio.c
 LIBVFIO_C += sysfs.c
+LIBVFIO_C += uuid.c
 LIBVFIO_C += vfio_pci_device.c
 LIBVFIO_C += vfio_pci_driver.c
 
@@ -30,8 +31,6 @@ $(LIBVFIO_O_DIRS):
 
 CFLAGS += -I$(LIBVFIO_SRCDIR)/include
 
-LDLIBS += -luuid
-
 $(LIBVFIO_O): $(LIBVFIO_OUTPUT)/%.o : $(LIBVFIO_SRCDIR)/%.c | $(LIBVFIO_O_DIRS)
 	$(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c $< -o $@
 
diff --git a/tools/testing/selftests/vfio/lib/uuid.c b/tools/testing/selftests/vfio/lib/uuid.c
new file mode 100644
index 000000000000..906a5db70ce1
--- /dev/null
+++ b/tools/testing/selftests/vfio/lib/uuid.c
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <string.h>
+
+#include <libvfio.h>
+
+#define UUID_STRING_LEN	36
+
+static int hexval(char c)
+{
+	if (c >= '0' && c <= '9')
+		return c - '0';
+	if (c >= 'a' && c <= 'f')
+		return c - 'a' + 10;
+	if (c >= 'A' && c <= 'F')
+		return c - 'A' + 10;
+	return -1;
+}
+
+int uuid_parse(const char *in, uuid_t uu)
+{
+	const char *p = in;
+	int i, hi, lo;
+
+	if (strlen(in) != UUID_STRING_LEN)
+		return -1;
+
+	for (i = 0; i < UUID_SIZE; i++) {
+		if (i == 4 || i == 6 || i == 8 || i == 10) {
+			if (*p++ != '-')
+				return -1;
+		}
+
+		hi = hexval(*p++);
+		lo = hexval(*p++);
+		if (hi < 0 || lo < 0)
+			return -1;
+
+		uu[i] = (hi << 4) | lo;
+	}
+
+	return 0;
+}
diff --git a/tools/testing/selftests/vfio/lib/vfio_pci_device.c b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
index 4063a0e2b3df..4ae6ac1f8ed8 100644
--- a/tools/testing/selftests/vfio/lib/vfio_pci_device.c
+++ b/tools/testing/selftests/vfio/lib/vfio_pci_device.c
@@ -23,8 +23,6 @@
 #include <linux/types.h>
 #include <linux/vfio.h>
 
-#include <uuid/uuid.h>
-
 #include "kselftest.h"
 #include <libvfio.h>
 

base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
-- 
2.56.0.385.gac671c819a-goog

