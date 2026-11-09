Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234085;
	b=beS0ZjbIk64zGRPuuZ08t/dmbJBJ7lox0SifDm3ZRO2+32v6D2M1Af5G9mRpfOoaH/r1
	 HWq2BcJh8fgsKqxwuYemvWtDsbDCmiKVPvkt9FYE2pPxkdUexZ+R4/ZkQlco5CDl64Pmp
	 xlmGPQEu5k6mTaYxo9Uyn0EzzFvhjcOxxrocpDXyYCZCiylSCeJyhafV/ZsJ6lIPemef2
	 jCvx51IeXhzWVysC3XI36d5hgo4bEvMA6mtHUhkGOElNPjw/JRReanKfAQIRhB7dXkSaI
	 aTGYiGwP3jVnpKCHnG2mUrZcB9o+hwT4s8rHuDtjNwFgV2qI1RoeTf7WpH2JC+0cT3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234085;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mInqVCgb/JpcHAFW5diV2Bd7SIXa0C+12G8PqaKwBHE=;
	b=5p5MjxNeKS+6zpZU5Y7follP8J4Zfsh65ptZ2MlCTWazYwtVk8LvR88/vE2/YdatSOJU
	 qz9nadiKtsS8X+hYKCps/LYGkJ+rO7unCmlNawgHUe916JxzfwLG4fGLVCitT2zgTJOUo
	 ZUuBUb/+2nUS5in1psAVdkFxBOveEGbFIzkcHsdSXmZSlKqcYQDARkCOSD2YIm99T1exJ
	 liePAsd8NDOfOHI/HhHUdV8QNSCo53F1vOcuC53XaVfVVPPxWmd20LLgSHM63uBUkZ3sj
	 Sj0/DmcdlDIUodXdXhYlpitSXCJ8Ozj+eeiNnxxF+GQKO8JehJZwmgM6TlYnEk7U+nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fgtp3d9l;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="kBzm/XPO";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFED606D813
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:21:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCFED606D813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fgtp3d9l;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kBzm/XPO
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFBW6337300
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 14:21:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mInqVCgb/Jp
	cHAFW5diV2Bd7SIXa0C+12G8PqaKwBHE=; b=fgtp3d9lwCGuLASp5DoT/o+Kcu1
	7KYMVdswK/M0LVXz8gW5lY9VoWVHxZziIAAM5EKHOjaephhahcL7mNyRS8NbGnf3
	hDsngt/6ABEmpp+9W5B0xvYagwA9wEJLvzfCNFin3YNpkMKvD/HJA8pjjnZyNF/7
	15yJxhbSv0H0jEdIWB0gCmGjny9OmSzE9dm1udddVo5Y7YUhC0yinIPCX1H3UhC7
	+v7ViUuPI8L4oolR/HIUoJP09/6lJkyso+mCJRsEmbcKuSzwcUOwfRYHVSzfhvqD
	Au41fBplpTZdjmwmlu0LKTmzBTwn/rYimT7/o+jOkxQ13pV2G/AnF5DJfjQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucr5rp1u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 14:21:24 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdd77f53db5so425457a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794234083; x=1794838883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mInqVCgb/JpcHAFW5diV2Bd7SIXa0C+12G8PqaKwBHE=;
        b=kBzm/XPOYTrDo/+PMFPG/IrH3yfadwv9FxVJVzvnSqJ9VVBSp5Ee3eMLTD7zi4mNs1
         X5o2UOjhQ+T9pWZDPWqaDKQrWBiRimBigLDx+Zd69uQUIQWpI3ynacZPaGGGUs10FxNf
         Z3+Daqk5C9hFisJE7v94z1jIEEvZNPikcF5xBBl1LmsZvRAwUuz3g0NLtiS/4nkl6plk
         ibNlj1Cs6d3DMJ01BDBaOUx8Tyv9Bm7LCBJ1tzoXJBwLkzf9IUzO1FTGWwlotrEobUCb
         +9E/ZRPsjhaVQBr4fY4CvfoacPwKYFmVlt0Y+ABU/ajPEddzoGCdTFcGImA3YEw0BOZX
         nSVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234083; x=1794838883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mInqVCgb/JpcHAFW5diV2Bd7SIXa0C+12G8PqaKwBHE=;
        b=USSW397vjlExjUYdncBWxqvQM86hKinGnURqXk8V35BU/taZGlmhHNsNdUDRTjVsoq
         iqQa5qvYd6ahofaB8lmTbR9WL8uaKIsu6dxfOYDXOd4uunNuyqck1dznq7lVw7l/8ekH
         dt9WjhjFa0syboqQiOD3a+aNcBmQaG22dslcB5ZdVPyIu2HaZX/px/AZFTPrV34iNOwt
         mZOL3LQUy8BV17J6INi5uQysU5hUsCtGCMZmu5gxKYRhEzJdw6LTo+MSPkK0/VFy6rUu
         437nYddD5SadYIzO4WAK1UC2zjbwmNbDIA4lKy9EdY/6+QVgTGoDlR9ebBcb+1i1mxy6
         Nq7A==
X-Forwarded-Encrypted: i=1; AL+hErF54bA0vaITh9pg09sLLfwYsXdxhOyhRItgYHs75QQOrgh49aWJCiG0X0o/Gp22uVIeTDzKlSUn+Kp0tjk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/h7sDwuQCS7o0IIHuCI6LOc/6hvQVC4RGCpMvZIdl4T3V4c22b
	iixHPlATdyqYjCCYAxcdi6qaFBHNHjInVcF0O11aYY2f3u+OtIlMm/As4FQxPUHjoKnlShaNAV6
	glNOw1duypqhlluKbucH2VVg0DHCx32DgMK143CU3E5C61xyeXIrnvK3STzINkGh86mI=
X-Gm-Gg: AYBFou149SXCefzaI+qpmFe5rLnxsSskJZlfid6ElYBfEenybN5DPfTbzhtGmouHf0J
	iRcpbXZ/860PWsPoNF+/gKUsVZ64CTE60yQjubmPXzvnYeEyCPvvkb0ocF3LHchiI3GSDA6V6Qo
	XHrpxuQYtdZdt55L4NgIs1EKeSB4k5OS8gulU/L33xZSEQrLe8BFZW9UI8B89tva2Sc+EjAmKpz
	FZF/zdhyC6pNgd8D9pfAt7ZqACHQsRp2mF4fLSB8LDAK/vKUAsUX4DOEoAoScogInmh8GUTn+tz
	+GRgFT7Kiq3znnNKiUujQaE5O+kKHiQJK5gRNXIfTafON9p+VlpH22vyx7KoOxn7Xg+43aXQ+HS
	ftuUOUy+e4u1vKzQrNe3qsJby3HWP9WAFZccM0EBOiCgXHtztfIPIWdnUbAv+t/MbK1dQycj1U1
	4ojLuoSUdAs5K75PNPeaCmbA30SJ0eyDcmq6BKjfSY5yLJa7fkiZQNyWhBeg8i
X-Received: by 2002:a17:90b:53cf:b0:3b0:a9de:9880 with SMTP id 98e67ed59e1d1-3b12d4fbc05mr3538004a91.33.1794234083407;
        Mon, 09 Nov 2026 06:21:23 -0800 (PST)
X-Received: by 2002:a17:90b:53cf:b0:3b0:a9de:9880 with SMTP id 98e67ed59e1d1-3b12d4fbc05mr3537978a91.33.1794234082926;
        Mon, 09 Nov 2026 06:21:22 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b127712abcsm7260861a91.1.2026.11.09.06.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:21:22 -0800 (PST)
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
Subject: [PATCH v8 03/15] drm/msm/a8xx: Add a8xx_aperture_acquire_raw()
Date: Mon,  9 Nov 2026 06:19:49 -0800
Message-ID: <20261109142111.256630-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109142111.256630-1-robin.clark@oss.qualcomm.com>
References: <20261109142111.256630-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfX7GickkhGtUsT
 L+LEfwFZ1mkl/t7TdmXLFmDEYV8GaAPfa3myMcMXKdJnHAKLsMcs6TE2SjmXloGBWn31d6ynx/R
 V/2tQF6gQNuHx9vuu43cTGoHb+Nc8zQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfX+jgQcTjYE6I3
 dXCsySmyfWfmmI8t6Rwd6E5cqEDN/oS6ip7QqSU1pGopmbPm+NfDz7DMUd1bERjVif5hSuS7dTD
 Svu7K0RnMqXrCScR8OHtoQsm3C8mYVNfinrck5XQF1tUePNv+LBeBLmnVSUZovLyGgXokyf7iHR
 tGAvOf1+JXLq89VuFK2c3UCDLXlrxPjMvSl3dM+S/xUYRADALPuAUsfMoJ67pPzyEv/3GQGiv0G
 IENHN2NxR0RrAJuGuT8HeixD91fO6rOO5R62PGpyzfEXvacQe1bKk1xgXLCtGY71dzNDaTPHI/I
 aJgpDVXGXr1XEYdvbSwMTkWskwQ3wWJacHpoY1pXkRKRa/bE82DbDZG6qoEUxd3QtJPS/D9mkWv
 7QuE+N97PbVVG0r25YIj5xBU+2btZjuv8sMHIG+Am0/UDd8HoRPJg+PVWvpFszJrVG+gFQtV8TW
 aitzrVQZhKlGj3haMXQ==
X-Authority-Analysis: v=2.4 cv=ErlHPicA c=1 sm=1 tr=0 ts=6af1d6e4 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=qGl0e74_xy6xiHm5yPkA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: Khks27MCpDzD_K8z6nvjY4SK0vHlWwuz
X-Proofpoint-GUID: Khks27MCpDzD_K8z6nvjY4SK0vHlWwuz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090057

The snapshot code will need more control, setting additional bitfields.
Rather than add a list of additional args, add a helper to acquire the
aperture which directly takes a reg value.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
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

