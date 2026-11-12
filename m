Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794473736;
	b=d1MwvXnVprxOJ9gCkG7lRWQqIZstSfUzKvvuuvThhFMRCN6EkX16AFMjU/zqIp/TJLe1
	 NPuov6IenQ259RYgvh0YHlrzO7Kh8ttzPa7COg47kvXf+5k8OmzrYZvSl7DMYwupomtaE
	 Re8Gk+NI0o0wPJAkcjeHPpxSfiFM1OMz85p5PgNQCa9c+E/ezvW8UQeQ218a1JfWljIVF
	 H0FdO6crvsmEFmFFBmYgHfBmzMiCbmSZ/ifLYpa6IMNHt+gSoHyyEBNhFsDvS8DYOYjgF
	 xgoQyQLKzTYEOcnwFzo/yRb6GW076OCO1zmga9BueR5wuXxRwBp0y7O6u7BmWxZIDkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794473736;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rPuCsMPAgcPeDiYrEIQ5HIEymwqxOjkKE79s4sugm2Q=;
	b=avKYEaV2hWxCAGGgzrqxjc9fNWAGWMZnhpQLUGU2pdYhXpA3bvxVxRcKOsqQXFMsrkg+
	 ehsFwgXFVIvwmT4/SKXSveLQlrX0AIprZzTPMCAglJxj7skJ7hdhiwk4lUIpatxivr6ZR
	 DrZPYe3y9yX6W/p8bsxHD2bbL9Ye13C5PDxbfQBFs6beTl0D/qlW4u/StoMEJLz87YKKZ
	 Fs+rOF2BFMFYBIlv9Yn8EbZ0++iX+lmSkjXbHhMm1fZXGxMZMhX4Cm5uNLPY4Rik4uJUX
	 u42r+buQiKx7chs3ldmT1hWE+VnELYAZ+JfMlRG55quxRk3BB/PuepQm39LxrAaUn0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="nD/N2SXN";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="TenkQfs/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C117606A333
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:55:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C117606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nD/N2SXN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TenkQfs/
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2Zhi3903710
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:55:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rPuCsMPAgcPeDiYrEIQ5HIEymwqxOjkKE79s4sugm2Q=; b=nD/N2SXN55lL3V5r
	D6GYiRrgBHy9LM8zBSmq3npe50GHV5M9UxSONFkfCmuBWtpnR0yQ87kAtOd09uBn
	ux+FxY3b4uISVao0kT75UqDC2pDCBMy+gGcir2FREBuDSfOc6IAQr79IsEcbdWMh
	rbyQbCmm/lSnS3Vg6IhCWft5ynEciNr3iASUs3dYSbM1xlV4NNC5Sf0WCWbhC9GS
	90U6EDf+4ngzyOyCYx7CzYgQKK3sf1c1Qkq0aN1Epqd9G14D+ntq1dyFPgUkDLI/
	vAeDI1DMg2Rd4/DPRDwhnZJV89UZSocOlkwcQiJ2MJE6OkqjwmxJ5XcEZNH9FjQv
	R3aNww==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt1ubts0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:55:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92eebb130dcso44106885a.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794473734; x=1795078534; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rPuCsMPAgcPeDiYrEIQ5HIEymwqxOjkKE79s4sugm2Q=;
        b=TenkQfs/FnyeTgfnvl0EA8o40J/pZIM1q1GLPZm3k0TZGqkUh0pHi3NAE5ObP/Ab3y
         Im6bMqK1NNyyI5+9SeCjp5hqN3Fd5Nn/x3n8XB+438dlMPbAcTMD8gceQtZaV4phD9bI
         C+LS4nZFj1dI9U54mAxBYxC3E/nFnJmaW0Ss9ewsZMF5yPOVHlvARWmbOwwLWZlpVvS3
         CuYj4baBG/opjmIHuw27MGK3DNMpdXECNXR1wevK2vBcltp38qBc46eBgtV48fgMNfWr
         H7lLb2eTLUiyrfJdUJB0T8S71hR1ZHw6R/qCaoT0OtVvYI/dc5DPQ26+FQhtqsfUVtHL
         OQiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794473734; x=1795078534;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rPuCsMPAgcPeDiYrEIQ5HIEymwqxOjkKE79s4sugm2Q=;
        b=XmzjGwuPDUQgjoISk8J2n2iN3wHmy6U92fbUUvROXagYLFI+nuaRruQT2AS/pMV3va
         KFGP7xcNC6JB/yDBl4B5KjO03mEPRz6qqUVvI2UMoFDrct5ppx+FvZEMamGmYsYp53mM
         Pd0GnPMnTwWAWz7Dmu6NA+4A5bma1zgI9UKoZGmcQB9sIFEl7qVs6ijvqVEFQPlt1Uu4
         q9PozUCoPZlWH3f6gQRXvRTyaaG6VyzRq6sQqEKddnWNG88Kv2RDgng4+TLy6inZ1LVj
         oKsNdyG4chTn8PGgRmLbXciX2LGXE2znofeA/kppGlXOxEvk4NkBx9qFadtx78geJIrL
         QadA==
X-Forwarded-Encrypted: i=1; AL+hErFKrZQZpLoRea5rWmdjFyh56rnBn8X2X11hIAnVOMt3878Eh+tVbNj32gf4MtSxdes5r4aFAQjQgNhHWNU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/P30P0kX9z14MvzHUTgxrae6BDZvaNSa4p3aKDl5Nq3QtUeSQJ
	RIuIYqxE24DRF5xU++wOoZqWOHM3i3cwxtckHK17Phny4H9uJ0QKt4hqQvlNEOTT2U//i76Hz80
	CmRvRU+COefV7+pLqj+vcwdVTcD9t+JeFcob2I1y3Ws/SmpKOiYU6lX7Yfj44RpvhQ/0=
X-Gm-Gg: AYBFou0PAw14poT2F28xvZs/59cjgC/LvsoQE+XZNLljgGe6/drDhxrjAR9526OB0s1
	Nq9Kp0CSqhWTPmbIUgL8xEcmjGxBKfKhcVqrFTPqKOssU5b4BwhFKemT/0hQ3f3u4hsU+UCVXIy
	cCJvUTlfVkULF3RfujEQ4oljMHGNv8nN0aEXurerOorUnEiAA8dyEOkBuN6Y7mmrevuzuiFHmUE
	TgC2df2K9YknX2mXBZ7L0Ic8cATIUPIRGMkpZ1qp0VkExcx7XLdknQArFKsleeV1AZ84sPCT4n4
	N7BItNrKA/QqmBYGw3KiSVqZoKrpY/RiPDqN78gKS7ABaq3/f50cY83uaclBBneDKkgmmNm7/qS
	thbiQ8MfWFtzphlKLa9Juij7o27Tg/BHPRPfIIXPqCagXN9mSY/wqy+1e6nfC1sxIfIO0a8s=
X-Received: by 2002:a05:620a:7201:b0:93f:740f:5a62 with SMTP id af79cd13be357-947b005d221mr842045485a.6.1794473733646;
        Thu, 12 Nov 2026 00:55:33 -0800 (PST)
X-Received: by 2002:a05:620a:7201:b0:93f:740f:5a62 with SMTP id af79cd13be357-947b005d221mr842042385a.6.1794473733043;
        Thu, 12 Nov 2026 00:55:33 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a63f8bbsm317160966b.60.2026.11.12.00.55.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 00:55:32 -0800 (PST)
Message-ID: <6a1f3aee-6e5a-40c4-94a6-5c523116bba6@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 09:55:29 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: nord: Sort adreno_smmu_0 node by unit
 address
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261111034756.3632469-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261111034756.3632469-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzNSBTYWx0ZWRfX91kMbKIimArm
 qZU21SFUTPPmLPqnok/3toZPXirHMTZ8RcDSc+9YQuqzgZan9XtEdG1gngC0Vh78lPn/d7sPH9q
 WjjRtoRm7t+oACkM1F6MycuLt1CXpGs=
X-Proofpoint-GUID: 6XyS9BwekuOCs5xfWAlwy-gcd6-fGbV6
X-Proofpoint-ORIG-GUID: 6XyS9BwekuOCs5xfWAlwy-gcd6-fGbV6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzNSBTYWx0ZWRfX0ZBwlbVqtcFp
 wT5WeceHo8Y50267LR6w8Y7GBM4XenHELoZ2Gv0iI68Tfc2hyZt77pMwNz/h3Msq4gnqmzDeMQP
 TGyakbnF6C4+Yc7Q261gJpSUDcdF6lnVl4i16jUCo3n0mts5w5ugZ3IjLHduA9Q8t77AjddK4Bn
 daNvBiltJjgpJOP5YIkhOHMdbY2LzRwi/uKQ0lsNfOi4jJP/djiPsVnGQw7ekoIQeUBUs3+4Ghu
 khY7BUXVckl1QmyHQsPNZ1ru+Cti+8Liot97wVE+hVJJttkq1pjQtSouC3uvN9NIpNUl4w10V6A
 bMHQ7sGdC5pgRDamQoW272PrLqLEhlgl0jwIx+yQ2/JIscnpuonHg0sjjr2ALgoJPWBrZhkq48m
 6BgdL01B5aBw2mXPVpJ2SGfgGa603p3vp3VI9Tvuu3TsEn5br5cGi7M16HRRto9iKUoJ0gXfuA4
 iv+3odg4kSoHoYqz1RA==
X-Authority-Analysis: v=2.4 cv=LvcHWXdc c=1 sm=1 tr=0 ts=6af57f06 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=V6h-8VdV8C8-G1v_c3gA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120035

On 11/11/26 4:47 AM, Shawn Guo wrote:
> The adreno_smmu_0 node at 0x3da0000 was placed after ipcc0 at 0x9007000,
> breaking the unit address ordering of nodes under /soc.
> 
> Move it between syscon@1f60000 and remoteproc@4c00000.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
