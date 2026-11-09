Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794231017;
	b=1u5IE7Pf3LGNejIFhIZb6w1SlBh+bw6Q1e8wbBcJqq5vF04KweWjyQSTh03mhlvdzYr2
	 //N/wt8xh94p8STHBG1gk24X5LlIj3ecbDiINxQ1JGmsbDT6jcPudm1J/q4Sb2F4n9MLi
	 Hq3BTOnN3Rg7NhlasPnsAO0tBdP9OGUJO/tN2pVcvzuZLnJ34IE+RZ+v43jw9vZ1H+5Mo
	 CGWVRuAiMDwK3cKecY0+Xc8ZCUdxlOYGPFXz96XRrDQvZCZj40pPxqBIVBQUHECwDcpan
	 uMCoAz13PMNASUVPERnpWrk6SvLGl40Yue+nwInyiB8RzKdpEM1UNTEDJ29+CjqLhOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794231017;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3xWoTCJX7g0Ymvrlgv8LUIarTuXZICxScd6KoWd+6ds=;
	b=os39CWUhiPAAkvxCZ7N9fkUXFm2DHf0/RJZg1rIcLe8y6tTEwC6HuN2lT2NcJvj/TA5G
	 9ANbHg0XmEi0RabzL+3kPuLOP2DzimBqQMyLwhcEpZ/ahQ8oYZt/cR+3d0NalPhtMA1dB
	 bNIB10TyhO7PW5cD5OijDkTjffGjdp++KIx9wIXayWst4mK6LLgkndZoLO6hCKIvt7fWC
	 OaCgFGhB2eNbJB8vhk3YTiQfDtlRTW2sPHJ91gjVUp9iy4v18TWWpJDAF+DxJLNIbAKrv
	 6uNRzz7yvnTTC3cV3ObnAwwd3Rjw3rjhjm/qmbyIdcO8holTeHJRwlpYCfe94vtHjHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HbinuI6i;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NoY695KL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061E5606A330
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:30:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 061E5606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HbinuI6i;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NoY695KL
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFHGT985145
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 13:30:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3xWoTCJX7g0Ymvrlgv8LUIarTuXZICxScd6KoWd+6ds=; b=HbinuI6iFwunE/J2
	ndoJp0ER76Ir2F3muz27Qg7Hip0+kV8NXThoG+/nKdcIcW1t6F+Msm3rHsIpQsZo
	om+eiEB7uW1kUdA4n98FK/I9MqtIh3er0T/5ANmFhhrjbv5HsW2qFI5db8T6fTB7
	YYy4JGBXcmP3mu604L8yKJ7EB+tezNWVqxlAt35Rmo2RjSkfAykzCf7X5TBom8AR
	CzrTZ2H6W6i0/wr9eTy5nJ0EvidNXbp/YBKnkfmx6a4KfRufAfLHi8OdqDf1RboW
	6NsBAb2VChWi6J0A/7gb5d5nvxoR+tfc2uWMVIa55LO7ILcf0GZAL2ufZ9EiNXkw
	7BFKGA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsujxej7x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 13:30:10 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7d2d1f86515so21943137.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 05:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794231010; x=1794835810; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3xWoTCJX7g0Ymvrlgv8LUIarTuXZICxScd6KoWd+6ds=;
        b=NoY695KLpf0/jKbuflSLGuUrmX7DxBwa5NQG0BgduFVVv+xlLz4G7swACOWhdauLmK
         lICreJJGh8JOJbkb2ReTQ9cjzCI1pb7eho+BlrcNn2OxKppP+WsQrxhleCtag78kE9xv
         G+243yRuiF9ejGu/0XWTzmP5ig1bcc6WQGhmNBR2ceiEGkSmis5vN+QLMn7Ro3nzAxlG
         dqNLiuBDPTYFZxc88+rXLG3CmQFJfDbr9L7Uy6vzfvJ4cZ77wqyehN+KiRV1/76gD2IJ
         XIcG71UyEwU9xSKlVMlZoepA0EHR6wyDQXjM+ccq8P38E/MLfjEHlrH6yxHpQStT3zl1
         TP3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794231010; x=1794835810;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3xWoTCJX7g0Ymvrlgv8LUIarTuXZICxScd6KoWd+6ds=;
        b=XCfbDG2p05QXpPg3Zm89uYITr2bQlQ7sNNkqkWU+5jcMXqMP/K+ZCqYq5ZUy9D/SIC
         a3aVWYjpYy2mHF1Tx/61R6fFA64bclbKV9WT8Ci3OVNjWlBoGRu9dAUlLEW59Wx80oXd
         3qFQJ1S6BgjPVcRnefzPSK1vxGPa95z2xaR8zFA4y69LxVSpJAfdUrSYV9GnQ/dYSswG
         PteVvG1xkQR0Vf0rPs3Vwg2X8UEEVu0l9oJvADzfTXY7OzXCv8qVmZ19kNWpEDmUKy8q
         6pBj2m73CO4t1f1BGobP2e6XapjpvSW5JHZc2AlXckSNV6GT/Un/lMi64jcN6XP2/slu
         hl4w==
X-Forwarded-Encrypted: i=1; AL+hErFDuQp4R9uLpqtayoC11Ju2ieT82No2thbEzSaZZPe+V8sY/dTiNbZ/4R+0ObGq5fIj7cNFh0S8SRApSf8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JVVHoNJDbTBQ+/gKxF0BKSlHhyLFREhKK88rYrcpjkplzxYR1
	OPB8zH2I5bcFv+/pUXdqI5q21TsPkNrq+UuvmvP3jRKJfZTAGCnS4rfli2y8WhiFrEDLXnFwu3M
	UjOySziTI354GPT7+CWwVyqY4kKHYDPozYEplgemv/NwfJaLia0cFO3cuAltaXHjc2yo=
X-Gm-Gg: AYBFou3MfYVaBT12f7MF+oreYqXY6FijCatguQ510n4OvzB+d1AHuNTzY0+CS3xAl18
	2nmXF5eTmvNuvbxe6dW+SgSfas1g7H0Whyhvs95qG7/bZWEz/yS9AxAyypetbbHZIfHcu0NbOuB
	naFR5InaCDO0YuVo7/TZw3Zpn5cP1SLWqOYIqIqUiElAjoY8e4kdRsCYc6Bt6u+dMHkjMNkfexQ
	8BA/R/qlr2wdLLaciS+nFBeOCL1SFrGrsXrkcm6lmvmPhzL22moFuQLquG2o+xf1DjGAbrscmIt
	HCKa7wgkBb48NOFwRhUTZqrQeQQ9iStMyvAQULfG0IiAeLlltFtXjQKvjDgjFSANweBqdeU/x0i
	L+EpkjeAacz9J4jssdTfpsHrEU3BP7eDUEJ2fiteVdD9Fmg8Dz8CNUg5aaHLsXhqEzLcqjw==
X-Received: by 2002:a05:6122:84c:b0:5ec:b681:f4ca with SMTP id 71dfb90a1353d-5ece73a16a0mr924057e0c.4.1794231010042;
        Mon, 09 Nov 2026 05:30:10 -0800 (PST)
X-Received: by 2002:a05:6122:84c:b0:5ec:b681:f4ca with SMTP id 71dfb90a1353d-5ece73a16a0mr923985e0c.4.1794231005511;
        Mon, 09 Nov 2026 05:30:05 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a999358sm170236466b.78.2026.11.09.05.30.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 05:30:04 -0800 (PST)
Message-ID: <f942043d-a46e-4792-b8cc-a00280eef29b@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 14:30:02 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] interconnect: qcom: Add Halliday interconnect
 provider driver
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261109-halliday-icc-v1-0-def7cf786f75@gmail.com>
 <20261109-halliday-icc-v1-2-def7cf786f75@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261109-halliday-icc-v1-2-def7cf786f75@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: E3y_wud0Q5JqNHIokuO1g7YSYR3rhqQ1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1MyBTYWx0ZWRfX4yZhMCCNgYO9
 FWsxvXhpDb6XrBQo5cj5g4WonFvy42AEuY3mfC6qfOYgTbJXye0EmBJ+JkPW5rkUQ3aADApvvFX
 B+MKWCLCYm+3Kre33N7GQ4N7ZksrWpI4aJPB8qPFQqzx8h5FfFpW8qalau4cGXu1KeK9r1vSmwo
 ChQGsT+oZNE1xeflMuXl4oFjhiZnUcAoQyb0JyrGrWsYrla4K6nSi+Q+qG64zm7lGQ8NFUPyAh/
 rv2cq4WVFkXLkpkq10jB+LfOox2zJr/eS4L2rXQpM7LWozTmDFmb2yWp04mqhgIycX+z0MVbGP6
 NXJK6lpUXlI/wsGQZ+eyKmBWMKDONjFiK7nKdfXuAJMkaRn3h99CCQKN7dZXFu6E8hSl0Ja1sLg
 I1iQdzmfRS/rhkIPAFSbRvOO0SZPso+Qd+sYxZ/WzdUOz88ZgHNM5t9OLsy36yTamq2IPJXnhwA
 Q2jn6B0m86X3O32gY5g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1MyBTYWx0ZWRfX3d3zPNEFLgjU
 BZUE5UPp3Aj63oPoFbAe6PZRxTZtn1BWSFHMhJI+IXfeyqj/6a5pxrf46BbSZ8o4dZcyKbhbvwn
 EwCc7a9rWi9J0TTAoUTT8S0KoXwfIlI=
X-Authority-Analysis: v=2.4 cv=TeIDJhQh c=1 sm=1 tr=0 ts=6af1cae2 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=s7ymY0F4v_VPunFmiH8A:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: E3y_wud0Q5JqNHIokuO1g7YSYR3rhqQ1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090053

On 11/9/26 1:29 AM, Stanislav Aleksandrov wrote:
> Add the driver for the interconnect buses found in Qualcomm Halliday
> based platforms. The topology consists of several NoCs that are
> controlled by a remote processor that collects the aggregated bandwidth
> for each master-slave pair.

[...]

> +#include <linux/device.h>
> +#include <linux/interconnect.h>
> +#include <linux/interconnect-provider.h>
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <dt-bindings/interconnect/qcom,halliday-rpmh.h>
> +
> +#include "bcm-voter.h"
> +#include "icc-rpmh.h"
> +
> +static struct qcom_icc_node qhm_qup1;
> +static struct qcom_icc_node qnm_a1noc_cfg;
> +static struct qcom_icc_node xm_ufs_mem;
> +static struct qcom_icc_node xm_usb3_0;

Please take a look at the newest files in there, you can remove these
forward-definitions. Otherwise, I think this looks good

Konrad
