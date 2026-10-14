Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2224BF924
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791978174; cv=none; b=OBgphikWDMksub+AEuhs4ZycRLNS7jWT9hhZ/lkrgkIhxSf61nkyJczZ2n8kpc4h6IXi7w9s+YmvnmfDw7hhtcTY9XBZZJKIX6b2RdVzd5RL2YqaiaN5xzbu8TxPBkqxYwD4DD4q7/VgigEmaSUEF6r3E3TC0EfLtRfc/nnBW+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791978174; c=relaxed/simple;
	bh=+lAxMa4FDoe5WWam2wq8S/OfloRAPh4BEjl4Hm+tQ7I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kq8/FDjhWw7miMc0Qg8AUumWhIBUkC9+yPATgcOzSKdvuibvabivY72ckxiu4SIKC3+55y8rzUyb23NL3nUg3ABw0FjlAGnEO65O45QTjMW240HqJ+VECD7tdw11S4/l9uzUneCPGduJ4+MdvmT43k6KrZgbgludXxssz42VxoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MiTtRKOY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PzpoTzjj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MiTtRKOY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PzpoTzjj"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EBNOBd2516005
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:42:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gYNEnyEkn35I3MZ1lPe7Nrs1olcDgPyFtd06w40U+1s=; b=MiTtRKOYd9q8LsYO
	L3bOR25GftQSPcfLowtWIHET82QTU19AI2PqkJ9MiPV+BKHzsZO8P1k29Kcg/aIo
	6q2h60b+wGc8o43CjfSPbC/f8L2rA2i2oB36Rf+4hgV/MUUI8FDptKPnMKXKQLEf
	9KW1cqW8mb0sqkgz/dBwQSG6G5Dq2coO7OZc6G7MuGqeu9oSB4Q0e61UBpCLpSbn
	2t985zowZ/+3iPPrMDL1lqlOtSJO186oFUDyLq2wFfsBDh3I02B8xb1V7xNl/HrZ
	/7EUvzsAGSebV+vTLxfJlyz+jFXs5HlGSkjGSRbj8OatyD5/iqBL5amYX6RkXXTK
	LZWBTQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha4709bju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:42:52 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc7d2ff0087so3819287a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791978171; x=1792582971; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gYNEnyEkn35I3MZ1lPe7Nrs1olcDgPyFtd06w40U+1s=;
        b=PzpoTzjjDIJsMa8NE1nbF7PUz8fTso+xaTZb6OTy7T/NhgNIy4m4jQVvwxkTAI/7gX
         JWgICX9EtwSdt+5J3gZq8dqw5H2LipxrRvarCfZoxhp8w/nkfI+p2zzpY65+IxkuDsZR
         7A0Ttru9iEcLhf06d+9Ocx4Lvn2ykPezmh9Q3ys51Wpv4/qoAnuo9XXxbIA9WwgFuYHm
         1RtKaBHIc28ZCC/CHSRcF7roHfE1LXShPVYnQMQXJ38J8WP5DKfyjqdpo+uOl0ShOl+V
         B1K5T7LV/0h7ibJ5IxJSJmAO3faspCybZ3vnSPai0Wo3D1zI3ezW72U4WeWYQvJ+ZBhP
         BVFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791978171; x=1792582971;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gYNEnyEkn35I3MZ1lPe7Nrs1olcDgPyFtd06w40U+1s=;
        b=CKXde8Ap/AukZYoE1NuBERnHe2bF0Vu0Th7lXaoNpOg0+UzVakRUcEsNGvA4Yzt22E
         Ul0pSsogicPy4Lr+hLxnw4pEuP/9EJ07RV71tmBRU3rvMihIBetpLstYBlIGRpMzOy0A
         aGrgipRRSJb+/+yFSGQDD5wjNaPNQ82j9VtunrtsW0RYBHg0Zha7oecUP3qbZvrWB0et
         Kot+7qtKr5ABjURQj+YtKiSHwz5N8y/GHrgr9M0poaBwN6GCAhfumg2NJFHcZ+s9yMSg
         /YWG5clpT8FqMHDDM1UxYoVn15Y4gdS+TEKNqbztUDz1GTrxOdk8ssIbURGVBRE85IcY
         tiMQ==
X-Forwarded-Encrypted: i=1; AKwUvBw8WAiZmv9VfJhIfK4nLbLxNCQd4PcAIYxZQVnj9QDdFp3am6mI6HnzFz5eyY2ZQiRgxnEJ9wlKIPb3Sg8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLI31oynBwasqqy0/CGc5aYoopJwT6LioNkcVVJinMe4OwZ3eP6
	WVRrkTIwtJXnNFMqvo7ymz9UwMgFa+vV7AlLtNSSm8V8KVAekH5TEQlexAghPaaW3Dfb7KiKwuj
	vcOr8dzAYi8UIrkJyTgFSstufUvPMiU8/7lWxlUXKc864TI0pe5xNTMySBKT8COpthF5pcl9cVC
	k=
X-Gm-Gg: AYBFou14owOiSEsf094bqbUXEQCT9Wi7Qd5+Z81MeGYQbnMUMSe2knHw94U026cn04c
	xCWRQ3jNzmPZujFzXTEUCPAPFboZgIglupwq7eWUl++49pnljRTR0xmHKmSkgRwwXegfZVVX6bS
	IGnnee412gjyz/l27MSV4dO7hhfOyf8/ODaq2wGeVM3Jn+fIy/gkN11DujrMNVS7842MdI+AABV
	xksi+h7B73hZE8DNebbMXYsnAO3q82ZBo7ywDHVn8+fpgDCBdL5P2tmlexGsUXLew1QqEg0+Nzk
	C59yrawJElc3HFWWyyIAZ8E6osWRsU8xBYh4uja+4MyKYO4UDUJYZ8kO/Tj3Slgo1tp23phh5vn
	tsu/SU2jMTv2Dzwb/tu2NcaFcf4+D9Ey2tx8=
X-Received: by 2002:a05:6a00:4f94:b0:899:9267:3a9d with SMTP id d2e1a72fcca58-8999267419dmr10100622b3a.59.1791978171160;
        Wed, 14 Oct 2026 04:42:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:4f94:b0:899:9267:3a9d with SMTP id d2e1a72fcca58-8999267419dmr10100592b3a.59.1791978170652;
        Wed, 14 Oct 2026 04:42:50 -0700 (PDT)
Received: from [10.217.240.130] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d804e391dsm1020134b3a.39.2026.10.14.04.42.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 04:42:50 -0700 (PDT)
Message-ID: <413f66db-5089-4b3c-8afc-8d8083e80ddf@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 17:12:43 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: talos: Add Talos Lyra EVK board
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>,
        Akash Kumar <akakum@qti.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Vishnu Saini <vishsain@qti.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>,
        akash.kumar@oss.qualcomm.com
References: <20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com>
 <20261012-talos-lyra-evk-v2-v2-3-dcc9316ebb59@oss.qualcomm.com>
 <ecuc74jw2pmgeijojvqayrnkntukzzyjlx7iq2iutovr7x2xkz@uvf2bd4o6pxi>
Content-Language: en-US
From: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
In-Reply-To: <ecuc74jw2pmgeijojvqayrnkntukzzyjlx7iq2iutovr7x2xkz@uvf2bd4o6pxi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0NiBTYWx0ZWRfX5sNaJmQ0Hecz
 8MROhNvJ+5H3rJ3xNUpVlsegOkcjkGIF2S4x0P2N/9ICPVoB5Gj6f1gPkVoEORZ+rPwPyqcMMfu
 ilGLdYcscu34CVbtk4HbJCcxuf6Tq9x4Wsj4Jn/+913tlTbfylfFXW+35mr1hDZGDqOIjVIN9dd
 6i4TH+7RrVBQHjbcn7+TiKMtY3n1zc4sdv1KkDZ9jqYt6jAE5wCEsLEyO3WRo4sNMdGGz3CwzMZ
 k26tZXrt6j6d2tY92udia4whVp1r1bd8Q0XTYx70leIr8q3w6VsLwjWZtWVogpIAMbvZkQ3PxGk
 UoOc6V9qFrnEWGO4hjHI3odEaRPXq/D0YdRrU4HcZia8yfrlvQ7D+DwP3oV4IQqC9dDysLX/ana
 N0wOS09i5Rt1+XXBCRA2gPlQN9Dqi+N8do+O/6U3ELxV7Z4k+F42t8FZ6wTzsALtJiUtpp5SauJ
 VQd5Cv2GT/6owkPsVSA==
X-Proofpoint-GUID: axuWcPCd1HHW20CVWMpEI1F98tH4Pxf9
X-Authority-Analysis: v=2.4 cv=P6avFSAu c=1 sm=1 tr=0 ts=6acf6abc cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=C4XqHXXxGoFwxBuGTzMA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: axuWcPCd1HHW20CVWMpEI1F98tH4Pxf9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0NiBTYWx0ZWRfXyUQdDjpX9gh9
 JYyCNCdvP6l3MPa4EeXNe5uABqLolgzq/SxRYZdWcZcGmOBnAiExPHwdvMifrW3f2BT5CllpxrO
 iLk4kxN04gxW68hbBub/DKZ90v56haU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140046

Hi Dmitry,

On 12-10-2026 17:29, Dmitry Baryshkov wrote:
> On Mon, Oct 12, 2026 at 11:46:28AM +0530, Ruchira Revdekar wrote:
>> From: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
>>
>> Add the device tree for the Talos Lyra EVK platform which combines
>> the Talos Lyra EVK SoM and Lyra carrier board.
>>
>> This device tree adds board-specific peripheral configuration on top
>> of the SoM, including:
>>
>> - Native DisplayPort output
>> - GPIO expanders on i2c5
>> - SPI-attached TPM (ST33)
>> - USB host and peripheral controllers
>> - Power and reset keys
>>
>> Co-developed-by: Akash Kumar <akakum@qti.qualcomm.com>
>> Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
>> Co-developed-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
>> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
>> Co-developed-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>> Co-developed-by: Vishnu Saini <vishsain@qti.qualcomm.com>
>> Signed-off-by: Vishnu Saini <vishsain@qti.qualcomm.com>
>> Tested-by: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
>> Signed-off-by: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
>> Signed-off-by: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/Makefile           |   1 +
>>  arch/arm64/boot/dts/qcom/talos-lyra-evk.dts | 137 ++++++++++++++++++++++++++++
>>  2 files changed, 138 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 88230c4e00ea..2f25575e6efe 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -456,6 +456,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-valve-deckard.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)	+= talos-lyra-evk.dtb
>>  
>>  talos-evk-el2-dtbs	:= talos-evk.dtb talos-el2.dtbo
>>  
>> diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
>> new file mode 100644
>> index 000000000000..cfb563658fe0
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
>> @@ -0,0 +1,137 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +/dts-v1/;
>> +
>> +#include "talos-lyra-evk-som.dtsi"
>> +
>> +/ {
>> +	model = "Qualcomm Technologies, Inc. QCS615 Talos lyra EVK";
> 
> Is it 'lyra' or 'Lyra'?
> 

Ack, it should be 'Lyra'. Will fix this in V3.

Thanks for the review.

Best regards,
Ruchira
