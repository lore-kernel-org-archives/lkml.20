Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793090811;
	b=HAlw2vZsL/DOfo90ZfwtxTlorFr4fSu6yBCkGmgmMq2heaUzXyMT1iVXnz5qSqHPQNSE
	 QFeTVv3d99TaIprblrSw1EZNeufpJ4zVXXLHEz4vs0pZ4qATVcLW0lK8SOCwW51Cvg4YW
	 +hgqeLbyukzZKIcItcuWx4dDEJuP0+Zfmu5GU6ykDR6xpOwkR8uvDfCsqlfIM/2XnDKpS
	 CDlI8N3bPEbWwxo45c6QPRiZqemDjKsQGTm68aaL/cfTwbrDRkIXvaU1XaJNix558YxD+
	 UGOvl5T+VE7tppJbR3udRvLIOHRywx1VDPyiVFO6oBEwwvuYqyBvvkmbTupOwMXAx/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090811;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ypDb7Fx0jCCgb71eZZNRxztqQABOHADboWn0F4UJcmI=;
	b=MOcNpb7zGjuQQl1varls2Kk71N3rnCQMgVvmoHqzoPlXcTE3oWwbMV1J7X8CaWBA8QpN
	 wvFydjv4GfO4RO5O5m7PfMSkfYAFr/c18ZLMCQkwtta7hRYdJeFgiyCml8uQCWobFvMcb
	 Qb1McMS5MRAom4V/Y7w3y//ZgBzrtpcZxZp4T2+8uLhybjeh2RdvgOw9eY6Bk20xFo7KK
	 qE0mS/26ZbLLSY9O96eVyJWI7rM8HxtGMF/+xCREX6C63xIpDAAbAKX/1VJg6GMu3nTTt
	 lTYt3uKQ9Pblla1boUh3WvkzIsbqoXZElU68p54l+e73m+q1kL7zEGo9Oeut3u/agfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KTdhWAjt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a0OjA57I;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88D7606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:46:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E88D7606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KTdhWAjt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a0OjA57I
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R8g5751672121
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:46:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ypDb7Fx0jCCgb71eZZNRxztqQABOHADboWn0F4UJcmI=; b=KTdhWAjt5rkg4prv
	4SfvThM8b7bcb4GpC7SEFdioLLTO4J+0qVaNZ0+oIo4JAshlHyRDAjX4OPaMIJqL
	ggEOxJIVB7E5aZpcHjVAFj+bdb/rCpBZ+36HkLuR099m5id0pgfR06BNcAWTslL+
	sdkk1feYqlv7e216X9PVM4Sv2aezzxnPkyDEjGuk1sXJePEF1R6wfTakMoWchKhZ
	PvqQVJGtdWFLIfh9/LMGp4ZPkkQgURZxqJrUuNa0aVLJyGsSitZKCPR3/P+DcHJn
	mDRGaH6zeIWqUzX9T66gldRC0nesnkDTFLjFVbagjzWuuj4zgASp84AU9VxpndTk
	bxzppg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjfavsy33-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:46:48 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3adeba76cadso2123618a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793090805; x=1793695605; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ypDb7Fx0jCCgb71eZZNRxztqQABOHADboWn0F4UJcmI=;
        b=a0OjA57ICx4pRQJNOLTfymaINATwDTSwuJ/m0RuwXUt6PdfurrAI0tAw1Ndectyhnt
         MY1ix/xsZZQffMt6FC/ZqZal+wJvcoCjqj6sIKMi99Gm2AacGWCLqQC/W7mtNBjDy+7n
         b12cDKSpE95MpfDQCRqp1SvXVYpWEtNriiSEslAMBaO9gQfODmDVtGxzkH5poVKBqVnz
         Xd64icvYCXPKqRMDTyaFIffzV66/Px3EW+617f/s0dqvVF9+dpKJ2IWyNyMnchyEbQ3/
         ZhXgYve0855BzNkNI1tfwtb32xkdoLw01lBTUe+QKikcPS4N+qE6M3tbWGdnlYiW8Hjc
         uX+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090805; x=1793695605;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ypDb7Fx0jCCgb71eZZNRxztqQABOHADboWn0F4UJcmI=;
        b=oYqVA3YBTf6vA/9HJGK/x6+B5ZSbKXFA1MiH3//gHQCNrSfu67bunXte5jzMhQSljP
         ouEyR5NS4OZ+VROnp/fMkdoysgxIsYfMnCnySKyRU5Nf/yShKpEi2GrKs9utooaHMsPo
         gcL13oCVFlp3+UL9uxSrfF6/Hou338esRtDKY2Zb1miUgjD/RkT4vfxXfa2LG6QghH19
         mACpkjeM9DT6cYWnqjC40tRF4pGX1eTBbc26gaTyL209eZNKZsi5Vf+7LFNlOF5U92mC
         2+BFU82nEU3CPTOU0uD5VQRZmdozai7N8EnCJLItGpQx5PcLmoibacsGL2uDzZ9GrsXm
         AmjA==
X-Forwarded-Encrypted: i=1; AKwUvBwvjmcpA89Ey8skCjQcD/rbhNJEO2I+w54dBuUzKutp0AQFJUO8QcDZX1/yvzXqfconqk1J3aLKfW0ufNc=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5RXVTAm9C/rN78WnueA7RMCBG4zAGzMth3Gsq8TyzgdjF+rHq
	83zV6JPwfmhVAb2bNdXVv7woTQWhDHtuNte0Q0M6HSzg316bF/ugcHgwg5pqeFOmJ6U66Da65ft
	kLbAgAdZ4ycryM7AGm/5htQsnzIn88DmIYqIhSxQXm6LwnsZ4yinShP7V2aqM1urO0VE=
X-Gm-Gg: AYBFou3vKnogmqZ/SJJvLPyygCxNkq9jhShn+/n1xqBxCQnlvCB1f1S+HX7s5oLk8KQ
	iKk+8bVdwchEgi3+Ltinma89gv18Vt/AqFTkCnRi/bzWmzsfBxjHzzMEY36AeYhQbyLWkeohnF4
	7GiGniNWZ/HVuHv13EDXiga04FiyGR+vGS3FdG00E+mYAvl8KZXFwXAiIeSoOqqZlHx9FQmP1dA
	eNmzUq1WUcE4i6jku8WDzszhVUIkYR9VFJPxqft20suObCr1n3AMovlQPFxsLPpd8TIIVyA9aMe
	DaKO7E1+6hf1TxZ9uM/bAO1BJS9Oeiup/QPqHKgeG+NBcAzcdmE9vQGS+TuZcLGCISBiyrz6fr5
	6L7mrStgEmQzJFbLrLMpCL5DKF1tn5GRI
X-Received: by 2002:a17:90b:4a84:b0:3ac:ad90:7090 with SMTP id 98e67ed59e1d1-3adeb15557amr7792371a91.67.1793090804763;
        Tue, 27 Oct 2026 01:46:44 -0700 (PDT)
X-Received: by 2002:a17:90b:4a84:b0:3ac:ad90:7090 with SMTP id 98e67ed59e1d1-3adeb15557amr7792353a91.67.1793090804116;
        Tue, 27 Oct 2026 01:46:44 -0700 (PDT)
Received: from [10.219.49.187] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae404429a8sm2824282a91.8.2026.10.27.01.46.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 01:46:43 -0700 (PDT)
Message-ID: <2936b4ec-3203-4137-9d29-7f95f22186d8@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 14:16:37 +0530
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
Subject: Re: [PATCH v2] ASoC: qcom: audioreach: support multichannel PCM
 formats
To: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        shengchao.guo@oss.qualcomm.com, mohammad.rafi.shaik@oss.qualcomm.com,
        bartosz.golaszewski@oss.qualcomm.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261026082534.986449-1-zhangfei.gao@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20261026082534.986449-1-zhangfei.gao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Kbb6hSexPFCWKyvKQVmyesMmLu8Gduzz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzNCBTYWx0ZWRfXy6RurGzQ2+xi
 fnT2fwhds3ctc7Eip0kYV5iC11Dzsrsq+MtIcoo0/vUqfHNkUkTqnHKdGo4hGQn/jua5PcMfTq2
 Evkx68VK9uwY/SxQV+SmhN8aI5w6H5s=
X-Authority-Analysis: v=2.4 cv=EIeTQFZC c=1 sm=1 tr=0 ts=6ae064f8 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=npAxPzOB_l-6x8PHPlgA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: Kbb6hSexPFCWKyvKQVmyesMmLu8Gduzz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzNCBTYWx0ZWRfXyoURc+CP4lL+
 bN60YfapT+wJvxvqVlFhnL2f6ShqT8to5RLXtBdAph81274R7o57yVTsQkQvVzLYhyT9xcwIOS8
 cyHuj1v+qLVlhg8n+iAoLs3JkXQzuunaD1B6NzmK3UQkS1HpRjwbTvlAx7w8XRcQxSr6S5FkM0B
 Ob1kyTd3Tan9CzAdI6dwTadVkzMo060pQUv9ww2zR5Dyreg4PfjmIgxAeWur6cIKVdIr99eNNXJ
 13FNlkGa2bwxFSG3zjAui1yntZbCOs7f4Lynj6Yc1GEaBbPv2y6zIUl3d8AIkMYMO19UkJmFL08
 d+9Ha9DnVO45idfzZtriY5n8jRSR23wnzH8URcFF1Yv41ZkgR1aVUtY1KzdlSuFakuTbacBVgDi
 mX504v6rP6Oeh+Awaz7J6YfVooVg13EolTM479EDr2eR5PmoUnFbVMiNNYZPoxWPjJbgWCKqOjj
 XSulS769yaTYaUhqUyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270034

>   #define DRV_NAME "q6apm-dai"
>   #define POS_BUFFER_BYTES	4096
> @@ -344,7 +345,10 @@ static int q6apm_dai_prepare(struct snd_soc_component *component,
>   	cfg.num_channels = runtime->channels;
>   	cfg.bit_width = prtd->bits_per_sample;
>   	cfg.fmt = SND_AUDIOCODEC_PCM;
> -	audioreach_set_default_channel_mapping(cfg.channel_map, runtime->channels);
> +	ret = q6dsp_map_channels(cfg.channel_map, runtime->channels);
> +	if (ret)
> +		return ret;
> +
>   	if (prtd->state) {
>   		/* clear the previous setup if any  */
>   		q6apm_graph_stop(prtd->graph);
> @@ -1007,8 +1011,10 @@ static int q6apm_dai_compr_set_params(struct snd_soc_component *component,
>   		cfg.num_channels = 2;
>   		cfg.bit_width = prtd->bits_per_sample;
>   		cfg.fmt = codec->id;
> -		audioreach_set_default_channel_mapping(cfg.channel_map,
> -						       cfg.num_channels);
> +		ret = q6dsp_map_channels(cfg.channel_map, cfg.num_channels);
|
|
|q6dsp_map_channels()| changes the mono mapping from |PCM_CHANNEL_FL| to 
|PCM_CHANNEL_FC| and does not handle 7 channels. Have these cases been 
checked and confirmed to be supported as expected for AudioReach ?

Thanks,
Prasad

> +		if (ret)
> +			return ret;
> +
>   		memcpy(&cfg.codec, codec, sizeof(*codec));
>   
>   		ret = q6apm_graph_media_format_shmem(prtd->graph, &cfg);
> diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> index 83f2711bceea..fcc0267d3657 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> @@ -147,7 +147,9 @@ static int q6hdmi_hw_params(struct snd_pcm_substream *substream,
>   	cfg->bit_width = params_width(params);
>   	cfg->sample_rate = params_rate(params);
>   	cfg->num_channels = channels;
> -	audioreach_set_default_channel_mapping(cfg->channel_map, channels);
> +	ret = q6dsp_map_channels(cfg->channel_map, channels);
> +	if (ret)
> +		return ret;
>   
>   	switch (dai->id) {
>   	case DISPLAY_PORT_RX_0:
> @@ -173,11 +175,14 @@ static int q6dma_hw_params(struct snd_pcm_substream *substream,
>   	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
>   	struct audioreach_module_config *cfg = &dai_data->module_config[dai->id];
>   	int channels = hw_param_interval_c(params, SNDRV_PCM_HW_PARAM_CHANNELS)->max;
> +	int ret;
>   
>   	cfg->bit_width = params_width(params);
>   	cfg->sample_rate = params_rate(params);
>   	cfg->num_channels = channels;
> -	audioreach_set_default_channel_mapping(cfg->channel_map, channels);
> +	ret = q6dsp_map_channels(cfg->channel_map, channels);
> +	if (ret)
> +		return ret;
>   
>   	return 0;
>   }
