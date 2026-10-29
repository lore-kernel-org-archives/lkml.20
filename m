Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793274334;
	b=QnBrBESVob7totLliWoXt/k6Ny90/ynYwUcOGIhqtmpBSqrXqmIIyAxYwq+bD1rmaqb/
	 76jRbOYwgMynoExcjUA/kcjmUvm5izSbCkgn3T2suhi+fOn/tDCsWj/1N8hbt7bGlWSFf
	 6u0wKgBtwFTYty5xcLYooYj29Pw/fVAF6YV30w1It5fWD5IjlpjofNWz/CcMJA4LKDV+T
	 /E1/KOvAPB3lEVLP8TnSenRkdvHLgs9eG00W5WI+h+A6meeBO2xCRMVzJKl0kAsLhJwMR
	 a0eEewTcVz65nLXm9oRJRYFP/h/fFM6AVCaWRluuihuR4BpmD+6QqNDKY3swlwbWpPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793274334;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TMWXkVvY7365bUcSbC/c1WgzijbCguJDPiJAF5/hEqY=;
	b=E0rJDzxLeJVe9TpnTKKqKZFN+cCS+f3mJgSbKjwJUlDEYFznDzd4Q79LZ1eDOa4mrtbK
	 LWRhhLwoSC9YFPMqqMJ1tAoaaHVFFRdsmDRyLsVeZt15++paDSKYBGteQhP56TS8qGtpR
	 6wAdT70CBkOtYzVa2rKRq3DfxRUTYDdXl8/96M6+ecgCMVGQ50ffjwCQlQR9+7NyLcrIt
	 aS86nJQMATsB8pDnWQMENn4ae7uhy/2u8DVsq1caGljI69liDRzcp/zYTN/piRmkOPF0Z
	 iBLuA2EnXaZdLvnm4v80RIUJapWgiOpXM8WyHri5vl3oMP5DQPwlz+JmPqAg2msmo2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EDewjzYH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fPta+DZU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17657606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:45:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17657606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EDewjzYH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fPta+DZU
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vDrg2912465
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:45:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TMWXkVvY7365bUcSbC/c1WgzijbCguJDPiJAF5/hEqY=; b=EDewjzYHcRMdlJLo
	VoGq91+Z+QOaXmM2eq6RMF1b3n+Zuc3wLUqFQZU15c8jb5G/dsFesPMWuBdWK6WR
	gc9pMK6TM/posn2sPLcSdoK13tRAraVKuczXAAAFVTTL1kgSyGZ6aHf0R/X3IEz0
	y9cZWih+vxDyalJLCyS9QisNtUjQ6eS68oWqhfkIYg0++A9dmYoQLPJsTovRoSqG
	pvLbYeKlx6eKtQ0T/mDbiGSNrB7aDz08+MRwYwXJbPQXxNzXsPXT1MUK09L9dcDM
	KV3YSjcE5YKvWb36JEATgBRakZPdvg2GeNOtVuAbYcCtEZ3bav5dLbj3ywHaVIFd
	gzKyJw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hknb2bs2k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:45:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f33438950so415761985a.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 04:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793274332; x=1793879132; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TMWXkVvY7365bUcSbC/c1WgzijbCguJDPiJAF5/hEqY=;
        b=fPta+DZUfoRqdIsHPdNqc2ByeXobXmP91o0berZN0lnGB1/OT05KuQd4SJ68osHkJA
         rBsSyJd3f6pYSNY+z3so7BB+RTEQIIdoo3Dd5kC1R87Q4uCyLkj8R7RNymfSue8KYI25
         gZxYyJwrT4dGR47n7VWvx/El0ftBndX1Kv+fJHy99fxNk+vJhFNRcfXeB3uCpZ38g+lP
         EUzCVAimf7+8Nb1gdZ0cM0BeeQnyvWj72b+b4qzIezpbRTsG6YcBE3ltP8VuFOCrj3Lf
         RpAMPnnhzMpjpnqYiDulWwjMABAXmhS6ICe8jTn8+F6VBhqsKSrVvqpgn+a1lRwpd0PR
         X/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793274332; x=1793879132;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TMWXkVvY7365bUcSbC/c1WgzijbCguJDPiJAF5/hEqY=;
        b=gmxCbo9/LTRGItE4EQ0EWdvKanT3Ax0TYzuQMOqnnT9GBa2yj79N0gqoQZkb/wSHc5
         OHWrqApgRdnaFWmKwUtM9WSqxqdvsoCzk+fZJsc1G8Bso0c9XAWXmpxR9m7ZVfP2RBO7
         FNePwUrjlG4dZJIYsMrQU18byDYYw/+yM9oGV/vDZuOBp3ssNLiEzMT9N13ZkQvF5zV6
         HJ8WoTxGUHOWpIpZsmGH8NOwuRVH7nxpPBnxiCfBg4Wl8LGiTU+9DkvzPFEyZLfTUHVs
         AgaQcaC9Zlfu8I3IdzoTCiwKNH03cei7vZAnwoFYGTTrYEgXNt+Qexr6LNr+Det2Cm6X
         rfdg==
X-Forwarded-Encrypted: i=1; AKwUvBw8bxzNtzeoUPsFXNAOgwcZb/xcls+QH8UYaGDeGWcT9lQuoZNeSyt7jU8DFiAp1M2mUvdC7vC7O5Uu1QU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYtZUvzIks9S8OgAvXZsTzk+NOeTPEjPF1I8G/afqG1mPhJYVT
	Dg60GBdWqKAEqz+xACE8C/nOqdUD5CUdME7V58JDNd2LXS07P0Ur596KqLD1yTCIUOQL2qzXrVs
	i8pzDWWI3NmSd3Y3HPo78pIG2i/uAgElHEYe+/YU75ThA+C1hWvZ/5fY2E3xYDKGWhU4=
X-Gm-Gg: AYBFou3aEWoPIff/NqcB2eFe+smc7d/y93jhaUgdY4UHx4XmMkp0ws2aUd1lRsJkIoy
	tAn9tthx/XXKp8Sq/cT8ndY9h5780vvLp8yJIwOsGFlZU9Z9Kb0lwJgNjDJMSM/PcJ27p+MArWW
	EHUM0lWopn3IFGEy6CMT35AQAL1WoFda7ohLELmBSf1xU31P7buMUexSUuXDzRSMblHkBmzh6a1
	JLTcbZo8KH3lDF37kmF5at5g3kj/+BE+ZPKUwugYkpp1m55pbd5RxB8LxS+hX1psfAyppuftih6
	WE381Byakia4Xk6a12vTCU3U7yotEy4mOUXqvEuBnAgfXNuQiVSNOCyLNhFDKrw2QDgnifeuZ+B
	bUpr95BCQT4UhdC3vSIuw5AEVLreeIuTO89nF1PjPEu5nx8sKTsq+ETgQ2LOk637Cjh6b4d76p3
	ud5KwOABojpK69
X-Received: by 2002:a05:620a:1a0a:b0:93c:a191:88fe with SMTP id af79cd13be357-94408984e70mr723490185a.8.1793274331970;
        Thu, 29 Oct 2026 04:45:31 -0700 (PDT)
X-Received: by 2002:a05:620a:1a0a:b0:93c:a191:88fe with SMTP id af79cd13be357-94408984e70mr723485485a.8.1793274331265;
        Thu, 29 Oct 2026 04:45:31 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a92de010bcsm102028895e9.0.2026.10.29.04.45.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 04:45:30 -0700 (PDT)
Message-ID: <cbc783dc-cc2d-420d-8e80-3a39744218ce@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 13:45:28 +0200
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
Subject: Re: [PATCH v4 0/6] media: qcom: camss: share VFE clock sources by the
 highest rate
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261028132403.3505037-1-atanas.filipov@oss.qualcomm.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261028132403.3505037-1-atanas.filipov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Yu2a1IYX c=1 sm=1 tr=0 ts=6ae331dd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=sgnbebFuhaldx4-h5P8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: -v_8bIcBdIQO5dgRG-oCAbjWpqC5JF_p
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA0NSBTYWx0ZWRfXz/gApaBECOnZ
 bQzO/N+rDVqyDQcWgLBKZU7mN+KcXLjb+5Oru1VaF3jlYYw7U8TXLv0PrGkvWYig1xxEJk9Ohuz
 hQo8VM1okhRby1B9ICGZ5hVygWa2iY4=
X-Proofpoint-GUID: -v_8bIcBdIQO5dgRG-oCAbjWpqC5JF_p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA0NSBTYWx0ZWRfX/IuIPi3wsEHR
 ShKJDnjB13qi5b1lKu7p5PAaxSPBbdEgWHfgswkj8GohBiYs5Gors72XJzlPQ4ReWQc1w4r5cNa
 YFz4CHGgplxnSlQ5oMApmIc0W8dNm8qwdBprRId2oToGC0JXee3OkaQZFbjkA/9I08hB2jJtyj6
 sa1AvT8/J/ENOi2U9kRoGhLFVUo2gbTAY9fNZ7sA90qS0PC7aDSeRFOkZT3zPd4Okx7lI8eDOJM
 zcLhLvkHS+rx/Yd8ZHBiEOHDl2/5ajEoipLgE25DH2doMs2uRwQdVj6az8xJZ/6ud0ImCGjJJrD
 9oI1zkwo6nnKbQPJNBjfnssS2g49DhjBe/Z2qZPVzXfssQTWaR0+HOREiWUyk01GSEMK9iYgw3a
 6qCgLvVqxayS8YpU4sqZJemdcb/wsMVlGRf5axizRDGQVlnVoiz8Xk4qp8wWPSsP21P+6OjQSIS
 EufDvVMz+R2LrXI/9Vg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290045

Hi Atanas,

The whole series were verified on RB8 board (SA8775P).

Tested-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

~Gjorgji

On 10/28/2026 3:23 PM, Atanas Filipov wrote:
> On SM8250 several VFE clocks are fed by one clock source: the AREG
> clocks of the two full VFEs share the fast AHB source, the two VFE Lite
> share one core clock, and all four VFEs share the camera NoC AXI clock.
> Each VFE sets such a clock to its own rate, so the last VFE to power on
> wins and can lower the rate under a VFE that is still running. The CSID
> also sets the VFE core clocks to their lowest level when it powers on
> after the VFE, and nothing sets the camera NoC AXI rate, so the camera
> NoC runs from XO and two concurrent streams stall.
> 
> Two examples on RB5 (QRB5165):
> 
> - VFE0 streams the CSID test pattern and VFE1 then starts an imx577
>   stream. Nothing sets the camera NoC AXI rate, so the camera NoC stays
>   at XO (19.2 MHz) and one of the two streams stalls. With the series
>   the VFEs set it to 300 or 400 MHz and both streams complete.
> 
> - VFE Lite 0 streams the CSID test pattern at 480 MHz and VFE Lite 1
>   then starts an imx577 stream that needs 400 MHz. The two share one
>   core clock, so VFE Lite 1 lowers it to 400 MHz under the running VFE
>   Lite 0. With the series the clock stays at 480 MHz until VFE Lite 0
>   stops.
> 
> This series lets the VFE own its clock rates:
> 
> - Patch 1 moves the minimum rate computation out of the VFE clock
>   loops, with no functional change.
> - Patch 2 keeps failing when the pixel rate exceeds the VFE core
>   clock, and clamps the other VFE clocks to their highest listed rate,
>   as the VFE clock rate tables need not have the same number of
>   levels.
> - Patch 3 stops the CSID from setting the VFE core clock rates.
> - Patch 4 sets the VFE clock rates as minimums with
>   clk_set_rate_range(), so that a shared clock runs at the highest
>   minimum of its running VFEs. This applies to all SoCs.
> - Patch 5 lets the VFE set the AREG clock at a fixed 400 MHz.
> - Patch 6 drops the unused camera NoC AXI RCG from the VFE clocks and
>   lets the VFE set the camera NoC AXI rate.
> 
> The camera NoC AXI clock is also used by drivers outside CAMSS, and how
> to aggregate their requests with the CAMSS one is still being discussed
> on the CAMNOC interconnect series. Patch 6 only covers the CAMSS VFEs
> and fixes the concurrent stall today.
> 
> Tested on RB5 (QRB5165) with imx577 and ov9282 sensors and the CSID test
> pattern generator, on single, concurrent test pattern plus sensor, and
> concurrent dual sensor RDI captures on all four VFEs: all streams
> complete, no shared clock is lowered under a running VFE, and the
> camera NoC AXI clock runs at 300 or 400 MHz while streaming.
> 
> Also tested on the Lemans EVK (SA8775P) with imx577 and the CAMSS TPG,
> on single and concurrent test pattern plus sensor RDI captures on all
> seven IFEs: all streams complete and no shared clock is lowered under
> a running IFE.
> 
> Changes in v4:
> - Keep -EINVAL for the VFE core clock and clamp only the other VFE
>   clocks, without a warning (Bryan O'Donoghue, Loic Poulain)
> - Use clk_set_rate_range() on all SoCs and drop the vfe_clock_ranges
>   flag (Loic Poulain, Bryan O'Donoghue)
> - Add Suggested-by to patch 4 (Bryan O'Donoghue)
> - Drop Reviewed-by from patch 2 due to changes
> 
> Changes in v3:
> - Replace the CAMSS clock domains with clk_set_rate_range() and fold
>   the rate ranges into patch 4 (Bryan O'Donoghue)
> - Fix the VFE AREG clock at 400 MHz (Bryan O'Donoghue)
> - Collect Reviewed-by tags
> 
> Changes in v2:
> - Split the minimum rate computation out of the clock loops into its
>   own patch (Loic Poulain)
> - Add the Fixes tag to the CSID patch (Bryan O'Donoghue)
> - Split the clock grouping from the AREG clock change and add an
>   example to the grouping commit message (Bryan O'Donoghue)
> - Rename the per-clock entries of a clock domain from user to vote
>   (Bryan O'Donoghue)
> 
> Atanas Filipov (6):
>   media: qcom: camss: factor out the VFE minimum clock rate
>   media: qcom: camss: clamp VFE clock rates to the highest level
>   media: qcom: camss: sm8250: do not set VFE core clock rates from CSID
>   media: qcom: camss: share VFE clock sources by the highest rate
>   media: qcom: camss: sm8250: set the VFE AREG clock rate from the VFE
>   media: qcom: camss: sm8250: set the camera NoC AXI rate from the VFE
> 
>  drivers/media/platform/qcom/camss/camss-vfe.c | 182 +++++++++++-------
>  drivers/media/platform/qcom/camss/camss.c     |  44 ++---
>  2 files changed, 136 insertions(+), 90 deletions(-)
> 
> 
> base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab

