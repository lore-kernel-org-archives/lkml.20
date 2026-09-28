Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B0B35C6AE
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 02:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790563141; cv=none; b=VULf2j5Thg0YPfTlG8k1mKqiWuQ/Drn4bzDbrPW3zlwYOvQwloM0sMHXXYyCWHvNgzUgFz1kIl2bzwA758qalq6zs1B3QP/nOZVRddmHfGUaL26Wdo21QjKUacFZaRRKOLRCJjCRNVRdv8b7AEBIky8B0neFOi6rt/xhqpleG0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790563141; c=relaxed/simple;
	bh=32vTrhXuSPhSuvH6ppfrnrXmUGsMV1jLT/64X7vg52k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YxPqgjCyCSdziNAnT5F5BNQSYMNbiNzvTIjb6dH69XxuFO39A1vcR9f2ws09GMI4fah0n/qD7Hi8HTlkgT34pQXD6B4x+Po0FRc9tFDv81cUbjU+7f+0NxhYxz0ST2AWx2j3QgNajIJOxM821pOcitrCvcZdz27g7Jn6mwkGWWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FO1T+g2E; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FO1T+g2E"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-1460bcc512eso1193358c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 19:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790563139; x=1791167939; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hohreTZ1D5kmhWyHdWg4gFGwuZ4oX9gPFnSKD6YYJb0=;
        b=FO1T+g2E80H3X/WpQ5bwXJxf1h28sDSPw4TPA7BP9y1jAG2ME3LqzqMYG/325IDtuV
         d/6MBF8L3gQgaqhcOVtkGnasb6lbbtamuzFXeUeV65xzNOjqjczHk5mIKtc7aiLtU2SA
         30noA6f9o9jkJPqsSbVkJfStxvHnQVrE8GKL+NXTrRk6e+nkX4LF0MwpFminrZyIPKmF
         uCF6V8l3g3cO3PRGXLGOpi7LoZYb54TstBZUcfMFiEQP62PeJ9sGvqD//ZEukxDQHxsQ
         rpGZU+s3VC+1uo7iEojRYR8w7SZCEv9Few0v9FhuicsgRodiLzgpQwBKU2HLjFQ55wRR
         BesA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790563139; x=1791167939;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hohreTZ1D5kmhWyHdWg4gFGwuZ4oX9gPFnSKD6YYJb0=;
        b=N8nrFee7u2ZB0AvNT2u53VQ6By577OKblTehq2g00vjRq+JZZvNo67Vp1rVFgwmwvY
         R6dFuo2kK/UitMjz95C0HEggx0ebFssj5BZV3i7ELEiUziCaZMFQQYWgAmXuyKA2tzGo
         M7g9FxEcH//YbtoyPMnJ03eRWHO8NO0zxyzvdKvhCy0z2uyEH1ko4pA4qFx9o7I0umo8
         leQocrjELcrK+djHTqj3cKUWLuOGLYeadmmuYEJt97ac+MXafUWTTvNB+zmbLDXbH3lE
         8i1aO8VDYw1po/99nij5vsDNfz7FLZGr1FcfVbzxu+mnyEY/vxr/+mqcCZ1+mF+JZqCi
         bQiQ==
X-Forwarded-Encrypted: i=1; AKwUvByrpFxvBUlN8YkP/DIp846cvRevodqh/UcAEwCFFikgGF9qYFsIHzwVHox/UNhGbn8QXyEFq7v4c0tHjlY=@vger.kernel.org
X-Gm-Message-State: AFuF++nyxX7xBaLdeJNiARVWpMlH4RUyb7qWI+wsTWWqWA0eM/5N/HWl
	ZxRWEi10vZ626kS/DJ4t2EKBNSmYZR2XNgc3z1/wlGwYaaWBY/paCU8go03Z7DRg
X-Gm-Gg: AYBFou33UHJkudD3KJzRyIkY7WT5fWJlxyflopckYskJRgC3qzxOECBoZOuL2M4scy7
	8iMHr7qsgFCaZIx/0N57wguKu0jVYPNaAXpe0tGBLxjpV0WY4XxKg9vjjbsVNx9iByPUCSl/dka
	FJLrnuHbFB4zlvmdVaxpInSRG4G6rBLJx1Ef9kX3HYxpLT0aFZkkD3bLBBvclx3fBQz8WG9ZwU0
	y7BtVKGt5UPM49XON0cySQocZy5ThzXdAeUYURtYMJbzNPsUpgNiu4no9x2L/dGpYm2GNr0Spgu
	OPT0muZIFsSfmiyFK7KUb/BjZs6ntkiFf4GwSwaX+SciWdtDXDWJNabcCcYh/n1/6Zch6pR5+zr
	O/E0vtPr/CoY9CIeCuOq0SgHgCqoKyXfQEhrmaD6F6lVacImKiL4D3RjJZMICa2uApPUGKGRA6C
	hMoQGhhcK269qCF2mpauj2yJhHyPoLV2iZ3jDHTn2u1XGwBHeBlRxlU8LZ9eKbyG0yefa+i2+jZ
	SoX4p5QorTzGkGiHjmNAODbWioJOovI8B/cHz7f
X-Received: by 2002:a05:701b:2704:b0:148:4d6c:2018 with SMTP id a92af1059eb24-1484d6c2790mr5162472c88.22.1790563139078;
        Sun, 27 Sep 2026 19:38:59 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:526d:2f94:503b:aada])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ad9e097fsm23406482c88.13.2026.09.27.19.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 19:38:58 -0700 (PDT)
Date: Sun, 27 Sep 2026 19:38:54 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Pooyan Azad <pooyan.azadparvar@gmail.com>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Muhammad Bilal <meatuni001@gmail.com>, Herlangga Maulani <w1zardsec@proton.me>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: raydium_i2c_ts - validate report parameters
Message-ID: <arnRiZyWe6zmd68S@google.com>
References: <20260927114425.442803-1-pooyan.azadparvar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260927114425.442803-1-pooyan.azadparvar@gmail.com>

Hi Pooyan,

On Sun, Sep 27, 2026 at 01:44:25PM +0200, Pooyan Azad wrote:
> The controller supplies packet and per-contact sizes used to allocate and
> parse touch reports. The driver trusts these values without validation.
> 
> A packet size smaller than the two-byte checksum makes report_size wrap,
> allowing the IRQ handler to read beyond the report buffer. A zero or
> undersized contact size can cause a divide by zero or make the contact
> parser read beyond a record.
> 
> Validate both sizes before publishing them, and reject reports that
> describe more contacts than the input device has slots.
> 
> Allocate the report buffer once valid main firmware information is
> available, and resize it if a firmware update changes the packet size.
> This also handles devices that probe in bootloader mode, where the packet
> size is not known yet.
> 
> Finally, return main firmware query failures from initialization so probe
> and firmware update do not continue with invalid report parameters. Keep
> bootloader HWID query failures non-fatal so the recovery interface remains
> available.

It looks like there ate 3 somewhat independent changes. Please split the
incoming data validation from the buffer management and handling
bootloader query failures. I think only the data validation needs to go
into stable, the rest are regular behavior improvements.

Thanks.

-- 
Dmitry
