Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE3A32BF4B
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 11:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789902538; cv=none; b=ulgVykcB3yClxO/yth1DfoE9/5vFRgP7DqH/SH2ji1prmOLyf0+HZmuWm61o1Sn0hlaa1QN34TTW39VDskeAwHTVz+5XPByAjim52qm0w3Rg04S5M/ybEItOgdNDH+o4OZqjG49jyPD8kUf7j5J4kDr7nnM4m6BvwIX227qDYrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789902538; c=relaxed/simple;
	bh=Kr013Ufa31MQkHDHr89ESzCC02MmnCtRi2ICjwnvrWs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IiwCREA3QfEPubgHltxYhIrbl+iRhA0aH0TwRCHUEyCe7dXRG34iVTOnVgYli41VpSwaAFTUFPs10SxT1GUAOj3Mx3sBaKvccq04kObLjMGMLbVAvIr3jtaaHe4zgmmo3BzssWO2X1QAh5140q8v5e9bFLjTJNDAZ0p7qYhL9rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X1aA7dT0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=foU4pkSC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X1aA7dT0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="foU4pkSC"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K8VkOM2025285
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 11:08:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cabhqPDnRFFxZeQS+sv4cm
	/JJRYkr7vzBnhBand6l0k=; b=X1aA7dT0zS6nvlIlOMZgyU8KI9Hmd6m32ryNPB
	f15iYhIMBdmcumLS/3y54DBA7W4jbZZP+frgucAReZSgz/2Cb/2vl8B5s6wK6Qu7
	4eb4r9c18BMI+wp13lnhvz1Ac0kJcWgUyWlGx7IcleIPWfoHJpSw8+JDH8TJqIP5
	ID4dt9SL59wNhrnqBf87hZDiCcVnKuw/CA/eHmopPDIjXMx7Z2Bxh00wrNBoneps
	Zbd9Z9EKP6FrYnBV3zcYKWPofAHhZc29/90m33N1/g+O0ChyyUhxhlJuY7Qwqd+C
	YlGO8r1B9/Rf6vQ/fp4Yaogv4kW+Vu4y7ah3G6KsFiASBD3A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjm32thu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 11:08:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a08ff8451so371332685a.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 04:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789902535; x=1790507335; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cabhqPDnRFFxZeQS+sv4cm/JJRYkr7vzBnhBand6l0k=;
        b=foU4pkSCYbeEKHgkTFz+rAD13ae2Wpru1lYLN7P4UtdZ36bUcVOcXptd6H7oVZQuXK
         Kuhp+qKLUMKrS3+6s7Dtr/IUnxC762InkI0DbjE9OIl9A1rm4l8SeYhQpquhO1m7bIt6
         T/tpbbYDxlqM+BOBAG+uqVGAPD94RcJGJDSl2cWgSxos5FmHRaPe4MJy0F7+oQ+B1NPv
         jklvhIkyk2bsxN1uWkGJDqG0TOik1UKMIktIIteUnnbUqsAVdGyDOplHSjPjQXeTKgko
         PhtczsdL5aNcTFmvqToXf8J2rPJ7W2mSkWJSgHukWziuFiRw0hxtjB4l+JlORIAilzGW
         OEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789902535; x=1790507335;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cabhqPDnRFFxZeQS+sv4cm/JJRYkr7vzBnhBand6l0k=;
        b=wmC2DuinygxGOBJMaL+s5vUDusr3gifJL07EtrJX994noqfhguJUKwE18ARh1fXtmA
         1Aoms6A1fES6vbjmt+1xo5tykFCTvRfoyZIWQ6/ub92jCYzJ4nDE5l/SxfuvJmwJbu60
         u4fpEyCBGz1UJXeydlOVmUaOadClgHLDDe8DMPN3tkI+wnJjzYDefE8ZolK2e6gkrMun
         MyZ5t91k5wkmPp38odYd2FjMjyvGlq6EU4X647EHvBXABZOQz6Rt67nYVBNXyqC4lhlY
         krtbwB5OcpjFVpF78v+FIjpQ9fuaeVQLelgvHKC8r3Wpc/H5VOma/rKXDbSfQ7MXyl3W
         xVgA==
X-Forwarded-Encrypted: i=1; AKwUvBw0V1RS6Bk8Nb8mqkPloub4y1aI3vJSqrZYN1nkG7RT6f1Ea9SdszZmLpmCTXsk1jlCZfGsuQAQSQPnbcM=@vger.kernel.org
X-Gm-Message-State: AFuF++nS4NdMXy0RtCgi3xRSvjjTPG4aJwsCBUOdBl+5VC64hD0hjUeq
	086v6Mg0ikbw4K1YtQhru8WJrzhj6N25Whv4AdAGeLg4u9VOLDfpGFSleFxzWEsNGWYkhmNu0sC
	0xL3sd+C0PfAUCTyFKIHKsQeQqX6AyBkzFSqDGJjhj2GwCyJuw5zMoSDNyeASXZOU0CA=
X-Gm-Gg: AYBFou36IgwYKvkzFKjeV9tHVxkFqM82nS27kaibWyrIIdHasduFp2bKBF8kR8y7eWw
	EUM+POrJO4ZqRgJKbx9Pja6XOc/hyNEiSwqRsF26HzNFU3Nzz/Vf7TYrBWd5VZJQEeHOZ4mkV3a
	gErDda6k6hEYPrLD7sm0I/CDow8I8G3VIcl1Qzh28+yqXiq5QQGzZlbHDL/YeywUSgt3kSMyEms
	1RhyxhpiLthseK0l0PujitPu9GECwD5u9N+OI9qaQFjxc4yepw0UOMat3qDbPkxwqwm83JPOwOw
	m2dnBSaR7F5F2A/5gGcaQuoUShG4yxCmg38Uw/rXRO2W58SKf98YwKdaZ2dJwlSrU7I7xN2dIVn
	NSSkV23qh/z8hi0wB55pdToXXTsHERaXq2eicS+IJYlp3FsjGkoUkJLa7u+JdwlmoeCS6LVYqN8
	+ZrWwexavjAxvG
X-Received: by 2002:a05:620a:2602:b0:939:8905:ce9b with SMTP id af79cd13be357-93bf55544a2mr484187685a.17.1789902534745;
        Sun, 20 Sep 2026 04:08:54 -0700 (PDT)
X-Received: by 2002:a05:620a:2602:b0:939:8905:ce9b with SMTP id af79cd13be357-93bf55544a2mr484184385a.17.1789902534312;
        Sun, 20 Sep 2026 04:08:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8c795c7a4sm1190216e87.56.2026.09.20.04.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 04:08:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 14:08:52 +0300
Subject: [PATCH] drm/msm/a5xx: don't read the GPMU registers on GPUs
 without a GPMU
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-a5xx-no-gpmu-v1-1-714200254f76@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMO+r2oC/yXMTQqEMAxA4atI1gbaiL9XkVlYjZoBq7SjFMS72
 9Hlt3jvBM9O2EOTnOD4EC+rjdBpAv3c2YlRhmggRYWqSWGXh4B2xWlbdtRUka5MmdVmhJhsjkc
 Jz679vPa7+XL/+z/gum6HyiJAcAAAAA==
X-Change-ID: 20260920-a5xx-no-gpmu-128218b739bf
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4197;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Kr013Ufa31MQkHDHr89ESzCC02MmnCtRi2ICjwnvrWs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqr77Ej292QiEnGqBxUjMeAHTbA1cKHVwf3Phlx
 PAUXmL96caJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaq++xAAKCRCLPIo+Aiko
 1ZLEB/kBuO6oeyZwGWSKoH9aOSuNxwj6P7dPfvefxA17M9Y5zDBnU7A3zBiL39tf/TXTFF30TEV
 swjSzazT4XumxWBP8CL+7Ni3bpB1qdEVzY6f3jiLnRAN/2GHzoollpxA+0FzXTmiV5Pk1o4Cqr/
 1p2I7v7xip41mnHOig3aHTD5p2WW1YpmEBEtDGh/1K/QY9ouFoeWAcQrhZdxUdH7KtrLDHJhEjY
 vOUVGy7pjyYnBtBkt+2wkM6VsED2nVDXYlO62SYFENusmsVoQ9YXsL4G5M/Fv1kOZ28RmoWIM5+
 FJKFsAiMAbk9j4ojT0hr2WwIdd5v6aopsLYTdP9nuBWQknX9
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: XstlKLn8G18L5NsA6xAqul3YVnZZxX5l
X-Proofpoint-GUID: XstlKLn8G18L5NsA6xAqul3YVnZZxX5l
X-Authority-Analysis: v=2.4 cv=DtfDa2/+ c=1 sm=1 tr=0 ts=6aafbec7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=vx_jCk8yxa604MycbTkA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDE2MCBTYWx0ZWRfX/7XltpWjmBdZ
 wl0hsny3zuYkSSTHTDC565xPAKNDLDxWkjnxMttqhS1CH1NNPe4QhmiiPTGE3G9ryoGJiilnlrO
 tzd9zUC4C1F2QfPasQpmTntb6DJK5qzaLCpOG8CAffu3cIfLXx+y/OEIvF2MPM4w6bLW+n6Yuky
 fPn1zz4Ed8gfZVJS97C3PQ2LrzTSSEHkM+uX+lRefF9QMnVX/DxEpFiPvn/HP9HaUqbfgAz/B8e
 6T7gQ2kqNEldVNSG/n0kPAUD80aSPnyCtRnWgO9ihV6G0gunLSl8Z2An1IMOWLkPKUe/G3nH8G0
 46o11lNpOv/DQ+5g2EC5Dv6V6reES5LOGWfxqdB3NhXJSCZYfqTEMwgtvgNN/ddfeIrYJtiXmFc
 55V+u9/4NrkAJgpMgPB83uFIpuNgDiPS9uGMWO8RxwlgN3d+j1q0E+hN4uv/iP9Q7FasCF6qiyr
 pTyR9sjWBlvis+RjCCQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDE2MCBTYWx0ZWRfXypx9vxgbpARX
 tBZgWyQ7MrRIWkcycwfRvY6RjwFGp+MiyvYNRM0MPXuLgcqQm/j7B5l394PSuSbfYMOXTINCn9C
 I3vNVoZaD/aHYSKuMIQG6voDn0ZMa10=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200160

Only a530/a540 have a GPMU.  On the other a5xx parts, reading the
0xa800-0xac60 GPMU aperture during a crashdump resets the board -- on
sda660 (a512) a GPU hang thus reboots the SoC instead of recovering.

Split the GPMU block into its own array and collect it only when a GPMU
is present.

Fixes: e20c9284c8f2 ("drm/msm/adreno: Add support for Adreno 510 GPU")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 49 ++++++++++++++++++++++++++++++++---
 1 file changed, 46 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 5d96b8f63156..3974aaf6fd33 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1337,9 +1337,14 @@ static const u32 a5xx_registers[] = {
 	0xE800, 0xE806, 0xE810, 0xE89A, 0xE8A0, 0xE8A4, 0xE8AA, 0xE8EB,
 	0xE900, 0xE905, 0xEB80, 0xEB8F, 0xEBB0, 0xEBB0, 0xEC00, 0xEC05,
 	0xEC08, 0xECE9, 0xECF0, 0xECF0, 0xEA80, 0xEA80, 0xEA82, 0xEAA3,
-	0xEAA5, 0xEAC2, 0xA800, 0xA800, 0xA820, 0xA828, 0xA840, 0xA87D,
-	0XA880, 0xA88D, 0xA890, 0xA8A3, 0xA8D0, 0xA8D8, 0xA8E0, 0xA8F5,
-	0xAC60, 0xAC60, ~0,
+	0xEAA5, 0xEAC2, ~0,
+};
+
+/* GPMU registers, only valid on parts with a GPMU (a530/a540) */
+static const u32 a5xx_gpmu_registers[] = {
+	0xA800, 0xA800, 0xA820, 0xA828, 0xA840, 0xA87D, 0xA880, 0xA88D,
+	0xA890, 0xA8A3, 0xA8D0, 0xA8D8, 0xA8E0, 0xA8F5, 0xAC60, 0xAC60,
+	~0,
 };
 
 static void a5xx_dump(struct msm_gpu *gpu)
@@ -1448,6 +1453,7 @@ struct a5xx_crashdumper {
 struct a5xx_gpu_state {
 	struct msm_gpu_state base;
 	u32 *hlsqregs;
+	u32 *gpmuregs;
 };
 
 static int a5xx_crashdumper_init(struct msm_gpu *gpu,
@@ -1565,8 +1571,30 @@ static void a5xx_gpu_state_get_hlsq_regs(struct msm_gpu *gpu,
 	msm_gem_kernel_put(dumper.bo, gpu->vm);
 }
 
+static void a5xx_gpu_state_get_gpmu_regs(struct msm_gpu *gpu,
+		struct a5xx_gpu_state *a5xx_state)
+{
+	u32 count = 0, pos = 0;
+	int i;
+
+	for (i = 0; a5xx_gpmu_registers[i] != ~0; i += 2)
+		count += a5xx_gpmu_registers[i + 1] - a5xx_gpmu_registers[i] + 1;
+
+	a5xx_state->gpmuregs = kcalloc(count, sizeof(u32), GFP_KERNEL);
+	if (!a5xx_state->gpmuregs)
+		return;
+
+	for (i = 0; a5xx_gpmu_registers[i] != ~0; i += 2) {
+		u32 addr;
+
+		for (addr = a5xx_gpmu_registers[i]; addr <= a5xx_gpmu_registers[i + 1]; addr++)
+			a5xx_state->gpmuregs[pos++] = gpu_read(gpu, addr);
+	}
+}
+
 static struct msm_gpu_state *a5xx_gpu_state_get(struct msm_gpu *gpu)
 {
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a5xx_gpu_state *a5xx_state = kzalloc_obj(*a5xx_state);
 	bool stalled = !!(gpu_read(gpu, REG_A5XX_RBBM_STATUS3) & BIT(24));
 
@@ -1581,6 +1609,9 @@ static struct msm_gpu_state *a5xx_gpu_state_get(struct msm_gpu *gpu)
 
 	a5xx_state->base.rbbm_status = gpu_read(gpu, REG_A5XX_RBBM_STATUS);
 
+	if (adreno_is_a530(adreno_gpu) || adreno_is_a540(adreno_gpu))
+		a5xx_gpu_state_get_gpmu_regs(gpu, a5xx_state);
+
 	/*
 	 * Get the HLSQ regs with the help of the crashdumper, but only if
 	 * we are not stalled in an iommu fault (in which case the crashdumper
@@ -1602,6 +1633,7 @@ static void a5xx_gpu_state_destroy(struct kref *kref)
 		struct a5xx_gpu_state, base);
 
 	kfree(a5xx_state->hlsqregs);
+	kfree(a5xx_state->gpmuregs);
 
 	adreno_gpu_state_destroy(state);
 	kfree(a5xx_state);
@@ -1630,6 +1662,17 @@ static void a5xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
 
 	adreno_show(gpu, state, p);
 
+	if (a5xx_state->gpmuregs) {
+		u32 o, pos = 0;
+
+		drm_printf(p, "registers-gpmu:\n");
+
+		for (i = 0; a5xx_gpmu_registers[i] != ~0; i += 2)
+			for (o = a5xx_gpmu_registers[i]; o <= a5xx_gpmu_registers[i + 1]; o++)
+				drm_printf(p, "  - { offset: 0x%04x, value: 0x%08x }\n",
+					o << 2, a5xx_state->gpmuregs[pos++]);
+	}
+
 	/* Dump the additional a5xx HLSQ registers */
 	if (!a5xx_state->hlsqregs)
 		return;

---
base-commit: a15fac810c76397ec9f62a6fc26c4d7ab6e238a7
change-id: 20260920-a5xx-no-gpmu-128218b739bf

Best regards,
--  
With best wishes
Dmitry

