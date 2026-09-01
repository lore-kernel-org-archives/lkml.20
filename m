Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965A0480359
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788268903; cv=none; b=fwSgU2FS0jsfMGN3AfzYLHabo0ky4vpEbsWjNwWuAwcZByNGU6Mtw7KyPymoE1fNadTGvsyMBACeYrqhTNTSpd0im8KRTiyqVPkr+k6ksYUPlDRXGOU3WZuWpLLliNIONg2/nPOh6d0NRxNhbcexInKX3nPxPlA0JHD6lgMVowg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788268903; c=relaxed/simple;
	bh=qJfVo8NaWUV3he8g/jBVBQ24fD8jjxPCQ2QJcjp93xs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bi/rKULHTEdvU+ej1dtncfRYIPrLp3xZCmwrtGsuRTzZoL232Pp3GijUR8nTFZkI6UvTg25rrbNvtIrxLgkL0aCHbsiOj29lw/kuyjoL7rZ+Uw3lwPSbhdNkATBgIgJA/BzHivXSYvI8dprnuYDrog66sHhKr9sVICooZlO8y38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HC5Iec2w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fqeRDBqG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HC5Iec2w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fqeRDBqG"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJcSI2141615
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 13:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jSiZjk2rYPgMxkc/Mk6oF6H/vSiu5oWVsT6MYw51UtA=; b=HC5Iec2w8Q0r8o2A
	gfZcfMA9VCQ25Uo/i7Hq+YU/CARRMRIHDaWAE6sGzILPk0zqOr2cDoUK9dMVF1eB
	/YbwY02vuOH3zSeyfuarRA8HACvFGdQ9ZinhFNLZ/BnPkjA0jk3IHlmdOo5DYMnL
	DrljuhRUt8Dsd+0H9kIflADs+CrOjees55BopLaJLEJyMlJT6ok//edN4L3224L5
	VFXNeaEmRI29Oh3LsyJW99LNoep1dIr6NyOVrgx7rpOBhXXd5OcukWY5soXnbyr+
	Q3NPRYh3A22ah6fqKIYFDV6sDKImu0VZiXh2uetRTv9gYY3b0qM6ryopeTCXFMc0
	DMap9Q==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp8ftea9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 13:21:41 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c39b4f3229so121091e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 06:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788268901; x=1788873701; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jSiZjk2rYPgMxkc/Mk6oF6H/vSiu5oWVsT6MYw51UtA=;
        b=fqeRDBqGCgzZFU800J+yoe9S/QQGT1rq+KFBxAbJJp0VPDCVBGj95WdH+UQD3Abwv0
         1aa2Jh9pIJD4bI6JEHveMCQ7wqA5AoBet9QUFpgIsl9gZS/cXqvwTqA+fw7tOIyt5aHs
         +Pnb9UVw/dh1E3IbztyUbmqCmpI4vw3Kt1+qs6gL4u7ORCBGbbzB1UgWHnCUDvpomN42
         KZHVOfHIy8M4cxwqwqRqT4BR4cgfbk4G6uVlJkKZ6HgG0VDhpBfkMg0AhJRrsobw6DhR
         ccJUMal0eH8MI3KkH1YUpmZl7jlakU24CMY2htIbGCwgAn2SC8YJpKb2NDctF920FFUj
         Kynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788268901; x=1788873701;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jSiZjk2rYPgMxkc/Mk6oF6H/vSiu5oWVsT6MYw51UtA=;
        b=L6IJsAb1uJJMOy1pMh8pPS9Lf58Ce+9Bi+mcP75BX7RhalLhVhbeu984Ll2J0Vc574
         oe1tz4Dukjav4EXqKSDwRQqb5qgCZwbtEyG/Y6yneAIiBQwBnSmEXNZkGIPH4IvSoQRW
         e4Aa5w5kvjWmZ2ZXTYIvSvp1/kSfGxVmmA54ERUV1h21GFbO0t9TxbmlvZSqaqTU3umU
         ytCLxZx4sBItuzF2QMrfcobzs4wWESaLsCH6KS+DZgMXFHGAXlIWnOtLbDTwjEjjeO3b
         ArB185SIJTdKb9W38762iznFgyxiqPnbuRoRcPlBxc4nP5EyeLonRNs7oDVTF5o3/Gjn
         UDyw==
X-Forwarded-Encrypted: i=1; AHgh+RqC6BgQ4e2c/NYBOK62R7DZB6K36JRy7fftiEZIVuxWnqJ+k/a2my9NUOdPYUaLqo0m4xPN4ApOeo/d+04=@vger.kernel.org
X-Gm-Message-State: AFuF++lAFtvAXvWgidWE6f4MLvOF7ecigv/+TK152L4uwn8H+tNUUvEE
	fKmXinvS+D6BFZjbC/f0Fq4EzzIpZ3afQyN2D8wuo4z0A9aAPZRmKVlld3lq3MPXcAM0lbVdx50
	fdW1kIwI4cpmNpjQmBm1yVsmSU4OUdA+lNJDTxfBIul1dpY2gnKlA8ZgsGI0R7j53tF0=
X-Gm-Gg: AR+sD128D39CK9Ivv06Ws4j1PU1BwdWl7n4mlGLB5OfcJ5CAXpbwQQmRZ4Sro3nL820
	fmurDSJBb4yxUKsmampDWdYRjHy1JB9/F+GjkriXkb5eNCEvBJyjww5VeuoVS1uBTRC3LGo2WLe
	355t0TCN+QmCiW1ZQNCNxdAHqzFXl8La3PfWB/dekxQeYqmPIeriVWC09+VmXQI9P0GJaPhq58u
	SkcrQZGZZgew4oJi2iY/GVfmEjkeYgIaPN/GE/FJ3UlG8t5VBEIP2f3nZVimyjNYg1n/bFk+twq
	wh4RaUCXVvTNPW2tiOBFU7FSZql4lx+uk6ctYWZkXQUIML+H4ef6dsZMg5N00jwfhiaBa2Buuzo
	I6E6yPRVaz5rVO+SMyJxyGA==
X-Received: by 2002:a05:6102:6a84:b0:786:8d84:5aca with SMTP id ada2fe7eead31-7868d845f20mr2441016137.2.1788268900712;
        Tue, 01 Sep 2026 06:21:40 -0700 (PDT)
X-Received: by 2002:a05:6102:6a84:b0:786:8d84:5aca with SMTP id ada2fe7eead31-7868d845f20mr2440992137.2.1788268900215;
        Tue, 01 Sep 2026 06:21:40 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b605b17582sm57141e87.69.2026.09.01.06.21.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 06:21:39 -0700 (PDT)
Message-ID: <773d4d11-dedb-4630-bdaf-ed9bf5dedc5d@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 15:21:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/12] phy: qualcomm: qcom-uniphy-pcie-usb3-28lp: Add
 support for USB3 PHY on IPQ5018
To: george.moussalem@outlook.com, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Praveenkumar I <praveenkumar.i@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Nitheesh Sekar <quic_nsekar@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
 <20260825-ipq5018-usb3-v3-7-39be0955a6aa@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260825-ipq5018-usb3-v3-7-39be0955a6aa@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CeUL9zyyBdsnh8HELIbe7ts2h6-1Kkzz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfXyY/DgwRMwd/m
 3jkHXwkMc0QtbsEHH6RMxlJZ3Aq37YOXVZT00fzmTGp8JdMCM0qHqSRxaVItZmc4DgQmtzPmJUt
 WmUFFJE20mtexZ8TXjpz/AuncLpRH3g=
X-Proofpoint-ORIG-GUID: CeUL9zyyBdsnh8HELIbe7ts2h6-1Kkzz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfXx0cYpSj9J/mf
 igOoCjgO8ZSB7TQsG1Yhuw+Rv8EUv/PvubGCCRETy5FUOdVHLEUy0CmO4PopibHNi9wZskDd4KO
 xppM/dLNRlSJCPrUFHWRRGgIx12LNejXmJHk92QIgwg/wdUpoTFPQRU/zp/1nCUz2jMtue9Cg2y
 LkdMeX52pdTSpBzETFfI8fXN6X//yWTAzzywOXSSPYItM2z6zEnKmMYAems+KMxwSs30OICgCo2
 NuyAP5wdOprQPlj9b7/8O3SQkAaj4fwC8T/h8xy2DU+N9tr3i6eQeI0DhUXgLvQ8ZVB3fuBA/dg
 25ZpIjQx3cDXUXX54WJHUDbrEDaMnCWl/m9O2vkeYDmU9DvYzlouDh24468SkAaOnWWdyqsJNK0
 vfVHgp5EP6y8yMn5CFctcUXciILMYxrFZCh+BnjmdTU1M6e8J3uFDa0cWezSvocRUYYXkFmvlBj
 ym21nMjLJYukIWQHmhQ==
X-Authority-Analysis: v=2.4 cv=BPWDalQG c=1 sm=1 tr=0 ts=6a96d165 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=UqCG9HQmAAAA:8 a=xr6W56IWL_GKtPyFExwA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010117

On 8/25/26 2:37 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Add support for the USB3 PHY on IPQ5018 chipsets.

[...]

> +static int qcom_uniphy_usb_mux_select(struct qcom_uniphy *phy, bool enable)
> +{
> +	return regmap_update_bits(phy->tcsr, phy->mux_offset,
> +				  TCSR_USB_MUX_SEL,
> +				  enable ? TCSR_USB_MUX_SEL : 0);

regmap_assign_bits()

Konrad
