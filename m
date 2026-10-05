Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08504CC632;
	Mon,  5 Oct 2026 15:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791215069; cv=none; b=opmyPKvbPsyum4mLO/IZcxn6NfPIjG7baimqlf9s8qS5Qfy868Uc7Ibxaw09A1lXaJ8LBFPWvADo669hxuzNzf/GGK/Y2VBuMSmfyTwa4es35TkmELNIsSqvn32OQaLxQfsbp3BZarPzW6YCGAhFQUMo/1OoSlOIWzXE7gsnaAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791215069; c=relaxed/simple;
	bh=dgzX/G5Rg7ZfL1M70dtCt0Jgnktuj2ZFTqH1kEZpxfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qx60D1bgsMmmLYOlY2gRuPSomhpOhVfIlv4ysxNwfZJ27WFMhyYv/TRlUszh5vy3x3pw8aJfGq2qOoUBrxG8d8OthcnrOz/YWZ1aNm2ICJmOnrpbehNseLA5fm8CG47PA5jHZzReRhGI3PKA7Lj6g4eYPSyggppx8sFQryEqWss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LozdkpxG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LozdkpxG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57C561F00898;
	Mon,  5 Oct 2026 15:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791215067;
	bh=7hyLYn6tCkgJyNXU7MXe+iYtTTDsCEiqgJg8WdmotO4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LozdkpxG0SXOgB3Kwr5/4iSuZJv+03oo+PodjuZ1TrzeSIibYTGIqYkDiGVP5V8g7
	 4lRKCZlUawiA85WxBN2UlG+p3nTrCfRxnquK4j2aJA/eJrIZXRBi+jJRwg7KcHtTeq
	 V7aQNBnUtEoIPjxOG/UWxs64+9rqAWPFWiMOGYw6n04Nb0ugQ6/rXuoKvHk9Z2tMR7
	 lx1sHCLMDzjAhDqkZ26/CR7FMirZjqRirp/A3RcvCgQVD0B9tPkv8yTeLFo89GGCLt
	 j/Qf1T/udONS4NcZxTepxzFhIWaAaVxpRy8NqmX2KOZvf5CtfjADSSKcXRCB6jqmYr
	 kJE7vGRUVSf7w==
From: Jisheng Zhang <jszhang@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] i3c: dw: switch to array-based exclusive reset control
Date: Mon,  5 Oct 2026 23:24:24 +0800
Message-ID: <20261005152425.25319-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261005152425.25319-1-jszhang@kernel.org>
References: <20261005152425.25319-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Synopsys DesignWare I3C master controller can have multiple reset
lines, such as a core reset and APB reset.

Refactor the driver to use devm_reset_control_array_get_exclusive()
instead of a single named reset handle. This automatically manages all
resets allocated to the device node sequentially.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/i3c/master/dw-i3c-master.c | 24 ++++++++++++++++++------
 drivers/i3c/master/dw-i3c-master.h |  2 +-
 2 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 4563d8761ba0..1c6c870f5bb3 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1657,6 +1657,11 @@ static const struct dw_i3c_platform_ops dw_i3c_platform_ops_default = {
 	.set_dat_ibi = dw_i3c_platform_set_dat_ibi_nop,
 };
 
+static void dw_i3c_resets_assert(void *data)
+{
+	reset_control_assert(data);
+}
+
 int dw_i3c_common_probe(struct dw_i3c_master *master,
 			struct platform_device *pdev)
 {
@@ -1696,10 +1701,17 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 	if (IS_ERR(master->pclk))
 		return PTR_ERR(master->pclk);
 
-	master->core_rst = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev,
-										NULL);
-	if (IS_ERR(master->core_rst))
-		return PTR_ERR(master->core_rst);
+	master->resets = devm_reset_control_array_get_optional_exclusive(&pdev->dev);
+	if (IS_ERR(master->resets))
+		return PTR_ERR(master->resets);
+
+	ret = reset_control_deassert(master->resets);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(&pdev->dev, dw_i3c_resets_assert, master->resets);
+	if (ret)
+		return ret;
 
 	spin_lock_init(&master->xferqueue.lock);
 	INIT_LIST_HEAD(&master->xferqueue.list);
@@ -1873,7 +1885,7 @@ static int __maybe_unused dw_i3c_master_runtime_suspend(struct device *dev)
 
 	dw_i3c_master_disable(master);
 
-	reset_control_assert(master->core_rst);
+	reset_control_assert(master->resets);
 	dw_i3c_master_disable_clks(master);
 	pinctrl_pm_select_sleep_state(dev);
 	return 0;
@@ -1885,7 +1897,7 @@ static int __maybe_unused dw_i3c_master_runtime_resume(struct device *dev)
 
 	pinctrl_pm_select_default_state(dev);
 	dw_i3c_master_enable_clks(master);
-	reset_control_deassert(master->core_rst);
+	reset_control_deassert(master->resets);
 
 	dw_i3c_master_set_intr_regs(master);
 	dw_i3c_master_restore_timing_regs(master);
diff --git a/drivers/i3c/master/dw-i3c-master.h b/drivers/i3c/master/dw-i3c-master.h
index 17ad817d1f8e..f5b4491b247a 100644
--- a/drivers/i3c/master/dw-i3c-master.h
+++ b/drivers/i3c/master/dw-i3c-master.h
@@ -36,7 +36,7 @@ struct dw_i3c_master {
 	} xferqueue;
 	struct dw_i3c_master_caps caps;
 	void __iomem *regs;
-	struct reset_control *core_rst;
+	struct reset_control *resets;
 	struct clk *core_clk;
 	struct clk *pclk;
 	char version[5];
-- 
2.53.0

