Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792837872;
	b=ambWN/EebSadmT0rNr35y/xpOPre7hEuTHapEoO7zPIu37oSDQgXmV8rk3A2FLfUg/YL
	 tXWs3kst0BB5P5n3KMTNBDFxCQcKCquj5q4O+v96Pb79oyWD2EdoFI4/tHSi3JF3rX7q9
	 So0k64rj5Qz3uugYxpWcJfIxJtvhzg/iz15HQIHeCC9PTJkgIZG50RB1zCgDO1LFuWtIy
	 GjPL9GDl6+w00GCFzvDXUSTv4Qii/KbCMLAAqXGuwSTdR/LPXPrQz0IEjRmYg11R6CiWD
	 uYsFtEncm/2g2AEsjFdHl3AB2W2vVIsWPABZBgFta5HwkQE/EVMed8iCGNbgZ81X6Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792837872;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ecgpGIqf6FUlCAfUyGUDHXzcM3+nvbVKBJYxSLRhqgI=;
	b=eHZ9m7zSMC+75mz6D/c5tZ3joqg7LtVBOWlhVCOWWzwI7YTx4hnVUBgf/yIfTRE5kh3/
	 5k8zBlWcnqdTuCmPKxh+n2S2ZOCDIi0cr1AG09P3vb+i0VbPZluOcrETVo5Kx4n4wX9kP
	 3wbIWEQvZf5QC3utBPBBrrNhHBsjR4pX2lEDbYKMOhX34yiDDi3bi4xkd4a8Bg7Vt01wE
	 1kXYFwcZ4rlUxuPpx8KjJMBuw46YejK9UW9j3Iyn7WrQGBQ3QjZlyrkC0V/KYKLxZ4xC6
	 8Hy0afVVNTSKHDZ+4diT7BwKfSwTch5FKyEs8rObIsOFmsybSWMqHEhVxztppMoMJag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jK3gg1sf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ghfaBNqP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC8B606A324
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 10:31:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FC8B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jK3gg1sf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ghfaBNqP
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69O8oCiV3828105
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 10:31:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ecgpGIqf6FUlCAfUyGUDHXzcM3+nvbVKBJYxSLRhqgI=; b=jK3gg1sf09lSDDAD
	QOiyM+RCjrZF/qXHPMpk+XgYPvB4+MHz6Bd8qKbfqyjA3ltEcVkQloIrY1n/hgPP
	iQfrGD0O0wZXmcIX9+UaMjVyxJpqtC4B32j7HOkm47TFgvl/1o7u+Q8efC7EFK7R
	4z5oXZKyBI3cpxc8Sspfp2hUp/doDtjsvMRuXbyRgQbEKYYJjPwz51kwqlPllf66
	ZP6E9+VubLZiWp42sz5R965tpL3EaSZR2Y5LyxwDF87J2IcWquFA32kmHgwnMZHu
	5mS7VQt5SD/6GvS6OL3VQoTPbkG4Ry5ZDtFTZ0FLovGmCK/gaNwKGP7XMFfTlS0B
	AZCgVw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgnuk8kfb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 10:31:10 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1383723dfddso3009473c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 03:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792837870; x=1793442670; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ecgpGIqf6FUlCAfUyGUDHXzcM3+nvbVKBJYxSLRhqgI=;
        b=ghfaBNqPT0Qi6+RUMf3BHNh1q9ziaeBrYU6BucLSlWgJ2Acn1lP39Wb7qQqAQCbtaq
         TtKEGW+K3CCQPcnd0ffHnqFTB+25Jgz/75uujaDN2hW0wnEJ9yWwXsmu8U4sbnZiyITx
         u6uQjpH6MUNQB8P7wcvmm68GB5NBv9nrXu7QXbRqwjbgtcAmj2lZYaiTARBDIM0px+2p
         MbqmJqsO71doBfqGCdZ6iaKtqQnpQ8caQd+OXKdJ74OzZmqPfaFYYtlaorAWmwu/MCE6
         HBofePDGv5zW+2cDkW/x6nKj5IP2vjljhv0qQUrIICG1Ans0+Fqfx9M3d6uRp9KS84x+
         viNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792837870; x=1793442670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ecgpGIqf6FUlCAfUyGUDHXzcM3+nvbVKBJYxSLRhqgI=;
        b=eWsnsW80TaM0CRiKO4JrC8mXVNrMdOhFLFNLlm+xigj7NePvc4Yc5FnxWWosMSEzDs
         ldf9bYyKuWCVXY5XPqLicUxeVisjAb96iUGoIekgNR3jHiQdr0lo4GfPJdutTVZ2t76c
         Ebbhh+W8s5La0a0S8R7mN7jqmO8klnby9o5d0T1F9J+tfYQsk7rZFKNnlCT+4DqHy58O
         NG7Bex5qY0YlDCin8mFJoK1nHviAWePpZvLBoyD2A/6INTKSClHpqzBghHeWmbJrZ7UB
         Jry+o/4f21Snmf2o5AwOE/ong8oS+Lo+Ua6IpaFdTYmv30lzmiMRwmLaF0G65eFpEP7B
         DpHw==
X-Forwarded-Encrypted: i=1; AKwUvBwJomRuUFDfxkitaBTPXQrrsExsp9JYaRGBSPj+mfc17nhrnoAZB440G/OpSI7TeS03SlKuTNz+yZpuKnU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKe7U1MyLo3n5urOG9U+XdWxw5hGZ4NG70tWht4a4pYjBIpPQ51
	1PVBShpfpU3nphFLZ8VTNFbnRbNySL29F91hhdQiGxb26JZILTmfzWq9I6BBJpFe50RqljO/xkU
	CXcuKl3Lp+rLGe0p/jw7oYAWuyCGDC5of65onH3nNTYrFWM9drxoMUEg6kqzJvq/jWOY=
X-Gm-Gg: AYBFou0Lk0iFZfxEzYHKu48GCYCZoK99LzANPxdTeXPVMANMTgQM7oOhn8x3D76ICji
	4L9QKO+keRtVvjRHAbH9bgXnh6hzbI0HI3LnNvSr7pZ5hL2DLxeBto0lsyHBXB+G3AUni3QFMEk
	ljI4MC4ELiLJEbBye8rbk+w7RY5Bu9pc+V+VBtHpqc/PacsB5iDmwKwYDuu4NigP6Tow/dRkYmx
	cJF8TMsLJqjgKGanUVCrlt5LP54pHC0pPY7gVngRjUxW9AIeLeyEKLXHHaLjqbonx5UEuNG4Q4w
	MIr/LEXaQOEUPgY7mqN+y3waqLC/Y4oszQKY0CSk84cjWynrejc4jG6yAcCSY0r/AP7aXeecmI4
	PwJ2Fy8RRgTi3O9XKMP1gKho=
X-Received: by 2002:a05:7022:e803:b0:16e:4723:5f86 with SMTP id a92af1059eb24-19936a60764mr2616137c88.29.1792837869848;
        Sat, 24 Oct 2026 03:31:09 -0700 (PDT)
X-Received: by 2002:a05:7022:e803:b0:16e:4723:5f86 with SMTP id a92af1059eb24-19936a60764mr2616102c88.29.1792837869307;
        Sat, 24 Oct 2026 03:31:09 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19894d5a10csm6009441c88.1.2026.10.24.03.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 03:31:08 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 16:00:13 +0530
Subject: [PATCH 7/8] drm/msm/a6xx: Request CLX enable from secure world
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-assorted-fixes-oct-v1-7-2977f974ddb7@oss.qualcomm.com>
References: <20261024-assorted-fixes-oct-v1-0-2977f974ddb7@oss.qualcomm.com>
In-Reply-To: <20261024-assorted-fixes-oct-v1-0-2977f974ddb7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Luben Tuikov <ltuikov89@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792837816; l=1301;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=f62WUqPk8JPeePU+Bm0XkICywuM1HT6Ax9xW96mzE4s=;
 b=WscAtm2o3l9CuzM+yZyAhNMO4ROOr682SdqdY3B1OcYV8NsoR7qljmwjsKmFf4kVDrTUY7a01
 LA5ob8zUl7YBrSjAk9PR2k85RLWiddD/HL3Vmz1um9xkdx7xUQEMeTl
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=Z8Z5j3RA c=1 sm=1 tr=0 ts=6adc88ee cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=p4fv3_zKGVfQUpdSR-gA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: sw7K2N5c37LmPrSDb4P5FrKvR8dxZZgm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA0MSBTYWx0ZWRfXzbzbJZU5zqDQ
 v7emUcIIeUn6W6z1OHi1TfGOGX41oCs4y5lfKKNi/ATDlmXxuE/QqvlkYKxcvRlzUr1Fw+iV80t
 XGg0hoqpXRUTvU0d6xd+Omc/86Iq1wXQzws3y5c8aC3qxxWktcFeevr/YVmDgmI1/WL1uY6hYXh
 TVKS7wGMAQYFwhlfgX+72YPSI0m3EBbhdnYQxWCe1GvhV53gSgedd93nkcE+j/ugMkuFKq3fhCN
 A8/bA732mtMMPG8V+JlJCSGVNLqmNyDvhCEe0eFIKQN/kmcztO3OPGYXWAS7Yd7bd//1JwwCKjn
 KCN88RwUTfEwqiXPVICqP7sFHWOdHJdaJwXvZX1lFcbc/cactatHmdnxgM+lNgyEjP+tb4EWMmE
 cjzsiWL/fHL+tR7y6WcV8jHm1uS2/Ucx1IpjaZiINrWRVy4JiMQDJ5TIxKiuS+lzmx3j+5jlbn+
 jS7eUqFr5UoBFQZnedQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA0MSBTYWx0ZWRfX6OWwU/+dfXEh
 bfvBXs7CXrUrHDtm+p9kSL8+OqVU29z2EpHdNtd8qPbYePnZ6QQ1QbVbeelEKyIVAJAGsjKTGKU
 qpm40M7d9UNeMIvsZkpZ8z2HjJ2SLFs=
X-Proofpoint-GUID: sw7K2N5c37LmPrSDb4P5FrKvR8dxZZgm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240041

The CLX (Current Limit Extension) feature also requires the secure
world to enable it via the GPU init regs SCM call. Without the
QCOM_SCM_GPU_CLX_EN_REQ flag, the CLX tables sent to the GMU over HFI
are not effective.

Set QCOM_SCM_GPU_CLX_EN_REQ in the SCM request on GPUs that have a CLX
table in their catalog entry.

Fixes: 967e62fbeecc ("drm/msm/a6xx: Add HFI support for CLX feature")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 991db3c9cd96..a1561ca41a5b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1247,8 +1247,12 @@ static int a6xx_gmu_secure_init(struct a6xx_gpu *a6xx_gpu)
 			goto done;
 		}
 
-		ret = qcom_scm_gpu_init_regs(QCOM_SCM_GPU_ALWAYS_EN_REQ |
-					     QCOM_SCM_GPU_TSENSE_EN_REQ);
+		u32 gpu_req = QCOM_SCM_GPU_ALWAYS_EN_REQ | QCOM_SCM_GPU_TSENSE_EN_REQ;
+
+		if (adreno_gpu->info->a6xx->clx_tbl)
+			gpu_req |= QCOM_SCM_GPU_CLX_EN_REQ;
+
+		ret = qcom_scm_gpu_init_regs(gpu_req);
 		if (ret) {
 			dev_warn_once(gpu->dev->dev,
 				"SCM call failed\n");

-- 
2.55.0

