Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48EB3A453A
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 17:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791481458; cv=none; b=d/soHwMkBv/h+NqF86GIO1CWkiPGHkgcf5/BXLihRCNg0PR+M5Rn2NIkgHONhYZ75IY0XId990iLKeS1R/BvnmoFnOwzTsCcxkD2+uxDaxHpHaBC7u90Gr5iNmXsGiWHVA0FMd9jqs4GqXIDmPA3iOL6DmnkfKzhTca7qH1v7+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791481458; c=relaxed/simple;
	bh=sm8V1RsF/IdceN9JxRVyTs9Qz6io+efsEXNp0Guu/Hk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XmJ0SNrz1wS1cerZck6MN/EkyIlN+ZPH98TdsJEr+90+gT6XtyK361UAqBhkaIefGz0tKdf3Q9/r5G3u9vyXo2mKuCWBhyFYgka7IaG/BXi4hTDa5x9OMQz5IO7jLrgDAxaYu+wh2ZqDE5j5Nvl76qkf/whX1e4d3Npd8bCmyJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from fc87d0ffb700.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowADX3Dpp1sdqpZYPCg--.13859S2;
	Fri, 09 Oct 2026 01:44:10 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] irqchip/mchp-eic: fix clk reference leak on probe error paths
Date: Fri,  9 Oct 2026 01:44:12 +0800
Message-Id: <20261008174412.2740045-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowADX3Dpp1sdqpZYPCg--.13859S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AFykCw1ktryrXr4fKrWUXFb_yoW8Wr1xpF
	W7Ja9avFZ7GFWF9r4DJw4kZry5Kw4ayFWxG3yfC3ZFqwnxJryjyFWFya4DZr45AFWxG3WU
	Gws0qFykAFyDZFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkvb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWU
	twCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
	1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij
	64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr
	0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jrManUUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAAOA2rHpfVxuQAAs0

mchp_eic_probe() acquires the peripheral clock with
of_clk_get_by_name(), which takes a reference on the underlying struct
clk, but the error paths only call clk_disable_unprepare() and never
clk_put(). When clk_prepare_enable() fails, or when of_irq_parse_one(),
the IRQ argument validation or irq_domain_create_hierarchy() fails, the
probe function jumps to the cleanup labels, frees the private data and
returns with the clock reference still held.

Release the clock reference with clk_put() on all error paths that occur
after the clock has been successfully looked up.

Fixes: 00fa3461c86d ("irqchip/mchp-eic: Add support for the Microchip EIC")
Assisted-by: DeepSeek-V4.1-Flash
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/irqchip/irq-mchp-eic.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-mchp-eic.c b/drivers/irqchip/irq-mchp-eic.c
index be007d325e67..5250e6baff63 100644
--- a/drivers/irqchip/irq-mchp-eic.c
+++ b/drivers/irqchip/irq-mchp-eic.c
@@ -233,7 +233,7 @@ static int mchp_eic_probe(struct platform_device *pdev, struct device_node *pare
 
 	ret = clk_prepare_enable(eic->clk);
 	if (ret)
-		goto unmap;
+		goto clk_put;
 
 	for (i = 0; i < MCHP_EIC_NIRQ; i++) {
 		struct of_phandle_args irq;
@@ -270,6 +270,8 @@ static int mchp_eic_probe(struct platform_device *pdev, struct device_node *pare
 
 clk_unprepare:
 	clk_disable_unprepare(eic->clk);
+clk_put:
+	clk_put(eic->clk);
 unmap:
 	iounmap(eic->base);
 free:
-- 
2.25.1

