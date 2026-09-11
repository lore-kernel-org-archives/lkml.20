Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D463E9C18;
	Fri, 11 Sep 2026 03:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789097301; cv=none; b=L949jjSkyj5JRG76EmzVsZuLEta9qVWZW0UzFHWV8DRMb1wDUmlqpmW60AO+//BSFNiko+7TCJ8xHfWRSxYA0lOXbUjQ2xpahFZaTtlEbrGok4jV/zlhwFfU66Wglj9MOw2pqE0cF6ZnDZZqOC9zlVdETwvXfqegdL42I5coZU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789097301; c=relaxed/simple;
	bh=EUMCGif4z8csooEEPaauTE89H1b2IejruCat9pT3H0I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PwWUYumuWh5sZkxYa/jGvluCM02DpoMMaMM3zLarLEdoM3MwBBF9iqkqxABeJfmbNdRNWwwb3BkPsmTCkkr1TUGcaJl4mR6BEAKoR0ePS9UEKexmslzf1c5d+KlwK7oKKnGoaJCB91bByFoqC/8sl8FsNvwJyAcX7DiJy5Td9fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MuyGIa+L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MuyGIa+L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BF6A1F00899;
	Fri, 11 Sep 2026 03:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789097300;
	bh=2A7ZXlaUgzKlIRf43CRGlNeTsk8uPGumps0WoOKIcXc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MuyGIa+L/7cRt+s9yK++OGfB5nWowDjYEv1WlWuvCKsgNWQptCipSm14Izdt6MC44
	 grmDwu0q2rrcHBigQ50y3j2QnUciLRSgV+xV4+N+HHLeTvz93vGTIUuENqTcr3DWXp
	 T/m88xKj/K/GHQQpaTnDH4HJ0dWbCC1BSIHrM6LIpKVERDQMQnWHgHCcCzLEwVQPm9
	 prwZ5cRFWxgzvHrYATZv6clkE82Cj/q7GUish2stIk4jOwiSiEN+TRGVCIR7hbpdT1
	 +esHCjSrskLUiRyY/LLVcYTQQagknazLYF1ApB+n5khIhE8fviQ/4DRmWoo8hN09QF
	 HG5HVnk7OkGVw==
From: "GUO Ren (XuanTie)" <guoren@kernel.org>
Date: Fri, 11 Sep 2026 03:27:12 +0000
Subject: [PATCH v2 4/6] irqchip/aclint-sswi: Use IPI_MAX for IPI muxing
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-ipi_max-v2-4-a77826ff189e@kernel.org>
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

Replace the hard-coded BITS_PER_BYTE with IPI_MAX now that the constant
is exported from riscv asm/smp.h.

Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
---
 drivers/irqchip/irq-aclint-sswi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-aclint-sswi.c b/drivers/irqchip/irq-aclint-sswi.c
index ca06efd86fa1..5e010fc401f7 100644
--- a/drivers/irqchip/irq-aclint-sswi.c
+++ b/drivers/irqchip/irq-aclint-sswi.c
@@ -138,7 +138,7 @@ static int __init aclint_sswi_probe(struct fwnode_handle *fwnode)
 	}
 
 	/* Register SSWI irq and handler */
-	virq = ipi_mux_create(BITS_PER_BYTE, aclint_sswi_ipi_send);
+	virq = ipi_mux_create(IPI_MAX, aclint_sswi_ipi_send);
 	if (virq <= 0) {
 		pr_err("unable to create muxed IPIs\n");
 		irq_dispose_mapping(sswi_ipi_virq);
@@ -152,7 +152,7 @@ static int __init aclint_sswi_probe(struct fwnode_handle *fwnode)
 			  aclint_sswi_starting_cpu,
 			  aclint_sswi_dying_cpu);
 
-	riscv_ipi_set_virq_range(virq, BITS_PER_BYTE);
+	riscv_ipi_set_virq_range(virq, IPI_MAX);
 
 	return 0;
 }

-- 
2.43.0

