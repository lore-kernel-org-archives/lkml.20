Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C621A4D37A5
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672173; cv=none; b=aArR8Q//vw13IVLaw0DGxrWtzTMLYaYuUzFVc6PSlryn/mgPgzFXxkobTFiQ56RzdZS3kO0ifiVyw5p/3cxyRE92SaGs7ZMde4qZf9WJnV9uPBfNypdOQF6H1SWv8B0V7r8lOkFirbgWBdC4HjmbOzTOtA1PXEyeu9J1pfsdQi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672173; c=relaxed/simple;
	bh=a8wiJIcWAz7bAuZ823TVWC/Pof1QI66UnorjExep2Us=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pXiQjJ/YqjLWssTcI/U1LbSRe0C02GCqmOa00dB+9XVQymOxGnaPagGgYGxYWrKCMv69DX3/C57ELnzER3gP5IXq/N6pwiakhylsPlUF1ZWABwzqKKhLFDVzs5wBUqqUzL7l17cQa/2xBl5A5YYNQVA3Bg+m7MRYvHtu7rEoL+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AKaf808a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KIXZxiaB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AKaf808a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KIXZxiaB"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7Tr16141552
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:56:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gXW2IphKbo7GplWl05xgNhXN2gy6tyX9f57ENEuNe2k=; b=AKaf808aV6bj7PYH
	qnzKe7dbmfabfeS+wGEmMF9ew3p99NcDFokzIbz1HqGEhA6uiDrNE3tO+qh+MCtm
	rPl5iun4t9lVW87QNKeYEbj5ZD7kZCSz71DVcNIypokeo1EtE2fJrkLL3cCe1gqI
	IdgGYwH9qy2bXffcCFSFWdohVXZTHHpaK5Desl8a+0EIIAz4QwFmdv+RfqrAkKOc
	TfyhE0pUKcEm/byvFTaFRQ0g/WjnkqHeui6xhGT46pV18pHqUKzRR1GV/E9qIF4/
	3Al1rKzCi0NuwjL4QLFDe7I8aR1Dz6z42tm5mj+RFzYxLOSNIZzKwXtged33q4Vd
	X697NA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h08e0ggrv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:56:10 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39de4a68f7cso3319444a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 01:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790672170; x=1791276970; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gXW2IphKbo7GplWl05xgNhXN2gy6tyX9f57ENEuNe2k=;
        b=KIXZxiaBQPeRgfIeDJBQLDgt94Op7GQ0pce78xFuaqbW6qGAHuC6mGuaM7U9OcTKHr
         xWjNoHkoMczj1zs6xtjkmw1T9DBY7RsjMbCJZN+vzvgjJKoYXM2r4ATq9nzu/os2Z5zw
         87tBcNgBFaGZkWaBJ+pkkME6rzg1oO/BoFyxzBbkqDl21AXySiUiQIVQ/IolP3+Suxmo
         SJIQvdw1Zf1m+AL6ItTPmFgWrFmk9jpKL6InUKBcSB0M4jhm2Afq04qnR8TVJ4CA2CRa
         F4j2KEIMxSy6tWm/alxqCFP0iJtLJ3cVwKv1laIpHmkraA58ydp+0zXO5SsuS5oKFnXl
         2c8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790672170; x=1791276970;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gXW2IphKbo7GplWl05xgNhXN2gy6tyX9f57ENEuNe2k=;
        b=ihQh4Pbpbv4BFeXZn8VlxdzGkUMidT4OOpVUPQyhgn267qSsbjK3lHQi7l/Mc3r0/X
         AEUGVuMOrsGKR7G6i4L4fDmJOjhF6s0m3G+75G3sZ4bvFxnLzDgpW70PQUI6XtDRmswa
         h6smd/Wk/LO3VNkasbFma7QYZYCxEp78zCztbAELjkdRIneSTHnlxyh9Yct/PiUqFS65
         GrS492iQwTu8lNKbSPORER4WKt1jxUXC3cdzV8Wa8Pw+H1Q/0UefP8EQ5NgormxTrfAn
         ine/GCXFqu+VKVG1FzRqt9Zyd9Wqo9MfAtnJK1ZUDS2rJzUoFm8jl91xuv0LOaUPOSxF
         NOBA==
X-Gm-Message-State: AFq9FYIRJz9VzMBrJCloqiuqfWJBEhfcPvPsqXcJbG+L1EAiif0wW7Rn
	ieYMeBsWrM4gkSitu014uiY77/UXBuUrFQnLpa4gW9e6SGTNeBYnYrdpI8Y5/mtvZAaNi/H/q5w
	OQNuQVf2vyAslwFJ+OnKy+Ss6Bb75NAdqPplXupOlrrHe8VV9DzBarXARPS5k+RcCBPw=
X-Gm-Gg: AYBFou3SJU86/iNqj0u3v1skaOjrrSwvkkwPWkQ2yYsgXCsDMisZayj0PNLhvEQYc4G
	WhFuQgbJ/vy2uydmiIzZke6h9saW+txERlIu4Upm6ywDhyTeUH+oKttUqRMuCvZBzteFrZw6mWm
	yxy7yp2Ge7kGizVei7jruC0oMFJy0+9yYS7pU19ZOlUg2qFW2l8Z1YEFjCfK5ZtyF9X6fkqP07M
	trQDNog6hd5Cfsv9beohXwZ7fa2K5eWQPA4mnfl6X81WGUuGugFcrhZ2idHVlaCx6ls+/5wO5WS
	KJd0DOVMlT2eMmelipTRxjO3169OdZyGIssuBKXnZUm+Vy02CUI9G7+87wswj6tm0iHypGsq6gW
	E61WouKxOaPcPlaagteIDNYzpyiZba70G8YbPSLzUNzqCbBt4EDzsI5icqGgIR06OeTL1qLJWDM
	bm1Fkre5wI/I/gfoWVIA==
X-Received: by 2002:a17:90b:35c4:b0:3a2:aebf:9211 with SMTP id 98e67ed59e1d1-3a2aebf93a6mr3668356a91.15.1790672169811;
        Tue, 29 Sep 2026 01:56:09 -0700 (PDT)
X-Received: by 2002:a17:90b:35c4:b0:3a2:aebf:9211 with SMTP id 98e67ed59e1d1-3a2aebf93a6mr3668343a91.15.1790672169304;
        Tue, 29 Sep 2026 01:56:09 -0700 (PDT)
Received: from [10.79.116.160] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a497604d60sm4347201a91.0.2026.09.29.01.56.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 01:56:08 -0700 (PDT)
Message-ID: <3b97d843-c4ba-4384-afab-51067b1b8414@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 14:26:03 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/19] arm64: Implement parallel CPU onlining with PSCI
 v0.2+
To: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Borislav Petkov <bp@alien8.de>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Jinjie Ruan <ruanjinjie@huawei.com>,
        Mark Rutland <mark.rutland@arm.com>,
        David Woodhouse <dwmw@amazon.co.uk>,
        Peter Zijlstra <peterz@infradead.org>, Marc Zyngier <maz@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260907164024.17164-1-will@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzNSBTYWx0ZWRfX7edKrqoqaZw+
 czizZXGin1dC3HVtNIBbiCP/G1vPVceV4AjdUe3EhWSyCr14HcxZa4nGl2xtWUJFb7hqJNLrIMZ
 V151XQKnvhcpxXGd1S9jZ0J6rCFu0ug=
X-Proofpoint-ORIG-GUID: wZf5iqJjm1_fNQW3Hl8OD_GRtksGUm6P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzNSBTYWx0ZWRfX33+2VvGFSRad
 2C9IVDIZrT4iYTPJSNoLhHagXCQiSOowLUzeefmPcmcnGntgZE/hXwzlS7S/9FJuA98NP/XfI3s
 QuwRZMx/qSivgE9uOPhdGVL4BNp0cwOYQsEyTrgTIHJM/N+uTin4Ot5NKnhSc0c160/kC43prnp
 tucv+sJeD3WaG3kH0WcXMM8GOIDfUndC9uTzt4nELPS5ahR0MHtjFQu99C9TTAyV7HzbQTyzb3K
 qcob1nuNLHy1qaRSgfVxUJPfTt0dGyDDspW9zDWJXC66tKZWBMYWkSGzcTHpy39wvtpR4Kv+6e5
 /sw+8vvLOx0RiuhFKzrBUomtkbfg1w0niU+d7ymcH78f4mPbP6WlRLKEhGh9GOr8Wrh1YMYoLhy
 5JimRTd2qBy2ZR/mo7OIK+0/wDhPWm8NhBRgIYeisat/xLh0bHspN8YhmJR0o/PZyVTTTgkUoye
 NMcGUCKZF87SCI3O5mQ==
X-Authority-Analysis: v=2.4 cv=WJ7qzXsR c=1 sm=1 tr=0 ts=6abb7d2a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=vnREMb7VAAAA:8 a=EUspDBNiAAAA:8 a=HVqqhRQ12WVzVhQ49iwA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: wZf5iqJjm1_fNQW3Hl8OD_GRtksGUm6P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 adultscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290035

On 9/7/2026 10:10 PM, Will Deacon wrote:
> Hi folks,
> 
> This series implements CONFIG_HOTPLUG_PARALLEL for arm64 by utilising
> the argument to CPU_ON introduced in PSCI v0.2. This supersedes the
> previous series from Jinjie [1], and I'm grateful to him for his support
> getting this alternative version in shape for posting.
> 
> I previously spoke at KVM forum about this work last year:
> 
>   https://www.youtube.com/watch?v=Q6kOshnnQuE
> 
> There are three major benefits realised by these changes:
> 
> 1. We ditch our home-brew secondary CPU synchronisation in favour of
>    constructs in the core code.
> 
> 2. They offer a performance advantage on some platforms, where getting a
>    CPU into the kernel can take time. I'm hoping Jinjie can provide
>    numbers in this case.
> 

Tested on Glymur-CRD - 18 core qcom,oryon-2-2 CPU, saw ~6% improvement
in smp bringup and ~12% improvement in cpu hotplug kselftest

Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> 3. When used inside a confidential guest, they provide protection
>    against a malicious VMM that puts secondary CPUs into the guest
>    kernel after the onlining operation has timed out.
> 
> The first four patches are small changes to the generic code to make it
> a little more "Arm-shaped" but the rest of the series is largely
> confined to the arm64 architecture and PSCI driver code.[...]
