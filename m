Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844135;
	b=2zYbaawDCXpzw3wa3AnHtwKDtpXBh5FPgz3WhrvQStkKE87YqaYXozb8w38yW1Cf1Pb6
	 uxQ9vxNAIl72qcJJ7+SNWDpRT/7gTKwj0NrGiOt8hP4tkEqXNal2k2L0uSx/YfHKi0sOy
	 vzGhw14lnqyK8cdglzOiKJqas/xr8TltGnO2+1NeL26ExNemyY9iO21SJiu00epx/fH8r
	 vqkrWhq3uXATrHQwTUPDmJTNVMwcJxb+X7vhSp5jHuPxTWQJuAlswfygRVhYlf9mJ2dGP
	 3xvk/BmaWcaRqwzC/dXi9b33sOFISlVek/s/HL7GM+aT1SYhEYniFJenJENDgc+qk0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844135;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=FS02JGyQWyDQPrqY2V1gfk2fF4qT2C6KJC4N7D0XFkQ=;
	b=oXG5Dw/YmEtzAa3Sb2gamB7pyki/xYdDrqVvM/+KhmYc/ktEdfqC4/fxvaob0rsTrJLZ
	 STclMnyMdvgAvzO1rDAky/YyZRkivS8Ul4azQuMzY9QwW/jab5+0yW2UDJfWKZdNPefpp
	 y2OcsiP/NUV9AcJYtFQpNws3+xyMa3gZ0EyMCUbl6W0KSAsRc2FdgTisYrUL37vWBvSVR
	 rJWlcc6RqJ2hXLrKZSFqDpHOz9Weq/bmTqdTjf2++XKFT5U0WCp91POAB3D9KggEaZ7F1
	 mihY9c3I7dIiEhQqpMJBty/fboIs2H4yTkik5kl1CRtzHwgT3ePSF5u11Q+z0S6LiVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b="eDnYNW/H";
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD856606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD856606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=eDnYNW/H
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b596afb4c5so4202077a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794844132; x=1795448932; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FS02JGyQWyDQPrqY2V1gfk2fF4qT2C6KJC4N7D0XFkQ=;
        b=eDnYNW/HbGAAFMxplnZKjB7UQ/BzumsrzvfjI8nnemfIci2hn08l+lT6pbOT1lgtXc
         xJb8Ry/5rVaqBVhoZ20hiaJLsOBLF2i2msj5Kxgb3hodV/40+0blPzSz1UQ3Y+8/XyF0
         UkEwJtrQh1PNcJNxAxLlUpWx1eV/LzoLEicHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794844132; x=1795448932;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FS02JGyQWyDQPrqY2V1gfk2fF4qT2C6KJC4N7D0XFkQ=;
        b=Vv28llLLhk6LCkmC0UE4mcDrI5NiFmlyLegGepfnCv2NE84OAx+AJ/Qgi3+6Ljehli
         N7rH1DJ/OZuKVDCjOiATdN57j++gIjbS3slCV9CTZAS4KiN842UKEkAq8KqiUBydP2F8
         TFCwtrvRRTM9pwpE0fNU8XFxdf4ER6EOeN+u7qbQXdo9+xgYyRBOFT87GJYANAbfrJeN
         Gwj2ZUoKGWnHHA27oRTbr8Rz6v9SfP3Zm36cBdHVpkIBoqpu8TJjvz2id4zgbFHtI+tz
         fj9ynymMOrGMXKs9XeHqSQCVxIm00/sPJJKQQSexzC8x4j6gdAw2mY0EOWasaTy8lnlt
         jiUw==
X-Forwarded-Encrypted: i=1; AL+hErHq6UOYWkuBknpQpkKlwYnYLdSz/XVownx/rGJ8jrGZ8vu/OCUy0i8e9cAM7JAazYlqX54QU2wQbEI6pOA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9T1tVfefGwjO6q1PGL42cBM1C5ZDum8CV9sxbZ+pJLkSeYXuzE
	rSS6dWJyNPL33vBRUsFGJYoyMEV/B3atNVt+gTNix4qnLnB/WVsM7zTqm0fFVJMOFIah+56nOKx
	xKd3pDmk=
X-Gm-Gg: AYBFou1LhQB8dcCrK4SDOMrTdqn9RVItVH5gxqVy3LAEBOX3PMSEhNod5x+m84MlwxA
	xunXP11K//FuB5hmZ/Q5uZA3wtUCjLSb3UTf96GHebDcOoNfxDCEfC6lxC63KIUxVXSaoQCJrqy
	T/hNnLqpztrgSe94DydlW2cuhE7ROHdZ/Pc+7m3PDY79mpasHMCOte/NogiTeZvdRxe1AldgZP+
	YF8qCuVjLC2X+LHL0bOwktjxh9MCM4Kga6IAIEXG6ZXmiJiREwGsu13T/mDq2q/JIbxIMDhSDrt
	R3TXt9FM2lsjUtNDcH75VHG6XMhYRXCY3XscELkXly6kerp3mJ6bpAyCO05R47fJtjyz/1yPMAE
	c4t9a0BhfEcZd6/g2oZGaIykOdiazmVvBd7sXMsBdQt6uaBVnXzTKyDwo3BaNY2TvMG4UeTAsoe
	HGI6v6N+se1DutUqXRrH9DXqocm7qaonmc3I/2M3DOWJsXpaTaS7jdcUJhxo2dndkO9QrDoNDkU
	fSA/QrW9FTbJVmvfNwN/gnGpWCvpGQOWJVgOEG8E9HIdW/Vccj2X9ixWcM6WyTFpQBjccLiURv1
	lnUbbRprnGzE1ECmguLYXH+6sBmxNCcfE0pH32CypA23sK2CuuKA/qvA2V/MSxuoGHVv9f9DXnN
	yyUc=
X-Received: by 2002:a05:6402:c713:20b0:6b4:329:109c with SMTP id 4fb4d7f45d1cf-6b7c0891658mr5846393a12.4.1794844132200;
        Mon, 16 Nov 2026 07:48:52 -0800 (PST)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c25de959sm4927312a12.29.2026.11.16.07.48.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 07:48:51 -0800 (PST)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so536549866b.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:48:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE9SriSc8GtuJ0SJAxshCoszf373V9DsNAy0QQYrdoZDnrGsLUXV8fh/naeeC5zMIKY7ghdWEX+1udqejM=@vger.kernel.org
X-Received: by 2002:a17:907:608f:b0:c2e:317e:d711 with SMTP id
 a640c23a62f3a-c509638a784mr861145066b.27.1794844131072; Mon, 16 Nov 2026
 07:48:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179480914308.3191731.6125228756396043444.tip-bot2@tip-bot2>
 <avrPcQ4sOkgJPbkZ@gmail.com> <20261116130159.GA1327949@ax162>
In-Reply-To: <20261116130159.GA1327949@ax162>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 16 Nov 2026 07:48:34 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgmkoWHWwaQ6nsGoCiBp0hrpJuiwmoVbQ=Efun8JyUNKw@mail.gmail.com>
X-Gm-Features: AclHuK8IIj-MneOH8L5W6agOUkuIoQlSh4TEbGiPlvCYhRM7OLWTDF_kmyXir5I
Message-ID: <CAHk-=wgmkoWHWwaQ6nsGoCiBp0hrpJuiwmoVbQ=Efun8JyUNKw@mail.gmail.com>
Subject: Re: [tip: x86/urgent] x86/build: Do not allow X86_NATIVE_CPU to be
 enabled when compile testing
To: Nathan Chancellor <nathan@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-tip-commits@vger.kernel.org, "Borislav Petkov (AMD)" <bp@alien8.de>, stable@vger.kernel.org, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Nov 2026 at 05:02, Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Mon, Nov 16, 2026 at 10:40:01AM +0100, Ingo Molnar wrote:
> > Can we just limit the feature to when host == target, ie. to not
> > work it around in such a crude fashion?
>
> That was my v1 but Boris didn't like it:
>
>   https://lore.kernel.org/20261113-x86-no-march-native-on-non-x86_64-v1-1-cbc8b096d1c4@kernel.org

Well, that is admittedly very crude and hacky.

Maybe we should have some config variables that depend on HOSTCC, and
detect it *that* way. It does appear that we don't have any model for
cross-compiling in the Kconfig setup, but maybe  we should..

I'd actually love to have support for making the compiler itself part
of Kconfig, so that the gcc-vs-clang could be *in* the .config file
rather than being an external thing to it.

I've mentioned that before, and the problem has typically been that we
end up depending on 'CC' outside of the Kconfig scripts and
independently of the current config.

The recent work to move the compiler flags into Kconfig itself may
have lessened some of those dependencies, but there's probably still
lots of small details.

But for the whole "cross-compile", maybe we can just say that
X86_NATIVE_CPU depends on '$CC' being the same as '$HOSTCC'.

Or even do '$(CC) -v" and '$(HOSTCC) -v' and check for 'Target' being
the same, and having a CONFIG_CROSSCOMPILE thing for that?

               Linus
