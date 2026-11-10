Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794326637;
	b=gnSw1lyZsiyqvcMrecTNGVjGvojUZGGLEjbuvK/XDaN58VO/uTPoIpIAVjhFdIBHRPnU
	 eZs6DLcpjnsx0kIpFvLUH/4Md9d7EI+eNx1sST6FlUM9rJT2fvYTZIHbPCIeAZoIaup72
	 xfsduGSyKyAIfygscWxiq77vILKRy98QFZ3Du1tvNMdRu843hTM11Rjbvr3dOHJAeOBHE
	 SP87bOQJSdzJ52EJAXNQQq/6FYVQma+UvnDU718G8HvR3TXbIGFofhaxF8cH0O6ruxnnR
	 Vvjxy5gU0aItQazguJId37tvRpgPTgKiQONXjclyTIWvQYbfyFoWkHzdEmcP9ZDkfrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794326637;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=z9ld557JdQBKoDT2aimh1Io/f7AT1dhkdI/35dtnbqI=;
	b=GuWoENsXk9+ngP0Zzesyl5/wZZIKqkZwxx1kFtFzWVhzYSPJpVFZJ8rElrEBO4bPDd6R
	 /BKoVgtUEQPg1SffA6CMZniuu6OcKaTMESapAJJIDt738pxU+aohIVNRVmFRm0ZogPrJI
	 o/N05HetLT8tzyWf9xthotRbhu2+lph0xLSzdqPFFdVkynsQ3NTNU6HcdJE7VxAvDltqF
	 VuXU/Zv2IqJeULH+QYCe1BJw+wumRWsssblNUvh9gNP5kQ5KIY+LSUCxNoizJKSPs6l8j
	 GUIBQGADhwVstbC8/nJOL2DI8up3LQwHA+ympy/Z+1q8qHyDaK3bpzpT491lmKlxBtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=norkWtlo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="CI3/+DsN";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308B5606A323
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:03:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 308B5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=norkWtlo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CI3/+DsN
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAF01lm484447
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:03:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z9ld557JdQBKoDT2aimh1Io/f7AT1dhkdI/35dtnbqI=; b=norkWtlo38LpdvFf
	A2dEwFuVdNmQIZaXZ3XbH5NYFCvb2tJsDBgfzDpfWRjZknkMo/WgmVusZ3m2xcUT
	KljgtF0i7asQrDsxJsgqpjEZosiHjte0dQBWCQGsr+t5WsWh1YvjHUCuFHTgBPFH
	AII261ICNeryJade6UVztNk6ZAbTdpF4N3mHraA8o91pFqo9L57k49KoQUZ9I4FO
	AhPDRzVgX3tWIJaL0ZEVmnkxA4Yh8vMBQ98XZiohcw4wmC+i02fsT+LvsHWK0UIu
	dA30mFyZmX0R7/d/T3w6vrQFvWQXsKduPJzs97IxqQ8LWqAfulRNOhm7C6qQ0jh9
	BykMpQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyvwhknj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:03:56 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9997828d6c2so375401241.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794326635; x=1794931435; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z9ld557JdQBKoDT2aimh1Io/f7AT1dhkdI/35dtnbqI=;
        b=CI3/+DsNJXnsAQPKmWp9zS1F5KLl17YH/8Ko7WIiWWJodDT7k3VdHnfbKYa6MX03Ia
         92fyj5wdeUqI4oNdI8AdjRVdzUgkI/cWkDEj9SHr16wsIVf0LSp7NwVqCCqKEugT/pyX
         OatIF80NderFYrUIBQFsrsc/rnUN4TdN68RFpvw5cPMSREEUUa0rT8kIqT/f8dp0EPn1
         TJ8ADSY/vTUpsmb8eVucaXjUZHb/ZDn/adpPIhuE7ZWB5lvz+crlPS4xpvfdxE7jen2i
         YtFrJe1ncmVBcuxbdomD/7E4+nzvHXDeS0MtKdS5U/cxzEPlU9bRruv7nTCoi5bA4MZS
         M/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794326635; x=1794931435;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z9ld557JdQBKoDT2aimh1Io/f7AT1dhkdI/35dtnbqI=;
        b=gqLpU+oUAuuXnJkeFKXiqqbzTsrcMoW8vK6mk/hE/oL+6GsyL6l7V0KkNeQ5DRSMdB
         3J/BYFEMd7i7VtNymNnAad0wMZqCwMkoYq6OdFhzFYU5dRJZi820W4IZTqfQKhCM9bGz
         NGuLTyZJcyw7l1eswT+ysWfj/fPSasDF7qu50tqE9I6Ac3AZmAcN+DXlZ10ehuxpToFM
         aCAoSwyfnwrm21mwiAMZ8ll2/h66lmMfqxU1cBgnCAnrPxUSJDC6I3z1hPAu7HoHSO4P
         SOYbPRkU8MN3EubjOVWk0g4AdIRKqjzzpOo3hxMluAx/I27KMnPihmECufZAAi9KYRUX
         GFlg==
X-Forwarded-Encrypted: i=1; AL+hErE4pnCgMZQfXR7hbT7p3skTZetDtAAOoOb9UH6RWhk6HHNpOjPBAPnky+Ndf78uzCceyLDec4FtGBuLP6I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hROcRUYrL1OBvMVs+82cS3/dhD0pMLme6lfuWB/ap3t6fr0Ru
	MCWSPD2JM+QL1aX4kz9Cp99cmUGRV4c9gb4xfsFCi4sIV3jQAQHrZdllseD/yZDkwjr3D2vq+u0
	9pznw1V6sVpGAVoPEPnV7UHgDSJPkkF+mkVTLJI9ZQbkU4WDaJ3aq3GPW9H8m84/rQzM=
X-Gm-Gg: AYBFou1NfWHqQVeApJLJ9Qyt2CKFQN+FNpGmEkOmT+IlUeWvCtoWno7JRDJ4WqoDyyj
	z2g2tiFYMSe3MIu9HwYNimXuBH2csJkUAAgVkfg3R1EyxFPxHGDjje/qhv6UcqY7H6Z1kV1P+6L
	1FhbAz9IaLH1cd5h7OL4mZWEJT6vC4q3bzlCVCjrGHpAbvHvDrkU09+9Mu2LzLMG1j6o2ajecjC
	/S8ou3R/jugtdSG721QL1PQ4miP6fci6K28lZOid4wNH+mANVOBGEbzygMc/6740IHK57NPvboh
	dto17A2tudB2HlEABYaVSNwReAOG0bvpBWw8s8Cofwm8rTeMObCzKL0CvvGj6yzL8M51vY+g0BD
	ipINUrlCRjrsJ6G5W++kmsAotE+7BhTfraVnWoPsAzmS9yCKc6C2enTl035whR9cYfQ1/6QWNwt
	M=
X-Received: by 2002:a05:6102:6d0:b0:7cc:25bc:3b20 with SMTP id ada2fe7eead31-7d301b84a8fmr940104137.7.1794326635259;
        Tue, 10 Nov 2026 08:03:55 -0800 (PST)
X-Received: by 2002:a05:6102:6d0:b0:7cc:25bc:3b20 with SMTP id ada2fe7eead31-7d301b84a8fmr940050137.7.1794326634568;
        Tue, 10 Nov 2026 08:03:54 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a64998dsm125019966b.63.2026.11.10.08.03.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 08:03:53 -0800 (PST)
Message-ID: <a1bc40d2-f12c-4cd1-a4d8-c74e79606f39@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 17:03:51 +0100
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
Subject: Re: [PATCH] arm64: defconfig: Enable the RZN1 RTC driver
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg+renesas@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261109114123.797741-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdXc=DRkGOhc75Zq524X9Rcc7OOMs6dy0rj0-zm+iFP1wg@mail.gmail.com>
 <CA+V-a8vtcZA_51PmDVWMKsOWaQB+CVDe=qh2FG=6iH2Rf2szVQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CA+V-a8vtcZA_51PmDVWMKsOWaQB+CVDe=qh2FG=6iH2Rf2szVQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -pqf6lM_U4C2cc7u6sMX5wd7t_mQfA8j
X-Proofpoint-ORIG-GUID: -pqf6lM_U4C2cc7u6sMX5wd7t_mQfA8j
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA2MyBTYWx0ZWRfX03oBC9jsAKYv
 xVY2po2QsNPDQEE8wkOgEDzmhWCN1oI4REfUK9vyemk/6eI8McekbyT/Btj8uag4lUyhotJTJPK
 3S5xffAPUt/G1h5AcGOneM2l3h99g00=
X-Authority-Analysis: v=2.4 cv=NNpAaE6g c=1 sm=1 tr=0 ts=6af3406c cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=tBb2bbeoAAAA:8 a=pGLkceISAAAA:8 a=yC-0_ovQAAAA:8 a=bYITjNxFN6idbckDI6UA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
 a=Oj-tNtZlA1e06AYgeCfH:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA2MyBTYWx0ZWRfX9iuvlm4aHLu2
 g/LFxVKsYAdbvw3IzcYPMJUN7acDXIThJo1AFGz/ukDobly5hm4CWReo9OfLFZUOy09o33Zk9dl
 E1bEANiwuTnJlcTNez3Nspl9s7tAZ/msZiz0jYS2asVZqt1BWHdIVnvZZ+B49Y+OorxtYjSvQ+Z
 ADXpffTP+I7J6FFGQ+KtXMxq4eUdjpk3ZGViRuY3II8VL5wXniNyCxbst1XoeyvCEhDPWU/vgzr
 RL2Cm52mdyOWuyPNMiP+gGKzvMgt9jNdYIbxmlCpQ4sE7QfUbTRsjm7WjqdqCkTqKTMr8QdsGE8
 r6FyMEdDWTtiHjQ+VZG0s+vdN56HtGULeLLr1VqrbQ6SyppY9SGsVd2hm1bbWHM5YwPLy3e3eMw
 /V3jz7R4nvBz2eJGPVqZF+wT8/zuhwci3QI1gfRAqXLLjCMHUVKE59O999V4NEG4bHnJBxJox8r
 g/Uf0apT33r1LUUrQJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100063

On 10/11/2026 16:57, Lad, Prabhakar wrote:
> Hi Geert,
> 
> Thank you for the review.
> 
> On Tue, Nov 10, 2026 at 1:47 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>>
>> Hi Prabhakar,
>>
>> On Mon, 9 Nov 2026 at 12:41, Prabhakar <prabhakar.csengg@gmail.com> wrote:
>>>
>>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>>
>>> Enable the RZN1 RTC driver as a module. It is used by the Renesas
>>> RZ/T2H and RZ/N2H SoCs.
>>>
>>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>
>> Thanks for your patch!
>>
>>> --- a/arch/arm64/configs/defconfig
>>> +++ b/arch/arm64/configs/defconfig
>>> @@ -1393,6 +1393,7 @@ CONFIG_RTC_DRV_TI_K3=m
>>>  CONFIG_RTC_DRV_RENESAS_RTCA3=m
>>>  CONFIG_RTC_DRV_MACSMC=m
>>>  CONFIG_RTC_DRV_S32G=m
>>> +CONFIG_RTC_DRV_RZN1=m
>>
>> I don't know what happened here, but this is not the right location to
>> add it? Moving between CONFIG_RTC_DRV_PL031=y and CONFIG_RTC_DRV_SUN6I=y
>> while applying.
>>
> The configs weren't sorted, so I added it at the end. Thank you for
> taking care of it.

What do you mean? I just sorted it 6 months ago and it DOES look sorted.
You just placed it randomly.

Thanks Geert for fixing up the placement.


Best regards,
Krzysztof
