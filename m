Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286694;
	b=G+hgF3e5efXQpOelJdMEx0w+v+qx2Guoq3kDkE8VZbQnc4LjD9wq8cmkKbkx4IaVhkpv
	 50WyLiuYi9JdrAArz/IxhFXjRoQvzgGVwGb/5S+a9iiJp6gdFDdK9yRDYBaY0OjnbqB6j
	 9yH789TBYfvEzm7iewJYCBUqq7ZXKJKq5aMJlsIyzcIFU4usYSXorRTOk77Q2/JscB2Vk
	 mFavT60uFYLmBs/5XZK3ywvLs3PWLBkW818vYxLLcHwM8jJHtohV6aMtFOXeQB7XwOsM2
	 SuyYV2iig/tlx4F5lqbe1BI6RXjBdR/0QnkJMRP2DLEnInecANi/ZlK7WiXuCytxHfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286694;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=BF0zJDysZvAQi5ZREmGCFHRf3kxrNa2ATRxkO/XkHAg=;
	b=AdOFXy6Ik0smq4iPtZxn1c9FlJDX0l+WSg8TZ1NqCRivdA/MAUbHFI9UIMCiolHDm2dl
	 tFwr7CjQzlAyX30q6SfAMP5Twh6GQXPxetf18O37306+iNd/oyFExCaNFMqMs5dSnyp5q
	 99S8XgELQZUh5VNzAIAnLUNvv55gAXAG6Q7AFELtar0V2QgPW4GYYLbw2TaDjZcwt2dxb
	 3CHP7m7znbsBoVtJlZmMycBRfnNz0PaGw5hZ5MXb9NSjgpxI+TVYK0gnwrV5nq1YG9t/F
	 JmYUSRJCvDMKFJnUaoapQC7LhbSJpO5rnRWO9dktw0aqgXpgzGZAEtfi0MfiLyzglQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nvwIdZtM;
	arc=none smtp.remote-ip=209.85.219.53
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A2B606A33B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41A2B606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nvwIdZtM
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-91eb3ac1875so16288766d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794286693; x=1794891493; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BF0zJDysZvAQi5ZREmGCFHRf3kxrNa2ATRxkO/XkHAg=;
        b=nvwIdZtM9Pt5Bd7P/nqNAHjCmHYsdoF3+bg1aU4Uj4g+A+FTkoW8Qnrc44qy+EcCOt
         pThQsTuLKnqJaT8NtMFVsR5aKYVxRkHuUIZCeh/7ry59sNVDowmMILlDtO9BEEeubLUI
         4046XPJkKYWD5WVWzZqhLZvyXI4QOSEyba8OonaRUyFSPBm6slZ4T/3xLHl494vL0z+q
         niSvC4A11CxejW+bKF2W0eOyevNxNinL3ERhbEJ++7lUWW30q3w4b3PoOpxksag/xh5u
         sLNqpnR1d++ElxyF9ioOl7mXKDmKQPQBPscXjWtcxyp0OiNsOty+L0vOACuhuI7wosM6
         jWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286693; x=1794891493;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BF0zJDysZvAQi5ZREmGCFHRf3kxrNa2ATRxkO/XkHAg=;
        b=tjxkAAUxsWu5Xa51QtXlmOQeKop1dFPL8Q9k91JUUWdl0SBWgu2wR5os2Ss+mLqVR8
         tKw5kgmC2nyLRmhtv2VKciZpPU7y5+N+tK/n4Ih6YwtIGAdKmJSYVkRCPIVhDH1qXJX6
         jZBnOLhp+5+7mRusUZWy9OfGAxYoj2ATfhG28gXgrdqH8WYdjwKaLl8+Q/zcjGPNjzF3
         UvFmZJLSn656uDuJtd8JGc5f19lOrXH11BRFnpmTb8T5sQJyD9jEBtZveZqX4J4HlvZH
         EAY9+D8sNHiqH6YBPLlE+rWFU21J41TiqyTjhDeZxRgJBYNUCGIAJa9YiPPVEYJQDHC7
         PBzA==
X-Forwarded-Encrypted: i=1; AL+hErHfIFF0WpQKXmSRib94eDc53tyD5KLeD0sNCZCpiYTygE49UPCosHcXSgbqizmKT6tO8oGYrIMKQBfflzI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZUhpEpk9xcFi+WywnL7RhutOLVnl9/tb+RasHqaVXijIzHrBx
	TPe85O3gaeTTarla/3OZNxLZPiFui53AQwYyHTPfqw8cReuB9Hh8SYI=
X-Gm-Gg: AYBFou1oFvr35Ts7wBd0bGK3/bgQlD7yehu2rwjLtfTb64KNsxwfhcJh6C7bKEFC1ep
	zSFZE8MYVvyK8YGIr44cKba0oWSpscj7GaAYKa1IqPspxL2rL43kMIGcbbogExSnx8t4Zz3yNDN
	AAy4aI7ESyh6flnC8aGkIFs8oWAev/oL+K7CWPBdKBRRy48mVAkUt7CKn7rPx5d85j37UU0Ru7K
	xaYbE13kchS9yI1JrZLL5c5FPurF0ztsRw+c0ikgr4EpoPbf65O+dcXBaBiePOftscfgPeJiGyr
	xPWcn6WfY9POsmtsjQVv2KGWwhXjOp0Lrsb4Zpw2/2o3WGXveH+07xCba+2zmgVwVdZj3MU7Dqo
	eM7QuDl8gyOGedbqWuH8vu4H/wYDtRylbkm1SC2xi7B3tZgHASr8X2YRfTjJuj75L/57jTKONXV
	oBFNA7zDh3fjyM2X78tz2W4yVqezE5KFBjzEdTTWnlQ14Xft7zoLgzJbVxHC1R/qYHh7v+M5mKu
	wAVulm5OrFzCvJxPwh1rcUjpKnLOW/8qXRpJ222LRXgPrEhaRiLrWHk72LYqtsgEV1edhDveGIy
	WwzSNh1FFqgJ0zPXfgCn88bCBtRk6Quu+LrzMxla6AB9lCXucL5CKPi9f6Q9M7uenbDVFICA/y6
	MOHKtA+GBgxhvt/9wLOkKw59KNAMWjYm7TjUZE+vZ8qUBh7RhFtXWloBuOfip4NSRCuNDaXYV+6
	reRh2tjziFYA==
X-Received: by 2002:a05:6214:85c7:20b0:91e:9ab9:bf37 with SMTP id 6a1803df08f44-91eef88a091mr21824886d6.14.1794286692755;
        Mon, 09 Nov 2026 20:58:12 -0800 (PST)
Received: from localhost.localdomain ([104.39.152.7])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef04f89c1sm12462836d6.23.2026.11.09.20.58.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 20:58:12 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Eddie James <eajames@linux.ibm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jammy Huang <jammy_huang@aspeedtech.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v2 1/2] media: aspeed: join IRQ and work before probe cleanup
Date: Mon,  9 Nov 2026 23:58:08 -0500
Message-ID: <20261109235731-aspeed-v2-1-mhun512@gmail.com>
In-Reply-To: <20261109235731-aspeed-v2-0-mhun512@gmail.com>
References: <20261109235731-aspeed-v2-0-mhun512@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The setup failure path unprepares the clocks before devres frees the IRQ.
An IRQ handler that has sampled an enabled status can still queue
resolution work. Masking the source does not synchronize that handler.

Save the IRQ number after a successful request, then free the action and
drain resolution work before the manual JPEG and clock cleanup. Turn the
engine off after the work has finished. Request the IRQ after reset,
clock and JPEG initialization so earlier init failures have no live IRQ.

Fixes: 3536169f8531 ("media: aspeed: fix clock handling logic")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
No hardware testing.

With reset-default masking, no probe IRQ failure has been demonstrated;
this part hardens cleanup ordering.

Changes in v2:
- Join the IRQ and resolution work before manual probe-failure cleanup.
- Rebase onto managed reserved-memory initialization.
- Clean up JPEG and clocks if the late IRQ request fails.
- Split normal last-close ordering into patch 2.

 drivers/media/platform/aspeed/aspeed-video.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
--- a/drivers/media/platform/aspeed/aspeed-video.c
+++ b/drivers/media/platform/aspeed/aspeed-video.c
@@ -308,6 +308,7 @@
  * perf:		holds the statistics primary for debugfs
  */
 struct aspeed_video {
+	int irq;
 	void __iomem *base;
 	struct clk *eclk;
 	struct clk *vclk;
@@ -2232,14 +2233,6 @@
 		return -ENODEV;
 	}
 
-	rc = devm_request_threaded_irq(dev, irq, NULL, aspeed_video_irq,
-				       IRQF_ONESHOT, DEVICE_NAME, video);
-	if (rc < 0) {
-		dev_err(dev, "Unable to request IRQ %d\n", irq);
-		return rc;
-	}
-	dev_info(video->dev, "irq %d\n", irq);
-
 	video->reset = devm_reset_control_get(dev, NULL);
 	if (IS_ERR(video->reset)) {
 		dev_err(dev, "Unable to get reset\n");
@@ -2286,8 +2279,19 @@
 
 	aspeed_video_init_jpeg_table(video->jpeg.virt, video->yuv420);
 
+	rc = devm_request_threaded_irq(dev, irq, NULL, aspeed_video_irq,
+				       IRQF_ONESHOT, DEVICE_NAME, video);
+	if (rc < 0) {
+		dev_err(dev, "Unable to request IRQ %d\n", irq);
+		goto err_free_jpeg;
+	}
+	video->irq = irq;
+	dev_info(video->dev, "irq %d\n", irq);
+
 	return 0;
 
+err_free_jpeg:
+	aspeed_video_free_buf(video, &video->jpeg);
 err_unprepare_vclk:
 	clk_unprepare(video->vclk);
 err_unprepare_eclk:
@@ -2341,6 +2345,10 @@
 
 	rc = aspeed_video_setup_video(video);
 	if (rc) {
+		set_bit(VIDEO_STOPPED, &video->flags);
+		devm_free_irq(video->dev, video->irq, video);
+		cancel_delayed_work_sync(&video->res_work);
+		aspeed_video_off(video);
 		aspeed_video_free_buf(video, &video->jpeg);
 		clk_unprepare(video->vclk);
 		clk_unprepare(video->eclk);
