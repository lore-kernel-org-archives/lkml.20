Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234086;
	b=2syoXhyePphlDL109J8suYMYoon1bxdhkdiXbn+fe9ese/jur1UnRQKkHjay2IDTe5BU
	 ktWf+HtQq73dEycpgTE/qmis3b/e7ysgPU5rFYgnKj9LlMM40DgJn4luo+VI9QG5aPPmA
	 QIB3f/m7mRmOjPzxQ5iH0V1XbF5PcNIw97b/kMWpt314hQKD8f5igvKgHw1vSM13wwwXv
	 5z2qDuEyNUf26L/NZuw5NCJjEu/JORi3u4VbiKIXzNcg3iHMtotJEKWF1h01JrSvUnTYG
	 iYiGtqE+lCKQeZaKLQmeZ57HhM2uMaUSx3S5EOqXfmWYYVhQW4l9l59eCvclhdYfMPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234086;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VPp9DF6FAAAhRErFGqfT9QbAEpklRskknKR5KtgUiPY=;
	b=JD8EzX1427WTWUjLMIglfDSwhvZZ79zkpek7p4H3oZONMruplewZbZXUCj4k+LjmFUw2
	 Lzvyl1qs5Eo8SXFBI7dcs0yyCIurO+lT47l4XZ+EiGnK/kxpaXzhA6n/jfLrocW0bEi37
	 GnLMy06S2HbwLPrLX3otIVHHVAyY4i8wwFcvU+9wwL+OZ6S9+z4u8SL2CpMfr1QcVGa7M
	 3fjIqt8mrDvepwCHaaqCmpFs279UnE0ZhjgOGaMT0Kt3J65dO3QA4omS+r3a/Cc2Oylca
	 ALjbOFtAeRl4PxxzdNMkFNXSnBnJaUMAN3Cq+0/n2G2ISnIPe5Us2+4SxFG1wXjtsgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JLs1JHGD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jYsxN3Ls;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D73A606D828
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D73A606D828
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JLs1JHGD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jYsxN3Ls
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DEtHv1323026
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 14:21:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VPp9DF6FAAA
	hRErFGqfT9QbAEpklRskknKR5KtgUiPY=; b=JLs1JHGDQ9pTOQGrvmwhOYZlsHp
	kZLPMCv818YuahofRNsqGr/PjsDavbzNDsrtQySSvtzCMo2XwBwwy0ZCj7KPnAka
	XWqE89GBPD7QT3GFHc3Hy17bV8j2RsJTJFC4+GRjx4JNt2HpUEjUpG9CuN1OKZ3a
	pknvJ21f7stEN/gfHshN1dpKo+cy6hUiM+z+fq3QYM4Vc0Ex3+wks7zWS/zTj90D
	KmJw29HKktrTfGcfcyelVWlIn9JkkIR6i9MgixskBkawx0bypChGCHLNAe/2axpR
	XPBiiKL/qDJpfFT19CuLFJz/tRm4s2sv0TFt0JsREswyhKLu0eg0MauQVQw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hue0qrdqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 14:21:25 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad91787a1aso660986a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794234085; x=1794838885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VPp9DF6FAAAhRErFGqfT9QbAEpklRskknKR5KtgUiPY=;
        b=jYsxN3LsA3XgBYYjml5ElmF606F9QMbtwI2pRGcgDyXw1zUpUVARezXhYxZ99/JOkY
         +5nBXYEL/2h1NvvBaasHFzyAKF1XOWqbj5gTop5xkfhUcEA8NEQgiBkedkPzifXvrLTX
         71YE6b2ZqbUv0RUfmXTxkY0kBDniRoJCMR9s0trL3wrrHO3T+rDprL2LseUAmQhkyUW2
         EuRAi09lhxjgywOTxNd5HDBmYPo1bHem+b+CVhAb5lKBtoXK+g5cGNtl3s3putzhCrwT
         zi0XV8x5cLuNM6BpIrsMb3/sBtdKDaWsTjUjFBOOcXKCezsdI3dal6IRNxq7fQWT1tzO
         jymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234085; x=1794838885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VPp9DF6FAAAhRErFGqfT9QbAEpklRskknKR5KtgUiPY=;
        b=wEtQOIzp1lsTCmgNi/94Rhsa1AsFJD2qkXSRS3p2PpOmAoEe89+RENyELbrQsx1V2T
         QwccnBE+sy2tndr2xugiDAXM/QxCB6ScwIfZbGW1Q8Cck6k5TYjlGg6DJkQKcWNhCOFF
         /DP03jNDaD4Yt/nniIBKhYVm2z/6QRBlz7HSHvAN1w3MoyTp+rkV6Wv6Wdjxt6Tfko4+
         IkaGni4biV8g9wfbaIetnRY49EuFsyfayPIy0bhUvFyaREvNbyx9byDdqUESzcON4nDN
         zCApaH4AhxlptjBT98hRUWVzfkOnBZEoo5y3sLb/FPRu+L1JZ3U4kPAZoD3KkXaTyaar
         KsvA==
X-Forwarded-Encrypted: i=1; AL+hErF267digSnpeIMwLajUtgZ0ar1n57Y1N5ZaPxnE9ec4/gmxDqiANurbrYOgpAG/TzMASYgP0RTzFywIFxQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z88M1zVpk9cwv52xZgviOaWIT7WXPERRkb4ZoYF1PVlHK/WaIWh
	2tvQaiCHXOuEiM2hH+e0BzjY0EVGX61p+0PRjBkUq+i3USrjb35fWmURF9l/8vF+J2qYYMyjarI
	c7lReVftYK9VmXEL2xposEGzDQEfbg85jks3/eIUKeuVMCAu65F2vxuzapVcXYdX4uck=
X-Gm-Gg: AYBFou3LX6RvCqqSHrmVfs+PbLALKSD02ncZnW2jdLoBnhv4B6iPaqDfltHw/hNZB9q
	eBXs4lAdwJ4DpMYIR2blrRUStFSI1mwRzbB8r1zIKlJ38ZXpsn+nYbopH73BnkVEmxDvStbd0Af
	4SlVjXUlv06CFSNFMXS3v8qsRbiEDOBTSAi4AfJZD6CwqCX3MnvvvqNrtF90yaqHwVFTmFqT6al
	3nLiGth/UzOoNGFVuRjM4alu8tfQqop4HHdtPcsXLCvJ3abdeJtsqcpvukJEdsTdZe+3ZrJmI2u
	KXlP6GogUZr89X/rBQNV6BUlErqeb0DV2q7g53+2gtsTZgbc0X70udodDmN5mW460AkyXcGNgpR
	rhEmWn92vPRbRAMvHgS3hi5rsntMQrIffawkuZEuEkjqf95WeTysDBRhglZfIFsIsgbw0iI1bca
	gxAzKODl7xsHBwhSX0cLzd4yLc1D4XoD7dDBOp/EsD3VHYsoIs4XHwM2glkrLBNg==
X-Received: by 2002:a17:90b:35c2:b0:3b0:a757:e372 with SMTP id 98e67ed59e1d1-3b12d45fa90mr3663802a91.47.1794234084835;
        Mon, 09 Nov 2026 06:21:24 -0800 (PST)
X-Received: by 2002:a17:90b:35c2:b0:3b0:a757:e372 with SMTP id 98e67ed59e1d1-3b12d45fa90mr3663768a91.47.1794234084271;
        Mon, 09 Nov 2026 06:21:24 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b105864375sm11494129a91.4.2026.11.09.06.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:21:23 -0800 (PST)
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
Subject: [PATCH v8 04/15] drm/msm/a8xx: Export slice helper
Date: Mon,  9 Nov 2026 06:19:50 -0800
Message-ID: <20261109142111.256630-5-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfX3H1x1eg/OKQy
 VmLJgoQCjj3aTqnl7550MGKhaSC+VZZAF8HrEyRDCScGWGuBBFrXke+aYF+DXUnqAjSkcIQZjz4
 8pokoSB+27Pekfys7EY0PbvmKvyBag+U3wyZD845DcfYrjE9uh5QOVS/GgeqmGfCuU+oK59s/Ii
 trQ3DxHp83QUuiSSYQvU5nsXMgnIb+hHFMh6Jrm6Y9wp82JamsAXwY+DzFGDl4LFojeyZPOUjO5
 c8RX+jDBLZ458kBnvFT/ROnCLcwWd14N9ezGs8/nvimPc0EGqS4xX6pmclh77tDUoVGdHtJOe9i
 Pp4jbgLBCNP3B4DUs6Py+HEPtHxpcQEf5JA9clghfIbhMqBs2vVxFU2qraCnSXY0fLcFeyW/hM2
 H6pAunV8Ud6FMcejlE+IczqdY4x982JMzXaKbQyFSHFhpShUhNcQ1IiAdThdOK60yfYloXrWaOS
 CuxDe+ScdmYWXt8livA==
X-Authority-Analysis: v=2.4 cv=DZuCOftW c=1 sm=1 tr=0 ts=6af1d6e5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=eauOX4bcPKZCCnkqRxoA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: rbbZ-cUDvTIJ693KzSW6Co-ihmnss1n9
X-Proofpoint-ORIG-GUID: rbbZ-cUDvTIJ693KzSW6Co-ihmnss1n9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfX49c1GFXVc/D9
 8dpjXhyFODi/+xwNwdsvZ8Xng8f2Nomf7PzpDqr9IvbyZTauFV8ILHg3ZmM335576cUzpQ5fOFk
 YJzcOzRWm9zzf4oxRXwI5+R7i9a31wE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090057

Something we'll need from the gpu snapshot code.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 1 +
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index e6ec85b20fb7..4a3898e58aee 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -357,6 +357,7 @@ u64 a8xx_gmu_get_timestamp(struct msm_gpu *gpu);
 u64 a8xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate);
 int a8xx_gpu_feature_probe(struct msm_gpu *gpu);
 void a8xx_gpu_get_slice_info(struct msm_gpu *gpu);
+u32 a8xx_get_first_slice(struct a6xx_gpu *a6xx_gpu);
 int a8xx_hw_init(struct msm_gpu *gpu);
 irqreturn_t a8xx_irq(struct msm_gpu *gpu);
 void a8xx_llc_activate(struct a6xx_gpu *a6xx_gpu);
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index be81f141300f..a29f8149493c 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -130,7 +130,7 @@ void a8xx_gpu_get_slice_info(struct msm_gpu *gpu)
 	}
 }
 
-static u32 a8xx_get_first_slice(struct a6xx_gpu *a6xx_gpu)
+u32 a8xx_get_first_slice(struct a6xx_gpu *a6xx_gpu)
 {
 	return ffs(a6xx_gpu->slice_mask) - 1;
 }
-- 
2.56.0

