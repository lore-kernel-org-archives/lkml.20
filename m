Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603CD483BDA
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159199; cv=none; b=G2DJmGvbJCPTRBnRbPr/jMz/IBfH2fEirI6+Q80Q50O+mDMJrZckTxkmr1GNSXLgUHTtTies/HU7Gmg2ru0bGIkroPRnhGajkNqnVnkN4jGX9W1UzkP4Uwz+PNGZUMjKJfAU0nwUMVKL7beZoNrT8c8KK6CFZr8af2QNd+iTf5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159199; c=relaxed/simple;
	bh=AdlzOXzfWps8eRCoOYaMQ/l7uvyFxG2Tx0xeFEPHfFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uV4Li2MuZ8qu1IK6DNZt4AZSCpka4P6bhL9ymrU24UWn7jN4JSTZH0B6erCy9/dmyGLxJ+6AzsxRxrx0gfdYap8SnGCYTJR/VdL521AJ0yE4n2fqv58c5cV6CSsVNngpUUAFtDj1jEc18CS/Sm7icn+778uvrdeLDDYTv2hO+fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kTqYTwaa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ISUa6Orr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kTqYTwaa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ISUa6Orr"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA32Je4088538
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:26:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KfXoc3zywC545EGvmiJ11HJfhJTtfASiASk8KbvKnIo=; b=kTqYTwaaHvHCRQGt
	/fmGtTwhbXNV+ma7qkgkx0tfxmSralV3ZhoUyjoYLbKk1ub1yxXo7tWg6ucGSJKA
	+a4gYNA1BypvYQFNdICyF8fTq0LwpkVFu3xUAbwvWJnG35Bki1rmekr4K5wr1aBZ
	GSjzIzgn2aPmWrbgXrHg7bYelhUYfbRJ9N4seJUXBxbqto8YQylMRVtjpJ1k4KjD
	vHaKYfez46ydfjUkAN9UucRPAREKK/dmZh46M+KI6P7aUwF0qxzECL5cgN3UFe6B
	s9Ve7ciYFCN+eYr6MUXIH+5LJGpER59vGjZCBQAuYqCt6yK9kNH1Nu56Ml5W/12v
	ArrS7g==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8c3ve8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:26:27 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-143580417b3so2703023c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790159186; x=1790763986; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KfXoc3zywC545EGvmiJ11HJfhJTtfASiASk8KbvKnIo=;
        b=ISUa6OrrY/0RtCWmtKRaKCw5iRrdQrl6eo4yjD1n+wS/gVVucKBzcaHlqB0z3NiaEJ
         bTdFceBW+wk6JbFeBAkulP9SoJajDx5M01mkyayUBVLJ+n8LBE6Xu8XrmcgRa6QuSu+n
         VBt64WP7u4wNNbj2E0Xr5L+9DOsnFBgnckxBP70TEdReWDChtiOYVgLMDcnkSF9JD2r5
         nmJIaoxXc5qRvO5I+EptDrDvpXfIk7dOuTDYkl13uMSocrAcdfAbW2r2YJXuhhM2Ak8X
         zs63F8/LAha+EUykenGhcgvQruxc09lteSpkJToQxPIDOAqHtwogBn1kGYHWm9zBuYMg
         d+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159186; x=1790763986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KfXoc3zywC545EGvmiJ11HJfhJTtfASiASk8KbvKnIo=;
        b=vkvNjRo6BTTBUUkSGUs8Cm01iskvrKtzISaA6300hyFwNGbJGTQL8+O/OXPZLhbCyU
         gE9q3zi/7st2mauG1gKlOCNs3QSu2eGuqy3OepP8txlcMfU0K17oBOoqBfNjg6EVEMkb
         zzaG2p8AzPAcm5odKGiapdfHKhnE4KPeH7z4TZ95SWCQqKQYdSH8mmC3HCnGAGPsxteL
         a4jkvO3lgPAZQxxWNKabjtyiadsSt4S670t5LXwzOScVILiSp5gQYIKyp+F8JvVJpIQD
         ivA0ODT3X637Nd2YN1Ty/9Oc6QDcTV7mc4Jn5D/Bkr4pNFcZq4LDoNvmJ+p/F/ynAKWN
         eBrQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMxVfSv8lQ/i2M6h8qfooX2M0dpozQvRXG3x2ZU73r9eyuHJ/FcI5CMFRFw+nm+PA1V5UbrFE1uwJH4xs=@vger.kernel.org
X-Gm-Message-State: AFuF++lau9qt5rxXGSM0wx3IAAWPm8zYjHzIFpRn0fOFPXheDtbED+C1
	P7JdX0dS0cYC0l+biSrDVQNfUZ40+4B620Ka8/1rRVJZQnEoQDpu0lIezuclUYtaJP2+dON4Hpl
	Cfb5bhwHlxfkwcynpx3o/i0HQvCgTF8akvm0MDTA9EvF3T485K5p55gNXe1mU9GlUSGE=
X-Gm-Gg: AYBFou08nwXQhsurQfJ8HgsfSpC9YgZtMqlIkgN76uHKCzba3XA9lbEMvwR9caJz3+b
	XOiMmMK/AUAABVCU+ko2cVntuBy6j3GXdchavfuL08JSDxgMjA4/xtKMOsXusnPWoNMfLDd911e
	k1jhc2avX21mDracLEoImYUmyq3ajFCT8BNaAkrYmRmjfpyHmO+GO6idZbqplmgvfiDM4+HSnE/
	HkHdj2kwpVheOVP18xd7R5zDkhTXYM+ruw8Met1f7AL8NVvK4iq2e0HjPoVbnbLkl8xeH6Kw/qj
	Ro/YkvealBrZ/+V/2Wh/or/PsjcvkcBV0jbftTCq32zzLQ3SaIrZxlSDQshyXD3FavCSbASFFR6
	YGjJ1r2O3awh8oH0ILyJdWtE=
X-Received: by 2002:a05:7022:7f0b:b0:13f:c02f:60b8 with SMTP id a92af1059eb24-144f9166ab0mr2194582c88.6.1790159186361;
        Wed, 23 Sep 2026 03:26:26 -0700 (PDT)
X-Received: by 2002:a05:7022:7f0b:b0:13f:c02f:60b8 with SMTP id a92af1059eb24-144f9166ab0mr2194543c88.6.1790159185820;
        Wed, 23 Sep 2026 03:26:25 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm8766646c88.13.2026.09.23.03.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:26:25 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:55:42 +0530
Subject: [PATCH 02/15] drm/msm/a6xx: Fix secondary rail vote in ARC votes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-gpu-v1-2-0c3c79a1a470@oss.qualcomm.com>
References: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790159163; l=1328;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=AdlzOXzfWps8eRCoOYaMQ/l7uvyFxG2Tx0xeFEPHfFk=;
 b=693AYB6XLlB5c/XlIXQsn4I8z1hx/Fde8dopx5AR6kyh+CLc53YeZ4IOWJhVIw1DcpU8qUYVE
 VpO0wOoGjt+BExCh+kqDZEZMmMlzfiDkfjAEPFo1zjUt/+GtZvBjL6Y
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX0aMT8uNnzstj
 MUCHpQ61IBFL7J+z2uM3/96VuCvFfxjhMEpOOSF8f6QoaADnIs7k9nkYUOMU6DFn4dAHl1i6+w+
 g6TR1/U325QhwfE70r+0X9vrxmAYsAihgd7DU2nrRYJ09AkwwqdtV3OxpjdDGE7OuqcmiRXH0cS
 ZfH72aYxhmUnBKm0C/LKkTMl5atUTa4KVst5BLTy7k2OHb5VhfTTLCGnXOnInAM4jWWfjh51FIe
 pjOlAAFtI5gOUJv1mu/hnBZVNnywGjOrT4ZXCplOYVzN+XSnJvtejPXSL0giOOLGnAWhf8kqFkH
 nbUD5MLFnPYIzHskTWbZBX3LAJWLlDginxLUVfkOx0RoW1lGPSVuRBa5thw2Oi10fnRL/3XiCje
 57XefM9mlwSGlZdLNM1VZ8ouJ+NtpOHqwWncbMCgUC+XjMHCmVaKfH1yk6wbsHUNh36J4mKtkRX
 EsNZmAbJ4Ywd7EVwBnQ==
X-Authority-Analysis: v=2.4 cv=P9evFSAu c=1 sm=1 tr=0 ts=6ab3a953 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=vapu2bkIsq-odsm9enMA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: Mv8PJDKD3OEivfJ2fbob16U_69IH_ry0
X-Proofpoint-GUID: Mv8PJDKD3OEivfJ2fbob16U_69IH_ry0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX0vGe388ieOHW
 4Mi9YCwebjQ7YV1MupHJtLqOeP9nzAFrf0/ZPZ8ITU3H/FujrbpuDouHUo5qUsq5FLBDrGnDnbd
 uYe9r56yvqMVta/b8FRRRmUwS2nTWJg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230041

Using the requested level can pick a secondary corner lower than the one
required to support the chosen primary corner, under-voting the
dependent rail. To fix this, match against the selected primary voltage
instead.

Fixes: 4b565ca5a2cb ("drm/msm: Add A6XX device support")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index baf77a620572..d072646093a1 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1765,10 +1765,14 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
 		/*
 		 * Look for a level in in the secondary list that matches. If
 		 * nothing fits, use the maximum non zero vote
+		 *
+		 * The secondary rail depends on the primary rail, so match it
+		 * against the quantized primary voltage (which is >= the
+		 * requested level), not the requested level itself.
 		 */
 
 		for (j = 0; j < sec_count; j++) {
-			if (sec[j] >= level) {
+			if (sec[j] >= pri[pindex]) {
 				sindex = j;
 				break;
 			} else if (sec[j]) {

-- 
2.55.0

