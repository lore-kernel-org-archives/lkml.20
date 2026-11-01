Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793555214;
	b=A4LPETlwBeurILBzh1/a61cDlTnOT6VT41y58hUUplWvaXcmlmWJr19HJt+TLaFHdyfS
	 6z6zb3Xm/JEvrW+XRIQQyy1yc9fCpBDQ4m7JoM0ClOXyWkEldPMrNBFo0wUkKnDjsvw+z
	 ArFGLn/pp4LQzf1+NdvaPLppIgq0fwJ/+HfI6gVLu+CE8P2kp1KbBiPXGFhiRhsvgjr1x
	 wYx8AGHCu7EtsQdF2qC0+X8R01eBKDi3FukpzFWHLyX73WpudAHh0IH3MqyxDjO9u0XYB
	 BOYNFROuuodmCRCSOm8SO8U6QJ0j7x2fHXlESEfpAfqXl6eHrts2JwEb3y+OCywkAbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793555214;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sNt1SEURO6Fp2bP+i5dHn8qQfR3UbcdxoVQanIQ8xmM=;
	b=m8xpSZooUUy6us3RbBZcZ2JtCgDuvqtX2v6umx+tw3R8m09AWUGXyIs2wkbb51aa8oQD
	 TOW0/8OlVyg7CRle6a6tpgKJzHZ51+cMj+VxeGDYPV3YGKsOJpCllw66SdCHbFm4LyMlT
	 YE8NZbwqcetaW6rXCktWhQTzAv9FLKTgwXDQF/5omnssktvhZcFHMnN0pRm4ODX+uhgYB
	 txwUAPa9PZBmRFcfPmKAx8lMaqd437UuzsG3Mv2HvY+zIlWebGdNAWs8dZB6l28hJSknB
	 WzFHld0tq+AIUhkAMpSbf506RhrzUGV+JzMVJ80lmEADzAQtnzee1JI8ar/aZtSbxAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SgdbfRuQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YGxjcat8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BEF606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 17:46:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6BEF606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SgdbfRuQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YGxjcat8
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1HQAVU1443658
	for <linux-kernel@vger.kernel.org>; Sun, 1 Nov 2026 17:46:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=sNt1SEURO6Fp2bP+i5dHn8qQfR3UbcdxoVQ
	anIQ8xmM=; b=SgdbfRuQ7cehi3Gl4/8xYqMO3//7VC0XGpnfIv+d3BWvGvT8+of
	erljRqDDDXQuzBAdMV3yMlH62Vq34jM5SuPiQB0WBZHwbPMu03tBM0UAGSEWeaHa
	WlfX7HJlHUNaFEyL4Jkq0+vWGf1JcxLfAcWIEe0KJkN6R3XZkgg0wH4Fk1SAepo1
	53atyLDOp5qISRYJYxqfPtPdi7KdjyYhHR/IuLXitjLtn5H9r7yZ66tnwfXW2lCr
	1x7SCw5Y4RjUtsgp/JWVAJCr6l+mr/CBqMsSYPNNsc84lK982rwtSnIkqonquclQ
	CTp1DFBmlpKucCQSC+UmBHFaCFCKcm46BGw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8dubu6f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 17:46:52 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2eb00825063so22382655ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 09:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793555212; x=1794160012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sNt1SEURO6Fp2bP+i5dHn8qQfR3UbcdxoVQanIQ8xmM=;
        b=YGxjcat8CjvD3fL3qsnqNiHRuNWTGoIPkRHlUVErjUFxIB9O97PLLR1suDZ5hM3etp
         iR6S0799EkzEiQNWLhymvxVQ6EbyidHT5Ft7nSuVT+lS/T7Ldqg757vJMaAVamZQpqCG
         qucBbKYFn3AIbYPI8JFm16iHXnz/aEObeKV2db6aRXK2raJill6CHttqqyBVuXBYYpjv
         MVRC9B/+Gr2tPLLRT5T+T8UfDQ3C4jg5AS4JNiDyp0y4u4f3CDWhMCHSWfo3QtPCQC3p
         /zlBIXUi/9CPoh93pnd73Vd/d02wRy59wrptMUfWMeOS9RASfM0BBPUrYAyMPNWo/3M8
         FrJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793555212; x=1794160012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sNt1SEURO6Fp2bP+i5dHn8qQfR3UbcdxoVQanIQ8xmM=;
        b=MRZIUFvl+UpDSgEW+p8pdF8KZpuFaE94pJAST8dqDvQc+Q5JhtLxl/pbpN0VN8vwgL
         z0JB72BsZHpwj/X5++lRivzjBXQ97ZxUxAcNxZJj1sDfS0NGlVngmbSd7aTclc5YQn/v
         tVVfXEs8uda4lCWDFu4DuXX3l6bQz0QRFlNDgrSt+F/UcakUZq6+cJRXAUd7l55Mri3D
         BO8roSyxobRdp247NE0DKx3FTF7y5vC0itqQ9qIv7FAdHTEdMo9UPIN3uIU4H5/TGwbN
         bp2RaKbhcy/VJMi1NW8JI4rpfH+lFwfLUqFXDkNaBQGhRRBWSJw89eBUSoduTqMctdNo
         4EZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxmf/up/LPGnUUj///EsP/L0ef9HmbUfg5bm4MUUVCq/BICy5T7W0zbiF80hzzs1xAdpqmKnouddIq+8rw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8G2W5EdFB4G+pDzhywDxg5KFNZFVp/Kw10En0QaHuZyrNuo1/0
	C9cDhR2fmz/bndch3OpJv5qgi8rvgM3W/rjXwm7yvYUSdC0BxskTitCYp6UX4W9o5qsziNVZw67
	LOqyzQZ3Kx+zkD06gnvVn1w/+/D2JIFlws6sKXzcajqYi/0JaZXFyXV/JOgF57OfFuLg=
X-Gm-Gg: AYBFou0nTItoy/RQrtBHjCzcJg6igyN4wnqV8klCud9hP6MmdrZY9aGmRYwouJ93Gto
	zFlcMpdsQHklrlTniztdk59kbEDmEr5vEGTUwrewMwKJfwK7+VLA6rXi5Zy62c68HzN3t7iqkgI
	N0lcwgeJYN+dqboARpEIcd5WtrL+puSbYORk2gWZTq8Wcsj85P/K9TVON1xSqSD3E1BPrdvOUd+
	zx6K8yjDHTlGCOKWbuNOefALnytrgiZ54pxq3ehY45/ENE/wdOuXdbgjzWjxS45MJ/cf09i2uUa
	Oi297nZL+ZguG5Q3hmknR2ilW99Mwq0EOE7qKZTWzBuucArDXwH2DLmfrTzi3+v4XPCST5JG6Lq
	KT2//kgxa9PXxdC2XygdU73yR8gqvUaRUG/W/DluC6uQddQTJfgMRjuzA5Slfo+JD7M/Fa0WYzv
	c3OH33d7qeR3kJ6ZrKlewa0A==
X-Received: by 2002:a17:90b:1845:b0:3ab:8288:b8ce with SMTP id 98e67ed59e1d1-3ae8974d028mr3953498a91.24.1793555211576;
        Sun, 01 Nov 2026 09:46:51 -0800 (PST)
X-Received: by 2002:a17:90b:1845:b0:3ab:8288:b8ce with SMTP id 98e67ed59e1d1-3ae8974d028mr3953482a91.24.1793555211072;
        Sun, 01 Nov 2026 09:46:51 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e99b267sm15076953a91.14.2026.11.01.09.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 09:46:50 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list),
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 0/4] drm/msm: Decouple IFPC disable and sysprof
Date: Sun,  1 Nov 2026 09:46:24 -0800
Message-ID: <20261101174631.23637-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
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
X-Authority-Analysis: v=2.4 cv=O6esLx9W c=1 sm=1 tr=0 ts=6ae77b0c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=e5mUnYsNAAAA:8
 a=WAnUiRRfp7J0bigzDMEA:9 a=1OuFwYUASf3TG4hYMiVC:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: wuC_al84OhtdUicGqwsPzkIebFnA41Aq
X-Proofpoint-GUID: wuC_al84OhtdUicGqwsPzkIebFnA41Aq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA3MCBTYWx0ZWRfX68qjFEx04i7n
 4sQnyVfzbQLYoRNRED0Ljs5RKEcUSpOQuN+iat8VPqUJ8K2nDwTef4UbyvgHP0ApFyWKHLuOy0f
 6+ZXfI5j/0bVtOQk+nw1w+l10oHpU+1cLMW8Py4fDk+3Mu5EbmxibTQGXyTMbc/NqUhPs3IqPn6
 RtNPl2tOqFVCNLkycIsHFtg6nm4rhu6xAARPBt7UmKQLWkwsHQuMxv1i5GBa+V2mwWeu9QRBM5n
 X2CFsRYeqcq2kAqvlAqB3ZynT59SJcNQ3Rj7CTtBcbpXTqxz3jnEm9LZYLr6V51FrMbTR/oReNr
 0MFlnQmbQWCq3VCal+p+5kHa7AtXglqNGBonZcUyRf4GOBZLv5LeRtkDlStTyjJYrA2hzkZhmk+
 ipZvZ3lG4fa68oi0E0Mea2pciolgmOOvUDOK6LzG8Lq/i//aga9xvx9D65I9QVwlQ8SpN2fgM1O
 yVX5L2k40GQMW6//Ucw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA3MCBTYWx0ZWRfXyE7Css9Mc7zr
 azgujw8lRxsKoxZMQVNDru5WeIW4Q3Mu4t/seGNywmeyKMSWOiU8iulOWzNjJo3Tij13yU9HY9g
 sH6Rr8V1tX/si6qTh5k701iycVmvRUE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010070

Convert IFPC-disable into it's own refcnt so that multiple threads can
request IFPC to be disabled without stomping on each other.

Extracted out of gen8 GPU state capture series[1], as other than fixing
a missing IFPC disable in debugfs state capture path, it is unrelated.

[1] https://patchwork.freedesktop.org/series/176505/

Rob Clark (4):
  drm/msm: Rework IFPC disable
  drm/msm: Add cleanup help for disabling IFPC
  drm/msm/debugfs: Use cleanup.h for gpu state dump
  drm/msm: Inhibit IFPC for state snapshot

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  8 +++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 ++++-------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  2 +-
 drivers/gpu/drm/msm/msm_debugfs.c     | 31 +++++++++++----------------
 drivers/gpu/drm/msm/msm_gpu.c         |  1 +
 drivers/gpu/drm/msm/msm_gpu.h         | 30 ++++++++++++++++++++++----
 drivers/gpu/drm/msm/msm_perfcntr.c    |  7 +-----
 drivers/gpu/drm/msm/msm_submitqueue.c | 10 +++++----
 8 files changed, 56 insertions(+), 45 deletions(-)

-- 
2.56.0

