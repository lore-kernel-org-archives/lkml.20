Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAB143F4C2
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770947; cv=none; b=Oo1U5LLMTMFukLQm8Gnxfs8V9WBXYjqJiGv7HGWK5zl3qR4Gv8c5+NFolQ0AzW+djgtHWO44Q/a+jWw4Elu/RBkQKiAqw3lUkukhrk+wd/UML47NMKnA5mYGmbeI1r15dC475m4nzIUvZuGe1trco6YC4OJaCSWgK4FWCW/bbwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770947; c=relaxed/simple;
	bh=P1VJDbE19zgiEe4SufUpFuATy+q3+uTw4Pbh2fAtumo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jgUtQA71pzwXMOO3/p8Hl3Jvz1RXL96vYOqjBLgAV6FUrtAMLTTvByRj7zO/fUrK0cpaQJxiCaMlpYy38E4Oqr09k6L/ztil68FGz/HZpQ07Xw5T9/QCov2n1TtYOL1NLuuUGNalU7eg1dcF05tZvzpLm/ggBPUZ/vnbonpy2EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AAny0RjV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XwDs/T/o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AAny0RjV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XwDs/T/o"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6877p0QQ3657544
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 08:49:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PjtgVQL2VOq9CXtVOBKhyxXtKn2xnx5FD2aT5twSQ1A=; b=AAny0RjV4FfKsSsV
	5br7coai3dU+WkirStZRF9HjHNRZAYIulKFvsiFuTBKC3Vr5UtrDj5BJ0LhGGeEP
	Wc1jEv+O2upwIeE8/mtqGzx+yvFI146ZXD99L+M9vi0TO3C1gFJi1+1QQpnUH4lT
	2ZG9EIwfCJFURI3DSYXcJHYy89iwWToq+f1p2c9wOCn4zrOFKKZGcaAcB8mOQfq0
	QdVu7qvoMDhp9VkVLagrh6HbRT6CFUghpiCBVkyf05s3PEnmvAEc8wtE4O37vjzs
	IuPIYcJKg5AXOYAci6Z4rKuW4jn+WEh1W/XlE7S0pGdrkFHpLSETavPo8Osf7yVg
	KZgBaw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghs86r854-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:49:04 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9103db79014so10798936d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788770944; x=1789375744; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PjtgVQL2VOq9CXtVOBKhyxXtKn2xnx5FD2aT5twSQ1A=;
        b=XwDs/T/oSYzxmneT+ZSP86n7IuL5+PYETnbDtq1QWKuEuj243t3KD8MFgQGqcbsdiE
         njajQjoNOMhAt3z9I3lxBggp4Ihu0m/yz7Mi/k+k0RvSPXNw6RRdF5Xf9ujSFgzmYt1j
         eUxo9E4wbrU86IOhLIGS7SzdsIDJOz3e6jw1nXhnRgeZ1a57j5TXNAeIJJGk5bVVbUR3
         1cLPS0Tn3lMsjBMII2pZS/ogpFfJsOPdMe2nKqGFi9sDj1JeOwdRxACKuLVIotTxEs3F
         CZbPNDK+L6GhfpVDU9vwe4dlaR0j5lEYaOLxEwifHGFNeTrqoCEY4KNzJyw8YNim7COe
         Vq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770944; x=1789375744;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PjtgVQL2VOq9CXtVOBKhyxXtKn2xnx5FD2aT5twSQ1A=;
        b=ZYIjk8EBqLqoqdEI297R03i4BsoZOFFZeh9oebsZJrnUSv7tBjzA6XywRq/Lw9puPF
         wGRgnHoDiwsqjcfKv1C4zQEzUuMoqkjP92Jz+hAweDX4DaL66m1KK967Zq+WMYy7iPLh
         slugr8RSaJhah46J+mFi7cf8Ng1flj1QKYNTOak8GIbU5SU5L4u01UKVOSmDW+5j567t
         3/MTD9pcD71VxakxC3hqLXoU9ZrNaYQ45C4I4Wf3wPWCAzyv2eK5d62UjizApFRkE+HC
         pxDKHcUcPfZt7/J+ZTFuYryaa8eDqfmf97uGn4EKkZbvJS4AXNeJoL9BeBpZfv3q0/Ph
         Ohzw==
X-Forwarded-Encrypted: i=1; AKwUvBzeMqlkxw/xcedZGxaXtGANO0ODNY4rOq8kPJBvYJe71kCWcrjVppUyyYvDuvbzXck/x7e++wDuq/hy6HQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nxupZ2h2upyIzvT+navXEFdxIgsBXfxbdJt1w5IzWbbtVdnxRd
	DqOdCC3aWuQqOgoXREX1cgsMwG7wJ1z2WR3m/A2r6SRxfGPTEY+ZXiBmz7TS6ibVOH7Ylnc+ez/
	RhbaMEIspYdHUaByntk6ZyQlWXby7msOBc1Ev8MGLJJXbLraDrG9P1f6MB/8d3peiACU=
X-Gm-Gg: AYBFou3YUWy0vUcQuL862O8XeqTAyHkwGZZSPp9g4JMocBtAk4cDgLHqPXQND9ViS8N
	7C/qm+RueFsx66QhJ4SXpRbXmdB02pQYlNuAvLVP060aGeKoeTmYW6Z/GZkKC+BqVo/ytxn90F6
	K9+VmU1Opm5WCZVSsJLj6/Baq4i+8NollzMd9keMtKwRNEFTphEX/qSCd4tSKYQBG2y8HxUfY32
	CEIyyAfryFPUzYOiuK0a5dT05dCojfsISZVVYI8tKcdLBWZfIcLT46iAeJx/OdbQIqt+aTMNq5y
	GOmPBj+P1CjcUOqmJ5ZpPweqavFK4w2OZjUG8MXG97ND83oEy9CBrKXv6iIEY89w+semdtPjJ4x
	kN/1Y8qdCvQC11K15lkufgQ==
X-Received: by 2002:a05:620a:628e:b0:939:8b89:5076 with SMTP id af79cd13be357-939916c18a0mr1173060885a.1.1788770943847;
        Mon, 07 Sep 2026 01:49:03 -0700 (PDT)
X-Received: by 2002:a05:620a:628e:b0:939:8b89:5076 with SMTP id af79cd13be357-939916c18a0mr1173057385a.1.1788770943381;
        Mon, 07 Sep 2026 01:49:03 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68a6e0esm4108466a12.9.2026.09.07.01.49.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 01:49:02 -0700 (PDT)
Message-ID: <5b7c4e88-3370-4083-9bcb-8ebf1071a759@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 10:49:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] arm64: dts: qcom: Split IdeaCentre Mini into a common
 DTSI
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
 <20260905-x1-ideacentre-mini-prettify-v1-2-9a87882973bb@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260905-x1-ideacentre-mini-prettify-v1-2-9a87882973bb@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SFPvumt2_XWpJuPqy-w6cWwXtZ_7N62-
X-Proofpoint-ORIG-GUID: SFPvumt2_XWpJuPqy-w6cWwXtZ_7N62-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5NSBTYWx0ZWRfX+pPkxDYV1H2C
 VJdyinmmd5d2V/+TL3rcy4nDZzO1F++bpJfBb0WXKkQCHpkTfO65KL6CBl2IVPqHEwyV+7ewaZN
 3lJJtEZ97faZjZA8WAMwROoNit+4t6M=
X-Authority-Analysis: v=2.4 cv=LseiDHdc c=1 sm=1 tr=0 ts=6a9e7a80 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8 a=J9qVkMaQZxiu5A4OjBcA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5NSBTYWx0ZWRfX1cOjkElzY4Ln
 EZXQpPKekwb+OiQDHrpZuKMomJz2ioRvHbENVFEgg8wKtbm6M1r0wJeIE236wb4wymaPzp+oXLf
 HQll7W+LTza17DYdU1pl+KwOh8EH4m0LSlQZXIQZFFfLmU2kjqAm56KYHNZyCz2xilbcyRWkm5B
 Xxtv+4kuSUPcZh8AFmPleWf7MKJ6astUKno5sjEp8gEw2ntKxw0Cy2vOc/Mfcd1ti2LLmUPp+nc
 /ZNJz+mbQgnQqjxGZnFMv265DLYGRYlNyCH9Vo2MDsydArls5q0l2wHfiu8HJo3cRQJgpWabCIm
 j/eXWxfsGNZ9P0Fnd5vziSDOwvl+lHnBU2x6kysPQrnpwFGzqYJ0ljQ1dsX+RFpfJZrKN9L3tA3
 J6Win0fXZT//6WSbNc2523bnhd3YMAPuKV6aDwrH4EVJTAuc9dqDHp6z6v+zYGBbTMTWTKTufL6
 Xwjt6APz15i/huIjNDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070095

On 9/5/26 11:28 AM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> The IdeaCentre Mini 01Q8X10 chassis is shared by Hamoa (X1E80100) and
> Purwa (X1P42100) SKUs. Move the board description into
> x1-lenovo-ideacentre-mini-01q8x10.dtsi and leave
> hamoa-lenovo-ideacentre-mini-01q8x10.dts as a thin wrapper that includes
> the SoC DTSI and the common board file.
> 
> Assisted-by: Grok 4.5 (xAI)
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
