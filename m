Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B8C1A0BF3
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792056194; cv=none; b=VUhmF99bH4k93vcTKs1Q+qGD7Oc3FEjHhYWYwxjQqVqswr78RQKU218/yjHZWkRrjI1QxG+rxbwU6e4yln7XjCHTrsxj1rU3g9mJC7o6lUujRK8Hm6YBPaDmAHLq3jyGuV/z7bDOgNvkrtPgB957nvoHsN5lYEQt3b4/w36ockM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792056194; c=relaxed/simple;
	bh=vCXH+a54zAXXh60RPMF1wga14je8rcctAlWjaNXEF4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c9ZpgFJsThdhFquVnyx2UulIp14JjHdwBMLcqkbYJ1lJwuk75CZ4a+ZiC7r5tviGM4HkCVkknujk0lS79HD31pQqCmePaG3I4OSokSzQpI89QU8GMlaz4/uFgQnaCGrT2cBFEze/Czxs6AI0f9YgVFy2K66DdQV5zbNaliYMuR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UnL71Fn6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VwEo3mK1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UnL71Fn6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VwEo3mK1"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F65W7W644567
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:23:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tNi9jaAuFI9byYADlkcADIMnvw/6XhRkOuQ2x8Rb5TU=; b=UnL71Fn6CVkALbCc
	idJs5bFjC1cbb+HfAl5sHxWFxkbOwvQhkB5BAU2i+5gD8I8h3em6RDKSZPlMKadv
	yKMJ0gIrR9xhvpucqzvc0l7soreqKiKlq1bL/EXRlEtxM5MEBuZTv3zLzJLF9ir6
	Fogz3rcTCFAZYKA/G4W0VYWlzkjqpQWBxoEjjBZdVWreqJc//t4Nc+ZaEuUAZdLZ
	d9vJWZk4xoumeb+kI65rteRjEZFDAzEUDsFJNb99v4E9/SKdOtuDsbhmLRrpPTdO
	EgrDlu+E2tiDXtRgZU3gNRaeDIj7opBLXMcu6MbEWknit4/9dXhRA0d7Vbj4rqhw
	gaeMtQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hajmya8qt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:23:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e92aad34aso934391285a.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792056191; x=1792660991; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tNi9jaAuFI9byYADlkcADIMnvw/6XhRkOuQ2x8Rb5TU=;
        b=VwEo3mK11H0fW4je1jsA90u+Mm+BHMomr7KgvdB6gBWwwKR2MwYKy1zBbySj1uAoOf
         s9IvO1pDDeeNqf9bhEdHahTwhCw1JKmjBApoIXIJGnPQJz0eWplXjigQ0BmWSosMmUy6
         jMjcYCJ6mgsAZhv5cKY1Q2NtOuLawwDmQwCJA0SSsdRxv7fsk2PMfMiinbiWIbHCEj/s
         Xv8gSfm/CZumyzFlbBPmw1rxj2I/2tVjevYmEaiUMChEXzngtMBO3qO4WwD6/SzmcEI3
         X/oza8cWeiADiD8EHGHXRxOpfzZ6kQViHKmtOiYtB1JMjNXnrk0GtCARfQpwJODuG1Yf
         fp4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792056191; x=1792660991;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tNi9jaAuFI9byYADlkcADIMnvw/6XhRkOuQ2x8Rb5TU=;
        b=cWn8brc+LKFBWJHQi9jiyM0y3GV5rs/dFDeCOVprPcgV1v6tBR7kmFHqh0pbRxBwD9
         0zV4hfjyF50Y0KLqRTiuOF6vVykjDBFAmKMkTiuGPZgVVTzWoU791V7S5OK2hr9f5MkF
         xH6O9tS0e2DNNq9upKgX5NCDuMBza65bhemU3saiOA+y1pg7OrjhXU9WhmiQhDVlAd0S
         7mi5MU2xNgocWvzsISRLUokGdTMwkK0oaHZkxG632sM+G7hX0+A203zqwJt+A+LJ+jWe
         lQleLyaPFX7m8rcclv3YD46susarkjUu+SY1swk7NwnK4UIyLZslRlZ05HZ6C9lrY4L6
         aKvQ==
X-Forwarded-Encrypted: i=1; AKwUvByVMDEh6E3O6wWsAvt361/abGEI0oiDJ1f97Gn/Ku0eQB6xjdSAXJj616AtGsmQYwaWotSN8zZ5c4YD4oA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3goMtub7ieHqmKOv3If4ist6X0H8bug5DdnVBe6oQFJyX/m+p
	CSe7w3VSG/VKZ6Zl54/MyNS9C2/0GAPhePxBGYZNHqPeid/Vezc1UKYIki455Nff6bWgl+dDyzv
	oNc91TWcSBHxh9fma5k80WqtRUukv4kswyu3zu+EiSQOmh73EFjLsQ7HkdU3X5U7Cb0g=
X-Gm-Gg: AYBFou1FYMVCkPX8BP2H8lsrLoY7oxYJnjzTi0Zt0awYTw1Gs31Cqncb0uroVa+KUBz
	X7WtPiC2CRYeMq0wlvyx7BEr7ZBGPfH4oEIhtKsai+XVoJ5KDMOOzdc/u+SvwfEBHUHKCjlUEod
	gUKGeoexC1mb4xfOr33mb9A4Ff2EN+HVvyAIufVLdZUvZEDQd/swTqpGgKSCqMaEwUFupa1XhF5
	8792gU92tgBWCQP3j/1qJo+3UwqsxcAPcAGVNn+kZkGKZUIkfDQB7nJ0wB9c2ev8nQhAyjKv+4p
	sQ1eocmr5G1voUkuikwUeq8AemLZhjI15B6jPFsjg1dA92MpJieKAM8WHOwzLqAQ2NomEQUPpYD
	kzyyHv8F4RjEaLCZSpOBgfoJHrQ==
X-Received: by 2002:a05:620a:199e:b0:93c:ca3e:7230 with SMTP id af79cd13be357-93ebd259ae7mr2760641285a.52.1792056190932;
        Thu, 15 Oct 2026 02:23:10 -0700 (PDT)
X-Received: by 2002:a05:620a:199e:b0:93c:ca3e:7230 with SMTP id af79cd13be357-93ebd259ae7mr2760638685a.52.1792056190245;
        Thu, 15 Oct 2026 02:23:10 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1bd5ec195sm53311315e9.0.2026.10.15.02.23.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:23:09 -0700 (PDT)
Message-ID: <aa6bc804-d84d-4354-bffd-9d67ff3f654b@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 10:23:08 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 07/10] ASoC: qcom: Add QAIF PCM operations
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
 <20261013-b4-qaif-shikra-audio-v9-7-f3022e28f2fd@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20261013-b4-qaif-shikra-audio-v9-7-f3022e28f2fd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JEZpeEPrN7OyCe7CQln_Z0VNkqf1uFlk
X-Proofpoint-ORIG-GUID: JEZpeEPrN7OyCe7CQln_Z0VNkqf1uFlk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNyBTYWx0ZWRfXy6UPLFMGidtw
 n2a423Ekd1ZkFdaOl59GVHaIyIDAukLx+4umTnRixnwXrVzhC6pm4KPFDAaPHcHX8ewg2Cg8D/T
 pK+F0IKtmsbY6o1AiElJJ5no8PIkygs=
X-Authority-Analysis: v=2.4 cv=TbQDJhQh c=1 sm=1 tr=0 ts=6ad09b80 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=23ijev90tiKKSBFg3Y8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNyBTYWx0ZWRfXw7DPtFWsx/L6
 WY9/FptOgWMOix5QrUE+0BYcbga7+kEmaN4NbQxd2P4idQ+CIAYaJtE+/JT7Yo7v9o/KZRqfQpg
 3G0vFKvJdX95pBz0HO/nM+RepDYB6Ecv6AYAbRZv5RQaVcNQbF7KIIXLTVB+QCXc89H83CQ+piM
 nf+/P/xKCRAc5B8sQJMNMSnhWLRpSj04Ds+I72srQ701MdUkCAPGyh4yXmL0g/YpSnP7n0ualUt
 qcPf+HZkYpEDkWnmEpzA+OGhxn5ESaDds7Ia7tTL3ReBVDCDsg0y1QzrakC0qeGsrgLAw5fUy5t
 HHaVDBW+c2HWBz0WAfvwNiIWYKfhEmGJBSBDgdp5ROciTxoWhdkiU8rGhjMHfu85kdCPAvWyIj2
 JVpye1B1zELKCDhqDOUI1VCQyrjIzqvqo6nYLdeVUcCThZhElIRyN3sam6wD8FVSJIruSIS8jzf
 vMRX+5Xui99r4SGpGGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150037

On 10/13/26 6:51 AM, Harendra Gautam wrote:
> Add the PCM platform callbacks needed to use QAIF DAIs for playback
> and capture.
> 
> Pre-allocate the DMA buffer via snd_pcm_set_fixed_buffer_all() in the
> .pcm_new callback. In open(), reserve a stream DMA index and perform
> the one-time QAIF hardware initialization. Program the DMA configuration
> in hw_params(), set the DMA clock rate and program the DMA base, buffer
> and period registers in prepare(), and report the current DMA position
> from pointer(). Release all resources in close().
> 
> The DMA clocks themselves are prepared and enabled by the CPU DAI
> driver's startup and shutdown callbacks.
> 
> Support mmap() for CIF and AIF paths.
> 
> Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> ---
>  sound/soc/qcom/qaif-platform.c | 464 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 464 insertions(+)
> 
> diff --git a/sound/soc/qcom/qaif-platform.c b/sound/soc/qcom/qaif-platform.c
> new file mode 100644
> index 000000000000..e24c4252825e
> --- /dev/null
> +++ b/sound/soc/qcom/qaif-platform.c
> @@ -0,0 +1,464 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + *
> + * qaif-platform.c -- ALSA SoC PCM platform driver for the Qualcomm Audio Interface (QAIF)
> + */
> +
> +#include <linux/dma-mapping.h>
> +#include <linux/export.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc.h>
> +#include "qaif-reg.h"
> +#include "qaif.h"
> +
> +#define DRV_NAME "qaif-platform"
> +
> +/* period: 5ms @ 48kHz/1ch/S16 min, 20ms @ 48kHz/8ch/S32 max */
> +#define QAIF_PLATFORM_PERIOD_BYTES_MIN		(48 * 5 * 1 * 2)	/* 480 B */
> +#define QAIF_PLATFORM_PERIOD_BYTES_MAX		(48 * 20 * 8 * 4)	/* 30720 B */
> +#define QAIF_PLATFORM_PERIODS_MIN		2
> +#define QAIF_PLATFORM_PERIODS_MAX		4
> +/* QAIF_PLATFORM_PERIODS_MAX * QAIF_PLATFORM_PERIOD_BYTES_MAX = 122880 B */
> +#define QAIF_PLATFORM_BUFFER_BYTES_MAX		\
> +	(QAIF_PLATFORM_PERIODS_MAX * QAIF_PLATFORM_PERIOD_BYTES_MAX)
> +
> +/* DMA CFG register bit positions */
> +#define QAIF_DMACFG_SHRAM_WM_MASK	GENMASK(11, 0)
> +#define QAIF_DMACFG_BURST4_BIT		BIT(18)
> +#define QAIF_DMACFG_DYNCLK_BIT		BIT(24)
> +
> +/* DMA CTL register bit positions */
> +#define QAIF_DMACTL_ENABLE_BIT		BIT(0)
> +#define QAIF_ALL_CLIENTS_MASK		(QAIF_BITMASK_AIF_RDDMA_WRDMA | \
> +					 QAIF_BITMASK_CIF_RDDMA_WRDMA)
> +
> +static const struct snd_pcm_hardware qaif_platform_hardware = {
> +	.info			=	SNDRV_PCM_INFO_MMAP |
> +					SNDRV_PCM_INFO_MMAP_VALID |
> +					SNDRV_PCM_INFO_INTERLEAVED |
> +					SNDRV_PCM_INFO_PAUSE |
> +					SNDRV_PCM_INFO_RESUME,
> +	.formats		=	SNDRV_PCM_FMTBIT_S16 |
> +					SNDRV_PCM_FMTBIT_S24 |
> +					SNDRV_PCM_FMTBIT_S32,
> +	.rates			=	SNDRV_PCM_RATE_8000_192000,
> +	.rate_min		=	8000,
> +	.rate_max		=	192000,
> +	.channels_min		=	1,
> +	.channels_max		=	8,
> +	.buffer_bytes_max	=	QAIF_PLATFORM_BUFFER_BYTES_MAX,
> +	.period_bytes_min	=	QAIF_PLATFORM_PERIOD_BYTES_MIN,
> +	.period_bytes_max	=	QAIF_PLATFORM_PERIOD_BYTES_MAX,
> +	.periods_min		=	QAIF_PLATFORM_PERIODS_MIN,
> +	.periods_max		=	QAIF_PLATFORM_PERIODS_MAX,
> +	.fifo_size		=	0,
> +};
> +
> +static int qaif_map_ee_resource(struct qaif_drv_data *drvdata)
> +{
> +	const struct qaif_variant *v = drvdata->variant;
> +	struct regmap *map = drvdata->audio_qaif_map;
> +	int ret;
> +
> +	ret = regmap_write(map, QAIF_EE_RDDMA_MAP_REG(v), GENMASK(v->num_rddma - 1, 0));
> +	if (ret)
> +		return ret;
> +	ret = regmap_write(map, QAIF_EE_WRDMA_MAP_REG(v), GENMASK(v->num_wrdma - 1, 0));
> +	if (ret)
> +		return ret;
> +	if (v->num_intf > 0) {
> +		ret = regmap_write(map, QAIF_EE_INTF_MAP_REG(v), GENMASK(v->num_intf - 1, 0));
> +		if (ret)
> +			return ret;
> +	}
> +	ret = regmap_write(map, QAIF_EE_CODEC_RDDMA_MAP_REG(v),
> +			   GENMASK(v->num_codec_rddma - 1, 0));
> +	if (ret)
> +		return ret;
> +	return regmap_write(map, QAIF_EE_CODEC_WRDMA_MAP_REG(v),
> +			    GENMASK(v->num_codec_wrdma - 1, 0));
> +}
> +
> +static int qaif_map_dma_path(struct qaif_drv_data *drvdata)
> +{
> +	struct regmap *map = drvdata->audio_qaif_map;
> +	int ret;
> +
> +	if (drvdata->variant->qxm_type != QAIF_QXM0) {
> +		dev_err(regmap_get_device(map),
> +			"only QXM0 is supported, qxm_type=%d\n",
> +			drvdata->variant->qxm_type);
> +		return -EINVAL;
> +	}
> +
> +	ret = regmap_write(map, QAIF_RDDMA_MAP_QXM, QAIF_QXM0);
> +	if (ret)
> +		return ret;
> +	ret = regmap_write(map, QAIF_WRDMA_MAP_QXM, QAIF_QXM0);
> +	if (ret)
> +		return ret;
> +	ret = regmap_write(map, QAIF_CDC_RDDMA_MAP_QXM, QAIF_QXM0);
> +	if (ret)
> +		return ret;
> +	return regmap_write(map, QAIF_CDC_WRDMA_MAP_QXM, QAIF_QXM0);
> +}
> +
> +static int qaif_config_shram(struct qaif_drv_data *drvdata)
> +{
> +	const struct qaif_variant *v = drvdata->variant;
> +	struct regmap *map = drvdata->audio_qaif_map;
> +	u32 start_addr, shram_len;
> +	int ret, i;
> +
> +	if (v->qxm_type != QAIF_QXM0) {
> +		dev_err(regmap_get_device(map),
> +			"only QXM0 is supported, qxm_type=%d\n",
> +			v->qxm_type);
> +		return -EINVAL;
> +	}
> +
> +	start_addr = v->rddma_shram_start_addr[QAIF_AIF_DMA];
> +	shram_len = v->rddma_shram_len;
> +	for (i = 0; i < v->num_rddma; i++) {
> +		ret = regmap_write(map, QAIF_RDDMA_QXM0_SHRAM_ST_ADDR(i),
> +				   start_addr + (shram_len * i));
> +		if (ret)
> +			return ret;
> +		ret = regmap_write(map, QAIF_RDDMA_QXM0_SHRAM_LEN(i), shram_len);
> +		if (ret)
> +			return ret;

we have 4 identical loops here, maybe some helper here?
> +	}
> +
> +	start_addr = v->wrdma_shram_start_addr[QAIF_AIF_DMA];
> +	shram_len = v->wrdma_shram_len;
> +	for (i = 0; i < v->num_wrdma; i++) {
> +		ret = regmap_write(map, QAIF_WRDMA_QXM0_SHRAM_ST_ADDR(i),
> +				   start_addr + (shram_len * i));
> +		if (ret)
> +			return ret;
> +		ret = regmap_write(map, QAIF_WRDMA_QXM0_SHRAM_LEN(i), shram_len);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	start_addr = v->rddma_shram_start_addr[QAIF_CIF_DMA];
> +	shram_len = v->rddma_shram_len;
> +	for (i = 0; i < v->num_codec_rddma; i++) {
> +		ret = regmap_write(map, QAIF_CDC_RDDMA_QXM0_SHRAM_ST_ADDR(i),
> +				   start_addr + (shram_len * i));
> +		if (ret)
> +			return ret;
> +		ret = regmap_write(map, QAIF_CDC_RDDMA_QXM0_SHRAM_LEN(i), shram_len);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	start_addr = v->wrdma_shram_start_addr[QAIF_CIF_DMA];
> +	shram_len = v->wrdma_shram_len;
> +	for (i = 0; i < v->num_codec_wrdma; i++) {
> +		ret = regmap_write(map, QAIF_CDC_WRDMA_QXM0_SHRAM_ST_ADDR(i),
> +				   start_addr + (shram_len * i));
> +		if (ret)
> +			return ret;
> +		ret = regmap_write(map, QAIF_CDC_WRDMA_QXM0_SHRAM_LEN(i), shram_len);
> +		if (ret)
> +			return ret;
> +	}
> +	return 0;
> +}
> +
> +static int qaif_init(struct snd_soc_component *component)
> +{
> +	struct qaif_drv_data *drvdata = snd_soc_component_get_drvdata(component);
> +	int ret;
> +
> +	if (drvdata->qaif_hw_configured)
> +		return 0;
Who is resetting this flag, this is broken,
> +
> +	ret = qaif_config_shram(drvdata);
> +	if (ret) {
> +		dev_err(component->dev, "failed to config shram: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = qaif_map_ee_resource(drvdata);
> +	if (ret) {
> +		dev_err(component->dev, "failed to map EE resources: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = qaif_map_dma_path(drvdata);
> +	if (ret)
> +		return ret;
> +
> +	drvdata->qaif_hw_configured = true;
> +	return 0;
> +}
> +
> +static int qaif_platform_pcmops_open(struct snd_soc_component *component,
> +				     struct snd_pcm_substream *substream)
> +{
> +	struct snd_pcm_runtime *runtime = substream->runtime;
> +	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
> +	struct qaif_drv_data *drvdata = snd_soc_component_get_drvdata(component);
> +	const struct qaif_variant *v = drvdata->variant;
> +	unsigned int dai_id = cpu_dai->driver->id;
> +	struct qaif_pcm_data *data;
> +	int ret, stream_dma_idx, dma_reg_idx, dir = substream->stream;
> +
> +	dma_reg_idx = v->get_dma_idx(dai_id);
> +	if (dma_reg_idx < 0) {
> +		dev_err(component->dev, "invalid DMA register index for DAI %u: %d\n",
> +			dai_id, dma_reg_idx);
> +		return dma_reg_idx;
> +	}
> +
> +	data = kzalloc(sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +	runtime->private_data = data;
> +
> +	mutex_lock(&drvdata->stream_lock);
> +	stream_dma_idx = v->alloc_stream_dma_idx(drvdata, dir, dai_id);
> +	mutex_unlock(&drvdata->stream_lock);
> +	if (stream_dma_idx < 0) {
> +		ret = stream_dma_idx;
> +		goto err_free_data;
> +	}
> +
> +	data->stream_dma_idx = stream_dma_idx;
> +	data->dma_reg_idx = dma_reg_idx;
> +
> +	if (qaif_is_cif_port(dai_id))
> +		WRITE_ONCE(drvdata->cif_substream[stream_dma_idx], substream);
> +	else
> +		WRITE_ONCE(drvdata->aif_substream[stream_dma_idx], substream);
> +
> +	snd_soc_set_runtime_hwparams(substream, &qaif_platform_hardware);
> +
> +	/*
> +	 * The DMA buffer/period length registers are programmed in 64-bit
> +	 * (8-byte) words, so constrain buffer and period sizes to that step
> +	 * to keep the ALSA and hardware sizes identical.
> +	 */
> +	ret = snd_pcm_hw_constraint_step(runtime, 0,
> +					 SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
> +					 BIT(QAIF_DMA_BYTES_TO_WORDS_SHIFT));
> +	if (ret >= 0)
> +		ret = snd_pcm_hw_constraint_step(runtime, 0,
> +						 SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
> +						 BIT(QAIF_DMA_BYTES_TO_WORDS_SHIFT));
> +	if (ret >= 0)
> +		ret = snd_pcm_hw_constraint_integer(runtime,
> +						    SNDRV_PCM_HW_PARAM_PERIODS);
> +	if (ret < 0) {
> +		dev_err(soc_runtime->dev, "setting constraints failed: %d\n", ret);
> +		if (qaif_is_cif_port(dai_id))
> +			WRITE_ONCE(drvdata->cif_substream[stream_dma_idx], NULL);
> +		else
> +			WRITE_ONCE(drvdata->aif_substream[stream_dma_idx], NULL);
> +		mutex_lock(&drvdata->stream_lock);
> +		v->free_stream_dma_idx(drvdata, stream_dma_idx, dai_id);
> +		mutex_unlock(&drvdata->stream_lock);
> +		goto err_free_data;
> +	}
> +	return 0;
> +
> +err_free_data:
> +	kfree(data);
> +	return ret;
> +}
> +
> +static int qaif_platform_pcmops_close(struct snd_soc_component *component,
> +				      struct snd_pcm_substream *substream)
> +{
> +	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
> +	struct qaif_drv_data *drvdata = snd_soc_component_get_drvdata(component);
> +	const struct qaif_variant *v = drvdata->variant;
> +	struct qaif_pcm_data *data = substream->runtime->private_data;
> +	unsigned int dai_id = cpu_dai->driver->id;
> +
> +	if (qaif_is_cif_port(dai_id))
> +		WRITE_ONCE(drvdata->cif_substream[data->stream_dma_idx], NULL);
> +	else
> +		WRITE_ONCE(drvdata->aif_substream[data->stream_dma_idx], NULL);
> +
> +	mutex_lock(&drvdata->stream_lock);
> +	v->free_stream_dma_idx(drvdata, data->stream_dma_idx, dai_id);
> +	mutex_unlock(&drvdata->stream_lock);
> +
> +	substream->runtime->private_data = NULL;
> +	kfree(data);
> +	return 0;
> +}
> +
> +static int qaif_platform_pcmops_hw_params(struct snd_soc_component *component,
> +					  struct snd_pcm_substream *substream,
> +					  struct snd_pcm_hw_params *params)
> +{
> +	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
> +	struct qaif_drv_data *drvdata = snd_soc_component_get_drvdata(component);
> +	const struct qaif_variant *v = drvdata->variant;
> +	struct qaif_pcm_data *data = substream->runtime->private_data;
> +	unsigned int dai_id = cpu_dai->driver->id;
> +	int idx = data->dma_reg_idx;
> +	int ret;
> +
> +	mutex_lock(&drvdata->stream_lock);
> +	ret = qaif_init(component);

Why are we doing it in hw_params? SHould this be done in probe or prepare
> +	mutex_unlock(&drvdata->stream_lock);
> +	if (ret) {
> +		dev_err(soc_runtime->dev, "qaif_init failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = regmap_update_bits(drvdata->audio_qaif_map,
> +				 qaif_dmacfg_reg(v, idx, substream->stream, dai_id),
> +				 QAIF_DMACFG_BURST4_BIT | QAIF_DMACFG_SHRAM_WM_MASK,
> +				 QAIF_DMACFG_BURST4_BIT | QAIF_DMACTL_WM_5);
> +	if (ret)
> +		dev_err(soc_runtime->dev, "error updating DMA CFG: %d\n", ret);
> +	return ret;
> +}
> +
> +static int qaif_platform_pcmops_hw_free(struct snd_soc_component *component,
> +					struct snd_pcm_substream *substream)
> +{
> +	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
> +	struct qaif_drv_data *drvdata = snd_soc_component_get_drvdata(component);
> +	const struct qaif_variant *v = drvdata->variant;
> +	struct qaif_pcm_data *data = substream->runtime->private_data;
> +	unsigned int dai_id = cpu_dai->driver->id;
> +	int idx = data->dma_reg_idx;
> +	int ret;
> +
> +	ret = regmap_update_bits(drvdata->audio_qaif_map,
> +				 qaif_dmactl_reg(v, idx, substream->stream, dai_id),
> +				 QAIF_DMACTL_ENABLE_BIT, 0);
> +	if (ret) {
> +		dev_err(soc_runtime->dev, "error disabling DMA: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = regmap_write(drvdata->audio_qaif_map,
> +			   qaif_dmacfg_reg(v, idx, substream->stream, dai_id), 0);
> +	if (ret)
> +		dev_err(soc_runtime->dev, "error clearing DMA CFG: %d\n", ret);
> +	return ret;
> +}
> +
> +static int qaif_platform_pcmops_prepare(struct snd_soc_component *component,
> +					struct snd_pcm_substream *substream)
> +{
> +	struct snd_pcm_runtime *runtime = substream->runtime;
> +	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
> +	struct qaif_drv_data *drvdata = snd_soc_component_get_drvdata(component);
> +	const struct qaif_variant *v = drvdata->variant;
> +	struct regmap *map = drvdata->audio_qaif_map;
> +	struct qaif_pcm_data *data = runtime->private_data;
> +	unsigned int dai_id = cpu_dai->driver->id;
> +	int idx = data->dma_reg_idx;
> +	int ret, dir = substream->stream;
> +
> +	ret = clk_set_rate(drvdata->aud_dma_clk, QAIF_DMA_CLOCK_FREQ);
> +	if (ret) {
> +		dev_err(soc_runtime->dev, "error setting aud_dma_clk rate: %d\n", ret);
> +		return ret;
> +	}
> +	ret = clk_set_rate(drvdata->aud_dma_mem_clk, QAIF_DMA_CLOCK_FREQ);
> +	if (ret) {
> +		dev_err(soc_runtime->dev, "error setting aud_dma_mem_clk rate: %d\n", ret);
> +		return ret;
> +	}
> +
All these clocks are prepared and enabled in startup, why are we settig
the clocks once again here?

> +	ret = regmap_write(map, qaif_sid_map_reg(dir, dai_id), drvdata->smmu_csid_bits);
> +	if (ret) {
> +		dev_err(soc_runtime->dev, "error writing to SID MAP reg: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = regmap_write(map, qaif_dmabase_reg(v, idx, dir, dai_id),
> +			   lower_32_bits(runtime->dma_addr));
> +	if (ret) {
> +		dev_err(soc_runtime->dev, "error writing to dma base reg: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = regmap_write(map, qaif_dmabuff_reg(v, idx, dir, dai_id),
> +			   (snd_pcm_lib_buffer_bytes(substream) >>
> +			    QAIF_DMA_BYTES_TO_WORDS_SHIFT) - 1);
> +	if (ret) {
> +		dev_err(soc_runtime->dev, "error writing to dma buf reg: %d\n", ret);
> +		return ret;
> +	}

All the error handling is broken here, what happens if we fail in the
middle is the dma setup cleared?

> +
> +	ret = regmap_write(map, qaif_dmaper_len_reg(v, idx, dir, dai_id),
> +			   (snd_pcm_lib_period_bytes(substream) >>
> +			    QAIF_DMA_BYTES_TO_WORDS_SHIFT) - 1);
> +	if (ret)
> +		dev_err(soc_runtime->dev, "error writing to dma period reg: %d\n", ret);
> +	return ret;
> +}
> +
> +static snd_pcm_uframes_t qaif_platform_pcmops_pointer(struct snd_soc_component *component,
> +						      struct snd_pcm_substream *substream)
> +{
> +	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
> +	struct qaif_drv_data *drvdata = snd_soc_component_get_drvdata(component);
> +	const struct qaif_variant *v = drvdata->variant;
> +	struct regmap *map = drvdata->audio_qaif_map;
> +	struct qaif_pcm_data *data = substream->runtime->private_data;
> +	unsigned int dai_id = cpu_dai->driver->id;
> +	unsigned int base_addr, curr_addr;
> +	int idx = data->dma_reg_idx;
> +	int ret, dir = substream->stream;
> +
> +	ret = regmap_read(map, qaif_dmabase_reg(v, idx, dir, dai_id), &base_addr);
> +	if (ret) {
> +		dev_err(soc_runtime->dev, "error reading from rdmabase reg: %d\n", ret);
> +		return SNDRV_PCM_POS_XRUN;
> +	}
> +
> +	ret = regmap_read(map, qaif_dmacurr_reg(v, idx, dir, dai_id), &curr_addr);
> +	if (ret) {
> +		dev_err(soc_runtime->dev, "error reading from rdmacurr reg: %d\n", ret);
> +		return SNDRV_PCM_POS_XRUN;
> +	}
> +
> +	return bytes_to_frames(substream->runtime,
> +			       (curr_addr - base_addr) %
what happens if dma has not started yet?

> +			       snd_pcm_lib_buffer_bytes(substream));
> +}
> +
> +static int qaif_platform_pcmops_mmap(struct snd_soc_component *component,
> +				     struct snd_pcm_substream *substream,
> +				     struct vm_area_struct *vma)
> +{
> +	struct snd_pcm_runtime *runtime = substream->runtime;
> +
> +	return dma_mmap_coherent(component->dev, vma,
> +				 runtime->dma_area, runtime->dma_addr,
> +				 runtime->dma_bytes);
> +}

This is dead code as fixed_buffer_all does this,

> +
> +static int qaif_platform_pcm_new(struct snd_soc_component *component,
> +				 struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct snd_pcm *pcm = rtd->pcm;
> +
> +	return snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
> +					    component->dev,
> +					    QAIF_PLATFORM_BUFFER_BYTES_MAX);
> +}
> 

