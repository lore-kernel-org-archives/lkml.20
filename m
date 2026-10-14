Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8634E3234
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791979797; cv=none; b=QD+cforeEPHCuRaKojUQTuFJaBu6WrNuVramr3WV5q9a9M6M/48dSSAHcbvb3zFYPV399nYMYxsoSiXqRs/FRAMJcj77dsehkLiiOHTi8gktM4W0R0HPziQpZtQ/r8FMyDhOcntAGuO14TJUAQO4iI5GZvZsXamrFOQ7dR93xu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791979797; c=relaxed/simple;
	bh=XqXYi6i5weM3CECcTlhKwAMVjyjTUzcxZkU/xTOwNdU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mut2vlbAJsctpwK2gicz9BOuDieUe4mDjpBsJRMZehI28IwG4f59pr4PkR4pW/YLz4s+/B5TXa4AhhswBnpcs/T4J6unh9zRg8d9dTMm6uFRq+h2aowQmT/DarV9ipMbujhG9SRQiFJ8DyEvNAYCajNJz4boSedU4N2cAezkOJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KrZIx90i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NRcnBAwU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KrZIx90i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NRcnBAwU"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E7BXcT2874361
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:09:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cKe/cXeBwiU+47rxyqBvKFaQLQS2FC5SS1uRMC3gpUA=; b=KrZIx90is89wzscO
	37l80+9vWDnpqO29ftNSCGN4L3wg3L1iIQn9kjlwfhYSbK4zh9SUW9+bHLaN/9qN
	YQB77GhruIq5Z3+4OHxuA7VHQjArdhHAXYe3UcX6wQEdaFntzEEtU+UsUqFstAfr
	XbZrkM0fYcyUuswfU1YBBlEGFWMEvQk9YaMCfvlMs2XY5CFQRBnzMoyApNjj9Vq2
	c0HZ3gTwTuzdqxJjLsAQRG+F1V2rDRL9nlu/2v4jv7nSU3jvun+DRrbyvWiYRzki
	ppJOFYtPSu9MJ+XZXZdhJ/v7bYJxFC9Su+7GtwREdZYVh+Ey0EAqz+a4FidPESZE
	Z3KGbQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9yphjeg4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:09:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfc52ddc55so9963935ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 05:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791979794; x=1792584594; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cKe/cXeBwiU+47rxyqBvKFaQLQS2FC5SS1uRMC3gpUA=;
        b=NRcnBAwUOit5VZu6RQMYjX82uA+ouINbVB+Qv7TSZwGqbw9W9hDUcszgklvtk+eFOT
         0lKXV5yYzpskx6LYSqiJPSidv8h6W/pTQFyjnUk2cj4HkTv/N7EQGZbyNfBnU9TgFs0A
         zwUmZ/xqfg4D2N7WrAuygFVw0IyO4DfxsyDhKcnxPcekHm6/Xkw7Pmx1Gq/iJ2JRQRcX
         9rZ5DYsgxZHJuu5ADL1LVKgd6KiD1WUwDCezq+EAAyPa5BDgnNNvagjDY8W8Hhkd7PPO
         UV/fS1vvRcwR5Ig/x6bNIVp2FVs43UjX8HNrdkbHr52Di3bNJw8EicPPRP3h53yXp1SL
         jkGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791979794; x=1792584594;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cKe/cXeBwiU+47rxyqBvKFaQLQS2FC5SS1uRMC3gpUA=;
        b=Jb7UkSI1FFnTu92YsSkTIPHdY8hRtuSRVHKHvcWp0IQkIP9qz6p07u0e6ecRLeRHSR
         BVaUBErkvZSktFaV05PL8zjnpxnO9477x7hNL+1Oj8E26MiFCJ7+oXsO0e1wlLGe7144
         hD7NNhlOsnPElZy6VnGGsGfoJEOWJ5RDxKPmHhRr7srQw9D/uEKBwDc+f0eQvLdW4R0l
         +KMxspresUOzE7FBh0YQNqTNbXEPjPp7q5LvUE+bnbjSB2RLdag9KWXGMF23JedZHA6j
         Ub2CX5jYeWF2XxXhjS26EpTh4jcBkWGm2Sb4nlBTzoZCLHfUmTHL7VcQswvZB1S80M4m
         xPLQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0wy9q/nsFtmzj6NRPV5ME8HFwaJqbNvRR4ha4dHXVCAweCLGvW+BoYGAx02uXT7SNX6qpuN9CjSm2370=@vger.kernel.org
X-Gm-Message-State: AFq9FYJUAxsNLZU8pXRUE1F6i26b1hekAykWNIxM/eaiSlLMfllKyUVr
	pSpJYuCkMEbmtjg+3mXfWnGECq5Nq6EyrEozGPmFt9R+mNAkqDnEX3+x/wK7V/yKu0JC6tqe/Uo
	riWO/s2Qj4go/FKcCJPLMK6OTbZUaUgrqInlstG55knsmVZtlIdvtpm+3Uk2TyXiHYmk=
X-Gm-Gg: AYBFou1jDmG5ge5CoQz6U6No57Gmc/EjAZ0tyogMuNDE/R+zohHU4lPpyhH++HqAh4i
	sz6cutMKpSDb9kO/TQfGmRONa1siGpZVSdZmse16Uddwkay7QpQ/IW05aI0whRMbU350ORU9bhz
	qvqPTR8OelIh/F8LjinuA3NsWeXYW6oYscK6h4XBtCp70m0/g6ddMobvS/BYJWdo/WG+cjAUY9H
	C77ZKeCX3tjabnOQ82YIvHod+l6lA/KjrGkPY8H6Y9OIFr9nxfcWYgogiS5d7wZ4CMWlEwM9Scq
	7k0FsAndqHBj0QS8J0B2JZbZ0wjCX0QDUM969O4Zi3PovP6z/6Em3hvViEA3HFg1Eeyf9QsSYSY
	jGErdocheIbO4Vd0pwBar0uSPvTMDxwZtBPwf
X-Received: by 2002:a17:903:b0d:b0:2e8:9820:80cf with SMTP id d9443c01a7336-2e898208342mr98953175ad.58.1791979794020;
        Wed, 14 Oct 2026 05:09:54 -0700 (PDT)
X-Received: by 2002:a17:903:b0d:b0:2e8:9820:80cf with SMTP id d9443c01a7336-2e898208342mr98952775ad.58.1791979793537;
        Wed, 14 Oct 2026 05:09:53 -0700 (PDT)
Received: from [10.217.240.130] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e841a02f85sm68385425ad.10.2026.10.14.05.09.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 05:09:53 -0700 (PDT)
Message-ID: <a121c425-7046-4a08-b746-908d5a3ef3d7@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 17:39:47 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: qcom: Add Talos Lyra EVK board
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
References: <20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com>
 <20261012-talos-lyra-evk-v2-v2-1-dcc9316ebb59@oss.qualcomm.com>
 <1cb252eb-a7d9-4eac-8d28-8d7781ea430d@kernel.org>
 <2c93f85d-a6f0-420a-9b7d-cd72a7963ab8@oss.qualcomm.com>
 <ca132d7b-a0d5-44f2-8b98-24570a88c9ce@kernel.org>
Content-Language: en-US
From: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
In-Reply-To: <ca132d7b-a0d5-44f2-8b98-24570a88c9ce@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: iOktbSF1FI6HWQM2rMatmQxhZF1Kd349
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0OCBTYWx0ZWRfX2rDkaDQ6tfq7
 khSwNtpgwkZ/8z8E9Xw3tS0KVM7PLKrfs5K37OMY2wI5vTN0Z4iuDQW1ZOyGloEE8wYQNcXeELu
 jOsgyNyvIUiHQe1AJ9rKrXzS5Oo0JQ4=
X-Proofpoint-ORIG-GUID: iOktbSF1FI6HWQM2rMatmQxhZF1Kd349
X-Authority-Analysis: v=2.4 cv=Uv72pOwB c=1 sm=1 tr=0 ts=6acf7113 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=-yIWcSpDq7JthD1KhtsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0OCBTYWx0ZWRfX7jyaBvKvkjFU
 cRQiIW06kfaqKdhl0R/j0DCeeVLCg4mvS5s5VZ5fmKyyPSWdqYAXpigROextDZQoQyJ43UAWdhn
 1DZUDiMm6/PHWDG6QDsXumvSBYXc0xorvIizN4fg1rMTKK8vBQvg6yC9+4T0d9ykOydkjLawYV1
 y/5Bg4J76wr0lAXpCqJO5pk7CM3VUPMplfUgSMLKlToy5lnba1SUK4haVa4tJiO/yOMj6L3Bjs/
 uVBK85txMuU2bTo0z47bBO9nVOCDdONuWWvvH9Kfz6Cb94qbBXuCmuuUad2rbuXh6Znuk/OT29A
 XyI8J0ZCh8yeYncPAiC+avCtFIFVtIhzCixESeuy/je1dAIuTISMUcFbh9bbGj4Q2HIQhF7+m/r
 KzNPIv9TiXFOe2D7UIv98PZnJBI5JOlAb+7xyZMmNy8RGQGKAep/pK8B+CV4HPuLj1KeABHhjtd
 rul0ge1rS1Ny/23gFbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140048

Hi Krzysztof,

On 13-10-2026 15:04, Krzysztof Kozlowski wrote:
> On 13/10/2026 11:32, Ruchira Revdekar wrote:
>> Hi Krzysztof,
>>
>> On 12-10-2026 16:54, Krzysztof Kozlowski wrote:
>>> On 12/10/2026 08:16, Ruchira Revdekar wrote:
>>>> From: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
>>>>
>>>> Add the qcom,talos-lyra-evk compatible string for the Talos Lyra EVK
>>>> board, which pairs the Talos Lyra EVK SoM with a common carrier board.
>>>>
>>>> Tested-by: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
>>>
>>> No, this did not happen.
>>>
>>> Please do not add inapplicable/fake tags.
>>>
>>>
>>> Best regards,
>>> Krzysztof
>>
>> Apologies. The tag was added based on internal validation but Nirmesh
>> had not yet formally posted it to the mailing list at the time of
>> submission. That was a mistake on our part.
>>
>> Nirmesh has since replied to this thread with his formal Tested-by:
>>
>> Tested-by: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
>>
>> will include it correctly in v3. The same applies to the identical
>> tag in patch 2.
> 
> Again, this did not happen, otherwise explain me how did you execute
> this code on the device during your "formal validation".
> 

You are right — a YAML schema change cannot be executed on hardware. I will
 drop the Tested-by from the dt-bindings patch in v3.

Thanks for the review.

Best regards,
Ruchira
