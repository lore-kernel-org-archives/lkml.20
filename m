Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3BA3C9EF0
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788161907; cv=none; b=o358DzjOsFV/MjJjC5bsvu0fFVsqS0kkniZzCv1DTOLUHoq624zfHlezBVkpIkVxQw/dIzWCXGZHp5g+ezPsLhJRx4vTSjxWFFBDpIiPWQG4hByEKYJPkCJjnq6akrLQHDS328KHkt53iOP5pjiy3xrbGzIwEV4uVewgDdz0xR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788161907; c=relaxed/simple;
	bh=5GrRjcaI03gjaXtG0ojiV5JyfTxjAwxYCZIcBdozizs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=osaf1rHzSrpyrAi8ZL9hdxTPOwyfmwEPrRALlhaDsSyvDtLUz9GiStz+hcx3KptQ5iMDmbtzItlZfU0NK6uoyRn6H4RGxaZ/uXZVidux2gLOBObONM97rWXG1qklSU5INpJE8o8L6XQLwQvxFYJHub/X9MtmV2mAGJyh1DlfRsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu; spf=none smtp.mailfrom=monstr.eu; dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b=RgzrKENU; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=monstr.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b="RgzrKENU"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c1c26d7e951so547948766b.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 00:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20251104.gappssmtp.com; s=20251104; t=1788161902; x=1788766702; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YwC1H5E6QITqrCXuXOQp3c3SXNsKMl+a0m0u7ImLlsA=;
        b=RgzrKENUwvrnjjexpy+WBcsj29+rT7OtZGpgxcj4ZJlPZ9KeXDw6khod1VjOH3lYJH
         84Iv67PLlQwGrr/Liq5obNplSuoSOG/YxzwgrnpVNHl/dT+jffBNhPZ10djbw/9aAMhF
         gX74psnY4Q7sT2S3TcGNlJX0srfgCYWojFnzc1Vu7s2k7E5CdO+nZGp+mVx2oiD0Inxb
         buzAZ2Ag1EjbXAsoYfJhrd9+ttRRTs74+i0+ngIQpU6TbskwW3HcsNJYMi+Oef9IMwK5
         4OgpxGOAStSZxcVwhf9o0CjftxD64hbuyrL5K7V7N/0O7FUzPum5fyJI2AA6GqZTm9ys
         SS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788161902; x=1788766702;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YwC1H5E6QITqrCXuXOQp3c3SXNsKMl+a0m0u7ImLlsA=;
        b=fTl8msypj/L0hJGtzMr7drUMJVy9LGu8jN1p1dAdLTf1O9LZTR4eZvy/iS9bLGiHwD
         37Is1Pcav4YsLmIBlkHMnlq0irRJIwDsE3/7bUMnfr2SaKLrJmLqxOblLNOkBiFlQN+P
         Jay4dyGEjiUKzoZVrH24i9VKMTuCuufrOpEMretv0RNTyZ7piz3H00GBzMyI9SGwTrcT
         L40z/78mdqt6h/4Dmdw3E0o5U4cIb61Bab/PZnnBfTmHOU9X0tkxJ3NZmeTB0bf1NO0s
         FyuSCzutxmJNB5JgYm/LsIPUptM5/wITwcpVhY2FytJPRox9kpjWpcndpe9DpBUAuU5M
         M1Ig==
X-Forwarded-Encrypted: i=1; AHgh+RpyzkTPRim4Q0CiFMMJrwik2Qo1oNbGiUv4xX8YmbrhmsA0AToEUumlfdfAq6WDu+p9yskze/lQ2HIdois=@vger.kernel.org
X-Gm-Message-State: AFuF++m1m5rwKJTwzz996GyPFB0m08z4XLaoY/VfrfX/SmlabBXiK6U7
	JeDPtlvMmysg5OsHaTRLxG8+5QxSsQjtvWODR5F1SG+TW9HW4pb3s0NxXFBvj6mLHBPSVUu4XOp
	u8i027MBT
X-Gm-Gg: AR+sD13nPrkRTajup8x81XjN9rpjp/Bk4usyqDKxonx8UOkJut1kFwob8MbkQScts2k
	QreCBk1Nt8tCU1wvFnx3GvGRi1tK3TbAvDWDev9N1NVzo9WbXy1MCihaQNPwHuZN6MnjLPJ3sIm
	OOwMsZdIDm9KyaelC9U4CARaxSYI3JPE6QV3xlxxQdepFJNNedwQwhIRYE5QWsVGFgsuADHtqu6
	8bfdiZw66GFUNenEZy63+SIG+8dXLPOaCsdiYdcfNj3Nmz77lhAFtN1MvpC+r8R5AUu7cKNrG+8
	Rh0UzjqyWsUuYtggEqomZP8g4Aygn0PX/Uh6h85y56dxgOhb9jh/y8XJihCXTecy0cf388uPMPf
	R01NOCpc0DS5yIHNE9yyIluiT5/Vhrw6uOpFKUBowjHaTr9hHDTOEbBnByFpkQSnp2eJV7QSVRI
	o1RnAUmGcr5lZyF93WKqgaupkJObda+p9oYv6Q1MumIV+COJRL927UFTjWtGYDXt7cy7WyRVnFr
	ngjZK1xzyqfuQcqt9nw5NhT9ETkDiSGNWyaAA==
X-Received: by 2002:a17:907:1b07:b0:c12:5a0e:3e0 with SMTP id a640c23a62f3a-c25571a8fb4mr1559731766b.19.1788161902399;
        Mon, 31 Aug 2026 00:38:22 -0700 (PDT)
Received: from [192.168.0.105] (nat-108f.starnet.cz. [109.164.53.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1b28f6sm368630966b.39.2026.08.31.00.38.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 00:38:21 -0700 (PDT)
Message-ID: <4b70d099-b8f6-4e96-a946-6333b1d64bd4@monstr.eu>
Date: Mon, 31 Aug 2026 09:38:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] microblaze: drop unneeded semicolon
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260801191002.1383835-2-Julia.Lawall@inria.fr>
Content-Language: en-US
From: Michal Simek <monstr@monstr.eu>
In-Reply-To: <20260801191002.1383835-2-Julia.Lawall@inria.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/1/26 21:09, Julia Lawall wrote:
> When a function-like macro expands to an expression, that expression
> doesn't need a semicolon after it.  All uses have been verified to
> have their own semicolons.
> 
> This was found using the following Coccinelle semantic patch:
> 
> @r@
> identifier i : script:ocaml() { String.lowercase_ascii i = i };
> expression e;
> @@
> 
> *#define i(...) e;
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> 
> ---
>   arch/microblaze/kernel/cpu/cpuinfo-pvr-full.c |    2 +-
>   arch/microblaze/kernel/cpu/cpuinfo-static.c   |    2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Applied.
M

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP/Versal ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal/Versal NET SoCs
TF-A maintainer - Xilinx ZynqMP/Versal/Versal NET SoCs

