Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8903B3C0F
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 17:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791480265; cv=none; b=hqYV/Gvw0XcSqaNnbV8vlSL3sD2cf11TRFbcMXpRAJQwJFGK+sNUmeRNyiRp3in2fQQQOtWv5GhoEAoW0c1lPr7jKiAQgD/nG2+G9fL22HrgZY7Re0JArv9MTx31S2EoWi4K11GvkkMw0FYgcqT21x4GwEbgtO0lpIg2zhPKOcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791480265; c=relaxed/simple;
	bh=MnyWJ+SO3iVE/KBDqM+VhT8LcMf8ChXq7BB83zMO3hk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UHT2gAbwXm9x7jHJdbR15jknE3TancF8XU0SIfCFqICcZ9aK2fpPV8Rp4mf88qrdIQknLD3CwDQyXNAoRTZnRJMVo5GUn4+Ab9EDPH2+3tUN/Nuct/rtN2sNiQRwYv+zCLzq8CvP35xA6Ok58uTx7Fe7UlgMtsWxIZOgfplDAtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dVexsgrQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YOlH3vik; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dVexsgrQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YOlH3vik"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698EVDOu3017496
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 17:24:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vh0YPgpHG08+z15G0fuaIz52HDEGHaPT1TQypFpPpMA=; b=dVexsgrQ2Lg9mBkD
	xRro/PMYDSTp6rJV8KrfrIneH1cqSkAzzqvdIOIg2ZNVKgduqQC/rGe5B0+WPzyT
	Gu7rXLNTxk0KGJO+6HSJMYAPcuk2TP6M6KVAhg4WuFdbrqCI/qKfUHPAFolNkAzA
	+Erhzore2+aWx87cnCkQholEGaclD4YvBU+FjPcCvzsCMSuggjC2yY+Hlu0ATjfu
	wrZbMTgKFSW9OC2F7Xvqq3ZIYYCRB/9Qg31qxWwKRtsgH3XG4qbn3Xs69SGmbpNB
	dyKZDUmw2zFFj/tRviVNAE4AJk/KbEgGXCQbQ1vkLmBLk4tXgrUH/IX8+ow+0Zjm
	K5I6+A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6b9kh43g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 17:24:22 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d5dbso159373a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 10:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791480261; x=1792085061; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vh0YPgpHG08+z15G0fuaIz52HDEGHaPT1TQypFpPpMA=;
        b=YOlH3vikhicc/hNJdlabqiO2HyVrTvNMJRM744uJ5BxXaAYntHNAGM5nyIn0VxmCS3
         H6Q+AJ27t6v7AsCxO0i/y93C3NNMMSIXAFtcWbAvbKY7l9dSTdv8TrceglBamBNruEhp
         mKO8rCLtIzi3B2GGshL47mfVmGuOaVJdBW/RAcoyCse7sQM+NdkCpBxjKckn1VVftgAJ
         gptcOVMbF5eLUWDDY0b0Qwi5O32KIRKFL1bzUqgVOk7bDVuHCn7HokEg4pLSX67mfeuu
         CdFsdSnVIdTmh4w600jgXR2nAi01702SLt06BwBbcPrxQP9wjqPpjWjwMyFMC1jP0Nyv
         296w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791480261; x=1792085061;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vh0YPgpHG08+z15G0fuaIz52HDEGHaPT1TQypFpPpMA=;
        b=ZgEU/nFVVDBfGAje8WroMIGzwrS5EBby3JFVjhiFyt8Y39gz7oWB25NiIN7Altru5/
         Gv6FI7pG5tCkJWqRFG4g1b6NufjVXPAVyNfdoEgNIi6ve+0yCLh4NwCuFC75OsjeIdv6
         J19EGjnIdcJ7Vjb+SqDTewswfTYSVq3aZzcdrYYT82o+4ayiq5GRyPHR9iSp1Qi2cCdd
         EnLUk6V287Y9DaHD4wgLi28vVJLkMGWUnIlFT0CCrfVcqkvTLOOCFoRodwRY2xc1a+9V
         TJW7fbuGMgkRoTbmJUkMTvmXb5sl/nsW+hL63BcROoAKDgxgDaHXvvH4jthZM2960eIy
         tX3w==
X-Forwarded-Encrypted: i=1; AKwUvBzhuoHpzJrmw9ROhjrpR+wXLErhG5KgL8KN9IQ86aKN4Com4T7eJOgZ5rJD6dHuA8DXoer29qugFhbN4jQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/CyNqQh5GIefzhfJaAb1OFyhxjuNHXENDkSGL6PCIKyz4e6HM
	YrLjDdV3JwBvXEmX87UBkzWV/178lVuaA+9vLHRzFhIcQTvD2LakwYBwG6opZKuh1sO/uv1apCZ
	bJI8PevMJuzTnD0mag/JHjDU8vNkaQfHnnISgVhK0gkrp0L++40nkLVopWD9viqaALkj6Waipxi
	w=
X-Gm-Gg: AYBFou3k7yUmRK0tGXUTbQdzyf9h7JfZWy8yUje0XS3HiqkXaQchbt4YQV2jrtBy2D9
	prB/32QQg5WQSy+GZAU5nDB0L3TK7F7603Dv62FXYhzJ92RwRN2ueta3j4AiEHoKsw/rbi3IeLB
	x5h3NTmwTjsSPGWcCKfLWWmmsULdN051bTULLulvoEibwg+4pgMHx04Uhs/YKTjLvTFqWIa23Ey
	sm+tXNvAS/s3pJ1q4q2t1HSlPQukrPWCWX5i3YQczmkF1h4Jlk8AiDXJNid/DqW9DB/5YVN4XGs
	gowhjEPMmqDALUlkZRRiilqgmvqKAFsgGPGfjTRLeIqqf2Q1a7Kf935jfyVg2TsFeL+vRNF0oh1
	ioGrWuTuf8S5GFed+yQ9POdfNRg==
X-Received: by 2002:a17:90b:2884:b0:3ab:3131:5c65 with SMTP id 98e67ed59e1d1-3ab31315f95mr225647a91.8.1791480261387;
        Thu, 08 Oct 2026 10:24:21 -0700 (PDT)
X-Received: by 2002:a17:90b:2884:b0:3ab:3131:5c65 with SMTP id 98e67ed59e1d1-3ab31315f95mr225622a91.8.1791480260876;
        Thu, 08 Oct 2026 10:24:20 -0700 (PDT)
Received: from hu-mahap-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3277c459sm47228a91.16.2026.10.08.10.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 10:24:20 -0700 (PDT)
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 22:53:47 +0530
Subject: [PATCH v4 1/6] drm/msm/dpu: split modes a single layer mixer
 cannot clock
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-lm_fixes_final-v4-1-fa986071c3c1@oss.qualcomm.com>
References: <20261008-lm_fixes_final-v4-0-fa986071c3c1@oss.qualcomm.com>
In-Reply-To: <20261008-lm_fixes_final-v4-0-fa986071c3c1@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Xilin Wu <sophon@radxa.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791480250; l=2937;
 i=mahadevan.p@oss.qualcomm.com; s=20250923; h=from:subject:message-id;
 bh=MnyWJ+SO3iVE/KBDqM+VhT8LcMf8ChXq7BB83zMO3hk=;
 b=4c6pDXhR1kZ5t5q72Ly3Q/VqiVwkXneHI9x6vfrwARO/BKVLjo3GdiTa1UiLNQQnZtdisKxtN
 4Ry5ZxmvsfyCxnAq8C/gzrgTzC4M0U+1yjdLDCaxJeNqNYcYLFqzRF9
X-Developer-Key: i=mahadevan.p@oss.qualcomm.com; a=ed25519;
 pk=wed9wuAek0VbCYfkANx7ujIG4VY0XfCYrffFKPN2p0Y=
X-Proofpoint-ORIG-GUID: pLzZ9ZOu41GITPAxa5FXr-7rGDi4_KU4
X-Authority-Analysis: v=2.4 cv=U98Hnuru c=1 sm=1 tr=0 ts=6ac7d1c6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=hBLlU2GVctrw3cDPktIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA2OSBTYWx0ZWRfX1tWLjTPc+Oez
 H2kbqtqWvBnmSSl90PfRTnwL3+oNhGtmGEZJ9rdelVEDX1mQY8SSW2mzl2duuQ/1sr+b6pRoHVG
 hBnrJm6mCCPAf1AappcejmFN0TIhCio=
X-Proofpoint-GUID: pLzZ9ZOu41GITPAxa5FXr-7rGDi4_KU4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA2OSBTYWx0ZWRfXwygbf3eJc/mW
 xHrZPwznTXDuLkKyEa6MEYgnsgkowEfkKFMlN3Ab41EWn1RpOm6BxO3BTlYg09Nfq9boFdtOevw
 YpZ4PJAuUFyaQuWr+6ggP1epea/OhKlA5LMVajHIej9qEwHBh1v8dqQ4Oj0N/NiTdPExlKDJjt2
 TEtMwu6DgWes5WTEW5p267nrI+VbAHAyB2Tggm2mpM9QNnEVod1M1CzfaJA8L5n6o4DxvF5Oo0U
 Fpra5eju1EVeKgiU1IhaRW8XcopigL08uzuhC3rFp0saAf/cTZB9KBD+O3ONJFL8SlQes49rt1+
 x625rqLSsy3vF9uoulrcL61LfIV50HOKXAN7nYJYXdFuBZKxUltBTfqLZR/yTVV5FO68ip0/gtF
 mp5shROU8hVFvqEPDnLrqhCjHSH/0qBKDBrmpOAvU1SWyxytQiiTvJ/xt0IZ0zYZ9yNuAeJtsHR
 ECnTsu/6W8AxI8H6+/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_05,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015 malwarescore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080069

The layer mixer count is picked purely from the mode width, via the
MAX_HDISPLAY_SPLIT threshold. Width is only half of what constrains a
mixer: it also processes one pixel per core clock cycle, so a mode narrow
enough to stay under the width threshold can still demand a higher pixel
rate than one mixer sustains. A 1080 wide panel at a few hundred Hz is
enough to get there.

Such a mode is currently given a single mixer and then has to be clocked
past the maximum core clock rate, which that mixer cannot do.

Factor the decision out into dpu_crtc_num_lm_for_mode() and have it ask
for a second mixer when the adjusted mode clock does not fit the maximum
core clock rate, in addition to the existing width test. Modes that
already fit within one mixer are unaffected, so the only decisions that
change are the ones that could not be driven as they were.

Assisted-by: LLM
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 77a2d1f6700d..0b51a4c5db57 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1376,6 +1376,25 @@ static int dpu_crtc_reassign_planes(struct drm_crtc *crtc, struct drm_crtc_state
 #define MAX_CHANNELS_PER_CRTC PIPES_PER_PLANE
 #define MAX_HDISPLAY_SPLIT 1080
 
+static u32 dpu_crtc_num_lm_for_mode(struct dpu_kms *dpu_kms,
+				    const struct drm_display_mode *mode)
+{
+	u64 mode_clk;
+
+	if (!dpu_kms->catalog->caps->has_3d_merge)
+		return 1;
+
+	if (mode->hdisplay > MAX_HDISPLAY_SPLIT)
+		return 2;
+
+	mode_clk = dpu_core_perf_adjusted_mode_clk(mode->clock,
+						   dpu_kms->perf.perf_cfg);
+	if (mode_clk * 1000 > dpu_kms->perf.max_core_clk_rate)
+		return 2;
+
+	return 1;
+}
+
 static struct msm_display_topology dpu_crtc_get_topology(
 		struct drm_crtc *crtc,
 		struct dpu_kms *dpu_kms,
@@ -1409,8 +1428,8 @@ static struct msm_display_topology dpu_crtc_get_topology(
 	 * enabled. This is because in cases where CWB is enabled, num_intf will
 	 * count both the WB and real-time phys encoders.
 	 *
-	 * For non-DSC CWB usecases, have the num_lm be decided by the
-	 * (mode->hdisplay > MAX_HDISPLAY_SPLIT) check.
+	 * For non-DSC CWB usecases, have the num_lm be decided by
+	 * dpu_crtc_num_lm_for_mode().
 	 */
 
 	if (topology.num_intf == 2 && !topology.cwb_enabled)
@@ -1419,7 +1438,7 @@ static struct msm_display_topology dpu_crtc_get_topology(
 		topology.num_lm = 2;
 	else if (dpu_kms->catalog->caps->has_3d_merge &&
 		 topology.num_dsc == 0)
-		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
+		topology.num_lm = dpu_crtc_num_lm_for_mode(dpu_kms, mode);
 	else
 		topology.num_lm = 1;
 

-- 
2.34.1

