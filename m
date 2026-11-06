Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793989196;
	b=PunX6pluDzMJSIoNQaJ6ENXu+Sh8zNVo44+dXoel0dgIUCSEWfm7I4J8I2cZND2JxfgG
	 n04Jw8wFjoaAie969duC9viEhmT7saaf/H/t6o8xE8wq4QTGvw9TEesWf5KAVO0TGmPil
	 w//Tvq5AwEmj+LpVAn7/wGkQgYoSbSNPKwPhkz2cKAskl5c+C9D6cztTu1QAzVIV3hE3f
	 k/FN3LCY2O5wQeMVbhPpYZsuhayM7m1alCb3a99V/o1yY5Lls916I0UDvOmtHtq6Cs8st
	 EXgA54JW+2BAFUxUIsTy1fNnIZsbfEO9znJO6nuWfcmL1Q8T1tfkd3WWC5g4DCtvJIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793989196;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ePH+hik62Fy6F4AAmE1n6DWeBVlZXhgjc9v7cFTm+1I=;
	b=Kyoj2MpikzUTAORnw1sr1GcPteV1mq9MLl04Wb6ebR4VxtsFpOfXf0Tegu6Pc/V3eYDR
	 hOSug4vBRwnbYpJiYDMI+t7UZc58/H3KE3gP+bxIdQmW1zo8V5lPmz0GZYXnu4jmesPZx
	 DaPvIJ1QTROVF4AkcQ3QaTg3dsZS7JQMLa5uGp/q2gfYdDysS+BmPWBfns6WLMTfe1AMJ
	 ZCk1zJfFo1nEwIw+Usd7+krCobFmvV7e0Yl8YFwvM102jQ+UC1tJnrW4ZOoL7UYcL9EqM
	 CeNHgKYgZu26SjRIpqXTxSOd9LWihKuEtKbnrVXjGKFVR4p2zsSliEwNaUMbn1m5LtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X7lR27Rb;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3733D606A32E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:19:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3733D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X7lR27Rb
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-370a1bc464cso550361eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793989194; x=1794593994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ePH+hik62Fy6F4AAmE1n6DWeBVlZXhgjc9v7cFTm+1I=;
        b=X7lR27RbrxzayAIqAKtxrfjf53P0bbpYAmfW+QVcAshLVcuM4RBj69px8H/k8CSjsm
         Hi41EFcJE3XccnMUwcmsv/Qq5V/R2F1dc3X2FynpaQXVSAHmwOitYgskIterANLTBb1G
         cZq2+ewPwPG3aZmQstNuutoWF2nCQfBUUYAK2aVBYT7eNrsjOdpm3EHebbwkOShfxHBn
         VA2W3Xx5NYz8untfcuBIhr7eM5pkbpaeaXOxljElRXWT17TfMmLtbfUW1dW5H99cKb3J
         yfwGvemvWV1RDWr6Jli0dtYrVq6PyzIk8i96SzMf3hZOPp58V3Vdxck7Y6ZCaOA3Lrmv
         ulBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793989194; x=1794593994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ePH+hik62Fy6F4AAmE1n6DWeBVlZXhgjc9v7cFTm+1I=;
        b=z+aNMGfE/Zq0/f3AchTIbI6dVwxILwriRmLabA4k5eYBqNMfROuPtusbCYg1o/zVkH
         yukDLCGqYx5htVgTxGw7JxpNoB+ohK+4aN7/r/1fflH2QkLGFMu2mDGo54NPteqvruxU
         1cXNJIcrI0hf18PPHigDn8ElEU7ISx261PSjcLysXoPAVvKAJ8AHrflu12cIn5dr+aqc
         N53OTkVIFHnDNPc0lb4RAdszDw4JNlcmiF+OsLEjtIgSQzG9kgNDQo/ojfc8TU4dlY8w
         4nGu+l+Pm/pUHwkP+PEqI0oym+zYzBcmP2CDXSd0adec89gDu7HGhR7GlHa690qEYk8r
         Ksrg==
X-Forwarded-Encrypted: i=1; AL+hErGzJ14wNAZzjfJiA23cNkj2i7ZS4tfb2nUXVkXTlNceI60rjVdz2XXDWNbT6pIUlewKexkuuXxjioOlByY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oxF4S83Mx5nxObn8TLXlN+Qlj2I9aRYmGAwajLzxOfEjlE6Ve
	Rep0anhSE9yJuQHKKLAwunkkRvCdQnzPIbyCpwk1KZg0gwxeskQrsLte
X-Gm-Gg: AYBFou1VsYwdd4q38J9DMmmIHpnx73wWR73ntTXQ45eJf9Jh0uoe/HVgf/GR6MqBZ2h
	3HWmII72TQY3I84dzk1mtknyWQQ3d0tzxB4SoMQc43eAM6W6BNIlnneLQQaudhjJq3/+KFg7bPN
	/saZesX4SORI+TKyo6Wztkpf1tFLlNoBuJVZ7+LWnMyYDysitzZOohDXWnGgGlYCRjW++O6plMM
	Yqiy4As9I3HftH4MRJyXJkprRQS60VOYM1FmN4eVZbwrJQprQJwCoVWMmgdUvCyIgPkpzrsT+8D
	v4Ku7O9UsAtlfVquZHJ3SGTRE73cea36gQlNrVmgctBtUBawD+009etzDHcti3ZnryfG1y1VCmz
	auZpmTWGXU5dgpzkaTnQEjyc6RCD//H0Kb0BhNSypbB/YGiJD4n/Sq2dpx+MQtTZI5/wp1+tHLX
	Ap+rPH7z1pzwvMdoMU7rNKZQbHkHw7+FJjCeZr3PyQw+ZahD+enmZrsnqmTu9dA9Ac4qfi/qvrt
	+bS8u54q9dVI9M3v+Lf8pGrXX3nOBNhrQalerm5U4tn+0KpdVvUuwEo0Pkw8yrRgvdpXtnnrvPa
	/PmmGZ8udVtVkUTt3a10MlE3GePWvcx4+orHbvtwwmtqLfTXbg1Wd0HyQll66Ukhqqwsy4Xkhnu
	Ke0IM1JPtFfFKCd5eWjY1pSbfd92xM95XLHnTb3LBbK5nvy4BILP20ULqfbJFrlY4QbQ0QNV3df
	ldqeSb2u79MjuGkgL7JTVMjGyI+wMAGx02x59u5reV1J5NWjwpTg==
X-Received: by 2002:a05:693c:2a0b:b0:36d:d7ec:5e3d with SMTP id 5a478bee46e88-36f772f8940mr4302147eec.21.1793989194075;
        Fri, 06 Nov 2026 10:19:54 -0800 (PST)
Received: from zbook-HP-ZBook-Firefly-14-inch-G8-Mobile-Workstation-PC.. ([49.207.55.157])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faa6a649csm8241901eec.26.2026.11.06.10.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 10:19:53 -0800 (PST)
From: Payal Lenka <payalm.lenka@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	chenchangcheng@kylinos.cn,
	Payal Lenka <payalm.lenka@gmail.com>,
	syzbot+f8fb5598924c7e645553@syzkaller.appspotmail.com
Subject: [PATCH] HID: corsair: cancel the LED work again after unregistering the LED
Date: Fri,  6 Nov 2026 23:49:44 +0530
Message-ID: <20261106181944.2535082-1-payalm.lenka@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Commit eb51c9f8cb4f ("HID: corsair: cancel worker before unregistering
LED to fix use-after-free") cancels the LED work before calling
led_classdev_unregister(). But unless LED_RETAIN_AT_SHUTDOWN is set,
led_classdev_unregister() turns the LED off, and k90_brightness_set()
then queues the work again. The k90_led holding that work is freed right
after, with the work still queued. The removed flag does not help, as
the worker would read it from the freed memory.

This is caught by debugobjects when a device is disconnected:

  ODEBUG: free active (active state 0) object: 0000000097898442
    object type: work_struct hint: k90_record_led_work+0x0/0x1e0
  WARNING: lib/debugobjects.c:629 at debug_print_object+0x189/0x2a0

Cancel the work a second time after unregistering the LED, in both
k90_cleanup_backlight() and k90_cleanup_macro_functions(). The first
cancel stays, as it keeps a running worker from using led->cdev.dev while
the LED is unregistered.

The root cause analysis and this patch were prepared with the help of the
Claude Opus 5.5 coding assistant.

Fixes: eb51c9f8cb4f ("HID: corsair: cancel worker before unregistering LED to fix use-after-free")
Reported-by: syzbot+f8fb5598924c7e645553@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=f8fb5598924c7e645553
Cc: stable@vger.kernel.org
Signed-off-by: Payal Lenka <payalm.lenka@gmail.com>
---
Tested in QEMU (x86_64, KASAN, DEBUG_OBJECTS_WORK and DEBUG_OBJECTS_FREE)
with a C reproducer from the syzbot report, 120 seconds per run:

  no fix:                     warnings for both work items
  this patch:                 no warnings over 124 disconnects
  only the backlight cancel:  warnings for k90_record_led_work
  only the record LED cancel: warnings for k90_backlight_work

The reproducer does not exercise the race fixed by eb51c9f8cb4f, so that
is not tested here; the first cancel is kept for it. Not tested on real
K90 hardware.

 drivers/hid/hid-corsair.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hid/hid-corsair.c b/drivers/hid/hid-corsair.c
index 278c6efb5..7e5ff3d52 100644
--- a/drivers/hid/hid-corsair.c
+++ b/drivers/hid/hid-corsair.c
@@ -526,6 +526,8 @@ static void k90_cleanup_backlight(struct hid_device *dev)
 		drvdata->backlight->removed = true;
 		cancel_work_sync(&drvdata->backlight->work);
 		led_classdev_unregister(&drvdata->backlight->cdev);
+		/* Unregistering turns the LED off, which queues the work again */
+		cancel_work_sync(&drvdata->backlight->work);
 		kfree(drvdata->backlight->cdev.name);
 		kfree(drvdata->backlight);
 	}
@@ -542,6 +544,8 @@ static void k90_cleanup_macro_functions(struct hid_device *dev)
 		k90->record_led.removed = true;
 		cancel_work_sync(&k90->record_led.work);
 		led_classdev_unregister(&k90->record_led.cdev);
+		/* Unregistering turns the LED off, which queues the work again */
+		cancel_work_sync(&k90->record_led.work);
 		kfree(k90->record_led.cdev.name);
 
 		kfree(k90);
-- 
2.43.0

