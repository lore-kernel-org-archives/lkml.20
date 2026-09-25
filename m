Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EC2381E8C
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790348612; cv=none; b=DHigUD+ZQPivbS1oFUWkpu3w575fGtviyQfZT1HUArd0zrFkLOjQYgMbZCRkBg4jXmug13bwVXX3FAA0n9pL4nXs50/jBI2TCf4FEtl23IK4wkcDSx/QuT8/FzHy2Hp2d1MqVoF1N3sRfqCr7z1w4m9MLVf8QtfEqcJDKtNVJ6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790348612; c=relaxed/simple;
	bh=ZmPPJwHUko9FYnBNqzFjadYHd829bs4wtITnCpXH4Jc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AtSsut6cVKtxYGxAgGbSOa4veW/99tWbvDkCIunwLhPy95s9HyGEi3KaicVRUhNdAHu6+AYhEh9SI+LRlE2L6sHXEyAnIeh6Un13DuSYSkkllhDBoYulmJFy52pLh9dY86B+oZb2diRx27GLjDr0XNZ6NASbmVzvrtRMH/5UoU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h0AvOe/a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hepk9/Mq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h0AvOe/a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hepk9/Mq"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PD8vV4289418
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:03:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZmPPJwHUko9FYnBNqzFjadYHd829bs4wtITnCpXH4Jc=; b=h0AvOe/a9dWJbUP4
	ona6pb8Pkwg4EnpW5lblO4R3CV+S2Etp+jiL3JrMTpwBb/M6WjyAX1o0k+UBTXx7
	6e8FWrepwZNvx43PqbCfBRGm3gEXMrgyfmdqPM9E6LajwWchW7IMlxDWFrTtVNcF
	ukLCPuk9BRAgMxxWlIMMVzfxqo/6ZaRCbhg5jii00koOq43Jn7BodqrtwLYGLeN6
	3e6UKAHUhQwm/bsfUOaXNdQ7yVtRNoK7ogfiMTldrwhiOrkLGh6rJKH097JwTtni
	aHjgan48Yw6REMefCc6M/fU3qICaDXFeK133iTXWFEwWszehpzAqARwGmm7jg5mX
	UoW8JA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw881v2u8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:03:20 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-86a880e91f0so1362164b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790348599; x=1790953399; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZmPPJwHUko9FYnBNqzFjadYHd829bs4wtITnCpXH4Jc=;
        b=hepk9/Mql1Pu+AZ4q2sBOQ8QBVHYxXrP0focFozY3+2BZcIj8QOO8fQFYGM/KbAZxW
         MKGLuCVPM9qhKoiMT0Cplsy38uLVl+j2ANEtdJ3f55RY5PVguj1ycnoZ2bNn43jGuzfn
         oYKZdGZXFomNLUqxhbYoQW/9/tEXHLb3nzcnQvL2K30eUKo8sqrU+HDaBEw0npIBSPm+
         ov+izAGfeVpwsXYDvK5gJ9nfIIvqwhA0gBcjcOjGJFyW2YI2vZ2lLAfRIsuGO9vR8VaC
         uXszJR+WaS/1QltAMypFAAbVpI/NBrSlER4UvdT0JioUnJa5eSrVw5AzQpxg/mUH+wTw
         78DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790348599; x=1790953399;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZmPPJwHUko9FYnBNqzFjadYHd829bs4wtITnCpXH4Jc=;
        b=KcovcG1vyohIpjNsMLFDwykZE2FTvZbvZBe+vCL1ykb/UjB5PJNLB1P2mlm1IKrzVP
         y8sAz7IaF+XGMgl2NP4bv2PpEORbJxugeiPu8rRvaoZdjVRVGcKlPTitjXPRGpxnguUQ
         dG7WhIl7ub81/TeMyOcSBFd98mCAa3YvxAe1IBmfrZPMLso7Htd2jZCP694bylZ8PKoT
         GjwGU6CtWOliNcEpCS6NPKfiAqgb4oEketbaTiR8V04EEoqSwr1UTPka9myeLBZ1u6T0
         McoepRNhpvM5es7nEUbYHQ36THPGiDKvwrn2VdldzsVXm9VxxXYhniyaFXX0yCkjpDmn
         emJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxqKyjnoAaF8/dNfKw0Keogy24IpmurjCZkBHoLlsyDVdC8EV8YAWa6VV1iRRY1iuQitpi+ZxR7Op4Jq84=@vger.kernel.org
X-Gm-Message-State: AFuF++koVVmhlgHJYKhdc51y6SFmeQ4iEx3LPv600XuZQF+zWraFRuM/
	CY3gDG4IpyCSgLUS6ip+0/kdGSAsGUaloX96+VI5pcNnAm8rsARagkLdhuVu0yF56H3IzvP6v6m
	nS7Jw62GkF4rklVK550r3og761rK8nvw0SI6yJwPfVoXQQqnQcPQke6muLYSr0BCarIeNA3tjej
	M=
X-Gm-Gg: AYBFou3pvshIHm6/3bSxqHhM5TPyKPHk3TXS9lccE17fQg+tMUXAPrnEuty5CMafsOC
	+qngoE9xIu7HvlFamkYFAmM0jC/nry653820pE5nsPsiDVN9b3KCzWhoFhHJSUYcwdIkMlYDUpo
	qPl1SN10eWqrm1SQ2sBla9Ubc5M4CQsxqdt/VqiLPupTjNKYJLW2TKrV868SXsCRK/rAK2WM8hM
	AyvqfJDhJ86qIO2+iLHuv7OPt7SGXpInwZDL/Twe1dHWIvH4FXhen2YBODE6ydHjwRW+xmdFye3
	gEyhLnQKZSrNcoNKRwUsOgnw4SUYElaOQxdjSaBdfH8cuceiihjMV8xA8FgbZYbQOd4fHxzmJWv
	akEAfntsJkURkbTYzrzpeyLiSLGf9mVqrtv3AlUll0edKBey9Sf9qV+mvUrXu
X-Received: by 2002:a05:6a00:2283:b0:86b:43f6:67b7 with SMTP id d2e1a72fcca58-87e9898de76mr4761000b3a.4.1790348598929;
        Fri, 25 Sep 2026 08:03:18 -0700 (PDT)
X-Received: by 2002:a05:6a00:2283:b0:86b:43f6:67b7 with SMTP id d2e1a72fcca58-87e9898de76mr4760950b3a.4.1790348598304;
        Fri, 25 Sep 2026 08:03:18 -0700 (PDT)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87feb583422sm1324979b3a.50.2026.09.25.08.03.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 08:03:17 -0700 (PDT)
Message-ID: <3ea7e9ab-ed3a-4e6a-9006-b6f6af51c1fd@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 08:03:16 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k: Question about active scanning of DFS channels
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Jeff Johnson <jjohnson@kernel.org>, Jouni Malinen <j@w1.fi>
Cc: ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        hostap@lists.infradead.org
References: <arZ-gEnmv0QyuGI0@FUE-ALEWI-WINX>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <arZ-gEnmv0QyuGI0@FUE-ALEWI-WINX>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6ab68d38 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=ePHqwv-1doYRykRbqMUA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA1OSBTYWx0ZWRfX3qMJLTCwKn2I
 VtceoYIOUnWmAFKtMIMRbOFsP11wozCzrBpki/FDRHXsqZ2ZDyVswP27Dotc3xDL00uWigvQiwL
 zjbiN+uRfJpX4RLSFjqPl6aVPKydPeE8OJUTH3vaCQ8ZOq54/1dHLBd1AF5MA6Bh8kW7cztgJlN
 WoDo0KuojvII6/tMy1s9a+FpsY/U97DDLG3pT21/lKKnXNOx/CSKGn3Ik6chjjVY/9Dv89WQBg2
 d6xq0j/L2DLr0KBwZpFEEGVM796RUZUKQAxAXF/5jIEOkboJ5rzRKpTYRlP1ez/Dys7jS8hD05B
 UYBIOSaf86qwPA+8AyX2FJGUbhUH2KyR9UE/brF+IcUOyX10/6FqYEevrQC2pGTMaCESRrX+TYL
 RaOWehZrBfCFFY26cmIaaa0X6wGpET8ja+GkLO8KwVRTwkpD63zGSgbwDV+2nsi2TdyVRJaSjTA
 GJ6WJh+vPfXIjivqNuQ==
X-Proofpoint-ORIG-GUID: cgPvFaHTG3nG-wNzhCpQQ0HOOx2Bm-Sc
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA1OSBTYWx0ZWRfX22yERoUMyL+v
 KhCQ+OGK5lgHLdfpj6nsjPcGOUwDae5UHuV3f4VaioIabU8wK+2urNfs6Art/ih8122P8XssE6z
 2X6O3e/Skggp2aEJMLho+7mKWmmqKsE=
X-Proofpoint-GUID: cgPvFaHTG3nG-wNzhCpQQ0HOOx2Bm-Sc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250059

On 9/25/2026 7:00 AM, Alexander Wilhelm wrote:
> Based on my research, DFS channels cannot be scanned passively, so I used a
> sniffer to verify that the "directed" probe requests with given SSID were
> actually being transmitted.

In general that isn't correct.

For starters, everything related to DFS is gated by regulatory rules. So the
operation of the client device first depends upon whether it is configured for
operation in a given country, or if it is configured for World Mode.

If configured for World Mode, then initially DFS channels can only be scanned
passively. A client device in World Mode must not transmit on a DFS channel
unless under the control of a master device. To do otherwise violates
regulatory rules in many countries. So the normal process is to perform
passive scan on DFS channels and process Country elements in Beacon frames in
order to determine the country in which the client is operating (aka perform
an 802.11d scan). Then the client can switch from World behavior to
country-specific behavior.

But even when operating in country-specific mode, whether by the initial
configuration or by processing Country elements, a client cannot transmit on a
DFS channel unless it is under control of a master device. If a client
receives a beacon on a DFS channel, then that channel is considered to be
under control of the master device that sent the beacon, and only at that
point can a client device actively probe/authenticate/associate.

Further complicating the issue is that some regulatory bodies have rules that
govern under what conditions Country elements can be used to determine the
current operating country. In particular, the FCC has rules which require a
device to maintain all FCC restrictions unless multiple criteria are met (I
don't remember the exact rules but seem to remember that at a minimum there
cannot be any master devices sending beacons with US Country elements and
there must be multiple master devices sending beacons with the same non-US
Country element before the device can be consider to be located in that non-US
country.

/jeff
