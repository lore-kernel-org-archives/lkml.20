Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D4B443312
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388608; cv=none; b=S4h5zmW6O5O7J6TOA3RSrdiIQrtf2eJ/1Ze19B/713tFg62+hnhvBEhotxNoLOLrBjtm8Ee9pCARd96g/21wOs/C+62hxon0yrLL9Y38XukZWcZyRBFI1KDE9fM9OUYgnR6OB5zeZujFIc0eiNQzcRoSsETPY7wMySb/cXCxUcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388608; c=relaxed/simple;
	bh=iOVStLhKHnv6aiuKlx4Du16W2rIOp5ORNcollFu6OdU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dr3Abpr2z/45ZyYQCdQXBSrfYf36YbWBuP+ZajfbMBZoYh2xWvZRSP5y7UUcsuFgMUb6kqnUmOvXGRwELeQ1DXFNvnQhemFw1Ouo6CG2p1/d2Yeymswaplz1pn/u8FRVqjlzrbVFeahZtuJbxdpPGM+rdqDF1LA1FxulvxfuW6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k8luz7dz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DBJhBtwM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k8luz7dz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DBJhBtwM"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm1bd727675
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:23:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wUjOy3a9nW/DIDKF7jzbsGx03F+1F4Hb4J4J/5z3Kd4=; b=k8luz7dzD6dwUTcs
	j/JE20IsRC+l+Pkwz+QRkWJn8mWADNXfZ0RcHiwX/s+7JppEq1wLyCt5I9cZZTFZ
	6xbSjWht+leiTv3MIkGL2bj8q+UaT5OnnJfFKuWaCT6zZ2gx6yylRYe6xbZ/t/v9
	vqAmDdVDWgPRTLzpZMJeIIUMfTXoRy2EmUlrzbRyaSugRmf5noTM6Khyk0g/yYPO
	aW+eNMttJjaarc/NyGBaRE1yVTaXo7ImWnUPTs3d8FmnKyNdit9o9fBIaEPudNcy
	67GlsduIO8Vk4ZudAQ6/idtrth5GZJ8EdhqB11WaK+hO3g4RLsO9qwjsRFzd7X64
	dyh7Ag==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdb5ruwg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:23:25 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5bf9ff71075so152670e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388605; x=1789993405; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wUjOy3a9nW/DIDKF7jzbsGx03F+1F4Hb4J4J/5z3Kd4=;
        b=DBJhBtwMxXL+RytYWmSL1jfsPrucHeEmnT9Z3Yum9L92s5BuBDA/+6vUih/byHelH+
         x1RDHou8cxSyAmfTKyQEP71h9NJIi6adWg20uDhOUZY9oWmhxN1BGYPwZrVrOGKys84V
         XTeBAb13ix1Zc7GcZxmXymoAlUzZM4NwUaGLrLuoLHDerV3lLyPv83QjAEHv+EKJ7hap
         ZpScx6C25GR+UlpPCFZaO18Njh8VqaDcJGQDvbd2Odbr2yV1ASERKT2KTfP2tFSlj8Uf
         a3Al/fmJjbyXD3G6Ai+zhZ/MmKP5GN+uwieLrZhXf2EDMh8e1Wj5EDlUhacmTTP0toY4
         JTiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388605; x=1789993405;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wUjOy3a9nW/DIDKF7jzbsGx03F+1F4Hb4J4J/5z3Kd4=;
        b=bCdqI9JSO+9wJ4NKA1aKAgwVhZ8rJlHn3zzsu4AZvtNI8ftNjgBGTn6tfb0tNvh7W4
         Tovg9G2ICAK34W9hEC6H/Qkow4qV+b7hmeCFtdwri30vYk7HzKM8X0ch213SOOX1ejbi
         FhR5eGB74EnHc1EDCqCG76D8VdPZd5ofdbrsEMGXDEfCwVrS+AcqWc2zXP0D+3Kkat5U
         S3SDc1OfvrzXnyU6/IBSAAutjHki21nFsuIPfoAFeipqMxYAuIH7gZd+54bsaVtq+rfx
         nABjkOj93mSzcz0B+sUnrUY1FMMnEmb3r2Nz928SqrDNhXVa2bEFJvDr9q+q/lw/YyOg
         zkEA==
X-Forwarded-Encrypted: i=1; AKwUvBx0nqghs4hoeMuenHgTcn/9nV2NNH5vK5QdxZ20B4EQvpzjv9Mg4Tx6x9HBLh2woZVkeRz+KqAFw3jTpkA=@vger.kernel.org
X-Gm-Message-State: AFuF++k8nx+urNDX+ePrbBP+N9u8OGmLYXaOL6BIaWiBFPxLPwV/ciFe
	KqivLxGlSCgd9kFjT2Sxo//xceqCOHHBeFupghlwe0kjqGWFEnEwQvOy1fNKHaa+DRBoWC4mNoV
	Gjl/Tz95Dv40OJrW3Yn6nNsVYUaApqwPtmEb+eK6UW2XrkfCb1wtkbQ0LBjqxrZaVdG8=
X-Gm-Gg: AYBFou0To+6ab2Tjw+5qH/+3g+eMUIb01tZK6bH+/i839GLP5rwuqKgCD3rb0jBIqOg
	MxcRv/SmTwhj4KAQguU8ia9+R7/PVzBjoCwuJ0ex/fZRgFJeo+ijc8Xcwv2znQkWLAijmj9fKBA
	NNrB0NQ5jzPBHW5aR806/erHmPkhknPWCMlQJpEYBn0/cLogyW6nMpwZKJKRG+5LnRNYyOaL0fb
	e9N4eoJQljdDY/5xqdyWAMQDeZFQZbv2IrOHDOhMbCLXeW0+pr/6mjbCZ3nSbvs4X7xTA8mAVz7
	eULMXfVYcn7EmzSQVnZd2cuRDlY/vl/fjILP7IXqLyPH4IvbGCmm6drrCemM8PZQjsG9UA9R4+W
	0dhS7ibIl6RlfWDm/0AIGyg==
X-Received: by 2002:a05:6102:50ab:b0:799:e864:aaba with SMTP id ada2fe7eead31-79b58b76fc7mr374651137.1.1789388605380;
        Mon, 14 Sep 2026 05:23:25 -0700 (PDT)
X-Received: by 2002:a05:6102:50ab:b0:799:e864:aaba with SMTP id ada2fe7eead31-79b58b76fc7mr374634137.1.1789388604938;
        Mon, 14 Sep 2026 05:23:24 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a3303fc9sm27798501fa.6.2026.09.14.05.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:23:24 -0700 (PDT)
Message-ID: <8a79c948-dbeb-4adf-affd-1fae64dbf736@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:23:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/31] arm64: dts: qcom: sdm845: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-6-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-6-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NCBTYWx0ZWRfX+7qhH2nFnQHy
 Zi5hgFFXXrhNFkE2Mnv9MhUNRAmRc+RPw5JmRq8MZ/XY3Y1C6rkL7xzci99pFHijA/H6X8agsZY
 ZqbkPsbCCfnhmc95I91UkGE158NHU00=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NCBTYWx0ZWRfX/dbSmvUvilHq
 dmw2mAP1jc4OmlOFF3bWbL62ORlY/X/HbocPQ3OJH4sefrWgXLajRmPKBYDhq57CY9dl4DD/hQI
 5ihO2WkPGARiI+pNVelgHO1LWx5xRbD50NDdjN//9AAMecoU7SRq/Ur78y1N3TUlLd8bX7x7XGc
 M/wikflY/FUFluO2wjNrh87GPjwK4bAkYeSHxTjUgPV6x3Q4keNrPK6aUuLmRaVFyVuwHeSAgM5
 3TP4GrB7H9wP/P2eVjIA5MG5ulJ2aLuNx9C7B3P+3BJQJEx6LdclyCM1T00FYB0oIuu+/w8p3Pd
 fqesaZAj7J5sjqNSR6BEXeWXMpzYXLlMpn9wk/2DuDeXxEqZJ4SxHfEUvJ4qcyDc9q3filDg8yi
 ADgAQo94vpHQRiqb3j1KvVGFKYGlx0a+IfRbGJymHFxCZdgVi6dO+6hhA4ioBzCodkIqYtNmsAz
 SDbu+0kP1Zdps/madzg==
X-Proofpoint-GUID: 2vXl2gMH3M58HSVeBL3rRHn5VhPG2dex
X-Authority-Analysis: v=2.4 cv=Ie4Symqa c=1 sm=1 tr=0 ts=6aa7e73d cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: 2vXl2gMH3M58HSVeBL3rRHn5VhPG2dex
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140174

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index b1f6782a3ad9..a5693bc72636 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -330,7 +330,7 @@ cpu_idle_states: idle-states {
>  
>  			little_cpu_sleep_0: cpu-sleep-0-0 {
>  				compatible = "arm,idle-state";
> -				idle-state-name = "little-rail-power-collapse";
> +				idle-state-name = "silver-pll-pc";

This patch makes it less informative than the current state

Konrad
