Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482358;
	b=jmIAQwQimDSMWDgkHo8Ip5lppWOUzEgsALwiaQnWw8lvWliPinHd7NeqrSPpnc0HLovK
	 uPqNFVur/DdaXYlbMjED/jZ0U+2Br5It8RvJIt2GoPphkf3+9UC3GfqVdUu4rPdSdKIFH
	 TiQ3xu+ikUFZmdhjfLJMBI0yL8ypdwq3eJJACdGXciT+B/JQIJRQ2JdmvmZqLk8oDb0Or
	 LJApg9NBzShBEMIJcqyWOiml43OAapZRuqY3VjKEXy9Z8xCAL6xZbHhu/bevKiF0BXGqk
	 c9+XojEsxYC7tHFwQKYvKtUkZqDALGos1q9tlTZD9W5F+CLUtVjgXnoubYjtOladl1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482358;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=RARDUNso2icfuahIpwlSi1DoLgdkZJRY172RGCxGeuI=;
	b=o8unZTdiGIyC9grrI4ymEwT8Kj0hsjwWG8hfFLkj7vY/c7ddUIvACVf28cdJrN8pUcSZ
	 2iEMgzlrU6XS4y2nyVuf9V/kkACDk1zTkt1PXnDoSuX7ppHajzKS7cpqQHu53MCgcU/Hx
	 SBoezL6eEfb9TfcSK9fcYfDYmloQl/gIss0SCq6pnjcci/tl39So3NMRj0RIzy0DGxRxy
	 sRKRL4ytHZ/oU7nfZGeXsrGTaUcyIAK98j+guQt+wdzGtsCkGJ8z08q+UiXN5Aekkz9U1
	 5Z2amLmi7+4+ienO/6TTPFQ/eRq9A7hzSnfDClsnYstbT29kkIqfGKKaX/ZdRQx8V4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=j3OZEhdn;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7800A606A8A6;
	Thu, 12 Nov 2026 11:19:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7800A606A8A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=j3OZEhdn
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c67:cdf:7464:6c04:36e4:ee87])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3287833D;
	Thu, 12 Nov 2026 12:16:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794482212;
	bh=xofd+/15CE7oI+zMUa+EkPmKeTuu8nEV5/nucoS+HJo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=j3OZEhdndvdShsDh9zQiWRTMUBOqkv6YUgr9YtSO53zGtS8YuzQLPDxa4DhtjrHZM
	 d5NWw9bh3aZjTPmmnzqFrG3iPSov2g7v24wUZVtIx2rHdimnVsBHR/hGe02McNWFjq
	 u+u+mFqS8CG1tAUDRnbnpSY6rZyZeSUBzcGsJp+Q=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 12 Nov 2026 16:48:07 +0530
Subject: [PATCH v5 09/11] platform/raspberrypi: vchiq-mmal: Support ISP
 parameters and stats
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
Message-Id: <20261112-b4-vc-sm-cma-v5-9-d25e3b687e71@ideasonboard.com>
References: <20261112-b4-vc-sm-cma-v5-0-d25e3b687e71@ideasonboard.com>
In-Reply-To: <20261112-b4-vc-sm-cma-v5-0-d25e3b687e71@ideasonboard.com>
To: Stefan Wahren <wahrenst@gmx.net>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Phil Elwell <phil@raspberrypi.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 bcm-kernel-feedback-list@broadcom.com
Cc: Martin Wetterwald <martin@wetterwald.eu>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Paul Elder <paul.elder@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4934;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=xofd+/15CE7oI+zMUa+EkPmKeTuu8nEV5/nucoS+HJo=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBq9aB8SgMAZq4OuVxQySNSVHzSh+m9CS9LAcKTP
 eAV9NUQ27yJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCavWgfAAKCRBD3pH5JJpx
 Re+FEACfBXtzMtaYo4gLayfy6v2fqHz2+pQGt43rgROvXIZNudaaxHSAlSkZvhwMYPwzTvzTmm6
 98Hs5iH9OA1fS/N8B6zPvfaR+3af9G7fLGk3jHlLkIZOfdBAJRmQyMb2TNDzOk6UaiFUShCMsk8
 pKhseysm+Vn7m0gESuFJdI+08iaChb+kli/jcNTBuMYS36A4SjY1b3dSaHzaVB5yZpKas+gb5DY
 4tffgw85fK6coc37GsIk4Wx+Js1BEzgWJD5NThsojiUjXyY84Og0fii8QWhGEhOEuFjOALdMUNx
 0x/ysRpZO6h3l39KCQbaPWAXxsRB1ETeDG6D3SG3M6paaCgnhKmY5mNc1pV85UX9cOEfVVqU1oz
 d86O4AWgILXE9DEsL6Jlc7p8pHPZrOhD63ItGONKipKdGWlxLsTma7eehK1ClEeXiqHF8Z8Tycy
 ro/xlghEHdXpm+ybee2z3VZiRf3X8F3f8GXPO0mEiK/i+ZoC/eD0QSySiUsPEpAyvXgEpwyMw1g
 WZ9ombh9DIvn1ftx/wf+Nq+kl1Ktk3OWXDQHavAq/1ezDepEcOwYyR2nEY5xkHBydeO7eRb5I6g
 cNPHBqKDt2hhbaT1ipnunBBvALJ532ueQa2C6ZeThFLl1/XmBcs+BxB4gkkQgxk/SMtLj995Jtm
 M/KloPa8O3NILTQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

The ISP used on BCM2835 and derivative platforms is behind the VCHIQ
bus, where some parameters and statistics are accessed through the MMAL
layer.

So add the relevant structures, macros and enum values.

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
Tested-by: Paul Elder <paul.elder@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 include/linux/raspberrypi/mmal-encodings.h  |  4 ++
 include/linux/raspberrypi/mmal-parameters.h | 86 +++++++++++++++++++++++++++++
 2 files changed, 90 insertions(+)

diff --git a/include/linux/raspberrypi/mmal-encodings.h b/include/linux/raspberrypi/mmal-encodings.h
index e15ae7b24f73..eadf2e981408 100644
--- a/include/linux/raspberrypi/mmal-encodings.h
+++ b/include/linux/raspberrypi/mmal-encodings.h
@@ -73,6 +73,10 @@
  */
 #define MMAL_ENCODING_EGL_IMAGE        MMAL_FOURCC('E', 'G', 'L', 'I')
 
+/** ISP image statistics format
+ */
+#define MMAL_ENCODING_BRCM_STATS       MMAL_FOURCC('S', 'T', 'A', 'T')
+
 /* }@ */
 
 /** \name Pre-defined audio encodings */
diff --git a/include/linux/raspberrypi/mmal-parameters.h b/include/linux/raspberrypi/mmal-parameters.h
index a0cdd28101f2..6ae5a7a1932c 100644
--- a/include/linux/raspberrypi/mmal-parameters.h
+++ b/include/linux/raspberrypi/mmal-parameters.h
@@ -223,6 +223,64 @@ enum mmal_parameter_camera_type {
 	MMAL_PARAMETER_SHUTTER_SPEED,
 		/**< Takes a @ref MMAL_PARAMETER_AWB_GAINS_T */
 	MMAL_PARAMETER_CUSTOM_AWB_GAINS,
+		/**< Takes a @ref MMAL_PARAMETER_CAMERA_SETTINGS_T */
+	MMAL_PARAMETER_CAMERA_SETTINGS,
+		/**< Takes a @ref MMAL_PARAMETER_PRIVACY_INDICATOR_T */
+	MMAL_PARAMETER_PRIVACY_INDICATOR,
+		/**< Takes a @ref MMAL_PARAMETER_BOOLEAN_T */
+	MMAL_PARAMETER_VIDEO_DENOISE,
+		/**< Takes a @ref MMAL_PARAMETER_BOOLEAN_T */
+	MMAL_PARAMETER_STILLS_DENOISE,
+		/**< Takes a @ref MMAL_PARAMETER_CAMERA_ANNOTATE_T */
+	MMAL_PARAMETER_ANNOTATE,
+		/**< Takes a @ref MMAL_PARAMETER_STEREOSCOPIC_MODE_T */
+	MMAL_PARAMETER_STEREOSCOPIC_MODE,
+		/**< Takes a @ref MMAL_PARAMETER_CAMERA_INTERFACE_T */
+	MMAL_PARAMETER_CAMERA_INTERFACE,
+		/**< Takes a @ref MMAL_PARAMETER_CAMERA_CLOCKING_MODE_T */
+	MMAL_PARAMETER_CAMERA_CLOCKING_MODE,
+		/**< Takes a @ref MMAL_PARAMETER_CAMERA_RX_CONFIG_T */
+	MMAL_PARAMETER_CAMERA_RX_CONFIG,
+		/**< Takes a @ref MMAL_PARAMETER_CAMERA_RX_TIMING_T */
+	MMAL_PARAMETER_CAMERA_RX_TIMING,
+		/**< Takes a @ref MMAL_PARAMETER_UINT32_T */
+	MMAL_PARAMETER_DPF_CONFIG,
+
+	/* 0x50 */
+		/**< Takes a @ref MMAL_PARAMETER_UINT32_T */
+	MMAL_PARAMETER_JPEG_RESTART_INTERVAL,
+		/**< Takes a @ref MMAL_PARAMETER_UINT32_T */
+	MMAL_PARAMETER_CAMERA_ISP_BLOCK_OVERRIDE,
+		/**< Takes a @ref MMAL_PARAMETER_LENS_SHADING_T */
+	MMAL_PARAMETER_LENS_SHADING_OVERRIDE,
+		/**< Takes a @ref MMAL_PARAMETER_UINT32_T */
+	MMAL_PARAMETER_BLACK_LEVEL,
+		/**< Takes a @ref MMAL_PARAMETER_RESIZE_T */
+	MMAL_PARAMETER_RESIZE_PARAMS,
+		/**< Takes a @ref MMAL_PARAMETER_CROP_T */
+	MMAL_PARAMETER_CROP,
+		/**< Takes a @ref MMAL_PARAMETER_INT32_T */
+	MMAL_PARAMETER_OUTPUT_SHIFT,
+		/**< Takes a @ref MMAL_PARAMETER_INT32_T */
+	MMAL_PARAMETER_CCM_SHIFT,
+		/**< Takes a @ref MMAL_PARAMETER_CUSTOM_CCM_T */
+	MMAL_PARAMETER_CUSTOM_CCM,
+		/**< Takes a @ref MMAL_PARAMETER_RATIONAL_T */
+	MMAL_PARAMETER_ANALOG_GAIN,
+		/**< Takes a @ref MMAL_PARAMETER_RATIONAL_T */
+	MMAL_PARAMETER_DIGITAL_GAIN,
+		/**< Takes a @ref MMAL_PARAMETER_DENOISE_T */
+	MMAL_PARAMETER_DENOISE,
+		/**< Takes a @ref MMAL_PARAMETER_SHARPEN_T */
+	MMAL_PARAMETER_SHARPEN,
+		/**< Takes a @ref MMAL_PARAMETER_GEQ_T */
+	MMAL_PARAMETER_GEQ,
+		/**< Tales a @ref MMAP_PARAMETER_DPC_T */
+	MMAL_PARAMETER_DPC,
+		/**< Tales a @ref MMAP_PARAMETER_GAMMA_T */
+	MMAL_PARAMETER_GAMMA,
+		/**< Takes a @ref MMAL_PARAMETER_CDN_T */
+	MMAL_PARAMETER_CDN,
 };
 
 enum mmal_parameter_camera_config_timestamp_mode {
@@ -749,4 +807,32 @@ struct mmal_parameter_camera_info {
 				flashes[MMAL_PARAMETER_CAMERA_INFO_MAX_FLASHES];
 };
 
+enum mmal_parameter_ls_gain_format_type {
+	MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U0P8_1 = 0,
+	MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U1P7_0 = 1,
+	MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U1P7_1 = 2,
+	MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U2P6_0 = 3,
+	MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U2P6_1 = 4,
+	MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U3P5_0 = 5,
+	MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U3P5_1 = 6,
+	MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_U4P10  = 7,
+	MMAL_PARAMETER_LS_GAIN_FORMAT_TYPE_DUMMY  = 0x7FFFFFFF
+};
+
+struct mmal_parameter_lens_shading_v2 {
+	u32 enabled;
+	u32 grid_cell_size;
+	u32 grid_width;
+	u32 grid_stride;
+	u32 grid_height;
+	u32 mem_handle_table;
+	u32 ref_transform;
+	u32 corner_sampled;
+	enum mmal_parameter_ls_gain_format_type gain_format;
+};
+
+struct mmal_parameter_crop {
+	struct vchiq_mmal_rect rect;
+};
+
 #endif

-- 
2.56.0

