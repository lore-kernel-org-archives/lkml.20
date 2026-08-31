Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BFA3D9691
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788164401; cv=none; b=ElUdGMqZIIqyC1nAtdrqgeGQ0/3LNrQCgNkZbPcJUD6tgFNXuLeRST47pcZcJEAv74v4/yCbRoWfUmOnQNZDiX7zfIAE9JnXhz1VJ3H9CDOvDvz0NP6cuqiNqqHn/lWmProsXJQB37r0r0Krww+I55nur9ng1eCrZB5lf8wIRDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788164401; c=relaxed/simple;
	bh=ocYv35q1TRg7soWZ/7cu/E3KmsUNVSAZoT5YAe9yWHg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fr+5ycI7Rmkkzsm3rHMyHGb6YFlSjbWwaiBYWaxqNBkUcmJlPm3sEPdDl5uwDLFZ/M92IWT6m4+Ra1x5ys1BvlEakOQmgpxl6VamIlNgSdcuQIlJ5k+eryGBw21DBYre513j/02LC5h3WsgE3gxuNpoLh06R0HrdfVlgtBYm0CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q53QtLwl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q8kt5JRJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q53QtLwl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q8kt5JRJ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xNXA4081787
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:19:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sZCZYdxulAt+REaXNWP3pgTyEN5GhF1cMFMAFW7SEs8=; b=Q53QtLwln5sj/mGi
	Lrb3HkyZZaP52n3vxdS5mNBam1R0WHHjY148nMAa4ZV+EUTjKSNsbmd2Sd4nVjLD
	sA5H+XqjpM9btH1a2S4OGGRx/Zvryfhv3cxCDoZOOQ1X1jiWChsAXecTWR221x9r
	30BprRmt5U6KpiQC5/ori/n3BpR5ab5+sTq7gw9152N6y9EJq4g4EbixVzmW/HNW
	9Q1El3JpaO9xUk7DNxEhAChY5zIxLKy46+/r2E7zLMdlrhZrIPwP6DUbn9EkCRv3
	xwPgQVLClXvhcUMPJKx+tQD3sactrMPrEyP00GIJpUTPrUFoVfGBrfla/J6Krtrs
	Eufkxg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gcv8h1ng4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:19:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ec3146553so772784085a.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788164398; x=1788769198; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sZCZYdxulAt+REaXNWP3pgTyEN5GhF1cMFMAFW7SEs8=;
        b=Q8kt5JRJZwJBeVvgUhj0axufeDkcnd22tXdg27gys43DH0nrNHQmvbgc/SbfDtHiIl
         nrV3AUqrlvujgkB2CtF43NWnSrQoaqauCj+OOlxZ9p1YALflQr9ojxmhFQMgoTD72Cls
         V00CDsxnmpADLgFDjxeNkqD2BsMKnuXRYbkLnzzKlArsZKaVrOkD4i3icDDE++a6UNl5
         Y7CE2yYitBVtcwg1vLzfjMhp/u1IvTRwQabcPC3sKmxg07HPXd3wj4GRWm0mrqrorSlc
         ejdNiod4nZDsViG9okCCs/HTnbBzNQepbBNQOwq41/ecv+JP0/W4zSn2VY2tbXD6Lmm9
         0Q2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788164398; x=1788769198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sZCZYdxulAt+REaXNWP3pgTyEN5GhF1cMFMAFW7SEs8=;
        b=ZOwWNOVRiU99A0yg43PnH/vVFeFtbccoP7VJNQe7KV6t0DPLVF0v4XBy4U7cS+hgp7
         6JaCG9UZE0Cp6PHSvy4gBuDKeXyzRgi6MhFsPXS+5P94+AIwZTNqY9KaSNy6i83BKGXl
         qKPEW+aRgN9UqxWVmSqrlA9byerEGPqF1SqcNA/8IYuNgICO+GUwvRiLoZm7tD23ILvv
         BHRi6r8QgYSg0PYjEnRjWZ6k8R7Nnl8db7hgie4yl4VSar6dBdt4X9DdU9UNGYuUoxEF
         CGjuxq3oFoieoeE7Qs3oFU3NmKqEfWTKl28aynW4uyfXLp8qSh9e68/tsYrVB62PKh5A
         RdOg==
X-Forwarded-Encrypted: i=1; AHgh+RrXnd5qqmGcYDINMV05WmoJKOYmGfMkzcUIQCAAOtD3HxVDx3ITfBpVHeEt93RSVlwBm1BrfoBj+TtLPqc=@vger.kernel.org
X-Gm-Message-State: AFuF++mhidQIdfqMSMDG4DJk8pO0xfDg2b8k0rf1ADQK7lssB7ha/GI2
	iaL5INiMm972TcWlsPaErEo/vi7ild9bVGUwwgeIuBmfPMg8HNeWfHKHN4VtBcHZgsB+KDlI3H+
	h7oKYHlI9E5jM+i7ldrPkKIrKUZQQFnnoVwkqKnD9ClboRVUy5pj71ii0QnQpwQVi+T4=
X-Gm-Gg: AR+sD128MlY68wAXZcON0/3xhdKG/vjObI375PD2/HeyVV4n0zOHJHrWZpp84t7snjg
	12qoEM8EAr8lG0JstDApLiSxunnU5Ez3exjW+OkBypv0VoQWI/cmUM3RvCxoJGMhmOoNP6DB/X5
	LgJj4cvZqbHL496pM/70E6wIg8Rn0N515J1oJ+FDJ4+NdkUdnUOdQQEis8rlKvI7fv+dnJX73V+
	JSs8mGHeVKPqXW2FNjsGGV6FMryuPb2+mee9FsmxJiWhWK1HJ0DyI1xn4xf+m7vONUhhMhLQlNO
	Q9xrWEm+uZZ4BxlOSllej63Im1qa5dZwQAOn9yZiIEHclq2vpYTV/4shbCzkUyjAUqaUKUiYujt
	KhjekQBiIHxn/OZQyR9qRAf6sg+iT2+tTMMstz4JKKt3yU0h9j8LZu19t68NOgk4=
X-Received: by 2002:a05:620a:6886:b0:92e:9d63:a6f6 with SMTP id af79cd13be357-93913808713mr2845147985a.17.1788164398444;
        Mon, 31 Aug 2026 01:19:58 -0700 (PDT)
X-Received: by 2002:a05:620a:6886:b0:92e:9d63:a6f6 with SMTP id af79cd13be357-93913808713mr2845142785a.17.1788164397979;
        Mon, 31 Aug 2026 01:19:57 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93917236b86sm735974285a.13.2026.08.31.01.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:19:57 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 16:17:43 +0800
Subject: [PATCH v6 26/29] drm/msm/dp: mark the SST bridge disconnected when
 mst is active
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-msm-dp-mst-v6-26-c91d35d6fb9e@oss.qualcomm.com>
References: <20260831-msm-dp-mst-v6-0-c91d35d6fb9e@oss.qualcomm.com>
In-Reply-To: <20260831-msm-dp-mst-v6-0-c91d35d6fb9e@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788164246; l=1108;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=b73mCP5ZBsxlgkNfg3qBRcFP4q1t83IPYmEGlCDuRyU=;
 b=UGx9/qKyXIjm9cwePvp/w9ztl7xoA2V+jY6pysn1wTUFaxUjitPwpFA+hUJ9wg0bVBiK8LW81
 kxHoNR7ZyTKDUoduaqZ66Kn1I7SV2rhl6oNElMz1W+EUXm2TYO+WBmr
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=DY0nbPtW c=1 sm=1 tr=0 ts=6a95392f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=ao9NmXljvuVdf-BuN7wA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX3DdDhmvyNsgr
 DD8E5FKYJvSsX0DlsZ7FicorVI/UmSwt2jGa0a69eF/lGXFGqNkYDJuGxxbwFJ39/92VWMkNLxj
 2mrydpg1jKWp/ElO0nujWi3JfE8SgQ5AlrOWK5NLvHdydzBoPbcaQ5CFYauoUrRacFLGoP3jwcn
 F+kG4Wr688bGD2xCCvBYvsOsmLlKnEZIJ7ainMCBCdZyG9IcJc8A1Zyjrab4HpWmF6hwcB+qagN
 eXzfcCno6DbgxYv7dI3Ae5chGn0r2JIrKdJfpN5BMKM0dQ7LISEYoKpEJxEUTZFeS3VvN3crkaf
 79NqlTNoN/IE5eME0jcObm7+/yPexKxWvo+ol8cuFjPGKfm9TLgBXNCSELuPlUpfzsBYIjTK7Al
 R70H6/UVAZac2jUrOYoNnHuFxaPuqPimy48BUXWKMdk/bYvkeqGfwBODC9aenDXs42IyKjKEfeP
 hoEnSteee8mKFVIUJxA==
X-Proofpoint-ORIG-GUID: S16kPiep8NH9G8ecfrJl-CTGH6eAAlHJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA3MCBTYWx0ZWRfX7eZEJHhGUyDd
 wCfqMy1taRiIh1gxmSZ+vp3i7MHvBlsxxMFUEx7yQpsnpGpEyq4wFrz0HM20iKsZwQxaDWUGic9
 KASHPumPntOWO2pagLyuRJmM6G8nuOs=
X-Proofpoint-GUID: S16kPiep8NH9G8ecfrJl-CTGH6eAAlHJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310070

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

The bridge detect function is only applicable for SST. In MST mode,
connector detection is handled by MST bridges. Skip detection for the
SST bridge when MST is active, matching the behavior of other DP MST
implementations.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 22b925277462..f350c1d03b06 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -959,6 +959,10 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 	priv = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
 	guard(mutex)(&priv->plugged_lock);
+
+	if (dp->mst_active)
+		return status;
+
 	ret = pm_runtime_resume_and_get(&dp->pdev->dev);
 	if (ret) {
 		DRM_ERROR("failed to pm_runtime_resume\n");

-- 
2.43.0

