Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156D53ACA48
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723464; cv=none; b=a6AdVqRIriBBdCJwe8hhtkEZkNv8a2DLjYeeb8zpzfQP9YUZzZ22kAWYDV4ZRkudSTo8GM3zp8QlH4i+G1kV8v/NM0n0RYhq3CsbY9pDHjTtrQByC3sXBkX4ehrvdN5PVbYZyV73hHR95Vx1Zh9hbx3xBIBu851JClXjUNwZIVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723464; c=relaxed/simple;
	bh=LpQq1ER0K8tCtE25EdHEw4yx5qLU89BqRvZlO4beaAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XohsaNxTxYyetHwZIhF3W7i5PVfhngPcGuQlyUuXhfwgyriuc4FC+wOOM87F0RvRbdzFkZpWoS4zT3B58IBoP9tQOBg9GG0iBLFGozTSU1Su5RhN14pwub8rLe4p3sCSijcOL1RBZmJwV+nz1TW/BG2LTF215FbXWKCALkx4lmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o21yi6Gz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZDoV/I2/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o21yi6Gz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZDoV/I2/"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I8kVAt132160
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:24:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sb1Vub//2FmjjK1XjawIHRbF0b2ZqywCKbgFVQLXFQs=; b=o21yi6GzpreRZH9j
	CmG+CyiFVJsMq4+L4Noixv4miLh+lDVAU7L8O6z4cK1lFMx7NHrI6UBU00VemV/H
	DRLgeD96It1iFOOKDqA7P23bG6KsTgy1Q1aTTEDcJPN0y0W5nZDKET056Ibm2hO5
	8/4KTfroUtYkdjBw1QDyR9rrdk7yFSzJEBmTXgT3Ck+DKhhudktIhnvJx345WUzK
	9zA1isFUZ6ZAOvLnQDEiKX83ONc99MdnoY4JSzf/4ZFjLbDxEGmxzl6tu1enSrCg
	mRFlPTvJEe39eqjPhOodkKKjwc54sMMb7x66816UrC0WJ3KR39xM7a4mSUt5CKGy
	lHVfSw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs23905bd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:24:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93be6ed214eso7447185a.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789723461; x=1790328261; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sb1Vub//2FmjjK1XjawIHRbF0b2ZqywCKbgFVQLXFQs=;
        b=ZDoV/I2/NYibXTvdHsxXtGUkw+zBVcdq+C68+QxeIuIGX7e63fCVhHw11/Mb4Du6Be
         QGwpY+X70LSi83nJiQ0NFYf5BWXcAF6OQAzT3mCM9gYYA9jyO6JG6k28Oe1CsG8AAYbm
         KsRdEt1BCAFLJflLs3XWdXTDwHNbTOfLQF+dMk+GcG8xUPEkpvwjvwECGN7O6dYNntbM
         wQRiSb1C3zsI26qQeEBQrVdhN8dAPDdXRnE/Mq+bGVTNYMk6mI602Jn9cs8gSJ4gTbHH
         pkkOLZT/b4pZeD9RIFkNs9RS8bFvUICq0l74HB6bmUrukPiXo3M3vljzgBc+20ftbOuM
         a1wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723461; x=1790328261;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sb1Vub//2FmjjK1XjawIHRbF0b2ZqywCKbgFVQLXFQs=;
        b=z/dIe/djXKeH3ovcHRJSga257/SqOimdVNFGGIaRLwjd4oBDslRSkFxVrRzqIU5q/y
         z1SppBPGycGbQOV8nvQjPVFdomQ2pcjYDjcYYTlAqO8h6i6M8t7R1yYAjT3N1thrcky3
         kKanTpPkupZnVQxxKVbiMV/OI33JmhsF675r8gYqxP787R53O/WxAFpHKdmJprQS4nnC
         FuUb678lEJUioPXxvpX3vYsYutuh5Zak+/mpV4WbCjWdRFL+fg954kjJxo4B4hiPXWHR
         YQ3IsyEJpXIwV25kkKtwm5S/lRhgyHULPTkB7kDPJk4mWNnoh9Tb5E3N5dwlyoiWJebR
         pkow==
X-Forwarded-Encrypted: i=1; AKwUvBzapdplTJaCTwbKd1H1py6KcF/otZBOcX9ZbRirCqnyvDlCPrXwnapFwJITsl2TkDHWuz/x+9CS/mQXOCA=@vger.kernel.org
X-Gm-Message-State: AFuF++lZ4y11GbSRRXtoZqOq7yZEOYIDD9tRhFkKb28IGahz1aVuWxYY
	4EqNdtQsel6qC/pxEOiZz5TKabbelu8shTu7JXd/yRsTEcMXHd1nazd7LWetGUXnVoxY3zzFBDg
	BctXlu08HNMVGi8OP5G+Ydxlw473z5F+NzZJ8xV8BnbwUNs6NTB7ci4nslM6RuzbMK0E=
X-Gm-Gg: AYBFou24cqrRTf4kw9o3q548mTO+byJjn3g+ddX1BjuwPyuLF0uHGT/QmddyjEhqXuw
	tXyey9x8Iwi2iKTKCm5xU1xY6jdhNXiUbp3CwPOyZC8pDimF+QEBehtGWfgsf5rHPqO4Tys0YuE
	D4ItifRGL74kgXSs+7cUqAxEKTFefO22KVtvYds1Cl8Ccwx4sYKYUoulM99EQV1rrLbvFAqxQch
	yxg3G4pZTnHZMQBwoStW0pRktc+1aFEZGel182O/6RqjeqjB21B/7BZMEH6T4+vhtrmtrj/oE3u
	S0RGulgeoRLn9SHwOiIZmBEKE59xkXTtdtJjtgcXuqhJbglzp9WlcVxn0JJqSeFx/euWgI/dQAL
	D/fwrzMC+iQ9DSclV5z1k900zOx6LmnCaTI6V7ub32y+eqCLIRsJ1N3yTNoQhoS0=
X-Received: by 2002:a05:620a:4093:b0:93b:d7b5:8aa1 with SMTP id af79cd13be357-93bdca9201fmr235189785a.86.1789723461039;
        Fri, 18 Sep 2026 02:24:21 -0700 (PDT)
X-Received: by 2002:a05:620a:4093:b0:93b:d7b5:8aa1 with SMTP id af79cd13be357-93bdca9201fmr235188485a.86.1789723460651;
        Fri, 18 Sep 2026 02:24:20 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:82ae:cd75:d970:e66f? ([2a05:6e02:1041:c10:82ae:cd75:d970:e66f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872008160csm2986873f8f.32.2026.09.18.02.24.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 02:24:19 -0700 (PDT)
Message-ID: <a8eb1095-ff2c-4b60-af76-55f3dc137967@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 11:24:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal/drivers/airoha: Request the EN7581 IRQ after zone
 registration
To: Vitaliy Sochnev <sochnev.v.74@gmail.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Lorenzo Bianconi <lorenzo@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260915194128.42508-1-sochnev.v.74@gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260915194128.42508-1-sochnev.v.74@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEzMCBTYWx0ZWRfXwgr9NDeD4Mlm
 ZEsk8Lj/SecShSr/fZHfcSIbn5ri0hlQkSBuuusNswldBtpQYZCp2WdShtD6so7MkUw/oUNMMah
 AjdxM5OWGiJ9FEkbPz/JEyA02UikiLY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEzMCBTYWx0ZWRfX2g/AkHn/KZI2
 aJEP1gISQcC7ybECGqdmBFBh9pWcTZFHu/uS5smNQ/wigqXPXb+t5xGqkTj5OeOiXCAgEbGy58N
 5gIQuGF5IWhiNolmIrcCMdukvyJNIXn7e7rEXj3C9K+MMHGIKaIXadZuKLJqQlvfluFhM15mwMV
 /eVY5apYDMnlhEVWcQ3Zx4XhK5hASGXtdqa/mh1+DMZX9+DDmKGjetXR4lUu3jye3tfC5e45jvz
 BmOMVieGALXGio9+0IVFMGl73Y6ooPqrctKLShZ2jR7BWwGRHyJy8DL7aZJBrSweZ/cHg59whXQ
 YFgswikfty2ZyUtgJFS9Sg6LwSpCaOekTiBWYyQdY0XJLJ56pHoyP1H78ePySfbbDxTDA1OssVf
 6tJh3/geYTevKzBU61EwVjvANxb5lA2Sm+dTWO32amDM0tnsZE/n/CY72or0jF4nd2pgsA6jhWp
 2pDYXDCqNB+fuWFt+Zg==
X-Proofpoint-ORIG-GUID: PCvlhJ-C5E49l_Ifz8bRMxw6WRr1kExP
X-Authority-Analysis: v=2.4 cv=I7zw19gg c=1 sm=1 tr=0 ts=6aad0345 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8
 a=EzO2BoKCUxNfU9vyq0YA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: PCvlhJ-C5E49l_Ifz8bRMxw6WRr1kExP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180130

On 9/15/26 21:41, Vitaliy Sochnev wrote:
> The EN7581 IRQ is requested before the thermal zone is registered, and
> the handler passes priv->tz to thermal_zone_device_update(). Unbind
> leaves the monitor interrupt enabled, so an interrupt pending on the
> next bind fires while priv->tz is NULL. On a Nokia XG-040G-MD this
> oopses in thermal_zone_device_update(). On unbind, devres also frees the
> zone before the IRQ.
> 
> Request the IRQ in post_probe, after zone registration.
> 
> Fixes: 42de37f40e1b ("thermal/drivers: Add support for Airoha EN7581 thermal sensor")
> Signed-off-by: Vitaliy Sochnev <sochnev.v.74@gmail.com>
> ---

Applied, thanks

