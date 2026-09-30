Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB7447140E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790775420; cv=none; b=a1Etm3PElc37DNw/NVp9QIMaxAbpTORx5roQyfUTJjT4mXal4E5mzpkq9XHKU9vDyw25XuMg91x8E6OW/Fj4/TXecrj5xkRZfD1slRD0zH0B7cppH80YY4zzcAZS1WL3MYh9TxKVbFgm7PdccYur4jBovAQBJmQxyVs9oeqt1zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790775420; c=relaxed/simple;
	bh=mrFjQ87puxCi5QNDllM5X4hiL/QtD1aLbA5Sw9zYT6U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NKvVzYKEPo6Vo60Lmsx3+I6NeYeiaGL3lLKZhCjfxlm5MwZr2KOmlbYYJW+yp/9AH4IWAye7cCnRFdiuDvXs4VLm8hHHK7n3HUs1sWW6IzYUnIUbwa+ax0a/BhhFK1zhAFV5ENHbiVnbt3MdyiBPfn5ZXa5IOoZLMD3ZyRN8XSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i8XBLEc2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IxdAKx6a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i8XBLEc2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IxdAKx6a"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7pVI3955055
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:36:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y3X1MILjhoW+3ywmS2mPHQTbGl5p98m6OBcUF1sWG8A=; b=i8XBLEc2/b8vgxpY
	dL3748515rFdGah/cHbYi9fKWCYvWjSyTUlpkAk5H8wddH3tBtKvLKYe+mHbry5k
	/u6md2pdyfgCloXokgKES6JLPpzPsMTj1Uhb/zMa/+ZfQWDxHRIeIAB/KJS9EJxQ
	sIvTuT006NyyDWcRdfG5KB5iravEmlhXL4qLI8md8BeHIksCpSEs5hv21WkZdOOd
	1HBHepQ601tsoklt1xyI3Sy3UfCikU9+Xvf+4WpI70gEwL/LMunIxCBvcDtvKhkk
	uonn3YQH8c8iqJDKOxWDFoLDpYJE5NoPAKQt3rQ6nG2DlEGTRrnuhQUjsMbNEXqS
	04evgg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0j97vk5h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:36:52 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7be35e6911dso341392137.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790775411; x=1791380211; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y3X1MILjhoW+3ywmS2mPHQTbGl5p98m6OBcUF1sWG8A=;
        b=IxdAKx6ajwfUKijzu2+EaSXXi+rOfhHsH8vW/VRtISfN1MJ4gJpp/gEyPKQcysafeL
         gPAhtz2GKCZC2BfulX94mopxgL3Og2UNCPWo/Z3DSfFu7fU8L4oE4miGC1Nfv7V292aT
         3yArHm2ZgOogxn7c6QHHIAVpVDIEYEb8HXGoVOdPopxFE6fXfkCF0+HTnNweJwHI7TuU
         lKe0DOIH9IbsKDFTju6ViNqHRg/tECad1DjQrFFqJL1VFUauarWOLFKfKLR5Oy9nH9Fx
         KXVfEWDkOwdaW3YkceKe1/TNeLTa78Cf4ShBIvcp9x/S6TPtWfzsv4EoqCzayInVrN7k
         Gtfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790775411; x=1791380211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y3X1MILjhoW+3ywmS2mPHQTbGl5p98m6OBcUF1sWG8A=;
        b=b9rOEgCWgOwXIZc8lyHDPB8UVn1DSvXkbzftbGusmEGwzPDsh4zOhtQ/fQHBLJRIoC
         AdDmRhM7snFSKYTXq3/gm1XsLjxE8szwuPUVuQTuUNJ9lrlui4C0djeu006F8lSHCEBZ
         1mWprsQLOaGIklr4qH93hcbjtu6FrfkBYp3210AeOVp7/EDTWfSpzo1IojoELbdnYt0r
         J83ghOavv7l5EATbpXagyUlwebpdom83JeOd+jlfrDrYNBQKiU2n5YBdfkg++WQl4Bna
         TxG+rKdmxiBleCFmRq8ChW9qrBUCjG/lqoUPgb9GyKxyZiD7aRZDrAaPVlgVB/Nc0T4p
         Nucg==
X-Forwarded-Encrypted: i=1; AKwUvBxOjz8skw8ZWipeatTzczVdx/x54B5bxwviby1hLxBKeDMXG7UyixHToj5aKg2R/9fONz8XMQh/ckI7WJg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7kABK0459BP2dn4eCzJOxxMWcAUzXKunuHp41AbZ7lxmjs5dV
	sRqfKF0n6oXD+rry/F56Ktu+v0HSwTFz96lz8qZE1fnDNDAp9rYxcpUaPdS9Vu3p3S+E5PGqogS
	xkqwqzLGKWSMDoa0I4IgO0QyXskYIWxAS0aKVN4RNv4a5u6zIWCuSuJQBCpo42Wjxmog=
X-Gm-Gg: AYBFou0NyctfhD79lDzb1mGpGUW4a89LPpM3Jf26/UPPKZaA6Hz7mPfGuRd60IPuT5q
	DckQt/cXLpVRWcmb8kxu76yFssyaKtajEq2EcD1DxyXJ+lVBIAIEvpQ8/zbR+cxxi+t0COsAbyY
	l0tTHxSrIzujosok+yv3RExcwoPeqXjgMPU5w6wpGlj6t8K+FjaT6Y/ACMb4evYoiUjKL731MvT
	ydPokU5lTJQ41Lwhnl9gF1/GVD/1tHTq2WC3oRxxw5XqMdaVEjvoD1QxfcxWpzfglDZftfHMSgH
	vMC7ZFMlH2ukLMmaCJND+cp2/V9FoLq8DuOEiRHPYW0ubnG5B6m8zcQQx9NJ006BjllIwhN3Ij7
	8Z8/oGQkRWQz+VWk4vB3DJ1Q2ZEHX6DWm1HzyEZpTWsMbEMUot2WJ38do+MBZrEdxByKuNJZBxB
	gPGjxjYngVKXBa
X-Received: by 2002:a05:6102:5cc5:b0:7bd:3530:d84b with SMTP id ada2fe7eead31-7be72eab133mr311281137.6.1790775411450;
        Wed, 30 Sep 2026 06:36:51 -0700 (PDT)
X-Received: by 2002:a05:6102:5cc5:b0:7bd:3530:d84b with SMTP id ada2fe7eead31-7be72eab133mr311260137.6.1790775410985;
        Wed, 30 Sep 2026 06:36:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba3fbfb582sm356731e87.57.2026.09.30.06.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 06:36:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 16:36:46 +0300
Subject: [PATCH v2 1/3] drm/msm/a2xx: Add hangcheck progress detection
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-adreno-progress-v2-1-3882f0fcd7b4@oss.qualcomm.com>
References: <20260930-adreno-progress-v2-0-3882f0fcd7b4@oss.qualcomm.com>
In-Reply-To: <20260930-adreno-progress-v2-0-3882f0fcd7b4@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1881;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mrFjQ87puxCi5QNDllM5X4hiL/QtD1aLbA5Sw9zYT6U=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9ZegfyTlZ0V0rWWbSecV00/uM+v9vzyz7FCW1a8kvkmZ
 1gzW1awk9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQATydzMwbCppF79p1PbBtXn
 pivEHx5knZbsv7/PQiXT88Fi+U1Bibt9ZIQybk5UFG47f9Lb6Z/+z1M/VzZlHtQKfumV0VuSJ1J
 6t39x8DozfavjbY4vP1l7Sgf2yorm12W5rZiyqPp/Gfsnkc0XMhv1p3C9sSwUenY8dc32nQUV/8
 Mr1x/K1V43PcdRQzMlzmhyy9YnwY3yDi3haQ8u9vZYsu69uffxifh9PF9WqjOsn3qw3DEy7Mz7k
 v/ZzMGfNT5FvIgTyYupYJNjn/m0NnuZzLGUNsGwjCCZRUFNleJVs8+tEp515s07dulC/5AjtpYr
 XH+UtDRXzrj3yaVtQeXyO46clSVns228Ngrl3I/fOV0KAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 38g_oTDlaF2TMXBqYs3jjFK--A-L-S-T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1NCBTYWx0ZWRfX8FVsE+JC2aEQ
 k7kjBNUTmFPb+vPEH94qxgCci254qOGJDyzwI2JxTGMb5J5/4yN5V/MViD6gGv58EONaiD3tvgK
 kRvNHx/k7Oae3ma9fTEKJLk90B0wDrDL8LFspYXhZ+RaeX++s5R2bNsua5zfkkWzEwWSpbso1zc
 lP6F4qdBA75SjN03f8jI1d7TknsWtQcdGl3GjJYWWCSjfk75c1HfafCQjqPHHiqXv1sjTGA7n6Z
 ryW0IP4JD0NamlXVHvOnqbEPqx8woKdTItwktuAy9l7b7al6dXrOpM/7V3OhT3uMP92l2u4sEhH
 c146jZ4NaOT2ALp+gAhi+DZUsNPeJc2QBPW6DI+8aPsu7uhKxpViMlBqzQrW3VqUNw2Ch2IMH8B
 oTcPuZTJTM+IiT0OM69vbXS66nUQo856KfiTrgvocVXOCfs84XbBt+Zi0eLIJ9ZbLudBfJh4MSI
 gBPcuMqKNgLeQrMDUCA==
X-Proofpoint-ORIG-GUID: 38g_oTDlaF2TMXBqYs3jjFK--A-L-S-T
X-Authority-Analysis: v=2.4 cv=BPImP1QG c=1 sm=1 tr=0 ts=6abd1074 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=7JSXepjcj89yP10iIeYA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1NCBTYWx0ZWRfX+t52XpLPOoqy
 PMYz+SJow+OQUy8hGJsOPfX8M+eN7JPMfxADtJQfijnm8SvivT+FcEGc9SGIB1a0nEIslhxC95V
 iX890Dd5HUCMz+47RUY0IhIH+unixQw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300054

A2xx has no progress callback, so any submit still running when the
hangcheck timer expires is declared hung, no matter whether the CP is
advancing. A false lockup is particularly expensive here: a2xx recovery
is unreliable, and a second reset shortly after the first one leaves
a2xx_hw_init() failing for good, so everything submitted afterwards
fails as well.

Compare the CP IB1/IB2 base and remaining size between timer
expirations, like a6xx does.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
index df4cded9143f..59d2f1684e6a 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
@@ -489,6 +489,23 @@ static u32 a2xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	return ring->memptrs->rptr;
 }
 
+static bool a2xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
+{
+	struct msm_cp_state cp_state = {
+		.ib1_base = gpu_read(gpu, REG_AXXX_CP_IB1_BASE),
+		.ib2_base = gpu_read(gpu, REG_AXXX_CP_IB2_BASE),
+		.ib1_rem  = gpu_read(gpu, REG_AXXX_CP_IB1_BUFSZ),
+		.ib2_rem  = gpu_read(gpu, REG_AXXX_CP_IB2_BUFSZ),
+	};
+	bool progress;
+
+	progress = !!memcmp(&cp_state, &ring->last_cp_state, sizeof(cp_state));
+
+	ring->last_cp_state = cp_state;
+
+	return progress;
+}
+
 static struct msm_gpu *a2xx_gpu_init(struct drm_device *dev)
 {
 	struct a2xx_gpu *a2xx_gpu = NULL;
@@ -553,6 +570,7 @@ const struct adreno_gpu_funcs a2xx_gpu_funcs = {
 		.gpu_state_put = adreno_gpu_state_put,
 		.create_vm = a2xx_create_vm,
 		.get_rptr = a2xx_get_rptr,
+		.progress = a2xx_progress,
 	},
 	.init = a2xx_gpu_init,
 };

-- 
2.47.3

