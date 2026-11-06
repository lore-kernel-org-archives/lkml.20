Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793942451;
	b=FoMC/fnn70hN7NommA79uwSe3f80V1xyvJp2p8S0kI5wENrt4OKrv5tb4srxIeUn78MF
	 qnXz4FeLdKN2erZwtyNt3anonizHC6cYmUbSggZFfiV+NOBlqzNTSwu2bDYsd2T2Z+4nt
	 Qw6lrvGbdoDGDo2HiehShWAp6OkTJDFC/caTn9Yz76HP5L1HPigd+igLbiR6tctXq/Heh
	 o3858XrkYYtJzY/1LZgIUgrE10bWaveXTKPdqAkGjuOZke003nHDfV/qjrYkSeSK2QXZ2
	 XLhTg1B8Y4vJn8rNQdFMbR/uD7XyKucGV+sBzZ/y7oioByO4QBbMwSfs0heAu94s0Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793942451;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=s5r+/GLirXNpsiw8EpW1qS4uEOkcFuBUgn6AOzlYOS8=;
	b=eZwPA4JnjWd/yPD68b9JN2Wjn5qOeuqI22U2TVdPfLg1KKQbk/qnYSTxh2Jp6bTLe514
	 6N6fc00ZotgCtL0fBS1UiwUnKPYZAxdJD7TYSu/+Eo0I7SzIAhRIkgHsHLXorP+BEJgXV
	 oUtCyPLsvi/ea7Y/ae9Rwl+Le0+U7c96gTro6XRRH7sRjigl8BeVTrYuO4UfFj84zlLVc
	 JcLWAm1cMFTzR/VoSgvEAMWvybOG8CsS6PoI47CReYGygQ9TGSzJsI+z4eUxAfNm/vnHj
	 85btHY4LmC4hlZNtwTrIqt6wUjWmwqLnu6PKYv0Roxm0UsS07fkkAfd8+zFRtWDYOXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ehX4aPGW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d2Nv7X9R;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A637D606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 05:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A637D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ehX4aPGW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d2Nv7X9R
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A640q0o3419049
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 05:20:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s5r+/GLirXNpsiw8EpW1qS4uEOkcFuBUgn6AOzlYOS8=; b=ehX4aPGWJA4S1X26
	cEDcWAEDBtkHRQBFnGnSdpcDPltUjxyKCDOFthte90TZ/C2v+I4/VEDNAcTWgHB6
	tFBpjeAVrUyL+2hI9tHjPkzniOJmtduxrTim9/km9aLXxNkosdZ+F4/s+w8+nEq2
	oIOKPHGw1KjWEYH+bcqteuJan+jUMK6bdzmrh4PTvJnjisPn8ypgDTkM/orHVhik
	1Qz2qJRxWYf7CanYaBitOh5DxJTH4MDjKE4TaxFTeoqO+p/UFjB0r0pVAW6/bmr8
	7ooHnCO3ZnVsaFmIY3nhyY+vwesTGDupda0BSZRoC7TX31aNCW8w07hMIEb4LOux
	VARBlQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pb122s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:20:49 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b0a519048eso316991a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 21:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793942448; x=1794547248; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s5r+/GLirXNpsiw8EpW1qS4uEOkcFuBUgn6AOzlYOS8=;
        b=d2Nv7X9Rq6nqvAiXPSZ4FwaUxrNXWtT0bOSxUb+obA3eI58i8Wsvw8ZcvNcfdvGX1T
         rytfZRCCrR7J1fabDJ1+RR6RCEmyPx3CLlX4Z6nZq7s5BJhMc2BM6BszikCNeZbGJZ8y
         mqjuyxoSNRVJODt/T7TL7D7s/7zXZMLDJT1PqdWMTniqHxjk1BjuzIhMcsRPtzUQzyF2
         qUA3tDOK1tuDAEMcO9XJjjJ7Yii6m5cpvf/re5wiYKJbRQBxGAwbnEwVVsJ7X4i9KqfX
         Kgsf7ClUIj0u0WQ6J+bxq0J0ixCd0wskpSpmNLH3onUCbfOyhwksNRTVXVT0IDdXgscm
         CWuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793942448; x=1794547248;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s5r+/GLirXNpsiw8EpW1qS4uEOkcFuBUgn6AOzlYOS8=;
        b=SSKZdXt9N6HDQ2792QsBw1IcYIMfRd3OiwKOuVrYQ73VenlDYq7GBJE4iANiIqRgGH
         hi/fFDuIplCqmLrgRSaOAm3eCGju2Nde9p6GZCnc6DqUr5D7XRWe+lV7EFlWiN4PIhi4
         EPlxpExXdB3SX62veaDBSXxqpqxuPgYbfaN7f1Ke78o+KCRenl1zW1KwX3YR3lA9CrRn
         kh0uFOiITt5iTEL1r8NbHe9gZmy9ERIMqPfFI1u18dHUgk/M+vW3mbwJvmSecqB7900M
         zBUOIiiy36Qzg5lMXIOuh/yy4b615Y5Y0dfxWsypFkTZZPuwXHnX/VnNM5Ws2dE24D7t
         bZLg==
X-Forwarded-Encrypted: i=1; AL+hErESNq0hl40WXmCccnUXi/ohfcELQWtiyKgynTVzkVdmiSUZGf0vlEUoduFF9+11wj3LzLLjGkw+wWYLJH4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZYkwnKAB19EJeZt58aVDYPw3qlzBVEXUaODKrS8R0iosjV7dQ
	ASexFO7k0cap1t1wjUCC3DuLqvtvMVEePQ9FbXKKUxvMabX35WKDbOe42e3QH5L0Y1glTjJJiqS
	rfoQg5QACvQRkE7AH52Z1n77CICQvg5thD1gk2Tt+dOS1YxN7wVbW/5SWN/EpTY0O0Jo=
X-Gm-Gg: AYBFou3G2fLsYR42eu1HXcCSfreNwdsflVfpeMHkRlhLXW4psbIhzRx0miW9dVQHV3V
	Az31UG+Rgw8Ij6lh8XgIGyTRDF4HIT/p+SNIw+G55DYkuFs4oCgIrUqoV8c5bBYSwyfpRVK927O
	ivADb1bwfTTHHpTFJHhT8ZBZA7QJc+JuXjBc9rGuf7HMpidLClvKGvJN+w/pOrBW0hfGLRibWiC
	VC105hYp66iswomn+ItupDFmR8oJe9FKhVe05F/qBvB3lQiEQHBqM5Cf9CEwISP3kzZXvh41rp1
	VWvWTXrCwxNKxTC7s+S69ml97RVad8197jFy00XouYBIPjSPO5JSGKrHKLv+n7Sb6lGWefnaZca
	maueWNmA6+DsUneaTpl1JKgYAHXv3NxbK75Ut3OJWDqABDgvxOBwRp51ck3JDJw13GmFoD+0EAT
	cCl0aVApJmT7fw8Ylp3P9EYiBJZAUM739n+HmNFvwWsKs0
X-Received: by 2002:a17:90b:2891:b0:3a6:f1d2:57f3 with SMTP id 98e67ed59e1d1-3b0db6ee368mr1285354a91.58.1793942448520;
        Thu, 05 Nov 2026 21:20:48 -0800 (PST)
X-Received: by 2002:a17:90b:2891:b0:3a6:f1d2:57f3 with SMTP id 98e67ed59e1d1-3b0db6ee368mr1285334a91.58.1793942448014;
        Thu, 05 Nov 2026 21:20:48 -0800 (PST)
Received: from [10.133.33.112] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7c8ff96sm1769378a91.13.2026.11.05.21.20.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 21:20:47 -0800 (PST)
Message-ID: <4d530236-bc44-4d01-9589-08bf715d8eb9@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 13:20:44 +0800
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
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: Fix HE BA mode and extend
 buffer size for EHT
To: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paulson Raja L <lraja@qti.qualcomm.com>
References: <20261106-eht-ba-window-v1-0-622f2272e582@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261106-eht-ba-window-v1-0-622f2272e582@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hs1-_hOKDN1sv1jJz3sUZGTRZywBtdT6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAyMCBTYWx0ZWRfX11rMJENaElOo
 LQYBawyfp1JlWi3ImvHyjhafDCOgCLHesE5yGJdw1bEH5PXaUeB6hr8EOCBEwKGs6X6h1QUao5o
 Z4F0Mgg3IEQSwtV46uyi+NZ1DSc4Lgo=
X-Authority-Analysis: v=2.4 cv=LIrz05W9 c=1 sm=1 tr=0 ts=6aed63b1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=qSRq8I4OGtnwRW6ma38A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: hs1-_hOKDN1sv1jJz3sUZGTRZywBtdT6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAyMCBTYWx0ZWRfX7Rqb2JXtxQP3
 JT5ZXUCIC26yzcZUzEZSAXvfSnOEWwyKKveK+Lk8kO1JQHCF0Lg6HfOK5tlmSrEQBhBahoTihxo
 LVtpfJYWQMQgaHGkK8lbYGpAXKWconQzsU6vI75r4gVOAh67ELbI1gDepiJ+INmtopGgbwX4eVK
 zMArYNHnKASuVFErgZRkzhcRu4Zb1bxyRaP67t/pvhv0A6RGMnESo9opKC+6jDcelZLKOB4Y7R0
 1wLn9sLCZiG/mEsearU0B/URyy0EkwawUBWBDxonuL0cmdr6QxBe6rh5GG2y17XXcpOH1dyP5c+
 aUxUzPxlghlfFDgL/IEALAb4cQkWj9dWO2hVJTVXkwRZMQK+nvYPDJCEk87ccdPvBTnRzIPamqS
 iJgQqzz4ZbP9SJw9o/2nbnOY4CxTCRpDOSUo1excTAmqdFW+DzqgZjzTy/ZSl1T+frIVK3jw2Rl
 kV7F1jACLNQeS0tCldA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060020



On 11/6/2026 12:57 PM, Rameshkumar Sundaram wrote:
> This series addresses two related issues with Block Acknowledgement (BA)
> configuration for HE and EHT capable links.
> 
> Patch 1 fixes a bug where WMI_VDEV_PARAM_BA_MODE was never configured
> for HE in AP mode. The existing code placed the BA mode configuration
> inside the he_oper.params check, but mac80211 does not populate
> he_oper.params for AP mode, so HE AP links never had BA mode set.
> 
> Patch 2 builds on the fix by enabling 1024-entry BA buffers for EHT
> capable links. IEEE 802.11be extends the maximum BA buffer size from 256
> (HE) to 1024 MPDUs; without this patch, EHT-capable links were limited
> to 256.
> 
> Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
> ---
> Paulson Raja L (1):
>       wifi: ath12k: Extend BA buffer size to 1024 for EHT capable links
> 
> Rameshkumar Sundaram (1):
>       wifi: ath12k: Fix HE BA mode configuration for AP mode
> 
>  drivers/net/wireless/ath/ath12k/mac.c | 41 ++++++++++++++++++++---------------
>  drivers/net/wireless/ath/ath12k/wmi.h |  1 +
>  2 files changed, 25 insertions(+), 17 deletions(-)
> ---
> base-commit: b9acb873d035fccc8824164246535ea6fc95c71a
> change-id: 20261106-eht-ba-window-5c2df1a8e910
> 

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
