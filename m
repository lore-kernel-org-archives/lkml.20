Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793209436;
	b=ZY9HQgMoelQJdUcqayPfp1y3KEYqObyt52qOlrg32IO4kU4QgAOhAmAq6bncTxt1hy3B
	 9dCQilYaYSY+YMPcOWYYJIo0ZLslIUDBUWS4XxBsnlKXfrrdTvCOR6cLw+3cnfFiRmS51
	 AoFw36pxyp1nhjhi5Sg17ZlCLy9qS3jwAK8Xc9TQytQqMR9FVQRn8qa5ZSCUX2Mf4Y8oz
	 zgHyMbl/3zxpTPkgsnyklu4QG7tTHKl2LrwMALfF/R2cp5Ifb5yOmlj18M7nX2XwqRYnj
	 cdW4ePph0sBcWVfMzsU6+oqHldMnVh6BGg1pE1JR46odhT6kK7F0qS+ZLU+hDJPWy9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793209436;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oPFymgk73onVjUCM4q3fxSx09nBLSQaE267hjL7WZOU=;
	b=Kdu7U22YBT9w0V5K0FG0FXHIX6k90ZIQNo0IrdlIrPB3v4u0mG3vBCzeh7qVVlhH0k0+
	 /gNSG+bXxrLuw5ZL2gwqkG33R1bR2tGJRwfjyqb8QeAzdUKqwFTtAtk9OQ7i/cObtntOH
	 v0E1S2xyqwd6bFkIKmNsvUkHhmb1hf2pK13vibuLYe7H0m4+HjEYWcBkhjohzgpqmo/91
	 7a20HoDDu4M43v6Oj+d06qovXhvw3VefjkEniEf9g4Y8pNqfTvNDUzzOxAe6jMqH5fXW0
	 V1pWeSUortUFsr1pwm6P6J+hYWdfwcHfKrq1R6g2FzgasE2ca2jm3t7VtlIP+sZLluw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h4rxpG9d;
	arc=none smtp.remote-ip=209.85.167.180
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E714E606A336
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:43:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E714E606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h4rxpG9d
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-55651e7de9bso766314b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793209435; x=1793814235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oPFymgk73onVjUCM4q3fxSx09nBLSQaE267hjL7WZOU=;
        b=h4rxpG9d3Z5riR96UpKOEAj2hA7HwZwogJsse1nRDW3MrgAJ/nU4oqa+suvYLeTHrV
         IS9eDJQRzCGriXZfn0bCCwcj33eYtRtHvABBTda9lmu63Hpyp17s2/kKH3D9GINDUHyV
         pJ7wMaqdG+makIFIq6yAGioBf5EHBrcIajxOjz/tHFlYn8fMfSi7RBSY5V7wXuv0/0Zb
         ejItd/s8fVzLxO1PzKXYUwvrdohwlVTZEeQTgjS7xb9C9XkF54YOf7IVOA6yQeYV9ONs
         NOrEuc4Ry831cvuwfANhaKhrGv/mhJWH7SOuqsvADS8xOiu+F4pIUuLDMM/zrr5AU2UJ
         sDZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793209435; x=1793814235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oPFymgk73onVjUCM4q3fxSx09nBLSQaE267hjL7WZOU=;
        b=wCMU/CIzT2Z9cf7UzWDN12IIZ7ZcEmwYGA9cEblU6zNcaTqcq1EbWrjwc3h5s3bCLr
         ik1mMt6+ElSILOwb5oGz6MGQ8MUaxtQrQIe/KJtGDNaQEF6ijHOLx/InxmRkzrfsXqoj
         xXYATGjIGMJuHfTUnSbgH0/DBJzV9wihj+iWoGZC9OSE0IWaioq/Qsb33Tk2PyYRCM/m
         N8iWzaQluoIPpAqempt9FgEQV8+egeU0Qp5xtOhrVc35T24r8Mncqoa3Ff5RmvD7+Upj
         eH1lLf0PM8VjvSt7682J5w3kqSVYjYAt6jiLFDEgUF/tB4wnuwsyDTjujXuU/ydH7yBj
         Vsmg==
X-Forwarded-Encrypted: i=1; AKwUvBwzxIV7oVyNJY9IcvrUI/Z57YTY0flKTN06BbXNGaYFB9pZKbeuvDJHE2QEWIN1B4QbArZg2Ra537f32N4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTDfG2H2FFQj8Npzw0cJxdxmBdWF1bo7lRakKUsDQ29bdt23jU
	lyTc/0yddpXKNnbJOunOojaYaLOPaIC+KD9uXAuQdd0nL4KtciBOQArqvBOcu1PQ
X-Gm-Gg: AYBFou3sChEY6HfPuNAbyfK/Zfyxu8XZrgIcaBGK+AS2capyqRm49w47Si8IrznHrto
	g0oiKJfK6wCZJSJea4pHDsfVg+XwkR40m7MZSEAIJcHcJEYdy3jTLSQu50PREt6NFTFIUSWRR0L
	cyARLx/tYVgWejflffy0xAu7yBmQdLs+J14ktJK3mJ72lxyqPxVL2Zl9y7PqmfzmTm50BBlmXrD
	jz+Ne9QjGe3bT5VcRdAeX80NO+OxYp7ZH2+EG74fpyKZB4Og5xG55j67sHWz85B4G8PMTr2eYB6
	Mb+GC5p2Vt3eUyBvNt0jqgvIY0ycehS7UyjicnW37kQTtr4nkuq1O6pkSpxrGG+zH02irCqvsFO
	Xo8KqZP2pZnNGN90pCMNi+TuVGFg/Nid0tHmeZ1oGKRoUe0zCEx7vPb+i2Kje+r38DKxSWBMpha
	3OweY9MTZYhtC86jYzuTr3XwXuVDI2dgMuDZO0YMhNOpkEZodxORTI2kYaZGtb3ibWqsA2Mm4mJ
	S4/w63av/J+3p3bRGnEEmz3I7J2XlDc+grogROL8VfiX+KR50DWIaEeqP2DrKANGmF6fenr7X3d
	FCW7F5T3OliUeTMqgDHZVmjDZl1jG4k0HCZcP6rgQW4IGMYGP1vjqQDlR0TKh3Udbxy6cKU=
X-Received: by 2002:a05:6808:c40a:b0:4b9:e5fa:8905 with SMTP id 5614622812f47-56382681ba1mr2105457b6e.24.1793209434933;
        Wed, 28 Oct 2026 10:43:54 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-563c5a4d8b7sm1612114b6e.8.2026.10.28.10.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 10:43:54 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Andrew Davis <afd@ti.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH v3 2/2] leds: tca6507: Turn the LEDs off on unbind
Date: Wed, 28 Oct 2026 12:43:48 -0500
Message-ID: <20261028174348.64014-3-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028174348.64014-1-danishkhateeb03@gmail.com>
References: <20261028174348.64014-1-danishkhateeb03@gmail.com>
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

Unregistering an LED that is on turns it off, and the driver does that
from its work, which is queued from led_assign(). On unbind the work is
then cancelled by devres, so if it has not run yet the LED stays on after
the driver is gone.

Flush the work instead of cancelling it. By the time the devres action
runs, the LEDs and the GPIO chip have been unregistered, and the work
does not queue itself, so nothing can queue it again.

Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---
 drivers/leds/leds-tca6507.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
index 0f987e551f03..ffad476af625 100644
--- a/drivers/leds/leds-tca6507.c
+++ b/drivers/leds/leds-tca6507.c
@@ -71,7 +71,6 @@
  * not recognised when matching.
  */
 
-#include <linux/devm-helpers.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/leds.h>
@@ -712,6 +711,11 @@ static const struct of_device_id __maybe_unused of_tca6507_leds_match[] = {
 };
 MODULE_DEVICE_TABLE(of, of_tca6507_leds_match);
 
+static void tca6507_flush_work(void *work)
+{
+	flush_work(work);
+}
+
 static int tca6507_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -738,7 +742,8 @@ static int tca6507_probe(struct i2c_client *client)
 	tca->client = client;
 	spin_lock_init(&tca->lock);
 
-	err = devm_work_autocancel(dev, &tca->work, tca6507_work);
+	INIT_WORK(&tca->work, tca6507_work);
+	err = devm_add_action_or_reset(dev, tca6507_flush_work, &tca->work);
 	if (err)
 		return err;
 
-- 
2.56.0

