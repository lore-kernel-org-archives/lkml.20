Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794303377;
	b=4+8OO8CIJDDX9u/f21GqoNclguTPd/X/FvG1/ONIgq3wcriZhfuwMpPHWExqBwFsrSYc
	 eL2FpNLMWr3sFaOL5cLRlAEmMux0caSa9L7T/r+993Avel2ctAiKzs84y6THJehVmc7Wq
	 Heol0cEINoM0Y/DQqEDubLU6BzjvanomF8e4rLxaE8KNVVe8YiK51sToU0Van1hOuSMpw
	 U4urganermMQn7JgYDixvRTCskxOU+nDaXAuf+YZz11v19COYEXqXTMIsfl6ubi59QZq3
	 rUveKrguvd4tGF6JgkvN9XdgpwZHhgYWYblmDyufgZMPhuTb2zeW7ED9Rl4MvXzUH5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=iucbFFY9zAAhuHSoLktk3X2g9x2uMiv+kG1Kr5rpS+E=;
	b=iTefOKXln4g8XdHWsQ9GMu84nUOUMrbvTNfLWJUaecodajhRACFYiGw0QWew8Sie4Wp6
	 7UvcxaDb3TBWctNCckLkmgkx9YDGVNdBf2OAdq5n7If2WcOm63qSoZlS1e+Y9kXrGm/P6
	 REedawRZqxfQC6QPSQNVMdzQ/MIbclWZ7sEshOc0pod1NSPvPkWfgLTjIT69iJ1ZW3yjH
	 MuuXUxWnE5nDKv/10tl32Zewe5Yy0L0a0IhWFCpzrXcnODmT2SA+mASyuIQpcwU41fv2P
	 lifnjyv2+7zKoBqphe4FX5FUjbq6A8hFBRMCeHVpbi4a4gLtV6FsYLLxS66FYKLv8Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lUlMKgJb;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D257B606DA18
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:36:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D257B606DA18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lUlMKgJb
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48fd2e38825so1110846f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794303375; x=1794908175; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iucbFFY9zAAhuHSoLktk3X2g9x2uMiv+kG1Kr5rpS+E=;
        b=lUlMKgJbwkULNr+U9YoG0ugtTDHq2B28v7SSuW/Yzh7kL87qP3PR26BfFeBboI+EKC
         VrVYwcq8BQZk2o/w3VdsncJBtzCLpdHVGC4O/qCg0ck811mB8bUeMjmuYkyr2VLnCLVw
         a9b/SEM1TIBbTIizg3kLnvPk3Nrs5nTdWttwC8lliiHiM18uCr3HspTra7d7iGok49Rg
         0lK2SyWHYVTRpBjOtSSVS4o66d2M5Cmo+33GWGs95RwweYq3U7pMojCfnD9KKTWJ6/ri
         AZCnWLc9U90GjSeiUytj8YL8ieYQU8oJfCCFFZwWB6k49y2rQO1YEuPUyxz4aZL7w1Ps
         3vDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794303375; x=1794908175;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iucbFFY9zAAhuHSoLktk3X2g9x2uMiv+kG1Kr5rpS+E=;
        b=iPcZGPFDW7jxGLjgYgwAq4yPS/8ElOqChsoa1QGWNjRlFpVHHdo0+67yinqhTrI57S
         i7WsEpfMeUGmleMlQCgN6U5oV6u1ul72yKTp9tLQplChfXVB9F91I89LC/UOHHfVVzEb
         mny1Lke1qxy2PteZcaBXdzkgNzN4Hddr9NxYfXiaVU8HnN4vULSbojufQ15yrcih6onH
         GAkt2+SkDqWe+LT2ilmWHpp9BQsUGimnicdxwIXaoVgP0oySPkW1rfHyV4MQZTFN3k72
         4NZl6hpxNKgGHPsl26gHIv6Q/6PLoCvOcCEtUJMLYZ/t222dD3SC1y0enJvmDi+Z2StR
         /XaA==
X-Forwarded-Encrypted: i=1; AL+hErHcn3yfsFTUgt6pFllpgn+L6Pif5s70nw65TQjdYZsjs7YxO6r8yXgcqawenGyEiaCuhYeZ9UnZxbzOCRs=@vger.kernel.org
X-Gm-Message-State: APuU4Z96PlHtpADxVVHCUWeJh1Y1k3g1stlDWu/iTXY53/0TWcElPv4c
	KgsKofGHn4ywv5rWVKPwCTt6+JKKYd+UnftGc+CipDSJs6J8lsmP0hDH
X-Gm-Gg: AYBFou278ny7f0a9Ufe5y51JIMtL7e72Mqdtv1qVLa5GCbfwS2qlkwwCZ0OX8sNbiFF
	/HBJh8yJuMH68cBLoWCpAEsbxm1DUTlV/XCYoYyGC8M5lrN32Kz0gTUOK2aCVTrcRCA2tTcgzXQ
	p4uK3OA5z6b8ppBqafS9SwdIZ3UsPkvevi94WHcIMytYmc1LemaErjcRErQeJJFquz48TKXf/dp
	mSJ1wA+8/h/DATd61emQPV4QlB2x76iWeHFZF7dmjY/HRm2Fq3EyGCWdfTT7TL2p0iVHXBPfiUp
	XE7bgW1J/9SJua89QmgrKHJG920lDDzKGHO7os2ZRFiNC8CVazGFy99lkYQtHmwpKphRM8sOTIX
	ldeh6NKSeN2x7Fxt24kxXEi2Tv1K7PsKls/SplXXE8nRGnx7cT/KMW/Flb+x9DrqNeP4NzlCqSu
	ZXIl59/WxDuXpq09fuue7dRNntXI6yoAnm0OULbooSybH46i6S9cAfZrzgAYiD1cpvFwILKjdbI
	TQ0PSWdpdDIg3e99s4yqj0FRNH+WgigWPyXTXJXv2rY8gYg0QQGvv7OzFeqoshsADluBNYVl2s1
	a/qdu/fl6+O/qh8W+JDUeuhQixrAzTRGXwbZTxKCFt0X1K2zJfCpUE+R1T3ObVvuBL4=
X-Received: by 2002:a05:6000:310e:b0:48e:932:af0b with SMTP id ffacd0b85a97d-4982fd3e055mr4320746f8f.32.1794303374605;
        Tue, 10 Nov 2026 01:36:14 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983585c5c4sm3359512f8f.17.2026.11.10.01.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:36:14 -0800 (PST)
Date: Tue, 10 Nov 2026 09:36:13 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: linux@roeck-us.net, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (w83l786ng) Clamp voltage limits before rounding
Message-ID: <20261110093613.52ed3861@pumpkin>
In-Reply-To: <20261109101916.17352-1-zhujun2@cmss.chinamobile.com>
References: <20261109101916.17352-1-zhujun2@cmss.chinamobile.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  9 Nov 2026 18:19:16 +0800
Zhu Jun <zhujun2@cmss.chinamobile.com> wrote:

> IN_TO_REG() adds 4 to an unrestricted unsigned long. Inputs close to
> ULONG_MAX wrap, so an excessive voltage limit can select register zero
> instead of 255.

I looked, it really doesn't matter.
The 'unrestricted unsigned long' comes from a write to a sysfs value.
Nothing will write a value that large unless they are trying to break
something, and they can just as well write "0".

David

> 
> Clamp to the 0..2040 mV register range before rounding to 8 mV units.
> 
> Fixes: 85f03bccd6e0 ("hwmon: Add support for Winbond W83L786NG/NR")
> ---
> Validation: x86-64 and i386 driver objects built with W=1.
> Source-extracted boundary tests passed on both word sizes;
> the corresponding test fails on the base revision. I/O is mocked.
> No physical sensor or booted-kernel testing was available.
> OpenAI Codex assisted analysis, code, tests and changelog drafting.
> Please review and add your own Signed-off-by before submitting.
> 
>  drivers/hwmon/w83l786ng.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/w83l786ng.c b/drivers/hwmon/w83l786ng.c
> index d16afda34e41..0cd545011e73 100644
> --- a/drivers/hwmon/w83l786ng.c
> +++ b/drivers/hwmon/w83l786ng.c
> @@ -101,7 +101,7 @@ static int temp_from_reg(int val)
>   * in mV as would be measured on the chip input pin, need to just
>   * multiply/divide by 8 to translate from/to register values.
>   */
> -#define IN_TO_REG(val)		(clamp_val((((val) + 4) / 8), 0, 255))
> +#define IN_TO_REG(val)		((clamp_val((val), 0, 2040) + 4) / 8)
>  #define IN_FROM_REG(val)	((val) * 8)
>  
>  #define DIV_FROM_REG(val)	(1 << (val))
> 
> base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb

