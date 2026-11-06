Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793983496;
	b=lz7y0pAKMMfbEmepakvjZZ9kbjCm1r+Nf82yoAQuMvCGxRYIZtoOuYJUZrYr+lWxfRhu
	 lq+nagFS2fvcOu8ANpOE/7fdUtELInXaxf456MzEtak4g6nUOqIdW3A2yc1zVjW6YnK8n
	 vwtft/BK1cyHlyWjTgaMQzUPU9AlaFa0X3tz1hQW0/6uTppQfhd/FEyDr2HOASdTLKFn2
	 v/Imfy+GlJ3DcwmemLRAl2mjzvQbHsgYp6snpFRgUQhzESqXD8sws5mQJBdipaSfCg30E
	 0L4jOCI9HHLek0pCxjsMXP764RWgw1pXb6gv/7VCqgPQCAtGJpF9IKT4OLX7y5jja8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793983496;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=AkkhwWikm9vacM3XjrJcYU5w9hh7TbvHGqZ6r0PhUZM=;
	b=NsbEW+GnvqH+t431lrItoewndx03brN/zbBbJQNXlpc0oQXanoQBmvmOBh3t4aGDhFpS
	 99lRwUH9GpsKDZc4WRO6JfES+DU8FegNT29zxlVt0dXnGpk8PMDk6ROmjj1HGvKnZdXGP
	 eD1iqBn40P9mjdqSrGCtMFgCt6a2wYK3QDvjAiBz0bPt3R7cUKryYimWuS6zRuzcIZlIe
	 lIVWvBHTbLravn9VDAKUl4SbSr9XB9GWgT/9bE/RTYJ+/Jy/SIkoe3qD7ndT8VXJR0AHm
	 GgrnEojuxm91Q2geUF0IsEEYaqYWk5Y1ro7aZxYdQipEKuVMKffimSI4+kCHQddomkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OP2qMBHr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67C8606A32E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:44:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A67C8606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OP2qMBHr
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so5471425e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:44:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793983494; cv=none;
        d=google.com; s=arc-20260327;
        b=G6jwQrKlBMvW75ORGP5zM6jzzu0GpIiC47R7Yrb+zFHK6rgOg88+Po9Far0nQBAOoe
         qKjix/L94MaI6XxCENFmexuMz5A9CEaMcCk17FIU4bE0+Y4FKnNw7Z8gkDxUGjlPhKSy
         x7Zkq7MrbozgblZoSOTqZdWYNuKYvtJD3v4Pmr8/mtGvvk5fNG/6kk03O4CIiSPIQoA0
         dWke3sOt464/UYK6F0pw9RLClWPo/wDxeElkWza3sCnmxUj6QAR7gcXuaEIAyfyI1OGb
         60msxN3pFsrrmb921yhs3MSVoVSxPoGZc1HpoI3UcLKCrjtunZQr2pnz7MapTkjqdqin
         yFRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AkkhwWikm9vacM3XjrJcYU5w9hh7TbvHGqZ6r0PhUZM=;
        fh=NpGMCbMdNikPJV5jwuoZAQYhdwe+L9v9ICFwHObu0Ik=;
        b=Hr42zLa+KMiuW5yWMt40E37+JOf3PnkdSaiEIg7z3J/LW2VDF7gS7Y8hkrqoqOv83e
         d+bIYlXnF4w5EEacoxBgHO0iPVUqrRrzM4hNxOCmw6HDhkWk2TNpF4H1O80Kgu4PxR8X
         ZCvH2KmgO4+uCH3iEhluI+Il1kAW1YmCBrIXNDjyNPMcujdUSXzc8or+/PGWvnJpGb9b
         yaUdw3qkHZtijMnSuFSje5YdqLumHRdFAbaNLw+zxAxWhRMax4vFvydYAbsZwUs0sLkl
         8UgmINk5NPwVm+RpeMsC9jvVxTusMPaAUSH0b0gZDd8L1H+JTdJ3Gvi0fiNrx+MZiXkG
         Q7Yw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793983494; x=1794588294; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AkkhwWikm9vacM3XjrJcYU5w9hh7TbvHGqZ6r0PhUZM=;
        b=OP2qMBHr9lioDRKtgRhNaWh39ghwFAMLP+ItBQRdo487l9X9yhOL7IL+mgxh92U3XZ
         61z8LnXQ82zOha4YmDzQFKQhEo2kg8C/aH6ISUupAn1DKDNbSk4QFEU+n/a5oykVQa9h
         9xut4hz/rU6/+bZjHzEHzZpdmWFZvw2nsFR88JeoM+cCkCvACENCixwemQW27gWTSXCq
         97IvaV4lP6bTIj0oafsxfNJ8Wi323YAR9IKCKxB0QRHc3uW2758LP9Ji/NGC2lwwetBQ
         Tvn+TVJ3ktAVJPs6XI8YbrxUcr9PnzAibMdrmW0PeEAAWdR9OS0UNVD5Q6pIx0PTO0VD
         yqqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793983494; x=1794588294;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AkkhwWikm9vacM3XjrJcYU5w9hh7TbvHGqZ6r0PhUZM=;
        b=QKi73d17pdm59pFxyzZumQgmP3RNfyRRmu8WbCp8SexKhhVCai3X6z2Ym5KfQn6FGe
         hi8pfzkd2og3Rjt63/rdN2g0wVGBam8ElJWs4EuZnd+5JpWHrSZlRY/xvTUdzFEUWk2K
         Zhv106vUBUUqSo3UC1AeEu3pFRG/RVeX6i1GDzZHMB+wNFfCcxq2FxqgHSnC8WBy9bpm
         ZpPTOWUA73/opgm7VNchGell87hRlXl27VSBrERi7OhRxDjmySWzfBh3DW5dDRSk4j40
         OYXWi6+lDbVsbTGfZhOPbjunZa3Er0iJ/bVLLGyZIxbsZne42fzsoeKmeq1V7ShQ2gOz
         HvJw==
X-Forwarded-Encrypted: i=1; AKwUvBxUVK1J/WjugKx7V4KwKyo46fJSZcXTlY1smQWwBrNebGrnIbBUy4EwkZyNPK2g0QwpOWuon/sbCSxxTgs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8s6lElkzImcT+j7R1S7ZfeI1AwE51nYcAlcMCf3rT/KEelrv8i
	XqBV7aW+3uscRhd++Kl6bUqZShuyUGyV9aApAaPquYKaeZldFOkEOpgu5IsUA9V2c9VGo6c9+v+
	dJLcEjZXK25hfB+NWiEgO5e9quuZb+B4=
X-Gm-Gg: AYBFou164xb5BNoK5iPGC6zkDzLYAj8cb3d8NiYq1h/WGrJxGsBA0if/BCzEM75tTVi
	89rWhiJX2d4hwJDWnR0yzWx5woKeZs95t7axF4xqOkBeRNzCRagaZjeqDDFdhb+rCGPrlhL25tS
	+UaYPs3r5tKc4PXudKOo3Gocd7760SskF6cTh7rNkVwpUc31GStpvxwLG1DpfM4lwyOjD37f892
	ey6BMOUq1j5TKxtoruQYc4PZi/4DWek9iMeQNDBmI4uJtJmHFQ3SbPeNg2FNnlyWcsdI0bLDvX2
	BfaOZgReperqCBi4TuqVRW5NDtFO94PXtLMupV9/guRAh3C6wFA3Y15ujYhwMJDVl9P5ZnOs5wC
	k84EJiZILCvJKNsnDtmcMeyV21OjHkEgCEfz7dNKdYXnTVN9Mv/lcSys3Xcp5ccHMhZCSmw==
X-Received: by 2002:a05:600c:34c8:b0:4a1:f90d:6f4c with SMTP id
 5b1f17b1804b1-4b6de4a6eb5mr56702895e9.7.1793983493852; Fri, 06 Nov 2026
 08:44:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-tle493d-v1-0-3246e91e6394@gmail.com> <20261105-tle493d-v1-2-3246e91e6394@gmail.com>
 <20261106030419.23ca9b26@jic23-hlaptop>
In-Reply-To: <20261106030419.23ca9b26@jic23-hlaptop>
From: Viral Patel <viral8854@gmail.com>
Date: Fri, 6 Nov 2026 22:14:42 +0530
X-Gm-Features: AclHuK_XeKU_SPo2lA1aZ8rEbHQTHoj1b1QTs8FYVvCmAA2aREqqEIZJNa0RqzM
Message-ID: <CAFkCdFyi0GD9aWMUZfx=QrZMg1ezjUDCdRr+LTsD0JMMT1DeiA@mail.gmail.com>
Subject: Re: [PATCH 2/2] iio: magnetometer: add Infineon TLE493D-W2B6 driver
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Nov 2026 03:04:00 +0000, Jonathan Cameron <jic23@kernel.org> wrote:
> Seems sashiko isn't done with this one yet ...

It has finished now and reported no issues on either patch.

> Use FIELD_GET() to extract the 1 bit values as well.

Will do.

> Why do this after setting data->regs[TLE493_REG_DIAG]?

It's deliberate: the cached Diag holds the frame counter of the last
frame read, and the next measurement waits for FRM to change. Updating
it even for a rejected frame means that frame is not treated as new
next time. I'll add a comment.

> I'd be tempted to just hold the lock a bit long and do the simpler
> case IIO_CHAN_INFO_RAW: {
> guard()...
>
> ...
> return IIO_VAL_INT;
> }

Ok, will simplify.

> Generally avoid any use of cleanup.h magic in a function with
> a goto.

Will switch to mutex_lock()/mutex_unlock().

>       for (unsigned int i = 0; ...

Will change.

> Is it same as SMBUS Quick?  If so use that.

Yes, the reset frames are Quick commands (read at 0x7f, write at
0x00). v2 will use I2C_SMBUS_QUICK and skip the reset when the adapter
lacks I2C_FUNC_SMBUS_QUICK. Note 0x00 is the general call address, so other
devices that respond to general call will see an empty write; this follows
the manual's reset sequence. The Pi 5 controller doesn't support Quick, so
the reset was not exercised in my testing.

> Can you add a few comments on what this iicadr is for.

IICadr in MOD1 selects which of the four addresses the sensor responds
on (User Manual v1.11, MOD1 and Table 4), and every MOD1 write includes
it. The manual's write example notes that IICadr must be kept at the
current value so the address doesn't change, so the driver has to
write the value matching the address the device is on. That's why an
address outside the list fails probe: there is no correct value to
write. The ID check is only informational. I'll add a comment.

Thanks,
Viral
