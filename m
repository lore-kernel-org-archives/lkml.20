Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793268412;
	b=XSgt/nMmBTMLGXLrTXYqI9lcQvC1DpwFWDHwj3v89GiIAWbKVmYZR+jg4l8hLo9xBmWl
	 7pKvS1BSgLhxP2ee6T7pNF7Xtk7hzvkQMJf2G/uiUkdMhPmrtI0BbFZ1xc0IlWpKyRJ48
	 aCda3gYOjh4+4aa77YGJyilNedrwro9LF0D2apd45aV4DJM//UCF6PXXq2sy4ko1VdN/D
	 Tm0iZXjw1S2Hs6HI0jJ9GYFEB1TVgz6/RgbQ7EBKMB5Zq2hoIh+bNMUEbXsfsV7/lJZic
	 pSIoWEeKpKmM0biNYPlMvo4r24tNIqWv3WReSeNV24/3KwdFn1h7O4W2CBXyP4EQslw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=AR2X8NVRTcLGsxmelwGtGxXnKtbtxnjUeTJFNKukauU=;
	b=IBj7lFpG473IJfqrGn2CA6jnw4wo0qUK+01NFhFJNPLyYywjiYJ0LEMPYeno+V6jZenH
	 g1kHNdd+KQWii65684+VAWTERqyfVVd3+S31nVSYkvKOZ8s15hOHw3BesO137g91etV6+
	 NaC9KsKgD4LFrdVO7gz+m7TzHV9J1k5Fuf7ANHxk5mw/rTxqFhwyYcn5IEBFBftFuA/0F
	 jkQnaAaFtBaowizKldvML8r9GSC3BkhLSSkj41MRDji+NLwwUtEy59QBfAzeBJ24vMPsp
	 FAyGSXsUzgmufg9r9qO36zUdFPd6nt2yce9SnoX4B0k5cS4bT6N9naBkkqzfJwEYQzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g8DaMXRq;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF50606A336
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:06:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BF50606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g8DaMXRq
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so18141905e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793268410; x=1793873210; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AR2X8NVRTcLGsxmelwGtGxXnKtbtxnjUeTJFNKukauU=;
        b=g8DaMXRqXQHsWP5RYCoTjKZb6HnLyosxq5FmZQ6TeA2o2vjrOGausXQlCGA8o5RIlP
         XdOmZMBDPrjelgWO0XWrx49n21MX0gDLWqVDAFhjxGo0r15IHn13A1mWYPdH+kVGztbq
         Z8qz/A/Hw53ImmLdKYUvs3sriEtQIJyP0IW7cUElV3CEyarGrhLy1hHYyR3PkH4WFtDd
         8fXoCeOVpKQcVDV9q3cMYUl/Pyyy9hNGWE71pyj5KvUrjyKGt1m4yIejFzBtNpiFe0ke
         ik83SaomozZ4tJRh4YGa9jRSEtvLy7RgOMnB0gPl5tYk/nDkXcUpVcnDFCM568NVcauz
         EErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793268410; x=1793873210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AR2X8NVRTcLGsxmelwGtGxXnKtbtxnjUeTJFNKukauU=;
        b=x5Xt8uWC2Qr9tWZYZzm0SNG3qgJWOxF7Obl4rapdGNRZ0QvNzJ5nOmnfwYJI4oXagr
         v3bvf8ccrfLCWz5IsuDeXWLySUYw+TAdW/l/twWL78TJdH3cdx+phv+7ee1Yxtzhv9ig
         WSeT5AzqB3/h6LFFRdJi2GOVP2sIQeb9AzezSDgWqCVSA8xGd2KeeBBGpujo0/ehWPS9
         9D9Ivr3eBssLAE90KSJntYr+WrVMpymeEt6+63fEy8Aj4mButZQsxNjoH1VX2lxbU9/d
         hQ3dTbzeTdlBH3jenlIwUl3jh2cRqynlmSSq7PXkJcaf9leWm/2Sc7p/tkyDeMdvvVhV
         DPmw==
X-Forwarded-Encrypted: i=1; AKwUvBwtqmo98Jj7CkskaUKNzCEn18tPptpOdsdcf9ujzJskKQQbnTrYOk4X4PdrEulo7/O0cGAY2X1kdYnVp8Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHtKHrkhZCa5DSeYoyGCAVIv5QUVw+hlzDzVnaTsx+gwHn1yqf
	53YzEDK1dZqBgRExPd30TcRwuRqgHuy5Voi1e7Tsg6mqYiL5yK5v/Kao
X-Gm-Gg: AYBFou3d4cwypTy5Iamc8h466k0caczJJhuZGJSadxhK8AB916UPn5ETdaAzguHr0xN
	gy5zUSisTv0wyyK/Qm4tUkqD/kRErVBSP4NYzCJGPeISWuqhk+ce9RNC1/ioraB+nQgpNyfulh/
	kLF2dl0VRld0xrPdvV4YA7v6cbBVnVbC84lHqt4na1p0GwRy1Jjnn3/wnu4sGu74BBb+1D0uyW1
	ohRCSa0hhE0Ko7KopQlhNPzLsTStUycwTDVHtvdFx7/gmgw7wNUHsngq61PB/x4i6XJQn9w0lsY
	anPLnpBlZG+8jDXDvIqjfeQ9we6/r2eVOBl9tLr0uuzpGNaBlQ+utIevCAE+WZ8GZQcUR5nB4kG
	m1G2rAxLuYdW7fTzX42aM2QfhxF5RSl75lk8LyTqkpgXsXWcrB7XuP2INCvpZckWIpc1HBXK3bh
	w3gd1LqQ406Jzg+4gMsuwqMSKxG6rxmW6j8hwyOa1pzP3KMwRi6HTyrSacxphOxEEn0E9bFnXaD
	WLgGeiksKshOqqrw1EzQWPi5YeU5c4j5/zkJy7mgqsJC4na9uRpSEJYtsh2KTJcwmZKYo4qGGPQ
	nyCaj7pT4mbGymQPWCJ2/IQFDi1AflLbsXq4217/uNTqZKy1hCAiZTw7nyDDDaH7pv7dNOE/EV8
	2N6u7sHLZ
X-Received: by 2002:a05:600c:8184:b0:4a5:1c2a:4bb6 with SMTP id 5b1f17b1804b1-4a967ab15c5mr99622405e9.32.1793268409952;
        Thu, 29 Oct 2026 03:06:49 -0700 (PDT)
Received: from [127.0.1.1] (ip092042140082.rev.nessus.at. [92.42.140.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm53082825e9.11.2026.10.29.03.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:06:49 -0700 (PDT)
From: Jakob Unterwurzacher <jakobunt@gmail.com>
Date: Thu, 29 Oct 2026 11:06:24 +0100
Subject: [PATCH 2/4] mfd: rk8xx-core: keep the PMIC interrupt disabled
 during system suspend
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-2-cb12621c1fb4@cherry.de>
References: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-0-cb12621c1fb4@cherry.de>
In-Reply-To: <20261029-dev-tiger-v7-4-pre-20261028-tiger-suspend-b4-v1-0-cb12621c1fb4@cherry.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Joseph Chen <chenjh@rock-chips.com>, Lee Jones <lee@kernel.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, 
 Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793268406; l=2691;
 i=jakob.unterwurzacher@cherry.de; s=20261029; h=from:subject:message-id;
 bh=L2myRTbrcpVngJZXrNjm8FAaUWxZTcJOyBmmVMEVxWs=;
 b=5roX3q8fy0xNI6ewi2I12L2R2JapjPSuuY5TaRN3vlegp1g1Oc3/GfvhvCPzLXeWV3msOj/r3
 ynNr0KDMGwyD0+1RWAD6ZSNcsvIFpjK3KJMTq3YCxA49RRB0C9KieTE
X-Developer-Key: i=jakob.unterwurzacher@cherry.de; a=ed25519;
 pk=0v1L7pjG4d7PcaYPMOmzP4SjaRtnB+8bMzZLZCRzB8I=

From: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>

When the system is woken up by the PMIC (e.g. by the power key), the
PMIC interrupt is handled as soon as interrupts are re-enabled on
resume. At that point, the bus to the PMIC may not have resumed yet, so
reading and acking the interrupt status fails. On RK3588 with an RK806
on SPI:

  spi_master spi2: noqueue transfer failed
  rk8xx-spi spi2.0: Failed to ack 0x79: -13

Disable the interrupt at the end of rk8xx_suspend() and re-enable it at
the start of rk8xx_resume(). Both run in the regular suspend/resume
phase, while the parent bus controller is active. If the interrupt is a
wakeup source, it stays armed while disabled, and the pending event is
replayed by enable_irq() on resume.

Store the interrupt number in struct rk808 for this.
---
 drivers/mfd/rk8xx-core.c  | 19 ++++++++++++++++++-
 include/linux/mfd/rk808.h |  1 +
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/rk8xx-core.c b/drivers/mfd/rk8xx-core.c
index 21182df45d1b6..2ae9107fc5161 100644
--- a/drivers/mfd/rk8xx-core.c
+++ b/drivers/mfd/rk8xx-core.c
@@ -851,6 +851,8 @@ int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap
 	if (!irq)
 		return dev_err_probe(dev, -EINVAL, "No interrupt support, no core IRQ\n");
 
+	rk808->irq = irq;
+
 	ret = devm_regmap_add_irq_chip(dev, rk808->regmap, irq,
 				       IRQF_ONESHOT | dual_support, -1,
 				       rk808->regmap_irq_chip, &rk808->irq_data);
@@ -929,7 +931,20 @@ int rk8xx_suspend(struct device *dev)
 		break;
 	}
 
-	return ret;
+	if (ret)
+		return ret;
+
+	/*
+	 * Keep the interrupt disabled while the bus to the PMIC may be
+	 * suspended: otherwise a wakeup event (e.g. the power key) is handled
+	 * as soon as interrupts are re-enabled on resume, before the bus has
+	 * resumed, and reading/acking the interrupt status fails. If the
+	 * interrupt is a wakeup source, it stays armed, and the pending event
+	 * is replayed by enable_irq() on resume.
+	 */
+	disable_irq(rk808->irq);
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(rk8xx_suspend);
 
@@ -938,6 +953,8 @@ int rk8xx_resume(struct device *dev)
 	struct rk808 *rk808 = dev_get_drvdata(dev);
 	int ret = 0;
 
+	enable_irq(rk808->irq);
+
 	switch (rk808->variant) {
 	case RK809_ID:
 	case RK817_ID:
diff --git a/include/linux/mfd/rk808.h b/include/linux/mfd/rk808.h
index 7ffc904c864c9..1255de484ab51 100644
--- a/include/linux/mfd/rk808.h
+++ b/include/linux/mfd/rk808.h
@@ -1461,6 +1461,7 @@ enum {
 
 struct rk808 {
 	struct device			*dev;
+	unsigned int			irq;
 	struct regmap_irq_chip_data	*irq_data;
 	struct regmap			*regmap;
 	long				variant;

-- 
2.47.3

