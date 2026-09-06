Received: from out-zbxj-a65.jellyfish.systems (out-zbxj-a65.jellyfish.systems [198.54.127.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38D234D4C9
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 14:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.127.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788705945; cv=none; b=PUaBNRMGyMsAbEJL6Du0YbG3lZWKIh8J7c4kDCElaLyiDIg/OahTb7M0w115ep/3SThxEkSaEdRuX4XdAJaE1D8gzsXG/85+MiFTZtd2XR9j1kLrWNPPEcDBWHcVUHedtfu+0PAMuUONIUnu2mUVZtncmVt3Lj3izmSXk5ZZmWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788705945; c=relaxed/simple;
	bh=y6XbaEkzq3eWjzA5Rsgu6Cr8vfBC7xSBbLdTpXyIWIw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W47gq1XwzCl2M0jtXrvtaIp2FP7wWqtkmRzXFDKwgfb9NquROIhP8mob4EYZXlFoSSiD/27P+gq3cJ0nszBR30PTmg5EnmwaLl9YddONWSDz66NI/YGISRJQIFSPI3+n5xcnhVMQFyDHpVKyJU1SvEutPKNBscEdob4Nt/9YM6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tychen.cc; spf=pass smtp.mailfrom=tychen.cc; dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b=fGDW8m6X; arc=none smtp.client-ip=198.54.127.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b="fGDW8m6X"
Received: from fedora (unknown [69.5.53.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4hdCY16Ffmz2x9q;
	Sun, 06 Sep 2026 14:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1788705624;
	bh=SYRNVojqsH1/4lhtvXeoKfo9GZcaHz/Gw1aGpXQnbRw=;
	h=From:To:Cc:Subject:Date:From;
	b=fGDW8m6Xr+gZafIZuxWKLTwCPXyapmM6OTOGl5Vdf0suRyflErkMBFPCVjtcYz1CG
	 tdh1SDYBHPUlM3bl3WGDk0xQhOpMAK1hBBdw34MScuNLx+LA046CeoZTOwaCiwqfv0
	 o8G5z9vQRBLKDdMjE8Cw7Yv7cURciHU4jOlVuVqqOEnhjeSrNE0htQiLDXAmjdkN2V
	 hIqY3mNOmbbn+mlK4+ArpIfcvGJGV4W5qBinFNqq382ijoeryh4KiuwCcD29U/vVtn
	 6lV6UsMIMcs8obFJLmGIYSIM5lCSPX1VkgDZ/N0geJ2OTpaoSKLyMSJGat9tCeFDVg
	 2zfaE2crbOmaw==
From: Tianyi Chen <hi@tychen.cc>
To: rppt@kernel.org
Cc: Tianyi Chen <hi@tychen.cc>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] memblock tests: model the low allocation limit within dummy memory
Date: Sun,  6 Sep 2026 22:40:10 +0800
Message-ID: <20260906144011.848898-1-hi@tychen.cc>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: hi@tychen.cc

The simulator represents physical addresses using the address of its
allocated buffer. That buffer can lie above the default
ARCH_LOW_ADDRESS_LIMIT, preventing meaningful memblock_alloc_low()
tests.

Use the existing architecture override in asm/dma.h to place the limit
halfway through the dummy memory buffer. Resolve it after the buffer
has been allocated, so both low and high memory can be represented
regardless of its address. The production allocator is unchanged.

Assisted-by: LLM
Signed-off-by: Tianyi Chen <hi@tychen.cc>
---
 tools/testing/memblock/asm/dma.h      | 6 ++++++
 tools/testing/memblock/tests/common.c | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/tools/testing/memblock/asm/dma.h b/tools/testing/memblock/asm/dma.h
index 13ff8e5d22e..6607408dcf2 100644
--- a/tools/testing/memblock/asm/dma.h
+++ b/tools/testing/memblock/asm/dma.h
@@ -2,4 +2,10 @@
 #ifndef _TOOLS_DMA_H
 #define _TOOLS_DMA_H
 
+#include <linux/types.h>
+
+phys_addr_t dummy_physical_memory_low_limit(void);
+
+#define ARCH_LOW_ADDRESS_LIMIT dummy_physical_memory_low_limit()
+
 #endif
diff --git a/tools/testing/memblock/tests/common.c b/tools/testing/memblock/tests/common.c
index 3250c8e5124..4e6a920c459 100644
--- a/tools/testing/memblock/tests/common.c
+++ b/tools/testing/memblock/tests/common.c
@@ -118,6 +118,11 @@ phys_addr_t dummy_physical_memory_base(void)
 	return (phys_addr_t)memory_block.base;
 }
 
+phys_addr_t dummy_physical_memory_low_limit(void)
+{
+	return dummy_physical_memory_base() + MEM_SIZE / 2;
+}
+
 static void usage(const char *prog)
 {
 	BUILD_BUG_ON(ARRAY_SIZE(help_opts) != ARRAY_SIZE(long_opts) - 1);
-- 
2.55.0

