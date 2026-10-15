Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992523DC861
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792054705; cv=none; b=lVXUjj0QK5uqdim7Yiys7ql/uzaIpjauyYamO8TzbtFDO9qwL4OJB/P3p1ZxLkZ2gQkQFkxL9IvpDBwxpjil35fvd/hdywNP95itS3kxWeKAP2FGrJC/NEPamlDJtVqc6tGTQvEppq91S3YM3w7yKzUbduwQyApeTHymukvUYIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792054705; c=relaxed/simple;
	bh=7/nbnKW2nnSc1ficaU3jxNOx9sR8BYEaxPIvZsMJXS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e7svBjURIGz0gUAK8a7bXtSjUYOQtFrXptfnJ1vZ9KinTkZ29pbkq0LKiCgsXKTxChxpGf3+mvBzdEYDRP4L++vdOPAkdQzMUqLYd6IzVqariH9QaWhXI577tErl6Mo2EAagGZPxsbqhOv31noeSD+XKd8p0jIzbOSr9LNm/3as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EhHaThTG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mq2RjpMl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EhHaThTG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mq2RjpMl"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F7IiiM1672284
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:58:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xzOVLDhYNiCkQyabQc2njLlkkws8G7Pe3EA53/TYwAE=; b=EhHaThTGShAQNBVp
	DJYfPNHjEN4GPhS/1KePXbs69A8LhyZRyAALD2YuXjw4V1yYRQAHrWLLTlZh1HAz
	ZyerWizZH/8tVmmaoSFh48lEJtwtXG7134jOShVAt9Pr0mvPZTXhfM74Y0OurP9s
	L/uVyhSctgeG/SM/8TaTaHMl1DrqnUDQXxtRJfUDjjI7KmbkmlmcpbvmAHa5R3S5
	wGOvXYSPDKtQw/ezh0nhDe2lR81wCmwpjld6QE79qqfifSGoQ3CD/nCyrEskazQn
	ue7hqM0GwY8neJlsNsxtzNDvQcSU1bunfbkCNv3OQAprQOP+mbpyuS8HIwmEo6dC
	SoExNg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacrhbhh4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:58:21 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-917baea8e5dso90350066d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792054701; x=1792659501; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xzOVLDhYNiCkQyabQc2njLlkkws8G7Pe3EA53/TYwAE=;
        b=Mq2RjpMlZZ8WmpXZVssRLw27+2X7CHXLus3Mc8bI4bRzA6w1LTNX/MN66kHRF03uqB
         qCyAGu6wssMCmfsDliAY2w/C9pk7mUNTEG/D+SKZt4ro/tavSWve6Suf7y+YLg8//XhU
         AjRV0wdl6Gg1V8XmghhM5JBylv6k+7CBOSLUYzF6rx4nKs++hz75jsWYmPj50k69HI+U
         wHweAQbVcf5jpgLt1UMWhNwR8QRxAz5mN9L80dxeIM3liGjcLRnsfM0/vLcIMnCcBWSc
         pvUHMNCoYW3LbUgaLs9T6Npf7vK/ECqG8+RGSPeMhkL5r7nd8Y/ogCQE9sxFld6hrSpd
         ng5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792054701; x=1792659501;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xzOVLDhYNiCkQyabQc2njLlkkws8G7Pe3EA53/TYwAE=;
        b=fjX4l5Mx8ks3YJQH8MTzf8rzxeYXnStMLfJYQnKXgre1meB3K75Mjb4PdjcmcHqScK
         bvKkmCDKvEYlcs9j1lrFQGwUqTP1XmSWEG9+/3g0xmYoHEUwDqkc6chnflzv2CLTbNA/
         bGgEggOniHH+qQGL+hmiG8nIsmrPHyOUT9ep3dDAGFnUJzcjshClBIbDVdbED7mbpTvj
         MLzZ6ywXsBwTCzzWEfE/rldlERU5H1Ltkk32vM+n7MzSQ+G1ZfDHYlp9h5pA3BvnGb0H
         OK42YXKZ8+tYD4Y11p2WhyhPDqYCnpoT+1YZJYV2gTEbWGoHCFJly1JoBYxRRybfzwss
         cMiA==
X-Forwarded-Encrypted: i=1; AKwUvBz59XjZJv6sgALGoE15fDEi/64NkwaAX7Qit3eIZCHai2mVN1MskNnouZyUN5N5XoRzUFiNiCAfOY+XXt0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwNqokYR0VMewKe+g401jsRAyuyAxOOxKIDjfv/q3CMF2FD0mv
	Yz3z/kpKPrrRLziI8cpN5lybOH5NmJIg30oepfN/pn+kG9P25P0eAYMV3XtjsKntnXJqx+rohx/
	Q+jNufai9QHQwaRvh8x1D2z4pstsVzBZIXig5R8KkuBDxkkNu/0fG2cez3t4PBQnIE/Y=
X-Gm-Gg: AYBFou2Yo07hyzduX8kcJN7gU7SRwV8dxmYP73KpVDAkisksii5WBY9uxofLEJ+5ENm
	9X+gSlZ5kKHt/hLukXWoyVzmL3GITkhJuii5779p96cXEAvvEiJCM29SnTDxf/dZo9uPmvP+0tL
	e/aSpzL5yfHQRkVuZJU0L6jiVe3Z/TsXt/hK0nN5UI71pNOsUVYehRmo8VihFIuBX+zeewKrZz+
	5I7svM67IAv9UPtRuw+DcwUwINy7B7EYlx+c6cWKOQGG/WZEwf4TDmNfmCTm4QCIr91T1o6YBf9
	R7if66bBpAwgJvfomY6MGbQN/rqxlZwcEznVgbaylT25adSaQKNwyi8oUnpz0Hf2nt/C65wF7J+
	8mPjJ0nKznHWd5ccxFVXTBdkJtg==
X-Received: by 2002:a05:620a:7106:b0:93e:95ce:53c7 with SMTP id af79cd13be357-93ebd0c08c4mr2959769985a.4.1792054700567;
        Thu, 15 Oct 2026 01:58:20 -0700 (PDT)
X-Received: by 2002:a05:620a:7106:b0:93e:95ce:53c7 with SMTP id af79cd13be357-93ebd0c08c4mr2959765385a.4.1792054699680;
        Thu, 15 Oct 2026 01:58:19 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1bd68144fsm40551475e9.4.2026.10.15.01.58.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 01:58:18 -0700 (PDT)
Message-ID: <690b96e2-af53-41ed-aefb-0475f9b48abf@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 09:58:17 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 05/10] ASoC: soc-core: Add snd_soc_of_xlate_dai_name()
 generic helper
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
References: <20261013-b4-qaif-shikra-audio-v9-0-f3022e28f2fd@oss.qualcomm.com>
 <20261013-b4-qaif-shikra-audio-v9-5-f3022e28f2fd@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20261013-b4-qaif-shikra-audio-v9-5-f3022e28f2fd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -bBnXcbqzH8Dh-XsI6aNQTCLGw46CMDF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNSBTYWx0ZWRfX47M+plUReAb1
 XAAYJDSj+jbRrMB/WntsOLeT2VmwIvX9CNgOy1MnQRfqxWVsdDwZYjQCgrV44vsGs89aC5MAZji
 nyQesgO3YJrX8FPFf4SkFtRsDHExWpE=
X-Proofpoint-GUID: -bBnXcbqzH8Dh-XsI6aNQTCLGw46CMDF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNSBTYWx0ZWRfX1BoykLOk0NrS
 aXe0VOAVVUvVatR+9y/NX/BA1vs/hol5LzWYDi1jDl4rGqHkSL7YCzYWMZK2RzsODO8HlITLZJS
 zjFie1shvpU9LZxMeS4vcN3OlgDH0wUy9gaurhDNa59402JiUOqoAFtKzBlQ/NKK3c5KcYp/DRE
 TZbhgeuSWtapOmlGNqZOi2IrWd8+0sBetAUowHsV/dkrdrTc22YZkHMyVaUyi9ZPuA8xyNuJSh2
 cszZonk9MmvHtLpKH0ifPKmXWasnDtMq/h7+exFqkQQVOgmdBYccZ+NQeynpDpEzbKOueXPS+Z9
 R5QtSldbbJCYTD43AnT6Y7xj10NAuOMCNdurTCkrMjrY/flcBdfhnaP77oKMdftPk1YbhUR/82k
 B5fSv/IP5Z5AoVaBcdsrlB4C2caLQaX1twWCvXlAdM5s8rlSLPX6teMVNY2e9BZOGoXlnRlmpJ0
 /aS578ahAhl7Wh151GQ==
X-Authority-Analysis: v=2.4 cv=SYZi5fRu c=1 sm=1 tr=0 ts=6ad095ad cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=sFjlhk_xisyrceGg6AoA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150035

On 10/13/26 6:51 AM, Harendra Gautam wrote:
> Some ASoC CPU DAI drivers need to resolve a sound-dai phandle argument
> to a DAI name by matching the argument against the component's DAI IDs.
> lpass-cpu carries a local implementation of this lookup.
> 
> Add snd_soc_of_xlate_dai_name() to soc-core.c as a generic helper
> that can be assigned directly to the .of_xlate_dai_name component
> driver callback. It iterates the component's DAI list using
> for_each_component_dais() and matches by DAI ID.
> 
> Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> ---
>  include/sound/soc.h  |  3 +++
>  sound/soc/soc-core.c | 33 +++++++++++++++++++++++++++++++++
>  2 files changed, 36 insertions(+)
> 
> diff --git a/include/sound/soc.h b/include/sound/soc.h
> index 553bb7e2be98..6f15086f7313 100644
> --- a/include/sound/soc.h
> +++ b/include/sound/soc.h
> @@ -1329,6 +1329,9 @@ int snd_soc_of_parse_tdm_slot(struct device_node *np,
>  			      unsigned int *rx_mask,
>  			      unsigned int *slots,
>  			      unsigned int *slot_width);
> +int snd_soc_of_xlate_dai_name(struct snd_soc_component *component,
> +			      const struct of_phandle_args *args,
> +			      const char **dai_name);
>  void snd_soc_of_parse_node_prefix(struct device_node *np,
>  				   struct snd_soc_codec_conf *codec_conf,
>  				   struct device_node *of_node,
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 06167a198591..609706733bf1 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -2906,6 +2906,39 @@ int snd_soc_of_parse_tdm_slot(struct device_node *np,
>  }
>  EXPORT_SYMBOL_GPL(snd_soc_of_parse_tdm_slot);
>  
> +/**
> + * snd_soc_of_xlate_dai_name - Resolve a sound-dai phandle argument to a
> + *                             DAI name by searching the component DAI list.
> + * @component: ASoC component to search.
> + * @args:      Phandle arguments from the sound-dai property; args[0] is the
> + *             DAI ID.
> + * @dai_name:  Output pointer set to the matched DAI name on success.
> + *
> + * Return: 0 on success, -EINVAL if args_count != 1 or no match is found.
> + */
> +int snd_soc_of_xlate_dai_name(struct snd_soc_component *component,
> +			      const struct of_phandle_args *args,
> +			      const char **dai_name)
> +{
> +	struct snd_soc_dai *dai;
> +	int id;
> +
> +	if (args->args_count != 1)
This only works with sound-dai-cells == 1, the api itself does not
reflect that fact nor the kernel doc.


> +		return -EINVAL;
> +
> +	id = args->args[0];
> +
> +	for_each_component_dais(component, dai) {
> +		if (dai->driver->id == id) {
> +			*dai_name = snd_soc_dai_name(dai);
> +			return 0;
> +		}
> +	}
> +
> +	return -EINVAL;
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_of_xlate_dai_name);
> +
>  void snd_soc_dlc_use_cpu_as_platform(struct snd_soc_dai_link_component *platforms,
>  				     struct snd_soc_dai_link_component *cpus)
>  {
> 

