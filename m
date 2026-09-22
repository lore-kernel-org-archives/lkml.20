Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD22C47D929
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790072063; cv=none; b=uhY9o3FDwgOEBk/wDW0RAlbfmnkOgI1le/5GeCn7dfjhO0TdHq2KqBROOOqZI3bQERHTs9gMqIm35WKBUv8+VBM1CwE6ROAoSO+1yESCKE3qpoBbBCKGclNkzmLK1q/pI0rQa0HIUTObgCQ3D7JvnvdR8ygZRw22pu7XUfoRCz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790072063; c=relaxed/simple;
	bh=OPovYYAIiefixj3F304c81l3ejtoOKIFx1MdenbXNQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KNjdd4LbsrGjEKLRUPYmvdxgqoka/VWxXr9qMGmyyMtXrBpCYfW1w1pi8SRGi1xeKvsgT3SYjRn6ADPQWFmT61/J3e607TnRn+MQIcycl3Nfq/8FxYm2J8Wkf+7ve2BhHIA8+pblnFJ/Q8QpgZnyQqDliIITxsyi7fMQDpRijuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WHb66Qz+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J7vKrgvF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WHb66Qz+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J7vKrgvF"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M8dMtM3704696
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:14:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oZji6XgOUMJdwAXjZPzu35mNdxjYauJ7AU78rg0vCO8=; b=WHb66Qz+h0yKaGIb
	M4hm/cUB1B0dsa9Q50GiO1ILW9MtUQ3GVwgpWO00cok57EIZB3+ZX031aUquviQK
	QOubgCI7bKwCDVQQ81f54LYzA7jyZwo7VZe7gGHLhL3w63uZl0FR2fBE0Qjkbwjn
	VEfUb3XmXF2cKrRlUDz7xXySPl+yfcmTOylVFjxB+fk56PUQhf8hoyTOyxd+l9pE
	kx48Hrz0f50ffbA9ZBm4gA7u3frbEduk7nBSIbJ0x4Q8eZ9PLSL+RNqiB5Avqq4I
	1jyyhUe4Ae3D9O80cdhXhYLmh0/IM+k2W9MmZTRY/rriunLHv17qf8NLO+gSdbvQ
	RqJkjg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gupbqgcm8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:14:17 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d9057fab9eso66892245ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790072056; x=1790676856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oZji6XgOUMJdwAXjZPzu35mNdxjYauJ7AU78rg0vCO8=;
        b=J7vKrgvFuOrBG4kSODn1Tl9nlfpAfX+vnraAkcBRxubB55vbo6Sd/auxePL0F+8gKi
         5T3YfjA/hhp2bmPUQCuifOYghMstzsS37QYCFBoPSukiRAr+RUmBDkaS6fC1Vt42ypJV
         4E3GKrNyQ7KaWL7dIBY8iBl09JA12HRqrVKWYkrMQ9sjNge1qeZ5pbLpK2AoCRY8sn1c
         zAS7fjXNp/w6rxfEaF3Fvlh5nZtD3JNMAc514sjEAbIkIsqoRXErGnDpXuHwMbCUqtpL
         zlKYJB9tRD//8R/2LMICowpIAXLeCXAuRKBiOh4JXfbiP8xhZ5HkN8DWWivNmzYbbFV0
         +Y+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790072056; x=1790676856;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oZji6XgOUMJdwAXjZPzu35mNdxjYauJ7AU78rg0vCO8=;
        b=T6QCF8B0IBHQxABNzk6Vf8k8fELRVyIKk/4eqneQM7AvvGz2FKPFLVhg6jxyZD+fAc
         yXWbrTp+KaeXgvPfbCEDT5nqP+VfHlU40RNvFNVQ6PfFDePog9Rxrl6eyrPwwq04/hvk
         yPqawCtieJOqTNEHSo7CoGLeHEYy22BElnzymn53M3x5JaZj3ZHo7bEJUrCM/sWCRKHn
         yilxmUDRM67eyA/W5J2y9FnFoCkGVbb092YLnbjQY6nIDmbYsRv11tdfodaEoLdZAjtJ
         qvfD2VuRSL1Rid9H+Mk9JQxQ32636E09hec2bWWrSqWDA1bytVMZkBgdWyd0A/TY/5il
         Zdcw==
X-Forwarded-Encrypted: i=1; AKwUvBzSoq1S+i9V+izdkDpwgwKGEBgHDT4q3ki1De5uZT+75G9coreRfZswNr++zLmcEbDfzPVQp7fESlpYqG0=@vger.kernel.org
X-Gm-Message-State: AFuF++kgQBNdLfewKTUa0KKxXRqstUrc9mufgKDFHQIxDNfhi1pVpRBD
	p0c/tvVwluHmW0AcHpZdhz8Mdo4fIV58dq7QbpGxOhVj09HvexL98qdZj9RsFqK1pQmlfABORCT
	pXfXog+H/5rqyrbNiy8Adep5Qgwqp35uJOUCpYIjNj2YBfNMswf2CByjK/WY0r/xs1+U=
X-Gm-Gg: AYBFou018hAmYskM6PALtLbM8Sa7J6HNrOmFRmyx5I09U1SEW9OcSBpMKeA+cdOwpX8
	uxveyO/eqXUlKFJgrCG13kEEPGYYAoVxggNVvAVIZoSA6G4PNDsJuuxClLXdDt893HwI3uq31aK
	NRw0sQSMaIyjQzpHm+l31wrkJkwGg0lSI7fne1PXMKa0x+M0RA2X+9KwgEZsf6VlxMnS6eyQ4Fk
	QBMJnkiTXEsjcMcbAqByYaVLEvMUE67fM0qyXZiDL5wX288p5qmyuLT9mXlzvIijDyD5WxqqASO
	DmlAhLVWsPePGVQNPaluTO1i5rkkhV9c7eK5/lqjyRmlhzY14XwBliZEBv5V/Uah5VVgtj1WNX1
	RcZ4wgLpRVXl4cRvmV1xTj05plLjeU8NKb4o0CNNV/soiagG6Vhv3yx4LUBxW/Yy5
X-Received: by 2002:a17:90b:1c8b:b0:39e:2faa:2e83 with SMTP id 98e67ed59e1d1-3a07309a50cmr739296a91.10.1790072055947;
        Tue, 22 Sep 2026 03:14:15 -0700 (PDT)
X-Received: by 2002:a17:90b:1c8b:b0:39e:2faa:2e83 with SMTP id 98e67ed59e1d1-3a07309a50cmr739256a91.10.1790072055093;
        Tue, 22 Sep 2026 03:14:15 -0700 (PDT)
Received: from [10.133.33.138] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06e26e6a2sm2836095a91.2.2026.09.22.03.14.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 03:14:14 -0700 (PDT)
Message-ID: <63c1fa59-1a2d-4c39-b0df-ca7c00d2e535@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 18:14:09 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: nord: add CoreSight debug nodes
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260922100850.527109-1-shengchao.guo@oss.qualcomm.com>
 <20260922100850.527109-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260922100850.527109-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE0NyBTYWx0ZWRfX2bzTzfQfy+Vv
 uyb74t3yt23vjQ0sV/2iXWCll0sPEIPHY9E/m+O5ulrje4XG87BDdthKzNUL17u9bMDXZ+iWYGi
 +W2phfqDWUb/q65He4Up0oEbwYEYPhCUc5Nh+Vq9lE5ykLaPkiakTMOosa1EgqLrb4Um3q/5VAp
 xhcYOdLGEip0xBeQUf10SOvsmliaWiFfc1NBqXenrtt5/Rf0gE/2Tbqd9rGmhEV2heNFjC927lh
 bYRIhAs8jsE20fLJNVBWCGnNMt1SHobdMa3qNkRVDHczaUSQ1YzufHr+gLMtr6gQY2wgPXQHHtx
 Jp2uvz0b01Fzxps2A5qI/H8FK2ai1jcVwaW/bgMCDYDnqYkoqfdIW3BSrmRASlhxDi//mbszZBF
 1ksEADkLuuR4OWS/879FgCI8VwfR1NuPNPY+2pbTdnxpddzVNGRKrLkOkEBrrv8d1L14tj2DSTy
 od69A2gQoY9RfJpUBLQ==
X-Authority-Analysis: v=2.4 cv=FdaiV5+6 c=1 sm=1 tr=0 ts=6ab254f9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=VMC0QoxAK1dSx8oZRh4A:9 a=MK5Cw57mQeg2BjDo:21
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=IRUrt_SQlIu20UJnvt05:22
X-Proofpoint-ORIG-GUID: YMmR_Svd6ZSmzEfVzCmgvtjuDu6waAKW
X-Proofpoint-GUID: YMmR_Svd6ZSmzEfVzCmgvtjuDu6waAKW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE0NyBTYWx0ZWRfX5GOu28zfubEL
 pzI5fBvBbIh6B2uJA+QA1a9x7yeNI/PJKd7IRpHtTEZe4gLPXBV402sfUIrOlqnG3Bhj+LB/PbE
 ruxK2kG8Logy5fvdA7QxCfjB6zbI07E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220147


On 9/22/2026 6:08 PM, Shawn Guo wrote:
> From: Jie Gan <jie.gan@oss.qualcomm.com>
> 
> Add the CoreSight trace topology for the Qualcomm Nord SoC: CTCU, STM,
> TPDM/TPDA sources and aggregators, funnels, replicators, TMC ETR/ETF
> sinks, TNoC/ITNoC nodes and per-subsystem CTIs. This wires up trace
> sources for SOCCP, BCV/IMH/DPM, GCC, QM, DL_NOC, the CDSP NSP0-3
> clusters, DLMM, EVA, MDSS0/1, LPASS and the AOSS SWAO priority TPDMs,
> plus the DDR0-3 channel and LLCC TPDMs, all funneled through the
> tn_ag aggregator into the main CoreSight funnel and out to the AOSS
> sink.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/nord.dtsi | 3540 ++++++++++++++++++++++++++--
>   1 file changed, 3314 insertions(+), 226 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
> index 926ccf3bbe4e..3e4fbacc2eb3 100644
> --- a/arch/arm64/boot/dts/qcom/nord.dtsi
> +++ b/arch/arm64/boot/dts/qcom/nord.dtsi
> @@ -345,6 +345,18 @@ domain_ss3: domain-sleep-0 {
>   		};
>   	};
>   
> +	eud-sink {
> +		compatible = "arm,coresight-dummy-sink";
> +
> +		in-ports {
> +			port {
> +				eud_in: endpoint {
> +					remote-endpoint = <&aoss_rep0_out1>;
> +				};
> +			};
> +		};
> +	};
> +
>   	firmware: firmware {
>   		scm {
>   			compatible = "qcom,scm-nord",
> @@ -372,6 +384,20 @@ cpu_perf: protocol@13 {
>   		};
>   	};
>   
> +	hpass-stm {
> +		compatible = "arm,coresight-dummy-source";
> +		label = "hpass_stm";
> +		arm,static-trace-id = <25>;
> +
> +		out-ports {
> +			port {
> +				lpass_stm_out: endpoint {
> +					remote-endpoint = <&lpass_tn_in18>;
> +				};
> +			};
> +		};
> +	};
> +
>   	memory@80000000 {
>   		device_type = "memory";
>   		/* Size will be updated by bootloader */
> @@ -1900,236 +1926,3178 @@ tlmm: pinctrl@f100000 {
>   			wakeup-parent = <&pdc>;
>   		};
>   
> -		apps_smmu_0: iommu@15a00000 {

Hi Shawn,

Thanks for helping post.

This irrelevant patch diff can be avoided with git config:
git config diff.algorithm histogram.

As Coresight patch is large, better patch diff format helps review much 
easier.

Thanks,
Jie

> -			compatible = "qcom,nord-smmu-500",
> -				     "qcom,smmu-500",
> -				     "arm,mmu-500";
> -			reg = <0x0 0x15a00000 0x0 0x100000>;
> -			#iommu-cells = <2>;
> -			#global-interrupts = <1>;
> -			dma-coherent;
> -			interrupts = <GIC_SPI 886 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 32 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 33 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 34 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 35 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 36 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 37 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 38 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 39 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 40 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 41 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 42 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 43 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 44 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 45 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 46 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 47 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 48 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 49 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 50 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 51 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 52 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 53 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 54 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 55 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 56 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 57 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 58 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 59 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 60 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 61 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 62 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 63 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 64 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 65 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 66 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 67 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 68 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 69 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 70 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 71 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 72 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 73 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 74 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 75 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 76 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 77 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 78 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 79 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 80 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 81 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 82 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 83 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 84 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 85 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 86 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 87 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 88 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 89 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 90 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 91 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 92 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 93 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 94 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 95 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 96 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 97 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 98 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 99 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 100 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 101 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 102 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 103 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 104 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 105 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 106 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 107 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 108 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 109 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 110 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 111 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 112 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 113 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 114 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 115 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 116 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 117 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 118 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 119 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 120 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 121 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 122 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 123 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 124 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 125 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 126 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 127 IRQ_TYPE_LEVEL_HIGH>;
> +		ctcu@10001000 {
> +			compatible = "qcom,nord-ctcu", "qcom,sa8775p-ctcu";
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
> +						remote-endpoint = <&qdss_etr0_out_ctcu>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					ctcu_in1: endpoint {
> +						remote-endpoint = <&qdss_etr1_out_ctcu>;
> +					};
> +				};
> +			};
>   		};
>   
> -		apps_smmu_1: iommu@15c00000 {
> -			compatible = "qcom,nord-smmu-500",
> -				     "qcom,smmu-500",
> -				     "arm,mmu-500";
> -			reg = <0x0 0x15c00000 0x0 0x100000>;
> -			#iommu-cells = <2>;
> -			#global-interrupts = <1>;
> -			dma-coherent;
> -			interrupts = <GIC_SPI 882 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 128 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 129 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 130 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 131 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 132 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 133 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 134 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 135 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 136 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 137 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 138 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 139 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 140 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 141 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 142 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 143 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 144 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 145 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 146 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 147 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 148 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 149 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 150 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 151 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 152 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 153 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 154 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 155 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 156 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 157 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 158 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 159 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 160 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 161 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 162 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 163 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 164 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 165 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 166 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 167 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 168 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 169 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 170 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 171 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 172 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 173 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 174 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 175 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 176 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 177 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 178 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 179 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 180 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 181 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 182 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 183 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 184 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 185 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 186 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 187 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 188 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 189 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 190 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 191 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 192 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 193 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 194 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 195 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 196 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 197 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 198 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 199 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 200 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 201 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 202 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 203 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 204 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 205 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 206 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 207 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 208 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 209 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 210 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 211 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 212 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 213 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 214 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 215 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 216 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 217 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 218 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 219 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 220 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 221 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 222 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 223 IRQ_TYPE_LEVEL_HIGH>;
> +		stm@10002000 {
> +			compatible = "arm,coresight-stm", "arm,primecell";
> +			reg = <0x0 0x10002000 0x0 0x1000>,
> +			      <0x0 0x16000000 0x0 0x180000>;
> +			reg-names = "stm-base",
> +				    "stm-stimulus-base";
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			out-ports {
> +				port {
> +					qdss_stm_out: endpoint {
> +						remote-endpoint = <&qdss_funnel_in7>;
> +					};
> +				};
> +			};
>   		};
>   
> -		apps_smmu_2: iommu@15e00000 {
> -			compatible = "qcom,nord-smmu-500",
> -				     "qcom,smmu-500",
> -				     "arm,mmu-500";
> -			reg = <0x0 0x15e00000 0x0 0x100000>;
> -			#iommu-cells = <2>;
> -			#global-interrupts = <1>;
> -			dma-coherent;
> -			interrupts = <GIC_SPI 877 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 224 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 225 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 226 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 227 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 228 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 229 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_ESPI 230 IRQ_TYPE_LEVEL_HIGH>,
> +		tpda@10004000 {
> +			compatible = "qcom,coresight-tpda", "arm,primecell";
> +			reg = <0x0 0x10004000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					qdss_tpda_in1: endpoint {
> +						remote-endpoint = <&qdss_tpdm1_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					qdss_tpda_out: endpoint {
> +						remote-endpoint = <&qdss_funnel_in6>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@1000f000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x1000f000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_spdm";
> +
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					qdss_tpdm1_out: endpoint {
> +						remote-endpoint = <&qdss_tpda_in1>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@10041000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x10041000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					qdss_funnel_in0: endpoint {
> +						remote-endpoint = <&tn_ag_out>;
> +					};
> +				};
> +
> +				port@6 {
> +					reg = <6>;
> +
> +					qdss_funnel_in6: endpoint {
> +						remote-endpoint = <&qdss_tpda_out>;
> +					};
> +				};
> +
> +				port@7 {
> +					reg = <7>;
> +
> +					qdss_funnel_in7: endpoint {
> +						remote-endpoint = <&qdss_stm_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					qdss_funnel_out: endpoint {
> +						remote-endpoint = <&aoss_funnel_in7>;
> +					};
> +				};
> +			};
> +		};
> +
> +		replicator@10046000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x10046000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					qdss_rep0_in: endpoint {
> +						remote-endpoint = <&aoss_rep1_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					qdss_rep0_out: endpoint {
> +						remote-endpoint = <&qdss_rep1_in>;
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
> +			iommus = <&apps_smmu_0 0x1860 0x0>;
> +
> +			arm,scatter-gather;
> +
> +			in-ports {
> +				port {
> +					qdss_etr0_in: endpoint {
> +						remote-endpoint = <&qdss_rep1_out0>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					qdss_etr0_out_ctcu: endpoint {
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
> +					qdss_rep1_in: endpoint {
> +						remote-endpoint = <&qdss_rep0_out>;
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
> +					qdss_rep1_out0: endpoint {
> +						remote-endpoint = <&qdss_etr0_in>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					qdss_rep1_out1: endpoint {
> +						remote-endpoint = <&qdss_etr1_in>;
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
> +			iommus = <&apps_smmu_0 0x1880 0x0>;
> +
> +			arm,scatter-gather;
> +
> +			in-ports {
> +				port {
> +					qdss_etr1_in: endpoint {
> +						remote-endpoint = <&qdss_rep1_out1>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					qdss_etr1_out_ctcu: endpoint {
> +						remote-endpoint = <&ctcu_in1>;
> +					};
> +				};
> +			};
> +		};
> +
> +		itnoc@11500000 {
> +			compatible = "qcom,coresight-itnoc";
> +			reg = <0x0 0x11500000 0x0 0x3400>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb";
> +
> +			in-ports {
> +				port {
> +					soccp_tn_in: endpoint {
> +						remote-endpoint = <&soccp_tpdm_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					soccp_tn_out: endpoint {
> +						remote-endpoint = <&tn_ag_in75>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@11504000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x11504000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_soccp";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					soccp_tpdm_out: endpoint {
> +						remote-endpoint = <&soccp_tn_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@11528000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x11528000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_bcv";
> +
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					mm_rscc_tpdm0_out: endpoint {
> +						remote-endpoint = <&mm_rscc_tpda_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@11529000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x11529000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_imh";
> +
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					mm_rscc_tpdm1_out: endpoint {
> +						remote-endpoint = <&mm_rscc_tpda_in1>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@1152a000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x1152a000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_dpm";
> +
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					mm_rscc_tpdm2_out: endpoint {
> +						remote-endpoint = <&mm_rscc_tpda_in2>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpda@1152b000 {
> +			compatible = "qcom,coresight-tpda", "arm,primecell";
> +			reg = <0x0 0x1152b000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					mm_rscc_tpda_in0: endpoint {
> +						remote-endpoint = <&mm_rscc_tpdm0_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					mm_rscc_tpda_in1: endpoint {
> +						remote-endpoint = <&mm_rscc_tpdm1_out>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					mm_rscc_tpda_in2: endpoint {
> +						remote-endpoint = <&mm_rscc_tpdm2_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					mm_rscc_tpda_out: endpoint {
> +						remote-endpoint = <&tn_ag_in8>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@1153c000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x1153c000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_gcc";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					gcc_tpdm_out: endpoint {
> +						remote-endpoint = <&tn_ag_in56>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@115a5000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x115a5000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_tn_ag_0";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					tn_ag_tpdm0_out: endpoint {
> +						remote-endpoint = <&tn_ag_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@115a6000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x115a6000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_tn_ag_1";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					tn_ag_tpdm1_out: endpoint {
> +						remote-endpoint = <&tn_ag_in1>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@115a7000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x115a7000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_tn_ag_2";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					tn_ag_tpdm2_out: endpoint {
> +						remote-endpoint = <&tn_ag_in37>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@115a8000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x115a8000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_tn_ag_3";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					tn_ag_tpdm3_out: endpoint {
> +						remote-endpoint = <&tn_ag_in44>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@115a9000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x115a9000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_tn_ag_4";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					tn_ag_tpdm4_out: endpoint {
> +						remote-endpoint = <&tn_ag_in47>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@115aa000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x115aa000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_tn_ag_5";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					tn_ag_tpdm5_out: endpoint {
> +						remote-endpoint = <&tn_ag_in51>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@115ab000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x115ab000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_tn_ag_6";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					tn_ag_tpdm6_out: endpoint {
> +						remote-endpoint = <&tn_ag_in65>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@115ac000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x115ac000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_tn_ag_7";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					tn_ag_tpdm7_out: endpoint {
> +						remote-endpoint = <&tn_ag_in66>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@115ad000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x115ad000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_tn_ag_8";
> +
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					tn_ag_tpdm8_out: endpoint {
> +						remote-endpoint = <&tn_ag_in67>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@115ae000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x115ae000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_tn_ag_9";
> +
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					tn_ag_tpdm9_out: endpoint {
> +						remote-endpoint = <&tn_ag_in68>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@115af000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x115af000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_tn_ag_10";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					tn_ag_tpdm10_out: endpoint {
> +						remote-endpoint = <&tn_ag_in69>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@115b0000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x115b0000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_tn_ag_11";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					tn_ag_tpdm11_out: endpoint {
> +						remote-endpoint = <&tn_ag_in70>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@115b1000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x115b1000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_tn_ag_12";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					tn_ag_tpdm12_out: endpoint {
> +						remote-endpoint = <&tn_ag_in71>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@115b2000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x115b2000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_tn_ag_13";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					tn_ag_tpdm13_out: endpoint {
> +						remote-endpoint = <&tn_ag_in130>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@115b3000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x115b3000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_tn_ag_14";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					tn_ag_tpdm14_out: endpoint {
> +						remote-endpoint = <&tn_ag_in131>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@115b4000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x115b4000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_tn_ag_15";
> +
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					tn_ag_tpdm15_out: endpoint {
> +						remote-endpoint = <&tn_ag_in135>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@115b5000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x115b5000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_tn_ag_16";
> +
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					tn_ag_tpdm16_out: endpoint {
> +						remote-endpoint = <&tn_ag_in136>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@115b6000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x115b6000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_tn_ag_17";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					tn_ag_tpdm17_out: endpoint {
> +						remote-endpoint = <&tn_ag_in149>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tn@115bc000 {
> +			compatible = "qcom,coresight-tnoc";
> +			reg = <0x0 0x115bc000 0x0 0x3c00>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					tn_ag_in0: endpoint {
> +						remote-endpoint = <&tn_ag_tpdm0_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					tn_ag_in1: endpoint {
> +						remote-endpoint = <&tn_ag_tpdm1_out>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					tn_ag_in2: endpoint {
> +						remote-endpoint = <&dlmm_funnel_out>;
> +					};
> +				};
> +
> +				port@8 {
> +					reg = <8>;
> +
> +					tn_ag_in8: endpoint {
> +						remote-endpoint = <&mm_rscc_tpda_out>;
> +					};
> +				};
> +
> +				port@a {
> +					reg = <0xa>;
> +
> +					tn_ag_in10: endpoint {
> +						remote-endpoint = <&ddr0_tn_out>;
> +					};
> +				};
> +
> +				port@1f {
> +					reg = <0x1f>;
> +
> +					tn_ag_in31: endpoint {
> +						remote-endpoint = <&dlnoc_funnel_out>;
> +					};
> +				};
> +
> +				port@25 {
> +					reg = <0x25>;
> +
> +					tn_ag_in37: endpoint {
> +						remote-endpoint = <&tn_ag_tpdm2_out>;
> +					};
> +				};
> +
> +				port@26 {
> +					reg = <0x26>;
> +
> +					tn_ag_in38: endpoint {
> +						remote-endpoint = <&lpass_tn_out>;
> +					};
> +				};
> +
> +				port@2c {
> +					reg = <0x2c>;
> +
> +					tn_ag_in44: endpoint {
> +						remote-endpoint = <&tn_ag_tpdm3_out>;
> +					};
> +				};
> +
> +				port@2f {
> +					reg = <0x2f>;
> +
> +					tn_ag_in47: endpoint {
> +						remote-endpoint = <&tn_ag_tpdm4_out>;
> +					};
> +				};
> +
> +				port@33 {
> +					reg = <0x33>;
> +
> +					tn_ag_in51: endpoint {
> +						remote-endpoint = <&tn_ag_tpdm5_out>;
> +					};
> +				};
> +
> +				port@38 {
> +					reg = <0x38>;
> +
> +					tn_ag_in56: endpoint {
> +						remote-endpoint = <&gcc_tpdm_out>;
> +					};
> +				};
> +
> +				port@3d {
> +					reg = <0x3d>;
> +
> +					tn_ag_in61: endpoint {
> +						remote-endpoint = <&nsp1_funnel_out>;
> +					};
> +				};
> +
> +				port@3e {
> +					reg = <0x3e>;
> +
> +					tn_ag_in62: endpoint {
> +						remote-endpoint = <&nsp2_funnel_out>;
> +					};
> +				};
> +
> +				port@3f {
> +					reg = <0x3f>;
> +
> +					tn_ag_in63: endpoint {
> +						remote-endpoint = <&nsp3_funnel_out>;
> +					};
> +				};
> +
> +				port@41 {
> +					reg = <0x41>;
> +
> +					tn_ag_in65: endpoint {
> +						remote-endpoint = <&tn_ag_tpdm6_out>;
> +					};
> +				};
> +
> +				port@42 {
> +					reg = <0x42>;
> +
> +					tn_ag_in66: endpoint {
> +						remote-endpoint = <&tn_ag_tpdm7_out>;
> +					};
> +				};
> +
> +				port@43 {
> +					reg = <0x43>;
> +
> +					tn_ag_in67: endpoint {
> +						remote-endpoint = <&tn_ag_tpdm8_out>;
> +					};
> +				};
> +
> +				port@44 {
> +					reg = <0x44>;
> +
> +					tn_ag_in68: endpoint {
> +						remote-endpoint = <&tn_ag_tpdm9_out>;
> +					};
> +				};
> +
> +				port@45 {
> +					reg = <0x45>;
> +
> +					tn_ag_in69: endpoint {
> +						remote-endpoint = <&tn_ag_tpdm10_out>;
> +					};
> +				};
> +
> +				port@46 {
> +					reg = <0x46>;
> +
> +					tn_ag_in70: endpoint {
> +						remote-endpoint = <&tn_ag_tpdm11_out>;
> +					};
> +				};
> +
> +				port@47 {
> +					reg = <0x47>;
> +
> +					tn_ag_in71: endpoint {
> +						remote-endpoint = <&tn_ag_tpdm12_out>;
> +					};
> +				};
> +
> +				port@48 {
> +					reg = <0x48>;
> +
> +					tn_ag_in72: endpoint {
> +						remote-endpoint = <&qm_tpdm_out>;
> +					};
> +				};
> +
> +				port@4b {
> +					reg = <0x4b>;
> +
> +					tn_ag_in75: endpoint {
> +						remote-endpoint = <&soccp_tn_out>;
> +					};
> +				};
> +
> +				port@59 {
> +					reg = <0x59>;
> +
> +					tn_ag_in89: endpoint {
> +						remote-endpoint = <&ddr1_tn_out>;
> +					};
> +				};
> +
> +				port@6b {
> +					reg = <0x6b>;
> +
> +					tn_ag_in107: endpoint {
> +						remote-endpoint = <&ddr2_tn_out>;
> +					};
> +				};
> +
> +				port@82 {
> +					reg = <0x82>;
> +
> +					tn_ag_in130: endpoint {
> +						remote-endpoint = <&tn_ag_tpdm13_out>;
> +					};
> +				};
> +
> +				port@83 {
> +					reg = <0x83>;
> +
> +					tn_ag_in131: endpoint {
> +						remote-endpoint = <&tn_ag_tpdm14_out>;
> +					};
> +				};
> +
> +				port@87 {
> +					reg = <0x87>;
> +
> +					tn_ag_in135: endpoint {
> +						remote-endpoint = <&tn_ag_tpdm15_out>;
> +					};
> +				};
> +
> +				port@88 {
> +					reg = <0x88>;
> +
> +					tn_ag_in136: endpoint {
> +						remote-endpoint = <&tn_ag_tpdm16_out>;
> +					};
> +				};
> +
> +				port@89 {
> +					reg = <0x89>;
> +
> +					tn_ag_in137: endpoint {
> +						remote-endpoint = <&nsp0_funnel_out>;
> +					};
> +				};
> +
> +				port@95 {
> +					reg = <0x95>;
> +
> +					tn_ag_in149: endpoint {
> +						remote-endpoint = <&tn_ag_tpdm17_out>;
> +					};
> +				};
> +
> +				port@9f {
> +					reg = <0x9f>;
> +
> +					tn_ag_in159: endpoint {
> +						remote-endpoint = <&ddr3_tn_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					tn_ag_out: endpoint {
> +						remote-endpoint = <&qdss_funnel_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@11684000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x11684000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_qm";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					qm_tpdm_out: endpoint {
> +						remote-endpoint = <&tn_ag_in72>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@116f0000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x116f0000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_dl_noc_0";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					dlnoc_tpdm0_out: endpoint {
> +						remote-endpoint = <&dlnoc_tpda_in27>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@116f1000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x116f1000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_dl_noc_1";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					dlnoc_tpdm1_out: endpoint {
> +						remote-endpoint = <&dlnoc_tpda_in28>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpda@116f4000 {
> +			compatible = "qcom,coresight-tpda", "arm,primecell";
> +			reg = <0x0 0x116f4000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@1b {
> +					reg = <0x1b>;
> +
> +					dlnoc_tpda_in27: endpoint {
> +						remote-endpoint = <&dlnoc_tpdm0_out>;
> +					};
> +				};
> +
> +				port@1c {
> +					reg = <0x1c>;
> +
> +					dlnoc_tpda_in28: endpoint {
> +						remote-endpoint = <&dlnoc_tpdm1_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					dlnoc_tpda_out: endpoint {
> +						remote-endpoint = <&dlnoc_funnel_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@116f5000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x116f5000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					dlnoc_funnel_in: endpoint {
> +						remote-endpoint = <&dlnoc_tpda_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					dlnoc_funnel_out: endpoint {
> +						remote-endpoint = <&tn_ag_in31>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpda@117c8000 {
> +			compatible = "qcom,coresight-tpda", "arm,primecell";
> +			reg = <0x0 0x117c8000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					nsp0_tpda_in0: endpoint {
> +						remote-endpoint = <&nsp0_tpdm0_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					nsp0_tpda_in1: endpoint {
> +						remote-endpoint = <&nsp0_tpdm1_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					nsp0_tpda_out: endpoint {
> +						remote-endpoint = <&nsp0_funnel_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@117c9000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x117c9000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					nsp0_funnel_in: endpoint {
> +						remote-endpoint = <&nsp0_tpda_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					nsp0_funnel_out: endpoint {
> +						remote-endpoint = <&tn_ag_in137>;
> +					};
> +				};
> +			};
> +		};
> +
> +		cti@117d3000 {
> +			compatible = "arm,coresight-cti", "arm,primecell";
> +			reg = <0x0 0x117d3000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "cti_nsp0";
> +		};
> +
> +		tpda@117e8000 {
> +			compatible = "qcom,coresight-tpda", "arm,primecell";
> +			reg = <0x0 0x117e8000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					nsp1_tpda_in0: endpoint {
> +						remote-endpoint = <&nsp1_tpdm0_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					nsp1_tpda_in1: endpoint {
> +						remote-endpoint = <&nsp1_tpdm1_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					nsp1_tpda_out: endpoint {
> +						remote-endpoint = <&nsp1_funnel_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@117e9000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x117e9000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					nsp1_funnel_in: endpoint {
> +						remote-endpoint = <&nsp1_tpda_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					nsp1_funnel_out: endpoint {
> +						remote-endpoint = <&tn_ag_in61>;
> +					};
> +				};
> +			};
> +		};
> +
> +		cti@117f3000 {
> +			compatible = "arm,coresight-cti", "arm,primecell";
> +			reg = <0x0 0x117f3000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "cti_nsp1";
> +		};
> +
> +		tpdm@11800000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x11800000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_dlmm_dsb";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					dlmm_tpdm0_out: endpoint {
> +						remote-endpoint = <&dlmm_tpda_in27>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@11801000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x11801000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_dlmm_cmb";
> +
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					dlmm_tpdm1_out: endpoint {
> +						remote-endpoint = <&dlmm_tpda_in28>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpda@11804000 {
> +			compatible = "qcom,coresight-tpda", "arm,primecell";
> +			reg = <0x0 0x11804000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					dlmm_tpda_in2: endpoint {
> +						remote-endpoint = <&mdss1_funnel_out>;
> +					};
> +				};
> +
> +				port@8 {
> +					reg = <8>;
> +
> +					dlmm_tpda_in8: endpoint {
> +						remote-endpoint = <&eva_funnel_out>;
> +					};
> +				};
> +
> +				port@e {
> +					reg = <0xe>;
> +
> +					dlmm_tpda_in14: endpoint {
> +						remote-endpoint = <&mdss0_funnel_out>;
> +					};
> +				};
> +
> +				port@1b {
> +					reg = <0x1b>;
> +
> +					dlmm_tpda_in27: endpoint {
> +						remote-endpoint = <&dlmm_tpdm0_out>;
> +					};
> +				};
> +
> +				port@1c {
> +					reg = <0x1c>;
> +
> +					dlmm_tpda_in28: endpoint {
> +						remote-endpoint = <&dlmm_tpdm1_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					dlmm_tpda_out: endpoint {
> +						remote-endpoint = <&dlmm_funnel_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@11805000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x11805000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					dlmm_funnel_in: endpoint {
> +						remote-endpoint = <&dlmm_tpda_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					dlmm_funnel_out: endpoint {
> +						remote-endpoint = <&tn_ag_in2>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@11810000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x11810000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_eva";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					eva_tpdm0_out: endpoint {
> +						remote-endpoint = <&eva_funnel_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@11813000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x11813000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					eva_funnel_in0: endpoint {
> +						remote-endpoint = <&eva_tpdm0_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					eva_funnel_out: endpoint {
> +						remote-endpoint = <&dlmm_tpda_in8>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@11860000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x11860000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_mdss1";
> +
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					mdss1_tpdm0_out: endpoint {
> +						remote-endpoint = <&mdss1_funnel_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@11864000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x11864000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					mdss1_funnel_in0: endpoint {
> +						remote-endpoint = <&mdss1_tpdm0_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					mdss1_funnel_out: endpoint {
> +						remote-endpoint = <&dlmm_tpda_in2>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@11870000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x11870000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_mdss0";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					mdss0_tpdm0_out: endpoint {
> +						remote-endpoint = <&mdss0_funnel_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@11874000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x11874000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					mdss0_funnel_in0: endpoint {
> +						remote-endpoint = <&mdss0_tpdm0_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					mdss0_funnel_out: endpoint {
> +						remote-endpoint = <&dlmm_tpda_in14>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpda@118c8000 {
> +			compatible = "qcom,coresight-tpda", "arm,primecell";
> +			reg = <0x0 0x118c8000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					nsp2_tpda_in0: endpoint {
> +						remote-endpoint = <&nsp2_tpdm0_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					nsp2_tpda_in1: endpoint {
> +						remote-endpoint = <&nsp2_tpdm1_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					nsp2_tpda_out: endpoint {
> +						remote-endpoint = <&nsp2_funnel_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@118c9000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x118c9000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					nsp2_funnel_in: endpoint {
> +						remote-endpoint = <&nsp2_tpda_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					nsp2_funnel_out: endpoint {
> +						remote-endpoint = <&tn_ag_in62>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpda@118e8000 {
> +			compatible = "qcom,coresight-tpda", "arm,primecell";
> +			reg = <0x0 0x118e8000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					nsp3_tpda_in0: endpoint {
> +						remote-endpoint = <&nsp3_tpdm0_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					nsp3_tpda_in1: endpoint {
> +						remote-endpoint = <&nsp3_tpdm1_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					nsp3_tpda_out: endpoint {
> +						remote-endpoint = <&nsp3_funnel_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@118e9000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x118e9000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					nsp3_funnel_in: endpoint {
> +						remote-endpoint = <&nsp3_tpda_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					nsp3_funnel_out: endpoint {
> +						remote-endpoint = <&tn_ag_in63>;
> +					};
> +				};
> +			};
> +		};
> +
> +		itnoc@11980000 {
> +			compatible = "qcom,coresight-itnoc";
> +			reg = <0x0 0x11980000 0x0 0x3080>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@12 {
> +					reg = <0x12>;
> +
> +					lpass_tn_in18: endpoint {
> +						remote-endpoint = <&lpass_stm_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					lpass_tn_out: endpoint {
> +						remote-endpoint = <&tn_ag_in38>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@11a03000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x11a03000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_swao_prio_4";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					aoss_tpdm4_out: endpoint {
> +						remote-endpoint = <&aoss_tpda_in4>;
> +					};
> +				};
> +			};
> +		};
> +
> +		funnel@11a04000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x11a04000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@6 {
> +					reg = <6>;
> +
> +					aoss_funnel_in6: endpoint {
> +						remote-endpoint = <&aoss_tpda_out>;
> +					};
> +				};
> +
> +				port@7 {
> +					reg = <7>;
> +
> +					aoss_funnel_in7: endpoint {
> +						remote-endpoint = <&qdss_funnel_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					aoss_funnel_out: endpoint {
> +						remote-endpoint = <&aoss_etf_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tmc@11a05000 {
> +			compatible = "arm,coresight-tmc", "arm,primecell";
> +			reg = <0x0 0x11a05000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					aoss_etf_in: endpoint {
> +						remote-endpoint = <&aoss_funnel_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					aoss_etf_out: endpoint {
> +						remote-endpoint = <&aoss_rep0_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		replicator@11a06000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x11a06000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					aoss_rep0_in: endpoint {
> +						remote-endpoint = <&aoss_etf_out>;
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
> +					aoss_rep0_out0: endpoint {
> +						remote-endpoint = <&aoss_rep1_in>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					aoss_rep0_out1: endpoint {
> +						remote-endpoint = <&eud_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		replicator@11a07000 {
> +			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
> +			reg = <0x0 0x11a07000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					aoss_rep1_in: endpoint {
> +						remote-endpoint = <&aoss_rep0_out0>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					aoss_rep1_out: endpoint {
> +						remote-endpoint = <&qdss_rep0_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpda@11a08000 {
> +			compatible = "qcom,coresight-tpda", "arm,primecell";
> +			reg = <0x0 0x11a08000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					aoss_tpda_in0: endpoint {
> +						remote-endpoint = <&aoss_tpdm0_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					aoss_tpda_in1: endpoint {
> +						remote-endpoint = <&aoss_tpdm1_out>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					aoss_tpda_in2: endpoint {
> +						remote-endpoint = <&aoss_tpdm2_out>;
> +					};
> +				};
> +
> +				port@3 {
> +					reg = <3>;
> +
> +					aoss_tpda_in3: endpoint {
> +						remote-endpoint = <&aoss_tpdm3_out>;
> +					};
> +				};
> +
> +				port@4 {
> +					reg = <4>;
> +
> +					aoss_tpda_in4: endpoint {
> +						remote-endpoint = <&aoss_tpdm4_out>;
> +					};
> +				};
> +
> +				port@5 {
> +					reg = <5>;
> +
> +					aoss_tpda_in5: endpoint {
> +						remote-endpoint = <&aoss_tpdm5_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					aoss_tpda_out: endpoint {
> +						remote-endpoint = <&aoss_funnel_in6>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@11a09000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x11a09000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_swao_prio_0";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					aoss_tpdm0_out: endpoint {
> +						remote-endpoint = <&aoss_tpda_in0>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@11a0a000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x11a0a000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_swao_prio_1";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					aoss_tpdm1_out: endpoint {
> +						remote-endpoint = <&aoss_tpda_in1>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@11a0b000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x11a0b000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_swao_prio_2";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					aoss_tpdm2_out: endpoint {
> +						remote-endpoint = <&aoss_tpda_in2>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@11a0c000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x11a0c000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_swao_prio_3";
> +
> +			qcom,cmb-element-bits = <64>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					aoss_tpdm3_out: endpoint {
> +						remote-endpoint = <&aoss_tpda_in3>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@11a0d000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x11a0d000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_swao1";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					aoss_tpdm5_out: endpoint {
> +						remote-endpoint = <&aoss_tpda_in5>;
> +					};
> +				};
> +			};
> +		};
> +
> +		cti@11a21000 {
> +			compatible = "arm,coresight-cti", "arm,primecell";
> +			reg = <0x0 0x11a21000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "cti_aoss";
> +		};
> +
> +		itnoc@12000000 {
> +			compatible = "qcom,coresight-itnoc";
> +			reg = <0x0 0x12000000 0x0 0x2e80>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@7 {
> +					reg = <7>;
> +
> +					ddr0_tn_in7: endpoint {
> +						remote-endpoint = <&ddr0_tpdm0_out>;
> +					};
> +				};
> +
> +				port@8 {
> +					reg = <8>;
> +
> +					ddr0_tn_in8: endpoint {
> +						remote-endpoint = <&ddr0_tpdm1_out>;
> +					};
> +				};
> +
> +				port@9 {
> +					reg = <9>;
> +
> +					ddr0_tn_in9: endpoint {
> +						remote-endpoint = <&ddr0_tpdm2_out>;
> +					};
> +				};
> +
> +				port@a {
> +					reg = <0xa>;
> +
> +					ddr0_tn_in10: endpoint {
> +						remote-endpoint = <&ddr0_tpdm3_out>;
> +					};
> +				};
> +
> +				port@b {
> +					reg = <0xb>;
> +
> +					ddr0_tn_in11: endpoint {
> +						remote-endpoint = <&ddr0_tpdm4_out>;
> +					};
> +				};
> +
> +				port@f {
> +					reg = <0xf>;
> +
> +					ddr0_tn_in15: endpoint {
> +						remote-endpoint = <&ddr0_tpdm8_out>;
> +					};
> +				};
> +
> +				port@10 {
> +					reg = <0x10>;
> +
> +					ddr0_tn_in16: endpoint {
> +						remote-endpoint = <&ddr0_tpdm9_out>;
> +					};
> +				};
> +
> +			};
> +
> +			out-ports {
> +				port {
> +					ddr0_tn_out: endpoint {
> +						remote-endpoint = <&tn_ag_in10>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@12003000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x12003000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_ddr0_shrm2";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					ddr0_tpdm4_out: endpoint {
> +						remote-endpoint = <&ddr0_tn_in11>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@12009000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x12009000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_ddr0_ch02";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					ddr0_tpdm8_out: endpoint {
> +						remote-endpoint = <&ddr0_tn_in15>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@1200c000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x1200c000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_ddr0_ch13";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					ddr0_tpdm9_out: endpoint {
> +						remote-endpoint = <&ddr0_tn_in16>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@1200e000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x1200e000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_ddr0_llcc_0";
> +
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					ddr0_tpdm0_out: endpoint {
> +						remote-endpoint = <&ddr0_tn_in7>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@1200f000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x1200f000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_ddr0_llcc_1";
> +
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					ddr0_tpdm1_out: endpoint {
> +						remote-endpoint = <&ddr0_tn_in8>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@12010000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x12010000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_ddr0_llcc_2";
> +
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					ddr0_tpdm2_out: endpoint {
> +						remote-endpoint = <&ddr0_tn_in9>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@12011000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x12011000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_ddr0_llcc_3";
> +
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					ddr0_tpdm3_out: endpoint {
> +						remote-endpoint = <&ddr0_tn_in10>;
> +					};
> +				};
> +			};
> +		};
> +
> +		itnoc@12200000 {
> +			compatible = "qcom,coresight-itnoc";
> +			reg = <0x0 0x12200000 0x0 0x2e80>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@7 {
> +					reg = <7>;
> +
> +					ddr1_tn_in7: endpoint {
> +						remote-endpoint = <&ddr1_tpdm0_out>;
> +					};
> +				};
> +
> +				port@8 {
> +					reg = <8>;
> +
> +					ddr1_tn_in8: endpoint {
> +						remote-endpoint = <&ddr1_tpdm1_out>;
> +					};
> +				};
> +
> +				port@9 {
> +					reg = <9>;
> +
> +					ddr1_tn_in9: endpoint {
> +						remote-endpoint = <&ddr1_tpdm2_out>;
> +					};
> +				};
> +
> +				port@a {
> +					reg = <0xa>;
> +
> +					ddr1_tn_in10: endpoint {
> +						remote-endpoint = <&ddr1_tpdm3_out>;
> +					};
> +				};
> +
> +				port@b {
> +					reg = <0xb>;
> +
> +					ddr1_tn_in11: endpoint {
> +						remote-endpoint = <&ddr1_tpdm4_out>;
> +					};
> +				};
> +
> +				port@f {
> +					reg = <0xf>;
> +
> +					ddr1_tn_in15: endpoint {
> +						remote-endpoint = <&ddr1_tpdm8_out>;
> +					};
> +				};
> +
> +				port@10 {
> +					reg = <0x10>;
> +
> +					ddr1_tn_in16: endpoint {
> +						remote-endpoint = <&ddr1_tpdm9_out>;
> +					};
> +				};
> +
> +			};
> +
> +			out-ports {
> +				port {
> +					ddr1_tn_out: endpoint {
> +						remote-endpoint = <&tn_ag_in89>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@12203000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x12203000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_ddr1_shrm2";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					ddr1_tpdm4_out: endpoint {
> +						remote-endpoint = <&ddr1_tn_in11>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@12209000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x12209000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_ddr1_ch02";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					ddr1_tpdm8_out: endpoint {
> +						remote-endpoint = <&ddr1_tn_in15>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@1220c000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x1220c000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_ddr1_ch13";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					ddr1_tpdm9_out: endpoint {
> +						remote-endpoint = <&ddr1_tn_in16>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@1220e000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x1220e000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_ddr1_llcc_0";
> +
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					ddr1_tpdm0_out: endpoint {
> +						remote-endpoint = <&ddr1_tn_in7>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@1220f000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x1220f000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_ddr1_llcc_1";
> +
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					ddr1_tpdm1_out: endpoint {
> +						remote-endpoint = <&ddr1_tn_in8>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@12210000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x12210000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_ddr1_llcc_2";
> +
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					ddr1_tpdm2_out: endpoint {
> +						remote-endpoint = <&ddr1_tn_in9>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@12211000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x12211000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_ddr1_llcc_3";
> +
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					ddr1_tpdm3_out: endpoint {
> +						remote-endpoint = <&ddr1_tn_in10>;
> +					};
> +				};
> +			};
> +		};
> +
> +		itnoc@12400000 {
> +			compatible = "qcom,coresight-itnoc";
> +			reg = <0x0 0x12400000 0x0 0x2e80>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@7 {
> +					reg = <7>;
> +
> +					ddr2_tn_in7: endpoint {
> +						remote-endpoint = <&ddr2_tpdm0_out>;
> +					};
> +				};
> +
> +				port@8 {
> +					reg = <8>;
> +
> +					ddr2_tn_in8: endpoint {
> +						remote-endpoint = <&ddr2_tpdm1_out>;
> +					};
> +				};
> +
> +				port@9 {
> +					reg = <9>;
> +
> +					ddr2_tn_in9: endpoint {
> +						remote-endpoint = <&ddr2_tpdm2_out>;
> +					};
> +				};
> +
> +				port@a {
> +					reg = <0xa>;
> +
> +					ddr2_tn_in10: endpoint {
> +						remote-endpoint = <&ddr2_tpdm3_out>;
> +					};
> +				};
> +
> +				port@b {
> +					reg = <0xb>;
> +
> +					ddr2_tn_in11: endpoint {
> +						remote-endpoint = <&ddr2_tpdm4_out>;
> +					};
> +				};
> +
> +				port@f {
> +					reg = <0xf>;
> +
> +					ddr2_tn_in15: endpoint {
> +						remote-endpoint = <&ddr2_tpdm8_out>;
> +					};
> +				};
> +
> +				port@10 {
> +					reg = <0x10>;
> +
> +					ddr2_tn_in16: endpoint {
> +						remote-endpoint = <&ddr2_tpdm9_out>;
> +					};
> +				};
> +
> +			};
> +
> +			out-ports {
> +				port {
> +					ddr2_tn_out: endpoint {
> +						remote-endpoint = <&tn_ag_in107>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@12403000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x12403000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_ddr2_shrm2";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					ddr2_tpdm4_out: endpoint {
> +						remote-endpoint = <&ddr2_tn_in11>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@12409000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x12409000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_ddr2_ch02";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					ddr2_tpdm8_out: endpoint {
> +						remote-endpoint = <&ddr2_tn_in15>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@1240c000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x1240c000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_ddr2_ch13";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					ddr2_tpdm9_out: endpoint {
> +						remote-endpoint = <&ddr2_tn_in16>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@1240e000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x1240e000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_ddr2_llcc_0";
> +
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					ddr2_tpdm0_out: endpoint {
> +						remote-endpoint = <&ddr2_tn_in7>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@1240f000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x1240f000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_ddr2_llcc_1";
> +
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					ddr2_tpdm1_out: endpoint {
> +						remote-endpoint = <&ddr2_tn_in8>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@12410000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x12410000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_ddr3_llcc_2";
> +
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					ddr2_tpdm2_out: endpoint {
> +						remote-endpoint = <&ddr2_tn_in9>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@12411000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x12411000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_ddr3_llcc_3";
> +
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					ddr2_tpdm3_out: endpoint {
> +						remote-endpoint = <&ddr2_tn_in10>;
> +					};
> +				};
> +			};
> +		};
> +
> +		itnoc@12600000 {
> +			compatible = "qcom,coresight-itnoc";
> +			reg = <0x0 0x12600000 0x0 0x2e80>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@7 {
> +					reg = <7>;
> +
> +					ddr3_tn_in7: endpoint {
> +						remote-endpoint = <&ddr3_tpdm0_out>;
> +					};
> +				};
> +
> +				port@8 {
> +					reg = <8>;
> +
> +					ddr3_tn_in8: endpoint {
> +						remote-endpoint = <&ddr3_tpdm1_out>;
> +					};
> +				};
> +
> +				port@9 {
> +					reg = <9>;
> +
> +					ddr3_tn_in9: endpoint {
> +						remote-endpoint = <&ddr3_tpdm2_out>;
> +					};
> +				};
> +
> +				port@a {
> +					reg = <0xa>;
> +
> +					ddr3_tn_in10: endpoint {
> +						remote-endpoint = <&ddr3_tpdm3_out>;
> +					};
> +				};
> +
> +				port@b {
> +					reg = <0xb>;
> +
> +					ddr3_tn_in11: endpoint {
> +						remote-endpoint = <&ddr3_tpdm4_out>;
> +					};
> +				};
> +
> +				port@f {
> +					reg = <0xf>;
> +
> +					ddr3_tn_in15: endpoint {
> +						remote-endpoint = <&ddr3_tpdm8_out>;
> +					};
> +				};
> +
> +				port@10 {
> +					reg = <0x10>;
> +
> +					ddr3_tn_in16: endpoint {
> +						remote-endpoint = <&ddr3_tpdm9_out>;
> +					};
> +				};
> +
> +			};
> +
> +			out-ports {
> +				port {
> +					ddr3_tn_out: endpoint {
> +						remote-endpoint = <&tn_ag_in159>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@12603000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x12603000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_ddr3_shrm2";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					ddr3_tpdm4_out: endpoint {
> +						remote-endpoint = <&ddr3_tn_in11>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@12609000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x12609000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_ddr3_ch02";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					ddr3_tpdm8_out: endpoint {
> +						remote-endpoint = <&ddr3_tn_in15>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@1260c000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x1260c000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_ddr3_ch13";
> +
> +			qcom,dsb-element-bits = <32>;
> +			qcom,dsb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					ddr3_tpdm9_out: endpoint {
> +						remote-endpoint = <&ddr3_tn_in16>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@1260e000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x1260e000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_ddr3_llcc_0";
> +
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					ddr3_tpdm0_out: endpoint {
> +						remote-endpoint = <&ddr3_tn_in7>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@1260f000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x1260f000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_ddr3_llcc_1";
> +
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					ddr3_tpdm1_out: endpoint {
> +						remote-endpoint = <&ddr3_tn_in8>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@12610000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x12610000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_ddr3_llcc_2";
> +
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					ddr3_tpdm2_out: endpoint {
> +						remote-endpoint = <&ddr3_tn_in9>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tpdm@12611000 {
> +			compatible = "qcom,coresight-tpdm", "arm,primecell";
> +			reg = <0x0 0x12611000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +			label = "tpdm_ddr3_llcc_3";
> +
> +			qcom,cmb-element-bits = <32>;
> +			qcom,cmb-msrs-num = <32>;
> +
> +			out-ports {
> +				port {
> +					ddr3_tpdm3_out: endpoint {
> +						remote-endpoint = <&ddr3_tn_in10>;
> +					};
> +				};
> +			};
> +		};
> +
> +		apps_smmu_0: iommu@15a00000 {
> +			compatible = "qcom,nord-smmu-500",
> +				     "qcom,smmu-500",
> +				     "arm,mmu-500";
> +			reg = <0x0 0x15a00000 0x0 0x100000>;
> +			#iommu-cells = <2>;
> +			#global-interrupts = <1>;
> +			dma-coherent;
> +			interrupts = <GIC_SPI 886 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 32 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 33 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 34 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 35 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 36 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 37 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 38 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 39 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 40 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 41 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 42 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 43 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 44 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 45 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 46 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 47 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 48 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 49 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 50 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 51 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 52 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 53 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 54 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 55 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 56 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 57 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 58 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 59 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 60 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 61 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 62 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 63 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 64 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 65 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 66 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 67 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 68 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 69 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 70 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 71 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 72 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 73 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 74 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 75 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 76 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 77 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 78 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 79 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 80 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 81 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 82 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 83 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 84 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 85 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 86 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 87 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 88 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 89 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 90 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 91 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 92 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 93 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 94 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 95 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 96 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 97 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 98 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 99 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 100 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 101 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 102 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 103 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 104 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 105 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 106 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 107 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 108 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 109 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 110 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 111 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 112 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 113 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 114 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 115 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 116 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 117 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 118 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 119 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 120 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 121 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 122 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 123 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 124 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 125 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 126 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 127 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		apps_smmu_1: iommu@15c00000 {
> +			compatible = "qcom,nord-smmu-500",
> +				     "qcom,smmu-500",
> +				     "arm,mmu-500";
> +			reg = <0x0 0x15c00000 0x0 0x100000>;
> +			#iommu-cells = <2>;
> +			#global-interrupts = <1>;
> +			dma-coherent;
> +			interrupts = <GIC_SPI 882 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 128 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 129 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 130 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 131 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 132 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 133 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 134 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 135 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 136 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 137 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 138 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 139 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 140 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 141 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 142 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 143 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 144 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 145 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 146 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 147 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 148 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 149 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 150 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 151 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 152 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 153 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 154 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 155 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 156 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 157 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 158 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 159 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 160 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 161 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 162 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 163 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 164 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 165 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 166 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 167 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 168 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 169 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 171 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 172 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 173 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 174 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 175 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 176 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 177 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 178 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 179 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 180 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 181 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 182 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 183 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 184 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 185 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 186 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 187 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 188 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 189 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 190 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 191 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 192 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 193 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 194 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 195 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 196 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 197 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 198 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 199 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 200 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 201 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 202 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 203 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 204 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 205 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 206 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 207 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 208 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 209 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 210 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 211 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 212 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 213 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 214 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 215 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 216 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 217 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 218 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 219 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 220 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 221 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 222 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 223 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		apps_smmu_2: iommu@15e00000 {
> +			compatible = "qcom,nord-smmu-500",
> +				     "qcom,smmu-500",
> +				     "arm,mmu-500";
> +			reg = <0x0 0x15e00000 0x0 0x100000>;
> +			#iommu-cells = <2>;
> +			#global-interrupts = <1>;
> +			dma-coherent;
> +			interrupts = <GIC_SPI 877 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 224 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 225 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 226 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 227 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 228 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 229 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_ESPI 230 IRQ_TYPE_LEVEL_HIGH>,
>   				     <GIC_ESPI 231 IRQ_TYPE_LEVEL_HIGH>,
>   				     <GIC_ESPI 232 IRQ_TYPE_LEVEL_HIGH>,
>   				     <GIC_ESPI 233 IRQ_TYPE_LEVEL_HIGH>,
> @@ -2980,6 +5948,126 @@ compute-cb@13 {
>   		};
>   	};
>   
> +	tpdm-nsp0-cdsp-llm {
> +		compatible = "qcom,coresight-static-tpdm";
> +		label = "tpdm_nsp0_cdsp_llm";
> +
> +		qcom,cmb-element-bits = <32>;
> +
> +		out-ports {
> +			port {
> +				nsp0_tpdm0_out: endpoint {
> +					remote-endpoint = <&nsp0_tpda_in0>;
> +				};
> +			};
> +		};
> +	};
> +
> +	tpdm-nsp0-cdsp-llm-2 {
> +		compatible = "qcom,coresight-static-tpdm";
> +		label = "tpdm_nsp0_cdsp_llm_2";
> +
> +		qcom,cmb-element-bits = <32>;
> +
> +		out-ports {
> +			port {
> +				nsp0_tpdm1_out: endpoint {
> +					remote-endpoint = <&nsp0_tpda_in1>;
> +				};
> +			};
> +		};
> +	};
> +
> +	tpdm-nsp1-cdsp-llm {
> +		compatible = "qcom,coresight-static-tpdm";
> +		label = "tpdm_nsp1_cdsp_llm";
> +
> +		qcom,cmb-element-bits = <32>;
> +
> +		out-ports {
> +			port {
> +				nsp1_tpdm0_out: endpoint {
> +					remote-endpoint = <&nsp1_tpda_in0>;
> +				};
> +			};
> +		};
> +	};
> +
> +	tpdm-nsp1-cdsp-llm2 {
> +		compatible = "qcom,coresight-static-tpdm";
> +		label = "tpdm_nsp1_cdsp_llm2";
> +
> +		qcom,cmb-element-bits = <32>;
> +
> +		out-ports {
> +			port {
> +				nsp1_tpdm1_out: endpoint {
> +					remote-endpoint = <&nsp1_tpda_in1>;
> +				};
> +			};
> +		};
> +	};
> +
> +	tpdm-nsp2-cdsp-llm {
> +		compatible = "qcom,coresight-static-tpdm";
> +		label = "tpdm_nsp2_cdsp_llm";
> +
> +		qcom,cmb-element-bits = <32>;
> +
> +		out-ports {
> +			port {
> +				nsp2_tpdm0_out: endpoint {
> +					remote-endpoint = <&nsp2_tpda_in0>;
> +				};
> +			};
> +		};
> +	};
> +
> +	tpdm-nsp2-cdsp-llm2 {
> +		compatible = "qcom,coresight-static-tpdm";
> +		label = "tpdm_nsp2_cdsp_llm2";
> +
> +		qcom,cmb-element-bits = <32>;
> +
> +		out-ports {
> +			port {
> +				nsp2_tpdm1_out: endpoint {
> +					remote-endpoint = <&nsp2_tpda_in1>;
> +				};
> +			};
> +		};
> +	};
> +
> +	tpdm-nsp3-cdsp-llm {
> +		compatible = "qcom,coresight-static-tpdm";
> +		label = "tpdm_nsp3_cdsp_llm";
> +
> +		qcom,cmb-element-bits = <32>;
> +
> +		out-ports {
> +			port {
> +				nsp3_tpdm0_out: endpoint {
> +					remote-endpoint = <&nsp3_tpda_in0>;
> +				};
> +			};
> +		};
> +	};
> +
> +	tpdm-nsp3-cdsp-llm2 {
> +		compatible = "qcom,coresight-static-tpdm";
> +		label = "tpdm_nsp3_cdsp_llm2";
> +
> +		qcom,cmb-element-bits = <32>;
> +
> +		out-ports {
> +			port {
> +				nsp3_tpdm1_out: endpoint {
> +					remote-endpoint = <&nsp3_tpda_in1>;
> +				};
> +			};
> +		};
> +	};
> +
>   	arch_timer: timer {
>   		compatible = "arm,armv8-timer";
>   		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,

