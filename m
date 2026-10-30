Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395189;
	b=ZG/2lseqzCcAlM/6HuNnIoK5wwDwWjwT7iVWvzF9moOHbtPDJPazfunZB3zqgNLRhRY9
	 8dWEsw3N/ZGJtPu7i+l1JpMbC1lT8O4ruV7F9CzkGg4EYmJv3HhyUfvBWjtTarj9smBV6
	 CKiEp2PELvJKOX2zIsQKAQELBK9TNFbttakPWOiFzDkxi9tgKVUN05T2P+L8tilmvEwDJ
	 o8gc1sbaWYuWixzc3/ZmCMk+Jmqh1wBwL05SOym179jNIZMTSuAjtTY5FmPTRFmieK8uB
	 oGMyoKwTPfpKA4F2Ul8Pokz6qER0i8duwnHiU78Pfgjr0N2rqaKOnpIm9xrjiws+CMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395189;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=evggxsHhN2aTRopkjxRADAhNYxlfnJlOA46wMGwegEE=;
	b=AMEFpcMSLNItBGSM1M/JdpYTE61VFTQw99M9fyvoTiQzC4uTm2bjXdhnl4VrSO67VBt1
	 70EYNSshp20p0sZuJijDFzowKExFbFDkpHSvyh2Q70SW/hxApZad+Vk3GqpZlfQmOjsPJ
	 7juMxabcDJFZ9uuwC4I+UiQsiBZropzCV7H1Qhq2CA+T8VUvxCQSvkb9DMmVRmAWGsh0l
	 4y0JixwmsyCvE+QzPsRh0878dvNsufqTnd6aAMOHcO5zJyem5/4KcnbDUd6/2qh88X/EV
	 cB3nKqcfr6tVNMr82dGNIhcflm0sxCukpcAJvxibguDoJ+BmPZZAkKK4XciSYE8uyXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="JW2Y/oK5";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CswBJWPt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2F860A2610
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:19:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F2F860A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JW2Y/oK5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CswBJWPt
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULAhIn823607
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:19:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=evggxsHhN2a
	TRopkjxRADAhNYxlfnJlOA46wMGwegEE=; b=JW2Y/oK5HibHJP3bOd0oQuPvvPp
	JHiwzxsd9Za4rLwLwyUjvAQJx0bQ2++SUuPE4VeG6B2JP5xncZRS9+E2BkqRXpMN
	53YLXcz5gv/eLLAYRDDTap4ylUT7CPoc5YuqyiDf5AliLquEpnKa4N1iYlG9D5CE
	AjAojaGNjwOoyN9c30rmOuRE95ud8HAMJnuE9ps8RtLQRhA+OOc8MsXd7oudE8UU
	GUKnMgF1jEwf0f1lWD/HObs2Xxaor/TaLQyXcK1tbvidLsPYp83wdkFETzyVsqVK
	hucFrdi8v+M5UPyxz934b5jHXaEobG8mGBfzToxKvbT0/Tyc0/J2v3179PA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x081g3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:19:47 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a064f294cbso782696b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793395186; x=1793999986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=evggxsHhN2aTRopkjxRADAhNYxlfnJlOA46wMGwegEE=;
        b=CswBJWPtLeN+shHzV6TInLugBObGvLW6j1qz3kU1tXsANBSXhHqHyZPuSSeLi9Xro9
         6LJfFdRkhcN+3yr14pxYst27XKsKgr4XljsAcuZvHYEoE+6qGVtdh8AgBliGHa1beyGa
         8iaVKYOkFhRDowPhpDp1YHhyARYRJocc+QECl59AN4VTaDOpIZs8jFmmLklQ36z+GNqd
         DOU7OkXi/jyD35Bfvt3EqtGcCLcoWKcQBB29UpWy4Fbf1zHlGwi8I1rGR6nJgeHtAEPn
         ZuKAD6fvdKVIkOKWtbOz73t085F5640vQd0EOuEnaYdST2k8F0qiOCd9yLalhfRAEygH
         q/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395186; x=1793999986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=evggxsHhN2aTRopkjxRADAhNYxlfnJlOA46wMGwegEE=;
        b=Y979c9gh9JVNL80Wej8DtitcOcLyy7qTCYKKOwWQmyrTQ9ZqKvxlHnDyWNann6AAmc
         rAQzdBkXAZpyxRvnrCGlD8NWIy1DMNF2CYE9gTm6Qg1r3VqXrzHMckfKafd7j5kCPUtj
         cSaYKrFmtLrfFZxj8aD2rlwujbwl4PvXk9rt3A2BdJ7LwNCmHZbBHXPV5qtjXy8AN4p9
         lfjn1DqaA4LuPX2ovbTNAyzFkxpQR2tkEHflXriIT0GEK5pObpE+xK/HWSrA444/DvwW
         iPGU0chU0Icrz+Jo358+DrNFMPgtLTILlpJrF/EUpwn2W/LFkJZfuoI154lfTU346mjB
         489w==
X-Forwarded-Encrypted: i=1; AKwUvBy9uT8TzemRijcyzsnwPZUUajWBIv6klXqwZT3TFcejCuO7aC5qm0a4zElus9L+i9G43wXp9Mth1j6Uu/g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvqZsWVLyv2TvvS0RDSHQjF6F3Dq+g7aCLAoyVApycEmhFrs+J
	+G0aOz4g5E1Qy7kFdJ7jHbXo8FGV2MdL03dpNOzGJkD6SW1861YegrPCIlTsH2zbldE0y9u7HMr
	kzbrqDiswztDm8tGm1M8mNL3EiMAGMFR2BmEEKgqesYxcAjeWCGF/O2vYF0wOsJUR0zU=
X-Gm-Gg: AYBFou2Rb6caURhCjfKWjooeIaoLjYXXhdBpuH1DeMB0mjNIvt95ZMP3gCjh+GSLwYE
	GlcoiskPO4ezWlqFvsdWn5XJBSWnd8MCQ14yaTMTjv7h4BUuKqzi+Qno01vxc4vXhoQX4syx5iq
	IfA1olkuZ7nTekjT8PBGD6FV+nQBaCOZ4VzcrIuDchd6WZ8xJkm6v8kkT9nyQRqgFQwR6/QW0AC
	Q3vlxIziNYbjHiJiA0zWbYAklca2B2n7TRLWyMSOTO6SAExKfb7WInj2lshjifVNLeYR1Jbat9Q
	f4bQ4O2kkV3M6u/ocPtFciytq7oU87/8+/ii2eCvpIAUW9sF8tSoPju5nPBpQU2A4gdFtj8Jfbd
	Ow7KL77MKgQo/5XTf91JXbgkTXeJ973GyQaWwTNgCFEC+JEWfb4DLgflbtuTYeF3jHFhyrwyX7z
	Z+2f1gx5hPkCTV2QHCsgjzDNw=
X-Received: by 2002:a05:6a20:e20f:b0:3e2:ae03:b299 with SMTP id adf61e73a8af0-3e928f72ab7mr3093700637.34.1793395186422;
        Fri, 30 Oct 2026 14:19:46 -0700 (PDT)
X-Received: by 2002:a05:6a20:e20f:b0:3e2:ae03:b299 with SMTP id adf61e73a8af0-3e928f72ab7mr3093677637.34.1793395185999;
        Fri, 30 Oct 2026 14:19:45 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad9638149sm414566b3a.20.2026.10.30.14.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:19:45 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 06/19] drm/msm/a8xx: Allow nonctx reglist to include GMU regs
Date: Fri, 30 Oct 2026 14:18:08 -0700
Message-ID: <20261030211928.45761-7-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030211928.45761-1-robin.clark@oss.qualcomm.com>
References: <20261030211928.45761-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: Y1QBW78AMZmzY-MjdttFFTONyJd5YuXR
X-Authority-Analysis: v=2.4 cv=Z6N5j3RA c=1 sm=1 tr=0 ts=6ae509f3 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=cg0wMmP-TNBUvudz7-YA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfX/qPaT27DAQQ2
 7Lli7439Z1xlnFtG+NQ/P9n1pTogzP7oOcR3qh9KzBLas0A0+CXymiZUvl6L2UvCdGM+L1QD3/a
 +QkaYDh0pvSZKKmsp6JrawSRGwpojaI+AQnwJ7n8To4JroDh1JQ/o1cpZQ98/uy4YoT2uxlr0pH
 X4Qhub1gKJ9Bn/88ao6hXD+DqiAE04a3fGkFh4D7zf0Zf+zPlqQErETT7z7uVhhzgA2DUpEHKhb
 Pe+YILnpEp1CPjfZzLNLTUuE5OUhatU0frJOs/37fNfMZJ+zZKmBErVDpgnZY350fFOWiZj1pH0
 G9/yilCq9bH+2MIG5OUmEmLIXAFx+rXz58PosIEIR4WW5T6F35dCswFkZy1ytbnnrWiZcoq9+72
 P935wdgbt92bnQ4SXKYD7ggicjNbS+klN+C5I2ES8rncHq+KrqNh9Qp2/mR3LGKHcWhaZe0+9QL
 9DYRYQBEzgzBTANNPeA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfXyE1/yXBn5PzV
 JYZewsB812NlKtNb4nvK+xF68hFprG6+CROtzksj/6r6v19Sq/q9kfMxJTmoJKUpH1vNdXVyXzL
 qDSuaH3HkqyLBU+0bW7qG3PyOfVxaR8=
X-Proofpoint-ORIG-GUID: Y1QBW78AMZmzY-MjdttFFTONyJd5YuXR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610300085

From hw PoV, it's all part of the GPU.  But from dt perspective it is
it's own device with a separate io space.  So we need to detect this and
direct writes to the correct place.

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 8e91edf16ec2..795c16d88f45 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -370,6 +370,7 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gmu *gmu = &to_a6xx_gpu(adreno_gpu)->gmu;
 	const struct a6xx_info *info = adreno_gpu->info->a6xx;
 	const struct adreno_reglist_pipe *regs = info->nonctxt_reglist;
 	unsigned int pipe_id, i;
@@ -389,7 +390,11 @@ static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
 			if (regs[i].offset == REG_A8XX_RB_GC_GMEM_PROTECT)
 				*gmem_protect = regs[i].value;
 
-			gpu_write(gpu, regs[i].offset, regs[i].value);
+			if ((regs[i].offset << 2) >= gmu->mmio_offset) {
+				gmu_write(gmu, regs[i].offset, regs[i].value);
+			} else {
+				gpu_write(gpu, regs[i].offset, regs[i].value);
+			}
 		}
 
 		a8xx_aperture_release(gpu, flags);
-- 
2.56.0

