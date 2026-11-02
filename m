Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618228;
	b=3DRe+pj+LUKSYux8ioEdR7BxKSce5Yldwz0jTP/R2KiryrUtCO9tmOIHtuOyseIc3P71
	 hWLCiGWO3Mc2cBGHxOJf172b1Uxf6h/bjGM/fooSMfEBfIp+DdmBXD+x2AHLmqAOS/6aH
	 8V7Mqfdz7FI6nTZZKsBXZNB9s+aqa9lS9AxBdBWLfoFsGWU5XnawEFv8OLxdKb+zzALL6
	 X29Ywux78E+K66qUSe+NDHSS6i9TbrQNu8pdsSVyOQeuaG9m8pn56Gm93eAjhgmo29JEE
	 R9sKu6skkpW5q7/ttOQIdWnJR1PCnirBJLx/r9Z8W2nRrsjf7a/OH2IfeEZjkgGc05g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618228;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=s4VNs5xfUCjRE/cLeMEuZSzqF8vaZwaOOAaFa6QON48=;
	b=3pZZWw3nIC5GQj5kmY+BJMA9GJvgR0ATr/s+pqf6nIbmw9bdCi4w2m0kY2e7rkgk+OyF
	 XaakuOMtKxkAmtXLF19JBwgi6Ab3Dvsp1xDNnK0N4kIh3xxyovNsudQH69u/YHlyQV7S2
	 baC7ha28vQUlms0W3UwC47Ew0aj/BoSr/n0jMDQal2xecJLXhJ2ANu84eCpDVUGzvYwRf
	 I4Ke3AScCc1A+U9a/4amnu4NWGnfz/DzrYw6HJeSaqvWy5Lich/VbbWnt5fYkPhN0+f1Q
	 KUcrlHJvfoyz9nrBomJwlHGpDIifyiR9yPsHgyvOFdj/1i1QaS6ZQUvgAjgSSNW9ZrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="n/ma8ISD";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YPVia6Hw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75C2606A334
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:17:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C75C2606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n/ma8ISD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YPVia6Hw
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A1PT3402501
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 11:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s4VNs5xfUCjRE/cLeMEuZSzqF8vaZwaOOAaFa6QON48=; b=n/ma8ISDmfVg8B91
	6m2xTRUJ/nM7llmxP8P2zv8rgrvHswLZp8Kg+qnC1SklYm9LPnz4GB41/O7xdgxN
	K5VG+C425rWeahRAf1fPd81x9bZDVhn+F/3w+r38WlOmnoSQSJDhONRgjnaUPbwB
	0ZUvGlc8Upz2N3AQ2JxzwqpRLKK5tly/okuREx1n1aYBi15ig2ghRuo0+u0HGOf2
	E2BTgkFcqt0UFfLIAR+q73VBWOvla+Bg8z5Fa6ak+0VlJloV8kzX8O5b/dpAYfmF
	HISGdt7us2Cf3K03Uak0vd/VZh2qqRQVALtlbBpZTBJ2D+mRcDWC29XV5fjkVmfg
	Q/EvqQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfe8try-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:17:07 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91bf35c4c78so6587096d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793618226; x=1794223026; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s4VNs5xfUCjRE/cLeMEuZSzqF8vaZwaOOAaFa6QON48=;
        b=YPVia6HwUcUBzzQXlGvA10Nnh6UeVu3+JAuijIpsrpOlAY56kbPmcimcckasss/bqu
         XSCeUHPuVhkE7AJTnJuVkfFhR95tNmisMk1FbYxHe5Cytt0kTXJcPbQHA1TFgz5PL9aL
         j4NKDawMi4rfuQWr5hVFyfNrvYnlmeFnwnErne22Fdche7Ksxpr6rjid0Ro4JNjtXjch
         4JzC1BgfHAiQj6/u/+KPBz+AlUxWTR45YKY7fNeDQHFu1A6xpsN3oPKJibH0lpa2NpAR
         TxR7lnlZHlD6JtbLiKBDUxXi3I9L4Mzivugqfwjr9DcOAoDkvHMH8P8B/O3YToHiqrVS
         bo7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793618226; x=1794223026;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s4VNs5xfUCjRE/cLeMEuZSzqF8vaZwaOOAaFa6QON48=;
        b=otR2z+i9+yRYT8U+JO0O86cih2Izt73JzxloiGc0Ki31Mh9lbQ6QVij549hLYOdRBN
         J7W1bzKTpJIe+JuAIICJiQpwIrnhHj2KCGLrtcNcsevGyz1AiHorhBHkSU1X4ppp8GtE
         F1sXJHzE4zA8zowGXjRXILMJBJTgV3WfWVCgZRzhLpB3G2v9RhKWZEyy+2aYW8hmexJH
         bW58pVgQfzDvgARoI9DaiEX4wCnE/TYNWnYTNg1aPoIM3lCaNJnwFqiUrnndyKoirmPx
         w5aLtH+Jbu2s1JjDmMs1eLL8c6fd8uOfky9q/lZ6gA/YgbHc2HgXrgzUA93Zsn9mbppn
         BYDQ==
X-Forwarded-Encrypted: i=1; AKwUvByMnIWvgokJOV2bwwNcCw2JTHrocVqUY1xAVVMYbeENFiB5bNakCDW0uo70XeAJxF1/k4llw+y7h1e3zD0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfKez35oub72SSISqXKH5hlmSe9rtJBG9E/AxJ/blhi9n3pKff
	ThjJyKwrwH+xWzjjf09/HYX/OdjnlVerkmg06toFbf/X/TmzHcie/1Rgoa2LsYxdvsals+KIiPz
	DK99KYpMI3Uf2181j98Ce1FTBB/foE2XPp93hDC/V4+n0CrSCTV7VPHE+hO5L4Gv1VYY=
X-Gm-Gg: AYBFou2s9ldLCie30qSbeKDQJxIvEGBt3JuwO4/+BnRGWWV0OLvSoQ8Bv0O+Own0l0r
	VLXw3HNBMQuPkgf+JeTvoM4N8sBaS/M8gEHwKtTG0ssZMyKSRW14epMCwL7yZ+HPOyhxYOuSAVc
	MNVDk53e7oU4aCxu+NIKXoN79P7nEarM40NaH8ymAE8dgsuhwrfBNLe5iuU+wTb8VUZh/tz6L/a
	pIV0TLLqlShV11SgYVfqAqt+DjffSuum5GJ4anyc/owkqHJdQnZQJ3a2a8aES30g6pEfD3a3dLm
	IAFsYIc0uyabZBOZlXcAtEuODx6EsnjVqkgn6Bf+KazU2/sp/jN1ki+CNt6tuzBezrJVS8BTSUS
	Q6LfQtuoMOK/rUR8BTuC0VoBIlbx4yo1JCr6rCZ8ueNn9IvwS8YZDUqNTKedQnTuUWkS+fTo=
X-Received: by 2002:a05:620a:6e46:10b0:939:c7d1:7471 with SMTP id af79cd13be357-944216cc78bmr1532711585a.4.1793618226097;
        Mon, 02 Nov 2026 03:17:06 -0800 (PST)
X-Received: by 2002:a05:620a:6e46:10b0:939:c7d1:7471 with SMTP id af79cd13be357-944216cc78bmr1532708185a.4.1793618225658;
        Mon, 02 Nov 2026 03:17:05 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfd249sm375857566b.20.2026.11.02.03.17.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:17:04 -0800 (PST)
Message-ID: <ec20b3c8-e7ce-45d5-adbf-4d2c917940e2@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:17:03 +0100
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
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: milos-nothing-asteroids: Enable
 IPA
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261030-asteroids-dts-updates-v2-0-66a56c537749@pm.me>
 <20261030-asteroids-dts-updates-v2-5-66a56c537749@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-asteroids-dts-updates-v2-5-66a56c537749@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae87133 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=RBzhS24iIX_dIUMOZkEA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfXwpUeH3g0S5jr
 FIx57DTy6KjKxZ2/Cv1CyUQFPPdHaXhx7qBRDM/4hHulpjrNtvnx0IvAhpg2W2HOKoyauuVaVmc
 W2KChhoXKzMH2Sbzm8M++rGWqjvIS0aW5zOkiXlFtnv79CzbZmdt6xVS/gNpsWzywFY6kOuj/TM
 E1+zVBX9V+oXtgZYbxHNqEitPJTNXmxQb8i5h0RHeugx5dGcs0x8IXrRC/E55c1PuZ8VcYoX85G
 jgkeEdnlco3DXp80DfW63ZBPyfMoSDINYh30xLmPDztw60XY6PNxhHUt8Dr5x2rIojGU4HSwPgc
 3tIi5tMhD9m96KfKQRClvFJv/CQRj1aBGPp4EIpYE0/FmPlW52N7fw7urhtGp1uY4Pt48ANeu5T
 9UlNVjWY8W+Wso75RYgO9ktWxw4qcjvzimjlhEewL9js/IYloMUtsFg10GKEVOlvTWJyerA3dDe
 DBMsPQc+HYGvH5Br0VQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfXy7r9WuN0Dz62
 sW7OfPeDnomICQT3UtAB9xkZ1DBHFlPbytvM95jatYvep/v3fxrwL3deUQ3UVvrgOAGLh/vIw6G
 0BGFgc/lvhuoS727PcpNP+InQzFCrko=
X-Proofpoint-ORIG-GUID: VzY2q63DIJmbnuPewFkLXy-DeI9pv6FA
X-Proofpoint-GUID: VzY2q63DIJmbnuPewFkLXy-DeI9pv6FA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020044

On 10/30/26 11:41 PM, Alexander Koskovich wrote:
> Configure and enable the node for IPA which enables mobile data on this
> device.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
