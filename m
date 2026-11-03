Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699744;
	b=mhLiHZHjbP7IefB4KC3z2mplZGTAcW08fXzjlq81Jj3zyZwkTnJ6V4CFUt52bT2ENO0f
	 Aoli8rK4CyoP2xlBiK+O2WiKQW1qZcIvBVnjcNi/kHRnNe1IldNO1jwDj9SvCU7UymqBS
	 rrsB/2U7Akp6QBa2Ba81n8hk5fIILnXnEOk6cVj3BqcSvtGcyLmGFg0xBPX5nPP4NpvuP
	 PCkzJErusdjLr8TPb6onHoyExzzx1hz+DrbTDOuNW0EDaG/rszupsFbirXpDBRuoq71jd
	 FFmf5gsUdnsy4yOt/+NL7aQgiO07LPVaV2KB5RrNjOSybbdpCOXJFTxLaXs4jdaGhQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699744;
	h=Received:DKIM-Signature:From:To:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=NiTQ6Hxgwrg20CJJYXd9B8V4YfjFk58T3g201GHr9PA=;
	b=tvml7Uewp3SnnEIDEaNZjBA7He8NW94a+ccI+yVd3rZTVxCMzOrFDha6S12A2G/76lq4
	 MSI+tufQxHa4kCrIcSJExo4CdVAdL0mOd8xSCYQ5AbKkQcEWKL/vzvBP2gslfL69Yeg5j
	 YabkAykgm1EvVzo5j+xd5vZhmP5QMLzY8QfEcmrPWtJHLcTqgBva5iQ+2yQ+xfxhQq0ED
	 FOs8foL0BsteP8ZJsLLoNFl3M+kU0ZfIfOjBcfGZQhJAX59iXclhEoi9lP4hM2y15S0Ip
	 goUQyo/ffaqFR8yNpyO560+spWLiHy/OKerTViPkCo6yUoK382mNZaLm9RIwfWNIBLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HeotMZpG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BB2606FAD3;
	Tue,  3 Nov 2026 09:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HeotMZpG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28F3E1F00A17;
	Tue,  3 Nov 2026 09:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793699743;
	bh=NiTQ6Hxgwrg20CJJYXd9B8V4YfjFk58T3g201GHr9PA=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=HeotMZpGfyjShNKMB+2n+u0y/FnHc0RX0RrwKLzIfxNQFyRsxhURXINDene0FxRZq
	 UdZgptGau7MeqWuK4D+HHOXUwgBdVoKPx55ShIr0GG0audRXXyZsiV0iFPvP5bk44b
	 bQRJfnU3Ji4U+kaYp4gZoAGtZy1TsIF9yHk9NPDlwPoVABs8tTVPsFmYwFHYgzvlfi
	 FrpaoYcNyg8dbyEHyaS5kNckGi0o/6tzS7q6rcNFTUfz6+9ooYMQIlGIIh943mWiJL
	 B+tDc3zhPy2UV9lRha8cCnWr/WNrJwTRcGrO9BYkCQfznH4BJdWqWcm0pP9IaSvio3
	 810ff/RT7HN5w==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Srinivas Kandagatla <srini@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/10] soundwire: qcom: Check clk_prepare_enable() return value
Date: Tue,  3 Nov 2026 09:53:52 +0000
Message-ID: <20261103095445.81414-9-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103095445.81414-1-lee@kernel.org>
References: <20261103095445.81414-1-lee@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qcom_swrm_probe(), qcom_swrm_irq_handler(), and swrm_runtime_resume()
ignore the return value of clk_prepare_enable(ctrl->hclk) and proceed
to access controller registers even when enabling the interface clock
fails.  Also jump to err_clk when requesting the wake IRQ fails in
qcom_swrm_probe() so ctrl->hclk is disabled on error.

Check the return value of clk_prepare_enable() in all three callers and
abort register access on failure.

Closes: https://sashiko.dev/#/bug/linux-f65cddc9-08ff-4531-9acf-76981d74d914
Signed-off-by: Lee Jones <lee@kernel.org>
---

v1 => v2: Drop Fixes and Stable tags

 drivers/soundwire/qcom.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index a50efdfc3a6b..785096b232f2 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -778,7 +778,9 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
 	u32 i;
 	int devnum;
 	int ret = IRQ_HANDLED;
-	clk_prepare_enable(ctrl->hclk);
+
+	if (clk_prepare_enable(ctrl->hclk))
+		return IRQ_NONE;
 
 	ctrl->reg_read(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_STATUS],
 		       &intr_sts);
@@ -1677,7 +1679,9 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 		goto err_init;
 	}
 
-	clk_prepare_enable(ctrl->hclk);
+	ret = clk_prepare_enable(ctrl->hclk);
+	if (ret)
+		goto err_init;
 
 	ctrl->dev = dev;
 	dev_set_drvdata(&pdev->dev, ctrl);
@@ -1733,7 +1737,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 						"swr_wake_irq", ctrl);
 		if (ret) {
 			dev_err(dev, "Failed to request soundwire wake irq\n");
-			goto err_init;
+			goto err_clk;
 		}
 	}
 
@@ -1802,13 +1806,15 @@ static int __maybe_unused swrm_runtime_resume(struct device *dev)
 	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dev);
 	int ret;
 
+	ret = clk_prepare_enable(ctrl->hclk);
+	if (ret)
+		return ret;
+
 	if (ctrl->wake_irq > 0) {
 		if (!irqd_irq_disabled(irq_get_irq_data(ctrl->wake_irq)))
 			disable_irq_nosync(ctrl->wake_irq);
 	}
 
-	clk_prepare_enable(ctrl->hclk);
-
 	if (ctrl->clock_stop_not_supported) {
 		reinit_completion(&ctrl->enumeration);
 		ctrl->reg_write(ctrl, SWRM_COMP_SW_RESET, 0x01);
-- 
2.56.0.385.gac671c819a-goog

