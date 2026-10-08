Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94E727466A
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 03:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791429128; cv=none; b=ddJ6a0wXkmpNKmGd6yR0RUmscVXQeCigjOwFJXzKcB6jRYaVJeLKDDQro3CL+VV731WnX2wAtUje2/naJvx84+aEeGaV72zxL2SazYkquuIvH3WpkK5NcoKmgS31xzHIyZ3CywhLwLNeSkhqNPe8kold0BdMSEuaTIGt1Ha9ITo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791429128; c=relaxed/simple;
	bh=tkeZ6QKECN4uRnnat8d3f1rWRCe/1IOkwR8LV4JSC8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NK2YT2cmMUXWi8l5QofnnAByd4z7R9MIsT/fzUvJcDS43EnSfBCpe7mSDYlzURyYa6DBL/BBKEZSZYf/pMEOpEAZPp36FKLnT65yBc+smXo2DAL7WYdOH0Mf+ScPEIhLY5fcMl6qhU5imbltaKFaEI/uprveAaEYoMD0t4eUsPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Abzp8AzM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y85DiLbF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Abzp8AzM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y85DiLbF"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6981hOlu2452351
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 03:12:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1KVmEdWOafiMPjikiSHCknyPjVh/YtlD1R8rru/D4bU=; b=Abzp8AzMlJ8HqrHS
	VYfpRrZ9HLQMguIYr/P9L+X89UScB4PEiua6NADStsqmDAQXNtFXeuOLs8cnZG0U
	Ai99UjvuASNO8FRrb0jFobuICsJdghp7sI5Jpr4TqtdyMPAwVY+wbbRih0hKz1XS
	ZyUEMr5pPQ2PDbI9Jq2QVUSFN0vSAZElCB5v7kefROYozxT136GAoZl5GGvm7ime
	ZcViKFZ7SCeZumYB1zw8lFBMqVSOb89jqbyF1imMR8u8wAb6xjjr88Mrp19i0Dcj
	AiGkqT3+UsnKZGrswrhqCtw59H+tTdu1vPgOGyipyLMDgJ/1uNcUcKBsFd05TnuK
	aQR89A==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe68uny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 03:12:05 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-155a75f91e1so3569952c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 20:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791429124; x=1792033924; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1KVmEdWOafiMPjikiSHCknyPjVh/YtlD1R8rru/D4bU=;
        b=Y85DiLbFBJnEHnIDjPC/+sSl5uCCSjv+RTG7ek+me5dwmW5OwkMEI3bpkVIHs1CZSZ
         11zXYbB0eBPma0vw0X+rIe8EOLkoadvQ8aMQRV8BEOrvfz80XD4qBcukoc57HiEDkz9f
         gIoL+kHtVf0zFvaDJeYa+Jlh6wTZaKbiFzL83TJ99eokpiQei3yqRSHVP+ggUX4gvsxG
         Sy8/rSssaTB2Y1fVL0iYC6/tBHlj7VP5hh4FzKae09BAgVVYGw724bbQL9AVxCRzTwfm
         IQR1CQ6jv36w/iwg6Nwy8pgWCiCUiLwJpJdc/su8vtKycKTf+wg8lxk6+aYDMSJlRDs5
         MPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791429124; x=1792033924;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1KVmEdWOafiMPjikiSHCknyPjVh/YtlD1R8rru/D4bU=;
        b=ZiMsPbjggnkpKSigjzqL608kW7DAH3lFztflq2zYejk8BqPkVmblzSHhO1ruVbXyhF
         HVY1Iks+PQET3yRhq7zoXhvAmiEbN3KxL0xs2MFp593ITpqPwDG6CTg4hUvX3cWjC3fb
         7o8EZM6AVmx237YylmGYpCy/cH03CkUztDMWsC5b5mdfr6Anz2+Fi4tSY38CuFNVsKy+
         e0h5NfW4GncBND1n59Iqvt6gYMG27W7e0hA2UXJJlpCkKf10C6F3grJX6xrWw3F4B6aj
         dwtopubmNs6X4+MTR1veKXLFi/b9bH/xMflEJ0A9fHrAAh8LdMrqi/cuR08U/VHsDlf0
         /jjQ==
X-Forwarded-Encrypted: i=1; AKwUvBweVRSf3MX0C5JjrAPRxmL39pSsHSHMB5v619qPK0sgyaZEU1H0lao9Awea/i1yT9NoOwp+CY7alU9bdUE=@vger.kernel.org
X-Gm-Message-State: AFuF++kG3FG1qUlomHJSMcigLjDHnGEdx8SWGPqnHyvW/CR8zn4BJQk2
	Rk6BBThkNy5r1F0LvgWc0hYyzDsJ8jWEsdSCakE+KrZ3o/Pq54Gk4dfOnFQ2wmhcQlvAKuZ40d4
	rBeq+2QxkBIhtDU2QZo/aQx7nxZUfXYcZ+NlJChsFus056yWJlrCeLrFVeCC6wU7iwi0=
X-Gm-Gg: AYBFou16W/QxxDr4NmblZ0qrI1T+jMpbIm5NGj5h80BT+CCjnLi3ofBoOz2WIshUsiJ
	gRaturWoCuG9l3guFYAA3k3rhLUfE4lLyIhmAhnv76B+8Zaqz8JR8w+DKsT94/BieEEFUHPhM6I
	gFhQKa9nfv3omjSIeErv9cm4qvtZTYa9Z3zGR7lOZMeBp2gJtq4gHLge8uAQw0wVej8K86nZtd0
	aQxUdtvzT4t0BdRWUVDGwZFuGSrL6C/9L/9l4GYhVxwi9gL+/chKpCZTV+j6nL1EER3dNLZwRuY
	b3i4F4Dl2FoANYGBb/yg5OncI0jVL+Isb3JmfpI4fumQxB45DF7D4au0fmdRIvIOh4/fKRNTosy
	olonYCxabXC2X02MmFBTZLVLfFs5eFJ0QDGTa0cblGUAj8HCI8BuOUD3zBauFva1aeB18noosUw
	NNmLOolldBmbHBp9+wkjI=
X-Received: by 2002:a05:7022:4381:b0:149:f2b3:efcb with SMTP id a92af1059eb24-165a602bc41mr2109309c88.14.1791429124225;
        Wed, 07 Oct 2026 20:12:04 -0700 (PDT)
X-Received: by 2002:a05:7022:4381:b0:149:f2b3:efcb with SMTP id a92af1059eb24-165a602bc41mr2109240c88.14.1791429123253;
        Wed, 07 Oct 2026 20:12:03 -0700 (PDT)
Received: from [10.79.117.82] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-163e3c5bed6sm5057986c88.7.2026.10.07.20.11.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 20:12:02 -0700 (PDT)
Message-ID: <5555b1ee-1355-429f-b3de-f0926e4c30d6@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 08:41:57 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/2] Add initial support for Qualcomm Kuno SoC
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260929-kuno-soc-support-v7-0-530f62dc4020@oss.qualcomm.com>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <20260929-kuno-soc-support-v7-0-530f62dc4020@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ggdyzXbMOXFd4JokOwZMGAep0cb91PMt
X-Authority-Analysis: v=2.4 cv=HcWB3SE8 c=1 sm=1 tr=0 ts=6ac70a05 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Gpu_kyyjuvhznk9Z_CEA:9 a=QEXdDO2ut3YA:10
 a=O8hF6Hzn-FEA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: ggdyzXbMOXFd4JokOwZMGAep0cb91PMt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAxMiBTYWx0ZWRfXxp2aIdAQHgNW
 xEAcCRZ9wmAwbRGHbjBYn1D4iQF63h9jANl9hCv+0oUJ2WatN0dLsTbIBKGYtM2YPUhEyOtb/f4
 g6KCZ6hBkgF4IAaugdxenaxfdbO98Pb1mImLxMn7KFPPAKIzEeztOuec3y6V0exEBJ8jHvTHrBb
 TfTnIM/+vBHIzfJNjizqcjtE6TafJKVZ3oOI6XsBBWKjiHnf8EWcJu+bCG8hU6ovU8v227G2Dx+
 9K4mXszhyqxvyk1miGBZ5Vgv/LGsIygFQ+njHR3UTcL1X2SjH0GhFuakAjFlarvlCuzxMKWrNvT
 qrJn7Iur6xEuK0t75aQ5oDb9qzYy6E0lEStBKeezlGItdeJnNYLoDp1k/mqrJjsr2jj81c4Mdol
 BJAvmKrdt+xrHemqU/46PAIOu5TwDAmmypGf/JdnxHpxu508srRlui6+GovN9HR3ttBpb9wVt+l
 YbG1KuEvfQQLOP2ofKA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAxMiBTYWx0ZWRfXz6DCR/BaRvZB
 kF+UUrH6wx5MUQQVMVuwZHzChHuiehpaIzNkw8XA0HtFSAPmHXGVtH7a+uqvLwReBqtKijaqBBz
 oz4pMQLmIinqMS70Ngz6gzFwV3KwSVQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_01,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080012


On 9/29/2026 3:18 PM, Hardeep Sharma wrote:
> This series adds initial support for the Qualcomm Kuno SoC and the Kuno
> IDP reference board.
>
> Kuno is a 32-bit ARM (Cortex-A7) Qualcomm platform. The rest of the
> series (bindings, GCC, RPMh clocks and power domains, interconnect,
> pinctrl, geni-se) has been applied and is in linux-next, so v7 carries
> only the SoC and IDP board devicetree, plus a small geni-se binding
> update that lets the QUP wrapper use one address/size cell on 32-bit
> SoCs.
>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---
> Changes in v7:
> - Addressed v6 review feedback:
>    - New patch: allow 1 or 2 #address-cells/#size-cells in the geni-se
>      QUP wrapper binding.
>    - Switched the QUP wrapper to one address/size cell with an empty
>      ranges, instead of the explicit 32-bit window.
> - Link to v6: https://lore.kernel.org/all/20260929-kuno-soc-support-v6-1-a16afafbcbc7@oss.qualcomm.com/
>
> Changes in v6:
> - Rebased on next-20260928. The rest of the series has been applied,
>    so only the devicetree patch remains.
> - Addressed v5 review feedback:
>    - Added the full qcom,pdc-ranges map (22 ranges instead of 3), so
>      that all PDC-routed wakeup GPIOs can wake the system.
>    - Added wakeup-parent = <&pdc> to the TLMM node.
>    - Replaced the explicit soc ranges with an empty ranges and named the
>      node soc, matching the other 32-bit Qualcomm SoCs.
>    - Widened the QUP wrapper ranges to cover the whole 32-bit address
>      space instead of a 16 MiB window.
> - Link to v5: https://lore.kernel.org/all/20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com/
>
> Changes in v5:
> - Selected QCOM_GDSC from the Kuno GCC config. The driver registers GDSCs
>    (added in v4), so like the other Qualcomm GCC drivers it must select
>    QCOM_GDSC; otherwise, in a configuration where nothing else enables it
>    (e.g. COMPILE_TEST or a minimal Kuno-only build), gdsc_register() returns
>    -ENOSYS and the clock controller fails to probe.
> - Link to v4: https://lore.kernel.org/all/20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com/
>
> Changes in v4:
> - Addressed v3 review feedback:
>    - Registered the interconnect NoC provider from an explicit
>      core_initcall() instead of module_platform_driver(), matching the
>      established qcom interconnect driver convention.
>    - Replaced the NA mux-slot placeholder with _ across the pinctrl
>      PINGROUP table, matching the upstream qcom pinctrl convention.
>    - Added minItems: 1 to the interconnect binding clocks property so a
>      single clock is valid (system-noc), and aligned the binding
>      examples with the sdx75 labelled-node style.
>    - Added GDSC power-domain support to the Kuno GCC: the binding now
>      defines GDSC macros and the driver registers the EMAC0, PCIe and
>      USB20 GDSCs, so #power-domain-cells has real backing providers.
>    - Split the cpu-idle-states phandle list so each phandle is on its
>      own line.
>    - Collected Acked-by / Reviewed-by tags from v3.
> - Link to v3: https://lore.kernel.org/all/20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com/
>
> Changes in v3:
> - Addressed v2 review feedback:
>    - Reworked the interconnect binding clocks: dropped clock-names and
>      replaced the flexible min/maxItems list with fixed per-compatible
>      clocks (aggre-noc: 2, system-noc: 1), required where present and
>      disallowed otherwise, matching the sdx75/glymur shape.
>    - Made #power-domain-cells required on the Kuno GCC binding and
>      declared it on the SoC gcc node, since the Kuno GCC hosts GDSCs and
>      is a power-domain provider (following qcom,sdx75-gcc); the driver's
>      GDSC support will follow separately.
>    - Made the GPIO65/66 QDSS CTI trig1 funcsel-3 route selectable: added
>      a distinct qdss_cti_trig1_mire pin function (and allowed it in the
>      TLMM binding enum), as the duplicate funcsel-2/3 entry left
>      funcsel-3 unreachable.
>    - Collected Acked-by / Reviewed-by tags from v2.
> - Link to v2: https://lore.kernel.org/all/20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com/
>
> Changes in v2:
> - Addressed v1 review feedback:
>    - Reworked soc: qcom: geni-se commit message; dropped the Fixes: tag.
>    - Reworded dt-bindings commit messages to the "Document X for the
>      Qualcomm Kuno SoC" one-liner form.
>    - Canonicalized copyright headers on interconnect binding / driver /
>      NoC ID header to the single-line Qualcomm Technologies form.
>    - Dropped unused <linux/mod_devicetable.h> from the interconnect
>      driver.
>    - Fixed MODULE_DESCRIPTION casing "KUNO" -> "Kuno" in the interconnect
>      driver.
>    - Extended interconnect binding to optionally allow up to four QoS AHB
>      clocks (matches sdx75/glymur shape).
>    - Cleaned up brace/space style in gcc-kuno.c to match peer clock
>      drivers.
>    - Reworked initial DTS: moved idle-states / domain-idle-states inside
>      cpus{}, wrapped fixed clocks in a clocks{} container with peer node
>      names (xo-board, sleep-clk), dropped the pcie_pipe_clk fixed-clock
>      stub (the GCC 4th clock now uses <0> in DTS to match the sdx75
>      idiom; the YAML example uses a named placeholder), dropped the
>      RPMHPD_CX power-domain reference on GCC (Kuno GCC has no GDSCs /
>      no corner votes / no pm_runtime, so the reference was inert), and
>      added a bootloader hand-off comment on the memory node.
>    - Collected Acked-by / Reviewed-by tags from v1.
> - Link to v1: https://lore.kernel.org/all/20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com/
>
> ---
> Hardeep Sharma (2):
>        dt-bindings: soc: qcom,geni-se: Allow 1 or 2 address and size cells
>        ARM: dts: qcom: Add initial device tree for Kuno SoC
>
>   .../devicetree/bindings/soc/qcom/qcom,geni-se.yaml |   4 +-
>   arch/arm/boot/dts/qcom/Makefile                    |   1 +
>   arch/arm/boot/dts/qcom/qcom-kuno-idp.dts           |  25 ++
>   arch/arm/boot/dts/qcom/qcom-kuno.dtsi              | 444 +++++++++++++++++++++
>   4 files changed, 472 insertions(+), 2 deletions(-)
> ---
> base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
> change-id: 20260809-kuno-soc-support-1dab826de0bf
>
> Best regards,
> --
> Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

Hello All,

Both of the following patches are ready to be picked:

[PATCH v7 1/2] dt-bindings: soc: qcom,geni-se: Allow 1 or 2 address and 
size cells
[PATCH v7 2/2] ARM: dts: qcom: Add initial device tree for Kuno SoC

Could you please pick them ?

Thank you for your review and support.

Best Wishes

Hardeep Sharma

