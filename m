Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234084;
	b=r8aCuZr109efgPEi5EMujK/pHcqj7d6fd+MsD/lwmkGRfC/YPYzhV9X6byDKruL8gQoG
	 /t7Z9YPvAFNcdM635zgvz9Ai/LTUFnlZUgSg2B+YevqeiRH0HPBnSZmX3wDlvKhwW2equ
	 Pyo1h5qrin4pPYdddRega4zsoYhNeVS642McCMqPLvQaP2VwtLotfQfa7+6nE8oUn8MhU
	 aP9kPc9PSJIV6zWvIl/Rsnwdo7mxNb5W3ZY3CKCC/VEqegPalfTnd//DsKq6eDAnGnDkV
	 6VLb9PaBj4lOee210oyoriHSrgLiTmlNDpesLJVtEof2tBk/Uv9NDIPcgb0ly8HWJeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234084;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=UkojfpaA9ZyAFiSTVcPjf36KuXa9Qn7YPnWuS93EhrM=;
	b=lk5CBWz6SgmUuGEYbQA5jJj3ii14SlgXCdxCIVQLuIDTmANWKtaRKRD+GCFtMpf0oGBQ
	 4NLti4suvE+WwFtbFPb/JgotvFUAmolGJWPLQQ7cgNI2wJKE2kQ6o99VjWbLmoxY6vv99
	 0UdJ5QZCNcSBixRt4L67NpZLS/i6q3xnB1vvShTO8XpCx8oKkN1jK3JPd7zZmamDuuBJr
	 fx4qtiVFzj5hM8sPqqlnbDRNK+MdZFGpZFsLHrFSppTX3qsI/uIrbaIiOcnZauCiLKan9
	 vUXzi1lAMEvyyFCCUvok1Y3NunyPsncCVdvYMSE5zVRd3+ToFQHNgmC4gB2vgNr7SSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vu51Ux2+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PAps2IXT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD49606D805
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:21:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BD49606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vu51Ux2+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PAps2IXT
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DF96O359237
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 14:21:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UkojfpaA9Zy
	AFiSTVcPjf36KuXa9Qn7YPnWuS93EhrM=; b=Vu51Ux2+uDtwzBI7/p2hX9bsCg4
	v2zieU8iVdowAYsmoDUbFQQYMIVn67ifdcF/hTUerCCxz0wMuBx1pXGtOo9UaC4O
	0FL+QnuBCCIAAOA839qVRQ7yGWKVMty/VnqB3Kugk+qE7uysfLLUIon8XFQfARY2
	ae75GpWpIKURNhO/etQ8q0Lv8xkvHUx1HcmCrPgcLsQfjB5ja9MDY9W4uxCc2QJy
	m+N7F6jyHtRm+8QMLIr+PD5OJuu7Syvz76vfPdaYZMo6USl66PUPHlKHtNabqqHr
	08M9mXut6IoljmxJcdCaZU6oK2WBJE6PCw1WAvzLsenhjkqIyZirjtQlBTg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hu6x2j1aa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 14:21:23 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e9d52f684fso9967085ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794234082; x=1794838882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UkojfpaA9ZyAFiSTVcPjf36KuXa9Qn7YPnWuS93EhrM=;
        b=PAps2IXTMw8wAXFEQYimgAullHXaWbUISTqUPAjCsTKPq2IhNDqvmc45H62574xH4z
         prGfJBK8wbGYUKCy81c5R61XmBsQtjiyHiYe9uiaXFxTS4qlLYRcgaGFnyfQbvlXemWD
         A0Z85RNW/2Vj60N68mAcx9um3jMehgt5KS5hLdBrSBtT2MYbW/e2LVnz0CI8aWJhYfhO
         3G6rtK3SxSYNoQDqobzQpa4u8SSEP84wORLF7+8fy1O2RItGe8v9vuSDxC7JONQRy6hJ
         XH70lHn58XJjqj9becaGOTmnyxICdZy8txll7urPH7BXKuRO8aV9rytcmWh2Pl7D40jx
         L+Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234082; x=1794838882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UkojfpaA9ZyAFiSTVcPjf36KuXa9Qn7YPnWuS93EhrM=;
        b=aux/Rel+aQkQiftz9ezpc7xvTA7wTcgjduu7rkWYOs92f5ozLTW+4HhVZTRROLy4Xz
         642Rormj1fPDvnRu9Isw2guLZEBEUMTUsKvCMzYlE42i6dy6r5/tAZxjSBJU4j2/c/h2
         krCZEyyQyI7ORhXktIQQHdeT2TbW8EwYWs+MGa97q18OinJOyL55s/3k5eWhUS/HHHRJ
         QZUjZCYjhG2SwR3/lp2KyXbgGXF61PWtw/QBgoPJQf+x43y7OlZoDbphaLGPmCZQsx8q
         S0uNttGc8frKvABs2FcKmkZnDyQmHaBZvNRdJ5W05jyn7gqWnBkLragQkObh7Yh5aVhQ
         Q9vQ==
X-Forwarded-Encrypted: i=1; AL+hErFklUUHOnZ0qWpEd75kl/v8ponTnZYlfD/dgdsZYUIaTDeTWjElMWXbnlhf3v0rOgEddU3a1BUd2msrw6c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xop4+qE3H76RMsZrU4JSDrEIl7SGjvciPtF+ob78GUQOEdsop
	PVFnC1Uij7bjSc4PgYSOof+ZhNZZ1rpljzrJk+GctedNBkcE6XxO1nnE1o3liw+DtUjPsUzkwFh
	0r1h5fuMT8M9jWJbQsHO7VvlUOcBR22zwex1tjKXKMTMBI9x4jgGn1S3wQt1ETCOUAzM=
X-Gm-Gg: AYBFou1rjY4/e9Xxe38XFo0TQYvDKAi6tafn55SpmAXxNJbeXpboS/ukgeLeyb2l5dB
	nRtfmCsSo02ZQW8Q8DUij/ptNa2NqfLJ/sdNzkjInAcuUDdzqcRL2S+4tEBclwGoz1ipf9MiCuv
	RVCzL9I40eDatbU9e41DffBwfVpWHngNMiL+b1aq7l/YOXmRZ5HJu/v8NvagSG+i00+z8e98oKD
	Ljc9mbJuR00spI1SVr53NgDIuiJumJOwvUjlxFV8vXxYkETDsZpsune2muRkGx/4NN2ckcXDewC
	HXWHNn1LofNMKpejO0G85dQKF2e8CjfT6hzv7oHstGJuwQfRb66sPbX9i24SBhqqYxC8Y6dv8bO
	MoKMILtajITWMvfzoudS9o/6jiolPEiuLJyqnhzUSRSjnOadM5KfkWIYcjpBhTinjrw1rsjZptM
	vJyYOQ1Iu/VzXsI8xCEXY1YUVtbAOXRXa49nkzwxSBTGQCANpYZLTKFUKEqY/T/g==
X-Received: by 2002:a17:903:1107:b0:2ed:74a:6724 with SMTP id d9443c01a7336-2ed83776ebcmr40062235ad.43.1794234082039;
        Mon, 09 Nov 2026 06:21:22 -0800 (PST)
X-Received: by 2002:a17:903:1107:b0:2ed:74a:6724 with SMTP id d9443c01a7336-2ed83776ebcmr40061805ad.43.1794234081551;
        Mon, 09 Nov 2026 06:21:21 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed81711bccsm12019975ad.49.2026.11.09.06.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:21:20 -0800 (PST)
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
Subject: [PATCH v8 02/15] drm/msm/a8xx: Export aperture helpers
Date: Mon,  9 Nov 2026 06:19:48 -0800
Message-ID: <20261109142111.256630-3-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=TMjQ2Fla c=1 sm=1 tr=0 ts=6af1d6e3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=58qa3DtRz-ucCGMA3goA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfX+hv8Gs66Hh0B
 n0vN42onx7NxVdRfs0K6YyRZk6W022cgDwjO/aFaj2Lw8tNYqaSA48qpdRHQgEmB8LyYkoEeBEq
 BUX2cjYsr6oFWzvWmzytqXHCNm2qhngLIHHqxVvvDw9WH+XiCW2v6bwFupSDDzu8ty6RFZ0WTl6
 edkyi5nTskUX0HlhP8828tActwIl7JY+dcue9czHMawwCdJulbGPbIHl+28X4CwbH+6XjS4IwQQ
 qq+lMWYqViTQ9VJ8/mEkGGch0cRMiIxQRcLbqiJNMgjKOOWbgY8A04zr5+6BhdqgjCJ86gET7Gj
 IVhy5gFu4IrmTjbBkB4I2IEWiHiyjo2qOttQCWvCTRU9Osj/x1J77ZESSLK+kX3V3FsbAuqA8Im
 lVT6azRTzjOKlNxHCA9dUuSDcNwcPGF+As/70b3e6ZRi4KLQytKwvh6VcAxM7Ru/JoTO/V5htIn
 N/RhziEkZHb2S4cwDhA==
X-Proofpoint-GUID: Jv-eTuqWm0b2tNHImz1-wxMBm4cFx0hT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfX7cylPo5Gq8Jb
 ENRuolECs1mrHgeToB8BQLt0XJsagYx3uUEVHAHuu/bi3lvLLwbmhiqr2H/hSJJnEVXXCS+NUNc
 UnIEiQJPfHxSIJ5rRFtjBHkvdbXMq2E=
X-Proofpoint-ORIG-GUID: Jv-eTuqWm0b2tNHImz1-wxMBm4cFx0hT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090057

We'll need these from gen8 gpu state snapshot code as well.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 3 +++
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 6 +++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index ab4cb43e4a54..c58a2665e9ab 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -346,6 +346,9 @@ void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 void a6xx_flush_yield(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 int a6xx_zap_shader_init(struct msm_gpu *gpu);
 
+void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags);
+void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags);
+void a8xx_aperture_clear(struct msm_gpu *gpu);
 void a8xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_off);
 int a8xx_fault_handler(void *arg, unsigned long iova, int flags, void *data);
 void a8xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 25ee3ac16ed6..82cddaa7278f 100644
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

