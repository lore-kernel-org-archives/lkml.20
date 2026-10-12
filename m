Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE08733A70A
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791801433; cv=none; b=ins5E1Ca9d77ITUyM97d9ZgJazroYWwFbQZ8K0nGbhRkjWi5sMrkKpCwHBztbtCHOTqbUibrtuSqZSFEqlrlqV7ytPhQgTCdAahB2o5iFcjk4xoLeks1k0Fx7qWDyq0svYKJiCUcddDDL2flR5hlvPbRaZqqGtbkaMLqo/Py5Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791801433; c=relaxed/simple;
	bh=bQ2VgwErdXzsUtcrHwFne66TL024RzFhVTV9iw7nNRI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MQXzzJpdp/NfQDSfo0h8x1tB4FtsjThkzHiO14WlTUJGZStdoPwxoXo/3NqyrA0/o28oI5vdBTWOi0CDkQf5Afd4nlzStpMaPRoiIhSVpxkMwCDdvf2ujFS6TRYUoXw1/CkXekDtkzabj44VVu59y9Vyhyoe9G7QyopSHOqrjKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YiHz/O/k; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YiHz/O/k"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48c4d870d54so963712f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791801430; x=1792406230; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5UwMCsUaPcuhIF4YQXXWs7svt+B6rufSHlmQNA2woxs=;
        b=YiHz/O/kI9mNpixzZKD14T6PDnhYZUDoxLluOg/RViMKJcVIc9xwFGAYw4hMv9ERFl
         Nqn0vE4uXcXzC8mXr/wklUJv9HKHdAvdeWsWtlWAhYppSewlTuHsVAuTuBzfbdiZxvMc
         SjT6g82Jr0Pl6cASPPzhAZD8rZFBSXC4/POXExVrbgTPpYDrZQWcdCdAy/jupJq0HUx/
         c2rq0tgbqBIJHsKc8Edxow/BXn91IHimMZ+2i0vm+teAX5ozSUjgqbqbf9WMYIAPC8Nb
         q5Lc2t/gdbS8gYP6EAKvp1UYFv+297Ui5Wl64cG/9S8CE8W7KJA0Hr+1WRxNCjenvI3O
         rU2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791801430; x=1792406230;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5UwMCsUaPcuhIF4YQXXWs7svt+B6rufSHlmQNA2woxs=;
        b=VwN2jED8KIL9ZWjC9arUrC1VwHb/B9d9CE1Wc90TzPluAj/Wg8yZ+Ku+RhB4gE0o2X
         ubRLsMMALzKbikPStGdpdU+OsiMn/Degbqd0807lUCYgVVmdX3BvL8zfLqeJLHfk/psn
         Z7ekclRDm2C/42kLQ+lsgvNco+PZMXfRqxhjILQs5+6gETm/FkMoP9SzcJB27dCIvaU5
         9yW8cquJNY4QmnggSr4s7pq9q/eXmJxykCOpRZxb3o27mnft/39HB97XD6kyg7qzhi1d
         me7dJKKQKA2T9e78WMZgScSXbEPacDzJjXig8KQ+eCdWGT+CFx9sVWW1L9Qo19NkfIx/
         SZuw==
X-Forwarded-Encrypted: i=1; AKwUvBw1yDSbD9jGYVoWC4Snf6AAfukxU3lb+z2vK5yooh1AY+W6GWxpwU86h7n2D8mntvsqm1P+gyLPHrZbFa8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqjpqz8iIR17w3Rtg71kt6QZ27VaS6HfZW8/Y8Cz6O2JMV1hC9
	vG0UTDDXeiKFLIWRZjdothXAEfOl1Nfo4oMwwzDyCmRNjhKHCZtSLNsi
X-Gm-Gg: AYBFou0mRGhNIrK3pJTrmasUaKJ/AYpjXgNrIhMv+ZMdv2QfwmlE/ic1/xKzYLhL7qp
	p3FwSUfy/xa6N0oAgqNAHfFMaYIPI8CWgRG91vfvWC94z0Bs9mcyVgGcfqENZuyS2QtYPnL+zdG
	EAkrvmuujCVV4yj3BizhQ7OtjQ3FmxIyPBJ83gxy7JLcUcIk90CgW3bm1QyF68QQnC8nijSJoBW
	3/fIAg+aUs38qQxN9Jrlah6jCfkaD4NC+ehS5wZVYse2qsHO1WQksUjcUZTKCVMKWJKeAqoS0iN
	AhS784HHNZF013JOjaVaZN47ul3aLZLPK7hAQOqiTTs0IH/k8D0djKC5nP0/yrejQ7tMQDI/uYM
	eEO1aO5ey0HtnclTxHZK3YDkolkhAsXhn2MoE0qKyrAeXrHhQgrYKs+aHNQ5l/fC21XmooyBqjo
	m4OT1+99puJ1dDTHDifMnCT2NFFQdNhsdTwbVKcga/jHt2FkmQxWpGzV0oyq5u9vxKVg==
X-Received: by 2002:a05:6000:491c:b0:48c:7326:cf0b with SMTP id ffacd0b85a97d-48dbacfbafbmr15475205f8f.56.1791801429908;
        Mon, 12 Oct 2026 03:37:09 -0700 (PDT)
Received: from sparkle.lan ([86.33.83.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acee65sm19443316f8f.49.2026.10.12.03.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:37:09 -0700 (PDT)
From: =?UTF-8?q?Sini=C5=A1a=20Do=C5=A1en?= <snsdosen@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Sini=C5=A1a=20Do=C5=A1en?= <snsdosen@gmail.com>
Subject: [PATCH] media: cx231xx: fix August VGB100 video and VBI capture
Date: Mon, 12 Oct 2026 12:36:57 +0200
Message-ID: <20261012103657.28574-1-snsdosen@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Devices sold as the August VGB100 exist in at least two hardware
revisions, although both use USB ID 1f4d:0102. The Windows driver INF
also contains separate entries for two VGB100 revisions. The unit tested
here reports bcdDevice 0x4002.

Linux support for this USB ID was originally added for the Geniatech
OTG102/EZGrabber2. A later patch fixed S-Video capture on an August
VGB100 by correcting the input routing from the VGB100 and OTG102
Windows INF files. That profile provides working video on an older
VGB100 unit, but it does not initialize the 0x4002 revision correctly.
The older unit also showed URB errors and could become unresponsive when
capturing raw VBI.

On the 0x4002 revision the generic profile leaves the analog front end
with the wrong reference tuning, so the decoder cannot lock reliably to
a PAL signal. Once that is corrected, cx25840 reports 720x572 while the
bridge delivers complete 720x576 frames, causing applications to reject
the captured buffers.

Raw VBI capture also exposes two bugs in the common cx231xx code. The
parser stops making progress after discarding a surplus VBI line, which
leaves readers waiting indefinitely despite continuing USB traffic. VBI
URBs can also remain active while their vb2 buffers are returned during
stream shutdown.

This change adds a board profile for bcdDevice 0x4002 while leaving the
existing OTG102 profile as the fallback for the older revision. It uses
the AFE reference tuning and frame geometry required by the new hardware,
corrects the raw VBI parser state, stops URBs before returning buffers,
and avoids reinitializing the analog path when userspace reselects the
active input.

The result was tested on the 0x4002 VGB100 with 720x576 YUYV video at
25 fps and raw PAL VBI capture at 1440 samples over 36 lines per frame.

Signed-off-by: Siniša Došen <snsdosen@gmail.com>
---
 drivers/media/usb/cx231xx/cx231xx-avcore.c | 14 +++++++++++++
 drivers/media/usb/cx231xx/cx231xx-cards.c  | 24 ++++++++++++++++++++++
 drivers/media/usb/cx231xx/cx231xx-vbi.c    | 18 ++++++++++++----
 drivers/media/usb/cx231xx/cx231xx-video.c  | 12 +++++++++--
 drivers/media/usb/cx231xx/cx231xx.h        |  1 +
 5 files changed, 63 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-avcore.c b/drivers/media/usb/cx231xx/cx231xx-avcore.c
index 0a5c635..fb71e39 100644
--- a/drivers/media/usb/cx231xx/cx231xx-avcore.c
+++ b/drivers/media/usb/cx231xx/cx231xx-avcore.c
@@ -348,6 +348,7 @@ int cx231xx_afe_update_power_control(struct cx231xx *dev,
 	case CX231XX_BOARD_HAUPPAUGE_USB2_FM_PAL:
 	case CX231XX_BOARD_HAUPPAUGE_USB2_FM_NTSC:
 	case CX231XX_BOARD_OTG102:
+	case CX231XX_BOARD_AUGUST_VGB100:
 		if (avmode == POLARIS_AVMODE_ANALOGT_TV) {
 			while (afe_power_status != (FLD_PWRDN_TUNING_BIAS |
 						FLD_PWRDN_ENABLE_PLL)) {
@@ -932,6 +933,18 @@ int cx231xx_set_decoder_video_input(struct cx231xx *dev,
 		status = vid_blk_write_word(dev, OUT_CTRL1, value);
 	}
 
+	/*
+	 * The generic setup derives TUNE1 from the reference clock and leaves
+	 * 0x42 here.  The VGB100 40.02 analogue front end requires 0xbe;
+	 * otherwise its decoder never acquires horizontal sync.
+	 */
+	if (dev->model == CX231XX_BOARD_AUGUST_VGB100 &&
+	    pin_type == CX231XX_VMUX_COMPOSITE1) {
+		status = afe_write_byte(dev, SUP_BLK_TUNE1, 0xbe);
+		if (status < 0)
+			return status;
+	}
+
 	return status;
 }
 
@@ -1729,6 +1742,7 @@ int cx231xx_dif_set_standard(struct cx231xx *dev, u32 standard)
 	case CX231XX_BOARD_CNXT_VIDEO_GRABBER:
 	case CX231XX_BOARD_HAUPPAUGE_EXETER:
 	case CX231XX_BOARD_OTG102:
+	case CX231XX_BOARD_AUGUST_VGB100:
 		func_mode = 0x03;
 		break;
 	case CX231XX_BOARD_CNXT_RDE_253S:
diff --git a/drivers/media/usb/cx231xx/cx231xx-cards.c b/drivers/media/usb/cx231xx/cx231xx-cards.c
index 69b2420..7ce160d 100644
--- a/drivers/media/usb/cx231xx/cx231xx-cards.c
+++ b/drivers/media/usb/cx231xx/cx231xx-cards.c
@@ -685,6 +685,28 @@ struct cx231xx_board cx231xx_boards[] = {
 			}
 		},
 	},
+	[CX231XX_BOARD_AUGUST_VGB100] = {
+		.name = "August VGB100",
+		.tuner_type = TUNER_ABSENT,
+		.decoder = CX231XX_AVDECODER,
+		.output_mode = OUT_MODE_VIP11,
+		.ctl_pin_status_mask = 0xFFFFFFC4,
+		.agc_analog_digital_select_gpio = 0x0c,
+		.gpio_pin_status_mask = 0x4001000,
+		.norm = V4L2_STD_PAL,
+		.no_alt_vanc = 1,
+		.external_av = 1,
+		.input = {{
+			.type = CX231XX_VMUX_COMPOSITE1,
+			.vmux = CX231XX_VIN_2_1,
+			.amux = CX231XX_AMUX_LINE_IN,
+		}, {
+			.type = CX231XX_VMUX_SVIDEO,
+			.vmux = CX231XX_VIN_1_1 |
+				(CX231XX_VIN_3_2 << 8),
+			.amux = CX231XX_AMUX_LINE_IN,
+		} },
+	},
 	[CX231XX_BOARD_HAUPPAUGE_930C_HD_1113xx] = {
 		.name = "Hauppauge WinTV 930C-HD (1113xx) / HVR-900H (111xxx) / PCTV QuatroStick 521e",
 		.tuner_type = TUNER_NXP_TDA18271,
@@ -1061,6 +1083,8 @@ struct usb_device_id cx231xx_id_table[] = {
 	 .driver_info = CX231XX_BOARD_ICONBIT_U100},
 	{USB_DEVICE(0x0fd9, 0x0037),
 	 .driver_info = CX231XX_BOARD_ELGATO_VIDEO_CAPTURE_V2},
+	{USB_DEVICE_VER(0x1f4d, 0x0102, 0x4002, 0x4002),
+	 .driver_info = CX231XX_BOARD_AUGUST_VGB100},
 	{USB_DEVICE(0x1f4d, 0x0102),
 	 .driver_info = CX231XX_BOARD_OTG102},
 	{USB_DEVICE(USB_VID_TERRATEC, 0x00a6),
diff --git a/drivers/media/usb/cx231xx/cx231xx-vbi.c b/drivers/media/usb/cx231xx/cx231xx-vbi.c
index 338e101..63db257 100644
--- a/drivers/media/usb/cx231xx/cx231xx-vbi.c
+++ b/drivers/media/usb/cx231xx/cx231xx-vbi.c
@@ -234,6 +234,8 @@ static void vbi_stop_streaming(struct vb2_queue *vq)
 {
 	struct cx231xx *dev = vb2_get_drv_priv(vq);
 
+	/* Stop URB callbacks before returning their destination buffers. */
+	cx231xx_uninit_vbi_isoc(dev);
 	return_all_buffers(dev, VB2_BUF_STATE_ERROR);
 }
 
@@ -499,8 +501,12 @@ u32 cx231xx_copy_vbi_line(struct cx231xx *dev, struct cx231xx_dmaqueue *dma_q,
 		cx231xx_reset_vbi_buffer(dev, dma_q);
 	}
 
-	if (dma_q->current_field != field_number)
+	if (dma_q->current_field != field_number) {
+		/* Drop any incomplete surplus line from the previous field. */
 		dma_q->lines_completed = 0;
+		dma_q->bytes_left_in_line = _line_size;
+		dma_q->is_partial_line = 0;
+	}
 
 	/* get the buffer pointer */
 	buf = dev->vbi_mode.bulk_ctl.buf;
@@ -514,9 +520,13 @@ u32 cx231xx_copy_vbi_line(struct cx231xx *dev, struct cx231xx_dmaqueue *dma_q,
 
 	if (dma_q->lines_completed >= dma_q->lines_per_field) {
 		dma_q->bytes_left_in_line -= bytes_to_copy;
-		dma_q->is_partial_line =
-		    (dma_q->bytes_left_in_line == 0) ? 0 : 1;
-		return 0;
+		if (dma_q->bytes_left_in_line == 0) {
+			dma_q->bytes_left_in_line = _line_size;
+			dma_q->is_partial_line = 0;
+		} else {
+			dma_q->is_partial_line = 1;
+		}
+		return bytes_to_copy;
 	}
 
 	dma_q->is_partial_line = 1;
diff --git a/drivers/media/usb/cx231xx/cx231xx-video.c b/drivers/media/usb/cx231xx/cx231xx-video.c
index 70aa99f..4fd31ab 100644
--- a/drivers/media/usb/cx231xx/cx231xx-video.c
+++ b/drivers/media/usb/cx231xx/cx231xx-video.c
@@ -912,6 +912,10 @@ static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
 	call_all(dev, pad, set_fmt, NULL, &format);
 	v4l2_fill_pix_format(&f->fmt.pix, &format.format);
 
+	/* The DMA engine keeps the requested 576-line PAL geometry. */
+	if (dev->model == CX231XX_BOARD_AUGUST_VGB100)
+		vidioc_g_fmt_vid_cap(file, priv, f);
+
 	return rc;
 }
 
@@ -1065,13 +1069,17 @@ int cx231xx_s_input(struct file *file, void *priv, unsigned int i)
 {
 	struct cx231xx *dev = video_drvdata(file);
 
-	dev->mode_tv = 0;
-
 	if (i >= MAX_CX231XX_INPUT)
 		return -EINVAL;
 	if (0 == INPUT(i)->type)
 		return -EINVAL;
 
+	/* Reapplying the vendor profile disturbs an active raw VBI stream. */
+	if (dev->model == CX231XX_BOARD_AUGUST_VGB100 &&
+	    i == dev->video_input)
+		return 0;
+
+	dev->mode_tv = 0;
 	video_mux(dev, i);
 
 	if (INPUT(i)->type == CX231XX_VMUX_TELEVISION ||
diff --git a/drivers/media/usb/cx231xx/cx231xx.h b/drivers/media/usb/cx231xx/cx231xx.h
index 19f5036..1cb08ec 100644
--- a/drivers/media/usb/cx231xx/cx231xx.h
+++ b/drivers/media/usb/cx231xx/cx231xx.h
@@ -70,6 +70,7 @@
 #define CX231XX_BOARD_THE_IMAGING_SOURCE_DFG_USB2_PRO 25
 #define CX231XX_BOARD_HAUPPAUGE_935C 26
 #define CX231XX_BOARD_HAUPPAUGE_975 27
+#define CX231XX_BOARD_AUGUST_VGB100 28
 
 /* Limits minimum and default number of buffers */
 #define CX231XX_MIN_BUF                 4
-- 
2.56.0

