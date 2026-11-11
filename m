Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434600;
	b=z+H0ZMVSbJuoOFfT7g5g1ir+POU587IZ5KnmSaz982S1OChsEoP8mitcmapKVP2rzVQq
	 mV8UWr83Iv7wiwQSqDBQvOr2Dt8q1QqesgWtH6e3PPEZayMCpt7l8ZohaSsm5uC/QJWY+
	 PvAPbdHWEyAv+g4XZ8Q0zYHZ5ZWBALuQonzP7NHxDBT9ZSJ6TNdPKHB4r0gbfJGqh+59Y
	 udLVMBu1NiPq86dGYivLIpFxu26FJODbPL4FYwZe5OBedk5ORnyUaewDRKGtni9kB3aT8
	 tvzEmy3XuPsTGIigbxcp6wEz5TT4qFC/7dFuKtaTrVl5EoJxYYgCZWKfhTk15Ndts1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434600;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=L3r2W9ol8URSEQDtiQtI0G55c0BKwpTOQuX97PiChOI=;
	b=xDigC27ZIWq9eGaNR7vtZcFwrUzME37uBYNaQ7PhxCHUbrHUssYuYqrmUH7xnzG9Qi8x
	 5lgFnarDv8p9LbOxtgq9NjSerZY8Nr4ZQG5R7NtB0sxKrMIoCz0JTvJNw/mkXRxOvnRzL
	 OFifOzjaECd7FCdBD/BEAKhhxAK7NUGBfIr8UFgH6tbD+TAvYC28jhO+ilNHhwvYhyfhA
	 32zFsMdLcTWJK1cGQvymWwfcVlooOPoexXruHO7olzd3Khp42KF2FkIDb/JxMGpI/+7Yk
	 i8u+O4ewY6+rCS1aIjVaRY+wiCwJhMgPTWcWa9LALlMpdFGTu0pXf+C4LUyb/9p5Xzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JZHSRO8l;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="J/UfeGem";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6DB606A8AD
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:03:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A6DB606A8AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JZHSRO8l;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J/UfeGem
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABJRbsk3186556
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:03:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=L3r2W9ol8URSEQDtiQtI0G55
	c0BKwpTOQuX97PiChOI=; b=JZHSRO8lood3/frxYRFv+2ipixVEHfYXHDZlqN77
	SftBHMMbnD+kBRA0b0FI4gz6ehiEGeW4fVhyU9AEYL9HTSXcIGcRPUBoNUftikDk
	zPUFV/72xgACcCstgDkhYV86qWJy9I6Xszi/Huw1UB/gzIimXvcbYPTYdDZu4E9M
	7ckPgBFQjQbApmzCQWKkngEMn7Qso/yJV4yX3w1WqaA5lRSNjtMHxEn0VjMYXtCc
	I2BVe5B40wumO4KEQ67OwXBxVwy1EBsyLTwhUlR7U55aijctin69wQa7voRhDtj0
	a4zjahDGTgx7j/YLODyXJQjG/xa8QEz8OmJQki4U3z10/w==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvgjdm47a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:03:19 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4a68926c8c4so3546978fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794434598; x=1795039398; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L3r2W9ol8URSEQDtiQtI0G55c0BKwpTOQuX97PiChOI=;
        b=J/UfeGeme7+DBqOkRpD7KH7tSsInT6tmihDZ/DT0dww89cr40KzHp4aRIg24QbkIPB
         HmY/58uGr4N18rjXnOG6PyfxXSoIxarseT1fG3bJBWEwWsK8v089W12M7c868GrhfXov
         skQenjkiaa+sEzXJIUz/at0cQFiLmUhQMzs9/B5OyhKVW2fv4fieYzIJIMiiKkhB5lSo
         DyBngd0mhGg4ThD+kEurhGBN/5ocYBdZDCyTEw5nhi+LzHUv+MwU6WeXj99alxMSzISD
         EacABfh3fFZ/Wj80Q/lGWZQw83InlCb/IIucEilSupe9PRaiS1InJ8XiFwt2cszrfwDY
         kSYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794434598; x=1795039398;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L3r2W9ol8URSEQDtiQtI0G55c0BKwpTOQuX97PiChOI=;
        b=OuAKPaqjpz20WvR0m+Dba0fK3bzMylpW9BloArtfY1DLmcU8qFndVAH9a13J7rvgpx
         xnaGtOiQPz4HhfzOARJV/jY9GQqpO2L8NZgNflYVXVgUgBMIOOdeNX0KH0jbhFxGLV66
         fr2TJ1WhQ4Rgk4JMbcB8WL4yrqNSsmYda+yRQ9js+TmeBBmXgFCDN7m+apSNU81jT93G
         SnAU8yjqt8bBEpzqg/nvPq7PJlhu0RKdzCR6saLMiIh6dlJUtm6ubZdV580G6nn/zKLj
         fnq0r0VS/fZO8++q9sjBi3Vb8deyykSJYiuZ1IkAlGocAMfTzyT893pHibrr9vnwlY5C
         Eb8g==
X-Forwarded-Encrypted: i=1; AL+hErH0wKT10lIJWWIJwPn7c/pzZZWnWPUVKzpT0dFF4i4BBBIyQRs65KL44OYYCPTr8l6hr/nF+x9BQHLA4Mc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gjOKDLzD8kgPQ0p8CqcNln4cWe5PRf4p7U5jio8u1uN6bkX8Q
	u9VPxlC9p5xUgMg4dNLAugUIbiLFTsY0Cy4RN6/Jr2+pfbwSgfCln/yIsiVeix38B3ZtlGwR1me
	YJ9NifNT7Iv1aHsksg6gPdg0TsXmWDBBlwM4VinrZafAF3Y65ywaWTS4u9NvxLB7EybO98cZoDw
	g=
X-Gm-Gg: AYBFou2eSG5paqvCjR8bR0/spIYd5cO1hxl3g7y7yVN0nLZa04POBu7xka4IXPt8WXA
	ZjaqRvnJBC/Ct4fZEy43X/al+CmtrvFxHM7attpEATlz43RVQlUK3KbQdZ7fEiPw5Ht1qO0X0Jd
	kU1i4MBq9iaooku5SKz/qBJAXwcmXSMCAbJbZe2KHAMLBq2aSbNIrRUifez2qsozMU4Lrk5cg3C
	TFUIkXghvXhZRlcYPz7rNMF/gRayIrZYDlqIeGuYkOglleM8I2OCOG2whrNebZimdDreGozNJqs
	7NJAsOOl5P9PUUSJZpY9BTb7urVX5iAB574luv6FVXcfUGQVPfxAf5/EMQ34dQgS0h9CEWAlvms
	Qn6OuAG6qVWlB1akm7VehkOr0kpUPJ4O7Sz7oO0RSWBi/CiBaEcsy8ARmwr/0cyyNjatDLginxQ
	n59A==
X-Received: by 2002:a05:6808:1819:b0:564:3bc3:4605 with SMTP id 5614622812f47-56b9770f2cfmr3106743b6e.40.1794434598205;
        Wed, 11 Nov 2026 14:03:18 -0800 (PST)
X-Received: by 2002:a05:6122:1b09:b0:5ea:94cd:c5d7 with SMTP id 71dfb90a1353d-5ee1c462ffdmr1573952e0c.16.1794434579670;
        Wed, 11 Nov 2026 14:02:59 -0800 (PST)
Received: from trex (50.red-81-37-172.dynamicip.rima-tde.net. [81.37.172.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49836b8eb11sm14103545f8f.57.2026.11.11.14.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:02:58 -0800 (PST)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Wed, 11 Nov 2026 23:02:57 +0100
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Cc: peterhuewe@gmx.de, jarkko@kernel.org, jgg@ziepe.ca,
        sumit.garg@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        linux-integrity@vger.kernel.org
Subject: Re: [PATCH v3 0/2] tpm: OP-TEE transport core for discrete and
 firmware TPMs
Message-ID: <avTmEXZzyyjxA2dy@trex>
References: <20261111215940.3503287-1-jorge.ramirez@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111215940.3503287-1-jorge.ramirez@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=E7tYNqdl c=1 sm=1 tr=0 ts=6af4e627 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=VbO86HPdXvN82gCvB8O6pw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=NEAV23lmAAAA:8 a=McN5tr3TAAAA:8 a=3qyK1sCLMOwx5v9cIf4A:9
 a=qcg49hLlgF0N60+LroqrWnV/Vu4=:19 a=CjuIK1q_8ugA:10 a=y8BKWJGFn5sdPF1Y92-H:22
 a=OiMWn5MEmObRqTLTTlUg:22
X-Proofpoint-ORIG-GUID: e10vRFpcDrEcI092SFpjEWITzyKqzV8S
X-Proofpoint-GUID: e10vRFpcDrEcI092SFpjEWITzyKqzV8S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA4NyBTYWx0ZWRfXyj7EHii8fOei
 K85rY5QqusVxVP7PWj2xS/F2ISIO03hbFjV73ns7yWzzpQKFrW0AkUDjAis2o9qdDmDjeIYn+79
 Cv3MWArogWDOa1JXiDYZhffl+ZG82nq1ZtS/fh0EvrlsZyaJCuAi23/BtJ/+wXmzU4upAsHntHu
 V0k85l95DL3a9m3TOLSv05PYjECRGODHO6n+ORT66GRXfo/ldNldYQFVrdy3MHhiloSG7CF73ch
 4t60XIA+KP5/cs+3FmFczWqzAxZIkrBZ1g7DcWR/WHETatPs1c3YcLHspceuQgkE/TvA3Frux7L
 AzuSj8evnyqyKDKnmKDyAMr0ykGOog5bHkB54mVyoIkK33R3D4HV+jt7UshdW2oIB1p9amg1Loy
 F2CVIut9ZkDdlJmt7RD71c2P27FbOWhRHe4vDdcxaTOvQO1N2aSx0QLGAFK1TLXuXsxmakyrrDO
 z6BNTgNyiDODhfxgQxQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA4NyBTYWx0ZWRfX5vySnLujg5IP
 gyFOMHyhtzigGOcY4+xxQa8/BwQOiOx8LhxGugpf+jH0nOiZUf7S7Jz38S8ZRTsMqRVijfmmyaf
 Cac/W/jxev7EMmP3+HSbJpoT5eAbDFw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110087

On 11/11/26 22:59:33, Jorge Ramirez-Ortiz wrote:
> This adds a driver for a discrete TPM that OP-TEE owns and the normal
> world cannot reach directly, and factors the shared OP-TEE TEE transport
> into a small core so the existing fTPM driver uses it too:
> 
>   - a transport core shared by the OP-TEE TPM front-ends;
>   - a new discrete TPM front-end;
>   - the fTPM driver converted onto the core, keeping its name, its
>     platform/OF binding and its shutdown path.
> 
> Patch 1 is the feature; patch 2 is the fTPM conversion that justifies the
> core. Both front-ends were exercised on the Qualcomm Lemans EVK over the
> shared core: the discrete ST33 TPM (patch 1) and the MS-TPM-20 firmware
> TPM TA (patch 2), each presenting a working /dev/tpm0 (tpm2_getrandom,
> PCR read). The fTPM TA is the same MS-TPM-20 reference the existing
> tpm_ftpm_tee platforms use.
> 
> This is the normal-world half. The secure-world OP-TEE support it binds
> to -- the in-core TPM2 SPI (TIS) driver and the mediator pseudo TA that
> relays commands to it -- is under review separately:
> 
>   OP-TEE support: https://github.com/OP-TEE/optee_os/pull/8155
>   locality 4:     https://github.com/OP-TEE/optee_os/issues/8160
>                   (design follow-up: the secure world policing
>                   normal-world locality access to the shared chip)
> 
> Build and test it on the Qualcomm Lemans EVK (a discrete ST33 TPM on
> SPI, owned by OP-TEE):
> 
>   https://qualcomm-linux.github.io/qcom-buildroot/lemans/quick-start.html

The above was the wrong link, please use this one:

https://qualcomm-linux.github.io/qcom-buildroot/lemans/devel_lemans_security_dtpm.html
