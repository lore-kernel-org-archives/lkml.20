Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792504747;
	b=ubNKFj/79i2Qpk5ZSdkc2waHeoeUCKd7XoyL7ZN0T18T7Y2eyQiXBwQv3LpaG+ihsHzk
	 wo8xMV49OpkJf2Dmu2L8ZFA0NFW9wc2fxlemaTrvrYG5EwYrbEZab8mOCScxOxII9DJ+s
	 Oik/+dExYGVEvCrFOuXsBRfxr0n6FfZeu8klQCJLZiUA3N5M34tQRF9OJyF4fL78h2lyf
	 M1S77tAdjKCVWcogzY80FZRE8FjiZu39/ODClOV1NPtxxjLOvNDM+4N0FDr5Y6rHndLLJ
	 YdVUZednD9IA/GBn2qgOKJhAqPrgZ+M3QwPmEUWRRpCEeeTSvr9EmDnauyRrYeiXxgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504747;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DY7esWGsJJoottHT4nIMIL8Ex/o7i900iuaYVCDlzhI=;
	b=2f2OdXakY4ei+Sa6Nc4fdeRJJOYqUKI3tMZPoLBUMDP/W8nwKpdAa2M7tj2ka2v5js4/
	 S/wP8QSZdhX2mAU+tKitGNO/mc+wKwMIo5JXplR4+EbVSHrHFhB3zFfh3+LJXERiCYw4w
	 q+Ye1dodfD0R3qP2BQTt/KD94ZnitWRmykwG8RL/A33zemLthq+24uiMncjIyT/rCV4HI
	 ijKbgoAjNo29PWEYdMx6Nw/32CEKFzO5aUy4XSa/W23WE1nvrsyfg3OfLiQa8ceDKHxMs
	 XilBweZfFC2//79nHzSv9MHKgjSInAo5Ea6t0dZbEZYuWXBh6mXbJNBqqxXMydsK15A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gpIwOsiV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Q6/guFpZ";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7AA606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:59:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B7AA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gpIwOsiV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q6/guFpZ
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KD9quE2845549
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:59:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DY7esWGsJJoottHT4nIMIL8Ex/o7i900iuaYVCDlzhI=; b=gpIwOsiVuQkaB0Mu
	bfmPS4Pk6svYoT7gmHD5CDnVqhURDasrAq2OZtnaWrFu19VosjQJT6syIKCdtOID
	UXSsMMUyQKtNo8JbQX1os39o1RQXoGru5sIKVw8ia4yRFb0a7ib2QOHaCV5awtT2
	xHgfBeq4QV0usI43rBKk5KhLTb7MO6Eax3zufuLgUqqaCSmKQ6zkHxfdx/qF4KGB
	fPfrWLqQxAi0fTtUlnK1MvezYxRdQxxZFSrfw+j2mlVJ6mkXm8FaifTKlsSpbSTC
	hlFjOhDySC38MRfMg5dkLZ2TDsRmZH5BofYAtDl751E6V7pOqCk40AC1/gKedSwT
	YSx2zQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5nar1c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:59:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92eebb130dcso73604885a.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792504746; x=1793109546; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DY7esWGsJJoottHT4nIMIL8Ex/o7i900iuaYVCDlzhI=;
        b=Q6/guFpZNNHUZK0o5d8qYvwoZ+RLsTIjZHEWae1lPAfzlTQEanNoSwX8mE52z6onlG
         76tBaznYTDvWv8fPsbt+ZO4kqrOVvgGptv9AA7ScL0VognJ+SgJ+yDkOov9Wx9CXzads
         89CwgR5lEDB7k9BM/6dOf88s8uoXhSH1WUXkLtCs3PiNgnH4yqNFpEuCbmQWCghP1JBL
         /EJTYvXcadr95MIOdBkffXvHVugiVECCHJVtvibNaDd4pIUIz+t7cOVsuitlasGF0sZn
         f5K8f28mkNcBzHj3FUBEjQ2hMgpiO/UrwruHAmuaYGev+B0JMKoP3cssAJB7VOPXf9kS
         xoXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792504746; x=1793109546;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DY7esWGsJJoottHT4nIMIL8Ex/o7i900iuaYVCDlzhI=;
        b=ZpCMf8ElIx4HSAmt659nV1tNy5emsczNtDJ341j9wgnfEAqRwkkzRZuYr4aOPxZXGZ
         o1BCqd1GZ7GBI86vx1JfZvXk/96xBcc8qCbOjE91ipdE/WyQhZ6Cyc6PSa9OHKmz6ljt
         VOexm8kmibBkmZdc8NnEHpN3AF4PxH7VIxnXX7oeCze/l0Sua+BGNk0AWiaWqprl+e9T
         uvohVykq2CYJa1Nl/C7EOHG8V9SzEOME10CSvMp5FDtp6KEhzJ/5Vl4msNTPFSW6y0Kl
         0yrxXqpHojrSNbvsiM33fE1zAAch/kk+CH94iJ65UpI5M+dke7Fgr1DaXi659qbtXOe/
         ZVJg==
X-Forwarded-Encrypted: i=1; AKwUvBy9tvJaGSgjHk6bd08tEguJz7ANJfF+kGovivQl3j65xW/QXhRPEChMCj1sC7hAik9Ba2iAoxT14rYAXGQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjGA6WBD4Ba58MnegU3AzGnSkD1GSycz0MCzoE4C2LByizrKBl
	SY8/aRvLlohZW/mhIB8TtdRevcUr+o5kjcs4G3wICbzdDAJB4mmA2xRz138aAmjPARXZuo4bDup
	23YuXlD5W1sPF+CwlUsf9hVsfRk23vwwvcTIGGTBH7D06PwVm+tUpKn14RZOiF9pb0Js=
X-Gm-Gg: AYBFou2GKz8f/a50fZdOFL7/tTFQTTE9WkjxoL4Z4YYReAiT5YLmNjeHT+1zIAn5yng
	dN47id+2+4oB3NsA62ObYZGPrK8+iJTxD9frs52aUis3JayDQrdWT9yh2OVz4pKo0NooC8GfyjI
	+5gJ+vfyUMotzcCASEDlyx4/llIzfBn/5xNcbKcQvrEBdwhvn6kbUj8eULJ5i+XCj4zrrg9FesQ
	irGVrCsl3xIT+mWw2zNQWcT2RIxu4M50+Nu7C5XXBINM6hZ+1GnIhEqathkCzvPX+FfaSB8FReq
	7Memf/g0US1PinWFJy07BTs/cwE4KuylwrTEfY5UuEiJaGnIJ+o+Thh241q/XQuL8HXgx7sRdGy
	glLfb5qa6mYYJOIkEn4+6oA==
X-Received: by 2002:a05:620a:3711:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f29c95919mr2095415585a.3.1792504745544;
        Tue, 20 Oct 2026 06:59:05 -0700 (PDT)
X-Received: by 2002:a05:620a:3711:b0:93e:6d87:4f69 with SMTP id af79cd13be357-93f29c95919mr2095406585a.3.1792504744685;
        Tue, 20 Oct 2026 06:59:04 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1ea92asm5010407a12.36.2026.10.20.06.59.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 06:59:03 -0700 (PDT)
Message-ID: <1f9c34ee-7d30-4ce2-9e88-93612eb897fb@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 15:59:01 +0200
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
Subject: Re: [PATCH v2 1/9] arm64: dts: qcom: shikra: Add CPU idle states
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
 <20261015-b4-shikra_lpm_addition-v2-1-ac7f1a0d5638@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-b4-shikra_lpm_addition-v2-1-ac7f1a0d5638@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0GrTB72O2Ho7gJK5ecM0ktxIM3Vsbevo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NSBTYWx0ZWRfX9uSZ2lmXSz1C
 +5tGsD3a+bo0Mo9TJRj2C+pYqSnT74UP21j6l0iBnI5JXffHZRl+1sQZpJ4XtLjvXM8aphnkxrg
 RTzWdDP5tNYXhfYBCZsifGw9X13N1uA7QaF0/rXow5rlRKBzEfQKQE0aJawcgD7DMY3tzBG/2G+
 UmsjoG/YNkXT0OFQRic+My7XxD0lpwDiH5ntKYQH8eO9RrFI31obfRhTX90ydS3GIIsokc52LLp
 ilOud3akCsF4LB5fJzI2edJxk9yF4VYVcZquz1Vq/T85gpxOgACx7ySZc2Czprn0Ys7k4eOaBDo
 msIu1FsomrgbSuO8h8/EFAPYuqnQuAtHEAiWb+ZAhjFoMrtOIrp9BcuUAbKzqA5jbDszS0XSZ/W
 UOOu73XPVNm9ONOrq+55lsyWy+7+KnIxUViFEyyvrJqMuHPS9SHN+SHGIltJ91vm8tUH1FZ3YW8
 EqTAcxgHglm/TuwO3XQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NSBTYWx0ZWRfX1sFDXjok+lwK
 WP2G/QxbS7m7yf2eAKREsRS2FUSVEyXP1gzfImUDpbUyZLszdLMO0HUP7b5QARHjpEsO3KRWBg/
 Edgvq3lVYmYfpsZBQB4w2G9Gtbo7Kt4=
X-Authority-Analysis: v=2.4 cv=VI9IDNPX c=1 sm=1 tr=0 ts=6ad773aa cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=QZ93mQGBb8gi70IaLVcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 0GrTB72O2Ho7gJK5ecM0ktxIM3Vsbevo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200055

On 10/15/26 11:55 AM, Sneh Mankad wrote:
> Add idle states for the  CPUs as well as the whole cluster. This enables
> deeper-than-WFI cpuidle.
> 
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---

[...]

> +		cpu_pd0: power-domain-cpu0 {
> +			#power-domain-cells = <0>;
> +			power-domains = <&cluster_pd>;
> +			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;

nit: ideally <&foo>, <&bar> instead of <&foo &bar>

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
