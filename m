Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9F52F7EE8
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 13:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789909795; cv=none; b=PSokG+5ypwZJJoxVgKqAV+74mpzY7ZjzpI9+mV05VX/TU6Q4x35IsBnK0DDzDIYdfEDg8sqZFISF5sHylO+J0tjgarVlR4wAcfjasvysUrKMnWDfS4FGba9Ht+32dIpZAH5Jaqwkpv8H9jsaQqYT+hB4Eu5U1SvzgX7v3cPSEGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789909795; c=relaxed/simple;
	bh=MGzd3sO0XsD2CvjwgVj7vRAIeqB7LfTcy+s3teErhK0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Itg2hIrHisa1gG0lTsYWvRB7MXjicJDLJNiWciEv5KKCRETHiiRxOlSEgWfonn8Zxam7aQ1TLWXxhjRUqj+J9t8MN7PxXdf3rBaU7vdeunoOy2XXW1JZAa+iowMRsC/ZAruLMEgrEF+74pN1LmRZnM9/zLmgrK6Y7FIQEhyMGNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=EFXNjJyB; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="EFXNjJyB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=op
	4ci3atcTIV+rqmbvDsOvrO6hoczewdGO7KOjT5po4=; b=EFXNjJyBfepMucnsNj
	Q0yj3MFFrgQeDBSZo8ca0C9J8NjvzqMNtnrLIkUL8wTV0ZR43E0m8KO3dn7nNEFv
	usG+2/B1Jm8omYNDMy/fy+dzzURWJAZoNqlrwM1/S/Ao9c7xT6ez1YsNXkyyMPiC
	zrNEKSC4x49AdM1qKCMOvP7ew=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgDXpdSr2q9qh4vBAQ--.39985S2;
	Sun, 20 Sep 2026 21:07:56 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: anup@brainfault.org,
	tglx@kernel.org
Cc: Pengpeng Hou <hppiscas@163.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Bjorn Topel <bjorn@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Radu Rendec <radu@rendec.net>
Subject: [PATCH v2] irqchip/riscv-imsic: Reject overlapping group index fields
Date: Sun, 20 Sep 2026 21:07:54 +0800
Message-ID: <caplitmus-rv.v2.imsic.f2c0e5bdc627451c83deb0cf7eb8834a@163.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgDXpdSr2q9qh4vBAQ--.39985S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tFWDCFWrKFWfKw48JryfXrb_yoW8uFW7pF
	Z8GrW09ryUCay09rW2v3WvqFyFgwn7AFZ0gFWUAw43Wry2vFn7Was0y3yrXw1DGF4Sk34x
	tF4YqryDGay8C3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UUpnPUUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7gxoMWqv2qwIQQAA3B

The IMSIC address layout places the group index above the page offset,
guest index and HART index. imsic_parse_fwnode() checks the individual
field widths and the upper end of the group field, but does not check
that its lower end is above the other fields.

Reject a nonzero group field whose shift overlaps the lower fields.
Otherwise a firmware-supplied layout can assign the same address bit to
different indices when MSI target addresses are constructed.

Keep the existing upper-bound check unchanged. The new lower-bound
check applies only when group index bits are present.

The issue was found by our static-analysis tool.

Fixes: 21a8f8a0eb35 ("irqchip: Add RISC-V incoming MSI controller early driver")
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
Changes since v1: https://lore.kernel.org/r/caplitmus-rv.bc36e3a0ebcb4a01838171f27625004b.imsic-overlap@163.com/
- Limit the change to the lower-bound check discussed with Anup.
- Keep the existing upper-bound check unchanged.
- Send this as a standalone patch, without the zero-width-group change.
- Do not change APLIC configuration or require the earlier series.

 drivers/irqchip/irq-riscv-imsic-state.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index b8d1bbb..a7b241f 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -739,6 +739,14 @@ static int __init imsic_parse_fwnode(struct fwnode_handle *fwnode,
 		return -EINVAL;
 	}
 
+	/* Group index bits must not overlap guest and HART index bits. */
+	i = IMSIC_MMIO_PAGE_SHIFT + global->guest_index_bits +
+	    global->hart_index_bits;
+	if (global->group_index_bits && global->group_index_shift < i) {
+		pr_err("%pfwP: group index shift too small\n", fwnode);
+		return -EINVAL;
+	}
+
 	/* Sanity check group index shift */
 	i = global->group_index_bits + global->group_index_shift - 1;
 	if (i >= BITS_PER_LONG) {

base-commit: 518e5b794c06c0f0eb40df3e202274a66202c137

