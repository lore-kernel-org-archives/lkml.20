Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D51313540
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792126119; cv=none; b=FuYfdZMZuqC7QPLzxJUJsA159Eq1rpxLHayO7WSoRudPZtkgnyLPB8skNHazcPGQ023xqWs8dHaPR/Z85zDlFoo20a/xpUprMHsfnkvbK7usousjOWcznMeSYcDRT1Q+8rEpJeo7D7/e1I8DMDC/n6S/QteVdRNRfmaYcW6W/vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792126119; c=relaxed/simple;
	bh=e1jV3GGo8gSwoQ1QbA4dsd+gyLiiRLrCsYghYhZnAfg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tbnJVgvKHb20lgvjHGL01QzfQ4h+CLh9st6TSwXHG7WJ1YEzFcl/sl7Q80nkpbsSb+SWCkR0HX760I5Avb1QnVB5gdGY3pv2VpfIgH3QH6tnXFQAw0MZ72rH+a3XXh81XjK5EiNG+QSmVSDwLgj9djQekcQJPyZLSEk8H9rPBf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b+pEHTlH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YtXpgYyN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b+pEHTlH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YtXpgYyN"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G4VUq93462806
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:48:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c6UBLvC/f9cs4JzfuqkJfj4zh7qigCnSMG6XkIEFpCo=; b=b+pEHTlHXfflXc7h
	ERbuImc1LHNL2V+ZVzQGEcYz9sR7YNxg2DjX7iWLzAU8vZb1xVxO03UciVwPDFLC
	ee2q2HR0pD33XqBfsh2mcu1FfWyS3jWfVKPvAR2PNVidvukP5DYgmUARdTBMY3Cl
	P4U0uZU9SwyKs5NfcAYs9OeHBYrTfXFCttVURtekG0nMuzVK1hZee8wNHCI6CWNr
	y8d2Ls3zO+YtN3xV9nxa55s7QX1OXfzTFxZ1tsDNqTqZMgBSLCKApqtJzb2mTxcr
	ueIbPZquvm5YyNr3f2V3JXCXGYbL3cQDX7QFR/aOVRKVaB8XUU2/Wqu+s5cnzwRp
	+57kLA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hayu6b6eb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:48:36 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so4228945c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792126116; x=1792730916; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c6UBLvC/f9cs4JzfuqkJfj4zh7qigCnSMG6XkIEFpCo=;
        b=YtXpgYyN0y16uIUCV5eLL5BeBhpC1ULyt86AQ4NlZZ3rqshwpMp0BekjCo7knIjFnF
         Wc0BRYiiKe7mfoN8UFDFkCN3kfASUYpoKnuLdFCm+TdUwEsD+QGqPpBrlR3N4K5bEJji
         y5IhFV/d9N/fGamtvmBnO/bn9sE+BPw1wLXST912bADA3XGPWbIO0s8zllCAVh1lnWAq
         2y9rreyNnY9Fe3B/WtHN98Ru0AvD6cH79yyI6pob5fT+ZQqVdgVClh9shJuGFkcz4tI0
         rdZi2602FxMj7CYFy4/JC8mTrF+mysq6wfBffaBu8yV9t6E6yIIbzC41/Fb7SgzoYOpy
         74Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792126116; x=1792730916;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c6UBLvC/f9cs4JzfuqkJfj4zh7qigCnSMG6XkIEFpCo=;
        b=nMdAKiwGwfJSGUHGhZjIxagZoMAWCyJYXEhcRP//e9IX4wjF53+xR5Cu8ciWKXRZ22
         icqisIOYK+JWBn7W6GF+Ke2QuoOPAKH/ghIO1kxy92IdRRqIcJy7x2QQbk/Ucam9Y1BE
         tDBgjTcfUrlqLPkxlL2SQfpvfGo9/1Nbl4E+mpMQyJFIbLMvECKUKAxPPIQz25fwRlej
         26WeTTbtZSoioPqhK3KCViyoRlaOAjOvg9+KniNFwPSSvkqIJGuQ0XB/sw3seceWU1+L
         JTEeh/XIJgwvU6o3Ci/Y8AU3e9XbgDLbLynV1ybZsGtspvQ1DJVYCw1dFnpNIm33cDvj
         elhQ==
X-Forwarded-Encrypted: i=1; AKwUvBylwcDvuBZNZxC6HCzJoR71bPCwY1CDSmWilDaKAyPeVsRwbVKWEU/RyzIbo2EsdBSBWMT7kGU5pRtvZH0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdLXCuAIBIWsg4jQwE9efy0tga0EDM2E2b5nSEtNq8pPw7AYff
	Z2w+z1QWYZxEhcjkUpFSdcAnGcDvxVhjNWuBtV4WKUTUuoQ8r83ECRktltpIhFrIlSWub3gMQO+
	lutH1BsBQJgHM3Mj2YnIDtElgkN0h+fx3hQOLR1nmzS4Ie9KGwC4WVouqVe+Z51pTAyM=
X-Gm-Gg: AYBFou1rCN1DLn+NgYDi/sjf2HQVIdU9Tju2y6YrgzINKPr6VA1BkzjaFUFnHK2h/v8
	GtuthME/McAfcCzfx+AXje2QP0WsZi/3G+HnjSfSWy2J18w/TyNtzlSFukSTA3ZXvkJsfqwGBbK
	ya1oqhFGnT9/tiEZw2OM526sdSCkxsBck54pWUmhe1CPQV4MFCBfIiedVZ+9kWUEHwvFRlhxCsj
	Gcz3GUlcpOooG/Lml9yfmKEx9LSG6oqa9/sk/oimKF0GPt/lixRfAlPXZ8tSHQf5AZABf17NfeN
	EhkVoalOaXDGGxOzq8Gde4sJc9TmVd9m4GJtnVc4Yq5bQOxTgq5ijoA8UAJLPbgqBnE1jJQ7uz+
	N+txbOxjmF+EWdmvXvEg0HUNStgin
X-Received: by 2002:a05:7022:b057:10b0:160:a80f:3ed2 with SMTP id a92af1059eb24-16a5dbfecb9mr28022736c88.10.1792126115760;
        Thu, 15 Oct 2026 21:48:35 -0700 (PDT)
X-Received: by 2002:a05:7022:b057:10b0:160:a80f:3ed2 with SMTP id a92af1059eb24-16a5dbfecb9mr28022713c88.10.1792126115172;
        Thu, 15 Oct 2026 21:48:35 -0700 (PDT)
Received: from [10.219.56.188] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b859142sm2213699c88.18.2026.10.15.21.48.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 21:48:34 -0700 (PDT)
Message-ID: <3c859faf-345a-4ef6-bb61-ff726e4b5d66@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 10:18:29 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] arm64: dts: qcom: glymur: Make the ADSP remote
 heap no-map
To: Jianping Li <jianping.li@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com
References: <20261015071511.977-1-jianping.li@oss.qualcomm.com>
 <20261015071511.977-3-jianping.li@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20261015071511.977-3-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: swA-31UW766XzTMOuSLGWzdxfvsXLnQb
X-Authority-Analysis: v=2.4 cv=ff04WEQF c=1 sm=1 tr=0 ts=6ad1aca4 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=WxrJ1OjRqBU2I1o4brwA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: swA-31UW766XzTMOuSLGWzdxfvsXLnQb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxOCBTYWx0ZWRfX1ig+G5bTUOvL
 0O4A4tQ1yCiaNWx/pecODi5JJDfw5MTK2Q6j0jhX6sUoDIZpbFsv00WkM4Idxk2zobiUxIzJcw7
 qVWkNrMSBifCP/+yIZ7BltQ10NMMcBzRitOiWqpAofQxbrY0r/5j5qBZ4v2lpYowIg+LNAVVXxQ
 DizGaoWttBtggFByuxa5kHvdBsAlcr0tApsvhsMFYUbwTwriBkh0ylLOfXVqpYrikJTbyLz13Gc
 YD3uVIcX1g+5nDDmaj0lGHVe05jagA8tJpOhHsWj3F1n3vPo6IIuGwNnrxVolr/CC0WspKMfEaB
 u17CYGEXUTnRe5wRuzjCWtZTBVhN0Xj3nLT8vIzZU+3xxUNAWWe7Um4rHnewE40FMQKqL4Q5vU2
 Mc9Tz3uZ6c+PTbCfn0adTeWaTQ0lsvsWuiLrvkKpI5H3lydQQ6FSBBdVJMeR5mPjBB5GEKNomPd
 hMuObmfm55E7+3F5i/w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxOCBTYWx0ZWRfXwWpAt/q68r+R
 356aJb2eER7QBhQfiq7s3WtQQ/jO3850/T0B5Hob9OLgSjo2N4aBj6SOZC2r+tjL3jwAonBG4YS
 HW/AnUo/UkMcydaOvrU0LZ7aXwZjMRg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0
 phishscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160018

On 15-10-2026 12:45, Jianping Li wrote:
> The ADSP remote heap is declared as a reusable shared DMA pool.
> Allowing the kernel to reuse this region is incompatible with handing
> the entire region over to the DSP, as HLOS allocations may then access
> memory for which HLOS no longer has access permissions.
> 
> The same configuration has caused synchronous external aborts on
> other platforms when the kernel accesses pages within the ADSP remote
> heap.
> 
> Replace reusable with no-map to keep the region reserved for the DSP
> and exclude it from the kernel's standard memory mapping.
> 
> Fixes: 67641246eabd0 ("arm64: dts: qcom: glymur: Add memory-region for audio PD")
> Link: https://lore.kernel.org/all/20260701-glymur-audio-
> v1-1-2c3862d95a09@oss.qualcomm.com/
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

