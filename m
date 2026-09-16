Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465C04B405A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789575066; cv=none; b=HXoVWdosEoFbS25BjFL3NFercG7XGDp0iMz5o/kmQQ+2gt6s5PKU2p9UNS30A+97JCd8drI0QFqYoI7L0BqS5H9KCxF6ugQrXA5NXCpYU4ILIRBz1JOWSmo80sbLHhEW8EngV92BOdeP+pEUts+uljAJrQTpHD2GI0+GdbfHcV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789575066; c=relaxed/simple;
	bh=JzvdnnXauYjd8A5b1AIeakzLoTZqHgWYF7j7VAR+Iu4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W7l9O9T7kYzdFk8RuVLgAqLzaZMVpWjfcwZe/00v6VcFiBQbbSV4dJLCvuAlirC8LFLaAUUX34Vm+6pbSXoFqenmSAMO4IkxHfpD4fLeNujaPCSgkDMnNV4mcLq9c3NBK/wOuAHa6KnaR+Qq9b1tz3hwd180/HgSHbooJfE+AVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=msSTIs1L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B147QJoC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="msSTIs1L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B147QJoC"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GFeNGp3709117
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:11:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	enxIr7Y3I8dlTkGaW/su/27Ez9eG1AVWb9x2quhIwvo=; b=msSTIs1LoLn5m737
	Awey76trI3xFjkgmsKbLpv85+AbmFWI7UAqc0zOUh4Ouf9+zdl5MG0ePLqIH4Edy
	i7T7EKNhvpo0WNghWtPCf3TjUacWU/Zu9AC4s/DG/y9aIZCAYkpW/rHynVxURm1E
	4KLCW9QfPaBgAHH7ssLNBhT6oZvZmF2qkMsGopgsBEw0tS9dh6LXx2RNo6p2DOBv
	PLkLpzt2Jv6T7fa8SKf4KfIrEDPJCcJ33TLqXYSPyLteNuENclkuJK0T4iyLRcyi
	Isd6SSaFUlySpIwqcdQLBI1Jr+4xE2A+M4JDU4ckq5HcmbmmaON1nYfY4Wqs37P7
	2qX8sw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqfvfkrs4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:11:03 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c6e562b059so281996e0c.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789575063; x=1790179863; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=enxIr7Y3I8dlTkGaW/su/27Ez9eG1AVWb9x2quhIwvo=;
        b=B147QJoCd5Zc2yfQ0nRLWHcW86WE0E90U/HM6THEZvA/6aYnJMK3qSIuKVyHhB5U0k
         HzE0y/Jlu1WtpQ6rm336rgrtuNJ4EBiUB2AnjfMgsrtEplqUqzWAN5GyHtyEVKc3aLkT
         dhjhI8wVR+EysqXYgEHNUEjmU+ZzL5/AcA/UcD8tT4KYUs+/52HzvkBQEg3ep63VMr8m
         AgTkyY/kIH1TepLGGwhqw339G5L4AePaE6E7lP2kFQIa0V1dpczGBcJfP1mV70V2BRif
         VOksF+WFarU04t4nlNCm1E8H//nQFNH8JEIneIXI+04QmxReE9+R8z1JhOuJoCGJ3+5Z
         AWhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789575063; x=1790179863;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=enxIr7Y3I8dlTkGaW/su/27Ez9eG1AVWb9x2quhIwvo=;
        b=LHSSlhGSKVV6vU7IChdj4uB8xUO5Qmfre6zNK/fHN1b+Z2hU8fHp6ouIgNGYbLyJh0
         vSBdRnWMHIU4csKc24BwPomBpy7GZopqpLpwgemkMHUWJNg8BWq+6GN2P39x+26JvwCF
         SxvIuTSFx9utwYR3YhbtKoWfSbJKB9EtTECUW8MGAuh06aSSEexrOHDnazgBU85iVhqN
         VYRKRZQQSCzrJssXUV0cHwPb0wOR4WkZFbbE9MAEJYb6vaWQljkc0ePZ/qy0+NHavDw0
         XT+XGvUIO33nJfDgmosfT2K1fKOUL3r8Ert+y6eKbIuhicj+RWNCtvF4lstzp4MBkogE
         lOnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzanaZehkTiuqCH20aU+nQP8yMpziyBM7cVTfJnpoC+uu4FFG//Pi4VIADErCx000xMd08ykOgfs52ncaY=@vger.kernel.org
X-Gm-Message-State: AFuF++kwbdiWtWFCTOOdNMk8Z/5kn//Ur9hr/Lab0rYGE20f82pgq1Z8
	/+HEMLQ9v5hRFN4C7+jHWxjPCrcpsQIKi86VQ9ogZrtdhoOmiWOO2wtDkmGrfBzbQ593P8hzFGv
	ot9mXeD4HimGY2L/mI1J7tR73sdCTNuG3hQ38aqm891/FBTwamQXjdxONNr94ur2U1tsnFcfZvD
	s=
X-Gm-Gg: AYBFou0YXrHlJWYQgO3rOxEbJZ+mlvJu/Ij6PaYCWAgOHQ6saHYLrW/6j8h79FeC29e
	hv4VvXQ+z3oWWhituSSMgXmvBVhxH++/8fw6gFgaIFgXqs19GiyTni48XBVYEASxjEFMCulNADZ
	GTCntJzcUY8Jj0G7+A+8EORvQZ28f4FUr3PSxBSVjGqImHuyoaRsj6TmrMRszMP0cYbdgyMSALY
	SsoLtNy+d7LD9GQjgceBA3uuy/zCsJhl9QFwfHdPh2zPtXVJsIslUAAxUD5zr0SCXE5wMY/RUCf
	vkf2obKtC1CajdfEIshZttctJTk2JpinQZ+taWfZDPhS6zXLw/fMHiwTtCSA9m9+jr5wghpjKcK
	XiRQmGvVmK0AtprdHUKxSog==
X-Received: by 2002:a05:6122:464e:10b0:5c9:8c95:62a2 with SMTP id 71dfb90a1353d-5c99ab05246mr1098604e0c.1.1789575063179;
        Wed, 16 Sep 2026 09:11:03 -0700 (PDT)
X-Received: by 2002:a05:6122:464e:10b0:5c9:8c95:62a2 with SMTP id 71dfb90a1353d-5c99ab05246mr1098579e0c.1.1789575062662;
        Wed, 16 Sep 2026 09:11:02 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1d2b0899sm2011603a12.31.2026.09.16.09.11.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 09:11:01 -0700 (PDT)
Message-ID: <f0882d3b-fb75-4c57-b76c-10ac61a5780d@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 18:10:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thunderbolt: Make PCIe NHI support opt-in
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat
 <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, usb4-upstream@oss.qualcomm.com,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>
References: <20260915-topic-tbt_pcie_optional-v1-1-47c4a3d129bd@oss.qualcomm.com>
 <20260916075924.GO106095@black.igk.intel.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260916075924.GO106095@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JYkpPkKV c=1 sm=1 tr=0 ts=6aaabf97 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=pyNrlYXGZy7G1HJoCmIA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIyMCBTYWx0ZWRfX4PMhBC+ZDgBz
 DcPyynGqtRHgwJtVBbi/aFCDD9Pz9WPm/Ql4TXVNTY30iz9V/WHA1r6fGWblMw3Wia+mEecR8eT
 Ynfb7Uf6TzcAxjMd80MV40BrBECHPbBZi6a73UvFGLg07dRKgZ8MTKeU+yweRgDmiIhAP/nW5OR
 6qH38U6gL2HVgpP8BZuw7vgvsb6JMX6iNHBWqUJsxyBtjkiM5IQigMS2fbwOsx2c3enVX6MoCmI
 /dSbjaT9qW0t5PAlQdx8Ucb6gLgej2RSAYfv9xP3CC7mJFl0vGAbPycW+dHZNUNwft9iTvGgiYg
 /2tBWJgkeEiUVkSsyn0xZtPtQRRFA/V2zQS4wTHYbxqmq5kPs9OIUl/DwtS6DsDy0e2T8V4UMup
 JBi6No31RudBdikTFgrya3FWmOtRwPyP0ktJ71Q5vbKXSiCOeqQxi0wNq94uDVIcr6+nqUceJFx
 qLrZw1UrU2PzPy4IPYA==
X-Proofpoint-GUID: Gtp_gGhCxzee7eV3XhxuSR92QDnPQhc2
X-Proofpoint-ORIG-GUID: Gtp_gGhCxzee7eV3XhxuSR92QDnPQhc2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIyMCBTYWx0ZWRfX2VSl0zJHo3wD
 5Ns/DbmEbECeCti+2VvsMxM2sWRx3ijvfxbDecWtM4gnRwc/Wuf8OOQt1viswg4VyFu/jvNKD0b
 hw2Dsdnj/4aWwuPhvha7RthjbHavf7U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160220

On 9/16/26 9:59 AM, Mika Westerberg wrote:
> Hi,
> 
> On Tue, Sep 15, 2026 at 07:04:10PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> With more implementations coming in, one may desire not to enable
>> support for the PCIe-attached NHIs. Allow it to be built as a module
>> atop the framework.
> 
> Is it so that Qualcomm platform does not support PCIe tunneling at all
> then?


No, this is about letting one opt out of building in support for
PCIe-attached NHIs - tunneling stays intact and our hw
indeed supports it.

The PCI NHI driver (which this patch makes optional) binds host
interfaces. TBT PCIe bridges (e.g. PCI 8086:15d3) on connected devices
with PCIe ports are handled by the pcieport driver.

[...]

>> +config USB4_PCIE
>> +	depends on PCI
>> +	tristate "Support for PCIe-attached USB4 and Thunderbolt controllers"
> 
> I think USB4_PCI and so on.
> 
>> +	help
>> +	  Say Y here to add support for the USB4 and Thunderbolt host
>> +	  routers attached over the PCIe bus, commonly found on x86 PCs.
>> +
>> +	  To compile this driver a module, choose M here. The module will be
>> +	  called thunderbolt_pcie.
> 
> thunderbolt_pci

ack

[...]

>> --- a/drivers/thunderbolt/nhi.c
>> +++ b/drivers/thunderbolt/nhi.c
>> @@ -548,6 +548,7 @@ irqreturn_t ring_msix(int irq, void *data)
>>  
>>  	return IRQ_HANDLED;
>>  }
>> +EXPORT_SYMBOL_GPL(ring_msix);
> 
> We need to think what is going to be exported and how. For example here
> ring_msix is pretty common name so if nothing else it needs to be properly
> namespaced and that should be the first patch in the series.

Right, maybe EXPORT_SYMBOL_FOR_MODULES would be more fitting..

> Secondly I think it would be good to have this whole thing as part of a
> patch series that adds the Qualcomm controller support so we have an
> explanation there why we are doing all this.

This change isn't really necessary and my reasoning here was to
let the user decide if support for this specific kind of controllers
should be built, just like CONFIG_I2C is separate from the dozens of
implementations.

Konrad
