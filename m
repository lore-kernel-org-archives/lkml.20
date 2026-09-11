Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE703DC4D9;
	Fri, 11 Sep 2026 03:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789097290; cv=none; b=VNCm48e61BapKNN2HHpBgfn7K8SvQqs/U7m57Od3E3UM37xLHok/cbKzjb5EurZe++5cVEF2QW8qCsANJlX+Q+AKBQIW0Yf5t8mwE16C/3XbyryzAklahbMNuWVmZPGluds3IWpUKWtXosJPxVS8TidvZoUbECVVf5aB5upwPl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789097290; c=relaxed/simple;
	bh=tmrKbZe/FQ5ZENJfY5AZXndssTok4+AJnBT6nbKFwc8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rkeMuYfg7EcV4xaRtgsmYYzQtQ5svHLOFem9m7nAL7Wue7xY3+EQRaD8IZTG6VO6WPDRFrRlS4h1H97C+j0Q41Mo6rvHAk8meQc2SuaugWliALmNU18Mr6n5Oapn2Vgt6oeKUl2Kzx3m8I0OnLmfhvxchxa6Ij1191KJNrPYVTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=feUh0UZB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="feUh0UZB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AB181F000FF;
	Fri, 11 Sep 2026 03:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789097288;
	bh=QbMD56baPgM+e8xPeMNNZSCp/t9stBa6OwHW9SFOA28=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=feUh0UZBssO51F57kDi2j/ZaL6ovAYwz5gkKITjjKUh0UlXjPERvne8pnMQ/QpT0U
	 oPsXx4uVqHTmf3eX8kkEtBqAYPgRGiOX8plVLwQLdoE4w2qpWbXd0c3C1FChmKHrzm
	 upH51A4XT7x2TmOdH623XueCJMkvtDqnf6koNB1scqwAbu1ylwL4RVtQFkC4SV0WcW
	 qHFD4uE8JKaIwQS5dtHxVGdA8NxRjO0pbWlEpV9PdoQR4E6vNCeUFVLKGGiC6UdJe0
	 B5Lr268ylvHEGQV1+szYoiLWXi4yPm+cM8SZUXT19AlyAH1ZebLVzplzmC5MrsTiEG
	 dc84KF0TWuwJQ==
From: Guo Ren <guoren@kernel.org>
Date: Fri, 11 Sep 2026 03:27:10 +0000
Subject: [PATCH v2 2/6] riscv: sbi: Use IPI_MAX for SBI IPI muxing
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-ipi_max-v2-2-a77826ff189e@kernel.org>
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
 linux-mediatek@lists.infradead.org, 
 "tip-bot2 for GUO Ren (XuanTie)" <tip-bot2@linutronix.de>, 
 "GUO Ren (XuanTie)" <guoren@kernel.org>
X-Mailer: b4 0.16.0

From: "tip-bot2 for GUO Ren (XuanTie)" <tip-bot2@linutronix.de>

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     2a0d49514f297baee259b19fb5553b538aa67d10
Gitweb:        https://git.kernel.org/tip/2a0d49514f297baee259b19fb5553b538aa67d10
Author:        GUO Ren (XuanTie) <guoren@kernel.org>
AuthorDate:    Sun, 16 Aug 2026 07:00:46
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Fri, 04 Sep 2026 15:34:34 +02:00

riscv: sbi: Use IPI_MAX for SBI IPI muxing

Now that IPI_MAX is visible from <asm/smp.h>, replace the hard-coded
BITS_PER_BYTE with the proper symbolic constant in the SBI IPI
extension driver.

No functional change; IPI_MAX is still 8.

Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Anup Patel <anup@brainfault.org>
Link: https://patch.msgid.link/20260816070049.2097442-3-guoren@kernel.org
---
 arch/riscv/kernel/sbi-ipi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/sbi-ipi.c b/arch/riscv/kernel/sbi-ipi.c
index 0cc5559c08d8..eeec178a9b95 100644
--- a/arch/riscv/kernel/sbi-ipi.c
+++ b/arch/riscv/kernel/sbi-ipi.c
@@ -57,7 +57,7 @@ void __init sbi_ipi_init(void)
 		return;
 	}
 
-	virq = ipi_mux_create(BITS_PER_BYTE, sbi_send_ipi);
+	virq = ipi_mux_create(IPI_MAX, sbi_send_ipi);
 	if (virq <= 0) {
 		pr_err("unable to create muxed IPIs\n");
 		irq_dispose_mapping(sbi_ipi_virq);
@@ -75,7 +75,7 @@ void __init sbi_ipi_init(void)
 			  "irqchip/sbi-ipi:starting",
 			  sbi_ipi_starting_cpu, NULL);
 
-	riscv_ipi_set_virq_range(virq, BITS_PER_BYTE);
+	riscv_ipi_set_virq_range(virq, IPI_MAX);
 	pr_info("providing IPIs using SBI IPI extension\n");
 
 	/*

-- 
2.43.0

