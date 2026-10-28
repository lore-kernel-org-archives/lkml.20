Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198294;
	b=LsEfGP3NDSCjQXi0c7BZxfu9/7+Dc1Rj5y3koXlL9zwuOJ4OeVDX/KpoOJIk6WSY48e9
	 P5a4DwwUDoiLm7cJh8b/Su7E3TDFMmYpzW5NRD0PIJItpBSSapAkYQgsAnrzbUjCpDd6/
	 64HKnTzBWutFIln2HqoOshCzgmn4M67iqeN6XYMjkgIH1TsNGMcc2Mgg3zJo8Czfv42nc
	 1etd8+vHDD/ZQkYLlZaZx81dTvOQ1GWERWm82kACmGUCT3Kt6MQkE3gzHKQy7orP/MtsG
	 1nq22weNse7Fd2tyZkYxfwbo8K7VNa0W3ByWkZdjqb7luOA8z5WLdbUWeAJ3MiZHDhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198294;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+BJpmnQqZ884dUFJrdWVavAYxVKIGdQfDby5GCSqo8M=;
	b=QkfkNJ/GyyS7koJRSzXLQVp16eJGwhQoRRHmPwFNdPIMqsuhiVJKCR0yhPHe2AT/rHPe
	 +Ayv444uZUxnC+LZgW29ToNQH31zTiTE0yrNn0bed5tXIwkt8F0uqGaA2AwdB4Kd/M95M
	 KEg4RatrRBrIwCodgbuLoIdtC2SbNYUjT4i2x03+abLcdA90cD2Bjf/I1eXoCQ4uy5zoj
	 m565tpKudNu2De9mi/CKVsVySIu7IsLcoRYYb4PizuWmRL7M+P0+4IGjKOanP3eqeDT8Q
	 rCR17DQeOTYN6D+hWIKo6Alqfhk5cl393fBH+2LyfOKii6PDF19xOKKh6kFFCwSmYng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JxMcRL79;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JvHgIrna;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC53606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EC53606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JxMcRL79;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JvHgIrna
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SDIG5j3916331
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+BJpmnQqZ884dUFJrdWVavAYxVKIGdQfDby5GCSqo8M=; b=JxMcRL79w8Fs+cCO
	CSpN/e6Mkk0iwRwudoSDfaeVSpU3cgyFXVHMGYeltSsk1VSSmIAKEzRz0unFRScL
	H6By4VjNuYCbLZJzbbIt2wyE+IXf06OO1Iwo+ouPgu710e+0jFgLvEqMlWko3a30
	SX31nxLl8M/ayV69LUGRd+daS8vM44VAn0LuufQsW41c0mznqSUMjeLGCFC92VLa
	HCg2uVrrIyM4vCYnqI0hc2dAOpMZqtlN/I02IZcl167abb9ApFN+Y3ipQGL3qlL2
	1+n7Yh1Qr5bP882WiUnVEgvfWoGTYc/SWCs1z+HEGEjS/Nwe8YekGQAPcOGsbdHe
	OE/nlQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtngbc1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:38:13 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7c2b7a15cedso39353137.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793198292; x=1793803092; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+BJpmnQqZ884dUFJrdWVavAYxVKIGdQfDby5GCSqo8M=;
        b=JvHgIrnaXYv8eL4Wyzc6hc4HKp34m7pU0Qwh11UArAXelRV6dqrRFVWwkoUQg2yTPY
         WWi1j/1iebRa7ngeOZEXDOTNgM7lBuIfqTJoGFwSYr0g5D48uJfCyuuel2rkrgDvbsnl
         0+vZMqPfXJmUWFiP4UAthBqQsPDz28IZ9CvYA8dVR1IMXcOV7tY4fUvzTAnvn5tgVC41
         ZkxIq16NqUx2xF9UU/qtQdW8dUAYlH7pwVpywE5TLPAKJO+bbbPEX0LyWdF0taeFGSDq
         FS8SX24V1790mjTg++CSVyK67O1HHsCFH253ddaiCq6aB42v49t38RmVxaiLLrUMiL6/
         4rVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793198292; x=1793803092;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+BJpmnQqZ884dUFJrdWVavAYxVKIGdQfDby5GCSqo8M=;
        b=BTGqWXWwpPpSshKIrNkPnwH80K4mIjPmnD7U5aDZ88JxPDitCpHfbZE4wi/prVST2F
         BjgXP6kM/XNUL33FnB2th3pVW6KPl0gHMqQZKWDewZCQzYGI0iHQ9PnIaUaZcuJ3EL1i
         w0mpxpTxHHNMsy4L01HJbRNgVIMHFZC1HEyH2PahlCrChpcvpSdAjfKJDjkCC/J/qfdv
         2XE6LscINCz4XnqyY3sID3rWhcmqWWxtDi1Dvse6lS79rUujmZxdCEf0vLazCxVx1yaw
         83nu7IOtIkBJxBq2iJtAwN8fmlygZiMzmC5wMq+jVEEkBxE4qyoxOnVEcaSqFQhj30uL
         0o6A==
X-Forwarded-Encrypted: i=1; AKwUvBx2V0+Hn8GmD7gAtgmi+zDLY3HHWybpA6T2zr+0GUJkIg/OS/3YFe/Cii/lonpThrGMkvrOCBUzpQ6Rb0A=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOPefv047um9tIL1YO1y0f4p1dG5v6UG6RBku3cz82FgpuQF3p
	OB3JKoxN6576w2TyOGmiBbP4IKZJ4XDAOFH4MkcH8c8Zinxja2N6ekOLG8ygd9Q5VnPPRCQu0H6
	kkJ5gWF9m25KI/St9DecHwwDY8f18yjlTfcl0ucJ1gset03SdftXjh1SUWX7BAUEYFjM=
X-Gm-Gg: AYBFou1Tqfq41dt8NL8xUabASOPvatkV+58f/EWAgRnSkyiD2ALC1gT4h0CLUce3ts1
	gbAJJf4EWNpcmJoCjwzzlVaWo5xnC5DzFtrZZRnwflRLd+im7iERhPYnaonMR8I1aTXve/xdaVE
	PA9X+d3O5CpWIBY/ovnZ4YIuXKqEl5VJ2CMqq/AHMRoUapoA3GdwaJF8+i9zjgIRy2N+Gb1Nd/h
	jm7lQjYkpD4mdnoHoosuZoMG6nDP4QWAiyT6kye2tdvlo/aU+8bH9NMlGluYldJ/MYAzDyeBqFL
	WojChddEN6+DXYp2ihfKR4E9xYHXYeeApujOs7rJsJMXJuNoHnUtZoHRunJGP9rjPuqJSQqu5f0
	gtljIKZliiMcCYfcWef8H9vQHmG1DqS2QWUTCMJ48TSoG2HnEL4uIrzOy3LmPXFkSWi3nVH4=
X-Received: by 2002:a05:6102:3c04:b0:7ca:21e4:8e20 with SMTP id ada2fe7eead31-7d03a4d89damr1130793137.2.1793198292167;
        Wed, 28 Oct 2026 07:38:12 -0700 (PDT)
X-Received: by 2002:a05:6102:3c04:b0:7ca:21e4:8e20 with SMTP id ada2fe7eead31-7d03a4d89damr1130751137.2.1793198291691;
        Wed, 28 Oct 2026 07:38:11 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b497ff5fddsm1482885a12.2.2026.10.28.07.38.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 07:38:08 -0700 (PDT)
Message-ID: <35c0fe02-88f9-4845-b37a-daa9bbc6a5fb@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:38:05 +0100
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
Subject: Re: [PATCH v3 1/3] dt-bindings: phy: sc8280xp-qmp-pcie: Add
 vdda-refgen supply for Glymur
To: Qiang Yu <qiang.yu@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261013-phy_refgen_1012-v3-0-f28305289499@oss.qualcomm.com>
 <20261013-phy_refgen_1012-v3-1-f28305289499@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261013-phy_refgen_1012-v3-1-f28305289499@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IOU-FVNnh1WvkkKlOadhgGEwTjmL4o1m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfX3sDCsvQgEIR+
 uvzlOp928UNMDwXZ9ncVdLz81iYqIth/B1A/KieNLu+kvxqsu5c17J6zWjCyT35XwaCOQf62o7b
 x/lWDdGQG+TCKIvGRS2ZKLnPQYeMXcMNHIGhIAA7PltndxoG6Nxsmei8cXH4hsv2IorOQhJxRhO
 /mvw+OfzQ1Rvi5f0WTs4D3q0Q5pzR9ZplPVt9HpEkqAFBUU3ZS9rExJ7jlBbBgRbr0E6ELJRoYK
 7+7F0A8K8vnVx47QX5zTpoCnAm4ovrXFTx/K9pKoxLs38Lkx9P2WkNW79ws+XUyO/2W0G5/A+WG
 JeU76cs+t7UOp878khBItnXjtv1vCWHryIJ6eb5FVRhKUXk+gdETF26b5b9o6sOdvV0vcWle22S
 TwWTo8/VoYwVxvXqulac6Y6IECUVu5q+cyN3+7tjBKtruiZujxZ55ZVhmjl2FkAeV+jBNXX+ezm
 ulA59xZXVNUq27ztQQw==
X-Authority-Analysis: v=2.4 cv=c/A+0h9l c=1 sm=1 tr=0 ts=6ae208d5 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=uZIZgAQFpoYdS5itBGQA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: IOU-FVNnh1WvkkKlOadhgGEwTjmL4o1m
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfX8ESE/CH7Y2XR
 op4sL0HkVE+ML6Cu+FRg1SXyLCyLPesnCgJKkdxo6WZsRoPIym9ILvvFH4eYrY4rsl7nQXcZDd7
 lhYCoV80DB+NnAf0fCUmgAqN5gjz1yw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280058

On 10/13/26 12:16 PM, Qiang Yu wrote:
> The PCIe QMP PHYs require a stable reference voltage provided by REFGEN,
> which in turn requires two separate LDOs to operate. Without these
> supplies, the PCIe PHY cannot work properly.
> 
> Add vdda-refgen0p9-supply and vdda-refgen1p2-supply properties. Mark them
> as required for the Glymur PCIe QMP PHYs for now, even though it breaks
> ABI; other platforms having the same requirement can be added later.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
