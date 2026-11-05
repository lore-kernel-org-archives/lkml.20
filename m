Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793912037;
	b=SR6cEpNenzClxXDPMU3oO/FUmtlLIoLe3fiOfh9gUHMuvToV7iKx9jG+e89qFHHeKFrr
	 d0oqe1mFPaqblDhfUzSZ9hCqOZTyPUKJ1/ekmEHHi0KQnjSerAacHouzIrIsst1gA33YB
	 8Oh2nEcxmC4sZE7Ej7r8oAuC32ZCJn7bfAQGz2w32ji4MwGNxEodJbjyYvysw73NcXS3Q
	 AEoZdltDTPYGwRrrMN9ZvQp/hJl7frIE/JOemQ1hPfA+LMWPJgEBsj50JUdl346r0CpEi
	 teeFTj6tZbOqPul9xX60KQVva9Y1EKyhFbBq+S0sApHJ8LRYRuePco4rj2ybMaCOWNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793912037;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3P4RqLHTtI+N7NRPxx7L4oSk93jGkzaKCLskeDcODf0=;
	b=XFPwHFWc+UKfMQS0+Q2yu5MbewwF6xB7fSpEPH4mnp9CEFBVTjyo6Q+pZVjbxt1Kv/J0
	 X5/mwZCGAwWsx3USrwryoNt94QkhOp++q7Dr7TXG1UTVFK6mlslYUmG4QsNERFLl5U6kM
	 bgXeRK1n7YbANFAdu9MTA7odLv/nERwCVffO263ZIDJ0hwkNqJpRPcF3lbQ1hO1Vp1BXw
	 AMm2Y8qIXkPAuvaDZeR2KFn9ighv2dU/O5FZzxay4EtZYhGJOB8VyFtftSQxct6jmSN+E
	 WQ5+tmKFm/6zYR51d1vwwAklAa5IKIv/MqMsEUdlRZgkuyXJPVuDLnb+mRz7dTUGQ4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qHdTtPif;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197E3606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:53:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 197E3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qHdTtPif
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so3037359a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793912035; x=1794516835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3P4RqLHTtI+N7NRPxx7L4oSk93jGkzaKCLskeDcODf0=;
        b=qHdTtPifee92YBs+xGczv0eUkMFQNiElk3a24/TjhVIvKLVqcFt1ZGpKB1cbwOv80/
         29QCAbCOnuLECnzWrJuH5bPR6aETjOjycy2w8fkCJfb3UPgzpQxkY3MTyhhkQOHyMUqT
         CRMBKQdWCg15NsaAtunMKU7qWhPOXwnzhHH7pA+iNlWvEDOGBEOQblo5Sol0NX1SPF0X
         0Mn6KP6DfMXXQapDJdkAWde1eAbEDu4lNxg0UOip32wWW47reIGHHJCwQWmLWFjmD5QG
         5T4S6Cke37ugLxCBHY+ekNImr0bxPmu1AtBHiHHZv6JFg7OKIThcTDDiiXn25bWAeRXJ
         P8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793912035; x=1794516835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3P4RqLHTtI+N7NRPxx7L4oSk93jGkzaKCLskeDcODf0=;
        b=nR2sLADfRwrKLd9KH2mhXr8lNKA2inXxB3F/QjIqggcFpGyMVMr8yfbiHUT4AjDF8g
         /3MQgEF3DlJ/AKz5LsZyGMSyO20NvWrZZTblqfPI4/wqPZacdavlqwo9rCaYZhmjUs5n
         iZ3gOueiiId9aX2UHwNGHc8/8cjxxX1h6sCEWFW1Rt9Q4VI1Im3lVLAr+KhJ4efNuYvO
         2IbGIhkf4GK91KGJ9ppDnjXi8Sc7YusYMF6xON8mQkT7IXZa+MYjBjtwrNP9VrJbfTwS
         SOD9UwFiDUfmqBMK26YQjisbmq17W7qWDsEFvKS4AMGVC3uhTz4lqZOh2aWO/kCD7g8p
         BMTQ==
X-Forwarded-Encrypted: i=1; AKwUvBzD9iBOv12HsOjjtMLd+E4jmVccRLSl3QR45ZmhToF4/vUjssscMCczd82x0koFvPq0qEX6NhijeJoSMGc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rLn46TP/qjVcJVKYWesMXp12PpUhuX9uI7oJShlr1LvBTbiej
	mkyt5lfmFrBrTTdGyT++mTI08+uWRVICT6epygOWO35IzpcDKPo9Kvvi
X-Gm-Gg: AYBFou3itc3tRXN4BZP8H+fZm/hagyYX935Kzc+4hck27LU0tdurT2XKOqX7NdnHGFA
	+0d/BuqrqMrmN3RRzc0tE1EVtIieMRXVRmFQM5/zC030CCmjBQbd2hJWcRmUDbY8lLguwR4ZxyU
	jXwLRSgAt98dxuB9AA1YCSfhYfmsaq0iMtyoNDAm1DxOnwZuKGCPLLmB+a1ZRnFfVjZpbzxNiDV
	ZZ5KlzIETgCKuKRv7wKqdt6XXiHy10387XnemjW6oqoAU9eOLVwnfZoeazdTgdpLo9X35lVqjeO
	LFZF8sP249XVJubzyyTy6RR+C9pZ0kkxCS9ckIIcWjiu7iSg2pZMIz/IgEcOA2QGiiNmb1ONUyK
	kZiMf7bMVV3hU0nmugcmy8QhVmdlcB8ftjbbtC2DIooRRWYrUdNJjpe8uXEJt2Zu8BgtpapoOjD
	7x5Rj9Z+MFS3Ke6yPk/WNcRaojdplzpUPvCaHYcC92TnM4fahCAQ4HAPP5LwUbZon7gXw/PbU2y
	7OfazeBFZt68e+UzSLsEAylofISCdrRObGKvnd4Bpu2IOTe5GgqNMbUWx7XoB5OeeAjptR7ZcwZ
	8/QspiI9xh486NkTBuW87WNj5gpfP1Moe2opkfCdvjutM17TiBjVrKpy6UbJPiUO9tHBtedqz+8
	t4x5ni3urzLOh+TUrRo4ODPr13IvnTueaI3sq4srvjPLBq8hphWf3D73T09+Nd7A0AQTknlqkgo
	vxs2Jhy0cFztp0HrdYx6jwQ2cyAx8M/2VBIpSGV3WmYUdjqwPjpAcJABZ5O21x4CgTx7PisjmN6
	mwKUM/cKsZMXs4=
X-Received: by 2002:a05:6402:449b:b0:6b5:e088:eb79 with SMTP id 4fb4d7f45d1cf-6b5e088edd8mr40510a12.14.1793912035306;
        Thu, 05 Nov 2026 12:53:55 -0800 (PST)
Received: from mb-HP-ZBook-Power-16-inch-G11-Mobile-Workstation-PC.dynamic.ziggo.nl (2001-1c00-1106-0900-938c-4ed8-a3bb-093f.cable.dynamic.v6.ziggo.nl. [2001:1c00:1106:900:938c:4ed8:a3bb:93f])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b576406e13sm1234072a12.19.2026.11.05.12.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:53:54 -0800 (PST)
From: Mario Behn <mario.behn@gmail.com>
To: Peter Chen <peter.chen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	Mario Behn <mario.behn@gmail.com>
Subject: [PATCH] usb: chipidea: udc: give up when the endpoint halt bit is not taken
Date: Thu,  5 Nov 2026 21:53:42 +0100
Message-ID: <20261105205343.982465-1-mario.behn@gmail.com>
X-Mailer: git-send-email 2.53.0
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

hw_ep_set_halt() writes the stall bit of an endpoint and loops until it
reads back. On endpoint 0 the controller clears the stall bit itself when
a SETUP packet arrives, so when one arrives while the driver stalls the
endpoint the loop never ends. It runs in the UDC interrupt thread with the
controller lock held, and the SETUP packet it is waiting out can only be
consumed by that same thread.

Seen on a Zynq-7000 (an ADALM-PLUTO class board, PREEMPT_RT) during the
host RNDIS initialisation: the gadget stalls the GET_ENCAPSULATED_RESPONSE
poll that has no answer yet, the stall is refused, the interrupt thread
spins for a minute, RCU stalls and every other USB operation blocks on the
lock. With a bounded loop the condition shows on 1 to 3 percent of boots
and is harmless: the pending SETUP packet is handled next and the host
repeats its poll.

Retry for about a millisecond, then warn with the endpoint control and
setup status registers and return -EBUSY. The callers already report a
failed stall.

A loop timeout for the same hang was proposed in 2021 (usb: chipidea: add
loop timeout for hw_ep_set_halt(), Jeaho Hwang) and not applied.

Signed-off-by: Mario Behn <mario.behn@gmail.com>
---
 drivers/usb/chipidea/udc.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index d52f89489893..4f4e6d296de5 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -224,20 +224,28 @@ static int hw_ep_prime(struct ci_hdrc *ci, int num, int dir, int is_ctrl)
  */
 static int hw_ep_set_halt(struct ci_hdrc *ci, int num, int dir, int value)
 {
+	enum ci_hw_regs reg = OP_ENDPTCTRL + num;
+	u32 mask_xs = (dir == TX) ? ENDPTCTRL_TXS : ENDPTCTRL_RXS;
+	u32 mask_xr = (dir == TX) ? ENDPTCTRL_TXR : ENDPTCTRL_RXR;
+	int retries = 1000;
+
 	if (value != 0 && value != 1)
 		return -EINVAL;
 
 	do {
-		enum ci_hw_regs reg = OP_ENDPTCTRL + num;
-		u32 mask_xs = (dir == TX) ? ENDPTCTRL_TXS : ENDPTCTRL_RXS;
-		u32 mask_xr = (dir == TX) ? ENDPTCTRL_TXR : ENDPTCTRL_RXR;
-
 		/* data toggle - reserved for EP0 but it's in ESS */
 		hw_write(ci, reg, mask_xs|mask_xr,
 			  value ? mask_xs : mask_xr);
-	} while (value != hw_ep_get_halt(ci, num, dir));
-
-	return 0;
+		if (value == hw_ep_get_halt(ci, num, dir))
+			return 0;
+		udelay(1);
+	} while (--retries);
+
+	dev_warn_ratelimited(ci->dev,
+			     "ep%d%s: halt=%d not taken, ENDPTCTRL 0x%08x ENDPTSETUPSTAT 0x%08x\n",
+			     num, dir == TX ? "in" : "out", value, hw_read(ci, reg, ~0),
+			     hw_read(ci, OP_ENDPTSETUPSTAT, ~0));
+	return -EBUSY;
 }
 
 /**
-- 
2.53.0

