Received: from mail-oi2-f11.google.com (mail-oi2-f11.google.com [74.125.231.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6334D9F9B
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.203
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790612273; cv=pass; b=kj/sg+sjUlqiyRffXxKCbF4OlTwpcsmGOOXhF/3jFCoPWlwUp/3XmEAH41L4rpN7HoPsCWfBwklDVDI/crQVaymKWf0Ra0udjwLPgpjRTRzmSEMGYNJrCxW2L5SFQTtdZhpPxeIBLgFCbFeNKgRCCnL0KlO1yvQy9HovhKDCQ8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790612273; c=relaxed/simple;
	bh=/9u3l8tvroAWhsZ3+bgszRdYGfDaF3Zw4nAXDtkGKNI=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WOH3O36uRLo7wp/XLXcn6lYlUou18XhiTHESOMtmQ1103/hu/1TVtGEAERmSoey4AaKO0/aRyXvPZ6h67cadzKI0feZU5lC9V613VIDO0KqPzx7p1Yw1wXeotuD3UE2lbn3ps9884FxRrOvnrepsKjpDDIalno9KS39JJiDLAl0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T7K4jm22; arc=pass smtp.client-ip=74.125.231.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T7K4jm22"
Received: by mail-oi2-f11.google.com with SMTP id 5614622812f47-4c650fea78aso1487265b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:17:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790612270; cv=none;
        d=google.com; s=arc-20260327;
        b=WonmRJQSk158OexvDR5XBLpnV1SSXL3eZ/zVzPoSjwgIda/0bLiDsHXsp0vyoJsJ0D
         uE57G6lRRpJ352IfxYO6EyVCLnVn4B/Trg0BqWR7LkDtV8u4W2PnmXnT2a9HmAdWrB4m
         NqCzMf3KyT18zVh1eaOtjxb/Mcgy+GYnL1am03w/CiM9g6bAMqisa20dn82WeEn7Snzj
         ax/rotEK8RxbYYViQdEq0Do+2N4AYNRUdinCftvGKkbSX6qmjF0RhmM3GYToMK6GeAgK
         6dDU+2gCRfLgMYRvS/edgXXkls8akTv5UZtGEClYUWIPgA9uybykXVkghB4mFYmfZtQr
         YbvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=mAEzcqvZR7kY5FZwPLKlXWGuBFBAruI7pzeVz3Vqh4E=;
        fh=p+QK46WpXAQmziN6W+qjUHmayFan+sbhXstS4MGZ404=;
        b=hd3wqcn9HuZD4ul5UVdJbHLcMEAlry6lpMVrFgqpg6dPZ0wA7Sxc1LRG0eyLyFWIeJ
         Xq8T6SC4ZizixLu4sMRNItl34147/6hsASNz3AqR5mdKiXuVeTJJL1kYeeRSR5DEXCCc
         0KWYO7JNPq/8B10nrAwbBtQsg0SV9mI61XIJ0X54fs4rZPXuh7wtRpXIBZocOy2q47ij
         T5aPylMaE9u28sXCFAPbrA1929FVwlPBiZkbdRqnsdzK97iJj1lwrVWxUfhmp0FsUqzt
         WC00t5lqiH24R/zH8AzxgdRdj8j4gn2xAP0sWpt4MWaH7pvtfpDv4caAVhVN/blaVPI+
         xe+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790612270; x=1791217070; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mAEzcqvZR7kY5FZwPLKlXWGuBFBAruI7pzeVz3Vqh4E=;
        b=T7K4jm22TTyshae2BQw2pmgbgDt009kzc7b+aCWAh8Hox6+IZGJj6DdNnXUrZ0QsAG
         tZi7G6g5N6nh3qbbAKiiz6Okzwq+beTf+vJKN2KsupZ8hFJkyANbpJcBmH5dsfMo2nwK
         O6y//GA1tld7ZsZlAVQsIHvEUB7gZwOThyYqWlAb5I+4pYTq0IArU0OdhlqjYLMwtFbi
         DYIzmEQ147pZ6XMqa8PlZGY4iEBiIfmhGw+C2eyU63x4lw+cx6CbUJOqyMcSWWfS28KE
         kUXT2N2hNv/LVY8iiYwofbaX9b10gvafyjUlpBWlaTcnQmKspGzZkzAdXfvHPv7+L2w7
         31nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790612270; x=1791217070;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mAEzcqvZR7kY5FZwPLKlXWGuBFBAruI7pzeVz3Vqh4E=;
        b=y9Ia9VGm9gq/BFQaNpFMYclbfqRfmsXmzeYOl/5Q+I6YAfyo1USJ9Eoy8Fu26WRdTO
         8CTlRrzEY51SOnGzIRJ/DK744M09RdDK8PO+gcmT7JDj3WYrIkyOsdW/nuTamYK4A3dM
         U0a749Px7wosy8qop+0uD1Z3C0hm291etCOSvuqOU68/H3sK4JP6upkyEE4KRka7VN2x
         Y0RVV1b2/zrLbuzE/OJyG2oFtJF8UViuoUAysY3Yi8U0TWubWrAJL9TAadroTZxDLjF+
         nSppX2LwjDDKfMybhF8eHXWaw6CDHqC7JKJTdEVELBrNFMiB4/4pxuKiKhG6JI45iMPg
         gbRA==
X-Forwarded-Encrypted: i=1; AKwUvBy6+l9fS0Um8gr6pPAw6nknYPC2T0nMxk4so/223cBhOdAiaXzEdv7gG/iUP/T4TFdJUsPzmKu1ZhgOs94=@vger.kernel.org
X-Gm-Message-State: AFuF++nSbJFJ7RtuPpEW5opNKwvXFhi50Hm9vLnDgTnrpcjYG2Wqto1V
	2e2gnh/+77oPYjNzUacdtnNsmExm/AM0W0J7e5J76h93GFVobxhPug3IBsi4c9Q1Ma2niePvxPu
	z80iL2f9m9QK6xXzgmxgnto65WSCuvqY/DNODaaJa/zeqfOk=
X-Gm-Gg: AYBFou09/8rDhziZRAw/a2R2XIha66cewvV1JdEM84Iz4uRX1Yem3eEm064xgYD0CRo
	+X0/y618MrM4qRKoaa+bkYDjPQ7ZfPQLfUqpPS12jbh+c+Lwu02HAkzDG5cPJhsLebj6FYV/N5j
	7HWYrbaCK1raOpY6PI7u3n3hZjnj4qL7GNmotNjxaNGTeSHqa7nI6xNQEy4e6i2vBNXe+xiAnz6
	wdzfaI64saYp6wxXb+QQFczYtsVMnzckotwZY9PB/3A0UNUAYKP4UaVoXxbmTlLuZmbgpODUy47
	O+Usj71vna0KYYJsQehxE69/9d9Ht7L5YlYJmMcQBbihPhthRZL7EPJjqgrGjZ8SjAAt3nnfQ7A
	kt/BE2z0dHA==
X-Received: by 2002:a05:6808:180f:b0:4ea:f4ab:dad7 with SMTP id
 5614622812f47-4eaf4abde31mr3114576b6e.43.1790612270217; Mon, 28 Sep 2026
 09:17:50 -0700 (PDT)
Received: from 578479312649 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Sep 2026 16:17:49 +0000
Received: from 578479312649 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Sep 2026 16:17:49 +0000
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
Date: Mon, 28 Sep 2026 16:17:49 +0000
X-Gm-Features: AclHuK8BjruCpIs-y-znTwRHy4UbPVU7NoASXj59drlp5sgPwJENTSFHMkI16G0
Message-ID: <CANOyQmHF-gjvnLqTGEVBcU6+AWj5ha+7tJhE2E_Cv9aj-gRXdA@mail.gmail.com>
Subject: [PATCH v2 2/2] HID: picolcd: Avoid framebuffer last-close deadlock
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, deller@gmx.de, 
	simona@ffwll.ch, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

Closing the last framebuffer descriptor can deadlock against PicoLCD's
deferred update worker. fb_release() holds info->lock while waiting for
deferred work, and picolcd_fb_update() takes the same lock. Lockdep
reports the cycle through deferred-work completion and fbdefio_state->lock.
Repeated framebuffer open/write/close with concurrent device destruction
reproduces the hang in a PREEMPT_RT QEMU guest.

Use a private update mutex in the deferred worker instead of info->lock.
Take it in picolcd_set_par() as well to preserve serialization of pixel
format conversion and framebuffer updates. Initialize it before exposing
the framebuffer.

The test with the preceding output-request fix hung in the first round
and reported a circular locking dependency. With this change, all five
rounds completed, including 29 successful framebuffer write cycles and
concurrent LCD, backlight, two LED and UHID destroy operations, without
BUG/WARNING. The original syzkaller reproducer and persistent-open
framebuffer tests also passed again. These are bounded virtual-device
tests; physical hardware and suspend/resume remain untested.

Fixes: 3efc61d95259 ("fbdev: Fix invalid page access after closing
deferred I/O devices")
Signed-off-by: Aveline Noir <jm5905938@gmail.com>
---
 drivers/hid/hid-picolcd.h    |  2 ++
 drivers/hid/hid-picolcd_fb.c | 33 ++++++++++++++++++++++-----------
 2 files changed, 24 insertions(+), 11 deletions(-)

diff --git a/drivers/hid/hid-picolcd.h b/drivers/hid/hid-picolcd.h
index 846a8ceb95..33e6654ca0 100644
--- a/drivers/hid/hid-picolcd.h
+++ b/drivers/hid/hid-picolcd.h
@@ -115,6 +115,8 @@ struct picolcd_data {
 struct picolcd_fb_data {
 	/* Framebuffer stuff */
 	spinlock_t lock;
+	/* Deferred I/O runs while fbdefio_state->lock is held. */
+	struct mutex update_lock;
 	struct picolcd_data *picolcd;
 	u8 update_rate;
 	u8 bpp;
diff --git a/drivers/hid/hid-picolcd_fb.c b/drivers/hid/hid-picolcd_fb.c
index c17104fd60..258c7c4fa2 100644
--- a/drivers/hid/hid-picolcd_fb.c
+++ b/drivers/hid/hid-picolcd_fb.c
@@ -231,7 +231,8 @@ static void picolcd_fb_update(struct fb_info *info)
 	struct picolcd_fb_data *fbdata = info->par;
 	struct picolcd_data *data;

-	mutex_lock(&info->lock);
+	/* fb_release() flushes this work while holding info->lock. */
+	mutex_lock(&fbdata->update_lock);

 	spin_lock_irqsave(&fbdata->lock, flags);
 	data = !fbdata->ready ? fbdata->picolcd : NULL;
@@ -258,11 +259,11 @@ static void picolcd_fb_update(struct fb_info *info)
 				spin_lock_irqsave(&fbdata->lock, flags);
 				data = fbdata->picolcd;
 				spin_unlock_irqrestore(&fbdata->lock, flags);
-				mutex_unlock(&info->lock);
+				mutex_unlock(&fbdata->update_lock);
 				if (!data)
 					return;
 				hid_hw_wait(data->hdev);
-				mutex_lock(&info->lock);
+				mutex_lock(&fbdata->update_lock);
 				n = 0;
 			}
 			spin_lock_irqsave(&fbdata->lock, flags);
@@ -277,13 +278,13 @@ static void picolcd_fb_update(struct fb_info *info)
 		spin_lock_irqsave(&fbdata->lock, flags);
 		data = fbdata->picolcd;
 		spin_unlock_irqrestore(&fbdata->lock, flags);
-		mutex_unlock(&info->lock);
+		mutex_unlock(&fbdata->update_lock);
 		if (data)
 			hid_hw_wait(data->hdev);
 		return;
 	}
 out:
-	mutex_unlock(&info->lock);
+	mutex_unlock(&fbdata->update_lock);
 }

 static int picolcd_fb_blank(int blank, struct fb_info *info)
@@ -332,17 +333,24 @@ static int picolcd_set_par(struct fb_info *info)
 {
 	struct picolcd_fb_data *fbdata = info->par;
 	u8 *tmp_fb, *o_fb;
+	int ret = 0;
+
+	mutex_lock(&fbdata->update_lock);
 	if (info->var.bits_per_pixel == fbdata->bpp)
-		return 0;
+		goto out;
 	/* switch between 1/8 bit depths */
-	if (info->var.bits_per_pixel != 1 && info->var.bits_per_pixel != 8)
-		return -EINVAL;
+	if (info->var.bits_per_pixel != 1 && info->var.bits_per_pixel != 8) {
+		ret = -EINVAL;
+		goto out;
+	}

 	o_fb   = fbdata->bitmap;
 	tmp_fb = kmalloc_array(PICOLCDFB_SIZE, info->var.bits_per_pixel,
 			       GFP_KERNEL);
-	if (!tmp_fb)
-		return -ENOMEM;
+	if (!tmp_fb) {
+		ret = -ENOMEM;
+		goto out;
+	}

 	/* translate FB content to new bits-per-pixel */
 	if (info->var.bits_per_pixel == 1) {
@@ -369,7 +377,9 @@ static int picolcd_set_par(struct fb_info *info)

 	kfree(tmp_fb);
 	fbdata->bpp = info->var.bits_per_pixel;
-	return 0;
+out:
+	mutex_unlock(&fbdata->update_lock);
+	return ret;
 }

 static void picolcdfb_ops_damage_range(struct fb_info *info, off_t
off, size_t len)
@@ -506,6 +516,7 @@ int picolcd_init_framebuffer(struct picolcd_data *data)

 	fbdata = info->par;
 	spin_lock_init(&fbdata->lock);
+	mutex_init(&fbdata->update_lock);
 	fbdata->picolcd = data;
 	fbdata->update_rate = PICOLCDFB_UPDATE_RATE_DEFAULT;
 	fbdata->bpp     = picolcdfb_var.bits_per_pixel;
-- 
2.55.0
