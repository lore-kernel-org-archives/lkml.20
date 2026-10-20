Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792480648;
	b=1OObPGo+9hqNgUxH+80Zd9ans4Iih3GFgL00IZDMWSTICly12jAFMfg2rS8foLZ9aKK9
	 c+5XE1621PA7MK2pnSHCTzJHdflPWsYmaKuV0akulfz03lwO7kXYuj6k+KoFcXhC7CFy/
	 njBagJchhperQSk00WJmI1vI2pKx8kvWDwkHEfkM1cHO92vKaMWOR13Kwo/R0Ptn/1o1z
	 4zEiiIzNK/vhgomIuWB1rs1+bp7yc2MaMCHuZQwiP3DYbSUTQeJgkk33/030POzEuL9Rj
	 QU1I7iVnbWTxIttQzql5thjwC+x+wPltFDomI5j4Z2cLabU1vQ8spoPj5cQo8erCEZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792480648;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=L7931o9ng0NhhFiCLtL/7fH6ZupL3UOzfRfzWOFQNRI=;
	b=pTVoJ9CgtkMzA63n6abKwJ4wf2Lp5ZOsdLSAlLARwvZJxoW0999TsWD8uu7QGhbyKfu4
	 FYeI4cbWa72DlMchdvbOPCmaXXKO49A8hKh7sGPyyGWTiL+JOfavdH4qFlQ+dR5ZfrPSU
	 IbLyMEd+SwtMuhg2HutAMyZilDK+PjhSOQbVlLqmL2ESl4AGvjMubzgru2ad0hTJvaD7e
	 fhvK/KpMoBA5O+TVj5aE5Q0kVxr+lfdWWGBQaDzLFHU/iowdr+FkYEZhQlo7pZDTwBUrn
	 ZcCa+T57/DbmW5ugOPlr51bPPwS7GFWoYz6Kwy5HLxORiMA9XMav+L40l9IUnTzr9jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ar2wM1oj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZCQpmygb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423AB606A338
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:17:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 423AB606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ar2wM1oj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZCQpmygb
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0tVw24178316
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:17:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L7931o9ng0NhhFiCLtL/7fH6ZupL3UOzfRfzWOFQNRI=; b=Ar2wM1oj9l/xMfdH
	6Ld3lzpHxDj4oOkoxQXeiJKZBqc0aZ7Xs0f56igKT3qUV9/OGwCj0wMrBUMAzrKR
	RzUmiDm2QpBrAsOcuo2L+jm/1kgg2dHxvmtjKbcNbW3blBkVqV23j+okw16t2Jbe
	kFW5mmtCkQzYpolrdNo2TxWYhE18k9ixFXCupN09bkch33awGEElY4jdcC6HEcwI
	8RR8mNsz3HTaK77mdPvT8uFtpboqYPHlty+X6QjkP9bIehr4uyfud36puvZS2qcm
	79q8e/h/eifuQTBnYQuKkGE8WL6g44zU+JTuOGreHGwUEfehkhKeKbjA/7k35ksk
	fyN2XA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n1ag0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:17:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1f2fafeaso410591885a.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792480646; x=1793085446; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L7931o9ng0NhhFiCLtL/7fH6ZupL3UOzfRfzWOFQNRI=;
        b=ZCQpmygbh3mgAmy1HApUR5dQmFeV5PcvKtHx4/jUf7kL1Ywj4zoWG60nHE0QOKeQjN
         ENSKpZNbChw8skLQYvnfgYNLvAYP6t6Pvhzm+WG07Y24SYXdR2QBLKsKrl9rVe+x6osb
         GJrufCh+hDk7bXFurCB74VGuW3qFb3gHhdGcHk6uK3WK9xJGeWVwgKHKSVhPZSG61FhG
         0hkr1RV71Y2Q504MauymdGI1E9FvOX7znfD5T1dBUck4CMHQS3UfI2dsach1IDVStyMy
         QPpkqdzKQ4GyY7SwJAjLj+dpcX9MYFCtvLcL4Jeyu4h7nwJWvgXYqyQXnpIgoS5gTqUH
         BEHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792480646; x=1793085446;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L7931o9ng0NhhFiCLtL/7fH6ZupL3UOzfRfzWOFQNRI=;
        b=nCRbgNhkWOhkrojR3RrnH66WOv+IR6Hwn3VBtJHGYKf6ktVGUFP6c98acqu+2oPGw/
         D2LqfK/lsQp4SnG5yqgHTefneIrNjm4TTMs2DjWAKjh0IMef8Pcy8NpICgBY+liA2btH
         Lx6JcqiE1D9p3HJHcNGebB2i11krxuXkI4VEeQwBwspV4nGrbQCIJevnfbVd1PNhN4VE
         vzedSi+lFG66Crdu2FToJeSYviFPek/E672uPHyI+OVBSjwfccPD0fUuyTjZOHV3L0b/
         +2lye1m1LV3zRdeg8kfGT3L866gBfYb60h9FUG0yPipqYX0XDiP1Sjpb+0qS6EtNn7uM
         U9xg==
X-Forwarded-Encrypted: i=1; AKwUvByN8JJ/6DwKtbKG9rFioWW/g6KHA7ffumompw8s/n3qrHVpDqOY5C5Q2Uq8cFPs3TPPvdYHn2raSiDWCrw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZQApbYG6Km82ZXI8uHU9isgQ5XmlWp2h6vGXK8MwNtfcD9Hqg
	mJR6LxCbIABHkn3bJ1FK5zwB/bMTl8fKcoPgdcQhxNExtl0gKste7Cfv1F987Pv0H+VSbBhKknw
	5MXSvyVYM3+0t9pKasRPOKq97x1HzRfGCXBw2WeaxGApv0Fl9AAdhdr/9NX9I7UdvF9U=
X-Gm-Gg: AYBFou0v4vHqngaTag7ATmEAeDuN53nJc4KtMXvRIuc92BhzM4cHUyH2DO0Z03khKQx
	5QfOHmj3S3lYkqltVFqqQl8/4AhyMcTiqSm6x1i3+KVX4LlZi6Bm8w7C5Z+kfNpvldDaMEgKeEc
	lORp1vbDxwuZKYP1XpOr+qb2XDME9MYB4z9tmQxJj9rHp9cMAenq1Sspau5e22xdrEEUFsOZWbZ
	Ss6tSSt52uAeKhpYrF6VE/08+bPsiIPFvZT2aHXTq2REnjN5Ki+Wea0mjqAAYmSQN71eNd9pHkX
	mOrpigW1QKlAblt4lqwBtqCx/a/UtzSZTR7Fn94jAXwd/UrW1EdWiXOsoNUloNhsCeCBGoZvsKn
	TXxNRY4/UZe2JHeJJYZJiBL7nCA==
X-Received: by 2002:a05:620a:a2cc:10b0:93f:33a8:8e99 with SMTP id af79cd13be357-93f33a89085mr890522185a.13.1792480646391;
        Tue, 20 Oct 2026 00:17:26 -0700 (PDT)
X-Received: by 2002:a05:620a:a2cc:10b0:93f:33a8:8e99 with SMTP id af79cd13be357-93f33a89085mr890509085a.13.1792480641137;
        Tue, 20 Oct 2026 00:17:21 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e1d6dbf12sm4264944f8f.1.2026.10.20.00.17.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:17:20 -0700 (PDT)
Message-ID: <123d6912-5b52-4d57-96f8-cdfa016ebb11@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 08:17:19 +0100
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
Subject: Re: [PATCH 4/4] ASoC: SDCA: class_function: clear sconfig.bps on PDM
 data-port terminals
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela
 <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Takashi Iwai <tiwai@suse.com>, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261018192359.287987-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261018192359.287987-5-srinivas.kandagatla@oss.qualcomm.com>
 <atXck2Ef4OllKrAA@opensource.cirrus.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <atXck2Ef4OllKrAA@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9kbveiWPWVMZ_uiTNDXOcDyZWM_YpY77
X-Proofpoint-ORIG-GUID: 9kbveiWPWVMZ_uiTNDXOcDyZWM_YpY77
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad71587 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=YYYObzUzO3kg1-Zf9dIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAyOCBTYWx0ZWRfX9UX7oN+hBkOi
 Rpvqq6EDZI4FwGf8Z2epCTtG7ckTCPWd1hG+GGFnN7xrlY6Sher4fgdOvI3Gunps+kP0ITAW2r/
 mLQ3VEF027lu9YGiOpOjw8N1/pifhBNXmeAE7qWEhPdcoWFRTkVKAYVUQ6szXL5r8GGSntH+BOI
 fHcd9PBLqYb8ti3EbylYnmHpK/s08RqiHeucxKqWZToPezsY3eSvz2eGWYLjRIfFIOu/myftEe3
 NbiVSNkkqBBajxpNchvu9ILsbmheiHHA4IaQucDnguVjWzZBZE+Njo+uizC316jr11+RoUrropa
 BI0DlxgbVxxb2ZU1/2rb0GUWnT/pZcm8nG0QiNT//eSWzVVnSGyBA+ilGpENaPS6W98el9d1c3/
 LUTg5PqEj2lDjEVj7VNdvz3LueTo4HQEwkppq+u+alI/BoZZqNejw4la7qt8U+rPtzbKV21hxyr
 prp9roBVLPbi11QaYPA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAyOCBTYWx0ZWRfX8Jbrzu/9Of40
 da5ye9Kl46T7SHgmOorUxCLnsyIF8OFtcWsZa5+gLzuWBCLwrPl7E8ivMhkQM5itUBvZVZsz7WE
 LnRpRyK483IiMcF8HrZ+43Wq2aErIZQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200028

On 10/19/26 10:02 AM, Charles Keepax wrote:
> On Sun, Oct 18, 2026 at 08:23:59PM +0100, Srinivas Kandagatla wrote:
>> snd_sdw_params_to_config() derives sconfig.bps from the PCM container
>> width, which is not meaningful on PDM data-port terminals and clashes
>> with masters that declare their own view of the wire word length (e.g.
>> the Qualcomm SoundWire master hardcodes sconfig.bps = 1 for PDM).
>>
>> Clear sconfig.bps when the DAI's SDCA terminal is PDM so compute_params()
>> or the slave silicon drives the per-port wire word length.
>>
>> Assisted-by: LLM
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  sound/soc/sdca/sdca_class_function.c | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>
>> diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
>> index 13b70f0f0dbf..acaadd12432a 100644
>> --- a/sound/soc/sdca/sdca_class_function.c
>> +++ b/sound/soc/sdca/sdca_class_function.c
>> @@ -126,6 +126,17 @@ static int class_function_startup(struct snd_pcm_substream *substream,
>>  					 substream, dai);
>>  }
>>  
>> +static bool class_function_terminal_is_pdm(enum sdca_terminal_type t)
>> +{
>> +	switch (t) {
>> +	case SDCA_TERM_TYPE_RAW_PDM_MIC:
>> +	case SDCA_TERM_TYPE_PDM_RENDER_STREAM:
>> +		return true;
>> +	default:
>> +		return false;
>> +	}
>> +}
> 
> I think this would make sense as a generic helper in sdca_asoc.c
> probably taking the function and the DAI as arguments.

v2 will have this change.
> 
>>  static int class_function_sdw_add_peripheral(struct snd_pcm_substream *substream,
>>  					     struct snd_pcm_hw_params *params,
>>  					     struct snd_soc_dai *dai)
>> @@ -133,6 +144,7 @@ static int class_function_sdw_add_peripheral(struct snd_pcm_substream *substream
>>  	struct class_function_drv *drv = snd_soc_component_get_drvdata(dai->component);
>>  	struct sdw_stream_runtime *sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
>>  	struct sdw_slave *sdw = dev_to_sdw_dev(drv->dev->parent);
>> +	struct sdca_entity *entity = &drv->function->entities[dai->id];
>>  	struct sdw_stream_config sconfig = {0};
>>  	struct sdw_port_config pconfig = {0};
>>  	int ret;
>> @@ -152,6 +164,9 @@ static int class_function_sdw_add_peripheral(struct snd_pcm_substream *substream
>>  
>>  	pconfig.num = ret;
>>  
>> +	if (class_function_terminal_is_pdm(entity->iot.type))
>> +		sconfig.bps = 0;
> 
> I think this is fine, as you say bps makes no sense for a PDM
> stream but I might need to spend a little more time working out
> how this all propagates through the core. I guess my concern is
> if other drivers don't handle PDM in the same way.
in v2, i have now set the stream type correctly based on terminal type.

--srini
> 
> Thanks,
> Charles

