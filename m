Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B0035B63C
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 03:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790996689; cv=none; b=MBlktrw0B613dP+d4tkXNzGZ5Bv2rIoIBflShFzyhnS+CNUb7nFw+/VP/fP3CVlE+pdbLpSJ7U6JY89eIdXGGI4kudew4pZFcL/NpoyLESc0463H60B+4+RKiLzpgdJ+4pZ5VD02eS5MOFUu/opDCvZAv+dUzqF/8XCg5clUGGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790996689; c=relaxed/simple;
	bh=4BYVqjUglUdukgdquAFjv91VzVsZy6yCRbIPkKsP4hI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b5pa6A6KbVGGtb3GWKU8b0NbwaWZiYGa9BYZVW+VT1ql8Kkk4NoCOvW2PvEVn2og7mFZv0nVUccfbPW3Ogj9O4WdiPLIiifaM3xMnuBlCxfgkdwe3RQVxWgXAKn4BS/ousGvdiVr4USWfV9S3oMH7yEUIPJiVmWfTh3fBw5pdU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NTKAOkMt; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NTKAOkMt"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-93e58478119so1189685a.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 20:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790996687; x=1791601487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pbQpt4XN2R0/yiVPfAFgl5CdQcTGytdEwK5oHePqLiQ=;
        b=NTKAOkMtGo3EeQ4qnu0C65C29P7ibVmiO+LtvTQxVPRzC8sCXFUkXXwsHgTd2a7urg
         ccnmlDHizCQ4Kigyq5StOhY4Gmfv/V0yU9ZLmxgd2g1Qx/Om54zELfYOOSSlRpNDIjk+
         /cG67JNQZBDRciqEe6nsPrXnBseKH3UkDkGjfBia+CBqDryBLjkXWM+T6gRtvVjEfu82
         dVguZRFF5gbjBfYwWjtWFYYa+UeW9tOmWnPINEZJYbwu7bgKqeOocyI/8jFUK581FTUu
         ZHrqsZmnDaEEPVOx5Eu9gAZ1YkpftMVELoAjzflSB1/a31Spphh0vUn4rIlDUsSrQpbK
         iGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790996687; x=1791601487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pbQpt4XN2R0/yiVPfAFgl5CdQcTGytdEwK5oHePqLiQ=;
        b=mMlrQoy2/As2UfO3G+BckkRLNGpGqgnMpP0S7wXbVDR6UqGJykDt0bMDIEewsYXE4E
         LZjRZ/nXQNMbLnwyGU1yj55diPGsaO9Pq9I0H7fVG8Jzj5SSeuZJq5aWYhKiKEzJxQ8l
         HHWKbbX+AgkLn4JX4x2oAxurUBpNokSAkTym2fIYaMfpCu90WRg3RJCImhh11W6L/fq7
         v8mCEcrxDqZg13rVct8rda1IWQhXgeoHacjS6kGiGq7o5kUw4adxgzdI4bMaBYz3Rh8e
         97V1QHDTBHClfrL5mrog/cEPr9DtKgvOVS/832YXsE3BxCrJIQcPEIgWFMRVMLv6qACA
         NMxw==
X-Forwarded-Encrypted: i=1; AKwUvBwFmnMVfDKMZlkMenAU1aRdWysCwTR7H8Z35Nb0lQdOwV/LvT28aU6QTMU2IOI46hT7DYhZ3Z2WXqSH5OQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nSdJbhX1oQO50iy4x4s9DJ8kxOHEhZtRK/UY5nH4ttDfA4t+UP
	q93vI7faouL4cvgBhWTJMKT3JZLZ7aTflBiCHpp/iBU4BkKd9qrt+OE=
X-Gm-Gg: AYBFou03WiksB6Vn34oSrCQtVg/j/ZfknhKJRL0sr3FHnh4eujt//WFLu7XVW+f0rSv
	o5OAKHDqcgwoNkoHmRCmcCwAwSJuS1xTJQnFR1bZW69hRRhxyWJA2of5IixNHyo2R9DtqtyVbOi
	vmfaCNi+VecTJZy609m/wZXPtLl7NmjIlCrGjeJFcKkR6OOJOp4WakvsbopjC/KpgzHJbE8004D
	wgnpUb5X2q7GKL6DZ8ERZlJ7kAvGW61ROz3+ZLSIu6hYB4C4DHYCN3U2PJXjxAXWJZI2v+5EzCC
	gz0krDWHIPuRkeitunTESpQi4ObGwGslm0EeG1siRHOOeR8EFyX6TzeZR7cw7EVE2M+4HgRjYG+
	N+vLuXwMt9mHu7wj60boc/SFzFJ8hEjwKuorS06Fj4dXsSW46ITJ9wittExPKS5TOk9iJ6q+Hqh
	R+MZvtdFpGHN7Pkjh6ykaTp3BmpQLci/hGyLQQ7rtvYev9ldx2fCgh66rAbmBunPP+KunrN9E2E
	Z2Uj+DVjrZUQZ0NhavapXEE2Od2kAZuQTUiZ0vbw3qEnjbtOlMg0TM9VbuUcZq4dPaw6Mpt1wYw
	STApIuDceHIT5ZykynhcwixZPc9b
X-Received: by 2002:a05:620a:2851:b0:93a:14c:32ad with SMTP id af79cd13be357-93e50bfed26mr274906285a.0.1790996687163;
        Fri, 02 Oct 2026 20:04:47 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917e0bc8faesm34443696d6.28.2026.10.02.20.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 20:04:46 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>
Cc: Helge Deller <deller@gmx.de>,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] backlight: lm3630a: Cancel delayed work before destroying workqueue
Date: Fri,  2 Oct 2026 23:04:39 -0400
Message-ID: <20261003030439.599330-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The interrupt handler queues delayed work to read the interrupt status.
After free_irq() stops the producer, this work can still be waiting on its
timer. destroy_workqueue() cannot drain delayed work that has not yet been
queued by its timer, so the timer can outlive both the workqueue and the
devm-allocated chip containing the work.

Cancel the delayed work synchronously after freeing the IRQ and before
destroying the workqueue. This also waits for any running status read to
finish before the chip's resources are released.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 0c2a665a648e ("backlight: add Backlight driver for lm3630 chip")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/video/backlight/lm3630a_bl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/backlight/lm3630a_bl.c b/drivers/video/backlight/lm3630a_bl.c
index 8f49e59ce374..8ef8163c7fef 100644
--- a/drivers/video/backlight/lm3630a_bl.c
+++ b/drivers/video/backlight/lm3630a_bl.c
@@ -591,6 +591,7 @@ static void lm3630a_remove(struct i2c_client *client)
 
 	if (pchip->irq) {
 		free_irq(pchip->irq, pchip);
+		cancel_delayed_work_sync(&pchip->work);
 		destroy_workqueue(pchip->irqthread);
 	}
 }
-- 
2.53.0

