Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D30143AB0
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 03:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792293432; cv=none; b=sRV0HNGyrU4zKSxb/b6k6wXeMTeFSdWrkYee5bIZhvz65asj0Ve2UM2jUH9R1m6pLD/3InZJBJ2SHdOUbho7eWUl1orBvO7jc2VgWpzReqb9NKK1c9e9m1KE7EKgsEYwRX4VUc+qksk3U9IMXMqOrUYoIbAGEH320R+phlOE59o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792293432; c=relaxed/simple;
	bh=M/ePt7/U6Z/+EQ9IoyhoFmwghwbLF6fwPZWbqDxG7UY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=MlqmiiUtCT2MOZvPoPAFLaHKHrL3CVxMXKm199EBGLZZ11TbyxZ76eUyNTeF5o8BPxIzXH5mJSdlazeohKR+E3SWGNd/YY7sWYhY3+Y7+6Jq1qSK10oaEljgNWE01IznEq0+fED1FV+UU78P9KfHPbi12t3Wx7HzFZ9dETglwZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FtUex8dj; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FtUex8dj"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93e6eb77f0bso106143885a.3
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 20:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792293430; x=1792898230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8TbMma2hCgHlI583VdajsztpYXQFI08NX68+gXwkEaE=;
        b=FtUex8djQFaREvcrP2G7uO8ACMLPi28pWUIpeq3VpZ15M902V1qxFOTVtoyHeVBArj
         l2sehH+my5YNa3TorPYxQ2g/y4K4qiDCYx018QJn6rGf6DwsjAn3rbBAj/9M8LXFURpN
         GoCGdAfWgS7CGlSg59CgH2YhWR/T5ezFkRXLmXq7o+CqvuiN8osayLTWlH7K8hYjrHgb
         WTFIkILdwsZG9wk42/0vs2Wa6unC2Va0W5k136NwnOP/9+YL2tc9s+SXyJV9qdAqZ33M
         sc+ECAWKhHjH7owbjfUjw5a6rv7fNuB2HUyAMTB8ZhDQ1xRq01njNv9ELzgbpB1csRU6
         jGBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792293430; x=1792898230;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8TbMma2hCgHlI583VdajsztpYXQFI08NX68+gXwkEaE=;
        b=Ji2G+sOkJQuAAO+jNqImhovsxxOJkK4j6spNnySsaNXQ8C8QzIugniuGQdPJfKqUUJ
         q5GyjFDpVDg3vJwfcZDRJwtS+RbTlWISk3LetnI0sL7djSelQn3Isza8kxCgu9vmduDF
         5V5x4UVDrAtJEHNQ2NSDWvNJkERNiU2hMQ8N+VeWEiyfKtqlWziRZ9/EcK5WBSHAt7OT
         RDt9VablV+g/tcjALs+7rr9H2tvCYOfVtwljWp3SwTowBY9+08tzjlkTrKXhfW3klQP8
         9V2ZHGKxSHiE19hdUtWFTlKtKAxPXf6yAS+KJPZf8bMKQwBX3aC0cRWluX8lFUTeuFb9
         o0Nw==
X-Forwarded-Encrypted: i=1; AKwUvBzf7EreWiC5KVdq2dheoweFam6LolfmInqADB20v2NFoBv8KmtXA5d++QbaSid9O5iRFiBBiv5Eb1mJNYo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxblza75ycFpTIIHbF28IzdsgPtfv3c2Dx9HosyjTqPHErErAh
	AJ7EDbjw6LpNVV33QDV6o4tV9CHNqa0+F+9NyHSAKcvByvknM2R740M=
X-Gm-Gg: AYBFou2frW/uXXH54deKeYQDt6Q7gPy9S7hDV3yQsQ0Aq0GvBORBhVQG8K0g92xYAxc
	eokmoVpWHr9Cmbv/XJJ0Fh5beoFeHymMUpXmq0zXfOFbwsf22KvldoRBOPoTsm6UjSZdGvNXufD
	nRcRveGETOvOcMZRlb9RzsT2O1ftgqN6B74VoA2X9RSOzdnCfYs33wCGesYqzOLgiRvtqxsF0ML
	xbI4qCEDkJNly786AH8QDQ1AKr22RMoX3OtYmIxMfUzpSfnGC9CeXlO+MaM9KNafzsHSZfqdQCF
	sgnT1cXuGu523iMvhNUnI7ueWfPfMFYowTBW0jv68DdHTPh2LoVQuxymtZ8KiuelpL3X91kqLrH
	ygwtErW7hZECxo+Zcb7c2xu2V8OuXqtLIedLItjtGyJ9V7CHMB7tzgtmQWOXoBeVJ+V/5W7g6nE
	gJFR7Nt8Wbxiw1Ye6/kXfxnkS69vm0f+5zApYxovrTY0EJvX7VwwUMD9GZ0r9r+W8lmImAScR2r
	JHIoFLZddRHzZ0S4yueRzyGhRXrSqASNPVu/EfH9cLInhTa6EhEhotikV8FhYeA4O7leIr36Gax
	6CSUxA69Fg6a9aYQzoNCiXR0bZQD
X-Received: by 2002:a05:620a:4042:b0:93e:fa30:f1ef with SMTP id af79cd13be357-93f29dc4771mr744477085a.67.1792293429834;
        Sat, 17 Oct 2026 20:17:09 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a0cf974sm611181385a.1.2026.10.17.20.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 20:17:09 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] usb: phy: gpio-vbus: disable VBUS work during removal
Date: Sat, 17 Oct 2026 23:17:06 -0400
Message-ID: <179229341073.3942822.17212567068599854952.gpio-vbus@gmail.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Legacy users such as PXA UDC obtain this PHY through usb_get_phy(),
which does not create a supplier device link. A sysfs unbind of the PHY
can therefore run while the gadget consumer remains bound.

The VBUS IRQ remains registered until devres cleanup, after
gpio_vbus_remove() returns. With the gadget still registered, an IRQ
after cancel_delayed_work_sync() returns can queue another instance of
the delayed work. The 100 ms delay lets devres release the GPIO, OTG and
driver state before that instance runs.

Disable and drain the delayed work during removal so late IRQs cannot
queue it again. This also rejects work queued by set_peripheral(), which
calls the IRQ handler directly. The managed IRQ is released before the
GPIO and driver state accessed by its handler are freed.

This issue was identified as part of our ongoing research while
reviewing kernel code.

Fixes: c2344f13b59e ("USB: gpio_vbus: add delayed vbus_session calls")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

---
Compile-tested with Clang, W=1. No hardware runtime testing.

Based on mainline 0fcb05b72344f40806cbe810de8872f1698bf053.

diff --git a/drivers/usb/phy/phy-gpio-vbus-usb.c b/drivers/usb/phy/phy-gpio-vbus-usb.c
index ce09e78..80216af 100644
--- a/drivers/usb/phy/phy-gpio-vbus-usb.c
+++ b/drivers/usb/phy/phy-gpio-vbus-usb.c
@@ -330,7 +330,7 @@ static void gpio_vbus_remove(struct platform_device *pdev)
 	struct gpio_vbus_data *gpio_vbus = platform_get_drvdata(pdev);
 
 	device_init_wakeup(&pdev->dev, 0);
-	cancel_delayed_work_sync(&gpio_vbus->work);
+	disable_delayed_work_sync(&gpio_vbus->work);
 
 	usb_remove_phy(&gpio_vbus->phy);
 }
