Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD874496D41
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 20:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789072131; cv=none; b=XDZQPp9HzgDJ5V4xYaDkMv8XfUU3kCRZbyXi/H3U3I93gplvVgiLtUm3QZ8FUPx/UrbmwHbQJpRFclELCYYf68NSvZPqYPNDy6SJ5xPgqBOCSHrApo09eY+MTQtb91MYo9XbGN8V/wKbgOMTN5MLJLvH/vULSJFIsEtigMk94nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789072131; c=relaxed/simple;
	bh=x4/uElXbKPNsHJIECqgisA9YuQG0BqXHRecovgEqQPg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=obz5OI/BiGWg7buu+X0JafoLWPsHq7B741pHxelEJoLE/6T5Sv86uvJffnbclGEZAeIdfZoUm3ZchX2OdgTZ2KucjXU8ZbQ6BGe1ByInt9SYki6gehew6XApiXfOQ+TYMpWKYxWU517okiJQ6GRzA5cvJsulgZzOpPXDr9rTg4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lVqZ4/FG; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lVqZ4/FG"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d6f9e2f681so1136145ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789072129; x=1789676929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Aa3oYV4B3MU/10qO4ouQXqPc/oc+sYQCXCIbQhucJYo=;
        b=lVqZ4/FGOZcsVRYMZLrW7ijoAy1CYNgnLzKs2s4NQt5l18ebH+OwlycdzgkQfDZDIg
         4PruWKO6DDQBiFYX8S0zk9zZjWaN7LZCxqU6GrtJF0bPo0NwfR0nAPTt5BWPqkyUikJu
         yQkzuTz6iQqEtE6By3CGUsWdy6tqMQ6emLzDUpB449oQudEAB1n0e/rtc/Irqz1Gg13z
         12hFo5N/LcC1F59i2qs7uSFIl/2YCgBhQnurGTN77v4Y5rayMWlfoGHHiUllRzJMzK43
         YG4G85J+yjpCa5Utr6m6AQQJ4q7E+qnO+LIRKmAvgkClM0WzWNgfB2a2z0Y5W4cd/6+v
         RJOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789072129; x=1789676929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Aa3oYV4B3MU/10qO4ouQXqPc/oc+sYQCXCIbQhucJYo=;
        b=UAMKSH9zNeDCiGKwUbkhhK++c2DqPT/bbu68kzehQZVCDSD3mqpqGPpSjzkVGo3ch7
         I3Xux37buAjO/g8wsaMMcTLqA4whUZ4iNWdP9R872Ra6kNLUSH05dtRE02XciT2Oa9Kx
         tcVQWLJgjKwVqllcM8KAoi0FqTfEnazCCpeP7z8OfEGIyj8FgY+INczhb0VG5QP/XeSS
         w4k2uN9zxM1vq/U5J36b6unJQVamFPjFRILNtSOJLjTeNx8Ge2CY5rpHFMN3+ckMPgWE
         WGxcbMKOiKUiXf5AwGRsDEs03jvG1lneQH60ePmSzgRS2a/SF7KhcRHakAET2OFcQ3B6
         tAEA==
X-Forwarded-Encrypted: i=1; AKwUvBzWfOTVbJAiijowFCNRo74c4tsMp9SzRAra0Tq03wJvIAi0td0cvcdg1GTjjAszWTWcVPzBIVxcuLDoaeY=@vger.kernel.org
X-Gm-Message-State: AFuF++n/I8KZOTKFEhNPgs4GYMYeJd/rx5C72Zw401KECUIVw/aeF/o+
	X7hVu5KXkHzUCtrIKjs35+Uq0Zw1MRc7RGhgzO008O0sS6NL2EIqNhA1
X-Gm-Gg: AYBFou115cK4sVXwM7v0lwTJWDRbt4Hn5b7izChKiMNIZvpWGO0JFOtFlMZRvyY/G4i
	B0kv56gHEm0Y9mqZRSq1pxGMvtgEfIVYtAR3fH3Lg4IrJ0Hcxk6/qdOrq+4cjOsaX27vxrQ46g0
	9AbjtUUqiZf2OlwBtwvsQ8CjqMuHyvb4WbnfRXsmvQmkz3V7StrveiFSpCx1OFdncDDHvqX+nG9
	lJVCdiKm1WrMAtQwY64J9/OZsieBFgLmhJAzIOfT28F9mSxjtKg98z+3+z0/JK1fdLzo9HUvUES
	j/JY4QwupjdgLRx2gOIfDyVrziI1LFDHF5d+a3TpvMuSexua24nsuZv+jvz88QngLIqUsG0vqrc
	5XAZxsVlZbeKHG33Y+rAFc4+Dw/dEvtGAPc88AD+ZGDqsqHkRo9vgCv2g+8TIBYX0zCkDE3SUDZ
	DNS0knBTgNGAWcifF4CzanExGS1mldtvRABpeX/ItzD7llBd6RcL50WFUQaYX2l964X+XGH0z1U
	Ur9IlMNMKJErpvLqtcKxYN0l0XGtOVYuI7xG5pDvVg74oYubUt5F32ZW9JBcNQtZOOX1lQHzWO3
	e+uXdT4X2bRgW2iYJJYMNYetr6ciAVHh3qW3pporFGApfrn5
X-Received: by 2002:a17:903:1a4d:b0:2d9:2149:57c0 with SMTP id d9443c01a7336-2dd2a56f3e4mr20652425ad.22.1789072128998;
        Thu, 10 Sep 2026 13:28:48 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2ceb4024sm1430895ad.33.2026.09.10.13.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 13:28:47 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Zhang Wei <zw@zh-kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE DMA DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] dmaengine: fsldma: kill tasklet before removing channel
Date: Thu, 10 Sep 2026 13:28:46 -0700
Message-ID: <20260910202846.48941-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add tasklet_kill() in fsl_dma_chan_remove() to prevent a race where the
tasklet is scheduled by the IRQ handler and runs after the channel has been
freed.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 v2: split from series and wrap at 75 characters
 drivers/dma/fsldma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index 6ce0e5668dc2..5eca8ab23564 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1207,6 +1207,7 @@ static int fsl_dma_chan_probe(struct fsldma_device *fdev,
 
 static void fsl_dma_chan_remove(struct fsldma_chan *chan)
 {
+	tasklet_kill(&chan->tasklet);
 	irq_dispose_mapping(chan->irq);
 	list_del(&chan->common.device_node);
 	iounmap(chan->regs);
-- 
2.55.0

