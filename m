Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CB44E4301
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792056968; cv=none; b=G7zWBozl9vvEvuRMwcyzpGKdcw4X9RiQmbK+SIxnYfDO/FsBtVsrAakKiBdMgzKTmzN3qkbZJ6Jbm/IQwhdeOYOtjL/SV5oLgBIToNjidjeRMHMx1BA4/RdzTCO4LaHv49ZXpaVEb70UAjcINoxNcXMXkJkzXlJJy001R3FltHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792056968; c=relaxed/simple;
	bh=TK5BnQdSuuQirHxFtHidOKQXdjYka8Ot2F1POC8pMfc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q9PPb/PLCOiQK0cvrUKEGUgL8z9ab7cEjZWYIeklu+yFhs0EiSk06EDgcOANe6tfPFtB7C6WPfVOPCCZ8JMdif3gioBI/ndbc220qV19GdcYuf9kZd+YwkRVweeMKO11DwE4KeO6J9BmztHA4uqyvz+6aIJF43QNP1TOTM8YyNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CKly8Guj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fJyNGd9F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CKly8Guj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fJyNGd9F"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F7f7qJ1707226
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:36:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ikdy1S0BrrUvYwTxuXOoiMGXXmPJoceKB/d1OMsbJz4=; b=CKly8GujUFdq+Ozb
	DGd6bdE71DJK6sovv1622SDhHMBWd3Rg57E4094mhT52dHM8W0MCUryGiw4cHHSg
	55FZUedFiOYXRVC0+hAFplGBB+QV6Fb9oUH/c7vEvWeficPf51yN/qKDjB1yx2zq
	GJrzhre7SGXWmmc1d6PgY+MahiXNwrng5Bor+9gouOZCvnntP7u/osmD/uasRPFt
	Zc8NlxGoDVJcUpNHAL58KyrdJrlZj/RodiadzWnbUZxi2u5OJXOef3DzG3kqF+Ea
	Mz9B6P3+DhcxvatIz4FwgW+iNyBNiG0D+zArBBFHApArzMnMadqpAecoRu/yEyC1
	Fzaoyw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4han54suqk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:36:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5360b8cf8f5so2689531cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792056965; x=1792661765; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ikdy1S0BrrUvYwTxuXOoiMGXXmPJoceKB/d1OMsbJz4=;
        b=fJyNGd9FXkRt1gOVNc2rKAHgnGt80A50A2F3UN0MUyTLHBETIvqiCe8DjCrVXuny0U
         /K/kesvfyuoJHwH1m9+5fAyMW3cd/us0hAFmzKbvurvhP74E2FM5zrEsFu7IymigAZ6H
         2qkdpccIcLOaAPqSkn7jD6J+9xWShuPBV+BigVre/Xbx51CIt/F+leFUnzKpZOPxpdSz
         7VQ65eYtbfvXmgL2QIKgaL4TMDi9XRyU4TlgpZZsgrt0rA4OcqqiFaSZwPKXSkcUvu8i
         IXOaXyzuc+Ste2/B89ZTtqN6Sss1lyDSHig0LsLJR9WIxVuXdE8H0EQpsNrYB/NX6X3D
         AStg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792056965; x=1792661765;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ikdy1S0BrrUvYwTxuXOoiMGXXmPJoceKB/d1OMsbJz4=;
        b=uCkYHomXislYUxgXtrL/wF0AH57OJFFm8aKfziY0ZavahStfF85UeAMLocraMes0pE
         gFOi6IB0Ud4rLL7eUkwoLH4BRUSETf8ZOlAXf7Eo2rnpC6iNB9ZLa+08oqv6uPDXPl4s
         7lwzBxQK3gAXvgYIbWAM2yEHkEa8UW40To+TrxcTdEGB2oQeMLgnlWXAj6W+vRNaSRh+
         r13aap/X0YcBFnMa807WpiSuB7F8T5B4eZXte7mUAkBYvyE4GD2S2xXpLjekfsz8kvqs
         zpIlgAMSggHsjdRRi24nbkZW+IbYuYwzJN58kuqnAcmJY/YFBIT2pepVHdvTpUG1fmQU
         nQEw==
X-Forwarded-Encrypted: i=1; AKwUvBy9EtY/sekQFEztS4IIlchp7e6QWUqrWuW3eRm78nS/eeC/qR3cx0DzHOQkPMpmJ9YHwtFihdRp0Wdw/Iw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKuW9kwJUyLgeU26A9RodJZelvZWtF7lPOX+hGCvlfgwd/811h1
	HKEgwId97NaHpfMnJbAEnRD8uj/8etsaYFDVgxf6/ruZHePDk292Y5zAFxwKvwhCLAeKk8Hn18O
	5ZZRN4WLrXCnE1B70xJsw9SFKFKZhRiuXN7ROEXhZQcanW9b8yti13JXsQXkmDnT8gCM=
X-Gm-Gg: AYBFou1x3ojoE9Zujmu8lphqS9oKLDKaXvkTnvf5A9TIfQ/060dsVDI/fU84jiytdpm
	hXmhllss+bNrbNx1vJEFEypv/AHOh80IHg1jRE7OdDjL3dx+CXypJmzOkhJp9VFckVi/PB/N0o2
	9P+siyr1kvc7aWmboEcT3jsAm2GEOnyPfRtS/Iy+VentezqOmFXsTJTIaOrZkHNEjkFcyoTRtW6
	BEX+hoojhGovSK7OIgwr/sv5zYMksjXCCz9weu28+eULK2VwMeH9ThJVKO4Q+XDomBJ/dWsXmWp
	L6QKbZu47qnU+KURuCCYAz37xs3RmTiOtL6rSYwXICREvhebonZ4wnLgP6KjoNHWnBi8AO+YmPn
	koE+2X0+8ebLqpoCpmPLkUw==
X-Received: by 2002:a05:620a:4613:b0:939:c7d1:7471 with SMTP id af79cd13be357-93ebd228f1cmr3387780085a.4.1792056965333;
        Thu, 15 Oct 2026 02:36:05 -0700 (PDT)
X-Received: by 2002:a05:620a:4613:b0:939:c7d1:7471 with SMTP id af79cd13be357-93ebd228f1cmr3387764185a.4.1792056961341;
        Thu, 15 Oct 2026 02:36:01 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b203863511sm2317941a12.20.2026.10.15.02.35.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:36:00 -0700 (PDT)
Message-ID: <76801e13-ea0e-494f-afbf-8ea02842180e@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:35:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] serial: qcom-geni: power the console back up on system
 resume
To: Praveen Talari <praveen.talari@oss.qualcomm.com>, david@ixit.cz,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20260918-qcom-geni-pm-v1-1-cb587e215607@ixit.cz>
 <54d820a2-5fe8-49e0-bcfd-e2a7bf4df7c1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <54d820a2-5fe8-49e0-bcfd-e2a7bf4df7c1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RYQFmFtv c=1 sm=1 tr=0 ts=6ad09e85 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=zRDqW-Egxz1XbUpwT2YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOCBTYWx0ZWRfX1BavQ4x2Y5KV
 liLlz2DX+lSIwSwb9iA8pjhD3DWpzkEh67oWhdq18TOjxi7U0PLKNY5eatzXFpDFFtM+wHHrfud
 OFCQK5mjngHkqYcE30DDWtQ2cy9KQGX1+Yio9NeK49dpV0JoznvwWTRVyvLLi7yS1jEd8wzzdIU
 Ua88TAIWtKxfdKYMaONF7YESelaWnBSRM+gtvQ61Sc3JV0/DIYg60X1ViK9YIAVc3o4x/FnA4lA
 ooJ6uC+m8/AP5bABBKvALQS9mpz0qDtPorceMddh43sSZxyUVnG/fty2mtESofHZgrIsriZB7eD
 9TJhQKbymoiCn881TiA6+LygW5sXSDiWd0mVfsedzA906AnVjsCj6u1GBF/jAXFp6n8fkW9/YGX
 y1b0+ZXJvCYY4Z8D9aPL9txGTr0sEToUGqnyd1klpSmBSWOCH0oh9Zh+7splYGc7Ch3gSa1fCOC
 SX6YJlh6XmOvIuegglw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOCBTYWx0ZWRfX37f76aPJ2AWs
 xLMNeEX9Z3f5RNJ0Hk9LSVh8k8EKs0yPXylbSg21oqz4FZAM+5HnIW+OtenV2ed4ESWHVBhZcSJ
 i8QcXoeF2w1m4auHlLeWTx5khk7ZCd8=
X-Proofpoint-GUID: iQ8HkelXdZT1PRwOt8PI5Av9l8kos_kl
X-Proofpoint-ORIG-GUID: iQ8HkelXdZT1PRwOt8PI5Av9l8kos_kl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150038

On 9/18/26 3:28 PM, Praveen Talari wrote:
> Hi David,
> 
> On 18-09-2026 03:44, David Heidelberg via B4 Relay wrote:
>> From: David Heidelberg <david@ixit.cz>

[...]

> Specifically, is pm_runtime_force_resume() leaving the device in a
> runtime-suspended state despite restoring it from system suspend, or
> is there some interaction with the console's runtime PM reference count
> that prevents the port from being resumed before uart_resume_port() accesses
> the registers?
> 
> A bit more detail on why pm_runtime_force_resume() alone is insufficient
> 
> would help understand the root cause.

GPT came up with the following explanation:

1. qcom_geni_console_setup() takes a runtime-PM reference with
   pm_runtime_resume_and_get(). If the console is registered but no TTY
   is open, that leaves the port with a usage count of 1.

2. With console_suspend_enabled, qcom_geni_serial_suspend() calls
   pm_runtime_force_suspend() after serial-core suspends the port.

3. pm_runtime_force_suspend() considers a device with usage count <= 1
   and no children eligible to remain suspended after system resume. It
   sets the runtime status to suspended without setting
   needs_force_resume.

4. Accordingly, pm_runtime_force_resume() skips the runtime-resume
   callback. It re-enables runtime PM, but does not power the GENI port
   back up.

5. uart_resume_port() restores console termios before its conditional
   TTY startup. If the TTY was never opened, that startup—and its
   runtime-PM get—doesn't happen. The console remains powered down. If a
   TTY was open, startup eventually wakes it, but only after the earlier
   register accesses.

Konrad
