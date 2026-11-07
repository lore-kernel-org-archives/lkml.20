Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794033439;
	b=ajdmhpSJ4X+8lloGIWPAB/f9/mh659c0rYTbTq8+rdTk4Q9fwgztQqO1ob/SxyO8+EIp
	 smtGQSNAv+zkqmt2hHOYcxDba16y6ZPhG3dhei9BGOj+90yL7nltNfbdBaqwBQJO1fEtt
	 7llWRthCJWQJfzwI3uIlziI7MfI748a5kIfeL6lh7jxAKRcGNCi0wNFR+lEuiERXcLMpJ
	 oMj9l3dRfZmhV7EgkxQkgP5CFBKXMgDIMk3FITm7hiSEGTcJiOfaEtBLIhTzY7KbfS5A6
	 eLXmpf0uKtmIoEp0udakNALKeO5MdfubHevJx5BReIH0yzjQOvbnA4uzZyTrnI+/TYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794033439;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=t0SasdD5O78Tua3GaSrEY4WvAvJVfv0N4XP5fK5UX6k=;
	b=4nuPkfpNub25jTmYZ+XTAS75ftYrEowiL29Ja/EZxbjsy2SQTk4LAQuOndIB3ru0bpJe
	 yD8sApAG0ee+I/IfPTx5ZW2EYqMSZOy6mh/58PQ7KXDj7r7AKefm3aS795r192cIa6Oc3
	 V+Amefhfi7oByMCuEvJp6zGPNiPn9JMDnLL0e4kLvsFB6XHIsbY/6ZRcl3EwfX0wGsauY
	 eLtKpjy69VFbz0Swc2+OV+zwBPZ4aG7DY3UKOT2w1uA6UMCXE2iI7REC7Tz/UaR0ObhKv
	 6BOfkIm0bvOo6jGviM2d1r3AWjUjU2/6TLVSpao8LUlqGrymYl0JYlSpqKOQq8+cKmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R52Okyr8;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C1C606A337
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 06:37:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7C1C606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R52Okyr8
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ed0e2015aaso5394485ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 22:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794033438; x=1794638238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t0SasdD5O78Tua3GaSrEY4WvAvJVfv0N4XP5fK5UX6k=;
        b=R52Okyr8y2WeBJ90NdR32XbxQ4qgbDLtcRNASwCSEPonXO5Kc5v1Pd5JlH7qxg8t7c
         HPY9y5VlzGvRuhP4EaDj7pc7SUMPeyuDIQTQiLL1DUvL9dIqtGl4Nzt2muqstyyb7q2v
         PdKzpQhDr7TUrNFAC5DkaiGkscPsqeALksYrgIGWZnMrELUFQYBAu36r3nLl8hwCx8wo
         c8VvuWTirrGqgVcKY1fghZht8PDF26snR6l+PqYD0WOqF1kQlvUjzY+EsQA7Bmbh8jkj
         VsJT3HQTR+TrAfRHK7Qla5uR4B6przejXtwubtfe6IGpJF+HeO7J1TIXySmkxCLAwBW3
         /sfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794033438; x=1794638238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t0SasdD5O78Tua3GaSrEY4WvAvJVfv0N4XP5fK5UX6k=;
        b=cggBqP/Sfpt7Q2SOrcwP6HRhq2MuHEialidPyXs1KrtSGt3omjTEsjOYCzcR298OQW
         QuKeeO/nxMrMOFI+Y2Ika5uidZIUOoPYkpnX0ICsjGAgXa3LlDTP1srMVy6NL6ghF8D5
         jvqECB7HU5oQJzpYcghWT+ahmXk2phhM/5vWdI65b2MIrgzzheDb2xw1wgOtUBcwduZM
         0zqmThYA49pAlXNPTO3C9/eFGBFfKT1x5U5rH4Y5Jmw41LKPsxa2sYhWsZ+wwnO4zCeF
         w4pl5ZVJEjEDu3s2PiGRQgoTjrdQdrYBR+AC2M7ZkuhTaSDm6fFddI+u92n4VoZ3SWgR
         Wbyw==
X-Gm-Message-State: APuU4Z/GLTHH4f0rzKsuYIBUg5cxDOMLuPaMOFZ6dCkiICQhDLyPW3Mp
	Lg0fVMJ5AJuHft6eXn0VmQ4QxHl7MN++G7dV94RHHlVtCUSGMOjnsyFs
X-Gm-Gg: AYBFou1/cENKKL/0i7JldDVIjh2M0DbcckMa/A9Vi4p2aG1ha3gx5t94wjeuqfqERHY
	E7PyNHh4oXLKbh6sxBdV5piFhmDta4C9wdELbcCKJsCwaXhdLmBpsI0mTzmNlD3Y+04aQpwYE8s
	6bRRx7ddMJ31ibwn5GFLRqVtGuO+m3yJKxub053FKOHNLF3LSUgXIDJt0fWf/VBd/F5e9rjOp5r
	zTI1bcWEID4AR6PmBI+xFWx41pWtKJIz43rEkTuDJE7Gwj9vbgxirSwE+CYlliMcJOVvrA0GE84
	juqd1Jrbw2i9Q3xzFYHjccBuau3rXUTyquGh1S1fdAEn9Ec71OlB8zjRvCvfiiA/lcEyCtK1QaS
	qfOQJpb+1B4O3zl5EsPoYcrVUgmOUG+tr8yuQmaVV4qJlBA+dD1HUPI3zC9vgfPtmQ04j+ErAv+
	HbMgS7KibLYKvD7aDSdb4cje03hQ0G8eW6tvriJS9gkpsQp34jx9ShzEAEICPIbE3Xwq6XqC5AN
	rS6GoFN8DwiYxDHtn7F1PQqyjgJBcbPGXW4Xgt+165nGh7dxRVqhq7yjqUomg9WXqafCiDxHNwa
	2++99nxcvP+nshHLE689GXlfEyUlrGWGvaUChO2BeHYV1Us8Um/LTiyxe7PbJdUeoZ+sSw==
X-Received: by 2002:a17:90b:510f:b0:3a5:c08:4c41 with SMTP id 98e67ed59e1d1-3b0db724f88mr4471992a91.50.1794033438122;
        Fri, 06 Nov 2026 22:37:18 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0fc23b547sm1597066a91.0.2026.11.06.22.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 22:37:17 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: CL Wang <cl634@andestech.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] rtc: atcrtc100: drain the alarm work before the RTC device is freed
Date: Sat,  7 Nov 2026 15:37:11 +0900
Message-ID: <20261107063711.3388440-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hyunjung Ko <hj351016@gmail.com>

atcrtc_alarm_isr() schedules atcrtc_dev->rtc_work (atcrtc_alarm_clear),
whose handler obtains the atcrtc_dev via container_of() and dereferences
rtc->rtc_dev (guard(rtc_ops)(rtc->rtc_dev)).

atcrtc_probe() requested the alarm IRQ with devm_request_irq() *before*
allocating rtc_dev with devm_rtc_allocate_device(), and INIT_WORK()'d
rtc_work last with no teardown cancel.  Because devres unwinds in reverse
registration order, on unbind the RTC device is freed before the IRQ, and
rtc_work is never cancelled at all: an alarm interrupt arriving around
unbind can run atcrtc_alarm_clear() after rtc->rtc_dev (and the devm
driver data) have been freed -> use-after-free.

Allocate the RTC device first, then register rtc_work for device-managed
cancellation with devm_work_autocancel(), and only then request the IRQ.
devres now frees the IRQ first (so it can no longer schedule the work),
then drains the work while rtc_dev is still valid, then frees rtc_dev and
the driver data.

Found by code review; not reproduced (requires ATCRTC100 hardware and an
alarm interrupt racing device unbind).

Fixes: 7adca706fe16 ("rtc: atcrtc100: Add ATCRTC100 RTC driver")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/rtc/rtc-atcrtc100.c | 30 +++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/rtc/rtc-atcrtc100.c b/drivers/rtc/rtc-atcrtc100.c
index 2433df3..51a38f0 100644
--- a/drivers/rtc/rtc-atcrtc100.c
+++ b/drivers/rtc/rtc-atcrtc100.c
@@ -7,6 +7,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/delay.h>
+#include <linux/devm-helpers.h>
 #include <linux/interrupt.h>
 #include <linux/math64.h>
 #include <linux/module.h>
@@ -301,6 +302,26 @@ static int atcrtc_probe(struct platform_device *pdev)
 				     "Failed to get IRQ for alarm\n");
 	atcrtc_dev->alarm_irq = ret;
 
+	atcrtc_dev->rtc_dev = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(atcrtc_dev->rtc_dev))
+		return dev_err_probe(&pdev->dev, PTR_ERR(atcrtc_dev->rtc_dev),
+				     "Failed to allocate RTC device\n");
+
+	set_bit(RTC_FEATURE_ALARM, atcrtc_dev->rtc_dev->features);
+	atcrtc_dev->rtc_dev->ops = &rtc_ops;
+
+	/*
+	 * Register rtc_work for device-managed cancellation after the RTC
+	 * device it dereferences and before the IRQ that schedules it, so on
+	 * unbind devres frees the IRQ, then drains the work, then frees the
+	 * RTC device and driver data -- never the reverse (atcrtc_alarm_clear()
+	 * touches rtc->rtc_dev).
+	 */
+	ret = devm_work_autocancel(&pdev->dev, &atcrtc_dev->rtc_work,
+				   atcrtc_alarm_clear);
+	if (ret)
+		return ret;
+
 	ret = devm_request_irq(&pdev->dev,
 			       atcrtc_dev->alarm_irq,
 			       atcrtc_alarm_isr,
@@ -312,12 +333,6 @@ static int atcrtc_probe(struct platform_device *pdev)
 				     "Failed to request IRQ %d for alarm\n",
 				     atcrtc_dev->alarm_irq);
 
-	atcrtc_dev->rtc_dev = devm_rtc_allocate_device(&pdev->dev);
-	if (IS_ERR(atcrtc_dev->rtc_dev))
-		return dev_err_probe(&pdev->dev, PTR_ERR(atcrtc_dev->rtc_dev),
-				     "Failed to allocate RTC device\n");
-
-	set_bit(RTC_FEATURE_ALARM, atcrtc_dev->rtc_dev->features);
 	ret = device_init_wakeup(&pdev->dev, true);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret,
@@ -330,9 +345,6 @@ static int atcrtc_probe(struct platform_device *pdev)
 				     "Failed to set wake IRQ\n");
 	}
 
-	atcrtc_dev->rtc_dev->ops = &rtc_ops;
-
-	INIT_WORK(&atcrtc_dev->rtc_work, atcrtc_alarm_clear);
 	return devm_rtc_register_device(atcrtc_dev->rtc_dev);
 }
 
-- 
2.43.0

