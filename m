Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8756A3C871E
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 08:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791275691; cv=none; b=Ul4yS2eaIjlCOtnVAPF/tv/7AgANmErgtvL39j02NDA1LGKobHWyVcSCeQkBi8oSCo6bs/fZnjIA0+ZGGuuX+WRADVtAoX1ygEM4ZsUfVZbMf35MAL7KdXRRSc+zScID7l3gZy3vlpTgu9XzVA0vEIIbyGslErV6MqU05acTV5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791275691; c=relaxed/simple;
	bh=+XvS/7VQak0O4jyronPTM/UFIshl3Xjzp1mkgAzzb8o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gcB4ChRxbEwowndOE+3o4Pd5uHpd6wdsI7aasctKcyjF+uUoB3hapROcMfs7DtGbcFKp06qbJNr/2BjOWZ8qLWeb3UAbAhv/apONIl6jrqnwvLLUkw9aLIF/o5Fy4+fnqdsO31tXeR91CL3bWIVVXO7QBewXNRVEYvfgu00NjO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lLx090vw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZaBgeBad; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lLx090vw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZaBgeBad"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966gmto1045854
	for <linux-kernel@vger.kernel.org>; Tue, 6 Oct 2026 08:34:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VnmxMp0r5ixzzTeVg5OCJiFNwXuXZwtAl9/6k2tk5wA=; b=lLx090vwxF4LM4Pu
	2W0AqW4AjGgS+2AadwMvjhXO4VFy5TVKmd0tH1ChGGNOX6i+PQ6mnN8UOpFkpvhd
	m/E1bjnrm295472i13nsm29ohYn+WuFSSz7BcktWWQ3uoFHK2DEgmhU8vjZLkhDk
	iIvtbIIoIue2UFj15Q7J/3bS5QJg+nlsrn2bCFV+yxT/82wh7qW706AjM7/TKPsF
	CWyD/vDzrbJx+OgPljhuCnCh0y6+lsg5p3TKj34bX+gTAiIgO4XkkDBvNuRmK0jk
	w0XCdBQD29mDblhkK9BqGZ6tGpOvOq/Oxhbhm9EuIjdq4/LBpnBvutrB5Zc/4ntB
	q16EIg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4uy4gcqw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 08:34:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a8736ec262so302604a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 01:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791275689; x=1791880489; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VnmxMp0r5ixzzTeVg5OCJiFNwXuXZwtAl9/6k2tk5wA=;
        b=ZaBgeBadYHLRQ1kvVQCuoZa3s8DVL8ImI8D0ZyCVS5pBArI2GH3CCea6Bf+HOx8uHs
         jseFfIch+JzkAbBTMFpHPMVxdOgOcIAfQ6YUgrHmTPQi1Mws7plw5SKT8mPvfj+KAC9d
         74vrGmjKJykq/X6MErrTssuwu1XTO2sDLNupsRCb5f3dpSM/bGuSfPajKclvEUGWkKqY
         RNFrj32X9IRsQI4Z/ZzD5Us9TuQCKA/O4ZAi8sq3HdIb72PJUaX4VTW05TkpMkVtVu7h
         NYP5Kvcd9YraXbqNDRUUj/uGn4+OBoV1gB+Waz650LKsrNiRzy82OL7TeYdiPV5Hh26t
         Mw0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791275689; x=1791880489;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VnmxMp0r5ixzzTeVg5OCJiFNwXuXZwtAl9/6k2tk5wA=;
        b=Eq0bwKlVlwo4AvGskRHq9wgjBZRSKX/I/aVL9dslV5hrOGJw8eDk5+3eKwMrLu30hE
         8/ZarHNycvyyl78seN3QwP3NyS5zWggTSkQuDYRMBt9V07OoNK9jMYUyeIMnG2r/L1+h
         8NjbL8SO2uO9nb578noRPm+VNK06tYLp2a1Dy/zQid/0lEeQi3PujsPEzp/e9wcxh/LS
         5JfptKWP8c/Wc/eEJbDvY2jWwptUL1gOXYPSeYEFdRUmazAta7JVm97bwfXoSOXXQOlC
         9CWewgTLE39PLjUn+o3YslytJJRuaeB4I2xyNKNo5WBX6926WgdYvUZ5rdYroAvOd7vd
         HgRA==
X-Gm-Message-State: AFq9FYIKMdgLU5OdhrDKjXGmx/POt4siZ/7DWMOEfx7p8/b5UiPLKpm9
	e9Thl5q+LUeyuKSmkC5fSaOhh8p7wQ8AHEaGz8XlFCQLzlaAr68xowLD6AnTtgaSNq0V5knblV4
	z8WRWxL3EloWXWfK4eOz0N9ry14jDoRfRw+w6x18i1a4KkCxy2+0JfSJixgVxazZb/ow=
X-Gm-Gg: AYBFou2peBsrqx23hKwzLqkpOV1NK5+1lO++JuFcx7U6tWbr6zhTiZmA2JKsrFJczxm
	0D9+9lGnn84ew5UgzpoL/ZZlaDZo6NrsKKLBsu5TF75vAckCe+TK5ClxNZt2EsqdKd0US/83m1V
	jC9wWre1j9mY3jUc2e7R15dNyoLm0Aww1IOI9X1jmiWWzo2HWGFH+9vu3XU3Hz8kRNXz1H+3Mps
	EzpT4tiCWmiZ2iMLbFCGBV3NwVbCdVvfkMoK/VSw9NLCfwlw7gP5x8LtwiasxpQ/4VHlWM3389c
	v9Lg+L5GB4pQE8HjSo4bTQbPgzEUGknDdxPfMhVtyJkRwNyTyRC02iOXD5voqha68gj912EAwtQ
	19dG/uwDQRSsDl5sgLu+8lLHRdak=
X-Received: by 2002:a17:90b:4a48:b0:3a4:85c4:68fc with SMTP id 98e67ed59e1d1-3a7872b2480mr9306330a91.29.1791275689032;
        Tue, 06 Oct 2026 01:34:49 -0700 (PDT)
X-Received: by 2002:a17:90b:4a48:b0:3a4:85c4:68fc with SMTP id 98e67ed59e1d1-3a7872b2480mr9306289a91.29.1791275688568;
        Tue, 06 Oct 2026 01:34:48 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d8ffc38sm2059180a12.15.2026.10.06.01.34.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 01:34:48 -0700 (PDT)
Message-ID: <1beff4cd-d279-4f34-ab6a-102ae272e762@oss.qualcomm.com>
Date: Tue, 6 Oct 2026 14:04:43 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] ASoC: qcom: sc8280xp: add Maili sound card
 configuration
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, ajay.nandam@oss.qualcomm.com
References: <20261006053717.3455143-1-prasad.kumpatla@oss.qualcomm.com>
 <20261006053717.3455143-3-prasad.kumpatla@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261006053717.3455143-3-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzNCBTYWx0ZWRfX6z45KkmJ38eL
 i3aQUs5/3ukqnmYVwPmiHyQJBkArvWp2SfEjnzB135N53+z8A0kFzvKdycbum59Iij4sZrHHaGM
 CxHnsly81eD1CJl5j8Gzx0kK8vFZIl2pLsZYGWa9nqm1dfXXJdFKnEnsHbT1lEJy0Vf3n5VsXrX
 4gWupWaKwQs7uyIOjYXQ94u0aLEchAD+1z9zRFpUeykKGvRD2yBSetKNST6/5WKgYPWvkns+EoZ
 oqXC55/Bso3iZBzktuRFMTBZmktNIUWkkWkI4D7wnAo9IkJNTwJM70H78k4vpVwkprKpbWLF+Ov
 Fu4CdEMs2Nf+nD5zAcYZtNXKISzrqGXLXa4a4n209zNketVNcRLFzW698s5JjGZEuXImsyf1b4M
 jiRIVhK0+ejZtlqM5Olok2DTvU82uERUkkl4AETyBwskysEqngNglW/QJaNlAT+4OCdYh0XVuYl
 OUV/gdNz/Ys7clPROhw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzNCBTYWx0ZWRfX866QsSneaucM
 IeDohLiQzlMT1/nLVdjlF2nQSJzSz4yEfGMvsngGpQOF/FQ3+60tVi73tfWf+9aPIHCDKSp0dk9
 X8pXiAw/biUgpmwelBDhgqG9IrC9Xdk=
X-Authority-Analysis: v=2.4 cv=F97C5ahN c=1 sm=1 tr=0 ts=6ac4b2a9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=FjxXEj_nMBCEV1V2K9QA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: Xok5p6YgQpgLF95Pp-QUkhChIorTuS8C
X-Proofpoint-GUID: Xok5p6YgQpgLF95Pp-QUkhChIorTuS8C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060034



On 10/6/2026 11:07 AM, Prasad Kumpatla wrote:
> Maili ships its own firmware, so its topology file has to live in a
> separate maili/ firmware directory. The topology load path is derived
> from the sound card driver_name, so reusing the Hawi data would look
> up the topology under hawi/ instead.
> 
> Add a dedicated maili_priv_data with driver_name "maili" for the
> qcom,maili-sndcard compatible so the topology is loaded from the maili/
> directory. It keeps the same DAPM widgets and enables codec sysclk,
> MI2S BCLK and WCD jack detection for the Maili audio pipeline.
> 
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

LGTM

Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

Thanks
Ajay Kumar Nandam

> ---
>   sound/soc/qcom/sc8280xp.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index b5d367486d56..b97cafeb8e78 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -552,6 +552,15 @@ static const struct qcom_snd_soc_common kaanapali_priv_data = {
>   	.wcd_jack = true,
>   };
>   
> +static const struct qcom_snd_soc_common maili_priv_data = {
> +	.driver_name = "maili",
> +	.dapm_widgets = sc8280xp_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
> +	.codec_sysclk_set = true,
> +	.mi2s_bclk_enable = true,
> +	.wcd_jack = true,
> +};
> +
>   static const struct qcom_snd_soc_common qcs9100_priv_data = {
>   	.driver_name = "sa8775p",
>   	.dapm_widgets = sc8280xp_dapm_widgets,
> @@ -676,7 +685,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
>   	{ .compatible = "qcom,eliza-sndcard", .data = &eliza_priv_data },
>   	{ .compatible = "qcom,hawi-sndcard", .data = &hawi_priv_data },
>   	{ .compatible = "qcom,kaanapali-sndcard", .data = &kaanapali_priv_data },
> -	{ .compatible = "qcom,maili-sndcard", .data = &hawi_priv_data },
> +	{ .compatible = "qcom,maili-sndcard", .data = &maili_priv_data },
>   	{ .compatible = "qcom,qcm6490-idp-sndcard", .data = &qcm6490_priv_data },
>   	{ .compatible = "qcom,qcs615-sndcard", .data = &qcs615_priv_data },
>   	{ .compatible = "qcom,qcs6490-rb3gen2-sndcard", .data = &qcs6490_priv_data },

