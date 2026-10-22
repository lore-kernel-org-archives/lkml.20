Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792657287;
	b=qFId4xl20BpSsmnTGu5WToPTrsvGEPnjHqfgvAs+PKTYHOvRphrIejUkzjdilcbPQUE4
	 RDMi83fDIEH1H3PNihPX07jbDxIAmZ7JUcJ6zMCCjMtA8/yl3ERwEC3GeW89brn0vj3C2
	 SA7LEPAIadyXfKBHLqyDgTQQs/Jm/D0MWWkav3sf1V800c5E9D1h3dzMC+7c4RVZuGMvY
	 rt0/aX1YjVnblGz6UBVSGOs+Gv9fInhMTVHQk+hooI2ivWgQaAOL3zaRfYIc9vuZC9pOG
	 7rAlRlAEYnOTNVWGaaxlCv6l8LnrJVP71Roggbw/V6h63VLzCucB9vTWKvOGXSZRKEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792657287;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RPKC0G3svzZySgdTXNHviH8utgpoM2NG1yCxQMLdS6g=;
	b=xSKflEZjmVeBu3IAoiJh0HpeUXzgcZH8Uepu8kuVJHmmfgRqhX/aioRaYEnlc08rvDbJ
	 10nMQbtpBhwZ01sUIj31OAOjvpe/na+vKSbqCMPhMiws0QnSzrrnZi+3B5nEf/wSu2W2C
	 +VjXinmu/zD0iAf1p4XwdM54QyFiMfwtI/L9+IQTwnlyrBcxylPo9XeKeaIl+nwb3DeVD
	 WYvgJvK+aanmVu+7obxKBsdlVQ7uk9cXbR8iLrjWLa3TS1zCk+Dhc91IQh6Qr4xoVTTAG
	 Ym7cIb2NUcuP4LB+i1cQlxa82o0OlLwft07iuOs10d53lHmcRlxUpSxda06f/E216pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kn5z8E4e;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UqdbrkDA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE96B606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE96B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kn5z8E4e;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UqdbrkDA
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M7072g4136673
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:21:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RPKC0G3svzZySgdTXNHviH8utgpoM2NG1yCxQMLdS6g=; b=Kn5z8E4eI7K/JXRs
	FKquDba+8ziR7L+sCHEgY4v+EkWgG+ebGXazLHfA8L3jGRW3/rH76cwVr+0ascoy
	pDePS7cQ2DRtll529OVK/4nKwgUE4BF6bUQlndogx6mKDKRudBG78QlB1KFwKZAa
	huwXVWvBXS0/fywhgFlBDIiG02fc3mdI3TkyG2HisuGw82qtn8/G/otIYNcHW2Ub
	mb9gLzxQP/Y0+hxS3/DTlRV37A9oYhRykTDYo78aZZmb8yh0Y4vDdMwz7NkvFzKe
	lXaPGCvUbsAQyfi0SuDOXmYMCzhxjoLzz7YetXgo3nEHmaVgYSziy/DCUrhSJOcy
	XfngUQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93d9e4s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:21:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2bdebfc5so45610985a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792657285; x=1793262085; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RPKC0G3svzZySgdTXNHviH8utgpoM2NG1yCxQMLdS6g=;
        b=UqdbrkDApGebTTgu5I33bJTgjWVVHZZjyeRFx2QrCixg6NWz9jW6GbTPS90SpKnO1t
         86wkVhhbSgt3gf/Jo7YLHoxX6LQ2b6oYrKM8MdiviE0G3j3ugH0arnZGO20A0M8S9U27
         1RBlvhExrpf7o/ac3zahjzYTxpXFYdOd8BjtICTvXagmJvclq7gDPzAcDH7dwWow/eBw
         iF8+7oLInVs2KA4WdyXyUaS+zyqwsSlbGY8b3v4hqJEaGFchb9v+6EF83ubbyvqFNSi0
         t0rUf93KzOm/fPjnlP3p/twYK0LYnxGbnOsrpG3SZ250mxtPCD7VDSMHCp3pYhSl+r4V
         IvNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792657285; x=1793262085;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RPKC0G3svzZySgdTXNHviH8utgpoM2NG1yCxQMLdS6g=;
        b=2L/imiYObRT6Rcj6BX7xFZn6hREJoRYDZC8z9dREzHPbELhX6x7Phl16csizLWTKIx
         z+FdfIJUuqiCirYBoxIXbZgkx+z4DisF7PA+Cmx0SqdC6oaJvZFR3flRxplf1miPEU1H
         8b5k5j1UoufKQYWPeBV4KXyxTodKGDBN0ipLuBP9jRgonu/P51bwn7gaO72gsX29DQXX
         kB1ZXcT6U2K/q4rRfPudLQty9xX/8U6SXwSsb+G6/2Uhc7ps0ZVj0bK6OSQwHf4jCHyA
         LLKFj1Q64FkyGH1bvRXeCtWGEP/tBnmT+QN5eNBRCYRqGGHpYKyaLqY7rWSFaUu9IuUR
         iBKw==
X-Forwarded-Encrypted: i=1; AKwUvBzjXkaSwfbMXdjpsfvTtgdf08MTIQngeB/dd9JGw6ivU2hV7CymthuPH5U4xsoBD0oPwYt/0Xw4pPSU4c0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKORRSBdwjkD2b/RY1xknmiIIqLGmERNy7qayBh4sbnAxhie4Ky
	utU4DUZs2gTrBRdzVtiBbCytSb9BJgxC4pvVsNVm7jDhVSEcu9gq8qGTqcYXwPKRC8+ikdCt6Xj
	ymSeN/Dz0/0XzrufXKAY1TBIp/pphBRbeanIXzXHaaweIRrZB8GnokBfm2kijX3iB16E=
X-Gm-Gg: AYBFou3j6sdAKwLH9JjElPLo0QEfv19gWVvym0p5w4iz2BxNV9Z7Rkz+gz6KvGqIH9z
	qJfeyAUtjLIRZclBgTID6yVt/UWq2qdDHKKDagR9/KM5l1hYTwmazORiPjbWnUwQr/jfhJjSYgN
	s4pXSnujvfVejJps7JBvapGyda4HQa/VJss7UCMu2kjeZe31AuqGMlJ5TxxTk4U3FpRb7OLbj5n
	5CWQFg0CZyui/pOkROXKX3U4ft5schX1mScBgd8KZd99o0nL9ckV1VPy0CYn5ZLRf8eTN5tJ212
	BSFtVn2AHDDpp53nKsY9NxcZkLbOasqOj65NbKJzBABRlCUlpnI9PwsZz9VZmVddn/dgUv646YS
	tAzGyIi7i3DCnrtOfa8xo3Q==
X-Received: by 2002:a05:620a:19a0:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93f57f72681mr910049585a.5.1792657284981;
        Thu, 22 Oct 2026 01:21:24 -0700 (PDT)
X-Received: by 2002:a05:620a:19a0:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93f57f72681mr910047785a.5.1792657284557;
        Thu, 22 Oct 2026 01:21:24 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a5743bfsm78940566b.44.2026.10.22.01.21.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:21:23 -0700 (PDT)
Message-ID: <79ade748-b8fa-4d9f-9ac5-7f1635cf8109@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:21:21 +0200
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
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261021-talos-dma-coherent-usb-v1-1-df0400a2c64d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021-talos-dma-coherent-usb-v1-1-df0400a2c64d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMyBTYWx0ZWRfX060xIaVIlXif
 20T5Agrzz+ZUli1HQnu6155FdD7o4GT6it4UlL97esjSa7Q/vj2ebTxFl74oO7kwmzdrIahfEDZ
 vD/ktc5huIFv/R9WUKw5EmrSuBIsPx4=
X-Proofpoint-ORIG-GUID: 6FSPD902Po1a4pwo4pclpNz-7rYaFFkF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMyBTYWx0ZWRfX54ftlSnyYtoy
 JyC4YU6WZJSC+dIX2qcqkmEapqnfS8lLBcv+Mk7x4iTL9VCKJioV/7kVMrDkDWFY52NGhwhCC4K
 zQdaBJR1ezsuIfd7VV5R7F3aklHcDziU06JxHPfgNSO5Rb/mTRX6txTu9bWKZxQMLp4QEFCYuO+
 56wpKu5bfG7n8I98nyHbxgJhJz1fK20Fu5vVy6zr8/fMfjkyuUAzirQZ5gx5VJVVO8f9yldtRaX
 fnGAy1bmgPMRlsUhTWgZger6RQy9cxGn3Ra24uWNCGFd6mkJIB6laLFdXNjN8fzpEM5qDbL/06Y
 5e6LX3hfgWginABw5QFyuC6IdS+WVzqpRFmdx+f7SVvoinpqV4PxkUx51G5cWq6mkPc7wo9eLpW
 en27WorPaGYfGp9VCaZf5lR6Za6qn9zdJXTvcM53yoHiZJFXYA4RmhcWcIkGMfe8yf4MjYotyHc
 QuspA+SkinTkkKc4HZA==
X-Proofpoint-GUID: 6FSPD902Po1a4pwo4pclpNz-7rYaFFkF
X-Authority-Analysis: v=2.4 cv=TIPQ2Fla c=1 sm=1 tr=0 ts=6ad9c785 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=kYKLuziri_h7pMepM0gA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220033

On 10/21/26 7:28 PM, Krishna Kurapati wrote:
> Both USB controllers on Talos are DMA coherent. Add property indicating
> the same.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

I asked an LLM to find is_rpmh && !dwc3_dma_coherent. It gave me:

- kodiak
- lemans
- monaco
- qdu1000
- sc7180
- sc8180x
- sc8280xp
- sdm670
- sdm845
- sdx75
- sm6350
- sm8150
- sm8250
- sm8350
- sm8450
- talos (fixed by this patch)
- qcom-sdx55
- qcom-sdx65

should we mark all of these coherent?

Konrad
