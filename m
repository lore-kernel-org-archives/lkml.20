Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02ED43A9630
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 22:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326525; cv=none; b=s101t8sl5PF9N2+twSYCMWk0vPoBor+HUbBnvcbTo28uy3R+br+aWhxEuo931g71W3G2DUXx+A8bJPicSMPLpsazSOCSuFmr2SYJfxSVu+ZlHLosopu4pyLuQtISu0l5aANmmKIKMMJylJvswW1Dsl5DvYmeK6CSJZLX4FoZ0bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326525; c=relaxed/simple;
	bh=Pmsmy2qqiP5xodTQBFlseJBs12bs8MwUvw4gFMv27cw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lAhsxjyvdiNHu05pZ9PA8nuK08ZxTwKMSCGPAtc/RsKFoCBQgKGLYWdfADoLNLIMsutGRv0YWwIdJPA8HQ02TXtqNc+VqfUrMTN4z1OJhiCVyk3O/Q5L7Y7qJAZJC9xlm+KmrZ0Qk2YgOBASnbSLSJ75Y3IMXwsa68SZHgvvOCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o/soTDBK reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o/soTDBK"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LebBZ2011543
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 22:41:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GF5lTBFJaVZ
	Rwfu404c6fB819j+awfZq7TKaG1+0FDU=; b=o/soTDBKz0G1PuYPKRSzTYXGQrx
	lDJH6djpYIVXAcppIcZYp7umWuDjES66P1EbvkTLXwv+z7K5HKgHUtEDUs6jVL78
	v/9Js40ZUpCvCcARGpKQFDkAPgNOKOfyVbDB0Vcc7NpfqSpMYf0EN6Tw62NDSGD3
	GpZReeSj+Ow66YwF9dW95b40yEVl6xvMBQTugqEqE7p5tk9/5mnVx+b3EXuBE/2G
	41O2I/SretAngDJkCFGnFFaBTia89HrEVYEepb0DQER8YVy2bg12FHq9d0bAtgJh
	slKogi+Ybum24xa1YZB09GOR2qUNzDcKqGq8axJ9PSxF+QUHGYskVo0XQrQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xc9u1ue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 22:41:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934956beec8so725237385a.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:41:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326505; x=1791931305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GF5lTBFJaVZRwfu404c6fB819j+awfZq7TKaG1+0FDU=;
        b=GFrbRlWRsV1ElASDr1/ivzzZjRzBwDuBx9K1TQSLrljd4Oxd5zD/52vlYs6sJz53xg
         i1rDaKxK4IlDei4W3ib4o9vHchNmTgmLQZwj7AXM8nGHgaxEEYd3Xfp5Rl65zPxAUztz
         fM65BlOKzas1MsyWqCZxZmWle098Ro8mRkYY9srHaZ52XugWdC1dZsmqz1eugNW1uSKO
         GE8JulJuxI5E3wg1DQvIw3M6SjM4JlCbuCr4JzRAEdYXzUkGOz+GD/2esAUWuOXSlx5+
         F0Ji4eTr5bTy05DIMCPHoiNYPwVevpk9D40zVFi7yuOfcRPPg9TzJ8SmPcBcN31v9LF/
         jezQ==
X-Forwarded-Encrypted: i=1; AKwUvBwYVwaQIxBOVjlQH4JxMz4QzWgw+E8Ckw18PEx4wclO6mO/a/3u173IWbFm0iHzaTdzV/F7I01dyY5ftUw=@vger.kernel.org
X-Gm-Message-State: AFuF++kSezCxCLwP2DFS6QHop/NdhthuwzPLOnRs0CJBPgnHtbsGoFyB
	d2XR2I2soXOilwlxYSfho4u8FDv+zKEDUycPHYbP9mtDa2bKAc1/hmXhDUaQK8NzKC+6z7n2le7
	Mr1XaZ/ff5q/LPKMbNlKy0/900gs38iCbyjBL6aGZEhfSUlN+vZy7ZFx5nCFY+1o6aQs=
X-Gm-Gg: AYBFou2p6DwuvByC9HhTFpvKYn6+TKYb3Tj2mZD8r1Bcdyxp+HrnFw7DYWXLuoYXkbF
	4oAdjxsxAXjE70S9yyvd8Rth6JP7KlSv92D+2P+NzxjHLQZKhfLU4S7PDkfTiXrTNuFaN6CFYRJ
	QP5xAEpvrw1iIydxAB9dKUOQFqorsmf2i4vGNc2N67NcxtEKtsWLmoKbiPinl//npevpNJSMfAC
	vDGpQxiNztgeEHCe/5+dKs/Au++kSqHqy94qtJyBv3mK3iaU93eaPlhm/xQaRI0pU+9VO2hIbqv
	yaUYexjwdia6oOIzz/OW9IoWB1zCTMwFfLBCfBIEE9sjTuVlQJsn09HIiNw=
X-Received: by 2002:a05:620a:2a08:b0:93e:980a:88b9 with SMTP id af79cd13be357-93e9b895493mr76887985a.72.1791326504607;
        Tue, 06 Oct 2026 15:41:44 -0700 (PDT)
X-Received: by 2002:a05:620a:2a08:b0:93e:980a:88b9 with SMTP id af79cd13be357-93e9b895493mr76885285a.72.1791326504231;
        Tue, 06 Oct 2026 15:41:44 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:41:43 -0700 (PDT)
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
Subject: [PATCH 39/45] media: qcom: camss: sa8775p: add white balance parameters
Date: Wed,  7 Oct 2026 01:39:47 +0300
Message-Id: <20261006223953.3382273-40-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=ctMOAF4i c=1 sm=1 tr=0 ts=6ac57929 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=rrQ0n_boRlREehwvzwcA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX9A7MDMSts0rO
 dhfgfbGlCTMyOkSEVneRmrLrF+MBkfkY5Xex4zFIaDT33uP52i6Y3VxeuzXo7hbKGs77W/jXcNC
 LO6Swvxxex1RQTHiUC5jLdfbvp5yLE8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX7XunvoWd8f18
 R8NLrv4Hkbm13kKxjvzHK6bINJJtkxa8Xhe83fv0eoVsqWLGFAN2uFF9doDHk6Ao8BMGWwhCjNn
 2JF4l4ArebJLuPrJoCoNALdhm+SzuYyhFFf9RX1MF/E2759KNmcV+QOJVXZH+szM8Sj6t0AFQfD
 KRso94tmFrE9AGYwUHtguHZPmSXY5i3eY3HORYpaPhftLvFKVEk+KOtWP+GvqRWjoI1+VgH+284
 aVu4IEj2xScc8gxk3WzU6pyQWKhqVA59TEk0R1PpqPRHmdiWufZjCW0ygwdaSMFFGVAbyNXyap4
 f+mEp4rMStbI2vhr/lwg7rTLvIj+uq4ZvKCeeKnItUBuozz6UPNRo6l1l10oeuendQwvBMFTi2B
 71DYcIYztJ3PVnm+I+eXITtOgj639WVodM33+cO6ij8UHDs5QNtsKUzPTb3r9eVCDYrgfv4swEu
 Bn3hKh/fkYSkfC8lT5w==
X-Proofpoint-ORIG-GUID: 3NIfWCK64hEFkj8uZjrBgUHZNiJVeiMc
X-Proofpoint-GUID: 3NIfWCK64hEFkj8uZjrBgUHZNiJVeiMc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

Program the red, green, and blue white balance gains from IFE parameter
buffers. Enable or disable the gain block as requested.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../platform/qcom/camss/camss-ife-mod-v41x.c  | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c b/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
index 77d33c05cc6e..3c53f585133c 100644
--- a/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
+++ b/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
@@ -179,6 +179,36 @@ static void mod_v41x_wb_gain_config(struct ife_pp_ctx *ctx)
 	writel_relaxed(value, base + IFE_MOD_V41X_WB_GAIN_CFG_2);
 }
 
+static void mod_v41x_wb_gain_set(struct ife_pp_ctx *ctx,
+				 const struct camss_ife_params_wb_gain *cfg)
+{
+	void __iomem *base = ctx->base + IFE_MOD_V41X_WB_GAIN_OFFSET;
+
+	writel_relaxed(FIELD_PREP(IFE_MOD_V41X_WB_GAIN_VALUE, cfg->g),
+		       base + IFE_MOD_V41X_WB_GAIN_CFG_0);
+	writel_relaxed(FIELD_PREP(IFE_MOD_V41X_WB_GAIN_VALUE, cfg->b),
+		       base + IFE_MOD_V41X_WB_GAIN_CFG_1);
+	writel_relaxed(FIELD_PREP(IFE_MOD_V41X_WB_GAIN_VALUE, cfg->r),
+		       base + IFE_MOD_V41X_WB_GAIN_CFG_2);
+}
+
+static void mod_v41x_wb_gain_apply(struct ife_pp_ctx *ctx,
+				   const struct camss_ife_params_wb_gain *cfg,
+				   bool enable)
+{
+	void __iomem *base = ctx->base + IFE_MOD_V41X_WB_GAIN_OFFSET;
+	u32 value;
+
+	value = readl_relaxed(base + IFE_MOD_V41X_WB_GAIN_MODULE_CFG);
+	if (enable) {
+		mod_v41x_wb_gain_set(ctx, cfg);
+		value |= IFE_MOD_V41X_WB_GAIN_CFG_EN;
+	} else {
+		value &= ~IFE_MOD_V41X_WB_GAIN_CFG_EN;
+	}
+	writel_relaxed(value, base + IFE_MOD_V41X_WB_GAIN_MODULE_CFG);
+}
+
 static void mod_v41x_demosaic_config(struct ife_pp_ctx *ctx)
 {
 	void __iomem *base = ctx->base + IFE_MOD_V41X_DEMOSAIC_OFFSET;
@@ -632,6 +662,14 @@ static void mod_v41x_params_apply_lsc(void *priv, const union camss_ife_params_b
 	mod_v41x_lsc_apply(ctx, &block->lsc, enable);
 }
 
+static void mod_v41x_params_apply_wb(void *priv, const union camss_ife_params_block *block)
+{
+	struct ife_pp_ctx *ctx = priv;
+	bool enable = block->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
+
+	mod_v41x_wb_gain_apply(ctx, &block->wb_gain, enable);
+}
+
 static void mod_v41x_params_apply_gamma(void *priv, const union camss_ife_params_block *block)
 {
 	struct ife_pp_ctx *ctx = priv;
@@ -650,12 +688,16 @@ static const struct v4l2_isp_params_block_type_info mod_v41x_params_type_info[]
 	[CAMSS_IFE_PARAMS_GAMMA_256] = {
 		.size = sizeof(struct camss_ife_params_gamma_256),
 	},
+	[CAMSS_IFE_PARAMS_WB_GAIN] = {
+		.size = sizeof(struct camss_ife_params_wb_gain),
+	},
 };
 
 static const camss_ife_params_handler_fn mod_v41x_params_handlers[] = {
 	[CAMSS_IFE_PARAMS_COLOR_CORRECT] = mod_v41x_params_apply_ccm,
 	[CAMSS_IFE_PARAMS_LSC] = mod_v41x_params_apply_lsc,
 	[CAMSS_IFE_PARAMS_GAMMA_256] = mod_v41x_params_apply_gamma,
+	[CAMSS_IFE_PARAMS_WB_GAIN] = mod_v41x_params_apply_wb,
 };
 
 static_assert(ARRAY_SIZE(mod_v41x_params_handlers) ==
-- 
2.34.1

