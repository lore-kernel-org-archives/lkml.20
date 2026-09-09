Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F3A5632B4
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 16:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788970939; cv=none; b=kAjWf8jPiG47TWSBliGyK40yK/JNHS+QP7xHfS1Y266vYKVwEC6ZEOUpOfEg0U4v0+sQMVNy5ViqU4+eLHqiSvONNUh0GE9Z1y4NnKBy+55tb/Rvmh0zNhqANhseA+WuM+dkprb2EDTWazjm1eYG8ODI1rYq8GedxsGEd6e5Qy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788970939; c=relaxed/simple;
	bh=Q7NUp2MkJHfxY3tIGeAEVf4Yvjl19i+ocRuOo5HNDQ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pgZGTKrby3T6ej4tYKD715JM2/9qSv3Hc8MaC0DS40Krx0XWOBDaxt3TpedDM7mf9zlV6Z/myLezoRuHaL3bcVY3hPtzn+3NXD1Hnenod5IPan/BAi42RqQmnnzVMHNtDnwHltfUj4cWniwzpH9WIgTg2sg8nsg6WEN8404JdFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VH28Nwv2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QTfZ29zS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VH28Nwv2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QTfZ29zS"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689CCjhB1400912
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 16:22:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7ssfjYTj1l3r/nXGifnneYFAL20uCc6xve74iaokQPg=; b=VH28Nwv2d9EhqaEc
	FJeZXRJGY5N4bjkAzPBXR6ndi2BsaFONDZ3XyR3wMbxu9zdnY3bQyHjMJ8JWLLLu
	xviPq/oHs3fZQDC4TlfZbvz2T/hq8VIPzAw5WCgGIP/AosdVoU95zo6Ypr8js3u8
	yx6w8e11o1u1/ALSvcVuDQ8jHOs/cq2s6t6KxIoOAbzpIFf9FSMrPxkiv/f5mJWf
	cxE7B2LyRsjUiyUleMpqqB0zv5QVpRCBv6BFP6tQ08PjCov0XyhyRtUwcNp28krx
	RjE430/3RDL8pV3aRuCtE02cBIfY9ZbuqF8n+Ilxmo35PaEJw51Oe/DcDxnmdoij
	Rf1S2A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk78x15s1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 16:22:17 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-86917d18a02so969681b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 09:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788970937; x=1789575737; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ssfjYTj1l3r/nXGifnneYFAL20uCc6xve74iaokQPg=;
        b=QTfZ29zSkB+at1q5/UP1HOtBWKARx1GtiSwYH7r8S7hBCWMj71SdxLi3y+0s78KeZg
         nxp9Vop7ZoOoKGWW7Pmcrqv9lIrXQmQvzahxRRU9Z7z8qPeTV23F1yM0aoV8/lBc33MM
         Ca8ZsFH64qgW1wgb+Jj/FZkIbbeCStYJzgJDnDL9KrwwNb/+zFMHQfarAoTtcx+9k2lZ
         gJwZDl71Ac9LorsLf4SbBxncRbE8rfs9dM1gLR9jmeWVMoslYoOOGwfhu40UZfT0aIg7
         WzKHYL/a7MaveNydHBGm+tEh38MQytJrroW9aBxFQhun5D5VvQI+OC4SkHiSutqCUb51
         VK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788970937; x=1789575737;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ssfjYTj1l3r/nXGifnneYFAL20uCc6xve74iaokQPg=;
        b=o9c2X/4bsWFFh42EcoHczzvAdMIp3ow/nHxwFVr2hppJSip5ML7UwZXpnZjiWvJ87n
         Ri2J9fPTKcfvYLgXemXhctLIwlFdnZmqOR95ZBvfjVHuJiiqUJaEKUPablgW330C8pAM
         MqvvZUELUaRX5JEjdoY5SgZF1DvaU9B40cScsHC5kQqp8iEQvea0mhPxMLBwX45n03xk
         enIQUks59oZ8wnb55yuTDcadCR/wl73jEXyeTLpPXTS0mF0x2R/LkyzdBzALAuO4QqQC
         mSpf4woViSP0LxyCwtYLgNM+6mj5A9pDvxdp6EsJcpQBj55dWnGSVdJCJ7wISqlD9ZtV
         ug4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzL6BAFyefnTclmzIAygYD6Iv9HXLJDHkxbecpFuAwQP9OuRr6WyWggI6XL8UKsPxSQrdPO84qNT+ShtQc=@vger.kernel.org
X-Gm-Message-State: AFuF++mtogmb45L9WgDc8Xp2eJBud48HgW4pVRQe0wywEA7g8frc07tQ
	fs1iXAbwK3vtpnfRs1ZpxZmUQsCRBM2mIB4Y1oOjyLQbBUg06qBgfaJB5gbgaJEchm1TbmMXmc/
	dkkEwGdIX/er4ssiOPxIy4pKchqLbT4crXib4igUqNVXOW7t4R+8dWXQb0d3Z2R/m6m4=
X-Gm-Gg: AYBFou2iV02WqGIFdBmUnlZzKGj3LGdIidwxaxxXeaZojoNuN+NnLPkxCLZr+m40x2A
	vDxFaghHzQ+OCSi0rPnmPJhR/Wmsv4RSb7yHs2LWvkDeqdjMTZje+FcV0wDEmWxUcgn3F64gwI9
	OfyOhrxycA9bRD+eQ/WQlQZjlZVeLIrKNEdkcLNFjllP7bajkZW/7nA440bzatNOj0aHpsIo15l
	CpWEwpcjV+y8M/MUMTdE/9+v6S3RenyyvcOqvZjKevR45s7zji203SqxH8Kj3NJSGmP9eu2V0jr
	KogPBF4JNTyVOmjTxQWTs7D/KwE8azE44av6ChVMRBsaOCwMtXJMdxwJ8rHN6I4INq+085jJJ0N
	G4EHqMLV1EmZExTJgDVpltGeK7U+cPIFkmwdJOaDsb9JO2ePAy9daSeQARGfYdcfpCEXGe93m
X-Received: by 2002:a05:6a00:3bd7:b0:868:eabf:e07a with SMTP id d2e1a72fcca58-868eabfe7e5mr3488987b3a.10.1788970936851;
        Wed, 09 Sep 2026 09:22:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:3bd7:b0:868:eabf:e07a with SMTP id d2e1a72fcca58-868eabfe7e5mr3488954b3a.10.1788970936246;
        Wed, 09 Sep 2026 09:22:16 -0700 (PDT)
Received: from [10.133.33.154] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-864782f0be1sm4593429b3a.41.2026.09.09.09.22.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 09:22:15 -0700 (PDT)
Message-ID: <d78f8ddc-3d51-415d-b399-5a39a63a2586@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 00:22:11 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpufreq: qoriq: Fix clk reference leak in get_bus_freq()
To: blaze <1466528493@qq.com>, rafael@kernel.org, viresh.kumar@linaro.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        zhongqiu.han@oss.qualcomm.com
References: <tencent_60DAC4127B362B6743CB0BFA2C31982FD807@qq.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <tencent_60DAC4127B362B6743CB0BFA2C31982FD807@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3obuq4y_ZjE-kdSxjb5S2mzeDemsWnLC
X-Proofpoint-GUID: 3obuq4y_ZjE-kdSxjb5S2mzeDemsWnLC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE4MyBTYWx0ZWRfX0pTLKsZJ/K6/
 X5kPAk1M4HYEkYYJx9TwDO0cf1BzyDlDxQkQqMIfYuEtR4yKIpogXK+RHgXQihaMH3UQ9QwUQFM
 daQ2X98OAajuI8czX0yHZtd4I22taJ0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE4MyBTYWx0ZWRfX+T5LvtvcVVDT
 aV/yNhcHI3bL4+TWIvGYePX2i6rcqx2MUTmlDJh6m+HTNnmYcarizcWIjWpVvrz7OzkdU7CREtQ
 y2DgaOudUJmmxuPNIVzjSIExh/hnJUHOhiUR6lf46otjBq65CScZNSEJB4qtaqTqEvDwqueBxhE
 trtMPsmrXESagHMbuufj7NZKb6MZblSHpDxf+joWZ8ciAuDiBJeaoOTv08jWS4EhBAndwRwq6Py
 DyVubNdaU4YGryI9gjIIavcns5aR77uYvaWqIZEBxQZO1zC1skHZUIarFSYJ/xVAlAnF1AgPLxf
 r/z/AvRW2VZItb+IevAuQQEweEfuPQ3s+8EkqFmRNNtnEt6zHmC/C3WolEC7OAbC+47E4XLoUrB
 k/T6N2jMrJp5cxji0HQ4tamtZh3zQHAz3GlCZoSJjBkVEJm+WnmLFy1sxmXAf2/csVz20vGg50Q
 NfctdK58ffvcUjtpg0A==
X-Authority-Analysis: v=2.4 cv=SvWgLvO0 c=1 sm=1 tr=0 ts=6aa187b9 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=dZbOZ2KzAAAA:8 a=e6XpzHukWT2NPN0GgxIA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090183

Hello,

On 9/9/2026 12:41 PM, blaze wrote:
> clk_get() acquires a reference to the clock which must be released with
> clk_put() when no longer needed. In get_bus_freq(), the clock reference
> obtained by clk_get() is used only to read the frequency via
> clk_get_rate(), but clk_put() is never called, causing a clock reference
> count leak on every invocation.
> 
> Fix this by calling clk_put() before returning the frequency.
> 
> Fixes: 1b6f255990ae ("cpufreq: qoriq: Enhance the support of clock from DTS")

I couldn't find this commit using either the commit ID or the subject.


git show 1b6f255990ae

fatal: ambiguous argument '1b6f255990ae': unknown revision or path not
...

> Signed-off-by: blaze <1466528493@qq.com>
> ---
>   drivers/cpufreq/qoriq-cpufreq.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/qoriq-cpufreq.c b/drivers/cpufreq/qoriq-cpufreq.c
> index 0000000..1111111 100644

May I know why the blob hash is 0000000..1111111? Is this patch just
generated by AI tools?

> --- a/drivers/cpufreq/qoriq-cpufreq.c
> +++ b/drivers/cpufreq/qoriq-cpufreq.c
> @@ -62,7 +62,9 @@ static u32 get_bus_freq(void)
>   			       __func__, PTR_ERR(pltclk));
>   		return PTR_ERR(pltclk);
>   	}
> 
> -	return clk_get_rate(pltclk);
> +	sysfreq = clk_get_rate(pltclk);
> +	clk_put(pltclk);
> +	return sysfreq;
>   }
> 
>   static struct qoriq_cpu_data *qoriq_cpu_data;
> --
> 2.43.0
> 
> 


-- 
Thx and BRs,
Zhongqiu Han
