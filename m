Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F303DD522
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 17:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791394613; cv=none; b=E14SaOjIfvQ9heZYWe+DWEjbZ0qu27qmz70xSWlXUE8+tEyiPTOrEmE2RgKg1G9h6JRPAvNsC+ETMxX8BTlKfotdYH5HV7spaewMdsZ60FXIzdzl93gUSkWGj8qoee0WBmlgidJhxAF4Q+dun6T7n8Fh+t+Bdhjqd9KlCp3lfIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791394613; c=relaxed/simple;
	bh=+6NY74n/C5omuO9JoYsGCZJp82CiewUdJckTC2HfRIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mbnk2ys2RpQdyV+2dBtObxtymGKFkgH0t4KlU6N5XoGnt6IC4yEUi1xMrnVHp6CC921PrPgAn+xqYnfUJjJLBu7/fFF+59ldC1ZyXN8ZlknN05FGD+U35K5VQ26U0CAUnfvBJgxhNV9L6YhtjERsfeQYVej+FVmlSTQR4E8avfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GWkuaMYm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RSNngd+X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GWkuaMYm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RSNngd+X"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697EtPU8557427
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 17:36:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0ppSelj+LbGu462DrTIiLj378C/LDIJk0hCQ7sXm9YU=; b=GWkuaMYmvttLGWdx
	Yhyxy3cHPd8w1tL64rsju7EXYjQiJaEpYJutWTHO00eHVlC1pZ7Fshjrr6O6Co1t
	fOAZ3B/3qSpZatwz9JwsVmkksLP3/EbGFfF5rjx8wPAIA0acOi5DIixp9DXcoro/
	IN2ZfK2ug/Cz4wRfTZrNXkP5CbqZGDvB76CbjhpKXo57iUP7ZCjemJW2BhDnZdSb
	JAdwkmD1wG3cxrNilnYkTVWMuqpv+oJ/Zq0AXrJPaxykgRePQ89yLoHAWW/Jf+1Y
	SYOuB8gXGtY7E3tMCfN7CRnQBbbDRomEVPhuWHfs6KHYXoJWwrWbDCTvr4FGk8sm
	7GNd7w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5gvrtexv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 17:36:47 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-88b9d8c9e55so1759034b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 10:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791394606; x=1791999406; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ppSelj+LbGu462DrTIiLj378C/LDIJk0hCQ7sXm9YU=;
        b=RSNngd+Xu3dFgEeU5yB01VO9KNwKewCC68NxECUqaLaUITg16ulgaZPdYqasGFeopt
         H1pyt3VlK8ZAGXLpPLTnI9m8LPpm8nbqM+KGK9wrC9+4drTPX6aZgrz1ds13jjk75Nxw
         8+VFK/+oz8PAaq9+SN8JA01Qy7SV4z7wNzrZNwmQ4dGFLVo8cRWl+VbpvDzDUOogQo3U
         YIV8NUI4lCb77lMJNP9SX5+94CMh4MtUFv2r4tuu/Cz13cacWsBy1Yx8w67qMkzuZa22
         pPxJfwkDWdML+siwKf+z4DC4djJaNAU6/Wxeg7pJDdBIZOOlh9BK6W4Q4igi5Titz648
         dKNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791394606; x=1791999406;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ppSelj+LbGu462DrTIiLj378C/LDIJk0hCQ7sXm9YU=;
        b=l97L1F9BSL7qVFgILUg8X5nWutIACmnERVwFVP5dC+SRw59BcK9n+hQAFJpn0Vw7Z8
         TJBWGV9QLT/ZIu1t/vdOVp7YN5kzr9NfAoTCCYlJK2DQ9YAbR2ZwZ5AnQCy9ub+XSBL9
         DNjBQGLTeMbZ2fnc86YNuM3zZMSGl+GiJm1q0vqcb6EGxAGh9OgDSbQCd+bSADH67yUt
         kMOLC7L47kxv5Re2P+8xolhW+/ytLHKG5C2ZVXSNPOgOHLLfL7xzv0/YmmwQ67vK20D3
         1P7FoqdDoFFMnnKOaXD8/Jm/dAbQHn86ZTyLy3GzhWlM3HU8Ii18yXn/kz9c5CwYRiH6
         XQAA==
X-Forwarded-Encrypted: i=1; AKwUvBxuVHRM32d6sA0Nk76QwwCJ4/25wMf6/OqHz0g885xnihdv8dn56ZFBhQN1eTX3LuDfqWofEl3afFo1lU8=@vger.kernel.org
X-Gm-Message-State: AFuF++mR/XgcddBdQXtAqhlfPealdmoSVopzOX7QzVWeq7LfX6DjI0ef
	kO9Ns71QQ/cm3BPgZVHetc2dfNuC5qtGsnqd8uG74cvDpa7+BKeKBWMuGYekUu0g0AU3p7DVj4/
	BGz9uOwcxXWbFQRhnzfW0EYwp5+yD9OxvSdebgDSxzhPq3JMYCPJTwIxNYasprcv5mds=
X-Gm-Gg: AYBFou3n2MBiMRKbvePUrMDU5o8aTpKKPU2x+bHJoHpdy+LMJLy6WRIDWNFLqn5e/Hd
	e4RUp6CDMZUdCoyH0+Ujnfj6US58e8TpNUHcvRzt2ek7G6r23HLVziz5qy2MdCc0VwEuPeUsh7R
	IqV7ODVqRCq/IS+87KFCfSDMrV/On/XOWqGxpI+z77XTRigNpayqttuvYmLa7lC9wwBnqbl3/R0
	LzNvSDESHbDyoFZtavhjBN4WRg49YkLfUR1wjbHSGivD+7mCLizoRxBhhgH9oYQxa7Y3l9sFIqe
	ZKg37IYrtoM9eu8LWVTZQ+0RCcWRxZNiND5XztGAEDlJf/0B0tjAsLsFUcn4S4XAvsY2VeFQ6a1
	rWn8sCe4bYGPqFDJWtzna26FgyOHO
X-Received: by 2002:a05:6a00:2350:b0:87d:b6d3:256d with SMTP id d2e1a72fcca58-8904434a3bbmr4021111b3a.2.1791394606334;
        Wed, 07 Oct 2026 10:36:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:2350:b0:87d:b6d3:256d with SMTP id d2e1a72fcca58-8904434a3bbmr4021084b3a.2.1791394605829;
        Wed, 07 Oct 2026 10:36:45 -0700 (PDT)
Received: from [192.168.1.12] ([223.230.93.214])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-892bbd8dba3sm616161b3a.53.2026.10.07.10.36.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 10:36:45 -0700 (PDT)
Message-ID: <602b728b-d94e-41ea-bb19-dc8bb3a0e9e5@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 23:06:35 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/21] ASoC: ops: Introduce 'soc_set_enum_kctl'
To: James Calligeros <jcalligeros99@gmail.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, ajay.nandam@oss.qualcomm.com
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-7-7b47ed6335a8@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261004-macaudio-v2-7-7b47ed6335a8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=W66txhWk c=1 sm=1 tr=0 ts=6ac6832f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZXy6yrx+fn+bJIgs5eQ1WQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=NwbpVL58AAAA:8 a=pGLkceISAAAA:8 a=xWCIabhjMllZ6jREgyIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=tNWvAHffTtQgx3ZTRG8Q:22
X-Proofpoint-ORIG-GUID: YuCbuej-L44bZkjLJp-60kNNY_ffRAyA
X-Proofpoint-GUID: YuCbuej-L44bZkjLJp-60kNNY_ffRAyA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA3MCBTYWx0ZWRfX9H5JbLbKP/na
 BLJzWKc5c9yUET1eQam+4Qem3Bhu1zQic6Z0fVimBoF5aHldm00qmZxH29kGn0GhjdCTiuLrDHj
 gKaC+6ckh5lixBXsH68gOwMk7WGzKyiy6g3jdwMFJ15IaB+/d8RMo9XzFh/W9lLywaOWIQqag87
 N+1/JZwtTWUSTwuVLBp0IIDVbYPGAvJTmYpOanM+rOrK1wiErCa5oynxiaPkFwi9iqETjyLXVy7
 9kMRVxZ2DMZLxf794cDOGaBfeWDy/802GE0QdHjUMQDhVobHe1dQcyw3PKzfkxxz5MKctZ8YHH/
 uI62gNmMqGXhVs6EUOKFtgEsbxHxrB25fe6tdkL18AJN1vzLgB0QcxMzwkhITEWfSBn/QHfCChX
 G9Qvoirv/fyo3y83VZATYUCKpf1psfFDxXSdgybacMM239I3MYOblyd2mVrB2WRTATqf8qMt450
 nWgb5hkkCz3XmnEV8ug==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA3MCBTYWx0ZWRfX9YPtCu5OZcur
 POOciCg7oAyNzIXFTng2oh9COYAtjNm+SKbNSrxZlFl2JCfid1tLAOIW++HJZC4TWp8cM66KDOX
 jGWtpEHLMaQ9cDT/GLa6j9cN1fsoplE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070070



On 10/4/2026 11:33 AM, James Calligeros wrote:
> From: Martin Povišer <povik+lin@cutebit.org>
> 
> The new function is to be used to set enumerated controls to desired
> values. It is something a machine driver may call in fixup_controls.
> 
> Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>

> --- a/sound/soc/soc-ops.c
> +++ b/sound/soc/soc-ops.c
> @@ -505,6 +505,75 @@ int snd_soc_deactivate_kctl(struct snd_soc_card *card,
>   }
>   EXPORT_SYMBOL_GPL(snd_soc_deactivate_kctl);
>   
> +static int soc_set_enum_kctl(struct snd_kcontrol *kctl, const char *value)
> +{
> +	struct snd_ctl_elem_value evalue = { 0 };
> +	struct snd_ctl_elem_info info = { 0 };
> +	int sel, i, ret;
> +
> +	ret = kctl->info(kctl, &info);
> +	if (ret < 0)
> +		return ret;
> +

Could this initialize the control IDs before calling the control callbacks?

The normal ALSA write path does not call `put()` with an empty ID: 
`snd_ctl_elem_write()` resolves the control and then calls 
`snd_ctl_build_ioff(&control->id, kctl, index_offset)` before invoking 
the control's `put()` callback. This helper builds a zeroed `struct 
snd_ctl_elem_value` and passes it directly to `kctl->put()`, so 
callbacks that inspect `ucontrol->id.name` see an empty name.

There are existing enum/mux callbacks that branch on 
`ucontrol->id.name`, for example `rt700_mux_put()` and similar SoundWire 
codec mux callbacks. So this helper should probably initialize the 
callback objects from the target control before calling into them, e.g. 
set `info.id = kctl->id` and `evalue.id = kctl->id` before the `info()` 
/ `put()` calls.

While touching this, it may also be worth heap-allocating `struct 
snd_ctl_elem_value`, matching the nearby 
`snd_soc_clip_to_platform_max()` pattern, since the ALSA control value 
struct is fairly large for stack use.


> +	if (info.type != SNDRV_CTL_ELEM_TYPE_ENUMERATED)
> +		return -EINVAL;
> +
> +	for (sel = 0; sel < info.value.enumerated.items; sel++) {
> +		info.value.enumerated.item = sel;
> +		ret = kctl->info(kctl, &info);
> +		if (ret < 0)
> +			return ret;
> +
> +		if (!strcmp(value, info.value.enumerated.name))
> +			break;
> +	}
> +
> +	if (sel == info.value.enumerated.items)
> +		return -EINVAL;
> +
> +	for (i = 0; i < info.count; i++)
> +		evalue.value.enumerated.item[i] = sel;
> +
> +	if (kctl->put)
> +		return kctl->put(kctl, &evalue);
> +	else
> +		return -EINVAL;
> +}
> +
> +/**
> + * snd_soc_set_enum_kctl - Set enumerated control matching a name
> + *
> + * @card: where to look for the controls
> + * @name: name
> + * @value: string value to set the controls to
> + *
> + * Return 0 on success, else error.
> + */
> +int snd_soc_set_enum_kctl(struct snd_soc_card *card,
> +	const char *name, const char *value)
> +{
> +	struct snd_kcontrol *kctl;
> +	int ret = -EINVAL;
> +
> +	/* Sanity check for name */
> +	if (unlikely(!name))
> +		return -EINVAL;
> +
> +	kctl = snd_soc_card_get_kcontrol(card, name);
> +
> +	if (kctl) {
> +		ret = soc_set_enum_kctl(kctl, value);
> +		if (ret)
> +			return ret;
> +	} else {
> +		dev_dbg(card->dev, "Tried to set unknown control '%s' to '%s'\n",
> +			name, value);
> +	}
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_set_enum_kctl);
> +
>   int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
>   		       struct snd_ctl_elem_info *uinfo)
>   {
> 

