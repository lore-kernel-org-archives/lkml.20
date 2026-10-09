Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9ACF3A5433
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 03:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791516717; cv=none; b=Mgc/ZD9ENyQ7m05399IDiurrQFEma7lpdh0il9bhf0nn6K3hftjGQTIfd6PLNXXN6Z2C/ZUeCEYqbUV4M1aZTfgzHmATFBYr37AWLsa0bpev+Y5o+uu2ZvYumgOaod8kjHGHm+uvyary8l7pPLRIcY+xom3i+hWpp3wifnSnc44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791516717; c=relaxed/simple;
	bh=rNak045CwDCOU451ibRemMagPDtfh/3R0XJ1GMY76l4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lu0ViURlpcdvdVWllr64i0usfDUV+gct35gXrVnboPDHq2G0J/L1GPRUIP2z1RihjYwDFWsV2OpfIjk92UQTKz5Z1+HjK9aId16FZkfqIhG8KbODtD5gQ1/gzxTd30pjQJYj1yWfgv7oo4bQyp543kMMiSb5y0p2m/v9sywjovc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CqW79SLn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K71OqO+8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CqW79SLn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K71OqO+8"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HING966430
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 03:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wEnLDH2m6lUj6/37jS7qDQEqUbgy6NmPp9J9mV/0Wfg=; b=CqW79SLnNJ76LSVJ
	c8qVNjY/8Pd3x9FdTYUeCaWsgUEXYETX/jkd/ulF0lqYcXkRmzSIUJU7yOzvcFYR
	BPFW/ioPgLr2sA3neAt0c0XrpgfAYvcv/8xNTTkb0xjGx5pH6H9sUyXxgfuJUDaG
	fAOVA9LJPeNdeIjM1mvoc6PS7bihJqf2NK7I32enRpk/cQVan/Nu/w0NI6aqZxtL
	kSg6inFBQtAcFjfM+44f6Y/3AAIO+P884U8rKY5GkoOjVnknTzyuM37mEAg4olpW
	rxAXpJAJrjRO5WkC+3fmtDrlKRxD76RIo/HV1ZdyOTyLYA0G347+pft+ZethtqwD
	vOs2xw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fyj1n89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 03:31:50 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2df8d1e91c9so108306805ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 20:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791516710; x=1792121510; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wEnLDH2m6lUj6/37jS7qDQEqUbgy6NmPp9J9mV/0Wfg=;
        b=K71OqO+8kHZO1TagIWrRYputoK+sg6AFpBCW0zcRImsM2kGTTyc2ZJ3DV8oBG2//yk
         G7vqAjrl4tMYEJm0v6arRm97eavvorEL8SvYwlO9eZEKt6iJQ+tZahs+gjQugXMd6SbG
         g1TPhS3o3oESJQF299W4vr8dlJVwi3pvTgRzVigGyo+v7ZTojQz7j625K0cLCkIKEYix
         qiWojmlRhitwErqJmOD4f3qcW2dfbvmHt2avpQWA0r4m6VNqErxBGnKvwdCGI3IW+Hyl
         g6jj3vRfaHDZBegj74GRLgMc/yanyzaYEPeHaQUoXBDk0Innf/F8pBJcQn2xYszXTIao
         vIGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791516710; x=1792121510;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wEnLDH2m6lUj6/37jS7qDQEqUbgy6NmPp9J9mV/0Wfg=;
        b=eTJSNkj/mCSRYTZA2OBu587Yzz58KqET9oU7RVzgR2ellihdc5ZY4gYbW/Q6HzQp3E
         3O9w0Oo2hOri5MZbCohrgzG2AH8r0Ozj5Vi0MLfQGPpQEBc08yLMxPhRWM3c0SCcdpXc
         irEKiADnDkbZRPK3Y5ldIVlAzuGGn6NzZGpvwx4gcADErw3BWWo0R040pVMAo9uyj1VJ
         Aub6JRVFgcb7v0IVHrnpUOA3ub6xg05fDfxBfsd2H/6CCatolFt4wEx2OgWAGhtjVdcr
         QAMbWnBkyn4AFZBZyiQJC6ZgbVdFlZXkdDf0inFKmJovlfJslufT1fBXXrGl21UiQAez
         K0cA==
X-Forwarded-Encrypted: i=1; AKwUvBwQWLsZ4uAe3Na8gA4bQEcZkmVBwH49z8L3buZQWO95/PO6evsiO8stgWPj23nAjSf2F/eWD03HEbSGVEo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxzsRPXRkK4IiZINuaYkKV3dWw6u01glfl2oj+O8kgRqhN1FCz
	1QR/CyjDibMWEP6lYoIYW+iZNX8I3l7kWTQ8lAHebr1OgOiRqsIfe9+ynqSwbDxdCxXy0o6agyV
	eR/mXVrd1kRDaMEJ9KQlOBRzadEPFbudBRfRjK4oc+TQAl5lKem+8ObJafKlJU9bVqWc=
X-Gm-Gg: AYBFou1ILbaPqI1J+iZRn1MJ6OTntfytPUF4wpzIH+hg5RMpdxssJNOIGJkDWzgwIUP
	gg14KxU/VKxhBQfxwMwybYI1bCBvik4GHK44EeM33u+PERX61lMuD+vjzxUqXa/rM7cjo+Lcr85
	4AGKoJEry+iVR6vGiu/eBjSGtIF0Wr8yuxfdCBVNUqBoujlrbnt4XS0jb8rUn3sHwJjnnW6vVm6
	7w3re5sN5xpsuEd+/5kXlQRUzdv6Is3djpeYOu1Ug8aXigfl+DwJ7D6A+IPEa6nQOi0VOAbM+70
	FoaOM+umeRWN0K3f/l6sItTFHAelRiSiz11c6MgztgmkvcOpLzWPzioB3ScoGrXmgTAFxP6n5hz
	YwRCvYdrbNTJv5HG6/pHz
X-Received: by 2002:a17:903:11c7:b0:2dd:c100:a5e3 with SMTP id d9443c01a7336-2e842dfc284mr5840045ad.55.1791516709844;
        Thu, 08 Oct 2026 20:31:49 -0700 (PDT)
X-Received: by 2002:a17:903:11c7:b0:2dd:c100:a5e3 with SMTP id d9443c01a7336-2e842dfc284mr5839835ad.55.1791516709379;
        Thu, 08 Oct 2026 20:31:49 -0700 (PDT)
Received: from [10.92.18.229] ([114.94.8.36])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b1562sm2615075ad.34.2026.10.08.20.31.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 20:31:48 -0700 (PDT)
Message-ID: <bf446881-61bb-4186-96ae-cab428da6226@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 11:31:40 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 00/11] net: ethernet: qualcomm: ppe: Add support
 for IPQ5424 SoC
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, Simon Horman <horms@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com
References: <20261008-qcom_ipq5424_ppe-v1-0-16caf43e44ee@oss.qualcomm.com>
 <b3863c53-c97f-45ff-bfd0-cdde5bebb176@lunn.ch>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <b3863c53-c97f-45ff-bfd0-cdde5bebb176@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BfpNQbt2 c=1 sm=1 tr=0 ts=6ac86026 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=+dQloWKbpC4JZN4npCJT8A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=rCs85jqDWIXh2BF-714A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: w2Wvn_CqrfQjDn2AWR4RmaMO4p1TC08r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAxMyBTYWx0ZWRfX98lfxhMDjRZd
 OkZRxogrQE3jM7tYuK6/GIR7vLikKeW7U3uohxdhx7CfrjF3O+vMqrxvZ63hvbvF07MLbDAmqzj
 bQXFd4feYr5B1qkp7z9FXu2bvivxxZCEGRjY3hOIVptpX0qNnt7RmfVUMVDcH1ooPzZwNMxuc0v
 dmK14Yh5RhmUhgs64hVPeBUSDywdKbcr+whJ23tE72bQ7/6/QOYp9JJsAFc5di3gvQVmSab5j9c
 Vn1w///8Ah2bAo5yBEUCbmsZUgPpy10nEFZo5CaVUwnx1y2aHm0F2BAAzaSO0T4wYhN3OUFq9Nb
 k2z6K9cgfoK4hD9dOEJmj4WpfUkaWuspjHKb503ECHNq3iPaJGpHwKeL7sS3I+pFFu7b/yFcgcU
 Pe5ZzCCuOU0zrWgzjGunvRizIWgDC5ueI4V4piMEGnSfyri1l6nhwU8bi691lRg27pxDL0RdciI
 vrCBo2/ZmSFqFcrbUrQ==
X-Proofpoint-GUID: w2Wvn_CqrfQjDn2AWR4RmaMO4p1TC08r
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAxMyBTYWx0ZWRfX0tJ/IEp1AXyp
 M9cBt203nWoMpB/nXWbSk+08Df0q/2HNY2jwUvW0vePchfFxuYYlJqLaLuqDtZSB0+rIiwXzQbk
 VMl/c4wzOPfunjlGuGzaKEb65tG4Gvw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090013



On 10/9/2026 3:07 AM, Andrew Lunn wrote:
>> The first two patches are fixes, independent of the IPQ5424 support:
>>  - Split the EDMA reset in the devicetree binding into the separate system
>>    and APB resets.
>>  - Fix the multicast queue configuration table index, which is out of range
>>    for every multicast queue on both IPQ9574 and IPQ5424.
> 
> Since you posted these to net-next, i assume they are theoretical
> problems, not something which bothers people? Please drop the Fixes:
> tag.
> 	 
>     Andrew
> 
> ---
> pw-bot: cr

Yes, neither issue has been reported by users. The EDMA binding has no
in-tree user yet, and the multicast queue issue was found by code
review. I will drop the Fixes: tags in v2. Thanks.
