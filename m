Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911229;
	b=JDzQHBvCFsdVwf1Z7e2DL+E181M+Th6Y/14syp+CIFlzOyOXx7KUNT2ipdrWpaygLeh9
	 l7awtE8PDSSnJc7ClkKcQf3ooIb3UB9A4kiaR7nCEY2kryrrW5uJQofA2wVR3EQB0LlO2
	 kFLyFRS4pTcZbZh2/OXoKnj3Pas4Fcux6KCZTjm4VFSdEm8Iut9hLhnvxG7oC+BArrfGT
	 0Ml5rHhlWBYr5tR1m94RIGOaH5Ds7vaV4EVIR5yOeLAFBNudWNQMgHdQUBk90MQ4Wj7ez
	 M/xRhDlp/lvUnhO4TtuGi9hY44wA3l8m6EjhgSmb8VnNklQXiontfGGxILrbDeCG/wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911229;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=07HC8CYy/1wn7fl1/mdQptgxfFoHGUlLKkrop/ashJw=;
	b=j6s+/Yxp/NvAdyHpvyN9zxKncFEZ8SO02j2lUwmySlkQIvivMkq5E84HX2rqUaKw1WcX
	 ZPjsRs5p4Eof2CD+s+lXwdzTI0n/X2GVGjTahhrG/cvtpLRbnK8xLqt/ZgUUcD2MNGQBz
	 swbP1DGd6UT4qmdXY1dgGKZ4SsjE6tET/RngsFwsUHn/Wcw/R1oCFpaUqgcXgfK2LwD+o
	 4dXm/nmj5uqkxK8lr4tYfPvvIBSnedWXvQ/EscIzU9+rv9aXV2ZLsTPDUlZdp+RyfezML
	 PStW7M1wJhg78VCJd98xUPVAcs7+aQ1/F1hMVuxAwHsW4DGmbKuHWrRGr6+zmNyOb2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cN0rNudS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="A/qCEDTS";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A26606A33C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99A26606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cN0rNudS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A/qCEDTS
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5HeCOw1474556
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 20:40:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=07HC8CYy/1w
	n7fl1/mdQptgxfFoHGUlLKkrop/ashJw=; b=cN0rNudS7g+BJjauacqKMkodGrH
	90KkFCJQG3wpydN93pRtOZrsNmPperoA0q6Md7smpIa5+EMqsWaKl30SOsof09RZ
	NrTaQkjDyj48ZdAwRc6epB5Y1KDqYlyqEGRG/65ccaX6E+6dFolWTq7qGOZLclYS
	JwbEC0CxdDY+I/eNtdeak7KKZFdsumOgj5wHnhOpPxEb1uKEUVR+VPyIo/F28L2L
	qrAUkWU9eNpLFNTFyGPzUc2HGo+tqGnFg28yBhFkrIHmOlwkE2sELUmezeD1dSlJ
	dex7DRZ80eTUaDgP2BSs/3WRlDkY2ghOn8wuPtu8fAvOuEl/UjzzaXkiChg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrmcdbq4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 20:40:27 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b0a528ca65so1763723a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793911226; x=1794516026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=07HC8CYy/1wn7fl1/mdQptgxfFoHGUlLKkrop/ashJw=;
        b=A/qCEDTSmxaw3rTCl02F4mqwKQ7sRAi/JnC8LlUjeNAHLIJpecpT2rwmrU5kA2i+bo
         H/LcTXXTiQIDBFarPh8Do/15Cq37gGLzoGX3L2m/YNoBCP6BIgulHybjzSo/kGBV7/1+
         ooK8LkwEcnMxAJW8nYvlmAcT7MrmIA1+M7a197Y7QbnzjcdLBznQtIASLhYPDs/N/3He
         8exYidNdVHh3DcF3YVRYA75g/TqhDuTh+6rp9r9Shlu8RvGOhjW5PG+hOg0RyQW1/6Te
         15mP72WyOr3fwmsqkxFSma4h6NSzqguneXRvO79TdK4O93R6xIfaADsq4mk7Am+xDz8T
         MmgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911226; x=1794516026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=07HC8CYy/1wn7fl1/mdQptgxfFoHGUlLKkrop/ashJw=;
        b=pNPnuaYfBURTjTh0Pluzo6PlnejfM0ILrHs15oph6lqpiYjGOLc93WWKO157AHZv4a
         vKeWnd8j+yvXig/AsVztOUelaKtM36dc+IpcTgaBultzJpvWNaJmVcHYawHnf6DzOHrt
         LzDA0ihh8O7hvFhBTQqjm5Cp8EDLN7/uZWK1qCnvsvIjNDWld2QECwsp5qub10WA2pN7
         aV4Zgs03YrTpANL6Ib3LXzMR82we8GMhXmo9vBZACkv5AcSksCKlQXsUUTTYhWhwYflT
         MuqXXPFSw9kLLMzdy9Y/XZ5OJ/M/2e3NQYrl9vkOdx/+aBH98SgdVdTgGfznKKHI+NZU
         FdHA==
X-Forwarded-Encrypted: i=1; AKwUvBy4rd3lThckZpgRXwsdldN112bfh3uuPdlYaSw7sOCzwfUOpbXkJ3DJnI0XHP25+ekNZ6KMrkEWkoHljFw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/q9uIAXL/p6HESSzHPhufAk/mfrE9ISyEW8lIwYvtbXMP9Nq5H
	Xvwc6+sZBnWeC+dmGE6/fe9jL3ICmLtzHodM3N4wMlkbWdsz0XqcYjTE606V39nYSgMgklocgdU
	MqhvANcY2i9HXvmsYS5SnYj9GZkIKjM9SSHwj+QA2bvMdztNnX6K5fkTXAce+UbzaVCM=
X-Gm-Gg: AYBFou03NpxGFYWvKIRkJXs+bQw/eLTfLxRWaFhurOCJ/ehiY0xwt8z8yi0f/pUF2yk
	xri7nuvWeYZLGdmKtZcUYTTRvgcB/VYpQ+io0yuBMo4v4q1fRQ4rYmLWg223SUT+re7aXItUvzu
	kc82S3yFyfh+3qGbYCjgGVBcP/5luEk6jdxOeP0wr3hd9gfJGB++6CH6sRkdKrnlm1kDLzxcHbE
	oyPq7eLZF1UPhD9lohPy1TEHLgpfPOhB78EE7Cc4gPIbLFePWgfywkAbcP2cHWmPngte2z87f9s
	Z1VdQ3G92iyR8wXoroLsETAjHNeM4rga8yfqaaOvaKJjNFHHQToOl1g4wPH75WVbUqT0bVtPe2n
	fkESLecfrBTM2tFoTIlv8ZFo0soBEheV/y9ZPXCdh1d/HSQ+idnEQsRJrfzNHz9fsZn6TLI51IW
	ou4UgRMED46wUx2D87DNqeP6NTkYemu/IMbiHwvtCbYq1+L+0kDhs+HsyU3oCO+w==
X-Received: by 2002:a17:90b:3c8e:b0:3ab:de4:7fa5 with SMTP id 98e67ed59e1d1-3b0db71d9f8mr154336a91.56.1793911226373;
        Thu, 05 Nov 2026 12:40:26 -0800 (PST)
X-Received: by 2002:a17:90b:3c8e:b0:3ab:de4:7fa5 with SMTP id 98e67ed59e1d1-3b0db71d9f8mr154312a91.56.1793911225918;
        Thu, 05 Nov 2026 12:40:25 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7c8f2f0sm646750a91.11.2026.11.05.12.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:40:24 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 03/15] drm/msm/a8xx: Add a8xx_aperture_acquire_raw()
Date: Thu,  5 Nov 2026 12:29:29 -0800
Message-ID: <20261105203057.66520-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105203057.66520-1-robin.clark@oss.qualcomm.com>
References: <20261105203057.66520-1-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=EOGTQFZC c=1 sm=1 tr=0 ts=6aece9bb cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=qGl0e74_xy6xiHm5yPkA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: H6Btr6y9ULTT63lR4jXLmDfz1TCLfsPB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfXwzQsl946AlgW
 2MevPEwxnUUMDVHtoGnnnPY6JKFH1+NyELwEo3z7PQ7Tb5F3siPCjfl3O5WUaSERD+IT9VJGgT+
 oHHWhnFBBXSxAFIuH04YMzQEWkDn834=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MiBTYWx0ZWRfX1rFI/TWhdY3K
 bSGcQ015mqSxs8689c3Bh0iii77sshMKRAXJmaWtce4MYtAFzbDmlu7ZTwhEMY6soIHQox7gVFN
 Ah9qDHSsfL4i8iuICO99WYNUYp5i/xJa4MAIhvykriBUNIcR77zbE4zOX6ExPZ6+siaBZBBCyCU
 J6voP8A8h9NCf4M98lWBOp1Hz8yJmIygMgtLn5tU6Zvjgkvn6zs3J7we5mOSTcNflQWpaTk6LD0
 Q/S47IZ/aT3HAj0S9+8mxc4Ql1NRcou3XSzAX7E80d1KWAnhu9+j0LUMin76q+RywsSKWqCdzrq
 FbWS70BPka9sVxhoWI0QW0o+VUACxQ2LLwa0kGs53dEYuISeTSUGeaemyghxKkvJ8iQQmkS936S
 eBbxlVDFrAYqPJo4DbsVDIHC0J7qg0Dit4ooLBh972q56D0X4RwC5EF0H7nOpM5g/awC+LQcoKo
 Q2dKcD4VgHZ0z41gfUw==
X-Proofpoint-ORIG-GUID: H6Btr6y9ULTT63lR4jXLmDfz1TCLfsPB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050082

The snapshot code will need more control, setting additional bitfields.
Rather than add a list of additional args, add a helper to acquire the
aperture which directly takes a reg value.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  1 +
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 21 +++++++++++++--------
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index c58a2665e9ab..e6ec85b20fb7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -346,6 +346,7 @@ void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 void a6xx_flush_yield(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 int a6xx_zap_shader_init(struct msm_gpu *gpu);
 
+void a8xx_aperture_acquire_raw(struct msm_gpu *gpu, u32 val, unsigned long *flags);
 void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags);
 void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags);
 void a8xx_aperture_clear(struct msm_gpu *gpu);
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 82cddaa7278f..be81f141300f 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -16,13 +16,10 @@
 
 #define GPU_PAS_ID 13
 
-static void a8xx_aperture_slice_set(struct msm_gpu *gpu, enum adreno_pipe pipe, u32 slice)
+static void a8xx_aperture_slice_set(struct msm_gpu *gpu, u32 val)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
-	u32 val;
-
-	val = A8XX_CP_APERTURE_CNTL_HOST_PIPEID(pipe) | A8XX_CP_APERTURE_CNTL_HOST_SLICEID(slice);
 
 	if (a6xx_gpu->cached_aperture == val)
 		return;
@@ -32,14 +29,20 @@ static void a8xx_aperture_slice_set(struct msm_gpu *gpu, enum adreno_pipe pipe,
 	a6xx_gpu->cached_aperture = val;
 }
 
-void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags)
+void a8xx_aperture_acquire_raw(struct msm_gpu *gpu, u32 val, unsigned long *flags)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 
 	spin_lock_irqsave(&a6xx_gpu->aperture_lock, *flags);
 
-	a8xx_aperture_slice_set(gpu, pipe, 0);
+	a8xx_aperture_slice_set(gpu, val);
+
+}
+
+void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags)
+{
+	a8xx_aperture_acquire_raw(gpu, A8XX_CP_APERTURE_CNTL_HOST_PIPEID(pipe), flags);
 }
 
 void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags)
@@ -74,8 +77,10 @@ static u32 a8xx_read_pipe_slice(struct msm_gpu *gpu, enum adreno_pipe pipe, u32
 	unsigned long flags;
 	u32 val;
 
-	spin_lock_irqsave(&a6xx_gpu->aperture_lock, flags);
-	a8xx_aperture_slice_set(gpu, pipe, slice);
+	a8xx_aperture_acquire_raw(gpu,
+		A8XX_CP_APERTURE_CNTL_HOST_PIPEID(pipe) |
+		A8XX_CP_APERTURE_CNTL_HOST_SLICEID(slice),
+		&flags);
 	val = gpu_read(gpu, offset);
 	spin_unlock_irqrestore(&a6xx_gpu->aperture_lock, flags);
 
-- 
2.56.0

