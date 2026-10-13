Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884483B19AB
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881100; cv=none; b=SCWmmZazFjvcdqeb4js+J6WCxrOnFzKtBBJgSQqwd9VzMtNaVRyKOLAjaOgiK3PB4gFY//C1Eg1QMF5s3kBs8A+tHDEWarLX93qMlvH57ERhGnnV7rzm25ILuGYZua9kU72YwmD1odoFzgikWo59WJCWObYZTFOu3hatDEoB1o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881100; c=relaxed/simple;
	bh=Yj7/r3V7V2R6q3THuaDyirDX8uACzoT+gyyQ8A18DYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uLhe3vifX+zASb/vp+Sc5VhqFexPBUqKlFAcDPb3bDIkHifl9mJuI+zTsVxXDiLaTDUnj7PG/0jQD38cjDAXsQA4jyTq/+LUHWQPO/F4dnT0vHYDL1iBD5yDd9mItZrHt3k2e7cffc6VX+xQeKvbgSjc/8CllzNurYw3UyGsXaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=C+4wlSNO; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="C+4wlSNO"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a19cba5c14so20059605e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1791881097; x=1792485897; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+88yKw9uuw2EdcgJVtm+SQd+xgw2+nuyatyOcnQehg8=;
        b=C+4wlSNOfSDvxTn2Rx/SKIJ7xN75o7sdAoOqq70KdMu+R2hQYCRZDZuHDAsymhkoOB
         EPHVCH3dHKoLQs1Lg9MBM23mPj56Qe9CXIjSa1TcA9RhiXjJ2ZaEUMrA25EFeyFhA8oM
         tNjJ4Xxe/Rsrl/i0eqP62zVrlmDkN0YaIQg461H9S3cGciloF1z+6iB1Jd14iYepOy4U
         9mlwl4EB5KlPMRM39hhOm1d4SGSwoAkDdsnp8rzSPZTO0bO2Jwpbqj/L3PrE+5/0LLdC
         z7EISUg3QYvIFFxJo0wsic9hIaUpw2z49t5RVzXFZPmeR1AI8OSS+KKqB6S83VvFBB0r
         ukjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791881097; x=1792485897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+88yKw9uuw2EdcgJVtm+SQd+xgw2+nuyatyOcnQehg8=;
        b=FY7VXDx0fnvN+7tNuk8wOyXxdTyI+jph7ZJXUZ4eGKTQr979CuuDrz1uJkRXeUvS+e
         yBmAZ8jTzISVczDdylK4LI8cbxrsrHJmN2q4ZauZ4wq3QmMzQKx9uIU1Hi8hlO8ZLz/f
         0dM2ZEVYqzpgbo/qqKKqFOz1OSaNaiji6zsiNzJJ4mStHsLNoF3Vbz6GVC94L1cGQqQi
         1eJSbm9H2lnoJJlTzMkpKIFsNL4Jh1VkGdOdcLzRPeskHoABO4dqx5ra5jKD9NZ7mMYg
         AKtuiT3ZE7xT+z4UTDhUP1pcWB/TzjCnXTTM1aXtWMVWiMF/aM+GWjOItmRLN4bbdt/Z
         GsfQ==
X-Forwarded-Encrypted: i=1; AKwUvBzn+cQtNng+D/HGKbqgMm6QKuhqE5tmg2DFf2C3TNXALAnafgRB2y/ISs9I6QKJOLfpKf2zuZAAZwVk3Fw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOCPmR9553izSNzbgIpl7FoLTAZ0SKU12YIuN3FxzG5jqWbDle
	09HI3zp4V1Ustudq2gEoYi9bkj00B6Yw5oidGyA+DfYsw+WBO69HlH8+srtMm1cLjeo=
X-Gm-Gg: AYBFou1rwTlv2GrGXR+PDh6Yy/qfcT7jtm/D02xJ/NW5nsiJClABM0h5UaUYg6E0Al9
	6Q026WGBzL1ULUI1xUszzLk7qcuDMzamg6NpONnw5UipQbHsql5VbfLLkpsjn2t/YwZXycaYzFI
	OV3D33aiJFLvYDpNcVoF5lOpGNB5DvMJEcoKVJkgXCb70205dY2iDl+cVl5ffAu6hyE85xrMuc8
	iXMOYOMDdvxGkAxA4OGD7KAyzsocStuLdLsqKS3Sm5Sd7FkrC9rQ4bpiC1uJBpTJhPuGVwG1U5O
	hz8CyCakQrg3yFkDr+qIxx+bX/HA/2A4O/6mHP7cV7QPD739xevI4WLA3xnN3WE4UyR+GdulbJ/
	WuVqni2tzl+aKyEqCNQNGhn5/OZCYois40EIJNgsdFHEMONzi0kT0shnJnaDHn96ooA60RsM5qY
	8xyKs+Ni8NHJfro8DMN7kCEApzhAeptOXHQwHP1evks0G31Ig0BNOnzHES+2wNT0Y2nkXR0qe8m
	uCMaw2W4f15n317j0uJV3Jig1pTLAA5N3JzBm+Ya2oewtvB58lctJ9ko8cqECqFN4pQ+9fBWTfA
	eFJtxr2xNMonrPCZvyjUZu9pkM4=
X-Received: by 2002:a05:600c:8718:b0:4a1:7259:349e with SMTP id 5b1f17b1804b1-4a18e4e0a33mr228754875e9.27.1791881096828;
        Tue, 13 Oct 2026 01:44:56 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c6:273c:cd01:6dd2:be4f:50f7:7ed8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c85009csm271888055e9.2.2026.10.13.01.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 01:44:55 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Tue, 13 Oct 2026 09:44:44 +0100
Subject: [PATCH RFC 1/4] media: qcom: camss: Enable the IFE pixel path on
 SM8550
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-sm8550-camss-ife-v1-1-d50de00077b7@imd-tec.com>
References: <20261013-sm8550-camss-ife-v1-0-d50de00077b7@imd-tec.com>
In-Reply-To: <20261013-sm8550-camss-ife-v1-0-d50de00077b7@imd-tec.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2

SM8550 IFE 780 shares the write master layout, pixel pipe and two
pixels per clock with the SM8650 IFE 880. Give the full IFEs a PIX
line with the PIX formats and treat SM8550 like SM8650 in the pixel
path helpers.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: William Bright <william.bright@imd-tec.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c |  6 ++++--
 drivers/media/platform/qcom/camss/camss.c     | 12 ++++++------
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 4f50a362e185..930e6cdf7e0a 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1389,12 +1389,13 @@ static bool vfe_check_clock_levels(struct camss_clock *clock)
  * vfe_pix_ppc - Pixels the pixel path consumes per VFE clock
  * @vfe: VFE device
  *
- * The VFE 4.x and TFE pixel paths take one pixel per clock, the SM8650 IFE
- * pixel path two.
+ * The VFE 4.x and TFE pixel paths take one pixel per clock, the SM8550 and
+ * SM8650 IFE pixel paths two.
  */
 static u32 vfe_pix_ppc(struct vfe_device *vfe)
 {
 	switch (vfe->camss->res->version) {
+	case CAMSS_8550:
 	case CAMSS_8650:
 		return 2;
 	default:
@@ -2580,6 +2581,7 @@ static int vfe_bpl_align_rdi(struct vfe_device *vfe)
 static bool vfe_pix_line_based(struct vfe_device *vfe)
 {
 	switch (vfe->camss->res->version) {
+	case CAMSS_8550:
 	case CAMSS_8650:
 		return false;
 	default:
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index beafbbc77329..98d9d63838d6 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3561,13 +3561,13 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
 		.reg = { "vfe0" },
 		.interrupt = { "vfe0" },
 		.vfe = {
-			.line_num = 3,
+			.line_num = 4,
 			.is_lite = false,
 			.has_pd = true,
 			.pd_name = "ife0",
 			.hw_ops = &vfe_ops_780,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_rdi_845
+			.formats_pix = &vfe_formats_pix_845
 		}
 	},
 	/* VFE1 */
@@ -3585,13 +3585,13 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
 		.reg = { "vfe1" },
 		.interrupt = { "vfe1" },
 		.vfe = {
-			.line_num = 3,
+			.line_num = 4,
 			.is_lite = false,
 			.has_pd = true,
 			.pd_name = "ife1",
 			.hw_ops = &vfe_ops_780,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_rdi_845
+			.formats_pix = &vfe_formats_pix_845
 		}
 	},
 	/* VFE2 */
@@ -3609,13 +3609,13 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
 		.reg = { "vfe2" },
 		.interrupt = { "vfe2" },
 		.vfe = {
-			.line_num = 3,
+			.line_num = 4,
 			.is_lite = false,
 			.has_pd = true,
 			.pd_name = "ife2",
 			.hw_ops = &vfe_ops_780,
 			.formats_rdi = &vfe_formats_rdi_845,
-			.formats_pix = &vfe_formats_rdi_845
+			.formats_pix = &vfe_formats_pix_845
 		}
 	},
 	/* VFE3 lite */

-- 
2.43.0

