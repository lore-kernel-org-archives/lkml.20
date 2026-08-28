Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A9A38D006
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 16:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.65.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787935500; cv=none; b=bKKT/cAmei+BL5unfCMH7u0pCaNrVHee97ceUDT/DD7N/WuZI1fFZSoYwwGV7LOKMBWPmVD1kClQkrf75G9jgWMmGaxnIXnv+opFXD5v7G3F70xWJnbb+8wRdLgSiL402fp2678IbrDYvRnuiimh6fWofy2XuDfXdgUv3wtJWY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787935500; c=relaxed/simple;
	bh=llONX/NdZoKFEqhCFOoppH176y3je0zUEANfqWHZ5Vk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p1VjJ4pa3rOruouyBz3i647WzT0KzwtuzKLlEgLlVYcKkkTm1qRsqyQHBvTR8l+d50zsEiK6dz+fteydDNDwQ00qVyyI2LOOO3+y+cDSzqOSTPwBq8jU9vuya5SFsQ5FE2ipYoSO5Q+Q8crd7LzV9odW0tsrO4QtfxO7wfhs67I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b=RBV2WJoc; arc=none smtp.client-ip=185.136.65.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b="RBV2WJoc"
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2026082816444832e6769e2e000207d7
        for <linux-kernel@vger.kernel.org>;
        Fri, 28 Aug 2026 18:44:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=yngTCFB+bOnL2vvp7Vkgzb4fmNnuoa1MBLNdfXgLr/8=;
 b=RBV2WJoc6tcR3CKUocL7lnNNfcHdzYLpbIvYgYM+psRUpwJ68qc0jDoclZqgeSa/fF0DTE
 KMFAhyBVBzZ/OjpTBqL/irnafhQZSVCeMrrlv2bIQJcCJZLZbxcIjzOBLxaTr+qAIurruVQw
 H0HwMV0pkJOMTS41A131DUAnh1hb22I0V8uAfZsu1jmmw+eKVDUxWFm9cll2Kz/eXKyG+0/o
 Mo4QhWMrHcKcOWRJY5f4FgB9Xc0jrruhxkC8Fw30QdGGMPzAWN+P50gCrMKE2yFQx8YuqLvL
 8xnpWMghV3pQiZfSfOL5FIknwemIPcjj7SL1OiTMefOdYP7TeBWbphpQ==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-rtc@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] rtc: pcf85063: do not clear AIE in the interrupt handler
Date: Fri, 28 Aug 2026 18:44:40 +0200
Message-ID: <20260828164445.3907839-3-alexander.sverdlin@siemens.com>
In-Reply-To: <20260828164445.3907839-1-alexander.sverdlin@siemens.com>
References: <20260828164445.3907839-1-alexander.sverdlin@siemens.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

The interrupt handler cleared the alarm interrupt enable (AIE) bit while
acknowledging the alarm flag (AF). This races with process-context updates
of AIE in pcf85063_rtc_alarm_irq_enable() and pcf85063_rtc_set_alarm():
a handler running concurrently can clobber an AIE change.

The RTC core already disables the alarm interrupt after a one-shot alarm
via the .alarm_irq_enable callback, so the handler does not need to touch
AIE at all. Acknowledge AF only and leave AIE management to the core.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
Changelog:
v3:
- new patch (pre-existing issue found by Sashiko)

 drivers/rtc/rtc-pcf85063.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
index ac9ab1c376c0b..af900fe8ae15e 100644
--- a/drivers/rtc/rtc-pcf85063.c
+++ b/drivers/rtc/rtc-pcf85063.c
@@ -238,8 +238,7 @@ static irqreturn_t pcf85063_rtc_handle_irq(int irq, void *dev_id)
 	if (val & PCF85063_CTRL2_AF) {
 		rtc_update_irq(pcf85063->rtc, 1, RTC_IRQF | RTC_AF);
 		regmap_update_bits(pcf85063->regmap, PCF85063_REG_CTRL2,
-				   PCF85063_CTRL2_AIE | PCF85063_CTRL2_AF,
-				   0);
+				   PCF85063_CTRL2_AF, 0);
 		return IRQ_HANDLED;
 	}
 
-- 
2.55.0

