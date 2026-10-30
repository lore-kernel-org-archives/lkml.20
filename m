Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395228;
	b=hPsZXjOy/DXqMsKwg1fMD1GDxYykfdoyEErkZtreNN2dWv4RC9OsjK8udygTps2Hargo
	 V5vZ0lH5jkQV9+tqHLO+ca/zm+FyDfZiww1nTAa1Hzqu2DBKGN1uOIuOKa2J4MaYYRJhz
	 yuGKJnBc8jdCe1DsfOMCoKtqWpPPUGZOWml6pNAI6/Mm5qJlRrMnTndHdrb9T2GAOji4q
	 gFYZsH2QDyoJUE8YC6OszIzGi8vCa7+8jVGcD+P2Az8Vyiccl6iTVJteZyyFY96YyaEMa
	 0L1tBlZORKxeeSFn8NaaNoH9SUfr00Wsh7+/mcDa9ZbgmflebypSFLTDiZI/JmJ8gxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395228;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gIzkbjDhFpI59wKeEOyvGZrWbWXse9FWOdJm9bjq3As=;
	b=3Zl0AxnOJB6KxU19ae/XSlhJAYjsDZvkbZ5Z+WkClbaF5aYe6BLOrukTKiCYGKiIPo1e
	 twOkBYSOa/60+0a2J+Z9aHGesNOIb4kGZ1aRx2BaSxSi2imdYPGvwBt3EHOPTbhbm5fps
	 ndeNGfpN7yXNaoWdglFcg3yVWCVGDCYIsHK5h75lpF5jqvFs6thyH91Y2lKHOUKN1xlr4
	 Ep2WBpl5UJkvAIcPg/MWAHYsPeRzgKpzSZVcLcoh2+jJe+kFhIFGRuaI2D6lnLVMEGmw2
	 fTsABX25eEM3PIp7mNYZtSYm5Baf1LI0PPwP+X2Oq3JhKL66X9I2vPk1GJ8PP4TC3Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LqDnmnG0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gFgH+w5C;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE1560A2611
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:20:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DE1560A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LqDnmnG0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gFgH+w5C
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULBjaE248981
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:20:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gIzkbjDhFpI
	59wKeEOyvGZrWbWXse9FWOdJm9bjq3As=; b=LqDnmnG0tWIWwKsZq66bHJAvSff
	M+1GFxdYhjPiJS3A1FoJvviSxWCP2fuLEmzmLMmWNLdb//1BhQVw0N62wAGLXKc8
	KRuSskhukULUuaC1BWqUiuOcsel5GfJofIOX1/fWhhuyWDhDFUH7eXhD8xeZUnuZ
	j4EY+bIJFuWjMNKTIrOucCjeoUNFYB6ZLY82CTQGJkoqU3mVmHZr6gtLy3TgL/c1
	wXpX6Wr5HpHiPJFatxOk8dxBvryuRVUIzt0+EScQiIQK76GWJ8KKTJyLC/GaudZK
	7tLWSKRYhyeNdcGz2Y4SHGqXJJbhF3FPH2G9VZFO2Hd7furn9A20sV168BQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x0g1g7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:20:27 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a06750c74fso915622b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793395227; x=1794000027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gIzkbjDhFpI59wKeEOyvGZrWbWXse9FWOdJm9bjq3As=;
        b=gFgH+w5CAREIajaiICkSvWkAyff6+lvaOb2qhEF9wusxHEk4hQLFMiDfZE+0fdnNdt
         TVHmY11vTWklL6ldPFC6nsiPbUadlTSMiNH4PS+TlvTry89U09i7GrqKJecDf6Ejiy+T
         lQ/8KISRdgnNoWdo98VWE7TdXadn1EqZlgjhodV5mAQiECD2Qt/gaSzBYQZLT5fh+Qpl
         Gb72z226xE0t1DXvKpaZo4G5rA3DHKZKQ2vuhLZ9RUsZ1/1KZuOEKnmj0uYTT6uFtt0p
         eXDzCVjF8y4QSOEuztZDrkXB+wbbE7XXzCGTFA9BWPVKlKPZxRIWu9CGXVEdtgenKKmB
         /+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395227; x=1794000027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gIzkbjDhFpI59wKeEOyvGZrWbWXse9FWOdJm9bjq3As=;
        b=xcI6w9yHBHoQiGMjkxYfWQTBGrUbkU1MW7EidqPct8QSIhiKmCAuMHrt5104Hnhvqg
         ibDX3l7Ap54srs922+OfwBzFmJsqgrGtDVaBdQhKjSrHkGPyArMxRsXJmZiU6rSfqiTx
         5phg2B3q1jrwFfGjuywT7I6WFRXQvGsl24l9Bc/2wP8/mFHtoOxfAVn3VeeQ7OBnoW0u
         lL6JuxghzOc7pz6UE4tFvG7PZONbIJImvNED1zATgH5DAw51TmDky1p5S1kX7nC4qfy/
         j0sRXlvrmVHuo5p0WOHO4SNouEDb7QeZZ+x2X+ZdQzRqSlGMRGX7mfd/jz1WDsOLbqXD
         vH1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwIRBNT58HTScpQCQKpmHf5bPlwh/CjzjJ8rnZ8psTdxoV0GOgJweNSDhiVjUN8o0eOswip3SCaxM/W+ZU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKu6y5LLFYToPOSywbSVbuasGE+FZc9Ew3tz5Z3xxPOGu+rGKGh
	sP4vfPA0EKMijgnBRM4Vsj66rQW8Q7nfLIfxlGgU85szaGraIqqEYsmp5WmFDc/q39zLsiUaT1S
	5hpUqAHNM5wfN6sm7m7QRcEe8yJ7RouXMNq49IfFq18WLuclS22/cGECMouQLfA2Jrdg=
X-Gm-Gg: AYBFou03tWUd47hwld6MKu4YwpgzGR29hB0zHZUqm14hG6wqDEmSkarnUx51l0RXnOv
	FRAnpzfi4cwrv+X1HKTJ07SblejZwE3jYDRB3NmH4xyu/7m/pDHA1c3rJvmxBkbSIvwx7LSVdKS
	+rjNLp/6VkFvW7P/2LVLvPUm4cFOnnz3FO7TFN1Fp7Dmfkx36o+8LM66a0DCt0CzoOUtDG337I1
	GXuhHMpMpuYnJdtULuAfyaQmulxaiXYRtDanMEzuAootcscss6yIz9RmFe9EFNaD7jJ10KKAW3/
	lMvF3t07xaPv29d6XvLThLoEb9Fjz6m1xIvRYKi+wuk7CZrDTSG3E4avQj6B+dXbmhZUVi3wDWj
	y7dtltHUQ60ourPLsusVpsWnMDHUQJ45tDZbZ3lVWwJfyx+840oPxM5z77fhbSP0TxIpAasq7NN
	5XC/0LC/DCvG23UbV7gru4c9E=
X-Received: by 2002:a17:90b:2e90:b0:3ac:86a0:5764 with SMTP id 98e67ed59e1d1-3ae898311b8mr2636512a91.64.1793395226685;
        Fri, 30 Oct 2026 14:20:26 -0700 (PDT)
X-Received: by 2002:a17:90b:2e90:b0:3ac:86a0:5764 with SMTP id 98e67ed59e1d1-3ae898311b8mr2636495a91.64.1793395226269;
        Fri, 30 Oct 2026 14:20:26 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e973ac6sm10464840a91.11.2026.10.30.14.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:20:25 -0700 (PDT)
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
Subject: [PATCH v4 19/19] drm/msm/adreno: Remove temporary __maybe_unused
Date: Fri, 30 Oct 2026 14:18:21 -0700
Message-ID: <20261030211928.45761-20-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: -xi0_zLrc8nytNP4TRfyhltJ6m2j4XNC
X-Authority-Analysis: v=2.4 cv=No9E4MdJ c=1 sm=1 tr=0 ts=6ae50a1b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=SI4bJWXHUBEfUJKjJlYA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfX3xQZaLSK7pzV
 e1+WzBJYnmYz9NEnf9M18QX7Hwgzi1BrMqmLeK72el9zC2d+8M0holQ0IvtCxDWnuG+4nnNrvSF
 g06yUW8nqAHJCs+6/YDZpAkqn5g/eTPkUFuSoMmCB+vaXIY+TxrABrNubJO46WkMoqaWcT5k6IO
 xRjvkHybUFpvQnjs3mU5u21tbApu1BCQjNtaVcys581vmE7fjsnUWiYkUGBRWx42FylODFbFNX9
 ST4oTxsmpcTRMXIjR/cyLiem1/idNwJ8fk0Ytz/0oSgliWSkRLwACieWTk5MKUGJCIR8Iwvqoby
 GyfQGE7dJpmloOdYw2RlkpAXa7nNaHhhI7Lg4TBoLCUgp7k2NzAVzJARm3iQHXhhwrAaiFiddDz
 Ca6c2q+6M7OZBCsjcg1Evr88h/y1ew==
X-Proofpoint-ORIG-GUID: -xi0_zLrc8nytNP4TRfyhltJ6m2j4XNC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4NSBTYWx0ZWRfX3r/XzuuP27xv
 HRyq8ZAUm8GmKAl/ZB3JngvK5UFn3g816crBx80FEz8E/Z5K2i4bvwbGtmVkAtADKVPtBpPj9cQ
 PB6PsmpEpWxcsxgAVWwX33zJoAZyJbM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610300000 definitions=main-2610300085

Now that is unneeded.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index ed83dd927b54..3ef3ac2d86f9 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -170,7 +170,7 @@ struct adreno_protect {
 };
 
 #define DECLARE_ADRENO_PROTECT(name, __count_max)	\
-static const struct adreno_protect name __maybe_unused = {		\
+static const struct adreno_protect name = {		\
 	.regs = name ## _regs,				\
 	.count = ARRAY_SIZE(name ## _regs),		\
 	.count_max = __count_max,			\
-- 
2.56.0

