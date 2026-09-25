Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589883EFD3D
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790324069; cv=none; b=TUk8j8Qzyxo3x31YmYgyVcdFHhCDm11CsrdDCOejv3Y6ovUWdY5jvxssDg7Scgk6N/Ys5E+m0xfAb08OPYxwd6Mr/iNl9U/xVkvdE78kPq8Ct4Q+omhNoLPumqa/o6oN5Kmtf2rA057t9TF+lYDpjlkqW33h0V0YDgDuY1tKfEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790324069; c=relaxed/simple;
	bh=RfM1E3VYKX9wiL+0X5EDW/fIg41SnkKGkIi9naOno2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nuaq3yyxWroQVI+J+6is4HSVhJp8Py+iSAmbGO/c/PqTpl8mjOSGIYc+dM7JJeA9yh0tErt8lBXWgbyo1+DDvd4wF27yjp70Et78m1QP8C5wpUv3CZfa2OLXGv83WB0sVAD6gzpOLb2NAaLu+WjDXQl08PngHoSnZhJZjt1Jttw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mnAc4f4V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gzm3MeaE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mnAc4f4V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gzm3MeaE"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4Ypb3039889
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:14:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3tN7fzTN6Fvf4xQakRN52v4FP1Y7P2zuIjqDy4DV+jE=; b=mnAc4f4VUJsj19FL
	Q1P9Ok/vWPgoWXUfsOUT/oG0C/dZQep5KFBAZzGPmCAfZzLGzPf9VFRvEvSOXJbW
	BHhNXwWhljr+f07X7OAsiv/C1bcUVJ+tTJy6+SW9oE+rsswoiDSoFbvyGAeuxz2u
	56jKtKlCLQZQasSfIaEAS+kwtIXLvIeTm7XTZp8tATijSTPo23W5v2iwa5NlxItN
	J31k0IyNdRxCASy6lezOI+nIcyylkcpTv+5nOXDhqwsQTADQMP76BBhOolQAK1i4
	p4Xm1mexo2uMNW5YsNnYycyLuaOtFxpVyz5mk/zjnlqA59JwpxJ/HWbO/S/LnExQ
	PSPFew==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw4653u40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:14:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936aa34873bso117583785a.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 01:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790324066; x=1790928866; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3tN7fzTN6Fvf4xQakRN52v4FP1Y7P2zuIjqDy4DV+jE=;
        b=gzm3MeaEKmbisBMrND0QNFPBfDxtiNvumTPR8yFC23rXRewkvq4fPnEKuJ/dvTQkFb
         v7RwRjZ7JYsJRGLHHgUqBmWBQAMVgT7RDAICeUuHTRhNK7JkyAJnWL1zx49TrBm49M/l
         A3UBrOTxpWtUKRufGWjvvXQD3uh9rRGOvoZ5HtAYdbUtzKsdFD3vRf3juEZaG0KMAPSA
         p6So3t64CgxxBQA/jSDi8cQyS0yAX/HOzcQ4KDz4w4bCEqPfCfYwnUDIoQoWOPOW/rWS
         81P2rbfj7cqSG4VGABpe/B4Uk0BFd16Bi6XKbhUb71+mFln5eakjaQu8MHNTwan55lpf
         sLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790324066; x=1790928866;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3tN7fzTN6Fvf4xQakRN52v4FP1Y7P2zuIjqDy4DV+jE=;
        b=cY5H78n2DoyJyHMkMtnnAgwAhGTT04c6sV5Kunorsxp3+PaN0qyb0JfpdqlCTOVv/O
         oWSyu8jndN3qe8tpxBO8tP31pvv742FBZGIb/JzSgzUSYfrVrPKzwQiCno2Be6mphPS1
         ltTGvNKQZpCvgBuylRMbPy00o+ifQiB8Jc2BWO9S1V/FbOSo5uKoer+OIKXvbMWkZTlG
         Ooi+Bid09cc+LERWzwtlFX4nKnTSfzv2BEJS3vPaxisWtvRjfB8S6/yFeVW4z7xdIjAi
         TzOTJYrwYbkWW36rAuG7YJMNsJP2vjVgMw1a2DT5VSgzGfb9FcL8s8+jQHHK6ifLZCQb
         Gv0A==
X-Forwarded-Encrypted: i=1; AKwUvBwqyo5yt4tguxRkq3Es8Lj9Cw4oXRA1Mel7eEWuCETirU6iFFGVmtAp6+9TxvXlhv+WDjQmk0bBQWGYc3M=@vger.kernel.org
X-Gm-Message-State: AFuF++klEQ3a3UFF4AahNb6GlVs0M4fLzdEqckhh4lIdt7EO1rx8qEfM
	hWwFeuYGWxMIkTJadBHBWxKVDCLtsFMKRqR9rzSVM6W6tTmeYAyt4R+H7F70u/jHGodfecWe9/f
	6WW7RGKAnnWOfmjK2VuAcZqDrCHNP0OKKpsU7jgSp4orU0K7xMGI3Kn5UFxhaDzZpVupzUx+69+
	k=
X-Gm-Gg: AYBFou18xA2gPtDAk8PzwJoIU7wWMJxih4DOS5Pen81tXTywY3XxQyt3tutgrRyPQkF
	Z6PyCE8M6A8WrXwCnGOo3fY7YmVdPfssI+0WmuJnHr2svx90i/PVbxh/3Xnpm0xY3yTNL5sSqa4
	NTZALscZvuxOYp/Q7gM3Q5HtuMru/DZMEbDs2OHwSASndLxy7MAQOVCOpbNGq34KDJYIhJXCvuk
	JLPyHlwynkmR/Z1Pg0IWwvoWd3pcDukRKdPFSfwkKlM5eDAV9ymSP3dkKjXIPyyWQt9Jb0DkLpC
	EWJ+eTcWCTAeOvwjhFUVXf4U4h6i5Ui+nh8saJXdZsBlcyAVckOfe5AHW3Ykb9+n+9NcfC4V5R3
	w3/kW81PZWG2IGvdDLRC+TXDtxw==
X-Received: by 2002:a05:620a:688c:b0:93a:12eb:b626 with SMTP id af79cd13be357-93c43b80ed4mr291567485a.4.1790324066049;
        Fri, 25 Sep 2026 01:14:26 -0700 (PDT)
X-Received: by 2002:a05:620a:688c:b0:93a:12eb:b626 with SMTP id af79cd13be357-93c43b80ed4mr291564285a.4.1790324065567;
        Fri, 25 Sep 2026 01:14:25 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c2ae735725dsm77113266b.14.2026.09.25.01.14.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 01:14:24 -0700 (PDT)
Message-ID: <d29c3741-0c47-46b6-9d27-1e8a54c51b83@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 09:14:23 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] ASoC: qcom: sdm845: Demystify TDM masks a bit
To: david@ixit.cz, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260924-pixel3-audio-v4-0-85b5d133aa5e@ixit.cz>
 <20260924-pixel3-audio-v4-1-85b5d133aa5e@ixit.cz>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260924-pixel3-audio-v4-1-85b5d133aa5e@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Wrq+otfv c=1 sm=1 tr=0 ts=6ab62d62 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=eN4gI1Pk1yANhL5TOoYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 1e_HLu2jAEOPXw_-at5rOjtmX6kcT2CK
X-Proofpoint-GUID: 1e_HLu2jAEOPXw_-at5rOjtmX6kcT2CK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzMiBTYWx0ZWRfX1h6Sqlep3Ff+
 nV8ZPT974xXfxRKuXfJQNgMcKSLxYB4cnATOyNrPivEC+CHE55AWzeKxIw3qu6BS/w7lpTpqDOr
 hDG2cjJYVjWO6cf0GJuhwvD+/L8B4cmYsJZKJw+Ubj6TYPskxS42DTBILwNB8ef5+iXOGxQgArr
 jIDYsS7jH2a0O9M5Xg7/yGKYmhgeO3/TKgx54SQMLoI/Lp7b7Tn34rd7bl6w1Ot8Vt/BUzwu4M9
 tzdvPOSPwFkK3F9ROFuEMuEhtLkQPweKjudgl20U/G5eAtOgFPkVM4WnZjB55jsdBEvILbeFzHc
 C6GkdEuD3U8JSBjdQJKanEvLZT5uy2J23X9wiDEYA3IygsxPp4/mWOD86y09cQ1R44secFHimXn
 K8lLsyH+qcmdDx1TdNu4Ny6yq24iXvK1CmjsaXG3W+MqL9kXfBWXD/iEIMAjatu9ocGHhmaH95L
 RfGeqfihpn0bJcV2o6A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzMiBTYWx0ZWRfX93hB8lAs+XWx
 uJzrcWhCRjp1IPNqxb+817EoJ2MetArA6szDmJFw5Ju8jj1nDTIPx9vQKkVwOcSy9WHzf45HppG
 sXx9lMc/WGePGn9V9MMYPIN0EzfSOoA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250032

On 9/24/26 2:24 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Describe the mask with the bits used for each RX/TX.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/qcom/sdm845.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
> index 6843ab8ba017e..0ce8265ab1c1f 100644
> --- a/sound/soc/qcom/sdm845.c
> +++ b/sound/soc/qcom/sdm845.c
> @@ -18,19 +18,24 @@
>  #include "sdw.h"
>  #include "../codecs/rt5663.h"
>  
>  #define DRIVER_NAME	"sdm845"
>  #define DEFAULT_SAMPLE_RATE_48K		48000
>  #define DEFAULT_MCLK_RATE		24576000
>  #define TDM_BCLK_RATE		6144000
>  #define MI2S_BCLK_RATE		1536000
> -#define LEFT_SPK_TDM_TX_MASK    0x30
> -#define RIGHT_SPK_TDM_TX_MASK   0xC0
> -#define SPK_TDM_RX_MASK         0x03
> +#define LEFT_SPK_TDM_RX_MASK	BIT(0)
> +#define RIGHT_SPK_TDM_RX_MASK	BIT(1)
> +#define SPK_TDM_RX_MASK		(LEFT_SPK_TDM_RX_MASK | RIGHT_SPK_TDM_RX_MASK)
> +#define MIC1_TDM_RX_MASK	BIT(2)
> +#define MIC2_TDM_RX_MASK	BIT(3)
> +#define MIC_TDM_RX_MASK		(MIC1_TDM_RX_MASK | MIC2_TDM_RX_MASK)
> +#define LEFT_SPK_TDM_TX_MASK	(BIT(4) | BIT(5))
> +#define RIGHT_SPK_TDM_TX_MASK	(BIT(6) | BIT(7))
>  #define NUM_TDM_SLOTS           8
>  #define SLIM_MAX_TX_PORTS 16
>  #define SLIM_MAX_RX_PORTS 13
>  #define WCD934X_DEFAULT_MCLK_RATE	9600000
>  
>  struct sdm845_snd_data {
>  	struct snd_soc_jack jack;
>  	bool jack_setup;
> @@ -107,34 +112,36 @@ static int sdm845_tdm_snd_hw_params(struct snd_pcm_substream *substream,
>  	default:
>  		dev_err(rtd->dev, "%s: invalid param format 0x%x\n",
>  				__func__, params_format(params));
>  		return -EINVAL;
>  	}
>  
>  	channels = params_channels(params);
>  	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> -		ret = snd_soc_dai_set_tdm_slot(cpu_dai, 0, 0x3,
> -				8, slot_width);
> +		ret = snd_soc_dai_set_tdm_slot(cpu_dai, 0, SPK_TDM_RX_MASK,
> +					       NUM_TDM_SLOTS, slot_width);
>  		if (ret < 0) {
>  			dev_err(rtd->dev, "%s: failed to set tdm slot, err:%d\n",
>  					__func__, ret);
>  			goto end;
>  		}
>  
>  		ret = snd_soc_dai_set_channel_map(cpu_dai, 0, NULL,
>  				channels, tdm_slot_offset);
>  		if (ret < 0) {
>  			dev_err(rtd->dev, "%s: failed to set channel map, err:%d\n",
>  					__func__, ret);
>  			goto end;
>  		}
>  	} else {
> -		ret = snd_soc_dai_set_tdm_slot(cpu_dai, 0xf, 0,
> -				8, slot_width);
> +		ret = snd_soc_dai_set_tdm_slot(cpu_dai,
> +					       SPK_TDM_RX_MASK |
> +					       MIC_TDM_RX_MASK, 0,
> +					       NUM_TDM_SLOTS, slot_width);
>  		if (ret < 0) {
>  			dev_err(rtd->dev, "%s: failed to set tdm slot, err:%d\n",
>  					__func__, ret);
>  			goto end;
>  		}
>  
>  		ret = snd_soc_dai_set_channel_map(cpu_dai, channels,
>  				tdm_slot_offset, 0, NULL);
> 

