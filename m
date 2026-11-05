Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793883308;
	b=r+0ILO5TA2VQUQ7GKyv1p/ufo7UlIwF3INwYt0KXV6j1WDk0bOXsboXX3uXYoWkBSzCS
	 vuQNad7cqgPGYhPAc54hrOJe8lyZgp0m55mu7MtFgXCyL0zWZFKcyE06S5ydfhba+/4rg
	 reAYzk7020zai1lczpDxzYBBRLARt6YcnghVL0qrZO9zG5E0FC6O7SLEEamovlFcxUmcq
	 UoiCIOqSWfX8621jwLlURbNA1pfhf0yQU+qzyC5GGeQTuujVJwonR6qDdLQSUevXrS9mA
	 /Gam052gLMjpp0JIrJF1SLG4LDB8Lp4MiBLb55UOTLBqOPz+1yaukfhP1xU7YZgC2ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883308;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=W9x3jjuMW0enhWTlyFdgZKVCgl/js8bTZrtROBm22NA=;
	b=0heeqTaFuxF5OOl/cG46qGhzxapXsJvO2+JAlIqgOUP0cRgI+jsEyleD7hjUibfJKe5n
	 H/dyIj8R+/RwzkYBf56ZThnJ7mVnqenButcEKNyj6uNYRbPA01qmuimAwZ4tdmmCT6Vqv
	 QjBljS4OWHELo/FyVxIFM0FeSI4z0O0WvSLKLgSIDc6IzCgSXituPJ/XGi+vwrwaduLyN
	 NElDFQ3jsqvU2o92s+Zb+fCn1aBXHhqWC8+auvf4STre/nXy0E1PewOheZAw2V58G5SIV
	 kPx7zb8u++JOQXO+XT8lrERCSWJN9mLacvFqiIUHAkASYvK0pG+ZhuGn5Ie7uqsbjog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=AXmhRlh4;
	arc=none smtp.remote-ip=113.46.200.221
Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536AE606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:55:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 536AE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=AXmhRlh4
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=W9x3jjuMW0enhWTlyFdgZKVCgl/js8bTZrtROBm22NA=;
	b=AXmhRlh4UfxROFuRVsIID2iazoIEl1RdMyRlDEEubF0QmuEwp1YLR95WsZOkHeNt8ipkI1OTu
	gnFcBoh4grsEIsWX915VNIflUhYlbGQwmPV/2tgdstSGutpdwqJTpvYq1dDksuNUI0SVIWM0NC7
	6+Rg3dMuXE5dCP/ev3OTGYs=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4jL2Mg4VfNzRhRx;
	Thu,  5 Nov 2026 20:54:55 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 8844E4056D;
	Thu,  5 Nov 2026 20:55:02 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 20:55:01 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<pratyush@kernel.org>, <leitao@debian.org>, <mpilaniy@redhat.com>,
	<yeoreum.yun@arm.com>, <graf@amazon.com>, <pasha.tatashin@soleen.com>,
	<akpm@linux-foundation.org>, <baoquan.he@linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v8] arm64: kexec_file: Stop using the Image text_offset
Date: Thu, 5 Nov 2026 20:54:42 +0800
Message-ID: <20261105125442.2282987-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
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
Content-Type: text/plain
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200008.china.huawei.com (7.202.194.74)

image_load() adds text_offset to kernel_segment->mem and subtracts it
from kernel_segment->memsz.  For CMA backed segments this breaks the
load path: the payload is copied to page_address(cma), which is the CMA
base, while image->start is set to the adjusted address, so kexec jumps
into the middle of the kernel.  kimage_map_segment() has the same
mismatch when a segment has been moved.

The adjusted memsz also breaks the release path: the CMA pages are
freed using segment->memsz >> PAGE_SHIFT, which is fewer than were
allocated, leaking the tail of the allocation.

Since commit 751c263bb74f ("arm64: remove TEXT_OFFSET randomization")
TEXT_OFFSET is always zero.  This has been upstream since v5.8, so no
LTS kernel carries a non-zero text_offset.  Drop the adjustment and
reject images with a non-zero value instead of booting them from a
wrong address.  With the adjustment gone, segments stay at their CMA
base and the release size matches the allocation.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>
Link: https://lore.kernel.org/all/20260921090450.807575-2-ruanjinjie@huawei.com/
Link: https://lore.kernel.org/all/20260921090450.807575-3-ruanjinjie@huawei.com/
Fixes: 07d24902977e ("kexec: enable CMA based contiguous allocation")
Suggested-by: Mike Rapoport <rppt@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v2:
- Split out from the patch set.
- Link to v7: https://lore.kernel.org/all/20261026075201.699550-1-ruanjinjie@huawei.com/
---
 arch/arm64/kernel/kexec_image.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/kexec_image.c b/arch/arm64/kernel/kexec_image.c
index 78b1f956d8d7..7d6baea3d28f 100644
--- a/arch/arm64/kernel/kexec_image.c
+++ b/arch/arm64/kernel/kexec_image.c
@@ -80,12 +80,17 @@ static void *image_load(struct kimage *image,
 	kbuf.bufsz = kernel_len;
 	kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
 	kbuf.memsz = le64_to_cpu(h->image_size);
+	/*
+	 * Pre-v5.8 images carry a non-zero text_offset, which is no longer
+	 * honored; reject them instead of loading them at a wrong address.
+	 */
 	text_offset = le64_to_cpu(h->text_offset);
+	if (text_offset) {
+		pr_err("Unsupported Image text_offset 0x%lx\n", text_offset);
+		return ERR_PTR(-ENOEXEC);
+	}
 	kbuf.buf_align = MIN_KIMG_ALIGN;
 
-	/* Adjust kernel segment with TEXT_OFFSET */
-	kbuf.memsz += text_offset;
-
 	kernel_segment_number = image->nr_segments;
 
 	/*
@@ -117,8 +122,6 @@ static void *image_load(struct kimage *image,
 	}
 
 	kernel_segment = &image->segment[kernel_segment_number];
-	kernel_segment->mem += text_offset;
-	kernel_segment->memsz -= text_offset;
 	image->start = kernel_segment->mem;
 
 	kexec_dprintk("Loaded kernel at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
-- 
2.34.1

