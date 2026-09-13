Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14BB23BCED
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 01:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789262789; cv=none; b=ejV75A3UBxQ/TpPlP4dR1DPGFP9q56DS/gF2rNAqE6zK2atTKwFGRK64s8QFSr7cqAEmL8uvsjneFq3k4ggz9yyPPVNPXD6Xlt9PGWyNalmC1Ouk6Ux1J1QfZSAcsiwlmakVQcoxlIOpDRzrH+Slz1AR+8H+Pl8/2AbugqaccCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789262789; c=relaxed/simple;
	bh=vq0BLZJKQQeXcOLMrECiZQUoz/qRm0wp8uFG6cl/bUs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QfN7qnrbtY27y9W7X6EJFGEU2KPxp0jepsfDUrqI9qBLWz45du5dqlQtRM9n5To+Y4URYCXG2zwCYfb+RKJQQy/MAm6OqkINX1tu4ZUyeFmJmWPgrFgV/Q0fGm74jysXooGVf4ctA5bcMHq6DK3qCs3njZ5L22DT+SwRjATU5EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MJECNUtV; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MJECNUtV"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-5309ce58730so16289141cf.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 18:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789262787; x=1789867587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OrmWLT4Zwpo2KcrRAH9rEocONFRPlYSL9C/P1/i0Lis=;
        b=MJECNUtVbPGBdzcoYV+rPPFrAXTTLCddaVay0l+OeDCl1kE4PSC0rwdjK+ILF00gDH
         avSLIHw6Cr7pZPUOGzYe3HJaTWr9EPAffSSX0rxNP6HzK+4K4UkAYfwx7/uXN+GDioeB
         tI9Dem56XYz26DzlEDSX053UGtJ9R3QjWaFevhv8CGLtxffBfBdE5ntZsyQtkTheLAou
         nELisOjQfCsy07UOeHk8lHbI51toIU+ISFbsMzCqYP/Y6j/QUzLM1XoB/a1CQYelhDlB
         1s0uDn4JQ/ZznSUvaeAXuiYjuIonyg3Td2G2jWr9ldhzxLCnrUpe8Z+eCGQxn2ABKagN
         07AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789262787; x=1789867587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OrmWLT4Zwpo2KcrRAH9rEocONFRPlYSL9C/P1/i0Lis=;
        b=Oh7kBUZESbXCrGf9P5RBtWt9rd22ALcwylo+LcZ7G74rSPZ6gWrGfJV+2YIy612feE
         l5q+M8lMcLZSmxVFg7Vd7Gppxxai2fQzeoLmpy5rN90YeivClm9lxff/gNuZPo4qOkTX
         +4NiT0uLXevh2V3VraM/VcZ5Z1BRG7q1Fi5MLj6ZYCPZEIzDdsDbfF6btWTMVrOIU9Fh
         WB3RBClXaTbXfOE4ieyZFG+0xGd/W2myMcXMuEJ7yJwpY3nZY91uUrF0gve1b3UemI9s
         QwzxaBZkxy9ULK+urdwY2caw1YJEedAHHir8jnXwdUFPS30G8YelGyrXkG3gmqMdUGkf
         /ftw==
X-Forwarded-Encrypted: i=1; AKwUvBxbi5kJySbPiE4UrXWqzM3oXw8lxiWf3up7N2sKzoBQvAaZp2sDHBMafO+75dJu4SoTxkEQfmIJEiTGlZ8=@vger.kernel.org
X-Gm-Message-State: AFuF++kOCt2XCP+cdpzY40j6gqUX4K0vA4BJJiknU0eZlgTyQzuIV3O1
	jul9djQVS/qj2hWRNeYGxZZae9hHPLeD9Yu145D37HSKMSMoEn3uZn8=
X-Gm-Gg: AYBFou1Lkn5VcM+f5jLVDER4ljd+qvssBk8UgBg58TW37I7OE2wCdbWyghE1rOPQi+J
	Hrt8XwvUI7Cp1lIadEgMkbWCNIdDAsDEScSk58F9ce6CCdr5wEULFIDiWpIf7K1lzt2L36Obr/i
	vnb2ngltsH34Aj97KdEut+p6awiFx5hhwtPbRcaOUXcvO7p+maSmlGISYNyFCS3nHHMuYwL8OkD
	lXD2sXtvxGK3jeO0Www3sQzsHXqHYoMhJclFPKriLF99flmuECv12hq6M69Fze/wSsKaWReePJU
	VyGEjrNfsdQ59tq68Bjh5wiXTtW29C1xcNuc0nTir2dlz9jwuSR7vwE2LpRMIRfTRuPrdtwFqMc
	dSc4VgEk+vlQScFWXGzBrYEyC7TbrE5DcpCcE87bFZS+4sO3Hcqep0B4522aVPM7j+5qvfUwuHH
	nJYviEYHTAcRkVmTiKWbvzFysfSBa4T8/h9XlR295qiVZU3fokG94+p/MxjooOwR5i4mVr5EYWD
	Z48PZYJigXjWUI5uWHybpF3bsxI7uCJt99kn50mZavCCE+AT0QYEvnN8y7pxy2yUlmseMVb9qbt
	mNdmmRuGvGq1U2tJoOUL2e6C4Nque5rB7g==
X-Received: by 2002:a05:622a:1ba5:b0:530:db17:b1b1 with SMTP id d75a77b69052e-530e7da1b86mr73978581cf.8.1789262786856;
        Sat, 12 Sep 2026 18:26:26 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca511ff0sm59610871cf.31.2026.09.12.18.26.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 18:26:26 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Roger Quadros <rogerq@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] usb: dwc3-am62: shut down refclk on remove
Date: Sat, 12 Sep 2026 21:26:20 -0400
Message-ID: <20260913012620.13593-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dwc3_ti_remove() relies on pm_runtime_put_sync() to invoke the
runtime-suspend callback and disable the USB2 reference clock.  The
callback is not guaranteed to run: autosuspend may defer it, and a
reference held by pm_runtime_forbid() keeps the usage count above zero.
The following pm_runtime_disable() then cancels pending work while the
clock remains enabled.

Balance only the reference acquired by remove without requesting a suspend,
then disable runtime PM to drain any operation in progress.  Disable the
clock explicitly when the stable runtime status shows that the device was
not already suspended.  This also handles CONFIG_PM=n, where the runtime-PM
calls are stubs, without double-disabling the clock after a failed resume.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 6661befe4100 ("usb: dwc3-am62: fix module unload/reload behavior")
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/usb/dwc3/dwc3-am62.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-am62.c b/drivers/usb/dwc3/dwc3-am62.c
index 632634d6e..2fb9e088f 100644
--- a/drivers/usb/dwc3/dwc3-am62.c
+++ b/drivers/usb/dwc3/dwc3-am62.c
@@ -319,9 +319,11 @@ static void dwc3_ti_remove(struct platform_device *pdev)
 	reg &= ~USBSS_MODE_VALID;
 	dwc3_ti_writel(am62, USBSS_MODE_CONTROL, reg);
 
-	pm_runtime_put_sync(dev);
+	pm_runtime_put_noidle(dev);
 	pm_runtime_disable(dev);
 	pm_runtime_dont_use_autosuspend(dev);
+	if (!pm_runtime_status_suspended(dev))
+		clk_disable_unprepare(am62->usb2_refclk);
 	pm_runtime_set_suspended(dev);
 }
 
-- 
2.47.1

