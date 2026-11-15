Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776630;
	b=5BsaLXyIcbtw6zdZVOIRWtI0GohLe7pHMgA/YeFnCGKn69L7VXxqoOFTrzGZc1zQ5arA
	 hD8Tbiu2AQcVIDQsTrfejoXB1AYpvQn0iVsiiv963jhZUXCV/GVRX2IMBvrPtlSUgwSkf
	 xeyKWNaphhAggTS06MPKXQB4LzP7CU+vChxvLOr1VsEeea23Fw3ehGWwoDP0C4KO+0AOM
	 n+VBM854m1x4+lwoKHCSmnKK9RatcKDtjTNJckVEGtavD/umkhhPGRMGw90Stzk7dUxGC
	 7w8P21L9otQXs7YQph1sLGdKOth2IOAWboESIqP32MFKQY1ZtFKT+aAWDwmy0mvlzWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776630;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+93V4N6Lq0YxOVjH6mwP1Fn2op2t3h1wY2olnwPC/y0=;
	b=uJCL4e3XIgeERLcY37gLs7AEmBw/UUuv7hR0IlnEV7GFHS5J2hRSS/Yfodj0A7l3uKcJ
	 RbvjIeqahC9tHf616+eurZimbXopbFNMcoKcc9BZLLOuojXrbKA+ey2ZChJSEt/drmIy8
	 HaM2Qz5ItNtV/sh2eoxoDaQKIpuy8VaSQwvQ1j4llEVL8RdvDico+P1qzZbHm8+xRWSsu
	 bm/HwwoXSrnJUYufCvsE5N+XHj5vcQQCP04YYpTUJDD4InUy55rl5CFSvBh9BizJ3UZN5
	 ySjZPgvulbPaTBL1SQlHSUN2DEdLHKuIwEMg3pgOprxCzdVXwfm3Sq3YcrpQxlcsa3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=agbTALtS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iPxwGchk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEFD606A336
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:03:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEEFD606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=agbTALtS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iPxwGchk
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AFIQsfQ3149990
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:03:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+93V4N6Lq0YxOVjH6mwP1Fn2op2t3h1wY2olnwPC/y0=; b=agbTALtSR3gbxxEc
	VRvNU4DCIKPvGpMO7CugpH6Uadyx5npRYj8FJv9vBKO3NQTl5CvPYcXjWOUWbMtn
	Axq//AERbURr5exipw8deW1dUK01/D42GkdVxJS2Nkny28LtZ/iUX2aGPbBe8bh5
	Qc3z7A61AmHeExvu24i9LhT76E3P2XSEn7fvlGqNphWMFnSJlJZxR1bOa3ueo5/y
	mqaBgVCB1XM+jyxY8d+ZCvsX3uMQjKQc5aUlSUqnfXdYbQORz4AhR4vDn633F8v1
	Di9+nyS3qXAOiDfm+1q+7TEhvVQfqqp/xC1mQCkjYzV3PxH0izjh5Fwp2peOwvuK
	/ZmTEA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhnx3vsx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:03:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94961ed97d6so301061185a.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794776628; x=1795381428; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+93V4N6Lq0YxOVjH6mwP1Fn2op2t3h1wY2olnwPC/y0=;
        b=iPxwGchkict8FNXwwuxijS6mEqQTHVXY6RJbzUuKeRhQsgIRnuf+Q8z1Ps0ehae76F
         2WrKMbo5XE2Zk5TFmWPqsWR1/sbQoyEpMxyKJlByUZbegFzbcs01l4Oet32guZuoAeGS
         wc5UQgf2NIt/0tHqSoBBxFusNDaqBcJ1bEKmRmziHSFb3LDD6Pv9sl9TSCfOqLsjjiWz
         ALY6KiCTV+U+ZJEOjnmKjWknc8EvwHcR1+CpSU4uCv+KtvBU2Y1hlqdxBu30ivZ2N6JD
         rQheTgYrTIu3HFLjypxROjQ7unNiz1wrWw4BqUKJg/dxo5yvK0f8URn8aIt+hSmfiJev
         enaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776628; x=1795381428;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+93V4N6Lq0YxOVjH6mwP1Fn2op2t3h1wY2olnwPC/y0=;
        b=jKySclbenEpN5KubOSp342N5l4LMGnzOBnRPlaygDV7UqAYu4UpuFtfS3OXof6v04q
         Tt3MGozlifsItY6KXBXO6cS4OpXYHJW0skmkXlOpUbWmpsvFpvQlOmWur+pFMxovLfDI
         N+u/zJ9c5bAuCAE1e7yQVLE4d999IZK8g0A34iQEiWltWtl42dQRliJJ4PlxVWfPLpug
         YRdoDK5S5kjsZlzFo9gwE/3fwcu+Gv54SUcvTuBJxuEJo7561HIp88Sje20a5A+1QxNh
         G6RVLiujmZwxJPQMXSPts7JasUm4Pu20nLn8gt7gA6K+6BIg8KoW5smj0hgdZUDKgF9n
         7Uqg==
X-Forwarded-Encrypted: i=1; AL+hErEat0LtnBdkltujpgeMvk7/Doyk5lTOouVuxccsIZlgp/bPxgKM1k6t4yOeKHHG3SE2SEQtK/FPBwh052k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZfUAMZoRYn0h2WiguYOTE6H3tYjwWH8POBHQFhRomkyacD084
	sWxnlfAKjRlGI774h44PDFpw5g5NnjcRse12PYjrD71bVBlHC97WtHm/hD09oQ9EVjgDnGid2ET
	IXUbCpmSulX3n+93V4ACeCBdAWytjY1hVR0GY2ldR/EV9W4wQAxV6IS+rNAbQoq4MP6k=
X-Gm-Gg: AYBFou3cWMeicVs1DIMN88jAkQXYjeiXgHWIbP9eqUAjy5X5aH6dvHthCN6mNrxCtFt
	KuHJXJ9Lo4/aqEn1hwkH8P/0dusiwYmMzMjTCdG1LbL6CIl5T1yxIomGGPzjVY7xvZF1INuNYQu
	znYQAqplNtESlsMecCoKfkPBdEN3vEXX/Xn+dDdAN5YKTwpb/OBqqTLdufeT+8sF2NsZomXeHmQ
	mEjKTzhc2SUWBz3cAJ+IixDFPu89DYxtjIw/WyzzOfjh2lgjUvOHR+V2TwBgtndqwkSTtfX9Pt4
	9YQX5ya7lyYxyn+B6l4dJYMk6WHeIokx3dN442P35in+YBF7w6YA5xZZKpnCDDQtVdRXQiYJRPd
	aOcvxrCFMvNIkNik/W4Q5B6llZvwpZkZwTEi2/b2t1NgSczv3IZPNVAyplzasO3qZQnPtVmbxOs
	yu
X-Received: by 2002:a05:620a:40d2:b0:949:671a:cc77 with SMTP id af79cd13be357-949671ace50mr733615085a.1.1794776628049;
        Sun, 15 Nov 2026 13:03:48 -0800 (PST)
X-Received: by 2002:a05:620a:40d2:b0:949:671a:cc77 with SMTP id af79cd13be357-949671ace50mr733611885a.1.1794776627637;
        Sun, 15 Nov 2026 13:03:47 -0800 (PST)
Received: from [172.22.9.204] ([217.110.90.56])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d03b104sm18917479f8f.6.2026.11.15.13.03.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 13:03:46 -0800 (PST)
Message-ID: <ea0f1a60-b2d4-4d3a-a7a0-767f4132f8be@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 21:03:45 +0000
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
Subject: Re: [RFC PATCH 20/23] ASoC: qcom: x1e80100: carry WSA VI feedback on
 the WSA Playback BE link
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
 <20261023171433.820092-21-srinivas.kandagatla@oss.qualcomm.com>
 <179476416983.140154.148298781294201106.b4-review@b4>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <179476416983.140154.148298781294201106.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfX5+Ln1LZwz1Hs
 l/1q1mndD5BEiPT9H6RHqDFLixgFbOPcved5zIuK41AQISsqO9rYUWD9QpPLo83IjdZfqouLA49
 HEaiwUwGZIBCTsOdzc+u43ge+LtJM89pmPEe6nFn7uONrqF1uC576zTvymaVIJ8PcPIR9o6BDDg
 QyoORdx3gFnjg5cjKa5K2rFDEnWSckkbV7EEz6s1WNYnStwLgaL6FwgdiQWr5FQr85rZaiLAHGR
 j7N3DjkjQXEKD1qCkMucLrE91L20d4uj+1p+bx+HtbyAT+h4M6/4uoHA0i39Ajfoubk5rlIh55b
 s0u6AWs0HhsVDRRW3sc1WVJoUSCi+3AokqUEODH3Z08Annj38FB7ey8zPztBNz5HnHlDWPjRr73
 mGjixlPhcGgy7PmAwol2K0iDzEBBdlbwLDbm9sKqhvKXFoe0tcfBMvAevUVouTnccEYHO7C9VHJ
 8hg56SLxhU0kp23QhiA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfX2NOET1TvHvHT
 HU7niIjCqujtqlzFLNewBfCfAD9NX4sNPxlOfb7G1eqXcLxLni6uy9GPpCUoX0Uu2nXn2iqJLKl
 jrxybdCeMGamBHIkrpqEO+v/gP+xuFA=
X-Proofpoint-ORIG-GUID: sIb9aAsaVHEtWPGxQovNTVBcg8c5RoU0
X-Proofpoint-GUID: sIb9aAsaVHEtWPGxQovNTVBcg8c5RoU0
X-Authority-Analysis: v=2.4 cv=Jr5kP84C c=1 sm=1 tr=0 ts=6afa1e34 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=hzUeyGCwRGS7WCfWEAyTKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=eRThcyuUgiMSaGfv38QA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150083

On 11/15/26 5:36 PM, Mark Brown wrote:
>> Speaker protection needs the WSA V/I sense capture running whenever the
>> speakers play.
>>
>> Set multi_direction_codecs on the WSA Playback link so it can carry the
>> VI codec DAIs, with a params fixup for their 8 kHz, 32-bit format. The
>> core's capture stream events for such links power the VI widgets.
>> Nothing changes until the DT adds the VI DAIs to the link.
> 
>> +/* VI codec DAIs on the WSA playback link run at 8 kHz, S32_LE */
>> +static int x1e80100_wsa_vi_params_fixup(struct snd_soc_pcm_runtime *rtd,
>> +					struct snd_pcm_hw_params *params,
>> +					int stream)
>> +{
>> +	struct snd_interval *rate =
>> +		hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
>> +	struct snd_mask *fmt =
>> +		hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
>> +
>> +	if (stream != SNDRV_PCM_STREAM_CAPTURE)
>> +		return 0;
>> +
>> +	rate->min = rate->max = 8000;
>> +	snd_mask_none(fmt);
>> +	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S32_LE);
>> +	return 0;
>> +}
> 
> Shouldn't this also limit channels so we don't get something wider from
> playback?
vi has min max of 2 channels, so its fixed in v2.

--srini
> 

