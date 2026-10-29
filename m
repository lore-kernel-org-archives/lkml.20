Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793305082;
	b=O7803paqibhqYMoPnrGRHkLtrOGsnpDTAHmzxEUSiBqXYIhK2bufxfRL5CgMcK+JLIYL
	 kvBXoV9clV9MQJWfcMExTNINXiLE5jf5qLVKZveSDyIQnPgNBznqVrhxtntJa0m/degaT
	 rZ5iZiuexANW/QFHSC2paVYC4iDRNOt/AJ/uLGD7U93GZlpXmnS9M3PurAmmHk8Y36pf/
	 NYtqz1eoH2toA5ym1PXv+lZSfi0mq6EnNr+jquIAGkoXsi6ZfQa7bo+Vhmv+8p1ezE3KK
	 4+jETRgo1qW2I59vVRAnYbi724w5EtW+aXK8XrN62TAFwJCzYUO4ro8WXafUnpmAELA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793305082;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KmJhK2itx3oq5CFXOLUBAEnzm33IyEvfIC8LefReZ0o=;
	b=0EQeEPw99m40hSi5AcrvKVbywYKjZT6qrRhfBTmHOVZG8M3+YhzQxdgyjFfiyMd2tbxH
	 qFXFsy11etApbF8hs2XczIW5klkXGdQuOjdcsHB2HIvUEtb82miVccd7z+org9yLFxG+d
	 GYq708LoqN/eA1GDF++8tw4WIPxFDZWKkkjlF7zJzTWjBW1LKyx8PwQ1OGX5EyvwlgEnh
	 8hBnFdwrmPvGGKHjHy6uyzDFc37uCf6r/UiXu7qxitzcYErMX+035cO/ubyOInvWu9tWa
	 06l6nx9wIaMfK4B6TFmEKNAj7xCxbAfMAOJLeP/jxNQwch8+24lxksSQoD6T/B+8ipQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TL7vWpdB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YhVx2avP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45FE60A380E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:18:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A45FE60A380E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TL7vWpdB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YhVx2avP
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TJk2ZE775018
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:18:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KmJhK2itx3o
	q5CFXOLUBAEnzm33IyEvfIC8LefReZ0o=; b=TL7vWpdB2TWnYmwes9aee7MBOeS
	XHISkyAon+eugc9Kq/+ZEHvu72csguQwJHCRI6PJdxFSc5pz9GynFjV2vdPHW1c/
	C2CRd1FrJli6JfBNCa/wR/C/RKa7GE8IJ6gbO5IcwIzXehkpxnpe87dE7XwVdN2z
	tG9NkcFYXhCsjpX4m9ornha1cn41EGKeo1qySI8uvy5j4lUoxCw7VgZvLY5S3efr
	lTQ4rUuXLqJupcz4jgORAm4NPuq+lyZxbRjSLryvqEbZcQ/vh9AQ1kqjJ0c5AxHA
	scbQifhaVfhmmi2qHhU4JyTuNyqfDBVbU0wFF9l1BUrQN7p2hSsOwrVdmNA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hmchhr45u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:18:00 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab67ff8ec3so6430a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793305080; x=1793909880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KmJhK2itx3oq5CFXOLUBAEnzm33IyEvfIC8LefReZ0o=;
        b=YhVx2avP20/kvW5wxG1ewDF9WvpAyHGrs+iJmNPWnksxXrmdxAXfPkzTWX4Li1WhA4
         6beKUh+1x7+Nx6+FkPVrdA247oezwV/TnYIKFBbyFqcdnm2Lh8u/nSIzRzcpcUe09Ddi
         D86WPGnqyB3u0KUek5NiiPc6nD/b21MwmYgJOJ+a5U5XySQz8vWG/Q3MtLZ5N3q4CZ7X
         rofyqFBencHnH/0RTvI7M5BmY9AZgAksJ9CGatRowjEK7IcK4Q3VCs154djq2ijrBDuw
         8R7UZWaiuxw4BcVGCs7wfr1Nye92zEdwaN24YPeirlqv52HFi4qHk+azO7Tn3z+JQVDf
         O5pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793305080; x=1793909880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KmJhK2itx3oq5CFXOLUBAEnzm33IyEvfIC8LefReZ0o=;
        b=cp8/gy0SSUyAtS9S1PofexZLdt5tFhXENQfXubYaEubyZLAuJdJgjkkPa4MvkHM0Er
         bsgnj5o7NCgvOYU2b5YoZ7OIz2S//RpXAeffeBMbW0Xd0H05ppWOuZkUFkNd0x3bbuh3
         Rdb9uX4r6uCu3AZakazapnxjhQ+1ruMlSI3EE99lCfFIgfm5S+NiidA1e6EvipXwi6+c
         +f5WGxqdcoYoL/Zl9EfwJwDdgM/QNnqE4ghPhLFx+wL8o+GF9ip23OaexI2oYjl/Yl9A
         M+IEKR0BmpxhNLLkRx5+m1l1qc9PuMAJVgReUP6/5fH7VeBqYH4Oc77WeSQeC7RpUQgg
         SIOg==
X-Forwarded-Encrypted: i=1; AKwUvBwcTd4BuQM4/MC5fGEFzV1GcD8XpCRUSNpV8qBW253TNluOwpeXkoQ5js8t2Id74Xt8LoGLoskqo8qoMvA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZROvcdGNuItJK9UsBsOHc0Jyr+Tfef1cH04gsVdBi4Hy6hwzX
	zEJzmgpyd7CZU3BoNXPdmlNj4ZKoEBhwOFYJ8BPLLu6kWL19sfZiAR82iqymzg9d0jLiAhcDacK
	x1kVubacATmMQ8zepEqQLwQe4wBB160mX4IWrYgJNFsBMWQSGS9oJRpOJLp4XoOro4fEzfUQiQG
	E=
X-Gm-Gg: AYBFou2pZg/Uhe2p6JZYf00snGbao0MPIAk/G40DfNdBMsJsRdO5DbMWqhse+cTN8DG
	owD37DTW1dAOnkyKc2V0S6eTOm+7gd9f8sBW1TNAo5UoREeeRsXVgAyd0fzuV4BbIB0MLCARRa9
	VETmFqRKFNB1s9T8o1z6/6lS+cK6j8aJDDJi44NI2yvMSVkyvwT2fK1tZRHrN4qXkSzH5791trX
	JCNSASguAeIWEq2u5RTmwlFjBfoLye41iM/2a/PMmj4kYEdRP0XXoB30lICBOWAqOSB/esT+sZe
	HC9sgo9vubIKxKy3cIn7Z1sEwnF6gxdZIbZVQAwvBEBhJWjq5tg0RwxExfJGZOjyeRQbKrYqVWd
	TloVcbMWybcZO6bC667SSDGtEkVFRVaG+dTGZPQTpxeBzyltLE+vwCUOSoYgf9fBwDanYN/4M1r
	97ljkrDNTEn3Ot9uBBD5xgMbA=
X-Received: by 2002:a17:90b:2247:b0:3ac:7c4d:8be6 with SMTP id 98e67ed59e1d1-3ae89836523mr60536a91.40.1793305079825;
        Thu, 29 Oct 2026 13:17:59 -0700 (PDT)
X-Received: by 2002:a17:90b:2247:b0:3ac:7c4d:8be6 with SMTP id 98e67ed59e1d1-3ae89836523mr60516a91.40.1793305079365;
        Thu, 29 Oct 2026 13:17:59 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae8805ebc8sm104727a91.3.2026.10.29.13.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 13:17:58 -0700 (PDT)
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
Subject: [PATCH v3 08/16] drm/msm/adreno: Fix PROTECT span length
Date: Thu, 29 Oct 2026 13:16:18 -0700
Message-ID: <20261029201730.151754-9-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261029201730.151754-1-robin.clark@oss.qualcomm.com>
References: <20261029201730.151754-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3OSBTYWx0ZWRfX+8IRQbv+dKVM
 I/zK+/VGEqy2ctVGN+j5qo1dYQMIkJNJwoDqwgzRSk0k8/QqkVc5aW+3rtIVri5DjXIV9bVTe0B
 Am1ffk3sIHeCbKqj8XJPbnqQ8qFInfg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3OSBTYWx0ZWRfX61csx9QgaZa4
 8fQd/H25VsIwvRygKsvU72BU58+w2tMCLPvIcsrY9zVCsTPn52bg+1Dq2kfOfprCk0x8G27NG/i
 fWtWMjFpjJWzAKxEXsEBRGLz4cYO2g4i39SYSH2U+UXBHzFdXk0pYa8C16wlz18jDkoD6LU5D76
 kNROrh59x4DKFELGgV39iT10iPv0E7odFKfu/W6xPAv+ArGD+RXTQrJSaezcI7NMjgcGFNEeo74
 7hBYF94mvyHoh3+uIb5/4PqsJBz78quexJscPUpXQhyRS2ldP4vtfgBExHAGFYUnZlg4lHhiYRs
 KnNzHINAWbxOvKzxrbD1XRWBW6klPZq3pUApHXfiAjVJLcN5DhBrGJovZOLGoLAfbwbM1y1hVML
 /Da3y3WS3MsIE5vn7L5k/sNJzfAEZUymjKoaUenHPpcwESry902cnKU/wqQeYnjK/fj5Ek5G8wX
 H9d+EamUvpOizCbcdvg==
X-Proofpoint-ORIG-GUID: fTBv5J9568SOwHsoR9Qvz9W8JtpHCM56
X-Authority-Analysis: v=2.4 cv=ffc4WEQF c=1 sm=1 tr=0 ts=6ae3a9f8 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=MJDCpJTP__1aPQla-tsA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: fTBv5J9568SOwHsoR9Qvz9W8JtpHCM56
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290079

Don't let the length bleed into b31.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 6b23d301c144..c49301be504b 100644
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

