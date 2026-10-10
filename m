Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED7B382F07
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 15:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791646897; cv=none; b=NJERkUkC0aTbDSGh+Hp7+cCrwoYk+bVMcDojl2YAJN8Q8QO+y9zxa4EY92+rLFUVaOkzxZ2arBh5JI+Od6YohlqAySO6Tr6OiEp0iQ6sca+R2yS5dX1KoJve2GCuVeAb9f5WkhzCJBuhJiCRfaxhg3PZMOX5zNIloEHUKX5ifbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791646897; c=relaxed/simple;
	bh=13qglxboRHegNYKH79xKwDh1XroMBMiy9etfW3KbYcs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pj7vKQYOyS7jbVeYz4JdIYH/jsfPH4FaCdWweZKyyIT91Oq9Iuia+ko9eMtYqBPk8Et86JXgKoxpBhgU7mrvIh5AK45pKcJBsQD5ceCANl+yjysKgepw1f+SgPcXGPD/UjavC+ogfP5DU5rP3/2qHVRv+PZJDzWHuva++MDM5Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p8lspO1z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PKSatsXp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p8lspO1z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PKSatsXp"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69AFPn7U957908
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 15:41:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zJJw/DI8ngRKeXSlMVGBqvE60gQxz1Wxbry
	XJfp539c=; b=p8lspO1z0v/qQxdHH0G4yGU6jeK8eCjQU3rIWmeg06WK4kKC6UV
	iqPuAh7EtS6NGaPGyuUYbwUcWqw4dWc6nUFcy6ky1LeMFAQSScXvl1G2oyNJTJVH
	ygourMayIenfSF3ISQBU+JkpdjoG1U7kRx1E53E+fx7BikQNMsennnnX0VMv7rm3
	D8CJQ+hf8UHVLDMPQ4QSwbMiPSHq6sne/v7Gygl1sEkOvBB0XydwaYGy5si5EnwL
	XnTKwwbX5T2Zog+49F/ay7VlulkCVb3QQnRONcg/j1aybinCiYT9vHIOAcEJy2qH
	dJXu1KQopugUGV9rwzUQxLSYGfLXonO2c2w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7deuha3e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 15:41:34 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ab27eb38d6so565223a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 08:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791646894; x=1792251694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zJJw/DI8ngRKeXSlMVGBqvE60gQxz1WxbryXJfp539c=;
        b=PKSatsXpyxD5u5Ry86qjBVQm1MXsbuTh8D8mtWhNcP9oBTFeYNXHCFM35RlRMRBQJZ
         eTsGuUy4T0w/Y491AId4/KQSxaT5CQSm4Pp9Ln4ahuZ4Mvuq52ynZ3vcSj01V5TxH/dw
         QxvgDh1YjFD2DIxkN/L4L41kQhOSCZ4D4tebTgg8olvKME8igraoVzNFz0YG6VjBXpIU
         x1GJ3ZVuRb2oZWf6yof2jvjt+irlzJfb99UlfHPq9q0BXKyRrRBlCwcb/1YADzxxu3wo
         BmXqZTaC5jl0YyqnuzyMytRyKCwR9uWgydOyTlLRqaP33QZ6/WuVGK7N+Gz7hGS2CuhI
         RsGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791646894; x=1792251694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zJJw/DI8ngRKeXSlMVGBqvE60gQxz1WxbryXJfp539c=;
        b=XfQqMTuee7svshYP7c5x32TKxivVbVJ79GaHIP5HsMFspQSPCqZ7Fql6kXNQPdPNyw
         5FW8S4cUhTsVkyMl5LpSfUvQqUgbaxWGN8hdXSajEpXvyaQSSZMoGkM/MlBvfle4vJLL
         d+3BnGIhHRXcIvl7rGXsWHhA7HcWshcCWYGZ2yimpMcR4sSmejqcsVbqctU+a/8HKbAw
         mWhBi7CTlkA6O//lnr03WfL8qWBJP4jMMw1tjuVbzI30ijhVKb1y1F3DYZDFTHhCeHv9
         Y5isUn75pmhVjJRt5aWro8Ar4EGTEeb51ORqBy6m0DSrzzVzPf1bO5asj4rMvRo2knll
         nRkg==
X-Forwarded-Encrypted: i=1; AKwUvBzCTYHJbj91PHpqcv6qhlmWs3ozhxFsUum1FAOVY+LVycoznWQabxQqfo226MchPfq7bt978OyztfHvBiM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfmNkOHMqmSvSwUHfn1Fnefm+TdQhZ/5AkHA0B8So5xXSIvb9X
	rZ4CixbgHaV/a54XIrXROGIhMqszfmDOhv9on35PgEjbCabrn0WBenWw1jgpIEjuuHVAc2My+JN
	mCj3fk1tovk25u31BePqAd42Z0qatR6JIEYJTQDMBt9981yoJOyp9243aYvGusUHM6SmMfSP8Sz
	U=
X-Gm-Gg: AYBFou1Bnuwjyy1j6hB2RZQij6rOzAU4eso5AMzBNCs2X8G6TrGGB6S/dt22FhVVK5Y
	4CdkmhaJgE6RIIHcDRJvVpY5x6mo/vlsixhkAeivZlJoVMMTYtZ0wS3TYlL98da9UiwR1Yz5g4u
	ZtwZT0CIVLLB0ienCRRoLUvQUNV8bpTBLr/iUdasPUhJb6I9FkFk8/HO9n9/kbeg0Kb3otKXRzZ
	SeITmpkDT1RTVLYWsnSo0we6wnLxl9K/JQPG8LuYkejQDEqixHkIQHLVsZv5KUZcFT3sXN8OebO
	VKMbbeMMU9Euv7IuRxJUzMHP/+Oiztpy4elHCMp6xZ6IpZwnmerNA855VPsBDv6bxSxtm/c5TfZ
	/XsF8uxcceEUDgtEVq57wzhJYI4sVfqYu4UB+SnvweeXi8qNCxg==
X-Received: by 2002:a17:90a:c10e:b0:3ab:2d17:51c8 with SMTP id 98e67ed59e1d1-3ab3a29028cmr4380606a91.8.1791646893822;
        Sat, 10 Oct 2026 08:41:33 -0700 (PDT)
X-Received: by 2002:a17:90a:c10e:b0:3ab:2d17:51c8 with SMTP id 98e67ed59e1d1-3ab3a29028cmr4380575a91.8.1791646893212;
        Sat, 10 Oct 2026 08:41:33 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f2f866sm11038550a91.10.2026.10.10.08.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 08:41:32 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list),
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v2 0/2] drm/msm: Split a6xx/a7xx/a8xx device tables
Date: Sat, 10 Oct 2026 08:41:18 -0700
Message-ID: <20261010154125.726149-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Y-9q8vrhLKOTMtFUgSR1ZwmUEppukh-w
X-Authority-Analysis: v=2.4 cv=Aud7T+9P c=1 sm=1 tr=0 ts=6aca5cae cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=sLlx88fqiuOlAInOgu0A:9 a=zZCYzV9kfG8A:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDA2MiBTYWx0ZWRfXzKOam0+RGn8f
 wFpSLvm9CntUrdkF7CqjEo2nQ5CYT5VktATJsJ8wcDMIa3p/7FNToFpAaW6ccHHKL8EZv8i+fMB
 fodqGNFwnLzJORN3Y410fVe55QppENs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDA2MiBTYWx0ZWRfX2uFR5wPGwkCR
 DY76UWvyVZK5v2gv0N6FlDjpb12TulimNthjHpMZBP/MqCbOJzP6b8xAINprwOmUAu1Z+/mAxZQ
 HmuydT+yAlylIMJ5harfp5el2b39ysAX/aYD3VEWKFNt5/JD3RH7LijNRV71HQE2RVlkHnt5dVn
 stmfkcUIktrEb2uMvWbMMtEHR6+bk1m2QsPaVfuvC3nhE+2Cps8al6of1Ojm01GJleVamnX8qmW
 Nz1BpIpXnKJXXLOu2FxIEx8T/Dro21XHEmqpCxD9TR15ISS867Or3V36AVrE4Lu3w8UG46iE8Ef
 8mHTB4jEIsYO0sVJx2SHR56217yYmdKd4kjGFAt49V7qx6/pQTDSp0BuEcnhSLBPV0WW3vHUzpr
 3BibtlgKFjE6NqwGaclORXsbFd73t6TSUxfEpAxfHcMQhdGzkzD7lPY5j83tG8DzzYT/ur52YIX
 KQF7AZMjxik09dlBJyw==
X-Proofpoint-ORIG-GUID: Y-9q8vrhLKOTMtFUgSR1ZwmUEppukh-w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100062

Prep work for a8xx GPU snapshot and related changes.

v2:
- Duplicate a640_gbif reglist to avoid sneaky extern
- Link to v1: https://lore.kernel.org/all/20261009131927.551319-1-robin.clark@oss.qualcomm.com/

Rob Clark (2):
  drm/msm/a6xx: Move a702/a704 to a6xx list
  drm/msm/a6xx: Split out a7xx/a8xx device tables

 drivers/gpu/drm/msm/Makefile              |    2 +
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 2432 +--------------------
 drivers/gpu/drm/msm/adreno/a7xx_catalog.c |  502 +++++
 drivers/gpu/drm/msm/adreno/a8xx_catalog.c | 1846 ++++++++++++++++
 4 files changed, 2411 insertions(+), 2371 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/adreno/a7xx_catalog.c
 create mode 100644 drivers/gpu/drm/msm/adreno/a8xx_catalog.c

-- 
2.55.0

