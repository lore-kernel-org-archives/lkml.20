Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793833256;
	b=B56vPz/8SsjS/Gcf98OrpM6tGCyfcYZwH/2FKiJHfAmMVZ2OZr/KbFD6bojA5j5voKop
	 +gTS1cBXeVJdCv8VetH0zDE0ydmxJgDGjFhZ/1N/+nTu7MXTA1UDeShYXih4fGGyQdcjA
	 RuhK+SUetgbOTckWO+rHccMmt/l7aGMWxGx1OidqUQoyfCggkuMe3ZbuOu8KSterZ6vII
	 pRhQPV9or42wnBEasZyKlnejAI2XTf4PWmGJ6jwsaN2tGDklfMYPhEupUS4tk+DXdSuoS
	 eVPz/576/mA/QIGg0rnrXQkmxFI9b6Q821MLDt7MD+cTIZ4xBUehS3r8mn7GWX9945g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793833256;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IBnwuUwFwWPHj2qGKuZXR/Fn/5DPhnAAWQsAJFP7dnI=;
	b=1Ccl7H60gGrKR2TrtC6qyByFsVGAvfbWzoWF/tGmRDoCGi6Xw/eDeZelpkvYUCamxH1C
	 hgfGokerZ3j44Z+j154R9Mi3OKgFgl6R9z9iqnWBSBoXjzo8FCEMzi+XcnEoEniQFSVWi
	 on4QJ6oU9MHU3P/He9s42bZGYxMMEJ1P6D7UsAteSxDp7crWMtJMKuGEzNYw3sueb8FIV
	 ppw4BlzYBzjGgDGASJMcuFYHLgUIsjT9IL4S6A+O65TXeOHDcw6uo7eO7pEfsqbP5gVAI
	 RKbJmGNM8zzXgak+eRU77PJDqDd/yotc/TwfdDA4Ty6uoAm0oMsUg2jU9sG2tIjMbVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="O6BGli/H";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uh12jnc7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73063606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 23:00:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73063606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O6BGli/H;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uh12jnc7
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Lw2MC2210784
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 23:00:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IBnwuUwFwWPHj2qGKuZXR/Fn/5DPhnAAWQsAJFP7dnI=; b=O6BGli/HIIDofw67
	rFsGgLtdJRCXoEeKzYo+hW4Hh/+ESmUI/61hl2a32FI3wQo0B204FbGWdZCEgSfx
	R7Yso3POoccwvj88TwcTNhGbBGLUAcXof+4KaNXqqphJ3LHGU2Jays0rgeHs9QV7
	jtdag5gRCyqBBYiWubLFbXNkE/Of+86wInhBxp5jq+VzZ0+B+py/7IEoj3AlNUXx
	/Y2b519enVLbpEYmZzmRnl46NuSEOxvMBqNAhQBp/AWv0HB0LTvZGBX2NscBrXC0
	pdSgm61w/feHrG6yq/6N5z8UxShVNs3t2scGaKsub1gx3ChDfA0xLA0zp9JO32yN
	AGHRlw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bdt2nq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 23:00:54 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso2167817eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 15:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793833254; x=1794438054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IBnwuUwFwWPHj2qGKuZXR/Fn/5DPhnAAWQsAJFP7dnI=;
        b=Uh12jnc7wEs+c91B6UjpHc+p4kac6FH7u5MnrW9kYD3A/fewYfhx3eBtoSQZac5mrm
         QYFUZcVv16oMl+t3jCUfQUbY8p6/OmbF723pEvl5uIEqCkbGvUgtHR5HZUUUB7MKN9Mp
         urpYExmNjHzWkG5Pcgeyfjy+skZF+NDAGTCLMIwR2Er93Jk71IrbY7aXguzsMqoyo359
         CWvuhZw8CxUIxMCkmlyAbpFSEN0VpILD4lREyerKsrdKQ+C9dIi6cD4lo7KOnFUVOEya
         DzvldJLQ/oNXYFfEYl99Rr7+Xk8OASoaV8KwkTd6Jyt69+12xcX2w/ujaSmo7UoTS+59
         HTfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793833254; x=1794438054;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IBnwuUwFwWPHj2qGKuZXR/Fn/5DPhnAAWQsAJFP7dnI=;
        b=IDNs84TTYysxwzeb7DaZD0kZa6Xsh/y6BPRM9pDR68AB18qOl5Wli1yPHT5wv650/h
         BS4CfzWd2zyFumXL2m8Ht/xjwSM6VDnO6Ch7kWaCnyziP8fBub828XGapKPEi2xPpZHl
         x9thhu3dS5dqrP3q7YtnfBkvX0LjxiAZkdlFB6zPzPoX3SQYBbLbN8A6Qa/YkMiOqQK9
         DChyKirbHSzqtmbd8xkH96XpTiSHiYIoS1xCZ3Wdk+HtGrYnIjz0ShME5czND0ciRXUT
         bC7Idf4PdoAsb/Jp8LZANzDwXroB81yQm4UFCJgTeA6c4FDB5LopL0ONx3b4pLUsPD/D
         OAFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxy4TXU78UvLe7jsYjTwAHWftBthFOlrR63EsqUfn0FkUxeeMDiVV7fZtWz9itfxMgEp6blIZmP9zRIhdI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FDq97jRF7OdfWjNc6QQTsUegHhyVRtW1Zu0mNUsjuwIlrzD0F
	gmi3nnvrN+HDZgOfFMsEkHyKMExxXpuYewAOetlbaU/fUQh+8+JJHCRjTXInWHxatZK6g6cSz7o
	l8+fvYHE7LX2pkeIl6TI5y1qt9v/SsAogaKfhj11jelNdBsoFx98dnM+o0x+HxYIElDI=
X-Gm-Gg: AYBFou1wRPxk+RmlLeogCiXZexcoR6JPDJfgoVmsSH+6Suo7iN/6qqqNGyNpKyNZ5EK
	1M5Nih32XI0iZnXo0H2ZSUlg0jElxRj1iwbj0HiLL1YxL0+MqcM/h7AH73mAkKZlA2A+AgtS5EL
	CNGZpK+pIn8zqzg+0mqeGBsf7kbm7BThbbQZYizGXHduRrgpUsaDiscqtmapmSO1vA7RimnK6N1
	yMCvTMQQcXMWF9hbLbowRQXJvjCHbLqtmLrvQ+rUsV+AwNdl5BWM3PYv6zjmrBEltnY01aq2RDH
	v01b6dzondpOGjx+hUCyFk+brGQHtai5bKkw/286MY3zVFKajww1FutHWqGT01mAy/arGSINiq6
	WbcWTXNHUG17PD1qD87X1qpZHwiEyhdcLZzzafItF+Qd2ZZhrjILDmFCzvpVOzP4NSnIs0GSveN
	6PW/EWvnXS+1xKaeGDqsyTqOVk9H95
X-Received: by 2002:a05:693c:69d5:b0:369:7c:bfce with SMTP id 5a478bee46e88-36a423c6223mr26622418eec.14.1793833253686;
        Wed, 04 Nov 2026 15:00:53 -0800 (PST)
X-Received: by 2002:a05:693c:69d5:b0:369:7c:bfce with SMTP id 5a478bee46e88-36a423c6223mr26622351eec.14.1793833252836;
        Wed, 04 Nov 2026 15:00:52 -0800 (PST)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39972d4sm17734198eec.26.2026.11.04.15.00.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 15:00:52 -0800 (PST)
Message-ID: <adf77ed5-ecdf-4984-87d4-a7f796b83c2a@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 15:00:51 -0800
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
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: lemans: add CSI2 D-PHY
 common-phy providers
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vikram Sharma
 <vikram.sharma@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>
References: <20261103221026.3662383-1-anusha.nandi@oss.qualcomm.com>
 <20261103221026.3662383-2-anusha.nandi@oss.qualcomm.com>
 <72223121-cb42-422f-8ce5-4cf9f41c5aec@oss.qualcomm.com>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <72223121-cb42-422f-8ce5-4cf9f41c5aec@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA5MCBTYWx0ZWRfXyL0oRkm9463G
 DnWVG1VVNz4Q3jk66REO56VuNmdaFhfHul506C3+rr0qyiuJosrCnxuRhZyiiVmFgwETrcoodZD
 kzpgc2ff5H/4JXI0l79kKFRHmjoOPWw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA5MCBTYWx0ZWRfX43H9kjB0/2So
 D2DXD1sefezYJb+1KeAliAGf2UOGmFl8+CC2RxD89iABPQm0REXjZ8qAsEuWPFjE4Its5XjYrie
 iRfLHqBe2G8OzO1c2c4s76Ts20ZMtXZK4xUWgKiG+Rlwh2w9ud0BhMCPzzWjKfnQezT8yO9K+5W
 B24GnDRjzYaUGx0KyUcjPFNuOdJqZpEIwVKMDQWdASdGo/lr+LH5cG38eCfjlUS+suZUxQvTqbD
 b+w/4NprP6quNzEmeCGErZlKATiX5PKT/vfHGLxIUcSS+Ds3xnAIWumtrYno2WeYTeuS6FTJds5
 0w6griZug331HQ+iQP2KrI0aziGbZVfT6egWR8F/AlOav+dNUTZxp/c1HRqqrn16qQ/tT8kfmPw
 fXlLFS82Ic/vOlz/ndrDKt+SqjkepwMqd1dOlUiGTu877MjPx3Tdwp7i7J+fgvW2XFvB9adjta7
 zk/OwdOCwFS43PKulcw==
X-Proofpoint-ORIG-GUID: iCvxag__N9yd2LX1f9_okJ-2vlQ8mDYF
X-Authority-Analysis: v=2.4 cv=D4XSufRj c=1 sm=1 tr=0 ts=6aebb926 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=YzLprhzs-1J5OMutLZIA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: iCvxag__N9yd2LX1f9_okJ-2vlQ8mDYF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040090

Hi Nihal,

will drop a new patchset.

Thank you
Anusha
On 11/3/2026 8:53 PM, Nihal Kumar Gupta wrote:
> 
> 
> On 04-11-2026 03:40, Anusha Arun Nandi wrote:
>> Expose the four SA8775p CSIPHYs as standalone qcom,sa8775p-csi2-phy
>> generic-PHY provider nodes (csiphy0..3) at their existing register
>> addresses, each with its own OF graph (port@0 sensor-facing, port@1
>> CAMSS-facing) so camss_detect_legacy_phy() picks the non-legacy path
>> once a board wires a sensor through one of them. The camss node's own
>> reg-names/clocks/interrupts for the CSIPHYs are unchanged, so boards
>> that don't use a provider still get the legacy binding.
>>
>> The provider nodes are disabled by default; a board or camera overlay
>> enables the one(s) it uses.
>>
>> Reviewed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
>> Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/lemans.dtsi | 140 +++++++++++++++++++++++++++
>>  1 file changed, 140 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
>> index 1fdb72fa5518..2a30bf1c82af 100644
>> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
>> @@ -5164,6 +5164,146 @@ cci3_i2c1: i2c-bus@1 {
>>  			};
>>  		};
>>  
>> +		csiphy0: phy@ac9c000 {
>> +			compatible = "qcom,sa8775p-csi2-phy";
>> +			reg = <0x0 0x0ac9c000 0x0 0x2000>;
> ...
> 
>> +		csiphy3: phy@aca2000 {
>> +			compatible = "qcom,sa8775p-csi2-phy";
> 
> phy@ac9c000 through phy@aca2000 nodes precede the existing
> isp@ac78000 node.
> Sort CSIPHY nodes by unit-address numerically.
> 
>> +			reg = <0x0 0x0aca2000 0x0 0x2000>;
>> +
>> +			clocks = <&camcc CAM_CC_CSIPHY3_CLK>,
>> +				 <&camcc CAM_CC_CSI3PHYTIMER_CLK>;
>> +			clock-names = "core",
>> +				      "timer";
>> +
>> +			interrupts = <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>;
>> +
>> +			operating-points-v2 = <&csiphy_opp_table>;
>> +
>> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
>> +			power-domain-names = "top";
>> +
>> +			status = "disabled";
>> +
>> +			ports {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				port@0 {
>> +					reg = <0>;
>> +				};
>> +
>> +				port@1 {
>> +					reg = <1>;
>> +				};
>> +			};
>> +		};
>> +
>> +		csiphy_opp_table: opp-table-csiphy {
>> +			compatible = "operating-points-v2";
>> +
>> +			opp-300000000 {
>> +				opp-hz = /bits/ 64 <300000000>;
>> +			};
>> +
>> +			opp-400000000 {
>> +				opp-hz = /bits/ 64 <400000000>;
>> +			};
>> +		};
>> +
>>  		camss: isp@ac78000 {
>>  			compatible = "qcom,sa8775p-camss";
>>  
> 

