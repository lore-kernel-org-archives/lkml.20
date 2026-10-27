Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793080944;
	b=aSQxcS7yF2ox8FD9JoOX159+MBg6UHcp5+cGVHJ7rZkq5cUJaMgbujXsnBXGl1xnIBAW
	 PwNXmUkZudbrJ5i/QXJGo2C0uztq7qvqQ3GTHAJYp244c4vYfmprWykX7IK6qcPFkcFpu
	 40J0G7NdaQDzpFfVgpr7RsoOfkwao5AkRAFXj4ZtB9oDuKldCIOf8LJMfPwgzFIdmaN2m
	 /FDwWc0uzegm7O+v9PFnSKWtdJ55BCHVdkAUpOUFYV1uGTmFVx/BXk+ZJNa/ilBkZEx5o
	 N0nGnx0p3z6RxddW6MDqXkRxVFcfNLRks04Clb67xYCzn1hPGKUpa0Kkx8Ost4kPc0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793080944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=P9lF/15sStv8YUEYbc2AwKR4Towep3VvwFsfF2c6Wzw=;
	b=xYrZ+OYtAEQKfFsUBjvqz53kEBk+C4T3YGdnS6RxaheFCC7T4BoMtx4/kVBEIW074oGm
	 D0C+afRcSJltrW6ZuzYZCmhYB7cL5X9QUJXDgyHmaf1vJKEw7YPON5lJHorWZTB5QYlU4
	 vivXbrIbm0s1EjSaIQj086u2l9hN//vB/i+uCDe+BwDxB7EDsoa1NMAajiVgpOBESC19C
	 lRqViT3fCFm2HI+wzaEKIGRzRFURjnPYDRkcrqqtYDHXAoF5DrWJTBZIXhgosHu0TdyKl
	 2x74cza2uiBV8S9YW8/zmv740X4Uc31Tgn5ETG+cVWhWWqtWSHXYQ3UvvVfzLqrO/yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="JDm+QoD/";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02185606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:02:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02185606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JDm+QoD/
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so3470815e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793080942; x=1793685742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P9lF/15sStv8YUEYbc2AwKR4Towep3VvwFsfF2c6Wzw=;
        b=JDm+QoD/9VUZxgG6Xc4HhDT7aDIg2djSwXQYn2KLF+ZVkszotvxLf9fZ2SI4NCoF86
         8accEx5TNSB0SDBUphTxmAIbkRwJk0aG+DoyBYC2T4ji1jcJa47L+Q+0LA8hPTo/UrRy
         WenjUIRvXkdyChaPKmjD2cn9Mi5Pi5q5SfyM7c581R2f8uPHo9nRyVYJkEMOO6521aAu
         0NB3MpkSFaN6+CmDbdMLPpjma3iGdsN+jQFsEWA/h8/UDNS50szeNwxHVhaKa70r8BoA
         muRU65loa4MGAvXdZ0+YRBBMeR+vz0b3PJ8Iz+L6YeYPjgZWaKJI/aI1zYuLAqx+KDz2
         xHWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793080942; x=1793685742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P9lF/15sStv8YUEYbc2AwKR4Towep3VvwFsfF2c6Wzw=;
        b=IUMEGpdlisztjOHEu3aecfqU2XsAMVxpmWZWsa+fnN+l+Dr94B3wgB1nB0Z78RValg
         owFXcsStOGEwIzutgZb+08X1FIZ3uVpqYkwZJQihPJtnK4m2rP8PdtiUezklKd0Cjqb6
         7/EQ3GQgwKOJtHI2ESpEc1el4c2VJYQwPB89neZLzEYGzDNTomYqFPH/LCgdaMZhAHja
         qjEyzaPUuYJcXKWbMcd36Su9YcfVcmdb+33g7jeakBsHWjo6lI4TOSl7FxMmArcH4hx6
         RJ6Xml7yUNMa3+ZUVLV8KYphf94ij24nE4J5TsA5R48tbYeFq3RelrkVTCmHMPl3rM7n
         O8Lw==
X-Forwarded-Encrypted: i=1; AKwUvBycIhiakFp4tOOEV0BiSrA82aGWbIX95gD7HrYL3/ehmofTrqT+9ZkceJux7jPH2ZolG6gRtiJA3MxM84k=@vger.kernel.org
X-Gm-Message-State: AFq9FYIck5RPndUYHfYXPSOrTUzY6kap51Di5UNS7PFlp5yjMs1CgRkp
	exnL4wJkHukfjWDNmk5Pv4qOSjxfyCXrnvSLiTleRCgS8gHnBweOwGeY
X-Gm-Gg: AYBFou2EKcDJR/TQOfuhR1q2yqyrpbZIQGfqOySmmzJ30SU6DGjTIB4wmEVqpLKvWhm
	jFYDqjprzDNbTpY7wkAiQIRpT0xiuC7xXcXTVUqywtHDKm8t3oyhJw1Xub4snJnKLWAyl4Mxvb0
	o06LzagW1Y/R2Cogg2uqZ5EqnLRg8pxSaIoFRKkuuxnUGeLV5QqoCg/sDfgiEg2YilySV9BlFmg
	CW1OS8Hug67YkNLhQ2Ri2yZ2tPw6yzOgfe2flYzTwtG2FHLtFvvGp4vnrJ1SVk+5D/+P+rOI3pA
	lWXu4lvDXk9nfpGWSf8qtdus8iyCekkMgvpx+uhj8//oYFIlWc3ZqAER4LOpgxeO9rbDOFTtk57
	RMQXYOvqWrC4TWJCQCJlxfyFjd3P4GBAkMvxZWvTmUMWBxv/v8uJrQmdifQihfD/LEiflGU5xzO
	9fmyb/zFVEvkmdEsdSY9Og0m5zorS80St9ggbxTHtyDx/QKhJ3RZt60oX7/yPVykUKpreJDhj5d
	Gc4sgUD2k5WqfT+HoMyXhglBU/BvCfavidXmr07VDcaWVofornFsbIeVC+1Is3Ko4WRlS08ofpX
	h0pedzHRmjgD2XsNIAXv7SnG6HCN1dXVB7gYPrkhX5JG4kyZEBklFaltjT53NtyDX+ua6bfwCg=
	=
X-Received: by 2002:a05:600c:a318:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4a7c0b3f6c2mr23931405e9.8.1793080942301;
        Mon, 26 Oct 2026 23:02:22 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2d6f6fsm234543795e9.12.2026.10.26.23.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 23:02:21 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: linusw@kernel.org,
	brgl@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: octeon: allocate the GPIO base dynamically
Date: Tue, 27 Oct 2026 06:02:21 +0000
Message-ID: <20261027060221.2687941-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
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

The driver registers its chip with base 0, which gpiolib reports on
every boot:

  gpio gpiochip0: Static allocation of GPIO base is deprecated, use dynamic allocation.

Nothing needs the fixed numbers. The only in-tree consumers, the
gpio-leds nodes of the D-Link DSR boards, reference the controller by
phandle; the GPIO interrupts go through the octeon-irq domain; and no
board code uses the legacy integer API. Let gpiolib pick the base. Only
the chip's number in the deprecated sysfs interface changes.

Assisted-by: LLM
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
Tested on a CN6335 board, in a 7.3-based tree: the warning is gone and
the chip probes as before.

 drivers/gpio/gpio-octeon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-octeon.c b/drivers/gpio/gpio-octeon.c
index 777e20c608dc..5fa4825d1a96 100644
--- a/drivers/gpio/gpio-octeon.c
+++ b/drivers/gpio/gpio-octeon.c
@@ -102,7 +102,7 @@ static int octeon_gpio_probe(struct platform_device *pdev)
 	chip->label = "octeon-gpio";
 	chip->parent = &pdev->dev;
 	chip->owner = THIS_MODULE;
-	chip->base = 0;
+	chip->base = -1;
 	chip->can_sleep = false;
 	chip->ngpio = 20;
 	chip->direction_input = octeon_gpio_dir_in;
-- 
2.53.0

