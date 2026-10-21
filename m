Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792583274;
	b=HO/uLLHuZ2mZOXLmI/J3YEhmm1NhCsDVdsOlhr8Ft+Ik+nJ0NaXbxFU6OkJLSeKStkeP
	 UFdI1uz3fq1XUfnStc9KSO7CcurocfdJt0wAxL7iVXB9tBXh+8dACoEcO6B7fVxObl5/z
	 G+G6THEmy2Jb9oXz+KQirhGTdaVXMQ87aJ2KGi8ZgorSCgHrsic36uxNQ3mcte1Yc7fR/
	 XkgyizHkikUZZjZmp2zXiXjf5v+V2gVxmfzguQr7Krqmy0DhEAJFid6bB+OC4yI+M2WuN
	 Hrx2qj4jN0stnfXxLXwSGWpOYgkGf+SOF5phiWmFTleHlnmQ74PBMqyOoTrv6jqf6Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792583274;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NDUHLGZMzCPAMAt4zW3HlLbP5RBvEtH50ODDFpz13Xw=;
	b=ROYL0b6bvNKirr3TPRWyg4dqYmBDOe9+eeNC2eF+UTJKJ/Pm3lE8JvUQjylQvvttSqas
	 ddQSODPznLTxGEyw4VLEAKvj5jQ8gkbMgwVtrEHtcbhWNcbk3uP70MfnNNkcKgeB1dKDb
	 LHKII/IY376H5M8PuphXFJnU7t37iy8Je5ZhLR6D5RWqw2Wob8U7u1cJD/d02oWEjWjsV
	 4JbFQVP63Ynmfq0H+OoiY5O1ylTfWWDRm58h9B4iukceua8wRuvOEPG9ORA/aaAs3/2Ld
	 cnNIuKfc5MuZuExP0B3z1sJhPovcEk0xcQGIfE2cO/TtaDmHnVvGg3GYINawgOr6KGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dpBblJDH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UyZZd7Ka;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD6960A383F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCD6960A383F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dpBblJDH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UyZZd7Ka
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBgLDh4168136
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NDUHLGZMzCPAMAt4zW3HlLbP5RBvEtH50ODDFpz13Xw=; b=dpBblJDHv2bW3nLQ
	Zu/Sjh2kCnB22dralm5jpvyh8VkOvoxtAi6eHhdS/MF7Kl5ZalmHQX5eG2PAsxuz
	E/2lYLUasH26gDSn8ezyy8Tc+bQAVlQOfURbguepNhe+xZEKcS3dteS3pVilOj4t
	pDC2jWq7pkY5rmH4qGXyP2hinv3VXFXINGiTIAjNaQzIhq+dn1nj3RYV6TgYvCC4
	LQyLO30wYeCTXsyrWO67PIlJggjoeBQZwSW+kp5y3OxauqCN/Kt5xz/VgB79iQ8o
	US7/I+AHwstF7FS87xYn9NnzV6fQ8EoeKHQColiMafVsrkkqZf4XgvdDm4CaNLG7
	MiYTQQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0kq60-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 11:47:53 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso1203261eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792583272; x=1793188072; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NDUHLGZMzCPAMAt4zW3HlLbP5RBvEtH50ODDFpz13Xw=;
        b=UyZZd7KalNZdjkocZdXb3PkRCzwUlrJqRrUGVAu0q7jX4lfAbMgHcFzkORP1zHiMud
         DC3fozXs+eIs0mG8l9AtfJSy3OGnUpH+eVfwsJXnbIsr1MXvKJD89gQwmf6XGucjY/+n
         eGZTHzmZiXYGeqkW5h9oEvybU70WRq7jSNbX/HBa1QYuyh3akyoFFys7OHJsSHVdFuSv
         mnsAe6/nFcHwi1X9cXXJKbwUSPdG3H0vSdG4cLwZeB9W+UkYvVSaZnnuCPyEqPL/7Fee
         8Ol0CPqo9cBgzdkbpf4xb23pFrbYN8ecKfC93aNdtZVxOcjGFF8h9vHw296ecnVNzAyX
         G0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792583272; x=1793188072;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NDUHLGZMzCPAMAt4zW3HlLbP5RBvEtH50ODDFpz13Xw=;
        b=ZxU0SAWbnNQ4w4QYtzViHYbLdUfR9hDimb5TzmbpCCCTU8Qk3QsnRS43EbB/N+/ncz
         +90fuK5nowdjCwpDjU0oRR3vu5+R65U9qx4DHsLCZDETf4w/t6/49ZWmk5kgWuM+zihw
         OWhnL7/DGZIuYNucL3GQfMH/BhqLpJtYDT4vYfPnJ5Llwhj441bzh689Cil7cWaKlRSu
         41Annt2hj5JRrOMGlUHBUQi6u0EKK/LNAwd5fJaTiYEgzL+7ZZ27QHZ5BHKWE+D56n/g
         izIzBEqGWX1a2W3zJjEOeSyomtYwRacWzwE5+qz0FEFT3EFm9PzPN28jxKhComrY1+ww
         s9Uw==
X-Forwarded-Encrypted: i=1; AKwUvBybvhiYKkceqq0X4iQOkty5ayfqR+kNllwxPiG+qV7ID3m+BGJcV6rXXeKXFOd1eMKs0L3A7D6MnnDNbvw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxCM1Sqkf/agTxpE1XvIQ5CO/uW34jdqXVV2G58+hBG4V0gTxh
	VFL5o1Ywn5G8XXhG6YqS1otblZq9CY6SkzRZlrTMP+EsMe39p24Qo5v4zork9KTVq4guvZTh1DD
	R8Pjo5Xv05MPX79WyLojRm3M+CjMJm+eX0HOUWPmc6eZz//MCUpDxcKZ6dUvktJjUd+g=
X-Gm-Gg: AYBFou1Iq6Y0VlVpSuTXx4w5fH7YBH1xLFzeVVg6KWeTsOqYPMmPHIbQLF1nhpUEjtH
	hs2kLmEb6QCVHOro1dNhxn7u3NGG3SbX3yLRXe+7DqebWO7vo8sc3AxSfTJeMEk3+VCPdfnyfox
	4ianPzfnDfG/70QnrA52nRCHHVLQa8fZZbmCBe7g8PvM26TG9Roc05el9T9c5pyPyy7Vv4IHqP1
	8sSQIlczy9ztYdDr+5SpuyCgHO6yrjNldzVteR2wuyvOGlWvljJGEwwwK3lW6Ne7iYy05OcCybn
	y6e6Ni9rTfy+7gT5VFMZNwg+jgLBipM7lp+Q+L1UoFDGNcGhOBAgVLhSIYH5/8fQpUKELI+lS4L
	yyRQ6rrJT8BTyv+ltQY4rvOaGMXabaUnFHg==
X-Received: by 2002:a05:693c:41ca:b0:35e:5ca:e0df with SMTP id 5a478bee46e88-3674eb34d50mr2703863eec.35.1792583272146;
        Wed, 21 Oct 2026 04:47:52 -0700 (PDT)
X-Received: by 2002:a05:693c:41ca:b0:35e:5ca:e0df with SMTP id 5a478bee46e88-3674eb34d50mr2703832eec.35.1792583271578;
        Wed, 21 Oct 2026 04:47:51 -0700 (PDT)
Received: from [10.217.240.81] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673b1d0ab7sm7077539eec.0.2026.10.21.04.47.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 04:47:51 -0700 (PDT)
Message-ID: <162c8c6d-800b-46f5-92e4-3a5501ff9d12@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 17:17:44 +0530
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
Subject: Re: [PATCH 1/4] dt-bindings: cache: qcom,llcc: allow optional second
 interrupt for LCP/SRP ECC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org
References: <20261014-master-v1-0-aba3cfcfbac9@oss.qualcomm.com>
 <20261014-master-v1-1-aba3cfcfbac9@oss.qualcomm.com>
 <20261017-shaggy-funny-pogona-69fe36@quoll>
Content-Language: en-US
From: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
In-Reply-To: <20261017-shaggy-funny-pogona-69fe36@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0NiBTYWx0ZWRfX6L0K9yiVX7B+
 5IjwmZJY12TVkmdKNfevjwMuiipVtChfwSB+KpP4dPj2kXtoSXoh9xiH4ciDsFhN9nsPvNNUttz
 9ZkZDa6iI7/C6I2FlICDhjPDrEdPsCOrw+FUDFz21QEwIoQqro4C/ny4tx5dCkt1WxZQDsQ3c6v
 nqsHRGi4Lp7Js/WL1ifdR/EQeH89XfuIa0HF/xnrg89RKAaImSrh2z5MeTgJ+CrhlHA6Y2LocP4
 HeRxGUq5TyEjUJybzBQ6NdPkSs7x3EraNmMlI88igOhv1Qi52H9PWQ5fHus6WlE3bG5j0tNIeE2
 wHn1H9B8ORr0KALp08Sz8J+BLW5HAZJKB4uGEEeuedNE9maXaCMdkCS9AXeVX9cPcRzahPI51cO
 gIPIFZcJte8T+n/4AtSsL/GqUj7bvVUI5wzI1rJQeGFgmjd8c4/PLoks9kbtBUvQGkycPJUdYsS
 jFzvcl3fOF98TWdbE6w==
X-Proofpoint-ORIG-GUID: QijJppx02Sz51UM4LdXsxqoWS2abdbba
X-Proofpoint-GUID: QijJppx02Sz51UM4LdXsxqoWS2abdbba
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0NiBTYWx0ZWRfX3EMxgh25iT1q
 j+HHeECEQDv+RHJvXKxPjw2Pmb1yz+in832a+7HaRMc1uD04oHC3G9srI6zM3J9nIxSA0yG5i5w
 IWoZ6nryO1vRmX0nNccCI1ksZBmv2Eo=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad8a669 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=79Y9q3_J_5CQFoj6QLUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210046



On 17-10-2026 22:04, Krzysztof Kozlowski wrote:
> On Wed, Oct 14, 2026 at 09:26:16PM +0530, Faiyaz Mohammed wrote:
>> QCM2390 (Shikra) has an LCP/SRP block that signals DDR DRAM ECC errors
>> on a dedicated interrupt line separate from the existing TRP/DRP cache
>> ECC interrupt.
>>
>> Allow an optional second interrupt in the LLCC binding, add
>> interrupt-names with "llcc-ecc" and "llcc-lcp-ecc", and enforce both
>> are present when compatible is qcom,shikra-llcc.
>>
>> Signed-off-by: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/cache/qcom,llcc.yaml       | 26 +++++++++++++++++++++-
>>  1 file changed, 25 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
>> index 2141e5d4de63..3546cf7c2519 100644
>> --- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
>> +++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
>> @@ -64,7 +64,17 @@ properties:
>>      maxItems: 18
>>  
>>    interrupts:
>> -    maxItems: 1
>> +    minItems: 1
>> +    items:
>> +      - description: TRP/DRP LLCC cache ECC (ddrss_apps_interrupt[2])
>> +      - description: LCP/SRP DDR DRAM ECC (ddrss_apps_interrupt[1]), present
>> +          on platforms with an LCP/SRP block such as QCM2390
>> +
>> +  interrupt-names:
>> +    minItems: 1
>> +    items:
>> +      - const: llcc-ecc
> 
> ecc
> 
>> +      - const: llcc-lcp-ecc
> 
> lcp
> 

Done — renamed to "ecc" and "lcp" in both the binding and the Shikra
DTS node. Also addressing the Sashiko finding in the same patch: added
an else clause restoring maxItems: 1 for all non-Shikra platforms.
>>  
>>    memory-region:
>>      maxItems: 1
>> @@ -234,6 +244,20 @@ allOf:
>>              - const: llcc1_base
>>              - const: llcc_broadcast_base
>>  
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,shikra-llcc
>> +    then:
>> +      properties:
>> +        interrupts:
>> +          minItems: 2
>> +        interrupt-names:
>> +          minItems: 2
>> +      required:
>> +        - interrupt-names
> 
> Please address other comments/emails.
> 
Done.

> Best regards,
> Krzysztof

Thanks & regards,
Mohammed Faiyaz
