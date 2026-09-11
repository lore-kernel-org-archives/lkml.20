Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103A24A99C6
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 17:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789148650; cv=none; b=TRzoUcqz5d29ok6Z5Wq5K9XoQ95es2+E1ep/k89vcGD/IryWk+kfa6uF0EWlnegx+p52DLRUsYtQEN4teRW+dAzlRhKtkMG4RMvn6CM4r+aXkHigrIQFA9d8DTwnSbVrzFgO2WuvRjG+pZZ62avlHuWBxE1jGeDhJiDmj44QimI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789148650; c=relaxed/simple;
	bh=iSPOqrPEqNzouRgsfdtXLZvJztzijYXXcFDpMwJ0MLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oCrIRnDw/kq+np0jX2zS7FvTnbHWkBtG4A55zKhirgyWi3GLkZ4FuAgJZ9uleOiGP5Ge6hdr4pt0LG+jPLJ+fTutlX8JeG9XB6JzB/c21z7XFEJafiz3HZbGp0mOp5PEPyTZiOLZ1thPGIdXaUKuYW03Ox5tvFIXLhuyc6HU7gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n4IDtP6q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M2UM6Q2R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n4IDtP6q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M2UM6Q2R"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BHWWVb972063
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 17:44:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DgHv3EdPhIoOXyHYgFVg1PHeH4W7/S2tlAAVOYQ4qy8=; b=n4IDtP6qSCRsrs5Q
	Ci4u+5w6+EkIJ71oFw1Y1zQstpX89A/BA76Y5fXofq8whvtRYA60+EDh++ODP6je
	093MTlj0PZIJ9QWlFP+CTD4uZZMyeiGMunBt7EcTEScrl+C01OLfh7GHre4s12y1
	p1emmt65w4qtjfhKGdQ0ybxnk3ASvHxEWv4UMubu4tDmyIPnDgj9gYU53c/dwkf2
	FvTwmMILkTRQLxInIObPo6sbKMLwJc3pzEHDkZlbI1ur/FbH7M7BQO++fEB6M6AC
	1K4lQ4UInF8h8uKQJHH7mm5sHbSuXVZkUgL19Gd7LkJbRFxbUT0AZfrhu4yu0VMT
	UWsiCQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmm22rkr9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 17:44:04 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso1438365a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789148644; x=1789753444; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DgHv3EdPhIoOXyHYgFVg1PHeH4W7/S2tlAAVOYQ4qy8=;
        b=M2UM6Q2RpbLz9XEG32Hh7mBTLecw0PAyI7RHivV9LWBslUSTZK6lEyfA2AE+s4EdqX
         47WEI8GgtTDy7s2Sryt3hkQhoVz6TGmWm7taa7QmlGKNaynwhHY+RkicKxq0PhJd+lk0
         2qakA0Gpj6eJhDx8m4H53Y6TN7+va78k/1WOPtIsWeVoOc6ZSv3KMNpxR8GBUD7imCS/
         Ierw0Pv+jRo58RfCVxCsdZNRn7LNdM+kjbjzqAMu+W97fYwQtxM8fBPjwtgpeG5eGjIK
         5soquehSo7gDSIaHk2oyc9O4TvDo4HoiwCqISbXArfmISiovupHJsFg3APO9qiLHwUgA
         +6gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789148644; x=1789753444;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DgHv3EdPhIoOXyHYgFVg1PHeH4W7/S2tlAAVOYQ4qy8=;
        b=PWev7zN5BxPB3C7D3dGwCUdb4ZFmczd0vbpK5RL7uDEN8Mow+Hr7Wu9CYor+74Guim
         NX1HGrHiLDBiVZBC6IUyLtjYL3BEBx6PE88scIjr7v8Eql5zDxONaUVQHnMbe98l4o5x
         uZadBWlI/SYI/WGHxWnRwtlF89mWtjg8W2awlxedwPXN8GaVKp0BAoN5Y+7bB+jH3YP+
         OU2VnSUpKs9sf8c1dCQctZlyeA7mwuFKDwLPzL9PT5VAQqGThaJ7ZiFKHGKJ+KHunMS2
         TWfwwfeuAFfHAFw8DL8UV4EVpSSK6GRCrVC6q8TfuSPwFWuFDouJCOxeZs8INPkHDd0J
         to+Q==
X-Forwarded-Encrypted: i=1; AKwUvByIE8+V8RP1lnbMxwf5iktLGHv7rqdtH98G5AevGwuLL2Knvf9DhwrCPBEv+qWYhDs5vWTp6DFR2/uk5uI=@vger.kernel.org
X-Gm-Message-State: AFuF++lFArShx7ALSAa/lVFf2KnvH66z+TdaDTINKPG/surHIPDsb+CX
	dLQS99RitEvyU6WMP5KVO9dCtOiD9Jx7IxgMOURpxYPV2VqeNXJ5RZGzUjkzRYsPaHt0VyNB9DR
	lpu5+lu1jtyI0V2AftGubWdD/B6Pd2G9+/n0Z4Zomayu9TbwbEtEb6jsAqBye4TiNhuc=
X-Gm-Gg: AYBFou0JkdK/eQ1gKnti9I6hVnSfDYvM3i5AYC1ZL9BWXI4kFCTbb5NsEqen+HesV5D
	WoHZL3P1tfmldZr3XaSgVVMBvyOS0Qt9nIBjyS6ewfi83ygiTmFzv6aJN3utayh9bkNrcQs/O2g
	SJ3Tkg3u5T/8ERbHb+68m9pM35zRm93LLlatNkmOMz0NNnE/CQ762RavrGsX4KRQ44PUGScXU3c
	UVmxjuAkrXsI16sMqAg7K8BVl+/m2PJ5eHhM0t9ayLPOq5CD/Qq9l7JS7cVesDIZlExY8xwuf5x
	ffMPcF8Bof4dGUa3fPJ5LNhqHTYvYQrTXaH+ojDHJiKMF1rFjnYED2nnT5gLElq5ml5z84FIDxS
	DwW3hYbfVMQovZ3FJu6lwTf/2uISFGmwJZHE=
X-Received: by 2002:a17:90b:2689:b0:38d:ddc2:7ccb with SMTP id 98e67ed59e1d1-39d9bbc81damr9099612a91.1.1789148643588;
        Fri, 11 Sep 2026 10:44:03 -0700 (PDT)
X-Received: by 2002:a17:90b:2689:b0:38d:ddc2:7ccb with SMTP id 98e67ed59e1d1-39d9bbc81damr9099566a91.1.1789148643138;
        Fri, 11 Sep 2026 10:44:03 -0700 (PDT)
Received: from [192.168.0.172] ([183.83.137.104])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b78d59sm7652016c88.8.2026.09.11.10.43.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 10:44:02 -0700 (PDT)
Message-ID: <ccd42f9e-935a-438e-b5c8-2643cd5cedf9@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 23:13:53 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/13] dt-bindings: media: qcom,venus: Add context bank
 subnodes to common schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>, iommu@lists.linux.dev,
        Daniel J Blueman <daniel@quora.org>
References: <20260909-vpu_iommu_iova_handling-v3-0-2fe43ae45495@oss.qualcomm.com>
 <20260909-vpu_iommu_iova_handling-v3-1-2fe43ae45495@oss.qualcomm.com>
 <20260910-careful-finch-of-fame-eeeac7@quoll>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260910-careful-finch-of-fame-eeeac7@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDI0OCBTYWx0ZWRfXxb+nALwpkett
 qac1gBy19pi3UWqkcjXTQnQtBr1T3b4htqQ+jiRGvQ4xy3Xf6jdMnJvlrgbXb8a5lxHIezeABxR
 /sEZ9M9VH6KxuIZntQQSQsLs12oX7YoTc/NAfPTfrfJeTkqeNULv0jd4cEFedF17vn5MOLnLi+0
 s1EqojNaYmzBYX0DPbhaABsg851OdWmEPr3GQqDb36G/HEPpFQl3AZYGKvBrOIBGs9JWH82G3td
 Gxq0eg0KuQ25Y5o9Emg//9b1kB9IVA5tTkepPwA9SZN7gSe39xfLa2VvfZn3s3gjSADNVrC9xLy
 J4Wt2bTJSK0X3HJVeA8yYrwgPgU49RXB6zZxORtbtZDkgYR4Wc11v8Bw30kSsvgVWzFxeXRhsyM
 gEJz7X3DozqbOC2+yAPtiMd2MqCK7bDWqet602j/61QLXunQ9qylTcwzY177IZ5veMiAqWto2wV
 F6zVxBfKPunSarpYiDQ==
X-Authority-Analysis: v=2.4 cv=LPDz05W9 c=1 sm=1 tr=0 ts=6aa43de4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=TwCXObd+TJU0JWB7kQOUgw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=t9ty7G3lAAAA:8
 a=EUspDBNiAAAA:8 a=gweAf5VaqOsLJRT3hzwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=Vxmtnl_E_bksehYqCbjh:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-ORIG-GUID: kAZMysQP6ZrvsDGU-8v7MvAFGZRRzgpT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDI0OCBTYWx0ZWRfX5ZOBd4dDklxC
 +xKfJTDEjufDCQXAqk1hwRB+ivmiZmXhLT3PisrISGehtCjUYKSYxBFmNaYxLtFY46dVu0dJCD4
 x3ci4kiSaBGOZRIyk7TmmEr1xJQiqUs=
X-Proofpoint-GUID: kAZMysQP6ZrvsDGU-8v7MvAFGZRRzgpT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110248



On 9/10/2026 12:29 PM, Krzysztof Kozlowski wrote:
> On Wed, Sep 09, 2026 at 08:27:08PM +0530, Vikash Garodia wrote:
>> The VPU issues DMA through several SMMU streams, and the hardware does
>> not give every stream the same addressable range. The non-pixel stream
>> cannot address the low 600MB of IOVA space, while the pixel stream can
>> address the full range:
>>      +-----------------------------------------------------------+
>>      | non-pixel stream addressable range (600 MB - 3.5 GB)      |
>>      | 0x25800000 - 0xe0000000                                   |
>>      +-----------------------------------------------------------+
>>      | pixel stream addressable range (0 - 3.5 GB)               |
>>      | 0x00000000 - 0xe0000000                                   |
>>      +-----------------------------------------------------------+
>> A single "iommus" property on the video-codec node puts every stream in
>> one IOMMU domain sharing one IOVA allocator, so nothing restricts a
>> non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below
>> that boundary the hardware faults, which shows up as unhandled SMMU page
>> faults and spontaneous reboots:
>> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
>>
>> Given that the address range restriction is for specific VPU stream, it
>> should be ideally be moved to that stream. To achieve the same, a subset
>> of streams is now represented as subnodes, so that each can be
>> associated with its respective addressable range. The design was
>> discussed and agreed by mainatiners here
>> https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org
>>
>> In the past, this limitation was addressed with an iommu-map approach,
>> with the iris driver dynamically creating the devices. That approach was
>> later concluded to be a hack to avoid having subnodes, and was NAKed by
>> the iommu maintainers. It was discussed in detail here:
>> https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/
>>
>> "iommu-ranges" on the subnode describes the *allowed* IOVA range that
>> stream is allowed to use, so the IOVA is allocated from the specified
>> range only. Define all the possible subnodes so as to describe all the
>> VPU hardware iommu interfaces, both secure as well as non secure.
>>
>> address-cells, size-cells and dma-ranges declares the 1:1 DMA
>> translation into the parent.
>>
>> The parent "iommus" is kept as an alternative via "oneOf", so platforms
>> that have not been converted to subnodes still validate. New platforms
>> should use the subnode form.
>>
>> This patch depends-on:
>> https://github.com/devicetree-org/dt-schema/pull/207
> 
> Please drop, not suitable for commit, keep it in the changelog
> 

Sure, will add this to changelog.

>>
>>   Tested-by: Daniel J Blueman <daniel@quora.org>
> 
> Plese drop, not true here
> 

ok, got picked in b4 trailers, will drop.

> 
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
>>   .../bindings/media/qcom,sc7180-venus.yaml          | 15 ----
>>   .../bindings/media/qcom,venus-common.yaml          | 97 ++++++++++++++++++++++
>>   2 files changed, 97 insertions(+), 15 deletions(-)
>>
> 
> I see this causes DT checks failures but I don't see the report, so
> probably it was because of schema dependency.
> 
> Best regards,
> Krzysztof

