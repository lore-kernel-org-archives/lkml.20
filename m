Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0D439CCFB
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 23:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791327990; cv=none; b=Joy2sltk2kEbT4QGkk8al73mdQGj27WNLG7dIyOR6OHi3RgLb/JdCvXRiVgUNdYFmoO/1/z8IZlDBXy1Bh+x73hwIR0QQCUKbKrka9SsEaLazYqDh8fUse+4N2NII9JLtNDzPnPXDzPf3WujHA37pZOz0kJG/r8crKO+X9WpKqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791327990; c=relaxed/simple;
	bh=H8xW3WaT5QzL7YlCh599OMCWmKVT/zJTArtkEPK7F6I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WIqd/oJxIwRG7Vu9QyaunyUsuwR3kvu5BWo6171V+asP3UyFTz7lSToiOlUHumTt+03jjcPUk9+CkjiPRmqMG7k+9oC9GByc/gf7heUi8XDpmY9YokkRsKFwwKRqBRa8C24zPGu/KsBRGYJcdJf79vFoNkENuCxcp0ZXLmOff1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cx2Ceru9 reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cx2Ceru9"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696Lebu32514194
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 22:41:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qyjU6pygVpJ
	nJM/+E+bubKaUn444o1Lpl8EIN3PRpWw=; b=Cx2Ceru9JX84D82EkYNx5nu+f+S
	iVxXUSMD2OdF87dgj9DmTYKRvIK4NxfbyX6Kmc2XsgC6zlBmqfLw0PByu+Zoyk84
	3Q6zNBv88gkqwWAIprn+FlYBVwqDH2ccEOUXbWdrAdFzQtBevqrDKnlNlQzZFf/O
	LYnS868iXPm3atbXfTrzfkXYRKhfApIv0/plKS93GFCs8WGJjet2FWjqkPl78uNX
	4rFujavQ+7tTFx9vlAedNwLl7k3nmfm9ePu0W8uF1CirbZBLL8pD4W+/i5OLbSS+
	51jr33tW7EyHQTrOoYPHvYXRLPZkzugF314IGa7L1HSjCYUJ7IUaG2cJN3Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xwwtweg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 22:41:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc0b31ecaso717206685a.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:41:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326503; x=1791931303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qyjU6pygVpJnJM/+E+bubKaUn444o1Lpl8EIN3PRpWw=;
        b=jRCxd9y68Xkz9Kd0gzE6s5fSjf7ojKUcyMDUtgyltShihgJGC+mHVdCdJP4/s2eWnf
         47dfXDp6PzhFOVsg6cxQn9L4ha7pnFAYDjPB/d67PtTTgmkxAZ/svhp4dxAWcbNDzihW
         RptwdilK4HCcThqt6vPdjs/66bTD97LqE8EGZ3iLm79JdQ11/jiwy2T4nF466MYz6QYO
         G5/PWbNCEQO2nNRbk6eNFbakD+5ROwfkMWmypdoHl7kPxCXmGQ8ABDNM4W9JKwEbUfeg
         hPKXIT+IG77luWjgAdElvevpAw4leDpqHyf7akVP2Ew1+6DIP/N+wh9S13e6E4s4N/vh
         4vtw==
X-Forwarded-Encrypted: i=1; AKwUvBwlj3U2fvnTmDqJi1kCJqKb4uXUWfKoX/dtFuNBgluN7htrl9WtzqDoxcmPiB+NwVrCn0Oe2EI1t/KtqM8=@vger.kernel.org
X-Gm-Message-State: AFuF++mpW/lwKnGFygIfv8/l4lsmUtb40z/NM+/2vgT5NNBGliqzPmHl
	OxEpIGLslmJkhNy+F3sZbzGSNTdpvRFeRdOnaZXeMLdvFFI8+2h64MHhNA8a+tMHfa29xbiHqcg
	nEw0GjQ9s+14OrDmZ9abR7CjSAMarfpcSCqNHrtX4pV7kFniM51rla55MwO6sAIKvUtg=
X-Gm-Gg: AYBFou1pNBP7UhzRS5DDPd9wRMrcg2KaT8ugrJfTX5kN6IDozOvVXfMlU/FEi65Qmwr
	/jETnKrP40p2Sau1+mL1dua4nJ+ZaNfGLDdrrrLkw+ogceH0ONbGbRfA0BG71QEDZq/8j0jqrzG
	RsdVhQ+bVIBgNIDm7h5lupAVPPOd3Tlag2Ve4BCtjyJLJl9U6W67AEubiXG0vwATT+JHfrcpqnH
	WXR4fKtWyB/HEJFseMzNVpAZAUhxJykw+LLpplPv7d24hJ+du8E4BGc8pOrqU6M5DDp50USzbUd
	f9gafWsNuso9AUZdt1JkiCE6dVEt66rsK5nVLse2FjvZJEnl31R4xmvrQr0=
X-Received: by 2002:a05:620a:618b:b0:93c:65f2:7d63 with SMTP id af79cd13be357-93e9b7c2094mr80060885a.31.1791326502953;
        Tue, 06 Oct 2026 15:41:42 -0700 (PDT)
X-Received: by 2002:a05:620a:618b:b0:93c:65f2:7d63 with SMTP id af79cd13be357-93e9b7c2094mr80053585a.31.1791326502350;
        Tue, 06 Oct 2026 15:41:42 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:41:41 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
Subject: [PATCH 38/45] media: qcom: camss: sa8775p: add gamma parameters
Date: Wed,  7 Oct 2026 01:39:46 +0300
Message-Id: <20261006223953.3382273-39-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfXytv+jZeRxFmH
 p2FYtZShaS3GIecyBf7ns9E0r2vyU73bUNcru0VGluHXXgBFVhgDqcbFWiz283x940PXyaV+wlN
 iHssf8OFofGzY7gN+ahE5GGV4hhuc26DGnbsD6vkyBj7E/33UPDMuGyX91t1BFOSsNS762Q1B6C
 4mlVVtyMvTDr0pOV7L9lACzbI2xiFfTDzzRSGUvnP0Lr9fn4WeU5PR1NlsVTaiIJ1qs79GMSRXE
 lnXA0PYD+FPUEiuEFANgOP9FTxty2dN6aW0HKEmQQYxGrsBbDFx1EAXSbBEQdvPeTFi/jrqWDec
 /sizKYIAQnX1EtzXjNMIlDm5Oadxae0z5jTQCHdLLLyKbDdnN6cnAu7TOJt/HnFLz4AAaMRdOIc
 KxrOI1obTtaOKzWn+kg3RqymCbeP1HbOemQRgbEBwOoq1wB0xV5pbKoXvTqX4BAULspmEgKVNeR
 9LpVJqE2fbXSaCYJasg==
X-Proofpoint-ORIG-GUID: awZRSu314-onP_I3TNX3XporU7noX3dM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfXyQSTcEJ5YtxH
 SeR6BBjneeHRf23SCPXgPKHyzystfNfkzNn0xIdUpP/lApwgWolfwhQvJ2S293hMsZg3R7CvNQ3
 rx0/LrNZYb2PnwoDS5DtLFYqg4DooX0=
X-Proofpoint-GUID: awZRSu314-onP_I3TNX3XporU7noX3dM
X-Authority-Analysis: v=2.4 cv=SJXXx+vH c=1 sm=1 tr=0 ts=6ac57927 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=A9bscV92ZXObkQ-UZPYA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610060090

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

Program the red, green, and blue gamma tables from IFE parameter
buffers. Upsample each userspace table to the hardware table size.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../platform/qcom/camss/camss-ife-mod-v41x.c  | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c b/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
index df21ea4040df..77d33c05cc6e 100644
--- a/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
+++ b/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
@@ -159,6 +159,15 @@
 #define IFE_MOD_V41X_LSC_LUT_SEL_RED		0x1
 #define IFE_MOD_V41X_LSC_LUT_SEL_BLUE		0x2
 
+/* Gamma LUT (GLUT) offset, registers and bitfields */
+#define IFE_MOD_V41X_GLUT_OFFSET		0x5f00
+#define IFE_MOD_V41X_GLUT_MODULE_CFG		0x60
+#define IFE_MOD_V41X_GLUT_CFG_EN		BIT(0)
+#define IFE_MOD_V41X_GLUT_LUT_SEL_NONE		0x0
+#define IFE_MOD_V41X_GLUT_LUT_SEL_G		0x1
+#define IFE_MOD_V41X_GLUT_LUT_SEL_B		0x2
+#define IFE_MOD_V41X_GLUT_LUT_SEL_R		0x3
+
 static void mod_v41x_wb_gain_config(struct ife_pp_ctx *ctx)
 {
 	void __iomem *base = ctx->base + IFE_MOD_V41X_WB_GAIN_OFFSET;
@@ -355,6 +364,58 @@ static void mod_v41x_lsc_apply(struct ife_pp_ctx *ctx,
 	}
 }
 
+static void mod_v41x_glut_enable(struct ife_pp_ctx *ctx)
+{
+	void __iomem *base = ctx->base + IFE_MOD_V41X_GLUT_OFFSET;
+	u32 value;
+
+	value = readl_relaxed(base + IFE_MOD_V41X_GLUT_MODULE_CFG);
+	value |= IFE_MOD_V41X_GLUT_CFG_EN;
+	writel_relaxed(value, base + IFE_MOD_V41X_GLUT_MODULE_CFG);
+}
+
+static void mod_v41x_glut_disable(struct ife_pp_ctx *ctx)
+{
+	void __iomem *base = ctx->base + IFE_MOD_V41X_GLUT_OFFSET;
+	u32 value;
+
+	value = readl_relaxed(base + IFE_MOD_V41X_GLUT_MODULE_CFG);
+	value &= ~IFE_MOD_V41X_GLUT_CFG_EN;
+	writel_relaxed(value, base + IFE_MOD_V41X_GLUT_MODULE_CFG);
+}
+
+static void mod_v41x_glut_config(struct ife_pp_ctx *ctx,
+				 const struct camss_ife_params_gamma_256 *cfg)
+{
+	void __iomem *base = ctx->base + IFE_MOD_V41X_GLUT_OFFSET;
+
+	mod_v41x_dmi_write(base, IFE_MOD_V41X_GLUT_LUT_SEL_G, cfg->table_g,
+			   CAMSS_IFE_GAMMA_256_SIZE);
+	mod_v41x_dmi_write(base, IFE_MOD_V41X_GLUT_LUT_SEL_B, cfg->table_b,
+			   CAMSS_IFE_GAMMA_256_SIZE);
+	mod_v41x_dmi_write(base, IFE_MOD_V41X_GLUT_LUT_SEL_R, cfg->table_r,
+			   CAMSS_IFE_GAMMA_256_SIZE);
+
+	/*
+	 * The last table's auto-incremented DMI_DATA writes only land in LUT
+	 * RAM once DMI_LUT_CFG.LUT_SEL changes value again - without this,
+	 * the final (R) table silently never commits and GLUT reads back
+	 * black on that channel. Deselect the LUT once more to flush it.
+	 */
+	writel_relaxed(IFE_MOD_V41X_GLUT_LUT_SEL_NONE, base + IFE_MOD_V41X_DMI_LUT_CFG);
+}
+
+static void mod_v41x_glut_apply(struct ife_pp_ctx *ctx,
+				const struct camss_ife_params_gamma_256 *cfg, bool enable)
+{
+	if (enable) {
+		mod_v41x_glut_config(ctx, cfg);
+		mod_v41x_glut_enable(ctx);
+	} else {
+		mod_v41x_glut_disable(ctx);
+	}
+}
+
 static void mod_v41x_awb_bg_config(struct ife_pp_ctx *ctx,
 				   const struct camss_pp_cfg *cfg)
 {
@@ -571,6 +632,14 @@ static void mod_v41x_params_apply_lsc(void *priv, const union camss_ife_params_b
 	mod_v41x_lsc_apply(ctx, &block->lsc, enable);
 }
 
+static void mod_v41x_params_apply_gamma(void *priv, const union camss_ife_params_block *block)
+{
+	struct ife_pp_ctx *ctx = priv;
+	bool enable = block->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
+
+	mod_v41x_glut_apply(ctx, &block->gamma_256, enable);
+}
+
 static const struct v4l2_isp_params_block_type_info mod_v41x_params_type_info[] = {
 	[CAMSS_IFE_PARAMS_COLOR_CORRECT] = {
 		.size = sizeof(struct camss_ife_params_color_correct),
@@ -578,11 +647,15 @@ static const struct v4l2_isp_params_block_type_info mod_v41x_params_type_info[]
 	[CAMSS_IFE_PARAMS_LSC] = {
 		.size = sizeof(struct camss_ife_params_lsc),
 	},
+	[CAMSS_IFE_PARAMS_GAMMA_256] = {
+		.size = sizeof(struct camss_ife_params_gamma_256),
+	},
 };
 
 static const camss_ife_params_handler_fn mod_v41x_params_handlers[] = {
 	[CAMSS_IFE_PARAMS_COLOR_CORRECT] = mod_v41x_params_apply_ccm,
 	[CAMSS_IFE_PARAMS_LSC] = mod_v41x_params_apply_lsc,
+	[CAMSS_IFE_PARAMS_GAMMA_256] = mod_v41x_params_apply_gamma,
 };
 
 static_assert(ARRAY_SIZE(mod_v41x_params_handlers) ==
-- 
2.34.1

