Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FACB3AE193
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 17:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791479008; cv=none; b=EnT0jG6/+PDApUd7g7u4d6UssKiGy8OFiFKBsLuBm8PldzRSs35jVGnVnnKyJJWmnABrwGdi1f70tsSBL/XWuK7LuO/kW02EXmdD7Pfop+1mjjljJHQ8J9WdT22sToTB2oeu93NucRgx35XoPJmqQsCSguBKFD0xBGeItVIe2hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791479008; c=relaxed/simple;
	bh=oriiIoFfuKtFhjdMhjDxYdLQCAVD+StjEtbxktY4AeE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sxzgG0m9YFikCs/HzL/CFw9bY7YcpMoFLIS8sKng5xXGrfo4oe3xPKA7MoPSA1hlD6txk1vQwCv/uqi7NjHLNd0Gq2+FjHNzfSkEBFSp2x+4qN0XiVGIh3tUxhSjI90EZJpPiat97feLL7MuNyFS65qC6Xt9G7+OlG4HssiO1+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from fc87d0ffb700.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowADn8T_bzMdq7rQOCg--.13223S2;
	Fri, 09 Oct 2026 01:03:23 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] clocksource/drivers/nomadik-mtu: fix resource leak on init error paths
Date: Fri,  9 Oct 2026 01:03:26 +0800
Message-Id: <20261008170326.2709703-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowADn8T_bzMdq7rQOCg--.13223S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr1xGry3Zry8Cw1rKr4UArb_yoW8ZFy5pF
	WUJFWYvwnxXr4Igr93tFnrZF9aka1xCFWUG3s3Can7AFnxJryxJF45JFyj9r13CrWfJa13
	tF4rta4DuF95ua7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUySb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF
	x2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14
	v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY
	67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2
	IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07beJ5wUUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAMOA2rHpfVfIgAAsC

nmdk_timer_of_init() maps the registers with of_iomap() and acquires the
"apb_pclk" and "timclk" clocks with of_clk_get_by_name(), but every error
path after that returns directly without releasing them. When the clock
lookups or irq_of_parse_and_map() fail, the iomap mapping and any already
obtained clock references are leaked.

Add rollback labels that put the clocks and unmap the registers on each
failure path.

Fixes: e46105aff5e5 ("clocksource/drivers/nomadik-mtu: Convert init function to return error")
Assisted-by: DeepSeek-V4.1-Flash
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/clocksource/nomadik-mtu.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/clocksource/nomadik-mtu.c b/drivers/clocksource/nomadik-mtu.c
index 53d0159cc6be..04740793da74 100644
--- a/drivers/clocksource/nomadik-mtu.c
+++ b/drivers/clocksource/nomadik-mtu.c
@@ -252,6 +252,7 @@ static int __init nmdk_timer_of_init(struct device_node *node)
 	struct clk *clk;
 	void __iomem *base;
 	int irq;
+	int ret;
 
 	base = of_iomap(node, 0);
 	if (!base) {
@@ -262,22 +263,33 @@ static int __init nmdk_timer_of_init(struct device_node *node)
 	pclk = of_clk_get_by_name(node, "apb_pclk");
 	if (IS_ERR(pclk)) {
 		pr_err("could not get apb_pclk\n");
-		return PTR_ERR(pclk);
+		ret = PTR_ERR(pclk);
+		goto out_iounmap;
 	}
 
 	clk = of_clk_get_by_name(node, "timclk");
 	if (IS_ERR(clk)) {
 		pr_err("could not get timclk\n");
-		return PTR_ERR(clk);
+		ret = PTR_ERR(clk);
+		goto out_clk_put_pclk;
 	}
 
 	irq = irq_of_parse_and_map(node, 0);
 	if (irq <= 0) {
 		pr_err("Can't parse IRQ\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto out_clk_put;
 	}
 
 	return nmdk_timer_init(base, irq, pclk, clk);
+
+out_clk_put:
+	clk_put(clk);
+out_clk_put_pclk:
+	clk_put(pclk);
+out_iounmap:
+	iounmap(base);
+	return ret;
 }
 TIMER_OF_DECLARE(nomadik_mtu, "st,nomadik-mtu",
 		       nmdk_timer_of_init);
-- 
2.25.1

