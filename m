Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792503633;
	b=pKdcsTCpbodIFvqJ9qS7D5oyYPoglLsLfyIK0+KC9xSnnfQ6XNIfHFubR8xDn6piCcEH
	 cB81RhJWRso/OmTVBCPupFWqpLd6l6ei1WtvjsO42rOZtLeLCm5tzY1a3u0VbETGjWDio
	 pFkmdWclP36LJ5wcdjabzeGUjW/CiMteps0bML3hUIiCI8dIUw/JcBZYjgPVxcP2QLjU/
	 LXklk3lGfa+9VYbvDg+FxsY+iKJEBxcHia0Y0081uKW4IpOzhMytyZIZP5qCU5jJgbPSi
	 WyJ2z9Qi+p4yl7S83P1wehOTpypvBxSAbqnI0Ryl3BYXGI2IQzGBuVeVAhVVaWZONbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503633;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kjoD4zTcGaDNKdU4jZr6UC/VbdfZPGCSWwgF9INjzk8=;
	b=pTHbchf1qUIJCwnU8JEuMep7D+AlQ0xLCcCmvOldMLseBbN7xwETwUXQTh235U00UIUr
	 ARJJe+pV1kmWsf2WovOxujaiAmQpE8JlAaF0tdVWDAXo2IVkDUmsayXHb8waA4Up/FRij
	 wxt7JAfdtz5BPQeuiPY0NiCbw0755V5E544x+eofx3aAusEnBNqzLGAFw19iDUkQWexut
	 Xrjs80phSkv78jpM/1bVDw5M7r3Wr41+18Ee3y97riST/v5Wb9h4KjvIR+o01TZYlgWDB
	 GTEBp9dvKqXusgzSeHxqvgcJHprrh6JZ4fESFw9o43FY6w7iUTkB2NA/e1qG4+xHGPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J+lSBTPp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xerno1ll;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C63B606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:40:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C63B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J+lSBTPp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xerno1ll
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDA8uK702574
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kjoD4zTcGaDNKdU4jZr6UC/VbdfZPGCSWwgF9INjzk8=; b=J+lSBTPp8au92YwL
	dppsvk97Ir47oVbGtiv4KOuchx4pkFy9PDd8bUDY/mrhbW7QzlBWHrsqzh0dck5x
	7IzlATfYdGkklpaYWcd5nA9LdnB67rTDl2TIACrLnUCUOvDd6sWMcZE5ZGDuEMty
	hUqwzKLOtAAOBfYG7bHhnKgceozxVduKkx4PUZC25GtJQYGwb1BV8fiRBK1r0cf0
	iv/b0KGakppcxeBIeHsO4x0jqOOrLlhOl5x+yw/UTuLNk3ZrVqFrB+SyMcqY+hSM
	MXbVsW6ZsvndvWOR6HUgUll/1fPAfha0V6025kI0nN038Dy1piNrlSV2bLWX8uYc
	JHWeGA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5stnmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:40:31 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9106bb33cdfso9113586d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792503631; x=1793108431; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kjoD4zTcGaDNKdU4jZr6UC/VbdfZPGCSWwgF9INjzk8=;
        b=Xerno1llNzdwOOSdwYCePrFJkureNneXwLwss1gnlmYvtd/qr63/KTHUUC0hDUk4UA
         k++h1q6CRlQ6V9WrP76XucKfxDD/qrfoVlJmdXluLcwlgyxQTWwLl4UGrkCHz2qT8YyJ
         TpP+/wdMKPqzVluqoMr4TqQnd4Iqzzj1x16QRrdDzWLK3bnG5fCIjPac2FoQEcU0AVLQ
         q4eJ1r7rBH4ffvRrrJYvQpLWd7w5t+SxkwMCu85ChTT7HJqeUUNQGnIhWfitZDaICJCm
         RAvhSY109Ncpk7pqYob7bfUcc5HVFjhU/I4KotYJr9VD3EEOY+70g/MZTFHDte7fuwOi
         wTGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792503631; x=1793108431;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kjoD4zTcGaDNKdU4jZr6UC/VbdfZPGCSWwgF9INjzk8=;
        b=SN6SPkHMR0ba2+ahVZCRoWFX1TJrQlL83pvSFT5tAbQqgJ4RcUBEZxmiEke4ucIltL
         m0HyUy+dmCK2/P0S4COSQgmNKy0TyzgGYnHfO/bafjXeJGCqtDSrbRDpjsr/pjfbnxyc
         abOsxyvS+Dt4RXB1Yz2fhRLq6FBIiJUagOJrPw1luWxoGkT/Lrt0wb5duC2OwkMOpIU6
         FgIcOu5dcB8HjEMELw/gB74/CANC+ptcEfByqdTCzZHibXRcr1VlWMKDX5dgoozdkbwV
         1b1mymtvIw9JMxj+7kbdLrmNWP5eyupyOUvnGmDGFh4gsCroKqvn2k5AUv+yQNAbjK5u
         97EA==
X-Forwarded-Encrypted: i=1; AKwUvBzfZYjjr0dfs2sfn1kpgHiG0pWJmEkgaPWVxBrT1KavPHjBrdFBcGIlivFFVwYh7AmGmrU7mbgTrDLnhYo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQpxEjiO1vj6HlAub32RHUgccZlSLR70kz6Zt4pzam6ho0tof2
	OV6TepKI+5IGl+KCa7CFRswz7n869204N3B1rywWJfVYDKXYJKcIX6wGrHlWATyRMsdxiIyXsig
	V7dkmlsuxuE+RyD1yH23HO4AqTPbQGCrKB37uIzzDPvbD0+wMkurxnAKvPH9icbx7TuQ=
X-Gm-Gg: AYBFou1M1a6kzYZnfDf2YD4sEv2oQlUlKcBHG8VmMwxGqE6n9hUhWoscfS8KPBgyZ07
	r3/EUKj6KoC9ZAC2Lh+erniSDkVCrYuw0eQUVFynAH174APDyDZ8Qg65qoQbDXcc3No0X6R/Mv/
	ML+Z440MQi6NI/OeMmRKgPzuSWB+WUX3SSp5nHAA2xmoFOGnR3q64R1TR9vNJxI1yGzdpC2Vj/J
	iS9BhWduHG7X6xqL9Ws+HO8E4GnjOgdJlxQ3Cj7aRx/eBcw90zC8ga3g94x8X2ti/k7QY3W+QJ8
	qwN2P80Hb+7+HXR6qyV1RJRZt4ya/ot9P9QeeODJJmmHYjai9W51n9B2e2vCnHWmEldJpFbJvpE
	oBvsetAlrA3Dhs5nGCYlhIg==
X-Received: by 2002:a05:620a:3904:b0:93f:977:5d9 with SMTP id af79cd13be357-93f29a13be3mr1922211785a.0.1792503631130;
        Tue, 20 Oct 2026 06:40:31 -0700 (PDT)
X-Received: by 2002:a05:620a:3904:b0:93f:977:5d9 with SMTP id af79cd13be357-93f29a13be3mr1922204285a.0.1792503630475;
        Tue, 20 Oct 2026 06:40:30 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb165bsm477628566b.71.2026.10.20.06.40.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 06:40:29 -0700 (PDT)
Message-ID: <d3670f1b-57ba-426a-bdfe-be560740f516@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 15:40:26 +0200
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
Subject: Re: [PATCH v3 0/3] power: sequencing: qcom-wcn: support SW_CTRL wake
 IRQ
To: Linghui Wu <linghui.wu@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261014121910.1509541-1-linghui.wu@oss.qualcomm.com>
 <20261019093911.3199891-1-linghui.wu@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019093911.3199891-1-linghui.wu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NCBTYWx0ZWRfX85tf2imDwd/W
 DuXaLXFgU4ArVhaM9Dif/xR/pDvXKDJn5l/r7BOAxhDBJ/xQyc9vxDDQSJ9zQf9hRvMAate3aJq
 U4Eib+eCZVxFw49pzwbI9iJjVRNQJQ5edARgk/qW9+H9e31PL1YWSEwujwAtsHsmE5d8xgbux/k
 UBq/fWE+YX3PePiZKhGzXZKzQjTt1qv0Dn0a9XTUD5vwWmqfs+YwHtz6+x/6L7YwwozjCoMP1tf
 kAfiriB4vDnl/b3BLbAbJV19uRZves/4P9AfWevFdeFDfNnegieSUGldHwQdYOjImMGt8LiwQv9
 hGZvW2TvP9lf2AuecnnGJFsO3oWnd1VxVKb5z+YqIu+KBqCIWsoe55Lcp+05VX+3TF4YOjYLZKD
 1Tgu3B9XpAcTNji2RcZ7+lwx8DRNnE/yCwKQ23VWJIaZaSfxxVN/57j7tOAPMEc0Vukwlp1hVsj
 umW5jFr2zb8AyXT9/oA==
X-Authority-Analysis: v=2.4 cv=fIusTpae c=1 sm=1 tr=0 ts=6ad76f4f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=nQyRZacoh_ZcsPQd3roA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: MzsE1FYyNuHAG_cciCbZqrVyUDxAT9Df
X-Proofpoint-ORIG-GUID: MzsE1FYyNuHAG_cciCbZqrVyUDxAT9Df
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NCBTYWx0ZWRfX5uQ969MY566T
 ClJ/B3HEh3dQL8/iVI+dKQoTIP1f4B1ZdY28cNQzNLAW+GeIg1VzB6IEO878/bcKIzkJhC7tifl
 3rGemNKioSyZPR8pYqPDx5r3uhym05c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200054

On 10/19/26 11:39 AM, Linghui Wu wrote:
> Some WCN3990-family devices use the SW_CTRL GPIO to indicate that
> resources need to remain available while the application processor is
> suspended.
> 
> Teach the Qualcomm WCN power-sequencing driver to use the existing
> SW_CTRL GPIO as a dedicated wake IRQ when the power sequencer is marked
> as a wakeup source. The PM core keeps the IRQ disabled during normal
> operation and arms it for system suspend.
> 
> The series documents wakeup-source for the WCN PMU binding and enables
> it for the Shikra CQM, CQS and IQS EVKs.
> 
> The series has been runtime-tested on qcom-next and kernel 6.18.y on
> Shikra hardware.

qcom-next is currently based on v7.3-rc4 (for whatever reason) and
has 1398 patches on top of that. Please pick the presumably 2 or 3
you need to boot (I don't know, I'm not following shikra) atop a
clean linux-next/master and retest.

Konrad
