Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657068;
	b=39e8VnvXgrAuDdUF8mKbWV4NrBblVFQ/kL7M3bYnHWKAlvZKD3MnRHX+FLNszrTxYKsi
	 SRJclnqDY/+/LiT2ZwTdpnTt2qKnJGrtqhf/CwpDKA51qmJjWKKH7KaBRL78C49KKvUyY
	 Gr4wLAPUo06Ip7KWEtqgSNOknays7pMk8L7bjtGmuJZ+fMahQsa1Z9aoGPp+Av+8+2B4+
	 4ACRJzMLdx7QfbfKQwJob1wsMxFUwk0wi2nF2Kg2+Z4TcJ6BXMMCX7QFL9qvgwpkKgRYr
	 ZclKilaepIk/fMAOMsFy714oEbC+B8daF8kOblsSxvMNsh8hr5lltp2zyRUUazwapsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657068;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UVX7b6ntdrV+6wjxMqUvH3ly/pZHpls0n+hd4y9AHHY=;
	b=ub13pXMnqV/IEtInt53VLZlmciMjL32qNNK5xBH1bpJGLzpz5YKGSvomk7y7lX9gSSPb
	 0lvWnPYD8MO/cjeUl3w7qc8FQV2VbdqgpAGIYbaCkGm5s2mhoVZvN6heq1Pd8LJ6Jq251
	 B/h8YEP0YzfLQJTjy5EbfEBOBws0sfOrAuQH+B35Ahv49oeBrnX80ttUIgjF6OBhmMBWx
	 XChkW6rw2OdsBObbb1Os140mQdWr667Up7jods+XoTYjZ9BpwJew6B/y1gRx6VWqyXysx
	 HhQcnz/6TYKBWCcm9NR9Ibo6BJKYaZ9/R/E8nP+zXnax38KfbEk+T1nqYny9BMsSemQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QkmAvFQB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JCdYQQ2O;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084C0606D808
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:04:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 084C0606D808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QkmAvFQB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JCdYQQ2O
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K60W03955604
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 22:04:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UVX7b6ntdrV
	+6wjxMqUvH3ly/pZHpls0n+hd4y9AHHY=; b=QkmAvFQBgUfjfXijqq/A5REgF6Y
	jC9bbnv1NTlDXxqSq2C0Wq15r6gzGRQStGF0ZWFegV08bMzKigcGapXV9BUrGr9I
	2DMkVScXZ8XWFYCOqlcpHCn+WLj4OWjxGkiVTHfBN+jidTDf16MuvgU1uXVWP4bT
	0w5Jk4wp/ruk8vCeOa6gtl0mgnt9P6Qvktxy+BgUh187OIRZCdMktGTsV090pKdu
	EyRdet7RYIFIyZKZP9vLg54fyBhX9M1uoQOsTbvagQ4eXr18zSiodfALG8XiCTCL
	fao6uLW9+vk3vg48FMLrIZlkZ70p0ZQrNN+JsBR/HGOyM2I1E1Lajt3D0Iw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq081rnta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 22:04:27 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ac7a4ba546so67017a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793657066; x=1794261866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UVX7b6ntdrV+6wjxMqUvH3ly/pZHpls0n+hd4y9AHHY=;
        b=JCdYQQ2OBf7Z31HsJ0eHMm35Pv175iChZsctKnDiDsjTX4p986bkQZT38/aFPdae0K
         HYOoxkir9k0GyLhZmai/7k5qo2Dy1zyQ1t1wHFkGLo9Pt/0GzeDVcX7ugLCT9F7DjJZw
         X2o/Pi7hu1ZiJWANqpgrRCLj9d4+QX++KydyHjnrNKEC7z/gEC/iC5+eC8dN87tQzlRu
         HuCoQEMngtXvFOK7iSr0k/qv657kOAx5pID9m1R44Dpq2bG9NMDvXV/y79ZaVyH38z56
         Mww8ABkgtQ97IiAKY/VrT9qMBGVIkiycbxbJNoylWD/MW2jdLaR3EpUst0aW7GecKQPk
         mRVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793657066; x=1794261866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UVX7b6ntdrV+6wjxMqUvH3ly/pZHpls0n+hd4y9AHHY=;
        b=sj4z892Oq/ZnC34fVaK/2/9zqd15ppp57zZoSLUt4k8FovnItw7+Etgj2VUtedYwhL
         Kqd3QTWTN5rSUw6M136E0/72Dt6b3gaBrAXjlMD3OFBnXZyHJaPdUfLaLzawclnQZIBj
         jBlXTw9kXg+BD0k2Ka81GwUIjTssEWA4Vfl9OXPQyX5u5p2eg6sJnskNjnvm4EzUkye8
         3mDqv37y3XQNwfKeKd0DFH45qNN0zmtXIIjJZKSgE6KvZ6r63HEU+M6eMNs710+22C3H
         uBfCpUfuraY1pFz+r4yfNg+58w/9vDogXRks45UtQ8QJ1gNk13/BrhgOoOaOfSMLLGzq
         J8+g==
X-Forwarded-Encrypted: i=1; AKwUvBxbifDNzkv+sADh8eXzlKEuXw6Hh521E/eu0GLBWJ2ODVIZI3nn+G6VLO95uxYiXeXxyJVvjNE0Vz0EheE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ngT+B2WQtqMWbUtVuXzytfrmn+D7vz2lMJvRm0silywnrloFG
	6PT+/ZWA8mD8GfG/fM8oU25ruusyz9BPEkNShPh/BJbIhHtpjirV1oF55oO68zoXLqK6xzeX2HZ
	0d362dJkb7ySNdW/p1aZasPM/G/nugRi3LEZYkCb4qlE5Ftl1OQdV58y5GkFk7tPoXwE=
X-Gm-Gg: AYBFou11KO6ljFF4LQGqCQGQgcchN/zVTCNrwj6+DkdrmDueMEqm/M8+RR5L4+c2+O3
	4DFKcV/F8B9HJVpo06aSGJtERuKNI28XMfwFCt36tzPZuBERox+WT7cjw+z85TU6VMQkoDknf1u
	t5pHIAuUq8w+U/vycDrphVbKo2JOTzjaB/mMuFRvAI091XOJYfqVgXb2K9M81JOlenAl5piOVlq
	ojEhFVyHHcF9YYmymgolhIc7b/PsRmmUJgsytR3snTFw6wtxOYkmR5do14R6N1hU3BWJdD1pPTo
	W5tYF+Vrhl4p0TS7ODYWYR4Y1mm3lMc9HNw6gPgeT/NuAo5NcyA9mZuczn3pWqYvfhHt0Hn124i
	CV+0eH4k8W0yszkruEDD90HiFg4PvznmisgAylV+3nuku20Glx8zgwfamWK8c8i5uUByee7w9p2
	cPKQrp8X9sggu579v04EMwWg==
X-Received: by 2002:a17:90b:4ad0:b0:3ae:3e9b:5265 with SMTP id 98e67ed59e1d1-3ae897585bamr6338408a91.26.1793657066440;
        Mon, 02 Nov 2026 14:04:26 -0800 (PST)
X-Received: by 2002:a17:90b:4ad0:b0:3ae:3e9b:5265 with SMTP id 98e67ed59e1d1-3ae897585bamr6338379a91.26.1793657065968;
        Mon, 02 Nov 2026 14:04:25 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c8329afsm953756a91.8.2026.11.02.14.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:04:25 -0800 (PST)
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
Subject: [PATCH v5 03/15] drm/msm/a8xx: Add a8xx_aperture_acquire_raw()
Date: Mon,  2 Nov 2026 14:02:47 -0800
Message-ID: <20261102220405.30730-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102220405.30730-1-robin.clark@oss.qualcomm.com>
References: <20261102220405.30730-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfX4biN31qCDqnd
 5rfQutc8kccpsN4+Ad1QpDtHTQlSesA8+U2RYX+pj92NTY2PM2fzCYn585gDf0y5x6IUjmYX1uN
 H/95ZqbwJuDse/R1Vyqchkrat8i8NoE=
X-Proofpoint-ORIG-GUID: 3qtx_vYpqVivcj_LuN3dweDHY7yjEAgI
X-Authority-Analysis: v=2.4 cv=F73C5ahN c=1 sm=1 tr=0 ts=6ae908eb cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=qGl0e74_xy6xiHm5yPkA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 3qtx_vYpqVivcj_LuN3dweDHY7yjEAgI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfX7g33m2KuIvL7
 1c9ZDvZUWx2a+M1oN3pnagDuwkd4yzp+GuHZJKJF1qQPgNXOJQwnoHHWNj7NgCyhWRVeOEZVejb
 DCvcGFtNATonSAFPaHfyXVASU/EpIATQVvQ/1igZyUdYCaIb9lHZ7rPBZnH59FA1hEnPSsWb+eO
 iaaKfvZepN/syWiCxT4Xg8zEj/VnM+3cJyLclgZeysZ4HplVkKFIbnw2nLw6XPCfy3dJmCfBSNO
 0quXBa7FohcgiaCgPDXeeouxBYuRXN8V9oKp3D1/C5Wu3zeK44kMecUwk7XSN7QoO3rrNWhjfgc
 C/Y5P6gBOaYVeGrgjzmMwf1tRHB5R4DToDiivw1QrouAyfMjTkHU7HGOLQskl1/R9iKQkCVKJnC
 cTzIWgiKVCI6QP5rOEldX59zIXKaSswaMuLKeS3DmrPFBzNbRvo8SdDcOBQLeztnK9gRXfr51El
 FppKFWuf5A/G/m/B+MQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020087

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
index 46e2b921f4ff..83c0fe39a44e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -349,6 +349,7 @@ void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 void a6xx_flush_yield(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 int a6xx_zap_shader_init(struct msm_gpu *gpu);
 
+void a8xx_aperture_acquire_raw(struct msm_gpu *gpu, u32 val, unsigned long *flags);
 void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags);
 void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags);
 void a8xx_aperture_clear(struct msm_gpu *gpu);
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index afb115c3d7eb..f2b635497811 100644
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

