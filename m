Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8693443E4D
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792152814; cv=none; b=B2E9uHpMRAS3aJcr2xACH0qIe1kRovCHOGyo6WCMernU+8D9wHDJ1Ekanf+L4ZozjoUpDNm8fLmtuFvEIDEdmDaGjRD4eZzy8Ac+UgxHAfGLviVbKFpl8BT+HcsJAFpXD9rGrHARujCvjPDKJgPy3D+DeUx8NNAw6L4UqjAiRf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792152814; c=relaxed/simple;
	bh=Hx+kasX757nKJIHFXkZ8sY5/J1mcVKzN1Gb/FSM58J4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IVlTn79iMT5EihlWbdSJVgGNEBnScD+tOG5g+ko9JK6dCPerVC7OODP8pRBEWGCMucpxc0Lm4EA9xhdvTdy09KvCTbGmnqSj0tYuP8bKBgAz/SXmwf+fg+aSA5FQKvCeglyAoZ+nUy+xxTGWPhGoFhZW+9NXNC2hUk4El54sZHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mOZBAvNq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=On+VGYgA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mOZBAvNq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="On+VGYgA"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAAMO62998612
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:13:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2ftWXraDk9QDVAMxNPvnX3+vFGzgyBKZIXYyP3mhWOg=; b=mOZBAvNqrETlTo5t
	oLXQdt8d3iOaBaEl1nkvyHEMF4pAOblVuA/fagfV2eefOEmZsSNV3zGcfF3FyOHE
	MQQWf6qOJ3OkhTsPhs13Q0VSwi8lTZdUGA8VTjIyIbC2dRB7MBNgLIlvTHaeSdYZ
	oWjQCE4TImGjAQnCXRg23KtSPXJzIBxf7omIeKiWtDQFDRfaWk9KTfhLdCRVfsKL
	fVwFCEEdvRp87bb6noRdrMXrkX/yRWR7m1WQoC6uefKkZN+OR3HukJXwEJ0C76Ol
	GfjDngAV/FBpbQDlTtdRaxnuriCAmxLzjPsikQefDXAfB9J03TgN075A5x9S3klV
	GYVg3A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8r12fdf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:13:31 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9179d9bc964so18627096d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792152811; x=1792757611; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ftWXraDk9QDVAMxNPvnX3+vFGzgyBKZIXYyP3mhWOg=;
        b=On+VGYgAKKhbA2Ug1qo9vhrLTYUmKiLKzcB0ajp8yugEdU+2VWikVTWjAKnEbggceB
         Qah+mjRFrn5jPHPTyPtugGiv3MMcayBsAutMCltXw61U812kV77no9FDzuc2U6ME3hcY
         6bPgiZ8AzrXggYIvpxM9mU8xh2or0skrHGJ6Eec6fOlbtmZEUpEE2t61yDHts+aJxZjB
         Q1BYpCkF2eWitd1NZe6qMLU07Qf/QE9PUWCLvnuLJcrFsZG0oj+Cde9wRVcfFxh1xjm9
         Ut4y1SpFgcTcB6BE9L+KqRvozX030yi+APPloF267lfiBGxsWOT3UGSqnzykeZnT7XnC
         eNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792152811; x=1792757611;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ftWXraDk9QDVAMxNPvnX3+vFGzgyBKZIXYyP3mhWOg=;
        b=sFfgfpNYt/VcG/Mkc63oLkOhjdmw4fFnZ8+5AZ60UFc8Z4fGADeudPsV6Ikrg1tNC2
         41vsYuFD0xexSxBwN1aUQfjeDujbT3iQrOTOBPWOuzAaO4nwYFO6vRWg5gCJ4lRUmKSK
         dMtaFC4nShlYQHNMetvw8AiNBycxIwQfgQAqrPkHcKkt47de3BwwEkRg8JRPmoVUSXEV
         6H16/nPMDIkvokx4LDZq1RsdvNbzcp29uRiFVTN23sAfBBdX6Of+4rZ8UiAeAbuaDROI
         UdbohTmAI86g8xQkZbK5C2mMVATpcfrSBCrQZFA2ZrC4yzV1BOILE8OAMFoav807yKLt
         Zx6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxm7ROjrfQPVqXAXCotg8GK8yyGXv16xeP7Y+Dab4Zr4n/nppYyuLRoL+LVabFdaD1/Vm65NhkXCJvS+U4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPGJuYG+2BcBISSwzCjA0IYnXV1EKtESIXLYchgBmiypgzr13n
	Cg5Y/0iT16vXhDqCWBTvmk2r3YAArHyvFRxYGAyFnv1D2N2dYS04DqNKdITRPC6r+9s9gD9xJAX
	1p8eWJQAqfgtm5H/NNV8Y2r+Z3BKscEenFZk7nk+1P28GDQ1fcz7tABIw9cy32SCQxLQ=
X-Gm-Gg: AYBFou3++xD6C/8xwMloVk1sofXv04ylemNmk0heYjZ5pgIjnECVb1C3oytN9GJeQWE
	uQjkBa27zmA/aizCbxFm22K+vojEafd0RXM8TUixsBXnTO5EHJK3yZS9Pq8hLxny9De5AcAt2ek
	efEdYFNWMx6cfhq/1y5Fdn93MYVGNd5BOzJzVVMidaQc5cZU8OhwlEWaRJHlp6oGf2arXE41VV8
	Usi/8hA7cumJ/l8yLinG2luk4VPkgJytjyA94a05RAn3lZrt/8eoOUBHhCxAjQdyI9ibRgsMJJ3
	QfTCroBP/E0eq0MA2DOjK5vDwJgECayUjVsJzyBq+W1qNraKQDJdZMJYZv2BUdnzPHjqI+tRcst
	MFzqLvJAwxQYvXN4uyd46fw==
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr4177425185a.2.1792152810775;
        Fri, 16 Oct 2026 05:13:30 -0700 (PDT)
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr4177421185a.2.1792152810265;
        Fri, 16 Oct 2026 05:13:30 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dcf35asm65905066b.19.2026.10.16.05.13.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 05:13:29 -0700 (PDT)
Message-ID: <c1abd9d4-98ef-4469-b4f3-94a8dcad9d0b@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 14:13:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qualcomm: qmp-combo: Differentiate clocks related to
 the USB block
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, jason.pettit@oss.qualcomm.com
References: <20260930-qmp_phy_usb_clks_v1-v1-1-d4dccc9eb263@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260930-qmp_phy_usb_clks_v1-v1-1-d4dccc9eb263@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rnuSMgRbKm4x0psno5NdZQdqF4_6H6qx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA0OCBTYWx0ZWRfXzvzVJHVz6GPT
 YNkEkgvrSCAIwE2XuWEw8CRuX6rBXU6FBpwY6UohlGOz4UXbUlEOoC06CxjIRrR9GQBTzyId6ga
 uFSFENKPBB1KH4UZSfCMKPrldE60BG0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA0OCBTYWx0ZWRfX/tm9tl7e0Yj/
 19qSGiHiZdVn/a/1HcGodbb4rXg9GHBln83xuRi171/aFNaOURXYYQGvPmrcBHhX4CqbDOWcYrh
 0070fd9HG4i8GsEt+b1pkPexxZOy3Ux0Q3IPXhlUf7vfWi7/pOE0momY8usTKVDNsl2YrwfM+sq
 V7aZnb7OcEB9WjbIAZ3B4Jk0YMuKDyz9Ie5kgK/FX1sN8LkolGMC/JF1fwa7kveJFcBngy9l8HD
 MzJBGbHqDMpD2uH2mzpVsZ/9lb5PJjw9Nx2XDNDEETb89AKXSd0sGkFEGvj5lp4AbIbFc/bRls1
 v1QunAzvXXTi1hxw6yCOMtwfLHKp1PrIbAbqc7NvDS4Qf4Y1zz4Cnn7GKV3Hu0UHtyf+tZaifUL
 5KVF/jpNOvn8E2dtvLoL63n9zmuKV6MDQNGjmgyhPPlHJ81uvfJnRSzf1fHixMZK1fbg/BufzPS
 s76VNZzEvN8MIUDXSZg==
X-Proofpoint-GUID: rnuSMgRbKm4x0psno5NdZQdqF4_6H6qx
X-Authority-Analysis: v=2.4 cv=L/CI0OT8 c=1 sm=1 tr=0 ts=6ad214eb cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=p9KmNGLgWT_GFA4DS74A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160048

On 10/1/26 3:16 AM, Wesley Cheng wrote:
> The Qualcomm QMP combo PHY has a USB and Displayport block that is
> sourced with different clocks.  In situations where the USB path is not
> utilized, and only Displayport is active, unnecessary clocks are enabled
> and not used.  Split the current clock list into USB specific clocks,
> which will be enabled whenever the USB initialization routine is
> executed.
> 
> In addition, move autonomous mode control specifically when USB is
> active, as its primary purpose is to detect RX detection and LFPS
> signals, which occurs only when USB is active.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> ---

GPT has the following concerns:

[P1] Don't disable USB clocks that USB init didn't acquire
drivers/phy/qualcomm/phy-qcom-qmp-combo.c: USB init/runtime suspend

When USB4 is active, `qmp_combo_usb_init()` takes its early return and
increments `usb_init_count` before the new clock-enable call. Runtime
suspend then uses that count to disable `usb_clks`, although that path
didn't acquire them. This can unbalance clock references; the count
needs to reflect actual clock ownership, or the USB4 case needs
separate handling.

=> the USB4 state machinery is a bit fragile.. but perhaps an if or
   two will solve things

[P2] Unwind clocks if USB-clock resume fails
drivers/phy/qualcomm/phy-qcom-qmp-combo.c: runtime resume

The patch enables the common clocks and `pipe_clk` before enabling
`usb_clks`. If the latter enable fails, it returns without disabling
the earlier clocks, leaving them enabled after a failed resume.

Konrad
