Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792750334;
	b=UQp5WDyHzb0VCmiR2EWNI00a53gg2MyV96jb1sHLY2vRpYMGB4GS5yJxzJ74GrgxXXNQ
	 r8DGm9WlODRrVWUT9IMCDzXTZ3c08vBZQCRDJAAo23J2d5aWBEOO4F9ZQpuE9WabTWwr/
	 GfejMnL3ETW9o2dKnl2YJhy5POwMC3ZM9BuNVWLUIZuecvwK4MT6OAu2v5Sv04NWpdfo7
	 aOIu6FADqpI3EknVQKg87wJLpPqpzBbPmqkZ0sPZCB+EhJL90m90PyZR2OPeuc9YtCPs6
	 EYBYZuurZJkrPgf7yYxRV9RXsgeb0YjrHp+fBOuq++6FShYN33roPud1llq8qExi0Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750334;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HgzAQ6yNXJm+/JMG+P/joeDeoINHIroQeqY0i4kBEKE=;
	b=fYgpf/2HHLJ4JLcmtkpy6xT4QAjbVF7/1W/g6vm9VW8yUmd4K132q/TF3VXOAgaFqiFX
	 arBGDUV8EGiW/ENAnMBiox1PjtmIg5667jtwMctIW9IC9zp9iuqbVXxPSmlzCqHLUsjWe
	 yPkYjIzMxtBMLiq41om6IBrBWn+TTglmMlsI+ThSdqvfiJ715rHl5cUCTdtZWyOivoxuK
	 Iy0RVHRLfkVSYR9Sl4cMu06+dd6so5Dsef9BVyLqtRQrgvVul7mAwinI7UKpsByh1qMNo
	 YmqEgj69l+VB/K7dSDkV+0niK27/bNMpZWjtWRkl/KDd8DO1oTRvW8tskoG6MMuCZHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=LWfiKVqh;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E97606A320
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:12:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05E97606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=LWfiKVqh
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so3730545e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792750332; x=1793355132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HgzAQ6yNXJm+/JMG+P/joeDeoINHIroQeqY0i4kBEKE=;
        b=LWfiKVqhmmXyEgNLRl+/C9XxyyHrtX3XJxz7QlLPo6BSfYPzmOYZSFeTiheWHrUhzH
         QjhvtYZYrPEWbkjbY1IMhMh/EUH03ooaDaV3y/BfjwI/jvWysK5CqALqSz6cOwpxeEWr
         W3CeY8yYzmhoJrfW4Yut7z3W2vzB7lInKU24/eqK9AovJaotN+/FIGYMN/2pQwAdcX/r
         ZE4qfqyr2DFT3aHmso2MT8v5JN/U7HYinGLz6fDHI4sHG3tCYETxt64aiLX25AyMptsX
         fuWiMcLnxm05tm5nWV8MHm/v8B3IJPIkbF4QtiI/rlx335gwb18RaGxwGHTe5M31cKd5
         6Sbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792750332; x=1793355132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HgzAQ6yNXJm+/JMG+P/joeDeoINHIroQeqY0i4kBEKE=;
        b=uL6fYkntnTnEUIs68j36yWUDGexvA2MYjrT2zjA0x5vgbokECOw88hr7NCIQFPMR5N
         7gsgwzrSz4p+NTd5k25S5zZwQakEEfxY+z1x+ymr6iowwrT2nCZ0BqIBk/7/5jz8D2gs
         G+7KjaCGx9z9vpLUkVN1A3okAfeZwemTQpdEuzDC10nUikfxjlx90UmJwUrLyYAO/5XJ
         FIKSx1xrdbr09YJXbEAgViN0V0mjfzQYi56R6ldRemVCyqcDFYyVesm80wUNDuk+gy49
         YhVqDDLGLAfPVEazHTCmbdeN4QBzkthQpCZGLKw6ywcQJxsZqtOow/oKoXuJ8i9JWMlm
         pO1w==
X-Forwarded-Encrypted: i=1; AKwUvBxjzZ0eRvDoUr2/n0uWjJeAxIZ5DJtkdZd8v4yY7Krlq3p7dIl5DY4B30K/7e/X7u2ZO57Ii5lXkCiC+B8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcZeeB4S313WbOg87ROAPlcWWFPeoZN+Konh88MYevkpCgd+61
	Z4QyKEqwpnFnh+C8twsA/UBXq3Szj8+laE+OGh3veV7R/QznrYwYiUIgVheqRYRiOlc=
X-Gm-Gg: AYBFou3aBUq1aRE4gmUAmuGwPbmzEf/g2cJe3F2xOlJZCai3DP2pmafA42BpJHpSzwI
	dxqIOhVd1AjtPS0CRqNSTRIrGyUsjt/WuVTbNZH1NSZNtQVp3/5YcL8frpriw429Gsr03NtMWdq
	J+2nzz3LG6KZQPbnbVxTdRGFZDBNTcOlrEyecQ7AgSC7ZPhU1yGI20BhdkwSGCgHUKqpUagqnwK
	Hpxt2Bk5+JZxUVNkQhsCofH5q50Af8fKh+WfeV0GojTnAREI0KakjXQjKC6H3y9xVc/GXLK8QdR
	IMOrpvRbJjhr9WHPHRFaLTRl1aiyVDmbw85NHNC0A0FjT12l9qWKiyZYlhPdUoxuytWJ4cbwt+H
	RfNhwyBFP1Wrh5t1Kd5NDXqBch5F9O9O66oC4qeZ2SqCShyTt1EphqlhEacKjdfqR2RSlcwz+Lr
	7/mVcOjgQ6Lb1g6WvzJDKcPI4hhXm1Q4soWf/mItBZUce1pFJOu6K3xA4deH9Eua7gbxHDflNdB
	f0oq0UFVquD/5xSTtTdHhxKNRLto/iJwupYuuEGg4B921a935GWVNU=
X-Received: by 2002:a05:600c:4e8a:b0:4a1:d675:b031 with SMTP id 5b1f17b1804b1-4a211eeea21mr27725575e9.6.1792750332157;
        Fri, 23 Oct 2026 03:12:12 -0700 (PDT)
Received: from localhost ([82.192.120.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21047b2absm62807825e9.13.2026.10.23.03.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:12:11 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	Stanimir Varbanov <svarbanov@suse.de>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Gary Guo <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH RFC 1/4] pwm: rp1: Export helper to read fan tachometer RPM
Date: Fri, 23 Oct 2026 12:15:54 +0200
Message-ID: <a565aa38de650596daf04f3bc21a724e21c826f9.1792748690.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1792748690.git.andrea.porta@suse.com>
References: <cover.1792748690.git.andrea.porta@suse.com>
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

On the Raspberry Pi RP1 southbridge, the internal PWM controller hardware
block houses a register associated with fan tachometer monitoring. The
tachometer pulses are measured by firmware running on the RP1 Cortex-M
core, which periodically writes the calculated RPM values directly into
dedicated MMIO registers within the PWM block.

Because the Linux PWM framework currently does not provide an abstraction
or API to report hardware-calculated tachometer readings to consumer
drivers, a direct accessor is needed by the companion hwmon fan driver
to read these values.

Add and export rp1_pwm_read_tachometer() to allow consumer drivers to
retrieve the fan speed from the PWM MMIO registers. To prevent polluting
the global kernel symbol namespace and restrict access to intended
consumers, export the function under the 'RP1_PWM' symbol namespace.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/pwm/pwm-rp1.c                     | 27 +++++++++++++++++++++++
 include/soc/bcm2835/raspberrypi-pwm-rp1.h | 10 +++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 include/soc/bcm2835/raspberrypi-pwm-rp1.h

diff --git a/drivers/pwm/pwm-rp1.c b/drivers/pwm/pwm-rp1.c
index d4b13fba8d236..79d65f332dd30 100644
--- a/drivers/pwm/pwm-rp1.c
+++ b/drivers/pwm/pwm-rp1.c
@@ -49,6 +49,7 @@
 #include <linux/pwm.h>
 #include <linux/units.h>
 #include <linux/spinlock.h>
+#include <soc/bcm2835/raspberrypi-pwm-rp1.h>
 
 #define RP1_PWM_GLB_CTRL			0x000
 #define RP1_PWM_GLB_CTRL_CHANNEL_ENABLE(chan)	BIT(chan)
@@ -286,6 +287,32 @@ static const struct pwm_ops rp1_pwm_ops = {
 	.write_waveform = rp1_pwm_write_waveform,
 };
 
+int rp1_pwm_read_tachometer(struct device *dev)
+{
+	struct pwm_chip *chip;
+	struct rp1_pwm *rp1;
+
+	if (!dev)
+		return -EINVAL;
+
+	if (!of_device_is_compatible(dev_of_node(dev), "raspberrypi,rp1-pwm"))
+		return -EINVAL;
+
+	chip = dev_get_drvdata(dev);
+	if (!chip)
+		return -ENODEV;
+
+	rp1 = pwmchip_get_drvdata(chip);
+	if (!rp1)
+		return -ENODEV;
+
+	if (!rp1->clk_enabled)
+		return -EBUSY;
+
+	return (int)readl(rp1->base + RP1_PWM_PHASE(2));
+}
+EXPORT_SYMBOL_NS_GPL(rp1_pwm_read_tachometer, "RP1_PWM");
+
 static int rp1_pwm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
diff --git a/include/soc/bcm2835/raspberrypi-pwm-rp1.h b/include/soc/bcm2835/raspberrypi-pwm-rp1.h
new file mode 100644
index 0000000000000..3be0892da667e
--- /dev/null
+++ b/include/soc/bcm2835/raspberrypi-pwm-rp1.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __SOC_RASPBERRY_PWM_RP1_H__
+#define __SOC_RASPBERRY_PWM_RP1_H__
+
+#include <linux/device.h>
+
+int rp1_pwm_read_tachometer(struct device *dev);
+
+#endif /* __SOC_RASPBERRY_PWM_RP1_H__ */
-- 
2.35.3

