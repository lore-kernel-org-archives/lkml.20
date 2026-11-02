Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657069;
	b=EHQm28GLPNjJDzZaJdytx6NHedMTvlgz9nIUCOm1jvSl4jCWbd2xKugXzkcckW3OSmnm
	 wa+du9O2BNtgJjNJAUAqD6ixX3TgVeKcDcTX/UjlWyKM0+f0XAglwHRdbKmt5rU9KMlqy
	 i5b3LUk6I2ab34icYsmWzkcdQ4gXm/1Tkg+A4E6qgIcaYdbq55G1tCdfXbe/KqxusRZ/6
	 ctZmZmaFj6xekP5olJtRyRNqp6vHUMrgfod3T0w24Zm9psA3VPwOKVJbNBWrpVqevlWZK
	 /zTMZgibo7/rkpijgMeNZs56inEhyI/w9CJEtRb4xWsbZuDdvGXW3ygDOF2WsptIobg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657069;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/dQrmyfLIGU6IqlJ99P0Tuit4U9aGRac+caYuZRRsOI=;
	b=FqnqTpl7OT8VUGu7MbAJCOu+ekimLBMisNGFRUS8LOvtFr4XgKe1L77jX8tKCQEsREr8
	 xxfttPh5N+SaAKDd8b8fpS4hnpjJ7xRAehYl0Q4PR/RlrZ+3ewcZvOFCEYMueLnjFbB7h
	 +DO5nPCivhk4EKC/MZKwaSYuOR+Oh63Z8kI5GKrCy9G3KQidGwGy9pyq3vfRMX1ShPbUT
	 TFpgRgba8Ud3MoqvsXnn4leJXJfF3eEbOqoxbowlNm5WjMnIkqMQEx8xFcGpLVFGtxVAA
	 5pSnAMfhQJLgcr4jydzdK3AbWF+8YUnJVyQQhnyw96j5c6+zv+k764I8cThbQefvUyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U2fHYhvc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IH+cQePr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7749F606A334
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:04:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7749F606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U2fHYhvc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IH+cQePr
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K6Ath1696610
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 22:04:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/dQrmyfLIGU
	6IqlJ99P0Tuit4U9aGRac+caYuZRRsOI=; b=U2fHYhvclVNQar4mvs4zZRqghFT
	3GhGctauPZQ9dCu+i9xuGKD4D2V1FgOa3ZwFPFjKMWc1n2x8tIMp0i8qM9zgtNVm
	+isJpKFWcb+FtQ5AUhPm0jQ8XW/ECpVmYNUiWFazbb1PZRaJu0xTtCd8hlOxlHEP
	Jvcc22jslMROjoLM1zm8x8nUnLkXVEvpcP2HZysoFc1XAs8+E4fCu8SQ9+Tpe/88
	0wcWb1wir6BijXUnmzuQz6CJU3cY3EUu3AaU2P7d0fKKz/ZrGZpAtBeZnKNLROa2
	RSQYkk2+On/QqjeNuCTe1JoaQbLMw+lqwRCIWZLs60+46P/3Mc234Q1iF/A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1uxys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 22:04:28 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ade5b3ae97so57610a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793657068; x=1794261868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/dQrmyfLIGU6IqlJ99P0Tuit4U9aGRac+caYuZRRsOI=;
        b=IH+cQePrqgyx9xE/nW0w2N9bEH8DvY63t/2RhefQRQfcoWx610kYuJBlWs73i4k33r
         2dlLXO/kqZV1pZ/8AV9vGoaivogx5IGFAGAUnyvXk3QFbEQ4vHCL/obnKJ2W8EjiD3fw
         XChRnMN1xcGGMeuwn0pnhZGk42L9q/6LSAPVPW91S8YkV8yDM5ZpjGKz7di28Xq8zQ3C
         E/TSeoSjLadhnuUzcpQWYp+olb8XWmnG8xTrNPTIGLt0mvw2Z04OL7GRQ04QHs0kxOwg
         VNMO+/5UyBsPKvGHCxbpk4ajU18wgh7kq0l5TUcA0AJw/YTHQ8AHUkWU7bP4DzRCUlqS
         fVHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793657068; x=1794261868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/dQrmyfLIGU6IqlJ99P0Tuit4U9aGRac+caYuZRRsOI=;
        b=wzl/xOfJP4xrvP1pKKdcsnvx06HRmVfnj1Ek3sXd7NL00wtxUZnJlSz9c/E1tvDjTz
         7qB5W8Qh8AHlXKEmJJXX0g0KggPZlyjEWgZcfK84W82nDSlB6ClvWW7UIgk9iu5xzJ4X
         SyXfIRGBArAhoo+ckpigb03RGTr82qbSFkcsE1w8/fSInrPfggVRpqBRQpnzWjM7hPni
         Qm2zVJ7f2Pr8NeWhJ51DgCxP7CBmG1quWTSWEm6LddkpuAQOmI/GR7qjrELcIofVsnfm
         hq4+kMSHPJlUV3km2C+Ew8dXNVWXFtvngsCeGRH5y/gY3VjbCLcUJKvEsLNbF8prJ2zJ
         0g5Q==
X-Forwarded-Encrypted: i=1; AKwUvByj/zEd9xdUPSItUb97rLE5yPsqHm6DpcmD/nlsaGuY+50uUwNEIvVSnL+F6gi822IcX+Nwd8pdMaISNBE=@vger.kernel.org
X-Gm-Message-State: APuU4Z80Tn7wgnJxJqZrIMSvthzdgL4Lql/YZb4wbk8bUFLXd6h+bw5g
	xTwl5NzPpnClDiZfloflKASvOQHeKYvBHzRlkgptoaENBVsOX/jHQW4PwPnDiB1ik4Nf8hAmyJI
	C/VMD160u9Yp2EMZ56eJ0GOtILGziVcixsw4CsUKZ/kWbc0B+kaIcmGo2q85rSyVauA4=
X-Gm-Gg: AYBFou2zUrcCmzSmTZPbBOkrTbdQjTPl7WkEofvBGd8+eHMeVKpTbHavo+jYLH9TAlN
	shz4XZzi6Q99OAB5B42MUR276gqr9hFftXA8DNzc+hQtINJqulaPAcBxYEShFPqjIHIN2oyYGjz
	lv5cy/UVcQkuiLZG5VXjwfj5dlk5LfRU65BBiCkJf10rCv1ATmml4wTqy+a3h9lFm/z/HxoYsjI
	P90MGmkTsQN5yGyJzHmm/dGUoTWP/zU/lAzHLqrwUOopwxvEx+gx76lROic4REJQ2Mk3sLraALU
	EMhmLfAK4c35+FeASAJTsF13IeodiiDUE/bF80oC5uvj4gfX0GV9u3D3a+m5LWtHqAxqu75kIIr
	/Zn0cMsEikXSZ8Y4sreuNfUPlOoHAESGqrjJz5bMujONQ3KrIAY5gOexEQdpb5kYkzJHoYCpPN8
	OHe4BMzHVMf1QhhXZHySeW0Bs=
X-Received: by 2002:a17:90b:1b0d:b0:3ac:36c7:c144 with SMTP id 98e67ed59e1d1-3ae89776936mr6169542a91.28.1793657068285;
        Mon, 02 Nov 2026 14:04:28 -0800 (PST)
X-Received: by 2002:a17:90b:1b0d:b0:3ac:36c7:c144 with SMTP id 98e67ed59e1d1-3ae89776936mr6169501a91.28.1793657067652;
        Mon, 02 Nov 2026 14:04:27 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6b3493sm1039311a91.13.2026.11.02.14.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:04:27 -0800 (PST)
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
Subject: [PATCH v5 04/15] drm/msm/a8xx: Export slice helper
Date: Mon,  2 Nov 2026 14:02:48 -0800
Message-ID: <20261102220405.30730-5-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: JgbZtYT-JAoZOd-QT9kEsuTZHf3Y4urC
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae908ec cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=eauOX4bcPKZCCnkqRxoA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfX/T2G9Twd5oMV
 tLFRBZh7IEGZEcScDEVDOUpOQJc1vFOsqlB0fFEvEbwqlUParGNagJ1Wv7tQSiDDiRYfhN07+AW
 r4Q0duvyCWnNFEDnKxLbQu+e1qh9qCB8mhwJl5gJmoP48SAXLh1XthpYRmuQyEo3Ks3n+DbLKZi
 1PVsxsg/P7lnid4D59Tl89wYLujIvkBJGXCwpCst4tmPIyjz76yCjwvmh3xXfDhzuDwLCVxgR+h
 kN4onCeoh212D9BdbyDhbq8gei8gsrhpwpy1fGQH6/j/ekyS9R/DpY6R769fflHZ4BDC0MOH3t2
 6S7pWPDSqaTvytc1bfobA9Loc9GwN+9cmVLj71LQRjmNOt9oE9k74TF9jFMcxGlVAqkms1CY2DB
 TSxznXipB4fDtCoscm2oHBIff75DnNQDYPI5g/XhBLPkL8Zcv51XWOLUaak4TBLxl4p9lOK4slB
 a8bn2PUFf0it6hZiSbQ==
X-Proofpoint-GUID: JgbZtYT-JAoZOd-QT9kEsuTZHf3Y4urC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfX6VFzBPHjdtma
 9GY5MA/Ww1Fhr2RGCvdlkRKX0X5xeE30t3+cTdrJJeG7RLt0+fPBfPZk6MMMsQVvIGZDUdWmdJ2
 SFNPLZ7tlI/rzwvEZaQ3+Ile8Gnhg9s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020087

Something we'll need from the gpu snapshot code.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 1 +
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 83c0fe39a44e..f8b9ceb588dd 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -360,6 +360,7 @@ u64 a8xx_gmu_get_timestamp(struct msm_gpu *gpu);
 u64 a8xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate);
 int a8xx_gpu_feature_probe(struct msm_gpu *gpu);
 void a8xx_gpu_get_slice_info(struct msm_gpu *gpu);
+u32 a8xx_get_first_slice(struct a6xx_gpu *a6xx_gpu);
 int a8xx_hw_init(struct msm_gpu *gpu);
 irqreturn_t a8xx_irq(struct msm_gpu *gpu);
 void a8xx_llc_activate(struct a6xx_gpu *a6xx_gpu);
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index f2b635497811..6b299bf1000f 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -127,7 +127,7 @@ void a8xx_gpu_get_slice_info(struct msm_gpu *gpu)
 	}
 }
 
-static u32 a8xx_get_first_slice(struct a6xx_gpu *a6xx_gpu)
+u32 a8xx_get_first_slice(struct a6xx_gpu *a6xx_gpu)
 {
 	return ffs(a6xx_gpu->slice_mask) - 1;
 }
-- 
2.56.0

