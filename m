Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D2F55294F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788881073; cv=none; b=Prvt5mRRtLnHqw2zki6Y5hDOHAISVTkwKKnNT32c/DwKp6MwSqXsJ9RPB82IEWpH8D/IcN+Xe0+ZosrToKlIWvd4dT9xYINixCh/MdVQP0b2/x3Ob7fQmPP+Y5Kh27aAhCWm4EHOnxP4H9ujI/EPinFtWMw01FiCMXd7/qiw/ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788881073; c=relaxed/simple;
	bh=42MaHuKsi9wtmIKNRqT8ly0SxW0ZKEjpv2W8+Aag/4g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dXJlJ2bivkn0y/kHYFvQs3gii1CXv78koxyejT476Owb2WyhSezr90lkMe/FeXOJH1V6g1JzLfoDguUF6pLn0UOUUaUOAtRicDtGaHnPhfpt9J0g6+2T3SsTAO7uanur7ZBUEvmP3RvV1emX4U0Siqf8uKaizu9VkrFXDAHRKlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KkKrsSC7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SRtfaKLh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KkKrsSC7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SRtfaKLh"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688F1Mv22813564
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 15:24:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C08XeX2FFrQaQVRDvYflEJeFTvMG8k68onVOApp7D60=; b=KkKrsSC74ibZJDYD
	Zdbqms1mDt8QwUcTK7LbW/HWVd6kjbSXAbrG0IQR436BSN3/FpXUbczn60AZoriL
	b1K/5rx7VlxgoqFOTsLDU0ChXZY4bJrqa6HBzb8uutkyWvEhDdgojo1GNaTM08JM
	0YvXmHVudMUmeE947Wo6H5oYuEu3Px4og0uzZgr22dwcxKv1DaR9XHOUAWtBPWoC
	cXjvcklymnDBbqRlZtD/Caq4risVLl3nYnEcQihpVWp8cRN5LU7+mnyWSuxqXZoR
	XkFvpmxgqZgra0PBNBxKc9DcjyiUg17ZUUGqcbt4mCSd8O3vLLtE92piBVwiZjYy
	8aSq1Q==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcvujauf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 15:24:22 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97e8be2221eso408241241.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788881062; x=1789485862; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C08XeX2FFrQaQVRDvYflEJeFTvMG8k68onVOApp7D60=;
        b=SRtfaKLhmtPmq1YtwbnGjCGyknKkYrrsV+J6miTHmS9DIhFdVLt3z3TlBAIi+a6Px9
         UYvqixX95Dlf/WRbJIvrJTZBKoi3vlLa/0qdct/ol4N9ganz2ktPOoF2yCCHtQfTv7GQ
         H3TcOnevs3spGEZ8nwGs69IpWZrshLuGbxKgo8PkcOyC3eNoFBZPmNn9gE8oVxK1svKr
         NkD9qY5U/OyTvep8Vd2rTtidb6nhpByqi/6rlZ9cH5s/gZav9vnWA/WOYP07W5M9JwE8
         xeJ/nLX2hXyg4ItuWArr1uIfi3ZvjLUUELxVokTObY7ch8rerr+DlaBIi4WPZlw/8NcC
         f1sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788881062; x=1789485862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C08XeX2FFrQaQVRDvYflEJeFTvMG8k68onVOApp7D60=;
        b=C6Ik0L4TZUnZJkNwDkQKb6n2XE2FBsulBWOmz9gp/llvp4gPo1Sj+kghxBrDf2U4gf
         IQueYBafUpTOrZsHXnQlZog6rgXLiSCpzTubLbOOeIkqpYuA6KK7vZXNUBP51eqDJBlZ
         9C6YVGWIvrZ8ZLiuAYJeCDdJfiHz9zSefYE0O/wCVg7kBqKk7iO9xhA6NuFw6MtLtAmF
         YJe30z9iMSma7J3rbGCBj7PYuZqpISS9iCGoRzS6iO2cHyQ+RglAgeLjFMqPEzAIvH8i
         sAoJppNaZnZE69uzuTvWY2bJiMvSx6Z5B/MYy9cOCdp/ZZ97zbEFeaDjYdHLemYqSS17
         Vy1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwC09A5JPgWEGGnN9fU2KSkP+lq1M98KOK5mCNtU/SoI/05Ar67Ezulrp8wZgel7BN1I3JkIVVjTAkJ8j0=@vger.kernel.org
X-Gm-Message-State: AFuF++kobR55doMmhkfTA2QsdKZTM3X9+4voDvnmLdxqkQUiilPIZrrx
	CPo8z6ubFEi2DczY4UZM4g4jAuGIstj+C7ODcXAVtne4XdQBOoLha5vL45xzqt+h/euEM/38q1J
	Z+AlYX5cSSX/WlfbnjbMZXUyNjgeMBaqijkYp+EBepnm0pzXdFZ9KcHZX4+dpGe/cHMI=
X-Gm-Gg: AYBFou35QecvQl2FmiNKtbsh6fM4sjKns25Bk8IFolltXv9s2xtw14nTyrQqY5qIgpt
	d/FmbHFNVvNyAmb7VcbDggDx8N5QDq/zg3xhe2o2CQjCqUjdbncdsRdQ1bmH4TAs1gzuYj/veVx
	rCxlEcQ8F7xKwe90gJXZKpoB/I8KmHKjJzgcN1zhEXAT265o7khjfU7jtIqUVKa/Dxmcqqz4F07
	hUmw68S3DwMO4mCiPyzx2b6TA3YISUIq2X+cR7D1b+rJ0cnPjE0CvHVjFbFYTM8V1RXxRsJlmgt
	tlhaUK3/ta6h3Q0gYrRQzq83l451FVvLlkPjqQYlIl2iAJaldPQ3/wxL3/ysyfwuFW3VQ8Kaglp
	g3vr0DWJTX06GUOEqqzxY/FMyjWrSN15Mxqev2oN7K4mylkDq+BTL3YTdHaS34abemrJUmBdr9q
	GfoEBuXcv0Dmsz
X-Received: by 2002:a05:6123:2c8:b0:5bf:b3a0:388c with SMTP id 71dfb90a1353d-5c7ed3e2247mr14515453e0c.6.1788881061584;
        Tue, 08 Sep 2026 08:24:21 -0700 (PDT)
X-Received: by 2002:a05:6123:2c8:b0:5bf:b3a0:388c with SMTP id 71dfb90a1353d-5c7ed3e2247mr14515383e0c.6.1788881061155;
        Tue, 08 Sep 2026 08:24:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166fe10asm3103722e87.47.2026.09.08.08.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:24:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 18:24:12 +0300
Subject: [PATCH v2 4/6] drm/msm/dpu: clear the DSPP pointer when no DSPP is
 assigned
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-fd-kms-fix-smmu-v2-4-9391815742a8@oss.qualcomm.com>
References: <20260908-fd-kms-fix-smmu-v2-0-9391815742a8@oss.qualcomm.com>
In-Reply-To: <20260908-fd-kms-fix-smmu-v2-0-9391815742a8@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1311;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=42MaHuKsi9wtmIKNRqT8ly0SxW0ZKEjpv2W8+Aag/4g=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqoCibn5CUU1Ow04wahu5gHr1DsZo3/NR0N0Sk5
 VTpdsBaCiGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaqAomwAKCRCLPIo+Aiko
 1SVpB/9TAbiVdOnVqlVcKQe9lSIHzoBI24yUs+bAbtDG/7ykrOpriV2KajAJoLP6qwVWWvpalRN
 4BDCR+RWlsIpVeI86l0gZXLvxGTup2h7s9cpfXxWEQJajchJBKqk+BxFyQ1Sln+EAMkzf+wrtLp
 bR6D+maCB7fK3dpKDJtZmScyU0Ie45lyroyFf+3JKl4lD8azVjcbBCMn7hgw6JjwNey1beIWiW3
 p0Hg70PGoO1OjBYlCMuNHwye9JB6KnYoP2CNr4xf2Pfv21aCtGfR6bnrzyfpNwV0bOWj4H3ITyQ
 bFyyELqliUK4rJc5hKj6JVe5+RVItSBLAkriAWWIfHJUOww4
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=ePkjSnp1 c=1 sm=1 tr=0 ts=6aa028a6 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=jpbDcG_WXHA3xrgMYRUA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: AalqBaeOWV739HYDVDFDRpFD7EHAJpXx
X-Proofpoint-ORIG-GUID: AalqBaeOWV739HYDVDFDRpFD7EHAJpXx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2NiBTYWx0ZWRfX/UZr4OgDY3iC
 gxwEH4jID78C8F22HHFmhYcuCdkHbQS1m+KbDv1ekMqM+7N+wsmPPIBXeSN/VJd5lCAJBqjbkdC
 PVfc30yhgWHV2Rv+F33fDh4Xk9kyvx7fudMntJ1KdwEVcft4rFcgW9kDbN2sW9U0xy8lFhB6A/i
 cTuC3O5ZAgaPk0/GjsA2jTZ2+Qo7AEpHD26s47LXNWHJSX8jRHQhB5mc8LgrtvpfI1e1P9pFl/h
 nDFBzy0YJqW25u5YZ1pKWAu4lVbQor5YlWmImmVkibijoaJPf1Db44vJmDLUxXPNIPMax7k8x6e
 sRJg2CATwGwMKczg8AmhlXrkJO6Z2K6nLvlTs9nEMaP9MKMx8HTr/Uo2yjKPJYvPOvNfk17JWF7
 MSqZtFhaWjiWQJNzZbtXOhSlnjUtztAg7VarbqC7URsIgydlrlT17Hq3WzvD8hlqJLxYX2kBJ00
 CaWr6rusdZnGhOwHFwA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2NiBTYWx0ZWRfX/mYKa9XKPexh
 rGufsgJdbCu6KuWfxsoTna78eCSz3+P+NCSFNfqnTwGMUje50Exi4ju32gj56BoBezdmX7OKiQi
 4y7Og80+kGpcwAHmMaPCpaO3xxQ13wQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080166

dpu_crtc_assign_resources() only stores mixers[i].hw_dspp when the new
topology has a DSPP for that mixer, and dpu_crtc_duplicate_state() copies
the state with kmemdup(), so a crtc which once used a DSPP keeps a pointer
to it for the rest of its life -- across reservations which no longer own
that block.

Assign NULL when there is no DSPP for the mixer.

Fixes: 4259ff7ae509 ("drm/msm/dpu: add support for pcc color block in dpu driver")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index bf593020e8e4..5dc0c9aeaa5d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1480,8 +1480,8 @@ static int dpu_crtc_assign_resources(struct drm_crtc *crtc,
 
 		cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
 		cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
-		if (i < num_dspp)
-			cstate->mixers[i].hw_dspp = to_dpu_hw_dspp(hw_dspp[i]);
+		cstate->mixers[i].hw_dspp = i < num_dspp ?
+			to_dpu_hw_dspp(hw_dspp[i]) : NULL;
 	}
 
 	cstate->num_mixers = num_lm;

-- 
2.47.3

