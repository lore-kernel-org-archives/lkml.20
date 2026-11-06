Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794007372;
	b=Ts/jPzv3idB/ntu8v15+ExKFuA2DS339dGCWU1jFTpnHuIdCBvVfUGrCgUurSZF6TbtG
	 MqDoFCk6VK7Zp0+mxUJOmgKzJZjrIchrr+wRqw2W2g32g3a1sGMChQeH2YTSS+OV8CLVo
	 1raY9AUCrwdDl/ul40n+nArdVch6I2PgzgFVNx3aIiVU79s2NRKWoNKd40ZqRWVkEA0Jm
	 ep/gRaFcZxzXTDytZNkDouii3djEZbPFqGOM/oFOHWa76AyRnpqogm0GKA/P99ZT3BrPu
	 f4sT45O4kdg1EhHaBPwoo2Jvfz0qDHNVIvuJt/HgtVexCq7J66qzwBzqpdVrObqwtNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794007372;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kova2M5LKwqQTwo8zCwpaEugv6qTmVtqzP9NdYn1O9Q=;
	b=GXVdM9z4y5XK34MQxVZA9kEc+03/HrJ0jtfuYVx+Xxkqegcwcs92ZtSqPtn97E5kLkZ3
	 ZikzO8kcu3TwDQmx+pFmbntymQr0tlDL/INHEfFCTxW53tOP9/kV4OKxSMKcrkBUo3MbQ
	 7WCT5blPjkCvSCSZHEQaIvH0ZDC7eNZSDATsrKrSk7F8ce7iTsghwq+03CwfNOyL0UHNg
	 wTfxbBYQ1D1BgfjEY+qdlDgocX85puNI1CrxGx8373R/HGXU+u/Xc+Cb4HK5IjvctxSBQ
	 52vA3sR6G4CeOo2UWF38nLJbd+WL1rf4zFROcmYsp9h2m2Bj+n8gyddd1c1wAJe5N5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dzSRXlqL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VJ7fzAQY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CFD606A32F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 23:22:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2CFD606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dzSRXlqL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VJ7fzAQY
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6MomRp1105639
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 23:22:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kova2M5LKwq
	QTwo8zCwpaEugv6qTmVtqzP9NdYn1O9Q=; b=dzSRXlqLtK4tSo5oFnZgVnDk1Ep
	FXJmzS+1FKMfPkunILQbwcGEZmfYE+eTJjGYQ0jXfsxL118+tgFesmGw/CDBf6ZB
	G3QGZULoizNlT4AmUpWB91MPwYgvnnnlPK4KMD5PQ1VmDdcBg/EsP/jQJ7YYoKjB
	nAIeyhYQmWMUK2AMF3ZkFkk4yZESG2UwjdVy5KGpKp5AVg13zzws1e+Nmuj/vIlf
	ywKzDP7odkFaab9eSJExiro9b5+RJVNKvibBzz9aK1nRYfhFtErtNMaGYXGIihbv
	O1+mdVgOw46sSYZTqmlUXeSRp1kRewEFLGz8JEB3aTi9qHk9qovfdbCF/zQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsk3wh7ge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 23:22:50 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0a528ca65so1009157a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 15:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794007370; x=1794612170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kova2M5LKwqQTwo8zCwpaEugv6qTmVtqzP9NdYn1O9Q=;
        b=VJ7fzAQY4N+9Cj9cHrff+6OQFZ9iEU+Od0u6tj/5mPt/scmugTmiDTHh78eeR/RbWr
         fF5S/tdVvMk8bhVsdMtUhmdCxtpB9QbIzbl+RTFmluU9tWrNlZlDhiKBHynkBKoCQ1RB
         RxJRHZc8e02yH0B4EOvRTbU9vwnk0DMHtFZkDle/YDpE93ZSG+aVf52JRNMNFQR+XHsK
         ZcJpL2r1Bd0P77KS2rNPFy7NWOH4yWW2wkNExhyoSlB2hnf1/GpLKFBH1k3rmuwEHpUX
         8n4zYze1AxpiKi6mf5auS6ZU3/WD7DP27S4soQ0OA6ByAeOoxz77kJQzgfoC1FBrvYEh
         mrvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794007370; x=1794612170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kova2M5LKwqQTwo8zCwpaEugv6qTmVtqzP9NdYn1O9Q=;
        b=K+R435Kwk+7QaF91Va/bna+gVFn4BAQxxg6pD5fJudiKQq2DLwOjOB75mKZgjTxoV/
         A7hOk2nZe0Pyl0JhBR733Lr07dv2EzDrkoYiVfxKWwXBQkNxjT6X5upnQa7tcPdvO9Pa
         vhPrONR6v0xvhi5fNZdzXJ3VHcqCiTPNQKqk50p/qe7OZviXqurMYN+hUY32tGdsEUfr
         GttkYEvF3uuWMeQ6JXVhiSi72vOzciUKCUw5ZZJty++rwc7ceHhn9pkxy1w4Kg76jedh
         qcUSyPHqR2kz7rrJgGwjOUd+5pReTg2oQd/NbQ+AOXFi5j+5sfWU9LYNIXuI16xW/EGj
         a92A==
X-Forwarded-Encrypted: i=1; AL+hErEWuwmEJCJmaTeNOjGtydj8PrtxYKIvgcgCY6tRLHjUwaVphqx5Ln0VuhfYCae8ndo1MKFccun3s2ZYcSI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aWzIdAPG+8CuPUo5akp6j1/T3USDENqVDkhopgzIwbzxRuz0J
	ZMURKGny9lXb5qSgDWTkcvGjLxBIaErsKKoY2lTDB6WDSFtD9wDmjy3wDGcRdMzv2ucgPTeVIUZ
	WpI+3uPp2wrVhbW8B3IkVr61XilIPzCWSt+jz6EMayFSGmRgCQ8rWkV9UXlNjt6Oszvg=
X-Gm-Gg: AYBFou3RG5friNPoa/nT78yDxSwoWenYJ3xXebzyo+52iOpUwbZ8LpM0s3QmbeXe0o2
	u/BO5W/nYSkdiskFjgT4DtKLszMcWmTzVljGA5gnscxXyGHGpwZ672+Y2ypi0Wk+1mIguDfHcgt
	Hz7dPJi/veWMVNarkfTvhAaf/81kJi+Gt3AWKap9oxUdTzcHUwQCAk60oPx/XFJAUlsmQ4v0pTv
	TiYYNvSDZ7HX4DY1HRG2U1RI2tZj6tKwUFDkXBN8q4+Zr+Dn/RpewCdv00hJeRZrUbvEzMqcRZ/
	BT4glqTBhiYydrGDOHoj7iyJ7emStygKYyBSqtiwEnWRqNJjCo5DkT8aE5AeKjxlSgj4v+wskc4
	tHkO3GXcYH+dWfVl1Q1wdE+3E45x4x1dWBmrBmAtOFAGiElB7WvJ4/yCGPIqPh62Ylf5VcbASiI
	0opnKHUJSnHvCNDh/GH+ttskql06YTlnI17dGIueaL18yAUbHrGt64gEvyuCeeeg==
X-Received: by 2002:a17:90b:3ec7:b0:3ac:8af9:4a77 with SMTP id 98e67ed59e1d1-3b0db6d78f1mr3995903a91.10.1794007369630;
        Fri, 06 Nov 2026 15:22:49 -0800 (PST)
X-Received: by 2002:a17:90b:3ec7:b0:3ac:8af9:4a77 with SMTP id 98e67ed59e1d1-3b0db6d78f1mr3995881a91.10.1794007369158;
        Fri, 06 Nov 2026 15:22:49 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1057c2bc8sm664748a91.3.2026.11.06.15.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:22:48 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 08/15] drm/msm/adreno: Fix PROTECT span length
Date: Fri,  6 Nov 2026 15:21:00 -0800
Message-ID: <20261106232220.47602-9-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106232220.47602-1-robin.clark@oss.qualcomm.com>
References: <20261106232220.47602-1-robin.clark@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: G_W2XR-NGKa-WIIQC8QayZbkFlkdz-Wj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA5MyBTYWx0ZWRfX9MsWc0zFo7aw
 3XarYtj8iUsjsS3Orwfd8rM/Kp6fnC33bC/dxHlShmAlkwsw+PeXSqlsVW7QtR2tttBIaTRUDeD
 aXEt3V6v2a0NVw+NFl+3I8vHDF8AF6lqm/1g1t8dId7Cjf1eLvB4OcLfXTq1R3FsV0uezWhH5Z0
 QJgDFylsGAcKMIKLjrITKu/d7o6HOaioP4BRG7eLCd0n/5LWOSbwVxLnmBQ2XHmJDTOB6yySjjh
 9oxA18IuyI70JpJiI3pEHI0MD2susbTBSq1VXyGur2ikUcxe4FmmymYGISduvAVW4iajLRH0Qpi
 CkFjEw03HP7ya6dG6Vr3pIIY04k1zlfAD788+g7hyYff2VkAuKPlcWMDR1NQgEgkrU/MMJOHwTn
 COYYuNp7SgF9WEmS0Vwpa4bIn8qK/oS7TMz8v/NurdVeFLsV8dU/s+Hk8/ITV6NCHxcTwugvPbh
 e3gpz2Gd8wvLgsXIAbA==
X-Authority-Analysis: v=2.4 cv=a6OlZkSF c=1 sm=1 tr=0 ts=6aee614a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=MJDCpJTP__1aPQla-tsA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA5MyBTYWx0ZWRfXxbTv6Cxr3cCC
 GSy1gVmGeXfPvS9s4pDs4u/LcKO+MC2VBfVa7SbFdQemQNqszcfp0MNeGV3E48/DPYJw0bBJkbU
 vgHsfRRE3eagviADrqgOEk8TenTZxjQ=
X-Proofpoint-GUID: G_W2XR-NGKa-WIIQC8QayZbkFlkdz-Wj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060093

Don't let the length bleed into b31.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 4a3898e58aee..cfe7a3ed44c4 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -244,7 +244,7 @@ struct a7xx_cp_smmu_info {
  */
 #define A6XX_PROTECT_NORDWR(_reg, _len) \
 	((1 << 31) | \
-	(((_len) & 0x3FFF) << 18) | ((_reg) & 0x3FFFF))
+	(((_len) & 0x1FFF) << 18) | ((_reg) & 0x3FFFF))
 
 /*
  * Same as above, but allow reads over the range. For areas of mixed use (such
@@ -252,7 +252,7 @@ struct a7xx_cp_smmu_info {
  * single register
  */
 #define A6XX_PROTECT_RDONLY(_reg, _len) \
-	((((_len) & 0x3FFF) << 18) | ((_reg) & 0x3FFFF))
+	((((_len) & 0x1FFF) << 18) | ((_reg) & 0x3FFFF))
 
 extern const struct adreno_gpu_funcs a6xx_gpu_funcs;
 extern const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs;
-- 
2.56.0

