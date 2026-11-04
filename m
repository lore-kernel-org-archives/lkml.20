Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793795500;
	b=qlKFYYCoZ/9lHsikHKAp3ScszIHHXgzcnSqDj+FM8qT3gof28hLFDv/631xRbNzotRul
	 q/zrvfUqvclqgR93Gb2AoddWIWGdrujHz8fEioht95ruAApinQTFkqG4t9pnw+v1boOJQ
	 f+HqP6CkhRyxRRnysAma1/p0NKP4O3h5NhJvoguvS82dl4dulf73cQACOEMZqNu5Yek5d
	 2vxfbesqyj/9ej+m7qoUa0OycAWkPU4Rmv3Iril6IJwDfFjKyK8vOWw9jVsC99FXL588X
	 f0IoWqVQctUgYwrvzc+Pd7mj4iS2O+OHQeC2f5sKbzTN1aU/+lpFttn0jcgvPitoRbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793795500;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lnL7P2K2JsAHzjwZvLRLUkgDyRdrFe09a3PwUwJXSRk=;
	b=twyfoIfF4e+BYBps0xojYK7DMgApLkfwXsRCid5knXYEr69Pu1PgmPhYpbTfpZ+Gen6g
	 QmGB364MVmaGemB22TPS2U41mWf38crRWtYz0VxZlmhQASkXuPGhTiUoQcFCKPJu5vy0C
	 p0ZpFwXgoPzPnXwr7xORJ4LAvyCGgAdcxqfBmuD52zVbFDmH/MRLV5/0i3rRiD8fWGgii
	 hJcbPe5NCKt3GCIIdtrNvm4Nfb49OpDOgDful6jQ0zQL5VflZ/P89N5YB3h8xTt7O261K
	 LCxVM7yH7uzGWrfoCrGKefycjtReIF6Um+JBFPWji19DS7wjX9NRR6izcK+EHZ+mFGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dK6LpR7A;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Oh+/gIkJ";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E883A606A332
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:31:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E883A606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dK6LpR7A;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Oh+/gIkJ
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BaM092729160
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 12:31:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lnL7P2K2JsAHzjwZvLRLUkgDyRdrFe09a3PwUwJXSRk=; b=dK6LpR7AFtsbeFf+
	pRbP3a65/RSfyMrV7sEWkjXVmlyFSwPYC3KG61yqkxRWGe871n3QNtt4jAOEdm2T
	CXtt+2SIY1vwaaYMbQAPvvjvTr6e9zY/YeHdRCXN27ZcPrpJhMnOf8A44HCejBk8
	3tbtA1fjqf9k87+UK4Q0Ty4EuCpXMXjXBwfsJTXH7ct9UAG/MvSe6k9yQxzXx3IA
	cRfseUmvUX9GDl/YwY18g5vBhg7SfpdEshtczwPJVbeoumu4fV5MBLKrtsXNjzvh
	5AvgtXvGIG1vPv60vCx2+t3LHNbx3mavUBsWXaw5bxprY0iRr1I7cg7PWPvfUBXp
	wZpGxw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqpuvbc0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:31:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e9501034c4so11087035ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 04:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793795485; x=1794400285; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lnL7P2K2JsAHzjwZvLRLUkgDyRdrFe09a3PwUwJXSRk=;
        b=Oh+/gIkJYfp5u6JJGxFG9ABoy6UQSK0mjJs7n02E/idXjvy0k0j6TLmA2VUIQf35Lz
         cBmn/1QsiOBqn28Xa9URIcFSXQiGd0UUwQa6DFa67UZDJV/e8pT8I3saGjy22PTzRTJJ
         glnoo3kQdTpjP/uZU93zrR/0jzEubZxvqiKQCLoMxPy9Lww9MYOZWuHmCVoSBhIKjG7h
         gIsbWddSC65Ue2gIM05ZC0y4J5L/fuVUbWE3DjtH1TuLXd//F3oghHDZMYWcUejKLJrm
         K6kc3m6s4Nn7yEN6d3gbuSp2z0ZQhgu606qxqIaujNwrsA5IeUlfsZlSPojCNEG07nkC
         tGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793795485; x=1794400285;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lnL7P2K2JsAHzjwZvLRLUkgDyRdrFe09a3PwUwJXSRk=;
        b=2UdBRwhF4r8rgff7yXma+6mrA02dC8QMnMEEMDuP0Q0Xl+4DUsOGjvbiPzMMjP3wi9
         QBxIolk2RuN1x5VxHmcD6Pnxvk4qvRu1HVD5JBDg0iHZ8MUy1VAwTM/Vs7eGpWBVVCLR
         M75dwmw2U6ByD08M4abvwOYVbv6wkxwrhe6sH6dJd+PNL7UrHD87Lfj/VEbHw0vZ2/SE
         5jI+fcp4uHpcLU1EDlQWX+twZK8SaNCxIoC66/uhdtan8DaA8CuhZJuPQfXal6yWtuer
         wxnle8S25uL7wT50oets00F5NLJdyvzhdeZ9oYe7YM475IIHR6UOX57gAn1T1pn5m5Il
         femA==
X-Forwarded-Encrypted: i=1; AKwUvByrekjaUe2w/cxHddtuAnZP3FAzR/iaSQKhabfjKdM9fN4G0D8xP1KFYQX2GATDSR8hSAg15kzIXeSB1wQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9630xBlToiMxlO+s0TGSwfscLiytOb7dRXPSexvN7KpxY2ZCSL
	36JB8NJ5g8Y/+3jJDE5Lxa2gfs7kgdpPOh1QrvcSymbc0cn4t8s24Ibnw63nvPP3/LWIt66umrQ
	2vzjRsBQ/r1BfnodZKZ6filWbA0WTIx8PAae1QHhmVmc0YY8PdgP8ENKjw0Hr/jqERuM=
X-Gm-Gg: AYBFou1GzRCdSi0bP9gXL0PiEfUUMTIj7QOZadZSixMgbenkOODZYII+bLCpYBgXmZP
	7XRT6NgVLCuUFJjZQcxAaN7ji6S5Wq6hqqNDcZq7hPNPyIitXF4AiRvjgtjmv6hzxqBDUz1KxXE
	WOd+dKFe5AByF6VQ25eBeGImGT2SYFrFXF1mK3fbEAs60SLrlO5FioPOl8YPv1CT+OUia1pB7oq
	ETRjLsckM0pMsS/pz4vY2wwzaR90isSdRC77KzjgwICov72IvgzHnZZQmbQI1OjeIjraKClEsWE
	o+xVCkamPAJDLmQ5sW2kut5xkkFZrcPOXuA0YHoxkGjHPY3z+2Kd2kJgCbPWKeO1kFqxm9Iqeo+
	yRZusKTq2LrJeUPY8och2zKgGA1n9m9Nk0t30wB1J1mkpmoacsuvIM78tA2bj2Mhb9Neal36wdT
	Mhhd7H
X-Received: by 2002:a17:90b:28c5:b0:3ad:ce24:acfa with SMTP id 98e67ed59e1d1-3ae897c652dmr12667812a91.20.1793795484685;
        Wed, 04 Nov 2026 04:31:24 -0800 (PST)
X-Received: by 2002:a17:90b:28c5:b0:3ad:ce24:acfa with SMTP id 98e67ed59e1d1-3ae897c652dmr12667780a91.20.1793795484065;
        Wed, 04 Nov 2026 04:31:24 -0800 (PST)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c2ab1cdsm9423184a91.0.2026.11.04.04.31.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 04:31:23 -0800 (PST)
Message-ID: <d40f2212-754d-4788-a555-6a58c2479bed@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 18:01:15 +0530
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
Subject: Re: [PATCH v7 1/3] dt-bindings: i3c: Add support for Qualcomm I3C
 controller
To: alexandre.belloni@bootlin.com, Frank.Li@nxp.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, shubhrajyoti.datta@amd.com,
        shubhamsanjay.patil@amd.com, adrian.hunter@intel.com,
        manikanta.guntupalli@amd.com, linux-i3c@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko.nikula@linux.intel.com,
        wsa+renesas@sang-engineering.com, alok.a.tiwari@oracle.com
Cc: konrad.dybcio@oss.qualcomm.com, andersson@kernel.org,
        jyothi.seerapu@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com,
        aniket.randive@oss.qualcomm.com, praveen.talari@oss.qualcomm.com
References: <20261104111610.3739095-1-mukesh.savaliya@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261104111610.3739095-1-mukesh.savaliya@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O6SsLx9W c=1 sm=1 tr=0 ts=6aeb259d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=rw-enEzn-TZYpfUHzgEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: 7azTgo-JHk5Vw01cDZyx1zsuRqMOGm2n
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0OSBTYWx0ZWRfX5222WcIUjgBM
 VpZ+bH11xcXH2OmsiqCUr8+wLSIrMNprPOTdlIgIFrRcZm7v/7oSGooT3VlhH3VT9fYDvMSP/8X
 cxokjnv7j+XkB+yW6VuP876IROApjK0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0OSBTYWx0ZWRfXzg4DNZNIl81t
 etGZ3KtyIVwNEY79H3eJcupGqzsj44Ddl1cEvqNP+sKH5cOWKxAYiVCjrmHzZdqhia2glVKp5qS
 Chi6fX/P/ZBAWKT8cUQSDqu8vqNfJYO0dJBnCRnku6rtGxf57CXN5CTkUUKuBt24eTBaA3XgOvR
 XP+W9dEJRC01NfU9N3GmBrl2G0rGto/WBv1XmbF9bq4H3o3OKrQMwOhQGmpwo0d7s37u0kZndiU
 jOlpv3BbYCQ5nJEN6kfIS3yo2BO78yReuLLUzj2BDvr41f4HYSlkTU/D55F40u+AnNiG04Nuzcx
 g20HYw6mP1ihTw54E0jcuO05dWkuP6CJdMBRilh313443atdlpb0facYaNOQXfiUmAL+uSlvh+A
 66imqs++Oeqjh/u4aTYgpnE3kxFkuDFEKs7Y0JF/VLhfmhoLFg1ilWt5bQ3C7QaA3dvrDynf7SA
 u2b2nMA+8C0YH3uP+rg==
X-Proofpoint-GUID: 7azTgo-JHk5Vw01cDZyx1zsuRqMOGm2n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040049

Apologies for the additional email. I missed including the cover letter 
with this series.

Please ignore this series without the cover letter. I have resent the 
complete series with the cover letter included.

Sorry for the inconvenience.

On 11/4/2026 4:46 PM, Mukesh Kumar Savaliya wrote:
> Add device tree bindings for the Qualcomm GENI-based I3C controller.
> 
> The controller supports I3C SDR transfers in mixed-bus mode with both I2C
> and I3C target devices present on the same bus. The binding describes the
> I3C controller instance along with its associated In-Band Interrupt (IBI)
> controller used for handling I3C target IBI events.
> 
> Document the required resources, interrupts, clocks, and dependencies
> needed to represent the hardware in device tree.
> 
> Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
> ---
>   .../bindings/i3c/qcom,geni-i3c.yaml           | 115 ++++++++++++++++++
>   1 file changed, 115 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml b/Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml
> new file mode 100644
> index 000000000000..bab89aeee23f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml
> @@ -0,0 +1,115 @@
> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i3c/qcom,geni-i3c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Geni based QUP I3C Controller
> +
> +maintainers:
> +  - Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
> +
> +description:
> +  Qualcomm GENI-based I3C controller implementing an MIPI I3C bus master.
> +  The controller supports SDR transfers in mixed bus mode with both I2C and
> +  I3C target devices present on the same bus.
> +
> +  The controller consists of a GENI Serial Engine (SE) responsible for I3C
> +  bus transactions and an associated dedicated IBI controller(IBI_C) block
> +  used for Hot-Join, In-Band Interrupt (IBI) handling and management of GPII
> +  resources associated with the I3C controller.
> +
> +  I3C controller nodes must be child nodes of a GENI-based Qualcomm Universal
> +  Peripheral(QUP) wrapper. Refer to the GENI QUP wrapper binding described in
> +  Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml.
> +
> +allOf:
> +  - $ref: i3c.yaml#
> +  - $ref: /schemas/soc/qcom/qcom,se-common-props.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,geni-i3c
> +
> +  reg:
> +    items:
> +      - description: SE (Serial Engine) register address space
> +      - description: IBI controller (IBI_C) register address space
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: se
> +
> +  interrupts:
> +    items:
> +      - description: Core Serial Engine (SE) IRQ
> +      - description: IBI controller (IBI_C) manager IRQ
> +      - description: IBI controller (IBI_C) GPII IRQ
> +
> +  interconnects:
> +    minItems: 2
> +    maxItems: 3
> +
> +  interconnect-names:
> +    minItems: 2
> +    items:
> +      - const: qup-core
> +      - const: qup-config
> +      - const: qup-memory
> +
> +  pinctrl-names:
> +    minItems: 1
> +    items:
> +      - const: default
> +      - const: sleep
> +
> +  dmas:
> +    maxItems: 2
> +
> +  dma-names:
> +    items:
> +      - const: tx
> +      - const: rx
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interconnects
> +  - interconnect-names
> +  - pinctrl-0
> +  - pinctrl-1
> +  - pinctrl-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,sm8550-gcc.h>
> +    #include <dt-bindings/interconnect/qcom,kaanapali-rpmh.h>
> +
> +    i3c@884000 {
> +        compatible = "qcom,geni-i3c";
> +        reg = <0x00884000 0x4000>,
> +              <0x008c0000 0x10000>;
> +        clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
> +        clock-names = "se";
> +        interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 796 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 797 IRQ_TYPE_LEVEL_HIGH>;
> +        interconnects = <&clk_virt MASTER_QUP_CORE_2 &clk_virt SLAVE_QUP_CORE_2>,
> +                        <&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_QUP_2>,
> +                        <&aggre2_noc MASTER_QUP_2 &mc_virt SLAVE_EBI1>;
> +        interconnect-names = "qup-core", "qup-config", "qup-memory";
> +        pinctrl-0 = <&qup_i3c1_data_clk>;
> +        pinctrl-1 = <&qup_i3c1_data_clk_sleep>;
> +        pinctrl-names = "default", "sleep";
> +        #address-cells = <3>;
> +        #size-cells = <0>;
> +    };
> +...

