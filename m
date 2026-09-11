Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F13489FB3
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789134969; cv=none; b=tKe+BdKyJqmrmv7VNTR5mFpx+5xdknID5RGppDXkQCvoAUnRgMI/z6SoU7Fk00EAvr4lZFwBbmH5h/1eX9tbGKvsHDhl8Z94IZ/x46CDHUDm6/3d8LWNd0/zSKcdDkt+LLHYuNCSutGh79RhvsialcuEXRriJ6F9odubvpVUA/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789134969; c=relaxed/simple;
	bh=cukm5itfAPwrG7E4wMUta7WQ4h+mlPDdBSjVU2+d3cg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FxkgsOW6R2dH2/blLguDKNxmAvDu44wP0fB5WYQuHqC/CdgByiooq2xgEONT/6AB/PI/qGw5ZJ4339EhQC0QxCVjGpVfJBCt7u+dHrlxm+n/8nZWZUQmkZKV6ZTVb+wMIWlwI9MmPILPW/oHvZ7hizfk4zq+wcQrdL0g4CWEPEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=li+lSFwN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HiHJ+hsQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="li+lSFwN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HiHJ+hsQ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCjaWM524827
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:56:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WcoSTgZldw5sNhCNrDcKYu36cNESSbeb6L762/E+G7Q=; b=li+lSFwN7iDnJM4p
	69OmGvPCOg98yLgAITzFGJL0RwBruJgghuMXp/50TE/9ITOjxcX8/BoPoh5/AiUT
	BiPYHfKfmbrlBkiOcPpft+HYC1FmDoQhj1u65Ciqtxa4hnCBot7PYxf3nZdcmCvt
	zZJM+ABVaiQCq+WJTha5z5DR5ing0ODwhZqad4tPyq/cNgtl5PxWUfoIIqOitwun
	s8LSwIVDxNTgaxj09XxA772Zrgu+aqfY3sheGXI/tJRvaBIQ9mNR+yRNm9Hx4bGq
	sSEdvlxEHgE8sIBHlae7T9ocgWNp+sngZ0n4r5CD/NIY3fVxYkdUAvdhiKWJjM5e
	IccHfw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm2q13u3c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:56:02 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8645a62066dso1714431b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789134961; x=1789739761; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WcoSTgZldw5sNhCNrDcKYu36cNESSbeb6L762/E+G7Q=;
        b=HiHJ+hsQUm6zeTw/G+Z85vO8XQwjLrrALP61Sx8KnCTCkDtSe3SDy7lpbdP2JbZdih
         uLzaXaL19aPM7BSYM9WR9sZ5wHy/6MhdrQ8Aylu51IVCFlFGFGl40ZxpJT3c078v1NvV
         BpBI8m3hyAjkyraBqSCr6+6OLSa0h/MGoXOnPG+GDMZ1rMwVfP7BdVvqseyBh8+u57zA
         8GAIlvAVEsgIzGHfkAnwlj4/+7E6KjxTMvgkrS7xOUodTUo30E1LiQ2+YykN+1oy8pp6
         GzeRV8azjiDEYjxpRgfk1oP9ltxA1zSb977hGQJGufzj/DdPUrs+Tv63YSuih+7uyxK+
         s31Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789134961; x=1789739761;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WcoSTgZldw5sNhCNrDcKYu36cNESSbeb6L762/E+G7Q=;
        b=nEdmM0f+LCUN0MOP7+wRbaU7PuhANcpLKqRFi9p99zPOnbBuJkIa+HdY9rsduYgceq
         CzQtfLL9Drtd0DcKfhHJLE/XbAtkoB9foul2Lhtghz5zaEP/vk0ufDlsCpk4CT4LKVoq
         5ULjrW51JcriIqjAAHK8GvNbnl6Ll04otfUwIT1pEauiNGJEyDs6tGNlGAwjyeULZwLC
         Y4xe7yJWG+on+2nrDWFr40ybVgjVaoO4ZmvxK52zRNEn0ho05MhteJncYq4h9XeVSFDg
         fzkNaBWLcposJ2hg5iuRXjqYxWmekFSFAz+WrZN0yR5mT5rTS5oJh1iyUoi94INy5uXF
         ciPg==
X-Forwarded-Encrypted: i=1; AKwUvBzF34sAVDMkHK/AWkNJAZYmtLUKrh4XX6O1qwhdG4dkvjok2oI4+E7ws9dK0JpRv1v87JoLGO2pmx1b2Ws=@vger.kernel.org
X-Gm-Message-State: AFuF++mb0gP4N3+DoyGHszz2vsJFcbXLrY8bMS9D9ZeyJUR1LaOqmCZm
	5n4FgJW/RCD/TS2tg4kzJCmNUPJtl6QLitZHebCgRN1QD8Z6Hk3fI4lEIsmsxK/jEYOF3bBRoTQ
	9viUfrxF9DS+jfUshQ0A3ET2bOyM3e9HmRCRXOkvHUJDv/TSM58MhmDqrX/bNKL8eXbQ=
X-Gm-Gg: AYBFou2eontivhaEpdsQVBdQKQhOm92wMz5NGKoYudmwLhRWePhPZ47L6UBUT2NPrvK
	A7JfT6STmM46ar3xcRPSYMzIjQXAXL2sXBsAcFDmUuGATbdlU812XKjYsPVMDTplKf0V3MXUrOD
	IrlufujCtlYtceoVEWg8326XSBhWqAYDBmffAYjE6VVEoc1y7yfzKG4gyLbt7jG6kOeJXPNuhh7
	2vlNQwh1KRCkY+eF6lT8BW8BatrR3xqOxWkG7QbxDi+QzZHAbrNYUJdPAUs7pE3QvLOKQJatMw5
	nXNidAB4OhN+GaBC2bASQdgtNcKCoiI9+z0imemMdqXYfkvducshhd6oxQGRFDy2yLNKDKDoowV
	KJvrFqWpeAAplkL8VW0oSftG3C+XJ
X-Received: by 2002:a05:6a00:12c6:b0:869:edb6:522f with SMTP id d2e1a72fcca58-86b304124f2mr6902787b3a.5.1789134961625;
        Fri, 11 Sep 2026 06:56:01 -0700 (PDT)
X-Received: by 2002:a05:6a00:12c6:b0:869:edb6:522f with SMTP id d2e1a72fcca58-86b304124f2mr6902725b3a.5.1789134961164;
        Fri, 11 Sep 2026 06:56:01 -0700 (PDT)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b286c49e9sm1212856b3a.17.2026.09.11.06.55.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 06:56:00 -0700 (PDT)
Message-ID: <0fa0637d-b93b-47c7-8359-6ee70c5251ca@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 19:25:53 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] arm64: dts: qcom: shikra: Add support for AudioCoreCC
 and AudioCoreCSR nodes
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260911-shikra-audiocorecc-v5-1-b0fc3a2251ca@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260911-shikra-audiocorecc-v5-1-b0fc3a2251ca@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=d6lgWhjE c=1 sm=1 tr=0 ts=6aa40872 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6Jtp9WtjP-3LHkia-DoA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE5NCBTYWx0ZWRfX/QmCwzCD5pB8
 A5QdeiedCslvTzCbkMgUrJZEcy+VOlOYsOP/x3bIPyWdXIIbA6FqeV+g3CXKdT7clk/SBAY61PY
 +7/Uc3UYLtiEXNNWnU95sNet11AgWnoTCIXljy1nkthMaZi+QxVbkL+/EVZIaoGU8iBmFEjTWkT
 W3VUXTDRatVtUwMLh6EgK0Rl2eFJ7IDzZOsVc6Y3w6olEMrpQOgneR3Sia4WFpEZf+ldKiQvoC/
 wDV10B0BdPj0zorkMDr/UuVm+H+jlcDFpYkdQG4MJv0GNgshnr5J5sE1NUCaG0Bp7yWDTl3Yvxb
 Z/MBH6xUE/Sbbx+uryx19Qt4HzrB7bibJw6JS0mOYffA9S8VXjv6Yw/Lw6Bwb8N2HRPUzmjq0Fe
 hmY/GmNWWrwoJtVAObuAK+/j6ZvFaol/ed5Ok2S0WjFNbbCOohGXEWm1tt2K1OeYBEyxmH6SfcX
 dAbekmQeQYk+7aPeL0A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE5NCBTYWx0ZWRfX5PBIjsD/EfY7
 EftnGeeCE2FuQP8xBRFC4uB7+gEWw4SrMJXEnPhR8997I7LRCK8KHjqCVbCulXDm7824PWe2sDZ
 97Hp+iswB7Y75F611L3CJRxeHPBCe/8=
X-Proofpoint-GUID: 3fp-skSBk-g4lRo3P658lDFaylxohcqf
X-Proofpoint-ORIG-GUID: 3fp-skSBk-g4lRo3P658lDFaylxohcqf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110194


On 9/11/2026 6:06 PM, Imran Shaik wrote:
> Add support for Audio Core Clock Controller (AudioCoreCC) and Audio Core
> CSR nodes on Qualcomm Shikra SoC. The Audio Core Clocks and Resets support
> differs across Shikra variants based on Audio subsystem enablement as
> follows:
> - CQM variant: The QAIF driver runs on HLOS, hence both clocks and resets
> are required to be supported on HLOS.
> - CQS variant: The QAIF driver runs on the Modem, and required clocks are
> handled on Modem, so from HLOS only resets are needed.
> - IQS variant: no soundwire codes, hence no clocks/resets are needed.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
> This patch is rebased on top of Shikra USB DT series [1] to avoid merge
> conflicts, and there is no functional dependency.
>
> [1]: https://lore.kernel.org/all/20260911-usb-shikra-v7-v8-0-851ee4bc0eec@oss.qualcomm.com/
> ---
> Changes in v5:
> - Dropped the bindings and driver patches that are already merged.
> - Link to v4: https://lore.kernel.org/r/20260724-shikra-audiocorecc-v4-0-0a89bb13d817@oss.qualcomm.com
>
> Changes in v4:
> - Dropped "clk: qcom: common: Register reset controller only when resets are present" patch
>    - Sashiko AI review pointed a valid GDSC-only corner case issue with this
>      change, will address it in a separate patch.
>    - This patch is not needed for this series, after splitting AudioCoreCC
>      clocks and resets into different devices.
> - Added NULL check for device_get_match_data() in driver [Sashiko AI review]
> - Removed unnecessary <linux/mod_devicetable.h> include in driver [Uwe]
> - Collected the R-By tags received on v2.
> - Link to v3: https://lore.kernel.org/r/20260723-shikra-audiocorecc-v3-0-90b878ae0d4e@oss.qualcomm.com
>
> Changes in v3:
> - Rebased on next-20260722, as the dependent RPMCC/GCC and Shikra base
>    DTS changes were merged.
> - Separated the audiocorecc and audiocore_csr bindings into separate schema
>    docs [Rob]
> - Moved the AudioCoreCSR schema to bindings/reset/, since it now only
>    describes a reset controller.
> - Updated audiocorecc DTS node to use status reserved [Konrad]
> - Kept audiocore_csr node globally enabled by default in DTS [Konrad]
> - Collected all the R-By received on v1.
> - Link to v2: https://lore.kernel.org/r/20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com
>
> Changes in v2:
> - Separated AudioCoreCC and AudioCoreCSR nodes as both resides in two
>    different register spaces. [Konrad]
> - Updated bindings and driver patches to handle the separate node
>    compatibles.
> - Updated resets in driver patch to handle HW_CTL bit.
> - Link to v1: https://lore.kernel.org/r/20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com
>
> To: Bjorn Andersson <andersson@kernel.org>
> To: Konrad Dybcio <konradybcio@kernel.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>
> Cc: Imran Shaik <imran.shaik@oss.qualcomm.com>
> Cc: Taniya Das <taniya.das@oss.qualcomm.com>
> Cc: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts |  4 ++++
>   arch/arm64/boot/dts/qcom/shikra.dtsi        | 17 +++++++++++++++++
>   2 files changed, 21 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> index 286ea46d0c36..079a1636cb6a 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> @@ -23,6 +23,10 @@ chosen {
>   	};
>   };
>   
> +&audiocorecc {
> +	status = "okay";
> +};
> +
>   &pm4125_hs_in {
>   	remote-endpoint = <&usb_1_dwc3_hs>;
>   };
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index 1395c182a2b1..999b478e1640 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -6,6 +6,7 @@
>   #include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
>   #include <dt-bindings/clock/qcom,qcm2290-gpucc.h>
>   #include <dt-bindings/clock/qcom,rpmcc.h>
> +#include <dt-bindings/clock/qcom,shikra-audiocorecc.h>
>   #include <dt-bindings/clock/qcom,shikra-gcc.h>
>   #include <dt-bindings/interconnect/qcom,icc.h>
>   #include <dt-bindings/interconnect/qcom,osm-l3.h>
> @@ -3594,6 +3595,22 @@ cti@9900000 {
>   			label = "cti_apss_2";
>   		};
>   
> +		audiocorecc: clock-controller@a0a0000 {
> +			compatible = "qcom,shikra-audiocorecc";
> +			reg = <0x0 0x0a0a0000 0x0 0x10000>;
> +			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
> +				 <&sleep_clk>,
> +				 <0>;
> +			#clock-cells = <1>;
> +			status = "reserved"; /* Owned by Modem firmware */
> +		};
> +
> +		audiocore_csr: reset-controller@a0b4000 {
> +			compatible = "qcom,shikra-audiocore-csr";
> +			reg = <0x0 0x0a0b4000 0x0 0x1000>;
> +			#reset-cells = <1>;
> +		};
> +
>   		remoteproc_cdsp: remoteproc@b300000 {
>   			compatible = "qcom,shikra-cdsp-pas";
>   			reg = <0x0 0x0b300000 0x0 0x100000>;
>
> ---
> base-commit: ae800ad8819a6d89308031288a6ab6789eb5d2d4
> change-id: 20260605-shikra-audiocorecc-85efef073474
>
> Best regards,
> --
> Imran Shaik <imran.shaik@oss.qualcomm.com>
>

Reviewed-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

