Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896933;
	b=f6FgOOf0HUTlymHOG0hhQLCbgSAbCTzQcmVZlTJHfmx7cIjlB/6/3Fa3bVRuhsduNVnu
	 /p3TFL7HPGUgdXCLfL33es4YjTHR0wuq3U0AA6W67B2tiiPYTzh/HeiIq5lPkjjKQylEh
	 emewN5cgsptmvOhaPeOlAKff5HM3VR5EdUO0SiJQ1Hw7SVLoXW03A3Z0ohq9/FmQ2l6su
	 6A2lBjC7vaCdjE4I58ebVWd35+kEzVk9Jd8zETgE/6BHh4hvE8fuhXnPGIBJBmPiZ1x04
	 ktFpJks6EbCwczdSiZGTq4fizC54GTskusoaSVYnZonB89mLJX3YU5Yps9CeVmrRgVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896933;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=i1Q64R4YoBHKvX+mYcDs4C+P4TdP3kbJ/gihntCEHa8=;
	b=ciMLjoiivpbdUNAfuMQtFVvbS9e4uSRHEmRoTP1S6R9VdxmfHGIgMzIqqV278NavEr5r
	 9QnzZ8jiFIGLzDoDlYokhPxmdAf3JmAHGzz98h4+ivZksl6FYJUbHRtKPMpDCYvseXYhA
	 a+Fs84VCkcHQwyvNK4NIDyc4KnHIK/9baVW7jZOYG5nBmZi8G5TvMntS0c1zxTO7vZEnE
	 x1VB0yqhE0FDc+StpqScV3ZS3aLt2l0Cpzc/J3jNvxrawDwmFOgm2r6nhxYhN63DtoXov
	 RkKCXCkXqoJ1t6f6tfyp5wJ45p6H7j7Q4RT7CnyFWV0JGagI2GIiiA1edNK1OR9e4xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BJaMlyrx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FygrYuT4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B93606A901
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:42:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8B93606A901
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BJaMlyrx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FygrYuT4
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQGba2004514
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 16:42:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=i1Q64R4YoBH
	KvX+mYcDs4C+P4TdP3kbJ/gihntCEHa8=; b=BJaMlyrx5UwYstA2cnkcjQb9j+Y
	rbctTCYC3jmToKo+/+gqC+1asUjURUuA+1yOGOh98EnSE4+iW0dFLxT/faLnF80s
	10Tqwdydgq6C+LEZHfUMvGLxERhWUU2/Yaq05tGfOaB+9Qq6D9Hf/j7R4lf2+Bfz
	oi4poDNP8cErX9m0Wy6RYEmHGLCLr3UcKRO2rxZT8a/qe1TVH7rY0LuEGLfBdH2i
	6spgN/mdiya+RaMYFFsM12xJaEFcXrX4iYZxaWwKQbRzSm0NgbTF63bpN6LwApfj
	ZtDwm1B0LCZrk35MjY+XGJPmPyx35CKpjBSjOd7T8CCh2y1rFhx5zFxyRpw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqpd1pxy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 16:42:12 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdae10aebfdso568877a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793896931; x=1794501731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i1Q64R4YoBHKvX+mYcDs4C+P4TdP3kbJ/gihntCEHa8=;
        b=FygrYuT4rS8eQbOATx3pVjH1urTomwWRdY2zGKEhnw6Nmb7BNO0bnWhHW/KXuVn6mB
         4BRwUbPfD9KlpugztcNolFOS8LZunqkWeW1+oh9M4lRfXMvdBpRQwam43I7jtGn7etev
         NdNaFbSjCQHb+HukEeZpRYtcydZbGu9+pFA5/xdTDzzfOR+XXYnQ2DoC1WQdVRF185gZ
         4Kp+lXxXBMoBLiwvuAk3cS7iQkhA5vmkwel8hJJrk/3x+aF6q/qNe8fQev/9GbLNBToa
         VoOzxY9HsP+WTJTCarWSwcW5OqwFUn1qWNiFKqZGGHSe6lBdFYyG1UmAvkrTmrKlr1cT
         3PyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793896931; x=1794501731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i1Q64R4YoBHKvX+mYcDs4C+P4TdP3kbJ/gihntCEHa8=;
        b=l49cIxNnoC+7Cl5ylHJc3Zcmcz+Jo7xfVg2c0LTKIJoAYJKFb+YCkcR4OfbM5tfya1
         abi1TRw53cikNUcP6s+AU5iSwX2gij3+QzwO0J9SQBq/Egb4mxhbtfO40l/m2SvX6rnL
         7WBqhdf07pS8lZwYG/figLNv9Y5zRxQTPhgEdjVqb8vuyFCysVuo07cCM7X/m6mJpi0a
         YfCYC3/2y/XpRh5Oq7AQTzt9/F5/eQxTm6y0s7VePztpeTCkfG/IgSdPTfxTCrJ7Iev6
         qA3SoUeAHJdFFrswOwZFFGSdTbQ9fv5usRHoV7AB4NVtWCfDldgsch9Svqjeb+/R66x8
         X9/A==
X-Forwarded-Encrypted: i=1; AKwUvBzFCZfzYC/15ty5sySAhBNGvTOXeVZoQ89Xtg4MQjeuOUzSwiwq9z+1k2vjrj9ugJNfD0ciiY3gnM1muAk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rOaHNDWubfEyZk1PkpN9nU4UZ/GUsSyx2nXES0VpmURmE4CcP
	sfG6Md5H0SZKij5nzceMoiNWid2qmTGjw4lc1k5vU5e/WnzuUyJ84H4BdJEOAhyKS8qFlRaTN0K
	2I6h3j3TcfwOXrEyUzDGpYc04c6zfILnqgvAZa/e3/Pttjuh4vPQytvLGvbIgegnmzZ4=
X-Gm-Gg: AYBFou1GWA/rq5sOoesJjvwSGgWRlmRjX5MafO6OBOh0T0nCQTkdoAXHXMae8Rto9Z5
	FS0m5ujPEGzgVIH0LoSzylXx6EBHKRkcKYaGnGczPK2OqU+OAOvsF2E49heIIY6dT6flIlskD9t
	h8IS/Ejp1Le923pmSWDhvdDyGm7ubn/x99fs2LvHdZmCU4N3LXT2R/M/Iena4v40DVgx6mCuF8q
	hdwiCvpjv5Bqm6vynuhngcehqJJ2PqtQdaT5OVb13VhHaZJhTX2S89oJQEN92Tw5yRgdvU5zO7p
	rgeAmZLLoiz95RH4MBGqCUfI49+iFZKg/YlFdBpGgzZH2RxhcpqFa6KMZ/puVOTrQB+sr/nGZFU
	MWFpLWKVKCd+XGOoou3B7QJvLFTzOkE7giUW+6HkIUOcc0hbPyKfuGet3OHMNW7uncUOS75Mi2r
	ig3gJ/ykV+kFoiHTwYyPdFwFht9ai3LQwEd53kHwXxTFXCFBpEKoHWKclp2Ptr5A==
X-Received: by 2002:a17:90a:d446:b0:3a8:337d:228a with SMTP id 98e67ed59e1d1-3b0afbf6995mr1859250a91.6.1793896929868;
        Thu, 05 Nov 2026 08:42:09 -0800 (PST)
X-Received: by 2002:a17:90a:d446:b0:3a8:337d:228a with SMTP id 98e67ed59e1d1-3b0afbf6995mr1859212a91.6.1793896929286;
        Thu, 05 Nov 2026 08:42:09 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323cd3csm4447277a91.3.2026.11.05.08.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:42:08 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 4/6] drm/msm: Add cleanup help for disabling IFPC
Date: Thu,  5 Nov 2026 08:41:51 -0800
Message-ID: <20261105164158.23263-5-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2NiBTYWx0ZWRfX635ZveOyQdzD
 qrkPSVWtmKG9OrB+99n3LzIPz4G6vqiuj8L8LiozozOCXbi3vjR+dpuZg8EPtUU5doxb7/ucEk0
 1H6wZfOs1IsGwvQ1cXRaxo1kVxjfRs8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2NiBTYWx0ZWRfXyukFp1jFvWH1
 7TxetiQLj1JxfbDC0y9Yfg1euygHtHQJepVYhXdzL0v1IjwExJk3fPzEfyvSAO72M31tk2Djvlb
 cTdBlVIK3ODzOwciR4Na4hG41zB0HdRLWua/T8VTNRh3EMRWZBNTPToJGhstSn7bd5EQEUlqt7T
 4c5jbaXo74BiYLwY2/kDJ1HmWqzHmZO8lW5WnBe6/w60k4Iz0APBqSfRL9J0Skt71ldOd5lIffm
 tgRvjxAxDJnIJaE7YG7J8OHDJd6PjYGSmNBr7yEGT8RzNE2L3o+/LJs6KKjXqnttaFt6p3QEBoo
 3rg/CO/Xa2MDfiz/uCdOLp9A+QnIKA+Ks3PdOCmoHyFJOwA3Fq2y66oIY9sC8BhPW5xZXV87ZU3
 ha+MyPU4v9AsdN/ZpJHMJA3YBaX4rnacwaq3yeZ4cEhvFKEHa8GiGcwTA/tyqAzpRY3RFexoonY
 CSBP3tIdmECkMvNzJ1w==
X-Proofpoint-ORIG-GUID: vBCt8SPp-y7L2dGdFLyHguKMTvzNR1SG
X-Proofpoint-GUID: vBCt8SPp-y7L2dGdFLyHguKMTvzNR1SG
X-Authority-Analysis: v=2.4 cv=Y5JtIReN c=1 sm=1 tr=0 ts=6aecb1e4 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=vTD2gfctXtM-Q-VHBdUA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050066

Simplify error path cleanup for IFPC-disable critical sections.

Note that this moves where we re-enable IFPC until after the
wake_up_all(), but that is harmless.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gpu.h      | 4 ++++
 drivers/gpu/drm/msm/msm_perfcntr.c | 5 +----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index d1abe0ef3d1d..055b9bffad39 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -405,6 +405,10 @@ msm_gpu_disable_ifpc_put(struct msm_gpu *gpu)
 		gpu->funcs->ifpc_update(gpu);
 }
 
+DEFINE_GUARD(ifpc_disable, struct msm_gpu *,
+	     msm_gpu_disable_ifpc_get(_T),
+	     msm_gpu_disable_ifpc_put(_T))
+
 /*
  * The number of priority levels provided by drm gpu scheduler.  The
  * DRM_SCHED_PRIORITY_KERNEL priority level is treated specially in some
diff --git a/drivers/gpu/drm/msm/msm_perfcntr.c b/drivers/gpu/drm/msm/msm_perfcntr.c
index b1b07212252a..23b967be0323 100644
--- a/drivers/gpu/drm/msm/msm_perfcntr.c
+++ b/drivers/gpu/drm/msm/msm_perfcntr.c
@@ -267,7 +267,7 @@ sample_worker(struct kthread_work *work)
 	}
 
 	/* Inhibit IFPC while accessing registers: */
-	msm_gpu_disable_ifpc_get(gpu);
+	guard(ifpc_disable)(gpu);
 
 	if (gpu->funcs->perfcntr_flush)
 		gpu->funcs->perfcntr_flush(gpu);
@@ -303,9 +303,6 @@ sample_worker(struct kthread_work *work)
 		}
 	}
 
-	/* Re-enable IFPC: */
-	msm_gpu_disable_ifpc_put(gpu);
-
 	smp_store_release(&stream->fifo.head, head);
 	wake_up_all(&stream->poll_wq);
 }
-- 
2.56.0

