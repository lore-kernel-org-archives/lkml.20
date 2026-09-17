Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB1E4FECE7
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789648386; cv=none; b=dkDNE/FJ9caFV/zEuFTUtUg/zTYdY6XMczAqgTY+PUlrj84nA0FlhGV1y930n6Gd0/h/adWZ2lCUYEEGZ27ozAMjkNBF86MNHxLvzb4A+10HdFqOw1nYAG3kzx/P7yPKkkojME5kabayMp2cAdKb4LHaxlM94+7hgq8JK4eU8EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789648386; c=relaxed/simple;
	bh=8sUxg+Je5s2DK6+4hwFcHBwLu7qlbmqTBaeaUSsFpts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AAKItdLBUbiKEOk3OnVSdIKM8oqOllihV1sE+mjq17NkjHC6/Y1idbZNLfjcM2C6SOackVVglvLAH9g5lTfs4gBu/Cqmr9uf+HBht+m7olgzEWm73ofkDL7oBllkEBMoEoZ/IlH4hj2Kw+p/K7j/HRRhEsaFenNMFhcXv1+Q0GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XKcwq0Uh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YA/ZUFt9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XKcwq0Uh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YA/ZUFt9"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZWZc1257759
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:32:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F/5rCNvs3x9emCltZKgKC8Nec86QM2LMIv2AvFBZi2E=; b=XKcwq0UhG/Ocw67g
	wmQC875wDBXmYTLIfLKDoUVOhLxaAisoWzvnJaVTH5nRVRJDxct9pq/8FO7SYFqn
	0CGm9rVWX4Fx7tUmIyOMtyYVAphOvF0hNWNdUrhgL+VJ8KyG6ZiEXl1rjjkCbvy3
	Hy91LG1kC3sx7lTB4vW4JJStZY+/upiPkuKsk8SE1e9TuidMdJmO/4eKpoXBGWxe
	w31W4QvjSgxRfr2H0TJEtCssWNi8uo3yFvqwuao154kfygfPVLRBJMY9mINLtKG6
	9jxqPhK6SsWNve+l+QRr+SKdfMKteOPVm87Qv4E8HYgpABE6lCD0isdEYfaqPZCn
	UtMZVA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grdftgr5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:32:52 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8632fdf67dfso1091511b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789648371; x=1790253171; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F/5rCNvs3x9emCltZKgKC8Nec86QM2LMIv2AvFBZi2E=;
        b=YA/ZUFt9aXDUD1kGb+oferF1io9H1X9aiUGLUWyiUv7HQ0/2Nrl4YyOoX1r+meQx1Y
         OmTe1Yg0NBmc2HN+485LE7PWYnEggn2jn07Iz+E7nRHosJlpZ+H406uPeYXcPnworc9x
         xu+XPQ55/GOiBz52HXx0qiu7fyF5WEGgOAGjCDlx76MsXdrM/1H9JDmLRq1Y7duWOAtq
         XSyl1uRgCuLobuJGTVbviapXBAlR4XnRRDNzXnn6Xzg5AtD3dz/YwOf/kt0mP0HL3Oww
         HIZ9Rbm/3Oici63Vhot5Au/xj7v2Cncdaumxgk+zT/r0JUiafJwJ0dyDms0YJm3Z5tVu
         zDog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789648371; x=1790253171;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F/5rCNvs3x9emCltZKgKC8Nec86QM2LMIv2AvFBZi2E=;
        b=i1tDvp6VsLEWt2hsDoGJQN6H+EBBuNLANLUzbhQ39MZJqiPfX1xEeM7ED5n8Wk83JJ
         NgeiAf32aDF+e1q7xjc/9htGf74a/g8k1v9Av+GeEWnVGBLZQAfLE2svXFRMsypdZ+dI
         gJUcUFJJTYeP54DAvihl0WigiTimdQgynVTJZANxSu1TIVumDGY9EOd4FvsR+/9d5byJ
         qQPothWVY/RVnaysEwEx+3UcNxyqGSZH3ny61PY5PQrinx61zy+7F+9wOE5Myus6bCY7
         3+KCiNfJ4c6QANKLMlvYaARCsTMLLF3q9mIqBDshnjvTDPaZFyBg9WhzHlBWHGWnxD0d
         eaog==
X-Forwarded-Encrypted: i=1; AKwUvBx5DUerPVFEhfa1xnOItjwXxUL8OuaVjyriAMETbsOvRy3uMsFvpAMSMk2MweuXinwRIZimWKFBvF28RiA=@vger.kernel.org
X-Gm-Message-State: AFuF++kEH0BYAFdkE8lJSBcyj9se3hN3BKEikWq6JBbovGNQJDObhuxG
	RAijJ0J9/6IvtpmKATa1AJbWfOA4hKfkny3qO8quUkIflaFbPY5hvSnTht7XFKsmuUM6PhsaWck
	pKnc3XWo5VnMoJGg0ddm9D9l4XppkDKAUmFvpRjVCxFc0gyueyFToM5zp+WXN64yHit8=
X-Gm-Gg: AYBFou0YroUglT03Rk4W2gxzwSG2d2C9fXrhIVk4e7dbcx7kKlT3VocwGmFyY+ZaMhM
	65pb3/HhjcNxIHNMgFGDIx7X4n9VaQvww7TT7fMFNjBzrbSghFDp16zL8977LyZVvykVNmAEMlo
	yBi3fz2v8OIR5KDIoiSg5c+XJc/bHK0g7/UUQkcwUnfZ5XJAxFJg8/xQeT85HLNZPxefaDpCgFM
	HDiiTk2DEfIPHtRLvLEdL+pIrq4pYDO5jmwkvaHpWSkU8Mm+w+HFdz1jfu5aZngUCX6hFiUuRDQ
	sHp7MYG5TvbY0yyKHk1SzeXB532K/9Io3g7gXNfcpqXUY06/FazhP0K1kBg0bKqILt4CDvTyWW3
	c2Rle1DVH4feNG1DQU1V6BnIfPotG8u3lFFh+
X-Received: by 2002:a05:6a00:c350:20b0:874:72b6:7daa with SMTP id d2e1a72fcca58-87472b6811cmr66291b3a.37.1789648371521;
        Thu, 17 Sep 2026 05:32:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:c350:20b0:874:72b6:7daa with SMTP id d2e1a72fcca58-87472b6811cmr66259b3a.37.1789648370883;
        Thu, 17 Sep 2026 05:32:50 -0700 (PDT)
Received: from [10.217.240.248] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-872025db965sm2754276b3a.59.2026.09.17.05.32.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 05:32:50 -0700 (PDT)
Message-ID: <e893ae0f-d371-4056-867d-ee0cb4cf3ad7@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 18:02:46 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: arm: qcom: Add Talos Lyra EVK board
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
References: <20260901-lyra_upstreaming-v1-0-e3a76dc9e21c@oss.qualcomm.com>
 <20260901-lyra_upstreaming-v1-1-e3a76dc9e21c@oss.qualcomm.com>
 <20260903-enchanted-umber-beagle-ba4b7e@quoll>
Content-Language: en-US
From: "Avaneesh Kumar Dwivedi (avani)" <avaneesh.dwivedi@oss.qualcomm.com>
In-Reply-To: <20260903-enchanted-umber-beagle-ba4b7e@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE3NSBTYWx0ZWRfXwVrqwYtFSwox
 pecphHjYpT9D5P8ynhZaTNTZ/mSMJqvupytDrIYvzFWJ7GR98oFmFBVuahxX1M5NTgbG/7JIeCK
 jazghOi0dgGXDR9VuPW6qWYg3tcsE8y464D20RouP7+PwCt66owjyhBWyQUa9PM7eJ0DtQOblxJ
 +lugjB81lzf1T3kG/JQ69zWi0TaAjsA9PoJ5eIggnZb49r0d6aI3FTf7/MowoI4mkupuAOJm9r3
 ss7s3NIpGeCTuna042z6EzAW0ahn38NEDpW6rIgZ8xLjqiMU93lz53xKqisZ/DppptqlkhfXG15
 g9DOyUK2KmN2UTTQBgpR8ulipmR56OAfCCEC22OkUw9V7P6xxWHRZ6bHUUg4tvxzWKdAzdQoh69
 Q5nKwSb/3/5PdkQYbFOXKikZBch1Q14f/uR+8dLRIdIFePu7Q8el2S4z71bV3W93bnz/+p9WIzz
 tuFyOhgeVd+woHarxIA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE3NSBTYWx0ZWRfX3BqylgdaFIqP
 PIwHltYNTEglEENGK96wIYQqob+xJaSTFULPL+rEiyH6a28zrQkvkABA0rgkr3yQfWEYiehquH6
 EeOwQ/xl38S14R5GiFFCBK2Esc7YMZo=
X-Proofpoint-GUID: hFDOFkferRlihc-BW0fAJAtUo83fwOtH
X-Proofpoint-ORIG-GUID: hFDOFkferRlihc-BW0fAJAtUo83fwOtH
X-Authority-Analysis: v=2.4 cv=K+W3jCWI c=1 sm=1 tr=0 ts=6aabddf4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=ksfHMGAz2zuh8OjjW7sA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170175


On 9/3/2026 6:25 PM, Krzysztof Kozlowski wrote:
> On Tue, Sep 01, 2026 at 07:14:01PM +0530, Avaneesh Kumar Dwivedi wrote:
>> Add the qcom,talos-lyra-evk compatible string for the Talos Lyra EVK
>> board, which pairs the Talos Lyra EVK SoM with a common carrier board.
> EVK means Evalkit usually, so SoM rarely is EVK. Are you sure this is
> the correct name?
Agreed. The module itself is the Talos Lyra SoM, while the complete SoM 
and carrier-board combination is the Talos Lyra EVK. I will update the 
naming accordingly in v2.
>
> Best regards,
> Krzysztof
