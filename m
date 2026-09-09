Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA6237F006
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 11:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788952783; cv=none; b=EscrYHImwAHHe2Vq1zbSUcENxU5IRMRuh33MlbVJhk3XlC3VtCxOi7DaTAl73Exg6R5l1rjGVOv1oqt+o9rqzjTTVpqw/xxI87GVkEQJDmrVQ1enn/FDOof6ds53uZeaHsdkGRm13kAqRUWrs1ULsjCiI9rZRhQotThUiwQaZbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788952783; c=relaxed/simple;
	bh=eETRbzMJn8kFrHdjkPv75pWI84ym/O2XGiAGVOJ3dmY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fg83fezSEMBSRXx1PA8Omk85wkGAmBM2kHrTBYD4hE7DaQd6cotpTYIh29eVWzwfDcuGGNgKPHSvafbDpZbHD7s0MuBw+4suR27OGdRz4vVFxF6Sxwz0EIYhZAbe+LyGoZVT6cbofEfg06Gulr6p1QKemHLkw4IMTbaRic1MvtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gCtARrMh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZGfJc4xc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gCtARrMh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZGfJc4xc"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689Apeqp2084203
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 11:19:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dwNPyXHU4JEuyCFbr1xwWa+OLlqFRb6m/XYayok10vU=; b=gCtARrMhA9M3dbNB
	vhDMIGhuwVkijNSSrJUZtxtvz9cUrHiyRlvO+Pett2QQuwSv90RltunwSYAR2QhF
	bBhWkKcxK/7XF6p9Z4NTkGhRJuYe/KJnq7uRc6xESK9g8/Qvz7OD5EwgdwqJpWe4
	+Mmf7cywTg4mMMTs/fO2bJKeNhh+A9MBpu4o4V8rBzK2NXOgizPriljKWAHNP9Ao
	NoiUZ/dwYFPyBuyY6q0ge++NXWOUikLQ0vJI4zELg0sv9EKkw32TCd8dUvIwvDww
	grDsZs8/rh64C6kpoyU6YXpDVyEL9lSww6KeExHZvb9Ans/YLj6FOWkNz5TZD3w6
	TksE9Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5rgg63k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 11:19:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93821883e26so112613885a.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 04:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788952777; x=1789557577; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dwNPyXHU4JEuyCFbr1xwWa+OLlqFRb6m/XYayok10vU=;
        b=ZGfJc4xcRilZumF0D2Ktsqc/HJqvRFETryG9oA35bAKcTRrZFRjaGyUzD/59ZP3heN
         FPfjGY+HQ8MwdnhPq5hcsjMODNzxoDKzOgx9rtIyvvCnYw9dCabt+jlm7HNZG7VrjPZT
         GNQ1Ngb//nNySpBLRnsm2lrNaWFA+lNc0dp8FlidEm8bGoi/K0QH/l8EAy9I0XYO8aFM
         GrcjapoVadvqP/GT2LvVdISru//Oou0K4cmpIdJNZXNMUWpH36fyQHHiCpgZn6WE9QaO
         7dhy8y9VB1vPw9LnaCn/dam/BK4DrA30Gp0qgOxDdtNBfUkJ6ydNvuDkDIGvPZHN8GUo
         0rXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788952777; x=1789557577;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dwNPyXHU4JEuyCFbr1xwWa+OLlqFRb6m/XYayok10vU=;
        b=SFUi2xNiFE0KMoWJLXPT4TDqJbMEn/zQoe02pdgnleAjHgrITSsrO6DWyeojOj8HCj
         sW20u6MFsUT6ALcv4GO3JXyGkCzSfXOul3TJuBruxMSJIa6SWmahsEjL2PaBEtcMKp9z
         fJgi5Un4XrsrqKlPxH9c8REkwTDCNhzX8+fYbmq2tb78FLs/H8RPtrXniutJXXHKHJ58
         pe9J1EUPK8nkrzr+EDe0DyWFBEVOzUEAaiGJ8WE/AsTd2W7G6IqQSzA6JQ0nkxqnFF65
         1XG3R/LHu9AoPQa1LBevlW2F+rb2u7atr4piVX+IpoEpGfQe1cjCwl+BIla79KKsHIeA
         ts0A==
X-Forwarded-Encrypted: i=1; AKwUvBy+kOHfHBEVOxd7JFvVL/VY6mfFPnTWQn0BJkh9X3SdgS45GkeXqFEfA8ZeV1MbV5KCy+YCoPIFIi39+1U=@vger.kernel.org
X-Gm-Message-State: AFuF++nlQXE9ygDHGDo8V99S1euxOsF9400yeDXg//eYI7x60wyVDY0y
	da6+9j9gKGXhLOp+5eva1/LsmBWGStnPcrEmAfY3Kg6xX1tDN6ipoBgkU78bIrSU2EWThLvtU0K
	rA4Wdb9+0shGO7bs/QaIiSXRwSBwJuDBCmHnjHnog+ZTbfyoG0HdzFC/6vwfMKoT6BxE=
X-Gm-Gg: AYBFou2+gWXXf6fm/N1fGG+xqCBqz9l38nWDcVSByxAHN1j9bskVwZuaK0gLn+8w9Ti
	V3ELKY/pGsUDgov9Knvy76ZDNeIUUR/th7Xf6Obvcq2qKt0aaunZ4VshRTa1VBArHSRZLVvtDy4
	6fr5FefOhEw1Cg1kEVkmgr9sDNtsuwNPahZPuiVkaT2Oop69E+hD2kASv7VzFeMkHmsNnjqS7QC
	VCQQjF1BAo+C4x7yOVnkaB7xlnSTrJbuHU7yR3mlfv4bQqCH6qXrNVfAXbYrhfZU2yl+N+CZTWV
	eK4MxxwkbGKJ2KdxXWlD5UMItWCVrYIXY/w0NyDDrzmD5KWRCEf4awoua71dR3TPZKG8aBxLesm
	0ABIsyucdd/Rwhp9icSBfjA==
X-Received: by 2002:a05:620a:1723:b0:939:288a:8a30 with SMTP id af79cd13be357-93980cc6996mr3076521285a.6.1788952777425;
        Wed, 09 Sep 2026 04:19:37 -0700 (PDT)
X-Received: by 2002:a05:620a:1723:b0:939:288a:8a30 with SMTP id af79cd13be357-93980cc6996mr3076515785a.6.1788952776923;
        Wed, 09 Sep 2026 04:19:36 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9857ce120sm1367440a12.4.2026.09.09.04.19.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 04:19:35 -0700 (PDT)
Message-ID: <5c4258be-27eb-465c-b6c4-a0826904e48c@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 13:19:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH PRELIMINARY 1/5] arm64: dts: qcom: shikra-iqs-som: fix
 GPIO138 reservation
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Anurag Pateriya <apateriy@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260908-shikra_ethernet_dts-v1-0-69c0c5c7c124@oss.qualcomm.com>
 <20260908-shikra_ethernet_dts-v1-1-69c0c5c7c124@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260908-shikra_ethernet_dts-v1-1-69c0c5c7c124@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEyNiBTYWx0ZWRfXybgV3e1UTCxR
 i8w6qjg7R552tnDU6DUDwweG++3eXib94ir4zBNk3zxreV03RZdyy1JHD6zAv5GFYQNhqYJ+yFs
 ep4k79CoKjJyGfQquL8lTQErmkZx0e4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEyNiBTYWx0ZWRfX7SAnI+wc3zxh
 zNy8mGew68CRpWhu7znw7dQKK/oka/gQCRfQhRujWdKUvlZs7LTmvVy25UTQdt5qvbBZ097Y1zw
 81D6c/GKQ9AHQI2Ux3biQ+SztYg227ssdEkvRygKXyxmpfRsC6I8jordX946lukWKRnw5P/Z7TU
 ktsnzg6nVBcypwXWmjkbC9HaUFgP7gT4IfctaXdBrVHQeva5EHt3xzXQIQbEJ6pEGqpY0wz5l1F
 dTAHG7NFpPHeAvoTx+Vyg0yatQ2Ln1VQLb7DAB7Fs6uROhQFl9T6j060XXb3KsnZy2Nh5CwMAGy
 zjR1ZTfPz0w4mrwLs8phR4fgbP/lIalG80ihfUs90AKpWQ7ZuDsXvpDG/AWKIg7XN1fpYmhnC8u
 3va/rcnzN9Lv//dL4BTUI5KUuwwXicQSpsytCF3SkuR/wmBs5XARClUtgWWjOKvW/hqabrdsCkz
 2qqWbVe8K15FNt2YnTw==
X-Authority-Analysis: v=2.4 cv=B6qJFutM c=1 sm=1 tr=0 ts=6aa140ca cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Fd7G5nQXjrtoiyqt_gIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: m4ovh5TOeF6ajKg6Xi1V55AGAuU2RomO
X-Proofpoint-ORIG-GUID: m4ovh5TOeF6ajKg6Xi1V55AGAuU2RomO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090126

On 9/8/26 8:23 AM, Mohd Ayaan Anwar wrote:
> The GPIO mappings on the IQS variant differ from the CQ variants.
> GPIO138 is connected to the RGMII1_RX_CTL pin rather than the NFC ESE
> Secure IO pin; the latter is connected to GPIO49. This incorrect
> reservation causes the probe of the second Ethernet port to fail:
> 
>   shikra-tlmm 500000.pinctrl: error -EINVAL: pin-138 (5d20000.ethernet)
>   shikra-tlmm 500000.pinctrl: error -EINVAL: could not request pin 138
>   (GPIO_138) from group gpio138 on device 500000.pinctrl
>   qcom-ethqos 5d20000.ethernet: Error applying setting, reverse things back
> 
> Replace gpio138 with gpio49 in the reserved list.
> 
> Fixes: 779aead2dace ("arm64: dts: qcom: shikra: Add gpio-reserved-ranges to tlmm")
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
