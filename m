Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793832456;
	b=owQMohCw/D4RAEDoF/mlABsQ+BVNvA40aoZwXC2oisN8SIuVjcUm1sTCPlEq53PSxoxH
	 zecIwWx0PF3LjHazoysOpdQtBWOvtW3ZJxTpJRKbI9M5y1cPys8dbmb24gsTTlNk0OrgI
	 fkKexIe7zRz3Fe/V/pvZmeryC8iftQl8h+etAeIfB4Pg9HzkKVtLGbNAwatkioIcNK9JN
	 wR33VFnqbrXEOQNdZb/1MqFUv0WWY++JpiPgqpQ6yT6oMoD+akTcUcBXTe613nL9JffcO
	 C6EaeM6J7YHUCn5plIrbZAE/zFlnpa/Tr7AHpWE4zGjH9m/7h5hYl9ze/iMHD5XsQMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793832456;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=B9JOD6Zk4V3P6OicBg4lY0cN+dvX1jzJBdo/RTj2Z2c=;
	b=4GEopIHrcsCcCGqMNte4kIrIB36YvGPSChqQYE3kphHpfdcj5g85DxLuhsANW3M1b/ZI
	 sfALuhhozG7do+Akhq1EHhaBqy4oNC8ypb7W/fc0l0gY6KDifDyj8XwXs+pS82OCUqhmL
	 fZjO4bOlWmfhPtpazSN77f2oT5StZe3n6hcg0WOAGtThGnc+ecrS8RjzVG0gk8F9lwKwP
	 avj06/gIY7i8gYqOC+KIQ/WAPYLZziOlPgrT2J/8LjSCGxUJBXlRHnwvsPWN/s+K6rRPH
	 7I5zzy3cenOlC9yJuTfeMETbjHRywb5ki44HOUq/iJnszGbegTfb/ec1hIW+sAOrZKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Yiw/JkgY";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dni1wFCn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1FF606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 22:47:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD1FF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yiw/JkgY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dni1wFCn
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4MWRxe1692579
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 22:47:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B9JOD6Zk4V3P6OicBg4lY0cN+dvX1jzJBdo/RTj2Z2c=; b=Yiw/JkgYgIQ0UOQv
	PbCUvdZ9qLdQNt2QLW5Xx99mMZdWRwdLD1Z2JCv2FtKhTAqxXRq+YaWkzrM4itgk
	IajfD3mSArjtdWow81+ojjRdFKsTQsNf7tAEuDuRJJo/YVgrRLqCcx1ara2FmRM9
	FDJa9EpNvAAutDh8kzGRlBonzwErGk0cBqrr3qo/IDkOws3OeTUPPVXRmWaenWk/
	z3meMW7X3RDe8R7nJ3k8//Y6OyuhBpnkdpus7k+TaGdIb3bfqXFdumjAhKjRF8N3
	G9FJI161SBYSJauK3fi6RjuXWLvy+ZJmIS0GALXp6LFaV2NAjJHfJMuLxNtdQgTI
	vPOzrw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6br20nm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 22:47:35 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33713e5e6daso1350306eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793832454; x=1794437254; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B9JOD6Zk4V3P6OicBg4lY0cN+dvX1jzJBdo/RTj2Z2c=;
        b=dni1wFCnnPwuYD1GdYTCs/D7MhvRsJcDPFE9JcdbtD0OpUx5U3616fL96/s9WlpVph
         Mwj0AOnPGv7wPL59xph9fBWZOlz+8PSpzwAM8XjfX+mUPehc7q6U9c5rpqqDp754GmMv
         OCjPw7Gt8jkMaDZbBEhxoii/7L6wk139GVllhoC8C1BB5FTx/E2QOAYl727Qldkj2l+p
         +Piaqj6M36L+h5DFObXEX54+Z91JVhSYvqgoBz2TUBU9Izv+u0L6ZUPY30yIoOvTxPG0
         eSamwp3+QIS9k3rCf0atRnSujfDT8gS2WTxCTY38xFYc+NTK3in4D5Gwhr9+av1NJpTi
         EuTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793832454; x=1794437254;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B9JOD6Zk4V3P6OicBg4lY0cN+dvX1jzJBdo/RTj2Z2c=;
        b=ECubN+SuxGP1iDQyZlW/R/CcCz8ZBKdsSZpJ8s+hamy0o6Qk5uYkHT150u+/MTNrWA
         IDBShp0GeScLBMDrv8rqjZ9ZwB7SGNQsSlyoc+XLeXnhgSt6Jsw0/L2I7zAH3wvP7er2
         W5I0q/sJy69tSC80HnJzqJRae3Cz7H6b+BGnxU4ZPG8v5NmjK7jSGlw+xbCE+KwnkSRl
         9Kzh8/hCiGuDLyQ4YS25fhW8YMkVCH/YX2Y4cvLD3K1DYE4ZGrNH1ie6LM5l4TTEzkfa
         xqFHfTl+irz4IEjJ2BpdzDAPAqLcMJTvveAC/17A2fQpSgyfVY7Zo9DpUx0MlqyeDCEW
         Pqgg==
X-Forwarded-Encrypted: i=1; AKwUvByMO90ettWza7yIGuSLh7eo3SAtBr+5QPZcFSQ6dNI3Jrf29sRrfL2713eLaPJcBfdZNBYLMWajbyZvMZc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pK5pIf91Wvt1iBIGP9vih6cYTHV0lILk/cu/g3VIpVKbVPtSV
	Xo34OofmRYjbsMGyuDN+kQoSNmfur5DUi3GaebmlkTauZ/7cJhPsU88xuEFM9nTtF+9p2B0TjD4
	QeO7vV4Ea1rYhGh0ilqEJqyJIc6LGNIBspJjmekNafShRILwq6kE+NgnuXJGv5LSBlqk=
X-Gm-Gg: AYBFou3x+7Uy42+iuw/ZVY2vEUey+0YG1rt/6Ql2oj+miN/jmI1MqV5eaF+5m0IiRoA
	w0ruGZJDyCaEYPfhVLsyYJbS8WSzOrdC19T0Wv+5WQgI3DIOZ3zctC8QzMR/4eNmm6wn27CVMZb
	o0ymZCcdEIrHxaZL/uIurs0cvTzUkjwUWA9yoJO7cP0WL2txfq5NCLxSdgtBL0uq7d+DVD81aI4
	97A1Wg6qgAuC4X/IuZ8S93LJ8xp3KV2P+2/Z1x098wDlVMK13yFWKha6p1ndg/Xd7mDJmmauhIn
	1LCZt96qrv9eoKnAibOJjEAUGx4seXXKX1jFIQwuz34XucVrcG+fDrvPdFqHGUDL5mxxkTl4n1r
	ZEygQ9UAKNZLUVpaMfXL/YvqH6qqEgZHj8Ylu5QAdnauX1eFJa+XSRpgSHiZR/IYizAOUs78cj8
	WbDOkMIYmFk1ypW2wCNkjm94+9fM8m
X-Received: by 2002:a05:7301:e105:b0:36a:15cb:30bf with SMTP id 5a478bee46e88-36a42345851mr24443564eec.13.1793832454127;
        Wed, 04 Nov 2026 14:47:34 -0800 (PST)
X-Received: by 2002:a05:7301:e105:b0:36a:15cb:30bf with SMTP id 5a478bee46e88-36a42345851mr24443521eec.13.1793832453392;
        Wed, 04 Nov 2026 14:47:33 -0800 (PST)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36dd85a5464sm2052690eec.4.2026.11.04.14.47.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 14:47:33 -0800 (PST)
Message-ID: <d21c5d8d-6dc2-465b-941a-e551a2a46dce@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 14:47:32 -0800
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
Subject: Re: [PATCH v2 1/5] dt-bindings: phy: qcom: Add common qcom,csi2-phy
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261103214105.3605181-1-anusha.nandi@oss.qualcomm.com>
 <Qxjw6nqG8e0t_jwSz4HC1rrgZrHc2wUez5PQn28lbXlvMq_V4_RSjlzhsFu_8OgE-pmS_GkXKICn0ObgJWomzg==@protonmail.internalid>
 <20261103214105.3605181-2-anusha.nandi@oss.qualcomm.com>
 <803d16ba-49c9-404c-8973-e4d4dc02b1e3@kernel.org>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <803d16ba-49c9-404c-8973-e4d4dc02b1e3@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA4OSBTYWx0ZWRfX+a1WnGIoWx66
 IXKzyYArpeDq/iLqWoHDG9D8FWcPvsvRvoBz0rUfaKx3dFu8lEKC0RIULTV3fXLPJfLFAL3txu+
 JA0g+BpDEDs8n5QhIKuq2fxAzXZ88PSac0z/hWiedR8C1RTMsr+9PqyRyKSoGO7HU1OUj2fhLwl
 btDvRDdQfFxQxOWGkWim1K2lNt0fL+rUk6IVMqVqlK1L4OE5koRSJEPTNs052dlSflnuHdPCwIh
 LwVG8mtvmRA8IAr96ebbtTLGu+oIrN3UQWUIM/A4nTi8qTxn4YXdu9wxAT1BjKf+9bgQbSx4uKa
 KL4OR664c+SNwphB6TqDKS7ZIg6HtiP88hGxIYf9YeHysIZ2t9rxALnQQ4ooruSwTuUu83mX2a4
 pXmNDSq4xgjCvL64p0Umcv4QJRcl74iX5HhP8MKHwXrK8LArwMAjrfxFn3XiiE4qOhtXq4fa5D/
 q69JcgMdSyIy1fe+KiA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA4OSBTYWx0ZWRfX5MfT69smn5F8
 S39LPx1jhFXpMfOB240CMYzEcgR9mWKstFZM2vJMU0NFDWypZwQ+5dP06Rm9T6TnrDUIJKvXgvc
 ydosjAsFvVBHzdE4xk4dhLjKq9CmOq4=
X-Proofpoint-GUID: DUzgwAl8kcWmLs62j7wroQB_FQ5tRhmu
X-Proofpoint-ORIG-GUID: DUzgwAl8kcWmLs62j7wroQB_FQ5tRhmu
X-Authority-Analysis: v=2.4 cv=futJ914f c=1 sm=1 tr=0 ts=6aebb607 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=YckT5oapyQZYSsRhpqkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040089



On 11/4/2026 3:29 AM, Bryan O'Donoghue wrote:
> On 03/11/2026 21:41, Anusha Arun Nandi wrote:
>> SA8775P, QCS8300 and SC7280 CSI2 PHYs are bit-for-bit identical in
>> devicetree shape (ports, bus-type, data-lanes, operating-points-v2,
>> clocks, single "top" power-domain, vdda-phy/vdda-pll supplies).
>>
>> Describe all three with a single qcom,csi2-phy.yaml and a compatible
>> oneOf, rather than one standalone schema per SoC. QCS8300 is further
>> required to be paired with a qcom,sa8775p-csi2-phy fallback
>> compatible, the same way other Qualcomm bindings express full
>> hardware compatibility between two SoCs (see qcom,qusb2-phy.yaml);
>> this lets the driver bind QCS8300 nodes via its qcom,sa8775p-csi2-phy
>> match entry rather than carrying a duplicate one.
>>
>> qcom,x1e80100-csi2-phy.yaml is a separate PHY with a different shape
>> (3 clocks, 3 power-domains, different supply names, DPHY split-mode
>> support) and is left untouched.
>>
>> Reviewed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
>> Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
>> ---
>>   .../bindings/phy/qcom,csi2-phy.yaml           | 176 ++++++++++++++++++
>>   1 file changed, 176 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/phy/qcom,csi2-
>> phy.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,csi2-phy.yaml
>> b/Documentation/devicetree/bindings/phy/qcom,csi2-phy.yaml
>> new file mode 100644
>> index 000000000000..5d25547528bd
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/qcom,csi2-phy.yaml
>> @@ -0,0 +1,176 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +# Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights
>> reserved.
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/phy/qcom,csi2-phy.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm CSI2 PHY
>> +
>> +maintainers:
>> +  - Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
>> +
>> +description:
>> +  Qualcomm MIPI CSI2 D-PHY. Connects MIPI CSI2 sensors to Qualcomm's
>> Camera
>> +  CSI Decoder.
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - enum:
>> +          - qcom,sa8775p-csi2-phy
>> +          - qcom,sc7280-csi2-phy
>> +      - items:
>> +          - enum:
>> +              - qcom,qcs8300-csi2-phy
>> +          - const: qcom,sa8775p-csi2-phy
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 2
>> +
>> +  clock-names:
>> +    items:
>> +      - const: core
>> +      - const: timer
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  operating-points-v2: true
>> +
>> +  opp-table:
>> +    type: object
>> +
>> +  power-domains:
>> +    items:
>> +      - description: Titan Top GDSC - Titan ISP Block, Global
>> Distributed Switch Controller.
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: top
>> +
>> +  vdda-phy-supply:
>> +    description: Phandle to PHY supply.
>> +
>> +  vdda-pll-supply:
>> +    description: Phandle to PLL supply.
> 
> Why are we departing from vdda-0p9-supply and vdda-1p2-supply ?
> 
> Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> 
The 0p9 and 1p2 supply names are derived from the current CSIPHY
hardware power rail naming, which may not remain consistent across
future platforms. To make the binding more generic and
function-oriented, I will rename them to vdda-hs-supply and
vdda-lp-supply, which better represent the CSIPHY power requirements.>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        description:
>> +          Sensor input. A single sensor is described by a single
>> endpoint
>> +          with one to four data lanes, numbered 1-4. The clock lane is
>> +          position 0.
> 
> Since you've cloned and owned the yaml - you've also dropped the
> description of DPHY split mode.
> 
Thank you for highlighting. I will add the support for it. >> +
>> +        unevaluatedProperties: false
>> +
>> +        properties:
>> +          endpoint:
>> +            $ref: /schemas/media/video-interfaces.yaml#
>> +            unevaluatedProperties: false
>> +            properties:
>> +              bus-type:
>> +                enum:
>> +                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
>> +                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
>> +                default: 4
>> +
>> +              data-lanes:
>> +                minItems: 1
>> +                maxItems: 4
>> +                items:
>> +                  minimum: 1
>> +                  maximum: 4
>> +                description:
>> +                  Data lane positions following this endpoint's clock
>> +                  lane. Positions are a per-port logical numbering, not
>> +                  package pad or ball positions.
>> +
>> +            required:
>> +              - data-lanes
>> +              - remote-endpoint
> 
> And then you've dropped the DPHY split mode defintion
> 
> NAK
> 
> Please either clone and own the whole DPHY split-mode circus or just
> modify the existing definition to include your new stuff.
> 
Will be modified along with other comments for v2 version, sending in
shortly.>> +
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: Output to the CAMSS CSID controller.
>> +
>> +    required:
>> +      - port@0
>> +      - port@1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - interrupts
>> +  - operating-points-v2
>> +  - power-domains
>> +  - power-domain-names
>> +  - vdda-phy-supply
>> +  - vdda-pll-supply
>> +  - ports
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,sa8775p-camcc.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/media/video-interfaces.h>
>> +
>> +    phy@ac9c000 {
>> +        compatible = "qcom,sa8775p-csi2-phy";
>> +        reg = <0x0ac9c000 0x2000>;
>> +
>> +        clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
>> +                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>;
>> +        clock-names = "core",
>> +                      "timer";
>> +
>> +        interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
>> +
>> +        operating-points-v2 = <&csiphy_opp_table>;
>> +
>> +        power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
>> +        power-domain-names = "top";
>> +
>> +        vdda-phy-supply = <&vreg_l4a>;
>> +        vdda-pll-supply = <&vreg_l1c>;
>> +
>> +        ports {
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            port@0 {
>> +                reg = <0>;
>> +                csiphy0_in: endpoint {
>> +                    bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
>> +                    data-lanes = <1 2 3 4>;
>> +                    remote-endpoint = <&sensor_out>;
>> +                };
>> +            };
>> +
>> +            port@1 {
>> +                reg = <1>;
>> +                csiphy0_out: endpoint {
>> +                    remote-endpoint = <&csid_in>;
>> +                };
>> +            };
>> +        };
>> +
>> +        csiphy_opp_table: opp-table {
>> +            compatible = "operating-points-v2";
>> +
>> +            opp-300000000 {
>> +                opp-hz = /bits/ 64 <300000000>;
>> +            };
>> +        };
>> +    };
>> -- 
>> 2.34.1
> 

