Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572471;
	b=DiB38Wqi3uNb9D8UiP9ZmvU4khQSmOO9xzU1TXoYY1YbPp9futubnl5qV5lsGLp3ZM1k
	 +oyKUvXozlzfjOV1lI7mHJSyzSm9GNwF8G/PdNDGyUr1phwd3wJ7kw9SXEoZbTnf9sOou
	 Bw2AEDH7SAsvpJAcl9y71K40eoFfEe0MQghKjEtc1OQ7kc9uRjzfr7tjOg6Lq/HrQc5f5
	 SkWzksEzFvLh2F9eAG3uOo5THzBg/fYs5nlkucGDxPpliv89YidQqRXNo+/aCDUmy1AeY
	 DGjIhvVgb2SAjwpMnC9R5fRICfcLaF8SMaux4kjzD+cRGa3BNf/10pYnFVAdJgF4LGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572471;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pG9vj6XOwWDXLxXoLIb6OdQtRsi1P7BC5Ut/7SiedUs=;
	b=ajtLiACMmsgetaqqd6xUyybCg9n0KCeP1ZZUDJuIE+Kge9OatDhMuincTq2ctR7wJORV
	 ZnCIladj6J3Jfv3TPJ/CquyHSb4f5woc7JBqLdGg5HuoNjcR5JO0eE2zTaxeNKqSkPNlV
	 vSp5kxynxrQYMPuWbavtWxujwomBcPQJZvctMlbQyOydgfbSxXZH80AEGI3Hjr1pP+eh/
	 PhDX3pkc94VAKChbAe7mXQYjUKK9tznaXMvb6INCqD+vFbHu8VCgX1ZdiYgx7Z2GqgYPI
	 ILFCUX/qNgEjS8nZB15EMUVKGp1ibCC90EZzjvtnG8nmdVkD4H5w1vS0/07l4MwHVIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K3uW5ujb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DQjmEXwT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC06606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:47:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CC06606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K3uW5ujb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DQjmEXwT
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j1xi3355622
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:47:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pG9vj6XOwWDXLxXoLIb6OdQtRsi1P7BC5Ut/7SiedUs=; b=K3uW5ujbaT0z0lVj
	OCoyYnRNMSkhrgdLNgNhN03+XjvEvsRLo7L4Ci3bAchVdYsdLxq9Qe+IEQN/MzSd
	EPHQdy8ctK2jnncW4rYcQr9Jn7qS8hpEKS2vSg5qUm0QPvtBTtYAXDBwhlgy0VlO
	tSBkeguAjSPl1EBjyWa0TF+tb+iXJf69PKU03cFxpmZAzC2eSdvbtEOQ9+tYZTlL
	HiJstQX1RZZ9umFxkUGQ697KsfYHD/wUuupG6shas5b2LQ8nCMsPXavM3KwVtFB0
	yHJwrecf/K0Ot30t9m7gccWaf6CaFoIYMYhHGhHbTbW6L3TYpAz4Ea3a587ybkjC
	Xgr/OQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0k11r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:47:48 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3548cdfd2fbso766694eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792572468; x=1793177268; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pG9vj6XOwWDXLxXoLIb6OdQtRsi1P7BC5Ut/7SiedUs=;
        b=DQjmEXwTEqmOqvERU+m56rPGt5gnbf0Jf9Bow5yTP1BggNrjWnaBS7eGzfeptu0bF/
         TXIWU8hT5aTX1fBwRFhagbbbhMBKZE40LNGQ/l7tennwifQGO8QCumd+fgIH50Ufjb+S
         f6uhnnGEjjNzY2M1HVr6fcFViyNCQv+h3VzFl35Dv7khho7CMMzedmHP4D3aEk0ROT20
         uBEsBTDbAo66RhPe9XcM8OdzYuuNXZlswqByOwLo7wqdT2hoHgLvDYxXezcXX22A4ve/
         N49OBxReJTdu1AbT9Phqi+bz1m73p4oLPRpu3Wmj8NVutZJrAG6hBLZ/IpIzTAi5wA6s
         tUlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572468; x=1793177268;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pG9vj6XOwWDXLxXoLIb6OdQtRsi1P7BC5Ut/7SiedUs=;
        b=sQb/HA2hJSnJcNgCuEAy2Q9HdbSc90r54z4hNLfLXXv3l28uzJ8ZB7mhP0ASDpKPDn
         LMbRHucgKcHoK2j/lpQ3AcAyJYjlLVrqLY9O3/vIys1YvhNdr6bi+wRGy1x9qZBaGJhw
         CQcKtZ/g86MCVeuQ8E+I7KfpiGT3z8evMrZWea9i68CTauEe5GGskdolNOPFDcnnIh/Y
         +uo6ZzKMGkLiTeFsax1OcTzbWZ74Yz1FV5vtWNSrhXXxe6jU7teXeyNLY49wFPueC42b
         SdXBxAz1wo4mFzRNPa1jE1q9RCXkgahLvCMXb5qPR0BdLRO/wM4DNHkK1u+P5t21e8cI
         6E/Q==
X-Forwarded-Encrypted: i=1; AKwUvByEhCBMzmDPeWC0DBw3/OB5Ep59DeFe4l9rl4glczK1f2wSiBgk40vhMEKi7LMnojuNV/7AZvvDH3+jfCM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYUSEW+yGc54X8pBEz7usIGhPkaojZFWFt0gEdpdrv8AjG0Pbn
	k7k8/cKsRb57nXaAQBL2sWBt7GHruzMfegBA74nBsZp7Ymg37qkICgH+61iYo14EzUrG3hJjhld
	miD2LaDeRxDUXFXkVI/XvCPcEhk2hnkmADoOr6f/9xAsLVyW9c8krbhIRpPOrdDX6UwU=
X-Gm-Gg: AYBFou1iDyT+hW4les2oXGHUOrsycpMUfjAMbr2ZcTO5JnieRr9t2IEeZtaZaxBAchx
	2Bq+xMtkMGxENUR4u6k2FTBoxIzEaXpRDnrl06Kfm4107OC0rHzDnEUkWIsSDAmdw5m8QohGico
	Ug9AEvvNfvPcvnf/PQWQm28/xwCgbEr1+MCKeBNAqH++6yIDhm9XTEWdHx2Uqt47qfRzs3v13Q3
	wsHsyRPdallCxb4DCQuakHfxFTM11Qwri7ypB5J6EkzviiHkOSTtlDddfsKafGCLtUn0IyfkG7u
	VZ+0+tCACt9C4dMZ0AzBcSV7bmdNASXnLAKm8NuIfR8/kzzI88FmW8EX/DO83Oy+D46+WerlMRg
	IjBKGYaa9X9gSnD/8VD5IobVMdS6ekC4=
X-Received: by 2002:a05:693c:41c1:20b0:353:8103:ecae with SMTP id 5a478bee46e88-3674e0521e7mr2324042eec.23.1792572467589;
        Wed, 21 Oct 2026 01:47:47 -0700 (PDT)
X-Received: by 2002:a05:693c:41c1:20b0:353:8103:ecae with SMTP id 5a478bee46e88-3674e0521e7mr2324007eec.23.1792572466583;
        Wed, 21 Oct 2026 01:47:46 -0700 (PDT)
Received: from [10.217.223.82] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674198fb21sm5297207eec.23.2026.10.21.01.47.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 01:47:46 -0700 (PDT)
Message-ID: <c4cff6d8-83dc-4290-938e-7f372be605e8@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 14:17:40 +0530
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
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: Add device tree for Lemans
 GearVM variant
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Nikunj Kela <quic_nkela@quicinc.com>
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
 <20261015023711.721837-6-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
In-Reply-To: <20261015023711.721837-6-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfX+1q/zli3KJQE
 Squ/I/mx3fxJvzzNvSnasseojQSiOkd1z2X5d1w83hiYYHu1kSXF48BAPLDvwqYldeQQ2UKxrv0
 fWjDyGtvoOOlNqkx7WER4+J+FMwk7PZo1pzoR6ANCo7ufTxKcAWwKSEff4m3L5nnJMCf+l4TJlW
 X72+a4dYOofMxvH32ameJU35fO4sj467GYCNbdPqOfWsCC0x4/Qqhi+Wv7OHbDsgsr4lLW0Z4rv
 Nze1ZcPj72xNe2ZJgAXnXsVJzjr5QSMSzKj/qNqtP66m9/3ZqAjvmA4P5iVhRKuwjDmBvJwJWBC
 EWRbVjd69flMbvBxUgSe3/+vtyLIqzIBr8QoMP2l9Ok/8Xwwv9xMYqz9JmfWT6HMHGK5TRF2lul
 0QBoQ1ZCoxCKCX7MShiG9ZwSrUJUij8zMhPjG+1GKwVETV93xowZr2rcyRZ4LCfzRBQH+yt9eot
 PHpo7LyLz7UwAvi3BRQ==
X-Proofpoint-ORIG-GUID: L6PAAPtu3svKjKVtqMnqT9OppMvoeKsY
X-Proofpoint-GUID: L6PAAPtu3svKjKVtqMnqT9OppMvoeKsY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfX18Hr97esWRzP
 X28bg5HqldWMa2ao9wAcJcQ+VPkB9hHIfQbwUDq7OJ1NYxquigoCckSHsF3cr9n9S3cw2kv7dvp
 732CN7Ovzxs6aHHeq/iB8IvQ9R1CPjQ=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad87c35 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=cqKKkZQ0Gws9q0dnNzAA:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1011 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210034

Hi Shawn,

On 10/15/2026 8:07 AM, Shawn Guo wrote:
> Add lemans-gearvm.dtsi for Lemans GearVM variant (SA8255P) that utilizes
> firmware to configure platform resources such as clocks, interconnects
> and TLMM.
> Device drivers request these resources through the SCMI power, reset and
> performance protocols.  Assign each device driver a dedicated SCMI
> channel and Tx/Rx doorbells to support parallel resource requests and
> aggregation in the SCMI platform server.  Operate the SCMI server stack
> in an SMP-enabled VM using the Qualcomm SMC/HVC transport driver for
> communication.
> 
> Group resource operations to improve abstraction and reduce the number of
> SCMI requests.  Follow the SCMI-based resource management approach
> demonstrated by Qualcomm at Linaro Connect 2024 [1].
> 
> [1] https://resources.linaro.org/en/resource/wfnfEwBhRjLV1PEAJoDDte
> 
> Co-developed-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> Co-developed-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi | 3232 +++++++++++++++++++
>   1 file changed, 3232 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi b/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
> new file mode 100644
> index 000000000000..4c155cbc7975
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/lemans-gearvm.dtsi
> @@ -0,0 +1,3232 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include "lemans.dtsi"
> +
> +/delete-node/ &xbl_boot_mem;
> +/delete-node/ &pil_adsp_mem;
> +/delete-node/ &q6_adsp_dtb_mem;
> +/delete-node/ &q6_gdsp0_dtb_mem;
> +/delete-node/ &pil_gdsp0_mem;
> +/delete-node/ &pil_gdsp1_mem;
> +/delete-node/ &q6_gdsp1_dtb_mem;
> +/delete-node/ &q6_cdsp0_dtb_mem;
> +/delete-node/ &pil_cdsp0_mem;
> +/delete-node/ &pil_gpu_mem;
> +/delete-node/ &q6_cdsp1_dtb_mem;
> +/delete-node/ &pil_cdsp1_mem;
> +/delete-node/ &pil_cvp_mem;
> +/delete-node/ &pil_video_mem;
> +/delete-node/ &scmi_mem;
> +/delete-node/ &firmware_reserved_mem;
> +
> +/ {
> +	clocks {
> +		bi_tcxo_div2: bi-tcxo-div2-clk {
> +			compatible = "fixed-factor-clock";
> +			clocks = <&xo_board_clk>;
> +			clock-mult = <1>;
> +			clock-div = <2>;
> +			#clock-cells = <0>;
> +		};
> +
> +		gpll0_board_clk: gpll0-board-clk {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +		};
> +
> +		sleep_clk: sleep-clk {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +		};
> +
> +		xo_board_clk: xo-board-clk {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +		};
> +	};
> +};
> +
> +&adreno_smmu {
> +	power-domains = <&scmi15_pd 0>;
> +};
> +
> +&cpufreq_hw {
> +	clocks = <&bi_tcxo_div2>, <&gpll0_board_clk>;
> +	clock-names = "xo", "alternate";
> +};
> +
> +&firmware {
> +	scm {
> +		memory-region = <&tz_ffi_mem>;
> +	};
> +
> +	scmi0: scmi-0 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem0>;
> +
> +		interrupts = <GIC_SPI 963 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi0_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi0_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi0_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi1: scmi-1 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem1>;
> +
> +		interrupts = <GIC_SPI 964 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi1_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi1_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi1_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi2: scmi-2 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem2>;
> +
> +		interrupts = <GIC_SPI 965 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi2_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi2_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi2_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi3: scmi-3 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem3>;
> +
> +		interrupts = <GIC_SPI 966 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi3_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi3_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi3_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi4: scmi-4 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem4>;
> +
> +		interrupts = <GIC_SPI 967 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi4_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi4_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi4_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi5: scmi-5 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem5>;
> +
> +		interrupts = <GIC_SPI 968 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi5_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi5_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi5_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi6: scmi-6 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem6>;
> +
> +		interrupts = <GIC_SPI 969 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi6_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi6_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi6_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi7: scmi-7 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem7>;
> +
> +		interrupts = <GIC_SPI 970 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi7_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi7_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi7_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi8: scmi-8 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem8>;
> +
> +		interrupts = <GIC_SPI 971 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi8_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi8_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi8_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi9: scmi-9 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem9>;
> +
> +		interrupts = <GIC_SPI 972 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi9_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi9_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi9_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi10: scmi-10 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem10>;
> +
> +		interrupts = <GIC_SPI 973 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi10_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi10_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi10_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi11: scmi-11 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem11>;
> +
> +		interrupts = <GIC_SPI 974 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi11_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi11_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi11_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi12: scmi-12 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem12>;
> +
> +		interrupts = <GIC_SPI 975 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi12_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi12_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi12_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi13: scmi-13 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem13>;
> +
> +		interrupts = <GIC_SPI 976 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi13_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi13_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi13_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi14: scmi-14 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem14>;
> +
> +		interrupts = <GIC_SPI 977 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi14_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi14_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi14_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi15: scmi-15 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem15>;
> +
> +		interrupts = <GIC_SPI 978 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi15_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi15_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi15_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi16: scmi-16 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem16>;
> +
> +		interrupts = <GIC_SPI 979 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi16_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi16_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi16_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi17: scmi-17 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem17>;
> +
> +		interrupts = <GIC_SPI 980 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi17_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi17_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi17_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi18: scmi-18 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem18>;
> +
> +		interrupts = <GIC_SPI 981 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi18_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi18_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi18_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi19: scmi-19 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem19>;
> +
> +		interrupts = <GIC_SPI 982 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi19_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi19_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi19_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi20: scmi-20 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem20>;
> +
> +		interrupts = <GIC_SPI 983 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi20_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi20_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi20_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi21: scmi-21 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem21>;
> +
> +		interrupts = <GIC_SPI 984 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi21_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi21_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi21_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi22: scmi-22 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem22>;
> +
> +		interrupts = <GIC_SPI 985 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi22_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi22_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi22_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi23: scmi-23 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem23>;
> +
> +		interrupts = <GIC_SPI 986 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi23_sensor: protocol@15 {
> +			reg = <0x15>;
> +			#thermal-sensor-cells = <1>;
> +		};
> +	};
> +
> +	scmi24: scmi-24 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem24>;
> +
> +		interrupts = <GIC_SPI 987 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi24_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi24_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi24_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi25: scmi-25 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem25>;
> +
> +		interrupts = <GIC_ESPI 0 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi25_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi25_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi25_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi26: scmi-26 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem26>;
> +
> +		interrupts = <GIC_ESPI 1 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi26_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi26_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi26_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi27: scmi-27 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem27>;
> +
> +		interrupts = <GIC_ESPI 2 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi27_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi27_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi27_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi28: scmi-28 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem28>;
> +
> +		interrupts = <GIC_ESPI 3 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi28_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi28_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi28_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi29: scmi-29 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem29>;
> +
> +		interrupts = <GIC_ESPI 4 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi29_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi29_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi29_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi30: scmi-30 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem30>;
> +
> +		interrupts = <GIC_ESPI 5 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi30_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi30_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi30_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi31: scmi-31 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem31>;
> +
> +		interrupts = <GIC_ESPI 6 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi31_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi31_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi31_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi32: scmi-32 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem32>;
> +
> +		interrupts = <GIC_ESPI 7 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi32_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi32_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi32_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi33: scmi-33 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem33>;
> +
> +		interrupts = <GIC_ESPI 8 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi33_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi33_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi33_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi34: scmi-34 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem34>;
> +
> +		interrupts = <GIC_ESPI 9 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi34_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi34_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi34_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi35: scmi-35 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem35>;
> +
> +		interrupts = <GIC_ESPI 10 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi35_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi35_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi35_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi36: scmi-36 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem36>;
> +
> +		interrupts = <GIC_ESPI 11 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi36_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi36_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi36_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi37: scmi-37 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem37>;
> +
> +		interrupts = <GIC_ESPI 12 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi37_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi37_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi37_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi38: scmi-38 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem38>;
> +
> +		interrupts = <GIC_ESPI 13 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi38_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi38_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi38_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi39: scmi-39 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem39>;
> +
> +		interrupts = <GIC_ESPI 14 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi39_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi39_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi39_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi40: scmi-40 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem40>;
> +
> +		interrupts = <GIC_ESPI 15 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi40_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi40_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi40_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi41: scmi-41 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem41>;
> +
> +		interrupts = <GIC_ESPI 16 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi41_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi41_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi41_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi42: scmi-42 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem42>;
> +
> +		interrupts = <GIC_ESPI 17 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi42_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi42_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi42_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi43: scmi-43 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem43>;
> +
> +		interrupts = <GIC_ESPI 18 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi43_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi43_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi43_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi44: scmi-44 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem44>;
> +
> +		interrupts = <GIC_ESPI 19 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi44_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi44_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi44_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi45: scmi-45 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem45>;
> +
> +		interrupts = <GIC_ESPI 20 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi45_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi45_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi45_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi46: scmi-46 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem46>;
> +
> +		interrupts = <GIC_ESPI 21 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi46_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi46_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi46_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi47: scmi-47 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem47>;
> +
> +		interrupts = <GIC_ESPI 22 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi47_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi47_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi47_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi48: scmi-48 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem48>;
> +
> +		interrupts = <GIC_ESPI 23 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi48_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi48_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi48_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi49: scmi-49 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem49>;
> +
> +		interrupts = <GIC_ESPI 24 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi49_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi49_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi49_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi50: scmi-50 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem50>;
> +
> +		interrupts = <GIC_ESPI 25 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi50_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi50_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi50_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi51: scmi-51 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem51>;
> +
> +		interrupts = <GIC_ESPI 26 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi51_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi51_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi51_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi52: scmi-52 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem52>;
> +
> +		interrupts = <GIC_ESPI 27 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi52_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi52_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi52_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi53: scmi-53 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem53>;
> +
> +		interrupts = <GIC_ESPI 28 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi53_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi53_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi53_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi54: scmi-54 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem54>;
> +
> +		interrupts = <GIC_ESPI 29 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi54_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi54_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi54_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi55: scmi-55 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem55>;
> +
> +		interrupts = <GIC_ESPI 30 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi55_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi55_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi55_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi56: scmi-56 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem56>;
> +
> +		interrupts = <GIC_ESPI 31 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi56_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi56_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi56_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi57: scmi-57 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem57>;
> +
> +		interrupts = <GIC_ESPI 32 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi57_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi57_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi57_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi58: scmi-58 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem58>;
> +
> +		interrupts = <GIC_ESPI 33 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi58_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi58_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi58_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi59: scmi-59 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem59>;
> +
> +		interrupts = <GIC_ESPI 34 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi59_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi59_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi59_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi60: scmi-60 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem60>;
> +
> +		interrupts = <GIC_ESPI 35 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi60_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi60_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi60_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi61: scmi-61 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem61>;
> +
> +		interrupts = <GIC_ESPI 36 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi61_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi61_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi61_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi62: scmi-62 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem62>;
> +
> +		interrupts = <GIC_ESPI 37 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi62_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi62_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi62_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +
> +	scmi63: scmi-63 {
> +		compatible = "qcom,scmi-smc";
> +		arm,smc-id = <0xc6008012>;
> +		shmem = <&shmem63>;
> +
> +		interrupts = <GIC_ESPI 38 IRQ_TYPE_EDGE_RISING>;
> +		interrupt-names = "a2p";
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		arm,max-msg = <10>;
> +		arm,max-msg-size = <256>;
> +		arm,max-rx-timeout-ms = <3000>;
> +
> +		status = "disabled";
> +
> +		scmi63_pd: protocol@11 {
> +			reg = <0x11>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi63_dvfs: protocol@13 {
> +			reg = <0x13>;
> +			#power-domain-cells = <1>;
> +		};
> +
> +		scmi63_rst: protocol@16 {
> +			reg = <0x16>;
> +			#reset-cells = <1>;
> +		};
> +	};
> +};
> +
> +&qupv3_id_0 {
> +	compatible = "qcom,sa8255p-geni-se-qup";
> +
> +	i2c0: i2c@980000 {
> +		compatible = "qcom,sa8255p-geni-i2c";
> +		power-domains = <&scmi11_pd 0>,
> +				<&scmi11_dvfs 0>;

For I2C power domain should be scmi9_pd and all below I2C's.

> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	spi0: spi@980000 {
> +		compatible = "qcom,sa8255p-geni-spi";
> +		power-domains = <&scmi11_pd 0>,
> +				<&scmi11_dvfs 0>;


For SPI power domain should be scmi10_pd and all below SPI's.

> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	uart0: serial@980000 {
> +		compatible = "qcom,sa8255p-geni-uart";
> +		power-domains = <&scmi11_pd 0>,
> +				<&scmi11_dvfs 0>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	i2c1: i2c@984000 {
> +		compatible = "qcom,sa8255p-geni-i2c";
> +		power-domains = <&scmi11_pd 1>,
> +				<&scmi11_dvfs 1>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	spi1: spi@984000 {
> +		compatible = "qcom,sa8255p-geni-spi";
> +		power-domains = <&scmi11_pd 1>,
> +				<&scmi11_dvfs 1>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	uart1: serial@984000 {
> +		compatible = "qcom,sa8255p-geni-uart";
> +		power-domains = <&scmi11_pd 1>,
> +				<&scmi11_dvfs 1>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	i2c2: i2c@988000 {
> +		compatible = "qcom,sa8255p-geni-i2c";
> +		power-domains = <&scmi11_pd 2>,
> +				<&scmi11_dvfs 2>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	spi2: spi@988000 {
> +		compatible = "qcom,sa8255p-geni-spi";
> +		power-domains = <&scmi11_pd 2>,
> +				<&scmi11_dvfs 2>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	uart2: serial@988000 {
> +		compatible = "qcom,sa8255p-geni-uart";
> +		power-domains = <&scmi11_pd 2>,
> +				<&scmi11_dvfs 2>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	i2c3: i2c@98c000 {
> +		compatible = "qcom,sa8255p-geni-i2c";
> +		power-domains = <&scmi11_pd 3>,
> +				<&scmi11_dvfs 3>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	spi3: spi@98c000 {
> +		compatible = "qcom,sa8255p-geni-spi";
> +		power-domains = <&scmi11_pd 3>,
> +				<&scmi11_dvfs 3>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	uart3: serial@98c000 {
> +		compatible = "qcom,sa8255p-geni-uart";
> +		power-domains = <&scmi11_pd 3>,
> +				<&scmi11_dvfs 3>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	i2c4: i2c@990000 {
> +		compatible = "qcom,sa8255p-geni-i2c";
> +		power-domains = <&scmi11_pd 4>,
> +				<&scmi11_dvfs 4>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	spi4: spi@990000 {
> +		compatible = "qcom,sa8255p-geni-spi";
> +		power-domains = <&scmi11_pd 4>,
> +				<&scmi11_dvfs 4>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	uart4: serial@990000 {
> +		compatible = "qcom,sa8255p-geni-uart";
> +		power-domains = <&scmi11_pd 4>,
> +				<&scmi11_dvfs 4>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	i2c5: i2c@994000 {
> +		compatible = "qcom,sa8255p-geni-i2c";
> +		power-domains = <&scmi11_pd 5>,
> +				<&scmi11_dvfs 5>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	spi5: spi@994000 {
> +		compatible = "qcom,sa8255p-geni-spi";
> +		power-domains = <&scmi11_pd 5>,
> +				<&scmi11_dvfs 5>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	uart5: serial@994000 {
> +		compatible = "qcom,sa8255p-geni-uart";
> +		power-domains = <&scmi11_pd 5>,
> +				<&scmi11_dvfs 5>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +};
> +
> +&qupv3_id_1 {
> +	compatible = "qcom,sa8255p-geni-se-qup";
> +
> +	i2c7: i2c@a80000 {
> +		compatible = "qcom,sa8255p-geni-i2c";
> +		power-domains = <&scmi11_pd 7>,
> +				<&scmi11_dvfs 7>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	spi7: spi@a80000 {
> +		compatible = "qcom,sa8255p-geni-spi";
> +		power-domains = <&scmi11_pd 7>,
> +				<&scmi11_dvfs 7>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	uart7: serial@a80000 {
> +		compatible = "qcom,sa8255p-geni-uart";
> +		power-domains = <&scmi11_pd 7>,
> +				<&scmi11_dvfs 7>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	i2c8: i2c@a84000 {
> +		compatible = "qcom,sa8255p-geni-i2c";
> +		power-domains = <&scmi11_pd 8>,
> +				<&scmi11_dvfs 8>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	spi8: spi@a84000 {
> +		compatible = "qcom,sa8255p-geni-spi";
> +		power-domains = <&scmi11_pd 8>,
> +				<&scmi11_dvfs 8>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	uart8: serial@a84000 {
> +		compatible = "qcom,sa8255p-geni-uart";
> +		power-domains = <&scmi11_pd 8>,
> +				<&scmi11_dvfs 8>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	i2c9: i2c@a88000 {
> +		compatible = "qcom,sa8255p-geni-i2c";
> +		power-domains = <&scmi11_pd 9>,
> +				<&scmi11_dvfs 9>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	spi9: spi@a88000 {
> +		compatible = "qcom,sa8255p-geni-spi";
> +		power-domains = <&scmi11_pd 9>,
> +				<&scmi11_dvfs 9>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	uart9: serial@a88000 {
> +		compatible = "qcom,sa8255p-geni-uart";
> +		power-domains = <&scmi11_pd 9>,
> +				<&scmi11_dvfs 9>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	i2c10: i2c@a8c000 {
> +		compatible = "qcom,sa8255p-geni-i2c";
> +		power-domains = <&scmi11_pd 10>,
> +				<&scmi11_dvfs 10>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	spi10: spi@a8c000 {
> +		compatible = "qcom,sa8255p-geni-spi";
> +		power-domains = <&scmi11_pd 10>,
> +				<&scmi11_dvfs 10>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	uart10: serial@a8c000 {
> +		compatible = "qcom,sa8255p-geni-debug-uart";
> +		power-domains = <&scmi11_pd 10>,
> +				<&scmi11_dvfs 10>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	i2c11: i2c@a90000 {
> +		compatible = "qcom,sa8255p-geni-i2c";
> +		power-domains = <&scmi11_pd 11>,
> +				<&scmi11_dvfs 11>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	spi11: spi@a90000 {
> +		compatible = "qcom,sa8255p-geni-spi";
> +		power-domains = <&scmi11_pd 11>,
> +				<&scmi11_dvfs 11>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	uart11: serial@a90000 {
> +		compatible = "qcom,sa8255p-geni-uart";
> +		power-domains = <&scmi11_pd 11>,
> +				<&scmi11_dvfs 11>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	i2c12: i2c@a94000 {
> +		compatible = "qcom,sa8255p-geni-i2c";
> +		power-domains = <&scmi11_pd 12>,
> +				<&scmi11_dvfs 12>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	spi12: spi@a94000 {
> +		compatible = "qcom,sa8255p-geni-spi";
> +		power-domains = <&scmi11_pd 12>,
> +				<&scmi11_dvfs 12>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	uart12: serial@a94000 {
> +		compatible = "qcom,sa8255p-geni-uart";
> +		power-domains = <&scmi11_pd 12>,
> +				<&scmi11_dvfs 12>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	i2c13: i2c@a98000 {
> +		compatible = "qcom,sa8255p-geni-i2c";
> +		power-domains = <&scmi11_pd 13>,
> +				<&scmi11_dvfs 13>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +};
> +
> +&qupv3_id_2 {
> +	compatible = "qcom,sa8255p-geni-se-qup";
> +
> +	i2c14: i2c@880000 {
> +		compatible = "qcom,sa8255p-geni-i2c";
> +		power-domains = <&scmi11_pd 14>,
> +				<&scmi11_dvfs 14>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	spi14: spi@880000 {
> +		compatible = "qcom,sa8255p-geni-spi";
> +		power-domains = <&scmi11_pd 14>,
> +				<&scmi11_dvfs 14>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	uart14: serial@880000 {
> +		compatible = "qcom,sa8255p-geni-uart";
> +		power-domains = <&scmi11_pd 14>,
> +				<&scmi11_dvfs 14>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	i2c15: i2c@884000 {
> +		compatible = "qcom,sa8255p-geni-i2c";
> +		power-domains = <&scmi11_pd 15>,
> +				<&scmi11_dvfs 15>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	spi15: spi@884000 {
> +		compatible = "qcom,sa8255p-geni-spi";
> +		power-domains = <&scmi11_pd 15>,
> +				<&scmi11_dvfs 15>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	uart15: serial@884000 {
> +		compatible = "qcom,sa8255p-geni-uart";
> +		power-domains = <&scmi11_pd 15>,
> +				<&scmi11_dvfs 15>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	i2c16: i2c@888000 {
> +		compatible = "qcom,sa8255p-geni-i2c";
> +		power-domains = <&scmi11_pd 16>,
> +				<&scmi11_dvfs 16>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	spi16: spi@888000 {
> +		compatible = "qcom,sa8255p-geni-spi";
> +		power-domains = <&scmi11_pd 16>,
> +				<&scmi11_dvfs 16>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	uart16: serial@888000 {
> +		compatible = "qcom,sa8255p-geni-uart";
> +		power-domains = <&scmi11_pd 16>,
> +				<&scmi11_dvfs 16>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	i2c17: i2c@88c000 {
> +		compatible = "qcom,sa8255p-geni-i2c";
> +		power-domains = <&scmi11_pd 17>,
> +				<&scmi11_dvfs 17>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	spi17: spi@88c000 {
> +		compatible = "qcom,sa8255p-geni-spi";
> +		power-domains = <&scmi11_pd 17>,
> +				<&scmi11_dvfs 17>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	uart17: serial@88c000 {
> +		compatible = "qcom,sa8255p-geni-uart";
> +		power-domains = <&scmi11_pd 17>,
> +				<&scmi11_dvfs 17>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	i2c18: i2c@890000 {
> +		compatible = "qcom,sa8255p-geni-i2c";
> +		power-domains = <&scmi11_pd 18>,
> +				<&scmi11_dvfs 18>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	spi18: spi@890000 {
> +		compatible = "qcom,sa8255p-geni-spi";
> +		power-domains = <&scmi11_pd 18>,
> +				<&scmi11_dvfs 18>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	uart18: serial@890000 {
> +		compatible = "qcom,sa8255p-geni-uart";
> +		power-domains = <&scmi11_pd 18>,
> +				<&scmi11_dvfs 18>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	i2c19: i2c@894000 {
> +		compatible = "qcom,sa8255p-geni-i2c";
> +		power-domains = <&scmi11_pd 19>,
> +				<&scmi11_dvfs 19>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	spi19: spi@894000 {
> +		compatible = "qcom,sa8255p-geni-spi";
> +		power-domains = <&scmi11_pd 19>,
> +				<&scmi11_dvfs 19>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	uart19: serial@894000 {
> +		compatible = "qcom,sa8255p-geni-uart";
> +		power-domains = <&scmi11_pd 19>,
> +				<&scmi11_dvfs 19>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	i2c20: i2c@898000 {
> +		compatible = "qcom,sa8255p-geni-i2c";
> +		power-domains = <&scmi11_pd 20>,
> +				<&scmi11_dvfs 20>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	spi20: spi@898000 {
> +		compatible = "qcom,sa8255p-geni-spi";
> +		power-domains = <&scmi11_pd 20>,
> +				<&scmi11_dvfs 20>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	uart20: serial@898000 {
> +		compatible = "qcom,sa8255p-geni-uart";
> +		power-domains = <&scmi11_pd 20>,
> +				<&scmi11_dvfs 20>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +};
> +
> +&qupv3_id_3 {
> +	compatible = "qcom,sa8255p-geni-se-qup";
> +
> +	i2c21: i2c@b80000 {
> +		compatible = "qcom,sa8255p-geni-i2c";
> +		power-domains = <&scmi11_pd 21>,
> +				<&scmi11_dvfs 21>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	spi21: spi@b80000 {
> +		compatible = "qcom,sa8255p-geni-spi";
> +		power-domains = <&scmi11_pd 21>,
> +				<&scmi11_dvfs 21>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +
> +	uart21: serial@b80000 {
> +		compatible = "qcom,sa8255p-geni-uart";
> +		power-domains = <&scmi11_pd 21>,
> +				<&scmi11_dvfs 21>;
> +		power-domain-names = "power",
> +				     "perf";
> +	};
> +};
> +
> +&pcie0_ep {
> +	compatible = "qcom,sa8255p-pcie-ep";
> +	power-domains = <&scmi5_pd 1>;
> +};
> +
> +&pcie1_ep {
> +	compatible = "qcom,sa8255p-pcie-ep";
> +	power-domains = <&scmi6_pd 1>;
> +};
> +
> +&reserved_memory {
> +	xbl_boot_mem: xbl-boot@90700000 {
> +		reg = <0x0 0x90700000 0x0 0x100000>;
> +		no-map;
> +	};
> +
> +	tz_ffi_mem: tz-ffi@91c00000 {
> +		compatible = "shared-dma-pool";
> +		reg = <0x0 0x91c00000 0x0 0x1400000>;
> +		no-map;
> +	};
> +
> +	pil_adsp_mem: pil-adsp@95c00000 {
> +		reg = <0x0 0x95c00000 0x0 0x1e00000>;
> +		no-map;
> +	};
> +
> +	pil_adsp_dtb_mem: q6-adsp-dtb@97a00000 {
> +		reg = <0x0 0x97a00000 0x0 0x80000>;
> +		no-map;
> +	};
> +
> +	pil_gdsp0_dtb_mem: pil-gdsp0-dtb@97a80000 {
> +		reg = <0x0 0x97a80000 0x0 0x80000>;
> +		no-map;
> +	};
> +
> +	pil_gdsp0_mem: pil-gdsp0@97b00000 {
> +		reg = <0x0 0x97b00000 0x0 0x1e00000>;
> +		no-map;
> +	};
> +
> +	pil_gdsp1_mem: pil-gdsp1@99900000 {
> +		reg = <0x0 0x99900000 0x0 0x1e00000>;
> +		no-map;
> +	};
> +
> +	pil_gdsp1_dtb_mem: pil-gdsp1-dtb@9b700000 {
> +		reg = <0x0 0x9b700000 0x0 0x80000>;
> +		no-map;
> +	};
> +
> +	pil_cdsp0_dtb_mem: pil-cdsp0-dtb@9b780000 {
> +		reg = <0x0 0x9b780000 0x0 0x80000>;
> +		no-map;
> +	};
> +
> +	pil_cdsp0_mem: pil-cdsp0@9b800000 {
> +		reg = <0x0 0x9b800000 0x0 0x1e00000>;
> +		no-map;
> +	};
> +
> +	pil_gpu_mem: pil-gpu@9d600000 {
> +		reg = <0x0 0x9d600000 0x0 0x2000>;
> +		no-map;
> +	};
> +
> +	pil_cdsp1_dtb_mem: pil-cdsp1-dtb@9d680000 {
> +		reg = <0x0 0x9d680000 0x0 0x80000>;
> +		no-map;
> +	};
> +
> +	pil_cdsp1_mem: pil-cdsp1@9d700000 {
> +		reg = <0x0 0x9d700000 0x0 0x1e00000>;
> +		no-map;
> +	};
> +
> +	pil_cvp_mem: pil-cvp@9f500000 {
> +		reg = <0x0 0x9f500000 0x0 0x700000>;
> +		no-map;
> +	};
> +
> +	pil_video_mem: pil-video@9fc00000 {
> +		reg = <0x0 0x9fc00000 0x0 0x700000>;
> +		no-map;
> +	};
> +
> +	audio_config_mem: audio-config-region@ac600000 {
> +		reg = <0x0 0xac600000 0x0 0xa00000>;
> +		no-map;
> +	};
> +
> +	audio_mdf_mem: audio-mdf-region@ad000000 {
> +		reg = <0x0 0xad000000 0x0 0x2000000>;
> +		no-map;
> +	};
> +
> +	firmware_mem: firmware-region@b0000000 {
> +		reg = <0x0 0xb0000000 0x0 0x800000>;
> +		no-map;
> +	};
> +
> +	hyptz_reserved_mem: hyptz-reserved@beb00000 {
> +		reg = <0x0 0xbeb00000 0x0 0x11500000>;
> +		no-map;
> +	};
> +
> +	shmem0: scmi-mem@d0000000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd0000000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem1: scmi-mem@d0001000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd0001000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem2: scmi-mem@d0002000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd0002000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem3: scmi-mem@d0003000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd0003000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem4: scmi-mem@d0004000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd0004000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem5: scmi-mem@d0005000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd0005000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem6: scmi-mem@d0006000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd0006000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem7: scmi-mem@d0007000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd0007000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem8: scmi-mem@d0008000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd0008000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem9: scmi-mem@d0009000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd0009000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem10: scmi-mem@d000a000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd000a000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem11: scmi-mem@d000b000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd000b000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem12: scmi-mem@d000c000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd000c000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem13: scmi-mem@d000d000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd000d000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem14: scmi-mem@d000e000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd000e000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem15: scmi-mem@d000f000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd000f000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem16: scmi-mem@d0010000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd0010000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem17: scmi-mem@d0011000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd0011000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem18: scmi-mem@d0012000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd0012000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem19: scmi-mem@d0013000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd0013000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem20: scmi-mem@d0014000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd0014000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem21: scmi-mem@d0015000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd0015000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem22: scmi-mem@d0016000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd0016000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem23: scmi-mem@d0017000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd0017000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem24: scmi-mem@d0018000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd0018000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem25: scmi-mem@d0019000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd0019000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem26: scmi-mem@d001a000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd001a000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem27: scmi-mem@d001b000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd001b000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem28: scmi-mem@d001c000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd001c000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem29: scmi-mem@d001d000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd001d000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem30: scmi-mem@d001e000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd001e000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem31: scmi-mem@d001f000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd001f000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem32: scmi-mem@d0020000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd0020000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem33: scmi-mem@d0021000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd0021000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem34: scmi-mem@d0022000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd0022000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem35: scmi-mem@d0023000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd0023000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem36: scmi-mem@d0024000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd0024000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem37: scmi-mem@d0025000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd0025000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem38: scmi-mem@d0026000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd0026000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem39: scmi-mem@d0027000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd0027000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem40: scmi-mem@d0028000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd0028000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem41: scmi-mem@d0029000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd0029000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem42: scmi-mem@d002a000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd002a000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem43: scmi-mem@d002b000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd002b000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem44: scmi-mem@d002c000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd002c000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem45: scmi-mem@d002d000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd002d000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem46: scmi-mem@d002e000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd002e000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem47: scmi-mem@d002f000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd002f000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem48: scmi-mem@d0030000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd0030000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem49: scmi-mem@d0031000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd0031000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem50: scmi-mem@d0032000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd0032000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem51: scmi-mem@d0033000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd0033000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem52: scmi-mem@d0034000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd0034000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem53: scmi-mem@d0035000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd0035000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem54: scmi-mem@d0036000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd0036000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem55: scmi-mem@d0037000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd0037000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem56: scmi-mem@d0038000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd0038000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem57: scmi-mem@d0039000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd0039000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem58: scmi-mem@d003a000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd003a000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem59: scmi-mem@d003b000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd003b000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem60: scmi-mem@d003c000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd003c000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem61: scmi-mem@d003d000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd003d000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem62: scmi-mem@d003e000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd003e000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	shmem63: scmi-mem@d003f000 {
> +		compatible = "arm,scmi-shmem";
> +		reg = <0x0 0xd003f000 0x0 0x1000>;
> +		no-map;
> +	};
> +
> +	firmware_logs_mem: firmware-logs@d0040000 {
> +		reg = <0x0 0xd0040000 0x0 0x10000>;
> +		no-map;
> +	};
> +
> +	firmware_audio_mem: firmware-audio@d0050000 {
> +		reg = <0x0 0xd0050000 0x0 0x4000>;
> +		no-map;
> +	};
> +
> +	firmware_camera_mem: firmware-camera@d0054000 {
> +		no-map;
> +		reg = <0x0 0xd0054000 0x0 0x2000>;
> +	};
> +
> +	firmware_reserved_mem: firmware-reserved@d0056000 {
> +		reg = <0x0 0xd0056000 0x0 0x9a000>;
> +		no-map;
> +	};
> +
> +	firmware_quantum_test_mem: firmware-quantum-test@d00f0000 {
> +		reg = <0x0 0xd00f0000 0x0 0x10000>;
> +		no-map;
> +	};
> +
> +	tags_mem: tags@d0100000 {
> +		reg = <0x0 0xd0100000 0x0 0x1200000>;
> +		no-map;
> +	};
> +
> +	qtee_mem: qtee@d1300000 {
> +		reg = <0x0 0xd1300000 0x0 0x500000>;
> +		no-map;
> +	};
> +
> +	deepsleep_backup_mem: deepsleep-backup@d1800000 {
> +		reg = <0x0 0xd1800000 0x0 0x100000>;
> +		no-map;
> +	};
> +
> +	trusted_apps_mem: trusted-apps@d1900000 {
> +		reg = <0x0 0xd1900000 0x0 0x3800000>;
> +		no-map;
> +	};
> +
> +	tz_stat_mem: tz-stat@db100000 {
> +		reg = <0x0 0xdb100000 0x0 0x100000>;
> +		no-map;
> +	};
> +
> +	cpucp_fw_mem: cpucp-fw@db200000 {
> +		reg = <0x0 0xdb200000 0x0 0x100000>;
> +		no-map;
> +	};
> +
> +	cma: linux,cma {
> +		compatible = "shared-dma-pool";
> +		alloc-ranges = <0x0 0x00000000 0x0 0xdfffffff>;
> +		reusable;
> +		alignment = <0x0 0x400000>;
> +		size = <0x0 0x2000000>;
> +		linux,cma-default;
> +	};
> +};
> +
> +&ufs_mem_hc {
> +	compatible = "qcom,sa8255p-ufshc";
> +	power-domains = <&scmi3_pd 0>;
> +};

