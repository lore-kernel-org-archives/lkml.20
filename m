Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2543890F3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 05:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788328753; cv=none; b=itSw+UhwgaVHFDV7zjiLE2mscA0jV0OoPM7TUiaxeBx/wcXIiq9ILOE28kiVJVwSWDJXtGeCqJKVM9w9iOM9QHl2UW0l01ptjBHmhl7nEOFNRV6NYvXuj0B9d9MYY8HxlQYdFbgPjvNPFcft3ySMc6yxnmnrNWvsEL9JZumIN8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788328753; c=relaxed/simple;
	bh=OgTp1K7wrCpVpIYXRj1XeRkGRnHqu/BSVufgVq2n8ns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aGk7edE56CHDyUQWErQVIBgC6GwpgvP+6OO3r/ZZ0fgfHCikSBrd62Gls91kGf3g1uXjs9viqBVC2hZ5qjjfL3xTLL+9kXPmYuhUTKINHm13DtxhRYpqB2af1aVTcXhx4Oqpdk1IvkikNPO6HqciPDf8pkPmp5afxSOn55QuqvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P2jUMi/r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QM4MyJQD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P2jUMi/r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QM4MyJQD"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6825YIxk725784
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 05:59:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bCQp2+xpT2Hvc69+SxSesqNuC+KulHQuCZHZNGt0Peo=; b=P2jUMi/rixYd1eaa
	GLk4GtTKixt6aanOsON5u/1mhYFTpYh9E2DxB261kQ+OmoETZx0Ym4hdaLjW8q7Q
	HP3oqnylgZbNiXCWUcIPPrEnMoPmdoVK8ncwvnlqkqOXDCP4IPnru46BzaHRS57s
	lSAlWErsDyvK1EyTiqELgyv91CfoJL7LjEId+swofReEkzVnJYhzUsCSrgEctnKa
	bjLouxnjFxFxyvpngcf3t3cHazuWrnwp9kI35k+AbCtSf6UI1C2IcSAGdjl+XeLt
	BX6xP7umVMsQSefcSOznA5PiYbnsUamNfbh3JKwRu0uIcv45aJRyACZRsuz0Ce6+
	SDgd0w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge38w2bfe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 05:59:11 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-85722fc5a21so1023719b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 22:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788328750; x=1788933550; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bCQp2+xpT2Hvc69+SxSesqNuC+KulHQuCZHZNGt0Peo=;
        b=QM4MyJQDNn1U/DwMCcSZLJi35pjaxRl5IOe3pES248IRbagdQqpLl6yOSQOTewLMTv
         nlA019YuUbAIBXRY8addHdHBRFWbJfwPXX9isOl1HZ4+grxpfLyNfDGm6Sfc+C7l0cbD
         RPasnFIlQjH0sXFYRI6/NoRSwlFOdyzHTPcz2lf+wvatV3e/yZG0ADtxye0jcTPMnpDg
         sLM543yagzo1yy4OKZXmKJdsz2DD7ry/YCGesrW91xOdRmjYYOqzqT3hlDs8581WpSY/
         enU9qbEDWDBgc+DAMLGqwNpgA+F0B1K9YxkXVgjwbF71/22G7ZisYRfGPLhez3RzSzBa
         jZ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788328750; x=1788933550;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bCQp2+xpT2Hvc69+SxSesqNuC+KulHQuCZHZNGt0Peo=;
        b=c1baBcLQO1t9xU2sh7wCS5cfHafJud0ZvlhTcImzECJc9NDgd/ymnhrFaoUw1DzTdl
         Pl4vnE8DFt0eUAzXpu1PvAXzjZqdHTAxdL2cY0v7VET/CpoiRaAMq+0crRNBCczEHEud
         OObjyyBl/QGvPI3m++mUBuYTVD7C9XgMfXXRTnkpv3nn+Ri7ULtTXgdxROglfSVDWbGM
         Reo/UxUS51Ko4pAad0k1eNQCP/gkptiwsNZdE5GPLc2GgzM5dJ7f1fubeGnKrUd4NlYi
         61wTr2sxppRTqlpCH6dKdwUSW2oFSj8X/ZqWUracNLTkhomm2jlWxJeMNsuDbIP93b1K
         xTVQ==
X-Forwarded-Encrypted: i=1; AKwUvByl1tLOwUMx+1DGT1lud7FOscPD0bliNfuLtJ9gMNKiavfI/ohx541wVm+QQOJOCbvgTdjwYEIpDMhFj84=@vger.kernel.org
X-Gm-Message-State: AFuF++mcz280rapfAFrHVtRQ7Q+qQpR/cjNxIgbaHJ3w187W9a0OTFeM
	32bGo44JKdiuKji2fWA2Z3dMrw3sgZ0ii/722vcCzKAtPHYkUiIu16ov2nkReFOb/wAaltSeUAD
	GIyqObDAt9gn2ThinfB9ViRlxfbe3/Bhtfoyi8jFxCjRRbE6Ys0JW9/A/I9aFB1C8ec8=
X-Gm-Gg: AYBFou3C2OEIckWz+GSVQKiXu7+z0KehsNLuoQxzHrKacKYVB58HoKnv8jKBnDLp4sC
	B4QXew1egtCvCO/oDrbH82+NrZ1ygrwumigKcRAHAQCRrirrrluWuLP/KAILlUjsquEw7gXK/A+
	cYIcdlXoWNCKgXQ4RCJ+Ou0ziQV2xXnL3/SqBpHLVG2Cw0rDMKE/4HzvEdupkDUxA2hIEWnzuNz
	WvvV7pm4xB+0Zh2jouoFPmpmY6w8tOuTjTqbgvOH11zKewQ9CGWjxJT1n3xTStNRjbW31YzRZW8
	y/bEmLQHkm7CW2vc7v2VbDeilHTYQf15E21zHewVqAUbxjoSSlOBtDt43Brftkvq2qQYiEE67LM
	6S+ShPcZfzxt7caup+F9o
X-Received: by 2002:a05:6a00:44cb:b0:851:8012:c38b with SMTP id d2e1a72fcca58-85ed6a7b0a3mr4512207b3a.10.1788328750256;
        Tue, 01 Sep 2026 22:59:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:44cb:b0:851:8012:c38b with SMTP id d2e1a72fcca58-85ed6a7b0a3mr4512172b3a.10.1788328749782;
        Tue, 01 Sep 2026 22:59:09 -0700 (PDT)
Received: from [10.64.68.243] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db2ad8e8dsm847018b3a.17.2026.09.01.22.59.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 22:59:09 -0700 (PDT)
Message-ID: <bcdc95df-92a9-4b85-83d0-d8abf71501f0@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 13:59:04 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: kaanapali: enable ETR and CTCU devices
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260831-enable-ctcu-etr-for-knp-v1-1-8dbd3ff15ed4@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260831-enable-ctcu-etr-for-knp-v1-1-8dbd3ff15ed4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aRPT5DyC30sAID7OmKCnOBDdsBuE7cWi
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA1MSBTYWx0ZWRfXwwLf+a/W8yMz
 NelR0ZlwSLdSlBKeilst+qUkNgFJgGv1ArAEU5txe/OHT3g8+YnZ0k2hFV2KWuFpZM2XcK9KR3V
 veJbBhc9a+IaNL60ManoDJlL+UV483Q=
X-Authority-Analysis: v=2.4 cv=LOpWhpW9 c=1 sm=1 tr=0 ts=6a97bb2f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lC4qlntngRxk1_k7zu8A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: aRPT5DyC30sAID7OmKCnOBDdsBuE7cWi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA1MSBTYWx0ZWRfX8BdtZfJNsR2V
 wLoOfeQPNuoa0EWhLW7c3I7aGKNIho3Fkx4d+g/P10dI8li9y4r7plhqc0wLkN6SyJkEQuUUTyB
 q9vzNUFNHvMQHnf0qu8cw6kKEH6LDn55BfYGU4TWfU1twRj7Zl1n+rl+IaLub2RDLXu5Nh2yrOt
 80FsZAeatYTJCfet6NZ41YbM5wp0TLzgjmpQNuZvP3FuqvmE8vc7CcQhXCN+KizA1kYJyOvvAUQ
 UV0Ojfi5F92qIKVQ3EZZyK7xbi8gTBlHtuJKzJQmoIW05zOxIbMmjPJfrgDamy7CXd88J97S2Hp
 +15JB/6B2qq27WwcBXjFOokbFUZH+DekNKi9CPR1Ugc7oVT3qq1LSyTKPtHUGJ9+eS4mK906FYg
 PgbOtccRwaIBFSLs/1tLwz25Aykik4+t2o1sn1PZTY3GtbGdVxP6yFR9TKxCtUA9gqayQOsCHN+
 drKKdiiiefvttvPTt5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020051



On 8/31/2026 7:34 PM, Jie Gan wrote:
> Embedded Trace Router(ETR) is working as a DDR memory sink to collect
> tracing data from source device and the CTCU device serves as the
> control unit for the ETR device.
> 

Please ignore this patch, I already sent it before and got reviewed by 
Konrad. Sorry for the mistake.

https://lore.kernel.org/all/b9bd5d63-787f-41c6-ae7b-8543a7b6c4c6@oss.qualcomm.com/

Thanks,
Jie

> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/kaanapali.dtsi | 181 ++++++++++++++++++++++++++++++++
>   1 file changed, 181 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> index 131fd2a16c54..6fc1399a7e5e 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -4421,40 +4421,69 @@ cmd-pins {
>   					pins = "sdc2_cmd";
>   					drive-strength = <2>;
>   					bias-pull-up;
>   				};
>   
>   				data-pins {
>   					pins = "sdc2_data";
>   					drive-strength = <2>;
>   					bias-pull-up;
>   				};
>   
>   				card-detect-pins {
>   					pins = "gpio55";
>   					function = "gpio";
>   					drive-strength = <2>;
>   					bias-pull-up;
>   				};
>   			};
>   		};
>   
> +		ctcu@10001000 {
> +			compatible = "qcom,kaanapali-ctcu", "qcom,sa8775p-ctcu";
> +			reg = <0x0 0x10001000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					ctcu_in0: endpoint {
> +						remote-endpoint = <&tmc_etr_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					ctcu_in1: endpoint {
> +						remote-endpoint = <&tmc_etr1_out>;
> +					};
> +				};
> +			};
> +		};
> +
>   		stm@10002000 {
>   			compatible = "arm,coresight-stm", "arm,primecell";
>   			reg = <0x0 0x10002000 0x0 0x1000>,
>   			      <0x0 0x16280000 0x0 0x180000>;
>   			reg-names = "stm-base",
>   				    "stm-stimulus-base";
>   
>   			clocks = <&aoss_qmp>;
>   			clock-names = "apb_pclk";
>   
>   			out-ports {
>   				port {
>   					stm_out: endpoint {
>   						remote-endpoint = <&funnel_in0_in7>;
>   					};
>   				};
>   			};
>   		};
>   
>   		tpdm@10003000 {
> @@ -4560,40 +4589,155 @@ funnel_in0_in6: endpoint {
>   				};
>   
>   				port@7 {
>   					reg = <7>;
>   
>   					funnel_in0_in7: endpoint {
>   						remote-endpoint = <&stm_out>;
>   					};
>   				};
>   			};
>   
>   			out-ports {
>   				port {
>   					funnel_in0_out: endpoint {
>   						remote-endpoint = <&funnel_aoss_in6>;
>   					};
>   				};
>   			};
>   		};
>   
> +		replicator@10046000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x10046000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					replicator_qdss_in: endpoint {
> +						remote-endpoint = <&replicator_swao_out0>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					replicator_qdss_out: endpoint {
> +						remote-endpoint = <&replicator_etr_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tmc@10048000 {
> +			compatible = "arm,coresight-tmc", "arm,primecell";
> +			reg = <0x0 0x10048000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			iommus = <&apps_smmu 0x04e0 0x0>;
> +			arm,scatter-gather;
> +
> +			in-ports {
> +				port {
> +					tmc_etr_in: endpoint {
> +						remote-endpoint = <&replicator_etr_out0>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					tmc_etr_out: endpoint {
> +						remote-endpoint = <&ctcu_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		replicator@1004e000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x1004e000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					replicator_etr_in: endpoint {
> +						remote-endpoint = <&replicator_qdss_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					replicator_etr_out0: endpoint {
> +						remote-endpoint = <&tmc_etr_in>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					replicator_etr_out1: endpoint {
> +						remote-endpoint = <&tmc_etr1_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tmc@1004f000 {
> +			compatible = "arm,coresight-tmc", "arm,primecell";
> +			reg = <0x0 0x1004f000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			iommus = <&apps_smmu 0x0500 0x0>;
> +			arm,scatter-gather;
> +
> +			in-ports {
> +				port {
> +					tmc_etr1_in: endpoint {
> +						remote-endpoint = <&replicator_etr_out1>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					tmc_etr1_out: endpoint {
> +						remote-endpoint = <&ctcu_in1>;
> +					};
> +				};
> +			};
> +		};
> +
>   		tpdm@11000000 {
>   			compatible = "qcom,coresight-tpdm", "arm,primecell";
>   			reg = <0x0 0x11000000 0x0 0x1000>;
>   
>   			clocks = <&aoss_qmp>;
>   			clock-names = "apb_pclk";
>   			label = "tpdm_modem_0";
>   
>   			qcom,dsb-element-bits = <32>;
>   			qcom,dsb-msrs-num = <32>;
>   
>   			out-ports {
>   				port {
>   					tpdm_modem0_out: endpoint {
>   						remote-endpoint = <&tpda_modem_in0>;
>   					};
>   				};
>   			};
>   		};
>   
> @@ -5374,40 +5518,77 @@ funnel_aoss_out: endpoint {
>   						remote-endpoint = <&tmc_etf_in>;
>   					};
>   				};
>   			};
>   		};
>   
>   		tmc@11305000 {
>   			compatible = "arm,coresight-tmc", "arm,primecell";
>   			reg = <0x0 0x11305000 0x0 0x1000>;
>   
>   			clocks = <&aoss_qmp>;
>   			clock-names = "apb_pclk";
>   
>   			in-ports {
>   				port {
>   					tmc_etf_in: endpoint {
>   						remote-endpoint = <&funnel_aoss_out>;
>   					};
>   				};
>   			};
> +
> +			out-ports {
> +				port {
> +					tmc_etf_out: endpoint {
> +						remote-endpoint = <&replicator_swao_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		replicator@11306000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x11306000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					replicator_swao_in: endpoint {
> +						remote-endpoint = <&tmc_etf_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					replicator_swao_out0: endpoint {
> +						remote-endpoint = <&replicator_qdss_in>;
> +					};
> +				};
> +			};
>   		};
>   
>   		tpda@11308000 {
>   			compatible = "qcom,coresight-tpda", "arm,primecell";
>   			reg = <0x0 0x11308000 0x0 0x1000>;
>   
>   			clocks = <&aoss_qmp>;
>   			clock-names = "apb_pclk";
>   
>   			in-ports {
>   				#address-cells = <1>;
>   				#size-cells = <0>;
>   
>   				port@0 {
>   					reg = <0>;
>   
>   					tpda_aoss_in0: endpoint {
>   						remote-endpoint = <&tpdm_swao_prio0_out>;
>   					};
>   				};
> 
> ---
> base-commit: e30626823a406725ce29bc75cb8ec467d3e1e326
> change-id: 20260831-enable-ctcu-etr-for-knp-28434e777f1e
> 
> Best regards,

