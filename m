Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896928;
	b=fw7MpDEES9xbGsx3zGucUdAPGJPxPrca2CHWwB4zFN2kZmpj1+AqKv7iWEr4vzOHRns7
	 g5MkHtmDeJydPsYNB/yiMkH4EWpebXdDKBtM6yz5HwHUnS6CLYFhsRpRM5RJ9IiyliOdA
	 FA86dcOi2k6aDbo/JstcblO0hpE8F4fm4f+n0GUnOjRIW19NAykYXriVBYq6DKspBAG0Z
	 bVRk2HxoXeNLWkuVMyL++H1Z1E70srT++3UUrtAiL+8JVylBDBQwiFufDHTAT6b62KEWn
	 mG1OReLOtyFreRn2EuUTebL0X9WJlXR9M5R2akP6XWJxt/HY2I162+qu4wJAle+Wa0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896928;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ze3u3lgW/Uhu08HGG7LLB4H8V5Md7DfsDjlp1gfGKWk=;
	b=CaQKd/QdQ0xis/DH7V790prbES7TBbe24zbBON1nWpF2WHpge5tX/8Xkh4sFzm7Z3O8g
	 zX/P5ZbgEpLu8Oev12xmbMxPLLE8cjNGRYvPeuQZBqIObze5uqjrVtCSL+3VsmAAak0Kg
	 3pY2zSmqYfnfNlPgIorE3CaN0Q2idpM4TkIn4HkyQmypMCBaUTCd+exMFGPo5pAK8swTg
	 L8/ojEQAUHlAmw0uboeH5AEf469E13DwMIF3OhV6EypLrk8ijAAvOtZ6KfX8JZ3ldJq/F
	 rbyX0f3fKSy08FOht9EBjRYKL7yvURVzurq4+Dio3qldMnpSzcgs3W7M3zSniiauuNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ckzXCekG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LVzXKdYU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44423606D825
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:42:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44423606D825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ckzXCekG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LVzXKdYU
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQDpx494280
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 16:42:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ze3u3lgW/Uh
	u08HGG7LLB4H8V5Md7DfsDjlp1gfGKWk=; b=ckzXCekGh2W61R2QFB1LVxLQMJH
	yW2kRQ5LF44B4c5a3TLhDUJWEixm5N0xixypY7dwtmoVTat9NotuKel9bJ5ha8eN
	CuEbTjic1eBAPQUr66pW5qcD221M1yJZSINJrt0jYiKAgncaJxOKofKA9/R6wMbl
	VmKSsN5/Wj2QYIB3gG2xWcs4FWyzjAwP2AM5BC8/OcLsgNVnslicjyr+mEzAwSEy
	o9C7CYmeeYQ4b8fry18ReVX7NQhWxVLll5fNNwwPgys7VQnHP+uf8m7f8b2hUQTF
	zFjGk885vtGtPzF4dCte6wymLbLg9ES+OQDcRF5eSv7XCMmVMS24Yk8FhRw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqhksqva-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 16:42:07 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdaf2073b0cso1150508a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793896927; x=1794501727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ze3u3lgW/Uhu08HGG7LLB4H8V5Md7DfsDjlp1gfGKWk=;
        b=LVzXKdYUlxd/3FUQVBuEfdde2QRs8Ht39nsAwm8uO4lbRutl2WB5lj1tsSPEctW1pQ
         EvG7sS8d6iBiTO13x5jDFDQyQQrkJYG9z5bcMO/rLTrTJjgggq7q11P1RsF/pY2c+abT
         AYDLFR1bo2lBW/f5Gqyz34+VkArY9DRrwRtgdu+T7M583vrtQM8WtmeLsJuAlqGKmdMH
         GgoeUgEuWVwCd09Qap7m7gm8D17nItqUAaQejJB51j8/Jlpi88TnGkgP0Sgbc9XuCYnk
         MZikUUPTIZ3K5h3fQMlpSfFigZu0D68AHNjZP0JleUWCAFJxKI1qmF4tSbt7JPtHyf9B
         pD7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793896927; x=1794501727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ze3u3lgW/Uhu08HGG7LLB4H8V5Md7DfsDjlp1gfGKWk=;
        b=wND1fcv2YDVylzDVV8/YY4ex+1T/MM5bII2rsqFak0akKx6Ms0w42AdFeoccaEu0+g
         EAfyZAKf/418DKoIDeQ05EQbEcqkdAx6EHjNEkWV50WFbcSip9316uQfXKcjcZ+AXB71
         PIRwvtWVYBo4NXVatIZGWWaOC+hXph3ccXfvOb+eLuJun18RliKoq8ebW/8P9kBDIgMw
         oHsqe+L7qi0BWaFTZ6Wkpi0badJ9lrWGlWGA0e1mJ5ZeMeocurcXYw+cLIO6VFJE7y/p
         Ifl30HmXSb1G5DBruPSHBpNpElKLG1qAfrYmcrbckqIluYFo7v6+iIhhblAUcSjDkFMi
         duXg==
X-Forwarded-Encrypted: i=1; AKwUvBxPpWfSizAWcTls03B+k0LwZIQbzjVE9+a9lOYC+pI5DiBwpmrJfcbwdklAi2XarlHR2TtbWwu8bptA7RU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YL0Oce37dT8+8akGAHCnILdOJvZ1I4wEWvf9tAqu5/SOR2aDs
	AFpR1cBCn0GyALXIm9qOR3yi8ve9KiYGUF/VFz0e6XhpihVawtXCC6lgypnXnRnJ+wzwykRpQ6n
	CDZdY0Z2gw1nVrxALmMG18lT64itbiq6d0Yf3XE7bwEy6tRPBHo3fgydPdG9gPCXmC8s=
X-Gm-Gg: AYBFou1jFCiNaATtgJs94z0mHjdpir6H02bAgeEMD+vfRx2Tqf5z892O8wNvipTStk8
	IeOp8tR7Y1WuV8c9Ta7griz4TMLCYUxuDh/ZSZJnVJ2lE34N0BrQneyYLg+2fBWdAeizydm3gqp
	5kk/l0pemMvomSlxzqsrNeEBTpD7DQYGkDQnOrRsaP4iY0xFqiEjbQhsFpwJlXIYJyp4eUN5iNo
	uvln3ULEj3qfmYiuLUZjNG2NwMtaG6/WefPTHKdPb4fdb56MKm52eoE/04sfpcF4c9qkDALN0Zw
	kzETX4p4BNAA1yC1QNr8KmfglfQTAp1mQ48Au/+Lb8b29a0RdKxEm9b/Qb8rYPszlQjRw1IosqC
	39wCjK/0dMj2XByJeYBAbUTgS62v97vRU6bgQn7iyHntxaTFUVvqRDut8M49UPCGEQ9FoQAEyFY
	Bs1tbihRzV2kk9gpjX6HuZLdY59cvqmOAnEyHs6mR1HNZPwH4MRF5A/VSMHZdT
X-Received: by 2002:a17:90b:180d:b0:3a4:8c41:fab6 with SMTP id 98e67ed59e1d1-3ae8983f058mr16924431a91.46.1793896926676;
        Thu, 05 Nov 2026 08:42:06 -0800 (PST)
X-Received: by 2002:a17:90b:180d:b0:3a4:8c41:fab6 with SMTP id 98e67ed59e1d1-3ae8983f058mr16924400a91.46.1793896926095;
        Thu, 05 Nov 2026 08:42:06 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b90def97sm4175495a91.7.2026.11.05.08.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:42:05 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 2/6] drm/msm: Resume perfcntrs after hw_init
Date: Thu,  5 Nov 2026 08:41:49 -0800
Message-ID: <20261105164158.23263-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105164158.23263-1-robin.clark@oss.qualcomm.com>
References: <20261105164158.23263-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2NiBTYWx0ZWRfX4OfJYm36QUOe
 J2Xu3bqVpR1nWf8hX0RmQDRqwhSHGUpKKj+mmLzM1wVEikFM9K8j2ybYVBAj5uJsruB3xJo55je
 tF+ebhkQRA5NY8XmR2PsctZADy4cdQX1AvkVD/9phkkICe9DqZiy1scgQR4h6tawsZkRhCOz2ed
 Z6KzhL9LCur//aS1eJgpC+OPXbstL6TF7DEXVPp3hJFHZPiQHumyXI6SxtOoCpqmgO6RNYLIXZh
 U9pYMTNmXByoerxYVAvQBRCh3lorVlMr0eGZczc02GQNS2+4jHOSA6eKvoOLLElRlM3Cb0QXAvZ
 KZxrWGW8aztWPgllmKwMRPivh4yIixLs0QsZalQg4c5x0qPgR/19Wy/cH8vsOLPxUQ6K6tTJQxO
 ED90cdAJ0bdzfurRUiyNdzeBDKw6Wk6e4Py6/xXnxZ11jx2n0xyA8MWYqdXK6OOur1xaNwKfPKF
 wQk51DP9iJgaKisdJiw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2NiBTYWx0ZWRfX9Bn2rv+8wR8l
 t5leRPp/93DycbgMrmVB2/med0AXJG9659wqMe1wXAlRtUJ5vryw14pC2+kx8EG4aYKx8bDzeiC
 dHmYRr7vmuHam/Z3Yy9t8iVzKjju5pE=
X-Proofpoint-ORIG-GUID: Bjqq-W5Zo5hbPwDrrMtHnMu1me5w2Vd6
X-Authority-Analysis: v=2.4 cv=a4+lZkSF c=1 sm=1 tr=0 ts=6aecb1df cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=QD1EvTAd08FZB_lsx5gA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: Bjqq-W5Zo5hbPwDrrMtHnMu1me5w2Vd6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050066

It isn't really useful to start sampling counters before hw_init().  And
the next commit will require IFPC OOB request to come after hw_init().

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c |  5 +----
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    |  1 -
 drivers/gpu/drm/msm/msm_gpu.c              |  4 +++-
 drivers/gpu/drm/msm/msm_perfcntr.c         | 10 +++++++++-
 4 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 7066be3b8e15..a3b2440a1a27 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -315,10 +315,7 @@ MODULE_DEVICE_TABLE(of, dt_match);
 static int adreno_runtime_resume(struct device *dev)
 {
 	struct msm_gpu *gpu = dev_to_gpu(dev);
-	int ret = gpu->funcs->pm_resume(gpu);
-	if (!ret)
-		ret = msm_perfcntr_resume(gpu);
-	return ret;
+	return gpu->funcs->pm_resume(gpu);
 }
 
 static int adreno_runtime_suspend(struct device *dev)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 54f337475231..f9a546a2cfb0 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -722,7 +722,6 @@ void adreno_recover(struct msm_gpu *gpu)
 	msm_perfcntr_suspend(gpu);
 	gpu->funcs->pm_suspend(gpu);
 	gpu->funcs->pm_resume(gpu);
-	msm_perfcntr_resume(gpu);
 
 	ret = msm_gpu_hw_init(gpu);
 	if (ret) {
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index ab04a442ca9d..44e5da9d6ab9 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -168,8 +168,10 @@ int msm_gpu_hw_init(struct msm_gpu *gpu)
 
 	disable_irq(gpu->irq);
 	ret = gpu->funcs->hw_init(gpu);
-	if (!ret)
+	if (!ret) {
+		msm_perfcntr_resume(gpu);
 		gpu->needs_hw_init = false;
+	}
 	enable_irq(gpu->irq);
 
 	return ret;
diff --git a/drivers/gpu/drm/msm/msm_perfcntr.c b/drivers/gpu/drm/msm/msm_perfcntr.c
index 7fa2e858bd08..189be6cc23f1 100644
--- a/drivers/gpu/drm/msm/msm_perfcntr.c
+++ b/drivers/gpu/drm/msm/msm_perfcntr.c
@@ -199,14 +199,22 @@ sel_worker(struct work_struct *w)
 		return;
 
 	scoped_guard (mutex, &gpu->lock) {
+		/*
+		 * If gpu still needs hw_init, bail.  We'll be rescheduled
+		 * after hw_init, and there is no point to collect counters
+		 * beforehand
+		 */
+		if (gpu->needs_hw_init)
+			goto out;
+
 		guard(mutex)(&gpu->perfcntr_lock);
 
 		if (stream == gpu->perfcntrs->stream) {
-			msm_gpu_hw_init(gpu);
 			gpu->funcs->perfcntr_configure(gpu, ring, stream);
 		}
 	}
 
+out:
 	pm_runtime_put_autosuspend(&gpu->pdev->dev);
 }
 
-- 
2.56.0

