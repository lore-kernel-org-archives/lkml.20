Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793175968;
	b=yGmxMqZCPhjBebZD0aMQ2tJapeBFc1HN0ZsH/2GSLzJMIkFqUs/SykmRP27SgTGYeF4T
	 w/AYRJQb/HxfCc1WZcq7fskYp/Sfx5vgT+ngevdZD5GNcFo4gtgAnK/C9fBnRF+tX8UDp
	 SiA+2CWC7keb80Fn1e3iA1GA7hFeGg0Xc5jeuOit0e0CLt+ni5ezBvsrZHg1zH8XSooUn
	 XosZ0cxguDW0Pgdu6ni/NI53NjOSpd1YHGX+9FlrYHtCPk1THkJuiJ3kE3Hr0wdG0BOOa
	 MygYG9gPmZzhY1o039syPxz9ZYsB6TtA/VlqndxiWl96R4XzXZajUeaPM6w0ZxzknHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793175968;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sf1TWW/3HG4QfIaVTVwxXEcF5anGYYDsxbkX9aPqTg0=;
	b=EJvDUMerF00T9NdQc/mZ1jmQRc0+J+zjvkbOK2DD6he2rcoufxVuihWJEu/2NKrubvd7
	 Ln/S3X2VI73r4nB7QUBF8/kd7ozttKthaARGhSC04Jha36sRmy5jGNhDiiJgMywQhzchw
	 4zWgcGvaaZskzI12i6ooLnBhUGMN185a+tKRHdiiCpSY3p4BPF7p69f7SeZOYD+H4laad
	 ikY7AKzKAfUdkHSD25kIEI0rSQ8aTcbk+8Kego/oHN2EFPI/9htJekxgS0p5HSy9SiLwr
	 jgpm++SHYrHfqo1NwgaibhEVZoV5TCfqbV6TeX2La4hPBzyx1d9jciGkYB6ctwKq95g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BZZnV1Ho;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RSUZGCeL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE475606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:26:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE475606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BZZnV1Ho;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RSUZGCeL
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8KEuT3718412
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:26:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sf1TWW/3HG4QfIaVTVwxXEcF5anGYYDsxbkX9aPqTg0=; b=BZZnV1HoTJPOHFH6
	lR8CYjd0lI4eTFGocQe+uV2qoM+H7Y8hMQ/jzFxDJ5MFHb4IwTtFrCcfsng9hZbB
	XFVxHXEIlFSYU9b7XpV9azCkHjuHXqe0S30b9UZU/g6NJzoebK2fVZ31uruW9X+k
	4OFfzMt9nxvasYdjxmyVTbfdZc4mI6cVNU8P/HrQ+hvi1Y7MhCRkkIyolLnp4Wsp
	QdeUlVP1s0OJCLqqj6oj8xmnIFAwHPvgZnFaudTrCuSekkl7HIjJSgy/UUk9e20p
	9IaReO+fXZs4oaHOogiFzx7WGeHKuznPksEqW7SJjFTQRtFq1EJRo8Kul4dQ8D1X
	5frejw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjux9c6e1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:26:06 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91c7a26f892so15815896d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 01:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793175966; x=1793780766; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sf1TWW/3HG4QfIaVTVwxXEcF5anGYYDsxbkX9aPqTg0=;
        b=RSUZGCeLaes7MgVTDFM7q0MfDup68qvgyXoH+yHQfkCKFD/I0vCeO3Zfz26v2o5caM
         vJdm1wKstb5TpVzQ3RGFn4FgIpml+ly2xQkLd7neRZ90R66FuZRiCUkVk6oHc4AoMtNo
         rxZTxNJXbxtMjg1GKhOWr58/l61eKbTMufDUNuNkBoKmrWPSFoN0NBrwZPNSYJh6t37d
         gGP2Rwc9OndEumYHFHkWAZLmZr1ZWZOp0OeEepRI2hsTHeeNzak3AKaeJiAOSYEJjeIk
         1mjE0zx6DeU054L7frxW3wIltpEFgNY+potq/H4gwnj2iqCMkcSx7bpWAM1blZKDHPWF
         JaYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793175966; x=1793780766;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sf1TWW/3HG4QfIaVTVwxXEcF5anGYYDsxbkX9aPqTg0=;
        b=uv7kMWkjlr6P67JIw77hq29xQWHZj53UKzIRimBbS7HvRnQeJ5o3XuTDPdaJAxHtus
         m3SIsQjsYR7s0cjZNsc0fPkJ2qs1EqjLVpoliSOeYyO8b7JokqOrscXysSbQWYtpQ2M2
         i017jwovE7vPnuV370ZJu3Tt2dFcHeFk6IZvdkmguXn8NbJzxrJn3sgVvcUWd0wQ2FR6
         3lVRans140TQWJPq8D2nDzINs3TCM329g+LlgUm1ODvAUJ/5uxQWgwhjYgAy3GjTZO0O
         XOLSlH7h0yaLdIMm38CWnbIxcxDNi70XSTE2kNIUVxjit7zCd1JG+iL927glQR00qIMt
         BSoQ==
X-Forwarded-Encrypted: i=1; AKwUvBwwj7Bh9UcCYNseROkZoYHsl5c9YAx5caIhX0Sy2bfz4a9qUWeX2yHmCvNydy2stpdEraVEF7O5Z3xEShU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0AGQirdNacWznHyYJB+++tkBvycTy0YkhnJIEKSrsGsdWz8Nu
	jHPUfRntr/QcBGy8CFNrsGqVJmNn4HiW8/YfD1KMelH9CN2sSI8EUwyLxLYV1J4+q9FJmmgG2iM
	tpk2ovcrJjQaOQENgr/cyW/fCT5BrLgWnXwbATZijs9Yvr3Ddd+2ioLkOvgVM3+NWxqM=
X-Gm-Gg: AYBFou2AQs6oJ0FmdiO9pa1fYAgW5ojtxu/8D+RRvy8FtDsq8JSX1J3FcluzXkqPbt6
	Uf9hpj4nAFKUl/3Wif+h/1P5BxXWvZcEsmgUwD3SmdfpHNo8eG3OCpFKjJJAk3LfR4vLHvOkNFc
	hx6P1f5qgvaD3Iva+qYx5+B//3zkSHjg5QZfzR6ddMb1pGeHhf/qWAzC4Fx5L75Fz/At9hq5oEu
	WI25kCR/idLTmB2uLaJK7uJ+11O1sQjMVZxSinmdcGtMTd2rLw3UWbOhyaDSDWq/rr5h65dcHUy
	ZRB+TVrqYcs3rfLIHVG/Ycf4F7N5C5cdWaSKF0an89hZFEXpP4KP9X5PWI1ovEogtx7D2FNZQV+
	TcQ4gPUDWcl6RhwQkoeEFE1tOVrKlvNLBcAeJTF1g4LT7ieVZWbRjmjYp43xP4lMsxD/3tNyTL2
	w=
X-Received: by 2002:a05:620a:198d:b0:936:df48:d507 with SMTP id af79cd13be357-94408a26947mr214979685a.18.1793175966264;
        Wed, 28 Oct 2026 01:26:06 -0700 (PDT)
X-Received: by 2002:a05:620a:198d:b0:936:df48:d507 with SMTP id af79cd13be357-94408a26947mr214969085a.18.1793175963800;
        Wed, 28 Oct 2026 01:26:03 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97c9f1403sm30752595e9.9.2026.10.28.01.26.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 01:26:02 -0700 (PDT)
Message-ID: <4ffc0e05-f6bb-4b3d-9281-1930a1d83da8@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 09:26:00 +0100
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
Subject: Re: [PATCH] dt-bindings: interconnect: qcom: Relax child node name
 pattern
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Barnabas Czeman <barnabas.czeman@mainlining.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Danila Tikhonov <danila@mainlining.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261028081243.38562-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261028081243.38562-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GYyCDgXL c=1 sm=1 tr=0 ts=6ae1b19e cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=DKZtW8Xn8zsu_FwnbecA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: tWLNaJVf2HSOyjZDZJ_JoF24ovtYQE5d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzMyBTYWx0ZWRfX1BmrTlfOlz2S
 yjUXzdeTnVNURVHpLylxF0CJCvb03IoIJR/EQCmf6CFVzTcf+QYzsTKDBeOooUIn7TDYamSZd2q
 E1f89JwfNpybmFWYDTW4f5JjQtFOVht827TyOAgfCgy82PwM4/l1up9gP09MyrUpETsPVMRi67l
 YtV51jQK3m4VDeZmIs3/sJUGzkyDWY5/A0w/ygtWCTgfPK5dc2lMPVdYgcCYR7iwTJVGQV4OlJZ
 YNiEOjk1D0wVrl8xEEXIHgL5O0AaITAhuc3SCnVK+lqpTPLpxZXVpID5YgnhLB+Iwf7oAasw/Qv
 059YRstLA7dMalwp92zfbzMV0sJm+caABX2GCcDtLat8WFpO2aDC0vZauTUYJAtg4dp1lo/XVd0
 ca6Mb/iMgaL3e1Kfc22BkDMLEYy6lTvE0ywHMaGhxtsgQ6NDM3sKhFNDXvuPzDlXK7azG2Wox4m
 J+C2ttwuo91e0MiYINA==
X-Proofpoint-GUID: tWLNaJVf2HSOyjZDZJ_JoF24ovtYQE5d
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzMyBTYWx0ZWRfXyjGOW1ZGISRY
 yTTbHRZMGxYPfFWhUL04H9zJzu1R7sGuK3Pm0jLeT0O3FiKSVX/s/TAzQ2YsGQhv4js1iK3qtIO
 nY3LAoIw8IzLBGDMzAI7vgCa10UOPGQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280033

On 28/10/2026 09:12, Krzysztof Kozlowski wrote:
> Some Qualcomm SoCs interconnect nodes have a one child, thus that child
> should be named 'interconnect' just like the parent, not
> 'interconnect-0' or 'interconnect-foo' (see Devicetree specification on
> generic device node naming).  Ideally the child should be just a
> property, not patternProperties, but that would be an ABI change.  Relax
> the pattern for children to allow the correct naming.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/interconnect/qcom,msm8939.yaml         | 2 +-
>  .../devicetree/bindings/interconnect/qcom,msm8953.yaml         | 2 +-
>  .../devicetree/bindings/interconnect/qcom,qcm2290.yaml         | 3 +--
>  .../devicetree/bindings/interconnect/qcom,shikra.yaml          | 3 +--
>  .../devicetree/bindings/interconnect/qcom,sm6115.yaml          | 3 +--
>  .../devicetree/bindings/interconnect/qcom,sm6350-rpmh.yaml     | 2 +-
>  .../devicetree/bindings/interconnect/qcom,sm7150-rpmh.yaml     | 3 +--
>  7 files changed, 7 insertions(+), 11 deletions(-)
> 

As Sashiko points, this needs updates.

Best regards,
Krzysztof
