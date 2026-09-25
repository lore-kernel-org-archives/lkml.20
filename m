Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185891922FD
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 04:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790309326; cv=none; b=OFlHhCXe1AI+byQHvHhXs++lpae7gBkfZbwBrirGYdnXc51QZ0aozCLOq97IapsJ8o5gMdweyqU6An4xKucXclAFCbUGCclE9OFyBXflQ/X8tkKbbi+fbDEOA8UX7Hg0Bs7c1/3q5QbSW9IxHEmw505GDSFEBWO66AiCoH6YOtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790309326; c=relaxed/simple;
	bh=+dOAda3zxjmUol975BAwpv4/X02vCxfJi2PJaeVTH0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GuSg7Ztm7xw2WXtMy9g6QYhXAy6Wl72Hcrxu3UUsj5jRwNX2oaNMOzO+YlfAEWEOKCWwb2iRUAfmBUb8zManoJ4K2+SyIjbvtrt9ehJzMpJhlh04iuz2/AaYfeuTaNPazMAsEYNaoCf9re1YV2aiebQmYD8zX3rm4QGawxAJ8ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AmuYVbRV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O3IpTb5W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AmuYVbRV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O3IpTb5W"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P1kakY843505
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 04:08:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yC18zP13i2KmpC/DV5boNOGnrL3YTVpI80ZH1XUdZTQ=; b=AmuYVbRVJXy5sSo4
	UbuJgB+9khPaiVd0aePcJSbRgHYrJ/sjsYXcbNKSxCkGndfEzCKU3Tst4sM4eN0x
	MZMngQbHIx7743lf5fw5i28pu1d27guytyrqpvUr3VvD8oJHaWa89Osaarb/Gnl8
	aG+OyANgooxpiYhIdWKeoYo6vwSocvyot+TYXDMsfKFr4jkcPUQs3kWZ7H7Qif8Y
	DBeWWcDuZAdCBfYKyBUFgqxevSxVr4R+ZDqEKjTAB6c3B25zXifseRG1+Mje/68o
	3cF+bYK1ZuZuVfQiGFKS9f82D44fkfvF8a0L4g3I3oxhcPqTlZyibquqZnu45e77
	cfAeCw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw874hxbj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 04:08:44 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-313d1015161so1552925eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790309324; x=1790914124; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yC18zP13i2KmpC/DV5boNOGnrL3YTVpI80ZH1XUdZTQ=;
        b=O3IpTb5W+Da+KJoVTUeUDCvLG64D+93rVBFmhMdnJskR8ApCckRdq3UctKmBaeNi/u
         fKTBGbPoPVF3l8HLFMjO4rpHZNKZf6GGD4tC44woGZyUQHJQWnad+sQ7h7K1lGVKp+Gn
         pLIrH1RoKhhetC0Rs6CFYnAdNJky3NI3qPEIxDcZjKHyVW4En2/C/LyauVDkmyhClNvt
         sJCvurJclortcan1qJRAyZ50a/EkfFdYDU/F4WUpGncuyEnTF3MjvQ8k0x2Bv1V615UL
         25eeIjMKSOabLSrPyQ13PHGLVtYtoONL/fCRxCMGMs8JP46McNQ7vGSk5cj04Iy3LRti
         uKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790309324; x=1790914124;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yC18zP13i2KmpC/DV5boNOGnrL3YTVpI80ZH1XUdZTQ=;
        b=QTl74XE2Z5t/kkuPeacrlGPhrbt2DPtAA1j4PHFQ0mlP4eank0cV82sWmTXCHxHkqa
         njfYzAYJPC7hxBocxJtvn0HHb/zhuf67dpiM2MIQUSJ7yBXnNXp60QKIhpxEtPulXXRS
         2BPkgI/5JglDDEludNlqyxbzdy41WbGFvWlXNkeT3k5rR01N6qYgNKCA5s7eJa6OybtQ
         ep17qPhm81hA7geL2qDEnWh+uGcUKKJl0UrKPtJ4EzsMd+Jrvo6uH4Af7/4siojGf+4K
         vKlMrPO2hnUx4VCguRAE2Zy5Pj3puFWORDj/XePSdQFyx20S30oC/8Bq7psaxkmEeads
         B/0w==
X-Forwarded-Encrypted: i=1; AKwUvBweNmM87XIiSSaGBYFY93d2RdOogi2EKmJMqEVIyageTomd+utHtZ2ySHTmo2/xCs2kOcpRvXzVIyRvr/c=@vger.kernel.org
X-Gm-Message-State: AFuF++kAv4UU3tYwzmftomnOhksqBVUNa4g2llAjpDQggYA8dVEWWZBQ
	gSeErwKFjbCJlfC87GMH84bdr4ynr+Pk8XBeFSbii8ntEC15EMX9QS/X6u4cauFFXya+27Of1gS
	QUfPvpiDm9ygpSSZPIGkO1NUzLcU3LIi1hk0WsZLxE1PKGdBcFdw0ojL773rzUU1Bd5E=
X-Gm-Gg: AYBFou3cujsJeY09qPpuTeg2nEO7qKnPuN85oWbdFcA5fYmPZg2T4wO+3K/tqnBBRrR
	EIS+W5NFWl527sVkfsc1McqVAzt1wC9DDS1cTpXQl5BMJIEyMTOgvoZW+neiyLcwvmuCnsY6Tdb
	vkHVyJA78Jme4wF6yt0WPlLcQ3ipM26S1jW369i+1bYetotgVJvuxN1kBq9LPoN+8U+FMyq/FM/
	sEfZhgUvlad72mz8GcrxIt1x3z8JG6C84TV6J2oVPVhFsALKDSm5i9oANDQBAJDxCjRqglGgexv
	iWSRVq/651zkRzzDPruAPLo03cv0GKoaJKz50BBt8l70/XXXoB62dDPaiwPnOSWrOtSwmq68Ijn
	GgUmdRTw1XAW1lAqzCxRygLLArU6vYHQ/
X-Received: by 2002:a05:7300:818e:b0:327:affc:b506 with SMTP id 5a478bee46e88-34004e839e1mr5134614eec.15.1790309323435;
        Thu, 24 Sep 2026 21:08:43 -0700 (PDT)
X-Received: by 2002:a05:7300:818e:b0:327:affc:b506 with SMTP id 5a478bee46e88-34004e839e1mr5134580eec.15.1790309322832;
        Thu, 24 Sep 2026 21:08:42 -0700 (PDT)
Received: from [10.218.42.145] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3413fc2413dsm2812641eec.0.2026.09.24.21.08.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 21:08:42 -0700 (PDT)
Message-ID: <050f7d22-48a2-4114-babf-7cf21c4bc08b@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 09:38:35 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] dt-bindings: phy: qcom: add Nord QMP PCIe PHY
 binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas
 <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, shengchao.guo@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org
References: <20260921-nord-v4-0-ed05c6e09240@oss.qualcomm.com>
 <20260921-nord-v4-1-ed05c6e09240@oss.qualcomm.com>
 <20260924-lumpy-robust-fulmar-1bfbe0@quoll>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20260924-lumpy-robust-fulmar-1bfbe0@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: EGucDCmtjRyAvnDI-rrYPuESUexowMlO
X-Authority-Analysis: v=2.4 cv=MI71C8Zl c=1 sm=1 tr=0 ts=6ab5f3cc cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=l-6eX-iZw65OgPShCm0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAxNiBTYWx0ZWRfX1Ei9IioOX7Lb
 5pg14elYfeHFUSsQLWuCrmKZTUOuIe6nttIIeYTdscuKkcBIYTBxMI7elIw+vaUzN6QJiSlEcpQ
 KMxUCurs79hif9VRXkOyRId4bYk3M4nTJnlQZGIIAo5C4KzYTZxq58ivxP8yBGUk7EkVs0ZSLZT
 lDJddFLnTcq7BBOF8p+HNY7OL24bMfs+zXJMf/YnUqanmMaMCYzhX/yM+5jc+cAeDgDa9Dlf7+2
 rWKXr8Qwp8HqYTSHhXm78Y5BVtPoQ+1Lc420r93eGNNa00E+CuVUvs/xu16IvyZKkwImM/Gf7dT
 WDJSLSdsyZwEA9dNgUyeEcAkAO/29odaMCSNX1v0jkWkqKTlxrYrIN7/bQ8xOGF3bHD05Tqbiap
 ap3TX1t21M5TH///9ji9VgbamRGRV9egVoRmLrdgbS/4Xa7qlX0TSPRtlGHiGo0sy1yBUExRVtt
 O3vTDkqpoujQ6ktxy+A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAxNiBTYWx0ZWRfXxamgjxYUBvTI
 cKRh2P5i29y0ddF651VBB8E0n3+94eSQUqTPrPjOF8uFlI2Cqj+NwpbkCOHQieH9q7C5dWzA15q
 XUues89T+8kCT5pXO3Cx2/LXyTpHsW0=
X-Proofpoint-GUID: EGucDCmtjRyAvnDI-rrYPuESUexowMlO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250016



On 9/24/2026 6:52 PM, Krzysztof Kozlowski wrote:
> On Mon, Sep 21, 2026 at 11:07:09AM +0530, Krishna Chaitanya Chundru wrote:
>> +
>> +  vdda-pll-d-supply: true
>> +
>> +  qcom,link-mode:
>> +    description:
>> +      Reference to the TCSR syscon register containing the PCIe link mode
>> +      selected by firmware. The property consists of the TCSR syscon
>> +      phandle followed by the offset of the TCSR_PCIE_LINK_CONFIG_MODE
>> +      register.
>> +      The register value selects one of these topologies.
>> +        0 (QMP_PCIE_NORD_MODE_X16)         — all ports combined as one x16 PHY
>> +        1 (QMP_PCIE_NORD_MODE_X8_X8)       — port A as x8 and ports B+C+D as x8
>> +        2 (QMP_PCIE_NORD_MODE_X8_X4_X4)    — port A as x8, port B as x4, and ports C+D as x4
>> +        3 (QMP_PCIE_NORD_MODE_X8_X4_X2_X2) — port A as x8, port B as x4, and ports C and D as x2
> Same question as last time. phy-cells tells which mode you are here.
> This is duplicating it and the register value CANNOT choose the
> topology. If it does, then phy-cells should be 0 as topology is defined
> by hardware already, no?
phy-cells does not describe the topology. The PHY argument is only used by the
PCIe controller to identify the PHY instance associated with that controller
(for example, phys = <&pcie_phy 2> selects PHY instance 2).

The qcom,link-mode property serves a different purpose. It provides access to
the firmware-programmed TCSR_PCIE_LINK_CONFIG_MODE register, which describes
the global lane partitioning (x16, x8+x8, x8+x4+x4, x8+x4+x2+x2, etc.).

  - phy-cells identifies which PHY instance a controller is using.
  - qcom,link-mode reports the overall topology selected by firmware.

- Krishna Chaitanya.
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    items:
>> +      - items:
>> +          - description: Phandle of the TCSR syscon
>> +          - description: Offset of TCSR_PCIE_LINK_CONFIG_MODE register
> Best regards,
> Krzysztof
>

