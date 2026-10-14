Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D0240BCCB
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791967591; cv=none; b=DMAaEaiNR+pe6V1k+OCHQwk5lnJNIC2dW8Ow0hS1EKQiCZKCUT1SSxtCha5PXvNQXADmijcP1l131xE4eMMqksS9Njs27Ew5eVLRGtXEJjj+do308Z7Mq2ZQL0rQidHo3T06p2YvB+nNVFC3uG0gXR/LtjVu3u+V1ONU6Cl6CoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791967591; c=relaxed/simple;
	bh=VAmOCcySXayrvceVNgYYbOmGKQT4ami3zg9s6voroO0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eQ3KGsz51TTYZm7uTj816suKbRIJQgf/ZyGEUZNMnWYnw/SnSNwpRkaQSuW591uxlDi/JRyLBDauVIEPdb5HFV3XrqFhxvSHFU8MFOmC6b4VpDsmpjADL+zQDH5U/yXl72ZOH7WB7xfsoBjzMP764W1QaDGuWrHpcqvrqwVT+T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LXTEl0qG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dFXW1Qpc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LXTEl0qG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dFXW1Qpc"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E4ellT806697
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:46:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n/JTgj+H37JU0my3KapaCzRfHeWwoSIT1jabPUib3zo=; b=LXTEl0qGZk4zW1Kk
	oaNJ581xTUXwP9gV7tFCygFSw4MB6EOPl6WqArlWYAwhMjTl0IedI4aUcQk3vivq
	Q/Yce/hyJV3NnVmhdf8TPFn8DkEHB4HfLltnBrSCXjjlkViddToddf/F7gUQfKiH
	qUb9qAOS//9JBSXVsl2LTrWXyyf81FMkjwU4tjwkvF2jZvAM96LOl+6ywAOWf4x/
	8ILLpU41x83l1/Q4usSrs6yLLYC5xc/8wWzH3/ljlAFysb1z4Yyf679VagjROwJH
	SGFfdgo3eXJcar8GC5Dh//SP330JZrVBn4+9wiq4hvaHSKoUBIikTBvUNuVXrqLq
	Q37c+w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9ud6ajdk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:46:28 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-917aacb7abcso10490946d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 01:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791967587; x=1792572387; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n/JTgj+H37JU0my3KapaCzRfHeWwoSIT1jabPUib3zo=;
        b=dFXW1Qpc/D6nS2iQ4WdD0JL3MZewMYKmJS6wH/dkuttN3M5FIMfAcowpYCJTPFrKqx
         WMY1yuzsO1/kxF6dvlTt0iVhQxMTf6Rpl79l9LkL8go+h3E5hzgwJcMs+nXDk+EZLBjn
         bh2AFSR2hFYXvIPWCJ8p7sCfjYBYvcaFXpWH8i39ACDcMX3JmYVBeBMCy9CUnVBWWfsx
         DtYJuYclFCSKFS1tL0BQ72FSNXRj15+knINQR5AYdxusgoaCZI1EoRSWHv582QBPfKjH
         6SrNPU/sGU4lfHqyroNd+lT/qDsuuf8dG49tsP7VUSPg9NZLtjHz3ukSBgmiWZoOupY3
         u+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791967587; x=1792572387;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n/JTgj+H37JU0my3KapaCzRfHeWwoSIT1jabPUib3zo=;
        b=zqqiw0zXIsVrYrBb4BeHkm2d/TBxVuM8lvKpMgHDjgESg7LWrcqr5dyPbHLl8rUG9R
         JSu7DznoPlMOnx3GUFC+BpuBQEjldjt6C91LxJMBdIheeLr4jZuMv6f54DaD7OXC2ySd
         aEYGLP0C1gaRBG/LK5a8DdTfM1zo2YlkuINB5RTXoVCQjb/fxSZEuv8KWFVO2rpZ5Y+8
         dYU9oneYSNgO0eawKzyUj3UYyzJkqSeXVEOfC5BbL/4CWE9GT2IG65sTZKNRF1FRUmaP
         xflgdqriEZJ9QfIZloc6BK8qe6Mqq6K4ioJ/GXB9/1RdukYZNmvke92gVBhv/XjlwCbl
         qmMQ==
X-Forwarded-Encrypted: i=1; AKwUvBzSxs3unKNNKFsXvtZ5XP6DWgmw9bFEw0Z/Qskd1KrBXWR98YrsMQJiqC2Epsls37Kk6ROR1jBNfAbbKXw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIpBSdEK0EArr9CHpSgmCD3MGfhroncojuBgfq8RlAZmiHA9MD
	NuP1PTnkIpwAN+JV/j+ynW3DVonhuRfRgQLX7Q/ADrBeBPuWoB7RaNpyQtxleaYVlU0LUyoqbax
	N+gEufE+oCsI9hHquTlwN841IT0joMphid4G0vUI8FUSh5EbRVjrwdQ51Ec3+5qbholc=
X-Gm-Gg: AYBFou3Jm3oRHPCdNev1HPLvHpRArJPcN/0BK6av0hrZ7mWBLv+psWR0rfztasi99V1
	rL+OZDK4AlECgpLkyURBlrrNmGqJYEG6Y4y6nSLoqHuV0NuME6f6QrBK+m5PppAGSccQY+8hQTG
	w0T/5RBt1w6Y3btCVlownJof5N6IkZKUZjPDijHfM/7HD41BNmuP2foLA4CL9j8+Z1wDF2NROi7
	Hem3CSEzI9WZIoWPbmMCPA4Eklqo+2e8HSC7T2Bupxc01z2cPwDnn1BvdiDRsiv6Wpjl0ZKDiiK
	W/fhFmDbU08olBB9D9SvXPiduPV8xizrvOZDc+4TMitCKglpOM3ZtobLBJ5TsZghBWqLXr9OAlg
	yR5+unVZTaCrGgLg3ynztEQ==
X-Received: by 2002:a05:620a:8017:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93ebcd2bc8fmr2556742885a.0.1791967587496;
        Wed, 14 Oct 2026 01:46:27 -0700 (PDT)
X-Received: by 2002:a05:620a:8017:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93ebcd2bc8fmr2556741385a.0.1791967587018;
        Wed, 14 Oct 2026 01:46:27 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b2038aa1aesm853559a12.32.2026.10.14.01.46.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 01:46:26 -0700 (PDT)
Message-ID: <d6c62256-1fde-4995-bd32-38c25e59ff4f@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 10:46:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845: Route the SPMI interrupt
 through the PDC
To: yoxcu <mick@yoxcu.de>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261013203749.3078262-1-mick@yoxcu.de>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261013203749.3078262-1-mick@yoxcu.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mghx1y289hx_O2du10gvmY477rjV9Yy0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzNCBTYWx0ZWRfX3YYQ/V07shtO
 NztxwA39qmoBP8VwScbITQspEeOxR1mKihSgywMFrrhvYl58tQ3z1lyt6VYrtWA/pHDFec9uB6Y
 4i8QfSjP4YtFo31Yvd/yDlGUIHVyaEU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzNCBTYWx0ZWRfX7lIM2CSqgvk7
 nZXLwXIa3JmWr3c62TyBeN6Hu+r1lh7CT74Teay5yLqCrxwdSxu5GGwCdhgQqnFHkW+LpiZHRHH
 TqOSL+OapDAYHp1b5GivSvMxRE3PafYrKKEAnhXaNK+7sENVp6/Gkb5vJmOW5sxftTynK+Tc2cZ
 xOk21OTwL39ChKE8ANn51gojXj6g7A0iAAYQG+Hz02/xdbbER5fgqqvBCY4OshOJYkWCk99K9a/
 yLyWsveY3vDb+C9YAHO6zF09U1ZsDdU9d7yGIZnxDBCd0G75hlxhi9itw93krNcvB4L4fBSpUYw
 Yb3rAfKxz/cKKjqstXAdSwSnIxC8s9+TKtPCkJUJe5vO9VGF4fEljAKBm47XwLfJ18qscGxVdvk
 lZ/YI/rww2392GhtCiRmo24f2oO6JpDfJdfdqswVrA/g45mrKtaODILNNZhUWD3umtkl+M98BG2
 qcYb41zRTh0X/RTxeMw==
X-Authority-Analysis: v=2.4 cv=fJ6sTpae c=1 sm=1 tr=0 ts=6acf4164 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=FxBUbxoBbJN2jJ9NEDIA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: mghx1y289hx_O2du10gvmY477rjV9Yy0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140034

On 10/13/26 10:37 PM, yoxcu wrote:
> From: Michael Auer <mick@yoxcu.de>
> 
> The SPMI arbiter interrupt (PMIC RTC alarm, power key, charger) goes
> directly to GIC SPI 481. In CX collapse the GIC does not detect
> interrupts, so only interrupts routed through the PDC can wake the SoC.
> 
> SPI 481 is PDC pin 1. Route the interrupt through the PDC, as sc7180,
> sm8250 and sc8280xp already do.
> 
> On a OnePlus 6 in CX collapse, a 60 s RTC alarm did not end s2idle. The
> phone slept for 456 s, until the modem woke it. With this change the
> alarm wakes it on time (after 62 s), and the power key wakes it too.
> 
> Assisted-by: LLM
> Signed-off-by: Michael Auer <mick@yoxcu.de>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
