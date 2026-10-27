Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105971;
	b=zmWPLBHBY18M8r962Y1CdptLDnCSfv38T4USx6F54teEB1J7XCNaSMir8n1m4RI8Qqh2
	 3Ngd7ra0aF64HUe5+xo59v7G2c69GyVT+MaxFJswv2yU9lGh8H1EohR6ryv8YMJwbsGeA
	 0ZtbWoGiGITmQq5cwJG1PdQ5ktu3I5lrhwsoKd95rgkqAARlVEmhUKBk43M/fg3Wk4N+x
	 +1xOsW/UlFIldCireQSghCQt1MiV8EIwEadnz3oQ3IWebze327odgIoi7rPEJrSz1fD/z
	 fmvRON9QZ2ReNCvpULlC62JiP5tzi5ELiAdG8Bt1rUWAdG6b7RXlHimDDwZqu4AAMyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105971;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Vsl0HVbEuoM51i6BhyxMfLu4Q1ZoOEb60y6FW9JjSq4=;
	b=C1EYcbgVsK5FEFwgX/zZe1lKOkX/uwzhbbGpOrxtHzkhFlTAjZVx+5kS6U9EGPGOdCBO
	 Qd4h7IpcuZ138aNK3xhOK5MPov9CiUHkVyflZ2psFrU9KJCw2shmRS8ibRKLDpW8dK9D0
	 Gj9i47JraAV4vHDOgx6nU60P65Z/0mCIDghZMbdPbSjNL/VQJaWSsXVwCDdL8HAIkHGnM
	 WJlg08WBCwxeLSBlZXVmnluPw5Uuc/EurOAu24kpmjR0U5SbvQTVFziJg+sSdY9liNrew
	 FQ0k6fGliCTnhpj8PHIQ+JF78604C/R9WmEWIn1cOcqnPRGWJ9ZWECw/6WcH61wtfxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IruyvjM5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JJhqJsrX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DF3606A321
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:59:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2DF3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IruyvjM5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JJhqJsrX
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe7OC432891
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:59:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vsl0HVbEuoM51i6BhyxMfLu4Q1ZoOEb60y6FW9JjSq4=; b=IruyvjM5/aLrDMuW
	5KVWVW2tcpRSZCiH34BEt6jagRX0sat0rKmCzk1TcpRNrs2ziG3qQoYIw9VRDHnC
	bUEWdoXMy/GEel6T+h5B6nByfFUxDVQkunbk4aXPuP2A/MsZlyHb7EmrytuOBbbe
	Y2LofxqRFRaa35TUaPPeQoY2ZKZthfjJb0uwn90uV2NO9GLEM0kV8SDeMeblyfXi
	Wim4p14h+k1+jc5sgM6BJcTCfPQ6xl8os4N1nll6kIOrKWAKFpM7jbBDSh6kZudN
	o7H0yuNneG5mFCmSsIWRl2ryA94CFTQ7l0AOTQ5lLWKcL4Q9zctu0oWBR9XFmfME
	9x7eTw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjb54kvg4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:59:24 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so4390152c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793105964; x=1793710764; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vsl0HVbEuoM51i6BhyxMfLu4Q1ZoOEb60y6FW9JjSq4=;
        b=JJhqJsrX2oU34E6gMKvvyqkngUtNRYqLbqXehgsB3krNFSc75OR3zjMQss5LPn9Vyv
         PS3/Qd18V/urRs/kZJcAfTK8bXfH8YjC43tEj4Nj7xHenV3+K/lACUpCsoOo0Laiafg8
         p+IpS8Ka7mu7PjVWvfgoKqUTZu3mS+7iT7U9rXuIEhNUkvWFRVzOWzy8UPNoL/Yyaxmv
         AyXc4fnQIM+IEW2X+r9NqWCdsUVAeJntop89Xebr3HIJyIAmJXY862tEhkuFa0324Bzi
         tP6yU8z13DliSaKhud/3lXVRHLIpCGuh+lG8GZ1GuDSdZYL/RkvFW0OWmOAJGu026jfR
         ya3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105964; x=1793710764;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vsl0HVbEuoM51i6BhyxMfLu4Q1ZoOEb60y6FW9JjSq4=;
        b=ZxQCEf8TeuAdYciWWXuXZ3KVhKQW9Gj2cPTynEkdyMNwBg9sc1LODONZpFuRnWpa2Z
         3W4IO+QGwfs2B1ozDljgRdNkNMf/7pB53NSjW9NrL1Cr4ICnYGTCQDojkc6Kxuzt0jDz
         kcUsphz3v1HXRVzyvYYRxyUUaffiUhzsUKxR9iFh0llobO0wsEoeWU6t2VIlwfmD1Z5O
         zQ0NBXnNtJxhRcuQDeqEHU2dJwhwKjtzXoBF7gx3vdzSgvQQhpvVWW2JP+20ZvaPZSne
         16MxCuqzTydfl+RFVgzadKDFiaqMYTdBCQeC1jqw7z4ciuy5Z9JBFaX41XKWJ5/aTWPA
         uPbQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4iMKN/LskL4HFUUC99PbNph0UE96QxnJoKUniFF9/+qx1aSkwjlZ0hKDDjMgli+2ZD4NbyDCyrcyGDvg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNPn5P2wj0svttt7NoNHNN7IL+FlCK9eVN4PP+oEw6+Kdrnn/E
	vl5+4IcrlCDkhZX0uiB8WrQgy3iWX6velrcCeDxYFT6EpCR51s8F/q5PahWirR1Nbgi3KuMoaRm
	zoPiTm41Ojnst/SsARBdxHHj8/xzyM4KGQ9IQor+dsVvC4yqvTNJsrsf3iNDakupySbo=
X-Gm-Gg: AYBFou1gIlowXDfQVFRcdIL385qgUSCZg9g1sKCOPHzGhYtrVMj5ooJgXL0YAVeGN23
	z3SxpnulbPV9zHxx4EkhuF/ALMq4OSXE7lYI4Kk4zCJC85FrboVOXz2OPvgYrvn79qQi2O8zFYd
	EBWGtiVJ4cs7SW6MMsOd3Nuh8+xYPDUg0N70PeaFKNaIgKTpQfKq5R1bvcAwmvCUgelkartTt3m
	97vlHhxpPEqYOKUeATzwQNtYavyXc+Dff5t3kcmkY+5j3xE2O+OuqyBqAOdzFeHVlyPb2UR3NZw
	bnsz+8oojKeTIfWSGgf7NTk7ONholHvTaaQLZ30XGeb1Jg3cIdQFufW9QlIFZBFq7Cvc9G8hI0T
	4apYin9MBjt0rw+8bHL2AhheYFvna
X-Received: by 2002:a05:701b:204e:20b0:183:bebb:e93b with SMTP id a92af1059eb24-199292f43eamr13457154c88.6.1793105964006;
        Tue, 27 Oct 2026 05:59:24 -0700 (PDT)
X-Received: by 2002:a05:701b:204e:20b0:183:bebb:e93b with SMTP id a92af1059eb24-199292f43eamr13457100c88.6.1793105963185;
        Tue, 27 Oct 2026 05:59:23 -0700 (PDT)
Received: from [10.218.49.202] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a249c331sm70037137c88.17.2026.10.27.05.59.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 05:59:22 -0700 (PDT)
Message-ID: <991e6b64-8741-4669-9bbf-e31eed788f42@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 18:29:13 +0530
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
Subject: Re: [PATCH 4/6] thermal: qcom: tsens: add hardware-bin trip-point
 filtering
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>
References: <20261002-thermal_bin-v1-0-5a29be7e8ec5@oss.qualcomm.com>
 <20261002-thermal_bin-v1-4-5a29be7e8ec5@oss.qualcomm.com>
 <7cd708de-a58e-47fd-acd4-0e37be77de92@oss.qualcomm.com>
 <e832301a-6129-4697-a5e4-94671072622b@oss.qualcomm.com>
 <e7788a12-3cad-4bd4-9f79-82cd118e0049@oss.qualcomm.com>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <e7788a12-3cad-4bd4-9f79-82cd118e0049@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1MSBTYWx0ZWRfXztchDSmA7/NF
 z3mmPbRFVC2K++UzaBdaSm/YCD0wXBcXRvsUalpbND9dymsZbJwlgAnYU8IbxBULXZ7gaN1M/wj
 5OYHAsEOaN7QNjPvM5XhqqMz4SLLTMA=
X-Authority-Analysis: v=2.4 cv=bsnZl0ai c=1 sm=1 tr=0 ts=6ae0a02c cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=2QBr877Ud9-TTkl_dS0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: 3bLHbfEaCs_HEJlhVnb8t5eqnZUv6Zph
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1MSBTYWx0ZWRfX0D3V7r0hCCSP
 4vuAx+diVM8wyZXDWnZyvbhW3IzQRA2ytW0W+dPlZkTUEWnCS9RrzWzpFffkEF2MANBjlEEEoIX
 j0zdUx0PDSEN7Kc7TOmP86w1ItQDLHJG5gceSu49hLnjdxSJDNoFWtfAv+2XJuc1tUUUndXpV2o
 QMmqwU2Z0KFT4+BR2f4/9UfO036DmU+J5/lf+2F22mV6DKx/D4/RUmTfjl8gZvRKlpgOFHxgbUU
 OyLanI+5qfWf7TFgW6AgpKpMsMljH2TnEBax+c+betUrVyf3EXDr+rCPAF0Ypo1G28R0gXyfach
 Yp5b8TXhuvvy94prfj/C1VW56LEX6JZyMSn6cAcoTyZ3dWm6gEiPbUCrDi9JChoW5bjCzmUSEpr
 hX4D4CIr0l5ts5ryGrJISmf/CY4+NrHpUgRuXE/4xTN2OzlPnAMinW4junRYmy++AMiFrkOJoWd
 L12mMrVpxOgFO7PWwpg==
X-Proofpoint-GUID: 3bLHbfEaCs_HEJlhVnb8t5eqnZUv6Zph
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270051



On 10/26/2026 5:21 PM, Konrad Dybcio wrote:
> On 10/23/26 12:01 PM, Gaurav Kohli wrote:
>>
>>
>> On 10/22/2026 2:39 PM, Konrad Dybcio wrote:
>>> On 10/2/26 12:46 PM, Gaurav Kohli wrote:
>>>> From: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
>>>>
>>>> Some Qualcomm SoCs are binned at manufacturing time and expose the bin
>>>> in qfprom fuses.  The thermal core's supported_hw_bin mechanism filters
>>>> trip points by hardware version; wire tsens up to feed it.
>>>
>>> [...]
>>>
>>>> +    /* Hardware-bin values for thermal-hw-bin matching in DT. */
>>>> +    const u32 hw_bin_std = 0x1;
>>>> +    const u32 hw_bin_elevated = 0x2;
>>>> +
>>>> +    /* Higher thermal profile identification for qcm6490/sc7280 bins. */
>>>> +    const u32 tsens_chip_id0 = 0x197;
>>>> +    const u32 tsens_chip_id1 = 0x198;
>>>> +    const u32 tsens_chip_id2 = 0x20e;
>>>> +    const u32 tsens_chip_id3 = 0x20f;
>>>> +    const u8 tsens_feat_id2 = 0x2;
>>>> +    const u8 tsens_feat_id3 = 0x3;
>>>> +    const u8 tsens_feat_id4 = 0x4;
>>>
>>> Isn't that (also) exposed over SMEM?
>>
>> Thanks Konrad, for review.
>>
>> SMEM has related socinfo data, but there is no exported helper for the
>> exact fields needed here, such as feat-id, which is also used as the bin
>> value.
> 
> Is that different to qcom_smem_get_feature_code()?

Thanks for review.
I am checking internally and will update with the exact difference from
feat-id. My understanding is that qcom_smem_get_feature_code() returns
the SMEM socinfo feature_code, while this code needs the QFPROM feat-id
field from the JTAG ID fuse word.

For this series, would prefer to keep the fuse-based path. The same
binding is also used by the generic i-temp fuse bit for Hamoa/future
targets, while the jtag-id/feat-id decoding remains only the
Kodiak/QCM6490-specific callback. Please let me know if you are fine 
with this approach.
> 
>> This jtag-id/feat-id decoding is Kodiak/QCM6490-specific, and the
>> thermal-bin mapping needs both values. Other/future targets are expected
>> to use only the generic i-temp fuse bit, like Hamoa.
> 
> So there are variants of kodiak that ""incorrectly"" set the feat_id?

No, Kodiak is not incorrectly setting it.

Kodiak/QCM6490 does not use the generic i-temp bit for this thermal
profile selection, it is using feat id only for high TJ profile. The 
i-temp path is for Hamoa/future targets where the thermal bin is exposed
as single bit.

> 
> Konrad

