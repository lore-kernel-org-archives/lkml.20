Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDFE36A01A
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790351912; cv=none; b=b3V2o9eP0f0s5DNBaRbeo+OUBn/OskWkIGvGN6KoPsS6MairUhRMxqJNRiizO/4vqkaxjjiUO3Xj0ZYueD3yGjy7jtKvd3jFyGIa1d+UUYjJCYG73ssW5oEqEqxQyASKhe4TOyfurrChdGRxkks9KsaRt0p23wb8+lYCLzK1vFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790351912; c=relaxed/simple;
	bh=GEWW6s2e1tbVayHxcvCEMGBUsyNeH1TC18r9wWPEPCw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YZ9yf1X6bndrvuiia09LBLn4h8oLxVgNhJIx3Q/sGDh4b9lEg1FcOhB4fuCk5dfxYT5rPKVooXhHdz3GLKnb8E8XaJn58SnmRR7aLFXgNsLtiFy0iHr6nJgyHoVbc69pgrLA6LDWDJlpQZ6jAZtGub7sWgDtMBa6jV7cZEpx+yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RTrbhiXu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ym22JwUu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RTrbhiXu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ym22JwUu"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PDjDd43627536
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:58:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EwWgdkmodUk
	wOcTt4ODaG1IRCHTJP6TRQlF7VVlOptQ=; b=RTrbhiXuprnEVvEXgCWrKWWbex9
	R2dTkucVuZzBnUe2kXl8Lru+KAJbJZt3UmL5bMjOmVHV9DUncg9b08tjjSa7QeaF
	Zcjfsj2Zmr+nq78ZOSGeYux5mr1J4exjxqtBGB0Z5MFxsNyYFsVlLUoomocIS8/W
	8zyu5t7eYDSLsLQPJ/8PBBdmeTkSs0x/OTLk2d5xLd1HEeKJI8S9Vc4XB7FrZvRd
	IjNITOrBSM0Lz8HUn4b+no7WADJnIFF0ctwxX2ATacLc61n+tRdi750Hkb6aBHZ2
	UWmv/z38bEWIeIhWoRCRsgTHAleAJcuDW/7kncTEmSI+K9uGwP815oJCcsg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq3a3q8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:58:20 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc79892d934so103545a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790351900; x=1790956700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EwWgdkmodUkwOcTt4ODaG1IRCHTJP6TRQlF7VVlOptQ=;
        b=Ym22JwUuH4ZwmoyMqgPEHJs0UQWjb/aOmTePwFD33sw4BlRZgDPD0aFEhovOc1d1Gi
         orXN35soSRzogU4Wv57MPSH1W7c5Gn5+onIF7iWuYRnaaacacsZ5S5I/s8cDuBvqTRyA
         qXBQRA7eU/d/FxydzpcAkpiOmjC6Q7VgxnrOUvA04ReAQz4/U5aCjJnOkrRAH7ma0cBo
         EDnQJVsSURxTjjun7e/4wxKR10st7UfE5IkQ1GR3U9rOHvH2107ACDeYGelEKZQihQGe
         vlyJtPzrqfIPbNedDjEDHN+5wXLbun2w3uXcMOVXhY8TMAsv8qjskHyjlyuf79e2GAYy
         aEUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351900; x=1790956700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EwWgdkmodUkwOcTt4ODaG1IRCHTJP6TRQlF7VVlOptQ=;
        b=Ae67CcABVJ/gKAYx26wAW2+7TlGfucKkodYt+nJOFNMJw2F26Eo6Vfs9NXd2624ELz
         t49ChlaNnFe9LasgBo0/KKcLff8ng3ll4eATugYRg5EBTeiLkemf1uvL8kt0dhOD7dTo
         9j8UspOZK1zDzNFvkvHBAFsAudALD5H1BDZwAxS3g32ilRAvXJT72/ErbsWcteg1o7Ea
         3ZQFnLlCwQwCJjm75BNsJpwyiUBqKHpLEpKcKKl7a7mMbp5vjEXml1Pirggo/r64GvTb
         9DX6puBlADPStd6B7wEpuLumD10MCtlNXdPP2sVni1Leg0gvLbgw23O4azbqVuJv97mW
         I7sQ==
X-Forwarded-Encrypted: i=1; AKwUvBylE5r8fmmGcXDe+0+c4inNmo4iim/NqGUgpTTLRSDzv6U66kd+f8Yf4ne+ToxmoR4BsERPmdqBUdEQrMs=@vger.kernel.org
X-Gm-Message-State: AFuF++nCkHsdrUheN5waclMzxTz7BnqBnYpDjC7PNrqjcrdAWU3Xxd5g
	nHBWsI0xcWX93SI7feZz0p+saqfYLG9DhdDJB5Y7Lx1CrhrMH9+IdO7ZKxVTGottMk0W+ipGc4g
	4CecOsaJ+xzgC3jQ8zSFQPAJLIAj3WEYG1WJI6Z1+Zz+NXr0iteW9Hv6V6kUNHhkZU6A=
X-Gm-Gg: AYBFou24AzQb3xe/vXj8VVSg28aq+t/zvHc/mERjdvAouca8E3p9HYLrgJIVUbWL387
	IXNMsy1dN0vAApN+tV9cLSiiEIHzqCVWGdGL/H+vk36qf7pltbq+hNn/jnmnrP8T636Kh15VTg9
	LrkGZdwm9YM9dSdSJpe1sZkg9/sHDF7VF568rdekx1ssEau3nwpJOZ3FMP3mUBXEG6LAklB5KWm
	XoRGa3Uu8HsU4tMS/DrE+Dh2TWmpnp6O9hVzerBNWx0y1qW2Hvj0cHY2nkrUiewhGY0Hxv1TTdq
	v9ie6Q4JYU96RVSAMrlMmTObh+nJaLSISpr049X88GMTqFQH+nx4mDQn3g5NCdXX5ZBHvc3TifC
	OO15Uoco25CRrW/gE+pdEncC5YXE=
X-Received: by 2002:a05:6a21:7484:b0:3dd:cc61:c0df with SMTP id adf61e73a8af0-3de26c83b92mr2661211637.25.1790351899730;
        Fri, 25 Sep 2026 08:58:19 -0700 (PDT)
X-Received: by 2002:a05:6a21:7484:b0:3dd:cc61:c0df with SMTP id adf61e73a8af0-3de26c83b92mr2661193637.25.1790351899240;
        Fri, 25 Sep 2026 08:58:19 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87ff354d854sm1361299b3a.2.2026.09.25.08.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:58:15 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 2/8] drm/msm/adreno: migrate zap shader loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Fri, 25 Sep 2026 21:27:31 +0530
Message-ID: <20260925155737.4161358-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
References: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX6cHOvbd/7Xq6
 pAflNVfMHfzqHVwEJgghVdgSvG2wYsX9ExAnIxe2okuKpWmqA9ipS4Ku5xgmLFJc30r3x9YYvXU
 2v1utnB7SKp4td23B29SsEN3Z4FPHJo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX6U+XdCWzDSlX
 eUhLEhHn3oBZD28/XRUotd0cz3SxJiBnqemu8Bc39GMPWKnkZJn5WDSMAF7BUQ/vfkDgtVo8OEv
 o82VAkMSJh6zJ6HQURg2phMM1NQ+6R9KBioPL/u/CcJt4YGjUoeoJ9Laai4CpjGAOwwpmZJ2bCj
 3zhnKYAJKlbXfUUupKJCx8RgnYGpJ4p559KygcY0l1SDYxY0FcC+Hvy6NGl8+khCbJM27Tuj95j
 0LDNLDg3ThDknXT80VH0Z+6I5rXplv8ox9kTlmAf5F2HKZJbfKlkwXy7KGM2kh1u/atRuS8Vgxl
 EkFAHKSaJD2LZzajMRzoN7SfjDcSzvdwT0AcYLc62qkZdGzRXP55S9i/KFGxWkaIUPJVsqGCKNF
 MDxNDPCj4a+FTYxodbhcfKIGN9JD7F3F7ig1887vx9UG0JYTVGB5AW8U+1XEVWU3XhanuPg8+IG
 sJi4w6Q+KhN7Ry/PWsA==
X-Authority-Analysis: v=2.4 cv=VuO2kO2n c=1 sm=1 tr=0 ts=6ab69a1c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=heNUI75aw_s-mFou8AwA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: xNsjfauBCbIvxvPJfJeIPlvUpINhd7fO
X-Proofpoint-ORIG-GUID: xNsjfauBCbIvxvPJfJeIPlvUpINhd7fO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250063

zap_shader_load_mdt() uses qcom_mdt_load() which bundles metadata init,
memory setup, and segment loading but exposes no PAS context, and then
calls qcom_pas_auth_and_reset() which skips the shmbridge prepare step
required before TrustZone authentication.

Replace the open-coded memremap()/qcom_mdt_load()/memunmap() sequence
with devm_qcom_pas_context_alloc() and qcom_mdt_pas_load(), then pass
the same context to qcom_pas_prepare_and_auth_reset().  The -EOPNOTSUPP
handling for targets without zap shader support is preserved.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 5832dc25d6bf..d3e843220b73 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -34,11 +34,11 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
 	struct device *dev = &gpu->pdev->dev;
 	const struct firmware *fw;
 	const char *signed_fwname = NULL;
+	struct qcom_pas_context *ctx;
 	struct device_node *np;
 	struct resource r;
 	phys_addr_t mem_phys;
 	ssize_t mem_size;
-	void *mem_region = NULL;
 	int ret;
 
 	if (!IS_ENABLED(CONFIG_ARCH_QCOM)) {
@@ -122,9 +122,9 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
 	}
 
 	/* Allocate memory for the firmware image */
-	mem_region = memremap(mem_phys, mem_size,  MEMREMAP_WC);
-	if (!mem_region) {
-		ret = -ENOMEM;
+	ctx = devm_qcom_pas_context_alloc(dev, pasid, mem_phys, resource_size(&r));
+	if (IS_ERR(ctx)) {
+		ret = PTR_ERR(ctx);
 		goto out;
 	}
 
@@ -133,27 +133,25 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
 	 *
 	 * Note that we could be dealing with two different paths, since
 	 * with upstream linux-firmware it would be in a qcom/ subdir..
-	 * adreno_request_fw() handles this, but qcom_mdt_load() does
+	 * adreno_request_fw() handles this, but qcom_mdt_pas_load() does
 	 * not.  But since we've already gotten through adreno_request_fw()
 	 * we know which of the two cases it is:
 	 */
 	if (signed_fwname || (to_adreno_gpu(gpu)->fwloc == FW_LOCATION_LEGACY)) {
-		ret = qcom_mdt_load(dev, fw, fwname, pasid,
-				mem_region, mem_phys, mem_size, NULL);
+		ret = qcom_mdt_pas_load(ctx, fw, fwname, NULL);
 	} else {
 		char *newname;
 
 		newname = kasprintf(GFP_KERNEL, "qcom/%s", fwname);
 
-		ret = qcom_mdt_load(dev, fw, newname, pasid,
-				mem_region, mem_phys, mem_size, NULL);
+		ret = qcom_mdt_pas_load(ctx, fw, newname, NULL);
 		kfree(newname);
 	}
 	if (ret)
 		goto out;
 
 	/* Send the image to the secure world */
-	ret = qcom_pas_auth_and_reset(pasid);
+	ret = qcom_pas_prepare_and_auth_reset(ctx);
 
 	/*
 	 * If the pas call returns -EOPNOTSUPP we assume that this target
@@ -165,9 +163,6 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
 		DRM_DEV_ERROR(dev, "Unable to authorize the image\n");
 
 out:
-	if (mem_region)
-		memunmap(mem_region);
-
 	release_firmware(fw);
 
 	return ret;
-- 
2.55.0

