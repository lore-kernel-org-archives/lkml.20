Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6004746B4
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983844; cv=none; b=XphpiMnlP3y3a3w25COWAaH7tn0Y4kAT4ihix97RilwcHJ/rzmlkDeh+WY9IbG0g/oif9a6673ceLgPc8fIamk73U9I2lpgrsune31UmvmthtDIpx1hsj/9jsEDJSPq/5Bmq1j2HW3yH7rF3mNnEnopjPigkuCQi908mVhmqtYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983844; c=relaxed/simple;
	bh=RJIg6DVyFl/JbgK4vyZA949yfWm7M6w93iBPf750RVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pNNRbencnnZbA0+P8FAv3BF+GRaQ60CHRZHxneDdxknlrDnsM/aNftCwd9ASZqkgMacosU68Jberrt94S0b4CMwhVArAeggXqTyTKiHlHFiT2wVpBBdrIIcMlCrWO8PvWOK1b9VWaJ9HB+D3kHz9V6mhURohb3QWS+X/Z9XPy6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j8l4uNRM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JoAJ/ynx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j8l4uNRM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JoAJ/ynx"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EBRQLb2516002
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:30:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AWpozBC6RRpfvAz58EjgzoWVeN1iKmTtutWA3C0DjGU=; b=j8l4uNRMxMWBSJB9
	u0k86TnyMIuKD1gEV7Lj06vFiyQbzxbRF9IAA/vRUmv7VhcL2Hc0G8UrXvN3qg2O
	KJOXoyL4GOEyhX23sUwrtGbZ/Tta5mXwelAPFk3zPndSSofcAp9ipTfs/pVzyNoe
	lRNAQKKdBYK6MymPFmFsvt/WZZc2i0NQE5nl5O1oQZqlQeyM6ydqTvjElhL4MDIt
	gSiPtEBYktFbShC1ONTkOgo7DMtJyBBMBY+NXOdiKxlKbeH5O5f753Bcc//4KAo1
	SmB3ocTvfJOc6WHXkke8Zmy1yhc1s7NbzxvTIj2hV7+43ucEckp5afE4qdYOaRU4
	0ydDdQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha4709gyq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:30:54 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5e915fd8a61so86718e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 05:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791981054; x=1792585854; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AWpozBC6RRpfvAz58EjgzoWVeN1iKmTtutWA3C0DjGU=;
        b=JoAJ/ynxomw6RFuILZiO60Q8ra/3sA6qncd0Y6KAw8MUPxOWvtn3gZ05kWEO5kfsjo
         glB7x6DJ+m3ldaq/Ug1OVePv4ScqmcJcfn4GyhFu/pndPRyS0C7CkvkLJiLCCDBX8oeE
         og5aA8aCbZ4MhY+u5kMR+LyYsg2Vjp/nnSvFuw/o4wWYreBsc4WtgnjEZDAn8Sfwu8GI
         iYJuipOfI56e8GLvCVvaQACzYRBBDCzRhCbjdBDA7dXDc/D3z4WdI9QBpLG67NYFxRA8
         a0OS5xm/hQuu634WWLKyDTIgWZlyP0FfrTH03g5sMvA4c/PaAqqIPqc1YG7Th7hbmvbm
         ++Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791981054; x=1792585854;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AWpozBC6RRpfvAz58EjgzoWVeN1iKmTtutWA3C0DjGU=;
        b=Y6eobiglJGBNzOoG1fuZ+jUBMk271hRURO/i9o/6cfuwyYBtvGFxu9YiO26QWU0NwG
         H4/glCysmE6vuH151Q7YmmUACkWdnVith2gAn+Z3ZHvLSrrPjhC4YAbiT1/QFVfhx9u1
         A4F3TZfiZzMEuyIWkktsT+P0E2fM00pwrmjEh/YfaFVERS3SzmaqzmOuTNTHRQ4/2SQs
         0yK75PyORempz7q3G1lhqgO8+UwNZ2/DLN8R63Uo/KI4cTFG1msDptcCaQEoFBRosrqe
         gSyfcoN078z1g2ItIsxIul425a/6LV28BjT1dKdHpIq9xQp5WjzAIoIPB6BSc+SM6GsS
         wwBg==
X-Forwarded-Encrypted: i=1; AKwUvBx1SfNjd3zuc+qXG98YOgOmIcdZpQWR86oG8tCdoM7xpw26BgataEHvtRfOCAcCEo9iitGICF3d1ew/PCU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdFkt66Xi42j5WUfhnDLhk7TnIcNBzpM3AMapu9zfmjE10yZ0H
	Rs7Q55HG+yT8xecLUyIZ6s8tRNwDNEOKJIK1aXSaMOhzC/x3UHaphQ3xzZCvT9nZGYdP+m/iLeR
	HaPwAyTF9wCwCv44uC7LJZOuttDjr+uNpltEidhBQOmG0xo4i0JCE5kToscxrOss1+EI=
X-Gm-Gg: AYBFou0+IMHF+1HYpkC+PFy9In5TrH5Fw2jOKQSjmn4tywqrxbOw/ocV2isCa3FT0Qc
	W0n9D9jWpCpSDZEq0L+93BMfgf8aBqU6zgaHSSgwveljtSY6zCS/+U02swYyTwB0aaEbKpkiGiy
	xOK/W6MUAllPImMvHnf3svyib5wtNysuUYE47kf0G7a7poEoIbbHWsJX/PUzookoRjSKoTojar6
	q2ZJC9TAokkDNwhQh2XcKxFj09rUmOYEznN6jt/7paGbYUvHgjRUuXuJh0/ZwhjHeUOj8ODf7fK
	WOpPhhB3eexF0c6HqIVbjnwqfg5H8mMuqZvyEz3R9lIF9xJULlZdvoUMe/kNkqVEx3pJAAmlhFV
	WKZVMgVVaNbmfKhj8dJB6MA==
X-Received: by 2002:a05:6122:464f:20b0:5c9:91ba:5d7a with SMTP id 71dfb90a1353d-5e91f232dbbmr3342746e0c.1.1791981054264;
        Wed, 14 Oct 2026 05:30:54 -0700 (PDT)
X-Received: by 2002:a05:6122:464f:20b0:5c9:91ba:5d7a with SMTP id 71dfb90a1353d-5e91f232dbbmr3342717e0c.1.1791981053779;
        Wed, 14 Oct 2026 05:30:53 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a9fffbsm691074966b.49.2026.10.14.05.30.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 05:30:52 -0700 (PDT)
Message-ID: <ae03e7a3-75f1-42df-b0e6-0e64358be647@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 14:30:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: qcom-geni: restore tSCL with 32MHz I2C fast-mode
To: Birk Skyum <birk.skyum@pm.me>,
        Thorsten Leemhuis <regressions@leemhuis.info>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Sasha Levin <sashal@kernel.org>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org,
        Linux kernel regressions list <regressions@lists.linux.dev>
References: <20260929041444.9837-1-daniel@quora.org>
 <1ca16602-fb66-4706-8e86-3b35372324b9@oss.qualcomm.com>
 <CAMVG2svsfP+6cpRq=kBCZFva_r8jXSm+-pp+qC9D372S10z12g@mail.gmail.com>
 <eaa6f116-7556-4791-857d-cd50c504528d@oss.qualcomm.com>
 <20261009145800.rc-reply-0004@kernel.org>
 <b7bfbf6a-e5b5-48be-84ad-8bcd8e22c5de@leemhuis.info>
 <4acb0eee-f7ae-4817-9848-d72cf486bc06@oss.qualcomm.com>
 <e8f862fe-f86c-4522-9ef9-70fd754529af@leemhuis.info>
 <179197985641.52689.14222546983549320957@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <179197985641.52689.14222546983549320957@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0OSBTYWx0ZWRfX5ltZmnd4KjIp
 zbc3xTIR+5LnvmtH5O3oAP2yuRYDbGEsSq/8yDXx9BGAM5kQsGvDCObYRmq4lsTM/jqO0ajy+Ew
 gPUi96LR2C5L/ow6LeVuDElbgnfthGHI37TvkyexrOg+xEymUkuzghK8c8CtTMHwMYqDVxDcu7I
 4ZhxTPEDSAKKZMSh/2152zVvNVIRZsstUgZJcFzxodYkFNGhoWrVIDqMFeTI8bmPll7h6fm5fYA
 H1KXFHhcugOvkDRLmPSTfJEu2gSKXxZYZVpIXhOYN8//GrNYhWG99IbM43Yn4gJBar2/ChwLqU3
 aIVdvJqA9BJZmeMbtCZh6TYL8BCOgVBTLwiskKjvhtcvDwSkNFnSW97K3WIgFh2cENFYaeFRGTx
 IStDCv5O8Pa/sibxKmlGJMCSqezAM/i34gBeyXh8RAkLHydo+cJN7nmySJ7pkBRVTLBmQ2AD4b7
 qKnnI7QUQdPuRmn+B/g==
X-Proofpoint-GUID: m5b67or-gprsOUILmvpZxIMvmx_ltkee
X-Authority-Analysis: v=2.4 cv=P6avFSAu c=1 sm=1 tr=0 ts=6acf75fe cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=ISgNb0KN0Rerl7bivZwA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: m5b67or-gprsOUILmvpZxIMvmx_ltkee
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0OSBTYWx0ZWRfX+zuBWg7kwoKH
 ojIFYiu+80SzcojjUUaT2lzFZhxKHADrqdOPRJdONc6lzeukxYpZTunsuvi2k7wieDxTmF4Qk8T
 5mQPsrrcOSKDG06JiPt1r3Y9GBpUxpk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140049

On 10/14/26 2:11 PM, Birk Skyum wrote:
> On 10/14/26 07:08, Thorsten Leemhuis wrote:
>> That's how it is sometimes, but then it's likely best to go back to the
>> know old state by reverting the culprit -- or is that a bad idea for
>> some reason?
> 
> Hi Thorsten,
> 
> One correction first. My report was from 7.2.9, and I had not booted
> mainline when I sent it. I have now, on the Yoga Slim 7x with v7.3-rc7
> (a distribution config, no patches), and the keyboard and touchpad are
> dead at the disk passphrase prompt.
> 
>   geni_i2c b80000.i2c: Bus proto err, noisy/unexpected start/stop
>   i2c_hid_of 1-003a: failed to fetch HID descriptor: -5
> 
> Same kernel with only i2c-qcom-geni.ko swapped, one boot each.
> 
>   v7.3-rc7                          keyboard dead
>   v7.3-rc7, cb97bf3d4f91 reverted   keyboard works
>   v7.3-rc7 with Daniel's patch      keyboard works
> 
> The touchpad binds whenever the keyboard does. The I2C serial engine
> clocks read 32 MHz on plain rc7 and with Daniel's patch, and 19.2 MHz
> with the revert. In all three boots the touchscreen and the three PS8830
> retimers on the other four buses work, and only b80000 fails.

Since the discussion still hasn't settled, please go ahead with a
last-minute revert for 7.3 so that we don't get an utterly broken
release.

Konrad
