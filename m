Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793958558;
	b=2GqajZN7Qco8vaQnOdEHje4E+D1KGWSLA36BgT2f8FwYsQQBMA4wABqLDU5vbPXR7IGT
	 NR15VakZ+mm9x8DKax90qrLTZaQTPMbdrnC7V9hdJ/6eWuxPeLH1SapoiRMDVLebVRJOS
	 dtza0U49bSL8Mrq/gVDiL3gNeMRPT1rEGFPStuMlegMy0tp89uG20WwH4L14GzxzWS8dp
	 QXKFd9h613ByM3STXuzuMDePPHYDYJXGhHHowQNaLvCbD4Kle+tNaS4AVcg5R3ayTTTld
	 mYtRj9jRwNfT9a7S29xRvLPdcIdytKU97c60rU3/YDr0dNQtgxnrzO4YUhoCY4DEJkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793958558;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=bEiFBIGuKnvGWlaVBGNNBZrHwBL5ZI4s1ODy989ELd0=;
	b=ThFGNHEvbT939l/o8Nl2FEGrTL0n00es5Ay5IGWD49qJL3HF/i4VcC7Qw7MzTCjYjNdl
	 NUGNOEXETTOH735t40JcwUPtwBABY99edI5/nNZIvUsc4x4M+0llbniSAVa084q4/r4gU
	 mQ4SjZUVvMCPLGSdTB34Rr6+Wp4HDZhaevZuqFrAgUTmnubeJRhOvY/Zj0GCSmXpYiS3g
	 1LYgMixjhGNENL1NbjMHIx3HCqg9Fyseret+zcWwuIo95cBq6jv25nDPiBTJWxhnOAqKE
	 t4SoV095eOuFNmbA4WtruOEsdBu5uPpmcua4ufJy4YFy+uxuqzJLNylSfdAFNhe0zNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pXea8PlS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aj36VljC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9116606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9116606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pXea8PlS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aj36VljC
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67R9BN2333817
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 09:49:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bEiFBIGuKnvGWlaVBGNNBZrHwBL5ZI4s1ODy989ELd0=; b=pXea8PlS650CrBWR
	9U1j/nunVPsZNqQGJX2eoYifIm9HumZvhma6qMSE/6uayReFkrfyasEcR+rv7DuV
	gMTFJK2224qguo/3yxPQP1PR/7iVyfBOyZvP3aZUYo+ko6WeMKDvs4HghUyQI56p
	4QVdTjplsAQb1BiDIlyUBK4QvrJfXH/lVk9Gnd7MvgA8jTv0pD6uqUlzmtWYZ0Z6
	AgabRvbyH2diAGkCEckt8kUcDh++DewJx64lXLsqxR58MChdcBTNPIFaFDz1dw4K
	U+bjIwbpWjtrLCfUgZCzCacoQqjg7EJcuc7BzYDSncaPGMGS7+MxEpLt8nUwBQVu
	HubmLw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9a9eu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:49:17 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91e90878e7eso541386d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793958556; x=1794563356; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bEiFBIGuKnvGWlaVBGNNBZrHwBL5ZI4s1ODy989ELd0=;
        b=aj36VljCG/FCzYfOH56u7qZN0wTrTHDdel3RlxwRRRq3YTpM+mV3e3yWwbmsLJ6YUR
         NZBr6JWHw368EJ+BNgKGQQTQtwN7LSvmyY5qsIR3eh8zKvySKhDIlMpM3oTHf/EjLerU
         wOsqybTBgrhthTigMRJA6JX7HQpYC8IKmkdhzNYLcSG8WshpLwtxsWBctW9KXQE57a0e
         mbjUeSa3k53JXZ3HLMQS3D7Z+aI9FR2TYKMjCroXbHjaG2S/WG0ho47rbaIOutGYMZkO
         RIrI2lcMcIFKy0u6Iab7wgg7jlG3cAEUDGRgFttEOMuIZD0hqXSNY0x9pY+FqluVwI1M
         ia9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793958556; x=1794563356;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bEiFBIGuKnvGWlaVBGNNBZrHwBL5ZI4s1ODy989ELd0=;
        b=X87bSRopLfnE2k0qf2u+zsuWgwkJIRsbTahjMJIcG34V+bzBHSUgZVHULM11tHsRq6
         tFCTzv3tJVkg9TlYc4v4DXRtGpAmEaNlflRUHF1GXk+LPylm9+Lg8d2ETjS6JsNZ/cOx
         cNgAPhobhxmQhgv4jgH/WPFTKIJTsDEgB7yeZJXb+4g16LuSqq4vcTJBT7D36TXaC0K2
         DA1pU/qp2EOhkaClYZGxxY8F/OA4XW4/Nduo6SBOPXG/GKD9WbhFZrZwtFpMjy4QImig
         2XbzLJK21BM/4KWNtX+x2I34KDcQhVIx72p0VRMCd7t01GyTBV/CdrIylrA3Lifk7hJ9
         RUuQ==
X-Forwarded-Encrypted: i=1; AL+hErHOc15c9Wci5wXC+PlmGXL9TNaPpixA34ZE9XIK5V7MsUo7234TKmhK1HVpNtMqvEG638o/7ayQRuOrsJ4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fXZkOKrv2EhKQGxHrkUx7w/5+DnHuYU+V1ghf6m+Fe12zywMZ
	Y7QZ72077nqkmLk8RvSZfq+ZAzDay08JsNij4EY3L5W9dHr17c/p4vwseCXseCWmBuudhUUrxzn
	stLQFRzN1d4d5z7bgp6vR1awHImw3KZmfXrenu84uzYd9M8HQe8IkRX7UlHZ+m3YO/HU=
X-Gm-Gg: AYBFou3dRqHuxJ2YbqRbFAPe5zOaTIwnM4z26HBnRCGLVyI3isdr0X3t068a0eqEuLT
	cgfiWVQ6mNSYpE838BMnIWNTtSdg7mzX4SI5ZaikDhtfz40b0WLRIBdwVJoQwd6ApTJQpPnNSMw
	kuKHXNMl/J2bCd38jCWZ7xjQEs1gjN2p6KmMpkUl5mSTdewKpJOH9zTRCq5nRciH3gADZW2lc3M
	gB/ilULM4/G9JeMbhw8UpDGQibltWSJFDW8jQ4967xMAvWm8WI2LoUAzjHmARYk46VYw84PyfEU
	cQMZhY6hpkd7hmImkTeDsDzAXK1ik7b3K6ATfEVo82YyUfJE/pntLG5z6adOBfH0GKcuBKttU8q
	lJ8CVxC0xR/rk8WWO2x78EOmKyl5vtnnhQz3ob+iijvvgJPuGai7CHwElHX2St9/G+JU8dQ==
X-Received: by 2002:a05:6214:1c48:b0:91c:6c27:d5cc with SMTP id 6a1803df08f44-91ea988dd32mr33495596d6.5.1793958555863;
        Fri, 06 Nov 2026 01:49:15 -0800 (PST)
X-Received: by 2002:a05:6214:1c48:b0:91c:6c27:d5cc with SMTP id 6a1803df08f44-91ea988dd32mr33495146d6.5.1793958555226;
        Fri, 06 Nov 2026 01:49:15 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d356e7035sm62951066b.80.2026.11.06.01.49.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 01:49:14 -0800 (PST)
Message-ID: <6f15892c-bc2b-4f83-8c81-53e7b40fe35a@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 10:49:12 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Use GIC_SPI macro for
 interrupt-map
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106073742.99552-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261106073742.99552-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qR6-VEU44PoCY8JDjnkIzu1PTf0n45rT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzOCBTYWx0ZWRfX49CqF/X1w4ww
 8l8jDmpmBHb4yF6HG57H6s3+NZmKpV8A6KW1FV3XNS4KTPQ9ieHncFPI3fIH1u++ditV0fyERSt
 f9Q8OJtQggRaljoMnDUni/g6dObANOakDu/mNx5af0Zb+b5LmKu+T71401MMclZKbHydOgTqp+v
 LKdUzmsSl2PbcdteNivUoikzJGksm9XnWhOZxh8uRhOKK17BBc52gNhI8Awo483IkoJx9savWke
 bVl7s1JdzWph46PAUQ4oI7yAMZngi7yFErSRz9A5RFQJS9ysOjcjBrNo+2OFcS4r9PFhKSIhMmi
 swcv6Rd9G842qxB9Ki/GfFNT6cO2jjymU+He0F7Orgc+SNMYACDrgES+PAupNy65e+K7d4CsOF1
 EpsRnZCNC7Ysa6gilHQt8W9XbdlCOkLghYceXSjJ9hyDYvtf9q0OX/YzEf8jJsgoDZ7Ffj6Cyi/
 Pyq2448nZcPCvA7vxew==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzOCBTYWx0ZWRfX5RkaJVWsC/fI
 wbi0pMP8hkkRdNRQxxYE0b9u9emDWIVZ16DLhyc5QJ2rDwxU0FVrvnylbDoJMFn3HORsygmtYkC
 CacXJp2R/0VekIJwNXf257F+nYydLTk=
X-Authority-Analysis: v=2.4 cv=WMzqzXsR c=1 sm=1 tr=0 ts=6aeda29d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=hdY4OLW_gtqzIo9ogFYA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: qR6-VEU44PoCY8JDjnkIzu1PTf0n45rT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060038

On 11/6/26 8:37 AM, Krzysztof Kozlowski wrote:
> Make the complicated interrupt-map property (with multiple '0' entries)
> a bit more readable by using known define for GIC_SPI.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
