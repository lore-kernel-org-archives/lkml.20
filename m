Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794187632;
	b=5BJAPUfp/hF8Twhp6XIAMKLEA6McFNj29YN+ioZvEw6YGP0boXJWtCOMTg7HKO9Qgapc
	 RLtKptPoMibrUoc773TFbAMCpo1TAFXOz4xhQDJ4o5SP+zNyyY6x20odyZKFms9zcx45n
	 BlkC8kZ7jhYB48d+j+Z/ThZ/Ypmuf9MlMiSbujixvL8sCx+AcmvdP8kvzgqdb3RVaiCFq
	 Tgl3ljkCo94Tn206Vf5iiy/wyhjbb6Ro5qQfJHj04kQVGwqsh4YcZZzeWKHwzwo4YVXow
	 dO/emNm2XktK0Wfrc9zdLH40eqOFHDzw3MwRmO2n3YzKIDjjyGLczWdcE8SOZzU8oTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794187632;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jfX+cmgP82B3aCyhKwCfQeHgXLK2SAElFUtKlcxsR6w=;
	b=uM/4PSe75/dQWph+dReFli50VPd06Fa99OKnGscnTU7Zg7039ZuZMwBI85lA2A0pmRzV
	 O3cJIUZIWv3qCE9R9D4jxaSOu4ejAq6htWwSkWed4pD/+TmLsungp4nlJB+NAbuE72m8+
	 zTs8PuGpsi7Nx4JVUCFO8WwwRBJ02aUGYHf5GMNvRdVcJyBxDxh9l0wI3MOFr1lXGuh+U
	 A8+i/0VbjkmsY5DqAn4+UlwMSrpMHG6W/CKtoR8xn27+FQufhmcX2G74Fmi2Rd8EzlbiY
	 l08u3ipv4UVaAhVgVr07KmTBJwlXrVr2FD93xbwDKWRIF6kOF0id6N5+/mPhdNO8Zjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ivzqmk4q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kGgQ88zW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2D3606CCDC
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 01:27:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D2D3606CCDC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ivzqmk4q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kGgQ88zW
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A90Gwqx2871666
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 01:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jfX+cmgP82B3aCyhKwCfQeHgXLK2SAElFUtKlcxsR6w=; b=ivzqmk4qatGy7/8L
	pLEEN1KfCxLLvehzD0iWk65u59aIkb/85qaOzfFP33vx18Lwi71Iiib8mU+BfFrg
	sucNpt3FqbPPiwg0KzoMFBdcWDtO8drXrUG1KXVUDK9bm8g/2P5sqJlS4Nvk/+aT
	/wKzAOcShXmUUObmS2m/sESClLGgyMp7ZTSW6NGeHFiR+lXYBhUKTiVySwoHX7cZ
	q2HsQMqNRDavn6iHO6eCxsXtTJHgAcho4wyF5mt0jJunIPjVppDve9rGYK6GZ0ye
	yFKyQEfpn5krI1dORx4K6VOaXLxsK3ZC4dCvNHiD50SAYBShGobrtxaC6EDO6NqQ
	vP2BvA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hssbnvkrv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:27:10 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2eb2437d752so7435175ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 17:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794187629; x=1794792429; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jfX+cmgP82B3aCyhKwCfQeHgXLK2SAElFUtKlcxsR6w=;
        b=kGgQ88zWxnxsIrO2j1jKbJ/PgsLfMr3de6VbcOkrp4VOopGjsfyHma6v2PtCaZIS20
         34avhDxoxYdBDw+EwTKGd/xGyFYXBQ7mRAl9vjd4RDpVN1kmMDhZu9ymmEWRQXf50m7n
         xtASgIuTN0+lWgwbw+Tvw0YVKTKyPrkDA4EwEqK7c4gX28WiNKLXuZPGkA+yffJyrqYU
         rWq27dr9vTunOGTikLv7oiNBe+dziyj17u9PNxT02HUxeVepuTzC/r9Kjywe5N10POql
         32ixMTtGNuk54cq5+SrlzMzr1M5foCe+9tMQ7L5/zkh1diW+SSL8Gqe80Lh+IKstwK4v
         KngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794187629; x=1794792429;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jfX+cmgP82B3aCyhKwCfQeHgXLK2SAElFUtKlcxsR6w=;
        b=nf6AOOxAf1u+H6nQFQ5/vn++D8WdlfW8V8AnPscCOZzk/7kMKIBk0vJ17JNLD4Uf/B
         s6OnS7rLZ+glfr3CArpzAKCnAmKnkspCehE+l/Jpy5+ROWBLk8IB9lxABURyQTrD7P6M
         X9KPewej/5rC8ArkWiwmQ5iJ39Vu+BHIict4lF7jPh6DcGZqUMArZ6sQI5pbp4Cl2thk
         qyser38Gi4UNDv8A/IZesnQ/bkPmGeOZuJ9fxyFMW2xpDhXbYZLcqJY4B0QIkpO4jx6p
         foxFE0JrDSeLfJ1xwb8NYmYunrDa0uJFpWWR6OQU+qkDDpUNtwutPr6XVKD8HK285vNh
         poYw==
X-Forwarded-Encrypted: i=1; AL+hErGkDga/xLPRiJJi/5FJvl6oi82yKZDC6zjhE1RXoRX/f3DuI5PGwC5eJYuX88Qu0i1vMeUu8TiL+8r/ZW4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MjCriLObBgIxSAeADuBGHfQFfjMX610adIATR6FclENUTAwD0
	e9DI2EYYIhQw18WR/cYGMgGKkYqkqsJ1Z3cEBTgb55ILVdg5MLVzR3C2Auvo9RivEaSvk0TfM7/
	jJbQhnJi0DuhAqekReumKLWors7l2ryllbnDoCXIIrmURFDj055NU+Khtv40EEIbvSZeXlS447X
	k=
X-Gm-Gg: AYBFou33CuNMHY1bzorOwSJqTJfEyGD4GpLsRognqDGZNYl+AuwtoheSehm81u47Z9P
	YO0DFytjX8d1BVit5oVZhR/SsPHNfVRyBf3SnBci8huqrukntVTtdmzOf2QZAXGFRZqdSyOy3s+
	Upp9amPmVYY7YpYH90DEehRPrRUlW5S05Tlxr3dsYVKd8GW+sz/oP75GwwdAmeXFQ0nUNtJQs0U
	qSKZDwkTHhd1nZnZHEXXzLX+9tI0oeXmJHLtyfFtALyfWRVZipAovUkh6YsmFrYLIWMC3wbcDK1
	FGG1r7dM2iPkEV1t1l+eE8dj2FJWZaDyZuaVDU2eoWaTJJvTfwKonRm5DhwK/aF7DtW6xLr6ZCo
	/VuTBzwm5KNDo39Mq/iRxKvC1pCKBydkui+EItMQPQ9tU0yWfcqO0useUDfe4Qq7V1RXj
X-Received: by 2002:a17:903:90b:b0:2e2:cc25:b232 with SMTP id d9443c01a7336-2ed837970d0mr30013425ad.42.1794187629339;
        Sun, 08 Nov 2026 17:27:09 -0800 (PST)
X-Received: by 2002:a17:903:90b:b0:2e2:cc25:b232 with SMTP id d9443c01a7336-2ed837970d0mr30013235ad.42.1794187628850;
        Sun, 08 Nov 2026 17:27:08 -0800 (PST)
Received: from [10.64.68.243] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed815e7416sm6269005ad.17.2026.11.08.17.27.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 17:27:08 -0800 (PST)
Message-ID: <adfa64cb-bcdb-4dba-bb23-bd71f64f0825@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 09:27:04 +0800
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
X-Proofpoint-GUID: 9dvGR3IYDbezs1DShq7AKZGQwVMoX5k3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAwNSBTYWx0ZWRfXyNUgOzgJdHwt
 aDZW+7AgJgJTZF7ZNvUqxS4nIUvaUhocAnenh8MNBZQrNRuPu6Zs4CY6khuDfSnbXE7PRtkdlo1
 WM2yhFhE5rop2HcHmOa6fVbI8sN0IqGbhgsuUdKyfza7n2X7J83O+MBlUgei8BwyxLyt5nh82j5
 2WhJMN0fuVsHcgrkAXeuwgg1YxnwFb6/FYx8pb1vuSpLzmyszBoA7n9Sui5E+m6CZJGAl2FzkT3
 qVRYDzsS7E7TJ6u9ksJKlkWSrCbClVL8XXtVfpx7ruy7WFYRZTrOMavpuytCty59aTkzeIC6Rk5
 9NwTCC5ZNIZbq1O9Gf/S29ykvlyWcojHF7X2t2NOZUfEIaCOUxYnv9mbBb8ct+QLcg0t/0/HchU
 SBD752/9tzCieLGrX8G/aMuhZp32uqP+veHeL6ROCH0CNyDe5MY7OWAZhFxlh/dgPqvKV/AY175
 Dkgoaz3IFtYC6fhSQxg==
X-Proofpoint-ORIG-GUID: 9dvGR3IYDbezs1DShq7AKZGQwVMoX5k3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAwNSBTYWx0ZWRfX6lca0u6KrseN
 YgiDmEgxm+I+77+nDat6v7R3p21vJS1R4o0PlfOzT0RpMqgxq08n59iLHEjwvGGVzG1C7NXrKg7
 Ba3pPNRgb0Q7z1Mvl7bnDbZaOC6yVXE=
X-Authority-Analysis: v=2.4 cv=JtBkP84C c=1 sm=1 tr=0 ts=6af1216e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=YSVC6_zYCsoJ3GjGXcEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090005



On 7/14/2026 4:05 PM, Jie Gan wrote:
> Embedded Trace Router(ETR) is working as a DDR memory sink to collect
> tracing data from source device and the CTCU device serves as the
> control unit for the ETR device.
> 

Gentle ping

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

