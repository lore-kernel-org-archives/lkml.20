Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74AA4AE8DC
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790006583; cv=none; b=jY6XJ9eI/1vaiWu5da7ZuVWV0CF4MqE1SbdYwexLUxrOpcWXmaCUyzvTepp55/Ftj2usL31liabO1B8tCEoOpExUfWZ8JoXR7SAe8yWDmtCyZQErWUsSMsCwisHr931RRvBgRTv6LdgoazZc4bNbJlHR7qaGgW3HEOZ/3oM8cz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790006583; c=relaxed/simple;
	bh=jy3bo2X4wOLRFYDuvOsrNZw1wkAzmqtyPcungIQCbI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bY2iXCBc40KteSeWJeOuSwTINAK19QgNPXNEstrmWRRx9K2XE3XW63oamuO7eob61exHzEj8u5CqPlvgmENHTTMhsAypme5Zlq6UWT2+Z3sRDv/qvAHpMJsvdHsMv2K4qrvan6sQhCp9NeZ587hzNLQP6GK39To5Ps8x+npOBmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=STfl3VuK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bMy8dllx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="STfl3VuK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bMy8dllx"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LFANTE1437856
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:03:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JbSB4CaeAuGrTTXlqwEBCLD55crV4+SOCToNmqjRexY=; b=STfl3VuKPIrb4D3M
	/a29gLjDOwn/loyvmiUMmV0jt6FKNI8Q6Y4LCF1jEyASOGe3wlZZU8Yj2V6lz3l3
	YN/K2Ba3nbQa7WSOI/OfnynlZO/K18CfIuoOqIQrecYZjahhESpTPvRiSY6vJDEk
	X/Ph2l1IcLM6NFP1AzKMov/CaxH9OUOGlu/ZlbqMlVjUnbOoNDqVeSAoqeqgPkyB
	TjMVp2fErqVxOEx6bMZ48xxSLAq1kb+YgwSMuxnSGTcmHAqPsl2Ahf+/QQTHjWSP
	L+435/6k2GDXiOa7hafKCNnxddIXDGCeqANv68P8S2mQxutSM7Tt3JMKR0Qqj8vT
	d4+e3w==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtwf5jr9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:03:00 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c8487ce333so764242e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790006580; x=1790611380; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JbSB4CaeAuGrTTXlqwEBCLD55crV4+SOCToNmqjRexY=;
        b=bMy8dllxWVTUbEg0CGZktBj/GfMt/HAhQSLcV0aek0MsyeN2Lx9/jbz9O6q+toPWED
         jd2/Byn+xlf91lh74zTEjEwFB2AsPw9DdjeKMyY8Mka/j0E/5gXAQQ2GmerD7pjYS3su
         3RE+uZb3kMcr+w5CQbW+DFZd31iqlNvXduJ5tUkAwr3+qAwiPPy+mcvih9oZVhQW+NwR
         xgeykoS+3C2DusnKGjH5Yz0sydIfx3we3i6tFGEF8gO3ZR97ayhZShh5vTbf8clRys6v
         RlQJHzQu1QtkP9rK1TswG0LlTjHUiRWkn5kcsqZX5nPjU/pS145JaCDUhnrRIrpUEPli
         VtgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790006580; x=1790611380;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JbSB4CaeAuGrTTXlqwEBCLD55crV4+SOCToNmqjRexY=;
        b=IpocOyOuUZPiu7laGw3xdhyX9Y3sMgeiINWODHNNvMYfV0zBduy1EJX+kJomxDXftj
         cfthBR5mKibHDPuPOSw/W63NqnLQmmqj9j0TqwQ6GzauR9RUSahmflqSMGnOQs+W6E3Y
         FBn2Q79uBIGKVfjTGshT7pv/J4+xkSZjqio+PWqOJ6FpaXm+fB3ipkQHGCj5aV38DgUM
         nQQBVR4I/M2ZakcsZBpLL+CkvDguahnvVGRYW9YpD2AJpViIQ5ZV4v2C71Cb4KA2NUDl
         8APoqGEHHqPPpnluTpw/xP+gHxJ5bITct+0WlNevWPAX0kC2LOoRbLFHXZCtwnKraOdP
         tdlw==
X-Forwarded-Encrypted: i=1; AKwUvBy3UUtn34SQ+b8T2ieJq3hVWCvnSyUWG/kmUhikzuxoE2P12IRIxaTCrdiSYTG07SG54bH3RZ5MGmy2of4=@vger.kernel.org
X-Gm-Message-State: AFuF++n4xUqp+Gff/8uorsC3dce8BCddM22JL1ZazSxA9sb03Rw7cTuv
	wFFoF8QSQxjjatvQNvikaxGarIq7eVzWg/ApFSIz6j3OENMSBLW2Wk7VyC4r58h88wFzfN1qRqD
	WZjXPgY+BiBq3sm3wsyEwo27IcMShWct/h+MVNxLkyxgkL3sh76FZhj+PxrmAM56kh5g=
X-Gm-Gg: AYBFou0YuSwCPxdoBrEhlgyx83XN6g8/5/NDmseYrSWWov+j+tU3P99auYFSOcE8RR8
	ns+3H6OuoQnOu9jVyMVeTGRa/bcxJ8o2N8f23kEoM2yylsY6rSNs/5XanD/qhVZ9ZEPpSQqCXcU
	NsBB1MXLhMHp2Kv5yEV1x7gncalntzgDXBKkLO3qhwPwPO89DdpuU3aHT3TJ3s9BP1fdaptVnY1
	uTfyoeAMQI2l2v/H+O9paNpmKSUwyfKvaNOPAlUgaK3dM3Azn5f7yn8IvZWwlNHujA5gPXyPAlN
	xB+MqvZWDG7GBVQSdBRxUF0U6pabksA1D3yc6zL9CG7uzW3NuznnWsIf5vvmWrTVv6W8J1Kba4d
	+Oltd4DttH5EU53UF5/ikp9vZCifmJ0aTpjRsAtvjVSwNJbbLPMaRtPXYsKk=
X-Received: by 2002:a05:6122:3b82:b0:5c9:a60d:3279 with SMTP id 71dfb90a1353d-5c9b59cc88cmr6066198e0c.13.1790006579903;
        Mon, 21 Sep 2026 09:02:59 -0700 (PDT)
X-Received: by 2002:a05:6122:3b82:b0:5c9:a60d:3279 with SMTP id 71dfb90a1353d-5c9b59cc88cmr6066167e0c.13.1790006579554;
        Mon, 21 Sep 2026 09:02:59 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:d4f6:5b0:f9b2:8ce0? ([2a05:6e02:1041:c10:d4f6:5b0:f9b2:8ce0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724589c02sm23206653f8f.24.2026.09.21.09.02.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 09:02:58 -0700 (PDT)
Message-ID: <c783a168-e6de-476d-a20a-450a148f26ec@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 18:02:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] thermal: renesas: rzg3e: TSU driver fixes and
 cleanups
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
        john.madieu.xa@bp.renesas.com, rafael@kernel.org,
        daniel.lezcano@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        linux-kernel@vger.kernel.org
Cc: linux-pm@vger.kernel.org
References: <20260916120003.87018-1-ovidiu.panait.rb@renesas.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260916120003.87018-1-ovidiu.panait.rb@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SJLXx+vH c=1 sm=1 tr=0 ts=6ab15534 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=o9qGJNHU7l4dH-tsLCcA:9
 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: JjZ7X-vXZ-fi_hBCFT2yVHrL9Wtv2y9o
X-Proofpoint-ORIG-GUID: JjZ7X-vXZ-fi_hBCFT2yVHrL9Wtv2y9o
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIzMyBTYWx0ZWRfX150tmUB7W/GC
 rWfRfCljvobiZOd0pjLJxAanHwCVl0m5MA4qfe7D5FwKK6GEjCM34Eu/OsiO/Z0fjJP1/y7O5Cu
 VR3vtx3HtVjuOBF5fd1UNGmJxfwewpU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIzMyBTYWx0ZWRfX7zh3oDou2ctm
 SP+67cqhFJWymWOQxgdDyfJaNMjj7+Cstjc/WpfXbiI/Z2Toe2Dsh1/FbrcuUTHLYwP7eJ4WZup
 yGfUpmG+wXt7hO3hfGsZssYdjzF98pzvLi7k/41/1XJN6qKZAgVXkBi2zwXKi2MJHdlT7wgw5DW
 3qdcVcrqq7NhwBILYFNrheuxtr5QeTBrJ2hxO19mYTKUQLX6cBO5M1JiUf92CMmnX7VS1yM9842
 xyTJTl8J9HxpJveKkiQ7dJ4Pvxnxjs0CvWMkHhuACnRxsqiZtJnC8fXQXvafforuuSmc0t8CtV2
 LmEg7gzSerxzPbo/RWSVXtwZD1wf85gSUZqJGZmghZw1OSgvXPpNj8MLJOgpltHErBUEzjowOGW
 cNMlcxrA+GoSHVVO5M/lwJgWP13j50C9y5sVGpNQ6MppjyXicUg561Vpxs30VBExA5XRWcTiP4O
 rgMS3ppt4gwnJAqm9RQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210233

On 9/16/26 13:59, Ovidiu Panait wrote:
> Hi,
> 
> This series contains a few fixes for the Renesas RZ/G3E TSU thermal
> driver, found while reviewing the driver against the hardware manual,
> along with some small cleanups.
> 
> Thanks,
> Ovidiu
> 
> Ovidiu Panait (5):
>    thermal: renesas: rzg3e: Fix signed integer overflow in temp_to_code()
>    thermal: renesas: rzg3e: Fix runtime PM handling of compare irq
>    thermal: renesas: rzg3e: Fix race between set_trips() and get_temp()
>    thermal: renesas: rzg3e: Remove unneeded low/high check in set_trips()
>    thermal: renesas: rzg3e: Remove redundant pm_runtime_mark_last_busy()
>      calls
> 
>   drivers/thermal/renesas/rzg3e_thermal.c | 35 +++++++++++++++++--------
>   1 file changed, 24 insertions(+), 11 deletions(-)
> 

Applied, thanks
