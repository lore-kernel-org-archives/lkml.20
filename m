Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745574B9229
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405603; cv=none; b=YFFBnlyqWXs7gvOTuXDRiUJflfY0VrLKILjnQpEKbu1EivsKSDSa5lQ6Wquan00eTXNueon+z3s7vSRLKEg/rqm4zb7Q04m+8EHNSrpD1kYWy0cuqZ0NNXqh3UaBY+oZev+EmCVdxlNq8tSatw5VZyYdgWq2cLIYDjTt6vC+DHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405603; c=relaxed/simple;
	bh=aIWumpIRlPngpHB3nhh9eNSESlFAuJfAAYhkNH3HxMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rGTe4oAdapCOVNb9+oIvdQCuoT8OmJigwleVeMV5dgdBoObDnSz5MrPg5gBeKddB5QIgTBT7SftoNLeMDyQCR/nima61WtwBm2zanXf7L4Mr/Ds37HXfm/0dBxzTCYYWHMmt+3CN/LX8bb5O752Q9LgQSvjUTuGXp+g2Wqbimww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=foXBBE0C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=adVPKw5V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="foXBBE0C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="adVPKw5V"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OrkM1348196
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:26:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	txws5LB2NbxpgvSkUMWlxM1nVW6O7uZH3iwQVXVS2Kc=; b=foXBBE0CNdHpNRfL
	bFJ4P5xetolMMZheLnLi4PL31OGI3ld1Ve81hbDo7GPwkVa2lMCGPZCiH6OVdJxg
	GG+4oz6SyRCkN9c+zOo/Y2R1XpbHzr1n5cVqwkBDjeFVXKQMqnlktj/mpOLoc2Q3
	OTN+ypoKyivWOzMjGs0twOlYBNf8/udvwlAUx9xHf644z/3pBvl8mBc8q7qzzLSu
	o8Xtgo5VpvnRuCz0U4fmracmiF7z97BYYZ+NC0sctzSTYeehhDQnjTRmwZpgEwaC
	wU49FyVw+05tCTImieq70TmAtjc4t1pPDmpWTH1+rfRzO+ddtVsXvL5bv7IsB0Bv
	PYf0bg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf4rgkkr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:26:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934a8cd3a8bso39288585a.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792405601; x=1793010401; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=txws5LB2NbxpgvSkUMWlxM1nVW6O7uZH3iwQVXVS2Kc=;
        b=adVPKw5VFxvCHheyTNCyyNjldMDsZZmobTeIHFjr+MSiE6S7VyedqvsCwgQjOoaQPF
         JvOljKy5S4ESt2Pkb2y8AvcEB+CjQZaZiwVJOCXBr8U7VBJK3Foqs7FutcEOjXcESu4W
         iKM44OtAEXY72jTL0ch3qASOrqWFC8fDfmY5ehnYpwS5kOJchesyKacbb8doZAcLQHkV
         lW1+SsTzs8vxT119FATLxmpqlkpmEpWgm7dD67KX0InNafEGlFJsoSlddKBXcZRDFSFp
         rNVO2r7nvmJIl/9TarH0Xa7h0+68mCPx+8tV3SxQ1SUb25xSGNz1UqQu+WYgGInrADz2
         3dag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405601; x=1793010401;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=txws5LB2NbxpgvSkUMWlxM1nVW6O7uZH3iwQVXVS2Kc=;
        b=Qz1NMuwOxt+MGy66//jv7XMwv4+2wGXzr6mi2Xs416M1YwZ0mF8JEF/DG7dztnnV0I
         HOOEwWQeZORJtraiTQ6/9umR1B2XYrDOq7lPYcb9PbsES3XLmc5mjZ5Iy7KvF4kaLl/V
         pU/AXFEfi7S5wyBr6vmeVc8WjDbNscxnhmswYW7hyV1Yy+kwyxE59jA3euWm4sxIfy7N
         zJdBd2lhLlnfjzQ2vUiE4aCbZB2xuCYJvZwQACBAPPpOhbaXW3MHMKyENhRVIbnWMINI
         eQxO9SYGcEfvwP9g/Cq0Vz6QQ9k62C4B+Ux+4qyequYupAPY/YUe6imBDA45+OChtFXX
         vR9w==
X-Forwarded-Encrypted: i=1; AKwUvBw0pNiMNYCXuyzTPH3HuzrYAFhass/k+A6nTREWvyClxcl1jBrfGwBEiPGifr5lECfySdBr4QqJ0rtaOXw=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7R2WgpfsYPsIpgwhYgzlmSiMJGuDfkvtTOZEax10DevyLxZ9J
	wea5Aoq1iNWi+oKrbQoD5feDgvel283Qsf0XXYDjx7RfYccoKOf/Eae0nFNEX5t6MVU/xRvj2sd
	j1zA/SfzgmdD21/tqSfkBXoRRK4EwkNBoZnsmBwd5w0n6nc+rwxzmFbpwDS2fWmVmLYE=
X-Gm-Gg: AYBFou1w10kHoXxH6yWfWgEeXImVomiYgbXT2/IpNVsstk2AQ3jWF32YFjQI+Y/MCfL
	KxlNa4B638RxMzsZ764MBlyJkDTc/p8JzLjfmVOeAwr1Z2lhGXCKr/tn4E8EE2qudnh239CaTgQ
	SvbJJ0aQ+wiVwk+cQGYloK2sw1GCyqfDbKJJG8+eE3gszrHgmItHLp4mFI1YR04EPzAJcLUAmTx
	BPAbGVJY8r4iDl4XdEa4wrie/k29JDb8mGoOUKIXxhpnRhn5Ept0Aw/CEf5xjiCzWomcveUd1kw
	EVvNZ3ld27VZotFBd/7ofrXaTqXxm8qJ7EX/KhJiv5uif5y2wepe/IONuzmrlWO8WTBbYrcBfTK
	S+gQu1xu+zWS4t5lhRHe/NQ==
X-Received: by 2002:a05:620a:a99a:20b0:93f:43a4:a48f with SMTP id af79cd13be357-93f43a4a566mr95242985a.5.1792405600592;
        Mon, 19 Oct 2026 03:26:40 -0700 (PDT)
X-Received: by 2002:a05:620a:a99a:20b0:93f:43a4:a48f with SMTP id af79cd13be357-93f43a4a566mr95240785a.5.1792405600127;
        Mon, 19 Oct 2026 03:26:40 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1e9da2sm3935320a12.31.2026.10.19.03.26.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 03:26:38 -0700 (PDT)
Message-ID: <adfd320f-f253-4f13-9e76-3a2305948419@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 12:26:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1-denali: Add PWM backlight for
 LCD
To: Dale Whinham <daleyo@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Haipeng Lin <jimmie.lin@gmail.com>
References: <20261017-sp11-lcd-fixes-v1-0-0eb916c01a3d@gmail.com>
 <20261017-sp11-lcd-fixes-v1-2-0eb916c01a3d@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261017-sp11-lcd-fixes-v1-2-0eb916c01a3d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: oHxDEYWUOB3itwIGpRh1IcLN79RMEaep
X-Proofpoint-GUID: oHxDEYWUOB3itwIGpRh1IcLN79RMEaep
X-Authority-Analysis: v=2.4 cv=H7NOUOYi c=1 sm=1 tr=0 ts=6ad5f061 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=-uL8lm0AAZMNKrp0HWoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfX6m+svQcLdqv2
 hadZvJGX652ortTaxiNZZc0iZMrqQyHT7PywvEENvJAinCB7hF31sXD6mruc7V+UC1kkeqW3WsI
 gukpdOo4Pc6abnmOgON3EQoFWPQ6RR4qcy+PhvmW9enjZjQ7RYD1IycRXpCsSrwYOFm49MKYp/L
 iJWCMz011fwggnIBWTOcDF6yxN8wI0CyecL/eD8EkrY72Qu8InGslhVRAn3BHXnpfKW03kFNADF
 pIzaVBdX8z0SdGxUNMXQXSRpTy1x6j5vfrjdCH9O9NZXq0AOGV4Ui5j0chrVSvrow/BBFBOrLIZ
 x47hRJoh28ZmjhCtpc2E/UtRSOOBmYB6DN6D2hSNB71v+M37anHCk6yUyZHMalF4n7Q96S8X4Jz
 gtsfEc8rgc53uoUs1V1zrSDtoUpQjOZ50IPvJx6dbet0Hmu2o4Lniy4kJTP/lPmgEV05vm++RT7
 UT0eA9ekUkz9cibNWOw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfX9nDoU23GR4F3
 maZ4h/TT+LR82Rg+d7SF4O1LdHQCc+4N5pRJKUiVQgwMZJXiCRH2KdEAnnkRJPhtR+Gai7bPD/W
 +BdOAVsRg+S1x7uSGIUJlr656H+gS8A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190041

On 10/17/26 7:52 PM, Dale Whinham wrote:
> The LCD variant's backlight is PWM from the PMK8550 LPG on gpio5, with
> pmc8380_3 gpio10 enabling the supply and gpio4 the backlight, as on the
> T14s LCD and Surface Laptop 7.
> 
> On OLED gpio4 is the panel enable, so move it and the panel compatible
> out of the common dtsi.
> 
> Fixes: 0d72ccaa1e84 ("arm64: dts: qcom: Add support for X1-based Surface Pro 11")
> Signed-off-by: Dale Whinham <daleyo@gmail.com>
> Tested-by: Haipeng Lin <jimmie.lin@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
