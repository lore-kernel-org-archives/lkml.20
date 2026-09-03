Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEE1368D77
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788426989; cv=none; b=EM2HLA2EZvFKMq9cluM72Nx9GftyWqN0Txh47WyjWy/GtO6knEGQ63O3aYc+E6cM3S0jFnAN/x3Bu5iFGfkJtvogavRr2YidHM4WbK63EKKUtYVgAxvqkRmK1OqLqIU0W8fWff5Lo25AHZq92nlZJBLGucXf9pEOdGGxKgF9/fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788426989; c=relaxed/simple;
	bh=EOzit4ePQalFdhj1u9LWkuxLUtPDhNk9uR8Y3CbHhOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tjNX3wphFxuWhDFKlbd/F3z7HeQkdfZMGQCweEKZuOEfnnZfP8p8BNAsB8UrDrOqhZvOr3aVxRCUIs0rwHE3xRzLXqKYC/dmo7ZYquuU0Pt1uhz0DQQKRfii05ueNitzc6Az7y/hTKp2e6CQV7F3Ol7gq6EHxhPyTPYeFaabwvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DX/VigvI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bkROVsvk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DX/VigvI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bkROVsvk"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683922QQ3035485
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 09:16:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s6CA3LvUMgf0CwPU1omfs/ySoc6PX9EgIo/ZHobgyq8=; b=DX/VigvIrJ1c3uQ2
	bVW6Hdoxjfca3hhtERWJ+reIwguqN1Pu4Tq9mdarPgjG65zPdknlUbo9vU+l5in5
	eZluYcfew1Dpo/MpwbbFS2YCGjbb/RePVyO20JKr8Olzr7OW7c3K9X9pjPPIn19Z
	7jnnhqkQZ/aMFyReQvRHWp8zJyeVYClI+IcVhBRYXwepM3dpmQB5QbA/cqy9aRHY
	dB8kScArQWj+pN0UbDyD9kyCp7zXgMpa5Qlxn15z8EQh8jEBs8Do0d1ev34Ds10o
	OcOXt8wIPllDcgbKFPG2vzJy7/QmaVBRcBdjzRzk5k+oXR7ihYI15YnUFXgL+Za8
	eKjd4w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5d106ph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 09:16:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93821883e26so54827285a.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 02:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788426986; x=1789031786; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s6CA3LvUMgf0CwPU1omfs/ySoc6PX9EgIo/ZHobgyq8=;
        b=bkROVsvk1U3J3cPblmmOJhlYhfEFTdVaNW2t7c53H1EL8DnUiL1QW1TC6uYiBWAatf
         AKlQiHY0MO2VaZiD4c3oWc1kmEv4Qz3fe3oYpc4s+ebcrq7HozhhUuk49eFWD+09P53Y
         AcXw9WlEt8XUPAI5iYIEmfqhGGBbmpW7+45vWLWkOQTHqZJ20xVjJ0IN4NVshi/pC7C5
         af5GqtIMzNcEOeOZkdPf3bwOwiiplVxmc2jDilSkxWsXS0/yEMNlQPBlLOuHeiIdKvfc
         Ii5FVIuLT2liG0B/Ri3c3/SXfG58YboF6AYhoq26osp0Zu1BHFR9GFaZ4JaNDCT2tamx
         2ulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788426986; x=1789031786;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s6CA3LvUMgf0CwPU1omfs/ySoc6PX9EgIo/ZHobgyq8=;
        b=NMCoxLEAM9Rf4GBaB6PtKzN+LRXhkMltoOCtm/ijlH48OuIPzkJvEVUtgA5rFNZiAk
         KLIsKXgcasjmFDjL5o4ETcoW8mPSTeDjUQmUNCgYglU6O9QlZdghbkzun0oJaLHF79Js
         3zB/7BOfhzTE0w8GLMAPU4iHM6VaHjnQZ+G8Qvh7hFuQh+qMgohlDN56lnr0ChMQZ0qs
         eoZtYjWke0b+1KRNJa+Eg71ip99b9u7P+6cjsJ7eEEJ+antEwKm1DGAbCRMN7w97deoq
         oPJfDrQ957ALRfQN1PUnTr1dKgw/+6tZ8fpg2Ct/ILcDaEjwWNPY75BIH1Zq6Ntwk1Fi
         dwPQ==
X-Forwarded-Encrypted: i=1; AKwUvBygY6nKPJvVeUQ6Yfp0thH2VszO0ks+ZJPdaB/UWDiHZOBX6kbniDtU1V7Y4huLH5U/kZ3/uGOigoL9dYA=@vger.kernel.org
X-Gm-Message-State: AFuF++mzvCYTyb9XtS7Sh3JnMs4eiK4Bi/B+1xY1LlnwZuxYAl3VACMp
	+PduB1BUAGCQquDIIc4Qs9NrubC5pF5ewOOFQcNbYmubUDOJhSnF6V0pmWhHxnoOdGlePtP9Vuo
	m5JcnD4SrV41gj5gjvmB6AVMiVLz499pf8sCXe9jFfn5aB00X+2uF++mOyB0L6qy3ZHY=
X-Gm-Gg: AYBFou2Xdk41xPyIdB9WUjO7VNxn3x8SnwqZcEzhujRCogaFP/bczceqZn+BIW9k/b3
	M2u8PuD/gqk6FBEMpGgZTD/GglwsyH9boYpHYbf6LiLKfrCuZBnANtxQ6Oh1Bu1KnNNycjdbM2h
	+hc8s2QOb2uYa2O2Mg8xWrfkyIByOHu9peNZGRsWjn8ZYpZyPjGneFHoZFdJD1W3CSU4gaxCKDj
	izilE37/FaQATO9vvcWCFV6KAkpP0qUkzGuHV1xM88/W1pBfswxhcfseE2uFtoT2H/tuKHnCd3Z
	k7wkUaWHrM49t03CP/8q1I49X5yGjgs32Iblk/dozbhExTrsJIuamCd9B33kGhH02RdPHrpk7ja
	I4ylE4cgYdhVHwySOx+2rXQ==
X-Received: by 2002:a05:620a:1729:b0:939:48c8:656 with SMTP id af79cd13be357-93960cc57ecmr824993385a.1.1788426985468;
        Thu, 03 Sep 2026 02:16:25 -0700 (PDT)
X-Received: by 2002:a05:620a:1729:b0:939:48c8:656 with SMTP id af79cd13be357-93960cc57ecmr824989485a.1.1788426984928;
        Thu, 03 Sep 2026 02:16:24 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f41ebab0sm71905466b.47.2026.09.03.02.16.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 02:16:24 -0700 (PDT)
Message-ID: <182336df-b505-4ae4-901f-e09c0eae80ed@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 11:16:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/16] arm64: dts: qcom: x1-crd: Mark the EC reset gpio
 as reserved
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett
 <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Konrad Dybcio <quic_kdybcio@quicinc.com>
References: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
 <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-1-f4ab7e4bb75d@oss.qualcomm.com>
 <3f26bf2d-19de-4cc3-8af2-c26601da2576@oss.qualcomm.com>
 <ygyu3t7o2p2xvm3j5wrxp4svzo2rzymvzgod2szhz4z57elc7a@hznrw2e35oen>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ygyu3t7o2p2xvm3j5wrxp4svzo2rzymvzgod2szhz4z57elc7a@hznrw2e35oen>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA4MCBTYWx0ZWRfXxBY8XNdBeiN7
 J/XMv6Cn5KdP+w+nYYwEOBEoKyHSmSpOB2wDrAQvdaCI6zShLgryY+fIL48m6sKlGmfczZhWPXr
 KK4cfA6wpNAOXeoRThDyd2KBqE1SthHWyD9TlTHh5OiQVwBfp/GyWYx3r6zP08ylAZoJGd72fhl
 TzrVfiwelH6oVrIbAX2Rjtow/E15TcK+SanZ4ljkKyDe06S0b5NNFqVaXZehaTKmGMMZnNPgLf2
 jFNlhq+VuwfUULbF8mrnmwWCG+BIb/gO9qhb0dcCA1fpt+ZQfkQkxGUfHGPyKAKskyowDzUk5ov
 YS6vpFPJr+64vXaYMREZnjfwEXBP/mZeQSsUzusRjxP24eThq5sfEKrjyghztX/itdxdQuJjfMH
 UyJDsHNdLwgwDDqoLiLUwh8hJr1Hw89AU8g1l2EYEm85S1kKyMXJKhSs5FiuGgczFlcmfQLQQ9z
 B20/BuEUssHqVYNn29A==
X-Proofpoint-ORIG-GUID: MLKB1cwLiE2Vfof1NseedH4W0Oo8QtWW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA4MCBTYWx0ZWRfX6QxMRR6AWOPZ
 xLVqJZ8LBKQ7H7AKDj6I2U4HYKlBqZZLGwLIlVDGhrsk42K5j0uqj/GXLHNzEJoMjnJQngCDLd2
 kepKpKMKfkHO4LnwJHVtYCma7Xpy3yQ=
X-Proofpoint-GUID: MLKB1cwLiE2Vfof1NseedH4W0Oo8QtWW
X-Authority-Analysis: v=2.4 cv=J4GaKgnS c=1 sm=1 tr=0 ts=6a993aea cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=QOIhewo_p7yaGBQ4SdoA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030080

On 9/3/26 10:34 AM, Abel Vesa wrote:
> On 26-09-02 17:53:23, Konrad Dybcio wrote:
>> On 9/1/26 10:06 AM, Abel Vesa wrote:
>>> GPIO 65 from TLMM is used by the embedded controller as its reset line.
>>>
>>> On some devices, toggling the embedded controller reset line makes the
>>> device not power up at all, unless the battery is unplugged.
>>
>> Have you confirmed that behavior on the CRD?
> 
> Toggling it does nothing observable.
> 
> However, the documentation says this GPIO is actually tied to EC reset.
> 
> I still think we should reserve it, just to be safe.
> 
> What do you think?

I believe that contradicts the reasoning you gave in the commit
message then..

Konrad
