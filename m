Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64919470852
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421389; cv=none; b=BTtaFSqJWTArcAMdvJup4Y3bzkr/9ib7lnGEKx13yKliyAu8nAGAgGCK+wm4uJRZyIC+HWhzihJIhOkL6C1tZzGkmzRWMZx84gZwR/kwVmhyCljWhJPKY/GgZcD4sCuAmqZdoTqvsyUOmwKVNDaeylOAHg4uD+Xyqk0EVb0zyko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421389; c=relaxed/simple;
	bh=+GAH88BEs7qm1uxKmCt5sqiNxC6fTV5X/ULDPMR+7kA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O562kD9QADLV+U0TvEUtds3aooPkRCRAJJs8hZgtHv8xlmk3g7PXXpKW4SwfLRXrLMpQevPi8AOL5Dbn2mXHZzRGAntQdGwBOcM2jbSriSnMdgYWI1OW83PL/ujAq7UNsxTRAMqddy26zqr+C2iTswyj17Tj/WOisNoLzq3A0Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c6cdbxuj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Iq+Dj/Ww; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c6cdbxuj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Iq+Dj/Ww"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0aGd2081550
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:49:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5Ep23zikX9zOjtrHbiPT8GoS
	ROPPec2bJyAV/PUp9eo=; b=c6cdbxujjpe6oL35xeCwG/aSWiCenA7WxK7b6rFm
	wQVfB9E1mGFkd6FzjQLvHW0aTVculCKYVeEXVsdqoiIgYaDGgThpK3W6h5dGHuTt
	5cK+kdguJrob7SVYmVJHrb50b+oVC53kFu3QSsFPbkVzAxyisKtOjVNU5DTTCjTC
	l5wwQYAr1UckCtJ27bR6RFuPDPxFtKy+7b9YivJULiqVX6ZPU83CVz+EifXSpxDI
	YIvRyTvtecb7LGKb+LKDzlEIhPLKKRigfUUUyCBEIfkTVbGCqYVoQzXhUo8uqtTe
	U4ZxVeCxzfrHo9zz4XRnLFZKWrRuIQ+yh6kh0uJXl+rMeA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf4rhq23-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:49:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caf7856ffso581479785a.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421386; x=1793026186; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5Ep23zikX9zOjtrHbiPT8GoSROPPec2bJyAV/PUp9eo=;
        b=Iq+Dj/WwosxA7wZIW8UGDydYLRexBODVi6G5PNa9L6VNhDNoNUO1LSkNp/+pKvk8m/
         3rSTXj889OmS5R9T24xQugPR7qbhc8meOW2OubCRx95nA/lfEwQh2NkFNFJCJ3xkafmQ
         nl2eY0v0BdmDirENRjiHNaCnhm9sbWzCoTy3T04rbeJIeYbRz9qOOr7+xlQu1pN7JKDa
         oD47hRbJBcB1S9GsfNsQSFi/xpXDzw9cR9BaXg/0Kor4uWbVwVjACvjDpcIB8pGQy1TJ
         6foUKND87FoTHezy8KvWKFtTLY8d7RaU/LGsGGtnwFhH/YlY1+7rE6wspdoMQoDn6e2Y
         jAqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421386; x=1793026186;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Ep23zikX9zOjtrHbiPT8GoSROPPec2bJyAV/PUp9eo=;
        b=io7X4O9EAFCsETUSGXxRrkaQiBlP+CObFq6GMHrETLHKFBrqjdHX/rwwovId81oi9q
         tFxKmTgFMQdXUZursB2iNDGYixRJTHExn7mw68wXYMP4OeHESB2MgSiXUhYRTUvCi8MS
         SzGZbvaGSusHazenXjnFsDrdkhsOUJrQ/RuEsFRi/ZU/INfXI8hRLN/pX1znqBvwqZyd
         qswBG/Sm130vmjAoKEG8D8VkStd1p4dako+NQfOx78S9QOzFCqFE6U7M+0SvEKbLDWHr
         lZuzdgoQgSOEQi7M4ApEoYkdDNVphS5J3tTTGPCMHQaz9sFaRLH/KJL9wneKFyliX4LC
         zJ5Q==
X-Forwarded-Encrypted: i=1; AKwUvBx5v73oE1lAk9YYRkAM2v2puFvbU5k19gP9sjwY2/lQo/kXpyANPenxFtpt3lZnjcSDSoWBoOG25x2xzDE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKeeWYDjjKWdXCRtnEcHbx1M1K6QcjH0zLxYlfySvMuSsH4nxpV
	7I8Yqns+8qMNQh7ymBwAZbiIkbI6ylBhgiqO6ODbe48QZ4NhP1zk3Hnj+w84Da7xbUN4mry4HnT
	M+aUfoU8+92f/roeI5lMzSb7K9Qd04IDGZulA/pK57XsaKunKVuZS+qcxaGVK1nqJIsE=
X-Gm-Gg: AYBFou0dd7GXrgtWaaMzcZTT/lJVEQ+WaKqO4UTvOWe5/hWtAENdeUg6NSq6nEmk56a
	Glw4bplAtt3D332Bp8EG/PHTyRTlo1UPUl66lLxr9d1i+zVrnerkvpX4sNlZuSSSQG/blOhMHIz
	TU2+IrYo1GJY3+tC3eIwwpv4fBh4u23UjAG9Rb4dRk+tYZfOnB5LCXYMM9wp/4ZCQQT6PRx0zWV
	ryvVH1NuUCUvItVJ/XpvgiBglRnRd04GHJAqtqANXzyCSZzqcN1VSzTgZXd54PYFoU36YsIPRxq
	lfEXxsdvAe8kN1Eh4pgeNLKnm6HONRkFUps+zRGWHbp2km+qT9AnUmR007BZuyuJVJ7/HRW+m5m
	yAJx3Fa8qoAS7kEGpNKS1wI9Jxd57q3mHGGWToAy7H0XeGesX5FtGP4Hm6UKRUadJF6rUZZ3dNe
	uNQ6iRZhhP/F5F
X-Received: by 2002:a05:620a:d8e:b0:93c:6f0e:8468 with SMTP id af79cd13be357-93f29ceee4amr1368541285a.43.1792421385509;
        Mon, 19 Oct 2026 07:49:45 -0700 (PDT)
X-Received: by 2002:a05:620a:d8e:b0:93c:6f0e:8468 with SMTP id af79cd13be357-93f29ceee4amr1368534585a.43.1792421384904;
        Mon, 19 Oct 2026 07:49:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a6380f6sm1978836e87.63.2026.10.19.07.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:49:43 -0700 (PDT)
Date: Mon, 19 Oct 2026 17:49:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>, Bryan O'Donoghue <bod@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] clk: qcom: camcc-sm8250: use icc-clk for camera
 NoC AXI clock
Message-ID: <g56qnvvcuvih7pm2lhkppvpbj6squhwyi6sfvahw4zvuqitrkj@mewzkeerabm7>
References: <20261016170701.1504338-1-atanas.filipov@oss.qualcomm.com>
 <20261016170701.1504338-3-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016170701.1504338-3-atanas.filipov@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 5TsbkW-EyoB_kc4r04TkNtR9qM3x393L
X-Proofpoint-GUID: 5TsbkW-EyoB_kc4r04TkNtR9qM3x393L
X-Authority-Analysis: v=2.4 cv=H7NOUOYi c=1 sm=1 tr=0 ts=6ad62e0a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=zF8lwYezSTq--4imPpAA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX6HWB+TeWta4d
 UvnHWOyTJLzuKkwK8umgqDUcuAvZQMavJJUXEOxCahKnzCFrAd5VKGzIVrmOxGdx99XogPOkSG1
 cMEh+Z6R7dFE6OE2a9j0WlLfOLYgRbO7D1zzpCgVGZOJb0pcP+PSV4Ks9fM6OKtcXL0kJgYDJZC
 ONs684W31XYck2jf6HvA3KlAGA4iBMw47Q4TMKEFsqSNvCur8kvIE2zkyb6oZCWDLrYE4XeJXOf
 VrdM1u6xm8g5iKwJcToKXBiWLoabCAf8g/ocyIoe0qrBPviI7mEcdrUQPL1I8JZZibahGcxyyAc
 +ksikyx1YNPiYAY3JxY2mtFlGWYKGTb9Cch0KIUXnoBOlN855RqHsOCSyIr88X1jMZX5ZKbocaa
 vRyVznab/c3ysRsgiMOyCJgQMNmViDcze+KH6cNntf8MEASPN0to4mu087xktfMFNfDEAXVN7bF
 XMJ63Gj2Y1HKCWQshFQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfXyUkDR9Wjmcfo
 1EYf6/jA/ryxLUlha3r+Bm8hhw0bvX5prWO87Ba+O3P5GNTA4gBb7Np4jq+k9ktGuTJ1pucgJPl
 BVYILOanp0tnu3u6KZxyZBcE9lTbAEo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190059

On Fri, Oct 16, 2026 at 08:07:00PM +0300, Atanas Filipov wrote:
> CAM_CC_CAMNOC_AXI_CLK is shared by several camera blocks. Setting its
> rate directly from each consumer means the last writer wins.
> 
> Register the clock as an icc-clk path through the common icc_hws
> support, as gcc-ipq9574 does. The interconnect core aggregates all
> requests and the clock runs at the highest requested rate.
> 
> Use the RCG rather than the branch: icc-clk enables the clock at
> registration, when TITAN_TOP_GDSC is still off. Consumers enable the
> branch themselves.
> 
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/camcc-sm8250.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

This is a nice approach. Several quesitons: if there are multiple
clients, should the clock track the max of the rates a sum of the rates?
Also, this clock needs a certain level on a rail. Are you going to add
the opp table to the clock controller or to the devices which use the
ICC?

-- 
With best wishes
Dmitry
