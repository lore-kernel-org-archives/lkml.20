Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E982136C9CC
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790345446; cv=none; b=NFWb0hlDxFl+VVr2igztclg/Ed3zHB6T2YjWpzbCy2oGgvCiN7+KNo2eCmLRFx6PATL5Dv+fcmyxi2y5X9kvhZAzCGpD1/OfW0Os1vEwhuzzAcdrLseb9PIl8KzYO/iSJNEhKGl7qkdCNu2JASE8lP9CRjHIO2cgf9SqXJLkSvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790345446; c=relaxed/simple;
	bh=Yg3zrQBMAnqEW0AFGnByx9lrDxc347u5l1v3CVX3nu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sPoqU4QWEBIKpEezkRke9/0o1Hnlp8QXkbcg0Uiey1QrvlPyAe7QVWv6qhwwp8+6LF0lnA9aVyo7Jx/9i+rXSC9tOD7IFIkT+oNzq6kAZNhuhNUsc/xoPFEoowSgk+bWOGC52VETArT8i2GE4sQkwzD5GRUY5ixKvjE2macVhBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cEW2Gr68; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pf13da1h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cEW2Gr68";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pf13da1h"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PDQf52756774
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:10:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dSAwvXSu0z/cPlAloRsBK1Y8v4BwQK6DKrIQDBSZuBY=; b=cEW2Gr68J/yjV9hf
	LNqU2nvoxSEwn0pCeoRSzf6frVtNvyysoVE6beEu+utx8RIdLQ6B5jJxEVVPbE5f
	93BCcsH/PaWeQYpvzgoXNVGO4lcKf3r1jfpeuLKKmH6slaMbs2WbVJTa08OurNHG
	llAB2HW6DvnZi6wHmCSRIr0oLErXHCw03L4ta6aSFr2/3pRuANg4rKCaAgH9VlSO
	nDV8KAWKGzAlYZQMUu/INIy0K0r5V5efPH3tqRwD1syigBxl7w0Calqr2RjndKcU
	Nvxt+nsasLfKTVlRNC9n/DU6m30KZnpOlswyXckl5wFr0/sUz7kmjutAMtI6BGKd
	aLj7yQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq09mrv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:10:43 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2df8cffbdbaso5701395ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 07:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790345443; x=1790950243; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dSAwvXSu0z/cPlAloRsBK1Y8v4BwQK6DKrIQDBSZuBY=;
        b=Pf13da1he5b0HTvPDc8JPPK+VBWZEZyMMO7+CMQrflvMpY/2RHHIgZRVkXLkqP9RMd
         Byaji1KveVAXlsNCqHM+dJs+AABNLT+GCIFMUF0ogGKQsS3IUK8ZdBxG4M3k9wQS9p0U
         SaJTCmAepIselpEHiKxj2z7XpjfIxXzkc4RdRDXtNRaXFZvKPV2XZeFGJn9OnXzHjITs
         N1HK30EsHFpo1krtyVMOW0jNSvqYI+oh4v5jL/fGaTcB8qQ2woZLFZ3u5OTNAa2RZOmG
         BxDTP1ifm4ZWcHN/dlSU9VI1KYs5jOFyU1GZNQeg3aMyVt9ESwdJ2RWDjSxNZtuTNps4
         jqIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790345443; x=1790950243;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dSAwvXSu0z/cPlAloRsBK1Y8v4BwQK6DKrIQDBSZuBY=;
        b=ab7JZaKiyWP96JqU9m2ilv9GPXuMZlN/kv2p8D1sQnCa5zun9udU9H3UIc5k5kwjq/
         GiOBf+RXncgduqVqCQmujLUPNor+jNEFlST8sP8HWKHXMvohi8l4Z4+rGfxAZ/KtPoCF
         fkSmWYsC7u5FkGaiugzaaH7tyKcDDU/sPlrFD20PlnXvBmc1Lr+PoWTrOae33QS7I3Vi
         DdhMovjKu/P9phrRT2Q+OgA/0en4xygJ0W4vM6ezGM4o2SQHJ7wtAt33Y9alJZCij7BZ
         R83zrgP8ILYgpTCcABPuNnXglBEJJi5TPpZC/Cjuwo3zUvdhHuvC8kO+/478MOgw6ATQ
         bU+g==
X-Forwarded-Encrypted: i=1; AKwUvByzYxO3dXK4A6Mdtp2GNL3R0zFfKNRHD3FCcYsYBRQdS/Qh+mIHawWud4dtEIO/cGugV/bbhg5kIcvmQXY=@vger.kernel.org
X-Gm-Message-State: AFuF++knrYhLQ943JMgcYHfgXdow+EcvEFFRQhidYsJOgWTO6fO5+7Aa
	67TA56AQBCMBBQnpBqZllTGEubaj5QZBOT/lYa5XiW9KAYG2vfnx8oDbH/F1RoBeNsZ6AMNmphL
	yxh8tHekbVDU02B3Sl7lAQWl7LBBIdCa96u94rxYu6PtgplSwC4fESPacTKxZlNFt0Ko=
X-Gm-Gg: AYBFou2E8LxeO6rSoAmysBTjQuDKN4tL32St7kBPLMJBZoVHwDL4eTZcdtGIcJa+8YD
	C+wwMCH1DrMaGmXFZ5+vNyqNvqTwf8bQUPxtxUzQsoniZYRh9ouB6VsIRH1aTz7fOTl8xAi5Y00
	Hgk2Cbh6kY7JRAL4SepNxFD8/jF3IZ7AdTjd3blJJSQOP6g1vEUEZePHpAnpBuU8vyDDORnGTgs
	oFr2HxFVOFGW33IcpmSCoevxMNQWzyCKwPDWFi8h4tCmkPqv4M6dQtKn5LQkI0AsKPlpnP5jEQ3
	rUdn/PtBLBX5O6DOebX9Qbc7mw/e/ocExpS2mmgeTj+cTzVoWPfLm0BxINke/y6Qi/Ud2wP7LCJ
	mPFsWUFMRj6yrZUHXABzVIFwBo8bVczQ/esGnLEViNNSmkP3+ttZH8cRJVwEw
X-Received: by 2002:a17:903:324c:b0:2dd:c100:80b5 with SMTP id d9443c01a7336-2df7e6644a0mr43024305ad.48.1790345442752;
        Fri, 25 Sep 2026 07:10:42 -0700 (PDT)
X-Received: by 2002:a17:903:324c:b0:2dd:c100:80b5 with SMTP id d9443c01a7336-2df7e6644a0mr43024015ad.48.1790345442134;
        Fri, 25 Sep 2026 07:10:42 -0700 (PDT)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142969esm11450165ad.45.2026.09.25.07.10.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 07:10:41 -0700 (PDT)
Message-ID: <f8815dd7-1e31-4567-8f12-1b2b1dd451f7@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 07:10:38 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v10 00/10] Support for block device NVMEM
 providers
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Jens Axboe
 <axboe@kernel.dk>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
 <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King
 <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-block@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
        daniel@makrotopia.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Christoph Hellwig <hch@lst.de>,
        Piotr Kwapulinski <piotr.kwapulinski@intel.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com>
 <178998281449.889291.7893229102394463283.b4-ty@kernel.org>
 <CAFEp6-2P14MdYJGuH6ygRL4ZKtLnJEj=PVMx2p+b9L1RuiX1dg@mail.gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAFEp6-2P14MdYJGuH6ygRL4ZKtLnJEj=PVMx2p+b9L1RuiX1dg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA1NiBTYWx0ZWRfX5Pmo6yKEq9rk
 YY5sdIyuWcVTNU20NYnkmaIZj2c2PmGUGX4/9u+LGxadfbVhlSIxSqhWd+oJDHyPfOXv5XmldWY
 UjlIt5Ubj4y37o8IPNsQF35TLDbiGaU=
X-Proofpoint-GUID: HTz6Haql1BUzen0hYSpIPZ30Zez_9McK
X-Proofpoint-ORIG-GUID: HTz6Haql1BUzen0hYSpIPZ30Zez_9McK
X-Authority-Analysis: v=2.4 cv=LNPz05W9 c=1 sm=1 tr=0 ts=6ab680e3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=pXJ7akKBZDLnz8CNZxAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA1NiBTYWx0ZWRfX7+3G/bAqFNI+
 SKbrwsuL0Wa+ycHLhR1VmtK+iXotSfZrkBqossP1ND8jAQZyZwu8wtpG7155RnPECTZ2KVjREoH
 PWnmkvJucONjCREUt27XGdSoqUSr2FxX2+BblfcXlKIqlz3Ntv8xzfHzCKUkFs3vflr16n+mTd+
 Gsib1hctzGyOivPPwVsVhb1iB9SAilT2jpSjED9nt3b7yZl08PPwRjiPvt+6M9O0FCQk5OyycKQ
 vvGTLHdJKAhAmFDQLYaqwoZgyewMpqG8CxPzNapZ4y2fPTzjkj3r1STkIP9iooa6hIYRtTYNJ1p
 r9i49Ev45lMq+cDvoPyY+osG2/lJh2UQBPHyANIZJ8sgve0z3h8rdq35l1B8pDHciLyZc5dPyKC
 kWSlVlrAhKNT8oahZ+s6DSf0j52KeGj+MWqKFzAbtwSewAy6GqbwdqGy+FWcxCgrw9Zd6LJJcIv
 3uuZCh+fCHRrHxGi1tQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250056

On 9/25/2026 6:38 AM, Loic Poulain wrote:
> Hi Jens, Luiz,
> 
> On Mon, Sep 21, 2026 at 11:27 AM Srinivas Kandagatla <srini@kernel.org> wrote:
>>
>>
>> On Thu, 06 Aug 2026 16:38:33 +0200, Loic Poulain wrote:
>>> On embedded devices, it is common for factory provisioning to store
>>> device-specific information, such as Ethernet or WiFi MAC addresses,
>>> in a dedicated area of an eMMC partition. This avoids the need for
>>> and additional EEPROM/OTP and leverages the persistence of eMMC.
>>>
>>> One example is the Arduino UNO-Q, where the WiFi MAC address and the
>>> Bluetooth Device address are stored in the eMMC Boot1 partition.
>>>
>>> [...]
>>
>> Applied, thanks!
>>
>> [04/10] nvmem: layouts: Support fixed-layout as the nvmem device node itself
>>         commit: 9c6cab93dcd47c3075d896c777567b9d8f813d18
> 
> If you're happy with the current state, would you mind picking up the
> block-related and Bluetooth-related patches in the respective trees?
> They are independent.
Should I take the following, or someone else?
[PATCH v10 02/10] dt-bindings: net: wireless: qcom,ath10k: Document NVMEM cells

/jeff
