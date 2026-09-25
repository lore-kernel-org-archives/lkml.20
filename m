Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB7A3DC4C9
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331779; cv=none; b=b/AuTvxdvZI6Q2uBU+1Vwirud6ypRXjv0EtNrw0cWw+AFhv0RJR/00J0fhlrZsjldTEG86vkCfrGYTYR497vP7iH8wttZ/1QYWClBLsuLd4emAVGPYwt2JXQ22NfqKXqbn5g3TI3G0oGE+VsdDDsX5dJyojU/TxPq4xYxRT9+W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331779; c=relaxed/simple;
	bh=1cmzu38BZTVImyIqdtTjj0k7aNrM8I7PU5Q9+EG6ptI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E4vvIP0JVeyO6usT28+9c8ydCo72WG6fA7U/IrUnTkf7cU5Au4vQNXsCEuxY3XoI6oyvgYT62VpVg4ydsgAPR8+y9eRRVZZDJWuADwr5ZpkEn0xISVCNbMR8a7dNYveREL6KRT00ZUo/H565r3YAOfjQrGFgRZ/xU0KWFOITi9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=agib69Rm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jNYgXQSa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="agib69Rm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jNYgXQSa"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4Yv2H290278
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:22:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jwu3NcQ+CW5et/xwH4aeftAa2eLuWNrGQO7E6h/ovWc=; b=agib69Rm35i7GJMX
	I9LgZGOPvjRbA7C2UNUs+xYo88+KdFN49okAjALVWC35/WAUsa2bsILGbg+k08uu
	pFk9SKZlyQkT3IxV/bVlCSkiF9vTq+F7IQTaSfzuqfe95/yqJHtLRol1gOHE+3K0
	MHghrg3WQLGV4QrSQW040oRhqnBm+cTc2OVH1+WowaAglni/NIamsuoMWhdne+eK
	oaj8ML0EMKPeKxjQUWAR9nMflfu9aj5bU4amxqaM8BcnuZqyLokRUgtv6K1/B6Np
	fx5mEb6QF2NID41Ph+WMnd+slu+S5SBFzJ9iCorev4B1jkJnMXBZ5Omrdke0GBx9
	IgAc4w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw881u3ke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:22:56 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-331b2ec616fso2814319eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 03:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790331776; x=1790936576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jwu3NcQ+CW5et/xwH4aeftAa2eLuWNrGQO7E6h/ovWc=;
        b=jNYgXQSaVY4C/XJYz4xh3MstM1M16OC0VnI8FKqx2miMLZwAUwwZxPY0wbt1adB+2I
         bOtJlxpVpRErMc0g9mY9GVCGS4MziSSU4uH64qoTX/PeXVlRN7U5vM+MxDUpjK5sxM7n
         PA3YCbItLUx03gcFhlY20yUtkkyjci9QH3CNLXb+RmT1mnp0530QXcTuMZhX77vXDCoi
         OFA1uLMXNXbQUaz9BwsWD1zBjVIT96Ovz/k7lyHF1DSgz7xppyUtdGYyTQ61LKEG6fzh
         W6NF5O38Mxk5nfi5mS5/6wv3sLZ+iOTNtUQ5jArnXD1WW1AedveuQqwBlSl//37n8mq7
         Z/IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331776; x=1790936576;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jwu3NcQ+CW5et/xwH4aeftAa2eLuWNrGQO7E6h/ovWc=;
        b=YOk8IL3Zj/9YpbRuJJ6hi6QePRd8F/ACujU+7FCpXnhOvhsgy54Epc1UoQdNda4f/J
         rpZLg+ldVvwH6XaRun5fuPORdB6Zrarb2m4fG2rmIqCjvBrloF1FUz8atSgEnpIJA9EZ
         ITLlahFMUi0/sTv0K92V0UdFZdsFejYld4+IrpZIyaT9uxYwdwluf5ccQoZLJY8k0TTb
         PHww0JZ2A5BYg25E2DmqnWIcNHRICGMs4EU6skbWmYHayFhbXZ4+BW9gXPKP9lz8povK
         wG2NMj3sT5jNs4pV15ltELO0LDZFRldwU5HmwGYVz53hVKi3zA35eZs6/6N8XdAc/9ft
         LlmQ==
X-Forwarded-Encrypted: i=1; AKwUvByPyr8n8TMzNAMArBEaZmnt77bw9spwXFiuOo/t9iiUu3ZOMcB1K5b05pBA+VQ+f8YpIY1hwpbuNVfsJ9M=@vger.kernel.org
X-Gm-Message-State: AFuF++kirPhyV02QiAUqN6JU7jml+iqRkgwO5sc+3ntQvZH1xS7N70JU
	2HcFhpWx43SfL+ly23wZp2fFFc2vgF6tHOrylLmyxA4HzOeSOARVcN5KG9X7RqNgEzCGoW03nBp
	BhX81JUzMvWstSOElw1mbQ/OJBnofniUbOmInO7+D48FLn5wUWeMaSbuRRuQZuwLBPpA=
X-Gm-Gg: AYBFou0rCvFsN1R0JYR+B4AuEBNZqDhKxQX145JLA6FyrhEwHcM2iUE7YR3I5yI1Wqo
	YQ/DPQztaYejsbQ7RAr1qPZXS668+koAF5jNRxsx3h0NEIlSUVhSs0o6GSYlpX969LlLqn7sdIN
	FIPMFvtVcQL64FMVVrPfcOnZSCnWFBkOxldUu4wXZPFDijvIKhfte2K/MtxMhScSoIoBxUPaegL
	p206wOzs+BbFx1vRDL6/HUnA3MiVI/izatmGTpgCdnG/oRTvX0k0xwGjvCErTHFz/cKOnnTE/rU
	lfKBZ95i/BStfgWEBiQNxWCuwpaPxqwZkn58fP2sa8k/nToKklaYh3vmkzremF83vJqYZntjJB8
	Rs5Q3ArA/l6DcFqnpqH/sqBUWqU12
X-Received: by 2002:a05:693c:829b:10b0:33b:e21e:4a3a with SMTP id 5a478bee46e88-3400439b178mr5535318eec.40.1790331775553;
        Fri, 25 Sep 2026 03:22:55 -0700 (PDT)
X-Received: by 2002:a05:693c:829b:10b0:33b:e21e:4a3a with SMTP id 5a478bee46e88-3400439b178mr5535274eec.40.1790331774685;
        Fri, 25 Sep 2026 03:22:54 -0700 (PDT)
Received: from [192.168.1.25] ([122.183.173.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3413fc2413dsm5474040eec.0.2026.09.25.03.22.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 03:22:54 -0700 (PDT)
Message-ID: <2c37b9fa-9810-482d-8ca3-67072a0f9072@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 15:52:45 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/8] ASoC: qcom: lpass-tx-macro: Add support for Bolero
 v4.0
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        ajay.nandam@oss.qualcomm.com
References: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
 <20260922-add_shikra_support-v1-7-6c6cb6444caf@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20260922-add_shikra_support-v1-7-6c6cb6444caf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6ab64b80 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=uk8ae9/F1LYL5lfeGCaUoA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=NHDDfAIwdS3HBU7MvnUA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0MSBTYWx0ZWRfX+cqhosarM0ZJ
 zahax/Pa4SofR5FggefkyXBbhuuk+KtogC094rSk1o2PZrSDxWNRGJNkWL8Q3VEjVVcnTY+YOVs
 uiwzaRA3QZRhn+Z/b+6YQXMnkXnjwA5uaN9myvn4YTyKUS3WUWarBRbJuoHEhyJi4LvqjpiiatG
 a05mEBn0nD2eChM2uueIMGT/OgFPxQ92b/uNS7LOJN8BFN65sm+tRl0ogXdVWQYSu908E/iFsoO
 s+vQzVqqhSNpo5SR89dclvCNLrZ3Pa2TBk6u861dNelO902+WvvTsdEwSl1M99gm6fzL7JKBPBq
 5uruTUBYjtJLuGfkp5ibM53PuKrf4Z6PWpwDPZargX84fYMFrze7qkayjVqKnQ777jK/X87rOue
 bby5FSzvVmU4lNd1RnMWDAGPwtw6R7F1o2O+CAS3zXR2OuqXD6u3igw87YU6cPYBFbWyC923HBj
 YUZUo0frrPHoqTjY2Bw==
X-Proofpoint-ORIG-GUID: wpEE6mT-0wZEuDbsDMIA8iEenIJH1yQQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0MSBTYWx0ZWRfX57ttR91NkqrF
 5gJeT6Tqy1enh9UddLSLoAZIfGNrGPjxidxsjlvETq9VoK9JCFwyXj7dDZa3fbv1R5ObomGIq5v
 Y6RS/49RDMR6Ni9SkAwIrEv0yYb9N5I=
X-Proofpoint-GUID: wpEE6mT-0wZEuDbsDMIA8iEenIJH1yQQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250041



On 9/22/2026 3:12 PM, Mohammad Rafi Shaik wrote:
> From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> 
> Hawi integrates the Bolero v4.0 TX macro, which extends the v9.x TX
> macro with a port-select stage in the SWR microphone input path and an
> adaptive filter (ADPT) block.
> 
> Add the additional CFG2 mux registers and per-path CFG2 registers to the
> register map, extend the maximum register offset to cover the new ADPT
> control register, and describe the new v4.0 decimator, SWR microphone,
> WSA and port-select mux widgets and their routes.
> 
> The ADPT block has to be disabled before a decimator is enabled. This
> register only exists on v4.0, so gate the write on a has_adpt flag set
> from the match data rather than issuing it unconditionally.
> 
> Add the "qcom,hawi-lpass-tx-macro" compatible and its match data to
> select the new widgets and routes.
> 
> Co-developed-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
> Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>   sound/soc/codecs/lpass-macro-common.h |   1 +
>   sound/soc/codecs/lpass-tx-macro.c     | 442 +++++++++++++++++++++++++++++++++-
>   2 files changed, 442 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
> index b52665b11e35..707b22a6bda6 100644
> --- a/sound/soc/codecs/lpass-macro-common.h
> +++ b/sound/soc/codecs/lpass-macro-common.h
> @@ -16,6 +16,7 @@ enum lpass_version {
>   	LPASS_VER_9_2_0,
>   	LPASS_VER_10_0_0,
>   	LPASS_VER_11_0_0,
> +	LPASS_VER_15_0_0,
>   };
>   
>   enum lpass_codec_version {
> diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
> index 6deaaabe43af..b1eee16e968c 100644
> --- a/sound/soc/codecs/lpass-tx-macro.c
> +++ b/sound/soc/codecs/lpass-tx-macro.c
> @@ -67,6 +67,14 @@
>   #define CDC_TX_INP_MUX_ADC_MUX6_CFG1	(0x0134)
>   #define CDC_TX_INP_MUX_ADC_MUX7_CFG0	(0x0138)
>   #define CDC_TX_INP_MUX_ADC_MUX7_CFG1	(0x013C)
> +#define CDC_TX_INP_MUX_ADC_MUX0_CFG2	(0x0140)
> +#define CDC_TX_INP_MUX_ADC_MUX1_CFG2	(0x0144)
> +#define CDC_TX_INP_MUX_ADC_MUX2_CFG2	(0x0148)
> +#define CDC_TX_INP_MUX_ADC_MUX3_CFG2	(0x014C)
> +#define CDC_TX_INP_MUX_ADC_MUX4_CFG2	(0x0150)
> +#define CDC_TX_INP_MUX_ADC_MUX5_CFG2	(0x0154)
> +#define CDC_TX_INP_MUX_ADC_MUX6_CFG2	(0x0158)
> +#define CDC_TX_INP_MUX_ADC_MUX7_CFG2	(0x015C)
>   #define CDC_TX_ANC0_CLK_RESET_CTL	(0x0200)
>   #define CDC_TX_ANC0_MODE_1_CTL		(0x0204)
>   #define CDC_TX_ANC0_MODE_2_CTL		(0x0208)
> @@ -108,6 +116,16 @@
>   #define CDC_TX0_TX_PATH_SEC5		(0x0424)
>   #define CDC_TX0_TX_PATH_SEC6		(0x0428)
>   #define CDC_TX0_TX_PATH_SEC7		(0x042C)
> +#define CDC_TX0_TX_PATH_CFG2		(0x0430)
> +#define CDC_TX1_TX_PATH_CFG2		(0x04B0)
> +#define CDC_TX2_TX_PATH_CFG2		(0x0530)
> +#define CDC_TX3_TX_PATH_CFG2		(0x05B0)
> +#define CDC_TX4_TX_PATH_CFG2		(0x0630)
> +#define CDC_TX5_TX_PATH_CFG2		(0x06B0)
> +#define CDC_TX6_TX_PATH_CFG2		(0x0730)
> +#define CDC_TX7_TX_PATH_CFG2		(0x07B0)
> +#define CDC_ADPT0_ADPT_CTRL		(0x0800)
> +
>   #define CDC_TX0_MBHC_CTL_EN_MASK	BIT(6)
>   #define CDC_TX1_TX_PATH_CTL		(0x0480)
>   #define CDC_TX1_TX_PATH_CFG0		(0x0484)
> @@ -186,7 +204,7 @@
>   #define CDC_TX7_TX_PATH_SEC4		(0x07A0)
>   #define CDC_TX7_TX_PATH_SEC5		(0x07A4)
>   #define CDC_TX7_TX_PATH_SEC6		(0x07A8)
> -#define TX_MAX_OFFSET			(0x07A8)
> +#define TX_MAX_OFFSET			(CDC_ADPT0_ADPT_CTRL)
>   

These registers look v4.0-specific from the commit message, but 
TX_MAX_OFFSET, tx_defaults[] and tx_is_rw_register() are updated in the 
shared regmap configuration used by all TX macro variants.

The explicit CDC_ADPT0_ADPT_CTRL write is gated with has_adpt, but 
regcache_sync() can still sync the new default registers on older 
non-v4.0 hardware because the regmap config/default table is shared.

Should this use a v4.0-specific regmap_config/default table, similar to 
the VA macro, or are the CFG2/ADPT registers guaranteed to be 
harmless/present on all TX macro variants?

>   #define TX_MACRO_RATES (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
