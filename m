Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911230;
	b=kXLxiAj4cHQHTkzgQshQoXD/5Joii9F6xJEz9jmsXoMxrVS5OCe6Pv975YvB/dKkosGl
	 1OTJunMicem/DVyE/9bepWZ1o/iBMytH/6JAZt7/ONaOUU4npAlxxTtK21+FYLP2so+zW
	 Msn46/XNBlprMdcRzWW+YrXxk0YS4qV5bE09N4vs1Dtxo8ym1YEQoD1283LzSVn+yeviv
	 g9Df6t2X5pP0g/1enbP70SGqMffZILSSVqL/QfMqCN8OhL3vOMb2q8GB8BDpg0TUPPdVJ
	 TMW2AKtJeyomZfxf0dFhAA3T2AjcF83RlMBykwEpZjQQaT2d0GDKKxWhAVi2RgXQKQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911230;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=TdGMxBvX9I6tC8AE9/vKCHVlLgBTvfhgz9mh806xJUc=;
	b=zgDTWISYDGsxNDZYSGT3yu2PZUeFCCCywHKhhvD+hxLjJu9rMBcg9mSxtMvCb7U+yVWU
	 ZUfwCc33qrpIjxwP7JcdfUoOdxKCMt/qRIxqLpT0kk6kaFZGaHrpQEavhhgz8F/20D+/G
	 QEzPkMEwGiI5Upvh56NQjcd26VGn9Ic6wFoW6ZcgVlci5QWmffBEwbsdRI30psd0ltFbl
	 KclM+GoZIX/6HsP8n7pU28p4sZ59W2WCrSPOqtOvIAQZnDZMwOyOef/G0+AW2FJDwzMv7
	 Y3k7s3tz5X5+ozy41278kodD5A4XYpv+Xr2Q3/YbW+XjrF7vK9xACmTVWlI86oOLPoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="n+o/eohJ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W+0gnTnz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15525606D834
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:40:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15525606D834
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n+o/eohJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W+0gnTnz
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5HeAlQ2513415
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 20:40:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TdGMxBvX9I6
	tC8AE9/vKCHVlLgBTvfhgz9mh806xJUc=; b=n+o/eohJGHAnJJv3gjCciox2RrX
	Y5HGuXhCZoBpv8/0bWbxU4ayg5VhzaIIlVjmQI8zTr/xo21ey1yftOOuif6nQ+Bi
	pMI305hQoPGJ8ld4MicoNsNyDZZLgPYOi4ZV23SFiRM48x13qdWvcxBgalFBX7X7
	kWxGAKqOZMpPKkliC6XtR3j0LdDNQruFODcJadS5cQ2Qi7Pd2GnJILbSEzP5/8jD
	fzzlyCemJkDarwvrtLF9dudko+hs2TmpVvZnaUIaFPUbUT9bdYaQLNTEWiZSkZFH
	oIpWGTOcOCEjPYmanoedgy3ljiouvkNjH3okboEvKkC51kfbmKItLQicvMQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrraatknb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 20:40:29 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so1694228a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793911228; x=1794516028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TdGMxBvX9I6tC8AE9/vKCHVlLgBTvfhgz9mh806xJUc=;
        b=W+0gnTnztRJsmCfozQCmAwlFIe4gE5Y+ndaWbhEUnAPVf6vcHTIhFEanlR/P5FyCys
         Iduxdfjem6hMU5xCAZxVmMJXJLPfh6MuJtJGHkbLYKRWoyBdMLBqIKXYnM+CqZLXCwSW
         s6bjXCYHVS2+7ppvRuPDucwzS0c7erOyjOWXMOqFOvY/PkTKWUR73ZfDWiQumYDnkXPF
         DQFy1yipcILJntNSgNdEx8z5eQyjMN0Xt4Zmm8nQDfY1hg/9GgqJCXe8+iV63G1qFgYe
         0OEvclqLhVlmyyZNzTn3GreUifr7Uqp6YKHrO6/bsQo0yltD/BaiFcXa6A07I1L5JHPq
         eukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911228; x=1794516028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TdGMxBvX9I6tC8AE9/vKCHVlLgBTvfhgz9mh806xJUc=;
        b=wjF49ruJl+izJNjomQQp1SjVh7A/vxj9tCltpJCEqntPXggDo3fN+zwW25y2TxAXQv
         WU5WO95oyPAUI/nBMmNhUcz3SdHgcBdbbuvqwRyx9PiZg4JVlbzbeKqEm5/etxafmlRi
         FFufQK51Sa+G5OIp9aHVrns2dSzWmCCDsoFE1RpSkYZajj9FvpJfH9CAV+Z4V6G9kv8C
         dUmxpK/FxhxrwVawV3jSdBgla41mL3+a73y5fZi+qU5mJKk286sMxMWwVqN00XojlaEg
         C0IczeE1PWn8EIo3bi7NOftW/xrV13+nN+ifIY2DPMMBjt286VDlRDiazYZ2D07KfBRG
         Xa0A==
X-Forwarded-Encrypted: i=1; AKwUvBzs74m61AWc0TzqJiuJM55QGSqeGVgMkaoBAn+ji9eobRwIcXCxzDRnmddnk4oEuacOmSUSO5fqBxuAoqg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/O5f4vrC0Hgp9Nuzxd3AAA8P5iFvSEV7wXFBd0s02c+xcxcAwa
	264oilera9oEIu7F4PSxCqbWa/dfagzpqxpVRjInqLcZRhLUa82h/18fisjXuYDR//n9NgaT6EZ
	hP17KT9wH/depRZROOKA1WdZ4NTCW3IDKQQXdvyU7+1CrG7f9zh4DephplP2XOCIl3/k=
X-Gm-Gg: AYBFou1wpxLkFSWJvCxPWparhNosGi2C2nUe5B5IeyAn+Vqvojrh1a+V1+foU1+jayE
	GTfaTuZnZG52TzxXyVpoQ23z2dnBlsB7TllQcaJyAVBzVm4OMbCwdzRyfEgxmBWFcLr5uIQrxx+
	IG5ZMnBuE++w8oVj7TM+A9V4+7XohYoiOLY/Vv4GNxOqBUmdt2uAslqeLNaAEqXvMsJ6dpwCl3M
	rDZ3j/e1qB+EdONxFO9e11K5Jr59uk7NBzv+0ByrUbu1EAKBN7v5LLbM58yf3BrsM3/mh+y/5xH
	r0Rim5wMwnF3LMksJWHpI7ZxGFhRSkge0Rd5dEEbHuTTh/VX+wx7pxUhIh+FkzysktMonayxfOb
	mE6JzHyau0QWCW2Hp8g6EvTxZpUL0hM2qBeqX7JC6FkxP5y6j//ACLOFqvoeqLKvt77Q7UDnV4d
	bPgbRQjrF7gExEgt+liTOl58cdn0Lbke/RhqG6cKSmM76qxRtAynu/9pI/eF26+w==
X-Received: by 2002:a17:90b:46:b0:3ad:9ecf:2b88 with SMTP id 98e67ed59e1d1-3b0db6eef82mr149905a91.19.1793911228517;
        Thu, 05 Nov 2026 12:40:28 -0800 (PST)
X-Received: by 2002:a17:90b:46:b0:3ad:9ecf:2b88 with SMTP id 98e67ed59e1d1-3b0db6eef82mr149867a91.19.1793911227888;
        Thu, 05 Nov 2026 12:40:27 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b313c0dcsm5140693a91.1.2026.11.05.12.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:40:26 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 04/15] drm/msm/a8xx: Export slice helper
Date: Thu,  5 Nov 2026 12:29:30 -0800
Message-ID: <20261105203057.66520-5-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105203057.66520-1-robin.clark@oss.qualcomm.com>
References: <20261105203057.66520-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfX0ujSq81bhYeP
 B+MpU39COOlLRkduOMGlAcMr88C/F6iTqGehuM/3IQ/wgeKUNNJZIJqutRnWtWv+4IQ7JwRuiOA
 M37mwYbFr2tSII1rAxIfIosDbW2a0Ig=
X-Proofpoint-ORIG-GUID: RMlW-AgfRjMsoytfL92oLKcLcYZpirU7
X-Authority-Analysis: v=2.4 cv=U54Hnuru c=1 sm=1 tr=0 ts=6aece9bd cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=eauOX4bcPKZCCnkqRxoA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfX2vwfAJgeaTYL
 EGU7aNGO/Ae4/rzzFXMu4lk3QCceQnnkS+z3q84IlfRaD7KeB/XiJKhOcHvDu3hXqJ9fZi0bLSR
 mzfeNM18OqlAb+ww+1H3wpfRKz837UMTYvE3lIyEO+06bB+wFO8eLcb/35usVUg7GAtPKuXn9UK
 LcjAb8AAG9oCcze4UKAYVCjciA9z3povTaBcX+WrmEq98xYUZ6HJo7ennOLz1npyk8B+AVejE55
 mxyOB3aLzk6ov9OwDDmto4libH0xf6Rd8L7ojtMy0TkGj3cOk3bqaqIxaNNpQJpbD2WfGktXFcn
 UwytneW0KaJhuntbjB31yAqCnQLY+Pz7SeM6JVpCkw67X4diMYF8qpRDlYdovsnS1WPIt0KqGa2
 dOnwAlcttiI4W4i7bDTMkpQe91Gz4BT/NjxA5QFSRcSSapKE+SqAVKjVQAR48zkG2OCvbCdOGTU
 FfiCGh3LOSD1ZL/3soA==
X-Proofpoint-GUID: RMlW-AgfRjMsoytfL92oLKcLcYZpirU7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050082

Something we'll need from the gpu snapshot code.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 1 +
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index e6ec85b20fb7..4a3898e58aee 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -357,6 +357,7 @@ u64 a8xx_gmu_get_timestamp(struct msm_gpu *gpu);
 u64 a8xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate);
 int a8xx_gpu_feature_probe(struct msm_gpu *gpu);
 void a8xx_gpu_get_slice_info(struct msm_gpu *gpu);
+u32 a8xx_get_first_slice(struct a6xx_gpu *a6xx_gpu);
 int a8xx_hw_init(struct msm_gpu *gpu);
 irqreturn_t a8xx_irq(struct msm_gpu *gpu);
 void a8xx_llc_activate(struct a6xx_gpu *a6xx_gpu);
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index be81f141300f..a29f8149493c 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -130,7 +130,7 @@ void a8xx_gpu_get_slice_info(struct msm_gpu *gpu)
 	}
 }
 
-static u32 a8xx_get_first_slice(struct a6xx_gpu *a6xx_gpu)
+u32 a8xx_get_first_slice(struct a6xx_gpu *a6xx_gpu)
 {
 	return ffs(a6xx_gpu->slice_mask) - 1;
 }
-- 
2.56.0

