Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F09A470121;
	Fri,  2 Oct 2026 08:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931473; cv=none; b=aVXL+t61qRdcFtwMRgsvwpW8TW3lf5+ENM88ccSg7Z0Tr6cUjxggUjWsRLBX9JVdPF8r5Uel9lzHB/PX4b+S5R1VaanTdrrZemTjL5yHcTXtAfpccyaAE5jjkmQBoo4z01li0vfqPFl57NJgCrnUbrZOTIMZjGB58+ytCUNpnm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931473; c=relaxed/simple;
	bh=jMM7S/IqcUtQXghund0XhiWoF9PS/cZInRPG/50Nh54=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TBiR4CbDyod2DkCvqeS/jg+3WQTYPx9Xz44w9fjy59Byyl/edPsX04mUQB3QPGWzfe3ON2Nh11qntaA+zX0sqIaK6jD4kLlA3QHfGZPoLJadNJw3UBkQH6jJqQ9l92is4yBr+J9zmbQKItmnwzh5dCOe0VP1PCLYjEt1J6QqDCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qffX9kw9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qffX9kw9"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 203BAC4AF1B;
	Fri,  2 Oct 2026 08:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790931473;
	bh=jMM7S/IqcUtQXghund0XhiWoF9PS/cZInRPG/50Nh54=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qffX9kw9TMl+ZHlDqJNtJJA0WVPDryZtZfvXAj8BLQdkWv7h2z4B21vYKfGvIOCrx
	 RdaXRLrVgDSzF4QiRAPs9ijLZWkeIvpzAwochTohFHCzXu83J9nxVhklmCacujw6Gl
	 NgjeGR2Wqf1DKoisEGimsdJ33iPENNCM11PBfv2sNb4wXttwVWj/Il/0bXahYGU//U
	 WDFokbvYNjWO2vJr1OLWLmv2upJN2YNbhnHAS65AFdNLXT+qwezooTlMwNRvmFDH2f
	 V9rtagTDc9vNCIRPAPHGxDf1fl+f1ay6svQMVXqCAMcO+7O8/8HG3U88qDxiCtOw/g
	 i1X3Lb48x3eRg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FCD3CA5FE0;
	Fri,  2 Oct 2026 08:57:53 +0000 (UTC)
From: Maurizio Casciano via B4 Relay <devnull+mauriziocasciano7.gmail.com@kernel.org>
Date: Fri, 02 Oct 2026 10:57:52 +0200
Subject: [PATCH v10 14/15] media: atomisp: allow raw Bayer capture
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-submission-media-yogabook-v10-b4-final-v10-14-817ec765b257@gmail.com>
References: <20261002-submission-media-yogabook-v10-b4-final-v10-0-817ec765b257@gmail.com>
In-Reply-To: <20261002-submission-media-yogabook-v10-b4-final-v10-0-817ec765b257@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Nicholas Roth <nicholas@rothemail.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Bingbu Cao <bingbu.cao@amd.com>, 
 Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790931470; l=4163;
 i=mauriziocasciano7@gmail.com; s=yogabook-kernel-20261002;
 h=from:subject:message-id;
 bh=cRtGWWj24ZHI7nUInXtrMBY5Ib/ZQiVAfOJrxS6w5ug=;
 b=Xw+KQ2bbCUzORE4qX4zav1R9ku46xTqdTk71kdQQxp3NMhqXCvkdPxnBrD28n/vy83xmSS/FY
 cSkS09dxdN0CcuWdk62bFAB7/3jnpKx9sl+9pBakDxY15Tn5sj5RkGI
X-Developer-Key: i=mauriziocasciano7@gmail.com; a=ed25519;
 pk=ODC2oSPBqt7ukC3AEDZNS7LIE21D8ke8TEHoNlxniNM=
X-Endpoint-Received: by B4 Relay for
 mauriziocasciano7@gmail.com/yogabook-kernel-20261002 with auth_id=1099
X-Original-From: Maurizio Casciano <mauriziocasciano7@gmail.com>
Reply-To: mauriziocasciano7@gmail.com

From: Maurizio Casciano <mauriziocasciano7@gmail.com>

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
 drivers/staging/media/atomisp/pci/atomisp_cmd.c   | 14 +++++++++++---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 17 ++++++++++++++---
 2 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 4d4c0726d9de..e7b817fd779a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3822,8 +3822,7 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 	int ret;
 
 	fmt = atomisp_get_format_bridge(f->pixelformat);
-	/* Currently, raw formats are broken!!! */
-	if (!fmt || fmt->sh_fmt == IA_CSS_FRAME_FORMAT_RAW) {
+	if (!fmt) {
 		f->pixelformat = V4L2_PIX_FMT_YUV420;
 
 		fmt = atomisp_get_format_bridge(f->pixelformat);
@@ -3845,7 +3844,10 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
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
@@ -3865,6 +3867,12 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
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
index 87c29a940f9b..9ce529b0c7b3 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -537,12 +537,17 @@ static int atomisp_enum_framesizes(struct file *file, void *priv,
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 		.code = input->code,
 	};
+	const struct atomisp_format_bridge *format;
 	struct v4l2_subdev_state *act_sd_state;
 	int ret;
 
 	if (!input->sensor)
 		return -EINVAL;
 
+	format = atomisp_get_format_bridge(fsize->pixel_format);
+	if (!format)
+		return -EINVAL;
+
 	if (input->crop_support)
 		return atomisp_enum_framesizes_crop(isp, fsize);
 
@@ -555,8 +560,13 @@ static int atomisp_enum_framesizes(struct file *file, void *priv,
 		return ret;
 
 	fsize->type = V4L2_FRMSIZE_TYPE_DISCRETE;
-	fsize->discrete.width = fse.max_width - pad_w;
-	fsize->discrete.height = fse.max_height - pad_h;
+	if (format->sh_fmt == IA_CSS_FRAME_FORMAT_RAW) {
+		fsize->discrete.width = fse.max_width;
+		fsize->discrete.height = fse.max_height;
+	} else {
+		fsize->discrete.width = fse.max_width - pad_w;
+		fsize->discrete.height = fse.max_height - pad_h;
+	}
 
 	return 0;
 }
@@ -630,7 +640,8 @@ static int atomisp_enum_fmt_cap(struct file *file, void *fh,
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


