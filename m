Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660549;
	b=n1dBH/h8Tek1r6ulW43szZEgBnm1k3oboYq2G9mAzC4aFvzA+iHoPatxz7YvvJrcpxUX
	 pzun82fsKjQJERK/X3KXW8S0Yf65a/5RMsYvzargxtcxKGd1kblWCowSsPtYKElWth6B9
	 f93VBxwDisJoBEOZeve6CqgwkcJJudnL7JvT97kxxCtAeRpjM3ZO9jKkFCuLC5RIr+9Pv
	 tVMhDL0L9mwRbgA2jPSvtZ6qVGe7kkQLvGUOGMPgVa+HhZ9Tmr/A6XYL/HsBhhJBTr8Ud
	 22M60JaTsIMDwIx05+4YIy/nameYeE6/JMFdzNiDf0B2SeqEV35Kp3jgdRm8Jj/Th7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660549;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8RwX6tNYBzJaiHwtZtMYHzLLMC2RohH8ZKxS2JYdRAQ=;
	b=4Ye1QxlsHCQo3GkPJGnZanSNCytDEJP5Xfk4Iy94dLe8qgRpaiwnMuITsjbfzTk+8c+i
	 AXBouiMmIqoPiGcCYCHMBFoJwVwjIGSsGXF7Ene0jj5le8bDzTMbhr9BN+ad16tOv7S0a
	 kTNmXC7aaXbgCMwP4ZoQZep+PajDaSRF5k3iQhFx3VLtJW4u7AdDTOPYFyjQJmncXlADo
	 BZfk3V9guuz0jDIQ/O/NW3zfe+r4wU8OTPNzVqSJELPQKoTez2MWR4HUV5CZ6Pzbog7+/
	 OHn1YwUvVvhVQkaT8ytsuxEOC9UDlkIiGzd724BYxrPj/2v5CbqplYOAxfuDz2eWZLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aCQWpE6k;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ut8ee+Qd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84438606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84438606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aCQWpE6k;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ut8ee+Qd
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M6xrH72171944
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8RwX6tNYBzJaiHwtZtMYHzLLMC2RohH8ZKxS2JYdRAQ=; b=aCQWpE6kMqjIkg2S
	jE0PHueDDCkGqlclCKoSQ/nClliaSWV4Fd5lB5wjYWcLFTbn1iukagL6AEhwbLLO
	SGxI0kPy/I4imEXHHbQZEWT0eKm0Vv45Ha67io3PBm+D1/zQCL/VThQFqnk38IqB
	Zpj9TSZT1keH0Mgh6JJREBsCdix0hx+j6JsjuG1d3/0/AbCuTuKmEKt5yXpsJlOL
	gAuY8/9WyZaKU65pxBawLCCGeZh36YKgGj2udzTu9i7uU4V3XKKXfOUpsbEMSuaK
	buqDXMcIXxdpdr4ygC9WWq74JwfF0r45fT+0xHgxoJarHVCUo1JzFLnm1RlcEa6P
	xmdcxA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahn1p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:15:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e629c7b16so37143585a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792660548; x=1793265348; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8RwX6tNYBzJaiHwtZtMYHzLLMC2RohH8ZKxS2JYdRAQ=;
        b=Ut8ee+Qdxh7NHtFhXqvmLlIy7gHFkpsC+FxOHryjqlGayTBbqhaASAxkgWlcO4VNuC
         BZKrkmKsQuSbjwRTqXHmcB4iybn9jnWuzlQF6GUWmSYlGs3iNpVwm3fFeQ6vuLMR6rNO
         mcjg6m9AUL2IxRKCXUSczbRWSmtN5pNI67CF+/ES7SDZU3EhjxRQ9zNTl8NYrK7mKGsz
         XVmv1xUl7raKaMOPznvzXXQFCPK5o5LtLEXqPL6gYZwaFjCCT2aTruItjF9MsaITPSQq
         0nNeNBt7lUGTDS2Gn1uryLOTIM+Rx/lyXQpkNGbDev28JB4iw8YVPxjsWph5CWhqoUXP
         o5hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660548; x=1793265348;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8RwX6tNYBzJaiHwtZtMYHzLLMC2RohH8ZKxS2JYdRAQ=;
        b=DdBRbWXs22dgVpqSHH4rdBaB5E2POu9riRjG2AIr4Ip4e8eXIl0n6rjUvAt07LqDYH
         mcmXn9WzQvD2kkjmzVln0qSsgHVLE9o/PX1QggWWfNkn6Cv58MEhwayhQZxzQ0fET1P2
         2LiRHPM9JLOpqC1sTZTmHTY2Ch7H172UyxjCC5eCKtMALfYVRy+lTaJd3KwNNsyv5O56
         mlPibcCsDFR9hPp4bjz2K89At/3xv5eiLatBIFxtT7zMIE9MKXWYrZCZLDfaoMqfHz7N
         1GF4jCeP2OG0ddz0Z80yjN8hQiaHpowwzo4crqn2ThXLX2E7uJgkUqkuyaXc+RSJGv8T
         AzkA==
X-Forwarded-Encrypted: i=1; AKwUvByEDwO4Sx3/NdRDz94Az+4TJ170VnDQko4G/+4MuyoClsMc6wTbRvec7LQTHv56mVR0BqVaJu5ROYmQ+1A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxO7xrBAKIoSUXwWlSEFDFn0fjyra2khEPVY0VBna5/0Bfvcig
	8FpPM1mwbHJJlCJlAUiE8Qo1rOmm5UOptHUTqomffwPaPrNUJvY+7W96ZnBXjbJfgAE8G3+KF4M
	equgjQ3mo3lgmlBjtRdlgaSSErhv3iftJqTy1ArCIPiD2qrmnqMb9FwwyxnbE/vybyqs=
X-Gm-Gg: AYBFou2mE6Mi8tjnRcIch6saHS6lAtRRSIIXBk1meIlomyavet1lAfQHGinTWOZEISb
	Nd5ERw6gUMZGuwDixm2DbCPsX6HBM8Z/T+5URhJZySwgsl+s5RsZonXoC6BT8fl+H9C1qV5cnZ+
	wEkn5ulxxXFa1yS/2XvMiIEcCBEppwAdNA1DE7v0cklc0axMdPLIJ6YrN/huXD7a5Tk/pIS+N5v
	G05TPXl8uDuHYAiN44Cb0lwi6BDNENZssEmBRur3liS3CxF5KPzC/+7ykc8aDKILF0PLchQ4Y6k
	myyyRfTEd8gXcSVTXF3gDHGW+seqleEGGg2tVErFCDAszHJRhT6ckWP1o9nXJMjJg/5Z5FhYfX6
	zbGNCsrKdnzP+oZtCYIG8bg==
X-Received: by 2002:a05:620a:414b:b0:93c:61e0:81ff with SMTP id af79cd13be357-93f57ed211cmr989933685a.1.1792660547884;
        Thu, 22 Oct 2026 02:15:47 -0700 (PDT)
X-Received: by 2002:a05:620a:414b:b0:93c:61e0:81ff with SMTP id af79cd13be357-93f57ed211cmr989929985a.1.1792660547440;
        Thu, 22 Oct 2026 02:15:47 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a4ffcf7sm85881666b.24.2026.10.22.02.15.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:15:46 -0700 (PDT)
Message-ID: <d8978154-e99d-4d3b-8d0f-b707b2ce9722@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:15:44 +0200
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
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: eliza: Add CQS EVK UFS variant
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260928-dts-qcom-eliza-add-ufs-variant-v3-0-9a2fdbf6baf2@oss.qualcomm.com>
 <20260928-dts-qcom-eliza-add-ufs-variant-v3-5-9a2fdbf6baf2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260928-dts-qcom-eliza-add-ufs-variant-v3-5-9a2fdbf6baf2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bd_GpmyyCULJ1eItH4BCFXeXIyvU7fri
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX24uGg2E6QGfD
 u1i2KNY1RfayKLFDmwlurCm8NmjWLSifLZiXbNwgwB8tA8o2X2SMpK6DTjL0OBf5bFRCCPJTJrJ
 yy8jI6rdZIGWwCAnXMlJth75Y8wXo+c=
X-Proofpoint-ORIG-GUID: bd_GpmyyCULJ1eItH4BCFXeXIyvU7fri
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX2U0vqdzz5DdL
 7KmczAuhH5hidJeBrqBTOnTQ/oeRb4LoeXSoJ2iHE4+URa0fGsOWN8FJ8Xo8WabtSImqjr/D7N1
 7Ouht36TT/e+kEwHANQFNNoonRdUw6hVo9xK6jzb205CCJ0M2dMFSy1Aq3nFMeUO6vAm/MWSd6M
 7V3ZeF++oFei12nnD3yUW8Gz5+kV1BnPqjaOxD4CwJAU//daXbRPshD4Cmtz1y7+F+R1UYqXP7Z
 QjwCAZIcAwD4Ti0Uw7nPKkeM3Gj8NtIDuGuE7OjDdiblPO+zejKTVbrwap1y08Ue/iTgj70wS3P
 9+uj/qOXcipBDA2NvealoJ33VsMF5sNW8oQTajkNDQt1WXYUn9WPQxoL5oYfyRCysbg2qKzqRJ8
 n8r+ECq10bmFIhERv5MfFdwxBZyBkgHed7UHETt5hUy5Bw+nPlaGsjLPYiKz1tWt2UpcbsOAfjM
 h1i9Yh/oIVoJONC19hQ==
X-Authority-Analysis: v=2.4 cv=dOszC+Zb c=1 sm=1 tr=0 ts=6ad9d444 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=JxYTsIeC_X4Nw1WztroA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220036

On 9/28/26 6:36 PM, Abel Vesa wrote:
> The Eliza EVK carrier can be populated with the UFS-equipped CQS SoM,
> but the existing EVK DTS describes only the eMMC-equipped assembly.
> The carrier board itself is the same for both storage variants.
> 
> Describe the UFS-equipped assembly by combining the UFS SoM include
> with the shared Eliza EVK carrier description. Give it a separate DTB
> and the UFS-specific compatible strings so it can be selected for the
> corresponding SoM.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

could have been squashed with p4

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
