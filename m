Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776654;
	b=qJCg/aWwUp5QRsPO2ehsk2OT/woOmssy3HM0AIKuQyQZ0f7T/El9nqrGRvbI8+qaJE27
	 U23VB8M7PgKD3oBypb4htNb2ac3s3DQbDNJa40qsFiUAAG2iueRJjmKZKhOjMUFS50kKw
	 qOAzqUGAQ41cwuEx0Mu8B6RER3QILF35z2NZeghHPIlWszVYadpkcMpxZI2r8bP3s/p1h
	 HND7EPl++nDBZXhf07lwmgxtavSmZzIORPczN204mKzPdcXG1UtBtwdtwknRUfcovoLT0
	 kaJtegZcAx74DxDrNj16ZFMQzIrSij45GMbk8yuPu1JyzN2+vJrhdlAj0J7Cu6RhApA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776654;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dclX5TjXagQdXvyM26xnlyJ5ipiPzjLpHRRtLV+Mu9U=;
	b=b1LwS/NFNS9mVRMG+Z/kieWJEMZgH9LJvViHR6uvmJlT2lvlG3WalY80GP4m/FpXwBj/
	 7fgcasgWh7tGShct/tXG/g5fFQvX9pW7ME/AV56aYlAa2Kh7RGT6EdkARxxpjXFXA0stV
	 epuKHw7JOx+BACFbaK/noZHysP3lnwpW2Z1NI0VPorasP7iVcJY39xP8R5iwX9YaNU8fs
	 rwXjH/lYwM1GJ0Ep5pZ0hQ7wUD/8XNS7dLmSb3MQ3SA2Lzqv/V0YJseYBhO5ZsYNjA5rh
	 RiHaomQpnsrecio/EaLfHjkcAfStrswGI6xn7Cc7++p1gdHUJxNbl+oq5JPBBC+PNlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hXhbcREU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gbbohgdl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE25606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:04:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AE25606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hXhbcREU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gbbohgdl
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AFITRo73623961
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:04:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dclX5TjXagQdXvyM26xnlyJ5ipiPzjLpHRRtLV+Mu9U=; b=hXhbcREU6EwFVDDB
	Ac8Vq/qFfizpEk/cik4MmxFQpCXugF+GlgkILLWppwGilyRz8fnK3e++71wVN7Zq
	pPnPwFjle7rgE9KBYeE3NWGOtNccZhbYTL8qP4hq09PCSQGupbcRDLF1HUeqIDA9
	xbblNuUZOCKEv3ciOHVFa2fwZKaU5Spa6NBHGecpSv6IO2QKJFuIgX4RICwmcDa5
	79GwDYzfn2kz2k6sNBOXSFQfyMaSaylcIopDsNYIS2iKIwqJsyUBzMq6FgqmpUY/
	Ce0xE1QeiZ81fcTIL/ZDAHTX7vZyfCjcYxDLjOCU5iRq2QvofjZMFXKkOsNp86Sk
	sJd9dw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqktrx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:04:13 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9907de400a6so492978241.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794776652; x=1795381452; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dclX5TjXagQdXvyM26xnlyJ5ipiPzjLpHRRtLV+Mu9U=;
        b=gbbohgdl4ZiKWFeaQxrHxD6Qook6v29MRorFw8KuCHOI8M80aKqWbg3AMPrs6ao2Tw
         OZC07Hc80Yv1ytjdvza8NG20LDJh6+B8xM5Y+W4Mf5s1e0XY//ygCZl5UcnYnp/3LZDw
         JXs9k70pxgbKFpXLbrs7D28fg3p/99SOw77I4VzOg1CSSg8N3YwUiKH+j2+HJVaE+aq8
         rIumeBmWO/eAllqTDbs8dYLXjxfm1nEEqHJa6ugqn4haGPIxKHgkjh7BGqvmrTGeVckk
         6CCWmIOY43pNwFnVoR/OEP3Nzvk7iiIsaQF0uq+MOulzP7QsQcaRrU+TC3Ntlfs8F7bc
         jcng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776652; x=1795381452;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dclX5TjXagQdXvyM26xnlyJ5ipiPzjLpHRRtLV+Mu9U=;
        b=ew9qX0MnvfRM2IxdydzkRAZxFGfkrOB9EfomgCXGsXB0KhRvhOmnk15pmABppLCD6l
         wshvob8IUNobBBNZV73bYQV9fBMHXTHgU+XPdrew/KDlX8tdlBmuK5JSM4bSw/9nA981
         gA8nGt4vclY2yrRJbMqcdYL20p4dBgZXi+JyAxDflO+W3sIHqoFaGQAGD/Ww0BsRrWws
         urtVXZTTHofPrr3dyTKwAbbfNUGFAXoeqRl3jGiXKLmuy3wZNqQb8BD8B2I2PZkMQWqP
         AKNWJJB7qc5fWSAe2aT4PuAhRxTrfC+J3kW+cHr/0X4HmnSkVVXLsoI7U/JXPpaA1c7m
         KFag==
X-Forwarded-Encrypted: i=1; AL+hErE1R3utCC5TuAdDyF8Hbdu+OZfQYViGBFSBCJLutP6xgbRJANYHEyhTMxoq2upcE5xgFQnsr2elIdPuBm0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MQwisI8NGLsa2KiQFWcgP7bb1h8AVIEsidTsSajMTDYF0NY99
	gEqlXq8P2iztf/EjuKMRNSwDD3ec/hjL21egK1GgqQXC8RNZwpNjTpJQPiAfC0fVcR9bFhZxreO
	SCyeRzmbRyWH5MsDoYkvDsGV2VmBre/cYmh13urBIubPVrlC93/SElI4C+Ls+6DOPXfc=
X-Gm-Gg: AYBFou0YQl7SGqGjgJLkg158qVGzJ1ukqQbb9RJH6VUwNZ8crovCug6rP1Fru5g7dW8
	+Fs8+TFTRc4/oyYlmaPfzgWYZI6Kog5Mz49orPCeq8vOEYDyoIzfD/DZVQ8GP+VWZ8v/ebe1T5f
	NmXTpzdEDbj9sBfBXibb6SDJGPWRehR39oQwIgtXg4Zp1BDcc7kB61a10CBe+WFxld8vnVAvYwj
	emgsRExAWiU6tH9zRlsmDcf+O05nFIlKaEK8a89r6KV6D+8bVXqf87zDJf7S84BwdZZMati5nWX
	VU8vXOehCR2SVAIUGf0wPVaCy3T0EcwfKw5xFdkwvhPyDBuEu1TuD1y+fT3P4bmJWd11veEqFnw
	pzyW/4EeEPgxAe2yulrm1wFGDKW+zyvY4L3ZlkbOYQdSl5lQqrVKlSN/BlqqcKK1J5Iu8arC79l
	8J
X-Received: by 2002:a05:6102:84c2:b0:7bf:74c1:b606 with SMTP id ada2fe7eead31-7d64d8abce4mr1883012137.34.1794776652417;
        Sun, 15 Nov 2026 13:04:12 -0800 (PST)
X-Received: by 2002:a05:6102:84c2:b0:7bf:74c1:b606 with SMTP id ada2fe7eead31-7d64d8abce4mr1883004137.34.1794776651917;
        Sun, 15 Nov 2026 13:04:11 -0800 (PST)
Received: from [172.22.9.204] ([217.110.90.56])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb65ce005bsm156345935e9.14.2026.11.15.13.04.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 13:04:11 -0800 (PST)
Message-ID: <85e400f9-eb56-4d8e-b791-ad00cbbdaea5@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 21:04:10 +0000
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
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [RFC PATCH 02/23] ASoC: soc-pcm: add multi_direction_codecs link
 flag
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261023171433.820092-3-srinivas.kandagatla@oss.qualcomm.com>
 <179476416982.140154.13934302514044276070.b4-review@b4>
Content-Language: en-US
In-Reply-To: <179476416982.140154.13934302514044276070.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7f8wumXurgLtEcfi-5VgsmXpbqUc-R2G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfX3pJU18u+oGvZ
 bPNSgr6JuZaHqD/8HhOI7WTaQ0TawqGxAYVzIYG3Yme/p1bxs25LYP7bsPF6VJ42F4irrk0TJ/Q
 K8kgIxnxFpR0+bURgrpPX9Q05ay83nYJmLDxI3LjmlggaD/DAKJEuLB02hhiDLupK7HxtXKAscL
 oZNq5TXbLOORapjYuSJihKXFSpyLbhjnD4B1XylzNUolflJsBLpYFPaKlBLDsgyGlNvSUX8hnoO
 SDmDEgEfBahAfzFXZhns74C3ewDPmP63aSvUaG/IkGW7IGsxjxbFwJNcMOJNZDlT1WmQZjAHDN4
 wFOA6EK7nBh8qN799jzeyyAcQVtaNVd2XBLihCm7z5c/5LpVyq45Udy55lFQssrvxFbUVjj4WKJ
 k90MmkLDZQ1o2P4eTYQfYSnaEk/AnBMzUkPrqKsINqQnmXQ+X5h/dKfzGmxnTOPDa14dbm0hDq1
 WRAnAG7GjuTGF1eRn5A==
X-Authority-Analysis: v=2.4 cv=TqJzFzXh c=1 sm=1 tr=0 ts=6afa1e4d cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=hzUeyGCwRGS7WCfWEAyTKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=xKiGHf8qJV6DUAaYMh8A:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: 7f8wumXurgLtEcfi-5VgsmXpbqUc-R2G
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfX/I0SNdr2lagH
 cPFKoajvw6i9oWGeerYE6tjM6BuPTomW8+rzPu7tRImB5yf6dGnW4ROZ1ERuh5k95fInH66F7Yt
 ILTPopSGuiDMc/K3ZzHsa7ZkX1SpU+c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150083

On 11/15/26 5:36 PM, Mark Brown wrote:
>> Speaker protection needs the amplifiers' V/I sense capture running
>> whenever the speakers play. Putting the capture codec DAIs on the
>> playback BE link ties the two together, but the core skips codec DAIs
>> whose direction does not match the substream.
> 
>> Add a multi_direction_codecs link flag. When set, the core also calls
>> .hw_params and .hw_free on codec DAIs of the other direction, with the
>> substream direction switched to theirs for the call under pcm_mutex,
>> and sends the matching stream events so their widgets power up and
>> down. An optional multi_direction_params_fixup callback lets the
>> machine driver set the parameters for those DAIs. Links without the
>> flag are unchanged.
> 
>> +3. Optionally calls ``.multi_direction_params_fixup`` so the machine
>> +   driver can rewrite rate/format/channels on a per-codec copy of the
> 
> Probably worth mentioning the ordering with regard to other fixups.
> 
>> @@ -986,6 +986,9 @@ static int __soc_pcm_prepare(struct snd_soc_pcm_runtime *rtd,
>>  
>>  	snd_soc_dapm_stream_event(rtd, substream->stream,
>>  			SND_SOC_DAPM_STREAM_START);
>> +	if (rtd->dai_link->multi_direction_codecs)
>> +		snd_soc_dapm_stream_event(rtd, substream->stream ^ 1,
>> +				SND_SOC_DAPM_STREAM_START);
> 
> This will update every DAI, including CPU DAIs.  That will mean that a
> CPU DAI could be flagged as actively capturing due to playback or vice
> versa.

Correct, we should limit this to codec dais, will fix that in v2.

> 
>> +static int soc_pcm_dai_hw_params_at_stream(struct snd_soc_dai *dai,
>> +					   struct snd_pcm_substream *substream,
>> +					   struct snd_pcm_hw_params *params,
>> +					   int stream)
>> +{
>> +	int saved_stream = substream->stream;
>> +	int ret;
>> +
>> +	if (stream == saved_stream)
>> +		return snd_soc_dai_hw_params(dai, substream, params);
>> +
>> +	substream->stream = stream;
>> +	ret = snd_soc_dai_hw_params(dai, substream, params);
> 
> We flipped stream but nothing else, if hw_params checks things in the
> substream->runtime things will get confused.  Usually everything is just
> checking params though.


I think the documentation should capture this and the codec dai that is
supports multi-directional should be ready to handle this.

I will add a comment about this both here and Documentation.

> 
>> @@ -1061,9 +1117,20 @@ static int soc_pcm_hw_clean(struct snd_soc_pcm_runtime *rtd,
>>  	snd_soc_pcm_component_hw_free(substream, rollback);
>>  
>>  	/* now free hw params for the DAIs  */
>> -	for_each_rtd_dais(rtd, i, dai)
>> -		if (snd_soc_dai_stream_valid(dai, substream->stream))
>> -			snd_soc_dai_hw_free(dai, substream, rollback);
>> +	for_each_rtd_dais(rtd, i, dai) {
> 
> This has flipping that __soc_pcm_hw_params() doesn't unless I'm
> something?

Yes, this needs to be split like what we do for hw_params, splitting
both cpu and codec dais. Will fix in v2.

--srini

> 

