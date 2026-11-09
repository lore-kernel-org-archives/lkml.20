Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794254881;
	b=QvBwwQtPU4zNkebIqtwZXgW7tW9KxJhCS3UFU1Dl985+CwDwKR/aW/IJOEPx8Q3wMqsh
	 zzzWoVwHf2M00frlPFLgQCfUwzDhwN2sMQEjbQlz9I5bvI30XgUtWtEaGf9Qsd465kLy7
	 F4M0Saa77tjkP6LnUzoVuNEePsSK411lnmByVLb2idNwZpvUBw6plrmZSeBX4dYeC+VVR
	 yUQd/030Hj7nz2LUci3fPf4z558b5D+iZV8pvYDcdGjdFa8jckbKSRnqkSV0DOCWpdCWD
	 plfP5Qyq8GaxAV57rtz+GJ/lxdRNo/DF89ZlprEruO0J1V9itjpAVMO8qTX/U1ZgNKg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254881;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yeH43vPcTrmxtvR5EDQeUYlZILsKnLUoD+qsoobC8Ks=;
	b=Aj4b8IuzAT7VukwUiyfy+L0Uy5kjwSuf6EY7vGB3EVvbuW3giOGFA4yRUK4y78KpkB4c
	 HlBzhStFR8+IzPZqXDKzJcVbcqwfDp+OcwcKDa/De0BuLYnV4QnE/Ei9BTnDGaaOnfbBV
	 /yT6QNjK4PY4i6FIygJsstqxm/uyFnfd0T3+7R5WriGoFcBLUsF7FcD/3hvplDARGqANZ
	 mRbfvx6S8YB6Mr85mTVgFXEzINefC60CdW0ps7wo+w8nWC9tePzFzj2faMH/k4qEHnI++
	 seJ+L9AXCqsB7y3Dcpr6xFvcAv1PTdC7Lh2yVVOYgfcJbLVuzXDXfR2h2fhEbov6AXg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pzS5K1aj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E41606A32A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 20:08:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2E41606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pzS5K1aj
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so2526405eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 12:08:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794254880; cv=none;
        d=google.com; s=arc-20260327;
        b=nzwc7eSTvhW7VvqvScy0SvbyyBq39X+d8fIGTz27tQvXM+X/zlBjqMR2HV2jqxc/yk
         2mYdEOh6/6yaJ8OJf4GZD+/A5VDr631yuw/Oljay56a3kZ4FoZJmZYqZsCsW2oXiJ67v
         l+fMaOvDYIftdlV2A2r1yiFqhepRiXSweaVV+sXjFk+uJnlJ1SdyyRah5qwLMlgjvHMF
         8c9vES4RfCbzAQ4CkodO/0HjSLhkuzIoR2pUeqIJQnASFWb3gEIz0ngz5ycQ3x6HKgZi
         Edp/9Z36370qawWBcZYdHjGPoR5DKIUusDRZUmoYaoHJjgHniuGgGbU/15BRBuCDJM/o
         PO4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yeH43vPcTrmxtvR5EDQeUYlZILsKnLUoD+qsoobC8Ks=;
        fh=JjjgWiR8qZaOKgpw0CoOAWHJiTrWcaEKv/b3g6pelwI=;
        b=JpAxd1TeDeQsaeBv3e/doxaQCnhyZvRLXt61eAJkuE/9xcVEvuhO28ar+c+/qVdUjA
         LQVA4obq3D8el5nNAz8TzjlOQfrdr3YjHqwwIj92nX2MZiMiGrbsQRP8ncd8w84fRfwP
         UbwwHYYpDfi7771YXL0l/Dc5ieBrtCk/FTHSL+F6ZI9Df03gHoXqVxVu2tPwcaYaUVkc
         rmr1Axf0TEdvD7qvIxEMmH30uPUYv+c4XNejQ5LOeExs0kDMJFFTOeMxoHtZUas9IPQo
         j05fs8ACC4VL+Kll9YU3CF9OoVKLcyxHWbi/waU45PTRFt7GkPzv7fbmOgZYBf2OlOFS
         F32A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794254880; x=1794859680; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yeH43vPcTrmxtvR5EDQeUYlZILsKnLUoD+qsoobC8Ks=;
        b=pzS5K1ajLL/ysho4dWDbqN799r7BUPcJItNm2WKd6HE8UbQZGQjHIWxpYuIVy4jY8J
         deWaSjucO5x/RPlLk0GuknYJI3UJrKe1/NgsXSy4p3PsNNGUm7H+98ywcrlse/vl0VKx
         YgOIaeKyw/ZUq4vwO3OnVq6kCpx0LxNb/nKpSEdf31x2ktnyCD3PmcNscntsjmbY0wKE
         r3GWBcb+0VNzwuGVD6wNzdwTPDvf2nB6Anu1yIrUhC2qbjxq7YnjTr4yBQtDexFxsqVB
         PovRMTFdH+7hCci+7SyYYWMnne0bVOb+4XrJ9pKpKbIQgRrUeMWMBf1v5eyS6EEwy2bA
         KNSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794254880; x=1794859680;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yeH43vPcTrmxtvR5EDQeUYlZILsKnLUoD+qsoobC8Ks=;
        b=F+dv+ncUiRF0QNt4lwYCbfngaKl3x5toe/mGw4/QmZchlygeewKGAl9op250/Xmz96
         lAolDucqb6AUsignBhdL8BlcLCewhJhEWBwK7aC++HA6f+v1Z9ByXjObvAJLoRO1Y+Lf
         FdrB3RJIgkwwIzokdLq6mYPqxth1jSEVmSgAu7P6c8/qNUqGSenC44HFcf7qpa67EXV8
         UUwCQPkXXMzaJe+Ixjat8/cbrWjolDPJIYTxouveYVUz1q5FKywPZzzYpp0MIylAwfB/
         baXNAD4eKMvy9AzLDhTxzbYcHGwzm7Ao3AtgaSK+NegdPu91XiunXBz9PuIw19VBbKHx
         Ts2w==
X-Forwarded-Encrypted: i=1; AL+hErFh03MLPcicTkLEjjayGL1aAJhhUyPCEEs3dmeEjlZiuTzhzDe4UAX6AXw/avdyWEo9WUxbSaaJOypZ+PA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8iWZiZkLHhdsdx3fOZJZm2dwBoo0q5mHzd7C4p1SqpyI+0yskF
	48Y5w7BS9m4BcEwjW6eWVrgpEaAfNlUDjOsffm1jntH5LqvXocBl76xHIW17jaYG11fyzNkOvCR
	bp4UT9ZPjLt6kK7TaMxrasZ3Y5nx8mg8=
X-Gm-Gg: AYBFou2aTLDu+xk50DRRtDDBEnA+bIWo+CfhzC/xe4WY3f+r9jDHL9tLKc8iuUOl6b1
	YRh8iWgpZuwATeX4yV5CgsoOL8alu9tEF4zYAZK9Qg4v4og+leQuJMG17oKT8hV7KsppmxBmj9W
	u1qL1O38hObeZclYLiJjFG+pSduWhBgWFJzraLW1tAE64lP320I0GDa3EOtGRT5ep41BzE8YvvO
	U4Af14XgqrykvPbzMpg2RKLSVHlhKcym3lQw20KChUtlkGhC2/5wnnseKKYnOyj1UsJy2gRvk+Q
	oKc0WpbWotVcs2p+E7Bz2Dj6oqsCgwE1wFZiyYwHk2qqHDRgjqHmH5fIO96EWHygqBotLjsL0S8
	I9S0IjMO/LEvoUT7T8ZxlyMJ5X5dNi0iC/aCuI9TLP8nR/kDGKElFnJ3yXzJ5g/HP9wZx6A6HTn
	3g4FjuTqBu8FK0KTlotGqVwU3M7WYFpqBViLX2AYZhueffcV22bJY=
X-Received: by 2002:a05:693c:639b:20b0:369:ef92:bd7b with SMTP id
 5a478bee46e88-3752021a4b3mr405313eec.41.1794254879591; Mon, 09 Nov 2026
 12:07:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108094253.83899-5-clamor95@gmail.com> <202611090518.mm6yt2nO-lkp@intel.com>
 <avInQ08dVrsc-Rbo@ashevche-desk.local>
In-Reply-To: <avInQ08dVrsc-Rbo@ashevche-desk.local>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 9 Nov 2026 22:07:47 +0200
X-Gm-Features: AclHuK-uW4-VZbHI3Cd7Hqy4mW6DNnwVcXugR9i4sn8vPx7NjzrQMM_Kf1jGWpY
Message-ID: <CAPVz0n1FqXV-XXyBJpnp1ivd+uk6+zGvngobQZfUXMNBBPyORA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] iio: light: ltr501: Add support for the
 LTR-659PS-01 proximity sensor
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: kernel test robot <lkp@intel.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Esben Haabendal <esben@geanix.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, 
	Pan Chuang <panchuang@vivo.com>, Hemanth Selam <hemanth.selam@gmail.com>, 
	Antoniu Miclaus <antoniu.miclaus@analog.com>, Nikita Travkin <nikita@trvn.ru>, 
	oe-kbuild-all@lists.linux.dev, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 9 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 22:04=
 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, Nov 09, 2026 at 05:48:09AM +0800, kernel test robot wrote:
> >
> > kernel test robot noticed the following build errors:
>
> ...
>
> > All errors (new ones prefixed by >>, old ones prefixed by <<):
> >
> > WARNING: modpost: vmlinux: section mismatch in reference: trace_initcal=
l_level+0x28 (section: .text.unlikely) -> initcall_level_names (section: .i=
nit.data)
> > WARNING: modpost: vmlinux: section mismatch in reference: __arch_xprod_=
64+0xac (section: .text.unlikely) -> initcall_level_names (section: .init.d=
ata)
> > >> ERROR: modpost: drivers/iio/light/ltr501.ko: symbol 'iio_find_channe=
l_from_si' undefined!
>
> Forgot to import namespace?
>

It is not exported in the core

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/dr=
ivers/iio/industrialio-core.c?h=3Dnext-20261109#n319

> --
> With Best Regards,
> Andy Shevchenko
>
>
