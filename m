Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5233B346AC2
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 21:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789507257; cv=none; b=JvGlzInDIrTcjaIiDkStD31HSAxPCIQlu8O3TY8IVj0nw5536REZXLSjzvsVYQmuvKLM8Fep6IUP/XEcYeulIVuoIeUUPKmOYpkSVyXk2JY/3Wp1fEyZmRGqC7+QThZFiAJ9H1RWFjs1m2G+EsYq5RibvRfoYM+cR1pxFeOpRIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789507257; c=relaxed/simple;
	bh=MSZLGiz5e/E+Jo5v6EY6+916sywfFch7614F0EqdXes=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X7LYclqjlAgejFKF065Otloj3DMFdB5wHwiipW3V2xhbajrLQt/mcWcDv851lgsSrWfk5O2jbwxoae8idFOoipKcJvw3SlMKx0o5hA4xTWvRoM5JPeSoUf330OEHJ3XhJYc+TboUOMROECBb86vBnHkeYe1p42XZK3zA85fMPzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P8O/E+cH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PU6GrND2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P8O/E+cH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PU6GrND2"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FItc2k497811
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 21:20:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	chAJluwUiQNqr4LZZnWIA9G5yILa+6S7/Y3KKqeYuRQ=; b=P8O/E+cH5ZhO7tUU
	u5TgnSJyp5SvxJfPD1XY6QBLo30991IkgTRGJaNCEdHexZ+skk66jvReoHmr9iqS
	OJLWi0Sic4zahwuOwJpBxFGQQsWhGlBth7c/fC1EoaJMDImznPFUgwVVJS06t72x
	MntpxGT7INviqcfOpN8PcWp/HsqqcTVIOIlY2kPRS7sbd9Ce0bKfO4RMA5MRsxTL
	VMafdTLjTteSwTz5ZWEyfpuVbe9X/fTr0in7CwzJSAjIx2fOuDwXb3Z6RaT2fSgu
	RL3IPdXXossl7N1Exai+0LtAfLfcyn7OjL3eR1k4Ep6i8JA73nWHDlrCK3rInRcv
	f4OMUg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq3hc3r5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 21:20:55 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39aee9b4cf2so8429795a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789507255; x=1790112055; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=chAJluwUiQNqr4LZZnWIA9G5yILa+6S7/Y3KKqeYuRQ=;
        b=PU6GrND24mtRM9AK3JNtIiT3BO1il1LlAqoS91u3m4TrPMGqgmzqwY1CKRNBdXuNEd
         vSQls5FRbrwcQRIYVSdyOvdIOzDUEWH/bpRSdKmPw/TLV+ZnkFNCahto9XBLvHR4Nnjr
         hTz9hW/Br3ugjviEs+BdEjAMY7ZvmG0TZaIEq0JRmZicOl6p1wL2P2Udgs1hNaayhrjj
         Y0i99LEIhWefkcOL1lguaGHCGTerCE5SH31W6zS5+rzuyqWiznqg1StWwqq7d+5AhKi5
         vESg4DX148hNZ+Z7iPsfgNzm+4WyfL53tF2w0KuVM5JLB3QA5P5DJA3cZD1eLcedzNR5
         3eUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789507255; x=1790112055;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=chAJluwUiQNqr4LZZnWIA9G5yILa+6S7/Y3KKqeYuRQ=;
        b=FflZJzH/wkpBilL4KkmwT0f1gzCUon6m10zkvvDwlcyrTDaHPTaYtPm9Wf5rhdQUSE
         M7d5ctESx8U4QPQ4Tl54+bU8bSjpYqvF0P+b+eHwWALrTTGpK2bJil2yEa+aHNqrEIZG
         R+jWwgZ8od7vhswe8UqnTWPi3HWIg1t5k806cNtg3XVKcvajUsbhya9TSPKcvyW67JZp
         R0KCXRYW/6t3SfYUwNmlzTwL/Kgf5GTBDoE6MgJQSKMJqii+vT951EOVwXXFe/5zBova
         A1g6TpqlEWBKLKwcBo6zZlngo/m9mJ7qmSvodXkFpKiaQ7ZnQzBh2LOVTvVYuhXiHESg
         380A==
X-Forwarded-Encrypted: i=1; AKwUvBy8Ium3SlgM1pntYOdJXWDDUMXjSh7Yu6E2yL2KNtxlgEqVSWmNVG9g6XWf+15dSQP0H3fZgR7h1WokAtE=@vger.kernel.org
X-Gm-Message-State: AFuF++l3cL1cnSw4Xq3s5qMSv/L4/wK6N40oF1TsjdYgJcYRFr69Vujg
	tZbLrmqBKVuobGPYaSCNp13NG+gXzfdJ+rSQlFgOW7FNu2VtWfDp8hAka8n1DzDS5BfaZs2E696
	MaXGeWjgdyUtf3JXWYTFiQ+9MpOhZBpAgcCaCrvOxbCGfzI8iNSOCUd5tsTAileYzi7c=
X-Gm-Gg: AYBFou3vBmEF60aYDGTBxjPO5EbuhlKIFNMmKwwbrrFM0s4SsP3aY54aiyhKNAvCKl+
	BbJI8v2cvp8Kn5y25XS+FzgMCdFDBpz3Q8R8Qb6RvFv3I9wq4HatC2/1FLBPxXnTST983WcSQ5J
	OmzceNtMeMVsaEqJTj+/o/lDnhS1sgmDbrAlAAB+Kk6F4Dr2bkQkEIWknJuYBr+gePTBK9zCCcr
	eWlWgTrupfE3ZEGL1N9J6p4oalLihl3hJzRNc78yBpnlbYrlaR0dcQbjt3SuB/57DmeVT53Dp34
	RqnBlg7++U2QgGOebdNb6YSPbNzMlHAVaCvPaJTmJJkOE9CgoEg/G+ihLBF0uY+OyPFhUopZPK3
	GrYjBBDbZ3CBcW/crDLI09AWCiQ==
X-Received: by 2002:a17:90b:390e:b0:39e:53a:c8d4 with SMTP id 98e67ed59e1d1-39e1e424a7dmr277898a91.12.1789507254632;
        Tue, 15 Sep 2026 14:20:54 -0700 (PDT)
X-Received: by 2002:a17:90b:390e:b0:39e:53a:c8d4 with SMTP id 98e67ed59e1d1-39e1e424a7dmr277857a91.12.1789507254153;
        Tue, 15 Sep 2026 14:20:54 -0700 (PDT)
Received: from [192.168.1.15] ([106.222.230.202])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a166sm1717762eec.10.2026.09.15.14.20.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 14:20:53 -0700 (PDT)
Message-ID: <7128505e-c8c9-4d00-96f9-2576ea2a0fda@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 02:50:47 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] drm/msm/a6xx: use correct timestamp counter on
 A750 GPU
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260909-topic-sm8650-gmu-a750-timestamp-reg-v2-0-091d74958951@linaro.org>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20260909-topic-sm8650-gmu-a750-timestamp-reg-v2-0-091d74958951@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: b1iCwiBO-kneDr9ccV6_cDjSpehAisbW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDMxMiBTYWx0ZWRfXy9GWw6G3Cjvt
 ksr4WDx68VRc1GMaexFOZvQM1DMlyAzgpC7RkCQMx0iPwWNz29ff4K4mNJUV+UcIwN6JxpEuFwp
 G4yydz+fkNgnHaFGoCewmtfS1at3XMA=
X-Authority-Analysis: v=2.4 cv=dcUVTnXe c=1 sm=1 tr=0 ts=6aa9b6b7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=BSf2YShhMxZyV2bg4MjkLg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Nyh0hyempXrTQnLp8KQA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDMxMiBTYWx0ZWRfX6XG/QoHaI5gP
 cyP9NsiKCxj3Eod9tuqVhCx+0KD1qsapRQ6W+UZFvvWRaWwx9U8YAoJh0dfUXU9R6Wl7Q3Q0Rgf
 oguR6x7FGCAFHElJn1LQY9WNxJBSdla6tfyeMC0tnY8xJI3YEMP2wvz5D5ADWM+HUUhs2wi9wd4
 cuWCKv4NFaepfi7K5/Sfb5Ay/2LfzK9WDVWVpmnXRZcrTv8M+vtJRfbOYT3DuMzfcWrxeKFRbLA
 bEW9uXLtDlbQNgOP4D/Gz/UROmetqxQZA7jKqpdKdz7V/aFUGNULMAAmtXJCI2tFiE5Oe/oK1pv
 wFSt6gKSy0b6BxjH6j4EwrK1T1BIPtjhEwPp7QrUrdwfb8PcHQ7O4Ms/ZuoQnCWsBthi/yNpDcP
 GOAVVK0WEulinObJaDqKmnrM3wHAnLZ/kfqgPJYtnYJJP8NjrgsFq4ijPa6pSISLjusetkl5E5j
 auiuIYnzbKsBw5Ot/UA==
X-Proofpoint-GUID: b1iCwiBO-kneDr9ccV6_cDjSpehAisbW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150312



On 9/9/2026 6:37 PM, Neil Armstrong wrote:
> The A750 uses a different counter register as used on the downstream
> driver:
> 
> static u64 gen7_9_0_read_alwayson(struct adreno_device *adreno_dev)
> {
> ...
> 	/* Always use the GMU AO counter when doing a AHB read */
> 	gmu_core_regread(device, GEN7_GMU_CX_AO_COUNTER_HI, &hi);
> 	gmu_core_regread(device, GEN7_GMU_CX_AO_COUNTER_LO, &lo);
> ...
> }
> 
> gen7_reg.h:#define GEN7_GMU_CX_AO_COUNTER_LO		0x1f880
> gen7_reg.h:#define GEN7_GMU_CX_AO_COUNTER_HI		0x1f881
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

This is correct. There was a register shuffling in the gmu_cx block in a750 and another shuffling later in gen8 family.

It is a good idea to review other GMU_CX* register offsets with KGSL. Also, please consider including a fixes tag.

-Akhil.


> ---
> Changes in v2:
> - Fix swapped H/L registers in XML
> - Link to v1: https://patch.msgid.link/20260908-topic-sm8650-gmu-a750-timestamp-reg-v1-0-284880d6e68b@linaro.org
> 
> ---
> Neil Armstrong (2):
>       drm/msm/a6xx: Add CX AO Counter registers used for a750 GPUs
>       drm/msm/a6xx: Use CX AO Counter register for timestamp on a750 GPUs
> 
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c             | 12 +++++++++---
>  drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml |  2 ++
>  2 files changed, 11 insertions(+), 3 deletions(-)
> ---
> base-commit: df2908090cda368b01ff43709f51890076c56157
> change-id: 20260908-topic-sm8650-gmu-a750-timestamp-reg-2e7575e6279d
> 
> Best regards,
> --  
> Neil Armstrong <neil.armstrong@linaro.org>

