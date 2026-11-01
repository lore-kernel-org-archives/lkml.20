Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793502919;
	b=lC9YS0vanGW6ygxF5+CyXX1/EieRyzAsI6FxcieJEYbmP4lilHz9Py6MLVUVM4ig3qW2
	 UxmmG3goCSVq6YGHQIO435MPEpxgKDQb5+qHjzSURizdCiaQn/YHtVsSRihJsq9dNcO4L
	 Qfvkzq5DkyC/HZhtjengt5FooR4RkTZM4pozYwDA7KyWeeNsr2J5I22A76QzcbVs8yXip
	 iClC+RKxWMT+do14VtD1QyAwua21Br2P9OsrnXqUAQE3sRnWyL6izCMwhqS3CQSCWla+q
	 XJIwl62uGxOYUfuywOIsjlhhTyKJ7z4ZRQJ7+nNfnhznmsnR1dgWGUD0gT46LVaSyBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793502919;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=s3S2uYM8/USFcnTV7atLvovkptZrXT0Iz5U3uf62RuE=;
	b=MeVLTa5dmpxEZuSzDTDULrHN4vAP5DnSrLLAYxI+YRhz8nym77PxK1/yXQmnAUCJsKNL
	 lbCChkpZ6aoeznMcRQoW60fFOKx2cc9Mk7fx9m5lHJ5OH6/S1D2nCvQa3Iyi/x6MkROUe
	 jWvGO7S3Vg+ewAdcVUc1huKeBY7TM8Umg91++tufmc8wxB/0tfYdURDPtl+8niGF+Nf+d
	 YVvgh9EyZmo8aEtHrcXijRJE/c0EK/J11j3xs4zldqS4Fxsngplv9law8Ha9QRYDgwM3Y
	 iwxiNDQo3ahKtDwtb2R4bi2SVITImT7wsT+bP0l9JqnMpvdMEUD+VqRoukIuEzDtR1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OOmd7CVG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CPgnXQW0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A299606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 03:15:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A299606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OOmd7CVG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CPgnXQW0
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A11xtP6594946
	for <linux-kernel@vger.kernel.org>; Sun, 1 Nov 2026 03:15:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=s3S2uYM8/USFcnTV7atLvovk
	ptZrXT0Iz5U3uf62RuE=; b=OOmd7CVGBLeCB57Sp/8LeC+QukumjuXIMW6CxhyP
	k62nAyIiB1avXyDa/diLV8cPxscWiA0YPSmf3gdqWUASBcYLjrC8PfI3HvRuNCT8
	NuSiYBD7mljiSEfx67mErG8vCNQK4Zt2gfgnJK1WA8J911MLZbpUxPojXsHGn1WF
	00LmBeRjDcNcWbsnQ4amtLQsljh1Yce0LaKkBIidyxyuGalsRvUzhmxAYhyKj8+D
	a21QeDjwZhCxKr5FdlOfervxsMdut/MqdsxNNYOoXwmaqW5bcDcm73B610z8fVAu
	uvzQtxpaTmoVQYG0YkNg115Ul2sk+4L3s0AC8SCIKPb3Zg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn79rtp80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 03:15:17 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a3451ea93so3151790eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 20:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793502917; x=1794107717; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s3S2uYM8/USFcnTV7atLvovkptZrXT0Iz5U3uf62RuE=;
        b=CPgnXQW0rWzOTwEeiWMqU3REIoxU1uyxLv8YMPgfHJm0lx5fNLNNbAymVvGqHCGN6q
         0wOk53H33SQ3U6JLLDE6IeuTLEZW0P++I0NFcFfs7MLiraenXI1pjeZvPY4HR1f9iCAU
         p5gbinmiQq3cRJUoOpZxXjNgftQO482Nzm+Q5NriOIIsOUY/ENhkn1o5wSsZx2KdCSEb
         QXDi+/Kl7z+JG4gGdq7eiZzVz2bq5rkXRgTMPhFz0E8v9ZwLn1KPD2QwPpEvru06yQvU
         Q92E4UXfKI4eszVkmmifzgdFpWSDG5/04XvhTHSbhmpS/DFg79XBIqDLqEr4UXbP/5r8
         A8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793502917; x=1794107717;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s3S2uYM8/USFcnTV7atLvovkptZrXT0Iz5U3uf62RuE=;
        b=TDrUQAuJb4HHHryvYYa0fNU48CHM8CKybXII5bjrDM9C02WCVNWhVFlhJJGJmWe5jn
         x70ARyi0Tj5ORlbqFIquPdoU1b2WToflw9cN+zJZ6hMz8ZU5QT8nVlt8UN+gWAOPby16
         siIWVfFrvpGIDLoeqM9uxvvBLrkDgdfBnrLMb07uPgeNGZmuhJrkKZfIr4xK24VwIGmO
         XfXOxPEAFRQZUTA96lK3mcXqLhGhDtt7yQFLgvsIpuRBY0zSJ/kaE6EGoTmkTdnYTwx4
         zXO2HLtpvBxlhmNImX3tOiLX7OlWBm7xaeImoY+hCiXgd5KOPRuKNBcT+7C+YCpVolRt
         9nLQ==
X-Forwarded-Encrypted: i=1; AKwUvBx2pR/M6eV6Or1M2g/kxsQxTk45b5DVJ9/kWsTQ3re5ev9p0iWdpHmonwp9gRLZrwxro8Vb7dtk1Sp4GCo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rki56h65ZyUF6Q+tm6QTAinncqH/kD/eSaB4hyjy8h8GXRWZl
	eCXt2wMaGb5z7ocdLAfVvw6Ym8zbgK4toONI5sWh+me76dMUiLXme1Y8ZeZ2d2se62EjIlSCuHh
	AL04s0ha+kzwZztQgyhF4MM0DU6fowvXnRfVt8VGfisaIDYuRPojBscR3sf6M/Inq3sE=
X-Gm-Gg: AYBFou1dANdqpC5C2u226UsdmmpJm5+ChKxcrWxVPBO/aTd2THqI3Z5V2Bqhlb9jTJj
	MVJiljMATkflIYruS2Ss0+93veYCPvGycj0hYalvtYMVtaTdvjB6HI9uM2BDlDtfHtMxxzwSGPj
	S6KtDW9i5xTzP1wORcvzYfKEA0xFD9g1LdTplIIMaO7kVfWLuQhHplMb3i1dCroAECdRJtNvSRX
	oBBD+XI/ooAMx3YGWSgYXiWEVQeUj7AhErHpnkIb6ePsO/rE9kcqStnflWO1un2R+4hl6Wd7zcO
	4EeaSWGGfaTb9XLOuBpOsLehWQo8iQ250GaLy/dWepQeO6UUekPCtZrqT2GZD7em+fwMUnfjg2+
	6y/52cBe5QTpMDpDXBOQITje/HcCJLZfGkPxQrXv/k6j77Dt8XoMS6eOFy4v0XRiWmUvxI/QswV
	3RG8vU/vNrtIvP/g==
X-Received: by 2002:a05:7301:618b:20b0:35f:2858:aa4b with SMTP id 5a478bee46e88-36a4241b070mr8860782eec.30.1793502916809;
        Sat, 31 Oct 2026 20:15:16 -0700 (PDT)
X-Received: by 2002:a05:7301:618b:20b0:35f:2858:aa4b with SMTP id 5a478bee46e88-36a4241b070mr8860761eec.30.1793502916226;
        Sat, 31 Oct 2026 20:15:16 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428c17bdsm21725563eec.6.2026.10.31.20.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 20:15:15 -0700 (PDT)
Date: Sun, 1 Nov 2026 11:15:11 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        David Lechner <dlechner@baylibre.com>,
        Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: adc: qcom-spmi-adc5-gen3: Reuse IIO device ID for
 ADC_TM auxiliary device
Message-ID: <auauv3zAKPpYVxXl@QCOM-aGQu4IUr3Y>
References: <20261028-fix-adc5-tm-v1-1-0018aabc06c5@oss.qualcomm.com>
 <20261101020047.66034613@jic23-hlaptop>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261101020047.66034613@jic23-hlaptop>
X-Proofpoint-ORIG-GUID: HwqTh9aXkMGON-J1owIn3EsvWhaIMKPO
X-Authority-Analysis: v=2.4 cv=Wtq+otfv c=1 sm=1 tr=0 ts=6ae6aec5 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=icylPTNulc19Rdkzs_gA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDAxMiBTYWx0ZWRfX46OUEb9egGa2
 ouTtCVCXxSoWvqv8OpnFB8PfPgzZQr6OvQ8fsBnn9G5W1BSKnclAS/6WNFM/ZXeWK6AVy4lhh2m
 PxXClMgd8nIcnjJKICmENkrl/9fJVcs=
X-Proofpoint-GUID: HwqTh9aXkMGON-J1owIn3EsvWhaIMKPO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDAxMiBTYWx0ZWRfXyGDx5rEnZXLN
 P0Y+kOYAhHaqlcNSunin+XnwvAbkzEhl1uXpl+Zjd8oU27Q5N1vrbLj8RoYGiLc0V0jdInCxOnK
 3BLwYVF59ApG7sf+T8Tf2zsYktXEaPD8RtIjFQfaZRUBM7F6qeTGa1PCHreogCvZ15i1IXZhRJ3
 cRZXNQKBlVFO6UdUWgEUd9JdRQeUAJk+mDONpMj8jpxrnRNxztsuD1vpUruaEPACrc9Dv11l1d5
 ju3yFbtWEdKgILbx0QiA/U6wkxJFP/hpPpsEcHz4PWA36T1duHgY+mRTHTP6Uk7voScIa3FGj43
 Ax1T7Ya0I4RNGd2PpWf84YKvw+JjIyr9l9SKrHnawQ9gqa05gcbP61eddinmGwDNAPMoSFVZF+w
 TzfG2Lx5hDtLYn0XxAXlN+9qabCRY+vrQLju08i9y5N41YUVOWGgU5c1z6BHRQ4J+OL7JjWaAQz
 R+goIduxPrEPjOBdYqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010012

On Sun, Nov 01, 2026 at 02:00:47AM +0000, Jonathan Cameron wrote:
> On Wed, 28 Oct 2026 15:09:47 +0100
> Loic Poulain <loic.poulain@oss.qualcomm.com> wrote:
> 
> Hi Loic,
> 
> > A recent fix in ADC5 Gen3 driver allocates a dedicated auxiliary-device
> > ID through an IDA to ensure that ADC_TM auxiliary devices receive unique
> > names on the auxiliary bus.
> When talking about another patch I'd refer to it by name and ideally
> also add a Link tag to the lore.kernel.org for it to the tags block.
> I think you mean:
> 
> iio: adc: qcom-spmi-adc5-gen3: Allocate unique ADC_TM aux device IDs
> Link: https://lore.kernel.org/all/20261008031154.3440632-1-shengchao.guo@oss.qualcomm.com/
> 
> > 
> > However, each ADC instance is already assigned a unique IIO device ID.
> > Reuse that existing identifier when registering the ADC_TM auxiliary
> > device instead of maintaining a separate IDA solely for auxiliary device
> > naming.
> > 
> > This removes the custom ID allocation and release handling while
> > preserving unique auxiliary device names across multiple ADC instances.
> 
> > 
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> 
> 
> The fix hasn't gone upstream yet (assuming it is the patch I think
> it is!).  Would it be better to just squash this onto that patch
> and avoid having to care about a version of the intermediate code?
> 
> +CC Shawn. 

Thanks for looping me, Jonathan!

I agree with you on the squashing. I just sent you the squashed version
(with Loic being author) [1], so that you can just replace the one in
your queue.

Shawn

[1] https://lore.kernel.org/all/20261101030902.1387122-1-shengchao.guo@oss.qualcomm.com/
