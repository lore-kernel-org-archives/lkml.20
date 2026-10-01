Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78565516157
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 12:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858828; cv=none; b=A8QMCFANmji2cOYy++F1JS+fUw8Mz9e6MQKxCh92Nh+GK9Qh0qduddko6ag8FFMNHCuv0NsEbShJ3GbxbINvMynqIbOr91O9FUq8fRkLpdNqDYhQ3f1X7fjvc3iNIKx8ImaRTbuzlinWjD2Aem+fL4DMUj6nEm5sSeCZ3zTzDVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858828; c=relaxed/simple;
	bh=kBuYhsXeG0Hef2kWDXbmgfW5D7ESv9bBWUDR1/BGP68=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XrWrSkj+BuRapgPsu7m1aF99sO+hEeudCZzHJtVl1Mpki9ye5kUs3iLMQUhHNLwgrUhjqjonlkqod293iDnFjLfImd2mSS8kcPWzQEr9ZlL+NbEBFJDx0MqG3HahR0IHExvbS/TklCCo36T658QhPrKDfJCOp65eZPp4/CBZW0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cp/6TI9I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fxBw6i6V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cp/6TI9I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fxBw6i6V"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691CSTUt1932306
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 12:47:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n23HEwtNwjwshWngVlSos3mmDfZRD0XOPc4PUj0FMv8=; b=Cp/6TI9IQqCInd5k
	3O2fT/aktOgyjmBvgz4qyQf7IdAgch3VStcc6Ay7MAyHilcL4UufYP1RDr5RQmgo
	+eddY0lPw9t1NhLbhHWm61FMxot527ADZgfbM/2z1B2gAVkBCcrcOx7sHwS9ghqv
	zNM26JKpJ9GC8jbAxQpkF26yAKM2TbVogNsmhUBRoPS8t07ud28BeFNM8uOvWG0v
	DTy6/pll7U3h187xtEHKfsIQ6px19uyp6it3TyYgyREwUfBgoiLtO22Ylr9fdQgO
	L4+raF2PM1RwG1bVqxd/jGw8eLiVXRkd5ECP9rywBWpHvoD3LDcGNbs1C5wdppd5
	tX7yow==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1bh5aymh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 12:47:03 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so13567292a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 05:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790858823; x=1791463623; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n23HEwtNwjwshWngVlSos3mmDfZRD0XOPc4PUj0FMv8=;
        b=fxBw6i6VaiMBRoRO39mXYUcL2XXeT9kKs6EaD4Ft5IJGLCSJmgGCEZe4yPtKCW+uqy
         I+yCSXWaFGL+16Kn6KOSloh8h+f/m7rfYRVIeJltAa91V1eBwGVHzbw/jo3B1y7hAZHn
         cWeIGpYQdnz6Uv9vo3OeEKHXdEymXKWPoKXPzTFQ0utu/ucbyjI5bBG4jiaS2TzngmaQ
         ToU5mpzgQHzBG37beVEGakom4n1ZgOeGTe0AL+nS7XHEgmFL8ZfiAndDVz/qsZkpIFLi
         g2GaX8q8na0k8GUHvxDud/+mVcEu6W2b5CI7IIhy+UXoLsLoZN+zhcnoooScMxJ6rv3r
         /PJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790858823; x=1791463623;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n23HEwtNwjwshWngVlSos3mmDfZRD0XOPc4PUj0FMv8=;
        b=QR1hTcUTiQl1XKFrsgI82gFsJWeIDqTQ56HSOjz8Ahx1/C+JdcSVM1QALV3jXqqpXn
         Pxjy1rYLxCIuuxAJiQHeGgmUS9U5SEUh+RoDP5ojgm+BQjmSQSVMNt+9ffE7I+S/RXri
         OuIkCZ8ayas7QI/rFFdJ7xswm5gwCNRlgB3BW8a77rhlmyjGMq7KC/85GXFn1G3oka9O
         wwi16yHgNcSvCEkcX8iBdvzom0s2WG+0nE8+LFq8Uo45AKPD4FqMK9Dwc1HcDmJn+G6d
         FiQ7hm33hJLj0mz4sEDINrJ4ZWVHe/W+3uZ6ur1YRZxEJQtdlr3pKNUMi3oo9hcpgHba
         LAHA==
X-Forwarded-Encrypted: i=1; AKwUvBzBCcW9M+74pP9yo6Q7gTktzzPoNr4lwwqXBrQwsTc7KBB3anjnvUEDUE6xgQcoWK6wgUvklULiacUqrYQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJD/ugn7TCwgOdJqpDyZXFqDHQmJ/W4rNrwr4qIP5iKwFClG0Ye
	L+nIHfqQAPR7BHnQIkVD7OkajirCvlmtDIyBMpwLHLppWboVdkeJMHyw3N1DCJiMr8MrOVavkK9
	iaiDU85a67TH5Fygt7oEej0yakKNo/CA3Gi/fGECJqFJd3mvvgyR+31SC9hc1zzxfGYU=
X-Gm-Gg: AYBFou3bjnn6hpZaRAX7GQ7/oN0sdpdQHzSuhmEg6tHVSTwIwOSxZLGFuazQw/WFD2N
	OvzBuspG8HmRScQhbfJJbvqjhX6Or/UsYkFJj5fvkeJ/kVV45DJyuAucvZhsZKZN8FD60Tb9bcL
	ZpQ2SMAvt4W5O0hulD7MSnCHmFXqlq6svKwND2/hWjlHgDSSQE5FbBIOgcJ4trI8aj9syA2Iadh
	F/HmY1MRcq99XkYWB3WV5y195oCNw99YVXZou750NGgZ2fpSmdc+6wriQ2JCZcEfMawNHMo3dXQ
	0p5DmI3MqGUx2EfDb53GErCWLHxtTk+kxZOiude4jgCVDAnz6EWFp9pBdYXftzeibrXV6FAyCKj
	0X4+eXfZxmAiB3yDa7LkuI1aSFzlqXgvH
X-Received: by 2002:a17:90a:da8b:b0:3a0:9c9d:eb18 with SMTP id 98e67ed59e1d1-3a4d1937974mr4107793a91.54.1790858822895;
        Thu, 01 Oct 2026 05:47:02 -0700 (PDT)
X-Received: by 2002:a17:90a:da8b:b0:3a0:9c9d:eb18 with SMTP id 98e67ed59e1d1-3a4d1937974mr4107770a91.54.1790858822309;
        Thu, 01 Oct 2026 05:47:02 -0700 (PDT)
Received: from [10.219.49.187] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f44f5299sm4397752a91.17.2026.10.01.05.46.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 05:47:01 -0700 (PDT)
Message-ID: <81587936-75f4-4e6c-aeda-176799df3a33@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 18:16:56 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/8] ASoC: qcom: lpass-tx-macro: Add support for Bolero
 v4.0
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
References: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
 <20260922-add_shikra_support-v1-7-6c6cb6444caf@oss.qualcomm.com>
 <2c37b9fa-9810-482d-8ca3-67072a0f9072@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <2c37b9fa-9810-482d-8ca3-67072a0f9072@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: gCBmjkGWdpvHx7g9WVlk879gZfjaocPr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfX9pjj4FJ3yfv8
 kqCAcwAbm9UBLkQ+kTCCHcJCn5z8OsIzUfH8k+ppZK4KuXnqPk7p9pLXlcaFJPEv/JZoAG/LQJD
 XgD4KvCqkGbRIvuNTrbi4gF2ATnqXcU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfX5wujOjR3k2Gk
 eriwaxh02lynsXxBQ/5qmSptT70K3PsuU9P1f/9PPQD3h9gP10ulQQJv1d3ECqsWmDVkuQ9ebR8
 1rv/HtOOYIb8Q9rxg5U82ipLPJpRFcAPuXBwwbIwqn6WM+HkiAyWrgV1HpRGAcZFQn0YPX9Axhf
 1AwAglI8Usxb4H4Faf76UhEfazh0fWY3dh2fx+cHLdW/D8hjNDCdm7gELpUHAT1UR40zZs+b67J
 bnyTQ3dL7myuMvnuHHQMis1TbJZNd0tE8xxbF50gwEEgQ51M880s7k9cbQi4qEXI0eN1MlU3xdQ
 aYFMit7GRvn8vFbRXPruQHNspGmXEfjWuoMJmXH0/haOd/j/zi/aXO8dExQqc+E4Pq8HJ9BIBMt
 fFY7A9Sj1hmOlIDNDNURo4+1jATUQLRP6uDbNiuCtkyvb2+B+0HbGAgn7//tw/BLiTgvIV1DOzZ
 23dAG1Ft+9mvvGyGTHA==
X-Authority-Analysis: v=2.4 cv=NuxE4MdJ c=1 sm=1 tr=0 ts=6abe5647 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=KhvH2Z7gLfpSUoOGztgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: gCBmjkGWdpvHx7g9WVlk879gZfjaocPr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010050


On 9/25/2026 3:52 PM, Ajay Kumar Nandam wrote:
>
>
> On 9/22/2026 3:12 PM, Mohammad Rafi Shaik wrote:
>> From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>>
>> Hawi integrates the Bolero v4.0 TX macro, which extends the v9.x TX
>> macro with a port-select stage in the SWR microphone input path and an
>> adaptive filter (ADPT) block.
>>
>> Add the additional CFG2 mux registers and per-path CFG2 registers to the
>> register map, extend the maximum register offset to cover the new ADPT
>> control register, and describe the new v4.0 decimator, SWR microphone,
>> WSA and port-select mux widgets and their routes.
>>
>> The ADPT block has to be disabled before a decimator is enabled. This
>> register only exists on v4.0, so gate the write on a has_adpt flag set
>> from the match data rather than issuing it unconditionally.
>>
>> Add the "qcom,hawi-lpass-tx-macro" compatible and its match data to
>> select the new widgets and routes.
>>
>> Co-developed-by: Sarath Ganapathiraju 
>> <sarath.ganapathiraju@oss.qualcomm.com>
>> Signed-off-by: Sarath Ganapathiraju 
>> <sarath.ganapathiraju@oss.qualcomm.com>
>> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>> Signed-off-by: Mohammad Rafi Shaik 
>> <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   sound/soc/codecs/lpass-macro-common.h |   1 +
>>   sound/soc/codecs/lpass-tx-macro.c     | 442 
>> +++++++++++++++++++++++++++++++++-
>>   2 files changed, 442 insertions(+), 1 deletion(-)
>>
>> diff --git a/sound/soc/codecs/lpass-macro-common.h 
>> b/sound/soc/codecs/lpass-macro-common.h
>> index b52665b11e35..707b22a6bda6 100644
>> --- a/sound/soc/codecs/lpass-macro-common.h
>> +++ b/sound/soc/codecs/lpass-macro-common.h
>> @@ -16,6 +16,7 @@ enum lpass_version {
>>       LPASS_VER_9_2_0,
>>       LPASS_VER_10_0_0,
>>       LPASS_VER_11_0_0,
>> +    LPASS_VER_15_0_0,
>>   };
>>     enum lpass_codec_version {
>> diff --git a/sound/soc/codecs/lpass-tx-macro.c 
>> b/sound/soc/codecs/lpass-tx-macro.c
>> index 6deaaabe43af..b1eee16e968c 100644
>> --- a/sound/soc/codecs/lpass-tx-macro.c
>> +++ b/sound/soc/codecs/lpass-tx-macro.c
>> @@ -67,6 +67,14 @@
>>   #define CDC_TX_INP_MUX_ADC_MUX6_CFG1    (0x0134)
>>   #define CDC_TX_INP_MUX_ADC_MUX7_CFG0    (0x0138)
>>   #define CDC_TX_INP_MUX_ADC_MUX7_CFG1    (0x013C)
>> +#define CDC_TX_INP_MUX_ADC_MUX0_CFG2    (0x0140)
>> +#define CDC_TX_INP_MUX_ADC_MUX1_CFG2    (0x0144)
>> +#define CDC_TX_INP_MUX_ADC_MUX2_CFG2    (0x0148)
>> +#define CDC_TX_INP_MUX_ADC_MUX3_CFG2    (0x014C)
>> +#define CDC_TX_INP_MUX_ADC_MUX4_CFG2    (0x0150)
>> +#define CDC_TX_INP_MUX_ADC_MUX5_CFG2    (0x0154)
>> +#define CDC_TX_INP_MUX_ADC_MUX6_CFG2    (0x0158)
>> +#define CDC_TX_INP_MUX_ADC_MUX7_CFG2    (0x015C)
>>   #define CDC_TX_ANC0_CLK_RESET_CTL    (0x0200)
>>   #define CDC_TX_ANC0_MODE_1_CTL        (0x0204)
>>   #define CDC_TX_ANC0_MODE_2_CTL        (0x0208)
>> @@ -108,6 +116,16 @@
>>   #define CDC_TX0_TX_PATH_SEC5        (0x0424)
>>   #define CDC_TX0_TX_PATH_SEC6        (0x0428)
>>   #define CDC_TX0_TX_PATH_SEC7        (0x042C)
>> +#define CDC_TX0_TX_PATH_CFG2        (0x0430)
>> +#define CDC_TX1_TX_PATH_CFG2        (0x04B0)
>> +#define CDC_TX2_TX_PATH_CFG2        (0x0530)
>> +#define CDC_TX3_TX_PATH_CFG2        (0x05B0)
>> +#define CDC_TX4_TX_PATH_CFG2        (0x0630)
>> +#define CDC_TX5_TX_PATH_CFG2        (0x06B0)
>> +#define CDC_TX6_TX_PATH_CFG2        (0x0730)
>> +#define CDC_TX7_TX_PATH_CFG2        (0x07B0)
>> +#define CDC_ADPT0_ADPT_CTRL        (0x0800)
>> +
>>   #define CDC_TX0_MBHC_CTL_EN_MASK    BIT(6)
>>   #define CDC_TX1_TX_PATH_CTL        (0x0480)
>>   #define CDC_TX1_TX_PATH_CFG0        (0x0484)
>> @@ -186,7 +204,7 @@
>>   #define CDC_TX7_TX_PATH_SEC4        (0x07A0)
>>   #define CDC_TX7_TX_PATH_SEC5        (0x07A4)
>>   #define CDC_TX7_TX_PATH_SEC6        (0x07A8)
>> -#define TX_MAX_OFFSET            (0x07A8)
>> +#define TX_MAX_OFFSET            (CDC_ADPT0_ADPT_CTRL)
>
> These registers look v4.0-specific from the commit message, but 
> TX_MAX_OFFSET, tx_defaults[] and tx_is_rw_register() are updated in 
> the shared regmap configuration used by all TX macro variants.
>
> The explicit CDC_ADPT0_ADPT_CTRL write is gated with has_adpt, but 
> regcache_sync() can still sync the new default registers on older 
> non-v4.0 hardware because the regmap config/default table is shared.
>
> Should this use a v4.0-specific regmap_config/default table, similar 
> to the VA macro, or are the CFG2/ADPT registers guaranteed to be 
> harmless/present on all TX macro variants?

Hi Ajay,

Thanks for pointing out this. Yes need to add v4.0 specific regmap for 
this. I will update in next version.

Thanks,
Prasad


>
>>   #define TX_MACRO_RATES (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
