Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996144F3931
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790060049; cv=none; b=cAS7gCwrWDsyToJbjNDKHXqTFnu2o8mqLdTcJk9cBMpdi0BT/iHY92EdcSuzHjYukQmzsNG8QZZrSLO1CB8bR12nIVMK6zuKtykvjn/gcFdAs1w7XijGtR63cBtKxSh3GPkccO4m+XGvN15p1SI9hU/dAhoxLBcLYkyZdzzLjUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790060049; c=relaxed/simple;
	bh=oHqQP3+7NLVruPkJ0itGkQ8WwFpYBXYtrBmSWYS1tf8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FsMOOhwYfdKfG/kHB0V+mckx66RDpIr0Q7Zkg5fQUo3jhWEsn/aeM8BYCwoeE4KJK/1N41HKy98jEtLSiHlGE2Gf1V8YTeFd2mMJxPBRGwAOiprmSepu1IwG3WBR6MW8sTItFLq1AJ3qL0r65Gs4unMkWFHZr0t6ShO2S638ATw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lnvQD8x3; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lnvQD8x3"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so3403289a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790060043; x=1790664843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A6SRMTHbeLZxqza3uo14NUUFifJ389pqstg6f4EPEW8=;
        b=lnvQD8x3IkL6qen1v7OXPFTRze6ggugqty6R6BldHATjXig/bdSx2ns5kp71KDWgct
         0eJhJJ8Q54GrDOdwWTD8PSs14rxw0pUgSHy8IeNVVFNTRIFLP9saWEpTnlvQapr0tRS0
         Eey63Ayv6ZMxWd5V12/y92Fdvns66omnJ3DJfNemouXXew64gQCL0Z+/Mg9ee0zwoE2R
         fl8r7VctXJ+dAbJcYys05sLLy/Xanlksawl6x7HDg/ae+Gd3r1wsRFpYp0sCflGUQ+0A
         JWhYh3kEqqjedH3Vg9DY+MZDqrUyPYwqI1ZueAgimbA462bKYBBBlFA2PpPq831xC7p9
         LvnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790060043; x=1790664843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A6SRMTHbeLZxqza3uo14NUUFifJ389pqstg6f4EPEW8=;
        b=aYBGGvkJ16G7108zrTtOgu3SHwYZbxUt0W4U9VLLXiqn9PCDiUEqeZE1tbUGOAHumT
         v5BDOuMM8pKrP9lor43/5qKXBDuMer9nQDMKvtbnUfo36rPYY9PFkKukDfKM3KASmlcK
         L1+JuNHuDV0IUrtnhoRwbU264fI7gWTcc2PWVDnbr3wxmkNPazAVwgF/PwdP7OZRbDX7
         qbi7eetONn9ASl6F0H6T/O+MKiQb3rCbOznv0AYX1wyItWo7/aWlo6zLNeAFSN2HS8/u
         YtMbsR6ztQ04QEr7d9TiUTf1x1yPMzO9KTLe2DpuePvm6GJdrn9ZmnvCxF6JT9Sw4K/l
         lnCw==
X-Forwarded-Encrypted: i=1; AKwUvBxyACrYl8zx2wbAv14nFhZiCO6BRnP2uftF9+B4zqf4AhT+A9RqjfCsUrG0oIuyRRnRiG77uypnpZ3n1DI=@vger.kernel.org
X-Gm-Message-State: AFuF++kPTzkazzDwl0v3u66bYzAzSliVfsyYCqClThKjue3XDD2YzBVc
	xHEAPMjt4x7UG2/uDye9WcxDm/6p1yL0k4AlXK7ErSjcQ3tbuuAPsWbL
X-Gm-Gg: AYBFou2ZnWvLuejaOHqC60aRmlN9k5y2nfddq4Ty9skJft6hxm+esIyG6e7AJTlF5Wz
	m7WbNpVXnY0agcsB4DqfWnXtzRkjC18hm4zNcjHEJHr1azrx6Qw7eaoio3yVwB89vW8N+eXVAYK
	JIAglGcrrrShmeOoMb3R0fRCCTsg/CDNEnx0RFtRDYBcAnP0z4qPYjg4o42AdupLoIJ9J7WH8gY
	o+ue8tVerMGxiIpQTlsJ5URhh/H7TcampwJJxzGpXd1uAiVdmKauJxsFzktMdqUBYmYziqJflAW
	M+FR/NxmXrBQS1moYacWBRJJWrutXsNxol0d45pHrWuTl24mLVyDemoedGX8AGM9KaKn2IJcd/G
	yJyoynsp/0kktP5KGyeM0EuD6q5kgSAW2tEbCxm0WgXDJn3/VMMf6Eh9vLvH+5Cu/R7tKEu9q5n
	cg7HDrNjzbl9NaSL/+pUfJwS9AOwtEtdeYTvLr1ASwnRSgAFWUwrjl4M5KnBTwP9m6tqjLWh+qG
	h3/hxEwtKL+quSmEvrE74Roy66HMzpmmb+By0FvobDqjjK6jzTI+Gw=
X-Received: by 2002:a17:90b:17d2:b0:39d:f66e:1720 with SMTP id 98e67ed59e1d1-3a0730d284dmr234403a91.13.1790060043143;
        Mon, 21 Sep 2026 23:54:03 -0700 (PDT)
Received: from localhost.localdomain (5.240.104.34.bc.googleusercontent.com. [34.104.240.5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06e26e70asm1952078a91.1.2026.09.21.23.54.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 21 Sep 2026 23:54:02 -0700 (PDT)
From: Ginger Li <ginger.jzllee@gmail.com>
To: vz@mleia.com,
	piotr.wojtaszczyk@timesys.com
Cc: linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: gadget: lpc32xx_udc: Fix a race in lpc32xx_get_frame()
Date: Tue, 22 Sep 2026 14:53:57 +0800
Message-ID: <20260922065357.18103-1-ginger.jzllee@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lpc32xx_get_frame() tests udc->clocked before it takes udc->lock, but
udc->clocked is cleared by udc_clk_set() with the lock held, for example from
lpc32xx_vbus_session() when the session is disconnected, which also gates the
UDC clock.

When the test passes on a stale value, udc_get_current_frame() then reads UDC
registers whose clock has already been turned off.  Check udc->clocked inside
the critical section so that the state can not change between the check and
the register access.

Fixes: 24a28e428351 ("USB: gadget driver for LPC32xx")
Signed-off-by: Ginger Li <ginger.jzllee@gmail.com>
---
 drivers/usb/gadget/udc/lpc32xx_udc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/lpc32xx_udc.c b/drivers/usb/gadget/udc/lpc32xx_udc.c
--- a/drivers/usb/gadget/udc/lpc32xx_udc.c
+++ b/drivers/usb/gadget/udc/lpc32xx_udc.c
@@ -2403,10 +2403,12 @@ static int lpc32xx_get_frame(struct usb_gadget *gadget
 	unsigned long flags;
 	struct lpc32xx_udc *udc = to_udc(gadget);
 
-	if (!udc->clocked)
-		return -EINVAL;
+	spin_lock_irqsave(&udc->lock, flags);
 
-	spin_lock_irqsave(&udc->lock, flags);
+	if (!udc->clocked) {
+		spin_unlock_irqrestore(&udc->lock, flags);
+		return -EINVAL;
+	}
 
 	frame = (int) udc_get_current_frame(udc);
 
-- 
2.43.0

