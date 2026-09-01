Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFBB4A0F0D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 19:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788289521; cv=none; b=HWUmhXqo0Hx74XFGiXEQv1GQjwD3xA1h4UgKlg9GuzkditmwApIKzUIJYxc6pA+b72rufRQXsaN54b36xAh8nIVGU+aSB1plOndjg7ZRrLlbmrFZHV8cWhFSQRcFc6CTbhAIuEkYP7c67LyNfc8dvYHCkIgmP6/eUHw2MrRIOoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788289521; c=relaxed/simple;
	bh=//jCPP+eb8u5m4CIItyod+pODqByyo2ifauCpaFZfQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OnUfGlPQr7BJPwx7ZlukCP7KWDqH5WgUSoYtYnWvCI3ACA4j8gbx4etPMTcApS2RRebkjDJY8bQ/3x2cj200ccdLNAKsYFRCp8kRiZuotVI5Ozg81Z3vBu2bhiwXX2qxVOTIaml2mz90TvEknWesgPXfBctQXHOW6I40k6uX88U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kBOO31QQ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kBOO31QQ"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso1144175e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788289511; x=1788894311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ch1L0Y83sVLilf517YsasLyC766SqlDIh2xPLCeCC2Y=;
        b=kBOO31QQyFzkZBf3o+UBOXQlcDUEc4nC8sjxp0CsmHOI2yV+rtQ0HSVXw7O21htUPU
         q5SQhMP69fzizKBhAIcEQ6er5zg3DNLZRq9wyg7xaLRE6Vjx2OF9UUXgoG5HLKDv18rZ
         GcdTuzCSHeKOu592VfiPs/dUE6Q7H3rwTiRUCZDC8WqfX7STdnQ7bVxwYWELaGv31aQc
         0MoHYjOzrlZadItpKYvWzSfaB9IKxm5J4G4UL/5Y80h8ZirNOOwEfOBnJyLYEAX5z8ga
         eSQo/Yi+DGIDv5cscGRtlRLf3uXrIqxE4EbW+Hq3Yo4NlVs9352L+F7y0I60Qajb71eW
         IDQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788289511; x=1788894311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ch1L0Y83sVLilf517YsasLyC766SqlDIh2xPLCeCC2Y=;
        b=DpBXEgSwu19ZQx6pBGaaFnvztWvJIbTtbCGx+WikMwcLmL1D7r4IGB6Nw0xVKWRwCO
         Um9FSueOlflbwCjJw+moEMa2HK73aJF9DBq43iC3ZZ9h/G8z+4fg8Ai2IJPgLIFKtmuA
         tC3Ts7E1E6LE7RYIvddNZgGaTGWDxStHdThaQXgFDF7rHodCzBtHxqDK3kwxg6jm9ieN
         yKZ5sTQPFYSVeX5j9OUM4KQEGSBq69kPuGxjzZBPrbppFoaR4d7UYu92i/W8q859K6LZ
         JqxfRFeMk2BmGQQSRN35bTSWif0NnS20XtbQm8+e478xbA31lG+8fqkZeJC3rGW0Ouuq
         KGqQ==
X-Forwarded-Encrypted: i=1; AHgh+RoJB0YcrPQJwB4TouIvFQW0THHruUd4rK0YmPVDVzBtMMGucrGLrKGacz/08EgE8o5Ucfrrpw37Ee/w+ns=@vger.kernel.org
X-Gm-Message-State: AFuF++lUlnFYpUnoOmQIRFx4svvMaJfmIp+7771BZ/4mjY3fnzaTXXI3
	DQrSn1WgVU/iuci+Z75VE8v+nPT1NufXY1+GZVxcdAVewi5UOWKokr8qL6tUW6iVZJPQQA==
X-Gm-Gg: AR+sD102zCjWtLIsIypg7j3yKZ2213fpPJnbxEBkyrf+mHu2oT224kSkbpn3hDgfmFO
	BA4bJLYl68CpsgKDtOMBbLbFFGqE/HtFbl/qcewQ82Lnxhx/Wwqdf32/4t78z2Sjf9Lhj32ism/
	Hd8almjoIyNxhel+WYE07/8yAie7lsVLW80BWgDcVCHX6tToG/2WE3n1NX+oXioUiZWvveesGz3
	DDJ0ytGP39uDQN6JtPmY2JmzNtv+UpDs/zMvyEt02rtvoFkRm5+gYTgmzYKR7V0vPaPIscAZsi6
	YiEvapVLpNOccUsyuqg+STFiqOFohKEz/34SBtItz3EtICyeeyN1p01ennfrrj3I40AkE7f6qic
	T47Oyrg8UXyORyNqy6LnrG+fk8zYaqeqJAoNGknHwN9N0fWsCKs2UeIcAVd27kPuhePqEvVzibK
	zuqip+fh9kZPkM/EBE1nhpKOspQX6ImCBQ41FlLWPYHQu3Et+9IMP5+gSSLnDOhHiqtkkqViUVG
	PmVps73rzKChOSjsLZabkNTn56/IO2o+cKMT5BQtw==
X-Received: by 2002:a05:600d:8449:b0:49b:96a0:5c00 with SMTP id 5b1f17b1804b1-49b96a05caemr527810025e9.13.1788289511378;
        Tue, 01 Sep 2026 12:05:11 -0700 (PDT)
Received: from 1Z10 ([78.213.73.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10148sm85481985e9.5.2026.09.01.12.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:05:10 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 15/16] media: atomisp: allow raw Bayer capture
Date: Tue,  1 Sep 2026 21:04:37 +0200
Message-ID: <7ff456265a838f201118adb178107bc7fa72a7d1.1788286339.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788286339.git.mauriziocasciano7@gmail.com>
References: <cover.1788286339.git.mauriziocasciano7@gmail.com>
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

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 14 +++++++++++---
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 19 ++++++++++++++++---
 2 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 759effdb2e8d..99d2b73b160d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3815,8 +3815,7 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 	int ret;
 
 	fmt = atomisp_get_format_bridge(f->pixelformat);
-	/* Currently, raw formats are broken!!! */
-	if (!fmt || fmt->sh_fmt == IA_CSS_FRAME_FORMAT_RAW) {
+	if (!fmt) {
 		f->pixelformat = V4L2_PIX_FMT_YUV420;
 
 		fmt = atomisp_get_format_bridge(f->pixelformat);
@@ -3838,7 +3837,10 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 	 * resolution + padding. Add padding here and remove it again after
 	 * the set_fmt call, like atomisp_set_fmt_to_snr() does.
 	 */
-	atomisp_get_pix_padding(isp, f, &padding);
+	if (fmt->sh_fmt == IA_CSS_FRAME_FORMAT_RAW)
+		padding = (struct v4l2_area) { };
+	else
+		atomisp_get_pix_padding(isp, f, &padding);
 	v4l2_fill_mbus_format(&ffmt, f, fmt->mbus_code);
 	ffmt.width += padding.width;
 	ffmt.height += padding.height;
@@ -3858,6 +3860,12 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 		return -EINVAL;
 	}
 
+	if (fmt->sh_fmt == IA_CSS_FRAME_FORMAT_RAW &&
+	    fmt->mbus_code != snr_fmt->mbus_code) {
+		fmt = snr_fmt;
+		f->pixelformat = fmt->pixelformat;
+	}
+
 	f->width = ffmt.width - padding.width;
 	f->height = ffmt.height - padding.height;
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 87c29a940f9b..aa6d13a4de89 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -537,12 +537,21 @@ static int atomisp_enum_framesizes(struct file *file, void *priv,
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
 
@@ -554,9 +563,12 @@ static int atomisp_enum_framesizes(struct file *file, void *priv,
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
@@ -630,7 +642,8 @@ static int atomisp_enum_fmt_cap(struct file *file, void *fh,
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

