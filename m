Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793553054;
	b=lyzbYR52zAcAZ6saHUMKzpjgxoj2m/1+oRWTpxfguSadhUmV2b7KEql/mB4sMnjkGq7s
	 rzJGA7CXmJKgfAqzbPqgEgs+y8kR8sq35WViXWra4PdN30bdq8KygKCtsHa02kRI9UrWM
	 szaAH48bWP5UXR90JlDDesZr5yy/GBbhiazqGXb87lBTxpMJGh5MXSG9c4T27ZfBoN7Eo
	 CdZkfopxFartcsvYFdyhdy38FpsP9uC+zzXFLRvHkkbBK4W02t71oE87UJho1VbPsR115
	 txOSyVRXB22Ab2M1fIRYkSSXMRSqi8WjgBy8cn9JzVrHWeqtWhBCsSgXt72gOsqUxmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793553054;
	h=DMARC-Filter:DKIM-Signature:Subject:X-Mailer:Content-Type:Date:
	 Content-Transfer-Encoding:Mime-Version:To:Cc:X-Lms-Return-Path:
	 X-Original-From:From:Message-Id;
	bh=FUZWKOpCXLxhPIogozxPVP16HUn4U2rHNFDlZpDx9sc=;
	b=4W6JQbynMvm4RBGClLSp7OGDBNNKE1lqi1ti7YxKjbtgCcK242H3DL+TM0r2ES4H26CV
	 xyWFhCMDs08G2L7s7m4id5wwUiilTtKo3GOb60FG0gEx7DJJeutdmMWp8ybRzs3EWGIkK
	 MjY9ffCbD4kZ0lwdX/jmxEdWxg8HV4pNOVlnxuYUnPY8YIYh+wWdOlTinxZ3qo7zgTUJo
	 Zztqt4Yu5sJtoTIJL6TfkOO+94mlL71W/yLPWwFegBnx5EzhVql14XjLNvZLt9d2PV8n+
	 jQT7vGvlNlYoD7hK3iPxfWMEM2TWf5cVcWYpZKvFr7u+SAjPDZ/4P7ZX7buBZTjptPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=Xr90D0ga;
	arc=none smtp.remote-ip=209.127.230.112
Received: from va-1-112.ptr.blmpb.com (va-1-112.ptr.blmpb.com [209.127.230.112])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42139606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 17:10:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42139606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=Xr90D0ga
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1793553047; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=FUZWKOpCXLxhPIogozxPVP16HUn4U2rHNFDlZpDx9sc=;
 b=Xr90D0ga0tTQ845OVKAqMzm6yMDYm1XSSRICkbvrXv2199yugNxFWDIa/sPxKm4IcnuYfN
 hrlpIOeYJ8+GubTlXoeD48D06dLMLeluzLo5er2LC07D0ENJA0RLVZuXo+tiNZWvln4Oc7
 2vQ9jufbmfk2A49sBb6jP/5yr/P6LJmQG3AF9E6IUKDWLQ2xGzua8idXpI78IZj39qHFLr
 yBXmozWjxBTtkkETXvd/gY5qKl1FWN+898WzGKBnS5x49AmYLAZKyrSWSnmkRfhvTzL6QR
 rEsOHbrxSbWd+8dhpOPtPcSHjA5iGdg0hOgpE8dCjN7TtBK2celFwdE0v9Gk9g==
Subject: [PATCH] arm64: mm: validate /dev/mem mmap ranges without overflow
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Type: text/plain; charset=UTF-8
Date: Mon,  2 Nov 2026 01:10:30 +0800
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
To: "Catalin Marinas" <catalin.marinas@arm.com>
Cc: "Will Deacon" <will@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>, 
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	"Zhao Gongyi" <zhaogongyi@bytedance.com>
X-Lms-Return-Path: <lba+26ae77295+c32da8+vger.kernel.org+zhaogongyi@bytedance.com>
X-Original-From: Zhao Gongyi <zhaogongyi@bytedance.com>
From: "Zhao Gongyi" <zhaogongyi@bytedance.com>
Message-Id: <20261101171030.87343-1-zhaogongyi@bytedance.com>

An arm64 syzkaller reproducer creates a FUSE character device with
major:minor 1:1, so opening it uses the /dev/mem file operations. It
maps one page from offset 0xfffffffffffff000 at user address zero.
The next openat() with a NULL pathname triggers a synchronous external
abort (SEA, ESR 0x96000010) in strncpy_from_user() via do_getname(),
panicking the kernel.

valid_mmap_phys_addr_range() checks the exclusive end by adding the
mapping size to the starting address. For this offset, the sum wraps
to zero and passes the PHYS_MASK test, allowing an out-of-range PFN to
reach remap_pfn_range(). The inclusive-end overflow check in
mmap_mem_prepare() does not catch it because the end is ULONG_MAX.

Reject starting PFNs outside PHYS_MASK and compare the inclusive length
against the remaining physical range without overflowing. This also
allows mappings that end exactly at PHYS_MASK, which the old check
incorrectly rejects.

Fixes: 1d18c47c735e ("arm64: MMU fault handling and page table management")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Gongyi <zhaogongyi@bytedance.com>
---
Tested on the base commit with QEMU TCG and 52-bit LPA2:
the overflowing one-page mapping changes from success to -EINVAL,
while the last valid one- and two-page mappings change from -EINVAL to
success. A direct /dev/mem mmap followed by openat(NULL) panics before
this change; with the change, mmap fails with -EINVAL and openat()
returns -EFAULT.

 arch/arm64/mm/mmap.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/mm/mmap.c b/arch/arm64/mm/mmap.c
index 32e0771..d6286bc 100644
--- a/arch/arm64/mm/mmap.c
+++ b/arch/arm64/mm/mmap.c
@@ -61,7 +61,12 @@ int valid_phys_addr_range(phys_addr_t addr, size_t size)
  */
 int valid_mmap_phys_addr_range(unsigned long pfn, size_t size)
 {
-	return !(((pfn << PAGE_SHIFT) + size) & ~PHYS_MASK);
+	const phys_addr_t max_addr = PHYS_MASK;
+
+	if (!size || pfn > (max_addr >> PAGE_SHIFT))
+		return 0;
+
+	return size - 1 <= max_addr - (pfn << PAGE_SHIFT);
 }
 
 static int __init adjust_protection_map(void)

base-commit: cbbddb6b08cc9900a87cccaa9b22bbe06aa4f50a
-- 
2.39.5 (Apple Git-154)
