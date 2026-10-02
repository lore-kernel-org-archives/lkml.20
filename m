Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B22C48CD7A
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 11:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790940081; cv=none; b=ryqtJGgg5d67J2+yyHBSoKyDsDlZ1o+Y07tJI/iTqyZgkAbmbJAApKbeiAHb2cEAsmYCoXaoc94txIgJbrfxgciz+FD2XN5K8JMCFz6S92plpV7Sb01ud+nkOkblbGfU12l5IjAaj6LrUK35BFd6QNPPlbRsX2gllcIlO7Pqujw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790940081; c=relaxed/simple;
	bh=VXjopj5U+omqVAla7VGm6iwYDdGBC64jca9tjyI7yGg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VbJSD+SjGAlrwDTMTLdBwakQ1X7PWLKhc2pjPNyXrO/cFdRPskSQG2cuBOPK/Ab7XgiSLD1pHigWIunlqZMJn+WWHTQkJKLiO1wxV42kbu2yYWRg9uMs4432LJQon3kquTcVfazqQIRPjuxJUIa3Kv7Uj9Zdwx0DQcbM88P13Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KuByR8d6; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KuByR8d6"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba40cb7246so2242937e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 04:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790940078; x=1791544878; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0/tFurwhhHzFcRbrY5ZaJlaUHnJjgD55kmW9K0lAQ28=;
        b=KuByR8d6UjZRycl+So0RrwIwPBEicVYJcRk5+xAWoEub528JpDc1RboOKZM4pr9kjQ
         sJ/3nIqIi+3XtFZX/oayLkGHP2IQPXMQ5eCeQp1e6ZTyEBrLp0oUn6qMDrX/mbnyfbDz
         pFwEqMk2qHko4oUPXc65Szti3/xkYoouUcqBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790940078; x=1791544878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0/tFurwhhHzFcRbrY5ZaJlaUHnJjgD55kmW9K0lAQ28=;
        b=AMshKOzDl5Rq5fwpBtDsIFu2vFWjYube0o1D9moM70pJ+iqhiV346PDeRBeM8azjGD
         nIF9g8KwXzJoGK59atE1whWfinACBMI2ZMNEkhhLE3C+P2WSogd1j6izN8NdXtzD+Vs2
         WWvPqPpnVa8qY9m1/cBUdtOV/AOxoETJU7rc6MTCQ4Oz/sq0mwdR+6AQIUtIl28s1X3j
         uXL7RN0J07wJLY00wS7GLiGo30VBN9ZY6QU+q3XcqPhggBVTUJrSu2IYuIPS9WIep9vx
         Ad4mAFCqX0Z9DG1sAshBMfTuR0kAAiDjgy+GpEXUxH6Pqd5GbDrK1jKVnqQSBFoTD5Ns
         VMSA==
X-Forwarded-Encrypted: i=1; AKwUvBxtkN7XROJXdMiIuiZXpAXllvLfA/obNylmu5f6uCtEEsAWp7eNqAd89MoyPT+IEm30XX9/e+z4EXzSWeE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL40gOSEGdOP237kyCiKZG2+YPPDcHhw6S6ZltnsfgSnNm2C6B5
	ehZLIsgM11bDPtOTO1REacrlIt3eBdimoA2y3FddvLXh1Z1WaS4nmDFw4UW/5fkAeg==
X-Gm-Gg: AYBFou0r79psJo1qU17trgRgPS3mxcuiyqslN85EWIBOYdecnmfKsg9SNZjmMgMCOSS
	UN2G15HRIqnFzn7VkouJVMHaMBxrW7HHlnqoz5h5/7ywjtJkDaunY+/47q/b/Ew1hP5c0EdMcHZ
	DAzqfsYXhM92fpbcu8bN4nsQwdqM4iPJNjL9g0qgaTGTtRzqpnkYb39KWN30hkQfgCenpu/ZMCX
	nw4SMZ8X8Ow1dgkO6fRjVWX09e5kjfNut5iexTQN6tgSFHeTOx34Mcv+Kb1HIvmR/S9kZVzHyNK
	VYKY48esyzPlc+U8TdqxlsLUVfc1vEVYmFKKgVs2vzl/mopMcF2D4RG53Hy6v+Jqc4JRFFa6WTz
	yiVPDkgMZ2fVVS/oKrWEbT2YJCirqRWWpS9pZw2vI3kV972A5hFvrfTqGYrXAgXYTh6M+WBuBBp
	99t6TsIMX/7NIhueaJG1ISPk+UCuL2KfuKcKbY0dCos/Pts15sXnXZ9Tk7ATkWibrLB11RO8G18
	5qwgu1D6nbGdPTlO9XivGZuk5alFsJ4nh8cpXfBMLB1z8otoFFqePg=
X-Received: by 2002:a05:651c:553:b0:3a8:380c:9fb6 with SMTP id 38308e7fff4ca-3a88786c31dmr6898411fa.28.1790940077733;
        Fri, 02 Oct 2026 04:21:17 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e324350sm8562931fa.36.2026.10.02.04.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 04:21:16 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 02 Oct 2026 11:21:10 +0000
Subject: [PATCH v2 1/2] media: uvcvideo: Introduce scattered field for
 uvc_control_mapping
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-uvc-status-11-v2-1-a98a135df0eb@chromium.org>
References: <20261002-uvc-status-11-v2-0-a98a135df0eb@chromium.org>
In-Reply-To: <20261002-uvc-status-11-v2-0-a98a135df0eb@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3

Most of the mappings are contiguous, but the one for
V4L2_CID_ZOOM_CONTINUOUS is not. Instead it uses bytes 0 and 2 but
not 1.

To force reading the byte 1 every time we set the control we used a
fake size of 0, but that was far from nice.

Instead make a new field for this kind of controls.

Cc: stable@vger.kernel.org
Fixes: e5225c820c05 ("media: uvcvideo: Send a control event when a Control Change interrupt arrives")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 6 ++++--
 drivers/media/usb/uvc/uvcvideo.h | 6 ++++++
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index d2f722bc3459..6224ecf28ec6 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -998,7 +998,9 @@ static const struct uvc_control_mapping uvc_ctrl_mappings[] = {
 		.id		= V4L2_CID_ZOOM_CONTINUOUS,
 		.entity		= UVC_GUID_UVC_CAMERA,
 		.selector	= UVC_CT_ZOOM_RELATIVE_CONTROL,
-		.size		= 0,
+		.size		= 24,
+		/* Byte 1 (bDigitalZoom) is not part of the mapping. */
+		.scattered	= true,
 		.offset		= 0,
 		.v4l2_type	= V4L2_CTRL_TYPE_INTEGER,
 		.data_type	= UVC_CTRL_DATA_TYPE_SIGNED,
@@ -2815,7 +2817,7 @@ int uvc_ctrl_set(struct uvc_fh *handle, struct v4l2_ext_control *xctrl)
 	 * needs to be loaded from the device to perform the read-modify-write
 	 * operation.
 	 */
-	if ((ctrl->info.size * 8) != mapping->size) {
+	if ((ctrl->info.size * 8) != mapping->size || mapping->scattered) {
 		ret = __uvc_ctrl_load_cur(chain, ctrl);
 		if (ret < 0)
 			return ret;
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index af8cef94ffff..69ee3d0c971d 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -126,6 +126,12 @@ struct uvc_control_mapping {
 	 */
 	u8 size;
 
+	/*
+	 * True if the mapping does not cover all bits between offset and
+	 * offset + size.
+	 */
+	bool scattered;
+
 	u8 offset;
 	enum v4l2_ctrl_type v4l2_type;
 	u32 data_type;

-- 
2.56.0.rc1.315.gc6ed9934b7-goog

