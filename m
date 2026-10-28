Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793206883;
	b=4PlO9PhQmRH25Nif6m/r2I4vhu226maLtvisaV62GVj4QM5MIn2k47CgBk7B2b9BzVj/
	 X5I7ct//X1ywfK0PRTO8cvf1g5mMjpTVlxhuUhg7UcEvKJWykKfMQzIXk8aJlBUvXYOri
	 TGeMKn47FQNKE/KsUf6PyKjkFzIOS7gB9q3vHnf/g4Ndc96aCmaTzSXUOh3jrkpoOMnfT
	 GUh1Zz4EL2iodqh2FolcNnT2U5mB5ZG3SsffKxOc9tZh0Mg6wBcu3LDtyyuvkLBWQ+dS+
	 Cm/2hq0p421ZtKNR1FVBoZlEtwbOeB5v7nyNy7wM/WI3wj/ggWuJNB9LwyAIwZWXYAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793206883;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lhayHAIAd/7qJSQkjboWNj9p85rNaoc5gZiuwlYAOIU=;
	b=LmAH19isAeZ/lj0zMC2x7C8NGHv2EMSj9/b1gEflkfAx0I77mLWIZ6gDEwuEXUw14/Em
	 6AFlZNo/d7kdcFKn4bPA/rtjXklpKFQ5c8Qo0K7CI+H7Lrd8irIX5d7be7UKlJ2kkRja4
	 158/SGNobR3/Y/z6VUVtD+mFgvRriwJ9KA5Egtv2IAmHdbtO31+GEihrlfRBHmlTKwo1q
	 S981d4hJ3hFlQ+LSROLdEYTgsbEQZPE2VHU54m/Ow0Qzp7+GyeWoH8pbzGG4lh0aRkOKH
	 Ui8mk2brLh/eVcWGoYq2ezx5k54VQXBJfwk+1IBn/8B9uKesptJQvlHCi7Exw0x8L6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jzx7GOMm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=agKUjk6f;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892D6606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:01:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 892D6606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jzx7GOMm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=agKUjk6f
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFA2gk599950
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:01:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lhayHAIAd/7qJSQkjboWNj9p85rNaoc5gZiuwlYAOIU=; b=Jzx7GOMmJNrKSDzA
	SZIMJVlTbepskOEAE+Hb7V9tnUdIkpaeibzz8kRu9nK/Ja0bsNO03bdB2n1rL+id
	CNAQSR9q8hfJAcfTbZ+pqoZirypDfFGYRwbn4qq6AoEZPPd+PX5sio6C7OPWkqyA
	YgPZEBeLYOA/GS3k2BuuoqC6BSqOwnmeOIrRpwXTQH3kGBTrF0XauvBjdC5fzHc3
	wE9FkXD6nsah7wag+mlQTghvc4L/b27AoP6AV2WPPXaVsGf/yS15B5fn3ewdcbmy
	rP/IJ5fnciCrt0w/AbStjPti4UpR6C2Bj4Wi2WxOplP/oWax2/3P3EmBjRGqmYGj
	Un3qbQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6f93mmn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:01:21 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a05bfa6af5so985638b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793206881; x=1793811681; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lhayHAIAd/7qJSQkjboWNj9p85rNaoc5gZiuwlYAOIU=;
        b=agKUjk6f3Sy/lmN5tj3bgKBIs141dvlcU3EcvCKxtsgd8wlgDWdRhpaV10Tz04X+rX
         3oAWjlgDPitbhOOZlUI3PWJelbjdPvZijKSHHagAaV9renCJnyf49PuuEczfPoKYKDH+
         5rNbgrETQRNPXJg+MLqb7YF5AcLbSg/SEYWdjJsmcJCAq7ABFEPFd5lybAHueLTv+Uzp
         Rex3emZF0BmL2PZ5yOLo3PcH043lDxgDgxAbADAZF+2SjJw0QYHkBEVhTKaDfcgTByAM
         eqDXClpeRf/+L27ke9/V96FdsqbWljl58pTNdQ+igpLyi90SO5NqOCl120sT40PF9cSq
         8eTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793206881; x=1793811681;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lhayHAIAd/7qJSQkjboWNj9p85rNaoc5gZiuwlYAOIU=;
        b=1O5BQKRT3Wtmg1hl6EWPV/oDs7V3AKsvGbrRHJuLAbO0QsffxUkB7j2Cmct9x4+HOC
         CPYM/vYXQcjrnRDwZLYUTYD1l68ArFFSaKhM0Sqy9xMtLTDy1kzTr/YLYBNb0v+JY6iM
         okVP4KroKN2DDs8xLH7vSRGbruMhtN/Co6JQ3GrxpGYGJAT82FYomd1wUAxvmY1VwihN
         ioeDsyDMGCk7hg5OHQ0mLNwp2sBW8j8X7ob8jt8WO+UL2sJ/LonwHAk2R0t99TttnHZQ
         S9+ar5E7rf+RYUNSx879J8MdHDFdtc9rr/bNybeynryQXcxE3dcXI78SbUtA3BKGsZb4
         CYaA==
X-Forwarded-Encrypted: i=1; AKwUvBzBZ5hYlQVo2wZIEl0b4669jUtzXdhzRqg76CS1ctJJ7X97nCLzij6NQoEcwV5GTaP6aZ/2/R+gqGDhH4M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7x5bzkWIsZ9p/opx7LAyrITV65tsG1JZEL7/7jIf7wxuPHRFv
	6XnB/vn+sheU8scUlaGy6N8whf4XOW7iyKWK6QKVx0tNW9wGGeeZRNpnyjouW/zza8x9TmbMgXy
	pdkYlPmFwOJ9OerRze10Mya6RvssU/4VtPtIVmDzonXyFyQzGI9u0/ryr4G/jh5/jcYM1+tkleE
	k=
X-Gm-Gg: AYBFou3+NPUkrxmBs3PqRC62l4n22raRU5f1TiqTjr/DjPBQc71338ni1U7jxNU8CPX
	++0u0enm4wT6noHsqUMwfb+y4PSip+fZSehHzLeGYuOjG3L82nYl/7bwHohrRfv+YlMrb7/GFkZ
	Lg7kPjnvQP4e5E6xFUlZpgZmzTjs+GZHV1nzyag1sZJ6GhhB5K++NS958TBbcH7d/afOAibJGPz
	5zRA6ohgvSSdT39kxXqlw+p9b1a3/oHrssjVF+pUUnkBeYHk0uozSmrjF03ryKG9A+GxJ40x5ST
	/p+mioTgjPkU/7roiRpQyHm9gXU7iKYM3L0t+vOX1+IU9IIXDnqZFxrr7rCiMLqFJp0RRQu73PN
	yQGbVgcTbXbNhDEP91iNBuUJHMrvRKibLBzTx4U+xI9a1GGjzfJqPM+bX6W2PV34WK49F18KEms
	7YqOLWxTrP9IspNRtuOMV1iBhzukKNsG7KMywZx65s
X-Received: by 2002:a05:6a20:4327:b0:3e2:89c3:2fb0 with SMTP id adf61e73a8af0-3e902107ceamr2367977637.7.1793206880981;
        Wed, 28 Oct 2026 10:01:20 -0700 (PDT)
X-Received: by 2002:a05:6a20:4327:b0:3e2:89c3:2fb0 with SMTP id adf61e73a8af0-3e902107ceamr2367961637.7.1793206880510;
        Wed, 28 Oct 2026 10:01:20 -0700 (PDT)
Received: from [192.168.1.6] ([122.177.241.224])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6e634ae83sm1097859b3a.20.2026.10.28.10.01.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 10:01:19 -0700 (PDT)
Message-ID: <fdacbf99-6d6b-4eab-a914-ce629b7c738f@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 22:31:14 +0530
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
Subject: Re: [PATCH] arm64: dts: qcom: talos: Mark USB controllers as DMA
 coherent
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
References: <20261021-talos-dma-coherent-usb-v1-1-df0400a2c64d@oss.qualcomm.com>
 <79ade748-b8fa-4d9f-9ac5-7f1635cf8109@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <79ade748-b8fa-4d9f-9ac5-7f1635cf8109@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=frhJ914f c=1 sm=1 tr=0 ts=6ae22a61 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=VANyJ50yWUE6IziFVoGcxg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=tH_81DuvWQRpzCUb49oA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2NyBTYWx0ZWRfX67IJt2Z2+CaE
 ITVXEx6MqwHZJiOSR9xJpoLbXAWBTu2/44e49C14lD4aZV7kVNWDHEr/4WI5NIlboVXrdvvlvd/
 nVA3o8qpdzPNLIaiTLstWTiced/ylvI=
X-Proofpoint-GUID: r5_sv0GRELOFW2yzmTVQRdidpobQ6vfY
X-Proofpoint-ORIG-GUID: r5_sv0GRELOFW2yzmTVQRdidpobQ6vfY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2NyBTYWx0ZWRfX3VHQFAi1bso7
 zP54RdiYRQxVfgGtQPRWbaK3sOvPGMTdRtPDT+9qRtmUd2duAOQEJUU0h8uIZHAPguaZ6Ev6n7S
 fyLDPnhkZcPbxiN7Emckca3qC4IOGmMnaFTLL+b4CB3Kb7rj40oi+HyXyrShBKRTxc+QVcHoLDb
 3SrFycyvQgnZ3EKAG8pU8Ao3zcBr6cEYEqasc06HhEC8rOPpR6fAn8flgZ/JKSSYMr0lBsrsxS2
 yR0KOerGiNP0lN7aYeCUdXTyNJ/rR91w3kXGZd3Ppi31JbKbaEkyP4C5NYIMasr4ylJoGU4sp8X
 b2HHs1Zsn5yWnuat6X8TLmsQo3oxmUk0xI6J6anImoyxITgNTLtqwpptBYVJIyPMqj6qnZ8H9OG
 erMDGFr2DD1bjwIPFfNUIDSOaY1ZregfdxFzn3p/QFXARwqSr/hRAN6s0mSMS7zKa57Pm5IwX+q
 /h8D3UrGzo+zUMgXKHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280067



On 10/22/2026 1:51 PM, Konrad Dybcio wrote:
> On 10/21/26 7:28 PM, Krishna Kurapati wrote:
>> Both USB controllers on Talos are DMA coherent. Add property indicating
>> the same.
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> I asked an LLM to find is_rpmh && !dwc3_dma_coherent. It gave me:
> 
> - kodiak
> - lemans
> - monaco
> - qdu1000
> - sc7180
> - sc8180x
> - sc8280xp
> - sdm670
> - sdm845
> - sdx75
> - sm6350
> - sm8150
> - sm8250
> - sm8350
> - sm8450
> - talos (fixed by this patch)
> - qcom-sdx55
> - qcom-sdx65
> 
I am sure for the following:

sdx65
sdx75
lemans
sm8450
qdu1000
kodiak
sm8350

I can send a series for these patches if that is fine.
But the others I need to confirm.

Regards,
Krishna,
