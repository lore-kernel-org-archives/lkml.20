Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794736846;
	b=ul3Epzoq+3OO+vtRVfCyAP1K0DJwIREceXKn6jphnUx736+AZojcmVNv8/zsOGoDckUl
	 Vjh/YHpegWIo7ukawwEdfu5a2/ghI/C3T3aYIvYo+SEj9rne6Xmox16qUOvam6AAOyt4a
	 45B7hlF65b+DJL7PTNeLl7sRA9svJD7lbULRNGJ8DdrSeHxH9cw/lEdys1/UtkwT/8cVp
	 SmcneG42B37anBWzkLwL98PZwnG3SNTM3ffNjV60HgnpQjRN6wpLYbWh4uq33GKCsPPgw
	 M7dCAEYUlTm2IVYoQAaM5AnFoUBQWI/laimF7T8+9qCa3YyWn2XCA6xPR9TKjs9bOxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794736846;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cx9pCkxTEi+9RmZrKlW2vNSTCfm+MruumfTTeAoZOe0=;
	b=x+fPF3++22polNeiW2NhQdL8fTTZl+/9ngFevdgYqwgT/NdE8L73IvwE4638HgbB41+a
	 voQWQAjCoY2IPp/GA6rSXN1EhQqC2rTAwFTykv0DdtgQ8KUE9bSMu2/jBNxy2S1+oRQ2h
	 Ab9qztIRD9RIhN0nEAmzOAITLxTZRpWrqA+wf2r/7h1CiZVRwNuoJ8zW/kIGD1riPOYUF
	 p9IMEHU5+Q6jmn4v6RhTqm/JmRQN47wiUbXFdJvHF8mlwUyOjj7/UpD+qeqHaPrnamQgP
	 Z9r8A5g/eo9ja6l2+SOwSIQMNFxvx0pUCRUu9j1oob3Gb8E1a0jk6QgDoPrOSH4Qm+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P3BVvFhq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ga1hjm3r;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7741D606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:00:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7741D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P3BVvFhq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ga1hjm3r
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AF7vsbJ3139377
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:00:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cx9pCkxTEi+9RmZrKlW2vNSTCfm+MruumfTTeAoZOe0=; b=P3BVvFhqucobJ06o
	Ij2JVoufRZ6Ra1Y+aSoyUCnFZzTR8u8jTAYcMAK23l+KtpYjiIktn7R7WBOS/x+A
	EeBxUxViCUyuYiP3FUr7TLb4AbiJv6jAn8ugZZhWFPGhr78/Q0gtapk7yPQrnwnZ
	vDQgfuf+1dT89qYrYW8j2crR58Ix3X0XRw01dI3sogDX8XE8iiejf4xJ/8W8u0Sf
	0wGCbbaJcRpQrVdW6gLi1Kq9guYLNtbz/Y8P5eR2Bg7BJ36dWWCeWoDr1WvX1gZH
	31xNn6L1njsic74BdJ5SyaQoH+L1Ml9UZmxXTv6B/9m83SPSgwKnkAZdOk8f0ne9
	GSNhmw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhdtq59-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:00:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f20addba1so490147385a.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 02:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794736843; x=1795341643; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cx9pCkxTEi+9RmZrKlW2vNSTCfm+MruumfTTeAoZOe0=;
        b=ga1hjm3rvV6rAKElYrhxlmDYWKtQDiJdCV0Kas4lZmSj9ObWWGcAJdJrEo/qVvxFZy
         udZNyttpN2pudTM5PtAkRM0zG8/+f6N4x9hbCrOQ7MGquug9WFNUiKLfb92fTjs60VaA
         mNZCVxQa7i5wWCXQsnVLahcPvuUKcN/cK5k/9CvkqEafBvoVJAxbxUYiK+aXV64xcxiM
         F+VV9rXeR0Etbq166hYZhFpIoiyXlWdC4gSD5ALaNDjmvkzv6iPzo80ML6fytsjwx6D9
         hogw44XhyqLKArwSJBdfxhn7E7Ti8Qnvc4N2OsRaaIzMmyVAG4xbRMQrBwDmvvD4Ozoh
         A8sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794736843; x=1795341643;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cx9pCkxTEi+9RmZrKlW2vNSTCfm+MruumfTTeAoZOe0=;
        b=v31I5wzjlOzfvf1ZmDr6cceWLtBpbAyKQaoIOCmz0CktltTDWke+3BYsuMppKSCj9y
         N/TlZXln2+2TrSMZTlCDwnWZKlxjYyqjJ5UFA5QclkXn5GCSZ9I/2Y6eB8sh31vdsOmN
         vTj5iTOoC3i4trmml/i62RW1QqppQVDb+Tpm72VK9hQ+2EBNjQ2lJw1QxjXl5CASDweo
         /zGex3XfStq/XQhFRQJVNTAB860xRnxJ9LuKQuug318myPFWa8d5rmrcnkaXnBYfZVj1
         Zv78OFATgYTaT+ekG49nE4eCiId0AGzbyr688ZANPXHdKAqtOtbqab9NYvVIrdR0dlbp
         TXiA==
X-Forwarded-Encrypted: i=1; AL+hErFkXrmLarL4icTglHLzEujY+0GAPxlwPv5pmaZnBjsUECyTAAwvVCwDaTPfNl0AVRJtU69XeMZR1nbw3nA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+w6bbgZ0MvK4jsH+KWFa54JXamqzmAap6hxEbTyUrQBwT9Waq9
	EZu7E3eCtsmkhzJdGVxErSr/yjw98hIDSLWGuxFf7d2rBuIr60IQhWzF3BhvEjQp3lBUPxbMzhx
	CXvH/BTl2lZ+97SDTw3tQhfSbzKcD3jbHBgb8xQmrlM+JB+JnYE9aou6XmfUMgISkA5I=
X-Gm-Gg: AYBFou3cGeLD4MgVzXRWV3OV9z6REJQr39Gd6rrPqRN8F5xyEx/Uri0BHMb+pi0/AP+
	EUfKPpy1rBqz++vAhBDu69AhRzbtEHAWPbKzBJUwitgHLlY7F9zW/XcidwD3Xeoynf+GXHyAUKs
	t0czClkNNS/Io1mtIWhQ5HRhy1D/mwo0kFHmo2asFA5PZJgIoTLWRkbluFJ8VxfUroXT0cQp5Gu
	TwgR7U1n7Zb7sJPY0Kq9eZKzvGtePWLHVcAH7C6kXBAPhWcMPUWFeQeYqXHWqKPI6/xGg5Xqpfv
	lWHXmuwUp4RAGBj+PsLPgeuZTiu0npxxVdYI7/lQjT/c/eLsh13woz2QM+UlkAftqSBZ9eKwQsP
	q6WpDFzWcG7Axm9olAMuIF4iGVTMPF4ST9lG+0RQdhbGrklC5iKrOCEX8t7SLkbyoAmhPinEUCq
	S4mlbSlM/uXUTZHGWYqw==
X-Received: by 2002:a05:620a:4399:b0:949:7759:7faa with SMTP id af79cd13be357-9497759914dmr99787085a.60.1794736843509;
        Sun, 15 Nov 2026 02:00:43 -0800 (PST)
X-Received: by 2002:a05:620a:4399:b0:949:7759:7faa with SMTP id af79cd13be357-9497759914dmr99782385a.60.1794736843069;
        Sun, 15 Nov 2026 02:00:43 -0800 (PST)
Received: from [172.20.10.5] (82-132-234-47.dab.02.net. [82.132.234.47])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c5095b5b078sm292229666b.56.2026.11.15.02.00.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 02:00:42 -0800 (PST)
Message-ID: <bfd794ab-7c62-4627-9c96-44a8a3bf5d3e@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 10:00:40 +0000
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
Subject: Re: [PATCH 2/2] soc: qcom: apr: Publish GPR callback before client
 probe
To: Mohit Sharma <mohit.sharma@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mark Brown <broonie@kernel.org>
Cc: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261022144130.2443667-1-mohit.sharma@oss.qualcomm.com>
 <20261022144130.2443667-3-mohit.sharma@oss.qualcomm.com>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261022144130.2443667-3-mohit.sharma@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VOVIDNPX c=1 sm=1 tr=0 ts=6af982cc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=AI3hfGQ59aOwaD8qyfpUrw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yE1VRrYSBdsmvBnWJTkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDAzOSBTYWx0ZWRfX1vFHOXXB64wV
 8WAm29IGBHQHB8PiFOPXYtt+jtHbBhRxCHMSNd9FhNE+Xb526BtdodXPSU26RmnITyE0RDPIT0l
 BbH1acjx3j6svE7mfoEOQaqUy+ch/8g=
X-Proofpoint-ORIG-GUID: vU-ABv1lv7dr6xk_tfPFPidjPa-HEsdE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDAzOSBTYWx0ZWRfX2aAlS5tt7adn
 sXIqqFfShGFN5yjxh0T7lHENPOsnDbRGOmIYnGMEyKAjCpE0S8GZ/UkGfxBviFrqsFiIZYDHc4/
 wvtpW/SSitx+qXE2eRiJ6lLXvmLykhJL2Wq9/tMaNo4TyzJ76rEQ4SqC/sBH6M98WerJOQnxH7V
 t9Q6HpJRJYptysTBKE9GPjMkYRI96q6NlTXpHy+cWBmC5pbuqzMhCio24IQhLBI+1/fQXtz2+Wr
 VSYbyqlqzn1kcwgSKY4ZVCu97F5QCWy5HwvMPoie4z3tBRt1znEqkd6+5Gc37rwV4mU20nds17z
 GZ1q25fLoO4yQt9XBMFHhVWunif2+Nay/xKSa9qi3dp19b1GJCXq+nRbqjc1nRdYiNg+hCtxNM2
 WdRvZB8InvhwjpIzngqq66DqHdkkwk74Z4p2qX/bg+rttbLRn26GBNMJGWiYqh/q7AuqCZREH/M
 a1E/tp76mwAiV8fcCBw==
X-Proofpoint-GUID: vU-ABv1lv7dr6xk_tfPFPidjPa-HEsdE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150039

On 10/22/26 3:41 PM, Mohit Sharma wrote:
> A GPR service driver can issue synchronous commands from its probe path,
> or populate child devices which issue commands before the parent probe
> returns. The APR/GPR bus currently installs the GPR service callback only
> after the service driver's probe has completed.
> 
> If a response arrives while the client probe is still running, GPR finds
> the destination service but cannot dispatch the response because the
> service callback is NULL. The client waiting for the response eventually
> times out.
> 
> This was observed intermittently on Qualcomm Lemans and Monaco platforms
> when q6apm child probing sent an APM shared-memory map command before the
> parent probe returned. The failure has the following signature:
> 
>   qcom-apm ... CMD timeout for [100100c] opcode
>   q6apm-dai ... Audio Start: Buffer Allocation failed rc = -110
>   snd-sc8280xp ... ASoC: can't create pcm MultiMedia1 Playback :-110
> 
> Install the GPR callback before invoking the client probe so responses to
> probe-time commands can be dispatched. Clear the callback again if probe
> fails, and preserve the existing callback ordering for APR clients.
> 
> Fixes: ec1471a898cc ("soc: qcom: apr: Add GPR support")
> Cc: stable@vger.kernel.org
> Co-developed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> Signed-off-by: Mohit Sharma <mohit.sharma@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/apr.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
> index ea7f83916d8d..829e5c8fdf98 100644
> --- a/drivers/soc/qcom/apr.c
> +++ b/drivers/soc/qcom/apr.c
> @@ -365,13 +365,24 @@ static int apr_device_probe(struct device *dev)
>  {
>  	struct apr_device *adev = to_apr_device(dev);
>  	struct apr_driver *adrv = to_apr_driver(dev->driver);
> +	struct packet_router *apr = dev_get_drvdata(dev->parent);
>  	int ret;
>  
> +	if (apr->type == PR_TYPE_GPR)
> +		adev->svc.callback = adrv->gpr_callback;
Why do we need this check?
> +
>  	ret = adrv->probe(adev);
> -	if (!ret)
> +	if (ret) {
> +		if (apr->type == PR_TYPE_GPR)
> +			adev->svc.callback = NULL;
same
> +
> +		return ret;
> +	}
> +
> +	if (apr->type != PR_TYPE_GPR)
>  		adev->svc.callback = adrv->gpr_callback;
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static void apr_device_remove(struct device *dev)

