Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266085;
	b=jQ7GnTLbdxquU/rnmUJFsxlFzOrVhUtaItFNNAOQA6SKvXaYzXEqub4schcbhTqWpQQZ
	 rNvgc+k/oS4hI7SQ10VVdGEjsvheUqLCfmSdrYSJ0RVq0kCUo4hXNF/cE7Av2MMNbCJS2
	 9dYpM5v+Ms3Hz6VoBEmluIj+1HZXgvnWFzfdn8WO3CnKK5VdPx3MiV1zOdbjVPkDBfZnP
	 PG99Ot65iudCLztcve0SaW6hSCWkPPdJigLLTPyHBSPCOSLjXNGT92DDVKjNzlUHQdRZA
	 eqb1A+IKstZ1U1C5Njj29MghZCTHm4D/OW1KwdC66QYq85mUfFg0ota41jst1WndGJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=gv50Olcyh23cLGtHw+qLU1M2dxl4EP1oJehM+5D/N7E=;
	b=C2EzBB5IoBCH1cVPVhkSUCnt3HZlPRZDXXdf3Lhd1IeHQ8J2ETbgOhk5PMbfleCQw005
	 mq16EfRTqF1SE2Sy03m9oHM1oI+od6ZshbntPkeStNzmmKyTfyXSScG7bs1ZASy91UkGf
	 qmMxgv7tTrRRWokTyHiV+F1T5S/6KbdFYjKO1JaF83wa5JdxkZFppAh5Ffb2sLZX8pXMm
	 gQqMw7L6zU9j4C1Xa+sqTUxsLPcBXFBTmVtXrmjpbROUiYzPk4ro1c2OExO57EdPR6jIY
	 NNV6XEuRg1k660+ggtmo2VPtIZOOrmimjX/8IiFxvlcUh5/Kf5cl5rycmyWHxAtBUPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uNLgluOC;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75531606A339
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:28:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75531606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uNLgluOC
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso12965295e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793266084; x=1793870884; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gv50Olcyh23cLGtHw+qLU1M2dxl4EP1oJehM+5D/N7E=;
        b=uNLgluOCoeu813gY5/gDyMYCkcEJgXRjN41Enyh8h2WNlSN9kpwfrm5+YCYtxTLqan
         o+JILRVqinJK8kOpLvB0DIQjYJzQeJfDXWFkGLQ3Q8FkYEuDHjI98nEKgmdBqhSfGokx
         zxZtAu6nYQHjhMQnMASaAwm2t/GaLP73E6VOPIi3fCtmGOa6Q7kgn178m4MKPV4cja9+
         BuwJII40PKoPOqH273vUKKqof1bay5QL28/QiOiuv4kQJFY5QZ1N9Bl6cWCq5kXvPajD
         RTwS8Vdj8CCmsvdiYF0wytSovBUG2JHPu3d/vaaWFqCB+XlpA3gAb6PZs3L7ejzv9Nxh
         p/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266084; x=1793870884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gv50Olcyh23cLGtHw+qLU1M2dxl4EP1oJehM+5D/N7E=;
        b=Kmc6DHtBAQ4zHRI/V9sPEYGK/4Hz20aVh9ssErKe+BvSPHKbXKY3Umo5QpErYIgQr6
         E+G9JmywHl5QnQHsqNgT3wNbkg0RfRIwgyQffA9QNZKGBMssxwZ1DTF6mWxgtLR+Lmc+
         JtzpJlI5Tb8NZXOmB1VwHqONvQ88LAkODIJRonxh00842RU+JfIXxUkhcpndP/VCxhCF
         Q2haVJRXkFbhxcrZdSbmHuQjzuSZzHULWf0cZxZjruGJ1r4mHaO4wk5DWSsHF4bNvn9Z
         MDYxKtxhty61YpfT+VkD90zIMG2/57cSXd1CMy6vPLa/WooZa672lcWPkSoDNXwjnDnY
         Q1lQ==
X-Forwarded-Encrypted: i=1; AKwUvByKLlke/SjZm/IWAfDzqPMxFfGfPwUGtij3h3wH7wZoNMTpoCsTIrN+tPL2J8bSS04tcDYxcvnL3/E/uhU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRZacsk83G59vZ/li0acJZo267ZjX+r+t9zBdLDsF5OY3TPFIT
	rGZYOAY3+dOEd+opX8MGziAqJVGhOoo4t3XB8rLb07ry6Ff72HILGe8W
X-Gm-Gg: AYBFou2bCnSjudhfw7lgF57BnljLcColbDVtAaNb4Oe0T9xY1Y8pvhNBakXckCfw5Hy
	DYjB9woZ9yUzKglRb30fagdyK0KTIVfIgBK2AnvrdOKO4aZkAvhhnoOLnuXlSJmt+oVELnkrDsz
	VZuk1EL9cnDK5hXlyVPjM1U7JR1vf5i8kj9GFfivWXxTH1KHwELYhuVlkPxVJ2xeioleQvr7Gnl
	6TO4WnYN4fNKNibd458ZCWpidTWpCvEqluia80wWaH78omXe7Nwm3Ck9eDqHgXf+VVoWo/3E3DZ
	jbeVveg73UpPyQHEUDOOe72YecAM66zfu7HYB4vcM5/ORFd9oqE7gBaT4CxockUDxB55QtMiP9h
	HOxk21mscyZ0G+yjhczzabt63QiwkuEJYO0nT4w3cAhi5l3FqwlLpHrOt7YjJEc+b6RZD5HpMZ+
	BIK3CkZO1kNA2t/BkGX6uaTSaUEyCW6XODgvtxZ3tL9EKBZ7zqp9oKL/SBJSEOePBeHnfz2u7UO
	RdE6LDDO9+/uXQ0MhYWKovx1kzsMk/VLUJHp7OE9ep5VLEOwhab8abzr09n47rV59kFlZCXglvW
	x8XR9bZy0NCPOPP1HVZmltUA08hq9XHKhANsPVzx99mLDLxpwGnsE9d/KjReP84XRBUbhAAQpzt
	HLQZZIkJueJDfj8FZRuIVaPBcTVD3wL1MCjOQy5iPbVDb8ef2bpoCeVw3rIxQ78Tu5g/Z
X-Received: by 2002:a05:600c:4f4a:b0:4a3:5c67:55ed with SMTP id 5b1f17b1804b1-4a966c40261mr101368175e9.12.1793266083715;
        Thu, 29 Oct 2026 02:28:03 -0700 (PDT)
Received: from PC-Marco.local ([151.59.117.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm50821065e9.11.2026.10.29.02.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:28:03 -0700 (PDT)
From: Marco Ziliani <rylos78@gmail.com>
Date: Thu, 29 Oct 2026 10:27:53 +0100
Subject: [PATCH v2 2/3] media: i2c: ov5693: Keep the Bayer order when
 flipping at full resolution
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
Message-Id: <20261029-ov5693-fixes-v2-2-2526d7b13030@gmail.com>
References: <20261029-ov5693-fixes-v2-0-2526d7b13030@gmail.com>
In-Reply-To: <20261029-ov5693-fixes-v2-0-2526d7b13030@gmail.com>
To: Daniel Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, Chris Simpson <chris@nilk.net>, 
 Tony Garcia <tony@loafecho.com>, Simon Kruse <simon0x+git@proton.me>, 
 "D. Manresa" <dmanresa@gmail.com>, linux-kernel@vger.kernel.org, 
 Marco Ziliani <rylos78@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793266079; l=4414;
 i=rylos78@gmail.com; s=20261027; h=from:subject:message-id;
 bh=c2JXLazU12+3pgQEGqbk1oCR+N8hqQzt7tcW8ttLxNQ=;
 b=FPq29hBvMUTozAtKGykwQWWVYA2i9FPUvMYhExm+jNr6p9p+OM9FdTR8kVDVsWAImkZYo/0Um
 Q3lw/lsnlO9Dp8PNugZhvvCQUxw95yNBPLwXn17oBt5Fb9MOf8Nukqd
X-Developer-Key: i=rylos78@gmail.com; a=ed25519;
 pk=nXCfiK5yExPZCMp+lfKif3gdXkfjkUK2qk7bDW+ixMo=

In the full (unbinned) readout each of the horizontal and vertical
flips moves the Bayer phase by one column. With exactly one flip
enabled the CSI-2 receiver gets GBRG instead of the SBGGR10 the driver
reports, which gives a magenta and green image; with both enabled the
two shifts cancel out.

The crop start is only honoured in steps of two pixels, so compensate
by shifting the output window by one column when hflip XOR vflip, and
widen the crop by two columns, within the pixel array, so that the
window still fits. Reprogram the window when either flip changes. The
binned readout is left unchanged.

With this change, raw 2592x1944 frames come out BGGR at all four
hflip/vflip settings on the Surface Pro 5 (IPU3); the same change in
the linux-surface tree gave BGGR at all four settings on a Surface
Pro 7 (IPU4P) and a Surface Pro 9 (IPU6). Without it, the order is only
right with both flips off or both on.

Fixes: 89aef879cb53 ("media: i2c: Add support for ov5693 sensor")
Link: https://github.com/linux-surface/kernel/pull/181
Tested-by: Chris Simpson <chris@nilk.net>
Tested-by: Tony Garcia <tony@loafecho.com>
Signed-off-by: Marco Ziliani <rylos78@gmail.com>
---
 drivers/media/i2c/ov5693.c | 56 +++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 48 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index d09095c3e..9fedc087e 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -361,6 +361,49 @@ static const u8 ov5693_test_pattern_bits[] = {
 
 /* V4L2 Controls Functions */
 
+/*
+ * In the full (unbinned) readout each flip moves the Bayer phase by one
+ * column, so with exactly one of them enabled the CSI-2 receiver gets GBRG
+ * instead of the SBGGR10 the driver reports; with both enabled the two shifts
+ * cancel out. The crop start is only honoured in steps of two pixels, so
+ * compensate by shifting the output window by one column instead, and widen
+ * the crop so that the window still fits.
+ */
+static bool ov5693_bayer_shift(struct ov5693_device *ov5693)
+{
+	const struct ov5693_mode *mode = &ov5693->mode;
+	bool hflip, vflip;
+
+	if (mode->binning_x || mode->binning_y)
+		return false;
+
+	hflip = ov5693->ctrls.hflip && ov5693->ctrls.hflip->val;
+	vflip = ov5693->ctrls.vflip && ov5693->ctrls.vflip->val;
+
+	return hflip ^ vflip;
+}
+
+static int ov5693_window_x_configure(struct ov5693_device *ov5693)
+{
+	const struct ov5693_mode *mode = &ov5693->mode;
+	bool shift = ov5693_bayer_shift(ov5693);
+	u32 crop_end = mode->crop.left + mode->crop.width;
+	int ret = 0;
+
+	/* Widen the crop for the shifted window, within the pixel array */
+	if (shift)
+		crop_end = min(crop_end + 2,
+			       max_t(u32, crop_end, OV5693_NATIVE_WIDTH - 1));
+
+	/* Offset X */
+	cci_write(ov5693->regmap, OV5693_OFFSET_START_X_REG, shift, &ret);
+
+	/* Crop End X */
+	cci_write(ov5693->regmap, OV5693_CROP_END_X_REG, crop_end, &ret);
+
+	return ret;
+}
+
 static int ov5693_flip_vert_configure(struct ov5693_device *ov5693,
 				      bool enable)
 {
@@ -373,7 +416,7 @@ static int ov5693_flip_vert_configure(struct ov5693_device *ov5693,
 	if (ret)
 		return ret;
 
-	return 0;
+	return ov5693_window_x_configure(ov5693);
 }
 
 static int ov5693_flip_horz_configure(struct ov5693_device *ov5693,
@@ -388,7 +431,7 @@ static int ov5693_flip_horz_configure(struct ov5693_device *ov5693,
 	if (ret)
 		return ret;
 
-	return 0;
+	return ov5693_window_x_configure(ov5693);
 }
 
 static int ov5693_get_exposure(struct ov5693_device *ov5693, s32 *value)
@@ -566,16 +609,13 @@ static int ov5693_mode_configure(struct ov5693_device *ov5693)
 	cci_write(ov5693->regmap, OV5693_CROP_START_X_REG, mode->crop.left,
 		  &ret);
 
-	/* Offset X */
-	cci_write(ov5693->regmap, OV5693_OFFSET_START_X_REG, 0, &ret);
-
 	/* Output Size X */
 	cci_write(ov5693->regmap, OV5693_OUTPUT_SIZE_X_REG, mode->format.width,
 		  &ret);
 
-	/* Crop End X */
-	cci_write(ov5693->regmap, OV5693_CROP_END_X_REG,
-		  mode->crop.left + mode->crop.width, &ret);
+	/* Offset X and Crop End X follow the flips, see ov5693_bayer_shift() */
+	if (!ret)
+		ret = ov5693_window_x_configure(ov5693);
 
 	/* Horizontal Total Size */
 	cci_write(ov5693->regmap, OV5693_TIMING_HTS_REG, OV5693_FIXED_PPL,

-- 
2.56.0

