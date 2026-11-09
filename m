Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794235494;
	b=bbOl7qCPW3ljcWUzLtceAMZrf0HBo2i3UuNm9lRUbHi2PPU0j44N3UHK20Ec4wpkQiA3
	 D+XP6Eksb7mSsjFxUDTozO46WcEGSPK9Y/WMvyXD2nU3H7HHQwJCbDZEZ7tYgIuhlv3ho
	 RMAg3qJko0vp9nzUm82i3zTyfqPANL20XYkvefer3vQBa4llXhdp7D4QpolaJZwk9jAQn
	 Lk7nVc25mm/xRI71fOElC/xBhr/ET497KfKKTJWUqgSNjPSs7KXJiqsbQYCXavwHBHIeK
	 +7bqIY/I85yiY4CbDxx20ajOPZB+s8C/OvlVmYJvKyHHWhG0jifBcg9RgJu9jvDrMzg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794235494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=E5X0aK4lGSvPrdX7cpb6XEojnCQxm1GC3dItr8iBnTo=;
	b=OPXyAfpYHGn0USaaTi0u1ebLFdVqs2kjhjNNA+ng+PKhuIep7sCzy5zWLzw/FNYi+8eu
	 BxliYn0tI5PIMTxNchsk19qMpR+XX5P7bonK7sjOyWfmdrNRmeQJ5hyw4SVI9lRJdkHlC
	 BjdnQ+5UoHOY4DnJsdRetE55bOdjMeczPbf78yHTZKUqC0xOVa/C5tRfj/g+cmaTstLeF
	 3LrW/vJXfHaNBobSw9Uy6LypmwFVxH071jKBkUL1UJdAEdQNaiq0DUly2MxDNluN13P/i
	 fLEv4OjYbMGCWYZzbrfHeCvTL8Y1f4EsV+XNbY9/2IhFd80XKxjzfuzL0xBchPx8rkg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mm5tqw4H;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB07606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:44:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BB07606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mm5tqw4H
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so149698066b.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:44:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794235492; cv=none;
        d=google.com; s=arc-20260327;
        b=qv1Wh6OyH8IlusSe/3mOq3fTDpzzZ15TWsRzNnDZap3dBezGLL8PAonctiiFnrqWLV
         hgOHKXOe0WqvlnTeuiu5y3oZArwu6UPQ6W+Lw4PHAhEAg07kHSQ0m10eT0l68dstjwRs
         iBKcj0CRGBTDnoRoRGAv1AdIq7o15Lbduf3z8JGMAGJjEsqtFix751tuNT0OMWzyyb81
         3fK2RVL57MxH/37+9rkFh0U85nAsWd3RzjJKkFpZXkT9czCMejGkoZ+rDjUlR+HapTOQ
         Su8zD/B73rfrC99U4WSW/STsW0Rvy9OCb/Jou+6NX21EO82acMZ86t0Rv9Q8durHDCfp
         8+bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=E5X0aK4lGSvPrdX7cpb6XEojnCQxm1GC3dItr8iBnTo=;
        fh=TM1ftfiPYqrc7rX4UXft0w2A4UCjOLw5WY7GTAdfFy4=;
        b=BbsVCXzUpzj86+8j/3wyqs7HZKe2pJbvE6ENbSeLcw1w6Re+0YKGzw5ueI/oTxtLKc
         2Bt5ritZIhOUmnlcRa8RjbXgtt9oK3dMEg18TAoJlqSqQSR1i/qXHqo/5sKErsYCnEvZ
         kuyHHaH4tp0gZNzkM1nS83DDhlirL5/7WekKF/mUeszbRr4Y9FidS3lBx/QDYEpAWKoW
         JW/ij1htbzJaL52MzrWHJtD1EtupGoZVM57WuQah+NwEwrafoWaKqQH4wqEfq7z+RuAJ
         hecqJeizL3mfE1WlwvWmzTsshvohUI2xIot5z/sGUPyIILji3Za5N8g7atuZ9zVEQ9Br
         YvSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794235492; x=1794840292; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E5X0aK4lGSvPrdX7cpb6XEojnCQxm1GC3dItr8iBnTo=;
        b=mm5tqw4HLkEAYwxkVAGFQdiUaORFmvkuPw9UB87sNNk3i6lMxavweuisPZYUK/CT1h
         KOjPo7pgnd8LN272URm3edqqk21fIGQ/4oM0cCV750lM2e8gBpArAPcSoVwR18z79Fhd
         ranHton6NsqSWJNQA3K2AQWvyJbfI6xn+4aozez/H0VnZDTGdpPHTXoqtt8gg9pFhdc9
         KL30xPY+CzT9eFaH3CFtdvPBFoaNUQXaWY454pRdG1p2CeuIA7AxGWd5eGUXaugqaTHf
         Usup3xbkT/xTWPaEnufMlIeCAIZSxPz8k7/9wjDrEPrt72uG3+eRH+k3oBjFYjDhvH1S
         Ca3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794235492; x=1794840292;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E5X0aK4lGSvPrdX7cpb6XEojnCQxm1GC3dItr8iBnTo=;
        b=L6fuX2TNd5Q164RrUlpY1FKGOvgyPuqjEb7dFbtvUYBeXqnLTfKmNl4yJxBoESvAFS
         /f9Lc+gKGPIZ5FS8TAa3aTo5tz/AqECe2C5kdgYdXOO8YduCx0+iepG8aEwXXy8MWAAK
         8CttYZLIcIbAQOX0/bJMwyzsIu6DdypUMR5pVOS00qRRPZN3TLCckDBhZSYHdj/7Loxq
         pFkPz4UrNx9quclX9GvXH2KlRHoti/fplE5Sq2gredXYuBUmGdSzxd90v6ewDswFkQmk
         +PEMlMCusSZ+QDrnbNjJUEC45P34nEkNdl/zFg3oOrlDGkBxBAbX+3q8itRV/I4YGByy
         xh4g==
X-Forwarded-Encrypted: i=1; AL+hErG8r5i5SL3wj6ODymt57UZ1a8q+fUEM2+7V+M5eizU+xWdu9+c/rExU9njp8BOx4c88V85UF6Wx/YCiaWU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Q+Wd7jBaBTPQHnx1i+ETu5YoyvdvoNOvjTdVCjGfAVAefH+WA
	6OJoT109H3gB6EFUUI5KaFFGjc+3nfRppGf4myixlxh8D8XP7gBPwg6HgIXiaaCWVGaU/vnksNn
	WJDidvZ7hkg0itG2UTVYA9VfqibY1da8=
X-Gm-Gg: AYBFou3yJyHOlmlLJkm9CP+wdQ9Wzqa+qYCa0276XqhLH8Od3PYEZIhiPacHBxTOOTb
	U9corjsKn/oCOoIKf+24GZ80cIyKmVW/LMom/kCF85OAmRPNNroNShH1MPI78Oe71W+KK6wpuXU
	E2oxb6UU3CzsbpC27f5SyEpmbN4tOyK1JWmDFAXKrWasMl3Y/pK7snoN8BgxqDn9LaeOa7azW2m
	/Z+O+vAG5CFTnr3JGDsflSinV1r8eotbvU+Punx6flTMaL7MxBRJL8oJn0iyLZThPzAqryCTtkw
	3UDQ9/oOzPaNbi4ezzOvQ2CmUs2geypBalsq4E/jwhKkO9rh4ZYOAYwDd73Q8U9LgirLdkrGUsC
	/vOk72cAlGbNE5x58COkdoidO+17sMCHLLivY
X-Received: by 2002:a17:907:844:b0:c29:f5d8:9c82 with SMTP id
 a640c23a62f3a-c4d6db58c84mr325111966b.49.1794235491848; Mon, 09 Nov 2026
 06:44:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261017-ov9734-ipu6-v1-0-86eab22ae258@gmail.com>
 <20261017-ov9734-ipu6-v1-2-86eab22ae258@gmail.com> <avG8ZgDPVWCr1pja@kekkonen.localdomain>
In-Reply-To: <avG8ZgDPVWCr1pja@kekkonen.localdomain>
From: Tin Posavec <tin.posavec04@gmail.com>
Date: Mon, 9 Nov 2026 15:44:38 +0100
X-Gm-Features: AclHuK_PHfWehNIYSFaUtvinypIscMfmjsHD97Wco3q2H8fRNHwkYNi4pk5IzQ4
Message-ID: <CAOJcTPXBQTFRR_m2S2ZrwXbZdMLHHz0DGG7=2BtFsv1ouY3Tog@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: i2c: ov9734: Add power on/off sequencing support
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Bingbu Cao <bingbu.cao@amd.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	afonso.figuinha@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Sakari,

On Mon, Nov 09, 2026 at 02:28:22PM +0200, Sakari Ailus wrote:
> > +     if (ov9734->reset || ov9734->powerdown) {
> > +             /*
> > +              * Keep reset/powerdown asserted for at least 2 ms on a
> > +              * back-to-back off-on cycle.
> > +              */
>
> The comment isn't useful. Please drop it.

I'll drop it in v2.

> > +             fsleep(2 * USEC_PER_MSEC);
> > +             gpiod_set_value_cansleep(ov9734->powerdown, 0);
> > +             gpiod_set_value_cansleep(ov9734->reset, 0);
>
> The sensor appears to need a single GPIO (xshutdown). I wonder what's the
> other one.

There isn't one that I know of. I based the GPIO handling on ov01a10,
which requests both a reset and a powerdown GPIO. On the NUC M15 the
INT3472 provides neither of them, and on the Surface Laptop 1 it
provides the reset GPIO, as Afonso reported. I'll keep only the reset
GPIO in v2.

> > +     /* Give the sensor time to start up before accessing it */
>
> Ditto.

I'll drop this one too.

> > +     fsleep(20 * USEC_PER_MSEC);
>
> 8192 external clock cycles are required for this.

I'll wait for 8192 external clock cycles in v2.

Thank you for the feedback.

Regards,

Tin Posavec
