Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006654D4893;
	Mon,  5 Oct 2026 17:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220604; cv=none; b=epq8tHRq4B0rsnzeLJcNNynaX5Iqq9AYELdW94cF2JDAKQLy1+J+demCJuKJ50F2/FuQzyOkGCSGY8O0RbYdSF2Fgxyun3ap9xHDHbBo5I/Qgig3r1wmhV/6lMnPT6tY2lok2C43EgDuIeXjmOyK6Joucmm8dyyThdEDThkdMvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220604; c=relaxed/simple;
	bh=IQLyGXidtpbkyCvZQIX4xJNh4l5zzGcp0xK8oMd/3m0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mTKg0CQOgoSgzWvIDTquEb/kYVRz7rImO7r8W6kc5qyzxVsAxg/ngfxughwVAn45eW5OaymExbWnAiqv2eAUGBVr3lln7gCD8Tr3mOLJ/PK/7TcXvamqYQrLOLSo0YYiDX1wTLXdTXZF7ld7xgGxom2ZlorRD15Qrsh1HU8FooU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B+N2Z+s1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B+N2Z+s1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 860AB1F0089C;
	Mon,  5 Oct 2026 17:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220602;
	bh=vi4UyExXfuLIBkR6lt//Pf4ohXDPksZy8Lxi7mswrSA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=B+N2Z+s1ObTdVcsyb++lX0kMdkizNOuENTlP+uPA16S17H89kvadurduqw0/uAYQr
	 qAowdvZkDEv7d5Z6fIPNVWoyA4OwVnP8kmTDhDZSj5vtjO7/ukR7Yu+aalp6wjLgZf
	 qD2PovicmYgukw4qJgiQx+r3P2/7cTULhwS5hVd1iqg+0IXORAlNVwbiIcVdysk1+N
	 63bgGvAzGJu55+tZinX6d/78CN76JAxScLaDHY9Jyt+5ftqWfdeYQ4wrjeKkF2LYah
	 dlrnD62zJ8xDN2hKntayoIgVGq4fNuYFT0Z5Y5jA4olmCF9k0CURhAVAO3Q0CCDGFK
	 M8HkAM2DlX0TA==
From: Bryan O'Donoghue <bod@kernel.org>
Date: Mon, 05 Oct 2026 19:13:47 +0200
Subject: [PATCH 17/74] media: qcom: camss: Define PIX formats for x1e PIX
 interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-17-ed985aefd611@kernel.org>
References: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
In-Reply-To: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, Keke Li <keke.li@amlogic.com>, 
 Richard Acayan <mailingradian@gmail.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, 
 Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>, 
 Robert Foss <rfoss@kernel.org>, Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6247; i=bod@kernel.org;
 h=from:subject:message-id; bh=IQLyGXidtpbkyCvZQIX4xJNh4l5zzGcp0xK8oMd/3m0=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9sMtgeovv52EiMRe/4bedxd3fsn2zCY1Q6Qs
 t5HKPsFIOeJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbDAAKCRAicTuzoY3I
 OsGaEACJEB0ioxwTL5RhzQsmq13EhPTM23XOg4It/Tk3WGXaFhBIBpgckp+/+/fscWy6jToa50/
 4weMe1v+l8S0runuPHez5c8Y2Oh3mW0w6fWvC90G5jkePexqKGAo98S/jtaJKiZtQj27F59ZhEV
 miKv575xhShhT30Cx+wI997HM9mC1Yc23Pq4Z8aVCHxbPOnWi5tSKDl86KL28ZemgxIfNY1HNkh
 Wlnn8hdP0hZ+YjZ9vEtRsXko6A41yvYd2QVJoNyodlMSmH5gyBtJxZU1x/+40cUT6EXD3LzT2qy
 4aQwyJU/pAUc5k16KKKiRn5BDpXwcMW0K2zPaGQ3FQ4kR4pU8Df80pmod1DoK3szkjR3vc8pg43
 q+x6q9tph9egR9Xnl5JUpGmRHVC6Ern8TG+xQfEKV0r1Y3/s4H8KzfBBRRD9JvxatuBPpgwDJIk
 +N1EqvLm5G38yLymaKhVCcDwsp/zSmDi74/cPm/iZVRKtFUhpEf4wlixXjhJ7xYd9nbijmCNZrb
 Ypr/+wDthxqkHI3M1y176XVHYrt6C70I5Xbu8fKIYlEQO2apRnjMJ4k78s5H1sNxBkmAwy7O0cq
 KpVgMyhP/Wl05FDZOJvW4gMBMrO5wcqE+SM6SyunYtNuUlI6mgfRVhxgQ6QtSTjXtSzAuNP57mQ
 mTUTsRxN+YZqHuw==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 93 ++++++++++++++++++++++++++-
 drivers/media/platform/qcom/camss/camss.c     |  4 +-
 2 files changed, 92 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 319d191589884..5b5201b55a485 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -174,6 +174,94 @@ static const struct camss_format_info formats_rdi_845[] = {
 	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
 };
 
+static const struct camss_format_info formats_pix_845[] = {
+	/* Passthrought formats */
+	{ MEDIA_BUS_FMT_UYVY8_1X16, 8, V4L2_PIX_FMT_UYVY, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
+	{ MEDIA_BUS_FMT_VYUY8_1X16, 8, V4L2_PIX_FMT_VYUY, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
+	{ MEDIA_BUS_FMT_YUYV8_1X16, 8, V4L2_PIX_FMT_YUYV, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
+	{ MEDIA_BUS_FMT_YVYU8_1X16, 8, V4L2_PIX_FMT_YVYU, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
+	{ MEDIA_BUS_FMT_SBGGR8_1X8, 8, V4L2_PIX_FMT_SBGGR8, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 8) },
+	{ MEDIA_BUS_FMT_SGBRG8_1X8, 8, V4L2_PIX_FMT_SGBRG8, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 8) },
+	{ MEDIA_BUS_FMT_SGRBG8_1X8, 8, V4L2_PIX_FMT_SGRBG8, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 8) },
+	{ MEDIA_BUS_FMT_SRGGB8_1X8, 8, V4L2_PIX_FMT_SRGGB8, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 8) },
+	{ MEDIA_BUS_FMT_SBGGR10_1X10, 10, V4L2_PIX_FMT_SBGGR10P, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 10) },
+	{ MEDIA_BUS_FMT_SGBRG10_1X10, 10, V4L2_PIX_FMT_SGBRG10P, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 10) },
+	{ MEDIA_BUS_FMT_SGRBG10_1X10, 10, V4L2_PIX_FMT_SGRBG10P, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 10) },
+	{ MEDIA_BUS_FMT_SRGGB10_1X10, 10, V4L2_PIX_FMT_SRGGB10P, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 10) },
+	{ MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_LE, 16, V4L2_PIX_FMT_SBGGR10, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
+	{ MEDIA_BUS_FMT_SBGGR12_1X12, 12, V4L2_PIX_FMT_SBGGR12P, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 12) },
+	{ MEDIA_BUS_FMT_SGBRG12_1X12, 12, V4L2_PIX_FMT_SGBRG12P, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 12) },
+	{ MEDIA_BUS_FMT_SGRBG12_1X12, 12, V4L2_PIX_FMT_SGRBG12P, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 12) },
+	{ MEDIA_BUS_FMT_SRGGB12_1X12, 12, V4L2_PIX_FMT_SRGGB12P, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 12) },
+	{ MEDIA_BUS_FMT_SBGGR14_1X14, 14, V4L2_PIX_FMT_SBGGR14P, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 14) },
+	{ MEDIA_BUS_FMT_SGBRG14_1X14, 14, V4L2_PIX_FMT_SGBRG14P, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 14) },
+	{ MEDIA_BUS_FMT_SGRBG14_1X14, 14, V4L2_PIX_FMT_SGRBG14P, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 14) },
+	{ MEDIA_BUS_FMT_SRGGB14_1X14, 14, V4L2_PIX_FMT_SRGGB14P, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 14) },
+	{ MEDIA_BUS_FMT_Y8_1X8, 8, V4L2_PIX_FMT_GREY, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 8) },
+	{ MEDIA_BUS_FMT_Y10_1X10, 10, V4L2_PIX_FMT_Y10P, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 10) },
+	{ MEDIA_BUS_FMT_Y10_2X8_PADHI_LE, 16, V4L2_PIX_FMT_Y10, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 1, 16) },
+
+	/* 4:2:0 Bayer to YUV */
+	{ MEDIA_BUS_FMT_YUYV8_1_5X8, 8, V4L2_PIX_FMT_NV12, 1,
+	  PER_PLANE_DATA(0, 1, 1, 2, 3, 8) },
+	{ MEDIA_BUS_FMT_YVYU8_1_5X8, 8, V4L2_PIX_FMT_NV12, 1,
+	  PER_PLANE_DATA(0, 1, 1, 2, 3, 8) },
+	{ MEDIA_BUS_FMT_UYVY8_1_5X8, 8, V4L2_PIX_FMT_NV12, 1,
+	  PER_PLANE_DATA(0, 1, 1, 2, 3, 8) },
+	{ MEDIA_BUS_FMT_VYUY8_1_5X8, 8, V4L2_PIX_FMT_NV12, 1,
+	  PER_PLANE_DATA(0, 1, 1, 2, 3, 8) },
+	{ MEDIA_BUS_FMT_YUYV8_1_5X8, 8, V4L2_PIX_FMT_NV21, 1,
+	  PER_PLANE_DATA(0, 1, 1, 2, 3, 8) },
+	{ MEDIA_BUS_FMT_YVYU8_1_5X8, 8, V4L2_PIX_FMT_NV21, 1,
+	  PER_PLANE_DATA(0, 1, 1, 2, 3, 8) },
+	{ MEDIA_BUS_FMT_UYVY8_1_5X8, 8, V4L2_PIX_FMT_NV21, 1,
+	  PER_PLANE_DATA(0, 1, 1, 2, 3, 8) },
+	{ MEDIA_BUS_FMT_VYUY8_1_5X8, 8, V4L2_PIX_FMT_NV21, 1,
+	  PER_PLANE_DATA(0, 1, 1, 2, 3, 8) },
+
+	/* 4:2:2 Bayer to YUV */
+	{ MEDIA_BUS_FMT_YUYV8_1X16, 8, V4L2_PIX_FMT_NV16, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 2, 8) },
+	{ MEDIA_BUS_FMT_YVYU8_1X16, 8, V4L2_PIX_FMT_NV16, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 2, 8) },
+	{ MEDIA_BUS_FMT_UYVY8_1X16, 8, V4L2_PIX_FMT_NV16, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 2, 8) },
+	{ MEDIA_BUS_FMT_VYUY8_1X16, 8, V4L2_PIX_FMT_NV16, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 2, 8) },
+	{ MEDIA_BUS_FMT_YUYV8_1X16, 8, V4L2_PIX_FMT_NV61, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 2, 8) },
+	{ MEDIA_BUS_FMT_YVYU8_1X16, 8, V4L2_PIX_FMT_NV61, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 2, 8) },
+	{ MEDIA_BUS_FMT_UYVY8_1X16, 8, V4L2_PIX_FMT_NV61, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 2, 8) },
+	{ MEDIA_BUS_FMT_VYUY8_1X16, 8, V4L2_PIX_FMT_NV61, 1,
+	  PER_PLANE_DATA(0, 1, 1, 1, 2, 8) },
+};
+
 static const struct camss_format_info formats_pix_8x16[] = {
 	{ MEDIA_BUS_FMT_YUYV8_1_5X8, 8, V4L2_PIX_FMT_NV12, 1,
 	  PER_PLANE_DATA(0, 1, 1, 2, 3, 8) },
@@ -277,10 +365,9 @@ const struct camss_formats vfe_formats_rdi_845 = {
 	.formats = formats_rdi_845
 };
 
-/* TODO: Replace with pix formats */
 const struct camss_formats vfe_formats_pix_845 = {
-	.nformats = ARRAY_SIZE(formats_rdi_845),
-	.formats = formats_rdi_845
+	.nformats = ARRAY_SIZE(formats_pix_845),
+	.formats = formats_pix_845
 };
 
 static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index ff09873706c0d..6f3de2c185bc9 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4434,7 +4434,7 @@ static const struct camss_subdev_resources vfe_res_x1e80100[] = {
 			.pd_name = "ife0",
 			.hw_ops = &vfe_ops_680,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_rdi_845
+			.formats_pix = &vfe_formats_pix_845
 		},
 	},
 	/* IFE1 */
@@ -4458,7 +4458,7 @@ static const struct camss_subdev_resources vfe_res_x1e80100[] = {
 			.pd_name = "ife1",
 			.hw_ops = &vfe_ops_680,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_rdi_845
+			.formats_pix = &vfe_formats_pix_845
 		},
 	},
 	/* IFE_LITE_0 */

-- 
2.55.0

