Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792529270;
	b=hRRRS+aCpA1aXItNYv+iBBgk+uoKyzxhqswOOo3bN1eFYOYvw9MO848qkOeKNLHZZFvI
	 y+CpYAssL6coxGDo+JgBMaAR7P0YuiKgiFRhteHJu7fMuMO0OZ6jOfgIM8m1rRFqzXcqB
	 XQI/kl2m3xqyqWs7OIk3v9GunSI1StEpm9l+F2NYadwQfAO3cB6iuoWt5rhOJtlnbDiTD
	 OxLrjj0DAbClr6ubT9WPtj7OZ0liMROueAAXjiAcuX21i8Q6nObr8eeP189KcqkbxdnmU
	 yXBEDsRf1/PZ4ZJFmiWOJbeaR0qbnvSOOkwugwuWy+04UPRSP8fL+Ti/xSJRDL54lVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792529270;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bFtglml+hC8hn1WGCAIjH4C7EGvJhD/mYi/y0qfEDH0=;
	b=n+UhyxzfLiy0cC0OmLoDEl15NNQh4pH7vZi9aoNq6eiJLzgsrSx3F2y5jZ+oOOGGWYb9
	 Vtqw+URsxvWjxYlGbvCimObraxnfVp3zs8xJO16dJCT5FpTBYAiOfWcUIG2XUDFvAHLbo
	 VvbvNef68Fw3VZCar8q3hDTPI4cX8Qw/5GrO7TA8Fp63Tq5cZHVi7ZsPJvdwioTo/pwZb
	 LCFsm3faf3GVENwKbLt7AmjIojYTfLFsu7DTN9HaKhouUhtRLTfJpJ4isNIUthj49Rms+
	 AmHkwhv7JdFl1yPBHy7VyXLOaZ15iBLUaPCYOohtISbm3x5rTW2l9gjQyzsfgJAv1Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Cg/JXG0d";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="K8jH/Ecx";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C998606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:47:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C998606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cg/JXG0d;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K8jH/Ecx
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KI7N4f3460915
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:47:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bFtglml+hC8
	hn1WGCAIjH4C7EGvJhD/mYi/y0qfEDH0=; b=Cg/JXG0d0wGJqusJYFtJJwctqc8
	VBbPhdK7OVglHXm2tbw/wNHLa9K2k1B/NtDJ8q6rSzK4H4+fMCaLTTyWU64kQ7QJ
	0h30pNGE1mSaCu21SasAQ8KGr47+6OGsf6d8QH+oTHc58BB+zTXvWeUJNLgQmXkw
	bFXcSbGcfFITPUVBTJwa6WohXlYiqIFpnmEAdXJuXeIhO8FtYDFB0SdOUE+TuWI1
	9uaPpM+MmVrtybimn0ZwR1xSL+BcMQUYt2efj0/vtJIjaF6S1gQR8gj89LORE1nG
	hfUqfVGcaASQzgN8z2LYrjjSgxe66ajvob3w1wXK06RnGzu03zzOgVv95ZQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4rh9u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:47:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d02df2bf09so53335ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792529269; x=1793134069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bFtglml+hC8hn1WGCAIjH4C7EGvJhD/mYi/y0qfEDH0=;
        b=K8jH/EcxgWeJTD/xdoTwSRX9jfK65eiWlkNoHt9zgAkW0/9RWriYkjvLv9/Arccpzr
         Bb/IOqV6zkefYvv873OOvGvh6Wk5L/oWleXwpyQ1b/KxMfrU/4zYLEWSIeLiT0jMCEtR
         KTDmDM95iZImY1Kp9XqwqEg2Eqffg7RlC8FCGPPebMVwqXYfUIO4Vh2El9trA4bOytqc
         ABxnc2mTd0zY9kTv99dkJPJVOULbcc9OGrgBGgStVspVxSx85KvQUo2fqXWRmImUiJLM
         hyyh3sLawynJjnuTlBhzxqWoWICeIOY/kf9Bfwy+AEKVu+vmTtbb5Z6ZxdoLl7AcBTRg
         xW1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792529269; x=1793134069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bFtglml+hC8hn1WGCAIjH4C7EGvJhD/mYi/y0qfEDH0=;
        b=EKY38CwAwle+J+BAd05zRCmAxOOaZCt2nRykSm349g6bUEVO4ha6TA8+3HSSfQu7pc
         QXD2TlmIsQ5SOONUKgNRAM8dBaoc+/RIofoGCEF2MmcUndkeMGJlkUNFLxNryrzQdYe/
         7L/nDaZLbxMavEhgVaWliZ0y920ED4iga3GInpo8MPEL2qbT0Rnei3+0L1uTmI4v+nj2
         ruCYc6aAQF/24eAzGMJbUyz4PaUqvQ1Ryv3kNr+OtSKLIifyY9ohgoTEpjWgOki1A9zQ
         /FuMlSFOjfpymtErON6jq1TUwtnfcppl6qyJxeajAhp5KmWYAF8sIvRtP1ntlT1WNfRa
         CDqQ==
X-Forwarded-Encrypted: i=1; AKwUvBydcqlaZoSugSWkvWaFP9bm5tFVgZvHH/Aj+mUV3TyIqIKEfMZNq6fCaUNRV2/0nSmKOUxIW8tnN5FQPeM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKW23h+0QkqpiTsTEPZGywlJfXU5oTL65/WCOo2WSy3NKexVv7o
	6RVbyTDC4//PDqQuQHuz3qIIXVLys3ipcqtRzyLtnOefAafCQ7NLbIeaGR1ekLF/xJnZUc+Eh+0
	WRCx+4wAWLE8VxoRFGlc9Vd0t5LkG4bMj5CCqH4eyH9IkoPGjRB2xIB2+1POgyKwTvfQ=
X-Gm-Gg: AYBFou2iOjDMeZlxDR+GEUNjHV1HfJY1yG4sTH1G4Gcys8RcyfTlyug1a99VwRDYwO7
	5QgtVbhKUXErbjJy14DWJ1LEAP6NG/JyZyyB7HLTEkCZeJW0t5jRndeVBzxxVRVN7ZRsa3qGDPy
	/B0mho1+PmKfsiu/RT5cmIB/JI8r4X3UtRLZFjgS/Utd1DF1P8fL77pcLCf/g0meP/OVODlqNr+
	JREm2F8WkLWg5xHJvudrA28HS3UiPRSySnSgv8Xz8zqAInJzgh5GVTToYiiZqEQyWh1DXN7DPX1
	vXk34Lu2uUW8Y8MW7uHWUIysiDSPY0WMGr4xWlbn8wp3xG4++LvtPOXoESAkrJT7rfNonPSZbd1
	o9VjveMbxW27mvLw1pQ4OvQZD5nuCcqrMv4/jhomoVEvBzY2xFg==
X-Received: by 2002:a17:902:ce11:b0:2e2:e24e:a88a with SMTP id d9443c01a7336-2e9a68d91bfmr94432615ad.22.1792529269060;
        Tue, 20 Oct 2026 13:47:49 -0700 (PDT)
X-Received: by 2002:a17:902:ce11:b0:2e2:e24e:a88a with SMTP id d9443c01a7336-2e9a68d91bfmr94432505ad.22.1792529268651;
        Tue, 20 Oct 2026 13:47:48 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b434e67sm3125145ad.27.2026.10.20.13.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 13:47:48 -0700 (PDT)
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
Subject: [PATCH 02/12] drm/msm/a8xx: Export aperture helpers
Date: Tue, 20 Oct 2026 13:46:16 -0700
Message-ID: <20261020204728.28844-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020204728.28844-1-robin.clark@oss.qualcomm.com>
References: <20261020204728.28844-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: ZG_IcIZeS0BlXOcd4eKUrBfCxGyjjSKn
X-Proofpoint-GUID: ZG_IcIZeS0BlXOcd4eKUrBfCxGyjjSKn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA4MiBTYWx0ZWRfX0z8k+toCsVrh
 JI7iaePTQPiAURG9tJJaJzK1URKUV/u7rWKo4Gl67X9eg/5qgT9Yydd2P666dKJTvKYbLN3hbJf
 M2N5kUj/GcGweW1+LtwbzK4f/p09rHY=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad7d375 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=58qa3DtRz-ucCGMA3goA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA4MiBTYWx0ZWRfX2q7Qek8OQyuQ
 7aA9ITs+twQsftyRYe8ZLsnFOJ4oiOqdb5EgBP3IrRl1uBs9R4pDOMQI7++WhN4FPKC48QjQcTV
 XNUL6BDIaTkYwUNf9oo6Kl8vj79jjFjsxxz497YTPN3hbj0Arr1cGMRuloHQcsRAxDC/sM01YL+
 6fF1gtUfq8tHENgybSBSZpTdjnku+9JKAUkNgpuLPP6A8LR5ARwIukzl62k30As0d7GvsuyLQPC
 gNP+7LY3NlRNpeSke1PPqCz4DvzC4tYAddMgI000ubTZ1EN/cA+UxrbHYTnJ1iKUW+VNXW4qvSY
 p5rPB3yjW4J9jj1xx1orbZGBBr5QKFxn66b+9UlqPPXYUu5r4eRTjCxc8VNAsLY6u06vS066MUU
 wNRRwNFR8E9asmPtQRG7KxZfKcQb7OnQj6v2OjfbwJihBO8Pekqa2JdEzVxlzA5M1mrjCf/5Tps
 9wX+l5qMnuo4FVO2LAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200082

We'll need these from gen8 gpu state snapshot code as well.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 3 +++
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 6 +++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 81d21acccea1..fb000b79fe2f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -348,6 +348,9 @@ void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 void a6xx_flush_yield(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 int a6xx_zap_shader_init(struct msm_gpu *gpu);
 
+void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags);
+void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags);
+void a8xx_aperture_clear(struct msm_gpu *gpu);
 void a8xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_off);
 int a8xx_fault_handler(void *arg, unsigned long iova, int flags, void *data);
 void a8xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index e7d04c865968..a14379e26fbe 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -32,7 +32,7 @@ static void a8xx_aperture_slice_set(struct msm_gpu *gpu, enum adreno_pipe pipe,
 	a6xx_gpu->cached_aperture = val;
 }
 
-static void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags)
+void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
@@ -42,7 +42,7 @@ static void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, un
 	a8xx_aperture_slice_set(gpu, pipe, 0);
 }
 
-static void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags)
+void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
@@ -50,7 +50,7 @@ static void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags)
 	spin_unlock_irqrestore(&a6xx_gpu->aperture_lock, flags);
 }
 
-static void a8xx_aperture_clear(struct msm_gpu *gpu)
+void a8xx_aperture_clear(struct msm_gpu *gpu)
 {
 	unsigned long flags;
 
-- 
2.56.0

