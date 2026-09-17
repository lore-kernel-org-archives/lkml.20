Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9908B2192F4
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789648239; cv=none; b=J/CmX54VdLqrskp7LCVIF5JpxlQBr9LLkgyuDcXyKUjRVTlbhy0Qd7XzAhLbIJhXhFQSp94Efvhk+X2xHIGJpREkd3e/uy3TYs7sRKz5ZLlqC+Dett8rn2PuxQGXEMicQnI8Ji7RMuAgc1lurO4FX7BAYCJLpw7BKWPQ2jA/28A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789648239; c=relaxed/simple;
	bh=IrEZVxtAcGTWTQmjcP4fBFtJejLljjOJ0I0fPBSWZMY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gv3RRhtbWYO8lZB7ajw0zAEMcAo7Al6lM+vvxSO0FTcbHw6pW6MQvK+Kn9VGRWNtp+oU7u9+9bfiJPGOOdh5EU/HqrkIb4gtneE/H/qAkyv+bcC/HZXm2Mc1o7tyfFoA84qDLHSLSvKyQ6zREfw6UIVLjObWxRT9jc4/W3+JZ4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jRuDG0nf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KvxaQuxD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jRuDG0nf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KvxaQuxD"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9a2PJ1390561
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:30:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4q8gvMIQDTw2ylw7lWi4SL0F8ENS62IvhhPOrledFr8=; b=jRuDG0nfCRc8tTIE
	2ZwZFAIVF6SWkB2EYW2iUY7deRCRkNNw790SGV3yu5Q6vDwbfkL2hUbvxuL+h6p8
	YQd89hGJZxcVnQXwMjC6XBZ7WCojS9/S1sjQA4jEx4lfY7aELArzv4cnNqduxJr9
	zgvhsYAOnro9uxHBtfmncT6flZg+JUs9AXw7Y6R6M6wD8Lrjvi09JEW8TxXU9jYQ
	/RFuHB/baJaHPJhil75ntjtmdoMK4Ho4DdJ9H9QFST9ZOJ5zjRq7mrb5WBUXgD5Y
	Q+FeYVlS9WdoUpptZAezyp5ZC1CF/LN9Sf07UuGv1ymEOjDZ8L0iQz/N3ox/kOJl
	2U8d+g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy2d4bva-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:30:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so1872252a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789648219; x=1790253019; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4q8gvMIQDTw2ylw7lWi4SL0F8ENS62IvhhPOrledFr8=;
        b=KvxaQuxDpV3tGtzSgmwDX5t9VG774PTCI3enSCETwvqBM5jbEs2UDWqStdb/DXTKAD
         13+2V2i2yrd7xFAAcze9SRC3KVI0TNyFxc6hJLD5earfQ8OcMP70GzhscvyqUNB3RjFF
         UDttM/679RA7AhQeDTlFACb46yOtPodtCV0oTwlgWT+CgT6sG9oE6FIwimbGBit14Mzw
         8VRQ/yym/nKb/t12czehm3/cAuyeCXuN2JCWLNDveHaZl09hpS4XMpgVzf9Gs0h46vpa
         dEVzqMVxfNrA6PydJoH2+r7mUaBSFyn3AeJAWXlF0eyzZ/m5gAfpssWWwyW0vZ9PGLsq
         wqgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789648219; x=1790253019;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4q8gvMIQDTw2ylw7lWi4SL0F8ENS62IvhhPOrledFr8=;
        b=U6xTmKiyaCT4JieZF99k5vwHjxvZWvF2t4YkbQlkHI0oRYQPj8/4xPqG68ozzzhjKU
         ZMr8A9AwonTEuixvg9610NVWGYSdaSB0nfVFYghV3FGyTv3NHPkdng7RGHkkLYFk12l0
         Vg7xOa7yAIhHeInnj6hWWCp3S8og4VdrruCfusbGmcmdedfnNesD+4iJWlW2aecvRoFk
         XsHFcokFBE08wsBgRHDEIs892C79E9h0AwBG4Cx1T0vEvo+QRB7l1gypkMu2kVKULKbV
         ofU4zTCdfc9snxyCIGg1F/TLWYxAoiZ6jWRairvibZwsC2IG0MU3aI8tYra7KOnGQw8v
         rFYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwVNuYfdvuCIhPwOBDPZ6KxPUfDRN3WNVv+MQTurS6TlCcSuZzAC15hQ3rWJfQU17moqavPaAWkT3jGFgU=@vger.kernel.org
X-Gm-Message-State: AFuF++njo5BeqgZ/m98oExw3t6LA6VAh53+xBQnorX3QMZ8edj8s/QlP
	UYy8Cm4zCq76XlajLcTjfmgIciXwHnfuwLpmb5/ICLqpUpVK3fpxwuDrQpA5p799UZ2EGakozez
	XsVX8+n+PL0EA/LrJc/fxbsYFWl8BonJwBHGPiAN5p+/pD+jqZhF6NKvqpYQyxncx9WM=
X-Gm-Gg: AYBFou2TlYFaREo45kwSy9L9mb3MVYwzLK9LBAOSbozoIiDYfPnNPqjrkTK40/AnJiu
	pfC7XiXltewdvmBI5+NxsI4rvkgCase9ceLog5Ut4JtAiEYHINZVpdQPqDsoRmT6vUbtWgCdLQ4
	0C8XW1Q0wbvvR0xR/VWavFvqr/iA73z17VWZ91zPf4EFR7Lgf6VJ+eJtdA3PWV8z+mpnybGUao8
	GAt/x+6Y2T/BaNyvuc+H5rcQ2mLV0BNbR911HvnjKmPR+2tk31SSAF1TjJ76DqgaiOWO59z1TgT
	t5rfwtoWAXe5oi/Y+7DvyOKZQ0EIT+svWRHj8SbwBNVnxa553WCg8MPFi2xGdBnkbg5nPAS5tLy
	U/d+uIz8TJWVEfvRh1QigctolSpsWTAY=
X-Received: by 2002:a17:90b:2688:b0:39e:1c2c:1d4b with SMTP id 98e67ed59e1d1-39e1e31d67cmr16479167a91.11.1789648218569;
        Thu, 17 Sep 2026 05:30:18 -0700 (PDT)
X-Received: by 2002:a17:90b:2688:b0:39e:1c2c:1d4b with SMTP id 98e67ed59e1d1-39e1e31d67cmr16479034a91.11.1789648217991;
        Thu, 17 Sep 2026 05:30:17 -0700 (PDT)
Received: from [10.218.9.75] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e361b7266sm5054768a91.13.2026.09.17.05.30.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 05:30:17 -0700 (PDT)
Message-ID: <14caa8e3-63ba-4a22-b95a-f7bc41ded545@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 18:00:05 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v25 06/10] power: reset: Add psci-reboot-mode driver
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Srinivas Kandagatla <srini@kernel.org>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz
 <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti
 <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
 <20260914-arm-psci-system_reset2-vendor-reboots-v25-6-4aaf5c09b5c2@oss.qualcomm.com>
 <CAMRc=MdpuRhbCXZd1xkRH4Rs4g=iGRa1oaeN6vcmP3CjcJpydA@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=MdpuRhbCXZd1xkRH4Rs4g=iGRa1oaeN6vcmP3CjcJpydA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: PRTP6SnFr89B0pa51peQmP13s-RDmM-g
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE3NSBTYWx0ZWRfX7pZg8LlmgHLN
 6XY62SZmrX9G7SpkUhRICIwdKbuJVgiUOWc2j0UsrK4viJ9+PzhpCFodNFdLrDHiF6rXiMQA9Ir
 BfXZJ1W7lS4RR6zn7y9hQGcOIOgJhvk=
X-Authority-Analysis: v=2.4 cv=HbeB3SE8 c=1 sm=1 tr=0 ts=6aabdd5b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=gIm7KJJTxUf_gKF81MkA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: PRTP6SnFr89B0pa51peQmP13s-RDmM-g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE3NSBTYWx0ZWRfXweLsMszp6xnG
 170stVvspqOpNvQtr9D6JoHmAmNwgNG6oemNgmcKC57RVkK0fn2bU5qAQYsCfZUdiQ4rTUr+j9O
 6zY8bNUH/zTlBhbIVn8fInSraBWo0j1R/FFx9qwhi+C/dDG5Xb6P8DmNS758fviOaf95q1WUSjs
 sv+mWpMB9QuJpoyTYfJA4GfMFWnIq3kLSRr/8Tw4+GJeVs7+xnaLzKF7SD43DPCgEqXmXByZRKY
 NmfKCK2JDQlcR3v1WHRkmHxbTUYCMTcnyqiabIJSC42el59OyWFU1eLR5DYGEGeO31Q380r3og0
 vPC3KQb+sGajtH/E1AjNIyi7oAcI8xcSJD3s5wd3ucLyXJBi+G5fcesQPnVk0LKr09dXQGclO+u
 ToQv+kZXMyf7SGOW0nMwjnXR7M9DOx1I7jxwmM3VsKCrmp2aAe9xu28kFjYRK8lL/7zxQsF0lp/
 whXCzBTaX2/VLGcT5RQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170175



On 9/16/2026 2:53 PM, Bartosz Golaszewski wrote:
> On Mon, 14 Sep 2026 16:59:10 +0200, Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> said:
>> PSCI supports different types of resets like SYSTEM_RESET, SYSTEM_RESET2
>> ARCH WARM reset and SYSTEM_RESET2 vendor-specific resets. Currently
>> there is no common driver that handles all supported psci resets at one
>> place. Additionally, there is no common mechanism to issue the supported
>> psci resets from userspace.
>>
>> Add psci-reboot-mode as an auxiliary device created by the psci-devices
>> driver. Define two types of PSCI resets, predefined-resets and
>> vendor-specific resets.  Predefined-resets are defined by psci driver
>> and vendor-specific resets are defined by SoC vendors, under the
>> psci:reboot-mode node of SoC device tree.
>>
>> Register the driver with the reboot-mode framework to interface these
>> resets to userspace. When userspace initiates a supported command, pass
>> the reset arguments to the PSCI driver to enable command-based reset.
>>
>> This change allows userspace to issue supported PSCI reset commands
>> using the standard reboot system calls while enabling SoC vendors to
>> define their specific resets for PSCI.
>>
>> Suggested-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
>> Suggested-by: Lee Jones <lee@kernel.org>
>> Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>   MAINTAINERS                            |   1 +
>>   drivers/firmware/psci/psci-devices.c   |  71 +++++++++++++++++++++-
>>   drivers/power/reset/Kconfig            |  10 ++++
>>   drivers/power/reset/Makefile           |   1 +
>>   drivers/power/reset/psci-reboot-mode.c | 104 +++++++++++++++++++++++++++++++++
>>   5 files changed, 185 insertions(+), 2 deletions(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 9c0334ee2ed2..1c0f111ba197 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -21933,6 +21933,7 @@ S:	Maintained
>>   F:	Documentation/devicetree/bindings/arm/psci.yaml
>>   F:	drivers/firmware/psci/
>>   F:	drivers/firmware/psci/psci-devices.c
>> +F:	drivers/power/reset/psci-reboot-mode.c
>>   F:	include/linux/psci.h
>>   F:	include/uapi/linux/psci.h
>>
>> diff --git a/drivers/firmware/psci/psci-devices.c b/drivers/firmware/psci/psci-devices.c
>> index f1eca61e3269..43e6743202f9 100644
>> --- a/drivers/firmware/psci/psci-devices.c
>> +++ b/drivers/firmware/psci/psci-devices.c
>> @@ -4,19 +4,86 @@
>>    */
>>
>>   #include <linux/auxiliary_bus.h>
>> +#include <linux/device.h>
>>   #include <linux/init.h>
>>   #include <linux/of.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/psci.h>
>> +#include <linux/slab.h>
>> +
>> +static void arm_psci_auxiliary_device_release(struct device *dev)
>> +{
>> +	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
>> +
>> +	of_node_put(dev->of_node);
>> +	kfree(auxdev);
>> +}
>> +
>> +static struct auxiliary_device *
>> +arm_psci_auxiliary_device_create(struct device *dev, const char *devname,
>> +				 struct device_node *np)
>> +{
>> +	struct auxiliary_device *auxdev;
>> +	int ret;
>> +
>> +	auxdev = kzalloc_obj(*auxdev);
>> +	if (!auxdev)
>> +		return NULL;
>> +
>> +	auxdev->id = 0;
>> +	auxdev->name = devname;
>> +	auxdev->dev.parent = dev;
>> +	auxdev->dev.release = arm_psci_auxiliary_device_release;
>> +
>> +	if (np)
>> +		device_set_node(&auxdev->dev, of_fwnode_handle(of_node_get(np)));
>> +
>> +	ret = auxiliary_device_init(auxdev);
>> +	if (ret) {
>> +		of_node_put(auxdev->dev.of_node);
>> +		kfree(auxdev);
>> +		return NULL;
>> +	}
>> +
>> +	ret = __auxiliary_device_add(auxdev, "arm-psci");
>> +	if (ret) {
>> +		auxiliary_device_uninit(auxdev);
>> +		return NULL;
>> +	}
>> +
>> +	ret = devm_add_action_or_reset(dev, auxiliary_device_destroy, auxdev);
>> +	if (ret)
>> +		return NULL;
>> +
>> +	return auxdev;
>> +}
>>
>>   static int arm_psci_probe(struct platform_device *pdev)
>>   {
>>   	struct auxiliary_device *auxdev;
>> +#ifdef CONFIG_PSCI_REBOOT_MODE
>> +	struct device_node *reboot_mode_np = NULL;
>> +#endif
>>
>> -	auxdev = __devm_auxiliary_device_create(&pdev->dev, "arm-psci",
>> -						"psci-cpuidle-domain", NULL, 0);
>> +	auxdev = arm_psci_auxiliary_device_create(&pdev->dev,
>> +						  "psci-cpuidle-domain",
>> +						  pdev->dev.of_node);
>>   	if (!auxdev)
>>   		return -ENOMEM;
>>
>> +#ifdef CONFIG_PSCI_REBOOT_MODE
>> +	if (psci_has_system_reset2_support())
>> +		reboot_mode_np = of_get_child_by_name(pdev->dev.of_node,
>> +						      "reboot-mode");
>> +
>> +	auxdev = arm_psci_auxiliary_device_create(&pdev->dev,
>> +						  "psci-reboot-mode",
>> +						  reboot_mode_np);
>> +	of_node_put(reboot_mode_np);
>> +	if (!auxdev)
>> +		dev_warn(&pdev->dev, "failed to create PSCI reboot mode device\n");
>> +#endif
>> +
>>   	return 0;
>>   }
>>
>> diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
>> index bce996bbef28..5c349f41e097 100644
>> --- a/drivers/power/reset/Kconfig
>> +++ b/drivers/power/reset/Kconfig
>> @@ -360,6 +360,16 @@ config NVMEM_REBOOT_MODE
>>   	  then the bootloader can read it and take different
>>   	  action according to the mode.
>>
>> +config PSCI_REBOOT_MODE
>> +	bool "PSCI reboot mode driver"
>> +	depends on ARM_PSCI_DEVICES
>> +	select REBOOT_MODE
> 
> Needs: select AUXILIARY_BUS

Ack.

> 
>> +	help
>> +	  Say y here to enable the PSCI reboot mode driver. The driver
>> +	  registers with the reboot-mode framework to configure PSCI
>> +	  reset commands, which are executed by the PSCI driver during
>> +	  psci_sys_reset().
>> +
>>   config POWER_MLXBF
>>   	tristate "Mellanox BlueField power handling driver"
>>   	depends on (GPIO_MLXBF2 || GPIO_MLXBF3) && ACPI
>> diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
>> index e31cab4ba78e..45d8aaaffaa1 100644
>> --- a/drivers/power/reset/Makefile
>> +++ b/drivers/power/reset/Makefile
>> @@ -41,5 +41,6 @@ obj-$(CONFIG_REBOOT_MODE) += reboot-mode.o
>>   obj-$(CONFIG_SYSCON_REBOOT_MODE) += syscon-reboot-mode.o
>>   obj-$(CONFIG_POWER_RESET_SC27XX) += sc27xx-poweroff.o
>>   obj-$(CONFIG_NVMEM_REBOOT_MODE) += nvmem-reboot-mode.o
>> +obj-$(CONFIG_PSCI_REBOOT_MODE) += psci-reboot-mode.o
>>   obj-$(CONFIG_POWER_MLXBF) += pwr-mlxbf.o
>>   obj-$(CONFIG_POWER_RESET_QEMU_VIRT_CTRL) += qemu-virt-ctrl.o
>> diff --git a/drivers/power/reset/psci-reboot-mode.c b/drivers/power/reset/psci-reboot-mode.c
>> new file mode 100644
>> index 000000000000..bf2dd6626feb
>> --- /dev/null
>> +++ b/drivers/power/reset/psci-reboot-mode.c
>> @@ -0,0 +1,104 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include <linux/array_size.h>
>> +#include <linux/auxiliary_bus.h>
>> +#include <linux/device.h>
> 
> [
> 
>> +#include <linux/errno.h>
>> +#include <linux/init.h>
>> +#include <linux/kconfig.h>
> 
> ]
> 
> Why are you including these?

errno.h and init.h were added for EINVAL and subsys_initcall()
- will remove these. available in psci.h

kconfig.h for IS_ENABLED(CONFIG_64BIT)
  - will retain this.

thanks,
Shivendra
