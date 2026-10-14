Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE8244C661
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791969053; cv=none; b=erH4EdRyMtzWY17ZzvD/vxg+y9mZx2LcpBWuEIk2pgPXnHYxvP3veTFfbhHrkGAxkdrscMSLShH9iWYPE8atVJdvZuTUGpuUQRPG9fGfs/anEnATQ969jJ5raU2MyMOXhcLLl9Ag4k08T9uVMQI7eWAhmu9IjMrme5mlJFWmlTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791969053; c=relaxed/simple;
	bh=TADT5pqLCP7/EEMUpQ7FZ5u2kWNtsJWJLulqEY9u7P4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WhIkjkB2B62zJV24ahPCMNcEI4S0bg6P6x1YBTjg2CishjByQLjIDAXt0qxgylnZAKDr1hkNW34Q8rFvuFo+6+GBZLSLATNfScc0gpqIY99tPojMwKnL29D4x43VmD2Y3nBeJlURK5Qe6hI2SEQcj1foXECYtak75o/uBwcL+vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AXVjay9x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EDibeBrA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AXVjay9x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EDibeBrA"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E67khr2685322
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NtAEjqArzfjn7+O9rMHOz2hVGzWcB2IODXM/UtgZXR8=; b=AXVjay9xJxu8x0zm
	N80g4E++AUhMuqtnDykVc4byahpqJXLW7jLXFGa7kaxXRJ/s2fhHbdKODKePgWBb
	16dNArX/bBPuZ2W5SHd7/rVctRHf2Sh5LARmdWiUVCixqO72xWWzhWAYa6v9Ryjs
	WUrguFceL4NKO5rmF9j6qx5ZeiCfjLHUbccZDBQj5QGH/T0bBxvSMOW2O4OO7b3N
	ziAsVEVYBFOIqR2FFUm8/I03j7lgYQqVp8pbWay89f8TWC6CHjVawh1PUiW5G5Gf
	c/Vddi3nQ1oTd/D3dld06Yuwwu66XLtclvI0xCbw66vIt6naDj8rum2SOjj+0egw
	KfJsFw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha46u0r3n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:10:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a470ead068so4205493a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 02:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791969051; x=1792573851; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NtAEjqArzfjn7+O9rMHOz2hVGzWcB2IODXM/UtgZXR8=;
        b=EDibeBrAL4bZZ3SZRVnWrAUsFh7Hdj7VHifjV7ysYt/lrs8rK23nYV/j+tuO6IYNPw
         4hvKRxGjTpsz/+XJVVQv4JIjb1iOjG6fAryLHBM/T2j2rj0HJNrCMat90ywrPCD8mgn/
         EaUSpbSgYxz+SUS780Ig+L+4nxwswqAKGYjZ9vxdGTDXnX7Sa/YqHxlMxZEGRSdXcjbW
         jDj8hDo72byKEa8CGDB+IeC0atTSpagMvO9Kren3UtlkU0I5Tns65B6OxBiPxXdDu/qs
         85COru+zPeLrPtomx5UESXBYKz36oOKsBgQ4i4FhxaCQokZHyJrvMo+dg2sR2mwOvGuE
         CF3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791969051; x=1792573851;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NtAEjqArzfjn7+O9rMHOz2hVGzWcB2IODXM/UtgZXR8=;
        b=Ap3qkZPmmBmsef4yfkg4HWcl9a43g4CCOLX6MsqgYFCYVy0j9lxZSi4YSwrwkqlgjv
         3G5u79fZxHRGtAcqWUM7Ivhg/9be05uXGdafT91+YCmZn4hCXde/k1QKImhyIxreYsH0
         2zEjjli1J/Ep5RsX6hqZjryQHld1C1bWyPZKIin8gPkA6BcXDd/pFB9uG/jOPPT9gSco
         EE1irtMp3i/YfPVR6NzkTx4MUYiuL9awiUZI8C5x/ygtiT/dGdCxSC2Gy1KZb7OWbqmH
         aapFk0vUCQ8TQimbKz4M2EdBpSH093OVsDSV9H9yTtc4vXCwrxYFHmUdglAE+ApbuVfH
         A4Vg==
X-Forwarded-Encrypted: i=1; AKwUvBwONWkQiXNztHt6OJR/MNVTZVzG30Bm5aW6LbG4XAoTj/DqiYI7hXjn4SMsodObjGgdBwsxmpnQFHA0MTs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzFtvOKiffLv/4mvaI9n37aa5lVLeMOTg91tcjDvCLEZIO7kan
	x8dN9BmdsVto8uSeb7FuFy5Fkm/vrkyPV108ArL6UZItujZAUbRH/cIHAI2HYdCMmwM/mfo094g
	TR6j0Jch8HfsNES0FyZy9S9UJCdwJKGiDOLl0tRch1IhozlualnMYw9cs02pdeNSDgYxapZfJM/
	RlBQ==
X-Gm-Gg: AYBFou3Pjp6+TVr7Uee1xA4Qvl0iWGZ2Pf+8JZRG7O1anIq3++UBpwzz1FXS2ST6u50
	U7zd6OBvLz+MWeGVLqjkO74s+gbsS/WYFv52cWA80GabvuX02H/3psKYVrgmkcvCmBvLiOCrNM+
	JBP11qSJgEdRrOo7HLMSiBzjPCj7wwM6GlV7hAlTfescbtIQ/vyEAdDPbBR6kbenVBHsxk6cv0w
	H+DC1g/uGTPsQAD783Zto+hMcpt6Q0ld9oP9gDoxEs6uikxagNkI/OjKJlI+0+Qxyx/2H77k8ZL
	RkWoEQ745iKqtZVHQ/xNBtN0ODmgpxXxRyk0lIhsy+kz98PkKyBEDwCCOrNLDYM+tqSTRzswaZ1
	VJGeG2PxvrDb9A4qEdw2fTgmnqSvG
X-Received: by 2002:a17:90b:3b90:b0:3a8:5543:5572 with SMTP id 98e67ed59e1d1-3ab3a3654admr13949554a91.1.1791969051196;
        Wed, 14 Oct 2026 02:10:51 -0700 (PDT)
X-Received: by 2002:a17:90b:3b90:b0:3a8:5543:5572 with SMTP id 98e67ed59e1d1-3ab3a3654admr13949521a91.1.1791969050687;
        Wed, 14 Oct 2026 02:10:50 -0700 (PDT)
Received: from [10.219.56.188] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac6069ca15sm3642624a91.11.2026.10.14.02.10.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 02:10:50 -0700 (PDT)
Message-ID: <c4820536-bd14-4377-9966-80d787fec19e@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 14:40:45 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: talos: Make the ADSP remote heap
 no-map
To: Jianping Li <jianping.li@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com
References: <20261014083820.468-1-jianping.li@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20261014083820.468-1-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfXy17qZeG9l2S2
 o5lLpX44DvZT5or+zIBPcqqdkj0oVZGGiKZAy9QwraaYLfFkU0y+xA0li+8X9862vftsYcxAtbC
 qttWlo7s+ELqjCO376l3K0dr2CwyZHQ=
X-Proofpoint-GUID: 1PLN7faaU-VDGyczxryJ0xIjPwbOFoMT
X-Authority-Analysis: v=2.4 cv=Y6ttIReN c=1 sm=1 tr=0 ts=6acf471c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wpYJVS7NxIkf_1e-v7wA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfXyVesH3vGcI+u
 mYdD/QRWgtk1BDUYU9WgohFqNbVjPScbL6wND8/L5+Cts1sWZo9vAZW9saqbTcNL7xhNnHJpUhR
 CxWHH7Iv4d0NkTyDIhEKZqKoY7PAy52ytagKBJzpXgP3WrNPU4h3FYqokePcuy3sc8Dgy8Bx/5n
 x2k4P01mWYfYQ1qQ6uD9XVozCk9zV4R0ooXRB1gkfNFd57oHdnQ7VZTGQxRGMAwRN/eMcl1VKue
 BoV9kvc7fG6/dDUGXB5/VQ9A6sIUtx5f/Ltv23EXvH7VI9/+MlN+EyDpW4wZBhXE0xEoMYhEWtW
 fHBR77h3xtVmN4hQ1GwG2C2+DaMfBActcR0YAuv0NkYnJiGC9NnPotNQ/XoHh3M3SyVfqAvDQk4
 BgXQHVX1msZCSHo7ZLA3l45ITMp82lV5Z3Uoazj5KBBaaIwHmoCd2ErfnQw9yJU8pT1ml+w6M8n
 R377Qnu5wbZFYOlDkfw==
X-Proofpoint-ORIG-GUID: 1PLN7faaU-VDGyczxryJ0xIjPwbOFoMT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140036

On 14-10-2026 14:08, Jianping Li wrote:
> The ADSP remote heap is declared as a reusable CMA pool. FastRPC
> assigns the entire region to the DSP through qcom_scm_assign_mem()
> during probe without allocating the pages from CMA. Consequently,
> the pages remain available for movable HLOS allocations even after
> HLOS access to the region has been revoked.
> 
> On Talos, GPU stress testing triggers a synchronous external abort
> when zram accesses pages within the ADSP remote heap.
> 
> Replace reusable with no-map to prevent the region from being reused
> for normal kernel allocations and exclude it from the kernel's
> standard memory mapping.
> 
> Fixes: b0b51a5f1911f ("arm64: dts: qcom: talos: Add memory-region for audio PD")
> Link: https://lore.kernel.org/all/20260424-talosaudio-v3-1-9e2ad5d78a2e@oss.qualcomm.com/
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
> index 8ed6f2755705..b14952b57d6a 100644
> --- a/arch/arm64/boot/dts/qcom/talos.dtsi
> +++ b/arch/arm64/boot/dts/qcom/talos.dtsi
> @@ -682,7 +682,7 @@ pil_gpu_mem: pil-gpu@97715000 {
>  		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
>  			compatible = "shared-dma-pool";
>  			alloc-ranges = <0x0 0x80000000 0x0 0x80000000>;
> -			reusable;
> +			no-map;
>  			alignment = <0x0 0x400000>;
>  			size = <0x0 0x800000>;
>  		};

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

