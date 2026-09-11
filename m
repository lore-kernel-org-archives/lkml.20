Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8F83E95A0;
	Fri, 11 Sep 2026 03:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789097307; cv=none; b=M6DsLYrtEx+qWXL4hhckpyfLRmx8Rzk9tdmZ3qO37tzbCDQR6uJ0Swhtilm94Yrw6GVYJoDldtilsHhZckpFc6yzXUnXb0i43BZLK5wKegJem0wO/FhvwQUzlpt4rEdkTI4NeYHQVg8Ui4Zl1jiwUpcNYe58F0VgMBlD/PKmdi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789097307; c=relaxed/simple;
	bh=5g0VP463kcwyn9tkUxV+RI/4+ednfZYPxSivnCWQb4Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=utISQmzTalPS4HTMFBNcVIPMw4cHs8JSKViZRtgRkkMt7cgP+7+8Kb8LWAf71M4TH5o+RmSY7qECGcslFlU7Aucrj9SGXSq31fItBO0wDYaCuW+3vhNYWN6wk+tI4uAw/uhRGmpDsB+W9/7jVBKGY8WTFf7/hpS3bIE3SJ4x5Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BDucrous; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BDucrous"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA27D1F000FF;
	Fri, 11 Sep 2026 03:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789097305;
	bh=N9blcEeeVVkCrQCOIeYD/reFetuknNAW0ll7RH3TTDQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BDucrousMH47zXE7txEPhdHKMX0Z1S+7ZumDxyQpMjfxMhR3VWmQRhCVYnON635E3
	 kTXz4Kdfk5Z/qlq3W5Bd89aBCejdW8bFVYwRyOYhVHmsY5vtJVcTjh+O9lSfCb1M6H
	 ZW0DQqnqHpDTfGEOv/G/8sDYjddf8RMwabHcqrg+rz/knPuvuB9P3d9XKLNH8OJ7Ny
	 paHfHEIYVEGvBwb0XkxX1MhCGGT4rqrVRG0ghcOr+erRQ9QQzNRbaHgABOz0VIPDpU
	 Z891QUVhOryVPoWAtdd9Zr0nFSmTckFrlG89rG451g82JX8GqW4oTXBRWcFj38w/YE
	 9FRJgDp+rITOQ==
From: "GUO Ren (XuanTie)" <guoren@kernel.org>
Date: Fri, 11 Sep 2026 03:27:13 +0000
Subject: [PATCH v2 5/6] irqchip/imsic: Use IPI_MAX instead of IMSIC_NR_IPI
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-ipi_max-v2-5-a77826ff189e@kernel.org>
References: <20260911-ipi_max-v2-0-a77826ff189e@kernel.org>
In-Reply-To: <20260911-ipi_max-v2-0-a77826ff189e@kernel.org>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Anup Patel <anup@brainfault.org>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
 Houlong Wei <houlong.wei@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, "GUO Ren (XuanTie)" <guoren@kernel.org>
X-Mailer: b4 0.16.0

IMSIC was defining its own IMSIC_NR_IPI (= 8) which happened to match
the architecture's IPI_MAX. Now that IPI_MAX is exported from riscv
asm/smp.h, use the architecture constant and drop the private define.

This keeps the number of multiplexed IPIs in sync with the rest of the
RISC-V IPI infrastructure.

Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
---
 drivers/irqchip/irq-riscv-imsic-early.c | 4 ++--
 drivers/irqchip/irq-riscv-imsic-state.h | 1 -
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
index 12efd241ce88..823f5f2ecb3d 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -67,12 +67,12 @@ static int __init imsic_ipi_domain_init(void)
 		return 0;
 
 	/* Create IMSIC IPI multiplexing */
-	virq = ipi_mux_create(IMSIC_NR_IPI, imsic_ipi_send);
+	virq = ipi_mux_create(IPI_MAX, imsic_ipi_send);
 	if (virq <= 0)
 		return virq < 0 ? virq : -ENOMEM;
 
 	/* Set vIRQ range */
-	riscv_ipi_set_virq_range(virq, IMSIC_NR_IPI);
+	riscv_ipi_set_virq_range(virq, IPI_MAX);
 
 	/* Announce that IMSIC is providing IPIs */
 	pr_info("%pfwP: providing IPIs using interrupt %d\n", imsic->fwnode, IMSIC_IPI_ID);
diff --git a/drivers/irqchip/irq-riscv-imsic-state.h b/drivers/irqchip/irq-riscv-imsic-state.h
index c42ee180b305..878cc192ccec 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.h
+++ b/drivers/irqchip/irq-riscv-imsic-state.h
@@ -13,7 +13,6 @@
 #include <linux/timer.h>
 
 #define IMSIC_IPI_ID				1
-#define IMSIC_NR_IPI				8
 
 struct imsic_vector {
 	/* Fixed details of the vector */

-- 
2.43.0

