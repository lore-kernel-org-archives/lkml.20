Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793619616;
	b=bYw9KLfvGOpU2+fjJuZ6WkpF9nmZfyhxRW/WT9U2Aq6MiVG5lTF+RAFCOKYmEAgKseW3
	 zudUA8dGieSuYpCRhxobyhg1pxrJg/433iJVSExlqs+HKEgJwxZWWWEWc5+I2QlGcIDsm
	 7YefVz3elzr1e0IpiuPSZfD0ftKnqkEmtONvZYectA29oDD9VV6xiBxf/W/20lPaX0DPP
	 eTFpfHKvUMF+GM4ZSfTMOiS/yfkCTvYU7Yw2QAgrWbI3JksS6S4LDnlP0SOSHM9Zpu5Vm
	 pBBfaou/ac6HvAlVCQMyoE+ovYEM1J1cSUXIGNnW8FBn6Lmk5HZCv6l8PsqgeYXGXNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793619616;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1oVKawRBKDyLjs5yqB2d0aVUIqnYCyMBBMHbK7DDuMg=;
	b=2KyV+5OWbcoMCPYuINZsmzLL/kZo7Hd4U0RiqXf3qEGo2xL0196qLTaoRY4g9DPJhvqh
	 ktpUQ+zvxjuZxFQR+shf0DxpOj4gsBgwsqRtbxjCIBP+imFdDUpN/ogCcNeVSTUKg165w
	 Xs5OdHj8MGB0wEvNkh7/MG/NrR6RNM0ruKux1GU/IfNtWYf87QKiVmAOnPNLZlhZ60E/l
	 FkMxsRVofgBA62J3yydD63E2zIFTxQG696fZ6s3zZyIR75PeJEBwRpjHoO4uCFLJq7r/+
	 2Wb2gM932Wi/ZhBac6gTlsHXStSa5WODrIFJkdf8/QT3fAYmRdVz/mafxtQVyDREFwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pouJluLE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bb0aHqh7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC4D606A334
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:40:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DC4D606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pouJluLE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bb0aHqh7
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AMhY1821130
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 11:40:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1oVKawRBKDyLjs5yqB2d0aVUIqnYCyMBBMHbK7DDuMg=; b=pouJluLEhA5IF64z
	V38Wr3FyvWkYW+tYnSbZGssmg3Qhy4mikfe8baepwwGnShZsNe3fBACYOFH0uoB6
	1T+qW1prcu5YG9NCLLfQ+87meKc397kNT0uxbPLPnaNHX27dlKQeYoj249btCK1Z
	6H82ixLQxxyjxxn0f8lTsTpFvB8mH9Ce76/3UmeXE+MW8yIKvm4sWKcsx3OS4ZF0
	afZp5CmkYwANCdfMSc/vvOvNI8K+tkbvfjPLj1jsX6J6BJ3YbDp4rrI4i1tBTkFF
	AXBTSNH188M2F2R+pJ/01vWj6T3FrSqOPiyd9R75tF0yrN5V6+XRx2g81A6FmiAI
	+TBmkA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4hfp3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:40:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-536540909e5so8497631cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793619613; x=1794224413; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1oVKawRBKDyLjs5yqB2d0aVUIqnYCyMBBMHbK7DDuMg=;
        b=Bb0aHqh7mu/Th4FHSUfZcMUb9BR5w6fDRlSz3fqcDX3O9YQWT/UEPjhDkLZH+DnliK
         2seoovD4VbZ6mxPnu5Rfkzi4JOuQjweZq37FVx8ACxUOWHtCxg10a0jkpv1zg+gU4xq6
         DjVm9Z3kD75yLrw8d5722BX3oIDbiWE3BXVKIoGIlMXsG/arDMGvVwu1CQorHLT2Ovmm
         50MQt6LPeRCDoRv4920iD/8h9EVx+DBV77kua2nvHvgqB/TBLcrC20NiJV4v3N1qzvYl
         r7BgtSvqunV7ZTJOXTvZdG47AI+I52QOazDK7zsInWQ08nOnlhIXYgEHRVchyXkcgc1R
         Z/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793619613; x=1794224413;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1oVKawRBKDyLjs5yqB2d0aVUIqnYCyMBBMHbK7DDuMg=;
        b=qFwAoYYYYaJRHexXuVa3cEH8IzrrK9+4AIWcpZd5jU+BMkDhP/mz4IhCgpvplxR0ZW
         jjOh2XJYdpfgEwJqATDaTlaqTelhWVU4oWFzPwboOlvyBbu+scplbwAYyk1A0KMqVUWB
         bGlcMw47iMbSLehxBGhfbiIv/+oj5kWidn+wWJQdT/CSNzxtZ4Tr+mpdD5EOPep0/dHo
         fYC6CrjVqqktxqFwl8jHnr9LgwJs3Bj4ZpVccMe3Lq1QcpWUj/Y58+v0wImKzOHjtw/W
         z4eDG/WX+8tgQ4eVt/1ZYdyUCsW5BS4EyZEAazZivyYttycxrYaw1GyLsUmM7K4SiFW/
         LyPQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJb3ZVE/eGo+s1bpZ9W5QUEqs6S0TYMBAb6acUeMxjymxATKTe8fIa1j1SbjGXzQktAcghGlLhJo8n/BA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCv7jDrFVlZjtkviTvBxq6MZYiEJWxjqqhUWlWSzdwgrl43/kC
	NEdQ+Jq4nwcPv4TmNoMR49ZL6x79CEiWguawiQCQR815pBEVjLutU2EgHsnWwZ4x3If3uQp46f8
	IvZYzioVpHOMSzV+5KpGrzzsmLEXqyEsOheK5WLOBmYyehc4VvlPDAxibD1eZJnMvtgU=
X-Gm-Gg: AYBFou2ifpasr2azKFCteJnaXuuPHYtJSjvx0pChMMqzJel55jMl+58bOkmYDRDMR2m
	wH9fBHGaRuPAyDoMM9VbJj2xq3LLYWCaWqLly0LRERQo7VyIrnLnPtdmVLH/DTcEIDEe7n22rIP
	Q+aThnniMhTV0+NIa+I+3nX700OaqQQI+6gLkrLqyZQNNmsWWLzKfSXHFOEkHvVWBcJCzj7vdKP
	JfGN7HGBiL95eANktgozpsQMVEmN834LlIcb4NVUOA+mdE08Iaur6uj/jyPWGz+nnNtfmietlCz
	bCAffRxZKK4nu9740C2J048IBYrv2hfI//fo37BEbpKXu+AtkFHxVftJU1clna6MLYO6XKR4V8M
	wDJCJ77XIh/AEmhXXaOAJERnXxn9B8743gXEwd2NSzUUzb8E6g1m1XHgXa5/JgxChPQ73x/g=
X-Received: by 2002:a05:620a:6357:b0:93e:6d87:4f69 with SMTP id af79cd13be357-94421666fadmr1792075785a.3.1793619613374;
        Mon, 02 Nov 2026 03:40:13 -0800 (PST)
X-Received: by 2002:a05:620a:6357:b0:93e:6d87:4f69 with SMTP id af79cd13be357-94421666fadmr1792071985a.3.1793619612874;
        Mon, 02 Nov 2026 03:40:12 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe93db0sm367342266b.66.2026.11.02.03.40.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:40:11 -0800 (PST)
Message-ID: <8c1571be-65aa-45c5-b244-d59e1b4729a0@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:40:08 +0100
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
Subject: Re: [PATCH v2 4/8] drm/msm/adreno: Simplify adreno_probe()
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akisaira <akisaira@outlook.com>,
        Vladyslav Tymoshchuk <tvlad744@gmail.com>,
        Val Packett <val@packett.cool>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20261030-gmu-sync-state-fix-v2-0-89d3082d97af@oss.qualcomm.com>
 <20261030-gmu-sync-state-fix-v2-4-89d3082d97af@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-gmu-sync-state-fix-v2-4-89d3082d97af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: b5HK_ABn_4yv1IX2dcPT1IQcDIH4fqfT
X-Proofpoint-GUID: b5HK_ABn_4yv1IX2dcPT1IQcDIH4fqfT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NiBTYWx0ZWRfX0oS+njEe6YD8
 7zfEerzvHlgD08qxs5eCD0/MuAoGDv+ll0mY2h4/FZKkXaOMHbY8VwROxRryN0s5oI+zBzskVWT
 Pyq0SY+eenOH3gVdUfkbWNqgv4SM8xI=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae8769e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=siqUYBh-qFVWGbOa984A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NiBTYWx0ZWRfX476RZSFmj+du
 m4UCGv2TaSk5IzigrUFoEOTWmCiVYRNw2NSCmlCa7KeDMB206OVZzYzipUYEWK8p9Q6dxgHWipN
 NaTtQFVad3PGrF+T/V0LX9/F0/WeCvvyQQczHAK7tfbGVKm+SeOrkR9fJoFYQ02XCWMEQ9DIcvX
 Q21FgdmPFVk+mFzmtSD0xPvdLhyt8dlJBc/TSB2PymPWoNyjMTUL/yagfTXNrymlnUFB0jQ3VKu
 HJ/CV7vwblSqaCxDuj1kAgFgwBoO81Yfb/BSjLNa7UwuWqs30v+5rMmJPMzHJdLa3+rQTK7Vxjr
 0JfJYVekhpmEk+H4XFzsqnuQrb4Zmj1AKugiAh5SpykbN7a3+44u6iG1EuuBU/C/5PXVUEy93Gf
 1Qn3Kh4BvY9Oxg4U6+CPNM9oWN9bOfrfi3kXLz1LZYeoNvOUAw/5oiYQLsGKSIey/pAmj43Nwve
 lyZ2bqZ9Ptfdc9IJ3XA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020046

On 10/30/26 6:09 PM, Akhil P Oommen wrote:
> Now that it is possible to auto detect and create separate drm device
> for a "GPU + no display" case, drop the special check for "amd,imageon"
> compatible string in adreno_probe().
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

The remove path alteration should be included in this patch too,
otherwise we get an intermittent regression

Konrad
