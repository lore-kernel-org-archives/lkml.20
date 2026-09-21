Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B1749E5F2
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789997755; cv=none; b=ukrslweEc0UCLq8oFQmmu3KGMvXw+z7v4BhQ1p2HhtRyKLHjd+KngCHNu/aS9CLBeSiJDUEKP+3mOxcR1xgOz2PienvC6B6eSgOMqflcLUAmn+zvnppUEyEnVY9/FeNH1ZFB+c9NXBJ4mLNK1i0cDUXl9x+3P2bWxoyAM+TV40M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789997755; c=relaxed/simple;
	bh=Pj6ozmh9fsmLs7MZSns+mq0MCLoIzeXiXHUT53zAR3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=obICTsGBmUmAWkDk/u/OzqpVn/hMQHk8WF7/OV9E0L3S4sDMF+YcuC+3+TLXGzzuJERUq2zmVir6Iu26JqlbgSJP+IUlW4HWggPDmeEaUoKJ3tApbjaKfuYYZeG7mWWzBobZRE0xrnAPUXAfzQXxSeOSJmnF4F5m5xdVwtOyBrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hSviSdN5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XYj8E1sQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hSviSdN5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XYj8E1sQ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAeB5j837829
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:35:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FLvo77jmnPz5fCIObaCipUUFD6x8vLYstiEjZostQ1w=; b=hSviSdN5LN1yE0PV
	q3rwlw+kWayzSE5elW84oTO05970RHEikA/vhSuK0powQP21hkIGjvGCnzlR4tsy
	Qw4Y76vuFRjKM5/XIlD7GrNLt03yDOApO1S5FpyWYYLcULTA0kRFQDPqAsiGPweU
	7Hc/q3GsQgb21s6v55WlXD4LiWNUIck51lGfvv0Zad6PeKjliUk24EwcA+sI6Zjk
	yAe+twZKvvY3z+Yku6LeEcAhEXHrYU8/WDOEa6IiV3WgZtAmFPOprMpI2ztbKRzB
	gc6j5A95eWxpfnjFBnOmFpLB2qgZ6KM5fsfmuB0xSYFzjI0PFmoUZ4QMixCgWOcJ
	pz35OQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtwf5j2ky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:35:51 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c82f9e26ebso109224e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789997751; x=1790602551; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FLvo77jmnPz5fCIObaCipUUFD6x8vLYstiEjZostQ1w=;
        b=XYj8E1sQalTzRuRwDZayLUCDekSLftrDd4dO1PhiHU0gtXYYYM/CxK1nsle/yxfoQd
         HI6SXIUgQSp+pYoLAVtFK3r1PTczdBZLO3S4j3/SwXFMQg8oyuuvIaFO38HdkZypi+dd
         VZxlYPQkzGY2GbdMYfQevUrq4GXJ3iOtfmtzePZCjJpmRR7MPZYnMqV1R8jKlQaGRpYq
         XO40ae4dC1N75eNPSzyMIq566OW7gCkPEC2/qorhFn2JtTe+13QBCoruxBwoa+Pyg7VC
         VbO5mKktrFJZ1El0aVuPO2opboI+pWIzoR29OuKV7kno+vkemkqr2MuBL/IMwv9Gy8RZ
         L+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789997751; x=1790602551;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FLvo77jmnPz5fCIObaCipUUFD6x8vLYstiEjZostQ1w=;
        b=Nh6xnz9+r3s2v+4Tfd4FiKquv44zL82+/eJYE/YZuYag96SZ7vU1rdhqICjUnkr/cP
         K8zHBRkNlx/JkkgFvMb501gEympJaUVmFKgLJuEyCuVDPCDJUlPIezC30teetFe/Xcau
         hlTn7NTONYnC1Y0YQ9A1ZR6GdZ3ZKqrLLPq/lJBaj97CDKYk6UzREe+RlCqECUPxRola
         0AUEeLqYEVHmc+whiJmE/64Qm08yMK9LQf49mR+qg4NDPxT83bMh6bBTvNBYHw1TsV0N
         UouDbbwvy+C0lKVWPbbpGJMhxGrf0XojWb/nAl+bnE6oHXNAiQmdNwZUX3BdVZk35pZf
         Deog==
X-Forwarded-Encrypted: i=1; AKwUvBw8V47wwErhK6WDBgcQL4ZTM7r/Uymug6PghQ0COkDMXrXjMAaegWs2V7qscCALZKfq5/rgcB/v9wZ7FxQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mmtDmEXlOQyvpivIKlSp6swOqMzT6tTSa47wDGHqnzMPNAgYMl
	JNmXJglXwBdJqshf00XPz0IbpVH75gs+bI9E5jIdjwESCNe/EX4c978yBB63V/i9kNVYIFjZEo3
	UuBLASsP8CcNZOo9OsVqcbnmVQezohFuT9IY3Q8cc4BnuKHSggUmUiyw2Xqdng84d3Ds=
X-Gm-Gg: AYBFou1gHWQ714j+I7v6bRxBNTiGvK3gQ43poNbdIohdlobKie7PwnqN+B+NgRTj0xF
	jSfiqLtmGjB20MVTV900n1sUOCP0gm6N42buAkzjFLFKG6mmHuf28sIMfNwk6lDapM2Ver+7gz/
	J4j63mfC7HJ8dePEAFe/FvLkajodSqhoi1TnasSFZVdmVoDOR+TlSDEoja6nQtSi8mrz8TcNMXo
	NyVM7CZdrJGCcYmUW1rKK4AkCZ9V4o5f58fYPAnHAAUKhz06XNFh2TH0Tmk5ZPfThBa1+j6Z9iX
	rQ4QehMkyLn8aYEMCJ+Q3LHa6vT3N8XGDY5DxsIf2FqPlp0ZKH81mzQCBmxG7wq7ic6teyMNr0s
	bgz9duOOrozGdARSJrKBDqg==
X-Received: by 2002:a05:6122:4a4f:20b0:5c9:ac9f:b7f8 with SMTP id 71dfb90a1353d-5c9b86e8c7cmr3529535e0c.0.1789997751199;
        Mon, 21 Sep 2026 06:35:51 -0700 (PDT)
X-Received: by 2002:a05:6122:4a4f:20b0:5c9:ac9f:b7f8 with SMTP id 71dfb90a1353d-5c9b86e8c7cmr3529489e0c.0.1789997750828;
        Mon, 21 Sep 2026 06:35:50 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67dd344asm4368300a12.18.2026.09.21.06.35.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 06:35:50 -0700 (PDT)
Message-ID: <4970855f-37d9-45da-ae05-027a605c03f5@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 15:35:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] soc: qcom: geni-se: Correct QUP Core ICC vote
 constants
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Matthias Kaehlcke
 <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        stable@vger.kernel.org
References: <20260915-correct-icc-bandwidth-vote-constants-v2-0-f78eb611204e@oss.qualcomm.com>
 <20260915-correct-icc-bandwidth-vote-constants-v2-1-f78eb611204e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260915-correct-icc-bandwidth-vote-constants-v2-1-f78eb611204e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SJLXx+vH c=1 sm=1 tr=0 ts=6ab132b7 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8Lir4zOpp7cNL01G2WUA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: S0HsS2eBgJX1sjJ773Fb1HFxLqhNaWP9
X-Proofpoint-ORIG-GUID: S0HsS2eBgJX1sjJ773Fb1HFxLqhNaWP9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE5NyBTYWx0ZWRfXw6qqgCAEP2A5
 dFazPv/Vz9eU4tUu6DGBC2Fwaip4hjsKT0O/qHOKXN9Gf4qlTWFSiW8gHxBNE3R3HqYlgf01SqQ
 ZAb4coi0V1B4DnkU6RU2tsumUiL0LNo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE5NyBTYWx0ZWRfX/ya/YrCu9xFa
 ZCCfg6Rn4no8rUvy61A8d2ldOUk4XYhn9AYAQOG3Dk/RngZppOt2qyheInLtr4IRc54B6dGFgT7
 AqWrcZ0aaxZO8boS3y8KX6iFVX6woc1VckbI6FnZHkPgQu+QoTEGacv173QRceNAPaSrCgjZVRj
 DITbQJou0BKHMjU/oKxVlGYR4ErUVHE+Qcqvyjnlc7T1AtHQMzEC08Ll9vFRIpeFi0+RyucLqx7
 0N4vP1v3LRSVf1ZrgmFnOU+ViV7r80vNk0V4J609iX6at567CeYMCAiXALrddJD7sw61CPeeIg2
 GFUnJy08k1oGnugE8MMaTQ5cQkm++IIKrlchU787TZ5BJjIQxYoT3b7FFYzY7YAkmzto7W9dPgz
 gF0peqKYJ8IjsWmB3yvcuLinHFZjyH1pPS2so43DQLPXvonvlIXszshg2JBBJYdU0VrCyYXGro2
 GXLzk4PvoMmWaPrWwQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210197

On 9/15/26 3:26 PM, Viken Dadhaniya wrote:
> The GENI_TO_CORE ("qup-core") ICC vote selects the QUP Core 2X clock
> rate. The CORE_2X_*_MHZ constants are expressed in Bps, but their
> values are several orders of magnitude too small. For example, the
> 50 MHz threshold is represented by 2500 rather than 25000000 Bps.
> 
> As a result, clients using these constants can severely under-vote the
> QUP Core clock.
> 
> Correct the constants to their intended Bps thresholds so that the ICC
> provider selects the corresponding QUP Core 2X clock rate. Drop the unused
> definitions.
> 
> Fixes: 58ffbba6a399 ("soc: qcom: geni: Support for ICC voting")
> Cc: stable@vger.kernel.org
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
