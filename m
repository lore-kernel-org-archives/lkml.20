Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793503622;
	b=p6DsODaH4vyq0ijpUpumAnlHd/Jam4aaJuXOKaUVEGDf8rxKcddmVj+nALQPnnrxYZii
	 7GfLyoIboFmUG13BZKC7zIo3Y2v6x+kCXicg6orBpGKT9GJi2FoPu0juQ45YC5Kb44Bt/
	 Tj/K7T4oedsrb8cx1OLh78HiPPGsQ6VZbpkYqtKds5aY7xrTmJu8c+9VI8z8BbTZgmyh9
	 f9BKbM8l1JrXSMk43hgz98wcbCMo2ONsUnLJP6isvCa+Lj012+4DWmK7vg0cwC9bN25z/
	 D7d1yqx8cbZqe27CeK3em6tlkuQNXWkcUEIDx3BuZtBwB8jG757bOCSkjdi6A29bucw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793503622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Z+poO6efwcGNj69j/DfV8JX7ZC/OFlxZpiE6eh71TzA=;
	b=pUaYBKv7DizdRpl52yJYe4/kAKTdvsT6NKC7JCVEViwMTP76FKtLlo1y4P9YlAvNRrlg
	 ZYH+B6Ia8y4utXvipAJJkp3UyXFZaMZQ18H/uNck/KM/l3JVAfANp0DRqkesltWmEnPms
	 mD4CMjKS8Zee/xnS+6Ctg4o5GpuB9L6Gk9TKizlWZWl+4qvjkDR888YiTjBwoAUhlPInY
	 9NJD8TfZpxj8ObETNA+LCKxhXBenF0E1ETHZm9NS3HiPAU7q4vsozn0UgZ2ZQJIK2PqHa
	 5T0V4YBwK3xdarcnhBfkj0QSZUVmi3S+HY2iGHcvrgEW7fYCXx+zmXU0fTSmyRBB6sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EP0qY+sw;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A0F606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 03:27:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39A0F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EP0qY+sw
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e987a2ba0cso10882415ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 20:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793503622; x=1794108422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z+poO6efwcGNj69j/DfV8JX7ZC/OFlxZpiE6eh71TzA=;
        b=EP0qY+sw7BT9C40L2DjSQr1CG4y31Fg9l/l0swU3caaz+JKEmVDp1NgRJmAT30C2Pi
         /v5HnIXDgXhIAlvaQwGaJWYE+gYaGpHZekD6iy/3GAZL1/98ksvYA3t8K+pfEVvAe0P5
         amlTeHnb1YXgnXgs3ys9OPWeUXDEe7Dy9AeOwH4pv5mkUI4TirWjwph+ne3CvVhZPG36
         inSXD2soCbRG24X2RbCWvTnJ0QTpQ/qXqIkYOr/EXvmHg4X8cUtt095oTNOgGOQS00w/
         QAXcmZkktq4JsboxwR1xwRiWVbA9cRAn4Ca9ZSf0TNnc/j2HAPlk3kMPGEWaaNvOgJr9
         EVsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793503622; x=1794108422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z+poO6efwcGNj69j/DfV8JX7ZC/OFlxZpiE6eh71TzA=;
        b=pcqegQV16vcMCKLs9zPx1TwJ6Zw1oMTHuiU8URabDZOWGsDwdU4WCMQNuVZk1FrlPR
         yGGwseeN1Rs/pZwHnASfFjnR0BBjsyqMb4H/paYJ7DXwlP7H2eb+EtQeLHfb7MnCq4xO
         ODCFkRIwpfL9U/osj1XK5ymrS9ZTJV1fTfO/ef5Yu+Sfd8JNT+PQhQyE+Sp4JDF+t8b7
         o9yE0kpEI7f6Njtjrx2jYFtNICO3DZoSa91vmf7D+6TXO1MrtmSUc1hPyA2HHRKBo26M
         i5Dm9ovQOoJ8UWe5JDNFrW85c2n/FFD1a1OatqvZcS7w2aWrSrHX9ZoSqO3UYFuIO/NI
         Woag==
X-Forwarded-Encrypted: i=1; AKwUvBy51H5O+VrUa79UxjFL1ZgHdzwTECF8FM8CqiSsnZOJbTCeD8U+Ynj7FWehFzwOK702NqCtNQCeN/E14/o=@vger.kernel.org
X-Gm-Message-State: APuU4Z88ZhljZBHwvS2tYRq7SnRJ47FHWHJhw+raeM3Ei/bDdSMJhouV
	CfqDYSlZ5HEe0TqsPa7Fh2Ju7MDRfe8ukIKKTkMHxsss3SMZ2jQe9PNR
X-Gm-Gg: AYBFou0/crxayDlqr/psATb/uBwJ7sdS7F6YCb1gDc+ezW761uB2tZAViI6aYUgh/wA
	L76w4ypfFT211SimICrcdMZxy+ZlMOXz23NpPuYu0F1bx6QYNzMRi1eB5obOX6MHqkbc/Gq5Nzo
	7hCqxWb+s2chYgbD/+AA1bol1w4/zFbp+K7l+jTeUUMdezyJelYZlJn82r7k9hxMXjFcCD45IYr
	zKZXj62edlcqMt52JUSlwwtdx0Xi7A/O0SD6IZ4rCQ4fWbiqjMHP5q0rME18xoBOIg4dapavUED
	9ugfRQsRXuxqjFPAdx3xwTneoxwlZN3iCDLuGr4uQno7PWS7w4Q8EUmooLkK38VCJKp2q27ljXq
	zQKaWvL5bnuYFt9j6bkOFEcIllRTO96NMGcjAOFXiSOwlvh56msvivXtUOiizcGmlRGJRoa1GLx
	S5KWCd9exLjyxExoSdQiSvx0/vy400+1YC7P+ng3fk2O5DQEwgY3b3s1qi5mMdXiqClr9Ex6Boa
	TqrrILUWyifSoNSazAivLQJrDpycVE1+hxxIkqCvILDIuvjgHidANio6Nk5lh1BNQHSCp48AWlM
	trKnKi6PD/bFIbaFX8EuFrVRLjxTH2GN0OnGjHDCZjsd6aqvZp2TkZZK/tq/y70NraH7n9cQtnA
	iVuwJDK+U4L+dpO/Nhen4Cfdjg6vLipmoAejv94SrG5IAItAOU/dpVCQeuK/Z4PPxpCo8MFB6I3
	t1DzI=
X-Received: by 2002:a17:903:11cf:b0:2e4:4eed:5cc5 with SMTP id d9443c01a7336-2eb364c02f9mr64614275ad.38.1793503621559;
        Sat, 31 Oct 2026 20:27:01 -0700 (PDT)
Received: from EAIT-H54D9Q2FJQ.eait.uq.edu.au ([130.102.10.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392a5f48sm17193685ad.64.2026.10.31.20.26.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 31 Oct 2026 20:27:00 -0700 (PDT)
From: Yu Zhang <yuz08559@gmail.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Stefan Wahren <wahrenst@gmx.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] pwm: gpio: unregister the chip on driver unbind
Date: Sun,  1 Nov 2026 13:26:46 +1000
Message-ID: <20261101032646.11397-1-yuz08559@gmail.com>
X-Mailer: git-send-email 2.55.0
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

pwm_gpio_probe() registers the chip with pwmchip_add(), but the driver
has neither a remove callback nor a devm action calling
pwmchip_remove(). On unbind the devres callbacks release the GPIO
descriptor, cancel the hrtimer and drop the reference taken by
devm_pwmchip_alloc(), while the chip stays registered: it is still in
the pwm_chips idr, its sysfs attributes and character device are still
there and chip->operational is still true.

The chip can therefore still be reached through sysfs export, the
character device, debugfs and pwm_get() from a consumer. Those paths
call into chip->ops, which point into unloaded module text once the
module is gone, and pwm_gpio_apply() re-arms the cancelled hrtimer and
drives a GPIO descriptor the driver no longer owns.

Use devm_pwmchip_add() so that the chip is removed before the hrtimer
is cancelled and the GPIO is released.

Fixes: 7f61257cd6e1 ("pwm: Add GPIO PWM driver")
Cc: stable@vger.kernel.org
Signed-off-by: Yu Zhang <yuz08559@gmail.com>
---
 drivers/pwm/pwm-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-gpio.c b/drivers/pwm/pwm-gpio.c
index 5644d78..cffdbcd 100644
--- a/drivers/pwm/pwm-gpio.c
+++ b/drivers/pwm/pwm-gpio.c
@@ -212,7 +212,7 @@ static int pwm_gpio_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = pwmchip_add(chip);
+	ret = devm_pwmchip_add(dev, chip);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "could not add pwmchip\n");
 
-- 
2.43.0

