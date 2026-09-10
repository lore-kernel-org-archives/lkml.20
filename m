Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD07333986F
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 10:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789034809; cv=none; b=Ho4S0dXyLV9cVV1iNdIrPZM8IEXFQV7bvGiFe5rwdysPCoWeY5ov+NjBtzGHo9gV4hJG4LuobSmEHDYoxiD2CmsLawJEHO75tuA6GB2Vr5xm2qGzFIYxoRrDtyOnhNTT2S/76GLwOgFV4bKQHe0rJn2ZuOZtztsBoobuiXwiBuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789034809; c=relaxed/simple;
	bh=Lu+4YHeK869dlBqFjL2cKsywYYlR2fLA8uGutCF0fo8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=icwrf6MVD3qI7KwkteLs0IG1Jf/hLgvTvmaz22hqyZr/+JW9zxgPgBV9yU8AoRTvo4lwNpVbeL7r1Y17+i7vLEqAfbAY0tN+bYbvYrHrB0+ghW5VlZVMBm2vFhZu5qOaQzuKESSBn1712ydf+nXdsejpflJaNvLW1HefEi7z/to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MduJzZBu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UwDKeeGE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MduJzZBu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UwDKeeGE"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A8q8Al4137093
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 10:06:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m07hojNF+PinLLd/x/EaU/8bPalFdykfrNtvmsSaQew=; b=MduJzZBuR4WoYLZe
	K3ACfyBachN01Nz//KQjBXdap9pw4dZ1/TiDtWBr9sD8g9C9GUJEXehopdN5Ulzf
	OjTawYnYSR0RpIcweJSAtqibfUCyYStMG3RWT8ZQRYnoq+Cqyy89fR3UrjlLgxBj
	v87Vpc4J1m6HsJ0pVVi5Hiddzl5LMF5T5JKNPz/I5NPfPavHqYMbYWI6tDjnHE04
	CqWGalcCXywY+w36mu5LMtzBTHc3aKEXoRWmzpaleddSilKbXuxSHSRcJiNCmFgG
	fFJyv9VqfrEez2hsVgy2BmhAPHTPEfueEtYnuO7R34jsdDR2j8861AFRa7gzjEvV
	iON1EQ==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcydu8t4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 10:06:40 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7ec3b429610so10754925a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 03:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789034800; x=1789639600; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m07hojNF+PinLLd/x/EaU/8bPalFdykfrNtvmsSaQew=;
        b=UwDKeeGE3DT4gBhts0Z+t0T1OpZZ1yHsFFtEawEwBMclDbpGS5n1E5hpvLBq8rhOPB
         ITv8HoQzi+TyF2OGy2hK+81vcMdDmvt+X7xzvt7RH7W1K7JqVLSiPTeqQwcwML4wgXQe
         taQV+addTWi32B8Gq+8PfSf16xBMXiQxmndH0HnSRRXp6LnrsrDrpUShfrORepmBzp8f
         2Sueqz1s0QNKu5pcZgKGlk5R0OdYcNGkv0Y4S5mtF4W167xFktGK/4XiO0az9RiJ3MVf
         3qwiT1GIEJtDzpg0Gxn0avtk4ccs3EWlSaO3t8KEZTZtLAMOf0nGLzsONKbkpaUGj4Oo
         RakA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789034800; x=1789639600;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m07hojNF+PinLLd/x/EaU/8bPalFdykfrNtvmsSaQew=;
        b=jeE6DLAYFsWowwrMyU5PWMwNKbPxkIRyzC8zEh01/TSxIQYcNKM1i0PiO7/EmSAepJ
         oPt6smHFvp5Wjm2pZNXqmjReHOl2WxNuBrJWp+2Sl27y8ywTHlaTNwSJ3xepZ2R8dh/A
         /CRJEV9avqMdOC9rrI1gVB2TRXqQlD4SoumxlfHz+zSvou4nWMS2eFFWgpSxkDMvM0vY
         jDMVmwno92trxvt4axLncvhiFl0xGSKTHKJ86cIWBzPxta+ToGT2PbFhZSj+kJUIFe2V
         Rg2q7Jq7VJmibO8ygvflSZraMUsVabgvYDZ1so/rqHcLsvNbFPYXiMw4qH9EDTJm0zcT
         x6Fw==
X-Forwarded-Encrypted: i=1; AKwUvByBQfuRnDBiSKPWmAmpC0JR33C+D1VP0RqDi2SSZiEH43AOXhCgRaXgBjXdEmvSTuvH0B6e34HVixJReus=@vger.kernel.org
X-Gm-Message-State: AFuF++nSfXHDLxrr4xaV7KEtYCHlhmgUHAVss6KFLO9F1+3vetaJU0Ot
	bRZEMdory4eymMKBUft4rFg5YYT4TIXUea+9YclxFeFmEJsebHfs95NudR+j5uN6WK/2el0aCBx
	wGZWM5Inpa4SAVPIdMOcuqY9pwri70LZYUPvbcXoCGo/lbN6eu4AYqnm3bWeicKbQ2Ck=
X-Gm-Gg: AYBFou2IpsaIGnqd5jMoIEWNI/rxV4sYT1iz8rTJko7lCk7L+kR+Sbptxf83dLabMLp
	CHbl9XIi0sxL+Nvb+ARf/kSR2aiHGQ9H+qDMHxA2fKpjxZtX9wNtQb9nYStdVSdaaqdwOWunsSM
	S7NknmEKb2nylkByrd2FNTfNWjohmrL1ryDJoC/fKRUpSACrpo56RW9WWdCMdQPUx8A1VJkbQRc
	3CuUX3ghx18xr+XB4qvlW6aPeD+tbuLYhVfvvt3sYMAW+IhYJqfbE8Du43v6AdjPWzhU11GvmE3
	n3KPbLEot9OtqfednFu3mcub6maFcBeb1AFbMWZ9MgokdV3PTuNMeLVIQ5uizxQ/VIx+WfBzRsN
	nRJoCEQoRCQoJPBNytIBkUZADktE=
X-Received: by 2002:a05:6820:178a:b0:6bd:5506:aae0 with SMTP id 006d021491bc7-6bee57a3e81mr3549598eaf.22.1789034800185;
        Thu, 10 Sep 2026 03:06:40 -0700 (PDT)
X-Received: by 2002:a05:6820:178a:b0:6bd:5506:aae0 with SMTP id 006d021491bc7-6bee57a3e81mr3549585eaf.22.1789034799830;
        Thu, 10 Sep 2026 03:06:39 -0700 (PDT)
Received: from [10.217.217.79] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm79725666eec.16.2026.09.10.03.06.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 03:06:39 -0700 (PDT)
Message-ID: <21cc9c5a-aabf-4ab7-8f2a-e8f90d5fb2f3@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 15:36:35 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] clk: qcom: ipq8074: set BRANCH_HALT_VOTED flag for
 usb master clocks
To: Chukun Pan <amadeus@jmu.edu.cn>, Bjorn Andersson <andersson@kernel.org>
Cc: Jerome Brunet <jbrunet+clk@baylibre.com>,
        Brian Masney <bmasney+clk@redhat.com>, Stephen Boyd <sboyd@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20260910100000.2627799-1-amadeus@jmu.edu.cn>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260910100000.2627799-1-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IfsSymqa c=1 sm=1 tr=0 ts=6aa28130 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EvhtOw30TdCrwUAivPwA:9 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-GUID: YPooI6FyiP96T1VWnHYLOUm-KGNbXcr_
X-Proofpoint-ORIG-GUID: YPooI6FyiP96T1VWnHYLOUm-KGNbXcr_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDExNiBTYWx0ZWRfX4h3N/+qk6+kj
 wPAKPl+p4SC9edlB8WQ5y8eqG9qSA5njcLoOKgW8reO0xPecs84I8yzYC+1cEWP3NUK+3S55YnU
 HTO0B9MmTciuBFXod/LNlbz3pnEpUyw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDExNiBTYWx0ZWRfXwMZpwvIkD6La
 PMQ8/Ek/DOBqS3Gk53LK2+Ed642qgpMlHM3z5nCC7pGKoxBcWYJnt1cwPwb2HV0ccLmIEuLi0KV
 HMy+jysFCKUhruZ24PjuU+PUwbJDUc5cgIw+59jWF50QOMb75mcV7rlZE+L5X99mUswHGHTzvLe
 ePT3eozDSgui3KNorbzAVcdDxFYueEDKiT8fcY58ZcRDKYz5pIGAclSSDItnItwx260+3SChEHd
 x7drHMM3A6MslEYPaPBHYzaeOELK9j6uuMGYkdi/Neyh83v45jxa3Sj85or5I0TYaBDDIlV0ZNY
 4U0QYq10HZXTt13lObp9q6aqATS32mgS4Dz51MYeYx5soehh1Qsacj8QqqSEXv8hs+9ViXfjZvp
 ejL3UwVlRNyUIBnk9aFrUTOtw87V6TgnMbfKO/1WA4VHvbbGbJroVwWxIP5wrtl+Wf8ux/JU+G+
 wH4xRRBsDHTwID47gEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100116



On 9/10/2026 3:30 PM, Chukun Pan wrote:
> Currently, on some boards with older versions of U-Boot, attempting
> to disable usb master clocks results in a "stuck at on" warning:
> 
> [    3.005088] gcc_usb1_master_clk status stuck at 'on'
> [    3.187119] gcc_usb0_master_clk status stuck at 'on'
> 
> The USB master clocks of IPQ5332 and IPQ5424 have the BRANCH_HALT_VOTED
> flag set, so let's do the same to fix the issue.
> 

Fixes tag?

> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
> These boards run a vendor-specific version of U-Boot, and upgrading to
> a newer version could brick the device. Therefore, I think this should
> be fixed within the Linux kernel.
> ---
>  drivers/clk/qcom/gcc-ipq8074.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gcc-ipq8074.c b/drivers/clk/qcom/gcc-ipq8074.c
> index 1329ea28d703..10bd2f80010c 100644
> --- a/drivers/clk/qcom/gcc-ipq8074.c
> +++ b/drivers/clk/qcom/gcc-ipq8074.c
> @@ -2612,6 +2612,7 @@ static struct clk_branch gcc_sys_noc_usb0_axi_clk = {
>  
>  static struct clk_branch gcc_usb0_master_clk = {
>  	.halt_reg = 0x3e000,
> +	.halt_check = BRANCH_HALT_VOTED,

BRANCH_HALT didn't work?

>  	.clkr = {
>  		.enable_reg = 0x3e000,
>  		.enable_mask = BIT(0),
> @@ -2725,6 +2726,7 @@ static struct clk_branch gcc_sys_noc_usb1_axi_clk = {
>  
>  static struct clk_branch gcc_usb1_master_clk = {
>  	.halt_reg = 0x3f000,
> +	.halt_check = BRANCH_HALT_VOTED,

BRANCH_HALT didn't work?

>  	.clkr = {
>  		.enable_reg = 0x3f000,
>  		.enable_mask = BIT(0),

-- 
Thanks,
Taniya Das

