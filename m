Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC234466B77
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789393345; cv=none; b=ey4SZm6A50maBkOdQeqvflqhZWyMBSlV9sBA3rfp5qDl/aLRa0hWdkXPFurIBnD2TV44YJSRGlwCJ4LIULbVwQSAwwjxbuOpw0+cnuOUkA6tcvL+N/JhVWRLP05QoOgoMaNAmvkjaDx8m7EStoPVJd7jhhuQYjZ6zxkEol1Fd/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789393345; c=relaxed/simple;
	bh=+onlGpa1hiO1MNd5qR3jYCkVSL71ELpSzMUjHSHRwDg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jsgjKoU450NFd8V0eJz7vnfBnM085HO5k4I0h4gF9k3faYQmv6xRK8Jqn+12sLRrSeutl8Sw+ZFYcQX7+PaAoH20cNpNGHYNPGta9Ol42b76jTp7s3afTITSrB2y5JtYUtoek4bX15/0KwnSRLEzWSjJYaJiRoQ/6RyYuK1c0ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pM6/oTPU; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pM6/oTPU"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469a3490bso1863799b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789393343; x=1789998143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bakTp6stDBZ5NtOXw79DszktYHeILhkNYFFO9zeitSo=;
        b=pM6/oTPU/Jyt3RiKGegbgFCR6vO/srv8K/CfRb0x1Y6R5oAXt7uQm/gc2/e7UUgqa/
         mO5oEm6z/TB0ZiENTmNdJg2AtrxJW6vMZA4pOPPDGPtFMSoG3YaS2SXhhmclNXu13Ngv
         goC0RFl1AaTq+xHy6ND35dXdlAN33xUNCvgrAh/m8+PWKFUo1IQpu9n6/KDmXsWSXOAz
         MvcXT72oKk+kst/YjPjzgY8jizxmfekUQ/Mgua5LHS21wfcMnT3FMpNL+PX0pCm+tkcf
         kdgTEdIRv+j6S7rl2K3vK/seHNJmebEjW1BUYM2ndybg2amZWxjAUOI9dZo6P0NMEp0u
         6MYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789393343; x=1789998143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bakTp6stDBZ5NtOXw79DszktYHeILhkNYFFO9zeitSo=;
        b=AxcoEk5amuPlKp3yinW5fCtLLfrTpHqEZTbvQdTRg/rC3fMSUgabZPRQG3df6zxsNA
         TohWSDy2ADigiB9WwY4WMplO0tJ0S2I2BX8bHuZYs5la41BPk7yN7nILteLOn7BXgJBr
         Qp9eAq0hDYAECpya3c3jCpiDP4+PxFJME4gam3uZZ6jxgDtgylAe03HARB5OxYEz2PQB
         uoxd39cFssfTKW7qsflPfeNzm5WxfhjPhzIhm7f45/KSYXAX+TjJOdGhWHaIQHus9FYv
         9klEYbPF74IqN+TcIfiPVqOh657T6cXVPHlT0o5WTxTYBBrPlVdjjP6G6Hqs2PdtVOga
         ww7Q==
X-Forwarded-Encrypted: i=1; AKwUvByxMWNoF22BmB3lRfrAkwNsMLPKegp42V6+29OOHUculuWrIpmZYN1I7YGqVKGYBZa4INJpODmVNbhzdqk=@vger.kernel.org
X-Gm-Message-State: AFuF++kNo8k/hRSvZ4R+lt3fQF4wn0K2kXdhZgY1k7bqgVkIAGc7+p3F
	QIBBq+dEo3CHydsCWQciBsiSDuyflKgyU0/RIFCZa9TZYfckZjJiZq2k
X-Gm-Gg: AYBFou0NWA4QKc9YCOM6Y1Aei2b4TYA2O0N2WWnZ7pKBGys6FFXjWcVwdred5kTtOGJ
	ZsqIoCgNCKpuRMMy8J/ZFerNbyMItsXb7zYzXJxQhnTIXGIbpiEboPylOErp/gtLM64cTL8ZTvB
	TU8LhwUY/7BR5zLZOwFbWV62t4Yiy8340tAlI1BeJ//0pdE4I9Oyc6bBHpl21yXoFvCS+HlxLgH
	+bnKtYkcx/yYDybMM/Ne1x7Sq8r3+65J5PSDKMKd4m5QUrvaR4xKOze0uiQGBxXe+MPg2PQCQjE
	xJJgIyTJLXI+8y4OKhgYztiMy1XpOGnK5eiPr+wwwIGJvyaLK4wUcT1ESkDcuGbSWFyUSKgGMBi
	jq2aI26xBSU/+4p1eMOqc/A7wps8zqRjTFB3r/FrWSkIcs5XdufPVnKrokzbNYR8pp4hRd0axCX
	+RjG7N6rsILez+LvyinKCdTYHEikBOKOzDs/24ytgdgell8Il7ZqfNgA==
X-Received: by 2002:a05:6a00:1c93:b0:851:b03a:fcb with SMTP id d2e1a72fcca58-86f84b1da7emr5036133b3a.14.1789393342959;
        Mon, 14 Sep 2026 06:42:22 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b29dc09d4sm4536921b3a.47.2026.09.14.06.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:42:22 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Joakim Zhang <qiangqing.zhang@nxp.com>,
	Marc Zyngier <maz@kernel.org>,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] irqchip/imx-intmux: fix runtime PM teardown on remove
Date: Mon, 14 Sep 2026 21:42:11 +0800
Message-ID: <20260914134211.1734163-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx_intmux_probe() enables the IPG clock and then drops its runtime PM
reference with pm_runtime_put(). With CONFIG_PM enabled, the runtime
suspend callback disables the IPG clock. With CONFIG_PM disabled, the
clock remains enabled after probe.

imx_intmux_remove() accesses the CHANIER registers without first making
sure that the device is runtime active. The device may therefore be
runtime suspended with the IPG clock disabled when these registers are
accessed. In addition, the remove path only calls pm_runtime_disable()
and does not balance the clock enable when CONFIG_PM is disabled.

Resume the device and acquire a runtime PM reference before accessing
the registers. If resume fails, skip the register accesses but still
tear down the chained handlers and IRQ domains. Disable runtime PM
afterwards, drop the acquired reference without triggering another
runtime suspend, and explicitly disable the IPG clock.

This keeps the clock enabled while the hardware registers are accessed
and balances the clk_prepare_enable() performed during probe for both
CONFIG_PM configurations.

This issue was found by manual code inspection.

Fixes: bb403111e017 ("irqchip/imx-intmux: Implement intmux runtime power management")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/irqchip/irq-imx-intmux.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-imx-intmux.c b/drivers/irqchip/irq-imx-intmux.c
index 47c2681d138a..de2a8f98f625 100644
--- a/drivers/irqchip/irq-imx-intmux.c
+++ b/drivers/irqchip/irq-imx-intmux.c
@@ -288,12 +288,16 @@ static int imx_intmux_probe(struct platform_device *pdev)
 static void imx_intmux_remove(struct platform_device *pdev)
 {
 	struct intmux_data *data = platform_get_drvdata(pdev);
-	int i;
+	int i, ret;
+
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret < 0)
+		dev_warn(&pdev->dev, "failed to resume device: %d\n", ret);
 
 	for (i = 0; i < data->channum; i++) {
 		/* disable all interrupt sources of this channel */
-		writel_relaxed(0, data->regs + CHANIER(i));
-
+		if (ret >= 0)
+			writel_relaxed(0, data->regs + CHANIER(i));
 		irq_set_chained_handler_and_data(data->irqchip_data[i].irq,
 						 NULL, NULL);
 
@@ -301,6 +305,11 @@ static void imx_intmux_remove(struct platform_device *pdev)
 	}
 
 	pm_runtime_disable(&pdev->dev);
+	if (ret >= 0) {
+		pm_runtime_put_noidle(&pdev->dev);
+		clk_disable_unprepare(data->ipg_clk);
+		pm_runtime_set_suspended(&pdev->dev);
+	}
 }
 
 #ifdef CONFIG_PM
-- 
2.43.0

