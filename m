Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793020740;
	b=uWI9tn5bKLDFDgAO90JQOzMZN8dpP3gsHIrcJR3blv5hJieEEaF1eqXvuGJ4mSvuPieS
	 aZPnOeEK8zh1P7Y6OaUgz4yhpnlZvwvLvRTnaM84tNPTBUSW+c9DbMBY1ZsOWQ1WLEr9n
	 YDS1pJkFtM75qD5Usc68BhagMK3SNb2sFXDuaksRSZ0WvfgNzvGENGcSUzH6F6+ifYLsK
	 sivIsSq7QdchTouCUBT09sUBHH/R5vBVxWHPGMWGSn+mqgezn6FP3Qv6MExBnQuEpj445
	 rcmFxeF/nzLuQgJesIEvFocEqm1dUSCggrKN2QqkWtv8S7zIOa1g2vazRCWoqzwS52g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793020740;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NBoEGBnT7tSwydHsRLRvuOQ+mNAaOzQ2uf7Uk5l8xaA=;
	b=i6PECU7zefeCFD0MIoIf80aPu6lHBf48yZV+Bf283HmlPSLqfYGl+qWhf35BI6WVLXUr
	 mY7+V6sotevVfVEkih88sVwtkG0BaX35UW6Mw/c6DUMmMqW4FuFcRtDPa6+9DNtwKOJGw
	 9GfivLs1iFQtYkb2kTUi+rvwjAK8Tn59qi1eGeJqpxeNEVKhxUEmkrPQZuq4FFKz6A3uS
	 4Z+ctDS+Uy9V9yAdiRh7VIEOrLy7SKc7ZGVT9HJWSuYcWYn8olvERltIcNDVkCqtH3utZ
	 TrS4l6QuSwO9IVub2t9kz7+EMjNzN9UR9+N9vuN+rmpw8pgtYwfiDCUysqlWlKD8V8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=Ty8aX1rI;
	arc=none smtp.remote-ip=115.124.30.111
Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940FA606A329
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 940FA606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=Ty8aX1rI
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793020734; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=NBoEGBnT7tSwydHsRLRvuOQ+mNAaOzQ2uf7Uk5l8xaA=;
	b=Ty8aX1rIumYecaKntXoNA1VNw5JwdZZYkq+C6+nByk9I3Ei6NY0Hta/1m05SM/R+Z47SsYpT4JYtquOaU3/O+99VxdhUygtM0dO8bs69JkEi8cxX0vi3nsJUpOWa68JMbv23F/Eh+3kDceEQKCZk2pu8EqoLd76iyTfsxjHIhrM=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R911e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XDYkXyw_1793020730;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XDYkXyw_1793020730 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 26 Oct 2026 21:18:54 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	graf@amazon.com
Cc: kexec@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kho: Skip zero-sized bootmem areas
Date: Mon, 26 Oct 2026 21:18:51 +0800
Message-ID: <20261026131851.9942-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
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

The lowmem and the global bootmem area are reserved unconditionally,
while the per-node loop below already skips nodes whose size works out
to 0. Either can legitimately be 0: the global size is the scaled total
minus the lowmem one, so it is 0 whenever all measured reservations fit
below ARCH_LOW_ADDRESS_LIMIT.

Reserving 0 bytes still succeeds, so an area covering nothing gets
recorded with a valid address. That is not neutral:
kho_bootmem_overlap() reports an overlap for any request straddling
that address, and memblock_alloc_hugetlb() aligns a request to its page
size, so a 1G hugetlb allocation retries a free candidate on account of
an area that holds nothing.

A machine whose memory all starts at or above ARCH_LOW_ADDRESS_LIMIT
hits the other side of the same code: the lowmem size is 0, the range
below the limit is empty, the allocation fails and KHO is disabled
although no lowmem area was needed.

Skip a zero-sized area instead, as the per-node loop does. The
descriptor count stays consistent, as kho_populate() derives it from
the segment length that kho_fill_kimage() serialises.

Fixes: 3dc92c311498 ("kexec: add Kexec HandOver (KHO) generation helpers")
Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 kernel/liveupdate/kexec_handover.c | 38 +++++++++++++++++-------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
index 6f1f55fe3..c9c9fdfac 100644
--- a/kernel/liveupdate/kexec_handover.c
+++ b/kernel/liveupdate/kexec_handover.c
@@ -853,28 +853,32 @@ static void __init kho_reserve_bootmem(void)
 	 * next kernel
 	 */
 	size = bootmem_size_lowmem;
-	addr = memblock_phys_alloc_range(size, BOOTMEM_ALIGNMENT_BYTES, 0,
-					 ARCH_LOW_ADDRESS_LIMIT);
-	if (!addr) {
-		pr_err("Failed to reserve lowmem bootmem\n");
-		goto err_free_bootmem_desc;
-	}
+	if (size) {
+		addr = memblock_phys_alloc_range(size, BOOTMEM_ALIGNMENT_BYTES,
+						 0, ARCH_LOW_ADDRESS_LIMIT);
+		if (!addr) {
+			pr_err("Failed to reserve lowmem bootmem\n");
+			goto err_free_bootmem_desc;
+		}
 
-	kho_bootmem[i].addr = addr;
-	kho_bootmem[i].size = size;
-	i++;
+		kho_bootmem[i].addr = addr;
+		kho_bootmem[i].size = size;
+		i++;
+	}
 
 	/* reserve large contiguous area for allocations without nid */
 	size = bootmem_size_global;
-	addr = memblock_phys_alloc(size, BOOTMEM_ALIGNMENT_BYTES);
-	if (!addr) {
-		pr_err("Failed to reserve global bootmem\n");
-		goto err_free_bootmem_areas;
-	}
+	if (size) {
+		addr = memblock_phys_alloc(size, BOOTMEM_ALIGNMENT_BYTES);
+		if (!addr) {
+			pr_err("Failed to reserve global bootmem\n");
+			goto err_free_bootmem_areas;
+		}
 
-	kho_bootmem[i].addr = addr;
-	kho_bootmem[i].size = size;
-	i++;
+		kho_bootmem[i].addr = addr;
+		kho_bootmem[i].size = size;
+		i++;
+	}
 
 	/*
 	 * Loop over nodes that have both memory and are online. Skip
-- 
2.50.1

