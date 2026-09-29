Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337125172FB
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790683073; cv=none; b=EekyqsKtgg48a4iIf1maftXn0kpiRvCaYzkjGY5D6WdBYVnIbqyDbX4cpauZbP50ONGeQt1aaTC2PZxxU2b6FfR1D/HdQpGeKau5yKkCgMc/hH3ztvJq9shzMJ7PSHiwMxEnVJhI0OwqUFhJum2qbHjBKGqomkUSLOXyFICEIwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790683073; c=relaxed/simple;
	bh=MrVJPBb1sUYMnP+KdD5Y+ht9eqbfNm/5DTILPlsF/gI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IPS/YLOwkqzBkb6xjpsz/TIemfpiuczRqMYWW3YJt2Zpzh/SOC9jfN/15D6gzsiIMsnbr2a9XpaKIRfh8jz8jX5JLXp676kVxW/nnUFacUCeHefbcwZyToThgtxSBtd3ZyLqiJJ5oBCl9juoNfQMdgj1uslWgk1IjNuOfv/IcKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Znbg7g3n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TrK2z9JO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Znbg7g3n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TrK2z9JO"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TAjIgZ4118908
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:57:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BkEatPLSlTdDIMBrwhI5bGneYqgoKQbP4DiVJOzUsCs=; b=Znbg7g3ntcCSA0Fo
	2CddJWLLBn0d9mUHVduyhfisTlHLzaobq+3Em2Y5ldLVMDbaBvJwbYfx05UP3iWF
	PmHIsfrC+6yFuhsi6xdvQryYu6CFC3hqctBjOk78296UA9bINfL8luqt6oAsguO1
	RIZaqhIOAh2nj8A71L37mLuWIHOUWRNoCibW8qVGj51Cj7LEXkyhUnfV06d3qLEe
	v5Es3afZWjmeiVMy3W4eGRAYIhUHesDe003nRevbEhlAMFOeJO9Zt93A7uShphSb
	BN6rRo1skD+RUahmdkqP6nKMC5jiGMf9jp11ACWCRHTV4m99Pc9gO60Aw2W3NDum
	1UEh2w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0144tsqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:57:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93c6a0d2122so515659185a.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790683069; x=1791287869; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BkEatPLSlTdDIMBrwhI5bGneYqgoKQbP4DiVJOzUsCs=;
        b=TrK2z9JObfwTGusP5gFWb1MlioDiPjdGsngt2LQrnjdxB419gOHENSIjwVAgdtHESv
         XTUe523mFuS+p4ntBD20C0YGLvy/39sLvTjw4sQpFMowljp0u4fVIV7W7oRJqD2WNDKM
         g48GJn1LfRdwTZeAG4pBdhyZvTaVWUZXJrYuky7m17CwuIdNV6ujXrvb0DW4Hh8+2Vpl
         1y0iKXb2Kc4fkjBC+mkbYoDk7ApMFMT90oqW3yg5MZKWx76qpBJw1iqwe+xWVx8izWpv
         0O5ICkZhtfmUB00xkGul4E0lgO1lr60gn66JP3ulzVFQ/DqoKtb/y7a5QN59+ehwDr0Q
         vy7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790683069; x=1791287869;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BkEatPLSlTdDIMBrwhI5bGneYqgoKQbP4DiVJOzUsCs=;
        b=V51CtcCjRZu7K3z2spN0z1p/NG76kyQnkxcgaFiE5rmoBy7+JpBEZ5kPeXDCEJ/ZAR
         apzvP5CVtdvmf6c0Qple1C2PMGopK1VjhdIAq7leoBaDs6bYEgv6Xrd1YJc0sgYAFhU9
         kvY/35+h2YfqGEO8f/9w9IikJFoX0keTKYXFesCH7Vs/NcV5QWmQD+jSup8skTCS07f6
         k8CAkPV5ElnHvqmZyDuaFuS0OXjqW2wbW4XPy86+O/5ZUBDxoAkoImJCo9gw0o73FK1X
         tJUrDsCEtUXn8vuua3ZwXd2fnZc6tteYdN4zr1Io4QHwM0EHW5OIW+3mQdigqGNAWX3q
         5cmg==
X-Forwarded-Encrypted: i=1; AKwUvByN4QBQmNqbtfTaQCJfkFUvViWrC3nD+xbPKPDxeob2yjh2fVvXfwAacxTEgSsww+BP0Yy6UshZVBFettE=@vger.kernel.org
X-Gm-Message-State: AFuF++mhPgPMhwAyu7zr4uXI+aqZja9UYe1YNbc1GsWo0Xsp4h7hiXhv
	Rabd8hkRxxBYoBLcJeGKnDEFbNVoWBhnA6+1ZC+gWAZq+lMwrDaNWsVN9G+++fpqMUUVnVBbav7
	KAthhTWPvYl4+VCHc0WBYhibEAbi/q/xlhJ9oRDyrzCXar6ibVD1E5kKOcwJdiYC8KbM=
X-Gm-Gg: AYBFou31frSVlDt9UNnL8whkt2D/Yv985PI6FKFIt4uzSM6EY+n6FnudrMhtE1zpGjR
	bT2slBUc8AUXyJ34cEJfJwT78sLOjZcpEedQcf4gb085F7/etJ943o4achiK6AsxLggwy3bDAdf
	KvJnbyu+uT2lCCfJ9Qc+D0s8gokILxByYD6+MLWHDS/qo80qFok0a9iiDSStSFnsy4cZVw3I34I
	5AbFIYWddGbdCl2elqxSMN/UNUjRRVEEUq7DwSCx9AJrGDVOCLm8Ts3eNmqfrGgA+PbG6taU8Mc
	8MY7fDOFCRRdd8mC28KWBS2264XwlOcivcKmyb26vdMtiMww9BjhYqVqvi+AF4EK/QeSv49f8zl
	0Scr8ntxHjiF5m+sPhA==
X-Received: by 2002:a05:620a:439a:b0:93c:35b6:5663 with SMTP id af79cd13be357-93c43ca3f93mr2495214285a.35.1790683068661;
        Tue, 29 Sep 2026 04:57:48 -0700 (PDT)
X-Received: by 2002:a05:620a:439a:b0:93c:35b6:5663 with SMTP id af79cd13be357-93c43ca3f93mr2495211885a.35.1790683068225;
        Tue, 29 Sep 2026 04:57:48 -0700 (PDT)
Received: from [192.168.10.46] ([37.167.55.78])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf8fa5bsm84529785e9.6.2026.09.29.04.57.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 04:57:47 -0700 (PDT)
Message-ID: <ef9d2842-1e98-4f40-8aa1-307f63f62b5b@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 13:57:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] thermal: rzg3e: Propagate reset assertion failure
 from suspend
To: Pengpeng Hou <pengpeng@iscas.ac.cn>,
        John Madieu <john.madieu.xa@bp.renesas.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260828092123.9707-1-pengpeng@iscas.ac.cn>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260828092123.9707-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0NyBTYWx0ZWRfXxSm8gCqiLFLN
 a1uAYGqWrQG6XrXNvf/6Qun4duzDeFn3vTNNiBWDNa8pwEN9AhEhLk5mnAHKpHn3QPxVlNqSnHP
 0RV5d4eXUjK9kXY3uyitLmZzw48w50EJOooHhMMbASLuq3BGMMUgn5CiSQ6ww+9atlgiaEdmIX8
 kLfQNbYWA5QJJvolnIznU6wS46AExt5nPy9eD1Jj1n97MclUaFB5EbOKnsQQBT8A4iQcPunxT3A
 pXbqNmJsDNNi/i0zoYeF8kdy7LYVP5yqgPzHwpPs2E36KVZgKNel0DkPOWMiddpMJYmenMye3SQ
 vqJjax4zZhilb7h9LTD80bDTEvFqMyuKk7+4sHp2KH4x0dvInvGpqUDgo5NEDVNxIrkpVLVrxL0
 J2LKkGaPKdkCDPjedhbn2swoXwpNceaSxXMH3VYUdIwmrV1+twHsqkRbJc3Uw06cK/Ji6fhkZQO
 zr6xBHL8HOyck6sJPTw==
X-Authority-Analysis: v=2.4 cv=FJSOVOos c=1 sm=1 tr=0 ts=6abba7bd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=k310VGPmG+7YCqWoYgMryA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=5Eor16UomH0ERcGZyNQA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 9gJkBehcSX7OaCbFT318ILSHt0Sj5h-K
X-Proofpoint-GUID: 9gJkBehcSX7OaCbFT318ILSHt0Sj5h-K
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0NyBTYWx0ZWRfX/MpImP4qxKM5
 nwhJF198O0FvRKHNHhgplahZBAI3ifu1Zg9q+sUuaic3S3GCWjTy8/ar4hIMyvm2/e7kAZG9SSk
 7xm3IFvNpCKVEAotwtQ6knVrOKIhGFA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290047

On 8/28/26 11:21, Pengpeng Hou wrote:
> rzg3e_thermal_suspend() powers off an active sensor and then ignores
> failure to assert its reset.  System sleep can therefore continue
> without the clean reset state expected by resume.
> 
> Return the reset error and, when the sensor had been active, try to
> restore power before failing suspend.  This remains an RFC because a
> reset assertion failure can represent partial hardware state and the
> preferred recovery policy needs platform confirmation.
> 
> The issue was identified via static analysis and manually reviewed.
> 
> Assisted-by: LLM
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---

Please resend without the RFC prefix and with Claudiu tag
Thanks

