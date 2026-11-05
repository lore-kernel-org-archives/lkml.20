Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793866436;
	b=W6ZgkErD4QIJhYkqATER6H+jvvxnnKhoooE4yX5l85NTy+DET0GnXqoOiya2KtIYHRFa
	 En6rGcAmoelyZmKMqkmY/SqSjSuH1X0EwgkGgT0OvAblw82pZRYpAI81UTXAm0mRBqGR1
	 9EllPbsR38dMh0McicsepGHmE4R500lXqw0RVhGetpXTD6oicwX6BOsgwFHdBx7vlcqM/
	 aF9CVcGSj+WpFSjZ0qaovoTXNSfvKsLVB+lNep/ixEW6seadJ2iTfTAKsvznsunLmQZAh
	 VOsKB3RlYG8Bm3IBkFDtuj9RHetKAk6hk4oe/NqAKeu406OvA/ryRJYcvFGwtOl1LFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793866436;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=92R01FMCRyJRd7lrWUUeliuFDksWX3spjItrLc/CiMU=;
	b=11fwPl8IGJF6r62bY+kSrLHQ9nQgK3cgf+Qh9z0rYLvi2Wyth/LcBzEWewNl6+Vicbst
	 Kw7+g83j6kagVZp3DgXqRSmnsRXLBI5w9Gye4P1VaGX6aByknRtZYB4MAvNv2MQR50iNw
	 YNKtGdhQOdveWBt3XlXZtEi3+5lCecV4BAowoXc2Qr3EW2WgRBAX2miFnC+XI9Kkq+7zs
	 3otkL2rZ+cJTgL9eeBsptOjwDnQP8MAZYJzd86BrT9Ad4qnOIGcEmjGT7Uz3Sumh6C9Qv
	 cllvpngCQOj3wfnY9CFHt436aVM8Jq4s44PR4KxU8JAZnOxvLORIDlht+RAA9s6Zutw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zsj4yhUx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NCiP47kF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FEF606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:13:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38FEF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zsj4yhUx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NCiP47kF
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56Uc2L3624953
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 08:13:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	92R01FMCRyJRd7lrWUUeliuFDksWX3spjItrLc/CiMU=; b=Zsj4yhUx3fB/7g43
	z5tJ9j1Dzf287bjQpuykmLSzBhhTUd+JO/SkwgbnukQ0jnwK39P5Cal5up5XDRDN
	VDyGL/IW+17MiJvu5RzUND4cEPuMDaXcPjYBhFFz/dx0bpWY3p8rkPFpb7u6WvyE
	Yf0DrV5WcabBL2O783wpDsKfdY1JFhxbjc+4KhHbCg91ihfQlHP6heqbekB9Sewm
	bdWTk6yUAkKDqV2MuX7rbYZPTSFrZH7qBOn3IVjRtu/12/wCzDP05E1rehyogCGt
	7D6N/6Li8wzFjbEcNOnBjQ6+VSgvntwg+UJC5UEy2FTO2H+pmbvBbR3Utv9lCo7E
	d/+qlw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6br3xar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:13:55 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90c4d46037eso2341786d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793866434; x=1794471234; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=92R01FMCRyJRd7lrWUUeliuFDksWX3spjItrLc/CiMU=;
        b=NCiP47kFHd2kcmF2wOTQ0+GW5EXh542X7cgv3tKjvJNmfj+tgqdfhlVUq9VOI5pMZH
         j5mTXh6P6nNA6LgOWMht7icM+pp+5A6cXBCBfCQfiAxqikGPI+k/tPK9gN3TxNBZWOwI
         m1s8uEb1bDWiD1LoZIqdOxLS27T9iUVZKrNwMTKg/Gp5hlqe6OkeiVkpojotp9WL5Pfd
         KiEeDpR2t9rn7rj3UwEPhm6evOKE0WRgJWNhA0Fi9DoTywbKUkoVtiUJnD4lCBplpEeq
         o7vKpEX0ZPyPZVNTUKoy5GkPrHgYMu/u5I1Zkr/RaTcYm+Gif+ELC3C03bLof6GeinqU
         W0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793866434; x=1794471234;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=92R01FMCRyJRd7lrWUUeliuFDksWX3spjItrLc/CiMU=;
        b=iS220ulMH4PrHTirS1+y/sRlVfIU3HybrurdHE4NHse6FoLbfJtp09q2PSJ0wEXPKa
         QjdpKbb1I4sA7JaGMik/PEBOey1Mtu2OMNrmCpkoXMZBd6JN9zgIeBk5zJ6pw6TcaG2K
         5CchR/BekXban3QgjUfnuK4qZHwuZ4bNLHkSEimspnimQcLtdlG5JDM2TgE+jkf7THni
         jmPTsnFu4oVAEiHhVSBfLPI9auorJIQy/a0MnXRbm35M7CSBefQGJ8PU8hwAgwGqt4x9
         fvFWS1GUg4GPNkvObcNBKfMAGnm+oz4KD0tIJv6l2oKKfckhWfZW0bTszAZGqn/jluEF
         879Q==
X-Forwarded-Encrypted: i=1; AKwUvBzok8Kr3GoYrWptM9q7jLIk5FoKiRnqUjnR+VwcO7jRGZpEfrVEZGbV6v+vRlN/ymT/efwA1l8B1y3B66w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BMnzf5WbTE51WTR3T2QbEAZG3uYTwUBNwaob4ZH3J6QQbTERj
	7f1wMDnO5TJeRJpNBs3OAL6RprmVYOSnNeV3quPJjQYoNzDjzgSj7BPb2Vupmgs4/lSyI4YSC2K
	1KmaOzIaSMAU/dOsE+KbiJ+q1oDShdEPDIyLP9W+EemXpfz0ZTY6dRFsEt/uBD93AirE=
X-Gm-Gg: AYBFou38QAuJ35rsfcdUSCup9Dt+1GQtYhn++FZp/PxcvVTpVsM7RZ+spsz7lNCVoB9
	5y+LgyMXja8xyyg2yrSeO6FRn544AJiL5jgNnYfhMXqGMdK3mMOtt/d2SkDSJW0flbgw9GnpIXV
	77BetH0VIr9CHGf9ApND1NcYWKnkbP4ee+chUESm1E3c/Z3mIdz8SSanmS0pNKh1HCVnaq3Tky+
	M27rBDip/A2eZoMGprj+pVyL/iUfTNHHcQsvcjriKtWhWdfxu0G6tBXelGnxxMtwxKLn+hq0zUr
	Z0duNCHy64tHaJ89Ld8484dbcQtAj1XWOsNJmcYeiP6/QygsuVUQj67dXlbYT5UAe5HOYM57P9l
	isSoOchAed8n478HcTLousM5zrxJCD6WhGohYJxKJ2+JHUiZrQse4Z9/aWcO+d3K2mnwC
X-Received: by 2002:a05:6214:1943:b0:914:4464:41c4 with SMTP id 6a1803df08f44-91ca4b23661mr390679786d6.4.1793866434394;
        Thu, 05 Nov 2026 00:13:54 -0800 (PST)
X-Received: by 2002:a05:6214:1943:b0:914:4464:41c4 with SMTP id 6a1803df08f44-91ca4b23661mr390679386d6.4.1793866433953;
        Thu, 05 Nov 2026 00:13:53 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e42479dsm150842066b.17.2026.11.05.00.13.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 00:13:52 -0800 (PST)
Message-ID: <50bb3200-3110-4739-8a15-173bdfb8c220@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 09:13:50 +0100
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
Subject: Re: [PATCH 4/6] backlight: qcom-wled: Manage teardown via devres and
 remove wled_remove()
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Kiran Gunda
 <quic_kgunda@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org, David Heidelberg <david@ixit.cz>
References: <20261104183935.1214630-1-lee@kernel.org>
 <20261104183935.1214630-5-lee@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261104183935.1214630-5-lee@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzMiBTYWx0ZWRfX6GpF+bvmyb/s
 tVyf9Ywlm5fPPNgkqjSyBm01fqn/jPEdv72DpLIgmENVNb8HIcLs0KBBvund7kmvweSh5nERc49
 mULlp+Sm20cEvWKQRrihk0E/++Uft7Rrl+cWyn7fd0Il0KZgTwYfGITKmHRGLJJWc0rWXBEc718
 E5ARs5cP6z7zbUfqJdEh6mIIH/h/cj6GWCqFxr4P0jm+wWbHjvtdKh/RcpeAdH5Uu6dopXfInyr
 DB3CXm3dp87Dd6IpKDvM2vWVF+LTcuKeoYh+nH6LikVYAsYNPTcFI7GmDZkHTzyu0OAal++td/v
 oobWcIZdpZjM84KWw7fN6vxGoWXALUAC+oLxtQcUYRoqvqy2ihcYUxlxmumG1ClnQrBRUEHNjeb
 s5KvVsu62NEHnRlVzGznqP9PXtJJ1EiZN4MpefHG+KixT94QKYugfMyj9+M3Q5w3iKZ2x71iFh2
 VARzlf9NCWC2PFun6oQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzMiBTYWx0ZWRfX0kC3tdhx6yyb
 E3l/WLECx8x8AOoTPiz0qTkQqLQwybpIqTGww+7t98rtt+H1z7sh1iuypx6hudhn0Ecros/a8gF
 hPVYNNgXKdeuHSQVq8r1tDxKiHJyz18=
X-Proofpoint-GUID: q_8mhUtMb33UtQC9vN5Oppk1OPN5daSA
X-Proofpoint-ORIG-GUID: q_8mhUtMb33UtQC9vN5Oppk1OPN5daSA
X-Authority-Analysis: v=2.4 cv=futJ914f c=1 sm=1 tr=0 ts=6aec3ac3 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qHjM3Cc90Y4xjM8bFJQA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050032

On 11/4/26 7:39 PM, Lee Jones wrote:
> wled_remove() currently runs before devres tears down the backlight
> device and threaded interrupts, resulting in two teardown bugs:
> 
> 1. mutex_destroy(&wled->lock) and cancel_delayed_work_sync(&wled->ovp_work)
>    execute while the backlight device registered via
>    devm_backlight_device_register() and the short interrupt requested
>    via devm_request_threaded_irq() are still active.  A concurrent sysfs
>    brightness update or short interrupt during unbind can acquire the
>    destroyed mutex and re-schedule wled->ovp_work before devres frees
>    the wled structure.
> 
> 2. disable_irq(wled->short_irq) and disable_irq(wled->ovp_irq) are
>    called unconditionally even when the optional "short" or "ovp"
>    interrupts are absent from the Device Tree (-ENXIO) or unused (0 on
>    WLED3), passing invalid IRQ numbers to disable_irq(), despite both
>    interrupts already being managed by devm_request_threaded_irq().
> 
> Initialise wled->lock with devm_mutex_init() and remove wled_remove()
> so that devres tears down the backlight device, short interrupt,
> delayed work, OVP interrupt, mutex, and driver data in reverse
> registration order.
> 
> Fixes: feeab87b3072 ("backlight: qcom-wled: Add support for short circuit handling")
> Fixes: 8663c188beea ("backlight: qcom-wled: Add auto string detection logic")
> Closes: https://sashiko.dev/#/bug/linux-51cd5e35-3cae-4e4c-986b-7261263507cd
> Closes: https://sashiko.dev/#/bug/linux-44e5ed80-c35c-4786-8bf8-9ee955967d0b
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
