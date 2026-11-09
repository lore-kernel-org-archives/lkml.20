Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794208446;
	b=YrEpOhd7O/DTQBVtUyNjsUI5vmeGVDgm2yeE/k4Y1G0H822Rkj4CGK8AYA6PClgMgXy0
	 YWrk39hqE8fpLaeo9kepnKYynsyhsz01etzYw+D5NNXPU6qjpCZfBwrwPtqDU7+4SYoaG
	 zITdmP/V74CTZiBTPu9mZ7R1EJOorpfg2h4mU7RemL3GJZ/slG3UW/hVi2KXAWGApLOk2
	 b5rh0gyiqUU7YUIB/8jv0NuMJH47HuvEHedLskx0FaafSbSW4op2Oq0wtwYmwdkDCaFx2
	 DfgR5GogReahy2+Nfbpjw/sTt4/Tqe3t3bjX/ywx4/rF1gila/hm//aP+oqwOegvuCQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794208446;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=p8ohiQBg8UgGzEqawbRCebSefr/a88QyxtuULNgZzJk=;
	b=NknXyIkbbEPg4xuAaN/VpPNN/p4oSq2hYsp7jG+8+e5OO2tsyHfTlIyqpn7/zgyMXxfe
	 K2jEEnIQBcKHsarO6oUCBJfW9xdUrONQiS209BcY52nLvEJM/xz1qCa29tc24U+Rfz8Rv
	 AT9rrL+X6FERkRT495OoB5932FNR4Bm/1G5PPRoZBRSDHdiHvfL1aYT7yC4EjPOQJ1S+K
	 GXJM5m7UCAmuRvmxjyBbg2V9YHOTaOkXVHHmqloOkSQIJQ7wFwN/Onc6KBSN7jBD8JnS1
	 09Qw41CTt1leEKM++mpVu7MaBdBXyhCzGj234Cm9/HdFZpkwqOHUudPxBdv4ZG/uWeA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Iutm2nf7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C98606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 07:14:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2C98606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Iutm2nf7
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b30477a320so3240727b3.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 23:14:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794208445; cv=none;
        d=google.com; s=arc-20260327;
        b=UDAK3AdRDllBYLUISNozt1NkOfFoNCjB0RP5tfIkBdC1SiKSTY8BnNpOd9aHYlXqyx
         9wViLoc7TMlsMezn7BvAOsz3qBLFTukEmZGw1AKo0GxLYYPYTBm5c//B+YLbramr9gnn
         qk4BnGjoeMMFkgPcBJPaWa4pxYijkGOO113FzCNBm+ci4KK8hVI7OKuBWNXIatdD7xvf
         vKNQBh6rPyqjQbXgZgZ3dFIty2z9izOUoa7/iGMq93wqqEi5b2djBYBHgLgGfyWYCCKY
         UaNfLPj1mcZstY5kdwzxcGF/Gn5ALpGb/7Ausdgvyc++PsPjk0UAd3xOOIKV2GqLtohB
         +1HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p8ohiQBg8UgGzEqawbRCebSefr/a88QyxtuULNgZzJk=;
        fh=YXot+uiXok5t2FmwVARMIp3ogoA8Aoj2hQCw6X8U3jY=;
        b=Z8zAiWjo1Lkw7wU2V+Pyat5fcJI2g/erdR4kCk2IFoyDogEfCMJxdeZQs9QHycrpti
         z3OJbJrA2b7mC62aU2FsjnSxcX5EHHDlEqRO/iD9sjTOzBmUSzZbI/cTHV46J5d0ye+I
         3h93TLHGEEhLzD/v+n5iwrwUsu27WmmqciAEsndCziJ7qgueCHvHaBc4xqO0WM5ZJeYx
         Cxd9FGb2eYgg67qYCqfplRefqspJU381hl3kMoaBqQMpeU0EjiQLPQKqC8/22ds9Y+SC
         anN5DLt7WPyIg8ELRR4w695gffbTAHTZ+mbnL9RSH1Amabz+2LgZ/GolT1GJlowe5se1
         R4tQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794208445; x=1794813245; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p8ohiQBg8UgGzEqawbRCebSefr/a88QyxtuULNgZzJk=;
        b=Iutm2nf7MPuCjo82TeOmREBZHH665Hyf8H1vg8zjwCkCU9R8CUDUuGfOsoae4Q1+0a
         7TLbhra20Hwu6gbjIXPxuChjIBOX1xldHXFIQGNMcKvNz4sbPa68A9QYt7cVqzrqmn69
         gkl8PpyMylrGSzra7OYHsDtZaC5VRZM8j58aOrZ1VRjxvbvljaHSO1O7yeVcyvaEB0rC
         TIoo56EhZlkdiL5Rx7y8IrDmMIkRzDt5978PzF0F/kIUPq+l1Q44Ga8TgJbfSatCIkD/
         4YoE5tjE3HuTxyhRcNrgKEIGCujPrrwfj+EODdqiJMBFpGyieePrfWF9HovTLwtBmQv4
         0EQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794208445; x=1794813245;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p8ohiQBg8UgGzEqawbRCebSefr/a88QyxtuULNgZzJk=;
        b=svRZFVDxRdo74rp5ED7c8EKotRrj2K1vjO8VuG2ja9Pftjg+1BnbXSTdmTuBz4pPLC
         s1/AJcJx2zCkOJ5RtpZR7ra7Uyc+uNaN+Mj57/RPVbo5BwPkdswt9LpfCTlyMVkrT46E
         y6MOIJX5PqFjQXFHAOeBacVX9oQF087ZCaOGYKSES2WQJT2O3dtnBCQ/upyIYIauWwi2
         5meqyYlR82MXdJQMHFKDB+qi84hb+IHf6sy6GBTkQyc2Xz+z7LvXotjruH7uVMIz26DF
         SRdqpqi67ClW23QxWquSQ5VaZk/WQPuQB0Be6dd9QAXEWvI6akXynjjaQzJQkvqZqo1z
         YH/A==
X-Forwarded-Encrypted: i=1; AL+hErEmQ5QWXxWi7lFC3XRcJYtLVqzqDBVV2EFsmLMcXX1pb2usbBn19eBFVofD7Ic2EK17ZplEN2Vlgiv0ru4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UFDoUihYvY5Il2dd+qKuu5UjOIkAM3QhAbwqa+zktt7QIKDe6
	o4yrUbbr5wGNndsSEwgRCYq9RsX+MLD1Hxiv8nYxIlKZIDTMzIHSRZmvjQx1ls+SERT8B9t3kkF
	Tjh+xsWBIg2IISG3RuSNGj9ErVXk1lIo=
X-Gm-Gg: AYBFou03jU3M2nxvuWNjWdINDo8V+kZa5lDdZQaPejH3fVQOV0y46RR6pkSsJmIaVdu
	R32ooiEVmBb4E5HI2OZl+mF6/HLXzOKo6qS70gd+s6H3AcbGnvtdWUB8uugyaKbod9CNhRK5Bjf
	PX0/w6naclExpbclYmGLeVU5lRe2X+CqEothlYlx7pcwDGwGqXrUp/EO6ChfUtu4STVf/l6af5Y
	PNkMve0ciNNi0s9HVymNwv+xsRBPs3nzF7LFPR8s0GpKjVMJhVTwBcxhrnPtQdk8K4LIWR/bzZO
	0cFZfOkWqHNCIYxKDcl13Fa2FCiuCzsB6jsVkinJq3VzCGBQE5MgaCFmbxR8ngPAlTEfLl7Bny9
	aIBuxUvrb136r/FIx4M/zOEhdyUjXZYATom5D6dbpedO+WwsB0yPCXwZ6Y/UGBwnDhGYkkRoOSd
	E8lfgYidyBwY/tu+oEu0DBsMFzDy8vOx2hSSkKflnE5Am4qFhXJTsQhKmmYpEhxtQNM+hceRLqz
	qJ9vYsp54nSv6Qb4xSmMYToquXQDVHDYBI3Aetnvix5q1Nf+LIddNsfZIGChA==
X-Received: by 2002:a05:690c:e3ee:b0:8b0:6866:c5b6 with SMTP id
 00721157ae682-8b36c906f40mr15532137b3.9.1794208444824; Sun, 08 Nov 2026
 23:14:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108213656.13031-1-antoniovazquezblanco@gmail.com> <20261108213656.13031-2-antoniovazquezblanco@gmail.com>
In-Reply-To: <20261108213656.13031-2-antoniovazquezblanco@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 9 Nov 2026 09:13:28 +0200
X-Gm-Features: AclHuK8MaFKzfCmypbKM_T55grhYANqfvZn7avQ_UIhgQgnEJ2s3PDOHcaKYoRo
Message-ID: <CAHp75VcOOwr37SyOgyYnRu2Gc_FoyAzmmt+qk5cnN=9LF2Xvqw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] Input: soc_button_array - support AMD variant
 Surface devices
To: =?UTF-8?Q?Antonio_V=C3=A1zquez_Blanco?= <antoniovazquezblanco@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>, Maximilian Luz <luzmaximilian@gmail.com>, 
	Chen Yu <yu.c.chen@intel.com>, Sachi King <nakato@nakato.io>, linux-input@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 11:37=E2=80=AFPM Antonio V=C3=A1zquez Blanco
<antoniovazquezblanco@gmail.com> wrote:
>
> From: Sachi King <nakato@nakato.io>
>
> The power button on the AMD variants of the Surface Laptop 3 and 4 uses
> the same MSHW0040 device ID as the 5th and later generations of Surface
> devices, so soc_button_array matches it. The device check then rejects
> it, and surfacepro3_button binds instead, which is the wrong driver.
>
> soc_device_check_MSHW0040() evaluates function 2 of the MSHW0040 _DSM,
> the OEM Platform Revision, and treats a returned 0 as proof that the
> _DSM is not there. That is wrong: 0 is a valid revision. The AMD
> variants implement the function and return 0, so the check rejects
> exactly the devices it is meant to accept.
>
> What separates the two groups is whether the device implements that
> function at all, which function 0 of the same _DSM advertises. Of the 32
> Surface models carrying MSHW0040 in the ACPI dumps at [1]:
>
>   fn 0 mask   fn 2 advertised   models
>   no _DSM     no                Surface Pro 4
>   0x03        no                Surface Book 1
>   0x05        yes               Surface Laptop 1, 2
>   0x0d        yes               Surface Book 2, Laptop SE, Studio 2
>   0x0f        yes               the remaining 25
>
> Only two models do not advertise it, and they are exactly the two that
> need surfacepro3_button: the Surface Pro 4, whose MSHW0040 device
> carries no _DSM at all, and the Surface Book 1, whose _DSM advertises
> functions 0 and 1 only, function 1 there being dGPU base attach
> handling.
>
> Use acpi_check_dsm() to make the decision, and keep evaluating the
> revision afterwards so that it remains available through dev_dbg().

> [1] https://github.com/linux-surface/acpidumps

Make it a Link tag in a form of
Link: $URL [1]


> Fixes: c394159310d0 ("Input: soc_button_array - add support for newer sur=
face devices")
> Link: https://lore.kernel.org/all/20211109081125.41410-1-nakato@nakato.io=
/

This tag is not referred in the text, make sure you have somewhere the
reference to [2] and mark it so here
Link: $URL [2]
(or drop completely)

> Co-developed-by: Maximilian Luz <luzmaximilian@gmail.com>
> Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
> Signed-off-by: Sachi King <nakato@nakato.io>

--=20
With Best Regards,
Andy Shevchenko
