Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CCE33689D
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789311386; cv=none; b=MKfMvrPUpdBKU8YKYhIy472BZ4wyNnaTxQjjeU0g4Jb1WZQX580Eaq67ANCf2AR1l9y2dN5hR9sQAD1ARjcBJ2RQft1cycikFzCti5g8Adq3koQ4ppBuguRX9CvFW9zvg0W58m7XbX1CmPg+aW0Hk6rWxWxhoWkAMq3qqyeMwYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789311386; c=relaxed/simple;
	bh=0TPiKoG4GPPZx3Popa85L5Rb7uSjVhIAcmRo7lxz1XQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t3xu5u7ps+3b2cHEfiQj7R/5l4ewt4PXhGfU5mxifi6UFYz4TpLdsKP65wIGdIuSXEMI5s/ClaQhoNFBa+1H7MZm/WzQ+8r5ZZnYnr/CCd/e4U2Q2rT8xafB3bghubWD3ajHf9Rxctq+cd+bTWIrPDIbOTXdYE/7hQAsCFUpQmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Euc4+sc2; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Euc4+sc2"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2caced6038eso23562725ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 07:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789311382; x=1789916182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VAFG6OrHDCLtY8RoJ0lJqtavylNBVWsmbDH0jNrFE9U=;
        b=Euc4+sc2LqV719c98ngqmSxq8ZVip309CKJwJlTojf9JVo7MkbL1jwwtRLzn4lflkf
         Jrg1c1eEf4/pJrl2TnopxH7uyq+u0ohHUAuB7j5UZM3cc+kkyereDuvuoANelVPrlrRl
         FoJ3wB8mRxpVD75x0X6OZbkrwQydvNlTAdXCXrMq5W30VdjeiCUA0eEZObJTx7DKGq5Z
         lm4+n1rEqxTeoOSqPKptpfk9YA+0fKKHZ08AvYX5//toHTUWpdwa8jWLvLmM4U0YewLH
         Nznh+SNJKTHxm7VRzc3xqko9TkjXtpBbmGMZ7bFUY0wEVR8EFOFtkAeab4gPa9rXDwy4
         tAlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789311382; x=1789916182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VAFG6OrHDCLtY8RoJ0lJqtavylNBVWsmbDH0jNrFE9U=;
        b=FFWpjWOo3L61kaZK9fdBkJWg2Zhrvc2A64BEWdc6R96TImqrJDOGDekrGdCbw+4wxr
         +HBdgLNiBQO0cDcGf3To2zyZPFQsj3YINFQr/pCsg6pWnQTGNXBVTXGrWgq+dywEgkCV
         EQ8qveSyptGQa0AYczu9P1v8B7MFrO7i3YTxz3RPzC5hucvb9+Dt4s8dDnIq7B/9mYWL
         38x9dMOpKWJr8mydNkruEJx0sOiJJoosO998KLY2oONzshOpEsdHixzsLrxrekCuLeMa
         Av6SuqDU3KENdAyrJzI+n5egtVPDgSO7TVJ5KThDfsVxZR9oiavdb3uNo2nphhgNQmjy
         D5sg==
X-Forwarded-Encrypted: i=1; AKwUvBy0+DUbzqn0DMbCSNAv9KnnYeuyzQgfLiqa/QYCVt28RFGPIAQgzG90LbZklCWjWHKKrkj89WCuJuV53PA=@vger.kernel.org
X-Gm-Message-State: AFuF++mdLansLRMk6cntGB6LkHNDlSb2l2bwybpzJl/hErhT9WCJHBJt
	hr4HhfL6iqfcw9P0RiwAX/AkhmpeKZ0rQ+DJSoQBSRpVghtvhXmihy+A
X-Gm-Gg: AYBFou0Y6csZ9Dl/b2NE8LdeimUb1JkzE7BSBBCQQMlM2DrnGAHotnHHOoNKYYp+z3t
	ZglzmlQriaLaGra+QWA+DS3GTP6efUbwE3yO8NkYLf/ZkMX1jzN3kx/9LFDucsdvkNBXsJGdRWw
	ITBQcJYTrT+16Tf0WWn8uIDZdm3KhdM+b0wPbALU5MnFwT5kEiSIWKioPY43PT0W5C4eF+lXGTJ
	fm4E43R47oXpLBKh8L1YyGb/z5J1aavtmZ4V0sdExJvankIpDFDDWbxzyjj7ttXxNDiA5cqO8xW
	cf1kBR8fWxTGIZKqndX8RitIXugyaBw40w8EOtAGEGy+Y0MSh8ZvrZq+fPQg/Yb03ylPdsMmig6
	Ad6od8ADwzO/4IcRwP1VuPeaQfcm+ICZY/cDmDqkwnTVGvRA+yVJa3t5PYnElvqBnbP24uBT+tc
	zqbtsAkcRe3OQdjuTE8B5CRAQM0t3+wYJ6AcxE5rRAkl0zWF8HfN2g97KOoJ4hxMQq
X-Received: by 2002:a17:902:f786:b0:2d8:d4d2:d138 with SMTP id d9443c01a7336-2dd5f1bc196mr31924865ad.20.1789311382058;
        Sun, 13 Sep 2026 07:56:22 -0700 (PDT)
Received: from archlinux ([207.90.239.231])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba7a9bb56sm21467366eec.31.2026.09.13.07.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:56:21 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	=?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v6 2/5] thermal/drivers/sun8i: replace devm_reset_control_get to devm_reset_control_get_shared_deasserted
Date: Sun, 13 Sep 2026 22:55:24 +0800
Message-ID: <20260913145527.18148-3-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913145527.18148-1-iuncuim@gmail.com>
References: <20260913145527.18148-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mikhail Kalashnikov <iuncuim@gmail.com>

The A523 processor has two temperature controllers, but they share a
common reset line. Make it shared with the shared variant of
devm_reset_control_get(), and also simplify the driver by switching to
devm_reset_control_get_shared_deasserted().

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/thermal/sun8i_thermal.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index 284684137..1412bce63 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -341,11 +341,6 @@ static int sun8i_ths_calibrate(struct ths_device *tmdev)
 	return ret;
 }
 
-static void sun8i_ths_reset_control_assert(void *data)
-{
-	reset_control_assert(data);
-}
-
 static struct regmap *sun8i_ths_get_sram_regmap(struct device_node *node)
 {
 	struct platform_device *sram_pdev;
@@ -388,19 +383,10 @@ static int sun8i_ths_resource_init(struct ths_device *tmdev)
 		return PTR_ERR(tmdev->regmap);
 
 	if (tmdev->chip->has_bus_clk_reset) {
-		tmdev->reset = devm_reset_control_get(dev, NULL);
+		tmdev->reset = devm_reset_control_get_shared_deasserted(dev, NULL);
 		if (IS_ERR(tmdev->reset))
 			return PTR_ERR(tmdev->reset);
 
-		ret = reset_control_deassert(tmdev->reset);
-		if (ret)
-			return ret;
-
-		ret = devm_add_action_or_reset(dev, sun8i_ths_reset_control_assert,
-					       tmdev->reset);
-		if (ret)
-			return ret;
-
 		tmdev->bus_clk = devm_clk_get_enabled(&pdev->dev, "bus");
 		if (IS_ERR(tmdev->bus_clk))
 			return PTR_ERR(tmdev->bus_clk);
-- 
2.55.0

