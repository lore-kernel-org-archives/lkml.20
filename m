Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286588;
	b=p+joUEJTdh2bqDBNe4QH7Gq3fvijzJwcukg2d0yiv0rBorMkji1Yt8476N2GvOWbbej1
	 dgEHHkTuM9+2yyCebS0IP9XA5kr9WkuEvqP9u12M9SlarRiftyGz7YntB7QhToKcsAs5j
	 ou4Xt/3F0h02P/pFcSNpiHDjtxwpaiI5OLn1bP+mYmyMD1Dy0h1bszIicJECl4fzEF1oE
	 UKn9Eaoqvt0Orn+0upn5PHm6UqtYWbnYGaiE7gr6/3rk6qDrrA0oYicCLPXUlBPeGkZmk
	 1Fu66EvJBnLbu/Pu6PrqkiL5edG5aWdrYbEK6Ey9XbicZqCZFxJckPCHVT4dXuI8jcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286588;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jiYfc46G77lt9R6Qh2XdLqt53zKjKZqhaxsJEqh35jc=;
	b=sv+wDXQsjqxBl7KfLt964g4n4tcLq0iOlrFNjErPEDjUdTldv3XgMDDd90E38/IAzvuH
	 bTIoLTZtKsfmuqz2fbbqNrnCWkbqY6sdbVW0PJRZGnhZy9RJW0NV+QiB6ZupLgdOR9RX1
	 HAjk3NpI6o1Vi3MZwBSO/oJrxv/GrIINDqHZo8EXrE4ztjBr93ulVaBF4rKRYzjfIImCa
	 xkNcNf9KzFLGAf0eDzi+F5sS4MUroPD7OL42SBbAsKv9Xvxv7o4Z0hEAYvnMOSSW3wXaF
	 FHqbzqe1iiZRE2elCrCj0O1UFXLQWSQ0A5FGwEkCiejQulNtuMLgQHbGVi3a6ZkYakw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gq84ZnNo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ItCDFlO6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C39C606A331
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:56:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C39C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gq84ZnNo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ItCDFlO6
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4ATH11958001
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:56:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jiYfc46G77lt9R6Qh2XdLqt53zKjKZqhaxsJEqh35jc=; b=gq84ZnNoff3ICxIU
	B9H4a4zH9bTIylAz0tQVLzLZC4MBlJYKK8l4voWT1MRUc63bijt0SrIobHQkstAa
	DDG+VIvwttrkHM6FaSxZ2YDYwUbDezZi2YpT1SobD8wXLqrxQDn0O2SIzSj4YSdN
	fFJ108k43Fcej2K5iWUrYiqx5KIovNTjKExIj8QbDc5ySszxIiL5d2UI92IvaP3h
	VDO6RFQW3zn0VUn4WqyjVJU2Ilx3Ar+eDl2FyRHi7EiNoJkc20OyZQnx+qj5bvYt
	kHyTTF+u44GtptjGZ/gZFKU8k8AFI5N5p9IhHx1g47uFczDAmeokb/9Z6Yk664uR
	Pz8ZPQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucydknm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:56:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844e383so321400685a.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794286586; x=1794891386; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jiYfc46G77lt9R6Qh2XdLqt53zKjKZqhaxsJEqh35jc=;
        b=ItCDFlO6FdZ2jnwgZLpn+BMXd4/85eEfIEgIpR0JYcebC89xZY4MqAMdBY39198phG
         QdPiYbeJgJpv2YRWRN6mOxbRQ0gOqS+UPL/wx4M1vFtl1TKr2oNWrKMTRy4ei/9LTLgR
         Jjfe7EDaocd0H1DNgMYxggdjz1DQizXBmL9aR72HPyQbdQDSkq6K0SZbpnRQaB52embv
         FxDcY0KA9icdfCBnKqtotvgkEIOTsa3bqdJTB7PjJBZMBQiAyLdH56dcupwcClRPYm7R
         ns/Ag/FGVrepNjOm8WPkzDChZE3eT+J+bxjEdLoN1sua8Oxai8izs/jNiBkghjLsMETX
         3QJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286586; x=1794891386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jiYfc46G77lt9R6Qh2XdLqt53zKjKZqhaxsJEqh35jc=;
        b=Ecr76LYnLjq60/mTME6KDsKcSHpbs6nCNQ1NIc6TdBCKQ5FVOxOub1mKZ75ZumdAWY
         1ufoI0b9tMvI4Zifzjg0D/9IzRi8IOdLWYPP1kZhV1SFpvAT0MNv9h2+wZ6afOCbZsZs
         HF9UtIqAPxuCibd/iGaimC5Leeyes3MI6sttUiKj0YfFAYaZcDUzeYujCchO9lkmkci/
         ySwZ3JXmFeRE43vwmjm/MXsSXwCYzcnjrZDx2IO7Nr9cDif9txoWCakw4+Ciq3JlFQmA
         dqfStdlDIuNny5ibAYizfN1bLzVB+ybA2NI7ce2wkDXZ6dFc1jwJ8WaVjFJggaGTGMmi
         R+CA==
X-Forwarded-Encrypted: i=1; AL+hErFUDYYapY7HYWsdUrdKPW2T3CY8PR/FQR/AGaGreIFVw6Rob+2+v7mKQVFGTO0EHegYEx4ubinVHyUIkXw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WkL3DeJntzYRkMeNoIZ74xxo4eSJVmF7tYwEFKH1avtNfloQY
	u+FwI/Z2guByN6v5yLopyuzArbLAC83gNpyMX322C1DFjrNb+iMYu1QxAuwj/5urIvIzPHe8TvA
	BozGcSaqw6oFiY9Me/S+uPSktXg5RY+tTvWqfyOamKvZ7uL7m3Dhjsp4UurITqVa7X3U=
X-Gm-Gg: AYBFou1AFtngiWFcBNRXPZ41i1uxwDRsTkM+aokDC9WDLA2Iu8XT908rYwon0tvKOqc
	MhK/42iqAsy5IdlBfwvfhz7tHddGpO4j+hDcYFOaNxK8jhoui9/hfsOtHNldTC4N8S5JBZ80SoF
	c2KV0LPW3ccmcBSJnD7kRx7urcBhk+Sep17emz1n1B6tY9Y5D+yhJa8/HMijZb3IUS8S4/fdVT/
	0/Li9eUUU/cDuZ440vsN8EHpYOkcvePabMEZn+NSlvtrlZRFH+rTxwFTy5hKCn3YpzRFyoOV+4i
	OwRAeCewtl4vHiozgEGBxXc9j7yGN74h4AUFpSuU36Mv8II6OXlrvDfCwSMdNKmtG0C8khVEyEa
	bdAImOUReyv/FzTWgI91hZp3NzwlFZckaTQ7/uWfnfAkJcwojK7cf1ePcMCvCoLHuF5lIFvYbKS
	K0iewr0rSIpSWtoQCvNIM2274E1eoKKgKNh/vb
X-Received: by 2002:a05:620a:1d0b:b0:93e:c12c:9dd0 with SMTP id af79cd13be357-9479f4454a3mr237103685a.80.1794286586033;
        Mon, 09 Nov 2026 20:56:26 -0800 (PST)
X-Received: by 2002:a05:620a:1d0b:b0:93e:c12c:9dd0 with SMTP id af79cd13be357-9479f4454a3mr237101785a.80.1794286585589;
        Mon, 09 Nov 2026 20:56:25 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73b2d2sm138653985a.10.2026.11.09.20.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:56:25 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:54:44 +0800
Subject: [PATCH v8 23/29] drm/msm/dp: mark the SST bridge disconnected when
 mst is active
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-msm-dp-mst-v8-23-d040fb33db5f@oss.qualcomm.com>
References: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
In-Reply-To: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794286469; l=1111;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=g/Wmh1bQW+8FuOEW6WjMpaGh0c6vu+MEknlrm5lZYXI=;
 b=WR7Qm7cjMwoK1HNDcf6+Pbhjj4o6Zh3v1SLbX1SStKLOwIM3yAtmg1wNzx9kFfNItg0v/Yejc
 mAEoxYEue7aDgLDCBEgqwqh2Jcyx7OgWpTxK08iSYc+2eDw72RKUmdT
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfXz/eIZrX3YsvA
 ggSp5yso7gFAL0G8BXmYWhuhFuOmGVOemc+Lgl7VWbkcyLVcv70bZMsp3i46YriFi/IM4D4Wacn
 JFUvKz1eZGxcAvo7Rl8sIw7YQYIvF48=
X-Proofpoint-GUID: BvgMYwSV--mWbw6P6llQT8T8CGVOis-i
X-Proofpoint-ORIG-GUID: BvgMYwSV--mWbw6P6llQT8T8CGVOis-i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfXwvZdH3Rx6raB
 5lm8T03T9Qwgu0Ua55/Xz/w/0PJXyGKI9zvijCmV7wF8+xZ0DwHRa7easEVBS4WJaGY96fPGQpv
 nNQJLl/jAp1yBfkjRCsxodW0KZFBYzjjfuXLN8xzTmfFlXq3Ivt7NOe0Y/B+f1cpd8RFyzBMpld
 qBDKyAnI8N19Q8TwEns+D6a+65MA9DriBlKmJFWILQBWPyKCVaztiFsqVVvh0kJgVipwppk5O8q
 jNloI6/cGV3Yq5Z3FCRVxo4hasxeqhbpS64t5G1tqlNttiWS7HsEJwNKO63BciDjF4OwcfLrNtM
 wlVg0iec3P9VSTa55HvlBJzbS68b3Asc1c0oIiWiaufrhftpPw4jJYT/oJKPTxfYyVC6wTWKCDI
 g9KpjCnRETFG7tVr5aeJZBNYPC9JkHTeIPwsuXrmqPoAuCRUmBiPF6IamdTtdsSsPltObgpt+Zx
 VoSCCO83bdQk/Uk/55g==
X-Authority-Analysis: v=2.4 cv=XuRvqlF9 c=1 sm=1 tr=0 ts=6af2a3fa cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=ao9NmXljvuVdf-BuN7wA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100019

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
index b4e788d1f611..f87eea19c4f5 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -976,7 +976,11 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
 
 	priv = container_of(dp, struct msm_dp_display_private, msm_dp_display);
 
+	if (dp->mst_active)
+		return status;
+
 	guard(mutex)(&priv->plugged_lock);
+
 	ret = pm_runtime_resume_and_get(&dp->pdev->dev);
 	if (ret) {
 		DRM_ERROR("failed to pm_runtime_resume\n");

-- 
2.43.0

