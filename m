Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFAC4FDA4E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790782023; cv=none; b=UkAM3MdlQ9lcZnIVvMYsTH+5vv4CpvW17MtX7Lw2QlZuYlKFZxyGRnMtL8UmRScoL6X4pTmzwWN5D6gxH7+1dl7UfhiyUeTdfzCNkJwCOoaWSSDel4CQ9zrmQkEPgZ2YkIoz/FWGWkjerCabMqLWktflmCnuAqK8OPhah8fiNs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790782023; c=relaxed/simple;
	bh=yCPp8YgXoeapKbNnCIZfiPYU6VDPYmYj4iyaq1RVyJs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jHrCQmWu60OfoIKtAywPXsytaVdb+Wzd8e8dmh7JU2+VMKqLm3KyofyDgiiwm91yAF+kj50Lv01wHkst8R0CtiQASee1JYJhxWgJ0W13ryE0peJ3bc/bFgd38yWfatFkhx8Xa+xvUQr2kFnsv0N+vbqct3RjQxJIqZX9K1EWmHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JGiX/Y7n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MOxA4SQm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JGiX/Y7n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MOxA4SQm"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE06Yt4178751
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:26:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Dcex1xAebPX4V0UA2DmDO6IM9OBE2nimJwk
	C2WwGyEM=; b=JGiX/Y7nw2ZjqIJRgzSr0GNYoSezaWXAwU69BVP7X/wC04Akdi3
	dCTSW/79Ka/Rtef5PRuaZq6TKJfuNTpGuPMBL8nlXchQrAJJPvilc9EQgAPIQggy
	wfmY1VexiAOZDnQVsj9e9hDz667wo8dQj9udK2ioorZwrkqxOlEI72DHvke95tMh
	6jAPl6rggSzPmnmdD0BzJ+5nrfkdmvdg0/tpGuLA/ufFMqIbRm3F8Q/MKirdUMmU
	nrahXan0w6lTLkDISLADJwtmQSkjHRVV9jsdiQdvcaiGGS/463vAUzYFugv4NMNK
	9tP7OXfllCzkdMNWFZa3cj/LRevXUqPwsUg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0nm3m5gu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:26:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-530d86d40acso119215531cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790782013; x=1791386813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dcex1xAebPX4V0UA2DmDO6IM9OBE2nimJwkC2WwGyEM=;
        b=MOxA4SQmp5WhxS7dXjPJ7fEPO3QuRrLJOve01uNxle51WjI0XTaqe7cx0D+ijz43ZA
         x7+Ob+PI20RcZ5vjCGZDgNI9YJSEBdlguyGFgJNVFc7hu5aDmEJ0XIgDQX/4hXOJ6c8d
         v6gWY2nBUVcJyyB3o+O8yFpm1sFopThRKB+9qyu964EJoUAETu1flShyZDQJXSF9u1e/
         BWBGq7OCZtmFP8m5kL0R0goAN8EFCLvFM9r8QE2KwpaKSg8Vg3svm0ennGqxiiMtNFcX
         xJ/O7qZdxaC+pcZHYsdl5h3Io/iNNcuLiAQYBERizmS4eJSC9rK3MCxzBYpeGacI9oOQ
         CNTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790782013; x=1791386813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dcex1xAebPX4V0UA2DmDO6IM9OBE2nimJwkC2WwGyEM=;
        b=hSEzNT0viCQLXOrMT9XCd/4zcyZIXDVsI93EkWMoYSbJPU59Ojfgk+dXt81orUnmzO
         7x1BLMR3kjYMlZyCAtNt4M+jmtTrljHfvDkhJJ325O8M41HoLK34Iq593MVzxHQgORxX
         5L/UTUTDotxTmXJKwPbqXRtyYW7HVnBKJ/CVu4w4d1Yyv02CVJ/CBiuhj3t2mNTcTGrc
         sw4vm/5k9qiBbuTJTsyzQSEJSvq/NB/sC6sP84Ta63ntjrforuGnQAUQtWiR4Tp4VU8K
         kdSsv/IqdijphIuNw8Pp3ep4y1/OibANh75FdmTroZj5qhhbzYMtxlrKvBggBdIUK6KI
         Mi6Q==
X-Forwarded-Encrypted: i=1; AKwUvBz+bPlzI2vFJWCBNF5nf8fIes5cb3uDGFS8L/exhqKfQ9Ptq03yqDVUqQkNUHSW7IAHUu2Dhe3vWHcJk8s=@vger.kernel.org
X-Gm-Message-State: AFuF++lEa+SNvdqjfw32F19VeQqVE+FW+r6za3mHtuIvCyxTEpxMGJQm
	RrdfSh4wK/wd9xAa5nyPVpB4SE+O7Ns4ZaYXKKVp9YzfQrqc+W+J/lB+WqaC8/Z+MVxzn9Nb7/L
	NOUpCTj2y72OgsSfZMVWh792LKXhpT7oxfDzm3QlHww8gAhSVb56qdu8Hm8izm0kcVxD6OEZKE/
	c=
X-Gm-Gg: AYBFou1w2ebq8WovxlOpes7InyQ8lMk4s03b3HGz4s12KEeia+7MCoK3VN+nWL3fCi9
	7pIwVzekpNZuCQ3JDPivSE4bboUKj0Y7QeGs0uoCcInXI3S2Xff9+9sJTF5/KMPH9WIy9TD8pqQ
	+ISTMPOe7x1TlhDurn7xfgYHH9rh6nUyucxB5NoqDynszd7z3yVlvGwToXrOOHfJ253mhjgEkUZ
	Ck7smtFO5EszWa4P+xGlpB1sKVU64r1ypfyT4fo1Xl1pmU844G8cXk6kwizJ9oROF4OmAQm6ALy
	BkpmRldruMQL31dPItMy3sTYpxNowxHdTBZz8l34rbSAYm96nl3gQeSMu3fIfqtGN/rqtNppJTD
	VUFyaXVSJvRBnSbVkfBGsOgYLXswy6EW1Lst5BQWzK+lAEUcs+4vCDPdtxAFoVTJdiIUj3ClWC+
	aBU/RMjw==
X-Received: by 2002:ac8:5946:0:b0:532:8ed7:534 with SMTP id d75a77b69052e-53374d402f4mr32587221cf.37.1790782012837;
        Wed, 30 Sep 2026 08:26:52 -0700 (PDT)
X-Received: by 2002:ac8:5946:0:b0:532:8ed7:534 with SMTP id d75a77b69052e-53374d402f4mr32586621cf.37.1790782012128;
        Wed, 30 Sep 2026 08:26:52 -0700 (PDT)
Received: from localhost (ipagstaticip-a5183818-34e1-b901-fa5c-deea35ceefd1.sdsl.bell.ca. [142.127.77.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-533824e35d3sm1719971cf.22.2026.09.30.08.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 08:26:51 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/dpu: Fix GAMMA LUT for sm8750 related DPUs
Date: Wed, 30 Sep 2026 08:26:43 -0700
Message-ID: <20260930152645.22194-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 9T9NfKKf70TYZhHGIPKwcHf9RMFwOf6j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2MSBTYWx0ZWRfXxutLqj/O2nE6
 GVRdK8DULcXpU3qM9QzUULWbZU7T3Orx/gosKIqQYP8m3wzIlvO82B+I8zVoma41E0TRvWZ8rQ4
 ef8093Hy/ugu4/NJJB1I9EkqbIKEKdO8S7sE3BAo9EZFdCUUZtUkNJnHjFXS2oK7/3157s7fnFU
 VufrwuT4lmWmfEEjaWPzSsaNWDD2Xo+zaw2mGfmoN+VzZ8wnOLBxWkUXDYAPES6eq5PSduJ0Z27
 bsRJ2PF07xauZtl1+HZKBJWEPW7AsLutxxuUoc650YjTpK0VKyCZUhjVmIN0nCfU21MVwH0sg1K
 LubFC0p8pjy7h8bh4BdjHHSY+/Dj3OqVZ1E4W3H9fZwz4wwNQ9y+/h1MQ0ELpFnRvbWHiOTvySA
 IXRtCROKGE1kf3VC8ilGzIYhLtsGA5axVcxJ4nazwdVvQRXjiGka9tDJnxqGwhXUM7KC07/Hzgy
 u16LG/iM/umVE1imz5w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2MSBTYWx0ZWRfX6hcS7fRuU9NS
 IqX/19I9K7NhmTB0sgRPcHYP2/vOqMh0bc6Svcm2DH3XoH/Uf+KF4uG9qpZRQsLCRebmpXTf+eI
 B1g4CjNqhAVLmJU+hbjzEz6PnaVk5ZA=
X-Proofpoint-GUID: 9T9NfKKf70TYZhHGIPKwcHf9RMFwOf6j
X-Authority-Analysis: v=2.4 cv=fqxJ914f c=1 sm=1 tr=0 ts=6abd2a3d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=8VafS78ZeU61HtrzG+bZhw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=ILNf-aDmxzXD4JfHqJcA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300061

Add missing GC block.  Fixes GAMMA LUT on glymur/knp/etc.

Reported-by: Connor Abbott <cwabbott0@gmail.com>
Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 9a993cdfab85..107150a8553f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -428,6 +428,8 @@ static const struct dpu_dspp_sub_blks sdm845_dspp_sblk = {
 static const struct dpu_dspp_sub_blks sm8750_dspp_sblk = {
 	.pcc = {.name = "pcc", .base = 0x1700,
 		.len = 0x90, .version = 0x60000},
+	.gc = {.name = "gc", .base = 0x17c0,
+		.len = 0x40, .version = 0x10008},
 };
 
 /*************************************************************
-- 
2.55.0

