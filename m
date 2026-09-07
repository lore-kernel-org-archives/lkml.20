Received: from out-zbxj-a76.jellyfish.systems (out-zbxj-a76.jellyfish.systems [198.54.127.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B50221FC6
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 01:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.127.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788744062; cv=none; b=jb6filXe1APvZEYuzzMvOJiqZaXlhT5BGitzBFe6p9O8i4N+ljl4Qid2CtncJmU3g82h4vXVXB/VgEEFoqJiPDGCRbLHzmoR/QyH8gEh84S9uX8CEspTCxzJGZVTCpk8SycBHSPLdgDg7GvQgt3cRDNA9L9UJucFJ6ODkIgQRhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788744062; c=relaxed/simple;
	bh=EF89F/rML0MvWu2VUpwLwaQHSYL9rDe95zy54eaqX3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WlS3I/s43kMymbi8wwouq4dRjjvd4J6jJtzbL7sJPvDg5wRfrqJf6MJKR8HCvROt0QOGDHPz1RHbdOohtAo+/iJmLeX5KnC/n3bmauDlJ7r5isEb5IZun5RJ8klvzHCdjAKfac0PdgEwi7L40Weql1Htyp8n5vID7ZVCExOqyfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tychen.cc; spf=pass smtp.mailfrom=tychen.cc; dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b=DTKK35OQ; arc=none smtp.client-ip=198.54.127.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b="DTKK35OQ"
Received: from 192.168.5.3 (unknown [69.5.53.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4hdTlp3qYJz6tm9;
	Mon, 07 Sep 2026 01:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1788744041;
	bh=WeYc57y9dpWFhwnMjk7xB4VJwaE3zD67JULtkUrpWOg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DTKK35OQ5Om9kOlvj84tQvC33bc6umR21uym8RF8lQOtFSDb9/ZD3RtjKnh0Wa0Zb
	 4/+UmvVm3Hr5Vuy16wRnHwKBjli+Ls5Wc8QV/lVw//t1LoRAJ07YhW4qQMRNplkLhA
	 q1PEeX5GxGjruVfj5LeMmHBQxtwHcqxO+TFW3Wkt7/TRG6sWRJWeE8fJZiR8TDcBt/
	 YrVgWnwIN4tp2I34bobuIR2vWODDDmNcHn3SvBURS77IvJrxTMffbPpBtI6y4sPGmL
	 JpOfoEHAQ/gwu1wqGePM8fLSSPRzkGfE1Sg3uYEFLHJ7hfaVFBdhzkRGKK8u2NAf+L
	 KKnim+e4k7G8w==
From: Tianyi Chen <hi@tychen.cc>
To: rppt@kernel.org
Cc: Tianyi Chen <hi@tychen.cc>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] memblock tests: model the low allocation limit within dummy memory
Date: Mon,  7 Sep 2026 09:20:32 +0800
Message-ID: <178874362959.1415955.9346611507889046159.memblock-v2-1@tychen.cc>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <178874362959.1415955.18132997964995947947.memblock-v2-0@tychen.cc>
References: <20260906144011.848898-1-hi@tychen.cc> <178874362959.1415955.18132997964995947947.memblock-v2-0@tychen.cc>
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
through the MEM_SIZE region registered by setup_memblock(). This leaves
registered memory on both sides of the limit. PHYS_MEM_SIZE describes
the larger backing allocation, rather than the registered region.
Resolve the limit after allocating the buffer. The production allocator
is unchanged.

Assisted-by: Codex:GPT-6
Signed-off-by: Tianyi Chen <hi@tychen.cc>
---
 tools/testing/memblock/asm/dma.h      | 6 ++++++
 tools/testing/memblock/tests/common.c | 6 ++++++
 2 files changed, 12 insertions(+)

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
index 3250c8e5124..17b95af216b 100644
--- a/tools/testing/memblock/tests/common.c
+++ b/tools/testing/memblock/tests/common.c
@@ -118,6 +118,12 @@ phys_addr_t dummy_physical_memory_base(void)
 	return (phys_addr_t)memory_block.base;
 }
 
+phys_addr_t dummy_physical_memory_low_limit(void)
+{
+	/* Split the MEM_SIZE region registered by setup_memblock(), not the buffer. */
+	return dummy_physical_memory_base() + MEM_SIZE / 2;
+}
+
 static void usage(const char *prog)
 {
 	BUILD_BUG_ON(ARRAY_SIZE(help_opts) != ARRAY_SIZE(long_opts) - 1);
-- 
2.55.0

