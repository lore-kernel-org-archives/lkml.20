Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4D722FE0E
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 06:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789626247; cv=none; b=PRlyXfMHN4wkK4VTxzwAkFY2WH3gkp2N5qTY/4zpJxL4grjprHVxdHG0+ofjkio8KRXJLi88uM7w4funDO4u/6ytIPsI1YGd60eW7iQ2Xo8EB3thN+3nLBGxNYo0RJWEcc/sG4ciMjbp2QiTxxfZNFn+yfMsRWX5flVWub88oKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789626247; c=relaxed/simple;
	bh=Q5oja4Um70WqQ5I6Co4sEnbZLnKgt+7NRis1IUZp3SE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ovDKgU6RWLgZQkR1vw509n8VzEKo+6Dj4dWuGxejuGg2j8RWHTgCW7HgAHH/teEi70+OdRMaGHKvZ7INxrePSzrCKBjTCD0ebeAShdZtNxuyV1kuxyO4yPYTA5JC3PkRNuClcNdtzVNsG2ngshNTgRnDTr0KQzXmq6Ec/PRCqtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=cUcKVzJl; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="cUcKVzJl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=kp
	Y1B2pDFZklM02cclz2tynwBoho1m74VIECrRMROQY=; b=cUcKVzJl3pl3/BIj+v
	ksB67/8bvIb5FuTzT/0GSiayoZIkgjx2ZQ3mwgq1rLRr+QO15WL3fdILJuFA4qPd
	+TUxG2sj/MxS0nTq/vLWIcZrRxWmk1CSFah6asr7zqLWhMo55U7jo8nb4PkzBgnK
	SsVBrr2tktsO4WeSqodAwKPEw=
Received: from thinkpadx13gen2i.. (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgDnsQdWh6tqj2MNSA--.29448S2;
	Thu, 17 Sep 2026 14:23:19 +0800 (CST)
From: Zongmin Zhou <min_halo@163.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: [PATCH] riscv: hwprobe: use _BITULL() rather than BIT() in MIPS vendor uapi header
Date: Thu, 17 Sep 2026 14:23:06 +0800
Message-Id: <20260917062306.46978-1-min_halo@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgDnsQdWh6tqj2MNSA--.29448S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7GFWfJrykAFyfGry3JrW8WFg_yoW8Jry3pF
	s8uFsYgrWrWr1xCFW7J3WxXrnIqw4rKa1YgFy8u3y8Ja9aqrW0qrs0yw13Z3WUtF4vqr4j
	gFn5uryFya9rA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UXZ2hUUUUU=
X-CM-SenderInfo: pplqsxxdorqiywtou0bp/xtbC8xh9KWqrh1g2OgAA3t

From: Zongmin Zhou <zhouzongmin@kylinos.cn>

BIT() is a kernel-internal macro that is not available to userspace, but
the MIPS vendor extension uapi header uses it without defining or
including it. Any userspace program that includes this header and uses
RISCV_HWPROBE_VENDOR_EXT_XMIPSEXECTL fails to build.

Use _BITULL(0) from linux/const.h instead, which keeps the value at 1,
so there is no ABI change.

Fixes: bb4b0f8a1bcb ("riscv: hwprobe: Add MIPS vendor extension probing")
Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
---
 arch/riscv/include/uapi/asm/vendor/mips.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/uapi/asm/vendor/mips.h b/arch/riscv/include/uapi/asm/vendor/mips.h
index e65ab268b265..a31c23afe74f 100644
--- a/arch/riscv/include/uapi/asm/vendor/mips.h
+++ b/arch/riscv/include/uapi/asm/vendor/mips.h
@@ -1,3 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 
-#define RISCV_HWPROBE_VENDOR_EXT_XMIPSEXECTL	BIT(0)
+#include <linux/const.h>
+
+#define RISCV_HWPROBE_VENDOR_EXT_XMIPSEXECTL	_BITULL(0)
-- 
2.34.1


No virus found
		Checked by Hillstone Network AntiVirus

