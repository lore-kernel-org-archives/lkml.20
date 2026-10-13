Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D404FD280
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898811; cv=none; b=dwoFqijXJfsyj0eX0jZpwoROYRCih89r46eV0A+onhEio2auppsqhNoA6trdtCQzj5Ap+tRQEktsSyNbWwPa/IAY3m+Bx+yxV74ON3ofzHzQkY5+6t0YlkO68ZJKWbDo76veEvW/xtoiFWjb8XsGBr+gSO5UpMorO8u/UghQ030=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898811; c=relaxed/simple;
	bh=5n1C5kdCuZiIv1NyJcV5joLpU2VBYIV+zY32x332UOU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mYKUvji2TP/umxa9fNKIc7DQOwv3+0gqplmzslfOlxBNAKg9NRlliIlCLpLv326ml4uChvWzbRzjrPlsAkoZqnd50rB5us4/LwqGYHpGcEixl5TZPtjYX2KeAUQLy606uiVkrWsADOjU9MidW9p1+knv7S/eE2UOuHxIQARAPfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UH3L5tMk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ajih7Zjg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UH3L5tMk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ajih7Zjg"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8V0XI922844
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:40:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	69d40e+kaSYlxvWwy4pVpeKZomSq3iB9ZKfIxKfNAbY=; b=UH3L5tMkItOQlQNK
	1c1i3vhcfEs6JQ/w/TPdLOauCQFF51bYMKjt89FepPEHwq0VctK/OYHPN20/xVlP
	ko7TN6kZ8+LESyfd6aCSi8JSB1j8xAALBJtYzno8koFYS7GNsSdFxLrYm97++L8r
	nGZ7U9k17/4UwhhPbQLS+jxYwHr+zQpxfaa7HUfueYYXMEIFk7YDRuuqUF0Hj/J8
	f6DQ6i0XKmIfmdP9sL9oVQhkxmtn3TK9LTHFBPKi6Bf5UJeGm9bvECUTDQGHkdz0
	ZytmSohAOwCtAKwyhGcag7Q+sIckJLyixGPRXIseeHOjRtZ7MEUDZuyLuZBSXo0T
	DBH5BQ==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98h1u75g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:40:08 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8ab43f7f5faso38915737b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791898807; x=1792503607; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=69d40e+kaSYlxvWwy4pVpeKZomSq3iB9ZKfIxKfNAbY=;
        b=Ajih7Zjgbn6R4eBN5qaBeNArzgYXZ1INXBQHea2XMZ7K6j3Ne2wzVc3w1qDGWJHBp7
         OvNOEKe6xYk4s6v8DDSysSVvjADoiVVVILnrqUsQIJqwiDJ3SyRjAaN3Vy9mHcnnAjcr
         JYOYgTpTp/1VUsbwKYZFo9JDZaRxH7lSkVsmSepUQOWgnQFsFQ18wBiLeSFsyFtpDwAr
         ZnQNh9wqHY6CPNP61kKorBxAx1ik9vin1211iewzPFKFRSeKSGtr9umszuZ5az7slGkd
         X+2/w7nRjLyTc9NwrC0YEBv/l2ayUy+Jv4ktyXMBDi41BAZxb7W1XxJJNvDMJDf0I3cY
         vSpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791898807; x=1792503607;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=69d40e+kaSYlxvWwy4pVpeKZomSq3iB9ZKfIxKfNAbY=;
        b=W1eiU3JzrhXcXS1jH56DGWgzVHsERVm5K86ROGRdvwX4scC5X/vxyTzx6MG7uTqME2
         EPa5UT8reoYyCR/atZ/sBpXdOWyLYu0+FpUqcaB0HiLlolS/jcXA4HJQk9a8e0Wr/kKn
         tpezb3FbgFFz7f1Jy/i2TEFwHeZCaOtCmJDIFqs2s15vq3/vKGH3CBqTxjxVJ6lsphXk
         HgAVVfqNS75q9UnqbGnudmisOaDinGfGSVgKKpBbmwKFolqi+vGAz7A4HXzr5LxNs/rP
         ggwWZgJYpl1zMLX+92UamRSkz9lRClsQWaFb3Zk6PxBCayd76zuFisOZJo/ZUuiheB6v
         Mc+A==
X-Forwarded-Encrypted: i=1; AKwUvBzchhhBpSGQuf5WHYvuXJ9NL+jBg2EffJMMDe6BlQOS/y31YRR3IifOI6LxP73yW0x3rf55o9GrSOgmazs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhf9ZqXbtb7Hq4cu0bLN87JztW+xdotKa/i2NMOy1XF9PurB9n
	Qu5EVzK6+e+65gQlt77yttZ83YgqGOkMmCu8s1LIJvYLs4y+YN8SWSe1TtzU0CavUjwvg+L40ao
	mKDP29sFZjaC6NzawBrdv+5qPeZi7he39Pput37ck78dvpuzR6tRGg58ubnYyhX+z+mo=
X-Gm-Gg: AYBFou2lW1bzOiIP0loPDyslpaTn2bU/nM+xNRM1Ern9jg5XEHC9J9jgIT+6vQJVSsc
	+kGXqrcoQVml4OznbZc68rQ7azLchsds0RyaxOFb8jH1ch1c4iiybVP2QXc+Fh0ym6O897wMHrb
	/fllf54ToC56EL9lZTAHSXDwPOeOnnrYfro3cgVAY8EHBfoN6XJLror0VtW0v0hFChz1cnc4eQc
	YCtTqveFDbriuAUiac/h/9FpRheXKvblCEzTq8DkJ+Pgkg2/CTptiLiVWwbbthe16PoZhnaT9VB
	4A9qc8Rlcs4aHIVu+oJKQ2nbYStEbO2yPkZy+CUC8/StxWlcKvl777KFp/6sS0GVEE5Wq129Rjw
	ngPtIPblLtU8ehLvaRPMd2mf4L1Id7Q==
X-Received: by 2002:a05:690c:e3ca:b0:8b0:a54d:aeac with SMTP id 00721157ae682-8b0a54ec872mr15865857b3.14.1791898807168;
        Tue, 13 Oct 2026 06:40:07 -0700 (PDT)
X-Received: by 2002:a05:690c:e3ca:b0:8b0:a54d:aeac with SMTP id 00721157ae682-8b0a54ec872mr15865827b3.14.1791898806727;
        Tue, 13 Oct 2026 06:40:06 -0700 (PDT)
Received: from [10.217.218.70] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07f1c8612sm46658947b3.15.2026.10.13.06.39.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 06:39:39 -0700 (PDT)
Message-ID: <19dca84c-68b0-48de-addc-399c406fb152@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 19:09:09 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] dt-bindings: usb: Add qcom,sa8255p-dwc3 for
 firmware-managed resources
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        mathias.nyman@intel.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, p.zabel@pengutronix.de,
        wesley.cheng@oss.qualcomm.com, sriram.dash@oss.qualcomm.com,
        jack.pham@oss.qualcomm.com, krishna.kurapati@oss.qualcomm.com,
        shazad.hussain@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261010053246.2991984-1-faisal.hassan@oss.qualcomm.com>
 <20261010053246.2991984-4-faisal.hassan@oss.qualcomm.com>
 <20261013-light-significant-markhor-c30eea@quoll>
Content-Language: en-US
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
In-Reply-To: <20261013-light-significant-markhor-c30eea@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VqC2kO2n c=1 sm=1 tr=0 ts=6ace34b8 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=zkeY3IreNFxg1TzoVDwA:9 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: 9a8ogo8SDCUOfgZGFCl3cwZDaD_xddNs
X-Proofpoint-ORIG-GUID: 9a8ogo8SDCUOfgZGFCl3cwZDaD_xddNs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1NCBTYWx0ZWRfX89FYDpfxlLvS
 EXDO82tkddSsl9kl9TOeh/ydU9UDXhuoM4m3cuwDUGMcF4q6unvQAVw+sOlRaCNfaVG4e3Sp3dX
 FLGbszg0E8OrZ3UzdH4OJkiijS2X1Ds=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1NCBTYWx0ZWRfXzRuc4k2ogm2P
 VSDqO/yE3Ikv2GK78SrBJ0OC4YwY97Ivj83+eU6rcIMzsGDkAqSz4KZ7PYvqdYVJ2ZH2pvA+a+7
 rof0eMDq3zXS8K50kzgln9kH82I9ygh3TZUBk0JWU0KRLcr6vDwWnQ/ZqV2IeATYvdciquEE5tC
 A14VevivDonM6LZ3k/t+j70hbvJ/MlhDkuWKg3pwCX6fvj6ie+Md2IUOP7e3GC8eCOpJOOv7eOr
 Rrw/st0uBdKKh5pkFarKGxjbmUzYsdIMFRcAbQGULCWsHMKV5HCjr/HmQEID1V7nZ9G+vSWPEVe
 DxR/rAkhHyLVhgswZLKlO70FF1ISxmHiH03MYvMJOOLBc2uM79w1WOrsMSH0iJitFnnuvQWLl2e
 M2kY59NiQqgh+Dz2sg+mY6swmotff12pURRgmGHYBdUSjnQuvytnyFVTtWn3B6jASkkICv1j/cK
 gDyoFJCEJqeBNZkDXNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130054

On 13-10-2026 12:50 pm, Krzysztof Kozlowski wrote:
> On Sat, Oct 10, 2026 at 11:02:42AM +0530, Faisal Hassan wrote:
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
>>   .../bindings/usb/qcom,sa8255p-dwc3.yaml       | 119 ++++++++++++++++++
>>   1 file changed, 119 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml
>> new file mode 100644
>> index 000000000000..87f426fdbd70
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml
>> @@ -0,0 +1,119 @@
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
>> +    minItems: 5
>> +    maxItems: 6
>> +
>> +  interrupt-names:
>> +    minItems: 5
>> +    items:
>> +      - const: dwc_usb3
>> +      - const: pwr_event
>> +      - const: hs_phy_irq
>> +      - const: dp_hs_phy_irq
>> +      - const: dm_hs_phy_irq
>> +      - const: ss_phy_irq
> 
> That's still unexpectedly flexible.
> 

Ok, I'll drop minItems so the list is fixed at 6 entries:

   interrupts:
     maxItems: 6

   interrupt-names:
     items:
       - const: dwc_usb3
       - const: pwr_event
       - const: hs_phy_irq
       - const: dp_hs_phy_irq
       - const: dm_hs_phy_irq
       - const: ss_phy_irq

>> +
>> +  power-domains:
>> +    minItems: 2
> 
> Drop
> 
>> +    maxItems: 2
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: power
>> +      - const: bus
> 
> I don't see how did this improve. I asked to use existing bindings as
> reference, so why aren't these power and perf? You wrote that bus
> controls clocks and interconnect, so is this something different than
> perf domain is doing for sa8255?
> 

The sa8255 "perf" domains (e.g. GENI) are SCMI performance-protocol
domains with OPP levels. USB "bus" is a plain SCMI power domain with no
levels, only on/off, so "perf" would be misleading. I'd like to keep
"bus", and will drop the redundant minItems.

>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  iommus:
>> +    maxItems: 1
>> +
>> +  phys:
>> +    minItems: 1
>> +    maxItems: 2
> 
> phys should be afixed, constrained.
> 
>> +
>> +  phy-names:
>> +    minItems: 1
>> +    maxItems: 2
> 
> This as well.
> 

Sure, will modify as below.

   phys:
     maxItems: 2

   phy-names:
     items:
       - const: usb2-phy
       - const: usb3-phy

>> +
>> +  dma-coherent: true
>> +
>> +  # Firmware-managed platforms do not use direct clock/interconnect control
>> +  clocks: false
>> +  clock-names: false
>> +  interconnects: false
>> +  interconnect-names: false
> 
> Drop all four above. Not sure why do you need them.
> 

Sure.

>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - interrupt-names
>> +  - power-domains
>> +  - power-domain-names
>> +  - resets
> 
> I guess phys and phy-names as well.
> 

Sure, will add both.

>> +
>> +allOf:
>> +  - $ref: snps,dwc3-common.yaml#
> 
> Best regards,
> Krzysztof

Let me know if these changes look OK, and I'll send v4 with them.

Thanks,
Faisal
