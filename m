Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071A93BB9F5
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 07:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792223135; cv=none; b=mlziHSN45vtLYM3mChoTgqhfAQr1lzlRtYvkt/m17YqWGcVOxnzyMn2R7aP9O8dUBqXbUcFekwZCBgFv3vsjnVu3idhYKesPWkcxgZjMURnEoe81jDm92KN+qIIn4yUaCPI40WYfZOp8kHzM3pa2LSUj3b22cau9LQmH5PVY6ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792223135; c=relaxed/simple;
	bh=Ing3Vja3nrFXgDMNEvQrOtetxsozW78cudR/qPS/oFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F/0PuVz+4kY9ly1MZKE1beT1AUcVJYeiACpUIumB1q1csuog5iH2zeF8OgH2S86PGE3DQaS3wYa+OnqcRI3f9bsMm2VEuk3LRe0LdKtPzRTaUBZZuZ+uDFIVyIT3ujN+BgoOr9GFT+Xcc3vST0OGp8y8EBJjErHyMf2UtGHY274=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T4YLGb2i; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T4YLGb2i"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5ea63f01606so339162e0c.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 00:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792223133; x=1792827933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xOJGjg+lvYDLo4dWg7JB5b8p1Kepu54TYn5d9QR27hI=;
        b=T4YLGb2iEqrswCiHicsrczWEZ1o98JuWAbRAF4Nb+mio8cvotu8S+mG1x7BggoKpqN
         BGn3dqIqmZyFYyYx/+y0JNvqL5c3F4Wbne7vcU5TgKIUXeL/w7M0ZQ81PZrVEl0o+9lv
         5TEAe2rq2CNBWq9aHpSicFymYQiq5IRuAfyIY32I2uLBBqACtVPIaA+X7fhwZf9RoIbN
         1jBbs3dQZJNSUTlU+Fagoi2E1B8YxeK/pOvcviDoZ1wpTjmMSTPI+gCNc3loVE77lRd/
         XIJ7QRUP/zFR0Zz0lF/beC1TVEASJDnEvEDz8d2bqaJUkjS0dN7mL/5F5/ZiaIhpXFAP
         v8rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792223133; x=1792827933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xOJGjg+lvYDLo4dWg7JB5b8p1Kepu54TYn5d9QR27hI=;
        b=we4Oltnla00NQ53TdzXsNDfZc++mgklMr8QUvnSjsyANMbzWQ/b7Tbf0aQKZqGpmBx
         mgLLDmt9BxWHhYV+uJ49jmU1d50ycO9rlvOEVZDWYgqqvbuPZB+vjIcmF9QhZqP3MQes
         AiQs3JLTDOkDC1OHCYXUXz8b1pt0pyv8rXOI9Gl0b/tpycB0+AoUOMj1OD0rtz1jG6kG
         s/9RLbecT9WAHgEdmN7xFuyVfrLMYO4t6zca+xi+ReToINxYrVod/cwfdGjoQB69ABOP
         T9mvReV8djjN1/rgPb0XoTTyZhz2XdReuuWZGwstSW9xiJqzYE/bX3tKlhykfXVc1aBK
         xG8g==
X-Forwarded-Encrypted: i=1; AKwUvBw473BtwSZQjb/uELjGGRQwU5fcGMDdVK2R3hgs3b/RdQYSZ2dxttPQ/kkIRcK7QeyRfUysZcTtWXUWci8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4f7k2vgx4rNglQnb7XZqWhBRkd+b/ZG0Feg+FgcADTywgnxrq
	O/jbAIvxyhsbTts2FuEX/nHyhKIr+Wrml2LLVHEoRn0vX/Whg0poirXj
X-Gm-Gg: AYBFou29yGtJC8jDFuIC0dNk/+tUZVKe44pY8PSd63hGBIl/t9mwCDmZAttaFnvuwsi
	3cRm5Uq0mSMkLiF/cnUdb/lD+FviBCmTmfU+z9d/4GIU1ESs7ako3e4HY4UB4Ir+tLooGhOfBXR
	SheFBXgohRPlDiE+s7q7Auy2T8iftndaHLDQY0HmvVtMJZddYUY/H2Bx80/ge9vv/ucLb8bofv5
	/iOymTP0/Sdr8P3ccNfLsmdVuvXaLvFqMcwXJq+hH/LMogklyXhTp0NVHUr0e4kBVOuUIgBGUI2
	Ot8UtLGeIozvKSOSOH3to1pFvzxb0NP5TmblkNgXnN1IVU00TxwQi/dOvBLvPdXFu+3y5GxBb6g
	3xO1ZtBrCTD46ptgV6thaEERnzMejTJPOCnjelkjmBRMHzHzJPkn+qlopKgcurMTzav1iwXqmvT
	AjOoWq5QDAybYfCo/S0GeFGrG6xvNNpP0QVUqexm89UxlyR2wRA2+btu9VDx6MnwFWr5of9iyQi
	9VEkJ6vnwQyYVIoiItEq1ZFOAmX/Of6sNPTA4ZJrGRcVtVFSM/lqDz4JjSkOrGu
X-Received: by 2002:a05:6102:161e:b0:7c2:b682:606f with SMTP id ada2fe7eead31-7cc3672ad8cmr521911137.1.1792223132871;
        Sat, 17 Oct 2026 00:45:32 -0700 (PDT)
Received: from localhost.localdomain ([186.151.100.62])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b53cfdfsm3701836e0c.15.2026.10.17.00.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 00:45:32 -0700 (PDT)
From: Sebastian Alba Vives <sebasjosue84@gmail.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	pjw@kernel.org,
	samuel.holland@sifive.com
Cc: linux-serial@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sebastian Alba <sebasjosue84@estudiantec.cr>
Subject: [PATCH 2/2] serial: sifive: avoid division by zero in the clock notifier
Date: Sat, 17 Oct 2026 01:44:53 -0600
Message-ID: <20261017074453.62645-3-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261017074453.62645-1-sebasjosue84@gmail.com>
References: <20261017074453.62645-1-sebasjosue84@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sebastian Alba <sebasjosue84@estudiantec.cr>

sifive_serial_probe() registers the clock rate-change notifier before
it initialises the two fields that notifier divides by.  ssp comes from
devm_kzalloc(), so between clk_notifier_register() and the assignments
a few lines below, both ssp->baud_rate and ssp->port.uartclk are zero.

A rate change taken in that window reaches:

  PRE_RATE_CHANGE:  udelay(DIV_ROUND_UP(12 * 1000 * 1000, ssp->baud_rate))
  POST_RATE_CHANGE: __ssp_update_div() ->
                      DIV_ROUND_UP(ssp->port.uartclk, ssp->baud_rate) - 1

On RISC-V an integer division by zero does not trap; the ISA defines the
result as all bits set.  DIV_ROUND_UP() therefore yields ULONG_MAX and
udelay() busy-waits essentially forever, hanging the CPU, rather than
producing a clean oops.  The POST_RATE_CHANGE path additionally programs
a bogus divisor into the hardware.

On the FU740 the UART clock is derived from the CPU clock through a
synchronous divide-by-two, as the notifier's own comment describes, so
any CPU rate change during probe can hit this.

Initialise uartclk and baud_rate before registering the notifier, and
bail out early if the notifier is ever called with no baud rate set.

Fixes: 45c054d0815b ("tty: serial: add driver for the SiFive UART")
Signed-off-by: Sebastian Alba <sebasjosue84@estudiantec.cr>
---
 drivers/tty/serial/sifive.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/serial/sifive.c b/drivers/tty/serial/sifive.c
index 4a445d285..cd2925b6a 100644
--- a/drivers/tty/serial/sifive.c
+++ b/drivers/tty/serial/sifive.c
@@ -604,6 +604,9 @@ static int sifive_serial_clk_notifier(struct notifier_block *nb,
 	struct clk_notifier_data *cnd = data;
 	struct sifive_serial_port *ssp = notifier_to_sifive_serial_port(nb);
 
+	if (!ssp->baud_rate)
+		return NOTIFY_OK;
+
 	if (event == PRE_RATE_CHANGE) {
 		/*
 		 * The TX watermark is always set to 1 by this driver, which
@@ -1022,6 +1025,11 @@ static int sifive_serial_probe(struct platform_device *pdev)
 	ssp->clk = clk;
 	ssp->clk_notifier.notifier_call = sifive_serial_clk_notifier;
 
+	/* Set up clock divider before the notifier can observe this port */
+	ssp->port.uartclk = clk_get_rate(ssp->clk);
+	ssp->baud_rate = SIFIVE_DEFAULT_BAUD_RATE;
+	__ssp_update_div(ssp);
+
 	r = clk_notifier_register(ssp->clk, &ssp->clk_notifier);
 	if (r) {
 		dev_err(&pdev->dev, "could not register clock notifier: %d\n",
@@ -1029,11 +1037,6 @@ static int sifive_serial_probe(struct platform_device *pdev)
 		goto probe_out1;
 	}
 
-	/* Set up clock divider */
-	ssp->port.uartclk = clk_get_rate(ssp->clk);
-	ssp->baud_rate = SIFIVE_DEFAULT_BAUD_RATE;
-	__ssp_update_div(ssp);
-
 	platform_set_drvdata(pdev, ssp);
 
 	/* Enable transmits and set the watermark level to 1 */
-- 
2.43.0

