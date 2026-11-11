Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395509;
	b=aEfG2ET9gEZCSs+XaLqirk6RWPPAp5gv4csHMhQQ5Ouj7s4DcNo4PcCT7xcJIINiWuqX
	 7PhjYjeYpQN7JjoPTcixuvzP+SrIxdAAXnIQu3INQVhYh+fU6zxIeUm/FICfIllLIKTMz
	 NRrUCr+LaPOJf/P/nFUXycviVQ8VaoWSHvm4TPrqsR1LMYLiTXK17H41YE1gSLq1Y+5en
	 ollYyeXXnyc7rqFObiOBf87mUprnoVukhyOApBm7vVgZn2Ibkv67eRmT3Bc+3JB345hmr
	 J6Hmgci3pDaooSZyCc3PR8QOymbaMovb94HmETTcjn5e6vRVS0UVSncuyhMW5y94Vbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395509;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=iBpNRqjf3B1Ht4iTj3Q9e0CgVu4XAqb+Mm10Lehyyf8=;
	b=W4CZynOsYMx/VA9oCqWf2J2PO+hsbBpF3eYpavjAeg9t0KADMje/JLlljEcNtjYmN/pl
	 RXRWkUtU4KXJaWwBNGZZ/dpT2INpl0IWb30YwkT9KZ+pU1Jc2WMDpFpSxo5Ss7kQGeXcR
	 QctCaEovRnI2KmYoVmTrCuXe938Qu6G8gWwpC0+2j6xbFqwDo1YPRg4SfuLq1JwYrC8tJ
	 6fXpSbf69EmpR63VSlfvaYyNFxwggRN6qEV053JRy3qXJx6rQavLWBh7nEyjB4arfrw49
	 tMj+3ulYdSQ6ESMViB14L9Xpg1RAmsFQTuOyYTAVtRjBOObXUHF19nrpaatWvcCQ/ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mAUNCKAq;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E069C606A8A6
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:11:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E069C606A8A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mAUNCKAq
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a208d93758so32667055e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794395507; x=1795000307; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iBpNRqjf3B1Ht4iTj3Q9e0CgVu4XAqb+Mm10Lehyyf8=;
        b=mAUNCKAqk0zk1mcCkBWst6wKdlPAJsezh0gVaqTcZqgPZKfddTRMdoQgYrVbIaxxdK
         H8aXM0Hjd6rhROHdg602oog643ciU10gGgMHR78UhiXG9jSQ1CVnCSxgINEmn+jRYZnp
         rrnQChCkVGfi1Lvt5WiRpIHmZPawasBVKaHPJ7f1zSLMTOMEnmynzOk+h2+HmSDRss8w
         uDtkzbi/u0oVX66RhxBOIvZH6LK/MnoPjwiRvg53xdYCAFDuc65J27xVWN4udnLcv3RX
         E2aN+dfodDMj5+sFnjnJ++9wlgC+duW/tSGVBeBXKyYJpOPbGR2rQBGUZZ6grAz49D4m
         nsOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395507; x=1795000307;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iBpNRqjf3B1Ht4iTj3Q9e0CgVu4XAqb+Mm10Lehyyf8=;
        b=zx+cYKAYdZuLQ4v9O8HdI+yFgeHJPLbfMf1I6kY5F1ruvkSv/cWDtsBAyxsD336msG
         bz7NQkFvLqqlLrAHz7k+CW+k2k8gOqxOy8M6k4Psq/DiP9ZbJE1XTRh7VJZmH98EjMnM
         45oqAuh3g0OsQLat9wzPtYUfph6v4UcJmquqzZ+/jfQYlIUA3Lttlo0aLVprZ6L2liet
         kKsnZYvfECurTHVfJhkQYtyECZ0p1NicKXh4RdFPR4xm9Bnh3vowoHXMBIR9+xNuRB7c
         GoAj5QGRBXtVZTSw9/WC9PMV6GV+ukYT0Qfx3lRM2PjhLylhkwVSn0/CrQMSeUZmF3Mh
         PqYw==
X-Forwarded-Encrypted: i=1; AL+hErHpRleWzZei+gpoVKghE6EhLC4jnlpFyTE53i8s9b90keB6sMn/t2JylPvc4F5WkTPzkIpboyz36VcReRk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rCUISC4MIOI+bBkhfIvv4lYxVcFpISJvOLw2XN27aAIDatSKx
	xhprzc79mXnz2in4SeN+4D75uLmYpaEj0Eq4fBriXdBabYFpd12xuJiX3jk/uA71
X-Gm-Gg: AYBFou33EoC9uj6zUrjp0o/Fdp1WzNBEHTJE4FnX48LaBBVQ8au7HwK7ujHQIG/DiY1
	t7D41NTQHkilbkn/ZeUSrbNTMOY0sfK7Nz0A0GDKqvwYN5Iu4gSEA+o5i3A6s556nBmcSKiTuzw
	uxnz1RKLcfnV0Sf9RIJ7UsTKca35CZ9CpiQGWLn0QHLXLMD4zMjhUh0P0oH3mRp6yfnWH40hNY6
	d4KGy206REwSdOdDZjrMq6fJvK4CtvjP68Dm/h8sJG1WYi1ZX8ZGyN1E5gUkMEtRCQwjMXoYH8w
	DZCI5FIPzh3zoKwzLZgwwNr8hz31wcqHu7XiyxtQFCxLkXArQOzoZ8ey3Fu+jFBoLZMvcAk0XG7
	wUj84Kt2i8eJTsCh1IkrTG3BqvlaD14NKw9ZE2vnHqxqYnMQtSX1k042W3/rDisy1zLmY6NCz7g
	zCvclVIGYJjSVKdd+vepWs5cqYRokDqaO9jHWx+Jv6DfDVKyo5bkI+odAyuN54WsEd37xLkozAB
	UGRpnbSr2Sd4ObqdTynRt1AnO7mS6Ev0H5/Ab8W5XsSoO7oA9UvcIuG7DQkfAyIMVKpzgCrgGTz
	+sYiAJ20z2jLy7G8sCRq2hdSUCgSwHrThAuX7E8FSakt3q5ZnVsDkOs7oT2/X93xSg==
X-Received: by 2002:a05:600c:190a:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-4ba0931da12mr35879275e9.4.1794395507065;
        Wed, 11 Nov 2026 03:11:47 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02043149sm125462185e9.8.2026.11.11.03.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:11:46 -0800 (PST)
Date: Wed, 11 Nov 2026 11:11:45 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: linux@roeck-us.net, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (w83627ehf) Clamp voltage limits before scaling
Message-ID: <20261111111145.1694eb70@pumpkin>
In-Reply-To: <20261111064831.17299-1-zhujun2@cmss.chinamobile.com>
References: <20261111064831.17299-1-zhujun2@cmss.chinamobile.com>
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

On Wed, 11 Nov 2026 14:48:31 +0800
Zhu Jun <zhujun2@cmss.chinamobile.com> wrote:

> in_to_reg() narrows the sysfs value to u32 and multiplies it by 100
> before clamping. A large positive voltage limit can consequently be
> programmed as zero instead of the maximum; 4294967296 mV reproduces this
> on a 64-bit system.
> 
> Preserve the input width and clamp to the representable voltage range
> before multiplication.
> 
> Fixes: cf0676fe42c8 ("[PATCH] w83627ehf: Add voltage inputs support")
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
> ---
>  drivers/hwmon/w83627ehf.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/w83627ehf.c b/drivers/hwmon/w83627ehf.c
> index 9c08ab662dc6..5c04b9c52b76 100644
> --- a/drivers/hwmon/w83627ehf.c
> +++ b/drivers/hwmon/w83627ehf.c
> @@ -293,8 +293,9 @@ static inline long in_from_reg(u8 reg, u8 nr, const u16 *scale_in)
>  	return DIV_ROUND_CLOSEST(reg * scale_in[nr], 100);
>  }
>  
> -static inline u8 in_to_reg(u32 val, u8 nr, const u16 *scale_in)
> +static inline u8 in_to_reg(unsigned long val, u8 nr, const u16 *scale_in)
>  {
> +	val = min(val, 255UL * scale_in[nr] / 100);

You need to think about these more.
Either it really doesn't matter because no one would really try to write
an over large value unless they are trying to break things - and they can
just write zero, or you just need to stop the n * 100 + x overflowing.
So at least avoid the extra divide by using:
	val = min(val, (~0ul - 32768) / 100) 

>  	return clamp_val(DIV_ROUND_CLOSEST(val * 100, scale_in[nr]), 0, 255);

Another clamp_val() that should never have been added.
The type checks are there for a reason, not to be killed by casts.

David

>  }
>  

