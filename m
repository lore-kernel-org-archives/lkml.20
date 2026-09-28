Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com [209.85.167.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4148349DBBF
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.194
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790612255; cv=pass; b=hvudJTPU8CtP6Uky+UAIGd8zsBGQMVCGlAQH0aeMUVVy+kaqhzPRFh9egLkP+HCREk3ra7rFxNujFqtMrUYMtMAtq+csGD2Ubi7NLmved8i5QNKXAB8XKEwvJm/0sLoz3VZfl5MvLVmUuz3AkcOKSZDjSIwWfKg2FsjiuRuX0I8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790612255; c=relaxed/simple;
	bh=oXSq8NvwD8TFRtGb38Zv7EYc0cxfpe/N+yat0VOsE8U=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T8nEVI66RwCinqauC7vU3A63z4pBlLJuD/8obhusXsJBoDDcxpBoIM5NwH7PJW5d5yfHQk4R2vaZmrZRYlKrU+txiNkPAgdnHTDdU2Utd2dWMhZShTDLSW4jHoEonHedNNCsZr1vLi4hg0fde4vm64TTEpXwyzT5qdaIS/v4J8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dalLcIhX; arc=pass smtp.client-ip=209.85.167.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dalLcIhX"
Received: by mail-oi1-f194.google.com with SMTP id 5614622812f47-4b28d9537bcso9260b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:17:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790612251; cv=none;
        d=google.com; s=arc-20260327;
        b=WM1ctsma7BSt2mcbjv/1kA3Tr/a9o/Jz3wublXWDboFOOOspqr3hr85wbFcQeU2wwJ
         w3tYDyOT9dEVA/iqK7ouZ5Iw/oT+VW4EPfNaH02nLaHLI9gguOiaAfoGDiVJUnFGjBjE
         HW4hPRRlrOrzVfo0cXQ2ClSaS4HjREKUZiQYPi07vaCbfSlBKG5S97MK+qky4kDSqU4J
         w9eFlLWf655WDZ4hyZteVAB8lH33tu7I/UXGcED0Vpc5wtSl0jR4gtqMtoFD51SpDvhS
         rZ7/OXDFyF78cs3CIEKIBdEYmmIxVEefEkK339p+G22oPSdPkqbMPNn6IeHaMTSSem1f
         QAmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=bXF5Uz5yz1uudMQPrL1eUvis/5EpTwqej4J8FH37xO8=;
        fh=v4sNbHMFvm+vcBHeMVPeztwxcasC5U3cVG0g4D5qQhE=;
        b=ojbY1+KMYgh7KLEb5aZTKHbL1qF0rGI6ZaPfWWX/jfMv+RaxuUAhWGefnCKNmmYWV2
         buRn14fXkppumXKBzW/mQ+xopb98xz8xDZBCB6JfitUuFgGNnnD59CTeocNourTwT5s7
         z0ovw0NBFZpbio3CU/yLNwsSpLxsFkGTBhAxFOIGPgenSmvKZPKisYGe1DVl4FN/yeye
         RGgMbbYx9fO6ADIZBAZ3EAketWjs5SngEFbNT4ZFimzQu2z9pyPFh1v+7q3Kl/DAdbOK
         dK68f6EsgO20asoDKV/reB+lr/zz2jfZ+xk6yeKi9qTDB14itEo4LDtX2c4sbKihrVGe
         mp9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790612251; x=1791217051; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bXF5Uz5yz1uudMQPrL1eUvis/5EpTwqej4J8FH37xO8=;
        b=dalLcIhXwFP8bGj8mJt27fw7i8WXP3vS6e9UJBPMnC9OQsONmWRsu3Sr6dpQqq0iD3
         1yd97ErtFaVwLLMPKVi2CtS87Zkl3IKzUU0h3F07KAOFUQy/fU/UBkIV/Vu56HTgvijh
         Ez9BuyChp3g3emONxcS5h8sFoJrnE3xtaWglFzorERSIukEp+6u2gn9UX0G2VVlI5NmU
         UAFKBtlsqUA4MGSMFpRQXZwor699edIY06INpdQytRJ6o1oC7n7zDQY7IliBjwPk7XRq
         bQ1UD5hEcQ06y8axDhi610xHjKAjGAcP6LPkOR2Bi75gmhjy5J/zatW+W5TMi3c9LZ6C
         YppQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790612251; x=1791217051;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bXF5Uz5yz1uudMQPrL1eUvis/5EpTwqej4J8FH37xO8=;
        b=aTQFrOicRoJjz3+rPUGysyKD+hMmoZjjfVu12mKqyk26SqKGzWgcPzx8BaN5B03Z1j
         QxhEFsYFbzhQHCtXZUbHQ2cgb33Hvd4tdO7KiYawIS8kRKgpUb244IJ2bdSxWTjb4QYC
         UhOldIbHJmbvFUeL7OItgYdYc0iD2bOXgqNiJEY8sW9KsLaqZNR+6lY1g3ruYn2xrHM6
         j0OvLsy/b7x5wMCho2h2kz4A6P15YgiZ7DXRe52huqomLQhjtl+iHNtgZ12tRv8Z3GHG
         /iQ711raDUfKX2xgbUEr8y0APrDK6HVIRHZTXZapQG5SyWvdNZco0MWcYlvMYFXzYgd0
         d+MA==
X-Forwarded-Encrypted: i=1; AKwUvBxU8cztIlZI7BG93ivTWDw7U+6Z36pV2ZnhzY6qOuURdJ0iLNOGHsY46JlzrK/CzbX6zJo+pfm1bvtAY5Y=@vger.kernel.org
X-Gm-Message-State: AFuF++mk1fso05HNDSr0xyyB36i8R/Qed0j+DXYy1JtiSa8FQ4J+i6Ov
	IZViszqi/6UKljIEhSWWwZkbbq/slWYNoxfcNyiBmW4FDJA8I9r+AcXk7CQftMJLKgvX5Twpj9d
	Kv7k8Sv6vec3dYZXWvj2hrsr24vvldOc=
X-Gm-Gg: AYBFou0Eo1lYP8BjnbewbbpBPrHg3aEYqxs0cdh8zD1as7JX4RrLBgMj8XxDn16zScu
	FmBQi/EPwG0O5p+MoJjvYTpbJYjRhJkKEdWn5PnuQiNwHEi0+HxX/zAMzlK7XNQwkmer63v/VT0
	sk5ZAKYOncAvNwQijFfEyBjQVE/MrI4UkELYxLo96+RnxygnfCVSiaBHai6c+Qy2i/TrWXJON5f
	e3w+5j1Gw6lmmG6SYxaLclkLzhk9LiUQ7P8A94k2osLSy1HJ43vsg4Vked5WTduaRI95maG5kvP
	GnCRNrFm8x8IR8UjPQ0G6iQvC3ChsLSojeS7MISYr+4Vo/PawmDwoIogXUhZZ29bNpgg6Bl+Ygz
	qxwEadolEDZthCWKG8+DswSI=
X-Received: by 2002:a05:6808:344b:b0:4b2:8d83:436e with SMTP id
 5614622812f47-4d72a34c59cmr10018031b6e.8.1790612250938; Mon, 28 Sep 2026
 09:17:30 -0700 (PDT)
Received: from 578479312649 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Sep 2026 18:17:30 +0200
Received: from 578479312649 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Sep 2026 18:17:30 +0200
From: Aveline Noir <jm5905938@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CANOyQmGfmBdTRaEamVdGuMBToVLeXGi6qLrnX=xkA9acsL9TSQ@mail.gmail.com>
References: <CANOyQmGfmBdTRaEamVdGuMBToVLeXGi6qLrnX=xkA9acsL9TSQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 28 Sep 2026 18:17:30 +0200
X-Gm-Features: AclHuK9ZvUaDhULmks0vzgRrwna1GnhXZGGFWZdsiepnBB6uTZR6ybgRmQVeUeY
Message-ID: <CANOyQmELtcxZJRsmBF_tWkMvNYKS3y26DafWeS9102pqdZa+4A@mail.gmail.com>
Subject: [PATCH v2 1/2] HID: picolcd: Move output requests out of spinlocked sections
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+912222e4cb82423535fa@syzkaller.appspotmail.com, bigeasy@linutronix.de, 
	linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Creating a PicoLCD through UHID triggers a sleeping-in-invalid-context
warning in picolcd_set_contrast(). The driver calls hid_hw_request()
while holding picolcd_data::lock, which is a spinlock_t.
hid_hw_request() can allocate with GFP_KERNEL and wait for a reply
through __hid_request(), so it must not be called from this spinlocked
section. The same pattern exists in the other output paths.

Serialize output report updates and requests with a separate mutex.
Keep the spinlock for status and pending replies shared with raw_event(),
and drop it before submitting requests. Serialize the failed-state
transition with output requests during removal.

Use the blocking LED callback and protect LED state updates with the
report mutex. Move framebuffer reset outside fbdata->lock so the new
mutex is never acquired under that spinlock.

In a PREEMPT_RT QEMU guest, the original syzkaller reproducer triggered
six sleep warnings with the baseline module and none with this change
during a four-second run (214 iterations). Five rounds each of concurrent
LCD, backlight, two LED and UHID destroy operations, with and without
persistent-open framebuffer writes, completed without BUG/WARNING.
Physical hardware and suspend/resume have not been tested.

Fixes: d881427253da ("HID: use hid_hw_request() instead of direct call
to usbhid")
Reported-by: syzbot+912222e4cb82423535fa@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=912222e4cb82423535fa
Signed-off-by: Aveline Noir <jm5905938@gmail.com>
---
 drivers/hid/hid-picolcd.h           |  2 ++
 drivers/hid/hid-picolcd_backlight.c |  7 ++---
 drivers/hid/hid-picolcd_core.c      | 46 +++++++++++++++++++----------
 drivers/hid/hid-picolcd_fb.c        | 23 ++++++++-------
 drivers/hid/hid-picolcd_lcd.c       |  7 ++---
 drivers/hid/hid-picolcd_leds.c      | 31 +++++++++++--------
 6 files changed, 69 insertions(+), 47 deletions(-)

diff --git a/drivers/hid/hid-picolcd.h b/drivers/hid/hid-picolcd.h
index 57c9d0a675..846a8ceb95 100644
--- a/drivers/hid/hid-picolcd.h
+++ b/drivers/hid/hid-picolcd.h
@@ -102,6 +102,8 @@ struct picolcd_data {
 	/* Housekeeping stuff */
 	spinlock_t lock;
 	struct mutex mutex;
+	/* Serialize updates to output reports and their HID requests. */
+	struct mutex report_mutex;
 	struct picolcd_pending *pending;
 	int status;
 #define PICOLCD_BOOTLOADER 1
diff --git a/drivers/hid/hid-picolcd_backlight.c
b/drivers/hid/hid-picolcd_backlight.c
index 4b43b64537..9fe27437d2 100644
--- a/drivers/hid/hid-picolcd_backlight.c
+++ b/drivers/hid/hid-picolcd_backlight.c
@@ -23,19 +23,18 @@ static int picolcd_set_brightness(struct
backlight_device *bdev)
 {
 	struct picolcd_data *data = bl_get_data(bdev);
 	struct hid_report *report = picolcd_out_report(REPORT_BRIGHTNESS, data->hdev);
-	unsigned long flags;

 	if (!report || report->maxfield != 1 || report->field[0]->report_count != 1)
 		return -ENODEV;

+	mutex_lock(&data->report_mutex);
 	data->lcd_brightness = bdev->props.brightness & 0x0ff;
 	data->lcd_power      = bdev->props.power;
-	spin_lock_irqsave(&data->lock, flags);
 	hid_set_field(report->field[0], 0,
 		      data->lcd_power == BACKLIGHT_POWER_ON ? data->lcd_brightness : 0);
-	if (!(data->status & PICOLCD_FAILED))
+	if (!(READ_ONCE(data->status) & PICOLCD_FAILED))
 		hid_hw_request(data->hdev, report, HID_REQ_SET_REPORT);
-	spin_unlock_irqrestore(&data->lock, flags);
+	mutex_unlock(&data->report_mutex);
 	return 0;
 }

diff --git a/drivers/hid/hid-picolcd_core.c b/drivers/hid/hid-picolcd_core.c
index d73e97c8b8..9d6bf75aba 100644
--- a/drivers/hid/hid-picolcd_core.c
+++ b/drivers/hid/hid-picolcd_core.c
@@ -77,7 +77,7 @@ struct picolcd_pending *picolcd_send_and_wait(struct
hid_device *hdev,

 	if (!report || !data)
 		return NULL;
-	if (data->status & PICOLCD_FAILED)
+	if (READ_ONCE(data->status) & PICOLCD_FAILED)
 		return NULL;
 	work = kzalloc_obj(*work);
 	if (!work)
@@ -89,23 +89,27 @@ struct picolcd_pending
*picolcd_send_and_wait(struct hid_device *hdev,
 	work->raw_size   = 0;

 	mutex_lock(&data->mutex);
-	spin_lock_irqsave(&data->lock, flags);
+	mutex_lock(&data->report_mutex);
 	for (i = k = 0; i < report->maxfield; i++)
 		for (j = 0; j < report->field[i]->report_count; j++) {
 			hid_set_field(report->field[i], j, k < size ? raw_data[k] : 0);
 			k++;
 		}
+	spin_lock_irqsave(&data->lock, flags);
 	if (data->status & PICOLCD_FAILED) {
-		kfree(work);
-		work = NULL;
-	} else {
-		data->pending = work;
-		hid_hw_request(data->hdev, report, HID_REQ_SET_REPORT);
 		spin_unlock_irqrestore(&data->lock, flags);
-		wait_for_completion_interruptible_timeout(&work->ready, HZ*2);
-		spin_lock_irqsave(&data->lock, flags);
-		data->pending = NULL;
+		mutex_unlock(&data->report_mutex);
+		mutex_unlock(&data->mutex);
+		kfree(work);
+		return NULL;
 	}
+	data->pending = work;
+	spin_unlock_irqrestore(&data->lock, flags);
+	hid_hw_request(data->hdev, report, HID_REQ_SET_REPORT);
+	mutex_unlock(&data->report_mutex);
+	wait_for_completion_interruptible_timeout(&work->ready, HZ*2);
+	spin_lock_irqsave(&data->lock, flags);
+	data->pending = NULL;
 	spin_unlock_irqrestore(&data->lock, flags);
 	mutex_unlock(&data->mutex);
 	return work;
@@ -224,18 +228,21 @@ int picolcd_reset(struct hid_device *hdev)
 	if (!data || !report || report->maxfield != 1)
 		return -ENODEV;

+	mutex_lock(&data->report_mutex);
 	spin_lock_irqsave(&data->lock, flags);
 	if (hdev->product == USB_DEVICE_ID_PICOLCD_BOOTLOADER)
 		data->status |= PICOLCD_BOOTLOADER;

-	/* perform the reset */
-	hid_set_field(report->field[0], 0, 1);
 	if (data->status & PICOLCD_FAILED) {
 		spin_unlock_irqrestore(&data->lock, flags);
+		mutex_unlock(&data->report_mutex);
 		return -ENODEV;
 	}
-	hid_hw_request(hdev, report, HID_REQ_SET_REPORT);
 	spin_unlock_irqrestore(&data->lock, flags);
+	/* perform the reset */
+	hid_set_field(report->field[0], 0, 1);
+	hid_hw_request(hdev, report, HID_REQ_SET_REPORT);
+	mutex_unlock(&data->report_mutex);

 	error = picolcd_check_version(hdev);
 	if (error)
@@ -268,7 +275,6 @@ static ssize_t picolcd_operation_mode_store(struct
device *dev,
 	struct picolcd_data *data = dev_get_drvdata(dev);
 	struct hid_report *report = NULL;
 	int timeout = data->opmode_delay;
-	unsigned long flags;

 	if (sysfs_streq(buf, "lcd")) {
 		if (data->status & PICOLCD_BOOTLOADER)
@@ -283,11 +289,15 @@ static ssize_t
picolcd_operation_mode_store(struct device *dev,
 	if (!report || report->maxfield != 1)
 		return -EINVAL;

-	spin_lock_irqsave(&data->lock, flags);
+	mutex_lock(&data->report_mutex);
+	if (READ_ONCE(data->status) & PICOLCD_FAILED) {
+		mutex_unlock(&data->report_mutex);
+		return -ENODEV;
+	}
 	hid_set_field(report->field[0], 0, timeout & 0xff);
 	hid_set_field(report->field[0], 1, (timeout >> 8) & 0xff);
 	hid_hw_request(data->hdev, report, HID_REQ_SET_REPORT);
-	spin_unlock_irqrestore(&data->lock, flags);
+	mutex_unlock(&data->report_mutex);
 	return count;
 }

@@ -537,6 +547,7 @@ static int picolcd_probe(struct hid_device *hdev,

 	spin_lock_init(&data->lock);
 	mutex_init(&data->mutex);
+	mutex_init(&data->report_mutex);
 	data->hdev = hdev;
 	data->opmode_delay = 5000;
 	if (hdev->product == USB_DEVICE_ID_PICOLCD_BOOTLOADER)
@@ -603,9 +614,11 @@ static void picolcd_remove(struct hid_device *hdev)
 	unsigned long flags;

 	dbg_hid(PICOLCD_NAME " hardware remove...\n");
+	mutex_lock(&data->report_mutex);
 	spin_lock_irqsave(&data->lock, flags);
 	data->status |= PICOLCD_FAILED;
 	spin_unlock_irqrestore(&data->lock, flags);
+	mutex_unlock(&data->report_mutex);

 	picolcd_exit_devfs(data);
 	device_remove_file(&hdev->dev, &dev_attr_operation_mode);
@@ -630,6 +643,7 @@ static void picolcd_remove(struct hid_device *hdev)
 	picolcd_exit_keys(data);

 	mutex_destroy(&data->mutex);
+	mutex_destroy(&data->report_mutex);
 	/* Finally, clean up the picolcd data itself */
 	kfree(data);
 }
diff --git a/drivers/hid/hid-picolcd_fb.c b/drivers/hid/hid-picolcd_fb.c
index 8c28e982e0..c17104fd60 100644
--- a/drivers/hid/hid-picolcd_fb.c
+++ b/drivers/hid/hid-picolcd_fb.c
@@ -91,7 +91,6 @@ static int picolcd_fb_send_tile(struct picolcd_data
*data, u8 *vbitmap,
 		int chip, int tile)
 {
 	struct hid_report *report1, *report2;
-	unsigned long flags;
 	u8 *tdata;
 	int i;

@@ -102,9 +101,9 @@ static int picolcd_fb_send_tile(struct
picolcd_data *data, u8 *vbitmap,
 	if (!report2 || report2->maxfield != 1)
 		return -ENODEV;

-	spin_lock_irqsave(&data->lock, flags);
-	if ((data->status & PICOLCD_FAILED)) {
-		spin_unlock_irqrestore(&data->lock, flags);
+	mutex_lock(&data->report_mutex);
+	if (READ_ONCE(data->status) & PICOLCD_FAILED) {
+		mutex_unlock(&data->report_mutex);
 		return -ENODEV;
 	}
 	hid_set_field(report1->field[0],  0, chip << 2);
@@ -133,7 +132,7 @@ static int picolcd_fb_send_tile(struct
picolcd_data *data, u8 *vbitmap,

 	hid_hw_request(data->hdev, report1, HID_REQ_SET_REPORT);
 	hid_hw_request(data->hdev, report2, HID_REQ_SET_REPORT);
-	spin_unlock_irqrestore(&data->lock, flags);
+	mutex_unlock(&data->report_mutex);
 	return 0;
 }

@@ -187,13 +186,16 @@ int picolcd_fb_reset(struct picolcd_data *data, int clear)
 	struct hid_report *report = picolcd_out_report(REPORT_LCD_CMD, data->hdev);
 	struct picolcd_fb_data *fbdata = data->fb_info->par;
 	int i, j;
-	unsigned long flags;
 	static const u8 mapcmd[8] = { 0x00, 0x02, 0x00, 0x64, 0x3f, 0x00,
0x64, 0xc0 };

 	if (!report || report->maxfield != 1)
 		return -ENODEV;

-	spin_lock_irqsave(&data->lock, flags);
+	mutex_lock(&data->report_mutex);
+	if (READ_ONCE(data->status) & PICOLCD_FAILED) {
+		mutex_unlock(&data->report_mutex);
+		return -ENODEV;
+	}
 	for (i = 0; i < 4; i++) {
 		for (j = 0; j < report->field[0]->maxusage; j++)
 			if (j == 0)
@@ -204,7 +206,7 @@ int picolcd_fb_reset(struct picolcd_data *data, int clear)
 				hid_set_field(report->field[0], j, 0);
 		hid_hw_request(data->hdev, report, HID_REQ_SET_REPORT);
 	}
-	spin_unlock_irqrestore(&data->lock, flags);
+	mutex_unlock(&data->report_mutex);

 	if (clear) {
 		memset(fbdata->vbitmap, 0, PICOLCDFB_SIZE);
@@ -232,9 +234,10 @@ static void picolcd_fb_update(struct fb_info *info)
 	mutex_lock(&info->lock);

 	spin_lock_irqsave(&fbdata->lock, flags);
-	if (!fbdata->ready && fbdata->picolcd)
-		picolcd_fb_reset(fbdata->picolcd, 0);
+	data = !fbdata->ready ? fbdata->picolcd : NULL;
 	spin_unlock_irqrestore(&fbdata->lock, flags);
+	if (data)
+		picolcd_fb_reset(data, 0);

 	/*
 	 * Translate the framebuffer into the format needed by the PicoLCD.
diff --git a/drivers/hid/hid-picolcd_lcd.c b/drivers/hid/hid-picolcd_lcd.c
index 318f19eac0..a1fdbfdfde 100644
--- a/drivers/hid/hid-picolcd_lcd.c
+++ b/drivers/hid/hid-picolcd_lcd.c
@@ -27,17 +27,16 @@ static int picolcd_set_contrast(struct lcd_device
*ldev, int contrast)
 {
 	struct picolcd_data *data = lcd_get_data(ldev);
 	struct hid_report *report = picolcd_out_report(REPORT_CONTRAST, data->hdev);
-	unsigned long flags;

 	if (!report || report->maxfield != 1 || report->field[0]->report_count != 1)
 		return -ENODEV;

+	mutex_lock(&data->report_mutex);
 	data->lcd_contrast = contrast & 0x0ff;
-	spin_lock_irqsave(&data->lock, flags);
 	hid_set_field(report->field[0], 0, data->lcd_contrast);
-	if (!(data->status & PICOLCD_FAILED))
+	if (!(READ_ONCE(data->status) & PICOLCD_FAILED))
 		hid_hw_request(data->hdev, report, HID_REQ_SET_REPORT);
-	spin_unlock_irqrestore(&data->lock, flags);
+	mutex_unlock(&data->report_mutex);
 	return 0;
 }

diff --git a/drivers/hid/hid-picolcd_leds.c b/drivers/hid/hid-picolcd_leds.c
index 6b505a7535..c6ae8ace1d 100644
--- a/drivers/hid/hid-picolcd_leds.c
+++ b/drivers/hid/hid-picolcd_leds.c
@@ -29,10 +29,9 @@
 #include "hid-picolcd.h"


-void picolcd_leds_set(struct picolcd_data *data)
+static void picolcd_leds_set_locked(struct picolcd_data *data)
 {
 	struct hid_report *report;
-	unsigned long flags;

 	if (!data->led[0])
 		return;
@@ -40,14 +39,19 @@ void picolcd_leds_set(struct picolcd_data *data)
 	if (!report || report->maxfield != 1 || report->field[0]->report_count != 1)
 		return;

-	spin_lock_irqsave(&data->lock, flags);
 	hid_set_field(report->field[0], 0, data->led_state);
-	if (!(data->status & PICOLCD_FAILED))
+	if (!(READ_ONCE(data->status) & PICOLCD_FAILED))
 		hid_hw_request(data->hdev, report, HID_REQ_SET_REPORT);
-	spin_unlock_irqrestore(&data->lock, flags);
 }

-static void picolcd_led_set_brightness(struct led_classdev *led_cdev,
+void picolcd_leds_set(struct picolcd_data *data)
+{
+	mutex_lock(&data->report_mutex);
+	picolcd_leds_set_locked(data);
+	mutex_unlock(&data->report_mutex);
+}
+
+static int picolcd_led_set_brightness(struct led_classdev *led_cdev,
 			enum led_brightness value)
 {
 	struct device *dev;
@@ -59,20 +63,23 @@ static void picolcd_led_set_brightness(struct
led_classdev *led_cdev,
 	hdev = to_hid_device(dev);
 	data = hid_get_drvdata(hdev);
 	if (!data)
-		return;
+		return -ENODEV;
+	mutex_lock(&data->report_mutex);
 	for (i = 0; i < 8; i++) {
 		if (led_cdev != data->led[i])
 			continue;
 		state = (data->led_state >> i) & 1;
 		if (value == LED_OFF && state) {
 			data->led_state &= ~(1 << i);
-			picolcd_leds_set(data);
+			picolcd_leds_set_locked(data);
 		} else if (value != LED_OFF && !state) {
 			data->led_state |= 1 << i;
-			picolcd_leds_set(data);
+			picolcd_leds_set_locked(data);
 		}
 		break;
 	}
+	mutex_unlock(&data->report_mutex);
+	return 0;
 }

 static enum led_brightness picolcd_led_get_brightness(struct
led_classdev *led_cdev)
@@ -87,7 +94,7 @@ static enum led_brightness
picolcd_led_get_brightness(struct led_classdev *led_c
 	data = hid_get_drvdata(hdev);
 	for (i = 0; i < 8; i++)
 		if (led_cdev == data->led[i]) {
-			value = (data->led_state >> i) & 1;
+			value = (READ_ONCE(data->led_state) >> i) & 1;
 			break;
 		}
 	return value ? LED_FULL : LED_OFF;
@@ -122,7 +129,7 @@ int picolcd_init_leds(struct picolcd_data *data,
struct hid_report *report)
 		led->brightness = 0;
 		led->max_brightness = 1;
 		led->brightness_get = picolcd_led_get_brightness;
-		led->brightness_set = picolcd_led_set_brightness;
+		led->brightness_set_blocking = picolcd_led_set_brightness;

 		data->led[i] = led;
 		ret = led_classdev_register(dev, data->led[i]);
@@ -159,5 +166,3 @@ void picolcd_exit_leds(struct picolcd_data *data)
 		kfree(led);
 	}
 }
-
-
-- 
2.55.0
