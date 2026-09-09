Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE863579801
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965974; cv=none; b=KepZDt6aTDWny/SD7J1ZHI1v/hn47NK5eyVMyWkFGXRwuAvO1suqdb6Om7+KNKo7HrIKpKM6xavzy6JEaTQr62qJ3ePKj5sHepCZnMArwJD6et/a8ZMpZGPl0h1mT07AvOPQkneBZnucqjeW+xq9rejersFu7l350QCNcmhNTp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965974; c=relaxed/simple;
	bh=drY8kln+BrxQaXWQfZyFkLzaCoRxh9DNMq+5RNOp4Tc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=huXPlj7mesvy74xyki449+hYZOX3k8vz58QxezCGOwTurQpuGZpHn0S/LHyyOo1sS9OSOJWwedZJ7CNRf9J2A9RG9aB1U1PgWh/gGU7BrNG3wIA4e4iR33hSZBdO68sKBsBzEtiO59Tjn4i4Oxdt7WDq48Th0ASwaDNTYtgq/y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gIq8wfEd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hciY6m5u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gIq8wfEd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hciY6m5u"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUa9E1184748
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 14:59:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=e54EbhbbjxbNn3hH0o0iVyQp
	ZJxdrsa3hetZg+vrQVI=; b=gIq8wfEdEzwY5g240avguM89X3tRMzosuKP6mN38
	GF7zqYjStaHTOeGgrPVFCksIW+B0IICzq3HloEZHvkMw9V9YTa1cVvSgWmnlDjWb
	LNLafD5QDt3j3mGaScpGu2pxYY3uK3TWmbmUThMTMETFKVXlKHHdhdKQBI2BFwY9
	VTv+XFmE0Fbi25lYKakrnvpJ6POApDBnmjBz6qR8KFdSbrZxDH6vPo+xfmhfKFvT
	j/U5/MrJWXThTak7Xo1YLBkdMRy6SxBThe6mxCMpMPLxHmeVbLAzfWkgCLHNANco
	/T1w5hPh2NdyxzKMOtGrYOZNSE4GFM4x61T0G5OATuL1CQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk559s8q9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 14:59:30 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1b8088203so6510970a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 07:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788965969; x=1789570769; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e54EbhbbjxbNn3hH0o0iVyQpZJxdrsa3hetZg+vrQVI=;
        b=hciY6m5ukxAsKtpnsecDmLIV30eM2fHX8K7lJXBRZkKMiwKDg7Ha6R0jwbcGOPX6l1
         pfdbWTFs7u3kUfkEizYrP9bGD7oKzzWsD3LlQVDm3OV2eH6Dbc2UtTQftq6Wry3ZfzSi
         uNgD8uVzU7CYhxlVgwJWDgcB5wVY7nApAWXS5hT6SIMrySMT7casnurpCIxajPyQXBqK
         cpEH/X36/1oSFp1TvEir4TIN8Nu0WcHbF8z+S1bd+Lq+4Ih5TJewo8L8+6Q9LQY6UdF9
         J2TOo4CRk1DtWSnmC08pHxYEwCeqDCBteHBaU1vZ47H1unIeOL3nM6c3W8mv7HL5PLv/
         NVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965969; x=1789570769;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e54EbhbbjxbNn3hH0o0iVyQpZJxdrsa3hetZg+vrQVI=;
        b=FAgQGYXqwHayrCP0eN+XjJQPC1wRVRZ4dgshspT1sVKwI8bksx9VyFy2HCQPqpuGyN
         VnIMY9vjGjjwigHCbAPJQ1CtsCW2V+X7y5Vx/oghO4bIhU8oiLc5SXbgioA+6daNFB8t
         S58QqoHbgUEdMSXQUu/emydAWdGgkpVTLwE9M76IlRvQHtwx+XRHZ3LoMl6QpP3wYLet
         q1h+VRgA5DY9lJ5BY85YuVQCal9uktoefVkfDpPP/e8XYfhMYSJb4uteMMrvPHqwO2Lr
         Wj1//8/1A93DHiNiEwMo4ePr6WxBsjbGQvQLbqzrYIkq2Crupb3EkLj/7giNB+jY8gbV
         eGBA==
X-Forwarded-Encrypted: i=1; AKwUvBwHo3gW5gl0CTPdrrC239iEDvilGjUHbVYc7wqmqLoZsSdbj02RoSQJ80gl5EYUy4mUg50ZFqi+xXJoJa0=@vger.kernel.org
X-Gm-Message-State: AFuF++m+3JkVak3rsKsLk2jFud+SFK9wSKN+KWaIKykI6I1zLbQpq5Ir
	EAn4LFZQaa8Aas6Skq2nRukIlKW0aR34SwWj2WhI1MMgInfVBSAf3PBiuHo2Liv3aohDOFH9GgR
	1oGPCRHxZYq0DfOBj7fD1lUDR3r+Vt15eUosT0hemg5OW8m7WoNcMhzftb2Ku8ltILVU=
X-Gm-Gg: AYBFou1/Ow7yUfSksMd/fSzLcOixqoBFXvxFFnCQRpSakRPWpxOz99jflHkKlZfo0wx
	wQr9DFN1J/GUVfVaSyJTPRrs2q9Q7pyfzFkQbFixSJ7VDxDHUqkyiBXHbWGfCjHbbi6ga++4xFq
	5adY9kVed4JhuJ4WBVNfZqATYdTWjgS8mJWVmn8pLvj4HMsx9M+ePhYYfhLtVqnPZmtY6NSoMId
	zh07v6dwRaxa78DPLdWq+Zcp99PDSyFgffj6pIpvPD1fni+OGdehlgOrz9wdP/t8l0N3ntV1OCi
	F4cX53lk8ulYVPRaVWsrjy5PBg1Y5S4XL1rPk/Z3uyAuo0eqMZuX5w3t1vNFRaSNGsRMSG+JUhx
	zpkALzb1P6E+7NgrStHJMAorZ3nvq0MhUJos1F/4Vmrc=
X-Received: by 2002:a17:90b:3c48:b0:398:e436:384 with SMTP id 98e67ed59e1d1-39b260d335dmr54355542a91.1.1788965969468;
        Wed, 09 Sep 2026 07:59:29 -0700 (PDT)
X-Received: by 2002:a17:90b:3c48:b0:398:e436:384 with SMTP id 98e67ed59e1d1-39b260d335dmr54355467a91.1.1788965968764;
        Wed, 09 Sep 2026 07:59:28 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b2612d3f1sm32456833a91.13.2026.09.09.07.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:59:28 -0700 (PDT)
Date: Wed, 9 Sep 2026 22:59:19 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v1 3/5] ASoC: codec: pcm1681: Enable system clock before
 regmap access
Message-ID: <aqF0R0FVrnC3hi6K@QCOM-aGQu4IUr3Y>
References: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
 <20260907-nord-asoc-driver-support-v1-3-997d3b20cf43@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-nord-asoc-driver-support-v1-3-997d3b20cf43@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KP1qylFo c=1 sm=1 tr=0 ts=6aa17452 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=0Zc5S7fWRYNTRwHQfoIA:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: wlvVP5pIsA6tGLmvKpWfZ48D6fa8PfkG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfXwaMiUOLAbE1w
 V7zUOPSfYNczG+zntgsnS1xACEM1VloBuo1ZMuv0BwK6mIGbMXzGE/7LAdj2W9/Tca/AzBEHMtn
 9xUwPMqLJx4n+P2OXMt6dofb0zLN4IQ=
X-Proofpoint-GUID: wlvVP5pIsA6tGLmvKpWfZ48D6fa8PfkG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfX71DF64Q9r+tc
 9Kp3eBsSWy1Sk9wvkOx36OS2YfMQK+C+TKcNNoBOuS8OcDk5TxQgRnpd8WXOGJ6JDZYmzRnENz5
 AGQyIijfiIQIyCnTKnHjSteLWt4oRtZfqAc3zBVOkSoHm+oXdyqyyW8wxeHAKIBDkj13A5toPQ0
 hPQda5lt9KAroQFrUCm9SP9J4NGEousrADFcJxzifNsDImVS3nVm8KtL97Q0OcHAm7bkDVWmvRg
 aNGUQP2sd8MYqHQIlHL+wD0Cf6TDyHVyOskZ8an/4M/wm4PLnxLzkvbrKLtb6o302w2Ee+wXhMz
 hGIBvE2NDyfkmwmuJ3ix//rn25wYz9qMnZBT5gaAllh8tLX/9ZUmZ8aUrR86FrOsF1yNirqmABN
 8fZVQwHlcbMwzlZNQyncQ+s98vA8lcQm7g9IubpRNMksnSNAJQYRyEy7e98VbBbps4XEH5pLCZ5
 s8LH3EGKrR/l1PhnqDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090167

On Mon, Sep 07, 2026 at 11:39:44PM +0530, Mohammad Rafi Shaik wrote:
> The PCM1681 DAC requires the SCK (system clock) input to be
> present for proper device operation. On platforms where SCK
> is provided by a controllable clock source, register accesses
> over I2C may fail when the clock is not enabled.
> 
> Add optional clock support to the PCM1681 driver by acquiring
> the "sck" clock, enabling it during probe, and registering a
> managed cleanup action to disable it during device removal or
> probe failure.
> 
> This allows platforms to model the PCM1681 system clock through
> the common clock framework and ensures the device is operational
> before regmap initialization and register accesses occur.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  sound/soc/codecs/pcm1681.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/sound/soc/codecs/pcm1681.c b/sound/soc/codecs/pcm1681.c
> index 60fdbe5c4e05..cfe549176d14 100644
> --- a/sound/soc/codecs/pcm1681.c
> +++ b/sound/soc/codecs/pcm1681.c
> @@ -12,6 +12,7 @@
>  #include <linux/i2c.h>
>  #include <linux/regmap.h>
>  #include <linux/of.h>
> +#include <linux/clk.h>
>  #include <sound/pcm.h>
>  #include <sound/pcm_params.h>
>  #include <sound/soc.h>
> @@ -74,6 +75,7 @@ struct pcm1681_private {
>  	unsigned int deemph;
>  	/* Current rate for deemphasis control */
>  	unsigned int rate;
> +	struct clk *sclk;
>  };
>  
>  static const int pcm1681_deemph[] = { 44100, 48000, 32000 };
> @@ -311,6 +313,22 @@ static int pcm1681_i2c_probe(struct i2c_client *client)
>  	if (!priv)
>  		return -ENOMEM;
>  
> +	priv->sclk = devm_clk_get_optional(&client->dev, "sck");
> +	if (IS_ERR(priv->sclk))
> +		return dev_err_probe(&client->dev, PTR_ERR(priv->sclk),
> +				     "Failed to get sck\n");
> +
> +	ret = clk_prepare_enable(priv->sclk);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret,
> +				     "Failed to enable sck\n");
> +
> +	ret = devm_add_action_or_reset(&client->dev,
> +				       (void (*)(void *))clk_disable_unprepare,
> +				       priv->sclk);
> +	if (ret)
> +		return ret;
> +

All three calls can collapse into one?

	priv->sclk = devm_clk_get_optional_enabled(&client->dev, "sck");
	if (IS_ERR(priv->sclk))
		return dev_err_probe(&client->dev, PTR_ERR(priv->sclk), "Failed to get sck\n");

Also, priv->sclk is never used after probe, so drop the struct member
and use a local.

Shawn

>  	priv->regmap = devm_regmap_init_i2c(client, &pcm1681_regmap);
>  	if (IS_ERR(priv->regmap)) {
>  		ret = PTR_ERR(priv->regmap);
> 
> -- 
> 2.34.1
> 
> 
