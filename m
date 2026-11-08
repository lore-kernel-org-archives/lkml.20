Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794137117;
	b=if34o0KSVCc18yULUlM3K0905NXt4k6Wly3KL+z/3NLyxVWcym4re+yGgzQHBLG90vjf
	 sQWzOtLDbyhBDe0c+Ei3fMs3jGh6xK8Q1tRG9H2dJKYqEU/G+SXF5fVsqBC/X8j3z2rqE
	 1wxUtazFTWHpzLG2EYIU9mLth1At4X4woQkHB8mQx/6vNf78jsjFabTooZb9TRixQlqil
	 ZT0/Oywt0MRa2OtHyBoU3e2eBDRRW7xZGlSW+S0UlPPiQpKRuSwISx/waJRh6myIM5rNF
	 1qXgOukjhXMc3OvF3T0hYTEANA7gSmov/ncTnaXZKb5d9KkFjMyCfv6A4SzYWVXn7UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794137117;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:
	 Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZOlxpEI0OIo74XcS9Q0hNJZEahIo7Fytq0dNzWsexck=;
	b=vNrzy0UazXLXgStUOX4lmxhoUdRkZWlKvuzMH8Chaub+2Np95C7FFFrutThyAg91mE9S
	 Qv4rbuOR4IUdnWVxM9G3O4NV+vU/x62ndbb8hAZencbtcboGP7JbwN9mxKCIlQx9VNjUd
	 2YZHk8kzKCnvnAaEtUKDMqXpGPa54RHZ34FHBT/6QnKJnKwNsX3fhCVPgDJc0GGpuq5hc
	 sTO/AhcGgTC4q5jzqHuor8Sy3ti9yNyXG++IJ28GjBIEs/VSeg3YQFu3Zv9AGGmCDN3N4
	 E/m9OfWfYYcXQ5ezwHDEi2Z/dcmO0oE7kDvu1w0jycZX02/sGxSdAm4jmUyJ5hYWbqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n2aSSj9Q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ODAbYBg2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B362606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 11:25:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B362606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n2aSSj9Q;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ODAbYBg2
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A8AgErs903725
	for <linux-kernel@vger.kernel.org>; Sun, 8 Nov 2026 11:25:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZOlxpEI0OIo74XcS9Q0hNJZEahIo7Fytq0dNzWsexck=; b=n2aSSj9QWWBGfjoH
	/6ASyY5Km7bvDf8ol+FKDZ7QSeLoFj83Mu/m9vsWMUh7LrbGH67EeTS53s5y8I6b
	t+a92NVAJe5RR/ZDhvBlBHQqk7JFBC4Ibm3gVf7dWn/+6dS9Exo2B5kioYGMUpbg
	MgiEWdClDk1myZNzYbnPu6oI6MjOAfoKV816baviwCom7ZQQXyH+7buwVaxEkJfw
	jak3svBvLYIqUBTSiZuIDPItiD53z1/NPr++NlAXrI1TTJX+2PQ9QZoN27Wa3GDT
	vkkKJR6+rEHsTwM/hVFk+JHchYRkd4mhMZ3ZbPuFCGwBo0PINmcPEM/b0qP7s6TO
	YGwoqQ==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsuagtvy3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 11:25:15 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b0e878f574so1211597b3.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 03:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794137115; x=1794741915; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZOlxpEI0OIo74XcS9Q0hNJZEahIo7Fytq0dNzWsexck=;
        b=ODAbYBg2D+QTGzoJ4KsdcRAxHi9hrFTl+zkdBK1ebtWTdYT8NCqE5Tl+Fz2BZ5Rltj
         7USSDkVW21ie/ZzKjV8P8tDpe7uq/992XYsQ7fBUEHTqWiwbv+YmUEtVr/6suMzquGiW
         fT5ugFIpSKFTv/8poFokVAYDGvinfJ9ICkkhmhLcp+0gbbro6PKvcYUiB5tvoZbz9cm1
         gOJZ74156Qmk/8NA6p5lb9hPTmG7G6lY2aye7eDSlIHhkJqSI9fVmlNcyvvHuvSpOlS4
         ESEUXrVAXzHuLsxJnNvMMxDzZG94bHNvGUau4MS9A77mDUPaUENz+k3QjrRo8Rvzy5FS
         Vn9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794137115; x=1794741915;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZOlxpEI0OIo74XcS9Q0hNJZEahIo7Fytq0dNzWsexck=;
        b=ESVhSw6rcToC1TTj6M7CffokdCSq3E5zB99AnnQSATLwElkgxCXnS11/CA3QPa5/Ls
         GXzBiTpbvEZjYZMsPb8k/kieRPehlvvlrOmn1KpURYyn0Dm9TF9aTbtdr8e6YdLwq9vZ
         6XnZkDY4uUUGrCP17ZsCZrKL7SQIKGgAVAaXeuYSVDclBeVEJQYnMpxfMJIU1d3u9ojk
         ILBQyRiv10EGzVR0Y/YBNQdEfachvS1yNq2+PMDzlhaLsdeE0C0X5Gv5ehZnqW20x1KB
         ANGiG+sR7EF8BJma9cL0KILW7/8e9sTh2/Pk39CBdfrohJoAuLpDaanzgmKD3c+vX763
         HUOw==
X-Forwarded-Encrypted: i=1; AL+hErGOlZnq3+WgvBx7XFJXpGEz/FzXmLpe0obR+RgBH09Aw+UleULkWrY0ojgXI0RaFhSfZ+0GYRF7Mvd+lvc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KjLYKMbtFFuqcHy7XdBzX0BZRLsLS2OeeVY3yw0Jtpu8uZlgy
	nIu5evF2wy7AUvcb9GfJ2hcWWpYYNTuCDqDSiYIDqEZx9w+EAl+ujQ+eJyZ+N27z7lGCEZ078KU
	hfp79mr8yqW70+jkdtbSZmQejmJzuJssWL1tYQzw74BHYXLgEyQ9W/dnHlJX0eWHLrh0=
X-Gm-Gg: AYBFou28lW3EnZ9ytY+n26QPMNVrHYfyztp7BzXqlVX9+nBnmD4Eh2Q5kFKIm62YgUG
	yE2XHEmQje1VxmUPwmgTCC2PUrUjOhHCtq/4Q5x6Qe2j09yxVJGQur7e8qnfRHzZmuFFr4ZdXbn
	lL9kJJDl/8QYhgJIv+VcQ5SEq6eiPBrY3+ze05m92EIgDoUYVMxylpalk/SX573azspd5y3pw1a
	RKrxeuhIoRY9bfIfxXbuPlHmrqExXO0CGkJHfOqyAAg8vx17Msw0NIlrP/seNXWjyRTBjqiNtZF
	r/vJImyz/1TEMAGRXmxG5xC36a78Yw6X/LFHVvxQfsmbnqqmX0D+n1vCVQKEZazjDACh5hUvv1J
	NRfIUXX0smKw1ftYs46MYjUM1iHg1MyZAeRGYiVu2mW/YUWRzk7oZYIup54jxzn+jBYsXGcUf5u
	7PqoL8kpxrew==
X-Received: by 2002:a05:690c:dd4:b0:8b0:cd32:b8dd with SMTP id 00721157ae682-8b3566c7e2amr25150807b3.17.1794137115018;
        Sun, 08 Nov 2026 03:25:15 -0800 (PST)
X-Received: by 2002:a05:690c:dd4:b0:8b0:cd32:b8dd with SMTP id 00721157ae682-8b3566c7e2amr25150737b3.17.1794137114479;
        Sun, 08 Nov 2026 03:25:14 -0800 (PST)
Received: from localhost ([120.244.9.94])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36bc57e8bsm12483067b3.32.2026.11.08.03.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 03:25:13 -0800 (PST)
Date: Sun, 08 Nov 2026 06:24:53 -0500
Message-ID: <4879567e977e3f5023c6e7ddca133b1a.guodong.xu@oss.qualcomm.com>
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
To: Radim =?utf-8?b?S3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Samuel Holland <samuel.holland@sifive.com>,
        Andy Chiu <andybnac@gmail.com>, Zong Li <zong.li@sifive.com>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: Re: [PATCH 4/6] riscv: hwprobe: Report Supm only when available
In-Reply-To: <20261006075303.205216-5-radim.krcmar@oss.qualcomm.com>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com> <20261006075303.205216-5-radim.krcmar@oss.qualcomm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDA0NSBTYWx0ZWRfX0gH8rEfYPmDr
 L9gAHltHFGupkk93OYIFhAKOe9Z2pB145miL5x0+bKqRWws4ImBeRzlv2nxjq9dVbhpTYSv3+Nh
 mao0uDiZdXgCHZXLUOm2DY9tvh9QN5QyADMzROg4TiCGH1QB/CSFJZfB+WSDzNGYtiyj2BFoyoB
 4U59ad3+5YTQtD9sIvzOMv1zt5rxhXJZvTtFhIkXVrStcXZy3GykqmqgOUnB7lP7CyqhAoPbLm1
 9JNAetV5bQR8x4mo6JevYb8QbF5doT70i4q2bhMBIplyCmO/OdYaSDoihP0gs9SDVYWYkJiSqdV
 mB0wQZWkyaM/QBzvtaKKBsgvLyLhn2A1S/nuN8SmgyQr4huT3mcKiXxZV9HEMD/djqRJ8XmPW6m
 tpnOz58ilO7NDvLFREhtcX8S7Yykrm46HevGkbNwLBkTewfpR1vpcGZB806U8YcYPlGtrQp55Fa
 svTa1DqrvJfHUOs8UNg==
X-Proofpoint-ORIG-GUID: zq1n3DPCCfh_TDyPeh_2y2Xl0SssroiC
X-Proofpoint-GUID: zq1n3DPCCfh_TDyPeh_2y2Xl0SssroiC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDA0NSBTYWx0ZWRfXzqR2TQ4s/JWU
 10MAn3GgWqQhOs0EFiu8A7SEzPMUYGOyqd4kQ/5yMmPS5IyAJODUmHUDVcnOez6LAOP2l1n0z8J
 qG8ryAdwfR4Ib7IzYZMni6Yti8tBydo=
X-Authority-Analysis: v=2.4 cv=V8LoQuni c=1 sm=1 tr=0 ts=6af05c1b cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=ZvHX9x23NDWH3CQeJ2oX1w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NCzzBX7O5BTftGYIIH0A:9 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080045

Hi Radim,

On Tue, 6 Oct 2026 09:53:01 +0200, Radim Krcmar wrote:
> The RISC-V ISA defines Supm as
>
>   "An extension that indicates that there is pointer-masking support
>   available in user mode, with some facility provided in the application
>   execution environment to control pointer masking."
>
> Our facility always returns -EINVAL unless Supm support is configured,
> the pointer masking ISA extension is globally present, and the user-mode
> is running in 64-bit mode.
>
> Hiding Supm in compat tasks would add complexity that doesn't seem
> justified as 32-bit code has no reason to look at Supm anyway.
> Reporting based on the a global sysctl toggle isn't done.
>
> Do not report Supm when some harts lack the extension, because it's not
> available on any hart in that case.
>
> (Reporting Supm when only PMLEN=0 is supported isn't great, but doesn't
>  violate the text of the extension and we ought to have Supm7 and Supm16
>  extensions if we care about precision.)

Since the kernel already knows whether that is the case, could this
block use riscv_have_user_pmlen() instead (55458c7347a3 "riscv: Add a
getter for user PMLEN support")? It exposes the have_user_pmlen_* flags
that set_tagged_addr_ctrl() consults, so hwprobe would report Supm only
when the prctl can actually enable a non-zero PMLEN:

	/* PMM=0 is "disabled"; Supm is usable only with a non-zero PMLEN. */
	if (riscv_have_user_pmlen(7) || riscv_have_user_pmlen(16))
		pair->value |= RISCV_HWPROBE_EXT_SUPM;

That also replaces both tests in the block above.
1) IS_ENABLED(CONFIG_RISCV_ISA_SUPM) is covered because the getter is a
static inline returning false when the option is off.
2) riscv_isa_extension_available(NULL, SUPM) is covered because
tagged_addr_init() returns before probing PMLEN unless Supm is present on
every hart, so both flags stay false.

7 and 16 are the only PMLEN values the current standard defines (one PMM
encoding is reserved for future values).

The RVA23 profile v1.0 requires "Supm: Pointer masking, with the
execution environment providing a means to select PMLEN=0 and PMLEN=7 at
minimum", and senvcfg.PMM=0 is defined as "Pointer masking is disabled
(PMLEN = 0)". That is why the rva23u64 base behavior key in my series [1]
checks riscv_have_user_pmlen(7), and v9 will keep that. But for
hwprobe's own Supm bit the getter seems the better fit than waiting for
Supm7/Supm16.

Guodong

[1] https://lore.kernel.org/linux-riscv/20260920-rva23u64-hwprobe-v2-v8-11-5f14bc5c23d3@oss.qualcomm.com/
