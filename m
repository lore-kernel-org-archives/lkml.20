Received: from mail-pz2-f18.google.com (mail-pz2-f18.google.com [74.125.228.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5AA27603F
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 02:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789786276; cv=none; b=bvlv9vKk328U7HKd/SIkb3nfJ3Pwa0Oc4GQyJJn0vuQQ1qQ5O4hCPfJ6uOUIr2eL3ioXIoJrhQ7gFxOlUU1AHIT2cNNMJViVxkkAsxQ9G5l3KtqrWVs/mqXwsMskgQ/BjPxEePw+SFWKvLPn2ghBjOQyaQcQO+32/NIHpjzUefA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789786276; c=relaxed/simple;
	bh=JcECnNjrlOaWBJGWKF19/ox7DU/tJMVTNEO6ke2Z5lE=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=rKezIuZBKpvqSt+3mU6F4GFq/OgarJLsiDMYpTgWR7jx01UWgOSFXJIEdg8Ynlm61k8pimMyI2qKPv7F2YHEF44GhIwwOgNAOUEEfQLwjKYGL7wLuPEZeRpKtW3cfxsVHCrGi5ILsbeGkke0V9Mv/AVmR8YSgRnXNh1Xn5uAgrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fIxsM1rK; arc=none smtp.client-ip=74.125.228.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fIxsM1rK"
Received: by mail-pz2-f18.google.com with SMTP id 41be03b00d2f7-cc4bdf8abaaso1104320a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 19:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789786275; x=1790391075; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7ffAIIOTzJLTc90hT/z6VobY5awA2RAnbn6y+KHd4n0=;
        b=fIxsM1rKKETM7EOWIyBgwq/sHbjixz517kRhyizI8JZfwrlpSpN6CYY5J0e3TmND6z
         qo5iOwxoawWdWgno8hoJ5vmMfSezDZRhm6idsUyF2Lw5S2A/UtAsWbYVTvKWHgZeAZlQ
         rgvFhIJLfBWOQa05teE6g6Mt5Bu1b/8T/Mu01OZowBbGnfcwv6AOJdvnCre+Bhela57L
         1IWUgiTBi9X+WcSAsP9rDxM3z48XTBY18IuGENXXAK3FJLFAO31t056dD0pqc9UdgcZc
         0NhxQXJri4711v8URYLMwm70fYYoaYFjGt4zDu74T6dsrfNbZg+P2riG7P6cc5Z/EErL
         Phdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789786275; x=1790391075;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7ffAIIOTzJLTc90hT/z6VobY5awA2RAnbn6y+KHd4n0=;
        b=Qj9wGWJ7FJhaqT5LKLCDU8pR6D2xVrOB4Sk3HCrPVbFaML849BVweWg9a8+Oyrhoo0
         3Dgisvt0QHgelxipyhrxBPdcp3NWGBPyq8K9bVk/gLsL3QCzpxjCjbeGH/UX616tWfxf
         U+Xc6gFBuk4GdXwdBZFYapd46up7gKdnJ8JfHYXdRTG+wwS2DFABH8OsEW1o8FUQRN8+
         34/g9yCPkdX5v0+lItxT5Sc+KJhrr4MrdLmDsB/LdlHD3NMiGeunj65zXmrN0MxnDlcJ
         8q9rcuzbDpMbOdB7BD7Vbbd35IF7u+djdIVLlGZ7xv9UeMq9nfpNbfYqHXHLDprJR027
         Q2BA==
X-Forwarded-Encrypted: i=1; AKwUvBzylcZSCUarR2rl/1PbS9p6q0cfgFpAbAcByBx0Seh+LiNV+CiisH6HE7u4Xpx5KbAscL6FMtBnNG9J4+w=@vger.kernel.org
X-Gm-Message-State: AFuF++mC9/rsgAgM1Z0880IeqErBEPTRgU8jztnoo/XUuS9GDFwzpqrN
	XseFaUhJFb6yclIdAwRNzKRSOiM45mDykZasdv+HfkXCTy4FcavNmAXY0UdWew==
X-Gm-Gg: AYBFou1Ni4Al8Rh0AX+NqjV04HAITb7rXZSNNXJNhPINlLZbsV8vhsyTZDLYffzGJlz
	oj9A37XYleZWHPO0UdkXBFDeYbBd6Mq+kzjphAN73p7C9Jc+ozb96gqqU9A0OgFfXwsd6dg9G9C
	MHUG65kXTxuGA1N9sey/3MlAvU7eNKD7OFhScOFJ1JmeTCsToR5QwlI8B/KDQsIECBr8xdosKM6
	R/SWMMcdTbJqnnuCLhTiubtdFPlZqQIgqsdcQPBqhpMTN45vAf7EoKvkvgNa72aztqGeP3PmZeE
	18DLIZYiLwTL8HQT1mcahMW8Fe8HDrAX629FCEhtUvTqh98JQMh467Fy1Zlojf91Bxoe+uK3wcr
	YozkriOQ9NwFYZi8g0yPiqHB7E3PJE6o8OIF0fd6tGqxkN7T084hV8sweznYGPCpbaGLoEE/lCt
	IwJNBl9BkUns1ZeDLmcCJuQ1ZJ7Z6xHpQPeyNOS5UVkl9LnUfdXdoeRwVYvU0Am6WOKzGQg2+pF
	5l4xvMgftG2MzFEeyTknVhgjoHhW0V0h0XZhUaM+J0nCWoz1c0=
X-Received: by 2002:a17:90b:17ca:b0:393:19a3:4f1 with SMTP id 98e67ed59e1d1-39e54cb43c7mr8391467a91.6.1789786274734;
        Fri, 18 Sep 2026 19:51:14 -0700 (PDT)
Received: from [172.19.1.47] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c615f05sm2060720a91.15.2026.09.18.19.51.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 19:51:12 -0700 (PDT)
From: Jacky Huang <ychuang570808@gmail.com>
X-Google-Original-From: Jacky Huang <ychuang3@nuvoton.com>
Message-ID: <cb92ac17-d334-45e5-b5f4-4c299a1fb462@nuvoton.com>
Date: Sat, 19 Sep 2026 10:51:07 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64: dts: nuvoton: ma35d1: add CAN nodes
To: Zi-Yu Chen <zychennvt@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: schung@nuvoton.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mkl@pengutronix.de
References: <20260916051827.919538-1-zychennvt@gmail.com>
Content-Language: en-US
In-Reply-To: <20260916051827.919538-1-zychennvt@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> +               can0: can@403c0000 {
> +                       compatible = "bosch,m_can";
> +                       reg = <0x0 0x403c0000 0x0 0x200>, <0x0 0x403c0200 0x0 0x2000>;
> +                       reg-names = "m_can", "message_ram";
> +                       interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "int0", "int1";
> +                       resets = <&sys MA35D1_RESET_CANFD0>;
> +                       clocks = <&clk HCLK3>, <&clk CAN0_GATE>;
> +                       clock-names = "hclk", "cclk";
> +                       bosch,mram-cfg = <0x0 4 4 32 32 32 8 8>;
> +                       status = "disabled";
> +               };

Hi Zi-Yu,

The CANFD0 through CANFD3 reset properties added in v4 address Marc's
comment, and the reset assignments look correct.

Reviewed-by: Jacky Huang <ychuang3@nuvoton.com>

Best regards,
Jacky Huang


