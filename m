Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08AB41A4F8
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376853; cv=none; b=BAL70WAJej5Ctl9N1sOW9ERe0+iObkNOeyh2K5DZ47/Lc2lBnlDzz6SwrcT504QVO5HVuAcPtBybOcDhm7aVvdElHTJC3i+BJX6g/rpAHMSlSXLHleZ59Xf421L6CD6Y7IN/yYnbfd9udK6l8ryvgZfI6sq7mEHilXgY4xw9tjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376853; c=relaxed/simple;
	bh=FN6z/whQjCJR5PJ9elVbNUyC4Aww99HqmqaHahztQls=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jmKGHw7sQzEOmcgYPzLxMEPy9u+A2KjtsnWYsUu67H++X/1wQNRizmbk5piYr1aK4o2ME+ue7xLbUGxEy4UVk4cBrRk8qnMCY4DXBbIhnNgrZfvyrxOQfxKeG3WybU4gtLoYK9761CyQEnCJxnkiYmD1fuQnDBT6yph/RvQIFFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RWG3Lrso; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RWG3Lrso"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-869d181419bso2790621b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789376851; x=1789981651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wvFBiMkRGjwoloZbq9nwDlVvLI1OyRNq467fT53sktU=;
        b=RWG3Lrso78cHLp3V0uvJIbc5+X4QEHaDstNSaqtrl/dx0WaGnuyajTaW214twt0kDc
         PreTvb9aL1TR2rncRrmpmodlAWsqlYEpCVZVO6W/17srI+fffWM7zM9D0YihjVkFEuwm
         IglCZ2zWZnf3HCD79Qmf/BRC2L0Xi/WQecWeajwAtmx63Gyi4vnbs/qHwi+a3Tsn+GmK
         yxknl76WTU3vlGldJRSJaV/EC6Koatk7/8etYt78j5w715BaRQk7//Vh2Fm9CZYOFMH3
         mGEtVkihni7fWlTxzdH8fBCwfQwLfhYUqrcWS0pPvkLWuOQ/rbff/SHQIr2YTQJ+eU6V
         zpYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789376851; x=1789981651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wvFBiMkRGjwoloZbq9nwDlVvLI1OyRNq467fT53sktU=;
        b=H1ySyeGeCZ3x7HfJt/HG8wcTFAfe/c/QEuKSGwWuWVybcrtRdeMqvsq5sjS/BHigV8
         FXICsnAjG+4szgh+221/07LL0YC2Vyapwflymsnz7XzvHQf+hF+acEo4QwTML5vg3gju
         9jO71WclfRmSWHge0hAgsmNUF5JsyAjoSoxPNw7UyZtzFsYey/3Z2/pzFoWPllZNHDGW
         ka6j0EPYgB1ZO1nZCdRz6+Oodhq/W8OxGSfezwDnJrljHpRoUvOA+CuV8TPvHuIqn2/l
         fTCDchtGQN948uSLbWTwUrBq6KtZ8hNdD1jDlr2/ShagcJzO5u6hfM7O2uX2JjA9at6S
         fapA==
X-Forwarded-Encrypted: i=1; AKwUvBwI1yF+RaJEmzvFCY2lnxDtSa21FFzdaY5lJOxw7+2DSpqSIFQP8Fw5yFXqYRuvvz66LmQsinvhvVcjSEE=@vger.kernel.org
X-Gm-Message-State: AFuF++nxEB80XT395Wbi37iYrr7+l4V/9wlpW/U7/qmFw/tCG6gahw2f
	PMp+c1s2Xv45UFNwSyBi3XgUZ/rmKVydGap+Kd4BfT8omfBhcUNClivp
X-Gm-Gg: AYBFou3KsIQujog7bVA5unP3z6DVmAwHYGT8UXwZJ/eq7EH53Ms+FDxLdpkPKxYvKnC
	f/bi872ULSGdBJTlnGrrR2Id7hIT+aGFo+mqN3eUjxzrasqI9rwbJZbFziavqFe7cOg/wZOmE9x
	kg92sG87lBSVlklFg0qOFnTbKs+P8xlr+FBeNOte1mB/8jmROZg9z4JiUVeZq9k87QACTHwYckw
	L0FYBCNpgznm9T15Bu0MoNeJJKN9Ctm3l9t7D78OgM6RnS4ao+Y2lLh4RKZFpKkpDjEVY6rUh/S
	olclAzCxzeOr5SwBsoRV+6VykGF1iOME8xSJg+IWK7n/53l4LbaB2E1AzyAAnFVAXUMNtQAx2gS
	rBclPDZvz1wVnyQHPrHoon0f4hITnpMJ3IXyCNPYglClp8GbSDWqDGMnX8/GU25BXa8UobTaSe3
	4bxpstYESFxfRR49aVYnttOKY5Zd/d9vzhdFcnSvcQM/meIxIALcg5KdM=
X-Received: by 2002:a05:6a00:8d8e:b0:84e:909:ac03 with SMTP id d2e1a72fcca58-86f83b3b22fmr3682395b3a.10.1789376850775;
        Mon, 14 Sep 2026 02:07:30 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b291c1601sm4365005b3a.31.2026.09.14.02.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:07:30 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Dong Aisheng <aisheng.dong@nxp.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Wolfram Sang <wsa@kernel.org>,
	Fugang Duan <fugang.duan@nxp.com>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] i2c: imx-lpi2c: release clocks on remove
Date: Mon, 14 Sep 2026 17:07:18 +0800
Message-ID: <20260914090718.1666333-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lpi2c_imx_probe() prepares and enables the controller clocks before
enabling runtime PM. After probe succeeds, clock management is handed
over to the runtime PM callbacks.

However, lpi2c_imx_remove() only disables runtime PM and autosuspend.
It does not ensure that the device is active before teardown or drop
the clock references acquired during probe.

For platforms which do not require clock prepare/unprepare in the
runtime PM callbacks, runtime suspend only disables the clocks, leaving
the prepare references held for the lifetime of the driver. Since the
remove path never unprepares them, these references are leaked when the
driver is unbound.

For platforms which prepare and unprepare clocks during runtime PM, an
unbind while the device is still runtime active can similarly leave
the clock prepare and enable references outstanding.

Resume the device before disabling runtime PM so that the clocks are in
a known enabled and prepared state. Then drop the temporary runtime PM
reference and disable and unprepare the clocks during final teardown.
Mark the device suspended after the hardware resources have been
released.

This issue was found by manual code inspection.

Fixes: 13d6eb20fc79 ("i2c: imx-lpi2c: add runtime pm support")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index e1a4338bc51e..481950004b2a 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -1604,8 +1604,13 @@ static void lpi2c_imx_remove(struct platform_device *pdev)
 
 	i2c_del_adapter(&lpi2c_imx->adapter);
 
+	pm_runtime_get_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
+
+	clk_bulk_disable_unprepare(lpi2c_imx->num_clks, lpi2c_imx->clks);
+	pm_runtime_set_suspended(&pdev->dev);
 }
 
 static int __maybe_unused lpi2c_runtime_suspend(struct device *dev)
-- 
2.43.0

