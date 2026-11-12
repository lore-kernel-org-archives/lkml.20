Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794491285;
	b=vMOz4odPoNEjod8PoMQL8Zv2oFTW7VEB4KX6w540RKTbHhdMXxCKjE1s1gb2CqUrtzO+
	 iXnoUwTQfvLFTJ3m5Lb9s+EyMUn0DJ7SOyFSCuHfXBen7HNi/Lkq28gyVYyNvqTB3qrab
	 jp1v5xE6sDFeBkXXbZZsJWzBdHQ9Lvo4v9YKg5td8kz9z5Dt3wG7kQVUjd1GX6gclSZGA
	 wWA6cN3C5WIw/aBb8iJwNkkjiEHdOUTVkaDsPbeM1hqY0q8Wa1EggpCZDzfOk6D2GiIBU
	 U0udC4QISICtKYIMNTYDfFEXd0D/5rL3MdLp3K7kx9OLg+S6aOh8+uLIpMDE3cN51nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794491285;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=U+W2nYGry4hKMV2JuVK3PdNvH+FLPLTAkEAHuaqJzqE=;
	b=Uxwt7t553GluUSEzXU2c/NsjiE3zJwTBiugclENJ/hrkQiist0FXl/5y2iH5t6X5dia0
	 aYJWE/3nGTGACrTnp7L+BMy8XZctl9jrwMc95SHn/YS5XteP15UjK0WvqeW2qY2kdFT0w
	 A6w7/GoPcERtGK1MIX6Fe5nINlW8m4w0i6q6f9Q8V0q0NAELNBg6NcpVYFl+3uhxNLEtG
	 RtwWnXrkplNLCStSONsqqaY4LV+C/EABjnnqjfuqAu8S8NwEqx1VhcjPBiIzwMMwHtOEW
	 tV0FOEvW+hFed0y/ymafEY28ecSIyp1AHI8yZKbIw/kgXnjeNQQWrZ5ofD+7che7svw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hq5ed0vU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=be2W0OH3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB048606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:48:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB048606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hq5ed0vU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=be2W0OH3
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACAd4Es3893512
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:48:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U+W2nYGry4hKMV2JuVK3PdNvH+FLPLTAkEAHuaqJzqE=; b=hq5ed0vUkzkNuUs5
	mXglYr6PA/HYKeuC7/0cQzccV4zjo16sbgqlY0VQr/p4uTGzmXQdsEwYrpzn+b29
	rfs7sSQ85pKLLtRqrz0CJMMbwNPKz2UyHLJDT7dJlM289/k5AJTzDmTiXkaRSFVb
	Yb9UANoH7spvuqsMktXYVVGUaZAxSIGUdU71683lmatlu5MwA4MlYWsC2IDG3+hW
	jAPq/lRftHqp+nGO83WwxRognk073p3HuVJoxPVA+PkI3aUsVs0OtGYRMzKg9FYJ
	goECocsSKnSekf4xYWc5aqavga5TAqBN/I4WpOWq0fWd8ffby2UC44wNZOnjq8p1
	43J/cw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6re1u23-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:48:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1f2fafeaso669068085a.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794491283; x=1795096083; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U+W2nYGry4hKMV2JuVK3PdNvH+FLPLTAkEAHuaqJzqE=;
        b=be2W0OH36Sr+oIDxYJx9kEhbnPGhKxIqWsB5jS4QhwS0lAoiYWw2XSrh2t7gNR0sz5
         ETd36Vw80LM5r5AzM9Gf+HMzho12nbd/qXEaFN0bBP2FMwzCD8t8wga9vqWHGhQV/Vm0
         INAch9nBPIjJ54YDdn6XXIzLxvZMBodMca4OmWB8Ua34YE6ZlCqZn8M8nftisYGHlFEi
         5kWu3uXZzNJp8rOhjzuD790Bua5X3pSmLQfv6kYspUiWXdx2E9dsF1tMB/pUN3/R34yk
         bxk0Xq63VaR7KHcXe7Ro0mFW28crTtCJQQ6VMNkZUzxxwWEYLz6oZQPCiv3YdA7z9vOE
         Y1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794491283; x=1795096083;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U+W2nYGry4hKMV2JuVK3PdNvH+FLPLTAkEAHuaqJzqE=;
        b=FiRJt+SNqHml6ccICXnqBvz0p0qoHMmCO15mxkcHH7prUEDaRQbJ/+munrxDZOQfv+
         R3/swHWj+DPFaFppRmj6q/tFZL4RVVeFYUsjL/0Kxabxk9yKcEAUrL7Lm/frIkkGDcuT
         v+Ltqxxzz0elBCF3jpk+K05x9jCC1NeWQVzciIUFiy4cBGAqgdYiT+D9C7fO/AvFRQ+C
         yFmCl+fyFGn3UjlUOHa5rR0JoH0o3K/cD5TJfKK7PSQclQrOADcq77aIImNzZob/4JjG
         IhWgZvAFnZCzFkJBV1gk58BcvcAExfyUgwboSQaIy6/EtWcqgdCTdZrh/F6v1/YLfdpb
         oxqA==
X-Forwarded-Encrypted: i=1; AL+hErHPY8d3k2HPd1HbH4R7IIm1Lro9k20FIxOO15YHIr5Mp/GesVHM9G4SmkqexZ1fccqskneHUoUIDIF5FY8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jjYzztVPPisTHj3Zp/VHccR2/u9z4OAlQJngIO6d5vl6bZjsh
	9ltIr5b3ydxHY/AdOrEo17QPX+DF3UclADeWT32vBtzBnNoi6+A8mG5fqwnXyvlM9Wghk2BX319
	5HYmT88yPeeiYBx3PcBZ+6kdeZaGYl+o7+QsILv6/WuAVdiN/tCuL6h4HUxiCK8zKBcU=
X-Gm-Gg: AYBFou0hVEOw8UiiyeDNeuh9ji7QapUYLfm2gOSnd/w/4Nx08AvTqjxDTLXbCOTbdAa
	hkD6XQ/EdkSwtkq1irX5Qplq/wV0djq/SXUNwz8mtjhqhEH0tRqr0POIoxUiKRg9W/vjJ6BClI4
	hjc+dkLS8qRPa9XP/gT5+cRaeCN7jNJeQKd0oKOV7dJ90G3+t/ej1EAf60r/31eNm7Etd6fplk+
	aQ7ao9IW54zbuu+KOcM7vOhZAiS3GV8dbBlA9r5x7Hbk/c4h7SwwJPhmtJ13T8oU62awJphSuqO
	dAf1us2ugpuLGItmwQoT1U4mCKNDQIAgB+uPgFFufAPgg5BJ0lwzTnBIkgIWTrkjKlRFoALpafs
	RhLam9w+0yX6QWY9j1Mu2kXs0K3uKlLm5wGXj+jNtJC/D0narPKLh7gTn4iFkGGz1GMc2NbV5Z8
	YM9dE=
X-Received: by 2002:a05:620a:1b96:b0:93c:9c0b:3898 with SMTP id af79cd13be357-947affc1c3bmr930695185a.59.1794491283048;
        Thu, 12 Nov 2026 05:48:03 -0800 (PST)
X-Received: by 2002:a05:620a:1b96:b0:93c:9c0b:3898 with SMTP id af79cd13be357-947affc1c3bmr930691485a.59.1794491282604;
        Thu, 12 Nov 2026 05:48:02 -0800 (PST)
Received: from [10.218.50.86] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c16be05ba1sm325697e87.50.2026.11.12.05.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 05:48:01 -0800 (PST)
Message-ID: <c9427a03-8b45-4e35-a29d-7ebe30f07ed7@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 19:17:50 +0530
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
Subject: Re: [PATCH 2/6] dt-bindings: dma: qcom-gpi: Add QSPI protocol
 identifier
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org
References: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
 <20261106-qspi_upstream_series-v1-2-21f43042dd60@oss.qualcomm.com>
 <20261109-wandering-miraculous-mamba-0cf21a@quoll>
 <2fc8f7ea-651e-466e-9346-c47e0a38c5bb@oss.qualcomm.com>
 <20261111-daring-salamander-from-tartarus-4c72bd@quoll>
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <20261111-daring-salamander-from-tartarus-4c72bd@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: DZtxv_YJJ2uZ8ZqBLQQqtkKK9bpXqlxy
X-Proofpoint-GUID: DZtxv_YJJ2uZ8ZqBLQQqtkKK9bpXqlxy
X-Authority-Analysis: v=2.4 cv=NJhAaE6g c=1 sm=1 tr=0 ts=6af5c393 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=dNOB8qFnOFInGeeiHp8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1NCBTYWx0ZWRfX3CDKrj/RODI3
 JzSg9dnJ3dzGZm9SQOTueywV0Hs0DCw9brOaoSddj6esbDGaedkOWQSB7oT3+tEalrqf2hcOXaT
 7SNQ9A3s51eaGqZL7basR7DRo9zT0Ic=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1NCBTYWx0ZWRfXzvaj24E1IgI0
 Xdivgwrq5TSOgkllTkpx+duz1aMd596ib93wHS2zsXfWeNIpREhpawoozOFst0OqfhCdixA3NTJ
 7Sk6AcMVxb0sMB0OR31ur7IMDVU+wwlVLV0d5nYuhk2lke7s0Xk2VDosDAHKjaWjeqYWsZ7VD8F
 owiFZIWl88TXv0fwcWOABdhYE2c2uR2xfFVN047dhieAgOSg9X8qmQ2Lo+O6RtfO7GYfMp1djtW
 I6M7yK+d26QPw0L0JTqGlt4aO7OpMjeBGIJbGYLT9H/0GZT/YfaKETRkjO68Hi9VrYvL2P/ZYdO
 ZTov/82A5HN5X/NcxpeBX5zg72pHxiJhmIu1oQE6Om1uh/RSuSLesuLCB0xQV/eLyqcztjFWOsh
 PghXWeN5eZCnRwIO6KogkFl+xHG4qklD/EM5qHNbYElG1Llm0sLfhUiBeAoWVT/rGt7XYDI1ymS
 /qvtOCNgTAea7imUUnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120054



On 11/11/2026 6:07 PM, Krzysztof Kozlowski wrote:
> On Mon, Nov 09, 2026 at 08:03:29PM +0530, Jyothi Kumar Seerapu wrote:
>>
>>
>> On 11/9/2026 7:12 PM, Krzysztof Kozlowski wrote:
>>> On Fri, Nov 06, 2026 at 08:31:20PM +0530, Jyothi Kumar Seerapu wrote:
>>>> Add QCOM_GPI_QSPI to identify QSPI (Quad SPI) channels in GPI DMA
>>>> specifiers. Its value, 9, matches the GENI serial engine firmware
>>>> protocol ID for QSPI.
>>>
>>> What is GENI serial engine firmware? How does the Linux rely on it that
>>> we add bindings for it?
>>
>> Hi Krzysztof,
>> GENI firmware runs on the serial engine’s programmable sequencers and
>> implements protocols such as SPI and QSPI. Linux configures the engine and
>> submits transfers to it.
>> The existing GPI DMA specifier includes a client protocol ID. Linux programs
>> this ID into the DMA channel and selects the corresponding descriptor
>> format. QCOM_GPI_QSPI adds the QSPI protocol encoding 9 to that interface.
>> I will clarify this in the commit description in V2.
> 
> Does not really answer. I see no reason why GENI firmware needs ABI for
> Linux.
> 
This extends the existing GPI DMA binding, not a GENI firmware ABI.

The third argument of the DMA specifier in the dmas property selects
the peripheral protocol. The GPI driver programs this value into the
channel's SCRATCH_0 PROTO field and selects the corresponding transfer
descriptor format. QCOM_GPI_QSPI adds the QSPI selector to this interface.

My reference to the GENI firmware ID was misleading. I will clarify
the GPI channel requirement in v2.

> Best regards,
> Krzysztof

