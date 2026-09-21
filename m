Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E840495ACB
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789993446; cv=none; b=cqNBZM7utvokbRKRfZONIBKlERyZXGAh9DEZAUzuUnsc+5mr64sPz1x98Mu2cSHITWm6vqQ3yuhe4KHZ/kbhmsJs9he6x0b0Fg9A9dKB+Mck3G4i71EPWpczThKp/jKbpEuPyyoBFd7Hvz64hE6XN1K0kxOHNvFjr8aDYU22duI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789993446; c=relaxed/simple;
	bh=qCNMsx/uc/pNWm/YO7I0ZBuH71mQrPFF88Bz66g6IOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NERjL1LPlaDUx37J9sjkgCGYWa7/fW3ct7yQ4BPh+ieiB5smvVSUSLV5MtPCwGvmHqqZ1LTQ1IoYPf60Tkw8YBa3hV6eeOV92/qxn3WJky2dbVeFNT3G8Eo6GgF8cwVonH18Q2rUZI1JX9sUrnXU3ffV8Vi2nCS3Fi+NesJExno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OoEWN8g4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Iu4qVML5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OoEWN8g4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Iu4qVML5"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAeARP837792
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:24:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2hX0nyMoB0pgtWjEs7TcbpdDDeGxZEojIwJqmRzxhTU=; b=OoEWN8g489Lgn8XX
	YKqdfKr5J3lRp+o07qYkvbnGt4e4z1pctTxnVUHD7KleCXYybvBeYa7gOv8Xf1E0
	jZhSBAncAKtCLT8Be/awroIpW5/VVKWjDnTdwKyl6TXoHPFZiNhF8DBModXdmfUW
	YQbQfRPRKKfm6tw5mtHtFZgW1b6dQK0JeuodOZ+isMqNbZu4DfXpD4vmr3bbM8+r
	bblD42HjvwR/D/APi8of1YGQm4coMgimUhtF/0XFKWtTvsziL8DjqpobFqVXiM69
	vI45JrXrNbWiE/9ppPGs5nBvrtsk85DBdmdh9P4iuuo/AAHW3cWKSmFYI/rFXLlN
	fSIkSg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtwf5hsbr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:24:03 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c97957d83bso88978e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789993443; x=1790598243; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2hX0nyMoB0pgtWjEs7TcbpdDDeGxZEojIwJqmRzxhTU=;
        b=Iu4qVML5I9Dgc2Yjey7dGHXIwHFGuNUjqr4dxMvE6kZ6HLqzpBpmU/Pkh5rJSoBwRR
         duUl5FUTTy74oyRquadCIQ2lIlD+5r+bx/J9F1/ohQ4sbfhbqI2VCNl3lm1ecUEsPrsV
         dcdDhP6BS5cTPi73DK9Ag/4MLrcCHcaDK+mTo1DFrTGFqfON5WlymHbBRpcnGJriyhPh
         RhC3RPTeh7u1wCw1ZcBq18dzvufCr5mm1mxYoGNUwjtpX3F+P2cavnt0jghlZc3RZrTX
         4xqpvI3j1J5tJAQ17ftngQtdW3lcy6gzySlTbe/GDZEL3JVtXIi5HeCdEKKVnCpHDJnA
         bNEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789993443; x=1790598243;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2hX0nyMoB0pgtWjEs7TcbpdDDeGxZEojIwJqmRzxhTU=;
        b=0Cz1NoGoJitKnMrzLcoAgfEEnlGBhRCZwb6L42WVw8fuxCgIUWHHGzcFE4pk+Soi9j
         HM+eMD7iE7i72dRfjiN0fSK5QQoHxHfTlh+SQuaK1y/PQIV2ZcsDEKWxHepIYFfVd2PJ
         afXWzoFduquC6eSCXANJNxcQZ0t77ZOdQ9MyFY2rkrL3k/kR4D3iyZKyu6WMA+QF13oY
         CKfR3tb5o1+kqpGy8w2EpR0zHI9ocRs7HVVxI0sq17oC4QTb0kRhfUcazJY1BXmn2NPk
         j2bBtoC/+X4UG6gjTAaI2+ArUdYttghs4Db4Z3Nc3UBbrRrjShfgKKEUsRVZvYSHyYTk
         zZmA==
X-Forwarded-Encrypted: i=1; AKwUvBzXh8Yy4ZhKrbFGvOxSW0yWHDvGyzmS3sUwlyWSL+A08n+B79S6u7z5uOFtPjV71kyYixK5qgemxHWLs8k=@vger.kernel.org
X-Gm-Message-State: AFuF++mRig9Q7pHomxYOm+r51cPqzqVMvhjLqZNC5vQiO6UJuB9alzzi
	4kxYaz72MHBztxFr57wHc1NLo9tVDwDfzGslPDrjkxJXST9y+65JD35zt5vbvRsUk3YRndsim9X
	jqHy2dMVc01WIblHfcAJephrFzLiWe04ch7LYSkfW5TC2NZmSpHTCcpgFhv3LqVxhuYU=
X-Gm-Gg: AYBFou10y63wWC1jZNEmea9bLs0I8338dyXAImFKOil74kHEPYHQRlDAnMYJHRkuQt/
	OaNg0YIaHLzYJCgZFhfvJWBsK52GJOGC5hrsJgwPWnuzBeqWQAMLHQrTyZ69mMU1zu4qGF880Uq
	5db51SOZ4dju2iyVenOgT/KIf9Fc7DLYS5GDf6ureHNvfyTwuGOMnUZQva1xp6oK9ZuzPXQW8j3
	5k4FRyHWPcjwLsYooRI4IHRaqYaoQMvigj+KQClW9YcZ3kRG9qqo2WOFLl1YgumohfiQzY1NN7e
	HxdsB6TBHl5ZicBfaw+TA9z19DoUbv9AkuVLJbUxV2WoLfgD59yuvYm/JuxY4pJyf5BgbiU/EP1
	UJc4RGhtzFLN5mlN0iAJbsA==
X-Received: by 2002:a05:6122:4a11:20b0:5c9:91ba:5d7a with SMTP id 71dfb90a1353d-5c9b8a53dc8mr3456240e0c.1.1789993443385;
        Mon, 21 Sep 2026 05:24:03 -0700 (PDT)
X-Received: by 2002:a05:6122:4a11:20b0:5c9:91ba:5d7a with SMTP id 71dfb90a1353d-5c9b8a53dc8mr3456214e0c.1.1789993442897;
        Mon, 21 Sep 2026 05:24:02 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8c7961f4dsm1961105e87.68.2026.09.21.05.24.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 05:24:01 -0700 (PDT)
Message-ID: <579939eb-92b5-45a8-b782-8e79a4366a8e@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:23:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] platform: arm64: qcom-hamoa-ec: Switch fan profile
 based on power supply state
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-3-771abd65ee1a@oss.qualcomm.com>
 <cf04c613-ed91-4929-aaf6-421fe9bb7ab4@oss.qualcomm.com>
 <1612b46d-1291-4593-b24e-464ba2a180ed@oss.qualcomm.com>
 <872897af-6357-460e-9aa0-158eda22aa43@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <872897af-6357-460e-9aa0-158eda22aa43@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SJLXx+vH c=1 sm=1 tr=0 ts=6ab121e4 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gD9UIibj9IRekF7xquYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: 5eY68dAvEtF_iagn8uidCev-H5FmzILG
X-Proofpoint-ORIG-GUID: 5eY68dAvEtF_iagn8uidCev-H5FmzILG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3OSBTYWx0ZWRfXx8CQ6AYKOnyE
 Bmrg05TLM7n1kUuaMXEHnSEbN0Hg0hLKc7pblGgtUhWJRHRWJRiA9XXdDNsjpVkLrL68laBMLVw
 cunfDJAhWVX06ZbWdSGtTOwcnmsqYUE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3OSBTYWx0ZWRfX4FZu7ABfeUHl
 Px+K8nd9mu1eVNB4RNvgOXKmv7KZ+kqr0ZbbxYCK5W2MF4BkD3tIHU0zCXbvMFLVQb0ubtC6ZFo
 s85GF0zAopRMsHvGrY39F5+5glR/4xN1L8ltGXi2gMgeruFQur/OpcfxutJaRYpT1eFwa5aSrIz
 yMavzV7oYQ2Wc0d2Q2r/78TIALjWBc4M3Mr3OJKnMcGPfPdUYNSy8esC5vMnR1BlFKYLS1al7eh
 V96mLvuOQeN8PYbX24JDoyXmvWPRiykCQbgs/giGMOaow/qdDth0XKx2NRwuOsKT0+cVYzh6v2E
 YQ0TKtAJSSeR4EHtbAmUlUdUWdxZbyx8shH6Q6VrTCZA95Zak96+1M3sPoERmnLvasZeWrA8Db6
 05pa04OcuB1G4+ZevrNwFS5MTOD6/RMj7M7nFvjd9i+4l9g6iRDowSJM31n6O9PbVDqsIMa4kuU
 GFSfQuvBfGcEUHRhmSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210179

On 8/19/26 7:19 AM, Anvesh Jain P wrote:
> 
> 
> On 7/30/2026 11:51 AM, Anvesh Jain P wrote:
>>> Is being on a (powerful) charger a prerequisite for entering this profile?
>>> Currently plugging in a 5W charger would trigger the switch as well.
>>>
>>> Should this instead be exposed as a fan profile for userspace?
>>>
>>> Konrad
>> Fair point — power_supply_is_system_supplied() only checks mains
>> presence, not charger wattage, so even a 5W charger triggers the "best
>> performance" profile. And exposing this via platform_profile instead of
>> an automatic AC/battery switch would let userspace make the call
>> instead. Will check on the feasibility of making this possible.
> Even at 5W we're still not battery-constrained, so best performance
> still makes sense, it's about wall power vs battery, not wattage. And I
> don't think userspace needs control over this either, it's just an
> automatic fan curve pick, not a performance setting users would want to
> tune themselves.

I believe fan profile control is very much within the expected
feature scope of a personal computer..

Konrad
