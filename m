Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DBA2BEC23
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789578638; cv=none; b=VUKoGCi5JfeAdqPRtYpJG2mlt0k5aWHwU1+9/W/Ehj67r3VQQO9mU4Ua/ETWsty8clOYwCuuxnRjkIVy4Mkpwd2avtj11cTskflkrXjqzEILi4xdB6qvbkyYaTA+qhr0f8gEj9geHBjT9Ts0l3SwRLm/96b6gPICpcmTEXOm8Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789578638; c=relaxed/simple;
	bh=i8Tw9+Y0LbLQQkfb0VjBjO33Jh4ZfQKD94u7NvLdVx8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GFXExrrtGgrMflu64d6Z/uX/lNgQD7OOmfnGrKQjpoo36ApM9TiEktU2IX4gG14AGFYHiY/rDt8+XApOD2hFAbP5v0zJ0YH7LPjsK9zG+V0bj1wWyNV8HaRq5mYcQBpF6AP91Y1F0HmlxF5MYCQzmEZKhkpCTw5oVhttAgxg/Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=I/zvzBTb; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="I/zvzBTb"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8631d0023daso814316b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1789578627; x=1790183427; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4QH7TCKimipR8xV32SdX4PILN4e3j5bJ+o9cYY2F4DU=;
        b=I/zvzBTb7sbhurrPW5561okUsTghPC9kVPuSE7tPT0eu/vA7FoUUPFVFb3NSHth3vp
         Vqlu7DBQxnLIsmiq/Tm5NeVoIF138k+sKKhUgZp1AZvX4+CfV29HcUPleGItk0+dCW9k
         pTp5Fgik1hPe/CvV50nLG+ll/TqX7Z4OKEqX1IfXHsinfbRQHsHSYdBplHTSjqAo6xQy
         fcpayIXMEVymGFpSKYmLNDygvJZA65k83+SsrDSmeJGGOMt+XuXpD7EG39ucajZUE0lg
         BY2MoICXzutJrTsYbvQAfXTpH7zOtJstOarPH/m3f7BYB/Pqcr86m9ssIrqAwBjjDFos
         EMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789578627; x=1790183427;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4QH7TCKimipR8xV32SdX4PILN4e3j5bJ+o9cYY2F4DU=;
        b=Kh8uRlxLhO7s0qFRR+AdAEMQBh+tOIDiZVal9sSmqJ+ZXH1Rp15jNEah3fY1I9SAgB
         iPJQJQh9SAWNaYLhnM48AelVXO7uZ8YFz8UV5J+wpYlpyzgQn7cKiDcrxnfpJOR56Two
         pPHp6dtqWuh9SCi/E0FOQkfeL6fnourP3NYtIKSIfWJrw+zNWwP1zOQdh7BW5gVOOw0i
         UX6DYghQQQDFnmBtl1LBXZ4qmz3HceqsL4fFw/oR8yIGAW0do/jn2DD7KnrHJkWg/+t7
         EBl/px8QWKdW2Du6ZM6M3Ab0z/jI/cbX6s/nYSRJnwTEToA3HnKB7Os7zmw+R9GjLs1/
         XjJw==
X-Forwarded-Encrypted: i=1; AKwUvBzeczdzqf2rFzo+uLUXrZjmFlj5rUdBgoeN8MQXxPWiQfKVFMowuNpYNhRyEMGOzo4/1iP9oTZYuabCPZE=@vger.kernel.org
X-Gm-Message-State: AFuF++mCfy3qnq/EYLMFMNAXui+wmCePBCWYXBxyW5d1MiKxj9HSbbBA
	wPj2LnBVUJhd/++LL/rtPvnFTRqcwjCVN7HowchikCPbYinfDcdKN64vneAMcZ02OO8=
X-Gm-Gg: AYBFou0/f851KgZULoSv3BxwV9DGE/9Wn8b1b2wARblUIIPR91VVQBP90Xi90/Lyk7M
	oZ4h8YXVbE4xbe+J1HioQPlWrUawPLXJ6Ek2o0q8IRe++qy9Nl0kO4186AkmeJOMJZeufSM7DnS
	bG7eCpiDgyzEINqBI60cR0S3zWc21dxETdGmygOrF4MOLl+zgPaEE46bZsyu6Fqlw8hXtdTsAGt
	1kTaWio1NCTU/Lx0FUjoCbsrykKK8IzHfw2O71wGy60Y6xIuA1Evz9QPP+r1dyLy23+5oE8oXgZ
	X4Nw3MVfVvKserHrHUH9encDsonuhGN/9QMJ7C9coNEiH+a6pXrxUvm00/YDwHIKiBv9yuDksN0
	s3vgPNU5hgaHfqWrEwsclBU7aYonypy6jBZgUpeTEkzRK8t3ZmQYt37XxQWOfsXShfhBWlezAfw
	J1cpuXtFLUz7zOEVvGM0795OQQg5fzctu6NlhqRh2zDUoCL/g6oaDKzUbGG1nEelu8ej0wuykgS
	ad+kwnMCLbpQF51zIVg
X-Received: by 2002:a05:6a00:181b:b0:86d:3958:6b13 with SMTP id d2e1a72fcca58-872391ab57emr6854570b3a.19.1789578626409;
        Wed, 16 Sep 2026 10:10:26 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.13.74])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87201d1b275sm1607393b3a.51.2026.09.16.10.10.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 10:10:25 -0700 (PDT)
Message-ID: <6e4b5c98-7d48-4629-a6a0-4d930327f9a0@sifive.com>
Date: Wed, 16 Sep 2026 12:10:23 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: sophgo: sg2000-milkv-duo-s: reserve memory
 for RTOS
To: Andrei Lalaev <andrey.lalaev@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Chen Wang <chen.wang@linux.dev>,
 Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260916-milkv-duo-s-rtos-memory-v1-1-6ca72d5a3924@gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20260916-milkv-duo-s-rtos-memory-v1-1-6ca72d5a3924@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andrei,

On 2026-09-16 11:06 AM, Andrei Lalaev wrote:
> The FSBL loads the coprocessor firmware into the last 2 MB of RAM.
> Reserve this region to prevent Linux from using it.

If the FSBL wants to reserve some RAM, it should modify the devicetree at
runtime to add that reservation. Adding the reservation here creates an
unnecessary ABI surface between the FSBL and all consumers of the devicetree.

Regards,
Samuel

> Signed-off-by: Andrei Lalaev <andrey.lalaev@gmail.com>
> ---
>  arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> index 78a257839f6f..693c9fd7b771 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> +++ b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> @@ -22,6 +22,17 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		coprocessor_rtos: region@9fe00000 {
> +			reg = <0x9fe00000 0x200000>;
> +			no-map;
> +		};
> +	};
> +
>  	wifi_pwrseq: wifi-pwrseq {
>  		compatible = "mmc-pwrseq-simple";
>  		reset-gpios = <&porta 15 GPIO_ACTIVE_LOW>;
> 
> ---
> base-commit: 9b87fdc9af2fbfcdb5c24a64139685ef80f6573f
> change-id: 20260916-milkv-duo-s-rtos-memory-7a94933e35bd
> 
> Best regards,
> --  
> Andrei Lalaev <andrey.lalaev@gmail.com>
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

