Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794668845;
	b=JAUg+Gru/T9geJ/PBsoEo7oQ3OzhjwPtosLO0Pu8x1r71YL22gKRXsjLObpGVcNOmyZd
	 m0IggiCPc9kqwc2iZsUjN7JhgFvx2y5u4Csqnz/PzF0bn6vWh2ghLrh5zTC34g9DoUu9A
	 einGQK6X3P5C9s6VNvl+/aM906Huvqlq2jV5klb+20jhcUROCalJjnstPA6fyCrHeQjPd
	 xw4HGP1i9MUPqJLerJEpRe0yJaqOSAa66uSc33m5k8ZLWFu6B7U/8W2GYu/gFKuY3afJr
	 hoz0QDvb+BEi7vljB0AAQo+guCEJJkPaUxQq0xOs9lL1plQo/nNY6aNo0l5DiUx592g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794668845;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qOrC9Gal9RVwYSi5qGrxcqYTbHgtm36z+0K2fpmAefE=;
	b=B0ZlII3IWukr48BHGwTGTl/2cCoAUe3/MzPIAlwtJznspJAIyRPlYQGCRy63sZJO5F8/
	 zeKjkKtq7dQZg43EG3yq79TTEskq3DpOdBu7T57OzMnrKiE8WQmHKVBSvfyv8GGFhwC9M
	 eCvPEwAIYvlVBcbrTx6LKB0hibxKFR0uDsINr1QIpiFz0g3W24YNDDMYLT5drDJA6aRJH
	 zJIo3faoEADWwvJOcBNfWR9VCnKeIubs7yTQjkKYIyaDuC9zR+TaNHju+du039ZpPHhVW
	 vB5x829k/YqutNP9PN4gvrFMS6wmyj6qlGd05+cst5ROOG7uTPE6rqIKCCcgOIGUCLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M2XjFc5n;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IzbdRnOr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9ACA606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:07:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9ACA606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M2XjFc5n;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IzbdRnOr
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEDkLlU3174145
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qOrC9Gal9RVwYSi5qGrxcqYT
	bHgtm36z+0K2fpmAefE=; b=M2XjFc5norZGnS5LN1iIIlGtcwXdC4gfRvAtqu+i
	dKzv/FHjijAjDU4oJ1aU/mt6w8jec+VF+TG9uEwmVdK7mXms84d5/y3nEYIiGR/m
	1yBCd7undewnAWbrk400iPYU/5U78xWDH+loqVYKKrazslvik8MBcxMFKvbbEBww
	X7Bh5+JsRrQ+YfTH2PNDRKk5dYnL8PLxFq/pzOO1JVLmwMp6bLbdRmUvhAt4iYFo
	E0K2Wn1+sA2K//mqVTvtO0e6amQtzAQY9Fmb50fpBTEgAxg0kj7BHD5AvBEos/lj
	mCsaUhAWpWEiv0y3p1flEN7VjidHWblQvHAwQrihkdtRcQ==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmhh1cd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:07:23 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-67be4f2f42eso3556719d50.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 07:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794668843; x=1795273643; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qOrC9Gal9RVwYSi5qGrxcqYTbHgtm36z+0K2fpmAefE=;
        b=IzbdRnOrTai9mwPXWry/+9JOOI7fufPjG2tRsefhLKZxBCgmBXN6Q5HgFAR/MLUg40
         qswJzL+ihH9ZgRrg5GrgUelmERQ49VUadZnIX1Edj2kYVVsUnFKAvjsZQjWt4ujs5cV5
         2UMPokrH3t/CgfuwrqT61dXsIxNsM2IjARJnJn+Q2ELok9HuyA2iqYGA5WzkMEdZexYd
         uWd9ZAx/kgGt1pV+fX5ViZVnyi2GKPiB9E0QOEIYik5K2A8ljC/kE0O94z/L3f18HOKU
         /Z5FsPO3fO7Yut/dBejiQ+MDWVE1b+S+R7AXjHB0agru5SCE5SQ8d7C/Jm85QvYnELfH
         WRfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794668843; x=1795273643;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qOrC9Gal9RVwYSi5qGrxcqYTbHgtm36z+0K2fpmAefE=;
        b=WxV+rTRJQoAiu3Y+ZCDD5zja4TWDOKPUAE9+Q4Xr7aaDhEsz0rqy253CxKW9m15uV6
         Oue7x3PwLfYPSHBsimDxyLyYm77OG0kM8DZ3BQTOQbMPcKA4i7UdEcHP9xmZSKOi9iKY
         ypgfJXbsxp6/Q6AysUWSQFHdLRwYCYIoyxX+gWAwWFs244cysYJ7gj5VV6kf0Z8uHYx6
         F0yhapRpqOC1phih3a5SN17Q30+2gaeL8JOn7aScNJ2VDhYySLQ2/3zou3lgAgiNj6rS
         3gn3X0S5WKrlmTHprOAlePSN27i/Lr/kk3foVRmlanU1BhUs+I0KRW10UPDdRhQRYknJ
         iCWw==
X-Forwarded-Encrypted: i=1; AL+hErG1MyfG96fc7cWuix0Bx2ItICKJnXfXCvXZ5kxqkM0Sagp+GMkmn8x34va4NarsO0akw3nfEwglHngbuGU=@vger.kernel.org
X-Gm-Message-State: APuU4Z82ls4BD7h9NF9eW+KQ0qlCsWDBGCZyreRSRZSSRGi4yFP9tTfX
	pJVUY+O2+q0ASYqStJfzUyzI34YJQV19QaUiPgy2bTfIGxUTPEDGxSVhgQvFetc5RhUy1xmQJRU
	WSPQ/SJykJI2jt6XsUaouMkgEnlo6P5d752OYOHfe0UpWd0NG5wtxlIlBh+tefghQVIk=
X-Gm-Gg: AYBFou0rjLIDI0xxOdQNGDYAScU6f10RvdCisxtF2v7YdZ39geQbhQbDyhBfEAo6eWp
	q/g7mmfo/7/8ryry3XQvi1W2qApzopSwwbxIxdrFJ5/VKXsrHhRNaT6MSmbc9YFHy78SAAi0f69
	gVSqyoQlJlO9NF0Yyv8z8DEYgSDyaZDoijf26kbMWgMO2loewxWlH7ZfwB/WVrD+hLGFQ6vkTv6
	Tn5mTBRrHuDydEkLR65gUJ6WRic4bAKhbdMpztJoTu7PWLnvpjl0U87+GTlVyqpXfRw2dT54DPl
	l5bXzy9pvfLyIv34p8gLoo6RXuA44b3Y/D18lBYLm3tNDrsm07Mk8FLIs2/7VM+IcoryA4p6yrp
	c6OslFuuI+u9nGrImtNBNaKIxvohjyvGnoMuOnLLaMdUVN6qzyvgL4OUMcvPqMbu6
X-Received: by 2002:a05:620a:3188:b0:93e:f9ba:6902 with SMTP id af79cd13be357-9494ba5f9bdmr950501585a.9.1794668414847;
        Sat, 14 Nov 2026 07:00:14 -0800 (PST)
X-Received: by 2002:a05:620a:3188:b0:93e:f9ba:6902 with SMTP id af79cd13be357-9494ba5f9bdmr950489985a.9.1794668414018;
        Sat, 14 Nov 2026 07:00:14 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e293540sm238605295e9.8.2026.11.14.07.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 07:00:13 -0800 (PST)
Date: Sat, 14 Nov 2026 17:00:12 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] firmware: qcom: Allow QSEECOM on ASUS Ascent QN10
Message-ID: <is4zc3hirwt4huslzeciykg3qrzl4yp3rvr64i3wd5r6ivopx5@hk6nmoqiismg>
References: <20261113-qn10-v1-0-e09b2aa7ccbe@oss.qualcomm.com>
 <20261113-qn10-v1-3-e09b2aa7ccbe@oss.qualcomm.com>
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
In-Reply-To: <20261113-qn10-v1-3-e09b2aa7ccbe@oss.qualcomm.com>
X-Proofpoint-GUID: _gCPtTjv12E-B2ncsjqnRBkoij1dYfHA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA2MCBTYWx0ZWRfX4b9b9MGHZxMB
 2/oZd6EJbf1XzvCw0i/ZtXYyflWATZEYlYxtJQS9z7CCZJi6IY1PsHJj+kYWHblT5uYW7vtZzij
 FQLQHZTQX0nujX5o5QigWlwnfy/mJJs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA2MCBTYWx0ZWRfX93DsyX3Nt7MP
 j0udTWl/3V0pht+AeR6mr6St6I/hz4sFHalKoKDCRJZIage5mNuuukKlTGrOdSCh2vmytceYlHm
 o2B4DpjrO3or4OROR4UVUCT7PuTZuib1DfvE75b0MYm73WhjSVJ6ndRVYjDGOVF04vZmGfjUtkL
 3OOWov8Bo6aB01VkIDn1QjkIz8AfjfrklIAAZl5mI4oX4lGfvPTJ8Ql09g3iwLCp261aM0qBPUK
 /WgFTtkNn9LwM0d530DV7fbQihKknsv3CMCDamKXyCdLx2+thzUkwQ7CtLcClzRW3MzQGK3Eq2q
 zVw9F7aBufEJ0aBFzF+DQOE9Ewv/6PgT25d/ED1jyp1wps4wzu1Tkl+8rZLIFAi4HHrLnJR11bB
 wZ2pxzpA7qMP9gHCkOGZDPlfx1VR4/SzwD5rh4dkecyCXkgpe5+KWr7kyTAQd+RsCuGo7FXW0Xp
 /tRzQFWpm5WFBmE4LVw==
X-Authority-Analysis: v=2.4 cv=e/2T2qp/ c=1 sm=1 tr=0 ts=6af8792c cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=eaVRD4h8osDMoe4b1p8A:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-ORIG-GUID: _gCPtTjv12E-B2ncsjqnRBkoij1dYfHA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140060

On 26-11-13 22:28:27, Bjorn Andersson wrote:
> The ASUS Ascent QN10 provides functional uefisecapp over qseecom for EFI
> variable access. Add the board to the allowlist.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
