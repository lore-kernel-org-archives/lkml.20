Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1639486406
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159209; cv=none; b=lEpzfNLLnD8hyWaXTgVE08ASYzJH046rYEqmyAnjfWECojATq4KPeuKwZ87d2faIXPEJkVKF4h2EKUAEMULmxaffIRJPdjvQUr/Z0yrhbx6QezLSQKebSNiq10pXbyvVv09fYPYR+0L2k06csD+NvrV9k/GpLBIE9caXyS0CmiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159209; c=relaxed/simple;
	bh=enyT8E+9AK26apYvWRrZ3yOlEE4CZOhJwCOlmwsJANs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EdF8nkOkgaPBiUf1xUO66b9+zuOnqDGRycse5gT05nMaTNnu+jNUXxJIJlYjQ5Qrbr9rnRmhx3J6Y0GhiYXbsfCQxDQ8AGsIXNDRM8nI7rMu7txLhTsB604UVYkSsuTPNNKEWccq62bSjrt83n5O3bN1yxhQnOb0wVGk3yf5Gm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NZgtCUu1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g3n7ndAP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NZgtCUu1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g3n7ndAP"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA3Jud3566257
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:26:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wl+seacDctymxAQmXB69/Ucgp0LZ7i+ElrITf9m6VG0=; b=NZgtCUu1PCoyQKbz
	mX3quHrDMUF3vtrKFl6d310tCNd4TZ8o73iFJEjIhySeYNaqNGK8u7mMB0rLBepd
	/1QfPuPCU2uQ8ZLGOoH4QUhQVMESPPlLp3dY3Kl10mZnMzzsR5AX3THQsqq5Ks7w
	107dqrziU6yvERsIP6qT+5C3sFGx7TGFy2/gYyIBBIE25icccrHUMXm68Zqp9Xkw
	OXOSiArSq+zLdo7u6fQoktemYO9gy7LE1qxFYxusk1rwdbBKpZ+979i8Cjffi9N+
	7MoAFP1MxyVLbeQJtVbzaVD8c4K1g93xpWbN3H5umj9e/2DWGyRfcHrs5nginM1U
	oALdyQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux7xuvj2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:26:34 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3282d5302ffso804367eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790159194; x=1790763994; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wl+seacDctymxAQmXB69/Ucgp0LZ7i+ElrITf9m6VG0=;
        b=g3n7ndAPMT0IvkGprCXPdYIZ6C8gF2d5oI7slvFe1YH9TdxQ80HubET7Ev+p+2vD1N
         9ncbgnkPW9ZCDVwuxzFbnJrIsz2XKfYN6Up7+1cVZWKXvGzew+JLwSnspLvrpWBxKuCL
         +OP2+BUgqOyed4Mvdx3pnV1yR6CaqLmMyYr9kV8BBU7kwKX9WvqmxMcJ3dPvuvGIFxyI
         sWKtMAI0fZPGSlRyl0xjjJqF1T9VPSE3ovWMBV6Yqz7G3GQavH/7SgEIKYPG4aDe3dms
         CJ1HQPBzrKzhHcXs9rAF8lBr1+P3oKbvKoswyqfG0R4K8bPnZYVTrEcbtm2uczSRY6Os
         EABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159194; x=1790763994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wl+seacDctymxAQmXB69/Ucgp0LZ7i+ElrITf9m6VG0=;
        b=d6f8nB9cOFEUFdIcffQ2abSuK1k2qzNmEUS5ev9MycgAiUPyx6f1wN3/JubZFpDSM2
         BiAwFJDpQdK+rVKLa11bAQ2AobrXpjH/GdUKIQJN9XTzIkyENq5SKyKtt2Nykhec5XTC
         NcljivXZumnPeXfIA12r1F8M5R/bSapbv91SI2pU8ckvI0i2kSftKEcN1rnJDB4Od4uR
         +CuaXA2Kyx2dNMjRIaWrns84f3fJTl8SbXDkK60GYTEawE/FsX50jZZbpGoxhcwzRsFc
         LmUzWE9ME7m39708IgqI1uSs80eVXeMe/QFRBys4Q4hQ29DRK+Gl/ZW0om/5SVr64jRW
         P7Zw==
X-Forwarded-Encrypted: i=1; AKwUvBy/NvGAYHI9NTvy7ni9uF5vSbPdCuFn0oMLbV4VlDJU15/CAcj7FKAUHVzb8JgZuuvHg79CFvSl6CSUwds=@vger.kernel.org
X-Gm-Message-State: AFuF++k/WfQ9BaWYfHT0hriEwgcRv68FzPt1iYu7hEbzZ+lecywW6bTJ
	eLxEIis1ok76NgiW3JKYcXeKQhCkJiUPdTU4Ae1o/9ICd0UcKp7hTOnpiJ7HG/37a9SKXcgV2fU
	Oa+5IU4tvr8zWayWsfT1Sq7kYuVMfLZcXui3DUdlKXHzckux6oXJ+V5qC9JzCTqnwFGs=
X-Gm-Gg: AYBFou01CyOmKNa5199LSH1c6IJuiArzpX3iIywTeggxUpSg31KfwhXIISKqdofBMnB
	YTmMeF2VyK1693WPwVfhTPLmH+H4zJm4mcQkoKYhNIf/w5Unntf1dDsHuCFeIjwT3fzwT8IImyw
	ppXS01HF5C0N6irB5xq3WFzrMCHttMJulsJWTa4qW3FafPm+6hMhqgnPs1IM3/QbrOqKNmUU6Ul
	J3FXIsAv1PFUrrqDp8RtBdfAC9nf/a6w6WUt1MlqJ1k1nmU6s8h9yXrYt9hmoxjKPWZUpOjq8Ol
	51B+5iWBKf5gDIJagf7/wh9zvli3QDSRc14zdWZpxz8sEaHXyUfjXtz9cwapyrySCW6IYC9xiA7
	KF2jvt1yn/ROCzyLQE2OelhGpqGm0miySTA==
X-Received: by 2002:a05:7022:f90b:b0:136:4bbe:9524 with SMTP id a92af1059eb24-144ef0be192mr2107184c88.10.1790159193664;
        Wed, 23 Sep 2026 03:26:33 -0700 (PDT)
X-Received: by 2002:a05:7022:f90b:b0:136:4bbe:9524 with SMTP id a92af1059eb24-144ef0be192mr2107158c88.10.1790159193036;
        Wed, 23 Sep 2026 03:26:33 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm8766646c88.13.2026.09.23.03.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:26:32 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:55:43 +0530
Subject: [PATCH 03/15] drm/msm/a6xx: Fix RPMH dependency votes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-gpu-v1-3-0c3c79a1a470@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790159163; l=1636;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=enyT8E+9AK26apYvWRrZ3yOlEE4CZOhJwCOlmwsJANs=;
 b=TM3drMHi0LUTT3rpKITA1yUMYkFSZ9baLFTe9nVutJch5tXY+aeUWa9EiMkQbSti9C6ozXpii
 JgQbn6qY5AcCZp00eIAT5DK8UQqAO2P7qIFPk3aYEhIZ26EavKJmxuP
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: izDlPs7sKjzhvpsIlVOkYujEGy7ZwfDO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX8wx6CsBUdt5D
 dcGg10JmVl40BqRI8wKhpVb47mWuy8OHmosmKQ3t86qguVNc8Xs4VUEsqfKuRHQeDQZjwzx2M+g
 dq25WDWIgrMWWarDRIZGxECOBAvXlxKQRL5qWvrSo8vgwe2Gnt1GPhKfsuvSLfYrPLbDY4cLBDc
 7Z1meIMcGJ/IHbBTj2giTUmDZsdKEePayZ/LNKAU3HSUZUl+Itq0U1Q3/XEIinQtiae2orAP+ly
 JDb7jYGNoUzyj94T/DCXfvM0nQvlcya61kjfYNpSzGPvwu7kcZl+QjXqJA61NU2sbfKFbCdDtYy
 kR7p0IfxCy2qy0ru3UO+aChj2VYiC15BeFRxH6WGjdKY5kEsJNS8uOtORnY0kWcbRGLNTNOrh5e
 9wo9syPhMKdwYorHUbvfajwSesys+GgZiv+9El1VAxiNeaTTTJa6RS+U6+72+/wpWc+ZSRj22BS
 8qtOcUNi2G7HX3n0UjQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX6Q85SxD9j4nR
 qd2eXeoKsyvoH7/chZjGbEkM9knhxjL0OqEtpqxvnnwCU2zTLF9OcUhlslTMyJVY2F9xCLUX7+i
 wDwfMvzgLPfIQyEYrX/O9W6hn8ysY0M=
X-Authority-Analysis: v=2.4 cv=QsDLTlyd c=1 sm=1 tr=0 ts=6ab3a95a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=eKBiAfeFZ4O-hnR0X2wA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: izDlPs7sKjzhvpsIlVOkYujEGy7ZwfDO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230041

a6xx_gmu_rpmh_dep_votes_init() iterates the GPU frequency list
(gmu->gpu_freqs) but was passed gmu->dev to resolve each frequency to an
arc level. This results in generation of incorrect dependency votes
table. To fix this, pass gpu->pdev->dev, which owns the GPU OPP table.

Also, reorder the dependency vote init to improve clarity.

Fixes: 06cfbca0e1c6 ("drm/msm/a6xx: Share dependency vote table with GMU")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index d072646093a1..161b360bf3eb 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1868,13 +1868,13 @@ static int a6xx_gmu_rpmh_votes_init(struct a6xx_gmu *gmu)
 	ret = a6xx_gmu_rpmh_arc_votes_init(&gpu->pdev->dev, gmu->gx_arc_votes,
 		gmu->gpu_freqs, gmu->nr_gpu_freqs, "gfx.lvl", sec_id);
 
+	ret |= a6xx_gmu_rpmh_dep_votes_init(&gpu->pdev->dev, gmu->dep_arc_votes,
+		gmu->gpu_freqs, gmu->nr_gpu_freqs);
+
 	/* Build the CX votes */
 	ret |= a6xx_gmu_rpmh_arc_votes_init(gmu->dev, gmu->cx_arc_votes,
 		gmu->gmu_freqs, gmu->nr_gmu_freqs, "cx.lvl", "mx.lvl");
 
-	ret |= a6xx_gmu_rpmh_dep_votes_init(gmu->dev, gmu->dep_arc_votes,
-		gmu->gpu_freqs, gmu->nr_gpu_freqs);
-
 	/* Build the interconnect votes */
 	if (info->bcms && gmu->nr_gpu_bws > 1)
 		ret |= a6xx_gmu_rpmh_bw_votes_init(adreno_gpu, info, gmu);

-- 
2.55.0

