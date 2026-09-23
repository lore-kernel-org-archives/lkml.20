Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83EA4ADD9B
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790164744; cv=none; b=Hja0lVbWC/o9rijgpRQMglrMiJhQQBuSXX1h6cAHpxyJE+Q+bZFpuAAL49ltEr0tvbIL5BJ0+fb6ePeUenXXVRWwqnoJjQ5ZaeHkbaLV4/p2rEx1CE1GeOLwJfdJ9efzk+quQjAxHen2sJVsY4DXEGoYEOp+3u5LMMd4rJ1lPGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790164744; c=relaxed/simple;
	bh=KD5UKoJaOq3FT40v3/WBlUvawNQHI1nDshyUaAxqyEw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kLBTdg7VVysR+GUrMw5V3vfn4Gh1JjbM2+vMiBVpIMB7fdBCZC8ZbdU+Zx8Kg/iCRYi0OBw8GzAWfnsgMluSaeGfXmqDdSR8lviHbxQAjIBjgIWeLCI34GmMzOwKvuHP82k0XgK3vgsIC/73xw1hfdOg53TZ4P+vCEppeBk1J/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXhewbrj; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXhewbrj"
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c67e512ee6so324712e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790164737; x=1790769537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oU/hNcBHQpDscJy30gAuiISdS9B0i44/hUOZz7OtGDM=;
        b=BXhewbrjJuAcGZKGaUor9tyUDnkKAN8KIY24hW2yAdptutOBQxEewPnoU+PE0n8maB
         ECKLsMx+jzzfdj3Gpnm8bTfn4FY0rpoVgQwlHq84DQS/nrKC84F0h9Y5cvp0ERFDgoPE
         HLZf3pcmUei6yWqsZXXVMXBZT+9W9WbbnDFEboZOGut1kdk7TWk2XCweZCNoT4UM14K+
         IMs5mxTI309+fH6gd+Wcvn33fc3SmRg20iLqJguvdcp3IhAVKYg3ConcfOyT7NOinpj3
         A4MAmRCvKnHVVq3rQSpXvrmW5NHmRJ55FRr81oVpjdfyvMYjMn4DWhccCTbsymsYJ7r/
         LYyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790164737; x=1790769537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oU/hNcBHQpDscJy30gAuiISdS9B0i44/hUOZz7OtGDM=;
        b=b+UGH/baEwiEt1Fakrm7ZWBEMKWtTM8ux/VmxnCtU1fe14FIQWfVRTu0Gd4M4TUeFr
         C0ebwIn+Jmg2xD4gVsKurPf5iDgVlco1c+/2Hb/sDT3xTXLSyEn+EYuAFgHm8Dxic1qW
         n++uJihrF+hRLtgVl+uMHQDuW5M7ZL2eq/edpkCcJiZTMSBW97sy+yCyxJPYoPxp8wyY
         /JTz6/GYS95/E3s+QDZ9kBpRtCN+nbb3q4nUxXg1TufijwDsoGlmtFkaECyzIjAp8QnW
         lqlEqE8QpJgNu7E0oBCvOZ6Arjrok5xgyIDMQsZHNZIsmwUs5zu4wTmr6W97cIhtHjt8
         NSWA==
X-Forwarded-Encrypted: i=1; AKwUvBx69ma6yKSJIfh9gXF3ODZxllkkDxQTmuG18WE/uanRBJFJD1DOTm+4AfpbQ24I9bgILw4pwdQZpDDTc6w=@vger.kernel.org
X-Gm-Message-State: AFuF++ng4cSmWtBMySLP6HTHEIrWbxzuvSlEv1oDd32JDyTHLq5tS3Z9
	2YIihzbdfOq9OZT2UiYLkLpnQ5sIRSd8tNZncMsfnpNPLv8vtt/zVdnQ
X-Gm-Gg: AYBFou2SImXlkFkxR6vHh+ciugZNn5jrBAk+RbCufVY3Zhsztw/zjlx5qQAOVrVD4zI
	X8wypTtEPQ/OcJRwjVccXhonvYx7swi4gfNs7WwJnLrg5zeN8SOh+hUcx35pyWYJ39qErCElSn6
	9gyilXN+kYOAEYwFMP/T0JTxVIJUQVzh9qRALEVaMhO24P65thnb87nuzkpgLuIL8Db61uK1SC+
	zNk/gTG9ex6fzlSu6HmumvnEccFhW53I+PiNpbfRDuCk6CobUjzBOeGRJou+Fz3CU6jSwV6rssg
	syoTtmMRqqyn3WPhlA04VF73ZT+e1KYaDmeb4kUxv7jI96mGxNWay5k+ED095367TzU6eA48Wc8
	5l2QReOzbWbEhjEIJ+xEEVjCB4SsbYWrijRKRK07vrOLZpXpJhU97mGra9X4+352gKci2Wwsa00
	gLlYyHiLaBEahFvn402qBnYwKTd7uAFVnIQGNqav8dmIwj9zktMc7rCZAW/m25Vhc=
X-Received: by 2002:a05:6102:290b:b0:7a7:198a:c2c5 with SMTP id ada2fe7eead31-7ac1ea9459cmr2190879137.35.1790164736650;
        Wed, 23 Sep 2026 04:58:56 -0700 (PDT)
Received: from beelink.. ([187.13.30.172])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98516ab3fbasm3311403241.11.2026.09.23.04.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:58:56 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>,
	Sashiko AI review <sashiko-bot@kernel.org>
Subject: [PATCH RESEND] HID: multitouch: stop the release timer from being rearmed on remove
Date: Wed, 23 Sep 2026 08:58:47 -0300
Message-ID: <20260923115847.3396019-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mt_remove() quiesces the sticky-finger timer before stopping the
hardware:

    timer_delete_sync(&td->release_timer);

    sysfs_remove_group(&hdev->dev.kobj, &mt_attribute_group);
    hid_hw_stop(hdev);

timer_delete_sync() waits for a running callback and dequeues the timer,
but it does not stop the timer from being armed again. The transport is
still delivering reports at that point, and the report path rearms it:

    if (app->quirks & MT_QUIRK_STICKY_FINGERS) {
        if (td->mt_io_flags & MT_IO_SLOTS_MASK)
            mod_timer(&td->release_timer,
                      jiffies + msecs_to_jiffies(100));

A report that arrives after timer_delete_sync() has returned therefore
leaves the timer queued. td is allocated with devm_kzalloc() against
hdev->dev, so it is freed when the driver is unbound, after mt_remove()
returns. When the timer fires afterwards, mt_expired_timeout()
dereferences the freed td:

    struct mt_device *td = timer_container_of(td, t, release_timer);
    struct hid_device *hdev = td->hdev;

    if (test_and_set_bit_lock(MT_IO_FLAGS_RUNNING, &td->mt_io_flags))

Simply moving the teardown after hid_hw_stop() does not fix this on its
own, because mt_expired_timeout() calls mt_release_contacts(), which
walks hdev->inputs; the timer still has to be quiesced before
hid_hw_stop() tears the input devices down.

Use timer_shutdown_sync() instead, which additionally makes any later
mod_timer() a no-op, so neither ordering constraint has to be traded off
against the other. This is the final-teardown pattern the function was
introduced for, and hid-wiimote already uses it for the same reason.

Fixes: 4f4001bc76fd ("HID: multitouch: fix rare Win 8 cases when the touch up event gets missing")
Cc: stable@vger.kernel.org
Reported-by: Sashiko AI review <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260723224211.613112-1-you@example.com?part=1
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Reviewed-by: Benjamin Tissoires <bentiss@kernel.org>
---
Found by code inspection after Sashiko AI review flagged the teardown
ordering while reviewing an unrelated patch of mine. I have not
reproduced the use-after-free at runtime: it needs a report to land in
the window between timer_delete_sync() returning and the device being
unbound, which I have no way to drive reliably on the hardware I have.
The window and the rearm path are visible in the code, and the fix does
not depend on the race being hit.

 drivers/hid/hid-multitouch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 0495152091e3..f25065b9ec66 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -2233,7 +2233,7 @@ static void mt_remove(struct hid_device *hdev)
 {
 	struct mt_device *td = hid_get_drvdata(hdev);
 
-	timer_delete_sync(&td->release_timer);
+	timer_shutdown_sync(&td->release_timer);
 
 	sysfs_remove_group(&hdev->dev.kobj, &mt_attribute_group);
 	hid_hw_stop(hdev);
-- 
2.43.0

