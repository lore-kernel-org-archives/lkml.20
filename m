Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF3B367B9C
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895100; cv=none; b=bCxEfI+MBOQqbCZ9Y2LWFXU2hVxM7axT7tye6KLgMhxRd/yB76ym6i3ok25NSwhUZAK6Ms1TKjtITLrZqag3evb7YAnSD8eQqS6zD7+0eiuwPfwuGKIdFzYKxOxhfopvVu3F9xMtXOKgXOSknyiGGybWoNZYXKqehtYhr0IHNhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895100; c=relaxed/simple;
	bh=DAg+etHvRhqzCdq/zCTA1F7q5/9fBGcDHX4JsZ3w5EA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TzUklZW+IAQNxB3vPgOtWPILCCNb6cwHY4nnswuTwR/amHLd1uN/N09KfvXUX3Jix0RmEn4Hrawvy47Ab+UhLIN/9cihM4qkUWZwRqJ++fUdWM1YWFIKEyo3zdYJ7S6u+ToHu4iQ+q/UkfIWj64uP7u54b6FM7lLHep2jE3vf5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KVj0y7az; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IZpQjBEc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KVj0y7az";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IZpQjBEc"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D907oV791622
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:38:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DYqehMi9aFc5e4W+K86VDqLPCbTQmJlPOTtFydQpCzk=; b=KVj0y7az3Ftf4ifn
	w5xrFUJXdUF1tpqZo/iBU27JUAUUmSM7HO/PztECbu4Fgie2THqA7S3kylwoElfb
	ZApd/57EIakNBS2OMY9iBIyzbRgwZDJ5kOS4mXbD1wBDQsskq6eSHCOOvtnAAIhQ
	cM34AA1hcI6lCLewl/RK1MbSatY+Rs15nTNUVv1RW9L40krxiKccrWfv+fW+z+ss
	I+Ro2QuAx/2d54FGPTw16sE/zRnwZ/6pUP3pOC01qISdeImn6C55KprES7PC66Qa
	kxhxmHUQkAt/AEyzqDWrcZIjN2hskItH/TCYtgjhvzthHDnfoifdTTnp08OzeBhV
	lQcM3g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9hmjrv7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:38:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5338bd59032so6945161cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791895098; x=1792499898; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DYqehMi9aFc5e4W+K86VDqLPCbTQmJlPOTtFydQpCzk=;
        b=IZpQjBEcWIBuJubIEo7Jmp9N2y362bbf6hQqHWIYNfNy8LKV962mKcVM0Ea0jkM0+t
         GMs0XX8coGKVGVah5StaTQTMpOs/ocQ/GzUvCh4hBuX2vJ21phc7/aURU4gH9J3RzpFf
         5zMTeUNZpUwcxX2oQJnqAdgF0QC5On7c4eFOIR3iuPc2i7AL/xfX3oEL5YB40mFiCVZh
         MVtupm7p1n4YgRiqvaXLvox61GnjUeeKVMPh9xzy+z3oAIGSAEGnDM3MaBU6YjE7GvOU
         tlqVzukXrKbvL6qDw6IFdud9UL7RGiMANt7Bn8VFdCZLwLH7W2Sdw9QF2boNWFwr/7VE
         UDIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791895098; x=1792499898;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DYqehMi9aFc5e4W+K86VDqLPCbTQmJlPOTtFydQpCzk=;
        b=j0TaBNsHsuj5johjx8bCr0tTMc9aPJI3NGtMK0Ke+Go4aspxihY1i7z1nxjzbLi0mt
         0mJFq4ICrNiuy8BoiljJj1RKeo2UyJbD8Hz6S2jEO4vKOYPfLMhiQwmbd0URKGEZzgKh
         2e2/XM4ygNt4k+ehOX6axKL/PkuPuPA73c5JK2rdspRp3AaoWGkW6yuJEvFsaf2zr7ys
         BvgwA5NQPMghufNq7nXDkL2nQ6yy9qDHRZf7ryFWWZr0bVfjlTf9fnB1R91JZ9o+V7EV
         P9GImKQE6HC6WydF43C2wkyuRdilEAPT5CIDFZtmb1/5djOvaapCvW8PFV/x0lO2PX4K
         TC9A==
X-Forwarded-Encrypted: i=1; AKwUvBwBSV3MfB8HizIMLcWXRi9pwDkJqb+ojCJWMYwy6+EvoRlnOcZYgqSBb78DVNVJRlGe3jinXgBr4SnEPA0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0Zjsso+be0VGCA2+hWgAyU9kPV5Rpfi90Hr4QYW4Wv1TpG4l6
	9uAJOG4B/fCs8y9app4TUouxxJSwWc28f7J91nkZER5NUbwqpdPFYve85YdkqIwNlWCwjroKVqD
	qbcSMqlflWK+11cbNs82k1qGiHBwk6d6uEfLn7+4rEGaIMZvbmp+iqW18frWEQwTRXTQ=
X-Gm-Gg: AYBFou1jDi0Zowomy/EeqpAkeHhIBoXAl2NfXjUOdHm6yEFLdJhmzsQBBsQ4jW6Jg/M
	Phz43yb17aYyc/i5RswO1bxtbB3Yb/D6nsMiJxEO79drfhr3ygXAhSLomAA/tkI7mYUI7V8r+fS
	fRc582Y7+lEI+lxic20Ulj+L9UtPex/BUiVV5mNdkG82MjP+RSyuucw3BwyuYOpsSjlcq5oa9mp
	/h24ac+cpambHJG1pbZlR2c0hfY/l1iHTB5/zUDIPKk9pbt2YJEMNVPHhZcx9z1PeWg4FNfyhtP
	OX9VeckAy1qB1oVwDreGCuPl1i0tSqN7wbnXHdzWY6FbysOcqek/04RmxHtMmyLpqE7Q92U2rFA
	MCKWBa0i2d5BMaVct3oLu1A==
X-Received: by 2002:a05:620a:458f:b0:93c:61e0:81ff with SMTP id af79cd13be357-93ebd0a3722mr2473819385a.1.1791895097705;
        Tue, 13 Oct 2026 05:38:17 -0700 (PDT)
X-Received: by 2002:a05:620a:458f:b0:93c:61e0:81ff with SMTP id af79cd13be357-93ebd0a3722mr2473814985a.1.1791895097107;
        Tue, 13 Oct 2026 05:38:17 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcdde913d0sm3662494e87.26.2026.10.13.05.38.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 05:38:16 -0700 (PDT)
Message-ID: <3fe1ac52-f69a-4288-88b6-edb5717dd315@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 14:38:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Switch CPU ETMs to MMIO-based
 probing
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jie Gan <jiegan@qti.qualcomm.com>
References: <20260922-fix-etm-probe-issue-on-shikra-v1-1-56d25e9bbe17@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922-fix-etm-probe-issue-on-shikra-v1-1-56d25e9bbe17@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1MCBTYWx0ZWRfX3a9eN8sSrkij
 2ccE/xqDBoxq2P4CKQ9lAClpjKSqHsFr2GGvN1D6Gxv14uhXMqDT1oj0sl0ZeU58p3UcQaNVREq
 Lxl9l2QPbyFE3K/d5DZEkEUESRwfgvo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1MCBTYWx0ZWRfX92qfc/csphrR
 M6th0dTGF8nR47jP2vOdE577ZHQDoAGcrfi73hjADsUclnM4g4epEtGt/S6khwep1oQ0DHbNS+N
 fiufvWky7RXFEKwLDpFP+UIVuMa/UWhAQ9iYQq6Q+5OXyEeMssv9NzIY2JnjFjeoG1Lc7zcfiWd
 tksw1aOwza8byvl1rL2z/HRk8mOpmFPX296wf0yIRLvBOwU2PXhNY3KeRfWQqECfN1/KCszQU4u
 kMXGnaVE1vgxteEh5nYoabErjfK6OdBrrudMTEB0NXJrhm4LPBCgBnB3WRZ8s0x1r6ikxLDw6c9
 1334/RgSn9a4B6X1jll8aOXn2W7buP9ePi/znMelN4lPEP1whWx7RH9DYP+G2X7fbIic0dUp8Gk
 Ivgs8gkSMPHojdRKXSg81m/wId0VeCosocXEKrcD59yDRYD3vHU+0xqlqHIzW7B25hT1Q22K6sy
 mNAw83jYdrtfb/3L5cg==
X-Proofpoint-ORIG-GUID: m7eXQvzhKTYPdHV_b72M6F5i-oAHBvPq
X-Authority-Analysis: v=2.4 cv=O5+sLx9W c=1 sm=1 tr=0 ts=6ace263a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=l4fDSgpoRc1iC7w1fSEA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: m7eXQvzhKTYPdHV_b72M6F5i-oAHBvPq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130050

On 9/22/26 5:09 AM, Jie Gan wrote:
> The etm0-etm3 nodes are declared with "arm,coresight-etm4x-sysreg"
> but do not implement self-hosted system-register trace access on
> this SoC: ID_AA64DFR0_EL1.TraceVer reads as 0 on the affected CPUs,
> so etm4_init_sysreg_access() correctly reports the access mechanism
> as unavailable and the ETMv4 driver fails to probe with -EINVAL.
> 
> The CPU ETMs have a memory-mapped aperture, so switch each node to
> the standard "arm,coresight-etm4x", "arm,primecell" compatible with
> its MMIO reg range.
> 
> Fixes: eed738c6dd0c ("arm64: dts: qcom: shikra: Add coresight nodes")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Do we still need qcom,skip-power-up on new SoCs *with* MMIO access?

GPT has concerns regarding whether we need to add
arm,coresight-loses-context-with-cpu

otherwise lgtm

Konrad
