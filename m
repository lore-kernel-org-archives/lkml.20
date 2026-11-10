Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286546;
	b=Hz9YHU3LC+D4wFpK13ejTWgXViC4jFJMPd5l9HPReObk9RcI6VvctWj8UofvmMM9RCeW
	 tcP2qrYCSXRZfFT49aRZmORhTKcxGXJcw9SCVQU0H9otRJ4Ckl5iwNVvu5AnTnaGtSEMz
	 CzWvPzf8ZVUlWzzU/FJBmGH4lT4bd75Bxs3VIu7QI4sGmX7k66bwI+ljuxBUdOGVEQnbu
	 6OxF71R+2sqfnhrQrZkOfTNW2fhgMjIvEYMbAWP3Fg2/zhsJpedyh+/Lj2TiTehOesD1E
	 34JS+RihjOyI7cgd5mZuno9v/IoLwV4FmluhHdybOaujf/ljeQ64ZZBFum24Lj4APBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286546;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gn3THCYh3qTT2YvtvLWHN5pOZBv2Lnvog214YoYtky8=;
	b=HJ56KuLy95b6X/QziF02KVYQMg3SrFL/x+pVLrOrSZZrGhgf9wCioKHBtEMZkEtxzrzM
	 Cbs4HiVbUf05j6FT886CqCQQHY+ZThF8QD+U4xqIberDq2XeJCshpyu3gu0ev7NAWslfa
	 lX4sbZjHVsBCZVg5QEhT7GEYAdnaj2OFghttSR1+fDDyQSHXgnSVObTSgKeFB4TQ4mzke
	 rSfTk7mZG7Rj5lfbEW0x/9eHsLqXZ4AZm5FPPaSR4cVwIpAL2cqlJQh3kpJQJ0hWJRM4l
	 2XiN3ubkKR+DFEf1tYjRHZ+nREgsthI2jC6osLBQhfqlC4gXSTdo9X4mtnClwj+lCVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XzSWdh5x;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iwhWEwtI;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D34F60A2626
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:55:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D34F60A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XzSWdh5x;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iwhWEwtI
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4AIH82298196
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:55:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gn3THCYh3qTT2YvtvLWHN5pOZBv2Lnvog214YoYtky8=; b=XzSWdh5x8phoUSbJ
	Q1JndPHV1IvO/YsY8U6xT3UDNpxqoBZgh8xpKb2E6+buJ2MG/xTuKgETbnQWUJTY
	DPw0bV7XEDoXPArIVpEcmJVX4th9F+WjZfw9UHHTrBoz2YnmnkjPL34DRCcxwV2Z
	XT8ioBymRDBhM0/So6IYERrFvkLC4Vm5XhtFikOh61Z7a/CaY7hQMmqlF+2sSaVM
	L4bi9fukZNkJpqQdH8PfnhgqmBshr0fNrXaxM4WIaNuD2xQii2gaxFniqRaTVV8N
	OVWkhsnmoBAPbHNv6TDnHFE+ALtdmGcenr6Ej7KGE5RCJ/Q18Ssbv9czE0RPQWGg
	yIW5og==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hu6x2n0h8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:55:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93909014c85so350152185a.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794286544; x=1794891344; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gn3THCYh3qTT2YvtvLWHN5pOZBv2Lnvog214YoYtky8=;
        b=iwhWEwtIGoGulaaPp7viz9JgHu9irTLDI88dmPGiwLzELZnWfCdAVQrfT0l0eYWje5
         b4O33HwsQ361XOCoFlBBjS7a8tfyWFOLy/oV9Y4gJySFd4MkSJ+uKx+awbBwhz2eFT3Z
         tR1sS9dWTykQ+kxU6jyh3d3JPxxpGqw1mFQyqG4xHd06/3J5jEPs92AIG7N+6/6Ljfc5
         +HZWrLTnqqd0Zun3JW3h9AEO7LCph4vUFtL/6f0nbaWHLbW4lqjZYeQPA7d2KhVRVSiV
         NJLCZLnYiEiQkStb3Z23nNDW6oypxqPDkaOGXfa88SjVQOvAfT+YRaHeeIMAbYIqZKuQ
         v62g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286544; x=1794891344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gn3THCYh3qTT2YvtvLWHN5pOZBv2Lnvog214YoYtky8=;
        b=nUn1bh+iu0HtybqMbz1MmuJoV3rcSH97C8IHpFv+hamxvQEReL9T/VkEOh8AzDmZEA
         ACJJJj4bJzG+mSegZUKzL4en1mDTaMYGHkZ2rXhQgeF/C2jpls+tSSfuxllO6SzsLRG9
         LJpp9Y6JrzQZPwqJK6QHVmhsK9xpo59Y80lybU0xl0vSoe2zo9mP3+Zh2la+pHYelHGk
         Eg+EHaVo9MQJVB5P0Ee+S6/j0b6XJ5DaUdIK22e+5jBFk8Pw6g/TyRG9q/B0iw9FAnRo
         dvH8arv8TOjbOgH6y0F1gS9Akfwv4TjJo1HIKkML3iIKqNdxPKl3bEn3U6QZDP685n6Q
         pBMg==
X-Forwarded-Encrypted: i=1; AL+hErHTyyAkbifBjKBrFbpI1eyVglMAmPU/uyliDvX9TZ97G9xcREtAJg6EFhXifJS34F0yVrMGp4D9pAosLDw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GiVID0nr7gTIq85a5qQo0SNxtKQvmhXFDzXXqkIaHpNZBxzZ1
	1gmCizqNLnYe8CX9TC8bUPJR/nf3/vzUZ7HgGNDKu2EE1ECyVS32sPwLBuyQtmjHMPbCokpi29F
	1AJTADK1lH7unOXx18i6oobYgzR8Yi4RPzAbmDwaKCurz7N9F2wvUBtSmmefWxMIohbo=
X-Gm-Gg: AYBFou07xgDqS6UR+Ql3E9NurBtUB6yZpUyS9IdDEn+psexxeNF+W3WGkRNB3I9D5wv
	9rbf/gYe3ihiquRYFkijgbyS1vZ3+PveabZyuaRopZWi/wJ9uPEzltA8YKLlItTUJuJMPYnuwUW
	GJOHjV7hV+c3Cql7DiuFjGKU3xO1FMscnu9hlzGuhR6L1TjIaojxC+qNEUWVD/qR9yB20ykDrgt
	KPdXS+CPTAU3PjNnkahNGy3DXee4uaJmYYc9MpYrSN9e6AmB1ETnXDgywIhL8mmeRl3WQ8XcyWn
	EO0yQcAleelL5hdqT6opujPc2+1SQYDHiRj2UpXruvxAUutqqAv7IESukBcjkC9u3wfDeVtmJxC
	p8UAS8xMHZepdngjgvH/HnFcnYKmrQ5CwurJmfs1iyPGQdm1h5bdmkERh0XN00Am4ek2qQnUchS
	E4NZyx8sjsEwBnv7532x6DC2XlsXGOkApu5uFa
X-Received: by 2002:a05:620a:1d0b:b0:93e:8c7a:bbf7 with SMTP id af79cd13be357-9479f1cd114mr240620985a.10.1794286544189;
        Mon, 09 Nov 2026 20:55:44 -0800 (PST)
X-Received: by 2002:a05:620a:1d0b:b0:93e:8c7a:bbf7 with SMTP id af79cd13be357-9479f1cd114mr240619285a.10.1794286543702;
        Mon, 09 Nov 2026 20:55:43 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73b2d2sm138653985a.10.2026.11.09.20.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:55:43 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:54:35 +0800
Subject: [PATCH v8 14/29] drm/msm/dpu: pass msm_display_info to
 dpu_encoder_get_intf()
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
Message-Id: <20261110-msm-dp-mst-v8-14-d040fb33db5f@oss.qualcomm.com>
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
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794286469; l=1951;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=kSG1AwjhdD6UXXB/LAoKM+KcPZ/iXxLYW1hElXuN5Nc=;
 b=1Ahcc+eArGXWKK2CYbauZTCiZtd9bFfI6sItHoIq65yoqCvQ9mfGCoCrQeVFNLgJuKNWpVsCW
 PJy5zw+3G1uB3vk13q6TkD4K+aY3gUEiJW1Dvu9X8fj5+CwTAmVwwwn
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Authority-Analysis: v=2.4 cv=TMjQ2Fla c=1 sm=1 tr=0 ts=6af2a3d0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=TTd-C8IxYANZTSfMnlIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX1hSWWX1A6b1U
 yHu8Z6dulzJxySjWO/05HqI9tb/fwXVQcZw+X90yC/hu3eKPA+4ERiJb5uYpbZ19EQ5ATLSD6RB
 XM0e5Cn7ebEkXJwge/vdIjoP8Vng/UyE2aCEeOI4HOMYw83SdZ2I9z/ADxadqPgqZLhVDFRuX0I
 umQoTAVyUzxa2s/hELOy4C3EhwxJ7Gs5cdV9bcu4yKYI13g2QZ52jRvorhdWb4IAAJ4UrNEH2bL
 dyR1gnMOko4wQfRYB5YRS8UBXxm1koqD/wD4jJG4YohA63g6fG6+DIWbraW0XXaRFlhWUSCJRQo
 WQMltGaVHAnzd2BcdZebQO+uUafXsGSBW5n8mU+Gn7vTxaAxldKi4F+UoQjiUU5ysbsIF+8h05C
 I9EOvxyqKDZ6OF3Gnw46S0C9Mq2BYf11ykQsE58ObqQfVjtgAodYqhiNzy1q/Vj9IWAxFH53SJe
 Samb3gnXlSu9iiYlDMQ==
X-Proofpoint-GUID: 9czb0ONoo1QLJbQG0i_W_mB6oUR0zdJu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX8WTOR7E9H1Tt
 TbKHTZT7DM2BqZYp4zK8flfxPXoRMqzbPjYIbJDwPgGVZ9/w/wOgf4deMWtwzLbypXrwP8iN4fg
 O0OCg/Eh4uQeu4wHibaYAAzl8h4l2e8=
X-Proofpoint-ORIG-GUID: 9czb0ONoo1QLJbQG0i_W_mB6oUR0zdJu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100019

Derive the controller ID from disp_info->h_tile_instance[index] instead
of passing it separately to dpu_encoder_get_intf().

This removes a redundant argument and keeps all interface selection
parameters in msm_display_info.

No functional change.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 0a6be69a3e83..5e1c98371181 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1435,15 +1435,16 @@ static void dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
 
 static struct dpu_hw_intf *dpu_encoder_get_intf(const struct dpu_mdss_cfg *catalog,
 		struct dpu_rm *dpu_rm,
-		enum dpu_intf_type type, u32 controller_id)
+		struct msm_display_info *disp_info, int index)
 {
 	int i = 0;
+	u32 controller_id = disp_info->h_tile_instance[index];
 
-	if (type == INTF_WB)
+	if (disp_info->intf_type == INTF_WB)
 		return NULL;
 
 	for (i = 0; i < catalog->intf_count; i++) {
-		if (catalog->intf[i].type == type
+		if (catalog->intf[i].type == disp_info->intf_type
 		    && catalog->intf[i].controller_id == controller_id) {
 			return dpu_rm_get_intf(dpu_rm, catalog->intf[i].id);
 		}
@@ -2672,8 +2673,7 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 				i, controller_id, phys_params.split_role);
 
 		phys_params.hw_intf = dpu_encoder_get_intf(dpu_kms->catalog, &dpu_kms->rm,
-							   disp_info->intf_type,
-							   controller_id);
+							   disp_info, i);
 
 		if (disp_info->intf_type == INTF_WB && controller_id < WB_MAX)
 			phys_params.hw_wb = dpu_rm_get_wb(&dpu_kms->rm, controller_id);

-- 
2.43.0

