Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DB0471CF8
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934600; cv=none; b=CcZhaINegPp+l2dyggFUgsKroF0DVOEMlbKtTE5irL0kBQ7ebGoOqJuwi7AwnrcoaGxvuuCENVgFzn1t5LaICSZFVJtvAgZGQ6D3qynjWci8dgO0+66vGVj84BfnTcaEGsjofPtzIDOA1b/f40VqVsFJQpDXYpPWZRCS7O8KEBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934600; c=relaxed/simple;
	bh=F0sLIblX1LwJTORAx8BzwbeGJ13SNRyBB9uu3B0ACqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hnRggiJDYIgr+7ywg96uvD5Xahp3RpTlFXnhjS3rhtJ4OT+yN2mjeQb1dYNkn71QT2cafbDk4C1NqvtcpZ6bf2wEHgBLtJv6HOlRGTbgc9kEQO+1LZue23fN+CgXRmwwkrCBbHvAw6pfT6GwDP9tHoQDhJ/9W5SrF7S1VKmQ4jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KoiWOYmn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UOt9+GR2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KoiWOYmn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UOt9+GR2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929nYta1177630
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 09:49:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mR1Q5bi6LOaKz+4z5fzw6s7JS2c3RQ3jTLLJoeWChao=; b=KoiWOYmnTOOnyP8z
	RrhIaArb0jrf6yayEb1n4SR8GBKjw6fraJDTuhHYU3+jg8dnvpV/eDinoeLlHg/j
	TjLrhNdubY67/GIagsabNcnVmSeg0L4nM8ibHwqj85rYiAj/tWrq9/QzpAQ9FczD
	6pa4Ql3ODOhSIgYhbgbdA8b/zXiFYNJtDJbUbIeWlW5HWhgpUUr3u6PngQF77HJR
	ULilbTQo+SGSTovr3IumjAYe5c5O/cdUL0zrVYxqGeQWurUKBHAjB++P6IxSplWR
	cnP2OD1UAqh/SeVAUXYPr2LTH4J6tFWWQ3puRMRW0mP2A8JaKUGA5Lyky/tF7Lta
	8ETD2Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h20nfss7s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 09:49:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c26012cd0so149853671cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790934593; x=1791539393; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mR1Q5bi6LOaKz+4z5fzw6s7JS2c3RQ3jTLLJoeWChao=;
        b=UOt9+GR2XeUTP6NwpstOTy+w8O1e9VayUk0KCcqM/Zy3eGBlfI5uxb8gCl9hYUuIht
         +HvT1u6+3tTGp99OS/m1urynsEiQrBf33nkPGmOnf7gzNTU/0gm6yGmwyqnA6PbnIYEG
         kOj4yyOr0jKkI1AImYNHRfkznOSr/lCEC5MTJeBDviirRxttnCR8vCrLLFmUE0xkpdkx
         MnNKRJIP0u1okwnYoBzkZwe2fn87Cvr4FOrfw57MVScHEEyJvfG63vJrl2VTF6GYH2Xd
         9dp5hx9GcHsV50k1Z5Mi6RJTQArWoZwz4lQnv9o3W2e4sOCXwFBQH0kI77WXsgxdbA/3
         wx6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790934593; x=1791539393;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mR1Q5bi6LOaKz+4z5fzw6s7JS2c3RQ3jTLLJoeWChao=;
        b=1hmehgtM2t5r7Ys4wWE9sKCHMaj16O11GB3oDwMp4J1N+U3V5ck68OLYz8Elzj/dZ/
         bVRk9n+MqjJfxy1mxoTS780utRyO46QbDy5fKJAQanPLNmen591coPL2OB0Nl87j9Ar4
         1iSjVCJB+K6Uv48GN/MKu+4fuwkAqKrah/LOtnLs/WJPbkKGmBkvfB4c2Bi1GxF+IPKZ
         /QYj3LTKyQYLqLDCYoi/ideqpGyyk2F1ejPe9O9VnjV5xCszut9wTlLiTiUYbo+MQ4TS
         khfzMnEPXF+B0RpEEYJlNLQSomg7T1NAH0FNNTGx724JSpT4NS8dv/mHvCzKB3GWPLd3
         Nr2w==
X-Forwarded-Encrypted: i=1; AKwUvBznUfy2xsIplKmhy/iXX7xP9UZMB3iDbubgwB6o+8h3+G+AnubPwMCcp7QUSvYrwrvDXN07h5uCmQFbx2Y=@vger.kernel.org
X-Gm-Message-State: AFuF++k2Ntq+wsPHfNKBEkGAwx5vY4C//LrDkOru1Vmr8t7bwHKUm+xt
	ChKoWAsUfWkT4PINs6U49n5Y93VX/aY/J0YuU4CLmf4bNNQyjOEtX4qPbcn+dC+agFY+/dNE6YN
	EyL4Ti1IMMVC90m9UUa5YjPDzzSfh4x4bochwIkwUJ7E1iBp1G4g5TBQ5/cnZTMkeQ80=
X-Gm-Gg: AYBFou0qg6DYZr34HwId8We1kE1dtNuxiAmKQPRvc8SmIwmqwLNDGpF/10D/pBBVjz1
	cfTkHWiFMejY8QVRGwIwzy4tTPTgOAf4JvVWSGajcTadSkggqM2b9g3YCKDSGcO2Bc2wR60i8uE
	0FhS/QGlR671Dm1ZFfO5pMPeO+QcFhYjDWhSLHPnW2GnDWLw2FrxI/X5okt9OFHAtpEnDZtYdIX
	BEFbzaNGK8RD/WcjICGQ0rnaakWnH3Bda6v4hU9EyeY8FHMdppzW3e7DZXiLtuXyJbmbGD9y3nt
	aAU/J7cyKNzcuLD7US8Bb1Q8ers4pDuT2g+P2dHUDxeutYTT4ks6jftHTm4mYWx1XD+9lvyZhi8
	djE0B+G4bnPdT73oxuVPcu991VKgyLmGYcL4jxJQlOWihoFEH5XJXKbhHWGXKGw==
X-Received: by 2002:a05:620a:454c:b0:93c:6abf:c8ae with SMTP id af79cd13be357-93cf1791c20mr326873985a.50.1790934593207;
        Fri, 02 Oct 2026 02:49:53 -0700 (PDT)
X-Received: by 2002:a05:620a:454c:b0:93c:6abf:c8ae with SMTP id af79cd13be357-93cf1791c20mr326868685a.50.1790934592654;
        Fri, 02 Oct 2026 02:49:52 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:f14c:b716:c104:4712? ([2a05:6e02:1041:c10:f14c:b716:c104:4712])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b82253e5bsm3914595f8f.1.2026.10.02.02.49.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 02:49:51 -0700 (PDT)
Message-ID: <8eb0b435-e5d4-4429-a807-24e15b0659fa@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 11:49:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/4] timers: Add support for RZ/N1 SoCs timers
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Thomas Gleixner
 <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20261001082225.125956-1-herve.codina@bootlin.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20261001082225.125956-1-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yCbLIbgJr-VPCC5H1NlajJOC0q085kEC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzOSBTYWx0ZWRfX7DF9K8uvULDV
 S2BCvLWk1z7hSQx/G38zxjrp+tO3uYhVnRkZ5uR0ok8h+PGC8MLxQQSTsLpmoKvM77E5BaGedsL
 /gqi73Jp6Qr4b8YYVhRLmyU9ZZNW72M=
X-Proofpoint-ORIG-GUID: yCbLIbgJr-VPCC5H1NlajJOC0q085kEC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzOSBTYWx0ZWRfX6jCu+ZYfCfRV
 /7l1oOo9fqOnzQ6m3dNIPrnnC/WAjB6tWj92haIQxiz4P/8JeKAhVnoJB/LVKSYaedB8G04VoCV
 sLE3pA8nP3rln7k+AL3QNxQz0KweJ08n0+h0o/zAyWAAntGuFyJq62bC2hodsAupTLOnX0voebD
 zWuiXOOPVcDxLJp5Rxjw6HdhYbXBcSvEfR26cHPOSYtR8ptfQ33NMBmG7dTi8OyKs0qoHql2bvD
 KDZubxHlvz+ENQeCgs4leRoOOGF1hLtS9km/uHgdHXhj9JhFF4pg8Olr91j2F97fsgicfm/KaoN
 namYizlvEq1JV+xtwapwrP+3OxiFk8/IWnBiW4ntfCSLFZdHUAYJy7cVhZtLlaObl8/poUyLM4c
 FdoUxZhghGEEoLCrP1f/dezwobnkM5cEXMDE0r5wo6BP590cN8Ut4Dbh0nHkiPrNLCpjUhq5vwn
 GlMtmoC3YJHhkGY6TcA==
X-Authority-Analysis: v=2.4 cv=f+jdl+yM c=1 sm=1 tr=0 ts=6abf7e41 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=v9AyLkvIsLCxcgOLbSsA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020039

On 10/1/26 10:22, Herve Codina (Schneider Electric) wrote:
> The Renesas RZ/N1 SoCs family has two timers block controller
> available.
> 
> Each controller is charge of 8 timers (six 16-bit timers + two 32-bit
> timers).
> 
> Each timer has its own interrupt, its own prescaler that can be used to
> divide the clock by 25 (timers block are fed with a 25 MHz clock) and
> all timers can work in either one-shot or periodic mode.
> 
> This series adds support for those timers blocks.
> 
> Best regards,

Applied, patch 1,2 and 4

