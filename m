Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3A033FE15
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 13:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789909690; cv=none; b=m/o65N+Qe0hQMAxoW+c/XE27QuoAjXQ7+bnfjyKp23tkDBPQyIoELavFyNNfXc3EfaCksL321ul8qmXsNyrLr+CaMezgdX2mxge5SJ4tgXAPqPTi6uz93Xm9JoO8b2ms5kSbMpTl87z0YHi3fR3ZdIEKTkoEsUGz6qHQky6pF1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789909690; c=relaxed/simple;
	bh=fycvPYT4pNgyVL1h+EKEfYMjT6fWgLYn2zYFaVoUk9g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QImHEDN0aO+KHG8pNB4mrBvHfybFvdGU3U6t1zwFr6ArFsAQf0auYfZ32dhXfdSpjkcYVEH1zMFOGLiZrh/qZPnOjAK6wxcLMAm12nyoxg579CvjY0XH1Ib5CLikQVmnvLb2GKxgXmH/lfve444H9Rymo7HG+nNeyaikRiVKlDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=goTjUqKV; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="goTjUqKV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=hN
	nb657Kpa7CCqjimnpKbxkMCn7r0L4fN9/W9GtbHuU=; b=goTjUqKVQ+HGtiN0MX
	HdQ7buPyVYNdUPgPS5lMumhS2ql3/ld+CMRTX7JWy8CV+dCce9INxb0mnsMrAK2q
	hr+9Xe0ZfPOwOQUtf0b4+8H5FimzoMGrMCI1J4U3RzeYGFQa/ykcvaIHyhOZt75m
	+njbmicXHIBbF2XxtFy6sqGco=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgBXe05v2q9q+Hy_AQ--.59097S2;
	Sun, 20 Sep 2026 21:06:56 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: radu@rendec.net,
	tglx@kernel.org
Cc: Pengpeng Hou <hppiscas@163.com>,
	Charles Mirabile <cmirabil@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lucas Zampieri <lzampier@redhat.com>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2] irqchip/sifive-plic: Avoid signed shift in interrupt enable mask
Date: Sun, 20 Sep 2026 21:06:53 +0800
Message-ID: <caplitmus-rv.v2.plic.87a8fc444de44e109889ba28703c76f3@163.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgBXe05v2q9q+Hy_AQ--.59097S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw4DuryxCFWrKryUWr4fAFb_yoW8Gw1xpF
	W5W3yvyr4fKa1j9Fy5CF4fZFy5W3sxtrW2kFZ7W34IqryYq3WkuF429345ZFn8try7Ar1U
	Cw4ftF45uFWkAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UjZX5UUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbCxRFZImqv2nHWwgAA3V

__plic_toggle() builds a 32-bit interrupt enable mask using a signed
integer literal. A valid interrupt selecting bit 31 evaluates 1 << 31,
which shifts a signed int into its sign bit.

Use BIT(), matching the equivalent mask construction in plic_irq_eoi().
The resulting mask remains representable in u32 on both RV32 and RV64.

The issue was found by our static-analysis tool.

Fixes: 8237f8bc4f6e ("irqchip: add a SiFive PLIC driver")
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
Changes since v1: https://lore.kernel.org/r/20260825151000.1-plic-bit31-caplitmus-rv@iscas.ac.cn/
- Fix the Fixes tag as requested by Radu; keep the code change unchanged.
- Rebase on 518e5b794c06.

 drivers/irqchip/irq-sifive-plic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 5b0dac1..d3d4187 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -108,7 +108,7 @@ static int plic_irq_set_type(struct irq_data *d, unsigned int type);
 static void __plic_toggle(struct plic_handler *handler, int hwirq, int enable)
 {
 	u32 __iomem *base = handler->enable_base;
-	u32 hwirq_mask = 1 << (hwirq % 32);
+	u32 hwirq_mask = BIT(hwirq % 32);
 	int group = hwirq / 32;
 	u32 value;
 

base-commit: 518e5b794c06c0f0eb40df3e202274a66202c137

