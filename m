Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5DD3EB815
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790267239; cv=none; b=GsRk/9Eqq9cP89LuPJp5hhqQsVvhcXb3EEbss58JYQabe0O4DDUF6cx2dvPAMPNHSY5HXR6fxk+MEEPArtUAbcnt0d3FXNj4JzajcSktaNIpfcpTMlIRI+mLH3ASFOi2Y+s2gmM5mvoSmkTEgFlnTuu2x6yn+f4+8uL/LTCpsQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790267239; c=relaxed/simple;
	bh=O3ZVq2aN57CDDJqcDeeMkmvA4zgCpKP+7hCd9oVPOYM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t04e58oixjsM1rsj6Qoqg+QdztPTku1c/ytMZKNBiQawX60K/mTAIeY+wpjWc7rVKdJ4xlCFM7uF68gbLCjVR25CfKaS049JuyDAd1lS6MXgKTbrFVzS/a65CcINMOa5fjMUQbjgfLNpUbKzlTUCphEbGwLSQa0X9aY00ihT4Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LP0vSOce; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CYCQXMbW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LP0vSOce";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CYCQXMbW"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OFeJwc2101439
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:27:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CDRoRsm88bQqknBg7q9Dc+jZIAjIk1EGfL4tnHnxT9U=; b=LP0vSOcetlf67NYE
	yN3Fu7Lc8lAUDT/B7GDoMweqSY+1ejiSwJJV5/7VghmYQsr48mUWf2wxP0umRul2
	nBiYijy5wDpaarF8AU6dGUmwXENH+O8owuI/+Fjbm4Qg4tMUQCRUqpyTNYtukJHO
	ETy/zjbLM44/p13a2DatA3Okl4Qu9jiPM8J0ifShqnHKElO8nxC7hUnv2C7ZtXyc
	MrWHfBg8F9eKiPg/yHq2aagWuT0jRaBq64ckImKdij9Q89exJ/4+xeUJmNghuFW7
	rNP9pjRAM9MqggryWXXPORVQijzA1hoH7DKLcKbnKaq3+xfPHJbwmm8z8hq/Ui6z
	9seIxw==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw68e0dn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:27:17 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7f4e0b45e4bso3025790a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790267237; x=1790872037; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CDRoRsm88bQqknBg7q9Dc+jZIAjIk1EGfL4tnHnxT9U=;
        b=CYCQXMbWWhZ0rPEZ/5No5CY2DzOafhJ3N4A2kW6FDsbMJtYTBQtOHOaH617RAucbHf
         UBBLSNqU+Q6ztCy95mjM9JdJtxmjGiBVAtmaF63YOI/LaizSLifkqNdRztN3neSNXZq6
         EEZypMyCkq3dPfq1j0OOaa73wl4K4QI4j7z6T+5tOKubYyA6svJ++O8EXis2hm+lJNnY
         gRtzxDzesvQ6Wuan+oSw2ZPboSFHDt5ihIZ/VbhvbMcbqxVzAQRLpotu/AQKEz8Ypf3V
         6rBY0xtUIXKxiiLkzMx0ZYK9K/Kl3Upsa5V3LivGp0wjem/3EWNIZJ2G02qC2GeCVQHW
         VR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790267237; x=1790872037;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CDRoRsm88bQqknBg7q9Dc+jZIAjIk1EGfL4tnHnxT9U=;
        b=gwUB4HWMAw86I+1gNru48jZWEef4j71nJUtnl9FXdUYRMvsKDYwUd9YqMYAid8DTxL
         0zGT/GTNrpRcwy8kTY36feTabsTtBY+JRdMNFAAfvqolOq2PBLPmcT8hLnwbDQIbHcu1
         Xc+fFddmaRpxOFr5+jd57kh7ULUNPkX1DIhUGNH+9eoJRgA1jyHWMuj2Fe9bzOfne6P/
         9VcCL7MDygZJIyc9WQwUQuw0t0Sb9rN+p/TgllTcelgTjhhiN2iTnM6q+BxdT05cZ80O
         Np7PmYUEFpgwBGjvse7CeBshD76KUbpdc1Eh2MfZJ5ocBbmxofFj8was6VVrcfO5AFcj
         cGVA==
X-Forwarded-Encrypted: i=1; AKwUvBxrFkmox03oHxXimvbCBFiYZz7xif8aMDcV7by857SSyj5UdZrB+5UoaStws6tKEjjgWTn95jsC5TN0N3s=@vger.kernel.org
X-Gm-Message-State: AFuF++k2eCf3BbBJplw5HmzvpB5Q1PZ0LYzT/c2i1vvluxwEnVyr5Kdc
	waEsp3BTI3KDdzzHJG6+S6sVGP+ssQcD99BrYC7EBTxBSUysLu47VtF0eL+VuZJEV/wgnws9hwP
	hq1tw0xaioDKNrQtZefOnlSJAbu+jgQHbhtI0N9SP2Gx65jNY3JpUJLfUzu6TsWGJeQY=
X-Gm-Gg: AYBFou2EdvtSvk4ooVSnynESGYHscvgpa3jCYvekhrB/hdLraVupwA0A3nBmupfwNKi
	3egoLxFLe0n48eu1f9dEoRTC3U2xDto4O7Gpn3ywKZpFDrPqEpV5xYebITVxNqOa6OihZdMpWEt
	opd+eGnXJWh9cJl15U94UPdgSrcpCgb5OlN33u7a+kWbQJTDThKGlmpQzk6nJSnxcAaRXYQiYSO
	xHixqLT4R//qHBd1xV4fM4Pg0LSuXYplyvbcHDyfM8tfqjMGprME1s+MsnwXCsugIgLvQpg9QVB
	/ODpK/hMMHWmu+Gs+ZRGFjh4BWS77KIepV8vL+lbv9jahpwwwTjCdrMh1IelVQw2VBHIIQXgcn5
	BZE9ddVdcl/QwpLv92cpZfwV9BOk+mN0=
X-Received: by 2002:a05:6830:6301:b0:805:2785:fad5 with SMTP id 46e09a7af769-81783b984d0mr3079651a34.27.1790267236810;
        Thu, 24 Sep 2026 09:27:16 -0700 (PDT)
X-Received: by 2002:a05:6830:6301:b0:805:2785:fad5 with SMTP id 46e09a7af769-81783b984d0mr3079606a34.27.1790267236296;
        Thu, 24 Sep 2026 09:27:16 -0700 (PDT)
Received: from [192.168.0.15] ([183.83.142.107])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-816018d81f8sm6712807a34.3.2026.09.24.09.27.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 09:27:15 -0700 (PDT)
Message-ID: <8bf0e48f-e98f-76b3-0cee-527af9461ea5@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 21:57:09 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] media: iris: reset AHB bridge before enabling HW mode
Content-Language: en-US
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Birk Skyum <birk.skyum@pm.me>,
        stable@vger.kernel.org, Renjiang Han <renjiang.han@oss.qualcomm.com>
References: <20260924-vpu_hwmode_fix-v1-1-531498f3499a@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260924-vpu_hwmode_fix-v1-1-531498f3499a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA2NyBTYWx0ZWRfX79+OIH5q4ouV
 e7bSTWCOC1tal+4bCj5S2BUbxFbptse9HMDjpJJ1DbpgaTgVna0k+ch+n2eGVQJBgu0YC+LshgR
 yIE0UyUFXF9IDRC9oLHFcP54vM6rv5M42+UYZsncGFPb3EhLM8d97kAT70QQ+xF2PaGurZhdA/j
 zSBdxj1a8/V1MMVLsJDy+ji1vRjqfMOpnqRVruu3nhovvAfDEdgDwMwZ+fGKJldvoECI/Re4GUS
 mGqW1ppoMg1alK4aw/bGWyy22xfq5WgUK/pcVUZUqiDBpvqjq+hwKrObjdLhcfheGPt6PSBeQrX
 5Ppv04zea/BbJWy8Vlh9krYiIeyZtgpoov65d/H1KR3FQWOzGIJ1qxbDsQsylJwtmMyuZ8Z5t8W
 7c9P7H5OWUfWU/TgWqZPiiaJmsG5AhzUqzoG/o2u6r2qTpros7Elrc5g7Xz1DcAYuYJDvl4I1ah
 hNrWS617d77kEm74hlA==
X-Proofpoint-GUID: LGUxnPReRrMQZSNwpEaxXZf2uCckE6ei
X-Proofpoint-ORIG-GUID: LGUxnPReRrMQZSNwpEaxXZf2uCckE6ei
X-Authority-Analysis: v=2.4 cv=XawcX455 c=1 sm=1 tr=0 ts=6ab54f65 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=BUSZCRnG/G6/Li3ahCSwQA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hkYZVY6NqzSJq9KjeRUA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA2NyBTYWx0ZWRfXzVHq1VFZ4Tl3
 swSR2f/7UfH8oz1kzkNR6yTpV8Y8d3nMzWXaZj2w5ikOb7T8BN15RfMWD9Oo8FHlDELxTJ7oOkV
 9iEkRgdqjQostmCxJZO+2SBDeEThAls=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240067


On 9/24/2026 8:00 PM, Vikash Garodia wrote:
> When video power domain is switched from software-controlled mode to
> hardware-controlled mode, the core may be powered down without the AHB
> bridge going through the required reset sequence. This may leave the
> bridge FIFO in a stale state.
> Reset the CPU-to-VPU AHB bridge before switching the power domain to
> hardware-controlled mode. This ensures that the bridge FIFO are in
> reset state before going for mode switch.
>
> Reported-by: Birk Skyum <birk.skyum@pm.me>
> Link: https://lore.kernel.org/all/20260913194707.91885-1-birk.skyum@pm.me
> Fixes: 95a337f92f0a ("media: iris: switch to hardware mode after firmware boot")
> Cc: stable@vger.kernel.org
> Co-developed-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
> Signed-off-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
> This is tested on X1E80100, and is applicable to all VPUs.
> ---
>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index e4847c1077097160cfc8324e807b4aabd9747812..2ef8004e976e34ac3e5ad1971894253fee77648d 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -311,6 +311,11 @@ int iris_vpu_power_on_hw(struct iris_core *core)
>  
>  int iris_vpu_set_hwmode(struct iris_core *core)
>  {
> +	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE,
> +	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
> +	writel(CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
> +	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
> +
>  	return dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
>  }

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

