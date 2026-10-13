Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9143CB563
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881103; cv=none; b=jcBN86tDnpMkbxqHYRdBAUA6LeG3r3QjrGnXZg0pmaccKKVRX9GNZJDqvghCQjetGMOCmi7HXiM7ZkvX5omYwHTFqnQEvXjGS40oe2qQTAIvwblvYpRbh/TXeuYKnmLv803V4sXGTK9G78AAlLYboGahQNq60Ff0QRnJiTqEOqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881103; c=relaxed/simple;
	bh=TekHIbIv8db5iwFYYqhFScmNw3hVmutVMEA84Y+7mxk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M2rPTULp+7kPS9byRO13rnziYz8fAs5d+wTkaHCX20mwr05SI3aDIKEcIZXusfoi2fimjmdGNAAc2G2Pyak7PJCuuaokzmalpFtkDLKq75vjrRiy6QKpzykp30zrDA5fivYAxrHOTO3tuyxGlQlDGCR8j+mr27xdn7UUf0llzrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=DMK6HsR0; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="DMK6HsR0"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1ad2e2391so2964895e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1791881100; x=1792485900; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5F8uP+QcKvbmyc1Lmz5UuDaLCd12tvjzDbK/HdI9dnE=;
        b=DMK6HsR0ptYZw9ZVRFNqlRUC4F2QA0IHhbwTh1eCXyv+xfR4gIHeLCQJPMRDVP9E5V
         UJ8cqSZo+fXAHbBRgOcbwrgFkUDcNKnQFkECTF872eLVtI/3EfxocOqPyeT3PTSSVeL1
         hKNYbwWhPRn7IHrqhD+61J0CGz6sW8RVM0EYKk4e8MgEqjAJLPd/n3h08B5BuC2najpc
         dcMxE2yQdJy2x8IUVsru8Y/LcogbVKXfN7Ni2oGT1qZTAY//NlZlSjoPyS9M3Vm9hiHa
         jjNPvS3PZPTxG8ypoFBQy/x+mmSqVcg5CebzEwqDv1TD7M8B5mrr8f5EVsle11Zb1CMf
         pqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791881100; x=1792485900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5F8uP+QcKvbmyc1Lmz5UuDaLCd12tvjzDbK/HdI9dnE=;
        b=0P3IQ1Z1ZtwdqfeFbjXN+7bUWn7vxPzrtr/6kYPDJutGgF4DNAEMYzWkvevqVq9lWu
         5kAEKj1GFf7bMrbxZTtsS8H+dbqGHGgfmYfoBOSFazdzFvGqaTPFwuGj+/qdlSxPPBSD
         gfOV/IFEHD0RP5lT4mLx0rxB3S7THXco5PdeuBB0qfYqiONc08JrZ5dqhVtTpWj1XJ+c
         yEjN5Yfm462ZFPuFMKmuiVoYkot7M823zwiXClMRIecVIIDIMRr4oMu8gw639yxe1pvu
         rQ33hxiFLPYo/Xmf9i6LO+IF7LZ3Muk3F6tOPL5SiMi+NMKyMTiweeTjebKn9pABpAnF
         fwQA==
X-Forwarded-Encrypted: i=1; AKwUvBxtRNcJfAULctPA+KlULNLhkPVx+SyfF8J984ilIl8TU7RIq8Ekh5PAaTuBELfTeyVLBaeK8/nnXo4MSMA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKVPvd1TY0I3iXs2+Dg+/aGiP7m2xeqzT3CzrWD1clDIzc5Bco
	nUR/2C4dpvLHLhxzZXKgzUsDgBQjIng3TxvW3K0BAmVOXx3MyWOUwALzbIrnCokAN1A=
X-Gm-Gg: AYBFou1vLP6xiXvdtoOHS8CzRzAAuZFQempBvPXnAJb2KMdMzQLqOGRv8EkgQzcn/76
	kzwFrl0b70dULgz/8Xkl2iztJrnPVYEGXChhLEtdp6NeBUwM4Q7pwZvlJil9PSS0ZtiI4H/VjAt
	X3Mu6WVF1WWj8hKBNj09PhRvaFVo//SEB1eRBbLpvqXRJtlVjAMgU6IO+ORL8+SQLHM+pQR9cCQ
	2/54CwSjVRUBwOp6R9Bn5FXU5pfGPqfe5FFVOt8ZpWOLVHRbUd3Wb1PuOjZ3m++5v+w6dGFUfWz
	SHbNguGbNSGx9z8wJzVkHjLjzCDDZJYvW13UDFhLA6HfQiainkrQSlT5A1/JXPonRLWR4Xop6MD
	0kLfobpCIC+/v58ql/OQ4TrPpGxQ4NPgpz1pqZs/XZca92Ws8J0FctbK9/l4XfQeVG10KkUenEg
	IvMx2zkklqQzbmFSCKvNSfen76jfuXctGl7d0dvHGJABGxV9clSeADscItbZOURxnVzjnDRdFiH
	8pTx4660hr+SUiA3e3zBxRQviKTWOp6m+RTJvA/qgAOYNGZA9Z5HPo5MWMPZi7VxJVmsIh3b1zj
	fcZ7MABlWmtBESesvjA25ZIcEqc=
X-Received: by 2002:a05:600c:4688:b0:4a1:8d46:6228 with SMTP id 5b1f17b1804b1-4a18e4a9ba5mr244599695e9.14.1791881099676;
        Tue, 13 Oct 2026 01:44:59 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c6:273c:cd01:6dd2:be4f:50f7:7ed8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c85009csm271888055e9.2.2026.10.13.01.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 01:44:59 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Tue, 13 Oct 2026 09:44:46 +0100
Subject: [PATCH RFC 3/4] media: qcom: camss: vfe: Add the demux + BLS stage
 to the pixel pipe
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-sm8550-camss-ife-v1-3-d50de00077b7@imd-tec.com>
References: <20261013-sm8550-camss-ife-v1-0-d50de00077b7@imd-tec.com>
In-Reply-To: <20261013-sm8550-camss-ife-v1-0-d50de00077b7@imd-tec.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2

The pixel pipe never subtracts the sensor black level, so blacks come
out lifted and a demosaic that is sensitive to a green pedestal mixes
colours.

Add the demux + BLS block ahead of demosaic as an opt in stage. It
takes the CFA order from the sink format, subtracts a static black
level and stretches the rest back to full scale. Its layout was worked
out on the IFE 780 against CamX's demux + BLS 1.4.1 settings; the
IFE 880 keeps it off until it is checked there.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: William Bright <william.bright@imd-tec.com>
---
 drivers/media/platform/qcom/camss/camss-vfe-780.c  |  3 +-
 .../media/platform/qcom/camss/camss-vfe-880-pp.c   | 65 +++++++++++++++++++++-
 .../media/platform/qcom/camss/camss-vfe-880-pp.h   |  3 +-
 3 files changed, 68 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-780.c b/drivers/media/platform/qcom/camss/camss-vfe-780.c
index c2ffe39f929a..032786c4ed74 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-780.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-780.c
@@ -247,7 +247,8 @@ static void vfe_line_prepare(struct vfe_line *line)
 	struct vfe_device *vfe = to_vfe(line);
 
 	if (line->is_pix && pix->pixelformat == V4L2_PIX_FMT_NV12)
-		vfe_880_setup_pixel_pipe(vfe, vfe_pp_desc(vfe), pix->width, pix->height);
+		vfe_880_setup_pixel_pipe(vfe, vfe_pp_desc(vfe), pix->width, pix->height,
+					 line->fmt[MSM_VFE_PAD_SINK].code);
 }
 
 static const struct camss_video_ops vfe_video_ops_780 = {
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-880-pp.c b/drivers/media/platform/qcom/camss/camss-vfe-880-pp.c
index f962016ef3c6..87e6a241ec05 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-880-pp.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-880-pp.c
@@ -11,6 +11,7 @@
 
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/media-bus-format.h>
 
 #include "camss.h"
 #include "camss-vfe.h"
@@ -18,6 +19,17 @@
 
 /* Register offsets, named as in the IFE register map */
 #define IFE_TOP_CORE_CFG_0                                       0x00024
+#define IFE_DEMUX_BLS_MODULE_CFG                                 0x03b60
+#define		IFE_DEMUX_BLS_PERIOD(n)				((n) << 20)
+#define IFE_DEMUX_BLS_EVEN_CFG                                   0x03b68
+#define IFE_DEMUX_BLS_ODD_CFG                                    0x03b6c
+#define IFE_DEMUX_BLS_GAIN_CFG_0                                 0x03b70
+#define IFE_DEMUX_BLS_GAIN_CFG_1                                 0x03b74
+#define IFE_DEMUX_BLS_SUB_G_EVEN                                 0x03b78
+#define IFE_DEMUX_BLS_SUB_G_ODD                                  0x03b7c
+#define IFE_DEMUX_BLS_SUB_B                                      0x03b80
+#define IFE_DEMUX_BLS_SUB_R                                      0x03b84
+#define		IFE_DEMUX_BLS_SUB(v)				((v) << 20)
 #define IFE_WB_GAIN_MODULE_CFG                                   0x04560
 #define IFE_WB_GAIN_WB_CFG_0                                     0x04568
 #define IFE_WB_GAIN_WB_CFG_1                                     0x0456c
@@ -313,6 +325,55 @@ static void vfe_setup_chroma_downscale_nv12(struct vfe_device *vfe, u32 w, u32 h
 	writel_relaxed(0x00000000, vfe->base + IFE_DOWNSCALE_MN_C_VID_OUT_DOWNSCALE_MN_C_V_PHASE_CFG);
 }
 
+/* 12 bit black level subtracted ahead of demosaic, 42 at 10 bit */
+#define IFE_780_BLACK_LEVEL	168
+
+/* Demux + BLS: CFA order from the sink format, black level subtracted */
+static void vfe_setup_demux_bls(struct vfe_device *vfe, u32 code)
+{
+	u32 even, odd, gain, bl = IFE_780_BLACK_LEVEL;
+
+	switch (code) {
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+	case MEDIA_BUS_FMT_SRGGB12_1X12:
+	case MEDIA_BUS_FMT_SRGGB14_1X14:
+		even = 0xc9;
+		odd = 0xac;
+		break;
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SGBRG12_1X12:
+	case MEDIA_BUS_FMT_SGBRG14_1X14:
+		even = 0xca;
+		odd = 0x9c;
+		break;
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	case MEDIA_BUS_FMT_SBGGR12_1X12:
+	case MEDIA_BUS_FMT_SBGGR14_1X14:
+		even = 0xac;
+		odd = 0xc9;
+		break;
+	default:
+		even = 0x9c;
+		odd = 0xca;
+		break;
+	}
+
+	gain = DIV_ROUND_CLOSEST(0x400 * 4095, 4095 - bl);
+
+	writel_relaxed(even, vfe->base + IFE_DEMUX_BLS_EVEN_CFG);
+	writel_relaxed(odd, vfe->base + IFE_DEMUX_BLS_ODD_CFG);
+	writel_relaxed(gain << 16 | gain, vfe->base + IFE_DEMUX_BLS_GAIN_CFG_0);
+	writel_relaxed(gain << 16 | gain, vfe->base + IFE_DEMUX_BLS_GAIN_CFG_1);
+	writel_relaxed(IFE_DEMUX_BLS_SUB(bl), vfe->base + IFE_DEMUX_BLS_SUB_G_EVEN);
+	writel_relaxed(IFE_DEMUX_BLS_SUB(bl), vfe->base + IFE_DEMUX_BLS_SUB_G_ODD);
+	writel_relaxed(IFE_DEMUX_BLS_SUB(bl), vfe->base + IFE_DEMUX_BLS_SUB_B);
+	writel_relaxed(IFE_DEMUX_BLS_SUB(bl), vfe->base + IFE_DEMUX_BLS_SUB_R);
+	writel_relaxed(IFE_DEMUX_BLS_PERIOD(1) | 1, vfe->base + IFE_DEMUX_BLS_MODULE_CFG);
+}
+
 /* IFE 880: Q10 gain of 4.0 */
 const struct vfe_pp_desc vfe_pp_desc_880 = {
 	.wb_gain = 0x00001000,
@@ -617,9 +678,11 @@ static void vfe_setup_ds16(struct vfe_device *vfe, u32 w, u32 h)
 
 /* Called from vfe_line_prepare() for NV12, ahead of the write masters and the IPP reg update */
 void vfe_880_setup_pixel_pipe(struct vfe_device *vfe, const struct vfe_pp_desc *desc,
-			      u32 w, u32 h)
+			      u32 w, u32 h, u32 code)
 {
 	vfe_setup_core_config(vfe);
+	if (desc->demux_bls)
+		vfe_setup_demux_bls(vfe, code);
 	vfe_setup_chroma_downscale_nv12(vfe, w, h);
 	vfe_setup_demosaic(vfe, desc);
 	vfe_setup_color_correction(vfe);
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-880-pp.h b/drivers/media/platform/qcom/camss/camss-vfe-880-pp.h
index fe3a604c579d..0a5ee6d85312 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-880-pp.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe-880-pp.h
@@ -9,12 +9,13 @@ struct vfe_device;
 /* What differs between the IFEs that run this pixel pipe */
 struct vfe_pp_desc {
 	u32 wb_gain;	/* WB gain register value for full scale */
+	bool demux_bls;	/* subtract the black level in demux + BLS */
 };
 
 extern const struct vfe_pp_desc vfe_pp_desc_880;
 
 void vfe_880_setup_pixel_pipe(struct vfe_device *vfe, const struct vfe_pp_desc *desc,
-			      u32 width, u32 height);
+			      u32 width, u32 height, u32 code);
 void vfe_880_set_aec_bhist_region(struct vfe_device *vfe, u32 h_offset,
 				  u32 v_offset, u32 h_num, u32 v_num);
 

-- 
2.43.0

