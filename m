Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793808060;
	b=tyLTXrb5vhN0uovEEXgEdEX6nfh7bojB6/M0fpR2k4g4TGALLAZgW9UzeJZ1KAKz8lmv
	 ULLfGXLJfnuSdI5ZT9akLhe5ZlCBjImR6VsIZjZDe57WgTCpP5SR4ibl110Lr97gr40I9
	 /Su5moJAkJgl5AaCSrFqcbLYpQOGTJH+pf/PILAhbdFSooLhhgxi4cTKwQz5PhU/fDmg8
	 1fzIDyywDgiJbFGwR/w2EmRYkyjVIBErAS4yF/RS0daqe1LEWysqsfhTfjyw0AoHBlOI6
	 HFWcCELm4jOtnwQDNLEwP2ZuBWy5ehrDX7zAq3XJSrHKYcKACacv2Zepoa2fj5SByug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808060;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=T2+TPF55DbdT6gwJabH431isQTzz1ZSRcjhP+pQhvpA=;
	b=QmUG+inj4Sh+pyM02VNZfKYSzzmk262cYipEionb1sIynSFx8PONp1MzDcqsFzVP5u4H
	 zuKuj32jHmUoU5baUgnu93rwddmsNmtyb9nhBsXKAZ3xu2tRpQwQ/IjlPYWUgQhgGNjwb
	 8tmlGHui+WXdO6P0u0eFv9DcQJ51CIxUC3t2MwCnEFq1CEMC8g4L1s0cnGd17Q5GKJ3Gk
	 ii33PDUNiU2jAxLX/HuDaOmtE2ehXvJmUVY+y9YIeUJg7ssVjchDhz+U6MwLoS/kCVniQ
	 F/F5DmHfa5rx0fJGBCiA3ypK43H7bOm2jH8zhkJu6kRvW4AzlEdgjaRVjmrY1ajwliQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z66ZL+Nq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FQ3iSrt5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2656D606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:00:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2656D606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z66ZL+Nq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FQ3iSrt5
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Fj6sO1149186
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 16:00:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T2+TPF55DbdT6gwJabH431isQTzz1ZSRcjhP+pQhvpA=; b=Z66ZL+Nq33OF21Nq
	hNQa6hnYbWiydHBV8apu90US4rEkmWHkMro9EHjfuIOLaXSa1VneqduSmkkVtnrj
	ZAzkcaF/pmZL0DQ94206yApfGmt6WD/9x0oZww8GNZ8PVnM8jSIbnC4MNtSGtb/S
	ikh4DTZ9lNWbSbxZ7tPm/0lDQakQakb3nOtTSiPzl4sSJcp55y6dFPXxZnAPUxgq
	+GRhCRe5SCq2PtBQsztmlJDozcmlrKRxWBL5DXuH8OOhBk2yiNm1Rn7Bho/fbSgK
	k5Ig9wpWqssmRqzpsLZtWFxIYp2W7jxiA0RvuHJopnkBYgjR/4R1BBrzengOLmjK
	58Wbkw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr3r813jw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 16:00:57 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1acbaf81bebso1225936c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793808056; x=1794412856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T2+TPF55DbdT6gwJabH431isQTzz1ZSRcjhP+pQhvpA=;
        b=FQ3iSrt5l+Gly3d/s9mW+b8J/QfiDHs1jFqxOmZkrtWARbbKQ1T0Xz7T+uycQacBty
         aIrjXK4cBHHA9BWZeP4gNlWDu75x3tdQpOwlwIGRpsJyYgzQHdKBCJJ07LezdEBDvrpj
         3g/r+5/NiUc9S/Ir2Y3Gq4E7LACvBcU1vXkanjL9KKLJGMnPfT4uap4XR3HBAGSax4MU
         RPDgLGfv++tYx6WYn7+Zx7G2KTqaFWsoEiNh6qgRuZavTGx/5DAMZGfC/iZliSVwme/O
         7hEXx5nsz+IJib5oxjKKjwwnnCzSF3RtGQbxom7m57DoEozNMtE+Ks3xoRt6bFJmAtWw
         E2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793808056; x=1794412856;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T2+TPF55DbdT6gwJabH431isQTzz1ZSRcjhP+pQhvpA=;
        b=ZYgiiqf5jc/nXU/pKGXAi/p5gd8GGf7K1edOiStwL2DoIxhydt5s1DXhX4ASoR1m9+
         oxm/EW1K9Q7NnwWv6mHHoe6OHRr8/1vzp47sbymi7WtKvVqwMjoCzqlDpb4rbzDSo/xA
         h0DZtPvwQ4oXvTa1vgiOn0rjF14LzcOOy70RLjXw2/AqSw1BAUG625MtfC3LwBJRSWLr
         sNcApL7D6a5f/TpHvBLqVT/6rf3WG7QYMDbKUIHGpa3y8mkrUDb29VrNUiV7UQj763o/
         HYIjaD9T2NBy6Piwjix7n/SwPtXuv9OZ2fA2WqVQRSwlhmf535IpC+IYfkIKGI6BgHe2
         T2IQ==
X-Forwarded-Encrypted: i=1; AKwUvBzfAplPtlsW23pQQFUXwkhHL4JXtN29ZUhFszyCApsaTgR4oX13GpKiYqLb3sn6DtI7tfXgN2G6/QAZQpk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pJmJtuQBtyOIiuJjUU7CNiAP3XGk2mheyswKJO4RncnE6tR0K
	DLlfg2tcJDGRyr/iVdkcd0W4cz/+4HMdWQWxg06VqcWwmCeEj45ehyBK1sjhcI/ytERR5VjLR6y
	JcrRoYsHMdCqEv3mxXNGw8Uk5L5ck6ElZI3+AriqdY5Maig7I1/p8TBBMblxsETnt5Ps=
X-Gm-Gg: AYBFou0oa8yQsi4Sy0yIhWIEhD+4JtJ98jLIQwEIdumgwWk8G2Npt3Nj9XNMotkvIie
	ctw8iu+rmYBu0vQBfRI80M7OJSsgLtzba+V0EJwdu6MQzwv3qaRzTl8bMjpr4vcRYYuNSQC1eIX
	6sK6nVWaVa+oh9EmNFB+awhfkitrWpl06a6KIBAZ2d5rwPRfKkRsjECHBabXMPFDiAJTcE9Ogc0
	7R5YH0AdmJ28xIdxv2nX4pQlpDt5XweKttwSWVK2haOD0IWxK5X5O9a58QlXmWBtzBZVCYYsrXu
	woqFTWbwr7UJXq7ohQReTj6u7fZAaFoS23w8NUpI+gX2orc3HkiFn8e2/9vsDgYFTNbe619B6hD
	iNEBchx9fOiQEE8W8dPKnFIBCwPlbVhyi7BkYZfa+SnBwITk4MeY2CjFiY/0BvsfO1A2pNDsPeW
	8=
X-Received: by 2002:a05:701b:4348:b0:143:6525:f9f6 with SMTP id a92af1059eb24-1ac5c369c74mr25241359c88.13.1793808056297;
        Wed, 04 Nov 2026 08:00:56 -0800 (PST)
X-Received: by 2002:a05:701b:4348:b0:143:6525:f9f6 with SMTP id a92af1059eb24-1ac5c369c74mr25241268c88.13.1793808055141;
        Wed, 04 Nov 2026 08:00:55 -0800 (PST)
Received: from [192.168.1.10] ([115.98.177.53])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c772fdsm10164081c88.22.2026.11.04.08.00.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 08:00:54 -0800 (PST)
Message-ID: <72064a9a-1b2e-4c24-99e2-2cc15a8dd7f1@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 21:30:46 +0530
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
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,glymur-camss: Use CSIPHY
 indices for ports
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com>
 <20261102-glymur_camss-v1-1-fcb619fc7319@oss.qualcomm.com>
 <20261104-real-nebulous-ostrich-017e92@quoll>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20261104-real-nebulous-ostrich-017e92@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nE8lmEsAaTkRt2JlB3z0_ygE9XP8Ss5G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2MyBTYWx0ZWRfX5onlWofI5yid
 tfshFbG3370YjYp7D1diAz07Xr/Usbpetpcn5KXHGMCnH304z3QzIwz5EkI7m09JeE/PD0TLtZG
 ui/YkjVg9iUPPvuAhPIoExUb0ZlW6NV2iccIczVrny/kNyhcLyUOE0/V27meJNb0OCcW25LoGY0
 SEvDusivymKCU9wNoVSvhrhP3p8yXLpB+ORb80sFPrKuwUO+tbl1bCd5RLO8m2R9vzqSGuDUy5c
 FdVWh2Im91AMYDoxbF9P7DkhDdVfqhYhbpA7sw4Pw83V51zy1TST28FPWCvgl7eL+3E9SB8u8pU
 NP1Iu11paqW/p6o2baj4QukcmG2IaJb5VzWvU8aNyQfkzH0gX3mf7QfYivqi3UwdsGiczBshfoN
 jVH+kWRXylltbincCBu48hXOaNWLfWEd0Lr1M25J59TuBVREP4M1u+6nfRPXimy3dXgDua0vOmA
 UzoDx+wNz+nc3RDYzgQ==
X-Proofpoint-GUID: nE8lmEsAaTkRt2JlB3z0_ygE9XP8Ss5G
X-Authority-Analysis: v=2.4 cv=UuP2pOwB c=1 sm=1 tr=0 ts=6aeb56b9 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=iaXPdgsK/hfklW56b25dCw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bxh7C7Fz_n5UA06wMvIA:9 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2MyBTYWx0ZWRfX6G5Q/55b0Wvk
 byIy74WpnY4E6AQ3ef2TnNbiGSdZnPjsLJYM0jpjAsMHhqKkuuzDbeTAHDs2FcJCYqI/Vi5IVUh
 Ie8OxiCrkPoyVhURiKJTSeU+yf7S/Lg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040063



On 04-11-2026 19:22, Krzysztof Kozlowski wrote:
>> Glymur describes CSI2 PHYs as standalone nodes, but the CAMSS binding
>> still models CSIPHY4 as port@3 from the X1E80100 csiphy_res[] layout,
>> where entry 3 carried CSIPHY id 4.
> You also remove port 2 without explanation.
> 
> 
>> Describe the hardware connection directly by allowing ports 0, 1 and 4,
>> and using port@4 for CSIPHY4.
> All this is confusing, why do you introduce gaps? What is the reason?
> Your datasheet naming does not matter.

Glymur CAMSS has populated inputs for CSIPHY0, CSIPHY1 and CSIPHY4, so I
used a sparse pattern for those ports only.

That is confusing for the schema. I will allow the continuous range
port@0 through port@4 and keep the example limited to the populated
Glymur ports.

-- 
Regards,
Nihal Kumar Gupta

