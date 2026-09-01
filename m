Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2521E3793BD
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 06:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788243308; cv=none; b=mfd5FEafnJyfZSAbG7GOtERtxb0LSeIGhR23LFxUbZaTo9i9HU8XRsLHOS1DeouR7KlhPynllC19N+8KZFetbO7dGiEBgx6xIwPzgLP/JEawGIjwOZZaHVC76dlnJUAdTBmYHjDS5wcRRJK3Mv0Q/7S6L0xlXEA/T+lDz7wDjgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788243308; c=relaxed/simple;
	bh=NTnarSf7tMp3CKYU091Dm5ZqWd1tV6igF2erovmUMp0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uSCMgogLkzGrNjv+aYT4qGGue8vGtObNBgIaBMj5mvFvFMFzaZbuHUZPLuetWvgp4y1Is3muzxnCsAf54STBBiwDoccNYL7/Ux2je/Q/w6mV6GEeHVIFjzE2QnZk8RmPoelLeRHoOlRpUCW3zb/EnjM8jAjvtK1jr182Q1whY6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n0VhgzoM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=boCRfLDq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n0VhgzoM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="boCRfLDq"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6815EPTM447963
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 06:15:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kLq8iRId4KBeblAyJwTDFEMkgyV7g5zt5EuRwIGcEV4=; b=n0VhgzoM43hfDWcI
	THxETxudQj7Vq8uUpPn7mYOTgTrIwkOIc8kq4AnGJkVhta5YVylH3S5emYaByRU7
	yvqq6tAGw7ftFu/0VwP2TTI1xm6F/o0RZquHrkRs0qzsEV7bXh3TYIfyFUUA34TE
	rIPYDlzNAHDprfdAM8HLA+WhRZGQY3KA2lB+fkU9LgEM1t3ouIAHc0tG+YomlNh0
	9qIV5SZnbM/m74ISv70r+ZOeD0Nsp2mzaFwvUXWm7f659ZpXzWKqAxfrzbm3j40A
	yS+Hmcd5qWp9hKn2vBa1+r3TqEFNNoZi26RJjuQA1BPKICRxw2vTFstTd3xx7/xU
	opT9xw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdrcsg732-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 06:15:05 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfc52ddc55so9290515ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 23:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788243304; x=1788848104; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kLq8iRId4KBeblAyJwTDFEMkgyV7g5zt5EuRwIGcEV4=;
        b=boCRfLDqLenYiBdggYIqZW3g+g+hVPxgppKYMn+7B8qAjBhbt0lUAPOuLQLukb73M/
         7dCeyz1N1de3jDCm0hU5bx5I24aPy/xi7ZQa20q2INW+59cPFt169X8pr9E8zoRRSpKj
         RoEj/PJDMfzxQz4if2iyYGwQPHg4Y3ty0c/sczM1yWDjeaN+z5Wbsz7Z6P2RNwYutyp1
         pbJYMLfMjPke58ZzfNaRiLuqqKoUjGyShddOfvm5cl+f6bKDQ0mdsGag2y/6UhbAyV1R
         cWoL70HkBtkwoG02WIdDiIIbSBsz0ovL87LTcXYgFLE5ehIODbVwjON/5PgSd9ORPZyE
         Ofog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788243304; x=1788848104;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kLq8iRId4KBeblAyJwTDFEMkgyV7g5zt5EuRwIGcEV4=;
        b=qgqnOPVutVqr6fXxuSn2pT4gA0e4Owf2kk4zlIZH0r9KA+BFkRMNRSKPY+P8ryXkUO
         IPlNhZn3hoRcz4f+fygDXWGxbQGfZFSAv+e75567NwxmE1yleYb57X/XlpskyJ/FlpIK
         k2CIyIJpAXwSJEMqxcBnCVnap7Tlgd1ofakeSiBgWQTZlCeB9X0dEBE5Bn+wDM/aL1dF
         Qy5ELleg06m6GDTQ/JVuRSRqvx/VwcapJCUA+mWRJhL4GTRQx3pPKMxBhybQIZajrC7t
         wlWxBfHOluDiqNQOhI/EgDLOkk0r5qiJDlU7bN7k7b3d9FAvIq9OPNCNpKYRmNxjiArz
         LalA==
X-Forwarded-Encrypted: i=1; AHgh+RqeR7hhYhau5w8Qi/yLvNl8n/ZYcOYsd5C8/E5MQlsq6bgisWMkXYuW1z64XLFywePskOp+pOxVhNEBqtE=@vger.kernel.org
X-Gm-Message-State: AFuF++m/xVhG7bbQCiD+uctHbYY7zo/Yhjmt063DxtTvfiJzjBs4wBon
	eYsYzuouCeMagIfnAxaL0E9hg/OfNHiDXvGiV7mmbmFSs8xFRYCg2wtazHzerXY2e5tvYO87wf4
	M5gwvjYazefxgmxUGYdmhUiXsFTYuvGxqbQuxyXjiTM9xIQEDy8nATlgGdFl/igc8aLw=
X-Gm-Gg: AR+sD11hAw7yvlOTEyjIvDCDMtI9CMamxh26vL/XKx4+G8jHltbwIFb4b+6GyUXHCud
	qy+M9i74o72UpFNDaLRDJX+2Ha7BJuNoEL9b7ABBLjOKSF3mQZdTZPqsdJcxa7dIauEXYBhYsl5
	w8L7+3jTh/K1/u0bp1S/JzFfSol6T5r0DB5F+W7Azv136pcW36v8eegNlWMoVIBtZ5kzQzj4T5t
	ilIHIoQSqyb8ctV4nReym6EOtek1aGYrtw1JD3iRPyZ5IfWzZnom8dXy+D7LIgJ46A6YTZmGQv8
	BDeOI5dAWYoJcK/IM5gnGIr/nZ88OjpbDRljW58b9A0scKZn0tEKhsZr8B9KtvOMpWP//5XZV7I
	PYKuVdnPO9s/6lNARSygofk260HEvOqL71WPY
X-Received: by 2002:a17:903:1b0e:b0:2d3:78c2:1f19 with SMTP id d9443c01a7336-2d74ddc6da3mr506960905ad.9.1788243304375;
        Mon, 31 Aug 2026 23:15:04 -0700 (PDT)
X-Received: by 2002:a17:903:1b0e:b0:2d3:78c2:1f19 with SMTP id d9443c01a7336-2d74ddc6da3mr506960095ad.9.1788243303969;
        Mon, 31 Aug 2026 23:15:03 -0700 (PDT)
Received: from [192.168.0.104] ([49.205.116.211])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f95a847sm31355147eec.17.2026.08.31.23.14.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 23:15:03 -0700 (PDT)
Message-ID: <2e998f75-bcf9-48b6-b9ac-52627d52d284@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 11:44:56 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA1MyBTYWx0ZWRfX5l65CYmCbA0P
 eksaf8qRmqCv5ND3gTgxc6S5Bj0eLlhV1pAbOSsq6uNaXf782EOHBhTvK3tlUzgm4wHvGhJWSlK
 kD6zQ4Mz0nrfw1S4UDyjBW5iO7bUjtI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA1MyBTYWx0ZWRfX3pWLX05OswNe
 SPvWA7y52LP2L5sWsiqnrFSbLAAhBD3Z9HBQqQk9563MZH1qqdWK3pMhYHrXOp0oMI/3zh+c4tS
 uze4nWQucSFcex7CORdq0w2PgMaiQjTQ+xUzS4bJs0H7bdJ1b3eUAGGFFXuunp9dx9EZwUtPtYz
 JS1vJq6MEe2BnMZBtMZMiHgeRh6SBaX8MlUhwsO9qFsz8DEjiQf9PJpgYA03Z2UCjWPhnnCSRc5
 UlVXiZi1dHIWFbEE8mTLEGXnO+vEYjRbRPAhMpfv/vSWMvgMwBPG+kZIoXhkIkyqIPQr2Kzpqrz
 m7iva2EoMvAfdnfKvd9EbIdRCkeMhJ/9XRwmQX6R3WWjSa0Xkue7sqiMx65aGvDgwoGVwR6fJNy
 jE3RIuFTGwIEmD8ayGxVzQ9VwiNKyh4EZailHp44ohRBSGjv/kVnRg9gYaZgB1F42qzxq6gJ+IJ
 DnKt36vsn/6+R2W/O3Q==
X-Proofpoint-GUID: vqCfkr62NzMlEM3CZbmdB7B3nmR5ganS
X-Proofpoint-ORIG-GUID: vqCfkr62NzMlEM3CZbmdB7B3nmR5ganS
X-Authority-Analysis: v=2.4 cv=QsNuG1yd c=1 sm=1 tr=0 ts=6a966d69 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=2ngnHYY/h7Qxskz9zhV0NA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=pu1xhwu27SFHiLAfgE8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010053


On 8/24/2026 12:06 PM, Harendra Gautam wrote:
> QAIF routes audio between system memory, external PCM/TDM/MI2S serial
> interfaces and the internal Bolero/WCD codec. Platform Devicetree files
> need a binding to describe the controller resources, DAI cells and per-
> interface AIF configuration, and named constants to avoid raw numeric IDs
> in sound-dai references and child-node reg values.
>
> Describe the MMIO region, interrupt, clocks, DMA IOMMU mapping and
> aif-interface child nodes required by the controller.
>
> Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> ---
>   .../bindings/sound/qcom,qaif-cpu.yaml         | 307 ++++++++++++++++++
>   include/dt-bindings/sound/qcom,qaif.h         |  97 ++++++
>   2 files changed, 404 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/sound/qcom,qaif-cpu.yaml
>   create mode 100644 include/dt-bindings/sound/qcom,qaif.h
>
> diff --git a/Documentation/devicetree/bindings/sound/qcom,qaif-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,qaif-cpu.yaml
> new file mode 100644
> index 000000000000..134356114733
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,qaif-cpu.yaml
> @@ -0,0 +1,307 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>
> +
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - iommus
> +  - clocks
> +  - clock-names
> +  - '#sound-dai-cells'
> +  - '#address-cells'
> +  - '#size-cells'
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        qaif_cpu: audio-controller@a000000 {
> +            compatible = "qcom,shikra-qaif-cpu";

The DT binding filename and compatible string do not match (qcom,qaif-cpu.yaml vs qcom,shikra-qaif-cpu).
Usually DT binding filenames are aligned with the compatible string for clarity.
Is there a reason for the naming mismatch?

> +            reg = <0x0 0x0a000000 0x0 0x20000>;
> +            interrupts = <0 331 4>;

Could we use the standard GIC and IRQ type macros instead of raw values here for readability?
Ex: interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>;

Thanks,
Prasad

> +            iommus = <&apps_smmu 0x1c0 0x0>;
> +            clocks = <&gcc 213>,
> +                     <&gcc 214>,
> +                     <&audiocorecc 15>,
> +                     <&audiocorecc 17>,
> +                     <&audiocorecc 18>,
>
>
