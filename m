Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB2338C423;
	Fri, 16 Oct 2026 11:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792150384; cv=none; b=usychI1DKlN2ZAQb7J6tmE8J3pbpH9rS+2DM0iUSxPLbP063VRI2bZuUDrXk+7gAtObfZ6uH501yMX2ohn2GSBwj/VCG7QZqf6UGNH3KJyFSlSKXMuDeZsClHHaCOtI577kPR87Ly8ki50TJkX/f6yzbfdpdKuXKDfj5H5JlkvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792150384; c=relaxed/simple;
	bh=UrBG+PSxybY5KQyXIvQeAhz9sfFbtz3vij3Q6ZU4aSU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mPS0YixD3/sORB52OODZuM2t3Xx4i7lRWyj4DYqeJlUoluAydS3yt/Ld+errLaZrUw+ChhghxdvqcldK3kDA2Aucevsmv5X3YAU08pujeZ2oIUbVDVBUVRtbYdt3eI9V8hS9DcIENQ8cx5/1WiUnlZvrNnFFRCgr7ik2xkoK5aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ORNmSHa5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ORNmSHa5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8E869C2BCF4;
	Fri, 16 Oct 2026 11:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792150383;
	bh=UrBG+PSxybY5KQyXIvQeAhz9sfFbtz3vij3Q6ZU4aSU=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=ORNmSHa5Xejau/fWBYzBSZggSPIZpNYkqLn+CaDmoRCFTg464H0tCl0UvYcAiTMCJ
	 NKEFpKXPD1xDX1VcWlDugXxoCBC0/tIS4uIpDxYpBxmBXZgekYQue3pkAJLr7wrXyR
	 ZTDVs87yOLspJ+XivwrV4QVT9hwjj66W5na0uMwh3XW3k5PCMVmLe1nM4YGfEOJoxy
	 ktJY9JN0PSsFBlCMGsUrElNMeA9sXxInzS244n5yac49jXoMnDszr50wYuh9jaTQnh
	 eRR/xTKLG14ZEMhYQTCF+F/19NHMqlhzC/6hDxN57ntoKyzsSwetnCDsK5iIC3gTWE
	 UphXkvC2vsoKw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67839CCA464;
	Fri, 16 Oct 2026 11:33:03 +0000 (UTC)
From: George Neacsu via B4 Relay <devnull+geocausa.gmail.com@kernel.org>
Date: Fri, 16 Oct 2026 12:33:03 +0100
Subject: [PATCH] media: i2c: ov13858: Set the colorspace in the pad format
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-ov13858-colorspace-v1-1-51f0379ada0c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBMcLYmuEi1MpxoIFYUIpLsnL
 d/i/wqFMlOBuauQ6ebCMTRg34E7bThIsG8GJZVBiUbEG/U0TsLFK+aSrCOxoZIDaeul8dDClGn
 n558u6/t+y7oG+WQAAAA=
X-Change-ID: 20261016-ov13858-colorspace-b1204e3ad06d
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sergey Lebedev <lsa.uz@pm.me>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, George Neacsu <geocausa@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792150382; l=2395;
 i=geocausa@gmail.com; s=20261015; h=from:subject:message-id;
 bh=n/sxfBlSOnPixJhhw0pyum+d8qOEAc1WzMKK70SZHtc=;
 b=Zpn/iF9ypaqtLNPVHcupoCSzFtYcv9OgX0eUmR1g2JE7zMdNqS5BsJExqPy2wvWzdJ9b+lxsf
 nTpZYk+OOoNCaH5o5EzOz9XfG04/3jj1lX568wpF4bkNbKS6oRpJ2t5
X-Developer-Key: i=geocausa@gmail.com; a=ed25519;
 pk=KyQk/iWbxsikewDBh0SwlHI51RvAqahD3loqmRp9DVI=
X-Endpoint-Received: by B4 Relay for geocausa@gmail.com/20261015 with
 auth_id=1199
X-Original-From: George Neacsu <geocausa@gmail.com>
Reply-To: geocausa@gmail.com

From: George Neacsu <geocausa@gmail.com>

ov13858_update_pad_format() and the try format set in open() fill in the
size, code and field but leave the colorspace fields at zero, so the
sensor reports V4L2_COLORSPACE_DEFAULT. v4l2-compliance flags that: on
the Intel Surface Pro 11, Active VIDIOC_SUBDEV_S_FMT fails through the
media device. Report a raw colorspace, as imx355 and imx219 do.

Tested on the Snapdragon Surface Pro 11, with this driver built against
the 7.1 kernel the machine runs: the sensor reports Raw / None / 601 /
full range, streams 4224x3136 at 29.9 fps, and v4l2-compliance passes
46 of 46 on the subdev.

Reported-by: Sergey Lebedev <lsa.uz@pm.me>
Closes: https://lore.kernel.org/all/20261016070018.11932-1-lsa.uz@pm.me/
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: George Neacsu <geocausa@gmail.com>
---
Sergey found this while testing the ov13858 device tree series on the
Intel Surface Pro 11. It is independent of that series and applies to
linux-next on its own.
---
 drivers/media/i2c/ov13858.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/i2c/ov13858.c b/drivers/media/i2c/ov13858.c
index 5a49fa0ec..5be3d0888 100644
--- a/drivers/media/i2c/ov13858.c
+++ b/drivers/media/i2c/ov13858.c
@@ -1168,6 +1168,10 @@ static int ov13858_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 	try_fmt->height = ov13858->cur_mode->height;
 	try_fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
 	try_fmt->field = V4L2_FIELD_NONE;
+	try_fmt->colorspace = V4L2_COLORSPACE_RAW;
+	try_fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
+	try_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	try_fmt->xfer_func = V4L2_XFER_FUNC_NONE;
 
 	/* No crop or compose */
 	mutex_unlock(&ov13858->mutex);
@@ -1348,6 +1352,10 @@ static void ov13858_update_pad_format(const struct ov13858_mode *mode,
 	fmt->format.height = mode->height;
 	fmt->format.code = MEDIA_BUS_FMT_SGRBG10_1X10;
 	fmt->format.field = V4L2_FIELD_NONE;
+	fmt->format.colorspace = V4L2_COLORSPACE_RAW;
+	fmt->format.ycbcr_enc = V4L2_YCBCR_ENC_601;
+	fmt->format.quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;
 }
 
 static int ov13858_do_get_pad_format(struct ov13858 *ov13858,

---
base-commit: b810335a0699d1810683796b0e3ffe8827ddfe6c
change-id: 20261016-ov13858-colorspace-b1204e3ad06d

Best regards,
-- 
George Neacsu <geocausa@gmail.com>


