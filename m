Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7834463B91
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789386231; cv=none; b=gIEB9H+qFz/A64LBUSdGi7efVpuj78bARkQ0jgEqmhtUImR/s7G+9jZjrKPDjISriHXWJFWV/QI9hso3lSsYPZUziPYRta/WQ8sgl8JMsfxhcGQffC858F4vHSdtHkZJepiAc7fYAGnAcFvyTVpd8t1MrwIo5n85hTVMawWttUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789386231; c=relaxed/simple;
	bh=prf7iyPR2XBUzqid06V0xM477LySQ+Us1jpo/hyezos=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=laJYCnBt8rw+sbqDgJZhoifllMHEPGuHVECTvrEJzMlW0ICWxn2l1N9eeDmrhYn7IHQBIHciw3CbBFxVP5Z9s74572858UdKaAAj6BWzIILGn5m/9fcQ0o/0D2Q2gosC0z00xeIuzgv9CXGNWoHaO59UXhUzaMDUgvIZEJgi9F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PQiv9K4Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SX1guE7Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PQiv9K4Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SX1guE7Z"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm4Xg1216150
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:43:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lTxeD8jaHvNrqvngB0sFNqTnH/2ilEtOG7HBAQotzLU=; b=PQiv9K4Y+mb/M20R
	mTuwQP0lvOso/OMWbd5kr04iCXIwsljRo716lFzKRpGoyhhRgztKYLu1w40+ur6y
	pPQhGYbHfwIcEqWvVzm04H9Io4x/aTsTrqRg/mvKr8y1IVpIaudKwY2CE+iO+j0b
	AO6yyfjxEw1KVkGWjNG+t1t1KPf8ac9GXVLD1lVLYvXX1alwGQQgP9CayM6YVbZ1
	Jbhp598eMDDUD72c5N42fmqu1qVumo97YXfE3XCNQK3oQaZZ1r1um/f7QeTF/U3d
	IiXbBeoNMnyLvCqjvYPKElxvUa+Au/xv7ai7/nq+gIgvC4oesuYqGWY53xIg/Fag
	ePBZTQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k0aasw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:43:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a05d645acso428278885a.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789386228; x=1789991028; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lTxeD8jaHvNrqvngB0sFNqTnH/2ilEtOG7HBAQotzLU=;
        b=SX1guE7ZP79Xo+z+dZxLp//3RF7u43MIAHwdNDFUDBcqdZWX7mCGbnzMtD0+AQ1awZ
         1Z/gjADsde9iTl3huanKpsAQHB5tPghV4V2W3c5YanEzjtIqVV7VL1g7lmWLOMcmHkxP
         X1EQkQ24VHqqVqdMrfbWVO/P9wr3l77MnxUzMt9Ik0/wWL+C9i/bo4p/FNdjjwLAEXzY
         EMp5uI41yxUn/98Xk7L9ETHmgADcgrQZHRPnDMoBK5gGKktdABhN4oFRuFfXRPR8FMiP
         +uqZbUgD+reM5jOGldV51Xh30T9kny5XmtkRq/U2EJ6nzSK+oDepqvSnYX4+5/OXPBmk
         yFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789386228; x=1789991028;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lTxeD8jaHvNrqvngB0sFNqTnH/2ilEtOG7HBAQotzLU=;
        b=mXQ5wuy6Bqtnr+c1y87bbOJCnUaA/f4wSc3hi4iHnSf3dD+SEJ/WvH7jaJZTGT6oys
         DacHj3UX6YD+s1KHAu4mAq9RLk5pEpdvdBiABY99xE0WIWHsKEKt4YJ9qU5ly4PfmYvv
         KSEab+3M2ER416yr1w/n1R8LGGicORGE1ODvLLnDFld06cY0LaoSjM1jydKA5kNmyGf/
         fqz1pWxBoQUZsZIBTxfKylIXbo6KLWUZ9qdm1/HOaPT5SPoeUE9fNBmrjB9AAuaEyp41
         PDf2TFxhfOZWwSg5SXygNAYInmAs9A8MqxhiH+hMSFJSsPQ8Ou7TvhmqXY6ItH6PrOGJ
         AMTQ==
X-Forwarded-Encrypted: i=1; AKwUvBw0Ffv3nLAVG3eCbelRVXkjm9pLpnOg7POrE3PvlSc4Vzq+YzO45h0EZjPtzbwtLkYu0CTzC6T89IhtTh0=@vger.kernel.org
X-Gm-Message-State: AFuF++lRYxEL4hOxB/uHRZjM7X4oH0nX5sX82o3J50sGbZRtQ5K6LTqM
	PAh3Y5Y2QProxX3FVrNdPUuEedK4QdOjyByrQd6mr18yhSGYjANxwoRFm2eIB1ojIyTzUcEHB+0
	VT0r9fBBy/LjzEpSAgsUjok4y12H+XGlXBwxMhULG05EioEddaL9oyVMdD9gmtZbLlLk=
X-Gm-Gg: AYBFou0aBs0bD+v9NA87n63QrO68x1YsGLTDb7njHMKjeNHaC9ktqpu+FlZCCNtKDyg
	2XjFiqEITRijrIHfdO9aHA3W+rL63biV8AKkmu4vU3tsXt0LVtlFtyOhONnxoSS+YJYpUMRJMWq
	M5pUUmjAvmLW7c36MGOmnMb1+vR2awODB73afd9efQMqoS6IIzXmt/JDYEhFN+dM2KteXAaGNWU
	6sDq90MaXeNa/6dHb1Y6MQimYP0/NixVZZTJ4VOSO/TGqU4zTZewjK4chxgEi79A6F/DBYTECSf
	bqjgfs/nbs4uFWKWzSu4t1MhCMB0tjtZXfHlLzBf1tsifXS++7OzFZyymK2R4KV07wEpgYnGDUY
	aT4lWI0TF8hnIRuJ5kmopi9qLlTk=
X-Received: by 2002:a05:620a:17a5:b0:93a:251c:5337 with SMTP id af79cd13be357-93a29759508mr297245785a.4.1789386223024;
        Mon, 14 Sep 2026 04:43:43 -0700 (PDT)
X-Received: by 2002:a05:620a:17a5:b0:93a:251c:5337 with SMTP id af79cd13be357-93a29759508mr297213385a.4.1789386217758;
        Mon, 14 Sep 2026 04:43:37 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c2965c4cf01sm413973466b.1.2026.09.14.04.43.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:43:36 -0700 (PDT)
Message-ID: <4063d65f-65ca-4199-b1b3-4eeccca225f1@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:43:35 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] ASoC: qcom: lpass-macro-common: Add missing v2.9
 version string
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260910-add_shikra_support-v2-0-fdd2129c696c@oss.qualcomm.com>
 <20260910-add_shikra_support-v2-2-fdd2129c696c@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260910-add_shikra_support-v2-2-fdd2129c696c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE2NiBTYWx0ZWRfX6fEx63kktQDa
 XpfTejSdc3/dl0aNqBpa6FUTehxiFjhAbJ2OSaSjCenm3PBx6xHYZEvYf+uVML7v1gwZmXyrJ6g
 APcpadW3PazPwJ7Qjsao1rhbka0V+Kw=
X-Proofpoint-GUID: Es5aUo8DrH0CSaAItr6SS4ajyTvI3dKQ
X-Proofpoint-ORIG-GUID: Es5aUo8DrH0CSaAItr6SS4ajyTvI3dKQ
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa7ddf4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ObcvWzphOAATiYgTaMIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE2NiBTYWx0ZWRfXwWi7ljhLwX/t
 p4CFzaiotfzgeo7eo//S+NesXWMLKQ0bGdnArd6BduQj3UbjWcT36Kr6/Tvf9mLauYwJ2jiIrEo
 GtkzJM5McESSKPUBtc5WXh5ysM+ez7IQ1MQ76qwBjuRz8Yat9JLcXUfGp+q/7Ceb+bJTPSyxc0S
 4aUVXonmTF/LITL1Q50HUJbaNPafYG2iqWa4DanfuL6/wmio1aYgJsp84LmFwxpvGNbxlJlr5l1
 MfZjN/6B9krdm0tpzt6D3sBv+4X9wpBe8LzMT35/zv7cyhkoeAokfGzLytekDcw1lG5xpX1hbEH
 8/GNTwtE6FruJL4yclf73Czv/KrRuHitnrKortORAAnVy9F3lSXygGMSyWHPgVulp4hp+xNaugU
 p7MreCuzyn3nTLIQt9XG5Sxuiuk4FUePTVNRFj1rdOPe5Yh85/JAwCkTMvGWIvpy41wiqsS/3wZ
 5CsxFmJRrb1BlXrdzPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140166

On 9/10/26 10:46 AM, Mohammad Rafi Shaik wrote:
> LPASS_CODEC_VERSION_2_9 is detected by lpass-va-macro.c and consumed by
> lpass-wsa-macro.c, but lpass_macro_get_codec_version_string() never
> learned about it, so the probe log reports "LPASS Codec Version NA" on
> those parts.
> 
> Add the missing case.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

LGTM

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

>  sound/soc/codecs/lpass-macro-common.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
> index 10ad68201..573b2145e 100644
> --- a/sound/soc/codecs/lpass-macro-common.h
> +++ b/sound/soc/codecs/lpass-macro-common.h
> @@ -68,6 +68,8 @@ static inline const char *lpass_macro_get_codec_version_string(int version)
>  		return "v2.7";
>  	case LPASS_CODEC_VERSION_2_8:
>  		return "v2.8";
> +	case LPASS_CODEC_VERSION_2_9:
> +		return "v2.9";
>  	default:
>  		break;
>  	}
> 

