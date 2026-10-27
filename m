Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793132988;
	b=HCEQffzuB/R2FmXpA9a5GiF+4H4T5BGSH7G654aOhuLLh5p1D4B0GfC2zXWDC5Ljxsdp
	 RsmHE+21eCfE1srgRtvgFDO0lSxvSv9HCitt3I6XodbeDs7L7/LXg+HEterdnnkedfwQo
	 yG6P/o9vWCxx55AQ+LluhzxhDg+afxBASO9dcMC4evZ9HM58Z07e5z2nAI3dsHxE3fX5g
	 vXaFcZDyTlu4mQ9orV0V9TNjlNjpniURrB0I+9zub6QfbPNYYowC8ROorLaD5xm2coUyK
	 RPnUDxI0HOiw4r3i847NZUyiGbjodtNFE/AzJKCItqyhLlODEW1sOG3KeS4NLgCJVmQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793132988;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=VEZ+JLR/9WVBYPNaIRM0kUPmoKwXWz1Ip828TDbB3XY=;
	b=fUvm2xLMREMXm4BxGEhHUxtL9pQYNOnlI2Gbx4fBzuhFwLMuoYDVx5CbNbBdgN+oLfy3
	 Q0oUXNAMORbLCiYDgJl79vXrKhm5u1aKfAD+Jhp4eCScxKp0cJNnsbRmpeNl6MyidawQL
	 W8pGlEI7Bs98L3pI7cRyGsdl46Ne+eUh92rmi7pi6Acj56sRoZ/82A0soLQqJG8RYIBXO
	 ntrjG9YfFGMsDhlXOE72C2Rm/nM7CtKMeN+Pl2/oj0ClId5iup5mpS1bPz2+wR3hD/5/8
	 ElktjgAh4KHqdiguWp5QuwS6I1lGS+7JQ4lEAYusCBKepIT712yb8xZZzQJWOIheDlg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UcHT0C1q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63AB606A906;
	Tue, 27 Oct 2026 20:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UcHT0C1q
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793132987;
	b=qmM5fslZ9zt4KJZ9B16JIvXdVXTHINdw5WhbiwgBGI0ZnoQV2ROa6osywf/eo+mQTRwN
	 CNamBOTBoMqdwvy5eommNLr+PviUM53xsz3m3WEkxm6j1ewv2Yhpbm1PwT042Bi6nx0FH
	 YSl74N5hKEFeQTd0MT6/YzSS6TPc1V4RkJOZru8hvcdRQygO9rmvuncbGLOiC0W2hR4rp
	 PFUvuEc/+dEmKAixu2eueQw39OAzCWb9ebD3/SvNpGnuL0FciqZiVoukXVna7nRH/+tqN
	 GlUfNygN74GXY1OdjEzoJ2SCWfPTFF2OqwafJPtyLEDRZK6oWHwgfwLZMsu11jLCbEw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793132987;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=VEZ+JLR/9WVBYPNaIRM0kUPmoKwXWz1Ip828TDbB3XY=;
	b=UlkfDnidRLHbcWDGChnoJ9TkjUjUkazAKb6C4VLziKyPhh1i64FRTJqO2BAbkiOsoDIq
	 xn+tQWbHXEe9q5WX0qL2DiWp80B+yE87OR0Z0MncRaQMbltY685COVtpnUgEs/u5EDj1I
	 IhqfT03hBrqGyfRcY9xclh5Xql/uMMybRbyc0SMXMWeN2/aKae1v9SwAmN41h1+HJOisF
	 ZYPLn52nzem2mjvbP0tb41XDE82g3bRo0084CwaFkgNZtVSQg7gZLqVv9H3slJYfIm8wj
	 DeKXrfby8T5qmyFWhXmzy/ymTixO0XzjEXVpZPF11BFl2vOMAkPmVpLMWT0bsZdASVg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A75951F031E0;
	Tue, 27 Oct 2026 20:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793132987;
	bh=VEZ+JLR/9WVBYPNaIRM0kUPmoKwXWz1Ip828TDbB3XY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=UcHT0C1qf00Psj0rLSW3OPgUoCT5w9MRGNDccZ8cghw4Vjeznvcj/UI8/Y5HCPnIp
	 WCp251cKfYPuKq5v3rjXWmDM+Lcv4M84hFytBxH8AUojtqc3lagYLvM5Vgk1YwSqAv
	 IP3pR/jkmieuzu6QaBsTAXYSNabxAQjhyjBsoJJS+YpGgKjZcYEMJS3jKi64dNsEZd
	 Odgft5L7rBIxfZXUnaupIcvFn+HkubU7TcpRbd1ffF2+l/N2EStFdtV+L8MuwcpH6p
	 zS2HjVZ8JgYyj8vJRaEg0qMQ3dIvX5A5CT/E/pXzkfaWWlPAktFLtVIKrxSavAOIG/
	 Cp70JiEavedLg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 23B024520D;
	Tue, 27 Oct 2026 20:29:46 +0000 (UTC)
From: Marco Ziliani via B4 Relay <devnull+rylos78.gmail.com@kernel.org>
Date: Tue, 27 Oct 2026 21:29:46 +0100
Subject: [PATCH 2/3] media: i2c: ov5693: Keep the Bayer order when flipping
 at full resolution
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
Message-Id: <20261027-ov5693-fixes-v1-2-3c8ab1ae104d@gmail.com>
References: <20261027-ov5693-fixes-v1-0-3c8ab1ae104d@gmail.com>
In-Reply-To: <20261027-ov5693-fixes-v1-0-3c8ab1ae104d@gmail.com>
To: Daniel Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, Chris Simpson <chris@nilk.net>, 
 Simon Kruse <simon0x+git@proton.me>, "D. Manresa" <dmanresa@gmail.com>, 
 linux-kernel@vger.kernel.org, Marco Ziliani <rylos78@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793132984; l=4327;
 i=rylos78@gmail.com; s=20261027; h=from:subject:message-id;
 bh=bY5qiR9F/Y1aGuZr5TS65OJX6ey1ya1/HNWGJsKosVA=;
 b=9lwlbZoEg/2kfHXqrliosIUbaOzuhB1NR2kWmo6Ce7MfCiDmQ1m70k+0mO1go4vtLCfv+PyS/
 2QMiTEWRBNED7i/9d5+flisg6dpy+SsItVF8qdQ0QvGrzm3Ka9acvjJ
X-Developer-Key: i=rylos78@gmail.com; a=ed25519;
 pk=nXCfiK5yExPZCMp+lfKif3gdXkfjkUK2qk7bDW+ixMo=
X-Endpoint-Received: by B4 Relay for rylos78@gmail.com/20261027 with
 auth_id=1333
X-Original-From: Marco Ziliani <rylos78@gmail.com>
Reply-To: rylos78@gmail.com
Content-Transfer-Encoding: 7bit

From: Marco Ziliani <rylos78@gmail.com>

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
Signed-off-by: Marco Ziliani <rylos78@gmail.com>
---
 drivers/media/i2c/ov5693.c | 56 +++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 48 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index 579aa55b7..ca0968498 100644
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


