Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14733F1ADB
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957990; cv=none; b=GW85Po2baBAdtIMi3OVAqFe06u3MLaF/2S7pO+q43hnKdnwO/KFebM1+E0F4wdX7pOc4t0L6f+Ic5LfRQGafm1pMl84zl9lJk+fTVElnplEVdSBigF0fdxcA+anpXOhTFs3MBZvioW6cQXxBWRtKljE8uvzbAr8yYb4F1Lng0bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957990; c=relaxed/simple;
	bh=+2j4AKVOCmiCv3B4/UniinpKlgAIf0kjIps8z6AAMXI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kf6746D7BXw8cuQpScX/x42j/gLOlR4HrcmNhEOTDQiVF/DrAKAZ05Q0p86ralVA8pmEi58DkY85N4i8FMn4+NbANtNL3F7A4iDCDVuKo7k2qEsizkSwFaeyXlAOze6S3kZ/o54q3zqKq+HXIxseE0bjFkGsXhjgFWHaG1zW4h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZvIYAPrx; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZvIYAPrx"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so5401175e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 05:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788957984; x=1789562784; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hHXdQU+2nyNy8Rq6Z9GonQZ8Ld3gseEFdGRUMS7w87Y=;
        b=ZvIYAPrxg+IMMQiO7tjJCyXox77HhpaPWYZbV1Hv07G4Ae0WQvA5tpuBpT+y7eJwgx
         OczgXhr6BRPAvDlUG5vKvl0yg0EJ3GPLLjqH1zDE2g57qexun+X8LgOAMxS8DWg0MZmG
         TYxLqPKKWAILGp92SwRxfxWOcg10D/c83JrxU7uByvpN0/H/z0BC8jvISc/J4FbnlJQb
         BkXY6SFgJPoEgYwgoYVOE5yxru+cCCw8v4WNY7TaQHBfT014zYn9niV/gIYKDzoplWNe
         a9/Y15twerE6kfeJGX7vQY8k46iqghRsziMnS87vEsZ3X9odWC6czOi63BIyAnUUyTx3
         w7aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788957984; x=1789562784;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hHXdQU+2nyNy8Rq6Z9GonQZ8Ld3gseEFdGRUMS7w87Y=;
        b=VfWI3pTI0KqF4B0fa651FE6DVDoZV2b+v2m0co0ZckkwkG5yxGcq0x2iEyK//0FGgr
         zRfNz+B8EezOejhWLGZXOuMGnBQ2gtSJ2EmZytT3mHnStXXL0A9icUBCgAYp5xwlWQtd
         2FjiaHPjI5s3RgFd1Hf33uIdee0LhZoRKFTVYfEAb1Z2s7x+nm2hv0T6LWhmzf2IvGMj
         2yTb010E2KBn20D0f4IgxLNRhIvmBCGp4Jh58s8JKDK1/7Xl/kLMUL6wflYeXDBdwMwZ
         5h3TcGWKaFzO7xTqU+pVrEjrY74B5rcxi8GZCKy+X/xbM9iTZD44Yq1Df47k0uyxA+JB
         J/og==
X-Forwarded-Encrypted: i=1; AKwUvBz7oy76O5LTwkMKr1+3zRBhSDE04NrRt4rCtpyoKqE4D6QNEv0pmhmxXt+uYS2VCtfRSGzsIEnubGWAL1c=@vger.kernel.org
X-Gm-Message-State: AFuF++lrEDmiTBliWghEGzddCMcPnacBx1RlMJnoJpv/YS4dRTmTh36m
	2twNEMrldLCz4tNkUj6DSjYqM1jYHk8VwWZfYL2kZURxEZZnZNg3dEMu
X-Gm-Gg: AYBFou0qe0edpQlJJ+t7UAAFMzLm5HY/1SUtHRXaGtBmvhOiulg2c+EQ+tZE2W9DuIY
	Pir1fknJNxEKgutmk8LCz3hgouoNSmtLYrsHGfUgJnhZmRlOHleM2UKRdGeelWKKhqhQIry0KFs
	a5CgvwRji0Ydr3i2un326svl/EihXvVxXeHGYQNNwH07cEOI4E0rX+pcvlO8PG6yilgaicIofQc
	MU/nIL4XyGNWuhYDgvUNyoAabe5/zmZBIlarT/mnapb6bsIdg/7Am1DiAlGseGpgOKpKkg/AdYO
	kw9hb1NsGdt9vnSkWM9hqygd2jDG75/RpmqOfudP1ElCjkRS7sW/A+y9mleq5O/BawMSW0DZZT5
	gdDLDgTT+PX5SfpDWS7RbWSh9Dfv0mVSEMFINU9Wgkd+zyc3aM79QTGun0HvxPpSQf5bo9l+wVZ
	pSHxnOl2hBEdM64jkQD5PIiPy06LeiEfIyUhMIYYyzjkLFmMRvM//zJNNUsbvWuuEjcJAW6WcWK
	rS2NQYhQFshWay4/TTlap5koJ84/O93dM+p
X-Received: by 2002:a05:600c:b93:b0:499:8174:9f39 with SMTP id 5b1f17b1804b1-49d1f0af3d1mr76721715e9.0.1788957983568;
        Wed, 09 Sep 2026 05:46:23 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588392b3esm49500308f8f.12.2026.09.09.05.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 05:46:23 -0700 (PDT)
Date: Wed, 9 Sep 2026 13:46:22 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, Vincent Mailhol
 <mailhol@kernel.org>, x86@kernel.org
Subject: Re: [PATCH 5/7] efi/libstub: Output UTF-16 directly from
 vsnprintf()
Message-ID: <20260909134622.3ac54b52@pumpkin>
In-Reply-To: <20260906130817.1151961-14-ardb@kernel.org>
References: <20260906130817.1151961-9-ardb@kernel.org>
	<20260906130817.1151961-14-ardb@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun,  6 Sep 2026 15:08:23 +0200
Ard Biesheuvel <ardb@kernel.org> wrote:

> The only remaining users of vsnprintf() in the EFI stub are the
> diagnostic printk()'s, which are emitted to the console and not recorded
> for posterity.
> 
> The EFI console uses UTF-16 (or actually, UCS-2) natively, and so all
> non-UTF16 strings that are emitted need to be converted. Given the
> stub's vsnprintf() support for wide strings (using the %ls conversion
> modifier), which uses UTF-16 to UTF-8 conversion internally, the final
> conversion to UTF-16 needs to support not just plain ASCII but UTF-8 as
> well.
> 
> This is all pointless, of course, and it makes more sense to use UTF-16
> internally. This removes the need for UTF-16 to UTF-8 conversion in
> vsnprintf(), and given that all non-wide string inputs to vsnprintf()
> that exist in the stub today are compile time constant ASCII strings,
> the need to convert UTF-8 to UTF-16 disappears as well.
> 
> So implement efi_vsnprintf() taking a const char *fmt as before, but
> outputting a efi_char16_t[] that can be passed to the EFI console
> directly, rather than via efi_puts(), leaving the latter unused and
> therefore removed.
> 
> Note that efi_puts() performs LF to CR-LF conversion internally, so add
> this capability to efi_vsnprintf() as well.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
...
>  /**
>   * efi_printk() - Print a kernel message
>   * @fmt:	format string
>   *
>   * The first letter of the format string is used to determine the logging level
>   * of the message. If the level is less then the current EFI logging level, the
> - * message is suppressed. The message will be truncated to 255 bytes.
> + * message is suppressed. The message will be truncated to 255 characters
> + * (ignoring surrogates).
>   *
>   * Return:	number of printed characters
>   */
>  int efi_printk(const char *fmt, ...)
>  {
> -	char printf_buf[256];
> +	efi_char16_t printf_buf[256];
>  	va_list args;
>  	int printed;
>  	int loglevel = printk_get_level(fmt);
> @@ -141,10 +63,11 @@ int efi_printk(const char *fmt, ...)
>  	fmt = printk_skip_level(fmt);
>  
>  	va_start(args, fmt);
> -	printed = vsnprintf(printf_buf, sizeof(printf_buf), fmt, args);
> +	printed = efi_vsnprintf(printf_buf, ARRAY_SIZE(printf_buf), fmt, args,
> +				true);
>  	va_end(args);
>  
> -	efi_puts(printf_buf);
> +	efi_char16_puts(printf_buf);
>  	if (printed >= sizeof(printf_buf)) {

You missed that sizeof().
Be nice to have a note about the size not being in bytes.

David

