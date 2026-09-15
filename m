Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97C3419314
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789494872; cv=none; b=KTmSlq/neO5z5GEnN2fXm/MHdQAv/5DqY0G5cdN4tX4nSSChqUpvtFrtA92WMaQ55sfJLVQA5JywpOrvUp/UD0cal7Q7qFlhTsOCx2p6mD6xO+efyrLUw413TmwRXmgZhqh8g8Yq3rGAYqW10FMIdTvKM29m2VIq7ONj5GX6ZCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789494872; c=relaxed/simple;
	bh=YV+k4MpgNhuJvubvbw3E8ZSBt4xX9OCbd5YX9hWrDMY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IYb80gAusjmITgBLFCSveROh/FyTXi7r1kRUYqnqRKIe5qVqIby/TOp6/ErSABBoG/aBuQ2hotJPeYrk/ouYQFDb49iaCa8ztnRXXc+wlbu/fWIU7E+Tj37MY1F/P32QUfj9L4bmCSwaP/hpQcNMZL/4NltoILGbLrYAanckyP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pu/ZXjEW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RjxIwboI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pu/ZXjEW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RjxIwboI"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FHolC5349096
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:54:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YV+k4MpgNhuJvubvbw3E8ZSBt4xX9OCbd5YX9hWrDMY=; b=pu/ZXjEWueQEkxFn
	XvJs+PUx190FjwthFylFreyJFrrKuPIMCq2q7+rVORYQUDvK2ExhPinwx5Dnm2lm
	kuyMPnZdiumIBVgN9DBgzp4DXaR0uwOLZG5+0A7yFkBErBaPIDm6klfAzd4XL57m
	LXJ/Y8+VOf5ipfmuWF2cxvgd0XpYuy+4ILGoirJGNT5oskuA2gKoCl4+FuRuGiy+
	OHnrrptejOuBCLWSfVX4vvmCdVXSzJ9d/jU0H0pzk0AYwCzNupuQJxpOkd66IyoR
	2ZXecJT6vyTclA+TDig9c1OdzUsZ3ayuWlPYXrgy7L84C6k/XTfhNa/NPJHTzIu7
	lWEeXw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq3hc2u8q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:54:29 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39dfcc20aeaso1840976a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789494869; x=1790099669; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YV+k4MpgNhuJvubvbw3E8ZSBt4xX9OCbd5YX9hWrDMY=;
        b=RjxIwboImMRcxBuUPCm9MFuZToYKAUpVF9KT6JpOefQo0smEFyJAtKXvru5vdLTbiu
         5odF0FMjXYixOCIdEzm4Gz7dPeaWY6oukXQcHDXeRU5IZI4lc7i4folqJFMv/97Nv80Y
         aZZMHDezMeUT+mv3ab/Iqex7ZJZdP3bZz/60ibBYV5dyk9Rugd9js6CDKChi+DegBEV/
         DkkB0OpO1NTAVTC1+VN3dS9stVbgC2S36GL7buMQdHARjCqgyEYFWjFinPfVuZoAMAWd
         XOaMC3VrbzT753e6AZSIOMNQksPGjnSj+TnI5+QHFigNWzg0DOQqoU0KFULRbHpCo2wL
         eJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789494869; x=1790099669;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YV+k4MpgNhuJvubvbw3E8ZSBt4xX9OCbd5YX9hWrDMY=;
        b=d09XxJKggio6fv70NUym9qE+HF8M+EDO0Jwg9ig7sdougjXFngTbYnE1kHUDfUO33p
         fMWIQ1Ye5Tbkm/9t83aHX0A+65gLWH/h67o1GHzY7jmtH2iuUmcLiMLjiyCc13XvbMOv
         3LWUNAQsPaYVlV7m2C7s3kxegDv57AluUw1W0PmH2LGDGRo9OslYOEZ/NcRMGMi3pfX4
         PXp8HNQuSp8aaKVNUo0DjskC3IbFhyY4TMF3t1BbYG61H5u4fqx8oSptmmAhvBroojuP
         wZzuQqnoTn5Bhkvl2mdD2brdrJOS2tbYF9vxduV5XQdjExus3xzs8OQUJO8F1+MULaYa
         nNPg==
X-Forwarded-Encrypted: i=1; AKwUvBy0PiNFB5A0Odj0Jh1i3u3hTc6CslQ0cF26Cke/0/AzhTpK0goOpOmh6POn2KNGnalvbIKO/C34HBvD8wA=@vger.kernel.org
X-Gm-Message-State: AFuF++ne7oc0cXr06mH2D8XOs6eUaDI+IdtL4G3wWqyBkJ4B6tXDfADP
	JeGwUtevBCuGSaECeWTQ+6Om79jzBO89mh1I4j5wqoxsjdUUW6wna8u4UxmYn1YibxlMw/CbQFM
	BSOZHdfuOMdJv5hAROjvmhSxVITYPCsuB2xLDnsLlExHraa32Cg5rSPfpVWveUWI2EG0=
X-Gm-Gg: AYBFou1qN/9ZUDOx1W/8asYiOuPUoDJgEk85vmt/+oUi+RPiOc+S9V2jduP2sXNfeWN
	GSPXqvLRspk2XPJ6nsxvtRC+odgnXgoxNMrMiYI05gvZP2v6ZBSbwFLThLzVm0tT7o699qasUn5
	UFHQ0e62p6T51hIgbr6iZreudrVuOUau2A1YUxuvCY8bTnyyBXVTz8r7ZoYzSToinMFrmUuV469
	hRHrKHS+K0gOZ7AvkG7rtJLCrJZIDovoTJNLjoLMeXxiKKSt+hqnNLlhvKjWV/IW6OYHVCWDbE6
	kSe3gg/zAjiFyp8Q4paunSQuv2yhvQD0IJJfYkfT2n6NX9DHuafsJ3WE5lPxb+hRoZRoMNkA6bK
	WX9VrPR583gixlNpcaec0cgODLbiEGy3nQPYUH49jpi/dJQ==
X-Received: by 2002:a17:90b:28d0:b0:39d:f5b1:e35f with SMTP id 98e67ed59e1d1-39e11095fcamr4218082a91.25.1789494869079;
        Tue, 15 Sep 2026 10:54:29 -0700 (PDT)
X-Received: by 2002:a17:90b:28d0:b0:39d:f5b1:e35f with SMTP id 98e67ed59e1d1-39e11095fcamr4218025a91.25.1789494868480;
        Tue, 15 Sep 2026 10:54:28 -0700 (PDT)
Received: from [10.177.238.120] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d13ee7sm306945c88.8.2026.09.15.10.54.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 10:54:28 -0700 (PDT)
Message-ID: <362574de-c709-4e78-9b88-4bc4e0dd7c7d@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 10:54:22 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] pinctrl: scmi: Replace get function and group info
 with generic callbacks
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
        Linus Walleij <linusw@kernel.org>, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260731-scmi-pinctrl-generics-v1-0-8affd2b79a6b@oss.qualcomm.com>
 <an7RL_mTsznZjeIQ@pluto>
 <56107a6d-962d-4508-a1d3-7a6e9e2af887@oss.qualcomm.com>
 <20260907-airborne-cobra-of-democracy-a9c411@sudeepholla>
Content-Language: en-US
From: Alex Tran <alex.tran@oss.qualcomm.com>
In-Reply-To: <20260907-airborne-cobra-of-democracy-a9c411@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: DToShgM1nw_1s5zHrxBEJxXWClqUDNXn
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI2MSBTYWx0ZWRfXxhURfLPe8vPp
 MQpi8xuvdrSHzMoFD3tx3W45Kc6XT5PQjPj9wKlOPhs1tw3yrg2BGqyGs1/wlRxZvMPTp5Y4TaR
 x25VeDJB+hP/1o+wuUKM8H86AwLq0j4=
X-Authority-Analysis: v=2.4 cv=dcUVTnXe c=1 sm=1 tr=0 ts=6aa98655 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=8qBNkTY05YfpeKCp1UkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI2MSBTYWx0ZWRfX+nPNvmhecAIr
 RuR9jP7/JWbmMrdtOVudE6WoapS1m+u1wnAxvhfKlE5NdEv00vCXZyxB+cSi12Ym9kQ/zMB+NaG
 FGxCrjiWSVmbBl25B7ErZWPtrXSF/HGWwZiZ3jxw3COO00eriqTDqVLhdLaxJ4jm2iABOFZuvTZ
 f1xOT7W7ikaYZ4yFamU0ND8u5yGuilXxC2qLtA474ZkecftZhZMnmarx8Ohb20iZdLMpfuLLBjZ
 VyOpst9G9YIN3wP8OMafsQPTsS18uOmQafWaTRK8QSG5ORwlzsjJmzj4wQoW92gQYSl+F3tIiL6
 NKRPS674pXQj62Ehk5GNaY4WRTFlILduBVewZMV949cUoBL6A6g5P7MVOmGqRZRM26bM0l6PZAP
 YlfMjFfp0zm4DBMgrjiYKGpBEB9hSGafYG6azGzmr0yRn60u7OmRTmb7+iHEGpMG0FDnrE8tZwy
 NOLo9iURciOoS4hdi/A==
X-Proofpoint-GUID: DToShgM1nw_1s5zHrxBEJxXWClqUDNXn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150261

On 9/7/2026 1:53 AM, Sudeep Holla wrote:

> On Fri, Aug 14, 2026 at 05:05:27PM -0700, Alex Tran wrote:
>>> Hi Alex,
>>>
>>> I gave it a go at this series on an emulated setup and with these
>>> changes I get:
>>>
>>> root@deb-guest:~# modprobe pinctrl-scmi
>>> [   15.329932] scmi-pinctrl scmi_dev.4: error -EINVAL: Failed to register functions
>>> [   15.330259] scmi-pinctrl scmi_dev.4: probe with driver scmi-pinctrl failed with error -22
>>>
>>> ...not debugged any further.
>>>
>>> Thanks,
>>> Cristian
>> Hi Cristian,
>>
>> I've tested this series on sa8797p hardware and did not experience any issues
>> with registering functions during probe. Can you provide me with the pin
>> topology of your emulated setup? I have a hunch that the topology may
>> contain a function with 0 groups which is why -EINVAL is being returned.
>> The previous pinctrl_scmi_get_function_groups callback considered a function
>> with no groups invalid.
> I found couple of feedback from sashiko valid, can you take a look at all the
> comments there[1] ?

Hi Sudeep,

Sure, I'll address all the relevant comments from the feedback and send in a revised version once ready.

BR,
Alex

