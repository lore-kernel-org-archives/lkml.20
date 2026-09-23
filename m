Received: from mta0.migadu.com (out-55.mta0.migadu.com [91.218.175.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FA3345750
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790127576; cv=none; b=HFvWj6+4CpcPHnv4TD8q6SfqJjCwXCwCjJ+kiCfFKH1WxGl4p4dd0U32tuYKI/FXJEmirHBrWGLu8Z9iNAnPuvxbvSNLvsItCHblsN7mAP4ynHlAMz6Oro4agyFjrd8M6qhAIphxuSd5DBHUufJKmMb0GwUyOBzeUQaYrUJrGoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790127576; c=relaxed/simple;
	bh=QblcXYUfe5vm9aEiyal5oASFj94h7Yg01drrDC5pSPY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D5lx+lNKBLO6zbCl4+M7l/2g/AxJzv/3JukVV6ZibKnN+2CkUAemxZH97ar4WmwnsVPptZ3Cv9gL7MaHU0VjkaBTbch5IdUyRqQZk0KzcfqOqLmXnqZkK7vxAspWdv1cq7jccfAtklrPNtsfi+OqWuznEfHjhesOl9VMtx5ZTOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gL8/LjEJ; arc=none smtp.client-ip=91.218.175.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gL8/LjEJ"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=QblcXYUfe5vm9aEiyal5oASFj94h7Yg01drrDC5pSPY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790127571; v=1; x=1790732371;
 b=gL8/LjEJ7tldjcLTAgEgw/g9vUfOI8efXiU23KIyuOluaXf9NaX+EBEc9a+4cr39Y26J3s9Q
 O91vjl8Wf5idqQA/90Q5Q+bJevpkLe9mErjNcCA+DcERXzkM3NT9mGsIU+uIuvZQdZ4/kTQ+iXG
 zTl9dkpPWuJ0JTGILmnwj1/Q=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e5dffd9b6f3a2118;
	Wed, 23 Sep 2026 01:39:21 +0000
X-Mizu-Trace-ID: e5dffd9b6f3a2118
X-Migadu-Flow: FLOW_OUT
From: Qingfang Deng <qingfang.deng@linux.dev>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Qingfang Deng <qingfang.deng@linux.dev>,
	Thomas Gleixner <tglx@kernel.org>,
	Nam Cao <namcao@linutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v3] riscv: use generic relaxed MMIO accessors
Date: Wed, 23 Sep 2026 09:39:08 +0800
Message-ID: <20260923013913.357710-1-qingfang.deng@linux.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The relaxed MMIO accessors duplicate the generic implementation, as noted
by their FIXME comment. Remove those definitions and their empty barrier
hooks so asm-generic/io.h supplies them through the existing asm/io.h
include path.

The M-mode timer uses the lightweight asm/mmio.h header before the
generic relaxed accessors are available. Use readl_cpu() and readq_cpu()
there, which perform the same accesses and endian conversion as the
existing relaxed accessors.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
---
v3: don't touch asm-generic, and preserve custom __raw_* helpers.

v2: split asm-generic/io.h to fix M-mode build
    https://lore.kernel.org/linux-riscv/20260920014357.7069-2-qingfang.deng@linux.dev/

v1: https://lore.kernel.org/linux-riscv/20250530032252.3092502-1-dqfext@gmail.com/
---
 arch/riscv/include/asm/mmio.h  | 27 ---------------------------
 arch/riscv/include/asm/timex.h |  6 +++---
 2 files changed, 3 insertions(+), 30 deletions(-)

diff --git a/arch/riscv/include/asm/mmio.h b/arch/riscv/include/asm/mmio.h
index 06cadfd7a237..61299a093b75 100644
--- a/arch/riscv/include/asm/mmio.h
+++ b/arch/riscv/include/asm/mmio.h
@@ -98,33 +98,6 @@ static inline u64 __raw_readq(const volatile void __iomem *addr)
 #define writeq_cpu(v, c)	((void)__raw_writeq((__force u64)cpu_to_le64(v), (c)))
 #endif
 
-/*
- * Relaxed I/O memory access primitives. These follow the Device memory
- * ordering rules but do not guarantee any ordering relative to Normal memory
- * accesses.  These are defined to order the indicated access (either a read or
- * write) with all other I/O memory accesses to the same peripheral. Since the
- * platform specification defines that all I/O regions are strongly ordered on
- * channel 0, no explicit fences are required to enforce this ordering.
- */
-/* FIXME: These are now the same as asm-generic */
-#define __io_rbr()		do {} while (0)
-#define __io_rar()		do {} while (0)
-#define __io_rbw()		do {} while (0)
-#define __io_raw()		do {} while (0)
-
-#define readb_relaxed(c)	({ u8  __v; __io_rbr(); __v = readb_cpu(c); __io_rar(); __v; })
-#define readw_relaxed(c)	({ u16 __v; __io_rbr(); __v = readw_cpu(c); __io_rar(); __v; })
-#define readl_relaxed(c)	({ u32 __v; __io_rbr(); __v = readl_cpu(c); __io_rar(); __v; })
-
-#define writeb_relaxed(v, c)	({ __io_rbw(); writeb_cpu((v), (c)); __io_raw(); })
-#define writew_relaxed(v, c)	({ __io_rbw(); writew_cpu((v), (c)); __io_raw(); })
-#define writel_relaxed(v, c)	({ __io_rbw(); writel_cpu((v), (c)); __io_raw(); })
-
-#ifdef CONFIG_64BIT
-#define readq_relaxed(c)	({ u64 __v; __io_rbr(); __v = readq_cpu(c); __io_rar(); __v; })
-#define writeq_relaxed(v, c)	({ __io_rbw(); writeq_cpu((v), (c)); __io_raw(); })
-#endif
-
 /*
  * I/O memory access primitives.  Reads are ordered relative to any following
  * Normal memory read and delay() loop.  Writes are ordered relative to any
diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/timex.h
index f660afa30530..9c4550902935 100644
--- a/arch/riscv/include/asm/timex.h
+++ b/arch/riscv/include/asm/timex.h
@@ -17,18 +17,18 @@ typedef unsigned long cycles_t;
 #ifdef CONFIG_64BIT
 static inline cycles_t get_cycles(void)
 {
-	return readq_relaxed(clint_time_val);
+	return readq_cpu(clint_time_val);
 }
 #else /* !CONFIG_64BIT */
 static inline u32 get_cycles(void)
 {
-	return readl_relaxed(((u32 __iomem *)clint_time_val));
+	return readl_cpu(((u32 __iomem *)clint_time_val));
 }
 #define get_cycles get_cycles
 
 static inline u32 get_cycles_hi(void)
 {
-	return readl_relaxed(((u32 __iomem *)clint_time_val) + 1);
+	return readl_cpu(((u32 __iomem *)clint_time_val) + 1);
 }
 #define get_cycles_hi get_cycles_hi
 #endif /* CONFIG_64BIT */
-- 
2.43.0

