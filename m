Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C2B4D90C6
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788789112; cv=none; b=XpZT6W4kR6x7Xwa606we3XSiFT1HmarpN8EDYUuECnQD5ca38pdJJDWMxARgNbBAMyCyOlyX0z/touCQ5Qha9qwclV5pUSFOdwvTIgc3lBYnL1UQOQoB9+1XpDvjQcC6mZ6fntFgpbn7YRCa5/Aj5NSRwe6esVLk5l2PIbGdq2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788789112; c=relaxed/simple;
	bh=VQ6kiCGze4ndD8UL+SDJp7bWahLizfXIwA6pMOHo8jE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EY6JpOpcEAhuC493z3TXeyHwnDm4bPdnnkp4a1reBTiUxHhB/GJFfukF9VPvWCwabqcmsh4H+EpyNUfUcSDQJbGuCL7QQ4IVbYwc0BuFE+zAss/SzbtQfiDJGJvlkFWN4nvbKvKrbSWDzHFs0WFHedgeLJm1NnznnN0qGnxFFHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=edyNvj3Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RthW/elu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="edyNvj3Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RthW/elu"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687DdmuF590421
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 13:51:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Kp7LY9QNe3eEW83caIEVbreVyFyPEELLkmLUIFtk5E=; b=edyNvj3Zi7nS0WhV
	zEkSKS8uSFr9w9JN/dGrK3yJMKggf2MfAXi5gntA2EE2Z67igbjT7sXEgR2/T/th
	0XeVFIDIwVKCcuKPMUA2fR5wKMJsF6Qx+ykDu+NBjXGIKmc9OOeeAX3iaOIjEekk
	zmWy3c8Vj7hl9cJYeNV82IguO/WGhVar0cxd7nu2gDouqPCml99m3yoXqXklh1ay
	IrmI9j+NAKsDHjnVhN9Sv5oOEPe/fbdpWcAwyx8z8tQQ3JAdqxSPJBltMIwz8mZc
	emV45a9sODzvqpn52nBK0Wx1JTmlcAd51Vjotc6qIRfHCQtMJEkIsGNYzUMWGHBZ
	e8sGdQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtdqh2an-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 13:51:50 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398d0010cfaso7087554a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788789109; x=1789393909; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Kp7LY9QNe3eEW83caIEVbreVyFyPEELLkmLUIFtk5E=;
        b=RthW/eluTxzYtu8j1GofXit5TBpum8geE0PzlVOBlNwTSRqEtkFfkLfYuBAHyx6Ul+
         n12X0Whw5kQQfRuGrI+ztDD6OOfrgm72GM0O4BHQ5vFedFx0Kzl/lfHG56hImSUPZbMy
         xzpgWqQj7/RXWw08EMXr0cdCUqiNnUFIGpAlh50jH5OSqPu2Fbo/7aXn2QtQI0MMdqbP
         arr4u/BXPLgQ91vPFj0BeYyoml7a5+FzsmJLaOKGz7avh7dpTemwGkzKtTmOyPLF5Q3g
         18rXTpAtU9srLYOZ5c958pR8bq2BD3P4BWNpWUM0t25GmIkqFjrrv1H5+MI77dz+H9j3
         mq/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788789109; x=1789393909;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Kp7LY9QNe3eEW83caIEVbreVyFyPEELLkmLUIFtk5E=;
        b=OiuJzOvZBmb0NsAAJqFAMoYCxjt2ubOk+ydUUC824PSNoKcY7y6PWigHkSOGNZCRzW
         dMei7tRpptYc2wMVsroyFvbFOuU6u98O/0R9+KClG49MDitFsp8uc6a8LB0ehb2/mkHM
         IHSDQwM+zrI9SQ/8LfqlNIUeWKUf5BBZRhrQ5Ju5HufJS9TK9VpfjB097A81Uerm4oC3
         aUq081wD0I655Pbwpxn8KBR65uvTORxCHB/mKxNgAL1t3gQQrtvaZcLzMHXY/n/APZVa
         N6oCm/LNlJs8eDI8b3aeIoEs70SPOrE2OmTYaj9yR+tnIXqfaH2Kj9PPEvrBHWbhiuma
         ym5A==
X-Forwarded-Encrypted: i=1; AKwUvBxfNRgS/sU2m5ywyp5OnAPSMZxcQJtz8jaFZDOkQ5rP0vtK+JBg3HsMcPmHbVnXTNs5djklAQQKZsJ7tyc=@vger.kernel.org
X-Gm-Message-State: AFuF++l5kr76b1Ar4s6xlxtP1TJTkTPEJmfjpVW2ZwI+Q0ILMJSwdeqe
	26k+BcF1npUTM9h4ErgJxNJj5Vd2hi1ZhkGHyBQohCs1B2HjP3Bp8t0rRp5rARzYF3NXHI9Kcr1
	FZFtB6xKSBVLNnWCpUiTQu5tD80WcBGV3xFaMQYQAlJdryRr1+lc34x9dDFBxHhZ5DtM=
X-Gm-Gg: AYBFou2iQSvpiWlEhvTDMbIYrpP6n/5No7PrTUYQJVg9uDY9MwVyUgJmcIVHZCIV53f
	FOhu//32/7O3WhwcWcllnuJ+3oGFhQUouHDF1Zhz8HZP0vLZfc+tj/rVIenlDX2GBgj7r8swWv4
	RQLXWJbXHEDGxC0B+TMmR5kHSUCLVPCKlAVd53bKAPQCOERK2uHu0HeVmKgLFtZrV724u2UnVwE
	nVvScovb6+mlIe3ZUvESfbqknFHdd//J+shuonGJoJc0o7p6Wfuh63/ZB82D/dRzAoYbUKKGus/
	R87Z0o98NWU5QXE/tfArvTXD7MZ2QVBKE7kO3FCTyA2YsJ11KXuKJoAMgKw20z8rLJhOcL5Ufos
	2SFnhFawo9W0x/CPyVnCw61xAYvnGj0o=
X-Received: by 2002:a17:90b:50cc:b0:398:9be8:ea65 with SMTP id 98e67ed59e1d1-39b261d9da7mr39790566a91.18.1788789109322;
        Mon, 07 Sep 2026 06:51:49 -0700 (PDT)
X-Received: by 2002:a17:90b:50cc:b0:398:9be8:ea65 with SMTP id 98e67ed59e1d1-39b261d9da7mr39790482a91.18.1788789108833;
        Mon, 07 Sep 2026 06:51:48 -0700 (PDT)
Received: from [192.168.1.12] ([223.230.61.94])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243767e1sm23752649c88.6.2026.09.07.06.51.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 06:51:48 -0700 (PDT)
Message-ID: <6475d1ef-0610-4b8e-9750-99681ca5ee87@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 19:21:40 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: shikra: Correct QCE node
 configuration
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260907-b4-shikra_crypto_changse-v6-0-0676f61894b3@oss.qualcomm.com>
 <20260907-b4-shikra_crypto_changse-v6-2-0676f61894b3@oss.qualcomm.com>
 <iow4xf2uflvjduax55tkbhaw2r4436uqvys22u6pbm3ry2gryw@g777gu46cgin>
 <841a008a-1ce6-40f9-95ad-09b4abc7456a@oss.qualcomm.com>
 <CAMRc=MefGHidh=BH+iF-4F5hJku333p4OMe=g5p7dfw_ieTfMA@mail.gmail.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <CAMRc=MefGHidh=BH+iF-4F5hJku333p4OMe=g5p7dfw_ieTfMA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE1NCBTYWx0ZWRfXxt4CTwgJJzDA
 A9NNYdDnkHlAy2ql8lH+W23BzmQtV41ugPLv5QQB5S1TrJiQBA/Z4XTpMp9oBec5jepnf8dTQij
 AezhTXH3/0Q34LP3Feraa8tmJENBkvkaoOw8UxdqLLvuFlBMK0naaklLS4cPhymtYts60AdfG8b
 AjYkMqEAJM9MzBEGa/MwGiBj5EmHQR/BOeTcSOw5TW/DqIRcCWapuN+H1ECRMV+buVjXtIIwFgY
 rw9+H96dQ+Xtw7CdcVRtcngxwOlT8PzSpgue1fgyJoRfY6/37ZVPnmYmN+RJu4f+AjWJVeyq847
 wzQARzrJXvS/stiLV1xrEYmPCQeKcm5r9vmNOmAtA+AKQ3va8v+HYIMxZh/0LpOUXR9OV2tXdKv
 ztbd1bbKCU9qotXHVz/zUGb2Vm/EcnC4ieMoCMBvmkLlATISjnDPKkuEnInci9J2zOhEv2K8Iy5
 5dFXlxeWkaoH23z+YKQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE1NCBTYWx0ZWRfX5k1nsQokpFCR
 h+4gI0+iUO32ZeOoPvZoqd0cNATbPv8/28ROjEO0a9YPBCcyXi53BL/IuXM31zfiUmiTnSpP4G+
 cwVHsKsdLfoPNc6ZSJtjNJweZuCwebw=
X-Proofpoint-ORIG-GUID: g_4yO7l5AlqhfObxkPz-yGdB5RN0tT0U
X-Authority-Analysis: v=2.4 cv=U6aiy+ru c=1 sm=1 tr=0 ts=6a9ec176 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=YDt4qybLIboWMMC/SFNjLA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=X6FU6-3TaxV6hX9_o7MA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: g_4yO7l5AlqhfObxkPz-yGdB5RN0tT0U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_04,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070154



On 07-09-2026 19:14, Bartosz Golaszewski wrote:
> On Mon, 7 Sep 2026 15:39:10 +0200, Kuldeep Singh
> <kuldeep.singh@oss.qualcomm.com> said:
>> On 07-09-2026 19:01, Abel Vesa wrote:
>>> On 26-09-07 17:33:37, Kuldeep Singh wrote:
>>>> Shikra is derived from Agatti and uses the same QCE integration.
>>>> Update the QCE node to match the underlying hardware implementation by
>>>> adjusting the fallback compatible and related properties, including
>>>> clocks and clock-names.
>>>>
>>>> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
>>>
>>> No fixes tag ?
>>
>> I was having confusion so didn't add it.
>>
>> The parent change is in linux-next branch and not in torvalds tree
>> currently.
>> Shall i update Fixes tag based on linux-next commit only? or not needed
>> at all?
>>
> 
> It still makes sense to add Fixes tag even if it's targetting the next cycle
> and fixing an issue queued for v7.4.

Sure, makes sense. Will update in next rev.
Fixes: 099cd05d200b ("arm64: dts: qcom: shikra: Add ICE, TRNG and QCE
nodes")
-- 
Regards
Kuldeep

