Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD9D4570CF
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 16:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787933736; cv=none; b=O4p0kz3VCDI22AGZvVd/aMrgqb2D/EXTJIcDPwAsoSJXCM+fO025ZLzkFBcbsVnIqJk+7ACQC19G51c8D5GNevdIr4p+kKvhWetwRTBite9HPN8d+Vek7WRq6jw6Odc8oQ9DAmDgljsf3pKxsAD+PEHt2nF9Wl20tY7i1FQfSOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787933736; c=relaxed/simple;
	bh=EzKK3tOLcx+Z292EqgevpR0MpmThx27fQAv8PINqaz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QBcUvelTqTXm0ESCCfTuOua/VDvXqdqn5tICTDFN5gPXiwhWppkYN9/ra6B/d1C3G1H+wpD5B+njjOxLxKOpgiIoBMpa475xugj8+aFkXFrHr7Jo66fvISjDpbBcNsLqaivlqkty0Ns8ZyLQocgfCA08NMTRcjWSgCVB2yariPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GmZj4h4q; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GmZj4h4q"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-480001972b8so619215f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787933733; x=1788538533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SzHIdUXnLs0yhCnufi5W3K5DJwH27kuPBjXq3qx9ifk=;
        b=GmZj4h4qpC7eUURLofjv75hN3L/I+NnjG9Z9QmAASGyApHiQz/Mdmg8axv0gwPmwi0
         r3iOq0iMDXVzoNud0eC3IPWwhW9julpcHbQIjo62nqTVeTD5cGjphd+unBX6yfMbTmwL
         mJ0IDWMINQBOej+qf7gnGinWus1nYzzfoXQyu+BmYhGqB6XliXBn8IFHD5GM8CuNb79V
         vuZyjXtBmi4YPaMz3zKIco2QhA3+E1fKL4sO2cWJI6t2wHoPuOJZQvEbt+qE+2PYs/7e
         yNIZ+oVGkJEfT9X3BD6/gVX+KaiTscDeYe4vBLkLdZR+J3v54lKt0hW0v5U05/NHeJja
         7AGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787933733; x=1788538533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SzHIdUXnLs0yhCnufi5W3K5DJwH27kuPBjXq3qx9ifk=;
        b=sQ3IB7lDbp0ZEjTlg4Ci5Ur4r7L8rLMnBoqpmPQ95ITZ9GeDB6YEpPjBq9eznvGiln
         fBWgQY2o0fwSAYVaN3SZKJkPAqnFH6cl4C7Juif0RRV2YqlQ7SNjudEhxGCcJDFfo9iw
         LPEkj4MPoXL6ZyKDuEqIHz9IXv5/3+Ny5SmnPQK+NFNevmTNMtRrhPTQ8/Awy3PTd9B6
         /TCVtW7CkaAwD2rzD/vegfu10HOd00QAoVCWKtgzs/abnI01WxEsu3MbCZBz4gGmVBV6
         tSzOzc1tcH5BuRJZ+4mkJkpYQLAWrBMmAtJT91m6Loa+uYxm5YlBg783Z6DA6NzNzRQS
         ZlGQ==
X-Forwarded-Encrypted: i=1; AHgh+RqUYTDIyzG8t6114OSL7ItsMv9AgyRXL+nnJ/h21p8wuUp5pQjIJ/45nrQLb22C0F5B7ys+n5+iC+Vpjcw=@vger.kernel.org
X-Gm-Message-State: AFuF++mkHS80WOSvBTKaee/EpGH6VwvGKfGVR3ISxac5D49uaC+xI9M0
	P2pjpYTtyFW77Ys+z7qpCpKwOY2O8zkq7a+6hzUva7s0lGyNB9HUxPPT
X-Gm-Gg: AR+sD116MzuKdpWQNdTLa7th0iWLPrEA1baCT+SGws67s55e8h5kbme1mhxgJ19CdFa
	0UmihZD1/dhiHgxTQLTibCTxROSRUSJKAFKqSxLoqVyY+A5xAyh3Ypw4haVgfZ37kV469LUxQoy
	oivx6Mo1z/YdJLtxmXW/NXRGZCUxkfdrhZX5Rz15KXRq/zIQ+80wdCS81fGBLPjn6v3E3uNmBpw
	u/BJ9pYq+sO7GdNahmf9ML9p5EbXe7o/MP+Lm7rVOsMyyhC4Tvdgf7Goufvm7Hud1NDNrp7HT0o
	8CuDq7DL8qx9m3HwnD/zrEInRcO7ItXN/VLxV8cFsS0zWbLLNDDSsG8BQLa1kcd36PVThaPuZXl
	i99Ds7eW089xdnPAMGQyO57o8wF3ok2x0C+tvfXH7IulOBO+n8eM7kLrpMkWJBtMuDKQskyKHRl
	HI+EQbRKJ9BaMwst69QuG2OUOJTXTBMU11/5yv0y8kNWo627ibbpKkDMbtFSNAMwegXi7Yg/awl
	oWIxOrtmB1DX6n0F6oJFsg906Bz/uHF9emTEnEZ9Q==
X-Received: by 2002:a05:6000:24c6:b0:47f:4919:d5b2 with SMTP id ffacd0b85a97d-482f79870bemr11310698f8f.1.1787933733291;
        Fri, 28 Aug 2026 09:15:33 -0700 (PDT)
Received: from 1Z10 ([78.213.5.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f45sm7629739f8f.7.2026.08.28.09.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 09:15:32 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v4 14/15] media: atomisp: allow raw Bayer capture
Date: Fri, 28 Aug 2026 18:14:56 +0200
Message-ID: <749f33adb08c4b311aec241c0bdcc455fcdc0a3c.1787933456.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787933456.git.mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

AtomISP currently rejects all raw formats and silently substitutes
YUV420. This prevents userspace camera processing stacks from obtaining
unprocessed sensor frames.

Enumerate only the raw format matching the sensor media-bus code and
reconcile raw requests with the code selected by the sensor. Userspace
opts in by selecting that raw V4L2 pixel format with VIDIOC_S_FMT.

Raw formats expose the full sensor transport frame so ISP2401 can use
its copy pipeline. Processed formats retain the existing global padding
behavior; selecting a smaller receiver crop remains a userspace pipeline
decision.

Link: https://lore.kernel.org/linux-media/apCc_pt5dDxGJrei@ashevche-desk.local/
Link: https://lore.kernel.org/linux-media/apF0Cds9fnqQ7XRg@kekkonen.localdomain/
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: Codex:gpt-5.6-sol sparse
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 19 +++++++++++++------
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 19 ++++++++++++++++---
 2 files changed, 29 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 51dd59d98b3b..3d62cb948e31 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3572,7 +3572,6 @@ void atomisp_get_padding(struct atomisp_device *isp, struct v4l2_area size,
 	u32 min_pad_w = ISP2400_MIN_PAD_W;
 	u32 min_pad_h = ISP2400_MIN_PAD_H;
 	struct v4l2_mbus_framefmt *sink;
-
 	if (!input->crop_support) {
 		pad->width = pad_w;
 		pad->height = pad_h;
@@ -3806,8 +3805,7 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 	int ret;
 
 	fmt = atomisp_get_format_bridge(f->pixelformat);
-	/* Currently, raw formats are broken!!! */
-	if (!fmt || fmt->sh_fmt == IA_CSS_FRAME_FORMAT_RAW) {
+	if (!fmt) {
 		f->pixelformat = V4L2_PIX_FMT_YUV420;
 
 		fmt = atomisp_get_format_bridge(f->pixelformat);
@@ -3829,9 +3827,13 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 	 * resolution + padding. Add padding here and remove it again after
 	 * the set_fmt call, like atomisp_set_fmt_to_snr() does.
 	 */
-	size.width = f->width;
-	size.height = f->height;
-	atomisp_get_padding(isp, size, &padding);
+	if (fmt->sh_fmt == IA_CSS_FRAME_FORMAT_RAW) {
+		padding = (struct v4l2_area) { };
+	} else {
+		size.width = f->width;
+		size.height = f->height;
+		atomisp_get_padding(isp, size, &padding);
+	}
 	v4l2_fill_mbus_format(&ffmt, f, fmt->mbus_code);
 	ffmt.width += padding.width;
 	ffmt.height += padding.height;
@@ -3850,6 +3852,11 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 			ffmt.code);
 		return -EINVAL;
 	}
+	if (fmt->sh_fmt == IA_CSS_FRAME_FORMAT_RAW &&
+	    fmt->mbus_code != snr_fmt->mbus_code) {
+		fmt = snr_fmt;
+		f->pixelformat = fmt->pixelformat;
+	}
 
 	f->width = ffmt.width - padding.width;
 	f->height = ffmt.height - padding.height;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 43bca68d1e6d..edad38809fc9 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -540,12 +540,21 @@ static int atomisp_enum_framesizes(struct file *file, void *priv,
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 		.code = input->code,
 	};
+	const struct atomisp_format_bridge *format;
 	struct v4l2_subdev_state *act_sd_state;
+	struct v4l2_area padding = {
+		.width = pad_w,
+		.height = pad_h,
+	};
 	int ret;
 
 	if (!input->sensor)
 		return -EINVAL;
 
+	format = atomisp_get_format_bridge(fsize->pixel_format);
+	if (!format)
+		return -EINVAL;
+
 	if (input->crop_support)
 		return atomisp_enum_framesizes_crop(isp, fsize);
 
@@ -557,9 +566,12 @@ static int atomisp_enum_framesizes(struct file *file, void *priv,
 	if (ret)
 		return ret;
 
+	if (format->sh_fmt == IA_CSS_FRAME_FORMAT_RAW)
+		padding = (struct v4l2_area) { };
+
 	fsize->type = V4L2_FRMSIZE_TYPE_DISCRETE;
-	fsize->discrete.width = fse.max_width - pad_w;
-	fsize->discrete.height = fse.max_height - pad_h;
+	fsize->discrete.width = fse.max_width - padding.width;
+	fsize->discrete.height = fse.max_height - padding.height;
 
 	return 0;
 }
@@ -633,7 +645,8 @@ static int atomisp_enum_fmt_cap(struct file *file, void *fh,
 		 *
 		 * FIXME: fix the pipeline to allow sensor format too.
 		 */
-		if (format->sh_fmt == IA_CSS_FRAME_FORMAT_RAW)
+		if (format->sh_fmt == IA_CSS_FRAME_FORMAT_RAW &&
+		    format->mbus_code != code.code)
 			continue;
 
 		/* Found a match. Now let's pick f->index'th one. */
-- 
2.53.0

