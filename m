Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B261A682F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789086077; cv=pass; b=tZ4waNAT4NwNIo/MW1IlFHHu3DJCsR6SGY2X6OdQRV+7gRX0uH6k1DNHuWXiTiEVTUoqvGiSVa7Y3wzTsQbe8ULOTCCVIosI7XvH4p6sLn9dYj/k6VOv8o4aL8JKm3sM83lmb8nSt5AHz7WjWD6HGvBgB4dkMBUpnzRAsOBQBoc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789086077; c=relaxed/simple;
	bh=hrC3CZNtK6yS7r2+RY5W9pabOYMUQOPoehpW5H2xwlw=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=QaShJ6JX3GTsM2mUBFVhDCH1F5RRPHwG4xgjGooG47c+cg5M0sxilkmke2E+Xz/Eyie/BVNcEa3B2D/0CHG7xKDUMS+WJa+ERYYXNBN+dToCH7TSkpikKoUqOjH2U+/L3raRNc8pz7EdH+p2ENWqUdGJo4244Qj66Zkk8rm7I3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu; spf=pass smtp.mailfrom=berkeley.edu; dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b=CKKR7SHn; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berkeley.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berkeley.edu header.i=@berkeley.edu header.b="CKKR7SHn"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469d249c4so261324b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:21:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789086075; cv=none;
        d=google.com; s=arc-20260327;
        b=Xo5+ps3YxjqjLRQMguag1WSPRV6k9VSu3rI00WtcJBeAW1w23r2cIajXcLNDuPciuv
         GmkjyZq+030uhoVshWCexaPjeHfxO4qmN8XuN9yLgwi2XAWB+kS3zf4HGOYL23hJaYo+
         +Hwy0PNehB+G0sSS1cgMZN25NTtjmdVyD9fvVM6zvyRzetYzHMX2iAmRgokCNrzaGk9r
         xCPhn0YxxFgKzhQQsKFjC1p+eTlnbZzSaadPoVZsq/j1MVqUgODfA/SYWy7IWdnGWciz
         6C/BpjxU/0zY0c72TxcZRZ2sQcNZ3Al2AD/hG/H6A6V78skIruOvAIsQb+gWi4+AObhs
         QTFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=Vqmq5tNiyBg959JtrG/LPDjR/CFPsT9DkZvL6x96FQE=;
        fh=uy1wJKOlitXbK8wVuxaT1ybMruunSpfiAb93dBiD++E=;
        b=ab9LQJIGw7d855SYiiCgUeXmAGDknXZD5AKhCrDrYLlu1rxQTHr5GlAdbgj2K34/yE
         jKwCR6KGjLn5WGt8ZMfcNedHli8obbjsb8WNdnV8i1lyFu0YQspYC7hC0BM0WSEKM4N8
         SQmubHY6B3PZvAHz53fh5tzfRgz4X5G/DSBFWQCYhxFoBc/8sfCc3qfZevYkLpFg4fDq
         v7gy3X4qPFPNGOmfCq/OXhF0SDkLt4y7NwtkW2qJCaJFS0HLCui8dBzGZt8woYr3W4Ow
         t3+damxE6BwYpuNeW4HpvKwegy+8B+n0fqf3kGxje21JXYxw6k7Im/mc2e/w1A2U/syI
         pLzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=berkeley.edu; s=google; t=1789086075; x=1789690875; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vqmq5tNiyBg959JtrG/LPDjR/CFPsT9DkZvL6x96FQE=;
        b=CKKR7SHnh/M8yZ2vy0AUwZbFyRwKBQo0Hrfi/54jMTIc+SQs93t/PxnkKKE3LfQlym
         a1Btbe0/wP4pF6IqFc1haneh9gYGdXyaeda945ahGp6+RGLO9HyaCycK9U2xdt9UkZ0b
         O3vSX9+i0++oHm9aQ/rWo8CdV8wzAdq/U2elEGBG7uSDiyBDBwIdXgr4VG3iiRMAZ/cj
         2KbaDWJmqz5tR//+Pz5khNwQ0xh/PYD6mmhLdVboXMpBwMItSMIbWbUyCsAK4qJZlOxC
         b8/rhwtCBXs7pwoqCAXynP++PF7Jw0+gSIX3q6uOW/xmjfnmlUNEx5+KqOhCI2/ab9m7
         HtPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789086075; x=1789690875;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Vqmq5tNiyBg959JtrG/LPDjR/CFPsT9DkZvL6x96FQE=;
        b=sP4eRQxIFXwW6nD+5Sykq+KNAU1+6qJyYrAbtA5owH9tsWDDZ7IP29o8gSgUXiPn0m
         7l109I5ZBNswV+W2p4QacW0Mx1NPkZTKWeaDR0O6b63Lq5NZ+CjdB554oLw0KKG6DbPu
         U3pkufsfb5hfZg/hP7k13+T2NdMgkN6GEMBNphSqEXbqT1COqSFmyRLqZel87zYqqNVo
         HeKSeLpPn9+T+xf+xF3Mi//WA7kVxLkjASLr1nYU3Or8l48F5jz+vN4DUtK5tCmbfvx1
         1pf66AurZHlMmLPoVya8vzyprGsj/OF7XsWNOusa/aeoxI0WBA8J4YVBWw/vgHMQtwUw
         hmww==
X-Forwarded-Encrypted: i=1; AKwUvBy2P6KbfAvf+Shr4YUViR8Hv6HAiJm2Q6HVfEqSH1IxsfBQaS+qTCR36/c2ZAZlJmuwqOqLRGCzW9FNBTQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lBmLI8wEMJRoJVROH/XOCqm4IqLONI7Pd4rXR/kPj8SF2MaNw/
	eS6Xg7M88Gr8QvIxwINdois9ghwCdwKGtkpSBV8yfVIbzXy/EoYdBMtxUfnX0hlE/ipu7zQ21K8
	7vn+k/AaRx74/IfoOtARRW0M71ueRqRu+AL4u8RUkBuPI5TS356L9RQ==
X-Gm-Gg: AYBFou0Zve08QlzOBiBbcozquqMptGs8OrLgqEmK06MYWIOoRWmziqNRfhTb/KMb1DL
	iz62surYYow+xtAe+WH0Z6PjYyS6GnEfNdM+8vzKkkAiAvbFvvg3gsqW2Rqe3DL8xWKo8mKLXQM
	uwoakR1I642uF991xJbehKTWwPoUZDtk9Thi+l6g5iucmXWobYfnDkzYLxkKYvK8jUlcr0eaaR6
	WAWW3SE2szNY8yzAnzcVFQA2RTixRRWo+YvsQ+BzNXN5z/3gvo72DkRpujnQHAy1J2mzsUO8Iz4
	6UAIc1LAaYZgqB9Seo2g9ZUaKRDVj/4fFM5kMQcrcgY1kCFMMe+RpB5y0gYkIhJvZMpKhuP0UZv
	OBxy2oGY4Csflmj7SeX4L3sjYWwMkg9nR8Uf4sJ0hBPGv5RiZYQ4S5A==
X-Received: by 2002:a05:6a00:3a26:b0:868:9662:5137 with SMTP id
 d2e1a72fcca58-86b31907b6fmr2162208b3a.11.1789086073847; Thu, 10 Sep 2026
 17:21:13 -0700 (PDT)
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 11 Sep 2026 00:21:13 +0000
Received: from 474444807712 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 11 Sep 2026 00:21:13 +0000
From: Farhad Alemi <farhad.alemi@berkeley.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 11 Sep 2026 00:21:13 +0000
X-Gm-Features: AcwNN1V4dTU8mbsqm4SKDv1bFeQoaKcJ7y1J2-Jx15YlpkvuczFgpG4juL2uMLQ
Message-ID: <CA+0ovCgK_Zt7kTmgqZWz-fOBx1J-rX+Cr8V65vMCEAD4pCnOyg@mail.gmail.com>
Subject: [PATCH] media: gspca: finepix: flush the worker before URBs are freed
To: Frank Zago <frank@zago.net>, Hans Verkuil <hverkuil@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: falemi@asu.edu, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

dostream() dereferences gspca_dev->urb[0]->transfer_buffer on entry, but
finepix flushes its worker only from .stop0, which gspca_stream_off() runs
after destroy_urbs() has already killed, freed and cleared urb[0], while
gspca_disconnect() frees the URBs without invoking any subdriver stop
callback at all. A worker that starts running inside either window faults
on a NULL urb. Flush the work from .stopN, which runs before
destroy_urbs(), and add a finepix .disconnect handler that clears ->present
and flushes the worker before handing over to gspca_disconnect().

Closes: https://lore.kernel.org/all/CA+0ovCiqm0MVi55RpNtbUQoOjiSxnbjHXGN9rq+P6aJJCqCguQ@mail.gmail.com/
Signed-off-by: Farhad Alemi <farhad.alemi@berkeley.edu>
---
The device was emulated.

--- a/drivers/media/usb/gspca/finepix.c
+++ b/drivers/media/usb/gspca/finepix.c
@@ -217,9 +217,9 @@ static int sd_start(struct gspca_dev *gspca_dev)
 	return 0;
 }

-/* called on streamoff with alt==0 and on disconnect */
+/* called before destroy_urbs(): the worker must not outlive urb[0] */
 /* the usb_lock is held at entry - restore on exit */
-static void sd_stop0(struct gspca_dev *gspca_dev)
+static void sd_stopN(struct gspca_dev *gspca_dev)
 {
 	struct usb_fpix *dev = (struct usb_fpix *) gspca_dev;

@@ -229,6 +229,17 @@ static void sd_stop0(struct gspca_dev *gspca_dev)
 	mutex_lock(&gspca_dev->usb_lock);
 }

+/* gspca_disconnect() frees the URBs without calling any subdriver callback */
+static void sd_disconnect(struct usb_interface *intf)
+{
+	struct usb_fpix *dev = usb_get_intfdata(intf);
+
+	/* let the worker see the device go away, then wait for it */
+	dev->gspca_dev.present = false;
+	flush_work(&dev->work_struct);
+	gspca_disconnect(intf);
+}
+
 /* Table of supported USB devices */
 static const struct usb_device_id device_table[] = {
 	{USB_DEVICE(0x04cb, 0x0104)},
@@ -265,7 +276,7 @@ static const struct sd_desc sd_desc = {
 	.config = sd_config,
 	.init   = sd_init,
 	.start  = sd_start,
-	.stop0  = sd_stop0,
+	.stopN  = sd_stopN,
 };

 /* -- device connect -- */
@@ -282,7 +293,7 @@ static struct usb_driver sd_driver = {
 	.name       = MODULE_NAME,
 	.id_table   = device_table,
 	.probe      = sd_probe,
-	.disconnect = gspca_disconnect,
+	.disconnect = sd_disconnect,
 #ifdef CONFIG_PM
 	.suspend = gspca_suspend,
 	.resume  = gspca_resume,
