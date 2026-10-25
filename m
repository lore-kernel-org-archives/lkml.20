Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792952990;
	b=4MiYhS5hypQxTURwYnboTMHJTVAlYbaKgMm3jVhmo4bOHM6uFELuwgQkkd6zlijI1lWP
	 05zx5tqEWie66X9aFIc0RroK+9sqyhzb/rbltdjUJHQPPu2HO7iOPOa4ktUnaxjMLBdNi
	 RI2z8fmo8HCqFuFcclPaOpDoy6i9Kfw9EJTbh+QJpz8VBndW2QjUaq1L4fwjYLgj2R+Al
	 yIq0PSsl0jWGcPZ9oeAfGPx/8ysaiqH3OJU++OkAKWAG5OuWCKAgz49x7GS27D8CpK06g
	 EKKwwSj5+vK2nGpcp4V2WW4+2AdvCGK5y67WGGPDQmRrBB1zWGD2INZX+C5wgb+Ksxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792952990;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=lVd5+YIpZRZ9srRM38HUZhphNHJ8MrugQ9WKD9A3pC0=;
	b=q62IEfvaO31y8r7A4tERUmBaIBd/uSMWQ6okovuV6+XOwM94F7sw6KR9QUWM+SrO4OyY
	 WT4kd8UHCP7g0SmCiv10Lft7zbONF5yw0y54PdZtbOBMBe+Rs0GLqUmsFm+PRlQ9E/1nz
	 qHYmYKctENb+OWgEqrxRv4ZgAM07uEaeApI3m4lXj1o+lmjNRlX8BhI3u5nKX9Jw+AQ1u
	 r3OpaxQm6UyAmXTGY1W3M0pMPBP2BYOZjEDcUv9fHZTdDsqVNSbD7bRVGkIGpnyJHZ/uU
	 QkxC15TnDdppES6PfYPTA4YJEsfKZ8i9lB0GChmVob3o5/n6aeSa6R1J/VhkQt/ysiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oHxVPat5;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A276A606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:29:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A276A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oHxVPat5
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso23987645e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 11:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792952988; x=1793557788; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lVd5+YIpZRZ9srRM38HUZhphNHJ8MrugQ9WKD9A3pC0=;
        b=oHxVPat5bjbLKGMUYB16oqlsUm26HDldeAfuK/vg1wzG7yu2moRUuj0VDuZ8y3d1/+
         pfCnRvPMWmBqaDT3rz+oJTDyUf8JexK+2d9tATmkw2TIF4IuQpFvkr8mL/t/ZntCG524
         WRISs0WslGmjSQxXU+jMXmxWWHAp7ZmI7y3yzloA15P791hbEShWUClIQcF3NKWVE6JS
         gpe7WC7IRpLEUKxvs0w6J36Bb0vnxH7mfpLu9pGtcanohpAWtqH18CohXBBw2lXlLlTR
         21cRv96PqEZp7AqJzKTasLTOZZI/qcdNPfEk6LAyPaSt+AaBd2qVUUwpbUFDOHZifyBJ
         hxZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792952988; x=1793557788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lVd5+YIpZRZ9srRM38HUZhphNHJ8MrugQ9WKD9A3pC0=;
        b=z5QHabmkpDFOK3aEH28DuPgDqaHLfUn3VTxlbjLfsrJyZeOn59dSrlI7hy87/nk/Tk
         k8iNXYJIXAu1caO7GvqwuSf4MnjOar9dqq0KCXGmIhGdBZR/WDV/p8tE9kAU1rd/u/K0
         kHupmxYb69cw0Eqbimb4b8vY//wcWkj6/dzmKn1ivoDFF0V7GmP9Gw6YW79YYoQFm5zt
         oPI90CHuJXXiNJt3JnX0HO0W9kmgCqePzjb6ZKrGxTVN7B5arla+kuXroJo8Gt+++lkI
         OdKwsstv5AUp0MgbusEeSJiJenMnvIQLGav28+HyADXxXb2MA+Wi6F1+3G71/wlUEqFA
         w8qw==
X-Forwarded-Encrypted: i=1; AKwUvByGJGIxllY5nfvIA9osX/64yhYMZlrKtR9TN/5FHnCp43sK+3F6tEIWvxIFWHMX3iB/UD7QebP/fb53zUM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNaCHR8zWV7LO7rAAWPBffuNtfaLJsXqeWULgG1Nmx7Zctm38E
	NGL2pWyECgMMF6KnPdFMAgTrN+nyGWgRmIfljpZL3wGOMWooluFI28KpVYxgvAZ0VM4=
X-Gm-Gg: AYBFou0/6Q6AUHt9eA6wyv1M/Qes4oReu4K3krWrb1jpksHrDnLmdaVY5LoK7aExkId
	WiDpKJASRSNiZvnef+tAOuDowpQG6nF6n9kohJ76eVcuugEmo1gHt5sErrxdcwlAy5wxZSK31Te
	G2R+l1YqYqhJ9Z8guGlyl4/kiRRkmKSIV0hQ/fGon8yX5yG1bVqFa2JP5HK6yxHDFUJuTJAtCI/
	QE79le4E9J59p7Nk8GKsewpyjEeq3RZFK/2d9SmrFRgGXcILsjn2x9kAi5P9mppzodV9dlC+yl6
	Jl/+IlV9fg7EpYk1VJ0YT2H9WXfK1XIzP2l3n2v4H1Am+GpwBrKGvPUyZ+Wy4zcY17fogOYfF3P
	yi2p7eaCz94fjtwf0xrvO6/+H2LMxxBhN90C8LoXLqhmkjPsgv4+z+FnVX1CkN8M4nXhmbKrufM
	F2Z9STqXUvFjKnS00oH4eDGSLbRKXW3tMG8EFKM05iqTwBiHNClee0XofMf3ywo6kwsfSStULqQ
	BsxvdTVk/kaeVstUvdwVlkFkTGDbFkMj1SyrN/XW0xcuAIdjxNCHEM=
X-Received: by 2002:a05:600c:1f94:b0:4a1:e774:370c with SMTP id 5b1f17b1804b1-4a35acbcaf1mr81227785e9.30.1792952988059;
        Sun, 25 Oct 2026 11:29:48 -0700 (PDT)
Received: from [127.0.1.1] ([85.105.252.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2e8f25sm138255175e9.14.2026.10.25.11.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 11:29:47 -0700 (PDT)
From: Bartu Alev <bartualev@gmail.com>
Date: Sun, 25 Oct 2026 21:29:36 +0300
Subject: [PATCH 1/2] platform/x86: asus-wmi: clamp keyboard brightness
 hotkey updates
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
Message-Id: <20261025-b4-asus-kbd-fixes-v1-1-fa4dcf7d2a69@gmail.com>
References: <20261025-b4-asus-kbd-fixes-v1-0-fa4dcf7d2a69@gmail.com>
In-Reply-To: <20261025-b4-asus-kbd-fixes-v1-0-fa4dcf7d2a69@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Antheas Kapenekakis <lkml@antheas.dev>, 
 Benjamin Tissoires <bentiss@kernel.org>
Cc: Denis Benato <benato.denis96@gmail.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartu Alev <bartualev@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

Brightness hotkeys (NOTIFY_KBD_BRTUP and NOTIFY_KBD_BRTDWN) pass an
incremented or decremented level into kbd_led_set_by_kbd(). The driver
assumes the new level stays within valid bounds before queuing work to
update the hardware register:

   scoped_guard(spinlock_irqsave, &asus_ref.lock) {
      asus->kbd_led_wk = value;
      asus->kbd_led_notify = true;
   }

Unlike asus_hid_event(), kbd_led_set_by_kbd() never clamps this value.
Pressing brightness-down while the backlight is already off stores -1
in asus->kbd_led_wk. Subsequent presses decrement the counter further
(-2, -3, and so on). When kbd_led_update_all() runs, its "value >= 0"
check drops the work item, leaving the hardware state untouched while
clearing asus->kbd_led_notify.

Userspace listeners receive the unclamped value through
led_classdev_notify_brightness_hw_changed(). Because that interface takes
an unsigned int, the negative integer wraps to 4294967295, returning
-ENODATA to sysfs readers. The keyboard remains unresponsive to upward
brightness hotkeys until the user presses brightness-up enough times to
cancel every negative decrement. At maximum brightness, brightness-up
leaks 4 to userspace, which exceeds max_brightness (3).

Clamp the input in kbd_led_set_by_kbd() to [0, ASUS_EV_MAX_BRIGHTNESS].
In kbd_led_update_all(), refresh the local value from asus->kbd_led_wk
under asus_ref.lock before notifying userspace, so coalesced work items
emit the clamped state instead of the initial snapshot. Stable trees
need this because negative values break sysfs reporting and make the
brightness hotkeys appear dead until the counter climbs back to zero.

Fixes: 7525566abd360 ("platform/x86: asus-wmi: add keyboard brightness event handler")
Cc: stable@vger.kernel.org
Cc: Antheas Kapenekakis <lkml@antheas.dev>
Signed-off-by: Bartu Alev <bartualev@gmail.com>
---
 drivers/platform/x86/asus-wmi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index b33ebdb21aa21..2478361b9b531 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1807,8 +1807,10 @@ static void kbd_led_update_all(struct work_struct *work)
 	if (value >= 0)
 		do_kbd_led_set(&asus->kbd_led, value);
 	if (notify) {
-		scoped_guard(spinlock_irqsave, &asus_ref.lock)
+		scoped_guard(spinlock_irqsave, &asus_ref.lock) {
 			asus->kbd_led_notify = false;
+			value = asus->kbd_led_wk;
+		}
 		led_classdev_notify_brightness_hw_changed(&asus->kbd_led, value);
 	}
 }
@@ -1961,7 +1963,7 @@ static int kbd_led_set(struct led_classdev *led_cdev, enum led_brightness value)
 static void kbd_led_set_by_kbd(struct asus_wmi *asus, enum led_brightness value)
 {
 	scoped_guard(spinlock_irqsave, &asus_ref.lock) {
-		asus->kbd_led_wk = value;
+		asus->kbd_led_wk = clamp_val(value, 0, ASUS_EV_MAX_BRIGHTNESS);
 		asus->kbd_led_notify = true;
 	}
 	queue_work(asus->led_workqueue, &asus->kbd_led_work);

-- 
2.56.0

