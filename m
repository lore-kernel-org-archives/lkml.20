Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED7C358368
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789549856; cv=none; b=IzwriXV/U0FFfJ+XlipH4ItSTrswETSEaJH92EDnEI49hm3JqbNvU6fwleH+hU65mreCgYcO2rsJAeLzZ9KP3pjPBo0wEkb48dyIojA0Fk/2fQQHWWsdylLgJL+p7thZ8Tvu6RdgDMPeA1Jnzd+w/GAWGHHrr6k0h4J04aC8HEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789549856; c=relaxed/simple;
	bh=67K35Pq8eUdKaLCHWbihTSEFG4ynrtphpaQ5hmCXCw8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lJ8Go3V1Gk9n+xLgltsIaB/8vvTBOpOSl0BwK/XYi2TyeY0oa4a+kw3jkYsdF1S/NK6eUzdwyPzJBrCk+NPg85Mluqp3ytNP4yL7DIHPQABfUW7b9z9pbDo8c4Ah6TdX0XF8LiFXGFPJbY0dy19hr2SQgM7c0tsGRx+8ikvW3S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RkOPa/Jx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O7q1Ydtr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RkOPa/Jx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O7q1Ydtr"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G934PH2226512
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:10:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KuRauLYlQk1H80xx2USQGlgiLsnk6ozs85h1c53Dt/I=; b=RkOPa/JxWZk4ddpS
	5B+Z2jMZwFsdTGJnBQQ6W8q6FHyv62SEb4Q5rxc/Vovo792iu+jvLOil9AJdrY29
	krF1CCiG6P9F8kQN0XHR+AfX6Q5HL2pXJXDIgKyn0QOb9xTOBIcFd3iC541yIbdi
	bWtqfcN/xv8QxbyXJWI4mvqgkP2/FfIlA3tViRwEGJwZoneGfFXEQrJn1uR8jMpz
	ldfrRetL63GYuVeyaW+xAlHQdlhdj4PVA8zy/Q9LJl7QVjUwvqXJlxC+cCLX8FxC
	FYoiGmYLgvEdLVSI3CstwhKR8rYoDtuqVrSoodTLIWQ5jiEneuxeC2KqIDczy5WG
	/PJu7A==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqah9uef0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:10:39 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6c153bab4c3so5751343eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789549838; x=1790154638; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KuRauLYlQk1H80xx2USQGlgiLsnk6ozs85h1c53Dt/I=;
        b=O7q1YdtrYl5HkolrgCHuEYpL64/dzcRezT4kAqbHHpY2wKs0yCwPOi/9Wa+8G+CRJf
         39F7efzNf0PYoNgJGK9Ws9d9cBTU0lgQ7DQOpoKcHB2j86rztnerfBdFgYtsnBfmybjO
         aVk01PFL45MvJOL8LykJZxkJBC2uDCmebvFwkMVfdJfZVF9J+mOnznWWujeYuuY4+bNY
         nrnQJ3/hoVssGLg71bpdiqqutJ1NH6Tof2jnxJcwpQvkWQqFT1IXxF5j3QtCObfJEXkx
         r5awL1KgAUakZzGnZes2QgHQNnLG8Y9palWYtXNV++UoFAc8h5yJGNHgXBgMuW+Ajomy
         W7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789549838; x=1790154638;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KuRauLYlQk1H80xx2USQGlgiLsnk6ozs85h1c53Dt/I=;
        b=Wg3Dzrv8drhn1Pw/tLRYfzg7pdjo7qDbINXSBTIxaow6yFpxub3VvCxBWXkgNZRLie
         IK3fOVXV/p3/VJH9jgpUM7aUM9gnuHcsAWVVa1+pabNvnM9m+OCgEn+c9/KIVkaNleS0
         igBw8Wui1bkT+v+sgPzG+mfxXaZNIhxDrogLiaNyeTrJL8/S1CUWF7bHQF+XDHO/YMvP
         9qIpvX0iCItIaMeIje9iuwJXLwV5vztAADfCY7rcfkYjpc4jp9L85RSBcW2t5zdR+zG8
         gooyigjL1/lATdx0dc1CuQmU+eQk/s6E52SQHBNEiyOaVG00p23wHOnF0ky/wAVmGEVi
         DcYg==
X-Forwarded-Encrypted: i=1; AKwUvBz7W8xegJgxBBvtLPqbFbbWZ4lGIIQNDORswJi9uxBaFWvMzr5cYOpWfwDAmtSpbvT4+KVStfMPo8Wy6lU=@vger.kernel.org
X-Gm-Message-State: AFuF++mSMOK6BU5Pg5p7gt68t0DebpBTCeDH2n/AumBlOuFG1yN2ycSi
	JWciWxmk1CfhVlYs0NtMlqYEJdQ+TEBidkzJoxMmwSxYYw1UQKfZoZ12SPp6rxUBQWmHCY+llvS
	4AI6wlyJEOZqoenyxSAUH69MH3OpY5A9pfesb2+HEqTxzcA2CYK/HHb6lSK3PDvJfEjU=
X-Gm-Gg: AYBFou3tTLIGb8XUEUDk9UNQThHcN6kLqyyX+Umd3wfX2EoWMyWui8UUhCtel84zQOF
	LkpRhF8LjboBW7bxm5jh3Qzcv4umA7ysS5sleUfT1Dg5KbhqCKZ4aefCIkAIEyO4cgMGKlcrlgJ
	waCMhzvOdY8vyFc7QcUd+dGJK1tqxee0wm7Kt9LmE3o/JyZancpJo3wtQKZDmPknN/3dBjbydcr
	BMTQaYcyV6Hm1bam1wGG950aJUnUxcCP6FEgniwlu/L3VcP+vJOg2aYyIxmSeApdJPelQfbCVQq
	pklRpv77zhIsf9Ml48HROETYj3Px2Q8OZ173UW1o0w/8X8oR8JKECpOG0/vfrb7l9wLj2NMlRpQ
	7kaHbXkEW4ZokaJtmGHijL3JEZjxyHfzaIxiXnhEq/p0MAL2Cby/AqB7jJVCrVpTnOA4pG07Fh+
	XAdrE57m8O8xovkPLYAw==
X-Received: by 2002:a05:6820:1ca3:b0:6c0:dbd:30a1 with SMTP id 006d021491bc7-6c7d11d686emr1924413eaf.6.1789549838380;
        Wed, 16 Sep 2026 02:10:38 -0700 (PDT)
X-Received: by 2002:a05:6820:1ca3:b0:6c0:dbd:30a1 with SMTP id 006d021491bc7-6c7d11d686emr1924390eaf.6.1789549837946;
        Wed, 16 Sep 2026 02:10:37 -0700 (PDT)
Received: from [10.149.106.38] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a182sm6388715eec.8.2026.09.16.02.10.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 02:10:37 -0700 (PDT)
Message-ID: <0b371ca0-e91f-4ede-921f-9610961bbd6b@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 14:40:31 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: Fix default entries for Glymur EVACC and GPUCC
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260915-kconfig_updates-v1-1-b9bdf35db955@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260915-kconfig_updates-v1-1-b9bdf35db955@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BtkIUoX5 c=1 sm=1 tr=0 ts=6aaa5d0f cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jPJSeZr3LZmqAX0kEZ8A:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-ORIG-GUID: 449-WvyeNkeIyD4RVndage0ZoiGAF0Ti
X-Proofpoint-GUID: 449-WvyeNkeIyD4RVndage0ZoiGAF0Ti
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDExOCBTYWx0ZWRfXzmaJ29r0/AiE
 JAWwiMaaRoRK/HwrJ7u2jtrjcdVcUf1lKo5TE2aE4Z7e1jXoCKvFbMwO7if3qGqjSC9tbfGkcDG
 T8uD9SJTwBQtbrmkvZJd8wtIML58yofEYScGvKqaoK0KSm/had8Dd2f90Z/HYRGm1jn+GiAI53a
 EvCQ3mBFepPt+HPyQY4/nvcl1Nfn2ESe7CimpNbD3H1scA8NJxG6l4zq0xy9OiB8DNuWR7JaIjr
 pljG1BH9lf41OjX6Xtb4axgRP5mDSt3yMC+Jzd79PCObZq+NBv2S6NNuQLaqji8krKPpTedM3kn
 txFvopTCyQwXStbyF8l/1GVBvsUZPGQLzoiFdQMiSVlPqVPrra/8/HRFmNzZaHeob/yN1wb6ztO
 0EaCVeb3ABEL9GP1paEwyf+ww9tI+Rx/Mblel1H0K1pV3IGCOFHL+1nvtvVCleMIjoYVx0ubIvJ
 /UlgW+o7rq2QenZzwwQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDExOCBTYWx0ZWRfX7iqbPj1w8iYz
 ATANcKBXsCOGcek6qu3dzaOl/2Au3WuQMkAm5uc5kNzb4paqO7zYnLxdGFmRZmyvzDWVdDSgvMG
 AsK9Rs5Kbgi86LbUFe+iQMVJCtgwy58=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160118

On 9/15/2026 12:28 PM, Taniya Das wrote:
> The EVA clock controller (CLK_GLYMUR_EVACC) config carried a duplicate
> 'default m if ARCH_QCOM' line, one of them misplaced before the 'select'
> statement, while the graphics clock controller (CLK_GLYMUR_GPUCC) config
> was missing the 'default m if ARCH_QCOM' line altogether.
> 
> Drop the duplicate on EVACC and add the missing default on GPUCC so both
> Qualcomm Glymur clock controllers follow the same
> depends on / select / default / help ordering used by the other entries.
> 
> Fixes: e291ec812dec ("clk: qcom: Add EVA clock controller driver for Glymur SoC")
> Fixes: 67e645285dd0 ("clk: qcom: Add support for GPUCC and GXCLK for Glymur")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
> Fix Kconfig ordering/consistency issues for the Qualcomm Glymur clock
> controllers: the EVA clock controller (CLK_GLYMUR_EVACC) carried a
> duplicate 'default m if ARCH_QCOM' line, one of them misplaced before the
> 'select' statement, and the graphics clock controller (CLK_GLYMUR_GPUCC)
> was missing the 'default m if ARCH_QCOM' line altogether.
> 
> With this change both entries follow the same
> depends on / select / default / help ordering used by the other Glymur
> clock controller Kconfig entries.

Fix was posted by Sivansh and has been reviewed, should get picked up.
https://lore.kernel.org/all/20260821045214.2623299-2-sivansh.gupta@oss.qualcomm.com/

> ---
>  drivers/clk/qcom/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 6ef083f5d9e251d2d2c5592a3f3dd51845dc743b..b3ffe1dced017e6f4bd3f0fa9c11bed5948391fc 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -104,7 +104,6 @@ config CLK_GLYMUR_DISPCC
>  config CLK_GLYMUR_EVACC
>  	tristate "Glymur EVA Clock Controller"
>  	depends on ARM64 || COMPILE_TEST
> -	default m if ARCH_QCOM
>  	select CLK_GLYMUR_GCC
>  	default m if ARCH_QCOM
>  	help
> @@ -127,6 +126,7 @@ config CLK_GLYMUR_GPUCC
>  	tristate "Glymur Graphics Clock Controller"
>  	depends on ARM64 || COMPILE_TEST
>  	select CLK_GLYMUR_GCC
> +	default m if ARCH_QCOM
>  	help
>  	  Support for the graphics clock controller on Glymur devices.
>  	  Say Y if you want to support graphics controller devices and
> 
> ---
> base-commit: 1a1de54f7369cd2b5bac0f265910e60ad3a6b4c3
> change-id: 20260915-kconfig_updates-39a684a748d0
> 
> Best regards,

