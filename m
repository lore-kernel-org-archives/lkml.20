Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793866205;
	b=YzZq+jwjvzdSnfhfTktxQXprbqWxniyzs+Kp0KvCB4ruz6BevhATS2olwGrsI2zsElJa
	 04muDbkWUmwaR/PSBnMRq9s+cSl8bUF1U/2vWkYvRog9OUoaudJwZ2aeMzcDW2UrTWDWc
	 DRg4TFgn9MoGblTkX2khBEM+PYfXTsqaatRz7LVPIv7ECd75wjqM22jufClnSDsx2RWOJ
	 +xzsm/nFm8ut9MEyfPnKhTJ8N94OYGVz1d6OtZzXsnvIM5vmoP5uv047N9KC0eWfgtwVy
	 1eC5utA8Gi9Sk+Zr3tK/wnnHaiQZqpP3AiRRi9BjHKDfo+UT62rpJ1Xmfg21JPEhIjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793866205;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5Lp6dUaP1Ia8j38qqsE2ncWy6Z83aplFa23kRPGo0WE=;
	b=WKc4Nwz4T7WjdwUVHxFv5ygCRoTqdK+yH/GDVkVhBGae4tod+5yC6o0REYttQDneRoYS
	 LsnhuoiREKx6NJpXzx2UNfkVxIeDv1vO5LvR9umBzhJ/Ot4xicssIXyaYATo0yu8VFfAJ
	 HHlz294hCc1Z+xtiDXu3Oh/o4koGPxcacLzvZpsdneDBVBg3cK+G5oNrhs5KNjHWSPXMJ
	 299AqpY37/Me21QWLNqRd2EoAt1uMpwUKU0Kz9ZKosFks8+bAILNI3NEBc26gkt7KPXQF
	 kY0KYLebWc5h3rrDFhdLdophv8qzj1cvlCSQHd23Z5GqAUlT+fL/V48Ib8EXp5W5yTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RA6xXSPB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=afgVncg2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832B0606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:10:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 832B0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RA6xXSPB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=afgVncg2
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UAgU565192
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 08:10:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Lp6dUaP1Ia8j38qqsE2ncWy6Z83aplFa23kRPGo0WE=; b=RA6xXSPB8IgDwEgw
	iFql28FVT3DV3YG/OHZ1WIg6wkOABHxSY+Q0KboQnI0ACfyCI9two7veOTEQZEaX
	U/xi2F92jWc8cMBtsymeLEF73jAAZAmZGdMJ1yKrWDcVanhn1PxrweklJoqjLgbc
	NGsHOtg9B8jMUvm/nPiCZ7FeSMTZ/A8AxLxOpyAfm96rG37txWWWcGUepW/W6vKp
	fFc0/6jxU2YMYTr4z+EIUTZNbsPhyOKu2SDSpuc/Jb8Y2XehR8evDlFB9tZFWPKL
	UgtaQLM79FouqKXLyNXMYn2yEDVzZQfhIqItkbYDAPChAtpb7RRavAQRlYEl78Fu
	Izg74w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrkaq8px5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:10:03 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91ca23ede8fso3473466d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793866203; x=1794471003; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Lp6dUaP1Ia8j38qqsE2ncWy6Z83aplFa23kRPGo0WE=;
        b=afgVncg2ppGg3emTNFc9SrQpbvFA+9cgZWue3TkYdXavA4h/ccjekoV6b/rL4WRq30
         1MasAq6HxpSncWZzGh6tIG1FS0GVPJtLzijN7L4Lo1JJdh8xGHnxsVbYKes4aNY3OUXa
         ldHkT4hnH8F4QRitDvXyeQn2KcdIISlj+x4KkXmLdMzGg7wi8PC/jAA2vNaq8WvqBDI0
         Qi3Mc7qdkj10mPOiLMpoZHmf4RvUJ2usjP8vZxdEHeCSmx99T+RmLMUNHykPTij9ABtS
         Pnviupom3b7CRIVP/XqfXNTp1Eq37h8i6elm2MGP0ubNmC88ipqhStsNc0Dh30VDQNlM
         zmrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793866203; x=1794471003;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Lp6dUaP1Ia8j38qqsE2ncWy6Z83aplFa23kRPGo0WE=;
        b=qJoceV+QPqgeRsZULpSOCETuJbY/MsgiDIlcUDgzORxN9JR1wARo+Hwr6/1qoN/Y9V
         YpAJ6Xi/8Dw4rhm64l1wQvyPJwMLF/1FZcXT+F0WcU55hjLHbICnbNTdr031uXHQ4air
         i5ccQxSfQ6RSHrBelFQeG77sr9WqoNMfepA2CuoGjpFWN2FhGU4Zod66GtXpFvkCnLmA
         cmV6oJgTkHjvR9KdQyRjbR0+BG9KkXtQ/I4JxtrtvpybmH18VuPnBG2rmP54dOOIwDLI
         3bV9PQEo/P64nP46oFuAzLJohsgMyofaPf9PIs/bikG0KKalM/CLj40K+RJhf8gHJMT0
         TbEg==
X-Forwarded-Encrypted: i=1; AKwUvBxG+XCQhdAG3+o6M2yLQbIjnSK9GhMEYiCHtUhMOSj5WrBCozzEmNq+hfJVTjnc3PDb5WkPgIAHlhwzKG8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jwSflrUpKGC4qyjTj1EMNSjEBEQCRuKCYr42r3M19dIhVNlPk
	OEVcRtlF8XDPNxWd2FiYoxzi5lNoPo1U2ZIkvd1bCcvSRgXELE/zecG59hkGrgyf47fwZXyCTkL
	rFDGKx/7dV+wQgVSotNSPqMfVL/2ksZEFOPtYrNWkbLzn/FiKk+O7F7wheXwuX68hIKg=
X-Gm-Gg: AYBFou1okt3XigET+19pFMtVxqR/XJUyixb6ofUSuy5enrJdm4eq9frzoAmhw8HO5le
	YY6tCow5N2G4Ns2EfRI94h2Ja8F5d5CrGdXYr+nEuMMZuRvrYF8540McfSmcVtsaIjWIzognHu5
	k65M+wehKqU2MrJI4AkAqe3yp6wK1hplLF8F4qxIn82Ah4o8xGYwUnfNRR219HQOlCcF6SeJHhU
	j1Xk/McEgKj0Wgxl3n6LjmAAkxPEZQTHj9QMQl24PA8dzzEPcxwjvLi0jHABdzKqfMjciataeaA
	uJG/Bl+llStmCDj4QoWkntzTdo2vOJ0nEON5m2TIfJzasIGPXbqQE4gdbSg0RDoYcUuzQkTTLfS
	dZyT22eQfohvYUu/2og3O2r/0zhyWlHS0qMFUxhV//Sv7VvnuUyQ2yCn1azyQh0BTOyyZ
X-Received: by 2002:a05:6214:c2d:b0:91c:6e94:3b51 with SMTP id 6a1803df08f44-91ca47aa2f0mr413081006d6.0.1793866202595;
        Thu, 05 Nov 2026 00:10:02 -0800 (PST)
X-Received: by 2002:a05:6214:c2d:b0:91c:6e94:3b51 with SMTP id 6a1803df08f44-91ca47aa2f0mr413080546d6.0.1793866202158;
        Thu, 05 Nov 2026 00:10:02 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac6d03esm1527170a12.24.2026.11.05.00.09.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 00:09:59 -0800 (PST)
Message-ID: <b2498fed-5420-44a3-a215-02438b623ef6@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 09:09:57 +0100
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
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm7325: Add Samsung Galaxy M52 5G
To: korryasdlerto@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261104-m52xq-dts-v1-0-b198f02912ff@gmail.com>
 <20261104-m52xq-dts-v1-2-b198f02912ff@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261104-m52xq-dts-v1-2-b198f02912ff@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _ZmQflEvjcFTzkVc4mRWXBoZV3EiDiko
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzMiBTYWx0ZWRfX3t/mENpVmtaC
 CBDayjLfZV0oFUouwisPH6tQb6l+JlP24Q+q8C55MV4t5e/fDGmZNL1QIWVI3Xs/PLX8E/qVGkz
 1QFQ3cUsLFxPz3w79TxU9MkkGEiKQy4=
X-Proofpoint-ORIG-GUID: _ZmQflEvjcFTzkVc4mRWXBoZV3EiDiko
X-Authority-Analysis: v=2.4 cv=OZoNnRTY c=1 sm=1 tr=0 ts=6aec39db cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=Jnuh3jzrMT71hIFIYhcA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzMiBTYWx0ZWRfX8FjPaWcftFpW
 sXK3FrghSxR9x8dbJVREsgC7T4V8AOunDnP/lspvp5HiyasFaC/ZSpCDO2O9UKHCm4WS1UVgD4y
 CAvFKbKtNwwmFPLV6AjH5FzR4+L0Vmv0fv9v/nXaeddPtl6LHjx/VXsW+dz/mFC8gwwfkIyzoCF
 zbpAWtmoADw4Rr3OvvjHRG9Ww1fGnLuIJGZWZ5KFodkARX8SlkIKEX1teT3hxqImxYQ1GXzBGjb
 Ayv8z+9s77fJySneeoiiJZAAEajbGaji3AZKHavphRI7/rpfEbnGXHYchtqyrELqb1v+C2rxxyo
 Q3RouTmjDU8UwWmWcB50qVyy/80YgamTTbl8GluekeDhWsXJ/j93fbbTHfPaIwipXS2Gz2CCHY+
 4uPoQfhBSt8Gc0QWYvV/MnDBXqll4siJCgDJ2PsDfpNG8IxYDviSrV+ktlYpv3JLH0lJuhrtzUP
 athDisdXFPFZHfQahug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050032

On 11/4/26 7:59 PM, Asdlerto Korry via B4 Relay wrote:
> From: Asdlerto Korry <korryasdlerto@gmail.com>
> 
> Add the device tree for the Samsung Galaxy M52 5G (samsung,m52xq)
> smartphone, which is based on the SM7325 SoC.

[...]

> +	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		framebuffer0: framebuffer@e1000000 {
> +			compatible = "simple-framebuffer";
> +			reg = <0x0 0xe1000000 0x0 (1080 * 2400 * 4)>;

Drop the reg and unit address (numbers after the @ sign), since you
have a memory-region handle

[...]


> +	/* NFC chip power, switched by TLMM 42 (no consumer property in the binding) */

Please fix the binding

[...]

> +&usb_1 {
> +	dr_mode = "peripheral";
> +	maximum-speed = "high-speed";
> +	phys = <&usb_1_hsphy>;
> +	phy-names = "usb2-phy";
> +	qcom,select-utmi-as-pipe-clk;
> +
> +	status = "okay";
> +};

No superspeed / displayport?

Konrad
