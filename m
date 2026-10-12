Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DA73955C0
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791782998; cv=none; b=G7F+Xi7bz51hqRMwhdiY7J0oat3806ErURlZVHralVBYgJOuNEJ+x1LBBmqlmn+GbosfFoVkyritfXWT7y+LaWgV/vZGTOzZ2Cupxd5nFTF7fcD19basw4Ok6qwWq28y33GjFPUNmdAoXhCrctalgbhixzJwGzfIliM9w0O2Ghg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791782998; c=relaxed/simple;
	bh=f59aOPOcbraWpl2EgIj8/jIf9DjGC5XVFOte3tulvao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LcKNybLP0T2zjtv7trGwpKoAgP/TqXbLWvxceqqFPKmmIkTY8WVm+0W/XAaHoXR8Zw+T4VcuUxE39Ue8MlskmIES/wxwrPakoF5Wu3DoAp23MVWBfFpNFN2ykuv9vtD9Ya6zylkNmZfFIJiz43U5kt4eZYt5aRZlkQzwT5E3zcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H1vQINFX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=glwNEaQC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H1vQINFX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="glwNEaQC"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55xFu1857639
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:29:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zSZjEhlxbRcj3QUVbZ7iwR9kQWOUQNpT+xsX/Nm3vFA=; b=H1vQINFX3P8+fun8
	9jdru3hI4pQYT27qYUBkB4m9EFQo+eDE2tlE9b+S8MiorSDWSh9pBWcQDIjdZkyc
	IhWKKXMHB6mZMZLYeM5hpwL2KmMgiV/tH1X3XwOPlUl0eAWqIOrjCK0Ix8Zg7AbC
	EWpWzdsSXusMv+Aossir0oIDj+ckbv4dTMmFj9IHoAjv8fk2RpBhG00Aypms7/Nf
	4FFG1C9jz0RqzUKR+zPGhNRjEhh3Oc11d5Ehg/AyT9p1VFPaht621tj/Djf4KZJt
	xI5RCdm4fyTZiInQiAITkXQnPUHJtbQwu6h3Dk97FiqTL2PxV8j2v8PsgI5JPBeb
	0ItC+g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7cxxmywg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:29:55 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e86af936fdso14769945ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 22:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791782995; x=1792387795; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zSZjEhlxbRcj3QUVbZ7iwR9kQWOUQNpT+xsX/Nm3vFA=;
        b=glwNEaQCMa2pHrNo+7ldbzN7bDSF5lGsnBjgWwDnx6h4TVfcsi/qp6TaZeltz7xFYj
         9UNO07P9Z2XmT4wGqimFGKoP9wFO1BMr3rgNXgw8jbBfXaB/FgikiyXw4grJgqUvuPv1
         v/oLZRTSdSqKVHOz9js3EU8GQX9TQCFPAf1R8kxQRnMwniCk3xEsG5GHZOAK11vplZ7f
         12K6/JyuazOgYL10rAim9JtaTB41h7TZpf+CUz+nI9zbksFr3cWOkQSJXPY5NLqZOWQE
         uidjITF+76gM3EN7L1Mv+R+z6kupZnXdQ78VJlCNVzbh4tBQ5MsQQz9pif0Yxhsox4xy
         Snzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791782995; x=1792387795;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zSZjEhlxbRcj3QUVbZ7iwR9kQWOUQNpT+xsX/Nm3vFA=;
        b=mtdwp9bSjAFic3yAmBhJv4aeyo+YV3saPthSM1ypNEvMy5VMlScRjoiJK5yAZU5b2O
         rnBfTSWO0zNgBiokfKUIjkHeXXQ5p7lexFIdTJTCprV9hh8ayPqXWRfE/KOy15w5WKGp
         pXYW+pwMbragklrEkOrQm+4ymFD19T8y/GkDFacqegPaCweL5W4kibxAvkfoCBkgJMl/
         I20b9RNUL/OVKS0KH+Z4Juvh3NJWMnU0itd5ZzMGJzzNafi5MmDGdKklYehGbBQsPkT0
         wKrKFQxc/CIoZCJcp+bcl8eQQAqGTcbMI8dJkN12GhJMbSGmpuh9bjiJDYWHtuerNuwg
         I16g==
X-Forwarded-Encrypted: i=1; AKwUvBzBuykrJPjiEPecC63DzEAWc1mafihhQsLztGVuXU3wX4yAXNdmqkSeDyM1qgZjBFCDST5Fz1fqXqbsriU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcYWVpkFECMIs+y+KdDXNzZPFY0iIl/WjC/ShaV3WWtQHFdFy9
	ObOrP5hM2AEoKp6vVOV7ph7hDL+lnqNevglA4iFkwPbx4CkVqPANQxK5SzjXa+Vr5VianJLGneM
	09/dZ2vjZH0uspr8i1v1VE/0ZFXkXxlmT07vyHsIzaU+7Ro0+tpxUb127ACumjWWCr8A=
X-Gm-Gg: AYBFou2B/lUnAWDZtBGuqxvjPbq8oJn9TTVCXjSTN5Ve3o22YH1kmYEP/N7Z8zEPTOU
	6VlqH9Z5wxal+0caBnJEVvJbV2FlH12zCj4/psBpXCPbn82EkoxydPWRGdOxRkY2OzapU37WsEj
	YdYUU3VuRGtLWlQy8FDo2L4k0ZdC6n3HTSJ8YEHKrC9gV2d1RNAqO0DqKKDW/37gulg0GWPp/zE
	WErsPumJ+A0XFLBdL+MJNqRTLeWelxFbH6R+NpwjvQt0Ir7+zCnXaz8Ww6uxz/IEzHza6IxUtnr
	7kj1yJUdIBtqxJneV4Csb0GfzPqOlwIYDbwj24NHMq58p0nAq2Wf1LbVsyVx3OAbAXH2f4u7Vz5
	a3ZxBS9ZMQCjmthxhuZIrCyNjCL525li+Ng==
X-Received: by 2002:a17:903:2309:b0:2df:3b0c:a6a5 with SMTP id d9443c01a7336-2e8427f7723mr67059915ad.9.1791782994681;
        Sun, 11 Oct 2026 22:29:54 -0700 (PDT)
X-Received: by 2002:a17:903:2309:b0:2df:3b0c:a6a5 with SMTP id d9443c01a7336-2e8427f7723mr67059825ad.9.1791782994200;
        Sun, 11 Oct 2026 22:29:54 -0700 (PDT)
Received: from [10.152.193.243] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e171bsm38699445ad.73.2026.10.11.22.29.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 22:29:53 -0700 (PDT)
Message-ID: <fb81a042-82b5-4565-9a5c-1a3c038a0d14@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 10:59:48 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 01/17] dt-bindings: net: wireless: Add QCN6432
 device tree binding documentation
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ath12k@lists.infradead.org
References: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
 <20261008-mpp_bringup-v1-1-2c5797b5e4ac@oss.qualcomm.com>
 <20261009-brainy-alpaca-of-focus-31fbbd@quoll>
Content-Language: en-US
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
In-Reply-To: <20261009-brainy-alpaca-of-focus-31fbbd@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gX9zJ8ldRbNWeu1Yg66ZE9otU9NmtQs_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyMSBTYWx0ZWRfX0EY0XWCPt6Qu
 TjkS4PIXBfu3mU1kpx88dJQ0g7RRlZpi3BxsFZlPoGyzKdROWAy4s03fVoqrSyCd6VFEc++TrKG
 llK5VSuGpBvzRvKuLZrLK0yYo3Kz8l0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyMSBTYWx0ZWRfX6kdCsVPAAIJJ
 htiYX+rrpzVYZnxgZOZ4Rtun61BZzSAgoTCFx3c5Z5PshtGLag2T7PfCiOuT76tO07mvOz8xiJu
 XamTGHvVu2Kj5EBT1Rvn09611wFs1sVoJ9yF0Z2qr0Kkm8ST4DeMsJbCLKgkUYNikcHYtLFgjLM
 IuOyxRIW/UnHUjH0gkX6Ysc1zvI/+TVoiLAWF/6MgaCSFGAn1169KbfRJ+gERMl0z6b2GOmWfyo
 vYAq3k+eOL7QbwkWS/rB/jXOZHsHHa6QHJjSoiyJnXiCXs0dMDKCJX2aPKnDZS+vv+e6e+5bHib
 ovBkZ+z8dwksQGd87hN7dkCC2mb9qHXwQ0FfjUxi9aH1b/sTMwU9JgmC3xSs8llU8buwPhZFnu5
 H4fivPaWlTFgJrVkDp7e9OvG2YVd4IadjXQGi2J0rHDc5A7incfonetmbxvshcooNXktUqeBjkA
 EMOAUEURQNIjRiYapjA==
X-Authority-Analysis: v=2.4 cv=AsJ7T+9P c=1 sm=1 tr=0 ts=6acc7053 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=WLwc7mworHJoPNN1NUUA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: gX9zJ8ldRbNWeu1Yg66ZE9otU9NmtQs_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120021



On 10/9/2026 4:00 PM, Krzysztof Kozlowski wrote:
> On Thu, Oct 08, 2026 at 03:53:57PM +0530, Aaradhana Sahu wrote:
>> Add Devicetree binding documentation for the Qualcomm QCN6432 IEEE 802.11be
>> wireless device.
>>
>> QCN6432 is attached to the WCSS Q6 subsystem and is represented as an AHB
>> platform device, even though the Wi-Fi hardware interfaces over PCIe.
>> Document the compatible string and the resources, including the Q6 remote
>> processor phandle, MSI interrupts, SMEM states and memory regions.
>>
>> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
>> ---
>>  .../bindings/net/wireless/qcom,qcn6432-wifi.yaml   | 149 +++++++++++++++++++++
>>  1 file changed, 149 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,qcn6432-wifi.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,qcn6432-wifi.yaml
>> new file mode 100644
>> index 000000000000..97d8885333fa
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/wireless/qcom,qcn6432-wifi.yaml
>> @@ -0,0 +1,149 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/net/wireless/qcom,qcn6432-wifi.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Technologies QCN6432 wireless device
>> +
>> +maintainers:
>> +  - Jeff Johnson <jjohnson@kernel.org>
>> +
>> +description: |
> 
> Do not need '|' unless you need to preserve formatting.
> 

Thanks for the review. I'll remove the unnecessary | from the description.

>> +  Qualcomm Technologies QCN6432 is an IEEE 802.11be Wi-Fi device
>> +  associated with the WCSS Q6 subsystem. The device is represented
>> +  as a platform device and uses MSI interrupts for its Copy Engine
>> +  (CE) and Data Path (DP) rings.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,qcn6432-wifi
> 
> Is there qcn6432-something-else as well? Neither commit msg nor
> description explain that.
> 
> Best regards,
> Krzysztof
> 

QCN6432 is a Wi-Fi device supported by the ath12k driver, and there are no
other variants requiring a separate compatible string.
Hence, qcom,qcn6432-wifi is used to identify this device.

