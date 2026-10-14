Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296BD27144B;
	Wed, 14 Oct 2026 03:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791947993; cv=none; b=NWuRBn3mIqoiPoROKPpSS9NYTwewXY5gLeUTmC2qWo1HRiGcbEO8NNG+yrz/MG1fW/dFWTOIPz8UpFEtcvOlJ5NBPflLzwZGsQ4JKf13u5L/rCKjQGMZBH1Kx+OaXgkzvncKdiuwbxayIE2kRoEKu66vCksJp7xFLl2Uz/0wPjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791947993; c=relaxed/simple;
	bh=h1dpY5OKbrdNfbR9HC7vgo31cVgsWIj1YzB267GBzfU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=miFWJxUB5I0KQuZIxavZx4gkKjlXHsRoVBttKUysDkNdBo2kMA3SWWHJ1VKHO9hkNKa0RRx5GrLt6Z/yuVFJyI7QDquJHZDex3CpAsrTWKDCS4hZabxCk+T5TJ4JjE+3asGjbO5AMwZsMxgvIaRRynO0ch+s3QjkvgbM7Z/iNFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=DT7b9zEF; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="DT7b9zEF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=p4
	d3CtqHUPjK4TCiWScT6tHr43tsZcB7KMP7S55pcsA=; b=DT7b9zEFewTz8piT9M
	GxINXx+xRQ2Dc1qFRERcIKXg+sIzhwcjLHpIzyqBxkEU5bX8D0b19rfHKh4m77c8
	77nWPrZ+b9yQPCM/gP+fyinZDY9ytCnumhsxI5c+YqtbmJIjnNyW/3qThQn2xSIV
	h4atQUw1VSrjGjXY8CrQu4qKs=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgC3v+q69M5qU34YEg--.64934S2;
	Wed, 14 Oct 2026 11:19:22 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: patrice.chotard@foss.st.com
Cc: Pengpeng Hou <hppiscas@163.com>,
	thinh.nguyen@synopsys.com,
	gregkh@linuxfoundation.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	p.zabel@pengutronix.de
Subject: [PATCH v3] usb: dwc3: st: balance reset ownership on deassert failure
Date: Wed, 14 Oct 2026 11:19:20 +0800
Message-ID: <20261014031920.8390-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgC3v+q69M5qU34YEg--.64934S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCF1fWry5KFy8KF4fCr13CFg_yoW7Jr13p3
	y7Gr4ayr1IkFs3t3yxJF15uFyfZFWftayUGa13K348AwsI9rWDJryj9FyrJayjyrWkJry5
	CF4jqFnY9anFvaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEl4iUUUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7hu5gmrO9Ltq7wAA3g

The ST DWC3 glue ignores reset deassert failures in probe and resume.
It may publish the child device or access the glue registers without both
reset operations having succeeded.

Check both results and unwind DRD setup failures as well. A shared
softreset provider failure must go through undo_softreset: the reset core
has already incremented its deassert count before calling the provider.

Track whether this driver owns the deassert pair so suspend and remove do
not release it again after failed resume has unwound it. This is reference
ownership, not a guarantee about the physical reset-line state. Resume
itself needs no early-return guard: the paired suspend callback clears
the ownership state before resume is entered.

The issue was found by our static-analysis tool and manually reviewed.

Fixes: f83fca0707c6 ("usb: dwc3: add ST dwc3 glue layer to manage dwc3 HC")
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
Changes since v2:
- remove the redundant resets_active early return in resume, as Thinh queried
- keep failed shared deasserts routed through undo_softreset
- retain the independently needed suspend/remove ownership guards
- rebase on current mainline

Previous version:
https://lore.kernel.org/all/20260922004312.3589-1-hppiscas@163.com/

 drivers/usb/dwc3/dwc3-st.c |   43 ++++++++++++++++++++++++++++++++++---------
 1 file changed, 34 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-st.c b/drivers/usb/dwc3/dwc3-st.c
index 5d513decaacd22de15825dc061c2747cf09fef07..1a2f38f9407ae0aea25edd616f8d77f953b3b404 100644
--- a/drivers/usb/dwc3/dwc3-st.c
+++ b/drivers/usb/dwc3/dwc3-st.c
@@ -84,6 +84,7 @@
  * @dr_mode:		drd static host/device config
  * @rstc_pwrdn:		rest controller for powerdown signal
  * @rstc_rst:		reset controller for softreset signal
+ * @resets_active:	whether this driver holds its deasserted reset pair
  */
 
 struct st_dwc3 {
@@ -94,6 +95,7 @@ struct st_dwc3 {
 	enum usb_dr_mode dr_mode;
 	struct reset_control *rstc_pwrdn;
 	struct reset_control *rstc_rst;
+	bool resets_active;
 };
 
 static inline u32 st_dwc3_readl(void __iomem *base, u32 offset)
@@ -242,7 +244,9 @@ static int st_dwc3_probe(struct platform_device *pdev)
 				     "could not get power controller\n");
 
 	/* Manage PowerDown */
-	reset_control_deassert(dwc3_data->rstc_pwrdn);
+	ret = reset_control_deassert(dwc3_data->rstc_pwrdn);
+	if (ret)
+		return ret;
 
 	dwc3_data->rstc_rst =
 		devm_reset_control_get_shared(dev, "softreset");
@@ -253,7 +257,10 @@ static int st_dwc3_probe(struct platform_device *pdev)
 	}
 
 	/* Manage SoftReset */
-	reset_control_deassert(dwc3_data->rstc_rst);
+	ret = reset_control_deassert(dwc3_data->rstc_rst);
+	if (ret)
+		goto undo_softreset;
+	dwc3_data->resets_active = true;
 
 	/* Allocate and initialize the core */
 	ret = of_platform_populate(node, NULL, NULL, dev);
@@ -305,16 +312,22 @@ static void st_dwc3_remove(struct platform_device *pdev)
 
 	of_platform_depopulate(&pdev->dev);
 
-	reset_control_assert(dwc3_data->rstc_pwrdn);
-	reset_control_assert(dwc3_data->rstc_rst);
+	if (dwc3_data->resets_active) {
+		reset_control_assert(dwc3_data->rstc_pwrdn);
+		reset_control_assert(dwc3_data->rstc_rst);
+		dwc3_data->resets_active = false;
+	}
 }
 
 static int st_dwc3_suspend(struct device *dev)
 {
 	struct st_dwc3 *dwc3_data = dev_get_drvdata(dev);
 
-	reset_control_assert(dwc3_data->rstc_pwrdn);
-	reset_control_assert(dwc3_data->rstc_rst);
+	if (dwc3_data->resets_active) {
+		reset_control_assert(dwc3_data->rstc_pwrdn);
+		reset_control_assert(dwc3_data->rstc_rst);
+		dwc3_data->resets_active = false;
+	}
 
 	pinctrl_pm_select_sleep_state(dev);
 
@@ -328,19 +341,31 @@ static int st_dwc3_resume(struct device *dev)
 
 	pinctrl_pm_select_default_state(dev);
 
-	reset_control_deassert(dwc3_data->rstc_pwrdn);
-	reset_control_deassert(dwc3_data->rstc_rst);
+	ret = reset_control_deassert(dwc3_data->rstc_pwrdn);
+	if (ret)
+		return ret;
+
+	ret = reset_control_deassert(dwc3_data->rstc_rst);
+	if (ret)
+		goto undo_softreset;
 
 	ret = st_dwc3_drd_init(dwc3_data);
 	if (ret) {
 		dev_err(dev, "drd initialisation failed\n");
-		return ret;
+		goto undo_softreset;
 	}
 
 	/* ST glue logic init */
 	st_dwc3_init(dwc3_data);
+	dwc3_data->resets_active = true;
 
 	return 0;
+
+undo_softreset:
+	/* A shared deassert holds its reference even if the provider fails. */
+	reset_control_assert(dwc3_data->rstc_rst);
+	reset_control_assert(dwc3_data->rstc_pwrdn);
+	return ret;
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(st_dwc3_dev_pm_ops, st_dwc3_suspend, st_dwc3_resume);

base-commit: 4056b3c9d3c92ea45955641dbafeb9b960e146ef

