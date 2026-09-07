Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6A345DF71
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788777267; cv=pass; b=RazWew9xh47CSg/6JBRLqSDzfnThzQ31i3LrvApt2sKbVgEcnNp51i0398+WVzxCuBd9eJ0SNcx+oyHO6sDZdrqlvmKqaqw2Vmogl1VOBfzKVRjVNY9uKkDzmfyQ4W/EFXMkWVpBfeEHSbvc/TbYn7LpuyGqKj6TZOCzynOixEU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788777267; c=relaxed/simple;
	bh=+yS+OWDWHgj8L1bOSAbU79jIY2VHoZj62mLc+Oc2Vlk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hq3pUsNMLXvQ3jZ7NYXUDEJwzPEPVbFDlxsWt5QmW5En2xUkyNqDyixpsbzq3htS1fOR392uFficulKumgb5smcoYATsELkbIh4JbZRacGS6hxAd1FRja7VK+jXSmtW5JFYY6uAtC5muj2pnAARQqLR+0T7Q7wz6xUYxvGMmLG8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IZn095UM; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IZn095UM"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a60591bb18so16969a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 03:34:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788777264; cv=none;
        d=google.com; s=arc-20260327;
        b=J9UaIGfLshhYFyDawCYB7oJJix7/sul/CayeZ1pbQusA7sj5Q2l1dLMFfV5SG8jOJm
         PfXtPrZgyNVXUj0wu85t/sxXrFmWe0U15Pc9K12rkT+TrPxqH5gR88gvZlgIomd5ghn6
         /QBiC7/RtE/V4mVyl4rWzB3XhBGtEz48O+WqHpMiYAN6VuXYONOzM+qH0o5+wSgbhyYq
         VkWViMlgfi8n6TJ1dzVhKMj2CAUpvYgUyvWi4jDTo/q4yrJj2PRlRab3skpJItgz3k+7
         5A4W76E47ee09O1s/hRkxqr1lLnAKkhzmE5653OXeP/KRKBC0boT2QylgXw/d5FrM5lW
         8FGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+yS+OWDWHgj8L1bOSAbU79jIY2VHoZj62mLc+Oc2Vlk=;
        fh=dEMxqKFJGmgYluIqeb5NSxsLmevOFeLOZvzYIxbZ9+8=;
        b=kjXCuizRjmxfblBuT9Yj/y7Std1o5JIGLAFEx5S06HyM4YsaHxjKIm4zeJKaLJf+Vt
         FQfRQh05Y80BGgantIAkBTF/QLx751qkHSyAUeHGRAOHRy81lebqFFBfUPMWm+yo3tNs
         tV+J1lSYsgLprJUBLE9UwLpObUM8LwzOKdFceN41YT8jvAu7c5sozHVaxPoFoSkfSv1T
         +FCurROslfTH5r2h8VnxRlLQr//mNpnheemLxzDmPFbWCTLemjBU5L+KqCPUYHFrwGCX
         EVKZvd0UM26878yMXHUsPWYM4MH4xnAsEFz3XlRmLlNXNsGpIf2aah9OGXFek4pA8Aa2
         dE5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788777264; x=1789382064; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+yS+OWDWHgj8L1bOSAbU79jIY2VHoZj62mLc+Oc2Vlk=;
        b=IZn095UMZppKejO7xWluUfNsRQLG6pAamNXLKTIH8yO7tK/QVLuFjrwSdRrBorK/1/
         nAYqJdjWITzkwcm8+S1MY+Z/TYzPDSvgaDNCij9ZKn1Vf4ziNGArQCDnbknFXi29vkJm
         7FQXbeKLq5IWR0cQ62+OElB1VDCEPLFcUMG3C4xunXDYNST+jfWnPMQ1rDVr8YPQLUbT
         xwdEgaDFTh5rd/L55cZFMYjbh7z04qsMGNBwy2Am6jmbjPyvlHI4ZPQ8gFv/nrU/Nzi1
         Eft1RbDsdx38C8W8Jfv5SKAEdbwbCKRVud0dOl7wGwP9DN3MrSKKWkE9H2mJ/bw5RHzX
         Bopg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788777264; x=1789382064;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+yS+OWDWHgj8L1bOSAbU79jIY2VHoZj62mLc+Oc2Vlk=;
        b=jrUu/Ofk3MLezU8dv9W2ZwDDM0kETDTufUS24/kyldsWVT71pwh9OY9JW16S6+npMT
         Ou8LEZFgwBE3NxXQrf90AjMKBepn2H2Up7OhQz8KOrJfasBKy1aa9DODQvpuvJy/ut3T
         Rh+KGA3Tl1Wue+QT0dASIF3lnzxKCmhLIJE3YU/EsYOqBIB9uMycFRq7VD3zak3dEBjL
         VAq55dPZFNYtn8vtCDRwVG+2I4B3LQxq44Jw+vgEJlp0pTXUYaCEi15mwcOhTbeoBitZ
         joIJaplJ/TlXumU+TuXW15XlxY44aIKwo1tLbZi2NTTgvxo4P6Phe8VhKKEhMYlRmXaU
         JLWA==
X-Forwarded-Encrypted: i=1; AKwUvBwpZ7vztrDnpvuk6IPIiifueL4kRgSNI+4VYdmsvZDLqZLpV/MMBFkEEnFupww8wa1/i9t6mbvjF0cXD+0=@vger.kernel.org
X-Gm-Message-State: AFuF++ls4ngM19Cx/Meiv7V+Zs0g6UdvwotrBltSBkK8o7M+yfrvKL1l
	8/3t1NXSCRcAJuej0OJtAK97BBzcAmnDEx51TwlUcL/BZMTcI7J5lC+KcA20pp7NAQp+dZ3u2hJ
	uNPQ8wg6ZYJTDKWqgNA5bW2/C2aylUJo=
X-Gm-Gg: AYBFou26zCn36uDIeg6wysf+L+4tsDIhrz4ujOpCvUlLdBKsjR4j84BeGdb8MOqcYsW
	YXMsTSDRmcNT5T2C6ZjfRxknQNeB4UzkW66hKPH5kCNOPqji2SJ15EIJ3Ll1PhuzvXdOqRll8eT
	Jilik9u2hYBhJjKM4tBbFefRYGPnKp95V0vXWK6bUzUFY+rWSmN2rhgCzj6fNAJkLIYRgReyM2R
	Dqv8Wa4ug9EK6cVdIaWC+BGUaS5+HJhcsdWj5CWdZg0pJ4kxUuC9LgesdXT5ftES7ktcy0o6B/p
	2kRQzkBQmIB9ZhrB/99i1Mf/mdMv4OErseGhaa18lkWPSfWKH9h2gWg6XI+QY/Ee5Lqai7IX8wA
	UWrUsCHVQZ8hQZ3S91HIQfVxMZbPXMWXGnOWO1IbVLpWE/pOOcEotApc/2A5s2TNeXQmGkGDZls
	5CM5oI8c3vrV+AYWl6pin7TrAWyejh4f2w
X-Received: by 2002:a17:907:3f09:b0:c25:f7db:4bea with SMTP id
 a640c23a62f3a-c290446b88cmr6398466b.16.1788777263623; Mon, 07 Sep 2026
 03:34:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907084319.351688-4-blum@kernel.org> <20260907084319.351688-6-blum@kernel.org>
In-Reply-To: <20260907084319.351688-6-blum@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 7 Sep 2026 13:33:46 +0300
X-Gm-Features: AcwNN1VffgvnaRhRlD6uHBYo6Fl574uE4g4_q78txLgAdLn8cRR-VrD4lzKeSJo
Message-ID: <CAHp75VdrNu_7JzfrXFEv=ALoY4x07xD=Um8NxyVPNdiOk2fmGw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] platform/x86: thinkpad_acpi: Use
 str_supported_unsupported() helper
To: Thorsten Blum <blum@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org, 
	ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 11:44=E2=80=AFAM Thorsten Blum <blum@kernel.org> wro=
te:
>
> Remove the local str_supported() function and use the common
> str_supported_unsupported() helper.
>
> Debug messages now use "unsupported" instead of "not supported".

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
