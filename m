Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A85D3D1CC1
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 22:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326570; cv=none; b=JEligefm3JthAMV/lHLiqJygPAj+NhNKjrP5E4GaymOEC+XkZuKfmc5B4MuE8Z8jReO7qNKq7cE9WgdZ8AmREhikWar1CCUlQ/mbKcaNr1l1qOum0iogJGDVXAv2ddxDAfhMssugAwIF87UVev/UhWSqLk9sfJviA++eMgjbFpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326570; c=relaxed/simple;
	bh=lf2gPKESrvmkB7VGLx+xjcIuYcPGvqsnSmiCwFiffBo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P4tJGW0lHgWZMPNY+cea+MCZCKZXdChMXA5ckaSt11xPolH2lxxYVV2ynKAHYnSUaEFuEZotfrLehauGuXyYc3PmpVguX6ovPFLEoj7lLuMF9Lf7Bg/5BgFHAzRQaX47mLhSM4Cw7vD7q2tklNwaB0AQJ6LvOx4Yxc+yg2amqGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WXki4E/m reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WXki4E/m"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LeRag3050171
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 22:41:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Wt6WAlPSs5v
	av3gbeuNRj5D/mZ8C7CaxsN9sJXdvD8Y=; b=WXki4E/mTbwW/uxDPoIHaJKh4T0
	XdUpP00mXJRbARoQK47zyVDMA+UcTFf+QjgyFbi4HHJ51oyodROl2chU/DKKTRlH
	le4CjLcvwGjuoYzq9q3lMFOm9gMJ1k5eLjwgMDZqSkyEaI31dXKAhJrGfOMmmHVw
	7PkZNTTa2FIxJzPL3SMzHkXBXLWUm7i9LbHksbrWnYKgJOWWwfJ4PHpmmPUqAvEp
	r2U0tLTkSGz58UlzXdkdzc8qWWZ+eEiWhOpSZ13iIK0FIfD7FucawDviAquRiFJb
	Uuym1+oVdmUSifadEW7POwBxcZk1h86MksuaJJ6qBMSmOiv9NkrR4HSaC5A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xc531d0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 22:41:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93caf7856ffso574311885a.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:41:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326507; x=1791931307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wt6WAlPSs5vav3gbeuNRj5D/mZ8C7CaxsN9sJXdvD8Y=;
        b=W9mchq/4VOfc/2Ixc1MjhUTsdXIKW8xh0jWFmpZu4owhh6J19JzgZ2W/a8V4u9SFcm
         hOEL+RIPI2VyIWSCOwqahScWQOqq0m9aq54daaftNsnlM2ETLwb2zOr+qJBaGZDVfAjQ
         JRRtIu28Qbn8bsdjdOEBWhrf1AgXeUNuCQ6Mw/sRgII/w8z8YRaiGk81xLfkcTA4VfQZ
         cLq65tYo5r78RnzU7WmsCwmhtUxbr6tj31EcUSiFptFr46NQnez1JyKqQVUk3xG6cm4m
         XoDSmVHF/xt+sX7RL9Tzdsjdv7a6kaiwUo/BRUhEht5vLZPBOwmxHcLWYeGSTch6IAiT
         oFUg==
X-Forwarded-Encrypted: i=1; AKwUvBx9bdsSX2O1vBgAvROTMg0Mg+osxDe7jfjY1furUY1sxOtLa1ZSqiB6lcfxCtdkU9rLedXfqpxUvo+B4hE=@vger.kernel.org
X-Gm-Message-State: AFuF++kPqCQ6Wx6bGABqc//CfJRRIIxEf3aNYKzXRjV/3bBWlWBtXXQM
	y7ERX/TcBJhgGMpyaunKWOI0D2zVErlEB5Cs1ugERaD4IDNLl6Lf9ssuogSnaHBAs1ROOg+5MrP
	PS6oQ3ELj378wdzyiXw9+GoVKEsDUJi5JyBU3/1QAl/dJEbALBy37Yy/yM9tNG0eqKP0=
X-Gm-Gg: AYBFou2c49xSKCW6kFjhVtE9LZmtVhfMF9qgbDx6zMhdiCJziun3etAA0ALNdtuFW0R
	awN658gvTTCUIPs84upC+7RMXoKM6a8CdpKpe9e7Srs13UrEt+VyKrq1Eoa35QBNqN1gzunmao9
	cpatyHtrhcdZx1f86oeml64B05jWe8+cM7mkW+HeJdq3Pl2T9gg3Fkl8sdyhVIQ0QrSVarung3C
	QFO7uRgNmZfGXcVh3PzjJ92cw3l3hcpPeQSVM1tltxfaWwgR0GYhxZeWtbdrY1k+6BUPnPIVeka
	aiq6GmCRgxJgEeqsioZewuDugdL3eAN83BiVWFa3koOyo/gU2S0kCdF/js4=
X-Received: by 2002:a05:620a:1721:b0:93e:9809:dc00 with SMTP id af79cd13be357-93e9b8f03demr73908085a.83.1791326507009;
        Tue, 06 Oct 2026 15:41:47 -0700 (PDT)
X-Received: by 2002:a05:620a:1721:b0:93e:9809:dc00 with SMTP id af79cd13be357-93e9b8f03demr73902885a.83.1791326506363;
        Tue, 06 Oct 2026 15:41:46 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:41:45 -0700 (PDT)
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
Subject: [PATCH 40/45] media: qcom: camss: sa8775p: add AWB BG parameters
Date: Wed,  7 Oct 2026 01:39:48 +0300
Message-Id: <20261006223953.3382273-41-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=X5THu2Te c=1 sm=1 tr=0 ts=6ac5792b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=aZ-3kUUx37z8FZvU82kA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfXxpsrEfQDtQTs
 9vjJ7wxwkifH/xwJsYMinQBAvFsvSp57SSpMGTng5O2LHG4+jAjOQdv1ru3/XsL5EUPLc1N//b+
 YZ7b6sOq/HWFS9ETHi1r8+Z83FNMcfE=
X-Proofpoint-GUID: 4rGTkGJQWcxGHEnkY1vc8_LaRlQtcB7m
X-Proofpoint-ORIG-GUID: 4rGTkGJQWcxGHEnkY1vc8_LaRlQtcB7m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX3EWp8Trv9dez
 beTYeK08bm5u6oPA+U+nSh6ybqZmlLiqiU95WjRkHE7fhvReNxbT30QbwBKZjbORl9cs2NyUgPu
 JlOvAYf8mh8bOtkQGn9atzKVPqCZGWrDNSvvisO7rCvgZRGjTjkPMcxfAP5vDpJ5Yoici3BiDuR
 ypNu1Xn9ljKMvPC4V+rlBmJxmkcXbOlB230AsLtEdmHtLjdPrLjcb5LJAxKflWQ+Pdh1+LrAiU+
 LC2lZqhQoAcd0ejkT7rogd8bOXj9z6mV7Ye06lcuy0idMnCOz14IOaxYaIag+vMT4e/WzZyO3/O
 b+f1QjNSaZRZ3SvSxkvm83CGBm+cdp1Q1ZmtqFoCC2TOxZrD2aCAWv9mXe2t654skPhIbGjC9GZ
 U6ZgJNTPlZ1maE8GRSmUjPI07SfXtKzzbVWujm71Whp1J1aScoPhxh8ek4DhArToYjcKL9NkJAe
 +yrg3iS6FJF/UDAbyXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610060090

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

Configure and control the AWB BG statistics block from IFE parameter
buffers. Derive its grid from the active pixel-path size.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../platform/qcom/camss/camss-ife-mod-v41x.c      | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c b/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
index 3c53f585133c..b35a3f375026 100644
--- a/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
+++ b/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
@@ -678,6 +678,17 @@ static void mod_v41x_params_apply_gamma(void *priv, const union camss_ife_params
 	mod_v41x_glut_apply(ctx, &block->gamma_256, enable);
 }
 
+static void mod_v41x_params_apply_bg_stats(void *priv, const union camss_ife_params_block *block)
+{
+	struct ife_pp_ctx *ctx = priv;
+	bool enable = block->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
+
+	if (enable)
+		mod_v41x_awb_bg_enable(ctx);
+	else
+		mod_v41x_awb_bg_disable(ctx);
+}
+
 static const struct v4l2_isp_params_block_type_info mod_v41x_params_type_info[] = {
 	[CAMSS_IFE_PARAMS_COLOR_CORRECT] = {
 		.size = sizeof(struct camss_ife_params_color_correct),
@@ -691,6 +702,9 @@ static const struct v4l2_isp_params_block_type_info mod_v41x_params_type_info[]
 	[CAMSS_IFE_PARAMS_WB_GAIN] = {
 		.size = sizeof(struct camss_ife_params_wb_gain),
 	},
+	[CAMSS_IFE_PARAMS_BG_STATS] = {
+		.size = sizeof(struct camss_ife_params_bg_stats),
+	},
 };
 
 static const camss_ife_params_handler_fn mod_v41x_params_handlers[] = {
@@ -698,6 +712,7 @@ static const camss_ife_params_handler_fn mod_v41x_params_handlers[] = {
 	[CAMSS_IFE_PARAMS_LSC] = mod_v41x_params_apply_lsc,
 	[CAMSS_IFE_PARAMS_GAMMA_256] = mod_v41x_params_apply_gamma,
 	[CAMSS_IFE_PARAMS_WB_GAIN] = mod_v41x_params_apply_wb,
+	[CAMSS_IFE_PARAMS_BG_STATS] = mod_v41x_params_apply_bg_stats,
 };
 
 static_assert(ARRAY_SIZE(mod_v41x_params_handlers) ==
-- 
2.34.1

