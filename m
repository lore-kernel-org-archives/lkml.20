Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF591D7E5C
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789126824; cv=none; b=mhhofJDYGWrMA8ho3XCTY5fj8/RjM+/EmO93+DSDhLnlYEcFKeB6bK9gvm3VSNb2eKPMvaNLhMFa2Xnh8+ZnB8lUseFsk1QIt1Oc3fGIalNwbcg7gagWXZUyUcdUjNrngFHbeKIi9LcC57C+HPDSUMP+lj9h5KXB2K5WFwyuVXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789126824; c=relaxed/simple;
	bh=AiFZxVxb4uPFuB6epvfZYhvtU1oHMpSADyh0bZhRhLU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IZNKsbyfJsSW3UWrNPE1qpgBdkv9FYHWxG813e0YBcBuJNXXHkV1NWtiUli0d09Wahq2m8/7opf7Vn9FCuuBH/tX+7sZm7U+paIjcn7R+xVdCpVZn3ES1GEb4ruveTuSB9JEbKz1W4vyBqZeI7FR55qP7EnQqSDZxcH6powDurE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K9V4kjb7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GR68RKuZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K9V4kjb7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GR68RKuZ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BAqLxq3220235
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:40:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L3Wnep3ucQT0IwQfa+r8v+NvhklcvjC9W+oJ9otiAag=; b=K9V4kjb7SQeHdbk+
	BQMo9NMTrDLO78f2+xH2BQ6KW3qMZHJEqBIiHCohKkU+edfFGLfPn6yTfePW0g7Z
	WCfQSJ+STQbnQCh8oJ7kH8zFnIugyOjt5SoFsvmePuObEHkEOCwAF5mr2XYgjq1c
	yLP3PYzQzgdw56cGFwUO38f6RMwsAzC7cHDCU6971B82yu1IcUIipNE3WeAlVF2v
	hFJaX93I6wc+3GloOuJVPKga+TPcYbDZ0yNUMhlIdDOtcblT3eRXtVPTCkH1qQeb
	7eZ33+V+VXB0lxjnmCBn3vKIJkeSHglHnq9gJiEMfi2fUDliqDYPKMJZTGMgBDsH
	N+ElPQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm729jedc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:40:22 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3968dfff779so1264778a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 04:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789126822; x=1789731622; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L3Wnep3ucQT0IwQfa+r8v+NvhklcvjC9W+oJ9otiAag=;
        b=GR68RKuZNoRcc4TK2tUyu2zrxIahyXQs8s6DczYxAhycK7hqDMyxMn9xGuy1JnDeux
         00eJg5/tajlB7LwkC06043WzNTo95VtUh/PpOsRFjQkLWZaZkcIpw/6DAahJShc9hc96
         XgniL4/kx6S+fsOwiEDY5zmqrqEwr0YwLd3pV629ck5v/8jRSu8YTuD9IBMZcivblt5D
         Gf+GNiHAmlOZgrePKwNci5YV/Wd8CVcUIzWNKTngy+X8YpN5eWhRzRMxoJLv8Iqk820G
         P0xZpOBikPNLTxZlehPtf5u5pAIunBDP/o/LLX02ASVNrmHxzNnH/SqsGabWnL/6eJ8u
         4JhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789126822; x=1789731622;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L3Wnep3ucQT0IwQfa+r8v+NvhklcvjC9W+oJ9otiAag=;
        b=DMZkd7NNO32VfuRQU/CpjXeIUvJ+qrX4/XOS2S8iw0d+SyhQsWO4jwM83fwx79ly8k
         48uRCl2JgOEopHt5MdnsP/wze1IGYbtxmYqxkXeurKdW9jSanCr5H2DDn7hZA8p4GJWU
         6ZakWKK+XYuo3Cix4Z1L6kEGh1ehXGvbYkYnsAoM2WPk31uXtPiyP/Gim59h9ms3rm8h
         UBZqLLOgzEbo2jvoRu26u5Y+lZNO1b2pHSZF80ayI6YgVLZgsHMMZv7mt9JPGrmfs3vv
         KJZnK8E4yQjV4lPEtbG81q3l/jdV8Fw7UUSZaoFtkNZ4NKZp7KvpE1Vsup0Z5w+52d79
         Optw==
X-Forwarded-Encrypted: i=1; AKwUvByX/BEc2FxrTVuSKNecf9vyhvdf2CkbDzewr1hygiZwFsE//Ll4NvRe1Rpir7x3Ld4swe2qo42zHEopIU8=@vger.kernel.org
X-Gm-Message-State: AFuF++l3ia9N+zmHnjYrI36vSyEdqlQpdkKnD1XyYgMaRKQLBvIntail
	62DpSbydscFhK3KoGCVSbLKIIdEapJHww3oMuF33uZuulsTX9hANkzWT4pNkSxjG0XG/SALO0bt
	JXmpqA1f2mstj473CSeQA9M0XIvOCfRHtb5psQXyFcIbsHllgTkWA9yyfmHfv9LWcRQ0=
X-Gm-Gg: AYBFou0HV98p0+UDsNrjRkGVcucrwoiIa5HlNWQi9djb6UonAQz5SGROmlI1ayIZ4QM
	PK3Eeig4u06U7eVkz4JahwHaZqFRE8g6vTRm4i91YGgeLG5ntcZOmbPjEhz9REdLAQa6j369mvT
	3fIxQh+OByW/f0RMUoEhm1qOH8DvQF50JqpBxzwJvOxfVaRzolAsLq/xdZ2H9Oqvyu9qvp0xxBR
	M7cXXvZ+0w+RvvRDvLH3wY6ZwY+Ql1Ezw5fiDAGajR5azLJ7quahLcTCXNAJOJrbvZ66aB00VhP
	PXr8+0yf9vJzJw1Azp4SveAPZIB8uQ+ZAfPArHJaXSrRfvD4f4dPg1rFwNV8/eJLq73ggEbYshs
	xeD2f3KuK6RGvcaWF+Tw+C4WtnTOW7AzD
X-Received: by 2002:a17:90b:3fcc:b0:38e:a52e:a3c9 with SMTP id 98e67ed59e1d1-39d7795b9aemr12122459a91.8.1789126821950;
        Fri, 11 Sep 2026 04:40:21 -0700 (PDT)
X-Received: by 2002:a17:90b:3fcc:b0:38e:a52e:a3c9 with SMTP id 98e67ed59e1d1-39d7795b9aemr12122402a91.8.1789126821413;
        Fri, 11 Sep 2026 04:40:21 -0700 (PDT)
Received: from [10.206.103.83] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fa50efsm6705009eec.28.2026.09.11.04.40.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 04:40:20 -0700 (PDT)
Message-ID: <9a6b7238-11d1-45ac-ac0b-ed34c6109424@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 17:10:14 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: Fix bus_info prefix in VIDIOC_QUERYCAP
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260818-v4l2-compliance-fix-v1-1-77f8076d5ca3@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260818-v4l2-compliance-fix-v1-1-77f8076d5ca3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE2MyBTYWx0ZWRfXxjMuoKvMTfZo
 bSoyDkKXMdfe8Obvmfn3ZorEqZMh2T1GUnjP2i1yM153hhdkhpzDy5Icn7N2KVZPB28u7vpdVBm
 zYNpl5jUTcflPuDMCMPtNuNL/+QCOrk=
X-Proofpoint-GUID: TnJLL1THd00KyjU3rmD5JpG0Qq3gumBa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE2MyBTYWx0ZWRfXwIUas0ntuyAk
 WLjmKt4WwqppGrIGLYYZgrJgZFtlnSGXYz9tY8MkdrYMIh4vfLM2AlawgGRENCIRk7d4nvKU8I7
 TihrrXZFyU/u2dDLXoCL8loar3rZJmZbcSYm+3O8IjSenfCfbaaIwHVDNAXZQ6EtJhqavX+fUoN
 paDWk/zeKljRwocJ/6ppnW4jalbmIaGlTc2n6GBgjwMn64Me9trL6cXFCHaJDT8WXZBZDl4Ue2s
 o55LV0tr58C7ZBMWN/ZsC+PA41iKHmnZM5WyhwRxX1SQR7KX9761h9femzn/D8WkKSUWyXlF7gx
 RaIxsQmCSVcj/yHZ9nQTin7eW0T58cpQFcp+E2yIIeaPvvaoR3mXM0ZRfUiBxkc1kpHo9d/0mIC
 y3FjRwZa+jRHkAMnIa6IQZXiPABnL554SoSPfAQ52pauRqE//1zkv1YCL75WlDr4NY3PQWgj5tL
 SZk0ZIVtl6vO8Q8fWHQ==
X-Proofpoint-ORIG-GUID: TnJLL1THd00KyjU3rmD5JpG0Qq3gumBa
X-Authority-Analysis: v=2.4 cv=AfwkjHXG c=1 sm=1 tr=0 ts=6aa3e8a6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=j3-kLYPpZ4N4r97w07IA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110163


On 8/18/2026 9:43 PM, Vishnu Reddy wrote:
> The bus_info field returned by VIDIOC_QUERYCAP used the abbreviated
> prefix "plat:" instead of the standard "platform:" prefix expected
> for platform devices. v4l2-compliance validates that bus_info for
> platform devices starts with "platform:", and fails otherwise:
> 
> fail: ../utils/v4l2-compliance/v4l2-compliance.cpp(671):
> missing bus_info prefix ('plat:aa00000.video-codec:dec')
> 
> Update the format string in iris_querycap() to use "platform:" so
> that v4l2-compliance bus_info check passes.
> 
> Fixes: 94ef75095d5e ("media: iris: Enumerate cap->bus_info to differentiate between encoder and decoder")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vidc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> index fcbc60016bee..d39ac71a25aa 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -466,7 +466,7 @@ static int iris_querycap(struct file *filp, void *fh, struct v4l2_capability *ca
>   		info = "enc";
>   	}
>   	snprintf(cap->bus_info, sizeof(cap->bus_info),
> -		 "plat:%s:%s", dev_name(core->dev), info);
> +		 "platform:%s:%s", dev_name(core->dev), info);
>   
>   	return 0;
>   }
> 
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
