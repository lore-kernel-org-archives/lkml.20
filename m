Received: from out-zbxj-a67.jellyfish.systems (out-zbxj-a67.jellyfish.systems [198.54.127.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6814825B6
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 23:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.127.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788998153; cv=none; b=krbXDLL5YXIC0+pltBeGFIED7bAU6xKsp90DDMg5GVDjlzgOT1RwKEAtAmWT9qo/4YP/fKJlj/71q1jA5k3ctfgSmp/2mTWXxUfgICuFgviQZYjb2mi25KhgR/JWh32AL9pRe8tl+8W7TYVSWA9Iknyiy17wsrhaMw2UoUDQdHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788998153; c=relaxed/simple;
	bh=5qk7BOw2pJ5DRi/y2Ft6dCgao63lL/TCifogQvFY3E4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CvL7du81B+Syg4nTFi2ArRJpJ2AH5w/kHQQkJbxxpt7m6GHGscJI0Ms01rkR/hcsb6cSz57oF+qJ8ooUFZuu+ofEgBbYWh+rxIsNnH8WLyksMzfgVQn+MltXir+fJbxtinE9Z9h3JY24D7cuEKROzZ2ipvZ6TdXyBoLJ+LmtSzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc; spf=pass smtp.mailfrom=tychen.cc; dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b=EPVxsCbz; arc=none smtp.client-ip=198.54.127.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b="EPVxsCbz"
Received: from 192.168.5.7 (unknown [23.142.132.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4hgHkC2CxVz2x99;
	Wed, 09 Sep 2026 23:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1788998133;
	bh=1z3Z8gwjIPEJ7RUurdh1RsBPbnoHaInN21ppueWrqqM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EPVxsCbz1LPCAxLcZgiOsedsqzRRSGjZ6JPsEEA3TU9opRqGOLKW1p4c0+eucT89d
	 NItqVcuK+XOGakvFLMit+6z1tLJ/W3cmGARIC08kiOws+MBQ+zGpPOc/eVf/WVIHaP
	 RPkEsj/tYWB0ooWque7FrnfbaXXq62hOQTxko82e/IGb7/uFrjK/AGzZLJP6kY3BQk
	 ixVsilravnf4s+bNp9usLKRTuv84plip8G8S9uYuyLWJ5YdUYGJR6dFMDt4Qt5t899
	 9PY2un3xwUcOUENCndcyt0aXFdpkdyN7VUtxv1dNdidS3egif2+IRBKW+lgpjmQXvL
	 p3gsrs4zGGfMA==
From: Tianyi Chen <hi@tychen.cc>
To: Mike Rapoport <rppt@kernel.org>
Cc: akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	hi@tychen.cc
Subject: [PATCH v3 1/2] memblock tests: model the low allocation limit within dummy memory
Date: Thu, 10 Sep 2026 07:55:28 +0800
Message-ID: <f16c272cd52316b83c35d87987b4d8687c4a3182.1788997523.git.hi@tychen.cc>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788997523.git.hi@tychen.cc>
References: <cover.1788997523.git.hi@tychen.cc>
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

Use the architecture override in asm/dma.h to place the limit halfway
through the memory registered by setup_memblock(). Resolve the limit
after allocating the buffer, leaving registered memory on both sides.

Assisted-by: LLM
Signed-off-by: Tianyi Chen <hi@tychen.cc>
---
 tools/testing/memblock/asm/dma.h      | 6 ++++++
 tools/testing/memblock/tests/common.c | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/tools/testing/memblock/asm/dma.h b/tools/testing/memblock/asm/dma.h
index 13ff8e5d22ef..6607408dcf25 100644
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
index 3250c8e5124b..ac032610a56e 100644
--- a/tools/testing/memblock/tests/common.c
+++ b/tools/testing/memblock/tests/common.c
@@ -118,6 +118,12 @@ phys_addr_t dummy_physical_memory_base(void)
 	return (phys_addr_t)memory_block.base;
 }
 
+phys_addr_t dummy_physical_memory_low_limit(void)
+{
+	/* The low limit is halfway through memory registered by setup_memblock(). */
+	return dummy_physical_memory_base() + MEM_SIZE / 2;
+}
+
 static void usage(const char *prog)
 {
 	BUILD_BUG_ON(ARRAY_SIZE(help_opts) != ARRAY_SIZE(long_opts) - 1);
-- 
2.55.0

