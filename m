Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4646846DFE5
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790151353; cv=none; b=uqGyrVA+CmswSaPS2+5K4HtS/TXDCPUR5nII9UawHoWvWSnAMyHO44RP1QeKyIqG+aUIKv+mgPoiTWY9y4VbkEJr89HSBPouFYQIlCT0QWquGaEgOn/eCHKd8o21ldFjodSmjTp6jnje18hX5XA08XoqIoJ1d0jZKl1lgzzlKaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790151353; c=relaxed/simple;
	bh=Arm8zT+/JUhQkGb7yad6BvTCVvWlZBkot9k6kvbpgZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IaK9GuR2BL352Fsz+ALbLKZZzwNm/OpjIHnKUkyQvuvdgeIS+X9pSX2Nr8MWdF/uzNkJDyfTrFP+osF0LYh1bcmQJtQeiTY3uMOWUg9y8+mMiABpX6Agtl0tLaz+oOYMDcDIwfBaBCAXPXAAmpyGE85gdZDeOgR2UoGv03C6kos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GCx6575p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fOtjS6Ag; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GCx6575p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fOtjS6Ag"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N79Yst3174845
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:15:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EgqVn5JCTg0Wh+1+T3L2Kw7No/Apzuy2f2xoTJEufq0=; b=GCx6575puVozFU4f
	I5EKrRfK8kuUJkac1Vm+uvx2r0babcdryEhpN/h583+8jtloZDVr5te0hA732sBb
	UTsTnPEJtRYTnQmeOXJ8NQpRTifYxznjKrQCDRPZRZFcPyIb2xxwj2vK6fuM7waM
	Jq0SL1xSS9PbACfMVS3C2v34oIN3QNjps/GbMIa5j9+Kz3VA3IYPN5UZaqWEeFMo
	Yoi7LXXWUoO1TLgEnk+FKwGskzbJjVEMTqIFibsw+Y188LtsQltZALvthNo15r0Y
	/E6Hq4ZBohHi/xRGfHbqp0DCsCUa+kFZOKdREKa6SbujOQmenMQ6wb0NoYi1ZqTA
	VWNpAQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux7xua8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:15:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a0312937eso86427585a.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790151349; x=1790756149; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EgqVn5JCTg0Wh+1+T3L2Kw7No/Apzuy2f2xoTJEufq0=;
        b=fOtjS6AgXEougG2a279yT9PqetxT1JkHH6iELjC0MDPLmoC+b09InBaIeKVIwnCCpR
         r/m+MgaHoeSHR5TImSWtCNAXFcSwuFdB8N0JxXzc2bXfQt6m19ugdSgwX1VwaOAXpDkE
         KvTGbR6552VsvqovQYuNUslIE3i+fY9ScjzuxWIoHrB1hOLfI4jY1W04NNF6Urr3gscp
         n0JFHrViDgtnsrKP1Opd6lp3qvy5xcEPXzKmhpvDaU2xcHzrV1nrDcMnhaPoyhbIIT7f
         r0IRYZnr4+5FeNrJcWD1+QB7AKfCBAa1Mk65ltz2DgcXMBN5OEzc/wXxz6UrN3ALGY8Z
         TykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790151349; x=1790756149;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EgqVn5JCTg0Wh+1+T3L2Kw7No/Apzuy2f2xoTJEufq0=;
        b=PuA2BD73L5dt3vjW5FJdTf7Fls9kfbz09jBbbpkCwmUu1uQ3o0rUfbAD39RKNFNpf3
         OjP2RNnOi5sQk4vrpGhClGowrIwJ08zR5RIxYXRWbvNUKkYfTjgFafKSSzwZIpS10dTF
         8w5/YI8BIZbpqVT3jLSiHETcyGyic5/DtQQ2HkT563Hw0pAuH7UCLSZXJriGuc5DDsUv
         siKP07xfVhd2h9xCwJ5xWUAXJtXBDQ0Cd3RFh9/CevSRxsVGEw4EgtvImS9okXWXJ4Pg
         MWwIbtJAyHCCjltnvkuD844+chbQfS40Ru1HmlWLUG9EifgmcEBcYok+vbrUY27Dxk5V
         0zAQ==
X-Forwarded-Encrypted: i=1; AKwUvBznMjncbK7qPZ2iWqjX0m6BeDSpIOXYFhNbI4EsKaFiF4CgajiY/CTeuBT9FBaQZCwjpGx+unn4I68K3Ho=@vger.kernel.org
X-Gm-Message-State: AFuF++npgY2uXvER8AJyjWDZLjA0OqIgC3YIbtnFw3+TnP+Z0uwXzkOk
	cOKxvJRsJCmUrCh8EqjT8ewxD54ZshsG3SDEJs2C6UdYL75jAmw7y4tF9/29Xzq+BNDlCuBAauG
	E0I+qvOCuIAZhCX8eBbgR2mEv4ITznLbJFck0PsuBPvZCk2l3EtgULv9g0yx/kQYyMv4=
X-Gm-Gg: AYBFou3jj4Paz3tuxIDkTYtDlQ+WDZFEA9+bZhwzrRJdHYiMvOO6lXhefLSIOngt41k
	+JNQkwR5hmynzPLn6Gh9BG4OxCxQwrM6Q6Oewgt6OeDOqW3f6EzK2Rvo/TeLQSJGDGj0By1R1Y2
	vYt0U3dNE2NqlDFhVXBSWLiwhBk/vDjCkGDHG+FJmPVygT/CMpV9evSYgN3zhEd4isGcDjMZOQO
	I3ynieVCvuop/37w0JP91XdZqhPmK3UBcF/gdz6LAZc5W+6KEUVPsV+RxBaRnqer9p2BvWfObsR
	I6j4c0X0bWjKx61hW9EVWa5q1kb8pZBZFuLsp6UhxYVyXRRaGPwuzrAXRK2q+1/T7V9OpRHC+Gk
	BvcLoSYLN5IUwUoem49MbmWS7xU8+YIEyO7NKAc4OHRRSdps=
X-Received: by 2002:a05:620a:438c:b0:939:2d77:d6a8 with SMTP id af79cd13be357-93c251af1b4mr282503185a.34.1790151349428;
        Wed, 23 Sep 2026 01:15:49 -0700 (PDT)
X-Received: by 2002:a05:620a:438c:b0:939:2d77:d6a8 with SMTP id af79cd13be357-93c251af1b4mr282499685a.34.1790151348996;
        Wed, 23 Sep 2026 01:15:48 -0700 (PDT)
Received: from [172.20.10.5] (82-132-216-202.dab.02.net. [82.132.216.202])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fe0c3731fsm42528615e9.2.2026.09.23.01.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 01:15:48 -0700 (PDT)
Message-ID: <8b62c6b1-3055-4787-87f3-1ea990f8b546@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 09:15:38 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] ASoC: SDCA: allow building without ACPI
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20260918131914.681588-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260918131914.681588-2-srinivas.kandagatla@oss.qualcomm.com>
 <arKDa69Aggoo32CE@sirena.co.uk>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <arKDa69Aggoo32CE@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xTlhWq_JPGP5fHM9rBPJA6H9PbEQc4gJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzMiBTYWx0ZWRfX0+kjJ8bDzWhT
 Vjivcx5NWUO+j1eq1NJhABN0mmHkiZ2ZdLFSeLMNJykS0y8pHs9YxvreAJb304QCcG+qxqszizL
 237OYjPZucjVpLSLq6KI3gIBzgQUMUCU93AVFeu7QkbROZPfmE8TqJlz9zh5U76f9AcqdkRxe3x
 W4LvfY8hmleEibj9HmwJr/UBnfcEfC/faI9QrUN9QzqdjEq0atnfLBqtNlgN+q0EHYc+YT3oMGS
 98/WnHeHDp0fmYsYDpW8fzv36MfqFSc+9eHlaWcQvVFrFmTcNOI5MbXS7MuMwpLQ+RRxl0yOje/
 aqxCs9Vd0ljSZ3VSZuzT2zmVjDeM8sz7qkr8NnMouBQ0RyBrofirq2MwLzHy8VcycdVVCxzAvpt
 F03hLDKVtc4Zr96pHC5fQbxxOfXsF3J5sjkoW5gLK/S0QXEZgC9lGP0Gvpw2EUu0cI77aXSOERM
 1G4PSnQ1fVl524HU2SA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzMiBTYWx0ZWRfX8lm/1m0mkfVY
 JsHX4FnlnufsFiURWv9AqgdCX1VXjRcdABXOcV2vTLf5a+vsXryWsUlZ8/CfWcy0I8/4R7Mx3dS
 jg8oitRf3MYpWSnm8t9Dpc+HW/XI4m8=
X-Authority-Analysis: v=2.4 cv=QsDLTlyd c=1 sm=1 tr=0 ts=6ab38ab6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=GdRps4uEH5l7/IE9oLSJdA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=vW_vOncweQm3iN5ZsRUA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: xTlhWq_JPGP5fHM9rBPJA6H9PbEQc4gJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230032

On 9/22/26 2:32 PM, Mark Brown wrote:
> On Fri, Sep 18, 2026 at 02:19:06PM +0100, Srinivas Kandagatla wrote:
>> The SDCA class driver is useful on non-ACPI platforms where the
>> topology is supplied statically via sdca_class_hw_ops.get_function_data.
> 
>>  config SND_SOC_SDCA
>>  	tristate "SDCA core support"
>> -	depends on ACPI
>>  	select AUXILIARY_BUS
>>  	help
>>  	  This option enables support for the MIPI SoundWire Device
>> -	  Class for Audio (SDCA).
>> +	  Class for Audio (SDCA).  The ACPI/DisCo topology parser is
>> +	  only built when CONFIG_ACPI is enabled; on non-ACPI platforms
>> +	  (e.g. ARM/DT) codec drivers supply the SDCA function data
>> +	  via sdca_class_hw_ops.populate_function.
> 
>   $ git grep sdca_class_hw_ops
I will remove this sentence in next version.

--srini
>   $

