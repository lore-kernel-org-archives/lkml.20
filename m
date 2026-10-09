Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D7E1A38F9
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 02:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791513284; cv=none; b=X8NEFinlfJXEyAFeSP+JrJUeMalTBmbGnsl0+Dtaln36KrgXqvcyOFaFBaOd/Tb2r0ftDbWhiUuluJOHnl4CPUGZlzss1rGFcVR9wpQr5FPz/wZVug+taVnawMLQY2UmhwOX+RE3Fr3xcD78Gjz8BcpC5phL2Of93gp+OaAabrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791513284; c=relaxed/simple;
	bh=jpiR0aLhQz9mG3D0OMsxcuino1XjDqzBMsXVOBoP7nc=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=bRpeHdaCn4EY+LPvxDxBZw9ARPH7Ah980OxPYgNv6/OhXm3rvieUNhR5aIEnP7YEC+DZCEGg5cXDcU1eVy6V7Ee0aKw7OMnxrtufpbkLglQqzd6/cCKHllTFvXvNMuOghIfpHvaLDhLMTfQ9LZ1CEIlsE8YuuE3m8TptmkkNFSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W0J5wBpA; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W0J5wBpA"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-86aecf49833so874296b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 19:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791513281; x=1792118081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T1IhimdTnvN9Dj3ritIUyhz+heh3blfQviu7Hl/psV0=;
        b=W0J5wBpAs4pYB4GwYmxwwMvAWQp1pU26U5e2lGfsiNktC0tGVoqZexNUSTA6ton9+j
         mUUwxSF/6jSFBvn9AMcNvhhYNzlPMLXh6WhHUrmzCRj8xhJ/HiDSbcGYC5lgg9VK0sp7
         /E1XWmASu3DvTfkAt1e4rGsI5DzLnPWsglZY/qTne3WgYkMXX5quoSwUjm3UXwEPfMU1
         Ru0aFBMXrf3x+Pmdu8k+fqufYWw19BU7kz1kiVW6g65+hihgrj9Ab65JJpG07blQCFbr
         8+hV8F7trNbtKE9nyAJYfsZ74H7hk2QNWWNZlUr0+7bHiPNBn61w55yaO98ERMCN4piE
         mQow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791513281; x=1792118081;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T1IhimdTnvN9Dj3ritIUyhz+heh3blfQviu7Hl/psV0=;
        b=m61WPyEZEyfSVt45R1Gxe0Qa8pfkFP4dkXOid5ydYZLlEgC5fG0jw3/0nvmL7t/7cs
         R06bX8EndQDEXI95jj2vlPwUKWNGt9cO7VOV7pYk5eKfkJWk02wxHvvACQUiA/+iDTr8
         1lPmcP0AZpVNkhls49IRfsmChGgwzFXbF80N6m5ckF0JZmnXZdJMmzI8EAqMJhFLVeVq
         FfPvmvHcvDXT4OkkFFkkH+r0CsvR/c/uSNQfWyhzLj83C1js+bgItCh8GNRDN/tXOAxy
         PZIDvx5VeX5VaDbH2A97D4tHDuZLCQDQOKZHq3JlnTt3vOJYSKej+NqCTERsCWY7RbzK
         QKUQ==
X-Forwarded-Encrypted: i=1; AKwUvByDqFeZXqWHc8cvSgPa8lH5+z5aC0lGvhESw2eF+h9fc1IDe6DFuMxiMIUcDC1/A6Rzz59e7jCokpJXiAw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKM92fXASFwbOoHuxHak4EEhKRR2IZTHtaw+xeEn8T/El9twrl6
	nlO+d3+S93jH6TA0+62VpDMXkFZ5MBbBPZN20yFPewvArl4xjx07Rk70
X-Gm-Gg: AYBFou1DiQmpOfd2q3gwns/y48rrvfJGdI5+3iL8tA/Kck7s9Awq0cz6TCGtrcOpmey
	jDkKgKLKHXybRbhfHFnAt/sduUjoT2ZTiN38T9L42KCPbmLlPK65SX/XI7Sk7SxmC2W8pEJEr03
	HiCd7lfmS6fV6XwetlPpA5agQOf/WqJiGJIXWFc4mBor9rllTe7e/vY9OFAtl58MoYFU8gtRszL
	5C0vNt1PVMy02UwcflayqLmN9UQ/xgsU/rKAnlCFKvrjnjMmCnxCDhWNdSntY0BInryi+/hx1cc
	ubSo1THlvjcEtC4p93QVl+K2m7G6OLbzYAMQUscsbDh4VF+2dYVYR3/+Vlz87SdZIv1lM8AAK9S
	BCduZOfTnC7J08IFupJo0RQfYwKNtMnWeL99V7xndnNPxztJljsTLydRtaTq4m5JysE8Ti5WESi
	NhrBRZxtSf54TB64+U38dC1JFQlwTghKPFUeT6k5TBaG41WQwy2qIAbjzB88j1nYrRp4IQNr0RR
	BUGlDbSmrI/5VZPI2dK5QcZveA3b/wb5PKtgjA56f8PEQvK7OgmFnmnLB2g/JAE
X-Received: by 2002:a05:6a00:4307:b0:891:41ae:ad68 with SMTP id d2e1a72fcca58-89695ebf3d9mr752401b3a.23.1791513281482;
        Thu, 08 Oct 2026 19:34:41 -0700 (PDT)
Received: from localhost.localdomain (c-174-165-208-10.hsd1.wa.comcast.net. [174.165.208.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c4a99b28sm296770b3a.59.2026.10.08.19.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 19:34:41 -0700 (PDT)
From: Michael Kelley <mhkelley58@gmail.com>
X-Google-Original-From: Michael Kelley <mhklinux@outlook.com>
To: haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 1/1] Documentation: hyperv: Remove support for guests on Hyper-V 2012/2012R2
Date: Thu,  8 Oct 2026 19:34:37 -0700
Message-Id: <20261009023437.3326-1-mhklinux@outlook.com>
X-Mailer: git-send-email 2.25.1
Reply-To: mhklinux@outlook.com
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support for running Linux guests on Windows Server 2012/2012 R2 Hyper-V
hosts and Windows 8/8.1 hosts has been removed, which includes removing
support for operating Hyper-V synthetic timers in other than Direct Mode.
Update the documentation to reflect these removals.

Signed-off-by: Michael Kelley <mhklinux@outlook.com>
---
This patch reflects changes that are already in linux-next for merging
into the 7.4 kernel.

 Documentation/virt/hyperv/clocks.rst   | 8 ++------
 Documentation/virt/hyperv/overview.rst | 6 +++---
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/Documentation/virt/hyperv/clocks.rst b/Documentation/virt/hyperv/clocks.rst
index 176043265803..9527e6073654 100644
--- a/Documentation/virt/hyperv/clocks.rst
+++ b/Documentation/virt/hyperv/clocks.rst
@@ -64,12 +64,8 @@ applying the scale and offset to get the constant 10 MHz clock.
 
 Linux clockevents are based on Hyper-V synthetic timer 0 (stimer0).
 While Hyper-V offers 4 synthetic timers for each CPU, Linux only uses
-timer 0. In older versions of Hyper-V, an interrupt from stimer0
-results in a VMBus control message that is demultiplexed by
-vmbus_isr() as described in the Documentation/virt/hyperv/vmbus.rst
-documentation. In newer versions of Hyper-V, stimer0 interrupts can
-be mapped to an architectural interrupt, which is referred to as
-"Direct Mode". Linux prefers to use Direct Mode when available. Since
+timer 0. stimer0 is operated in what Hyper-V calls "Direct Mode"
+where timer interrupts are mapped to an architectural interrupt. Since
 x86/x64 doesn't support per-CPU interrupts, Direct Mode statically
 allocates an x86 interrupt vector (HYPERV_STIMER0_VECTOR) across all CPUs
 and explicitly codes it to call the stimer0 interrupt handler. Hence
diff --git a/Documentation/virt/hyperv/overview.rst b/Documentation/virt/hyperv/overview.rst
index 77408a89d1a4..c4c262b77aa3 100644
--- a/Documentation/virt/hyperv/overview.rst
+++ b/Documentation/virt/hyperv/overview.rst
@@ -157,9 +157,9 @@ when accessing data shared with Hyper-V.
 Versioning
 ----------
 Current Linux kernels operate correctly with older versions of
-Hyper-V back to Windows Server 2012 Hyper-V. Support for running
-on the original Hyper-V release in Windows Server 2008/2008 R2
-has been removed.
+Hyper-V back to Windows Server 2016 Hyper-V and Windows 10. Support for
+running on Windows Server 2012/2012 R2, Windows Server 2008/2008 R2,
+and Windows 8.1 and earlier has been removed.
 
 A Linux guest on Hyper-V outputs in dmesg the version of Hyper-V
 it is running on.  This version is in the form of a Windows build
-- 
2.25.1

