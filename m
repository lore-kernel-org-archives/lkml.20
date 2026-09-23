Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D77253CA62
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790175112; cv=none; b=sZ9Vhjl/6ZYpb/up3MEK/Z7kDeXwl1oF1haf1+rTMnQuY0reuYAggXP+ItU6Cyma+p+r4anGk51DQrLGXjqxNmdNyHTezIFS00AdSYqRnb79PtuVEzRc3pLSslU5NbOdg3dIi1qwZH0pICH5FPZ01rpDx/dBz8VNZ8W2sMKMbb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790175112; c=relaxed/simple;
	bh=tUeK7QUj2IKE2uFCeChn1ygOQ/iJBXWinQo0JAkeZD8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=KB3NZ2NHmtSc7X9UtoApf59Rn9p5QNWraqFUDhyV6XWb6XILkVz2W0vwSoPBUR5Zxqn7M8GJr6PRd6AtnOzhYuZvgNbtJeCRg0TxvcIvcCmdnLJUD/rju2M+R9ngWBwKq8zFgSvYawSkypLms6KEc/5v/+22M6AWFu1dV4hpQ60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YDPluFm0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q4lz6wbx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YDPluFm0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q4lz6wbx"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbUNQ2443312
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:51:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+R3bZnXxOWTMbKlDYq2yQXXsxhWIpfAOq8VfoVqcl9c=; b=YDPluFm0OahNv9wZ
	cGvj+KSuUHVh95uSwMdsn3P3kJhzwjTDpi43NkpI/2SoCSI3jul35+60XSfNXhW2
	DzV4vf0pvvgcKlCUDELPwYzEuKHTJUDAgYnveKZy01SSwovXfd4dcd7ms1k+G0Q1
	DR544JEiBRHK5KLhHhHmydrvQ4mAx8IUEG2OSl/q1jOdNUBZrV7yzIvJJYIFO7Hn
	hNlyLG/AFRFUoIuH5dHrj50WnXxxxrN8G7TM50Rg+kYg9zpFKAMvfLYSGHWTOZwN
	+JuCpav51YiRfNXP8SN7C9RDlzxtfrlLvwFyC2iiFGL6nmABaZXj253uamIf9KuC
	98et3w==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbx7hd87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:51:50 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97cc09260a3so1945090241.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790175109; x=1790779909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+R3bZnXxOWTMbKlDYq2yQXXsxhWIpfAOq8VfoVqcl9c=;
        b=Q4lz6wbxrOhVyf9dNo/Iw2qfLyrFkixppauX2wZb7Q4nyT3vZuCH5xLC1uHXsePCkk
         WacA71yYN0hXyJXHbOsZ1GDzkMgU1Mgwki1RkUnBOrfkrl2/e1YePDs6jSnWv/9jg2hu
         Pqt8qGrUTj+a4tS8OGbXzoFQvrU4jOrftBoCqw+DMIgX5TziPXDnXcIyUS/xhTTl9oVt
         5IfKQ8Q/YZCC74Zmc6utVgpqKuCpjnA5KqEz9aSDXg83yPAnS+l7bQkdWHEJsP21Vw65
         4C3XkouO3ACyZHjx9UtoihRjfFLB5YtNNAOES/bofsaKRLPWxju691m0JeVKzUkG0xrj
         taaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790175109; x=1790779909;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+R3bZnXxOWTMbKlDYq2yQXXsxhWIpfAOq8VfoVqcl9c=;
        b=noETh+6RA1ATBy3jC27QYxOMxLTypyqKI8Nv/Gr5dk9Hiy3JJwGEgEKvP9fKwcItVi
         5/fvuy47hbPL0vQMsKgV++nTV6HleETNmvj3H3omiubFKk4dzZ6Ank2BQn9yjWmr+gC/
         z/kJOyiDbAA5ydnxMG9hvlT6CnONkiYwTTnMvrCp+1DlVL4HT7BPtLy64yage+m/21H2
         qUr8A7nc72co5VHb+gIE425ugZVaR20HAgIBYW1/gaZnsbnof6gpQHwkM1F2CbQzxZxr
         ofah0NfBSElT8nvbp5E0i/6ZygUc8YIPwYilvkEZ6kJCg0xZta1hb6J9NpOazotcymHs
         N2qg==
X-Forwarded-Encrypted: i=1; AKwUvBw6EtMjcOG3T+GjPl0p+NBlEgkM2Z1AXssu2BKsZNyaRpvpapofPr5PGiyA8JRCoBdmjpHQfXvMtlzTn30=@vger.kernel.org
X-Gm-Message-State: AFuF++kW8bHaOx4HMjPAUZrElIihX8HtECA4tSfVeKf8nRd5vxUGn2ei
	60co5X9zW0xglmhBm49kV1mZekCBMOIv89t/bVSIM7zSR1PpP7WhKMxXmIaCykA7uRU2Mr4KHuR
	x0aiVq6Pley50+BJNKQpp6bY5BZqhK7fiZ8EbXTBl61zliJJRIt6oVWl36TIVMHwWfmo=
X-Gm-Gg: AYBFou2MP3vbyFZ6eknTh/4oR2aZvrly3p/nRC5DyVFFqzx7qyzv8wF8Z/y0qmNFwcy
	llFH4KKFDRgn7zV83Y7Wou9VoLKDrgRQw2WkyTgKe39oSTTlbKkTn3KGsMOEr7t5y7DoTMchZj5
	/Oqun6jhEVm4itcbmwuXZh6R8UrIegGIJ6twcbcuE+Z5aiajoEuDydCxbc7HmC5MJuAqzjMlxfr
	qE4y9Tz4l3LZSktKy5/dHih+Co6+NZYx6JRXA/gLClUd0seI4H9H5cjlSOZbMoElS23cFUQgWc0
	6hiRTLvGPZrbPehS5wR4sAbdE7EpOIPvyL/cwV7KqZthRZBgmCjoWbMhRQ/cl9aBQX1kj+rImYG
	xOTVj6zBTuIlbeRRnAfsHyH+ec4zefd5wafwhTVzAl+12r8PChvfgptXQJE0UiWwRjzwqJF0iv6
	tcc2j+Xe9sP9iKXmeXe4iznTuRZvFFX4O+p1V2+syDIZbLix9aUYjJCagxFDZMUrUYqlA=
X-Received: by 2002:a67:fa46:0:b0:7ab:45e4:9479 with SMTP id ada2fe7eead31-7ab45e49664mr3196579137.16.1790175109617;
        Wed, 23 Sep 2026 07:51:49 -0700 (PDT)
X-Received: by 2002:a67:fa46:0:b0:7ab:45e4:9479 with SMTP id ada2fe7eead31-7ab45e49664mr3196561137.16.1790175109223;
        Wed, 23 Sep 2026 07:51:49 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae60a04csm143005866b.23.2026.09.23.07.51.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 07:51:48 -0700 (PDT)
Message-ID: <50b27e3b-729b-428d-a903-b118a5bfa249@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:51:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
To: Sudeep Holla <sudeep.holla@kernel.org>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com>
 <arFKVhlgJge5EZyj@monoceros>
 <20260923-sceptical-mauve-firefly-f5456d@sudeepholla>
 <6b5a8300-ebf9-4717-bd39-952e89fc5e78@oss.qualcomm.com>
 <20260923-snake-of-magic-satiation-c3b857@sudeepholla>
 <a5e56180-b96f-4fac-980e-e837e84cd5a5@oss.qualcomm.com>
 <20260923-calculating-positive-inchworm-28d3cc@sudeepholla>
 <arPMAXs4jjUeu1DE@monoceros>
 <20260923-groovy-airborne-rook-e1efc6@sudeepholla>
Content-Language: en-US, nl
In-Reply-To: <20260923-groovy-airborne-rook-e1efc6@sudeepholla>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: B0n3MBfN7OHpplrvGxy3i8TKuR4G1r6B
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ab3e786 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=IpJZQVW2AAAA:8
 a=wmcOPm1-qqoyX47EQMsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1OSBTYWx0ZWRfX+mYvhZt1OPIk
 ojpLumrTDknktPBbocBBGB+Ena4Ps9SHsGW5aX+zBj5VOTViIBugsWFvH+6CM50YN+3MGs8iGRB
 2iDky6+Qtj5uZn+HwWNCIYuiheJRseBuj92JF2iOxJgzxZnr40S4k6TU1ta5i+fT8sZS2vTwf0d
 hP6c8/GyG8dY/5n9VdhbbX8ZFqImyA2upIkqRyKWbTCfMEI0xFcsFR8BFJknGtUTyyF5duP3Pi3
 W6Dn52arzheitZDFIf+gnkDdE9Hw1S/NSEA1M5FT75ZBSgyVcdonnyaot87bDmru5B3nRZw0S2G
 gAGh4AtvDHkYam4HaZb0kv2u7SVs0IA7JQsmeUYzk3zLyA6YbLfS7hP42ggq2+NgCnIwxL8lRvT
 GcPD3B9vVL7lPCELkRFKoNZmjvyIY1HsJF5Z0F8TvM4nXiLO8FqrO9LTeKqn5kiGEo8bYZa0Ept
 gKledpHpPAPyHDCfVsg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1OSBTYWx0ZWRfX7Jt34LZsh/jW
 dYy6dP7m18rEFHL4B99QD8DzQgY71K+9pN/d4Pd+bFo5RHGwBP45yMmSha4OHL92PUSn3JdV+wU
 iAC32r7Dzmakc4g0f5WMJFLONlRlMe0=
X-Proofpoint-GUID: B0n3MBfN7OHpplrvGxy3i8TKuR4G1r6B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230059

Hi,

On 23-Sep-26 16:25, Sudeep Holla wrote:
> On Wed, Sep 23, 2026 at 02:55:26PM +0200, Uwe Kleine-König wrote:
>> On Wed, Sep 23, 2026 at 01:01:44PM +0100, Sudeep Holla wrote:
>>> If Uwe is fine, yes I can take v7 as is.
>>
>> Fine for me.
>>
>> Acked-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
>>
> 
> Thanks Uwe!
> 
>> The nice thing is that the device_id structs are not API, so this can
>> also be addressed later if someone comes up with a clever idea how to
>> implement it.
>>
> 
> Agreed.
> 
> Hans,
> 
> There were other changes in bus.c that conflicted with this. I have
> resolved the conflicts and pushed to my for-next/scmi/updates[1]
> 
> If anything is wrong or if you prefer, you can post a rebased version
> that I can pick up.

Thank you, the fixed up commit looks good to me. I'll try to also give
this new version a test spin soon-ish.

Regards,

Hans



