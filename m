Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776674;
	b=cf7fXZemYRmjBPCaVz8R7Ow8f4MAJ3xEStWH13ab01XaSH2qnOqSXgNHHx1pdcVtkj7E
	 muLpOY20F47gvpp8ny69vYFYQBJMhx/0JJPolp1iwYyF73if1sZzb6s6eWy9fC9RXvoSd
	 R2iZ6i7USfiHcXgblNALiCwPRqvVgC75OtNDE9w7/qjHDaurLNWZ7Bz0wrf/cylaGQQ7V
	 +GoKoNwzaKynK1Nrslqbn2h7tBiRXdS8qB+eGkHiCzhndlZQ1ZXx/yCeIlS3Qzb17o2aN
	 r6fFbi53zASOyMpzyVUAx/wAlD7iuUxflPNVsv2se7BG1x1a4AI7N5DriPG6vETzezg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776674;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=RAsdR8JeA6Mm7PMj+bK+NMt/Bx72LJN38yUyqwA98j8=;
	b=dV4cItW6tyD+u9yIJrMEHUOM72JJGkFGoB0xmHwYKKcHINg9v/sbVPDAsRTkbb13RSHE
	 ScJdL70vHlf+VZpJ4S58cekpEGTZpPK2z41ucfRHaSSEWwr0BmeHaYWQff2IyPU2gK6QY
	 2hvO1BqrrHG3/5x7iPaRFJlhKta4khwIiTxqyo97Ami0wLB559hDassCT7h43ZEiwFByq
	 h4Wv+FyerTVZf+ndYMX9o0jHKVmNQLjcNQoJGEWdUWcTCuyl7QsG1h8gFD5dswv6tewue
	 ywM6rtaD1slhzOoqQsu1R5pR6csdYN2seWR4557JthU4WfrmMDQX//m0vDsvDeIiqbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="oF/0+aqw";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ni7r6Y3S;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34110606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:04:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34110606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oF/0+aqw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ni7r6Y3S
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AFIS5KX1518491
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:04:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RAsdR8JeA6Mm7PMj+bK+NMt/Bx72LJN38yUyqwA98j8=; b=oF/0+aqwESMrHQKj
	1sdeu3kSMD22w1XiSlcthjvvll0gokTqAWQcduUSGxstXfrbk2ZG6iFfUbFOyjQ5
	aTKZS6S5OXZshv1BZ5J4zAic2u9Jh4sgnyJKIYDDlpOIbdQJzKgz+jG9DwC8Eann
	z5bjts8xnIiZi37qGDud9gLYe27NQTu1VpLkg1Ua1g4KqAOiYI1QCxgQ/Q/CCl2N
	w4KDO4LXhXvFFM76iN7aQ+GAGWHR28RPg5eXkEBJTT7Vmc9W4DQ+4isg9tAuFCCe
	Dr8UdlI7QApi5P9Gsx5ig5h8CYP0vPKtYja5HcCGUlUrN81DSNoleZkw3O1HzZ27
	4cSdPw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhj43t2x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:04:33 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99e109028b4so622178241.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794776673; x=1795381473; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RAsdR8JeA6Mm7PMj+bK+NMt/Bx72LJN38yUyqwA98j8=;
        b=Ni7r6Y3SpAkfsCqPaKjQ1Dhny8x7aOgsUnMOquZg/CFlLsPFLsZ6mQcqytqv0k7NI+
         r42onz+vW2AmiuvVWxJEV73ui70p84kM50AVaKLlIbCo2w4vj5FI04klma7CEvFr8Luv
         QHtsO0HoCr/msaA+Of/pbJeNphtJ2+q1gAjfpNaH67BgwS2UNMsTWCU1FbsIbHlvChaS
         B4nfXURHrNitVoUqWEWG/nt4oUer7d0rDdYbxEOLWnbJOny662D0Jg0OlF3mhwit47lB
         omIBUd4/oaBHsAGHiWTgdIl0/acQ5hUlvfI5tS+3oHuGq+Dx5H/MKg7gO0cSDY81DXqa
         ldCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776673; x=1795381473;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RAsdR8JeA6Mm7PMj+bK+NMt/Bx72LJN38yUyqwA98j8=;
        b=y4W4KQU5jf1klMhdR6hYoJWO5zHUC2NqbxGgm+1RcC8uVTjNgPGaWOuD0T0Fcv2DcQ
         nQZGAQHdpWSeTYo+1sjhQh37Wcsla7yoC9qod8lZjAemW8WBvu5AeosGRqd3ny7MRXqo
         Ya+Jeq1TC8rDazic+Gruh999nMQTLdfyJZI27y0SEPSNHPcqrP6eDAPERzDXloy6OGt8
         tWGNflz7e+U6cHABKPKhymF2ROk5W9pWBgDldzgw83xo5j6BK21/5doSygQYikzF4hZ1
         Z0lp7z1Ivg4/TtA/GpZnYnKwbvJKkYmWGZoViybEt5bOUNM82Jx83UUCzbDe3r5SFwz7
         Cpuw==
X-Forwarded-Encrypted: i=1; AL+hErEoBRxedkp9OF59gybUcRQy7yq2Il18M4Q3YfCSmxmu1jNideTZHv+ElnXxQBqH+V6r0R6AtiS1BgByIOc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZHheOjYUxolela/J/z1bYzSw3e9ZHqKPgXyXfri+ucs67aaRH
	/Z+rOMmYzHSZzp1bYXP9Shl/dXGTxV3Uip8SNQ3rqXUJSAxk8el+F3vnffS3yzHWzVBuXAZ74qL
	d4bXtVwAfm1UB+IhkMb6ZfUupES5CrRvLQVyD0oAUO3KG1wctCrLdN7WoHJKclIWHdXI=
X-Gm-Gg: AYBFou2A1o+qtZir3+eacQxo0qOc8ixsFKRKKdEXfAzFIMVOwh6x7qedg8Jgm70Vq6M
	6G/PMBg1Oj/xOTHYCIk97iWLfEPaAtDlxouJDsiWRv9+7wVOFxJhb1+ZdBriMggS2xUDxH/Uzv7
	Rj4m/5/Dqr2fmpkDXgVqCe/3+yXimB8syPVPCl0jpFOYnSeDaXCm3N9//yVX+NBGuI0VTvuByd9
	BSj0RbZjeG8+8m7YE9hwAmnu2MsgCCDVAm7lNXDZ9FGKU94qIA3dCMcoDqgDy7VxZz2Wcm1WR0K
	0uNTTHbhKUS5tZ545fBvxLiu5+5hWa1coRRWi/q28qDMQKNNytaO0HRVkYXdY+moAXz+y0PmMgR
	F2wXb8IosFptf26mSDp+EcshfPiBfUOZ4aHvtTGpXundQ5OIDit8rutT1RRZX9pxE6rG6C/dWIY
	7H
X-Received: by 2002:a05:6102:580c:b0:7d2:7266:2c8a with SMTP id ada2fe7eead31-7d64d8abb61mr3128291137.32.1794776672577;
        Sun, 15 Nov 2026 13:04:32 -0800 (PST)
X-Received: by 2002:a05:6102:580c:b0:7d2:7266:2c8a with SMTP id ada2fe7eead31-7d64d8abb61mr3128278137.32.1794776672148;
        Sun, 15 Nov 2026 13:04:32 -0800 (PST)
Received: from [172.22.9.204] ([217.110.90.56])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb62d5ec30sm231653655e9.15.2026.11.15.13.04.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 13:04:30 -0800 (PST)
Message-ID: <e0757b36-cbdc-4282-a30a-4e5f4866cbce@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 21:04:29 +0000
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
Subject: Re: [RFC PATCH 03/23] ASoC: qcom: sdw: add per-direction stream
 runtimes for multi_direction links
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
 <20261023171433.820092-4-srinivas.kandagatla@oss.qualcomm.com>
 <179476416982.140154.5480409059266128218.b4-review@b4>
Content-Language: en-US
In-Reply-To: <179476416982.140154.5480409059266128218.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfX3/pewZ6lGjc6
 GvotlH4yJ931FWfWGr/qRL4vmY+yAyEWcjSEq0e9HhnWBn5Am7Yqs0wat4OzZzkM5EoMYWFWqFg
 HHCmwB9xKGM0YGgjYyeX4pdhAISMa6tiAHylkxsvsjGJok9ciXjikwpNvrhzIP2IzFn1xfhxS0X
 Ulx7HjATWGQsUlRrnoJXOJwRrIEWOyxvNcyrVAHzj7NxvaEu5Z+kMQKWKPAaiu0R5Q3alEHWZJe
 I3SAA2+HoPOdMkzlzrQXKLrtEtKVA0Qp9K0ZJTodAEGOVQLu2Aaj00nZPGO48aX3OxnoYrZGrk8
 amp3TVump5xgvMiCwvGVzYl7EQJBuVJO+9C5ahRcHUeLpN9PS1Ght7HMPTuZZ17IGkvykTQ9CLK
 SZumJE9VbZ42j7K1KtjB2Pzsl2Ase0PL6c6DWHbqjwISBjdw3AS6lVvoDj9emYjn/ncFZmZcluQ
 NbA2amIy1ScQOwyB+Vw==
X-Authority-Analysis: v=2.4 cv=av0nmiZV c=1 sm=1 tr=0 ts=6afa1e61 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=hzUeyGCwRGS7WCfWEAyTKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=YIG-ia_FBqWyFDXOZ9oA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: esH-MfRFcZLOIVKS2URYMGKK54RRE9Ce
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfX6R7o8eQtW0bd
 PD4eFe6Al+89RtR5yvF4Tx1aYoTFc/vTxlu+bCP99c63Ja0Qkz2WnQKA9v2+2MfdALNA5v+G2jc
 SHuKHH+6mM9plDtbdyTiASLpCfIL0p0=
X-Proofpoint-ORIG-GUID: esH-MfRFcZLOIVKS2URYMGKK54RRE9Ce
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150083

On 11/15/26 5:36 PM, Mark Brown wrote:
>> A SoundWire BE link with multi_direction_codecs carries codec DAIs of
>> both directions, and each direction needs its own sdw_stream_runtime.
>>
>> Split startup, prepare, hw_free and shutdown into per-direction helpers
>> and run them for both directions on such links.
> 
>> +/*
>> + * Inline direction check that doesn't require snd_soc_dai_stream_valid
>> + * to be exported for module use.
>> + */
>> +static bool sdw_dai_has_dir(struct snd_soc_dai *dai, int dir)
> 
> This looks a lot like snd_soc_stream_valid().

Agree, will fix that in v2.
> 
>> +static int qcom_snd_sdw_setup_dir(struct snd_soc_pcm_runtime *rtd,
>> +				  int dir, const char *cpu_name)
>>  {
> 
>> -	sruntime = sdw_alloc_stream(cpu_dai->name, SDW_STREAM_PCM);
>> +	sruntime = sdw_alloc_stream(cpu_name, SDW_STREAM_PCM);
> 
> Both directions will end up with the same name which won't help
> debugging.
will add "Playback" or "Capture" Suffix base don dir.

> 
>> +int qcom_snd_sdw_startup(struct snd_pcm_substream *substream)
>>  {
> 
>> +
>> +			for_each_rtd_codec_dais(rtd, i, cd) {
>> +				if (!sdw_dai_has_dir(cd, substream->stream))
>> +					continue;
>> +				sr = snd_soc_dai_get_stream(cd, substream->stream);
>> +				if (!IS_ERR_OR_NULL(sr)) {
>> +					sdw_release_stream(sr);
> 
> sdw_find_dir_stream() (there's other copies).
Yep, will move to using the existing sdw_find_dir_stream()


> 

