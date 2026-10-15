Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A0B51CF4E
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058140; cv=none; b=D/5PC3LQeM/ISHelSzBXMvgF2nXt350iZdFQe4XaXGGBNe5HalFL/r/PE0oUV8RQSe3r29GkEjHC3pQKcwV66MN/3oj+WFM/wOVaY4nmfgxk+pL9njJx4maEWdGaE+5nwQD/31j9jyXMRs//6tWwuWWWXxzjgvlqS2SoQk5/kB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058140; c=relaxed/simple;
	bh=ATHzw5/SdPmSlyNoH0Ua5Hf2It3tpnIynG+5Y/cT+DI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bd7OPU8JXn1PwqBjSOxx82o9tIZJveL0eEKPcVTe1YbLnOaIM9YBhbQeDQ+CzlAnu+s1roI2915zP+b1VGP+0V/1TYu4hL1fhGKsqXC2sKTcCr8whyHiyrLWV1rLhJS8lJBkb2Hu6KNBJFS0Rm45j5BVBlvWeyojsaCaofMLIk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=izHdMitJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i3i2buWS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="izHdMitJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i3i2buWS"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jSSH2662650
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dPFKGiQSvhld/TyaGvBhCd19kvDTSFSpxWvqUbaR+ZA=; b=izHdMitJr+EIvVx0
	PV+EjMSGVRW75TskDMqhHW75uL40KhnWkW5SfQumy0zoXJbx3pIXEF4gxdpVNA7v
	GYc86gUwhSTVihiMOIKpDFCKRWGfSKVUH9fQlCjIeSoCltLqhVREauGaM8HKjGTp
	RYZ2Wt8lXtNmH+UDav3KWfz6XV+e+LnKjkQ+wBfJO9Rs1eWnRU5mEFPFltmv8rRG
	BIOjGF9iCi4DjvSWG+i/AFDg3Yue43rOQYMENumrW2bFZIwwITaS3/t0tp5LCaCG
	rH0k/NU6drmGi+jI+rOLGBf9UllB0Mpzdb2lFO74Prn59xrpFol7XQDcdOvDhpqy
	CV+uLg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqda1dr9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:55:25 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab9850456aso1988275a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792058125; x=1792662925; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dPFKGiQSvhld/TyaGvBhCd19kvDTSFSpxWvqUbaR+ZA=;
        b=i3i2buWSy5bTrJXpd1n0cnm+bBlu4w5A0DXL6aqHnS2pkbXAyUoSa4rUVeYWKmMaX3
         dikE+FUVZ688tCUtYr+1lr3Fl3bLvLUp0vX6PVoW04GL6fpc1X6f6jlIzy0y+5jiDJ/D
         znoAhwhkjfbnfaUnz+cP1OR1w5pdZ6eKOB4469fZruUlBAXcxzSlJWnOYCPW9a5c2XnU
         mtzsGcv0bBrgLPTcBZ1J/lT6qZaoSwHTzrneh07bXa9ectOlQsOojDXouOMRG9hpVWdK
         wx7e03Wt+FTiZpyu+y0VDQuPdM/HYUXdnJgBn0b0iaEVrGT/WYrOY5SVuxlNIAPUBGZ6
         X7Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792058125; x=1792662925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dPFKGiQSvhld/TyaGvBhCd19kvDTSFSpxWvqUbaR+ZA=;
        b=MPtiZlgmokqaQwjg7afEFbNMnsYbdx9HIBVxQiWVSwo0YzZceFRHdvc2OJvZBpaMi5
         j7XyNzKDCOMsTU3rK9e4NIJn+EgWHPFQJxFwzn8dx/LBKjXnLskIsMtCflpjNNym6x4d
         Rr4amOfvE/DhZHr/KQcBp/6tDAoSJl7VipmgO/U9Xr0uM5jh7mxh3dFL4DiWF25gvGTq
         1hyaIsBfZkfpx6g/9ACygeuOKe3wEtfWl1XNPGpR6b+IaCCux3gksTQ621bpydgdoW2g
         1XJI49XvJvNLO8OZ/4aAgYX9fQw7AOuB1TyRjHAxJ4XI9SC8slTOuqj9nXTuat1NMPF7
         EoLQ==
X-Forwarded-Encrypted: i=1; AKwUvByKF90Sn7C9d4qtOiBMT+R5J46TF+e1TK+WBDML1PN/FVbtmkvtE8Xt6IQtCh5SHaN+Y+R8+JSbdg7mnvI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLcmv/XEY9JPiRwwVGXsdYjWBs17We6c7pCS+bu3hxuE2Aj5kJ7
	Am42XVfkTTtvW6MbDJvizxlcMEmPQbfBlR3CZ5H8IJXUaD9cnGBsNOoyvP+ajP87nMaJmztS0fR
	M/JYxBtucFzzgZ5WESVR7malMzhHS62TOTPxPG4fqrmS4FtEPbRF46PNemvGqxFZlUUo=
X-Gm-Gg: AYBFou36VtQ802H9BStozvh3amPnqHl+DRnZZUQX5nLotAy93IqDc6b6P+BVkVQ228r
	9YRpxs2e1prrpC/D0zSercFjYPvQPKGVxFLH5nkStjSYaRphnSRZfQjAiqbILaxcSYbSH5L4QiV
	lybbecwFR42qP8h7vAwupOagbGFmL/mYq/lpR+VUhsMQX9dUelu1py2RrvL71l7ZA/FMBfBQBlr
	eDxEPnS+y0By4Oow2OFAwCLjcou0ijib0y+dNkemVxnoMCQN304rpxR1heFHYIvqb2ilwmydWZy
	zqIPlRFUXcWshTit1SrAzqawdAJEU6PXGxpSM1hlxfhZk6dpGC0Vy6ZJUH7HBW+8cDALAOQsNAP
	Z91J75uwAHBITGPq0Le8uEN3Qm3MTPC1XzyvL
X-Received: by 2002:a17:90b:4b82:b0:3ac:95d7:2fa5 with SMTP id 98e67ed59e1d1-3ac95d73294mr2101680a91.44.1792058124624;
        Thu, 15 Oct 2026 02:55:24 -0700 (PDT)
X-Received: by 2002:a17:90b:4b82:b0:3ac:95d7:2fa5 with SMTP id 98e67ed59e1d1-3ac95d73294mr2101652a91.44.1792058124192;
        Thu, 15 Oct 2026 02:55:24 -0700 (PDT)
Received: from hu-bkalkond-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac943e1a11sm3612322a91.7.2026.10.15.02.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:55:23 -0700 (PDT)
From: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:24:33 +0530
Subject: [PATCH v2 2/5] drm/msm/dp: Add DisplayPort controller for
 Kaanapali
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-kaanapali_dp-v2-2-c15cb83d9140@oss.qualcomm.com>
References: <20261015-kaanapali_dp-v2-0-c15cb83d9140@oss.qualcomm.com>
In-Reply-To: <20261015-kaanapali_dp-v2-0-c15cb83d9140@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792058098; l=1543;
 i=balaji.kalkonda@oss.qualcomm.com; s=20261001; h=from:subject:message-id;
 bh=ATHzw5/SdPmSlyNoH0Ua5Hf2It3tpnIynG+5Y/cT+DI=;
 b=YGp6zXS+wBzvJdnS9MQVlBt8BFQejgUvDgEhmw7g27ZvToYAfyKWFShxOJybCzNl8VdhDYpPN
 sxmttc5wyYzC1TwmFRGZ5qbn1mrYoCunbzY4JXFTAswOUtR3cFGLGPj
X-Developer-Key: i=balaji.kalkonda@oss.qualcomm.com; a=ed25519;
 pk=U+unGox551qPLS2mzIlN+b5cHksxTMGPnDwePd6KEnI=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX+UlvifW9xtM6
 PjFglczxx3ADgTrjclzvE5nAit49/0VepIvRqQNCAuv+rp0bFlfBrOS9fMS9khqxAYOLENGRi0T
 1fsZB0mv9eyXnZqDX4BJvZQGLc5a6G0=
X-Authority-Analysis: v=2.4 cv=K9u3jCWI c=1 sm=1 tr=0 ts=6ad0a30d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=-Dt519yxSYS-YsuSjdkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: rWjotBwiCnPuSqhKQyi-srg7ZIp5h1C8
X-Proofpoint-ORIG-GUID: rWjotBwiCnPuSqhKQyi-srg7ZIp5h1C8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX8Jhm4t6Jx652
 xIuPlk1ZOn2zpEwfYzpVYWsAo4BJMB1KA7qSdjZrb/AmhPN2GwjtSye9qiiJPK5TtigCcM1k3H9
 rnnPsI4uOtQUqLbf3uD7Wonn6bgKv6V3wshNcvM+AIWn09MrJELWpbI0Fn3Af92ApNbgMumV5iQ
 drrTZ4GZbjX4z/otHmQDFqKxfxYONcRbOB5DBQqsQG8kD25n9yvqgEHcXwQsYivKqZzQa+ltLMg
 JrEU9fM+Ud0B+e2fYPqvRp07Vv1/4HW0EQw56iWpk852lzPcqtgcYOzg8ohbFbZ5PHX2pPuOIJL
 f606rmStfrfENOWVau0cojbZbYW94IMjTsPOix1RkBXHJL4Pe8D0SUX3dLL+Ls79MF5aGZsL4Rf
 h/wHfQLTOC3itZ8P037UABDxmwq8PstJVyLPFX+J7OueWRpNmkZa0fhtxUj23zdDUiq/O1BvrOn
 pmeknvY7MHRjcOz6W/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150039

The Qualcomm Kaanapali platform comes with a DisplayPort controller
with a different base offset than the previous SM8650 SoC, add support
for this in the DisplayPort driver.

Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 9299ce616fdb..348eb6967abf 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -158,6 +158,11 @@ static const struct msm_dp_desc msm_dp_desc_sm8650[] = {
 	{}
 };
 
+static const struct msm_dp_desc msm_dp_desc_kaanapali[] = {
+	{ .io_start = 0x09ad2000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
+	{}
+};
+
 static const struct msm_dp_desc msm_dp_desc_x1e80100[] = {
 	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{ .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
@@ -168,6 +173,7 @@ static const struct msm_dp_desc msm_dp_desc_x1e80100[] = {
 
 static const struct of_device_id msm_dp_dt_match[] = {
 	{ .compatible = "qcom,glymur-dp", .data = &msm_dp_desc_glymur },
+	{ .compatible = "qcom,kaanapali-dp", .data = &msm_dp_desc_kaanapali },
 	{ .compatible = "qcom,sa8775p-dp", .data = &msm_dp_desc_sa8775p },
 	{ .compatible = "qcom,sc7180-dp", .data = &msm_dp_desc_sc7180 },
 	{ .compatible = "qcom,sc7280-dp", .data = &msm_dp_desc_sc7280 },

-- 
2.34.1

