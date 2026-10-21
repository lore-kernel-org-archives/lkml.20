Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792615966;
	b=sWHKv7ksb88W9dbdfHNBsnTZlo81OPQ7zF+vtIrNmYvnUPHE1i0Zc1rcCskFwZ771Pn1
	 8DluNVUvCMx9yOUmlpFpPp3ic+kR4KbpLRlPrKjdF96Xdc17an4HXZ6en6Zl4Ozf2BqPE
	 WRD3AYH2jNT7JLTR8qEPiS9pgy7MoYsZabGKlOvvN2VxzJEmGYdAOgV+tMQSAzkw+TSsG
	 RzjWUTfJ/FKmaEVRosICNo1EdSuGyhIwkfxZBYlYKmFOhuygqqoQ4qFveOo4Kr6tMPi4i
	 gtFD9kKIlHJXTaUU+yaPvfpw9v8wuruckmxL3Jo0UI89xMBfVLHTIvSGd6ICW+Ipqsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792615966;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Jo2sX9VXnBmxIbRFzoUIj/cFn9yYdevX1yQtu2aR0ms=;
	b=5VGK8VTkf42KVB+eO9Kj4fWpqYwfbI1bCtnS1lb9kG+A7909XhxSHC3ilIDmy7F9hXEi
	 RRprTrrf2EXIQPNpN5Miqi4MwoD2vo/9Z3FXZWjrslPsm7oAiqTXt5t9ZavGOvL7nz+Aa
	 4Y01Zk69VaDMSyKnn5APVpifOq4RbmffTxy5t1UfF6AhFQW+X1NMLrKje2CwTsjrlmoHg
	 +QgkafSQBHOngvEbkimBPu4KaUQ94INVIQgJOtQsWv0p4jPtrK5pO4ZU/z1ZxIXl9rPrr
	 5SbvzI3R4GGhSmZ2Ip3MmmEpXlKQ4h3+QeAJqmUUt10WjbYFWQ6+Uxu0YE9fA1FMZ0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KomGYbzb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i1A7Nrli;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BCB606A33B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:52:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64BCB606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KomGYbzb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i1A7Nrli
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LKhnox2243687
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:52:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Jo2sX9VXnBm
	xIbRFzoUIj/cFn9yYdevX1yQtu2aR0ms=; b=KomGYbzb3jXoGHSGWEuHqRomgpd
	NampVVt4ix6+D6ZppcScq7msdaj2lBWsMeOcy/NLdI/X+F0rbHKHkMPpvICyjqx6
	5i82WPVqVzcYBesDi45N67vPlR4O3lMHCKpGkgRNdcgoPNabdKxLLxD58Tp5rBNK
	6xFzMaMpFRnrdK2EyVYq3DOTSY2v9mgsiAyvR0OeYC4Pcw+d9W44c2wa/9sf8iIY
	gpXT0Y0tcUihMCHVuVQDNgpc5nekpzf53YuMX8JsRMASz5uRrpbZCp8pmyFo8LNB
	d/NNhl9vE8REIXA1HjEYPrPnKqEqBnABDY3u6mTNqWWY7dLnUAcsxdDhLJA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf0v89074-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:52:45 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-89e6ddd4554so834912b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792615964; x=1793220764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jo2sX9VXnBmxIbRFzoUIj/cFn9yYdevX1yQtu2aR0ms=;
        b=i1A7Nrlixo99z6JJu2MRJTdlqG60jFV6f8oc07XRatIKeqYbDW3go/0XwVQiqBgEti
         KHmU3BoqK0BYwD4ZbBzdldI6hapQw6ulj6ncowp977NXXTe2hZt1vZf0RD095pOH4Zsb
         8DqeSQX9jerf0vGTewof8Q61+QIQ2+PMtJuyaRaxl2kf0a2a8XbMfDfD+iASqhXOA45A
         6H9J0pnlCsfFylFd8R/nQ3/Jx5q+h/Dt7HwkSBqmDANQ0x+VJNa2gpTAaycAsy6/K9hd
         3QBH1+5Ond/q+4pywxSp7LasH8t/yy2KcWvrqFBRXfro4A60LnfkKKZAyBR6INLVg+vV
         6RHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792615964; x=1793220764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jo2sX9VXnBmxIbRFzoUIj/cFn9yYdevX1yQtu2aR0ms=;
        b=Q1DGiQ2Nlw432qagH324MlxXZ7thn7WXiu7XijybHEmslK8r+shkPUvN+AQwtPl5RA
         9WsE0IqzC5zRoMbdUYzQrXahjzdF3Q8LrH6pF9OLFRiF7z1A0SxHYEvEmGKxGthJHYS3
         nJQZanBwA9paeb1B+GMJ60uiehudTYp8ex1PZiXKlkTufSA78xZxDVzD1oOrC05YP4GZ
         Fx6Ns6NsWVNNNirwqAV/8S18Xp/51Brb1Wk2A5w5553SFN6XjHQ+ARDUkcm35Pn8lzpH
         Kued1XoE0c0VO2A+Si38E2ow0Yfb9LYN9uVUSi+YC7EBt5hHdM8xpcWw599cVonHBHfd
         zPsg==
X-Forwarded-Encrypted: i=1; AKwUvByxGo1bdPdVxqwdIanUM4Tn6IeZn0PcP1iG174FgdnIJu6ZbgRIdWn9BCvxJadenOwEcNpy85E10gGj0Ug=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHnQBMLefmeuT8bFYPfZLD1ROcp72NSSHQ6B7xUGu09ZoGazNl
	XHkVgYDoj2J/77fSMeTNXn50Z6m4wJBm0yKQYdK/qAWMEsFtb/Krg1MV16LBDpOIXkRsxNg3yX/
	Q30auhIGl92Or72T0H9WFSAludEoUdC44wURnWXHmVmBm1D7x8Laj9+IspIabgrtrRqc=
X-Gm-Gg: AYBFou3YLa6DRbbUKa0/lk7oiXjQIkrGg9bgjw2XR2dshcipfAysACe/ATQJ21SXbDP
	V1NAw5aC9ye18bSzBwkRh4LJyyZ4YU1hRZyYOlSgYwVeH/34J0OYh8ZRW8ckI9DQmRQpUdqBy+U
	nnNm//8lXeQZqD1uWpkTGzdy4pz4OJmBFMlW0ght0OmyVxy8+FPX2kHmiba09DMxvm09xjviZk3
	FPv5zoXm4QgysdQlwDKD2M+mgIIipV/CDmgk/1w2jh2wgyBzQ2Co8WYMNIyfmHFGZBM5GE2u8zE
	dWwgd52SlDi22WaZmg4ksMS7xUyaI0A9bpAQHc9hvwQ1BwYx12rQ9hXqfG7XripAgTOWmjYx3JN
	q0ukBe4iWSuxcxVfddankxNnzAPb/wT6J8jZ/G5t9HLLbAas29g==
X-Received: by 2002:a05:6a00:6088:b0:886:5938:cdd4 with SMTP id d2e1a72fcca58-8a089cdffccmr2433979b3a.19.1792615964327;
        Wed, 21 Oct 2026 13:52:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:6088:b0:886:5938:cdd4 with SMTP id d2e1a72fcca58-8a089cdffccmr2433953b3a.19.1792615963890;
        Wed, 21 Oct 2026 13:52:43 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895db551sm1362064b3a.34.2026.10.21.13.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 13:52:43 -0700 (PDT)
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
Subject: [PATCH v2 05/14] drm/msm/a8xx: Add missing a850 ifpc reglist entries
Date: Wed, 21 Oct 2026 13:41:30 -0700
Message-ID: <20261021204244.67160-6-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021204244.67160-1-robin.clark@oss.qualcomm.com>
References: <20261021204244.67160-1-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=C9Z8WgP+ c=1 sm=1 tr=0 ts=6ad9261d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=h-8skOKhzxl6Lr9m04UA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA4MyBTYWx0ZWRfX5rGDsKZYVs1m
 DtPkf1d/lJS7JikXFEUvZVzc66q5kPSgh/+ewwkQQ4AJGvrOZewWrlQMYXtuDwfA4o7HFQ1ZV05
 9KDmJjvtkl6883I9yQsWfX/LbIwMfv4=
X-Proofpoint-GUID: P_AEpHnuQhfvFcxYkNcJ50V0sIjhJiAn
X-Proofpoint-ORIG-GUID: P_AEpHnuQhfvFcxYkNcJ50V0sIjhJiAn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA4MyBTYWx0ZWRfX3DX/tQSmA1NC
 VgT+ph0JEbG6ql3einVmGD5ji9UAvWAhY7XzbODmtSqoimxbpinVYKm2zzmfQ16YMA3pgw/g+z2
 oJPFeiYNiZqy573qghcR1kzM8eiIkFxTpPTT0zEteF9Plr6kO6s/mYYXXr/KOj69FD/cMJDDKWq
 yBjtsA2K0bQrwGUYVmeqROx5s/iHaNlyOUhPJBQx/s3QD1wwYMPgG/mQMhnBlhr+JRpRve8tJeb
 iM6YNbAWf0ohhJCZNWuGpGfosgQwdfJ4+v9sXcleeY1Ef8FkrJtJSzV96kr8H6eujKIg5j5nTFr
 f+oaFawhsyso5gnCXRbUSD00/19xggVOAMeqwL4XmQCR4qwIrq20oFtcYx0yD23v4K6z8gwk+Wu
 IKzG0hyBcA1aJydNuOxNS2lvuPVR58SX/X/vnRaLFWkCxe8OpbmRjyFwkSA2a+avJKG38CAW26r
 QDmoammkWSD2kHG9NQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210083

We want to save/restore all of the CP_PROTECT regs across IFPC.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_catalog.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
index 55a805ab438c..45cd986ad4b5 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
@@ -1477,6 +1477,13 @@ static const u32 a850_ifpc_reglist_regs[] = {
 	REG_A8XX_CP_PROTECT_GLOBAL(53),
 	REG_A8XX_CP_PROTECT_GLOBAL(54),
 	REG_A8XX_CP_PROTECT_GLOBAL(55),
+	REG_A8XX_CP_PROTECT_GLOBAL(56),
+	REG_A8XX_CP_PROTECT_GLOBAL(57),
+	REG_A8XX_CP_PROTECT_GLOBAL(58),
+	REG_A8XX_CP_PROTECT_GLOBAL(59),
+	REG_A8XX_CP_PROTECT_GLOBAL(60),
+	REG_A8XX_CP_PROTECT_GLOBAL(61),
+	REG_A8XX_CP_PROTECT_GLOBAL(62),
 	REG_A8XX_CP_PROTECT_GLOBAL(63),
 };
 DECLARE_ADRENO_REGLIST_LIST(a850_ifpc_reglist);
-- 
2.56.0

