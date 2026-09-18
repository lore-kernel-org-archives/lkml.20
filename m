Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40F24F392D
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726586; cv=none; b=W9nDKGy9xqZKlPG4UTrlJ25a6aGpuAbeiLvJu1zyo856b5A96PJxOD6LoVhQwhkWy1cm0biJ/T671G5NZmF+aj5GAzu5OFMnrkWX+TS7+GhHOCoLzyUDHiW6YU7dBoEXvuGfIom+i+Bw+vIHOqiR0HK3KcnadmK8rNz7iA/PFLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726586; c=relaxed/simple;
	bh=GKSirKHvfn9lZan03ZeAgUC1tA3Nnr12Pp3mvCfeg8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t+tq6BJmeDpIkM0sv8zgSpOAxf/55fXe/f6ZjCdUfKSyZ9xIFTOJrokzLmKt0/PSQmDyz1DlkJeEyeDv/hu2qVe0ELYZq/jQgjbtrJ42OG5WJHO29V1ZHvEnHsLd6X6enrsmj09wyAQ5CVUqo7wkK9x5z4fz2q5c6SyCDyyF5HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m62CTU1Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ng7N7n2Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m62CTU1Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ng7N7n2Q"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9daKi385309
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:16:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lkWvd6wXs7ggjF+yLAJdymgWMfkLNdqnHiJr+Shk/Qk=; b=m62CTU1YnGapAeDc
	+qy7Soc6UKFvvtv+bZtezgCUvRpCy7x9WoLiUAuzSwXaLcsIs2vpyBQiqiD1qxlg
	4gu7HD2oaZnE2c7oBLTBTO+ZWNzFqctmWuwsEiFldYgdTJI1Rc94jm1zTORMfwdN
	Enz3kgmWZ7vAm8RKEXb5U1ZAo6GvmEqCjfSiyLzXlWYp9N82JQ0iDG1ZmXKQAU1S
	k92qUVLmxi8kWdJo5RtKARbqTr9LqLWILs3fYPDOjPlkn2jQ4D/Y3XpEGvCNjPOp
	IX43ijDUmFzVlZqdhl1kH0lIZtaqNdTTlzNNRRWDhO1K3MV6JGS43+G8Zm/8vCwc
	aiiiwQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grwxrsduv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:16:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936708f129aso90677285a.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789726579; x=1790331379; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lkWvd6wXs7ggjF+yLAJdymgWMfkLNdqnHiJr+Shk/Qk=;
        b=Ng7N7n2Qt9EHMGJEV0tbpOphKfQ7n6eBEPwF7NODJLVbhpTNNgFysN0/zeXVHGgLiM
         48FV13CfdpDyvrgUBJrWck7LuDvISq4OQ2Sypnid9FQkuSud2kLcmiV1X3WBttqQ6bbC
         nn8FYPUI8+JYerDca85f6GRbsyjU7qstYAQETUcMz1zA/wR8TITttWwPtZLER9ntM5lw
         X+ffrunBK0PHZ4hTz5jE6xOvno5sx+Bdp55uhDxFqABZbzeTN9G5uBSMgy8DoDnfX3PO
         6TM3CP4W+L9qHwDEh9xQl3/r53cxTQa+yQERhVciegosBtHjcmBWr2QGS0dUvD1ikfla
         YpOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789726579; x=1790331379;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lkWvd6wXs7ggjF+yLAJdymgWMfkLNdqnHiJr+Shk/Qk=;
        b=pg2NGXsVGiitfS5xgorJ3Y/vUJ5gCS0FoEGxaidqrrM/N+52I4E/iPtxRlqMlRiHXr
         Fhz26mgjWk31AbtxYNoANo4SAjcFqpEzoPdR6xr/OMjWrMoEEQTkIksmzROhh2KE+yj0
         hnj72dHgYGR0OX0FTkraY/MSSEVu34Glxd1d5tGsHl3/ODQa9pwkwZqUv8ksxKu5qvdW
         BwLfpGPDcbaz3EoSLhvPhOswSFLiaZgG8j9VYWDx2l2scxM5E03ld5JeYwZjMiN0GLct
         2JXfTI5tEozqn2X0z0aiVIkFCb8hJml3dS07N+Xeuf83XQfdHkfjA8IgJKelwgU8RWq4
         j3fA==
X-Gm-Message-State: AFuF++kkypU6dlvgbEJNqt+rX9JPMESKzh1W6Nnd7cIptvrtBmIAT4XO
	Uaja7AoxwgRoyEiU/WYuc5J2AiM9CGkedz5IY02e2f8ZUM26RBVQDipJ7/QXH0b5iLyRXd2zTvn
	S+udlrtpTEBJzpW9Q9qFCBawMYqD5c0uX62LYbnan+sG7K2TY1n43YLcjcihqPafkNso=
X-Gm-Gg: AYBFou3UfETfHu9t9gfqlEBYdBOOC12RrN3pp9u7Wx0ubM1BcAxAeKv96PKlEliMnJZ
	8joO2xkFDS6yitAjIUdTIQ9IaeyUWnLLqA/6l8X6kTC8fdoLur98INRcrN7tVcDEoUjpNYB7Q3y
	Jk8Bm2b4oA6rvF163GVC9wOoLGrwF3PTCCW3c5jEy2WuFr6j5kjMLMOrahieiYmkX6BiL4xXNK/
	59vQYZeLtaazcObND9Bhjr7BWoTEtK+HX/FRCMrLnc9fgftCEjK3fYlQajzLn7RQsAus/5TD4WS
	UbgPEEA6UyD6VQhhc/LRjE/GjcErL9DkEQfq7hcdpW1fWjiFhN73eHio2Mxo/n/OgQHZWT/yIvc
	wy9BouNiEN0/PhUib5FSiY6RFW4mB2MU36ozP3Ed1dI8cq/xBAffKyOvuEmSA5nM=
X-Received: by 2002:a05:620a:2b96:b0:930:f337:ebeb with SMTP id af79cd13be357-93bdc6d5ad6mr217943085a.12.1789726578885;
        Fri, 18 Sep 2026 03:16:18 -0700 (PDT)
X-Received: by 2002:a05:620a:2b96:b0:930:f337:ebeb with SMTP id af79cd13be357-93bdc6d5ad6mr217940385a.12.1789726578407;
        Fri, 18 Sep 2026 03:16:18 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:82ae:cd75:d970:e66f? ([2a05:6e02:1041:c10:82ae:cd75:d970:e66f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd17051fsm147325645e9.0.2026.09.18.03.16.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 03:16:17 -0700 (PDT)
Message-ID: <dcf28454-a583-4f6b-a11e-483d63be3bae@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:16:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal/drivers/imx9: Constify struct
 thermal_zone_device_ops
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
References: <5cce9ea713edcf2aa3c0efd5d31e9d9fd9f40a88.1786220585.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <5cce9ea713edcf2aa3c0efd5d31e9d9fd9f40a88.1786220585.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EMWTQFZC c=1 sm=1 tr=0 ts=6aad0f73 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=_H6WjYdI7YG0SsD1Ov0A:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE0MiBTYWx0ZWRfX/ixwBa6p3mr4
 AXf+fayBU6EHuf1TFLTKl60m2ZaNIB+PMJLRxSwK2RUL9wWohJ1VnLlKzDFnOhVLwdISXQtebYc
 xmP84ikA/N5rZz8BLksk23pjcupnnFS/pcL5zmlrbKsVM6YxyitaPp5E+hKf2+8Vjr91gf3GskF
 KSMhvWgw0PriAmuTrXcE/BnbZDuIFgWt0iBiKFyYnCEgcSmShu9RGosxSaIBHEEs5lm57acdsq5
 QHUcME2GQ0vinMWEXHqHY7z2xJYWhdj8sKjdLq5kLmjhgKX9g9CymjqEXAm6QIPIB11dhF06EhQ
 5J/nhyEQFYO35s0szCJ5/RHfxG4R83rZ9vHr2dW1QFyLsMFWvb+Rj38sTKnuvirv/3Pu4RYIMIB
 0Q+t6owR7aLmNT/AMv6dYcGO+4YGaE3kh6erMOpMRhmRgBWuf9lpw53RDeWUPymMLB61NUYAf3s
 wZ9bGwzOHmopFIv5NWA==
X-Proofpoint-GUID: 1MiYX_vBv6tgD0ch-NQHP6zKEjTzq65a
X-Proofpoint-ORIG-GUID: 1MiYX_vBv6tgD0ch-NQHP6zKEjTzq65a
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE0MiBTYWx0ZWRfX3ZL310bICYhh
 u5agUGFLPIL3aQN+lkDTscZO88nsrhGvpfU7n80oVWIBk9UXYMAXueewHDhJPCxJ5PYwtdyFRGF
 1X/qE6BnG2lK8sd0jpV2FX3upFYFG8I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 spamscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180142

On 8/8/26 22:23, Christophe JAILLET wrote:
> 'struct thermal_zone_device_ops' is not modified in this driver.
> 
> Constifying this structure moves some data to a read-only section, so
> increases overall security, especially when the structure holds some
> function pointers.
> 
> On a x86_64, with allmodconfig:
> Before:
> ======
>     text	   data	    bss	    dec	    hex	filename
>     8567	   2144	      0	  10711	   29d7	drivers/thermal/imx91_thermal.o
> 
> After:
> =====
>     text	   data	    bss	    dec	    hex	filename
>     8695	   2016	      0	  10711	   29d7	drivers/thermal/imx91_thermal.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Applied, thanks

