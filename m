Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4506E47ECD7
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 12:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789217320; cv=none; b=DP8N+ouwhnSBDvZ06mIiaRcg6UwNsNeRSS6RQDv/O8VVIRWSPADy16+7F0sXtvWq02i5FhMF0vvw4q5MYgTdYYunwnifxCxtHvVT68XHTtlryTVka2C1uImawiga7GlXLwue9hGBohaGkJLI6t3+JkIamE9A30rfmsX85vBvhqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789217320; c=relaxed/simple;
	bh=Ydrl/MgzzNOlJycAh3i4QDmPVM+vAZ0hud8oX8EvOlc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gdiYmO4VukYQl+qzw1FU3biZ5nTC27rHc3HN9gT5HL9uRYtNTwcW52tQ6mdA0q0vc1ciRcIyqSxFWCiwQdbu3eiukXWATYYIEXrtCUNoRG5NSffJkYb3i+0BFi+PQ6LaowzOBBWkKdB6PjUGv6jTBT2YxIJhkKIP5v/24gmtzK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZknuKtR6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ddeKGksv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZknuKtR6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ddeKGksv"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CBeTiW2883362
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 12:48:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IEuzA9pB4S2eUTwXiX8Bjz5BCBCQiMvGw2tVZpbC1TA=; b=ZknuKtR6i/4nrvbK
	9NIya6V+mqtIOrstzAc9YPZ+6esoETiQ/zRqT6wPKJHjq4JfiXPy+IvYmQTqKucS
	W89fpaNUokX84kWOXHZKLBvMnlH+5YpLm/JBuP/XrEcjGq1+Zl7voG1W76f9CKvm
	67mWK33/tYmskzLU7Ah5e6cEfl50OHuEd0GZ/uCeO7M1ayi9WyGTaAvosaWdmKfM
	jS6DRO0tJMSbXjaFFTjRryBAT23L8CLYedVG4rfsyEqeZLCcaSx2YDSYKjnIR9Hh
	ovkkoJsLjm9IWqxNroTmhJ1FuOrnEFrRA0so7p8T0Epioa01C5wvW/jy4CZ4OzxP
	7XlL6g==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c0xnc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 12:48:37 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-98087b0c5deso1246371241.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 05:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789217317; x=1789822117; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IEuzA9pB4S2eUTwXiX8Bjz5BCBCQiMvGw2tVZpbC1TA=;
        b=ddeKGksvchxpLVQoEJiacHkm0EN4EDB8IpeGX5Xham3S6QU3v/0hqbIR8PbcuoF+zX
         YIhKjjEbv1DvtsR3vRL0A83ir42HaBJLCvgjsjvLxpEmZmqMlk4EeRW1MMLUJbVLuSEa
         rVeOwX5ztfRbosMlhiZu2TV77hE+89FT6NDwLbRLXwjFmvrM+09tQTYbbPK+MzbS9v3G
         XL+VbVppBQqwgZXF8/UuTXWPmfe92ir2d/Dge4t9VZEGm/CjW0rZUHhXtfoLH/k26wlM
         V8mf+HEsA+y72eNDcaQF2ONyCTFiME/7xtuQmT5r+wdbU7wYUt3syF53chNAY/SM3khK
         9gTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789217317; x=1789822117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IEuzA9pB4S2eUTwXiX8Bjz5BCBCQiMvGw2tVZpbC1TA=;
        b=PikjhxtjKLBqStlfG+A1bebrRtmgahEzZnEhIJy1Bpv9yd+e+OHfs9jjlZ2gqzEHdY
         +h183Xac3gJDki8/lGvWpGJiK7CBAgfIrzFiboQwxDMEnDKWWpEsVLI+J13hiRDkONOy
         nUCZryJPq8WlcuSnPUCLvUoAVYW+SLy84C+I5uPfWErDOeXgAyYTRZ0oFTgeRJdRWBKz
         ckkcAZLlbRm3PNezx76b4TfoS9dU/dTXkXa8qsyF+qfUgo5hXJfZfCsdbxuZPRtd+OiS
         YMWXqSjtNRE9xBRdvuXbCp3XOgVifVnSvcc5UGyvvWPyjFUxQUpd/FJCMEkP1TWEa2s7
         3wiA==
X-Forwarded-Encrypted: i=1; AKwUvBxwIpzkRznKes4NSpAFsnbyeHVbFhxkoy/tZL/k+vzSMhTycc7orU9G49C9Oi/G2fuV9haOwjjXlqlAc6E=@vger.kernel.org
X-Gm-Message-State: AFuF++mB+ZO6lJuwMbmVruFlOSQf/s58jGld0BZRMC3LFO1v26X2uDcO
	73iK3ZUiYnqEFSQXdHENVCcKUnf13OWwjyTDQTpuGoCJKVtLYWnHlbNzd3Jpcr9c/SeYhilP5OF
	G0s+rLVoC8/Sypr1OdTRoGE5ROaemE8iGGx5CutW10JWO7Rzbjg0DR42VDT0NQ2ugVqw=
X-Gm-Gg: AYBFou2w1+JaQMeZJaROE+FekCcK6qrSKVRGmZesSuGLThgzLtJgGkChi5p9f6FqNFS
	ww0R2TfuPdjgpfLPPs31RIkDL7qsO6Hn8AFqKkdRZJRjuZbZqrBFj9vFQtdS8GXQkuQ35aMPsUK
	RZY1RV2FYX1YxiNn8QC9TKh46/rDgvnWk1D6tD/vdjFTlZF70dt1b4UEuGkz9B2o3R5MLJRMHH5
	4adNG7tvTx1GFamJXx4LZx6837l7m9yJw1NHr1NK+LP/AkLICb1QIwZp5Y2LINx1g03tXtxNpu8
	pSiw7aQFBCV727KeTfzUPPEccquP+jg1sScZ/dM7FSCVAetyyl/saOGsxnvPpiiskHKdewUVqMl
	DeflA9yCv0bU4w4XtBnmmyiS1iIJeX7I3TEhZzRYQ4F5U4YLwd0DfrxBszpkozYDlEOsJmXJMdN
	ARUeDbvga/nP6y
X-Received: by 2002:a05:6102:54a9:b0:795:250:3c42 with SMTP id ada2fe7eead31-795a8bea5e5mr1997558137.7.1789217317243;
        Sat, 12 Sep 2026 05:48:37 -0700 (PDT)
X-Received: by 2002:a05:6102:54a9:b0:795:250:3c42 with SMTP id ada2fe7eead31-795a8bea5e5mr1997509137.7.1789217316175;
        Sat, 12 Sep 2026 05:48:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5af37a4eesm8825701fa.34.2026.09.12.05.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 05:48:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 12 Sep 2026 15:48:26 +0300
Subject: [PATCH v3 6/8] drm/msm/dpu: clear the DSC blocks left by a
 previous reservation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-fd-kms-fix-smmu-v3-6-a7ddc6fe2032@oss.qualcomm.com>
References: <20260912-fd-kms-fix-smmu-v3-0-a7ddc6fe2032@oss.qualcomm.com>
In-Reply-To: <20260912-fd-kms-fix-smmu-v3-0-a7ddc6fe2032@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1863;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ydrl/MgzzNOlJycAh3i4QDmPVM+vAZ0hud8oX8EvOlc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqpUoXgnJYN/kKDWpHG1TLEUOdQfhtozvgIXpoD
 l9LOViy30KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaqVKFwAKCRCLPIo+Aiko
 1Xv4B/97dO92AC+MIGjcuHd/Vc+xoy1iFZgIql4yrfbhPFUNIX/qU5YnuaHVuv9hStw5j8UXlcF
 7UW6++IyemaoB3IJU8DM6JmfUv1f9JuhmeAKQCvtvW9gMcwnJEvXicAFar17RAAwKG+hTXVGAIq
 U044v8iRoZxlq3UCcExXeTgzeK1HJQbvP8il/BrSXPyFqNIJDzNifDPAbW1nwB2jN+hD+CIqrrt
 +qCyqbXIkPIoAsodw1lIYY6SVP23OuPTALStBF2BfadMGuA3zWS4cYUqLZqJyQE0PMaDv/yB8jh
 aJ9mjpxFvi2hu+Pb33D2w5/1z/DCtKoX0F5VqKRwJridxzAi
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 6AOmOrAY7tdRqOzghPa4kBg7wybEIViR
X-Proofpoint-GUID: 6AOmOrAY7tdRqOzghPa4kBg7wybEIViR
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa54a25 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=mN6KdvlfDCua2x_U6QQA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDE4NCBTYWx0ZWRfX+yj2VdBchv12
 O5SXsS6JuzTYMscz2IMmQ071pJHV9Vbi2APOHAPUOvfHSofU6Fh0MjuCEqvltQx5B0TiCX4bi/g
 PSdCJS6Pk8Zv7WPoTcQm2Xj7kWB+9uz1Rq0RUn9pYb522ts5BxSY+X8uMHm4IxtGcdd+EYVxVEZ
 b6D5wC+BssY6zSN3qtqEsgH/LhRC9ll6FPSJ669eOSqLvINBmZUvN+kx7gcfNQZ4TYfzy9ORQpn
 FhmY/zmKvg9/Jau3hDG/iyAFvxoBGSg5xg1dnG9AblSSTRMkLagSlI8X+UDsSG+zw9DToZVO6yt
 H8iz42uBqOV964odTe2ljZn2/ig+QX0600/UN55AhlCYpB/BIgnKXmNuH+OBDdouA0FK5+j7cvw
 GdKtbSDws6eNPhZkBMvobT0cQmJopIGMvE5DM0LxA+aw/ne1NE5xxl5PlHtNItP9Tas7wJ+5Mtf
 KA1Z3NHkFoKFzz20cPw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDE4NCBTYWx0ZWRfX/URa9QM4fXzy
 nmK0mtTfuCyx6O1LNcZPpN0Y7kVqCmiuoQyxWW70SYf8aKsk/N/DuOFOxridaVnPhq9drKecvoP
 ep53EPh/2smG1VkUr+ZnHUvdqagp228=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120184

dpu_encoder_virt_atomic_mode_set() fills dpu_enc->hw_dsc[] with the DSC
blocks of the new reservation, but only the first num_dsc entries.  The
array is never cleared, so an encoder which once drove two DSC blocks
keeps pointing at the second one after it has been given a topology with
a single DSC.

dpu_encoder_use_dsc_merge() counts the non-NULL entries of the whole
array and compares them against the number of interfaces, so the leftover
pointer makes it report DSC merge for a topology which has none, and
dpu_encoder_prep_dsc() then programs DSC_MODE_MULTIPLEX into the only DSC
block that is really used.

Assign NULL when the new reservation has no block for the slot.

Fixes: 58dca9810749 ("drm/msm/disp/dpu1: Add support for DSC in encoder")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1f20695f81e3..50c49259a23e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1222,9 +1222,10 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	num_dsc = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
 						drm_enc->crtc, DPU_HW_BLK_DSC,
 						hw_dsc, ARRAY_SIZE(hw_dsc));
-	for (i = 0; i < num_dsc; i++) {
-		dpu_enc->hw_dsc[i] = to_dpu_hw_dsc(hw_dsc[i]);
-		dsc_mask |= BIT(dpu_enc->hw_dsc[i]->idx - DSC_0);
+	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
+		dpu_enc->hw_dsc[i] = i < num_dsc ? to_dpu_hw_dsc(hw_dsc[i]) : NULL;
+		if (dpu_enc->hw_dsc[i])
+			dsc_mask |= BIT(dpu_enc->hw_dsc[i]->idx - DSC_0);
 	}
 
 	dpu_enc->dsc_mask = dsc_mask;

-- 
2.47.3

