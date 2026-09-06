Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1A1301709
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 08:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788682222; cv=none; b=kWSERsiRImoImdcaZ2DeVG5IeOJ4hkhDN0nOKKgZUvZDe1+3rr8ZOjRZovTnet1gfSb08//iDsmx66ofkg/ijDRhZX/tuQUsDmKGSyHvY7kA530tloJDmHBsdceJzguzTyIAnQGJXEqy1D0/lxQt6S7q8ih9/bE9Kk6bYZPiDEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788682222; c=relaxed/simple;
	bh=lDUBydP3nZrbRjFq7TKQx1XLdur+7UC2J0rV9SL5TOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MlCaAnrurjY5t0eGhTLNGzyx5nb0Xg3X5mKnrDmQVl07lUxtJk5QpzAw3RnF384H0hUQuXAcEDI+B0PzHVvOkxCEc49BKaRRWqAzktRcTI5Jh93f4fJti1sH0P1R/zj+5LQfthGKmDdEgDYYP91lUrlshOokD7qIivy9FDTCQXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=SPvxAPVv; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="SPvxAPVv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:Content-Type:
	MIME-Version; bh=f0EYHhzlbc4S4S50XoOMmZMO9nA45aQCMVmvAoFVo4M=;
	b=SPvxAPVvh4bZ1ZKpcx7KPB/ZBYlLTWqQv2Ee5RRSeF4ueTCGup0Rugu1GkbGXg
	xhXD1MG4QzHmrC3mgo0RDTjXrZH6A1IW3w2B8V4CpWszoNfcWnNcfa4CA1LCDec3
	bTzlhdz7ao+z9+FUqWlgaF5oaW/brQLtVpsTfaAN0upBw=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD330ewH51qYvTkAw--.36051S2;
	Sun, 06 Sep 2026 16:09:22 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Pengpeng Hou <hppiscas@163.com>,
	Radu Rendec <radu@rendec.net>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Bjorn Topel <bjorn@kernel.org>
Subject: [PATCH 2/2] irqchip/riscv-imsic: Reject overlapping group index fields
Date: Sun,  6 Sep 2026 16:09:18 +0800
Message-ID: <caplitmus-rv.bc36e3a0ebcb4a01838171f27625004b.imsic-overlap@163.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <caplitmus-rv.4f722288a2f1483090d75bcd991d5b90.imsic-cover@163.com>
References: <caplitmus-rv.4f722288a2f1483090d75bcd991d5b90.imsic-cover@163.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD330ewH51qYvTkAw--.36051S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Aw15tw1DJFyUXr43Gr4UJwb_yoW8WFy7pa
	n8CF4Fyr1UGa10vr4Ivayvqa4rK3s2yFZIgFW8Ars8C342qFn3G3WqyryrXwn8JF43Cw1f
	AF4YqFyUC3y8Ca7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U3HUgUUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbCxhL1vmqdH7IPCgAA3A

The IMSIC parser validates index widths but does not check that a
nonzero group field starts above the page, guest and hart fields.
A malformed layout can therefore assign one address bit to two fields.

Require the group shift to be at least the end of the lower fields.
Check the upper bound using subtraction after validating the shift, so
the bound check cannot wrap when processing a firmware-supplied value.

The issue was found by our static-analysis tool and manually reviewed.

Fixes: 21a8f8a0eb35 ("irqchip: Add RISC-V incoming MSI controller early driver")
Assisted-by: GPT-5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---

diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index 44b9c34c..c6eb16ae 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -742,8 +742,16 @@ static int __init imsic_parse_fwnode(struct fwnode_handle *fwnode,
 
 	/* Sanity check group index shift */
 	if (global->group_index_bits) {
-		i = global->group_index_bits + global->group_index_shift - 1;
-		if (i >= BITS_PER_LONG) {
+		i = IMSIC_MMIO_PAGE_SHIFT + global->guest_index_bits +
+		    global->hart_index_bits;
+		if (global->group_index_shift < i) {
+			pr_err("%pfwP: group index shift too small\n", fwnode);
+			return -EINVAL;
+		}
+
+		if (global->group_index_shift >= BITS_PER_LONG ||
+		    global->group_index_bits >
+		    BITS_PER_LONG - global->group_index_shift) {
 			pr_err("%pfwP: group index shift too big\n", fwnode);
 			return -EINVAL;
 		}

base-commit: 13ca1c0b7d8a3ab1e59cb3e780c1dd7441e22515

