Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8B231ED7C
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 16:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791475373; cv=none; b=e1JVJ7KoqdH5r4e8k1CL7XbZAclU3rFYRiItWHzw14/gdMUKsGV0LunH+sQ5R2AnsjFF8vFGQvPD+UNKuD/MyR+Ccn+zzlXGQ/xsbLemqQIsZ08SOn8YkP987UMTAQhrlb60Nlg5vOt2tloOI95c1nU2mL7L6pz03gD8lAKn748=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791475373; c=relaxed/simple;
	bh=k8kcPjLrvT/Z5owlfsYABtXFh/r1Q4aZ/KajH1z80Po=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=InucikDIjpE4iO4OvBOMRu92UgYuSDiMY4ZE1cq6AEp30B3P44aG+oLmfZ1lagVHR5lVx4XmgsC7z/Ms63rbbHnmbuBhvwJM3DcfIF41QjoNI+A+ASQEoVtwiaa9WGWiPLfqKRyurmk9EkUasbuHfJV0rsSb5BlxBbpso0mPH9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from fc87d0ffb700.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowAAHET+gvsdqK6INCg--.11345S2;
	Fri, 09 Oct 2026 00:02:40 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ezequiel Garcia <ezequiel.garcia@imgtec.com>,
	Govindraj Raja <govindraj.raja@imgtec.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] clocksource/drivers/pistachio: fix leaked iomap on error paths
Date: Fri,  9 Oct 2026 00:02:43 +0800
Message-Id: <20261008160243.2664167-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAAHET+gvsdqK6INCg--.11345S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWry8WF1fWF1UCr1xtrWDJwb_yoW5Xr1kp3
	WSywsYvwsFqr4SgFZ3tw1kJF9akws7KFy7u3yxG3Z3ArnIyrW8Zr4IyFyUZFsxKr4fCwsF
	yr48GFWUCF45ZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkIb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Jr0_Gr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF
	04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
	18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vI
	r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
	1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvE
	x4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU5L18JUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBggOA2rHgnhjmQABsv

pistachio_clksrc_of_init() maps the timer registers with of_iomap() and
stores the result in the static global pcs_gpt.base, but every error path
after the mapping (syscon lookup, regmap_update_bits, the two
of_clk_get_by_name() calls and both clk_prepare_enable() calls) returns
without calling iounmap(), leaking the mapping.

Route all these error paths through a common err_unmap label that calls
iounmap() and clears pcs_gpt.base.

Fixes: 84583983c319 ("CLOCKSOURCE: Add Pistachio clocksource-only driver")
Assisted-by: DeepSeek-V4.1-Flash
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/clocksource/timer-pistachio.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/clocksource/timer-pistachio.c b/drivers/clocksource/timer-pistachio.c
index 57b2197a0b67..e94faed5009f 100644
--- a/drivers/clocksource/timer-pistachio.c
+++ b/drivers/clocksource/timer-pistachio.c
@@ -163,38 +163,41 @@ static int __init pistachio_clksrc_of_init(struct device_node *node)
 	if (IS_ERR(periph_regs)) {
 		pr_err("cannot get peripheral regmap (%ld)\n",
 		       PTR_ERR(periph_regs));
-		return PTR_ERR(periph_regs);
+		ret = PTR_ERR(periph_regs);
+		goto err_unmap;
 	}
 
 	/* Switch to using the fast counter clock */
 	ret = regmap_update_bits(periph_regs, PERIP_TIMER_CONTROL,
 				 0xf, 0x0);
 	if (ret)
-		return ret;
+		goto err_unmap;
 
 	sys_clk = of_clk_get_by_name(node, "sys");
 	if (IS_ERR(sys_clk)) {
 		pr_err("clock get failed (%ld)\n", PTR_ERR(sys_clk));
-		return PTR_ERR(sys_clk);
+		ret = PTR_ERR(sys_clk);
+		goto err_unmap;
 	}
 
 	fast_clk = of_clk_get_by_name(node, "fast");
 	if (IS_ERR(fast_clk)) {
 		pr_err("clock get failed (%lu)\n", PTR_ERR(fast_clk));
-		return PTR_ERR(fast_clk);
+		ret = PTR_ERR(fast_clk);
+		goto err_unmap;
 	}
 
 	ret = clk_prepare_enable(sys_clk);
 	if (ret < 0) {
 		pr_err("failed to enable clock (%d)\n", ret);
-		return ret;
+		goto err_unmap;
 	}
 
 	ret = clk_prepare_enable(fast_clk);
 	if (ret < 0) {
 		pr_err("failed to enable clock (%d)\n", ret);
 		clk_disable_unprepare(sys_clk);
-		return ret;
+		goto err_unmap;
 	}
 
 	rate = clk_get_rate(fast_clk);
@@ -211,6 +214,11 @@ static int __init pistachio_clksrc_of_init(struct device_node *node)
 	raw_spin_lock_init(&pcs_gpt.lock);
 	sched_clock_register(pistachio_read_sched_clock, 32, rate);
 	return clocksource_register_hz(&pcs_gpt.cs, rate);
+
+err_unmap:
+	iounmap(pcs_gpt.base);
+	pcs_gpt.base = NULL;
+	return ret;
 }
 TIMER_OF_DECLARE(pistachio_gptimer, "img,pistachio-gptimer",
 		       pistachio_clksrc_of_init);
-- 
2.25.1

