Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1057B346E6D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422489; cv=none; b=YV+3XywimNBMiB2AtPipO6aVSaeGpDTqekBkt3JfpUHhzxRLX5q6ZzcHRq18YG0AK7yfiaRElivAI9aBHaEPfdd9/kuC0/GZc7f6PmHFp7MA/6nUlRh2HZvgpFQC2seB34EUqHOO8/E27m4/gpCA67bbKQc/D6GD/shEYwI//gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422489; c=relaxed/simple;
	bh=6MRqnVTlxXGBzhgaGNkyW1sNAZ4bxwtiZcZhRiQo8Ko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D/oNmadqkvoZxMGxYaJkmy28aALO5jgGn1wWzYZEGOS9pXV+sXAo4I6Gyw5Gm2Jo8Ee6i8Ic45ykYpjwhlJ7epBngKVyM5qGRSOBnJrczp6KK/GRGsPhY/UGCrODeTSgLOqtTMkfXC+23ozqIBxlSKZcrM8wddp213mTuYuVrq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EH2KB9XU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AT55MxGo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EH2KB9XU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AT55MxGo"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lwte4024082
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 08:01:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dmM7iBOQ1i95ug6zS/ezSi0RAiN0WC9qiHtcQPdMu6U=; b=EH2KB9XUXauUdDd6
	1c/kq/v+kzwIG4Up54zwXz3Pl3REZfAhKegVSni9D1vTSrcbfDPp7ToitnY9WcRe
	uM3LEQ5Qx/Dj1FI5LoAL3ak15oa3+E1kX1Tt1co5bcSeg21D1YI6IBur8033Ctcy
	gTimGjm4N9VQYRy+a0TMdFdc+m+mTt4eE6uzc9i8jj0aVFz4eXJuGOb1wj74idCJ
	4s5IblQHZW/1D5VCtk/xEwMS8/Q74kcEJVNuyW93tUyga7ox52sqVkMnboSpqUBs
	tmbdHIBF8PuzpdHOLycwD9azE5OrdIw8asH3/nx7lkkaZkFlLnDtnbuwQ0CGZORl
	DLmq5g==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemjhc403-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:01:26 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-784f9401a7dso96953137.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 01:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788422486; x=1789027286; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dmM7iBOQ1i95ug6zS/ezSi0RAiN0WC9qiHtcQPdMu6U=;
        b=AT55MxGoWGB7T9b9vc5CVN/BgKHFpmMtTTQsotH+2JYjPbcFqsd4xvQ4dlYHPEV1KE
         dF15Tgt0bEy8DF5U5p2vYPIV9VrVGMjU/eT7uzSm5BQMSAIGBgAYJvdQZnbKhsau169B
         GzK5Zkh3/4Zbg4iCVmse8MOZLmQzd3xXQuPRch88Eyl0XSGi2lnKfc45i7o832Xxs3KB
         n2T8iRWvovkoL/RGbfd2+KOBLUA5RrxVUd4l6uKoo7v1VOB9UHO20DEvL4BjD3IDd1Wj
         vGxQmJKKOrtAv2kiZt+faUrUEepfiFnYhvwGmi0jlJZqSzNUN8U9vIMCBdEj/Z1SzVwd
         bHpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422486; x=1789027286;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dmM7iBOQ1i95ug6zS/ezSi0RAiN0WC9qiHtcQPdMu6U=;
        b=lPQZA9dDupkYP2uNZfzUu01LIfQhVHKg3ozUKNm0Hw+/POHOyhtwjIvihw9Ij3lVbf
         bjYko1N8xmXEtRynRhfP3CDEBmoOpksT/2CYb3zeVy81A5cihW58iywXoNFgUD/Z4mlv
         wyij6Pu7JCfVMKfK4R1+5u1BAwa6QtQ6HU6LrvXVYzOKvF/ImKWOAOita6JN/tFs4HUi
         X2+n1l9NI68EMg/UHD+/xmWSdMe7oiBsG/eKiT4r4pkxWOAGCgP7+hRUnx+AKbmp/YVa
         uU5L72KmGWHpfSIx50BlqqQFgwTH1SZaf4/O9eV4lrueR/YVef6Q9y6gjWHfNk3nQ1lq
         y6XQ==
X-Forwarded-Encrypted: i=1; AKwUvByZzJajwrzLxVEyQpxMI/F0aIWEEa4M0t0pDQ0RaZNF+JuD4QlBfJQxm0jhLrbzLYK+KGIp7sSljU9SpKo=@vger.kernel.org
X-Gm-Message-State: AFuF++k6nzXbgeWOsFB7bLoN2W1YqVgJWvUTWjo8Hz1WucAWOKVLS8e8
	qDJi0SM1ASZXK0RpHIezgHxze/8lOfpYCCHYQzv9U4vzs7HocTpijNB9Lygd2BnzK3Aytjs2E1U
	iGCvl6TtlegIrQK6kbJqEAru9npiJ5BX6pq8szq4o+DbQqa4Mu3dCFTVheOl7gpV9Y44=
X-Gm-Gg: AYBFou13glDGw9PISrLTolXn0dLq2eBwx3mNkfbppzSAz2eBAZeCuJ4TAuuMfpsYdc/
	68bX6doz5OF6MyNSPHpVQ4hYPBT3xwwo7DiAOxYP0tq7Tn3BxfAg4SMP1OHVvMw3NiDtZHWE/70
	a21AHz2xxOVapba90Ae1ZerMXF5JWZY0Nq9H3q+BU2ipTl238CxuL+kAM4McnKYanJmjaW8UZRR
	Sr/lek85C4UlKQ3x5DV6xditD7dBXbWyK0kOR2qEApQTEkMnNRaqbdia20pGb9KsLP49Kamcoo0
	DoeeQXIKFCDTzYc/Sa38kzWmevi7X1hgWrYN32HSkyM9cqUJL2EIFsInjF3qw9wGaFylqbZtRxX
	zam2LXg+BbfysQEUwo4PV2g==
X-Received: by 2002:a05:6102:3a06:b0:786:d38d:f7c2 with SMTP id ada2fe7eead31-78a1f29d57amr1512217137.1.1788422486164;
        Thu, 03 Sep 2026 01:01:26 -0700 (PDT)
X-Received: by 2002:a05:6102:3a06:b0:786:d38d:f7c2 with SMTP id ada2fe7eead31-78a1f29d57amr1512127137.1.1788422480769;
        Thu, 03 Sep 2026 01:01:20 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f424528esm59563266b.59.2026.09.03.01.01.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 01:01:20 -0700 (PDT)
Message-ID: <f7eb5a26-43e8-479c-b20c-cbf53ce54940@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 10:01:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: shikra: enable ST33 TPM
To: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260903-shikra-dtpm-v5-0-e8ea3ac8a135@oss.qualcomm.com>
 <20260903-shikra-dtpm-v5-2-e8ea3ac8a135@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260903-shikra-dtpm-v5-2-e8ea3ac8a135@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: eYbeZgoHDnm7N4cwVX2rXUPV8CkKBWwI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA3MSBTYWx0ZWRfXwQy9SL30lx0j
 7YZaUYDEX1gIXNoJfebgJWj+PuLLzx7234zRl4ONa8Nk8DccPqjGHsxmhuQ5evwHRvF4SWPpO17
 cki63Ny4A5Q4vriPhjzHie7M6F/kT3ExSj4OWjmQQjmvP14QWJ2FjbVbdjBp/96KmPStF9Z0gDG
 tGGH7noVrXhf4k2sQjv+dxrREmRTJivrdMqbBNyQeDgO98R0B7LkGmPhQUHa9WVRgizg83AAWPL
 5pXXVbQqvMcsscVX9Fau2dytfWPpRd+VkbdXNN8hY3zrcXtbUr2DK/iVDXRlNDyFsSNeJl2fbDG
 UcGquT2ttMNqLz503lf1CZCb44Sh2nAFc2t9t9ozQwTlU1s+bv0s3Wv1Y3w4ss/ilftkpEbsqXJ
 nVai0YMRZ3+cvkwSD+VhbwNyrdrPX2r9pnyhNlqgmAGHp4aJHgmVqlGcRLxNZrNDxJbCN0L/AgU
 zCk1hOC/uKMVt11SRkQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA3MSBTYWx0ZWRfX4dvtGnn05m1V
 odYB9Xt+e6Pmum3v3F4NAb0ltLwmd/K58QTmtIMrDajgD6mDk5y025J6STTX1YYH7KTcC8w0LCu
 2ItlhZhsX09FKh5Ra8nQ6mWftXBjvT0=
X-Authority-Analysis: v=2.4 cv=ErHiaycA c=1 sm=1 tr=0 ts=6a992956 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=yLgYBEAqgqfNvTdY-4EA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: eYbeZgoHDnm7N4cwVX2rXUPV8CkKBWwI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030071

On 9/3/26 9:18 AM, Khalid Faisal Ansari wrote:
> Enable ST33HTPM TPM over SPI5 on the Shikra IoT EVK by adding the
> required SPI and TPM nodes.
> 
> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
