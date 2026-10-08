Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD5C3382C7
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 17:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791480971; cv=none; b=YMbFX1vhmfZSFF6qFkBf+ACm1Hf9ZeKEt7KleX5itVmSplwZGIdlFnok6R0xG79xtNzXftEHRFU8+oZe60c1S2wKhirNVtv7FQGpvL/wqJk+Nk78mNMne89q52Vt9Pgt7E1LB4JKIrjqO/f6jnhlExyFVtskqYxQWSPIj+ybslQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791480971; c=relaxed/simple;
	bh=p8/MH4siLXKq1rPAgasec/wMZVVt5LsNZ6BhafmBiyc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ec66g4eLasHivEpPuWojI45i5jbSYQRIYUfwKK2GXjIdSda8DfJJqsgQo6fBuYsS+2s7ckeCKVSlqdUBZfzpu7MlhP4DWFspwuC8E2Pt5xskpE/jYc6gXoddDVn4QQYZP2YgJk62dNocm70t2gUdBBx+werz9EBNH7W70wk4f6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from fc87d0ffb700.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowABHTTuB1MdqNlQPCg--.12561S2;
	Fri, 09 Oct 2026 01:36:02 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peng Fan <peng.fan@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>
Cc: linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] clocksource/drivers/timer-imx-gpt: fix resource leak on init error paths
Date: Fri,  9 Oct 2026 01:36:04 +0800
Message-Id: <20261008173604.2733975-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowABHTTuB1MdqNlQPCg--.12561S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Wry3ZFW7WryrJr43Xw47Arb_yoW8Ar1rpa
	1xu345tF17WwsagF47tr4qvF95ua1SkFy8GFWfG39FyFn8ur1jqFyjyFyUXFy3CFWrZ3W7
	tr4rJrs5uFyDur7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvKb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kI
	c2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
	WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
	67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
	IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF
	0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxh
	VjvjDU0xZFpf9x07b52NNUUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgYOA2rHo1N7kwAAs4

mxc_timer_init_dt() maps the timer registers with of_iomap() and obtains
the ipg and per clocks with of_clk_get_by_name(), but every error path
jumps to err_kfree, which only frees the imx_timer structure.  The
ioremap'd mapping and the clock references are therefore leaked when
irq_of_parse_and_map() or _mxc_timer_init() fails.

Unmap the I/O region and release the clocks on those error paths.

Fixes: 8051a993ce22 ("clocksource/drivers/timer-imx-gpt: Fix potential memory leak")
Assisted-by: DeepSeek-V4.1-Flash
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/clocksource/timer-imx-gpt.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/timer-imx-gpt.c b/drivers/clocksource/timer-imx-gpt.c
index 8335bd7f8c6c..b8005054b30a 100644
--- a/drivers/clocksource/timer-imx-gpt.c
+++ b/drivers/clocksource/timer-imx-gpt.c
@@ -441,7 +441,7 @@ static int __init mxc_timer_init_dt(struct device_node *np,  enum imx_gpt_type t
 	imxtm->irq = irq_of_parse_and_map(np, 0);
 	if (imxtm->irq <= 0) {
 		ret = -EINVAL;
-		goto err_kfree;
+		goto err_unmap;
 	}
 
 	imxtm->clk_ipg = of_clk_get_by_name(np, "ipg");
@@ -455,12 +455,19 @@ static int __init mxc_timer_init_dt(struct device_node *np,  enum imx_gpt_type t
 
 	ret = _mxc_timer_init(imxtm);
 	if (ret)
-		goto err_kfree;
+		goto err_clk_put;
 
 	initialized = 1;
 
 	return 0;
 
+err_clk_put:
+	if (!IS_ERR_OR_NULL(imxtm->clk_per))
+		clk_put(imxtm->clk_per);
+	if (!IS_ERR_OR_NULL(imxtm->clk_ipg))
+		clk_put(imxtm->clk_ipg);
+err_unmap:
+	iounmap(imxtm->base);
 err_kfree:
 	kfree(imxtm);
 	return ret;
-- 
2.25.1

