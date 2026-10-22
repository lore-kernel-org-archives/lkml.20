Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792676791;
	b=i7E1Yhj6/5Wz6wYk9RYvUgptkweibHpC0uf6zAXOnKuIbq1PHt7nVIwiK+z0QZgY63VB
	 VvOHyIlIutn1cOzyBnRcXNV1qMqKgo9XJm9jkdGUgsajUqsBK5UY/5qXKaHAmioRcjRI7
	 0pj/CZgtgjwPEqwH49d5Pa/2XdbN4+ieBTvRvgSdEDmvLfKBZvU5/SXn32T1Yxvhfb35J
	 sLv2A5hNHNuZ5W/VQq+JjtifL7wDTNdhoAlwHsAT4Xthovvlf9x3vyibsZa7/iZFMAzh7
	 jSVlIP/ZOHcF6Og6/6T/BSxFEWie2cDnaBvfIJMStaFNtL4mU8NO02bFJY1126p6GGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792676791;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=u3Gda1su23Ey/hn0j+qLFhPL93ioEvm9bzh55nNkACg=;
	b=gKDunBmob7/9iATqF6obFJzjH2tUrFp6KkvVfE8z1xsTtzZkYoSaN2sWPHSBvKa3erVt
	 smuuQnbKK4IvL5mOhx672vJnVxhhPZKkZezVFCfpOsdN4zFauxJRzD70Hc9oSj5RAMlpr
	 D/fjWiLDfIConRMLyRQcWRVjjcG14J/hCS+fDg70GtT+IPAPY1z1fvDsXF3tQmAbh05bP
	 +yBs98iw84iPPogZK0atqRIHdILDzxt3Mdoxa8phlxVRJGIvZ6oLdgsOApE8huvOAutJU
	 KthDhF93knbIzgno8zjHSsAdUvkMCuN2c4a0BfHFGsPddw/kW/W2P1FDnYhHpTGxKpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TnHyVIPb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QlIU8GpW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB23E606AF42
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:46:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB23E606AF42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TnHyVIPb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QlIU8GpW
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA094A3115688
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u3Gda1su23Ey/hn0j+qLFhPL93ioEvm9bzh55nNkACg=; b=TnHyVIPbHvd9bZx9
	pBvv263KXsQOS18ga59I/Jz5ZtK3f5TMDysjv3rvSWUl+HE6SsMciXn1Nv+sFP3V
	7D2eHHujZhMNyt2ymsESg5STQO7tSsTFWGgN64quCzc5uYDQ93kJczMFRppyReth
	Wa6Hcb1EqoSoosP31bU9p/SyQM4S7d8vz1y6FOyHPDmE8cvJyYZfbH1lsJzvA5aR
	ei83ABHUOK0qKVyerIVaZ7hP+Zs/ccB2eW/pGsuZAoja6q7iEIJ7eqjqjqpyicet
	Qfln1gaAoSb6+EdWUTNmMgfQ9bLKgFfnkVOcYmjV9lOpAV7bNpnJmrGBcVrJwG/E
	hohGxw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bv027-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:46:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f3960dca5so55138085a.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792676789; x=1793281589; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u3Gda1su23Ey/hn0j+qLFhPL93ioEvm9bzh55nNkACg=;
        b=QlIU8GpWYU7VsTIhBIZLgldpB20lZjm3hmu81j1hvA/N0L26HADj077t/y0hKVQc6w
         t8j9sBR4sP19Z3Uv3QwJ7nFEtHZ5Sb+8mZKy5pGNtffBNoTw3hoCTES5zgczvLeXam5c
         bO0Kn51ZFD715Qh7/XbVO1XAMZa5/a4rinpTmtqRLW96+iiNw+51T4dKgDduVgrHPMFt
         1TvntNThYW5Bh7wDGfkRhCt8+piDca8s8fCMUDkYsd1GKr6BYvkIK7SZ1sIrPSDCOFqE
         SIkPBfGd6mOYN2fjs7owQFmpjZn3j6bbzbO5fFKJadJdgcUjG+KgUjKbVqdJ4+Fdxh70
         Ltbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792676789; x=1793281589;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u3Gda1su23Ey/hn0j+qLFhPL93ioEvm9bzh55nNkACg=;
        b=HQFq563M4toTn89aCvTTJ30xn2jXV6EXCMxymyqbg91fgx41+5BPhNc9lsBIJXwceB
         ZFrsEDvBh2Gds9ALGzcHaWltxR7iN7sXPJjHDp/GHfLp9FnEYcwzwVF9cR+zuKfgUs7g
         JHAeEfjWzQjdX282UhPGY2HRDO6/s8CJIqAmYicTvz98K0hgeHdfw2n1hnJC3kr5i+2m
         rNTe0WpKwkobLNgLOHBeKmebLk5N4LbIlWBemPxJL+0x2S2lmctOCC624mybx6V//vQ3
         y+bHXbOuLohL8S3qBsitn8ktV50m95AGZAmOPF5Na+WTlpP6J/YbohJ3kNzuMgiyntA6
         V0YQ==
X-Forwarded-Encrypted: i=1; AKwUvBycxepND44bnEt9MB+IvTMUDccw1jEN2Gjaa3blccjGmBzZ7SSZ2jmrS+HmCNh6J8xPxzXnD+ePN2VLzJs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJsTsG+UYNeYQRI6+44auRrEST6niVAYSATiY5npqfKXXyQRBsA
	u0oy5kFpT1o3ftAhxSwZ8Ii8zpdmdyHUKVvrX3w7y6N0TuXD52PVHBbhFzHvNdjQQJKi0dbgja3
	7f7xtkkqB1ADih4UwQOHdJ2TsUzk/R0sJHQrTZ6TA+kKLHKf3D+DAaoXIV/+GbBt6GVE=
X-Gm-Gg: AYBFou1C0OHxQ1adTyHmXRW0LS49YePy44QqRLtMu9NhdwGTXUYZfO+VA7tpZpuUxk+
	pZ9ub58dBzkm4Gs9FGMkZxjr4RqA9KYZBC1tyXD6lQE33rUxvspbJC1BWzykTvcGDnlk6AEPeLC
	FFrnrie98xAWsL80iyWiKoSHXsEpNRjtxD7TvFFepzQ9XQowV1qJidvtS1mQ4JTbyLnEMnJixmV
	z4lKJz5WXZ3ivHXVc0zX6wJu4ckoeCMKHgyulBuY3fb0nUuVgux6fGPiGeX4pM+pF6opc0iyFNI
	smtEfaaGX8Ctt1g8Z8oyuvquW95E8FBF4eerany7Vz/j98XZX+etM+GHaiyv2z3T9nm28Mt4sS2
	D1c1qrC/rxc+foUDk9v4nPQ==
X-Received: by 2002:a05:620a:2852:b0:93a:1312:ff19 with SMTP id af79cd13be357-93f57fd982amr1113275085a.5.1792676788770;
        Thu, 22 Oct 2026 06:46:28 -0700 (PDT)
X-Received: by 2002:a05:620a:2852:b0:93a:1312:ff19 with SMTP id af79cd13be357-93f57fd982amr1113270585a.5.1792676788371;
        Thu, 22 Oct 2026 06:46:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a56082csm106605366b.40.2026.10.22.06.46.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 06:46:27 -0700 (PDT)
Message-ID: <a7114c6a-2ce4-4e16-8911-d5459d4bb362@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 15:46:19 +0200
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
Subject: Re: [PATCH 3/3] arm64: dts: qcom: msm8916-samsung-j5: Add proximity
 sensor
To: "chr[]" <chris@rudorff.com>, Linus Walleij <linusw@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261016-iio-light-gp2ap002-v1-0-7c93312fa8d5@rudorff.com>
 <20261016-iio-light-gp2ap002-v1-3-7c93312fa8d5@rudorff.com>
 <5531e454-0d84-48f2-af0d-1ab34c149760@oss.qualcomm.com>
 <2b091dc3-9588-4042-8908-2fc3adba6cf5@rudorff.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2b091dc3-9588-4042-8908-2fc3adba6cf5@rudorff.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: EeQAkJqYqEvUFuGi9W8BgAheC5RF8oRi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1NCBTYWx0ZWRfX+V4/llpHHgKv
 eoZoZvN2qrqcLTaeQvLpytzyFikPhbyucP01ti5ZIfAeGe+28liQrAxrEb+aWyIIlX88Z018v6u
 qOJIt61DkYYSLWjt7oY5ADoU7DopRt3JHDsqPTlgm848Djrhp+5h+WACX3Dqzr6t+F6yhnXpe6I
 Ie8QcHkK0Y84/sMlf1jm6ntcXOsF3Erb7OuOdRDed9xmEAVsQ+72cr7gcBe80mD54xqESQr/HOp
 G9xqxPi/N8VoqWPeQkp0jm51NNj9y4WJuiH8OadX8n34OMtC9X5IUpGhzWQshRcIq8xRnnM5OvY
 6YrxTUm6kICAQB+V9oGKP0kPyfowxBEQfXteZrctvLMv2MciD6CLWWb8PgB5J/PND9ZXybFxu4J
 3cd2fRY94/wGFQRsKwr40KK+Dogq95Sx78QEzKjwwQ2BK6MbHTQ/ct/v6Y3ka79kyU9udEw7YWC
 1zmUI7AQbTmzwYbG0zw==
X-Authority-Analysis: v=2.4 cv=HJxWhYtv c=1 sm=1 tr=0 ts=6ada13b5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=qfT2Yf8mAAAA:8 a=WbbDG5xgrYMa7k-JMu8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=nKa2voRIl820JbUdVH2x:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1NCBTYWx0ZWRfX8gHkLKKmp46v
 Nz2p9fLakTEvCN/jA3ToWopvz2eDJ/4GQWEIQ+fLAxHQPxogmgUOgWIVMHV18kMo+SZKsuiSJgV
 Ns4kAGS0+iEpvY0CCNLILeZIEM4tpp4=
X-Proofpoint-ORIG-GUID: EeQAkJqYqEvUFuGi9W8BgAheC5RF8oRi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220054

On 10/22/26 3:35 PM, chr[] wrote:
> Am 16.10.26 um 17:11 schrieb Konrad Dybcio:
>> On 10/16/26 4:43 PM, Christoph Rudorff wrote:
>>> J5 got a gp2ap002 sensor, add it and it's supplies to the device tree
>>>
>>> Signed-off-by: Christoph Rudorff <chris@rudorff.com>
>>> ---
>>>   .../boot/dts/qcom/msm8916-samsung-j5-common.dtsi   | 19 ++++++++++
>>>   arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts    | 40 ++++++++++++++++++++++
>>
>> It's odd for the regulator and pin setting to be common, but the
>> sensor to only be there for one of these devices
>>
>> Konrad
> 
> Hi Konrad,
> 
> in patchv3 I removed the settings from common
> and renamed some labels.
> 
> Is that ok?

I guess we'll see when you send it?

Konrad
