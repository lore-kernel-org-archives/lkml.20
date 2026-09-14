Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10A841D638
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789377358; cv=none; b=Hcvp2adprm5wxuVAHCt01HHbEC8gZE6Ml/VtQtrqSXz8xIpiemrl8dlfgkTTYAryAiicQoFNUPNNPowObcsCRM98RnqBP2RCJI9wAyR4mTbIUv4CSN1zqouz+dR/kEQoYz/Kd46BCcPlzxP1if/6n4EK2IIrP1ONBFFNxP/or7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789377358; c=relaxed/simple;
	bh=MEXHfGz4HzaBznx53art+ix5nkCHygSVvo4IcvkNi3I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=geO4quI+MIE6s/634Uue+6bxYBXKMqYxX+uACdg2Jf3uur3Hm89StUcmEE200F8R/BsZjiIPLnVBugqTlz3grlTMt/feWRgJRTgIsvsoZZ2jR+uDdSnMqADpFQT6tT/RBpIyNQbd0E9ImnIWFSVh3gYXmRZuoh+vFsGdCdhIGDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HRmHgq2X; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HRmHgq2X"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-869d181419bso2797875b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789377356; x=1789982156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=phiJHwRkepb3+2i8AgNorxLeG3jmpMTw91eiZ14pBcE=;
        b=HRmHgq2X2Z/EGgksdvngFTFse1pON+2eV9Gc9/q8ewPiQfwvTa7DX2O+/bz7iF2Hd1
         eEjYv++yMszZdUD5cvJqpvSGl3vsrDOSxAC+DJqMNrVi59gMlNKZJCURq4m04zEftfue
         EbjJRxWBM8xZ0khbbm4Uib5IHJifQXeB2GgK/BrBO2jWruzHjM63qBNbOxjUqxScaoR0
         39pLUJQJYdjwinNeRAdG93ITFiUxcsZHuYRzNW/c2oBEB8Fkv2IFRrxXSgNlbf98+DIK
         c69jQzR7Cv4E8AYwA4agMhJpxlrY+KpgUTquhNOAd//f3Sb3WEdnI84lmIocNOtTQbCe
         uhYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789377356; x=1789982156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=phiJHwRkepb3+2i8AgNorxLeG3jmpMTw91eiZ14pBcE=;
        b=N5azClTu8KRlTGjXoB1FRe8dAeCrIm3KFRHpJ6CpQLhouYRBAn1jVJQDChlj0vFJWa
         lnD+16AGWMbYXSKQSNiHhbS9ihM7arWe0n7n3F+g1uGPO4BmWJhblc9W5Ggs9peJlcCP
         z2aQ7C1vMTADg4G4QO1LQaTorRnE7yzQT7nvGQtWilbbemRDp7s2fDdsI+F8ZAaDXc0Q
         CJEvInRGDUzs596nPBl1g6cUXc7OLN5JGStHVq98fwE62Qu8rpeH8UP5gsPkSzcnj8mw
         nIz2/h1K1dqFAsiiqpRKWh7zM+htu+rtYbXKprcBGthl/FzvEfVP+w2nMTeno+LFR6+q
         IHwQ==
X-Forwarded-Encrypted: i=1; AKwUvBwGqPCnyJCzQ+hZyAMM7rL393JhRAZW08dRiybTHRl4WBcKZgR4n7nsMR1gtugYeGIl0Z2rRtJGOtPF+tU=@vger.kernel.org
X-Gm-Message-State: AFuF++kFL1B6LU4ANlMaCqVHn1/lVCIlYUAdfU77/UGs2ZN5ahWPVDIC
	jHNi/tyPu58wleEv7yFm/DnUVnQs5f67q7PjxPYRboHx3EnpmtZ3aV2b
X-Gm-Gg: AYBFou2NY9W2O4cNbY1FAOmE6kW6OA75A4rofO4G3XUpUiLTb1IVK4kQnMJmTF7gtoi
	e6iv7T4+T97lQES0Y4YMc6h5/Zo76Kip0fOwvUK781FVKmNLN1o4ohBZBVbHz7E1Hq8kaGChZS0
	aNegK+RphytWwHuF902iu7MTWMXgG2eXm3Qw9pFozl6jUhnmTOHSmQ227FE2IZO1cZowCFaEHek
	ErUQHPy17+eEd+84SBmGO1/kGlKC3B3QN9d7Q/QqqutHTvTxJ9GFVv+8S+UlvQXA2M3baRQh2h1
	6Ob17V50mZyH6jLP8LZq/lvFfU//PYcIUY0/iJ+C9sdjrXlwPz46uPJTaCqRZVAy3bEJ7kUlfAx
	g0qwKoVez3DWSXSavJOwcI1J+MSvKfgQDSf3LjxTR+j2EGUpdZoxQd/8S+AFQJVecbcOZRGTgqX
	Y+UOAh5G+lcE5SFG92QFFGeRev7dcWIrpqnJDSXVMWAtz0yMAk9hm62A==
X-Received: by 2002:a05:6a00:4288:b0:845:c694:5c3d with SMTP id d2e1a72fcca58-86f83346552mr3922964b3a.1.1789377355574;
        Mon, 14 Sep 2026 02:15:55 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b287c0762sm4480614b3a.13.2026.09.14.02.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:15:55 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Gao Pan <b54642@freescale.com>,
	Fugang Duan <B38611@freescale.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] i2c: imx: disable autosuspend on remove
Date: Mon, 14 Sep 2026 17:15:44 +0800
Message-ID: <20260914091544.1667137-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

i2c_imx_probe() enables runtime PM autosuspend with
pm_runtime_use_autosuspend(). The probe error path correctly undoes
this setting with pm_runtime_dont_use_autosuspend(), but the normal
remove path only disables runtime PM.

The runtime PM API requires pm_runtime_use_autosuspend() to be undone
with pm_runtime_dont_use_autosuspend() at driver exit unless runtime PM
was enabled with devm_pm_runtime_enable(). Leaving the autosuspend flag
set therefore leaves the runtime PM state incompletely cleaned up after
the driver is unbound.

Add the missing pm_runtime_dont_use_autosuspend() call to the remove
path.

This issue was found by manual code inspection.

Fixes: 588eb93ea49f ("i2c: imx: add runtime pm support to improve the performance")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/i2c/busses/i2c-imx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 19ec056b00af..4dc3df6a41a4 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1920,6 +1920,7 @@ static void i2c_imx_remove(struct platform_device *pdev)
 
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 }
 
 static int i2c_imx_runtime_suspend(struct device *dev)
-- 
2.43.0

