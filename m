Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA415399CF5
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459762; cv=none; b=aKx+mxU3Kxehv+v/gtBGl6CuGu0pZgrJISIe8teDMSOsvMbUR/wpp16H9CnVAgqg4D9wgTZwXGkSi5/wxAl3mlYD26rIXCgPSXcfRsiZ3OeKWHLdIXamqOPmZfn1OlpVvsmEqsW/4N4SpcWZQTsGA04fh0HDNeWu0xKMWqoufE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459762; c=relaxed/simple;
	bh=rAAdHLym2FN+o7S3RNpBgLFr76WhG/xObeJLRgMQXwA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=StFhtrIvv9qI7J7v/5LuDdlXnh+ifZ8xJ5PJyEsnd+q+t3ibl9fUrvg7PaSuYzmiBDBTdx/NGFiEcRrgbreS6Fo7TTjIpygatsEdc8tjBQXVFfhEPqjeAjipMrfRQtUuTHfehgrG72RR3wgjw70FDTiGnCxVraRsIgajExmyCCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VYXQNjIf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OveaWoJR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VYXQNjIf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OveaWoJR"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZBYM2983710
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:09:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tpaVpZ9TMQ7KxT/IdqbwJ3eUb6+wAqR88lGfCuc/y14=; b=VYXQNjIf84mbQFeK
	NLnU51p4T3rJmVDgbFAURO3gpopMH+5Ik3gvd0BIND3o5+vJXbky1DB7BiqY7IJw
	Ja83cySsFPD+RT6zFfP9ZWD6HBDtN4+++bQMn5YKUmO/oxX/zcfQ2ox8Wr/sE1fL
	UDZeCDo5NLeUnqWLuEshZyFYUFos5MRMjd/M2mXG5ZKncMYa1/zZGPiQefMupCXG
	vanNZrubLnB8dXBIZWKhxcFBDcbO73ZSkHnOoXJuFcp9zhUALFWY/JQQOmhXQtKR
	kv92AfdHA3xWG5l7+oyHp+5tKLZdgVi4GnJCV2akrMISbOZAbY97smjjsAG1YmLO
	6l/kXQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpnet36w1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:09:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc73f47bdcso54035485ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789459759; x=1790064559; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tpaVpZ9TMQ7KxT/IdqbwJ3eUb6+wAqR88lGfCuc/y14=;
        b=OveaWoJR5R+WlTN45NIAa8Oa/oB2LTWpSq3wxUoS62yww5OaAJQ+HC2RIm0yKKUCY0
         GCRdnr64NQCgad0ktnLthW1hjc0tw6Uh5Bb9fYvidDzCfR/rwf0yWwW+QBwo/Qy3Q84l
         YGLmfoYaKZXqGy6cYEqDTyRGznnQjail0cxlWgnjN2out8CD48zAktKfUXH9dMzY0xV9
         MjIqXPn3waInP1dhNd7iBVc+6IAavam0JIsT5aTIS2vO+EVk09fb1lUGyoZHNI2IUS+y
         BW29xC1kKPODn+OrmeJ7mwrB+4bdPzxeL4EzbyyLP5LOMJ0TMzGNCyy13mCl0Lt4X7eL
         Y70Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459759; x=1790064559;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tpaVpZ9TMQ7KxT/IdqbwJ3eUb6+wAqR88lGfCuc/y14=;
        b=sOYur7ERAc6KtPlZqug9NEKXPj9cvaroRer+HAIpAhzXbx62hPwGDeEuDG6aFY6mC4
         1O/Hm7rDkBheLpteoXUuFd5EbeBWLlNii6GavDsS1Fi/rEVa6LU72frmf0Na+Trj6pE1
         gKPtM17KiMJ1D1+ZvX1FBfCVl7MPMWDgxxSeaRCzVL8nern9/E9MMGVtJcK6Zg+y9oLI
         Z8yi8SRTLuRKgmMTzxIdweepSdgqgmiifosQljt3s117+UIx1UrdbtLkykWq4fJOM2vt
         7wgz+m6o4aCmDOX9G7pMkRhxMr8n48U/mCZrUFDXUu7/jDVadwwAbSjILTabCUXaShwz
         HGiw==
X-Forwarded-Encrypted: i=1; AKwUvBx/Ok1Jv60nFEXSz8kq13EBAsH+RPS/w/ppMLohBbFpjRmlwgXcFBbBzmP3RpgFcRzm8MiA5YbhRvOXQzQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kySwmba33WlNyz8fiJm2S8Xm+nfOgu9WIn4EgmzQFgy0vxpyYN
	vQpvFj9Cut2ndKcu+gVtQLukncmmEYPSNBiU+o+C+Rj+kCCxHMOklDDMZDl9HUWM4ZIN+H/9hsh
	HklfFhNqYkOpnW3QVzkStwKu5b9r732MCEai3jPd5IWEooSn10PIzXnptI0OT9/Z16Nw=
X-Gm-Gg: AYBFou3YxSD7ToPxLuAIi69qWo9SGfKdirR31pSasw6w87xunD9SXqL5H6zeUKcfkqq
	Pv+N7VnEfHWgFUFLV//vMyR48HJV05ijpYH8VGZTT8gSqlLrcCuERa5kFdly5bQHwybNvdzEiAC
	wAk41U4C0v45K6532t1cLMeSv1EMeGL9he1DANwlh4/3pafv7LJH+Om0yTUsO70CoezcNPI7Hv7
	Q5UTvdegyNTsKdkGHTop7OqV6hABUltmkQhsqP1oAa1d0g78lgelDRiQXHX4JzFcvXWGH9vqcJ8
	dr4GE9QxoevK0ch8g/Uu1uxQYMKfsFcF1Lq/npYP3+GrLZFrMuRePuwz1SbJXY7yjdXrQU52Pzu
	dOvIwgXk7NV1e3gNYiYBTW0/FPS5fC0zTwnbiFBe8YGmz/lLABDdS76lryhm8/cjtTQ==
X-Received: by 2002:a17:902:e746:b0:2cf:8131:75e8 with SMTP id d9443c01a7336-2dd6c6dae8emr125564535ad.13.1789459759480;
        Tue, 15 Sep 2026 01:09:19 -0700 (PDT)
X-Received: by 2002:a17:902:e746:b0:2cf:8131:75e8 with SMTP id d9443c01a7336-2dd6c6dae8emr125562705ad.13.1789459758136;
        Tue, 15 Sep 2026 01:09:18 -0700 (PDT)
Received: from [10.133.33.124] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cff297esm61574725ad.73.2026.09.15.01.09.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 01:09:16 -0700 (PDT)
Message-ID: <4dc33440-133b-4b81-b460-4484d9829aee@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 16:09:12 +0800
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
References: <20260714-add-etr-ctcu-for-kaanapali-v1-1-be5cd7a3c656@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260714-add-etr-ctcu-for-kaanapali-v1-1-be5cd7a3c656@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfXxIsaU39jDE6o
 kmyqsH0QH+n+V2hTgCJiyOuitiFtPl6wdDiIFbYVP70mYXDA3z1OPUPh90eQwv8zcjpzb6EwhJK
 KkBg99Zint9F/NtLnGrznV7EiA/QrJo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfX7qzAKLH6VIXE
 S6AgG19g87Zj5e3QYxAK/n1Y7wgByiA8hJFuC6EJYhzikoYUpUHVDcU+mAp7jOvSfGkDDhjJF8g
 3xvvUlXa9klolhHtzZ1nYV2u692YU9dWK2OJLvjeqCZAie37rsOkorPsg3RYKleRNxbkXhgn8tX
 ubKZoE9eB7tOchJVAcgyinvYXjSEz/qFwR6A2BD6GjkMv94DExYqbxoRdLD28rVBje8RyYPSzBO
 OGUFh6tZdyXRkTy258r27nBr1GWezk3l0PM5AGMTkwbCslk0J/bYGRormxsXqcOnDWbC7xpD2Gt
 JfNUdGlVDW0BKVDnLuZOBt/Y7FFMScYKIUENicmYPe1GzAFyNpqVROC8tMjLLrl7pjV3mFI9yAL
 8Pkdg68/2G6sx92rbShsp+buTH4W+vK3gEUn61qVOsdrMwmRxTU3nZnzz8FfaQqMoXZY2t0sIae
 Tj8oQ71M+TIEuSc3pgg==
X-Authority-Analysis: v=2.4 cv=PKKaavqC c=1 sm=1 tr=0 ts=6aa8fd30 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=YSVC6_zYCsoJ3GjGXcEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: dEbyQzrrqMh9Qk76deOWkzoel3iKPDy1
X-Proofpoint-ORIG-GUID: dEbyQzrrqMh9Qk76deOWkzoel3iKPDy1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150116



On 7/14/2026 4:05 PM, Jie Gan wrote:
> Embedded Trace Router(ETR) is working as a DDR memory sink to collect
> tracing data from source device and the CTCU device serves as the
> control unit for the ETR device.
> 

Gentle ping.

> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/kaanapali.dtsi | 176 ++++++++++++++++++++++++++++++++
>   1 file changed, 176 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> index 0bf664cd4b40..07a0b00dfb62 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -4984,6 +4984,35 @@ card-detect-pins {
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
> @@ -5123,6 +5152,121 @@ funnel_in0_out: endpoint {
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
> @@ -5937,6 +6081,38 @@ tmc_etf_in: endpoint {
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
> +				port {
> +					replicator_swao_out0: endpoint {
> +						remote-endpoint = <&replicator_qdss_in>;
> +					};
> +				};
> +			};
>   		};
>   
>   		tpda@11308000 {
> 
> ---
> base-commit: 49362394dad7df66c274c867a271394c10ca2bb8
> change-id: 20260714-add-etr-ctcu-for-kaanapali-9aa6b297778c
> 
> Best regards,

