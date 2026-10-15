Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99C28003D
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071136; cv=none; b=J5gXchez8P/IblTu8FgTJr4F4JGlWiBCbGunIavH8eMpPHjQ3iw1xrlRr80G3vrKeUJ9H3LkjPNJieHtjXa4Ob/CLo6ERLNOO7QMo8hATZBLp1f7OWqX7GW9zVhBTLl1H4Mb0fQHbAsU7HnQ4V2bJlL0CexCcd2Vn9Ae/zuRHeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071136; c=relaxed/simple;
	bh=aOh2KbDTODle4grtPE1FVRv20AnwMa9h8HJPe3KDcw8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KEcDDFxvQC9Cgeew3S3qo6wR8vC35XGEmUAIwFZUXfHw9Ib3BC8etCJkHe6vOIOHKtmlKoyiTcq0fI/3/vEAno51VO+DSSMMR0I6SuSFEXXswKTCdFdlA3DFdCf4559WZd9lD00iS+JEBPE3uyugLxmggYgcTh3hv7wqtZNj00s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K3EH3fVr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NaX/U1U9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K3EH3fVr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NaX/U1U9"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jHns4077449
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:32:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rdX3QCLTENQF6a7iOoH7LlhHEJoWPHuhiEjvLDq2Jqc=; b=K3EH3fVrt6zpt/ia
	QI5oUNZmUKUO+aT6h5z4UgtvU3WpGypovVVxPUzvwY5IXB3hMZS/vr1WmQ/81456
	3oD0AgqVqRx3P+OeKrNVcnjzWXE4fusAuaFgpTMQTQa+rkIV+hc41y/v2axMua0g
	6vF0+4lCQjo88A3Pqjq6EITsRr6yN/Tx6/v7TnXBPK0/3R9ZFI/8FFrBs5scWShI
	hc9+7Nd/olymOyKpWisS+hRqbThjdIZYEx2uWX3IJzG0Qy36++TdYXWBh5lxsx76
	9o3IQqxAuCFCJ8rd8bOqS/vj07tZQujr/mATkQ7xHIbQ6+v0e5l7xveezN3Ntt/B
	vmTyDA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4havbc0xdu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:32:12 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5e915fd8a61so128033e0c.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792071132; x=1792675932; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rdX3QCLTENQF6a7iOoH7LlhHEJoWPHuhiEjvLDq2Jqc=;
        b=NaX/U1U99vT8SIJGSUy2JAxXlaCKd36wPRz4i1Cs32/vuS2vE7JNZgUntROc3IERv7
         Gd/vDiRidX1wUcfgCG9s8KY12Dd1mh7FuisJoWwE8i3GW7aEs19lDDltrZUIkkBhfv7r
         Rh2YTdrTMP3vdGlIWMYR2INE/7klV5035tmO/LQyf9DArB4IJMPRhJfp5r/qWUA7fouh
         tStdpPFAGU2vchAUP+bhkD0ZA36Jnvac0zoL9sRhIsPe+N66tleVXaEaV0QhGwJcRI7b
         1o7ecmEPPGK56LYBf3hk2FHe4Kxn/7+OUO7qo3iZuxzgjH+lRGMj021c10frUxxEUbcT
         RP8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792071132; x=1792675932;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rdX3QCLTENQF6a7iOoH7LlhHEJoWPHuhiEjvLDq2Jqc=;
        b=kOcv57RCXGabBaQ724aVhCQLNc6pzwDdOJAzpLC4xuWYag6izxaxQGhaChqLW1/SnX
         /QkxAjGkRdn4TcWKA9EIEFdFZ9hv5ixiaVQa3HBkkOXhbuR9jJqYzIh4RJP0YsOK3hag
         iRSlAk2CXbmIVEEyxe/gnmF3KZ4AwhoJ4s4kWXFq9wCh5P/NkethFnEk58Nh3tfb/OF1
         1iTO9v5vgnRfKgE/lxIA56RFTc5mgLVDDQNycCO2mbxHp3QYvwgUPHNlORXuibu9uBBt
         Sayah/c3BfsH6gxSVUZBVRN6rbGHc2FrlGdO2Wha6oBOIP8JBqQINg1SW3Py8Rrl/bUU
         riaA==
X-Forwarded-Encrypted: i=1; AKwUvByXSgBxeMVXgCEaP3vtN/exMqN8owcIWd9rQg0oxfSR8b0ngXAkh8K5XSXehw5UBkIYq7H9LlLCM29Y1dI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIssJhNWoJcTYmHgURTvjugWAm9fvBvkwJdQodSq+AlpBAfw15r
	t6JJvcQTArqIdiIpGE+q8UDns8I1LaHx1sR5z2rCXBabzt+YYrgE0Dm6L27brlvDDRS+8rd3L6H
	ghra2JQEhqUSUZXEgwtQIotuCxcY9NwmX9RxoyqUCQdcFi6IiGyTpMrycPyBD9SJpmfk=
X-Gm-Gg: AYBFou1D/nF3GeB7w5BpBGhxWIgigD5IRi8OxcTO9hTq6EfbDdcOvkKXVh8T/IvE9Wt
	QAinrbyks88nsFnuDlkcoyrH4r6QiEMvKMLlryUmNbQKfVN88fRrGAaj3fSfZvMfE3EVYvpQUmR
	lCIPH1fFObaNWprV5aISTflOARTfA2EBW9qySXRdDAP6a2ykJyEdxeVP/Nib6A0R3pFKZyF4M2L
	ZfBjkOGq7lpe0Mtc1FqCmB3+hV6vIv7Vj6OSFm0VwLH39fMIa/TN59TdQg4xawIVXFz3Arxek5I
	4LdKI5kNXgGd6RoIB1rlLwheRyv7PVnyFCuNGrtr8V/gifThcRcD5m6WF4pK6kpF35aDdkLB0Vr
	Rxgsmr20Z2ZUbIiMT5fPpJw==
X-Received: by 2002:a05:6122:6990:b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5e92e3c09b0mr5140638e0c.2.1792071131499;
        Thu, 15 Oct 2026 06:32:11 -0700 (PDT)
X-Received: by 2002:a05:6122:6990:b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5e92e3c09b0mr5140566e0c.2.1792071130738;
        Thu, 15 Oct 2026 06:32:10 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed6be6ddasm129094766b.7.2026.10.15.06.32.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 06:32:07 -0700 (PDT)
Message-ID: <65f6883d-8ead-4c6e-80f5-81f6857df0b8@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:32:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: arm: qcom: Document Microsoft Surface
 Laptop 8th Edition
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maximilian Luz
 <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        dri-devel@lists.freedesktop.org
References: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com>
 <20261006-mahua-surface-laptop-v1-1-406fc042162a@oss.qualcomm.com>
 <245e5eef-e18a-4ec5-b57c-65e561101351@oss.qualcomm.com>
 <52adff3a-370c-4445-9797-e0b0dde36fab@oss.qualcomm.com>
 <5568fd0f-e412-4f2a-9f1e-729a469da572@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5568fd0f-e412-4f2a-9f1e-729a469da572@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QbvzLcbv c=1 sm=1 tr=0 ts=6ad0d5dc cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=8k6WQxmsAAAA:8 a=4wGxsJ_OTqgDEiZx6fMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1MyBTYWx0ZWRfX+JowOwb3SFF8
 FFpNv2ppLdfEIx3d56sWcMOhtsH7567Uv2kNJnFsgpWZz2YiEsJhjbqfqbjlj4p3bI6NmnZTw2c
 Wjv8OTVVSm4JVJuzR8MbqdWE/lMFZhQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1MyBTYWx0ZWRfX6NI2GOfMyTCH
 NTwEve1wkcOUA8O3pWh+dSxNTvgaLd2OGSjL0UIhfpdjuTTQfg9jMPq5TuFUefsD8bHeOj2ZG4p
 tmNqpgXVb7JtiZ1pb6zmEXP7jUEo5kOvONa7YOx3/wgFumpY4Qk7HHhC2CTUJrp+8y0ic83ZEWn
 N36a6LYd8mtjWxdiD8guDnEuD7A9N4Zt5kSZjbOhXZhIN7uxbXqnUZLMxa8OSWjwWmQuBrT2oqO
 ycUKpQwd0kwR+Vx28lwXBp3w3maJf8jEjv0mhb1DpkFOoMY1TKDdxVvlXmtAGLDaY78hxaIH8tH
 yS4bd39mNbgqtSKeqZL3PofdcPhnJPoaYzYwyAHBwhXQI7U5irLURdlVa6ZPjSz9XrsyvD+/y/b
 ksPDz5zXk47JlM9an+92pTWQQqc154dRohv6X2DGaBhGd90iQHt7oX3587eqBPtSZycDws+UmJi
 KqFmYv6vuF+KrVaTfNg==
X-Proofpoint-ORIG-GUID: CYfw_oywT8zjykYtJjylsRtfPoqqfRAH
X-Proofpoint-GUID: CYfw_oywT8zjykYtJjylsRtfPoqqfRAH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150053

On 10/15/26 2:47 PM, Gopikrishna Garmidi wrote:
> Hi Konrad,
> 
> On 10/13/2026 2:09 PM, Konrad Dybcio wrote:
>> On 10/7/26 9:11 AM, Gopikrishna Garmidi wrote:
>>>
>>>
>>> On 10/6/2026 3:20 PM, Gopikrishna Garmidi wrote:
>>>> Document the Mahua-based Microsoft Surface Laptop 13.8" 8th Edition.
>>>>
>>>> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
>>>> ---

[...]


> Thanks for checking. The only matches I see are in the MPTF thermal
> package, which ships"883ROT13Inch.bin" and "883ROT15Inch.bin". Nothing
> else mentions ROT.
> 
> I also checked all the ACPI tables but didn't find a codename there.
> The tables are here:
> 
>   https://github.com/aarch64-laptops/build/pull/176
> 
> Following the Lenovo gen8 naming, would something like
> "microsoft,surface-laptop-gen8-13p8in"
> (mahua-microsoft-surface-laptop-gen8-13p8in.dts) work? I'm open to
> whatever you and Krzysztof prefer.

FWIW the "gen" naming comes directly from Lenovo's product name,
i.e. if you go on lenovo.com it says "ThinkPad T14s Gen 7".

Konrad
