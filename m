Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792584780;
	b=FkcHIdXP/DRoKoTf8LCOcbHGdiPtH0VVnBerye/UVgfhLLghEuvvDIU7690CESORDC1V
	 S1b8BBMmQidVODOaBuJZe3BStxzVdySchAsuDVhHCrZpA5Opn2XWQwQhfWCoV0SArXQWc
	 hG7XA5MinHBuu8ywzMz/ZH3NgzYQpWIfLVN+kUQnnxKFPZMPlQui9u03p8ps2gPrlkFQx
	 f++Dji/NqOACfbhpKQLJRicz3xT67kZWZpIVZCtiwPuCPqKKZYeWjDWluiTCccAXCtyjO
	 6losX/eDIDjJxbp5notN/Gqgcv/N6eiyEmy094YzyKMQG5cPvTDWbr7CLsQL+32S9Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792584780;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aXcvh625bjwiF0YJvjLteYVFkzEmw/+Lbr5Sgxf40Ag=;
	b=mE+sRZxspjRWK2N7YI6gLzdWxLHzxcloc4Mp1dsrzKNEUHJhCW4EkOvalFbFhtToCJVt
	 m8E1RYpfE3gZ3jOPnotv3/Ab3o/ruE1L3XqSy59wJHmI4FQagtTi5BqGWdPGZzB7JaVFH
	 uFogE4VZl9vaP7ZfT0SRyBDLHfM36UhKA3nYGdKnE8OR+mXuVkKRGQ8fBC8EPMzdjJRQA
	 zfAcWq7XJ41+BHOqN03ZzJpC4bZF1FilfESiFBX7vmYlpNBtECnUM7RLV3Ldp8TEWh6tK
	 ZYuicIZhUrhH56wC5pzfUF/CPIaugPn3S1H3VkrFUD8MiDyNM+zd+ATiL2i0bNOAwOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=punrYVcr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hm6JMokM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D658606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:12:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D658606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=punrYVcr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hm6JMokM
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBgCCs1054300
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:12:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aXcvh625bjwiF0YJvjLteYVFkzEmw/+Lbr5Sgxf40Ag=; b=punrYVcrXe+hI5F+
	u73h3hYEP5tY0mkcm9+Z0emKtuJvzIxuDJeTjVSpSaN3AofayUURPQYCABs0LwqZ
	GvZjU1wXn/tAABVsInW1QCpwEoJCkh9hCgi7pKhACAVsj/S0Ppf3EFvZzWt/gUhK
	V1gX7copJ93B1cH89r9gFJFbO82qaomtkHtHKlcGc+BVweLEmFWyMyVV6mO9BWN2
	rE2g9zFeXzcjshkcA0XNqjwlDNUE56wU8A07F/Wm16Nt0AiORY5NhdPpQwb8pv0J
	1jSf4tgtFjsVKtIqUhgg3ZaJBVnVSQ+TwLpMdOpHAQaG8Lh7SMmxuNtS+7l5/hl2
	eocV2A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajkswb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:12:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cac495d99so12352485a.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792584778; x=1793189578; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aXcvh625bjwiF0YJvjLteYVFkzEmw/+Lbr5Sgxf40Ag=;
        b=hm6JMokMcqzxGTQFbBzcgzN11Dg+hCUwFDwABZq2AzbouoiC12Rb/Mh+yguETZAJvL
         x2tFahukUzv1u2P99YXVhmOtl1bde72Dc5uE9cEfwuAd+1/ehk8J/0GeBMNZ0FoCezbf
         +L0jkfNr5nhPIzCEPdBOUxkJdr7B/+5GiDriX0YYSeKSoSM+HeCmErAmh3uxXRTtINdQ
         roL5FfMk00ioBgIJoXYvqOI3pnQVG7li2l+qIF/9+n3A0TCB3ZzgdN/D7/hIxoqCNJNd
         pqYwtYlrjO3blFxHGaaBz6JtWdo90vYmJGZ+7UuGhuc0WUOgkqnCRVJMFl3kIqUzTQRV
         QDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792584778; x=1793189578;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aXcvh625bjwiF0YJvjLteYVFkzEmw/+Lbr5Sgxf40Ag=;
        b=ysjHfnmGSA2IBplO04w5zeOBnMhdnij37zPSAufk9RAXl4hnac8ino/aL0FqEWiZaq
         C3AVdDzjLfkwMMDBT9eawVun6gjcODZHRU6M/5VlsktvuBPgLNR83o9KnbqILVKYsg4G
         ziKoW9vSurSMJI+IlR+VwCAK2QZAdD3MUaKmf5fIEAyo3bN+bY4qs2YMCBeklAQHNU4k
         v0aCJl1jpQoQl+SanpX4qnfTp3fjp18RAXX7V3hlgNFP1aNx6HaoTqg7PN0quWcotb1i
         tSk+3h24S0VwsZxuIlqixypSHt6A2+QCa1ieMn7OAdmY2iv6ad5MXVMnMNcb7VX9e+Yq
         TryQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRqmOlfhncdOrPu/lW+XAmvvpPopYUvjZcJPdBkXA8mzbWFPkUJDW8Zl+RbP3xMQIJiQK8/dg+j9/tevo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJO80M5KNRDs/flo39YRS6xSyIHUVDo7CxbXE+7Lw9sRBsN+fLI
	qR+5Ooi9Pz7E5KVN5Rz6A1veqeQITqTRUzTzncx41gajC2PS+Buk/IORx9A1IzTOI+XPDct72ni
	ph8/5CpNfzQX/sWwIiJWj2PUWqDw0KdjbZVWYKMFgqXOWIr8RTgqWQIO85xhpDj/Hu0M=
X-Gm-Gg: AYBFou2Nn6FcuAj3NlgPONYNyBS7ZhOrdzB0Ne36d/E1CDEagCiXws0WEBeWJK5tjcd
	nGYodgBge8N3ouT5OWZQenEO3JB+wRe2kLp+u8XVgyVHZjnQd2/9J+MfzdwT0A60UKq3SfsObvB
	xqHe6CwmvallWZrG/M0Pl/BqH8oS0GBpkIl5geUU32rYMbMHSoFxkr0xgiNGVTy2YqS1UxoOVnt
	tu+9c1Cn9/az86FoKuRy6WXfHztDczYL/t3vdq9tb/VAUrt88jGSNm7E/Gx7YrAUvukAuGLLX8w
	9NJcjLOfcbHL6vbS5ALnrsfOpxYkHQQoGAPdrKeSLITFM7kCZr3oQJRzJel0br1/fNLMbf4BXZD
	QhPrkRaDZO0kYNrQ6ea+/eQ==
X-Received: by 2002:a05:620a:800c:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f57dbbb66mr435409285a.0.1792584777652;
        Wed, 21 Oct 2026 05:12:57 -0700 (PDT)
X-Received: by 2002:a05:620a:800c:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f57dbbb66mr435406285a.0.1792584777265;
        Wed, 21 Oct 2026 05:12:57 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b402f2be12sm819079a12.2.2026.10.21.05.12.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 05:12:56 -0700 (PDT)
Message-ID: <70c9b4de-6403-46ba-a125-9e792d4f63c8@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 14:12:52 +0200
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
Subject: Re: [PATCH] drm/msm/adreno: Leave the GPU RSC awake for system
 poweroff
To: Michael Burch <me@michaelburch.net>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc: Shivam Rawat <shivrawa@qti.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20261003193518.13811-1-me@michaelburch.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261003193518.13811-1-me@michaelburch.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0OCBTYWx0ZWRfXz6JjIuHIPMGL
 FGQuXgfROja5+kUN5lSjlOAv4EOq3R0LzXJDf4WdxB7/u5HiX4XOsXqZsjj0s62LkrhbNTlbpUt
 SOtN/VqFf99HYZuzo1dQKVGb0laAMUzSndnJqyCAKtzynHTSlRoUbcPUxBX7IIcfHWwHAa2WWwA
 YbozcrPokIMzQqLzExqfh9GSiIFKFQqqjIGwBKXfa5CxxpA3MjOXzLH9EnM39qSQe6y/G+UHJV1
 ASWkQrLfxhgaokxg4lXHB/aFA1bxaXDDqfqtQHDRDxN25cRnqaSTvt5T4FT5jywyrCVe0mIKgmN
 ikrq1KhK1BEQteRABVo1vMtGGjhJ6lSRtc5yhAQkJEMin63O3vKLNep3MpvYqj8RaxUaIcAEt5l
 +DrSJdIUZGZjL2hyHwC1ptQKY1XgbETmYB5E+6++CnMjxthMf1WKiOgTJsOUZMUIcwuu0wgmn+V
 J9GFrGA6/qHc0HY4Hig==
X-Proofpoint-GUID: 9kIN92_AnpDCsUGTpW2ngE2cpqRTBvsD
X-Proofpoint-ORIG-GUID: 9kIN92_AnpDCsUGTpW2ngE2cpqRTBvsD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0OCBTYWx0ZWRfX3jBulmTKEY4t
 vQEh1omsgZgDYStOxi1rnJzePda/lXtx9ScK7Jfbos8SrHK6g2HSQLwWjo2XOd7iw9PTZAwUdSR
 7CZQ+6S1xc2gXyD0iIdIRYkBnpCSeMk=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad8ac4a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=OZ7Xlw-yAAAA:8 a=jfroN63_7_ZKNpzpi8AA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=qwMvOfr3u-Fs83Rmfh-C:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210048

On 10/3/26 9:35 PM, Michael Burch wrote:
> On X1E80100 (Dell XPS 13 9345), commit d9108bfdb746 ("drm/msm/a6xx: Fix
> stale rpmh votes after suspend") appears to turn poweroff into a reboot.
> It seems to happen when the GPU RSC/PDC is asleep at system off, i.e.
> when the GPU was idle before shutdown. Keeping the GPU awake until
> shutdown avoids it.
> 
> Resume the GPU in adreno_shutdown() and skip the RSC sleep in the final
> stop. Suspend and runtime suspend are unchanged.
> 
> Tested on X1E80100 only: poweroff and reboot on AC and battery, and
> deep suspend still drops the GPU votes.
> 
> Fixes: d9108bfdb746 ("drm/msm/a6xx: Fix stale rpmh votes after suspend")
> Signed-off-by: Michael Burch <me@michaelburch.net>
> ---

This is odd - did you test it precisely with and without this patch
and no other changes?

Konrad
