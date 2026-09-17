Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9573CD8B5
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789632438; cv=none; b=oMYwz/IKMHNWbZq4NojvdRaHgQsm2X0QfNbH5wvBnXNR7vk5Fhv5ZWq8bpII7MsGROi3785B7A7v2CRaOvdRGIz4S2yNXd7L+MBL5OQmwK02a+ZBKG8DnLkXujTzHsxc8Cuz4xjcYvD7tuoJaWwJgUZAb38WXf4hW+TXiYHaeJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789632438; c=relaxed/simple;
	bh=acBG5tok5/lO9w0dAPTE/HVxQiuqXBK2qnPkhKhs+94=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J6xIGluzGGp8kHmU12I8ZB8vQQm+LgCrETUMzuGdXzDIDF5wivst2TJe3CIbvNYTzhL6Q/Goa4b4qWAFOAKop/d4YBiDs0dBYhyLGzoEawXv/FhOI7XPACMPeKOjecSmmMCasMl4LfxeEaNm8ASEV5xRYPxLAypWd3DVf8mjB9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q+bP2huD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ztu5siX2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q+bP2huD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ztu5siX2"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H60Oj43702444
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:07:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	acBG5tok5/lO9w0dAPTE/HVxQiuqXBK2qnPkhKhs+94=; b=Q+bP2huDlwYG80P0
	LAeQbVXRBKo3CYwj0/eUqNUp0vUxY1Jn8s+SX7KSOtlWO6BGiwj1JnN+51fOebXw
	4dcwczrWKibMQK41aZxOGDDwspwaGw2zv2kSrAIeDmYlFQ6258U65hSdr3kAjuoR
	xo6s9VnaGj2oerKU1ChkO5bxaPj89TdZEYGvHvXifDccnWNbEOicLEtgo6aoa7IL
	U6eDjNjuiiy8K6/hh74ZqvlMbelGmHOcC1bqDQn7b+aJaRfRmhGSdH95RCQnoNGK
	K04WRSGC02euO39QMo3H2cd4eshgyQPAUbHkN7bkDkjaNy9bvns/aROkiwgvYMMz
	/zSVhg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr7uc942y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:07:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53103416ef6so1365271cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789632435; x=1790237235; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=acBG5tok5/lO9w0dAPTE/HVxQiuqXBK2qnPkhKhs+94=;
        b=Ztu5siX2OXaWS0XMjUoNr0832AMwF8MAm7B9J2WWQFa6EZNaqRo3wBon6NI8a+syZM
         Tcrk9gLL38Fi3pkMS4P58j2vBArgmM0bRLN2F9MZXakIPMtdRoag0Qd9rItk6suJZdHm
         TUuxD5wtJ9FXFiF8lpsHhV2P6iO1GHQ9Z64OPVhdPKOSgD+zwej9KBpSxwWx1isJX1Wg
         XVp9rl1fXuSrqvizPqMxuWUxGy4yPU2DKit1PCqRCBd8ghz9hIss+SJPJCnxnKpQKvZ7
         lQUDrt1UDulI2i7O+ojKwDZsw3LA/ffzMWrnmBi3WHHsEpeaxsgYmllyUpHlyraYq6Nk
         gWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789632435; x=1790237235;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=acBG5tok5/lO9w0dAPTE/HVxQiuqXBK2qnPkhKhs+94=;
        b=MHbsfOG2/41FnBS6W/YEpSmt2nlWRSgrynKAFih51BwJFXSZ7xiHqsdje/i6wuFWJc
         B7ToIuv5YJ39LSuM3JotpslP8cyRJ92DX5OTyR4zKwB7HR31hDLyk7hQDmJwA9oa9WCI
         MJiHA7U+xk92YjE23GkNPSAx2Lz2tzoola4f4klzuXzpVCIhEmGzZBpaVADWBJtExpbw
         gCDy3h3OsGHzwyHVxLi4ylfPM3gzDMrndlIiVa8tQ7roIWVpVb3VipyHrAMDjzUn2JiH
         j7WSQ5CTTZbQF7gAe2mcxSgQ3xj+Y2STnZYlK6R6cq9ZvJVT1PvSn86aGVoiDBuFPuar
         xExg==
X-Forwarded-Encrypted: i=1; AKwUvBwoGUiHkvBNOxpG9BkEK1bl9oLJcjsagzcTzgHi+cd8ubdY+qstzYcjqPntcK2DZCCnbB9AYLsPT5zc05s=@vger.kernel.org
X-Gm-Message-State: AFuF++nc2ytyG3R2EbmhFSRQhrg8mlPqKGHLKqUnVUQ3uN3lLQeB+jMm
	Txv/w3Bv+0IHOOFCcVDdlVgOxVuM7LsjQtIE9mp/LfOQopOf26O8ZJekmXrlUmF4Qk6JKiX0xI0
	mTvwe4n5vj7MTL6mORfI2AsFzu4c+s+lTSEiGRT0MyMiuoV7WJY3UnoJIJLJqQTuUXJo=
X-Gm-Gg: AYBFou0a2Z2kYVqtk69ByiTyZr7uEdON7pqO2hR1nSVo2vmW20GaAz2nH+HTjJPtfOT
	vp9lFev0ffkmWkobNRLFSXnutobqTrjvIgn+wrcIrLxkNLQ2GyXQfc71bry3Zz6jJx7w7UFRzDJ
	ZSwoWECZyG3AdRjk0mVVL+UpLw5zmsW0ZZ5n5E/ah1iNwlRZF866YxGfjpfGodKidYUHRl/S17b
	2QTWYmMptPfIbMbo+SjSSngnLfAykGA+/xBcTElNM6dL9h4PB063gDYFvNZZZOzUFapmOTIJt9g
	/bMW9AARHV0GrpQhWJtzSKVVIeBXLhm42cBETspWRP1gxsLLSZjJT7kcGwADjWDkaUibLB0ki/8
	SNw7PFJkk6QHWNHSgXPzpdA==
X-Received: by 2002:ad4:5c4d:0:b0:912:16fd:b389 with SMTP id 6a1803df08f44-9123d9040b9mr86997276d6.5.1789632435447;
        Thu, 17 Sep 2026 01:07:15 -0700 (PDT)
X-Received: by 2002:ad4:5c4d:0:b0:912:16fd:b389 with SMTP id 6a1803df08f44-9123d9040b9mr86996956d6.5.1789632434927;
        Thu, 17 Sep 2026 01:07:14 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de5baa11sm256987766b.40.2026.09.17.01.07.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 01:07:14 -0700 (PDT)
Message-ID: <93ce8588-7500-45da-9b9a-424c202590cf@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 10:07:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mailbox: qcom-cpucp: read mbox hardware register using
 readq()
To: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <7527e6c7-82ad-48f1-8329-5b9222c347e4@oss.qualcomm.com>
 <20260915093910.2487018-1-sivansh.gupta@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260915093910.2487018-1-sivansh.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEwOSBTYWx0ZWRfXwRxoHqbGutru
 +AR+dxlkYn5kktKO+860Lm0RTncLS40k3XC7yQTc6oR55MS4qPbqrLv3PB1ikD6IjI+P8VAGdFD
 5xjveq7sC7bUQQEhDlfp8kt585JzKTixlEMLqu8WbFux1OHTxM2AxrawH9kvFT73DlSjz5Qq63A
 RzNptondIcUEaHKjQGh3FJ15WQaiCVutb9BcYhVCI+EwUqJUCOMMgnCZeY/VNj5BTOfDsOyDzdw
 3Dw/RD3qNazHcer1CIBIxMWiGQ+8JbJapla/nKjoFLWbB3/anIjV0pi7RvhXWObS/K/Kq67s/Xo
 wm999/QJrDUFmAQ/UHWVtUwl52X2YwgJrEvwXu144xTTavGR40MIX6MeJC/VV3lB9KnjwIKEgwr
 X6W45U7L8vriTmLlKUGA1WAOXQa7yo3mNI4LR0Skce9yxPdAJL+WaQXE9BXBkL2Wj3dzOwm2mPs
 4FjLMuSAxISy5ddSZzg==
X-Proofpoint-GUID: Q893lt6OWmD_bFTf1Cn2m1bC4QeYtJMN
X-Proofpoint-ORIG-GUID: Q893lt6OWmD_bFTf1Cn2m1bC4QeYtJMN
X-Authority-Analysis: v=2.4 cv=F9zC5ahN c=1 sm=1 tr=0 ts=6aab9fb4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=YRFV8ZECy-bxCY8ifYEA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEwOSBTYWx0ZWRfXwlobBHYVCmkc
 cEvzU66RU1REwxlF3U3xmFILuf5ARAKReHrX7cgdf4/+LD3HLctV+3HNg8Rb9CEKfpDEDCdRtGz
 hAl1YLOJAGIVEKGhUZnn0LXlIaK2NTI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170109

On 9/15/26 11:39 AM, Sivansh Gupta wrote:
> Mailbox hardware registers are 64 bit wide, but the interrupt handler
> currently reads only 32 bits with readl() at 0x4 offset (upper 32
> bits). This does not return the correct value expected by PDP log
> driver. Reading the register with readq() at the base address
> returns the correct value expected.

This is a valid reason, but that driver doesn't exist upstream..

If you believe it'd be beneficial, please upstream it. For now,
please focus the reasoning on the actual data being lost, not on
some out-of-tree driver having issues with that

Konrad
