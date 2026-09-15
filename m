Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C77D42901E
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789489961; cv=none; b=KaVqKIwX9EDAmrchnrwd8x0wcmxyhujnFsrwDQxF0n7NrBvVGivh8YEerP7DrN0xh2mFF+UI5GZgODE9dIHdWH9buNr71gwiKGeAqiD3igFu10xianlBr7Ol/2jz6Pg3g78+1Fga//BizGE1g8uikioDKJUk+2UO+V1T1y96TiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789489961; c=relaxed/simple;
	bh=p07+JoDPMzKCK5bI4/DCgvQDG0O/5/H3p7uRTKwDuLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BxLXOxdAcyM1LpplGLLRROMJn1jzsQ94vwpuWORqLLrstSEXwNtEuW10YWikNUL4+SR13rhLySgvZmVA9mPndory1hpNAucrxSsHVE4JmZu+dfN8TLlPAN0xTL+Kx/m2+jqf/WvbR6ERRY/SHViNemYshy9y0BZLGttvvRD+RXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RhI+QKOO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BGcHwtT2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RhI+QKOO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BGcHwtT2"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFAfPd2836599
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:32:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n9oYWlzrJjqCCO36W65tOQrn+7qNpv3zTqhfOj70ops=; b=RhI+QKOOWhJYZ6ez
	2wNM5zf9I/AlSouRjyCx3t/3/igcN4ak4jwVxOHYqrsF0EIvWNVHvvuJKMEQP7xI
	JAE9WcYaAYHOnC/aOBT9Nqz0TLLrC/b8d/+wJ2qlU50L/zGslJyzN6eu+fgijc9R
	qYnfgwggNQ+ZnDYngm/+KCOxprWuiAzwTvYokBENeUIIT5pbFuyleLKzwdbpn8uB
	TOTbSe3MSW/MBhxYHdykdibDZ1ORSX1x58VuXXV+Cvdad9R4GzHafpTIZz1KB60L
	1Mcuj7fYFsUStmI8NbVIpNxEjatEcreVqhm0oQXlH03Db84s+S9pdDTt6zk6qmdm
	ekBJ/g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq1qpayyr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:32:39 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2db3734d06dso87313435ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789489958; x=1790094758; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n9oYWlzrJjqCCO36W65tOQrn+7qNpv3zTqhfOj70ops=;
        b=BGcHwtT2Tha7VS9Hy2Mi7xTvYL7jC0w26KQ0BN5U49FHN7+8hNILmQVHM2smpZfAYK
         +Ke+APQbr+mH1vTLTy7WXLgMrR5D1gO9BojVJkffzYrOxbZyaBThaSI2lR+vjJCbY4VS
         jeHzsOxdM+JZGU1FsRbRd0En9KQdgaUUjwy7mEQaKDlIq2SgjjUh/NxuMaxs1ACK+aJK
         lr6qjHKSvJ+tbdPsik9yx+hEovUwepRoSxmVkkKVw396p7TN2oJSilPGEVWMtHfCuIv/
         MOjEh25e1MiqBLQ25uchfAONOgP7W3He9pyAlcINmzOpjbinAtsYTt7bX+yqAkA6d0E1
         Z6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789489958; x=1790094758;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n9oYWlzrJjqCCO36W65tOQrn+7qNpv3zTqhfOj70ops=;
        b=clSt06SEWGzs3PxhpDxo4nkhNQaxCHNxzStvX6vYSG4gE5buQBAt5K1H3RgIFRAQVQ
         nJTzd+j2EY/VZA6ZIC0Hx5octjaAmfMyJ7TtTstvrEDDmBdwXnAkr1PEca124DAM9fDE
         EGjFApSgy5jB6oqzrzaLghxtBaKQxGPkc0RF75Xl521KPHmLvr+Iy0MNC4nDIAH9Axt0
         /PKJYbVfce5EIQGGjCiKlRNG+ZPxITEWiotvyPTS6p10+MCLKLZtD6Sbi2G4VlUGNhXa
         9x8E49sjzaq+hLMugPVX9MJjoipx886y57oAiSjdGde/CkIdAALv9qK2Cgy/se2ejmfO
         CIjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkQDgxb7OXDFTgaTDcrsyIe7cnTgFEWD9P72HgBd0A0SdAhbQcAmMSY+FqJS3KvxOkMU+zkADnmI5SvgI=@vger.kernel.org
X-Gm-Message-State: AFuF++lvQv34kCRD2XkICfnhLW50bgFQCBsoCfiGQ6eaaJvJGhYkzt64
	y1xvSAdcDrBsHvi45rZ0r924LWA8nbhNYo93Mj9GqD9CZUC+tXnnNpH4LHLpwhbAHK1F/2xyP6r
	8xjK2PV4OnDHC06H7MtHlltjcLkyTOL0u3RuWarXeDeNg8DAvT3XU1pVpJ9wZV/1iUqs=
X-Gm-Gg: AYBFou1hZkzaVZn/etAtJrbN2RBt9w5SYlQvht2fRygktWDMEjMVnY691cpe2WGhtB9
	XnqprBMlnPv+kWa3pKw8sbE8vXRkliP3M6q3QrtKs3kK381rs5EEwH5qtiTLtcxYCRLBSt4H60u
	HX7TnPsOKM8YYgSb+ik2ldne7nqDHnVxz+m7L3CvAKJQdl/G/tobaouJTXj1rSiszEmx86V74XD
	+zX+tez0SLYfL6bANcNKAe/SQ29yV+KQAflkJBn3YO87n+gGrAJTAs8fDZq050dAF9YdwkpsN2i
	1mTtDBFFSfbimLmUfhTQvYpNbvPYKn+khnVzrHLlr300igEXRdlM80rxl6Z6Xw8z+spZ0HbjRbT
	xuMUuDEh6dX3CeEf/MV2wf71O0c9qGIhKeS42kXvm
X-Received: by 2002:a17:903:f8e:b0:2d8:d4d0:792e with SMTP id d9443c01a7336-2dd6c7630f2mr154440315ad.18.1789489957967;
        Tue, 15 Sep 2026 09:32:37 -0700 (PDT)
X-Received: by 2002:a17:903:f8e:b0:2d8:d4d0:792e with SMTP id d9443c01a7336-2dd6c7630f2mr154439665ad.18.1789489957339;
        Tue, 15 Sep 2026 09:32:37 -0700 (PDT)
Received: from [192.168.1.5] ([122.169.220.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd78bd7654sm16281405ad.43.2026.09.15.09.32.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 09:32:36 -0700 (PDT)
Message-ID: <075116ba-e22e-4df8-ad16-9d9594d7cd16@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 22:02:29 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/5] ASoC: qcom: sc8280xp: Add Nord Ride sound card
 support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
 <20260907-nord-asoc-driver-support-v1-5-997d3b20cf43@oss.qualcomm.com>
 <aqF9Pp_U2tAM3xWf@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <aqF9Pp_U2tAM3xWf@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDIzOSBTYWx0ZWRfX+6AwDR8/B8j1
 ZqegxkUumtiLCqoO8W8Vjh3CxbqXOxNQMcOQ/Gcij/4/SNJOPsySPhEXxX1ECh5PFEc4O8DAjxD
 iQ1NvdEiPeulsgPHHj4SKw1MbEgABa0=
X-Authority-Analysis: v=2.4 cv=I4Xw19gg c=1 sm=1 tr=0 ts=6aa97327 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ww153nmMuBeTcjqybhOiGw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=NDfCo3GjLwaGllft-sYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: LHaGINP0Qp8nbo5SmnZjcOHyDY4u2iij
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDIzOSBTYWx0ZWRfX5G/uipwvxIzI
 VRIqHwsVV0HcKhHyNfWGjfaCQSc8B+XNLmprhXnbrqhGTRJKuP+ofFEeKai/as4SKsi3hNS6o0T
 qQRC1fJPQHUcqTHKkVrnxDQK7YD3GnBhLMYAB2ld/ECiWQDso3TNZXPky984no3J9XomaTHyxre
 ZuHuKh/E395BAs0PG4lZwbuoQa1t5JdXqE6LHWmUQl9wVPIkfmbTaMH1Yk8gEohZkVnBjjPG7lR
 5lQITtdaksJ53Scn7+GgqhZ/mXJNLqXQrcFks35dv7v7WnMjhDM04EoW7O4HK4wqNVLGtA3DZI0
 t4/ZguEb6FGegaq9eDgQzGaYiViMDWi1CC3x7Js0u/ia879UMdU2De5KIbtXa4n/WsLz3WUQCFZ
 gmUzLNLt6fYJsn9uVrYdOk/3GreGZYumeW2Zp12AUeZ73VZ1ZWJMLqGy3Ojl2ZT39UUt/yGVcuF
 M7gWiCkZGXV0Y1yBpzw==
X-Proofpoint-GUID: LHaGINP0Qp8nbo5SmnZjcOHyDY4u2iij
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150239



On 9/9/2026 9:07 PM, Shawn Guo wrote:
> On Mon, Sep 07, 2026 at 11:39:46PM +0530, Mohammad Rafi Shaik wrote:
>> Add support for the Nord Ride sound card by introducing a new
>> compatible string and associated platform private data.
>>
>> Nord uses external audio codecs with interface requirements that
>> differ from the generic SC8280XP platforms. Add a dedicated
>> hw_params callback to configure the appropriate DAI format for
>> playback and capture streams and to program the codec system clock
>> configuration required by the board.
>>
>> The callback configures the PCM1681 playback path to operate in I2S
>> mode and the ADAU1979 capture path to operate in DSP_A mode. For
>> capture, the ADAU1979 system clock is sourced from LRCLK as
>> required by the hardware design.
>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   sound/soc/qcom/sc8280xp.c | 57 +++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 57 insertions(+)
>>
>> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
>> index 4d48e1012cd4..4d8eafca4b7f 100644
>> --- a/sound/soc/qcom/sc8280xp.c
>> +++ b/sound/soc/qcom/sc8280xp.c
>> @@ -18,6 +18,7 @@
>>   #include "common.h"
>>   #include "sdw.h"
>>   
>> +#define LRCLK_SYSCLK 1
> 
> Rather than open-coding the value, please move
> 
>    enum adau1977_clk_id;
>    enum adau1977_sysclk_src;
> 
> out of sound/soc/codecs/adau1977.h into include/sound/adau1977.h so
> machine drivers can include them, and write the call as
>


Ack, thanks for pointing this out. I will rework this in the next revision.

There is no need to introduce a new include/sound/adau1977.h header for 
this. Instead, I will define the required enums locally in the machine 
driver and use them accordingly.


>    snd_soc_component_set_sysclk(codec_dai->component,
>                                 ADAU1977_SYSCLK, ADAU1977_SYSCLK_SRC_LRCLK,
>                                 rate, SND_SOC_CLOCK_IN);
> 
> That documents both slots and turns a mix-up into a compile error.
> 

ACk, will check and update in next revision,


>>   #define I2S_MCLKFS 256
>>   
>>   #define I2S_MCLK_RATE(rate) \
>> @@ -72,6 +73,8 @@ struct qcom_snd_soc_common {
>>   	bool mi2s_bclk_enable;
>>   	bool wcd_jack;
>>   	int (*snd_prepare)(struct snd_pcm_substream *substream);
>> +	int (*snd_hw_params)(struct snd_pcm_substream *substream,
>> +			     struct snd_pcm_hw_params *params);
>>   };
>>   
>>   struct sc8280xp_snd_data {
>> @@ -244,6 +247,47 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
>>   	return 0;
>>   }
>>   
>> +static int nord_snd_hw_params(struct snd_pcm_substream *substream,
>> +			      struct snd_pcm_hw_params *params)
>> +{
>> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
>> +	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
>> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
>> +	int rate = params_rate(params);
>> +	int ret;
>> +
>> +	switch (cpu_dai->id) {
>> +	case TERTIARY_MI2S_RX:
>> +		ret = snd_soc_dai_set_fmt(codec_dai,
>> +					  SND_SOC_DAIFMT_CBC_CFC |
>> +					  SND_SOC_DAIFMT_NB_NF |
>> +					  SND_SOC_DAIFMT_I2S);
>> +		if (ret && ret != -ENOTSUPP)
>> +			return ret;
>> +
>> +		break;
>> +	case TERTIARY_TDM_TX_7:
>> +		ret = snd_soc_dai_set_fmt(codec_dai,
>> +					  SND_SOC_DAIFMT_CBC_CFC |
>> +					  SND_SOC_DAIFMT_NB_NF |
>> +					  SND_SOC_DAIFMT_DSP_A);
>> +		if (ret && ret != -ENOTSUPP)
>> +			return ret;
>> +
>> +		/* adau1979 MCLK sourced from LRCLK */
> 
> The comment says MCLK is sourced from LRCLK, but the adau1977_set_sysclk()
> call selects the PLL input (ADAU1977_PLL_CLK_S) -- MCLK is the other choice.
> Something like "PLL clocked from LRCLK, no external MCLK" would match
> the register write?
> 

yes your right,

will update the comment something like below.

"adau1979 PLL clock sourced from LRCLK, no external MCLK".


>> +		ret = snd_soc_component_set_sysclk(codec_dai->component,
>> +						   0, LRCLK_SYSCLK,
>> +						   rate, SND_SOC_CLOCK_IN);
> 
> There seems to be two problems, one functional and one cosmetic.
> 
> First, I guess this is called too late to have the intended effect. On
> the ADAU1977 side, set_sysclk() doesn't only pick the clock source, it
> also computes the rate constraint mask:
> 
>    } else if (source == ADAU1977_SYSCLK_SRC_LRCLK) {
>            mask = ADAU1977_RATE_CONSTRAINT_MASK_LRCLK;
>    }
>    ...
>    adau1977->constraints.mask = mask;
> 
> and that mask is consumed in adau1977_startup():
> 
>    snd_pcm_hw_constraint_list(substream->runtime, 0,
>            SNDRV_PCM_HW_PARAM_RATE, &adau1977->constraints);
> 
> startup() runs before hw_params(), so on the first capture open after
> boot the mask is still 0 from probe and the rate constraint is not what
> the LRCLK-sourced configuration requires. Setting the source once from a
> dai_link init (or from a startup callback) rather than per-hw_params
> would get the ordering right and also avoid reprogramming the PLL source
> on every stream open. Could you confirm what the first arecord after
> ot negotiates? I suspect it only appears to work because the rate you
> test with is permitted by the unconstrained list anyway.
> 
> Second, on the naming. The prototype is
> 
>    int snd_soc_component_set_sysclk(struct snd_soc_component *component,
>                                     int clk_id, int source,
>                                     unsigned int freq, int dir);
> 
> so in the call above the literal 0 is the clk_id (ADAU1977_SYSCLK) and
> LRCLK_SYSCLK is the source (ADAU1977_SYSCLK_SRC_LRCLK). The macro name
> reads like a clk_id, which is the slot it is *not* in, while the argument
> that really is a clk_id is an unexplained 0.
> 


Thanks for pointing this out.

I'll verify the first capture-open behaviour and revisit the 
initialization sequence.

The current set_sysclk() call is in hw_params() because ADAU1979 is 
configured with LRCLK as its source, and the LRCLK frequency depends on 
the selected sample rate rather than being fixed.

I'll investigate whether the source selection can be initialized earlier 
while maintaining the runtime rate-dependent configuration.


>> +		if (ret && ret != -ENOTSUPP)
>> +			return ret;
>> +		break;
>> +	default:
>> +		break;
>> +	};
> 
> Stray semicolon
>

Will fix in next revision.


>> +
>> +	return 0;
>> +}
>> +
>>   static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
>>   				  struct snd_pcm_hw_params *params)
>>   {
>> @@ -255,6 +299,12 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
>>   	int bclk_freq = sc8280xp_get_bclk_freq(params);
>>   	int ret;
>>   
>> +	if (data->priv->snd_hw_params) {
>> +		ret = data->priv->snd_hw_params(substream, params);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>>   	switch (cpu_dai->id) {
>>   	case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
>>   	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
>> @@ -461,6 +511,12 @@ static const struct qcom_snd_soc_common kaanapali_priv_data = {
>>   	.wcd_jack = true,
>>   };
>>   
>> +static const struct qcom_snd_soc_common nord_ride_priv_data = {
> 
> Again, can we drop "ride" to make it nord specific?
> 

Ack, will use the qcom,nord-sndcard.

Thanks & Regards,
Rafi.

> Shawn
> 
>> +	.driver_name = "nord",
>> +	.mi2s_bclk_enable = true,
>> +	.snd_hw_params = nord_snd_hw_params,
>> +};
>> +
>>   static const struct qcom_snd_soc_common qcs9100_priv_data = {
>>   	.driver_name = "sa8775p",
>>   	.dapm_widgets = sc8280xp_dapm_widgets,
>> @@ -564,6 +620,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
>>   	{ .compatible = "qcom,hawi-sndcard", .data = &hawi_priv_data },
>>   	{ .compatible = "qcom,kaanapali-sndcard", .data = &kaanapali_priv_data },
>>   	{ .compatible = "qcom,maili-sndcard", .data = &hawi_priv_data },
>> +	{ .compatible = "qcom,nord-ride-sndcard", .data = &nord_ride_priv_data },
>>   	{ .compatible = "qcom,qcm6490-idp-sndcard", .data = &qcm6490_priv_data },
>>   	{ .compatible = "qcom,qcs615-sndcard", .data = &qcs615_priv_data },
>>   	{ .compatible = "qcom,qcs6490-rb3gen2-sndcard", .data = &qcs6490_priv_data },
>>
>> -- 
>> 2.34.1
>>
>>

