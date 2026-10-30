Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395200;
	b=KJacoRcm7YhlmPobnirp0o5FOKfRAeWoVmRQ7JTJZ9pVeovKN2E9WvHYICh/In1tZ65q
	 m9VtbgmcLR9J3MZXWZ8lB753K+Am25EAY2jfLtMP+9xGLnINnGU7BzinXnyw1E6yrfJKj
	 UHZvrZ28ahA09QP/xlorW079LqplWgSJpKYW72hQ1PP8IdU1nswDP0iI+1TDp+Xw85KeW
	 /+LhKl5oWw3mRXYvmqLY6ESUhtur7koYuxY5N5Ce2aMt52tHQ/WXRjPAtimRwi+u3xsOY
	 AEG4K96QBjCwhkIAsv8ZpgHpEQgglPlTsP1aVMwq6Zao6MHe+tqicRQsiTnCKiKoe0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395200;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KTqlhnQMr2NCQesTIo4IGBobCa+G+VXCAaqS3tav790=;
	b=1SyOO5oI62bEd4EIZnqo5ASvZvtKMppm8E9hh0THGekOmaByX2v1pjCG7DievhAJTzFT
	 npQI6y/fBdcQscYbLnGAJhTJzbX65L9wQRn6LD14FvvogiYNaocQEVdY+2+R5XCdxnbQn
	 I0jr12OhUT/XhqtApzobcWrV1XMS/ZmPwBRFVUV5nPqAJXa734gWjEZidEV/zq+GJIwUo
	 iL4OwjZjnZ3qBUzvTyZpsUxenXpqTEjmQ5Wi4afJMAKI3X5d9jXagvrNBqzm1Jl/bTWpx
	 WNwEsAZtrnjyMGfNkFsKrBTEoc/gogYhSzDwVW5rbR7wjg8kykkYiDZBhQLHFruRR5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N5pJfXVM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X2OJf5mn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058CB60A6F60
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:19:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 058CB60A6F60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N5pJfXVM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X2OJf5mn
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULDxGX207299
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:19:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KTqlhnQMr2N
	CQesTIo4IGBobCa+G+VXCAaqS3tav790=; b=N5pJfXVM0HBJFm8p2G1mlZXXoO7
	Z8NRcrfRVVvd1os/tteLSOSeR5g3vpNeN9eBz5LNsBZBwvi9Ozn9xCt4fK4Rk2JP
	ZTT8o2qOdLLIHDj/j+33GTGyLOhQn0N5rXkfU8RWRmtipDDpqNtMu/tcEmbqBxWH
	oXkxNp4AvGFXDg/jyfolrVOyj9vl/rxQJfdnff79LNJQKJFHBJAFyKwO2U0nYQXm
	kicYBFbCdrenW5oTn6GRd+ITFoMPUaoPbfk3c3c860/TNsT+HTyn1mbZ7hBbaOf7
	OjMkcKCSvOVMUZkoQXB1S4+clhDyufwvm52yHRYgH16Gl/fGHzPJdIoELNQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x0g1dq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:19:59 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ea71803effso12542025ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793395199; x=1793999999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KTqlhnQMr2NCQesTIo4IGBobCa+G+VXCAaqS3tav790=;
        b=X2OJf5mnGnmnlg8CA6kIkIgB0oHizsrekDTDQAqrURUgVMVeXiRmtUvcDRPbMOrEoA
         b+WzZEyMFT5RK99AWPy+ns7SOmX8rdWLVmbZc90D2jCpIhsky2nL87ELG25FtkKlRfQm
         IWfvJBO7FOWy+xcqduqMTfT9zUrwlKEDrudrV+TxA1qVKdQIH9rTuWDcCC/Q2vUlm0r9
         7K8Fz5S0QnePeti3GaWu+ad2LbPOFG5Hbn8P0UrO8zz0IajdcMGEF2HXCaDX9CmCSeU0
         k94PXMoJhsjINdp8KS9aLinoPI5J4uMQMRMxk7mSq3MBxrVj2QeDoN1D5N7Uq1XeD0Z/
         FnrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395199; x=1793999999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KTqlhnQMr2NCQesTIo4IGBobCa+G+VXCAaqS3tav790=;
        b=DixuuGArtR4dxytl8UYU8o52SKUbA39gK0BbioMuABR+vk/Q6qHfRntFJ1Cl9FXJvm
         qBAFShMcjDfi+j75uCxKPjdvPILC/cLVoNo/W5mOnSGn2BtoQhxkqBIN0zQ8FrM8Qm6P
         XvyQUac1OD9xDq0N3EH6EZlpgZfE17xh/d71OUS7dTtNTUmIe5ZOOj5Kj9neNdjB+6FR
         RaIQhQ/cw9ggFB64o1pF5g/cRao57ijoln9FhACSIpq15bh7wpAd28k1bWdB0edziEjx
         5j0Pr2Kwpo5o0OMNSiuZ/dVg6RH7EvasQ97dUSLvWLFR9wbdrfeuCSOKVE7VVyTaWJsw
         XHnA==
X-Forwarded-Encrypted: i=1; AKwUvBzY9UGTqp2aoCgMShmP+GXWxyBt46ChjCpwCFwNX+LCgYZryAvmv4nNeFKXac72phRxyPJkHywTd7Mt+QQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcpTJgulzXdijBVTd02+VBYdJXd7MXvXPd3MwLnQY/TUQPqpmH
	EwLz+kRkVlpV71ChXJ2FrGR7zUIiiXz7I8VX21A0ujcfMR81pl7qCimyQNPlWjWjmYnGsrYo6+2
	D4wX7g4CFea9JPqqJ0a7BQwj52X9eolPMnU5F/w644WG6U55qqrMG6/BPyr3OSj6Iy2s=
X-Gm-Gg: AYBFou1e0lzNefimB8S9F+3vdBKqwaxPinfdYrFag2PWF6XB9oelL6lpLGzx3+Ejl1t
	1DS4t8RFBEbcO+l2/3W1q/hO9z7rN4+EPSISHCoPiE1heyYIWPhZKh+0Wv8tBOiejvAyC2L2+qX
	seryqq6bI2Qbf9k58wKUI/glzlrOF8ELUQUom/9qZgGz0UQopwmF+tRnPrzVom/JRy9PkLTpC4f
	gdPWQ/CS3IJP9/S1NgcO6vk8Z0+KQKo7o+eSii5VsEoeyc/X86EeOv0MFyQLmfMtjNude7RdP20
	vuNqA/+AwyHx38pprV/5fqNbzFConxM8w0oUai1UWR+lycNCtRsiPC6lQKKRqL2WHyBHF0j48XO
	V+hTHLcg+WI70lqYBkwF4O1m0IetthNxvV6+c9n6X43HoITFG2l60OZ5g4N5w+28bKQE3+etBXG
	vBrT4aRpIunrP1FYoNl3gdHQ==
X-Received: by 2002:a17:90b:5111:b0:3ab:f38:2b43 with SMTP id 98e67ed59e1d1-3ae89772eaemr2722442a91.34.1793395198914;
        Fri, 30 Oct 2026 14:19:58 -0700 (PDT)
X-Received: by 2002:a17:90b:5111:b0:3ab:f38:2b43 with SMTP id 98e67ed59e1d1-3ae89772eaemr2722416a91.34.1793395198373;
        Fri, 30 Oct 2026 14:19:58 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae8805ebc8sm2580145a91.3.2026.10.30.14.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:19:57 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 13/19] drm/msm/adreno: add temporary __maybe_unused
Date: Fri, 30 Oct 2026 14:18:15 -0700
Message-ID: <20261030211928.45761-14-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030211928.45761-1-robin.clark@oss.qualcomm.com>
References: <20261030211928.45761-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: YMnDCQzjRGHPOZAf6V49tTFfNmHj2YNZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfX9DknLlpHmiBl
 mkVYL2+uJH3ooavrqZRccegbzWZm6wJMaztIsG5XUn91DRsovUds+OHoG1rWTUlUr0tDIKfnJpR
 /+NBsKBFa6lhXIziw7ub8AzcdZOYEFg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfX+tpobI2kQhHN
 ZI30VYGmL9dMqhwdnu+hjSlHxp+0bxiLa3x18kX/9Sk4f1hW6DBlehwyFEgJQFpemziJQxwsVc/
 J9v6e3GiOjfWyTqolFmWMwZeoKkErB5MphGw9XuBQvyv0o/2obRH61djGJbFRPobSL7I33TQLj0
 fkqmieDMR5OX2TyiBcQmFk4+qh8r2ox1yQ0Mf/LeP7G+jXEFYEDVJ58+Yx5q5JZMtVipgBIDdTa
 rI6rf4G1SkJ3T2RGK4fiBIA0E5sqnz07vcqIMKUUnPS94E16XThJnSC//sMnmGMt14W+ukiRFUH
 VY68R9c4cU+wI7ElOZhRspdcjlDdKsA3CJMf+B8KkGN8+LoQzUgPKVhShTtFj2s3DK1YDMrihAM
 uXLB3KMbKly/FFaBxMsIB/qmdLtTvA==
X-Authority-Analysis: v=2.4 cv=IpyL47/g c=1 sm=1 tr=0 ts=6ae509ff cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=SI4bJWXHUBEfUJKjJlYA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: YMnDCQzjRGHPOZAf6V49tTFfNmHj2YNZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610300000 definitions=main-2610300085

To keep this series bisectable.  This will be removed once there maybe-
unused protect tables are gone.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 6d6e4c7cf919..c43efb85fde7 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -168,7 +168,7 @@ struct adreno_protect {
 };
 
 #define DECLARE_ADRENO_PROTECT(name, __count_max)	\
-static const struct adreno_protect name = {		\
+static const struct adreno_protect name __maybe_unused = {		\
 	.regs = name ## _regs,				\
 	.count = ARRAY_SIZE(name ## _regs),		\
 	.count_max = __count_max,			\
-- 
2.56.0

