Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5582B3CC7CC
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672012; cv=none; b=hnl26KO9lt2Vy45qKMV5zfCcNo+wD/ODm7urskqYeJl0VXovR7Uk+D67cGCcgpGM5V6WnHrDgskWULSTt4LJv40icXOunnyyuLBOjgtNTcHAWf3ZvnErMHS46CbzM6NEdYTZttzVl2yv78ImhflMGzjB9eiKd5/2kMfYBq0Tbrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672012; c=relaxed/simple;
	bh=kbPd5aEB88RVKC5dTRS0nFWR0+S42v2EQ0FuI8qym78=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J7tZJ5ApNZYafu31FShjHgUl7a959z/kGRq6krkAm5APyvmljhzGH89V5hO6EI+0hT9Xe+fYKpiKtdAjnmb16PdSx0xtMjNtGZLtRf9clnUJLfsJTA6bQMKhSonj+2BB1g/3XA5EYqsFoj/ndhSA1/OWxY4o3Rh1GkS5Z0Dr8Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dy7lHe70; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SroB+0e9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dy7lHe70";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SroB+0e9"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7TkQm300808
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:53:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mDtlofeD7haSM+lzJFlUgBc/2wfLYIn2wjTkFseiHXg=; b=Dy7lHe70TQudM+wi
	wL0mZ5qrqMwol9lb+JSLRrCKJxrRGAEyHZxX1mPFwjxLU1y9nDbPx3EEyftAlHtq
	kXBFSa+SniulUWEVIssinETeZtjxG6UsK0QwHWmvGuCzOzuyAtrbQUUjpAoiWvWN
	XTv7XNXvWtBTjLXz9NxAWAOn/2WaESwGS3Lg6RCfNi2Db31zhkVH87iQfgzKHHuY
	OkFdID38oPXeuWUqTp2sEW/6wwk1rdUe1MdM8Sj8srtJv91V72Vv9ZMiP5Th2xJj
	rogPFcLO4RsrSbxvt5FXCsIksUzc3ghhiAPhyYItRibKHe9MhT93aCC6pfKuVVpo
	YRDdGA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h05yxh2rb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:53:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93c614646e9so429458885a.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 01:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790672009; x=1791276809; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mDtlofeD7haSM+lzJFlUgBc/2wfLYIn2wjTkFseiHXg=;
        b=SroB+0e9JM8oaRpopi7k+Tgjm0dWHWO6iqfuy2IEKdEVg81uCSyZBkNl3jDIE91SBm
         ZPqtkZNX9MyGpbmKi3Ovt/sfZsxkjwiRway0vHuwmR45+IOpYmEO/K4EaJbKWAonhytL
         sf9B4sunE6lMXTEW4C7Q5AfPHEV8zAYDoRpj5/iUox1TtJlWEb6kUem+7mFHB5rY/EEG
         k5LINt15kDkkcmWOf7C2xnb8ptapIaRSLxFgR8RaOH1z1Xlk0HZlH1r1+oLR+98aubm1
         YvVpt2U2UewkYxReFFlulQ0INNHhaYEY+fsEThSXAMCMpF+5ru6zm99fK317xQrz7Dai
         rzaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790672009; x=1791276809;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mDtlofeD7haSM+lzJFlUgBc/2wfLYIn2wjTkFseiHXg=;
        b=v/JX7QPS6wW72x8gVm7yY48Sb+4fSoFP+jkxj0xnZGiXEv0yxhyP0HOfcNMxuurzQP
         ITj0CDTwRY+Xlo5ZI541it/hFrrVIEwH76zRAUbF0aPcAUg7SiJXWfE3Fc8nOM1xFki7
         j0I8vjtYWIl8x1wnaQHkawZrwu0+3jlIWmN1sgMme9xitrBa5260PebHltiT18IcWntK
         LZYjNP6yxyDzd2dHqmd/d7Z0L7fx/QqgvPliDnqWrTu6iGA9GVLHBeiTbMl+NjNK/t8m
         Ew8oePdL/XZEemCaGPa79Jm/K9s0zEP6hyHNljfS1G7YFMf1p44A9Yym7B/7p/cfTBJ5
         GsJA==
X-Forwarded-Encrypted: i=1; AKwUvByabFHEtNFSMshXYqmjjyVA50E6b4qtQqhc7syd7LolioJp52D1qWyir9DGA+1sUYwOPeDFErp/WCzRlEY=@vger.kernel.org
X-Gm-Message-State: AFuF++lo9EZt3Gz6Yx86Ef4mlq7llxU12i4/2i0Ji8SDRVd6zMjZIbfz
	Wa08HJ2wOhvtg6imSptDPq27fEFnRcLk79/+JiWZP5ZdrI+XEOx+10zdrhFlvR0z1IXDmhfwEi3
	JyJAAFW3aiOcLPOPElmEkwO88cCc7XBN52P39QN5kCxCh+p/iVlvVQIvER9tlMz8Tak4=
X-Gm-Gg: AYBFou0j6WHnK+OG1SJlQ5cSEwCittSAdXvD0SS4tGoBnOlCu9yNeYL2ih/mGD7VzQ2
	BpkxtlcoR4aG2aTB6GDQg0c2EvM31KsYOsBq9c/CuxNScBlwSKJNtU8a1tuWEC+j/c9RIkBQxsX
	T3rYn3OFg8FJB0SbGfMPat+A1S18iIawJDplWiueoqwsOmueKOeEpP0zzdCDMmm/yR6kRfahjs+
	qEKER3fEceaXc8o1dpZjhB2z6GU/U/RYXqBQVMXMExtPYUojQs+BEJpRvh6R9pBIQjTjpXyb0bg
	03pnL+KoywclhFEmBEd+RetIF15XKPG0hta3hq/E/c/VJjYmYpYEOz9rvB2wdnsAthse8QyJ48T
	f7uh2eo01VrxRrQCZp1155i0dKOSOOq9PJIv81h445v2xFin6Yv80GW1qeboXfw==
X-Received: by 2002:a05:620a:2b97:b0:939:1222:b9f1 with SMTP id af79cd13be357-93c439cff38mr2562088085a.0.1790672008589;
        Tue, 29 Sep 2026 01:53:28 -0700 (PDT)
X-Received: by 2002:a05:620a:2b97:b0:939:1222:b9f1 with SMTP id af79cd13be357-93c439cff38mr2562085485a.0.1790672008082;
        Tue, 29 Sep 2026 01:53:28 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a012387337sm18281345e9.8.2026.09.29.01.53.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 01:53:27 -0700 (PDT)
Message-ID: <5c0317c1-f4df-4b2a-ab03-2a7b7132b1c6@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 10:53:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] thermal/drivers/airoha: Serialise access to the
 shared ADC
To: Vitaliy Sochnev <sochnev.v.74@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Lorenzo Bianconi <lorenzo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260915191131.25214-1-sochnev.v.74@gmail.com>
 <20260915191131.25214-3-sochnev.v.74@gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260915191131.25214-3-sochnev.v.74@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzNSBTYWx0ZWRfX14CgCMJDULu0
 N8sva15ZbXFdQMDNLOW+WI9JsWbVea55uIxY1ckpqakUjeJpIJ5rO1dVJe2ILFfdaw0LIvKmmP0
 EeXz5XKlF4olTtWb3OloW2r3Gy/cuJU=
X-Proofpoint-GUID: 3VNnvW7ZHpBIG7Y2I6xy5CxXrhQEKYt6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzNSBTYWx0ZWRfX3B693niy2vTU
 pBSu0rScnTdZF2u0GNVcBXwiY1lI/slHKUTpw0olBxvxb/RCQhhgZzEiemY5vysOztiJP3VhKND
 zErjz86nNpCFuSlRfzIT/tIDT5YyzPkyqeu4EtlSQzI0K+IL5ST6BrKMNAvNhyUla+Qfz7UtB3w
 ExFfrCr81WAloyttm72XQXhmyJ6lnWp5ffAnjEhCvi8ylPMWMgX4cCYhUjetLnEq7LfsvPtqKNS
 pNxEaKOsouiLRkaV15gVKGqzNUIeG5ZuZT74i4CWyjaijYx8prhbXHXvo0ooZBaKcWunXgfePEN
 eJI7Fn9IThTToXUWJKDayurxWjlkSgcR0bRDYWbotOLh4uX2RomYciSZUQadJ3kbE25V3WFq1s2
 WKANZBDbwCAbaetjPrTvau7G0M5k3xlg+5TNWjKk5J04JMZLxOLg4MKKEW0AQigFyfu1ljTB12m
 422eiAfdwtz6tnsimlw==
X-Proofpoint-ORIG-GUID: 3VNnvW7ZHpBIG7Y2I6xy5CxXrhQEKYt6
X-Authority-Analysis: v=2.4 cv=SaFi5fRu c=1 sm=1 tr=0 ts=6abb7c89 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8
 a=4F_TT5Ia9pFYpsbeirgA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290035

On 9/15/26 21:11, Vitaliy Sochnev wrote:
> A read selects the sensor and walks three diodes with a 10 ms settle on
> each. Nothing serialises this, so concurrent reads interleave and
> convert samples taken at another mux position.
> 
> Mux writes are dropped silently unless PLLRG_PROTECT is lifted, and its
> save and restore do not nest. The cached TADC value also skips a write
> after another reader has moved the mux.
> 
> With the AN7583 sensors read as parallel zones during CPU frequency
> changes, a zone crossed its critical trip on a chip at 55 C and the
> board shut down.
> 
> Serialise the sequence, drop the cache, check the selection after
> writing and after sampling, and return -EAGAIN if it does not hold.
> 
> Signed-off-by: Vitaliy Sochnev <sochnev.v.74@gmail.com>
> ---

Should this have a Fixes: tag?


