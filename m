Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0015237B8
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792070388; cv=none; b=MSNBIW6onGIwmutM4g8YNdmcyXfzGSW3YZ+S+CRo8pnZYp6GYoGf12MhoJd15RkQydQntpnEXeCmLwF3sTG60gA2QSljKG8rxVPKWfijaP2VcuXxvqcrwxqFmEqNysf9dwn2MKVHP1o4/2G0qOqggfR1F5w53JWlplbm8sI6tTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792070388; c=relaxed/simple;
	bh=RDe74eVfgS9VFxKC1KN3CSsr84zByOWGT1x9UeN3eqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DktL5SRh0e35FgiXDCMEzmpYLBNyCXErAma5rj5jaiDDK4UjoWHSxu7wrYVfyHnGI172x5PCqWEKkVp2/Z5QMrsVz2Mn/488me+kO/thZdKNSIC+84R3C4Vm3WtJzDlFN2H2UfJglFUnBoXClAzdtxeg9Xkl9qpJjTa8TnJzloU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YK37WhFY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=clI2geWA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YK37WhFY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="clI2geWA"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jS6n2662636
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:19:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0PeoYYh2gFueLL5PGHgbB9h0norbMjGxIpHfsN3x+ss=; b=YK37WhFYez6KC7fM
	PNCUHu6WheJEzVE5fuCj5PtVPs2q7i4zEgavRZiTEtceDDVtnOwTHWXZToVUOFgm
	HtEk7sMLkSQtBLoPZ8lKfu/a+mDhnR6oHD9gU+WX3rkghQRma+o9rws0l+Qybicl
	VWDDwX0rbckhemfZjEClxPY4ou4YmNLUfBzzdPUjO+grp/0M7mXZ4OnpwnVJ0abD
	kh/j4Ugu5zDLXh4X0J5kzOCiNQ/2nlpL1NEZEnVJLBpAQ/H+MK2m5LHqu/2bC+2h
	dJF1L5lOXL1Gg6hYI8nxiga802mWC65M6GtQYDklPl1nNnkNmIhvIDCPj4cGyChS
	SazUZw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqda27f1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:19:45 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9179d9bc964so16376906d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792070385; x=1792675185; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0PeoYYh2gFueLL5PGHgbB9h0norbMjGxIpHfsN3x+ss=;
        b=clI2geWAtPb3yh20T9FIiJdwPTvXXFGGUsMyCjvZSsxJVy1gMUKmvHTvyomRwLjSTp
         7uQ/2AuT17M0nmJAzJJ0WV/409jsdqkKYNBauYbkAwwpuy7PoTi4pI8iE53Cimt3rT6b
         QOvoivbqDHRS+PJSZuSVjni47UMm1UGy1Q9tq+0bQBSxomegEwzgRcWhNqfyG/iEG+p7
         Q1wlKND8mW1LSq7Q1x5SUtRtlwhOMXe4t38QyyK0UPSH7bDVgW57uVns2fLNZxUoxwhd
         vJWbPfbiU784miXu3ZcwHax/NYIqi/WTnYFWh+za5ZHDXHw3L1VW5glnD1JE0g+8jeMQ
         +/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792070385; x=1792675185;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0PeoYYh2gFueLL5PGHgbB9h0norbMjGxIpHfsN3x+ss=;
        b=zWYWjhSvqbWSpZ65NqFgKUyyW6C/0akk2vb601rgng9s7aWJgVZ9QM4bckR+QLYrm6
         K0KsorcnN3mWGFjQMxUFA2qWL+8jBPBSjSSPjYhWvylONpwH9mx8KSjpUVcAqUk0ulM7
         b9mi0gwWrixae5j+PHY7sfI8XxQpYT26tuOmF6ln6pYuLJV99vhzdhyiDgV3OUPrfB8h
         WSahkFEbiRdaWGBJ9Dg6dNOe2/Iumdvk+BRQXO3zz5UCscReuMxioTRlgfSfFpg4VGNC
         t9WRWC79HtHm1pWwrbm6hn+Jnm9qU1eHICno+uq2b2ybxn5oSucbMbZ93uI+ruxBMwjm
         PDLg==
X-Gm-Message-State: AFq9FYIO/v8yJuPErioaGD7nLeKzwt10sDMxajRKEd8CxmRxggaYi/xY
	PyD0dnH+EKIosHdHb48Uj+QSZjmPHKwOiLj1eLds0amclWE1Gw4hsRNHTH+6HBokP/46m0oZVtM
	REnlhhUxeRoyjFclSuBvsoR9gWtCos46N01N4hYha1jlwmSHi/1A5n7I9k/HBaNblJd6saGohH5
	0=
X-Gm-Gg: AYBFou3yPG9of6+VwKUZj3S+2uwVnyu13vwCmleqP/riZkKy94jFQ+sYuYUfCkgqM6B
	IG5beIOpAJXsmbZ8bObREFgmURwmdVrNpeDy7JRgZy9QufqIw6q3RG8lBpFb7i2i/AzJjzzQay0
	r9PlTgZQmRvh67gz3bsd2KZyrV6IpvAkWX4lxQEP43101d8ZS9Hi3dBkgZvKqCNKQmFMpDFnSMp
	I1Ghv1/dzsdtbiB14l8w80gEt1E1cfhm40cShuVEGunZm+N8VUwyIQTWPJ9ePXE68mtNNWPjfQY
	ATyJYvOM6M3snqLKq4kY9c0ZpuwoegShFJ0BRSmVAAJFD9w5b1AJ9PyXuAzLw8mobi5neR2Gxy+
	cDTZi51M+rUNLK/airxb5uQ==
X-Received: by 2002:a05:620a:2b4e:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93ebd1e4d57mr3268315085a.3.1792070385262;
        Thu, 15 Oct 2026 06:19:45 -0700 (PDT)
X-Received: by 2002:a05:620a:2b4e:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93ebd1e4d57mr3268309085a.3.1792070384714;
        Thu, 15 Oct 2026 06:19:44 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3edab0ee85sm123388266b.80.2026.10.15.06.19.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 06:19:43 -0700 (PDT)
Message-ID: <4c83e787-b5e6-4394-88a8-4a2fa4ab8d1a@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:19:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: talos-lyra-evk: Add CYPD6129 Type-C
 support
To: Akash Kumar <akash.kumar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261012131518.858396-1-akash.kumar@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261012131518.858396-1-akash.kumar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1MiBTYWx0ZWRfX3qwWfNxNFjbQ
 XQ0Ep3oNOvYsM7c3VO+EG/NEKXPjRbZ2InKweXqwNBvXmj0NshUS0skgZtDCXaEleo6BUmftvDp
 M057rd6/Z6OqhQvEBfTs5IOYAL/UVo0=
X-Authority-Analysis: v=2.4 cv=K9u3jCWI c=1 sm=1 tr=0 ts=6ad0d2f2 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ac72dwBaO6wsPz63ng8A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: tlub7GayrY02aCgz-XVnOR7WfI6_tUUZ
X-Proofpoint-ORIG-GUID: tlub7GayrY02aCgz-XVnOR7WfI6_tUUZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1MiBTYWx0ZWRfX9GR0n/ZZxAZG
 /UiXM8F0TD9j9rVNh502jXI2jHPLFACxY7PGbi/XaDsZrhYXJnO2x9q9yUOK1hL9L0QMhl3+ke8
 Ju5naxydM/eVfeCtASOJWeqkqfXTFUicVfuSk7m6nAK5HK2S7jCgJwSdBdJ01+k0fxQU82i/WY6
 PJF/mW5CmuxzPBzGw1h5vOA2lQgW1lyFZloHujcO1PpEMaGF7F/G5MI4K2YvRIO6YXfBTviAJzx
 PnZFUvKcbcjNg36vic8Mw1pWEObd9Kg5YFQKMQDN2evM3MZ3UVEzyHVM/wUFYxeyhoC7wJ+l2nV
 GgmEP+egZF53FisLFDC6L5b4pKdXu97BJhkzVdva/8gXIQn6UtwHJvXFN3N01/c8xDi8EDm8BDq
 iwUahh++G2PPmpiST8+DteGwu/AQ46rrhsRHQ5XE78Xsk9lWgEw0quDGrEjwkeXnEH8xXZnYlRh
 rwZ2Zmcf6zouUr0DjoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150052

On 10/12/26 3:11 PM, Akash Kumar wrote:
> Add support for the Cypress CYPD6129 dual Type-C PD controller on the
> Talos Lyra EVK.
> 
> Enable the controller on I2C5 at address 0x40, configure its GPIO86
> interrupt and wakeup support, and describe both USB Type-C connectors.
> Connect the connectors to USB1 and USB2 through USB role-switch
> remote-endpoint links.
> 
> Configure both USB controllers in OTG mode with usb-role-switch support
> so that the CYPD6129 controller can manage their USB data roles.
> 
> USB1 is routed to the daughter-card board-to-board connector. Add a
> fixed USB1 VBUS regulator controlled by PM8150 GPIO10 to provide and
> control VBUS for the USB port on the daughter card. Configure the
> corresponding PM8150 GPIO pinctrl state and keep the regulator enabled
> for the board configuration.
> 
> Add the TLMM GPIO64 VBUS boost enable as a GPIO hog. This enables the
> 5 V boost converter required to generate the VBUS supply for the USB
> daughter-card connector. The boost converter output is set to 5 V by
> the feedback network consisting of R2403 and R2401:
> 
>     VOUT = 0.6 * (1 + R2403 / R2401)
>          = 0.6 * (1 + 75K / 10K)
>          = 5 V
> 
> The changes also add the I2C5 alias, CYPD6129 pinctrl configuration,
> wakeup-source properties, USB endpoint connections, and the required
> VBUS power-control GPIO descriptions.
> 
> Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/talos-lyra-evk.dts | 119 +++++++++++++++++++-
>  1 file changed, 117 insertions(+), 2 deletions(-)
> ---
> base-commit: b7e62b4d28bc0d2f16f03904616da78e4478aa88
> change-id: 20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb5
> base commit link: https://lore.kernel.org/all/20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com/
> 
> Link to Driver and DT-Binding change: https://lore.kernel.org/all/20261012091658.635441-1-akash.kumar@oss.qualcomm.com/

This depends on both the driver+dt change *and* the missing base
DT, making this effectively unmergeable. Please either send the
changes together or refrain from sending them until that's possible

Konrad
