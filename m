Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102472;
	b=cy4VqhJt68i925gM+YZZaMjQkVcky2A4REoahTLnRTVA4MIY8Pi2LjAV2ELBFksB63jS
	 7s2Rlwl4gT8zQpa1Hhl4xx+WpM8NppYKs4pNnr/nHwdhEjKNdU9OjweYPTVbY41rrpwUQ
	 v7ech2qY3R25KIZoVbXNMIpcbrkM1GSQDbs21eRed7lEIY6VD0UxkVFJIZJuV+Ia4BGWJ
	 4tJGMyPCd6fdRRm5dqKHhgbjCOwmmdoBRlAMTs10wPlGqR91OlkstrdBaJ+a7erDeUXz7
	 DB3ja7sevCdjW482+y5pGdaj1iwxBkIzngQhPfmS4QEbHRWDkAi1X8+cnLLpyX7pFeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102472;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sWt6v7dOd/C066uGvGJiwittXamwS8tJI6B7PLI1Mxo=;
	b=SaJvOcxzHkFrxT3fcdGwSPQQnqgrQsH6RKXyOLrWE2LJZ7KHbSkaOi8D5LQpRP9W5wVb
	 HFxLYij6E3VCuMQGskzGL7eRlKa957Ps8nETXpSADAdsg3wJ0oQZKSWmRw9aQdX4+52tW
	 rbETP/Qv+mpqDwOWS6EjYw7h5eW+fC7NWCw+iYn+nBrgTXtsmmVlG7kD8kpYPfgs6Wi2e
	 BYH9lDBMmnISB94FTZ/ZCPWRc4WOmaNhYNpdFT2r45CxpatkUW77ErvntNNXbIC0gw4et
	 1F+vM10tXol/KmBkA4SAQhtmpWLNCpkazq59zUxtUsaEHwrLb+Ggxw8LRkhYWaI5YXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YIHhEyQt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IHMYKX46;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D7860A3833
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:01:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58D7860A3833
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YIHhEyQt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IHMYKX46
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe1Ml1921843
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:01:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sWt6v7dOd/C066uGvGJiwittXamwS8tJI6B7PLI1Mxo=; b=YIHhEyQtbEq3/pfI
	fCZVi7RXL0brQWGAHrRuNhcZq256lm3HPoS5MqTTitHUzsHf/fNxeazvP5hd1I2L
	cTLqBdiF2wFd62rKhbduZ14cakEutnpP0UtQKJZ2RrVr26xbDLoZdcnr0K5+yg+Q
	AVTpACF1G2ldixS88cE1XRwHEdq0hLpocQfJ66eKJA7up+eh1xRzC5ulMb+/T+cl
	6xIzahoERVFxr4IUQUfh0xc2bqecpLNZVwVMGHvgRshKVGJrKuKIr0q/vx1EK1y8
	zo/nnsFUQJdsvmr4ipq0SIkjs0DpD0G97ssXsukGVV/RDOBSAtGM1SM/adHFBJzw
	bAPIqA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq68r08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:01:06 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc2c798d76so81509137.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793102466; x=1793707266; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sWt6v7dOd/C066uGvGJiwittXamwS8tJI6B7PLI1Mxo=;
        b=IHMYKX46Dyj0N9QIxDN5Y5ZOox9DBVt2ll5pok4OuByccp5ceeKJcxcVgXIr9RuClp
         Z2Moqrh5jcvKDDZZ9fabBnHeKqus/LXeR7FoU0MTkB5ztnDKHcMhx1VeWmhiNZGyjJAf
         uAb+cmWcTugwRb1MrIV4r8wEMtoXKHOp/jddBqdSCZcvPKSS0dBUwnxYv2Js+ce6rP05
         JnM84NGZVKTDVESXHUx7VPKUKIg74c9AMeMZfWLquBZ5o+XF4IvztR3IBdahdDQUCbDU
         r+6ZXJ+R4Jj26jZbsT9nMsgn1DW5m8m1clt6xjEDpi6RFbnHfNRmBo/D/rtOGz24LSkd
         pyzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102466; x=1793707266;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sWt6v7dOd/C066uGvGJiwittXamwS8tJI6B7PLI1Mxo=;
        b=jwxncRLZBnTzvVmY+MyV1GrlU+etemcncBsIwM5Rfli1F9o0RlUTEIc03OdKWwKKG1
         JCC7a2o/u0xZC3i8/XjiMFqTbAJW7UdqecPJtYaDhfjRSCpvtCp3qeF55wTqI6z/gxNZ
         kAWBpP9ytUuxnMM/uSw143UcOuax2ACySdHgTZGH5b6xjCNGvm0yx4j/DF+ILnSkGwkt
         oA7cERKGfRsldaYzjSwyZwQHKakplIuXpUs+x3PxyRlI/MBwLsvSb7s8k8AQ9tCIaj/8
         IWsl95cLiYI716ChCsVgd86r+Xvx0mZMQ5zluKSf4/oMyi3Cppdk36NTTFR4q9V/Qqql
         fLVw==
X-Forwarded-Encrypted: i=1; AKwUvBz5LL363q92teQe0na0nR/FVhP+88cQ7pvTPTBhat/I1n9FE2I3OUXiVTOTz9GMdHS7b352UY4gI4JrPYE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYZ34TV7bykuXMQxxUQC0c9ERWildpUFnVnIA2tPMR/NkQEp3F
	4ravZCn+hHL9vDCHEA6Vo6EJG/SgjAxh8xFPTWf4bFS1UiH5lZpEhOUnQN1LLLgoupYOX5hp3ZF
	zjfMDCDAcQJ08n9e11Ansj2FGwWwM+S3JwgUhHW4ofV1IQmrbttxMLrq9fMgxyL7n2dA=
X-Gm-Gg: AYBFou2ABu1Q8BLd98yelpVsl/MuSwtkJ0l6jf8JMTv2GTxu57dwijHk5DtF1xPjTnN
	IqX0q4efiqxtcILDdcnKGcmclJ+mIQSph3Owtx2j0kkD4UmPnPZ12/V13hOCpPqjx/JrapVf2pr
	hQqHID5D6rFmb+NLtavphx31F1zXwomrOuiQUyQ5h+oMmiQVfolOEeXVzOZ4FyW1Qc25xcutrQN
	umzagsQlB5AWVhDBASm/wTnhrTHAJZEmjmpyr0istTwTMvsyPYU7OzPP+cohhzH6qTUSXdicrtF
	mO1LL0yRpT/+Z4dB/IiMs16iVEAdqkDbiNP1h3XwH6F9qq2KuV+352C8Ujf13KMJgblxYD0j+dZ
	lf4u4kGnlDmDJegQEGfnLQw==
X-Received: by 2002:a05:6102:8699:20b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7ce5cc59d5emr2997408137.2.1793102464709;
        Tue, 27 Oct 2026 05:01:04 -0700 (PDT)
X-Received: by 2002:a05:6102:8699:20b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7ce5cc59d5emr2997246137.2.1793102462214;
        Tue, 27 Oct 2026 05:01:02 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4459713f9sm4988292a12.16.2026.10.27.05.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 05:01:00 -0700 (PDT)
Message-ID: <7e4763a9-31f4-44cd-b3df-3404725a6dcc@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 13:00:57 +0100
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
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: nord: Add display subsystem
 nodes
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260920091930.2215803-1-shengchao.guo@oss.qualcomm.com>
 <20260920091930.2215803-2-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260920091930.2215803-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae09282 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=B70xErdyIbx__L-6yYgA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: FfOq5t1XIsdpyO2xa4JkEycmkPMiNGOn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfXyDntmWHz0QMM
 MgS0+r1/6VQQLRwfto3Xl2XCvRwnn1+cxJgYC59zwC6y+nANZ8O+gt66gLkN5N+V7/xu+tBikz5
 cT3ZsLrf5RE1PUutpXZRxml6MDeSHec=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfXxc4ItGB+bLIh
 Yzw4wsIQHiPTd5QKyFK9bVp/5ucta68Jfk/BxQtKTKF0DUe3d3yE40nRtGfmDinwDFpvJUp1KiM
 vEkHs3X/MP2EB2WWCmNAIbhlbSD2McuFmpLrQeatrWGBCcklBqXD57r63jiwDxBB5Rz/Nev4Ygb
 7tdJq1irRpb3N7axmpOaHXuGp7UxrlnQCgTU7ytgchMoG+/DLuYWFxGrvagYxp8gUKqsLNwtz6N
 pW3MkNk7WeUG1ySN3QVBx4dgWRBi0AdlYA7jxE9acW8f35J+8NqmFl11P+J/3D1F9nfpb7EwY1z
 dIxtL4YyZOSLd3rLWVNZ+DAyhh3HWhQBfjPOvTM/sL9UOPRphoW5J3eXAxgcwSKkmstJfdldsbp
 IgelK6NBiNBcPhSaUd7BWAdTUOjdqw==
X-Proofpoint-ORIG-GUID: FfOq5t1XIsdpyO2xa4JkEycmkPMiNGOn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610190000 definitions=main-2610270047

On 9/20/26 11:19 AM, Shawn Guo wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Add the MDSS, DPU, DP controller and eDP PHY nodes for the Qualcomm Nord
> SoC. Nord has two independent display subsystems, MDSS0 at 0xae00000 and
> MDSS1 at 0x8c00000, each with two DP controllers and two eDP PHYs. Nord
> is DP-only, so no DSI nodes are added. Wire the DP PHY outputs into the
> dispcc0 and dispcc1 clock inputs, which were previously stubbed with
> zeroes, and add the eDP0-3 hot-plug-detect pinctrl states.

[...]

> +	dp_opp_table: opp-table {
> +		compatible = "operating-points-v2";
> +
> +		opp-162000000 {
> +			opp-hz = /bits/ 64 <162000000>;
> +
> +			required-opps = <&rpmhpd_opp_low_svs>;

Odd \n above

Identical OPP tables can be reused (both across DPs and MDPs)

[...]

> +		/* Display subsystem nodes - MDSS 12.1, DP-only (no DSI) */

Both of these comments can go

Konrad
