Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B20F4E80B9
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789557542; cv=none; b=ecvSqZyCffNKQU/pfvW75snG6NubFdxHqXFrZONhLqzo+UOm5dU8l7ZHb4AdeiG7mlriMmff7P0zK0sQ8cfCkO231ACJ71bcMqfcnhnmVhgYylD4rtBiRmn8sIVVaV5lV0iN3/4m+CfK4TUM+pAf8LLkAHtxfHaf9XaoqKOHgNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789557542; c=relaxed/simple;
	bh=h386dZ3ZRHU0xZ+UHgIl6BTyUMU4D1p+OyPP3xo0amQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mBkV+/Q1GokvFlzQYuRh8soPdtZ7LZzQ5RBGlgv8bvNQldgE0rZgXWL+MG15l6jnA1HH8zrhgagb1id7qOo8sl8yZYkQnYqDzcJSFbQQB9RRaV8LKo2N8i4/PgpHCF/hM5OsrOftrYVmctRNceYsPPKY89LPfLSStlP7PXscHU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TXkmVrlm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=el++fjHO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TXkmVrlm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="el++fjHO"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92rEm1552901
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:18:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PoqX4291ox5WRCJmLCpV1ifV7opzHZ9wnhc5virqy/E=; b=TXkmVrlmvMFiR1Oy
	ZTGC8MmxlSvvMlyd3JCezFiPzlGwZ2U4u/C8+Ih50ZyAGuFTxEzfI7zDXZRoquPa
	cA3O0GwUujDnc8/tq/1en4aN68GiV8306ZI479/eTJrk4mDeWf6EsKnnV6CWEyRV
	ZJHDsSemL6JdBN1dhxpKJ3LbrJ0+PtA9vUGC8i0VOszSrthlCbFVEZoQ1I/JcU9d
	YZGvi6G90wBDBc6yJDmNHyg3pSoKnT7Fj9990Uieokpk6brStwMGNGsuFCnrvr99
	SIPOzCRDTTK6YUcDoQaT10vm46TtD18rmeUbiXRtNFv31UrMdNUVFyUeRzlbwvJQ
	IDFL7g==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq9n64aru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:18:23 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-80139a2495aso9845400a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 04:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789557503; x=1790162303; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PoqX4291ox5WRCJmLCpV1ifV7opzHZ9wnhc5virqy/E=;
        b=el++fjHO49+1Um00a5btOsSZmFNnTWPoi4asxGpCqlbrRF7GM95Vp8Co9PELntyLIz
         SjDySV3JLVaIyPLGJda6U4cXrVgP0GmlVkm9+VIe6WMbTXlUfqzN2GbuduaKEYZSKlij
         kzozmv5owSUiyEggjDgqnJi/Sq1ZoW68+uQiXKMJIl9CzKVexNJdtlCWcy1E1kkCpoEu
         cvcSzZ9oUYtwqN0JQj9za2YDXW1k26v4VpXFNOIBT6CMiCgkNGttb/fRXEhOVRF9JvF5
         TCVveDwXFsHXsR0GFag7HWGT1nfbb4qgUP0OpEgk+1rIgvQh6kDEg7xenyFw5JtSLVf8
         O0Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789557503; x=1790162303;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PoqX4291ox5WRCJmLCpV1ifV7opzHZ9wnhc5virqy/E=;
        b=hyhyMNOS1rCCaupk4hankmk46i1CdzxDtTfFMtf6A67B2WaPV9b+a8n0590+dxE5TS
         HbQFsv51mFXI+MFBWKb3wWs6VvJdF4/WFRDye6Pz6nwHodJvDKtYhEd9NF+44e77GKTA
         SIvNUTPD0IQljKtWbGVoooKLgCud/fW6n25L4g65olAvsmkKi87Azc5/v0ZcqPRanRQH
         o4C6fwhmbf5uDcB5k0CAQ0HF4ZrgGC+6UefHCdKPCbF8rWH90opAuuyll1kqAZ2YBNfC
         6Vk8w8YmF/Py2G5S4Nf/YpMVV8I3BEgaCksGEW6Yz3f3OUrHYXk6+PqHlsBwbfeW08JG
         LBIQ==
X-Forwarded-Encrypted: i=1; AKwUvByVWtn6DIXOT4XGKSbQyLbg0QnR+teu0gu8P2BZg9HtAM5dcfT/D6XF/bBsseVFMlLb+CBMzjGA0eV5I34=@vger.kernel.org
X-Gm-Message-State: AFuF++mFxuC47deh8pgZeF34USRHrzspZsvL6ilzIMjeWTG2Ov8t7aqt
	U+I/QJR3LXvQz+Kl3EQJ1FS/VC+4qzdNwcgOO1Kp0qesmJSYk7mu5BxMh03yICT3qkbiw+nQ2GD
	Uz+yg1EgYNzLlj08wD6Xayu2/JuyTUgOYgpOWnRfMleE/dLRDCoEQ85fcHsyFkps7o7A=
X-Gm-Gg: AYBFou3NQEn4dKgXWKFKky29ESGIwI4EeYpO14pvrQf1oKH7g2wGWjAIWxLdc32Onxm
	QlsiPkC3nSEZE3aH0rnbvFNuRW7O1HtIyKZDYRp7z5okLMvTa+X2TB+kfJDOFkYuNmdkIXvbNKX
	AI0QrtsH5KaLY183PeoWRrrtPZejT1N5k0/vjUz9q6dPXiLznvaFOM+DTcAenekb5c35v84pDAd
	DEpieWhGVZEJP2d86oD6CW0UEAoyQosz1Ruv/OMft2ltTZQXkreW7CfzkAlDxiktDmaTupnsiX0
	Uboq4r8c2lua72Zjy/8BrodBjwtrxVKjImrcMQ/y6HCkg9gKjlmkmJNcZFuY0/lsNjoXuUvQ9N5
	yZx2qOuOSs8Dwkm/p/UpVeJ0KfQVACQ==
X-Received: by 2002:a05:6820:2008:b0:6b7:8415:d786 with SMTP id 006d021491bc7-6c7d3206852mr2114831eaf.49.1789557502916;
        Wed, 16 Sep 2026 04:18:22 -0700 (PDT)
X-Received: by 2002:a05:6820:2008:b0:6b7:8415:d786 with SMTP id 006d021491bc7-6c7d3206852mr2114804eaf.49.1789557502446;
        Wed, 16 Sep 2026 04:18:22 -0700 (PDT)
Received: from [10.218.42.71] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d76834sm5950298c88.14.2026.09.16.04.18.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 04:18:22 -0700 (PDT)
Message-ID: <a3ff5fd1-9801-4a3d-b663-0ee338816bb8@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 16:48:14 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] dt-bindings: usb: Add qcom,sa8255p-dwc3 for
 firmware-managed resources
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260903153827.3463313-1-faisal.hassan@oss.qualcomm.com>
 <20260903153827.3463313-4-faisal.hassan@oss.qualcomm.com>
 <20260907-arcane-spicy-parrot-6da5ed@quoll>
Content-Language: en-US
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
In-Reply-To: <20260907-arcane-spicy-parrot-6da5ed@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BdVNQbt2 c=1 sm=1 tr=0 ts=6aaa7aff cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=zkeY3IreNFxg1TzoVDwA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE0OSBTYWx0ZWRfX/zvj4C61OuTt
 TB8KwXTYj3Y8awcKslaOd7kAb1GncuaABwgGb9pKEjguv4RLReA52efbgJ9hIHUqWUES+htq6u8
 D8QjLpUB7ngp/I6BA7Rj7KjIxwigyB+FvIV9iQ+atlb1H7WRu6U+G9vw4YxmcW+1cOmvIBC0Kq6
 oh48ltsl1k4HxNZ1cV96vaSj9sXOWS/H68/pv6RJGwPhjOf9Zaz1mRcpvhAO8GZieXrSCeS7kju
 ipPY/a1p+CFC79tQd1RS8+FZqhGI/wZCdgk//7lIVMpJeqgRj8LixpyTrpQfhmfWTQtLA2Bkzjf
 JRBM+bbZ3+/twux+Tg/ny7UZpzxaKl+hFxyPVoQ7a0Dxo7o89Y0b2A0z6k0hLcXwWndgxIe6g6J
 650WleDjlgmz2i14nBM+NWUNcH/u8014BIVdN185VGnfDQ8gE2QYWueBBp5Gtj/Em07z4bK6ZZ4
 mtQvMTBJGhVsTy9gz9g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE0OSBTYWx0ZWRfXxd3lRhi8EDss
 mRkktdexXCR8jYIjt30yG2xoV6kY09b43S2HZD/YJd+aW/c/nEqPbmWDhblUhAPVgprhs4bA3TR
 4XrTIJhTJT9VaEFi0t5ka8CjpdRQISg=
X-Proofpoint-GUID: IYw4dZm5KvjLqaynEUDHvgQH_gge1kXA
X-Proofpoint-ORIG-GUID: IYw4dZm5KvjLqaynEUDHvgQH_gge1kXA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160149


On 07-09-2026 02:38 pm, Krzysztof Kozlowski wrote:
> On Thu, Sep 03, 2026 at 09:08:23PM +0530, Faisal Hassan wrote:
>> On Qualcomm automotive SoC sa8255p, platform resources like clocks,
>> interconnects, resets, regulators and GDSC are abstracted and managed
>> collectively by firmware.
>>
>> Add a new binding file for firmware-managed USB controllers where
>> access to these resources is exposed as two power domains:
>> - Power domain: Controls power supply (GDSC) to the USB controller
>> - Bus domain: Controls clocks and interconnects for data transfer
>>
>> The binding makes power-domains and power-domain-names properties mandatory
>> for firmware-managed platforms, while excluding the clocks property since
>> clocks are managed through the power domains.
>>
>> Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
>> Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
>> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
>> ---
>>   .../bindings/usb/qcom,sa8255p-dwc3.yaml       | 123 ++++++++++++++++++
>>   1 file changed, 123 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml
>> new file mode 100644
>> index 000000000000..c6db7bcf4981
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml
>> @@ -0,0 +1,123 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/usb/qcom,sa8255p-dwc3.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm SA8255P USB3 Controller with Firmware-Managed Resources
>> +
>> +maintainers:
>> +  - Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>> +  - Faisal Hassan <faisal.hassan@oss.qualcomm.com>
>> +
>> +description:
>> +  USB controller on Qualcomm SA8255P automotive SoC where platform resources
>> +  such as clocks, interconnects, resets, regulators and the GDSC are
>> +  abstracted and managed collectively by firmware through SCMI (System
>> +  Control and Management Interface).
>> +
>> +  Access to these firmware-managed resources is exposed as two power
>> +  domains, one gating the power supply (GDSC) to the controller, and one
>> +  gating the clocks and interconnects used for data transfer.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,sa8255p-dwc3
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    minItems: 1
>> +    maxItems: 6
> Why is this flexible?
>
>> +
>> +  interrupt-names:
>> +    minItems: 1
>> +    maxItems: 6
> Why is this flexible even more, allowing completely random names?
>
>> +
>> +  power-domains:
>> +    description: |
>> +      Power domains are provided by SCMI (System Control and Management
>> +      Interface). See Documentation/devicetree/bindings/firmware/arm,scmi.yaml
>> +      for details.
>> +
>> +      Exactly two power domains must be specified:
>> +        - "power": controls power supply (GDSC) to the USB controller
>> +        - "bus": controls clocks and interconnects used for data transfer
> Look at other bindings how they do it.
>
> I finished here, because you would avoid all above questions if you just
> copied recently added or reviewed on the list SA8xxx binding. You did
> not, so basically I expect more of unexpected code, which is pointless
> to review. Just open existing files...
>
> Best regards,
> Krzysztof
Hi Krzysztof,

You're right, I should have checked the existing sa8255p bindings before 
sending this. I went back and matched it against 
qcom,sa8255p-geni-uart.yaml. Will fix in v3:

- interrupts/interrupt-names: replaced the open range with a concrete 
items: list, minItems: 5/maxItems: 6.
- power-domains/power-domain-names and resets: dropped the extra 
per-property descriptions, now just bare minItems/maxItems/items like 
qcom,sa8255p-geni-uart.yaml, with the explanation kept in the top-level 
description.

Thanks,
Faisal
