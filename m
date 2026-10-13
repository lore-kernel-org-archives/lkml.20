Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45CF3F23DB
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791901443; cv=none; b=t+/4a+nJFPMCYPkoplfCbKIE3JihoTo9O8I9yNBuKYQD2g+3OFKztbBadYC2l3ehOQT2PtPyJo0g/Z0As9nhDRCWm6CExWjouoCX3FYifHKTtlKZlbnMitYdPiEtQUont3mhggwKxkOy6wQ1HQ6g5IiGVP4JOpk1tUznBgZiBJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791901443; c=relaxed/simple;
	bh=SyE2Z25hzP8HKj4fDJ94fsBx77haZvgbrgT6zrnosF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XV4WwSzPqHiRPiZB9UWHKNjswQXH/Dtdb5DyFHw4rkRFVIDmsXgTojrj97p+HgsCKNZnAjZxI2wlHyFaDw18kOIrfEdeugaB3lsHxxTARL4E9HtnzPl7fGuifdt2LntMelm22iJvTN+SvBDN5AEh+mdt0MGFLF35vU1Bavp6mnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WbCqkCaV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VP31E+RW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WbCqkCaV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VP31E+RW"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE3TV5442751
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:24:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0nM8qXXdR5YbmFnkFs1b3gqnhsYEi9FrdxzOiNS83ok=; b=WbCqkCaVPtk9UIzR
	KDKCSMaLmcYdP1tdpf5tOpRaO0mn3OH1PnNolvBIODrRshpHOQfeyiC+HAXuuXSb
	NMa9FhyDweL/7ImGGK8oKAqobGVozeO6L87r76PpKW+7iisKT0zS206/mAvQ7DOy
	kyQZdimk5uqwwh/51UT868ZFKMrZOTn4+EN5b/SxxASJqRgF7BfceQ9oa5t9/VIo
	K6LiMfrkkofmAUwth/Rp08/e82hXilLVyHidvYkaRGkAA1aVu9T1JaO9O+qDHZ4F
	XUPdAnjZ67Sz2kIDDaDH8cdmpxJclU/KNn0vRPg4NpQRLKwZ1pGsHfr8ygRY8WOI
	bvlirw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9n71gc98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:24:00 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-917a2de2cc1so39479616d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791901440; x=1792506240; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0nM8qXXdR5YbmFnkFs1b3gqnhsYEi9FrdxzOiNS83ok=;
        b=VP31E+RWjjXDpdmtRhXqyS5lIdoqFwygLrAkqc/e+meRskF3iEk3EiCtdksVwRKL6b
         SVFt9JIzmZNR7qWljPagdJZlwaW3HlqWIXGGf5xxk8PW09+oEYBhK+Rvd+GVYkoZLywt
         VJ9KYshbdJhejyfCw/wnIUWZTRdITRVWLaxzAfWP5WAdg2ooqR12BBtxwqyVud8o1O29
         4gyb4dsGS6qaibD/MflADrcMF8VV3ey7Ics79DA1+p0EtJK8g1ogp6WJknuQ71Tvzs1S
         vRKQ3jjpOIWt0xVIs0Dmt/neiRmf026SWrLovOFWyX9tTLwnUOx8TEbOMt/8l9lUAt26
         WXhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791901440; x=1792506240;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0nM8qXXdR5YbmFnkFs1b3gqnhsYEi9FrdxzOiNS83ok=;
        b=bLYVk+mXGtFC3wUfY9UCkOOcNfHYAs/E6alrQfA8fy/k2ZPYN03UaVSqWd2THpbylL
         FC/ea6gze52gbErTtz8l9cu1TtX54QTQM/SEALRWfAxq3BdXRCDQHpnA9qUBfcrdsV2g
         N7nZVN6JaLDE9B2ADlThJSpZjsrmXLaNudDJ0Eb8icmhvxEaUCjI8+T7qnTaw+RQjO8t
         83TcCUqss6VmYTgZg9V3reEm6kg8j6EHGgb1TKozAkbSM5OUqM0SQer54ErZ6FGFgg52
         ToQ3s9ZCmxaNA80lUgWBZN1qCf7QLLp8jCk/qN7100mRjCwuI3wjrJNWoCe5/ZuD+mFq
         CE+g==
X-Forwarded-Encrypted: i=1; AKwUvByFh/fqczKWUUoxJUoLw39sfA0yJEXiaDEfgVNbhl30Pfnpb/z6R30knSlgrDFdsf33gYUe6Crz8z220Fo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLcFWvPPjytEdtOFGtx8kCXH6+4L6pS4RTjRTOoFXj25snmiiNy
	r0EVFH7my5qjWfPxbIQRukEUybbiP1Z194cEXkbT6/2UaU5R+3Y5NqALDgVNii/sH372L9eK3k4
	j80yUiYLhetE24jtqcZbO2l/3tYjLN3+rq1KZ7tIchZ0QsRS77w1V5JeLejUbBY6h9Hos8AOErK
	+1RA==
X-Gm-Gg: AYBFou2FJ7hPMxKKfB6rXU1KqeOZYoBjmgfYa60s7iVvG26db+TzCBmq8meg1C8ZuRU
	w61swbLzg+leUUVR3Gc+WL5P4sWOxttXNcOVnH5grQ6YIR+aTQw/RYcLaYTI/ICl+VxzOicmBxw
	/UU2VqwZatlLCP/s9SPU4a5twf3PDk6bQHdsrWYvlhtRBDFmxyQJybkXy0TjJrttyPbLldVg7hy
	rDQumCHfx+QTwpAyhRGPT6eGjo1OE7jQ4xWJ97F5iaGeqZs/eelSYM3lfs22vLmy+mHWU4hI2Wu
	NeoX8bPxlVpT0penIBsvNgiFkmMxxl7d3U7jAGsEyfmf27dtjVCDB36w+BCB8brQO2UuA2mwuAm
	5r0xp5hiEoaGz8+po
X-Received: by 2002:a05:620a:6081:b0:93a:1fa7:1afb with SMTP id af79cd13be357-93ebd24d180mr2046717585a.42.1791901439815;
        Tue, 13 Oct 2026 07:23:59 -0700 (PDT)
X-Received: by 2002:a05:620a:6081:b0:93a:1fa7:1afb with SMTP id af79cd13be357-93ebd24d180mr2046711485a.42.1791901438883;
        Tue, 13 Oct 2026 07:23:58 -0700 (PDT)
Received: from [192.168.10.46] ([37.167.4.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab48a7sm5417001f8f.24.2026.10.13.07.23.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 07:23:57 -0700 (PDT)
Message-ID: <5cf4bf60-00c1-4aa3-b264-aafba8af19bf@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 16:23:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/5] thermal: samsung: Add support for Google GS101 TMU
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc: jyescas@google.com, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org>
 <8142519a-0062-4f0f-b978-980e049f99c1@oss.qualcomm.com>
 <8796cfa1-5ae0-41fd-b3f2-c6b588157b12@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <8796cfa1-5ae0-41fd-b3f2-c6b588157b12@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FuqQbGrq c=1 sm=1 tr=0 ts=6ace3f00 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=Pwpi88Ktxb2v7RWwfB9ReQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=4bmiNBAiDDOXaXc57RkA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: ynRZg474ZTQkMRvU2ICGPEcPtef4lM4r
X-Proofpoint-ORIG-GUID: ynRZg474ZTQkMRvU2ICGPEcPtef4lM4r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1NyBTYWx0ZWRfX0ew5zr9c588v
 xkG7y1sM7yUBGA30kRvboTmscm7jl1/tXJ/2q+DsEISv9zo5YolxVyGsdM38bgXbiu2c+e8fDOz
 0ld44DoSGN6BQUE5hYZX7HlfzV1Htz/BvwmLkr4PQm97A8IIh8v31tpyAM/+w2gNA15g2OT8Zdn
 IvOZP8UDtHWN3FLCcIv+DU8SdpnKFZbZn3NyGTbrMNSB7ixqVEFjKKmWtuyghZ0LbKqdsu1+/pk
 pd1Zvnj35BNc246M4m1vgm5ac8g/9kyVoQ+xpgKA8lJjhQUwH8MceLvHQ1S601qHn16HMqPq0WE
 Wb6bklEq88yVECt/2tVU3/kaavoRyfgIrQy090l6clAH4+KImJfzhyszkuueCPOoXRHK2TZJva4
 MpzS6TlWgosnTAAuroLT8oj4DVX7Un+JuG+sQk+up6S3bisu25Y52Wuolp//jhppCznIzkJivyj
 fWjhdXGWM2DL2r6IQSw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1NyBTYWx0ZWRfXyD+mbJ77taB/
 lKgurBpuK03f2Q8AEZf3Gha/xxEDn5NJ4NR48RqQYLAstHUwaUHM1OFMd/ELxQQDecOEv3roQIp
 sspFeoCKUqGP+d7D/2fMl8Cf/wC8wRQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130057

On 10/13/26 16:01, Krzysztof Kozlowski wrote:
> On 13/10/2026 15:33, Daniel Lezcano wrote:
>> Hi Tudor,
>>
>> I noticed I picked up your series without notifying you
>>
>> However, I did not pay attention but picked also the dts files.
>>
>> Shall I drop them ? (AFAICS there is one comment) and let you handle
>> them separately ?
> 
> Were they reviewed? I think no, so that's another reason not to take
> DTS. Anyway, it must not go via driver subsystem, so please drop.
Yep, I agree, I'll drop them and keep the driver specific changes

Thanks
